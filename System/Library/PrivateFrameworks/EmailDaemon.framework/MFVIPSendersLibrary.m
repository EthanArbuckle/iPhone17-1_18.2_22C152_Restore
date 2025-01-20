@interface MFVIPSendersLibrary
+ (id)defaultInstance;
+ (id)defaultMessageLibrary;
+ (id)log;
- (BOOL)_clearVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4;
- (BOOL)_setVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4;
- (EMUserProfileProvider)userProfileProvider;
- (MFVIPSendersLibrary)initWithLibrary:(id)a3;
- (VIPManager)vipManager;
- (id)_messagesForSenders:(id)a3 success:(BOOL *)a4;
- (id)_newVIPFromVIP:(id)a3 byAddingEmailAddresses:(id)a4;
- (id)_pendingVIPChangesPath;
- (void)_checkForAddressBookChangesNeedingRevert:(BOOL)a3;
- (void)_handleAddressBookNotification;
- (void)_libraryDidFinishReconciliation:(id)a3;
- (void)_performTasksAfterProtectedDataBecomesAvailable;
- (void)_removePendingVIPChanges;
- (void)_savePendingVIPChanges_nts;
- (void)_vipsDidChange:(id)a3;
- (void)checkForAddressBookChanges;
- (void)dealloc;
- (void)persistenceWillAddMessage:(id)a3 fromExistingMessage:(BOOL)a4;
@end

@implementation MFVIPSendersLibrary

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEB0C;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BDB8 != -1) {
    dispatch_once(&qword_10016BDB8, block);
  }
  v2 = (void *)qword_10016BDB0;

  return v2;
}

+ (id)defaultInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AEC30;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BDC8 != -1) {
    dispatch_once(&qword_10016BDC8, block);
  }
  v2 = (void *)qword_10016BDC0;

  return v2;
}

+ (id)defaultMessageLibrary
{
  return +[MFMailMessageLibrary defaultInstance];
}

- (MFVIPSendersLibrary)initWithLibrary:(id)a3
{
  id v6 = a3;
  if ((+[MFMailMessageLibrary canUsePersistence] & 1) == 0)
  {
    v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, self, @"MFVIPSendersLibrary.m", 70, @"App is in daemon mode, but accessing database" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)MFVIPSendersLibrary;
  v7 = [(MFVIPSendersLibrary *)&v34 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mobilemail.vipaddressbook", 0);
    addressBookQueue = v7->_addressBookQueue;
    v7->_addressBookQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobilemail.vipsenders.pendingaddresses", 0);
    pendingAddressQueue = v7->_pendingAddressQueue;
    v7->_pendingAddressQueue = (OS_dispatch_queue *)v10;

    v12 = (EAEmailAddressSet *)objc_alloc_init((Class)EAEmailAddressSet);
    pendingAdds = v7->_pendingAdds;
    v7->_pendingAdds = v12;

    v14 = (EAEmailAddressSet *)objc_alloc_init((Class)EAEmailAddressSet);
    pendingRemoves = v7->_pendingRemoves;
    v7->_pendingRemoves = v14;

    uint64_t v16 = +[VIPManager defaultInstance];
    vipManager = v7->_vipManager;
    v7->_vipManager = (VIPManager *)v16;

    id v18 = objc_alloc((Class)NSDictionary);
    v19 = [(MFVIPSendersLibrary *)v7 _pendingVIPChangesPath];
    id v20 = [v18 initWithContentsOfFile:v19];

    v21 = v7->_pendingAdds;
    v22 = [v20 objectForKey:@"to-add"];
    [(EAEmailAddressSet *)v21 addObjectsFromArray:v22];

    v23 = v7->_pendingRemoves;
    v24 = [v20 objectForKey:@"to-remove"];
    [(EAEmailAddressSet *)v23 addObjectsFromArray:v24];

    v25 = +[NSUserDefaults standardUserDefaults];
    if (([v25 BOOLForKey:@"set-initial-vip-flags"] & 1) == 0)
    {
      v26 = v7->_pendingAdds;
      v27 = [(VIPManager *)v7->_vipManager allVIPEmailAddresses];
      [(EAEmailAddressSet *)v26 unionSet:v27];

      [v25 setBool:1 forKey:@"set-initial-vip-flags"];
    }
    objc_storeStrong((id *)&v7->_library, a3);
    if (![(MFMailMessageLibrary *)v7->_library protectedDataAvailability]) {
      [(MFVIPSendersLibrary *)v7 _performTasksAfterProtectedDataBecomesAvailable];
    }
    if ([(EAEmailAddressSet *)v7->_pendingAdds count]
      || [(EAEmailAddressSet *)v7->_pendingRemoves count])
    {
      [(MFVIPSendersLibrary *)v7 _libraryDidFinishReconciliation:0];
    }
    v28 = [v6 persistence];
    v29 = [v28 hookRegistry];
    [v29 registerMessageChangeHookResponder:v7];

    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v7 selector:"_libraryDidFinishReconciliation:" name:MailMessageLibraryDidFinishReconciliation object:v7->_library];
    [v30 addObserver:v7 selector:"_vipsDidChange:" name:EMVIPsDidChangeNotification object:v7->_vipManager];
    v31 = v7;
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  addressBook = self->_addressBook;
  if (addressBook)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = addressBook;
    addressBookQueue = self->_addressBookQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AF1BC;
    block[3] = &unk_10013B050;
    block[4] = v8;
    void block[5] = self;
    dispatch_sync(addressBookQueue, block);
    _Block_object_dispose(v8, 8);
  }
  v6.receiver = self;
  v6.super_class = (Class)MFVIPSendersLibrary;
  [(MFVIPSendersLibrary *)&v6 dealloc];
}

- (void)_handleAddressBookNotification
{
  if (pthread_main_np() != 1)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MFVIPSendersLibrary.m" lineNumber:144 description:@"Current thread must be main"];
  }
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#MailServices got address book change notification", buf, 2u);
  }

  atomic_fetch_add_explicit(&self->_addressBookResetCount, 1u, memory_order_relaxed);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  addressBookQueue = self->_addressBookQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF41C;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_after(v5, addressBookQueue, block);
}

- (void)checkForAddressBookChanges
{
  if (pthread_main_np() != 1)
  {
    objc_super v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFVIPSendersLibrary.m" lineNumber:158 description:@"Current thread must be main"];
  }
  if (!self->_addressBook)
  {
    CFErrorRef error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (v4)
    {
      ABAddressBookRegisterChangeCallback();
      ABAddressBookRegisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)sub_1000AF2D4, self);
    }
    if (error) {
      CFRelease(error);
    }
  }
  addressBookQueue = self->_addressBookQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AF57C;
  v7[3] = &unk_100139C48;
  v7[4] = self;
  dispatch_async(addressBookQueue, v7);
}

- (void)_checkForAddressBookChangesNeedingRevert:(BOOL)a3
{
  v3 = self;
  if (a3)
  {
    addressBook = self->_addressBook;
    if (addressBook) {
      ABAddressBookRevert(addressBook);
    }
  }
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  id v32 = objc_alloc_init((Class)NSMutableSet);
  id v31 = objc_alloc_init((Class)NSMutableSet);
  v36 = [(MFVIPSendersLibrary *)v3 vipManager];
  [v36 allVIPs];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v38 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v46;
    *(void *)&long long v6 = 138412546;
    long long v30 = v6;
    v35 = v3;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(obj);
        }
        if (v3->_addressBook)
        {
          v7 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v8 = objc_msgSend(v36, "existingPersonForVIP:usingAddressBook:", v7);
          if (v8)
          {
            v39 = CFDictionaryGetValue(Mutable, v8);
            if (v39)
            {
              v9 = MFLogGeneral();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v30;
                v51 = v7;
                __int16 v52 = 2112;
                v53 = v39;
                _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#MailServices merging VIPs that mapped to the same AB record (%@ -> %@)", buf, 0x16u);
              }

              dispatch_queue_t v10 = [v7 emailAddresses];
              v11 = [v39 emailAddresses];
              unsigned __int8 v12 = [v10 isSubsetOfSet:v11];

              if ((v12 & 1) == 0)
              {
                v13 = [v7 emailAddresses];
                id v14 = [(MFVIPSendersLibrary *)v35 _newVIPFromVIP:v39 byAddingEmailAddresses:v13];

                [v31 addObject:v14];
              }
              objc_msgSend(v7, "identifier", v30);
              CFArrayRef v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
              [v32 addObject:v15];
            }
            else
            {
              CFArrayRef v33 = ABPersonCopyArrayOfAllLinkedPeople(v8);
              id v16 = objc_alloc_init((Class)EAEmailAddressSet);
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              CFArrayRef v15 = v33;
              id v17 = [(__CFArray *)v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v42;
                do
                {
                  for (j = 0; j != v17; j = (char *)j + 1)
                  {
                    if (*(void *)v42 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    id v20 = *(const void **)(*((void *)&v41 + 1) + 8 * (void)j);
                    CFDictionarySetValue(Mutable, v20, v7);
                    CFTypeRef v21 = ABRecordCopyValue(v20, kABPersonEmailProperty);
                    v22 = v21;
                    if (v21)
                    {
                      CFArrayRef v23 = ABMultiValueCopyArrayOfAllValues(v21);
                      CFRelease(v22);
                      [v16 addObjectsFromArray:v23];
                    }
                  }
                  id v17 = [(__CFArray *)v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
                }
                while (v17);
              }

              v24 = [v7 emailAddresses];
              unsigned __int8 v25 = [v16 isSubsetOfSet:v24];

              if ((v25 & 1) == 0)
              {
                id v26 = [(MFVIPSendersLibrary *)v35 _newVIPFromVIP:v7 byAddingEmailAddresses:v16];
                [v31 addObject:v26];
              }
            }

            v3 = v35;
          }
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v38);
  }

  if ([v31 count]) {
    [v36 saveVIPs:v31];
  }
  if (objc_msgSend(v32, "count", v30))
  {
    v27 = MFLogGeneral();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = [v32 allObjects];
      v29 = [v28 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412290;
      v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "#MailServices removing VIPs from cloud with identifiers {%@}", buf, 0xCu);
    }
    [v36 removeVIPsWithIdentifiers:v32];
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (id)_newVIPFromVIP:(id)a3 byAddingEmailAddresses:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 emailAddresses];
  id v8 = [v7 mutableCopy];

  [v8 unionSet:v6];
  id v9 = objc_alloc((Class)EMVIP);
  dispatch_queue_t v10 = [v5 identifier];
  v11 = [v5 name];
  id v12 = [v9 initWithIdentifier:v10 name:v11 emailAddresses:v8];

  return v12;
}

- (void)persistenceWillAddMessage:(id)a3 fromExistingMessage:(BOOL)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = +[NSAssertionHandler currentHandler];
    [v35 handleFailureInMethod:a2, self, @"MFVIPSendersLibrary.m", 248, @"Invalid parameter not satisfying: %@", @"[message isKindOfClass:MFMailMessage.class]" object file lineNumber description];

    if (a4) {
      goto LABEL_35;
    }
    goto LABEL_3;
  }
  if (!a4)
  {
LABEL_3:
    id v8 = [v7 firstSender];
    id v9 = [v8 emailAddressValue];
    dispatch_queue_t v10 = [v9 simpleAddress];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v8 stringValue];
    }
    v13 = v12;

    uint64_t v37 = v13;
    id v14 = [(MFVIPSendersLibrary *)self vipManager];
    CFArrayRef v15 = [v14 allVIPEmailAddresses];

    id v38 = v15;
    if ([v15 containsObject:v13])
    {
      unsigned int v16 = 1;
    }
    else
    {
      id v17 = objc_msgSend(v13, "mf_copyIDNAEncodedEmailAddress");
      if ([v15 containsObject:v17])
      {
        unsigned int v16 = 1;
      }
      else
      {
        id v18 = objc_msgSend(v13, "mf_copyIDNADecodedEmailAddress");
        unsigned int v16 = [v15 containsObject:v18];
      }
    }
    uint64_t v19 = (uint64_t)[v7 messageFlags];
    if (v16) {
      uint64_t v20 = v19 | 0x1000000;
    }
    else {
      uint64_t v20 = v19;
    }
    CFTypeRef v21 = [v7 account];
    id v22 = [v21 copyReceivingEmailAddresses];

    CFArrayRef v23 = [v7 to];
    uint64_t v36 = v20;
    v24 = [v7 cc];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v25 = v22;
    id v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v26)
    {

      id v32 = v37;
      CFArrayRef v33 = v38;
      uint64_t v34 = v20;
      goto LABEL_34;
    }
    BOOL v27 = 0;
    BOOL v28 = 0;
    uint64_t v29 = *(void *)v40;
LABEL_17:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v40 != v29) {
        objc_enumerationMutation(v25);
      }
      uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * v30);
      if (!v27 && v23 != 0) {
        BOOL v27 = objc_msgSend(v23, "mf_indexOfRecipientWithEmailAddress:", *(void *)(*((void *)&v39 + 1) + 8 * v30)) != (id)0x7FFFFFFFFFFFFFFFLL;
      }
      if (!v28 && v24 != 0) {
        BOOL v28 = objc_msgSend(v24, "mf_indexOfRecipientWithEmailAddress:", v31) != (id)0x7FFFFFFFFFFFFFFFLL;
      }
      if (v27 && v28) {
        break;
      }
      if (v26 == (id)++v30)
      {
        id v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v26) {
          goto LABEL_17;
        }

        id v32 = v37;
        CFArrayRef v33 = v38;
        uint64_t v34 = v36;
        if (v27) {
          uint64_t v34 = v36 | 0x8000000000;
        }
        if (!v28)
        {
LABEL_34:
          [v7 setMessageFlags:v34];

          goto LABEL_35;
        }
LABEL_32:
        v34 |= 0x10000000000uLL;
        goto LABEL_34;
      }
    }

    id v32 = v37;
    CFArrayRef v33 = v38;
    uint64_t v34 = v36 | 0x8000000000;
    goto LABEL_32;
  }
LABEL_35:
}

- (id)_pendingVIPChangesPath
{
  v2 = MFMailDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"PendingVIPChanges"];

  return v3;
}

- (void)_savePendingVIPChanges_nts
{
  v7[0] = @"to-add";
  v3 = [(EAEmailAddressSet *)self->_pendingAdds allObjects];
  v7[1] = @"to-remove";
  v8[0] = v3;
  v4 = [(EAEmailAddressSet *)self->_pendingRemoves allObjects];
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  id v6 = [(MFVIPSendersLibrary *)self _pendingVIPChangesPath];
  [v5 writeToFile:v6 atomically:1];
}

- (void)_removePendingVIPChanges
{
  id v4 = +[NSFileManager defaultManager];
  v3 = [(MFVIPSendersLibrary *)self _pendingVIPChangesPath];
  [v4 removeItemAtPath:v3 error:0];
}

- (EMUserProfileProvider)userProfileProvider
{
  return (EMUserProfileProvider *)+[MFUserProfileProvider_iOS defaultProvider];
}

- (void)_performTasksAfterProtectedDataBecomesAvailable
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"ToCcMigrationCompleted"];

  if ((v4 & 1) == 0)
  {
    id v5 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B044C;
    block[3] = &unk_100139C48;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)_libraryDidFinishReconciliation:(id)a3
{
  [(MFVIPSendersLibrary *)self _performTasksAfterProtectedDataBecomesAvailable];
  pendingAddressQueue = self->_pendingAddressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0B4C;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(pendingAddressQueue, block);
}

- (BOOL)_clearVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v17 = 0;
  id v8 = [(MFVIPSendersLibrary *)self _messagesForSenders:v6 success:&v17];
  id v9 = v8;
  if (v17)
  {
    if ([v8 count])
    {
      dispatch_queue_t v10 = [(MFMailMessageLibrary *)self->_library persistence];
      v11 = [v10 messageChangeManager];
      [v11 applyVIPStatus:0 forMessages:v9];
    }
  }
  else if (v4)
  {
    pendingAddressQueue = self->_pendingAddressQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0D58;
    block[3] = &unk_100139C20;
    block[4] = self;
    id v16 = v6;
    dispatch_async(pendingAddressQueue, block);
  }
  BOOL v13 = v17;

  return v13;
}

- (BOOL)_setVIPSenderFlagForSenders:(id)a3 retryFailedSenders:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v17 = 0;
  id v8 = [(MFVIPSendersLibrary *)self _messagesForSenders:v6 success:&v17];
  id v9 = v8;
  if (v17)
  {
    if ([v8 count])
    {
      dispatch_queue_t v10 = [(MFMailMessageLibrary *)self->_library persistence];
      v11 = [v10 messageChangeManager];
      [v11 applyVIPStatus:1 forMessages:v9];
    }
  }
  else if (v4)
  {
    pendingAddressQueue = self->_pendingAddressQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0F10;
    block[3] = &unk_100139C20;
    block[4] = self;
    id v16 = v6;
    dispatch_async(pendingAddressQueue, block);
  }
  BOOL v13 = v17;

  return v13;
}

- (void)_vipsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:EMVIPsUpdatedKey];
  if ([v6 count])
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B1120;
    block[3] = &unk_100139C20;
    id v14 = v6;
    CFArrayRef v15 = self;
    dispatch_async(v7, block);
  }
  id v8 = [v5 objectForKeyedSubscript:EMVIPsRemovedKey];
  if ([v8 count])
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B128C;
    v10[3] = &unk_100139C20;
    id v11 = v8;
    id v12 = self;
    dispatch_async(v9, v10);
  }
}

- (id)_messagesForSenders:(id)a3 success:(BOOL *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [v6 allObjects];
    id v8 = +[EMMessageListItemPredicates predicateForMessagesWithSenders:v7];

    id v9 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v8 sortDescriptors:&__NSArray0__struct];
    dispatch_queue_t v10 = [(MFMailMessageLibrary *)self->_library persistence];
    id v11 = [v10 messagePersistence];
    id v12 = [v11 persistedMessagesMatchingQuery:v9 limit:0x7FFFFFFFFFFFFFFFLL requireProtectedData:1];

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v12 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  BOOL v13 = ![v6 count] || objc_msgSend(v12, "count") || EFContentProtectionGetObservedState() == 0;
  *a4 = v13;
LABEL_10:

  return v12;
}

- (VIPManager)vipManager
{
  return self->_vipManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_pendingRemoves, 0);
  objc_storeStrong((id *)&self->_pendingAdds, 0);
  objc_storeStrong((id *)&self->_pendingAddressQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_addressBookQueue, 0);
}

@end