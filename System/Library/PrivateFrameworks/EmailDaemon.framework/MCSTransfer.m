@interface MCSTransfer
- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5;
- (BOOL)willFlag;
- (BOOL)willMarkRead;
- (BOOL)willMarkUnread;
- (BOOL)willUnflag;
- (MCSTransfer)init;
- (MCSTransfer)initWithDestination:(id)a3 markAsRead:(BOOL)a4;
- (MCSTransfer)initWithSpecialDestination:(int64_t)a3 markAsRead:(BOOL)a4 deleteIfSame:(BOOL)a5;
- (NSDictionary)originalLocations;
- (id)_storeToMessagesMappingWithMessages:(id)a3;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)description;
- (id)destination;
- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3;
- (id)localizedErrorTitleForMessageCount:(unint64_t)a3;
- (id)localizedShortOperationDescription;
- (void)_notifyStoresOfTransferedMessages:(id)a3 failedMessages:(id)a4;
- (void)setIsDeletion:(BOOL)a3;
- (void)setOriginalLocations:(id)a3;
@end

@implementation MCSTransfer

- (MCSTransfer)init
{
}

- (MCSTransfer)initWithDestination:(id)a3 markAsRead:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCSTransfer;
  v8 = [(MCSTransfer *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destination, a3);
    v10 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    originalLocations = v9->_originalLocations;
    v9->_originalLocations = v10;

    *((unsigned char *)v9 + 40) = *((unsigned char *)v9 + 40) & 0xFE | v4;
    if (v4)
    {
      id v12 = objc_alloc((Class)NSMutableSet);
      id v13 = objc_msgSend(v12, "initWithObjects:", MessageIsRead, 0);
      v14 = [[MCSFlagChange alloc] initWithFlagsToSet:v13 flagsToClear:0 reason:4];
      equivalentFlagChange = v9->_equivalentFlagChange;
      v9->_equivalentFlagChange = v14;
    }
    *((unsigned char *)&v9->super.super + 8) |= 1u;
  }

  return v9;
}

- (MCSTransfer)initWithSpecialDestination:(int64_t)a3 markAsRead:(BOOL)a4 deleteIfSame:(BOOL)a5
{
  BOOL v5 = a5;
  result = [(MCSTransfer *)self initWithDestination:0 markAsRead:a4];
  if (result)
  {
    result->_specialType = a3;
    if (v5) {
      char v8 = 2;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)result + 40) = *((unsigned char *)result + 40) & 0xFD | v8;
  }
  return result;
}

- (id)destination
{
  return self->_destination;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4 = a3;
  if (![(MCSOperation *)self isFinalized]) {
    __assert_rtn("-[MCSTransfer applyPendingChangeToObjects:]", "MCSTransfer.m", 78, "[self isFinalized]");
  }
  BOOL v5 = [(MCSFlagChange *)self->_equivalentFlagChange applyPendingChangeToObjects:v4];

  return v5;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v44 = a3;
  id v45 = a4;
  id v49 = a5;
  id v7 = +[MFActivityMonitor currentMonitor];
  [v7 addReason:MonitoredActivityReasonMoving];

  char v8 = +[MFMailMessageLibrary defaultInstance];
  v48 = [v8 messageChangeManager];

  v9 = [(MCSTransfer *)self _storeToMessagesMappingWithMessages:v44];
  [(MCSTransfer *)self setOriginalLocations:v9];

  id v42 = objc_alloc_init((Class)NSMutableArray);
  if (self->_destination)
  {
    v10 = [v44 allObjects];
    v11 = [(MFMailboxUid *)self->_destination URL];
    id v12 = [v48 moveMessages:v10 destinationMailboxURL:v11 userInitiated:1];

    [v49 addObjectsFromArray:v12];
  }
  else
  {
    id v50 = objc_alloc_init((Class)NSMutableDictionary);
    id v46 = objc_alloc_init((Class)NSMutableSet);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v13 = [(NSDictionary *)self->_originalLocations allKeys];
    id v14 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v14)
    {
      uint64_t v47 = *(void *)v57;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v57 != v47) {
            objc_enumerationMutation(v13);
          }
          v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          objc_super v17 = objc_msgSend(v16, "mailbox", v42);
          v18 = [v17 representedAccount];
          v19 = v18;
          if (v18)
          {
            v20 = [v18 mailboxUidOfType:self->_specialType createIfNeeded:0];
            if ([v20 isEqual:v17])
            {
              v21 = [(NSDictionary *)self->_originalLocations objectForKey:v16];
              [v46 unionSet:v21];
            }
            else
            {
              v21 = [v19 uniqueID];
              uint64_t v22 = [v50 objectForKey:v21];
              id v23 = (id)v22;
              if (!v22) {
                id v23 = objc_alloc_init((Class)NSMutableSet);
              }
              v24 = [(NSDictionary *)self->_originalLocations objectForKey:v16];
              [v23 unionSet:v24];

              if (!v22) {
                [v50 setObject:v23 forKey:v21];
              }
            }
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v14);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v25 = [v50 allKeys];
    id v26 = [v25 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v53;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
          v30 = +[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v29, v42);
          v31 = [v30 mailboxUidOfType:self->_specialType createIfNeeded:1];
          v32 = [v50 objectForKey:v29];
          v33 = [v32 allObjects];

          v34 = [v31 URL];
          v35 = [v48 moveMessages:v33 destinationMailboxURL:v34 userInitiated:1];

          [v49 addObjectsFromArray:v35];
        }
        id v26 = [v25 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v26);
    }

    if ((*((unsigned char *)self + 40) & 2) != 0 && [v46 count])
    {
      v36 = [v46 allObjects];
      [v48 deleteMessages:v36];
    }
  }
  if (*((unsigned char *)self + 40))
  {
    id v37 = [objc_alloc((Class)ECMessageFlagChange) initWithBuilder:&stru_10013AFB0];
    v38 = [v49 allObjects];
    id v39 = [v48 applyFlagChange:v37 toMessages:v38];
  }
  objc_msgSend(v45, "addObjectsFromArray:", v42, v42);
  [(MCSTransfer *)self _notifyStoresOfTransferedMessages:v49 failedMessages:v45];
  id v40 = [v44 count];
  LOBYTE(v40) = v40 > [v45 count];

  return (char)v40;
}

- (BOOL)willMarkRead
{
  return 1;
}

- (BOOL)willMarkUnread
{
  return 0;
}

- (BOOL)willUnflag
{
  return 1;
}

- (BOOL)willFlag
{
  return 0;
}

- (id)description
{
  if (*((unsigned char *)self + 40)) {
    CFStringRef v2 = @"mark read";
  }
  else {
    CFStringRef v2 = @"don't mark read";
  }
  return +[NSString stringWithFormat:@"%p Transfer to %@ (%@)", self, self->_destination, v2];
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  BOOL v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (a3 == 1) {
    [v5 localizedStringForKey:@"ERROR_TRANSFERRING_LONG_FORMAT" value:&stru_10013ED08 table:@"Main"];
  }
  else {
  id v7 = [v5 localizedStringForKey:@"ERROR_TRANSFERRING_LONG_FORMAT_MANY" value:&stru_10013ED08 table:@"Main"];
  }

  if (self->_destination)
  {
    char v8 = +[MailChangeManager sharedChangeManager];
    v9 = [v8 displayNameUsingSpecialNamesForMailbox:self->_destination];
  }
  else
  {
    v9 = +[MFMailboxUid specialNameForType:self->_specialType];
  }
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

  return v10;
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  id v4 = +[NSBundle mainBundle];
  BOOL v5 = v4;
  if (a3 == 1) {
    [v4 localizedStringForKey:@"ERROR_TRANSFERRING_TITLE" value:&stru_10013ED08 table:@"Main"];
  }
  else {
  v6 = [v4 localizedStringForKey:@"ERROR_TRANSFERRING_TITLE_MULTIPLE" value:&stru_10013ED08 table:@"Main"];
  }

  return v6;
}

- (id)localizedShortOperationDescription
{
  CFStringRef v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"OPERATION_TRANSFER_DESC" value:&stru_10013ED08 table:@"Main"];

  return v3;
}

- (void)setIsDeletion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 40) = *((unsigned char *)self + 40) & 0xFB | v3;
}

- (void)_notifyStoresOfTransferedMessages:(id)a3 failedMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  originalLocations = self->_originalLocations;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003F568;
  v11[3] = &unk_10013B000;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(NSDictionary *)originalLocations enumerateKeysAndObjectsUsingBlock:v11];
}

- (id)_storeToMessagesMappingWithMessages:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "messageStore", (void)v13);
        if (v10)
        {
          id v11 = [v4 objectForKeyedSubscript:v10];
          if (!v11)
          {
            id v11 = objc_alloc_init((Class)NSMutableSet);
            [v4 setObject:v11 forKeyedSubscript:v10];
          }
          [v11 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)originalLocations
{
  return self->_originalLocations;
}

- (void)setOriginalLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLocations, 0);
  objc_storeStrong((id *)&self->_equivalentFlagChange, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end