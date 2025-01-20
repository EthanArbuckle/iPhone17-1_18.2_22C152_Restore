@interface VIPManager
+ (VIPManager)defaultInstance;
+ (os_unfair_lock_s)defaultInstanceLock;
+ (void)setBackingManager:(id)a3;
- (BOOL)hasVIPs;
- (BOOL)isVIPAddress:(id)a3;
- (EAEmailAddressSet)allVIPEmailAddresses;
- (EMVIPManager)backingManager;
- (NSSet)allVIPs;
- (VIPManager)initWithBackingManager:(id)a3;
- (id)allVIPEmailAddressesCriterion;
- (id)criterionForEmailAddresses:(id)a3;
- (id)sortedVIPs;
- (id)vipCriteria;
- (id)vipForEmailAddresses:(id)a3 andDisplayNames:(id)a4;
- (id)vipWithIdentifier:(id)a3;
- (void)_vipsDidChange:(id)a3;
- (void)deleteVIPWithIdentifier:(id)a3;
- (void)existingPersonForVIP:(id)a3 usingAddressBook:(void *)a4;
- (void)getAllVIPsWithCompletion:(id)a3;
- (void)removeVIPsWithEmailAddresses:(id)a3;
- (void)removeVIPsWithIdentifiers:(id)a3;
- (void)saveVIP:(id)a3;
- (void)saveVIPs:(id)a3;
@end

@implementation VIPManager

+ (os_unfair_lock_s)defaultInstanceLock
{
  return (os_unfair_lock_s *)&unk_10016BE38;
}

+ (void)setBackingManager:(id)a3
{
  id v7 = a3;
  v4 = (os_unfair_lock_s *)[a1 defaultInstanceLock];
  os_unfair_lock_lock(v4);
  v5 = [[VIPManager alloc] initWithBackingManager:v7];
  v6 = (void *)qword_10016BE30;
  qword_10016BE30 = (uint64_t)v5;

  os_unfair_lock_unlock(v4);
}

+ (VIPManager)defaultInstance
{
  v4 = (os_unfair_lock_s *)[a1 defaultInstanceLock];
  os_unfair_lock_lock(v4);
  id v5 = (id)qword_10016BE30;
  os_unfair_lock_unlock(v4);
  if (!v5)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"VIPManager.m" lineNumber:55 description:@"+setBackingManager: must be called before attempting to get the default instance"];
  }

  return (VIPManager *)v5;
}

- (VIPManager)initWithBackingManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VIPManager;
  v6 = [(VIPManager *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingManager, a3);
    v8 = (NSLock *)objc_alloc_init((Class)NSLock);
    abPersonByVIPIdentifierLock = v7->_abPersonByVIPIdentifierLock;
    v7->_abPersonByVIPIdentifierLock = v8;

    v7->_abPersonByVIPIdentifier = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"_vipsDidChange:" name:EMVIPsDidChangeNotification object:v7->_backingManager];
  }
  return v7;
}

- (BOOL)hasVIPs
{
  v2 = [(VIPManager *)self backingManager];
  unsigned __int8 v3 = [v2 hasVIPs];

  return v3;
}

- (NSSet)allVIPs
{
  v2 = [(VIPManager *)self backingManager];
  unsigned __int8 v3 = [v2 allVIPs];

  return (NSSet *)v3;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  v2 = [(VIPManager *)self backingManager];
  unsigned __int8 v3 = [v2 allVIPEmailAddresses];

  return (EAEmailAddressSet *)v3;
}

- (id)vipWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VIPManager *)self backingManager];
  v6 = [v5 vipWithIdentifier:v4];

  return v6;
}

- (BOOL)isVIPAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(VIPManager *)self backingManager];
  unsigned __int8 v6 = [v5 isVIPAddress:v4];

  return v6;
}

- (void)saveVIPs:(id)a3
{
  id v5 = a3;
  id v4 = [(VIPManager *)self backingManager];
  [v4 saveVIPs:v5];
}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  id v5 = a3;
  id v4 = [(VIPManager *)self backingManager];
  [v4 removeVIPsWithIdentifiers:v5];
}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  id v5 = a3;
  id v4 = [(VIPManager *)self backingManager];
  [v4 removeVIPsWithEmailAddresses:v5];
}

- (void)getAllVIPsWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(VIPManager *)self backingManager];
  [v4 getAllVIPsWithCompletion:v5];
}

- (void)_vipsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:EMVIPsRemovedKey];
  if ([v6 count])
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BEED4;
    block[3] = &unk_100139C20;
    block[4] = self;
    id v14 = v6;
    dispatch_async(v7, block);
  }
  v11 = self;
  id v8 = v4;
  id v12 = v8;
  v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:&v10];
}

- (void)saveVIP:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#MailServices saveVIP: %@", buf, 0xCu);
  }

  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  [(VIPManager *)self saveVIPs:v6];
}

- (void)deleteVIPWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#MailServices deleteVIPWithIdentifier: %@", buf, 0xCu);
  }

  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  [(VIPManager *)self removeVIPsWithIdentifiers:v6];
}

- (id)sortedVIPs
{
  v2 = [(VIPManager *)self allVIPs];
  unsigned __int8 v3 = [v2 allObjects];
  id v4 = [v3 mutableCopy];

  [v4 sortUsingComparator:&stru_10013E408];

  return v4;
}

- (id)vipForEmailAddresses:(id)a3 andDisplayNames:(id)a4
{
  id v25 = a3;
  id v22 = a4;
  [(VIPManager *)self allVIPs];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v6)
  {
    id v27 = 0;
    goto LABEL_25;
  }
  id v7 = 0;
  id v27 = 0;
  uint64_t v24 = *(void *)v33;
  do
  {
    id v26 = v6;
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v33 != v24) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v10 = [v25 mutableCopy];
      v11 = [v9 emailAddresses];
      [v10 intersectSet:v11];

      id v12 = [v10 count];
      id v13 = v12;
      if (v7 < v12)
      {
        id v14 = v27;
        id v27 = v9;
LABEL_20:

        id v7 = v13;
        goto LABEL_21;
      }
      if (v7 == v12 && v12)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v22;
        id v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v14);
              }
              v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
              v19 = [v9 name];
              LODWORD(v18) = [v18 isEqualToString:v19];

              if (v18)
              {
                id v20 = v9;

                id v13 = v7;
                id v27 = v20;
                goto LABEL_20;
              }
            }
            id v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        id v13 = v7;
        goto LABEL_20;
      }
LABEL_21:
    }
    id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v6);
LABEL_25:

  return v27;
}

- (void)existingPersonForVIP:(id)a3 usingAddressBook:(void *)a4
{
  id v6 = a3;
  [(NSLock *)self->_abPersonByVIPIdentifierLock lock];
  id v7 = [v6 identifier];
  Value = (void *)CFDictionaryGetValue(self->_abPersonByVIPIdentifier, v7);
  v9 = Value;
  if (a4 && !Value)
  {
    id v10 = [v6 emailAddresses];
    v11 = [v6 name];
    id v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName();

    if (v12)
    {
      abPersonByVIPIdentifier = self->_abPersonByVIPIdentifier;
      id v14 = [v6 identifier];
      CFDictionarySetValue(abPersonByVIPIdentifier, v14, v12);

      v9 = (void *)v12;
    }
    else
    {
      v9 = 0;
    }
  }

  [(NSLock *)self->_abPersonByVIPIdentifierLock unlock];
  return v9;
}

- (id)criterionForEmailAddresses:(id)a3
{
  id v19 = a3;
  id v3 = [v19 count];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v19;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v20 + 1) + 8 * i);
          id v10 = [v9 emailAddressValue];
          v11 = [v10 simpleAddress];
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v13 = [v9 stringValue];
          }
          id v14 = v13;

          id v15 = objc_msgSend(v14, "mf_copyIDNADecodedEmailAddress");
          id v16 = [objc_alloc((Class)MFMessageCriterion) initWithType:35 qualifier:8 expression:v15];
          [v4 addObject:v16];
        }
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    v17 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v4];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)vipCriteria
{
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(VIPManager *)self sortedVIPs];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "name", v15);

        if (v10)
        {
          v11 = [v9 emailAddresses];
          id v12 = [(VIPManager *)self criterionForEmailAddresses:v11];

          id v13 = [v9 name];
          [v12 setName:v13];

          [v3 addObject:v12];
        }
        else
        {
          id v12 = MFLogGeneral();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            long long v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#MailServices vip Sender name is nil: %@", buf, 0xCu);
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)allVIPEmailAddressesCriterion
{
  id v3 = [(VIPManager *)self allVIPEmailAddresses];
  id v4 = [(VIPManager *)self criterionForEmailAddresses:v3];

  return v4;
}

- (EMVIPManager)backingManager
{
  return self->_backingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_abPersonByVIPIdentifierLock, 0);
}

@end