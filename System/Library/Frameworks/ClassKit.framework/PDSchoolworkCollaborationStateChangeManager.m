@interface PDSchoolworkCollaborationStateChangeManager
- (NSMutableArray)pendingAttachmentEvents;
- (NSMutableArray)pendingStatesChanges;
- (PDSchoolworkCollaborationStateChangeManager)init;
- (id)_buildEventForAttachment:(id)a3 recipientPersonID:(id)a4;
- (id)_buildStateChangeForAttachment:(id)a3 ownerPersonID:(id)a4;
- (id)_fetchExistingStateForAttachment:(id)a3 withOwnerPersonID:(id)a4;
- (void)_saveEventsForHandoutAttachmentID:(id)a3 recipientPersonID:(id)a4;
- (void)setClientBundleID:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setPendingAttachmentEvents:(id)a3;
- (void)setPendingStatesChanges:(id)a3;
@end

@implementation PDSchoolworkCollaborationStateChangeManager

- (PDSchoolworkCollaborationStateChangeManager)init
{
  uint64_t v3 = objc_opt_class();
  v4 = NSStringFromSelector(a2);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The method -[%@ %@] is not available.", v3, v4);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)_buildStateChangeForAttachment:(id)a3 ownerPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = 0;
  switch([v6 completionStatus])
  {
    case 0u:
    case 3u:
    case 4u:
      goto LABEL_18;
    case 1u:
      uint64_t v9 = 2;
      goto LABEL_5;
    case 2u:
      uint64_t v9 = 1;
      goto LABEL_5;
    default:
      uint64_t v9 = 0;
LABEL_5:
      if (self) {
        database = self->_database;
      }
      else {
        database = 0;
      }
      v11 = database;
      uint64_t v12 = objc_opt_class();
      v13 = [v6 parentObjectID];
      v14 = [(PDDatabase *)v11 select:v12 identity:v13];

      if (v14)
      {
        v15 = [(PDSchoolworkCollaborationStateChangeManager *)self _fetchExistingStateForAttachment:v6 withOwnerPersonID:v7];
        CLSInitLog();
        v16 = (void *)CLSLogHandout;
        if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
        {
          if (self) {
            clientBundleID = self->_clientBundleID;
          }
          else {
            clientBundleID = 0;
          }
          v23 = clientBundleID;
          v24 = v16;
          v25 = [v6 objectID];
          int v31 = 138413058;
          v32 = clientBundleID;
          __int16 v33 = 2112;
          v34 = v25;
          __int16 v35 = 2112;
          v36 = v15;
          __int16 v37 = 2048;
          uint64_t v38 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "SaveCollabState (Client %@): attachment: %@ current states: %@ desired state: %ld", (uint8_t *)&v31, 0x2Au);
        }
        if (+[PDSchoolworkCollaborationStateAdaptor attachmentWithStates:v15 canBeSetToActivityState:v9 ignoreIsLocked:0])
        {
          if (self) {
            v17 = self->_database;
          }
          else {
            v17 = 0;
          }
          v18 = sub_100003E58(v17);
          v19 = [v18 objectID];

          v8 = +[PDSchoolworkCollaborationStateAdaptor setActivityState:v9 forAttachment:v6 forHandout:v14 senderPersonID:v19 withStates:v15];
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        CLSInitLog();
        v20 = (void *)CLSLogHandout;
        if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
        {
          if (self) {
            v26 = self->_clientBundleID;
          }
          else {
            v26 = 0;
          }
          v27 = v26;
          v28 = v20;
          v29 = [v6 objectID];
          v30 = [v6 parentObjectID];
          int v31 = 138412802;
          v32 = v26;
          __int16 v33 = 2112;
          v34 = v29;
          __int16 v35 = 2112;
          v36 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "SaveCollabState (Client %@): attachment: %@ missing parent handout: %@", (uint8_t *)&v31, 0x20u);
        }
        v8 = 0;
      }

LABEL_18:
      return v8;
  }
}

- (id)_buildEventForAttachment:(id)a3 recipientPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  if (!+[PDEndpointRequestOperation isEndpointAvailable:@"uploadEvents" inDatabase:database])goto LABEL_9; {
  unsigned int v9 = [v6 completionStatus];
  }
  if (v9 == 1)
  {
    if (self) {
      v13 = self->_database;
    }
    else {
      v13 = 0;
    }
    v14 = v13;
    uint64_t v15 = objc_opt_class();
    v16 = [v6 parentObjectID];
    v17 = [(PDDatabase *)v14 select:v15 identity:v16];

    if (sub_10016B204(v17)) {
      uint64_t v18 = 104;
    }
    else {
      uint64_t v18 = 103;
    }
    if (self) {
      v19 = self->_database;
    }
    else {
      v19 = 0;
    }
    v11 = sub_10001E3A4(v19, v6, v18, v7);

    goto LABEL_10;
  }
  if (v9 == 2)
  {
    if (self) {
      v10 = self->_database;
    }
    else {
      v10 = 0;
    }
    v11 = sub_10001E3A4(v10, v6, 105, v7);
  }
  else
  {
LABEL_9:
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (id)_fetchExistingStateForAttachment:(id)a3 withOwnerPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  unsigned int v9 = database;
  v10 = [v6 objectID];
  v11 = sub_100159B08(v9, v10, v7);

  if (![v11 count])
  {
    v27 = v11;
    CLSInitLog();
    uint64_t v12 = (void *)CLSLogHandout;
    if (os_log_type_enabled(CLSLogHandout, OS_LOG_TYPE_DEBUG))
    {
      v25 = v12;
      v26 = objc_msgSend(v6, "objectID", v11);
      *(_DWORD *)buf = 138412290;
      v34 = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "SaveCollabState : no states for %@, creating default state", buf, 0xCu);
    }
    v13 = objc_opt_new();
    v14 = [v6 parentObjectID];
    uint64_t v15 = sub_10016B0FC(v9, v14);

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v23 = sub_1000A01DC((uint64_t)PDSchoolworkCollaborationStateAdaptor, v6, v7, v21);
          [v13 addObjectsFromArray:v23];
        }
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    v11 = +[NSArray arrayWithArray:v13];
  }

  return v11;
}

- (void)_saveEventsForHandoutAttachmentID:(id)a3 recipientPersonID:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  v20 = objc_opt_new();
  v21 = self;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(PDSchoolworkCollaborationStateChangeManager *)self pendingAttachmentEvents];
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
        v14 = [v12 attachmentID];
        if ([v14 isEqualToString:v6])
        {
          uint64_t v15 = [v12 recipientPersonID];
          unsigned int v16 = [v15 isEqualToString:v22];

          if (v16)
          {
            if (v21) {
              database = v21->_database;
            }
            else {
              database = 0;
            }
            [(PDDatabase *)database insertOrUpdateObject:v12];
            [v20 addObject:v12];
          }
        }
        else
        {
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v9 = v18;
    }
    while (v18);
  }

  uint64_t v19 = [(PDSchoolworkCollaborationStateChangeManager *)v21 pendingAttachmentEvents];
  [v19 removeObjectsInArray:v20];
}

- (void)setClientBundleID:(id)a3
{
}

- (void)setDatabase:(id)a3
{
}

- (NSMutableArray)pendingStatesChanges
{
  return self->_pendingStatesChanges;
}

- (void)setPendingStatesChanges:(id)a3
{
}

- (NSMutableArray)pendingAttachmentEvents
{
  return self->_pendingAttachmentEvents;
}

- (void)setPendingAttachmentEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAttachmentEvents, 0);
  objc_storeStrong((id *)&self->_pendingStatesChanges, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end