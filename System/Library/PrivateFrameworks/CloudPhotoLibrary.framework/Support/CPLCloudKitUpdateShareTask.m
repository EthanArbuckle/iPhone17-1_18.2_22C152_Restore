@interface CPLCloudKitUpdateShareTask
- (BOOL)_checkNonNilUserIdentifierEquality:(id)a3 withUserIdentifier:(id)a4;
- (BOOL)_checkParticipant:(id)a3 inEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7;
- (BOOL)_isCurrentUserOwnerOrAdminOfShare:(id)a3;
- (BOOL)_isValidListOfShareParticipants:(id)a3;
- (CPLCloudKitUpdateShareTask)initWithController:(id)a3 scope:(id)a4 transportScope:(id)a5 completionHandler:(id)a6;
- (id)cloudKitScope;
- (void)_addParticipant:(id)a3 toEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7;
- (void)_fetchCKShareWithCompletionHandler:(id)a3;
- (void)_modifyParticipantsOfCKShare:(id)a3 newParticipants:(id)a4;
- (void)_updateCKShare:(id)a3 completionHandler:(id)a4;
- (void)_uploadCKShare:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitUpdateShareTask

- (CPLCloudKitUpdateShareTask)initWithController:(id)a3 scope:(id)a4 transportScope:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CPLCloudKitUpdateShareTask;
  v12 = [(CPLCloudKitManageScopeTask *)&v18 initWithController:a3 scope:a4];
  if (v12)
  {
    if (v10)
    {
      uint64_t v13 = +[CPLCloudKitScope scopeFromTransportScope:v10];
      cloudKitScope = v12->_cloudKitScope;
      v12->_cloudKitScope = (CPLCloudKitScope *)v13;
    }
    id v15 = [v11 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v15;
  }
  return v12;
}

- (id)cloudKitScope
{
  cloudKitScope = self->_cloudKitScope;
  if (cloudKitScope)
  {
    v3 = cloudKitScope;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLCloudKitUpdateShareTask;
    v3 = [(CPLCloudKitManageScopeTask *)&v5 cloudKitScope];
  }
  return v3;
}

- (void)_fetchCKShareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v18];
  id v6 = v18;
  if (v5)
  {
    v7 = [(CPLCloudKitManageScopeTask *)self identification];
    uint64_t v8 = [v7 shareRecordName];
    v9 = (void *)v8;
    if (v8)
    {
      uint64_t v19 = v8;
      id v10 = +[NSArray arrayWithObjects:&v19 count:1];
      id v11 = [(CPLCloudKitUpdateShareTask *)self cloudKitScope];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000568E8;
      v14[3] = &unk_1002782D8;
      id v15 = v9;
      v16 = self;
      id v17 = v4;
      [(CPLCloudKitTransportTask *)self fetchRecordWithNames:v10 inScope:v11 completionHandler:v14];

      v12 = v15;
    }
    else
    {
      v12 = +[CPLScopeChange descriptionForScopeType:[(CPLCloudKitManageScopeTask *)self scopeType]];
      uint64_t v13 = +[CPLErrors cplErrorWithCode:38, @"%@ is an unsupported scope type for a share", v12 description];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v13);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (void)_uploadCKShare:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056B7C;
  v8[3] = &unk_100278328;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v8];
}

- (BOOL)_checkNonNilUserIdentifierEquality:(id)a3 withUserIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = v5 && v6 && ([v5 isEqualToString:v6] & 1) != 0;

  return v8;
}

- (void)_addParticipant:(id)a3 toEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7
{
  id v25 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [v25 userIdentity];
  v16 = [v15 lookupInfo];

  id v17 = [v16 emailAddress];

  if (v17)
  {
    id v18 = [v16 emailAddress];
    [v11 addObject:v18];
  }
  uint64_t v19 = [v16 phoneNumber];

  if (v19)
  {
    v20 = [v16 phoneNumber];
    [v12 addObject:v20];
  }
  v21 = [v16 userRecordID];

  if (v21)
  {
    v22 = [v16 userRecordID];
    [v13 addObject:v22];
  }
  v23 = [v25 participantID];

  if (v23)
  {
    v24 = [v25 participantID];
    [v14 addObject:v24];
  }
}

- (BOOL)_checkParticipant:(id)a3 inEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v11 userIdentity];
  id v17 = [v16 lookupInfo];

  uint64_t v18 = [v17 emailAddress];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = [v17 emailAddress];
    unsigned __int8 v21 = [v12 containsObject:v20];

    if (v21) {
      goto LABEL_7;
    }
  }
  uint64_t v22 = [v17 phoneNumber];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [v17 phoneNumber];
    unsigned __int8 v25 = [v13 containsObject:v24];

    if (v25) {
      goto LABEL_7;
    }
  }
  uint64_t v26 = [v17 userRecordID];
  if (!v26) {
    goto LABEL_8;
  }
  v27 = (void *)v26;
  v28 = [v17 userRecordID];
  unsigned __int8 v29 = [v14 containsObject:v28];

  if (v29)
  {
LABEL_7:
    unsigned __int8 v30 = 1;
  }
  else
  {
LABEL_8:
    v31 = [v11 participantID];
    if (v31)
    {
      v32 = [v11 participantID];
      unsigned __int8 v30 = [v15 containsObject:v32];
    }
    else
    {
      unsigned __int8 v30 = 0;
    }
  }
  return v30;
}

- (void)_modifyParticipantsOfCKShare:(id)a3 newParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v33 = v6;
    BOOL v8 = [v6 participants];
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100053134();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v56 = v7;
        __int16 v57 = 2112;
        v58 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Comparing new participants %@ with existing participants %@", buf, 0x16u);
      }
    }
    id v39 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v38 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v37 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v36 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v49;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v10);
          }
          [(CPLCloudKitUpdateShareTask *)self _addParticipant:*(void *)(*((void *)&v48 + 1) + 8 * i) toEmails:v38 phoneNumbers:v39 userRecordIDs:v37 participantIDs:v36];
        }
        id v12 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v12);
    }
    v31 = v10;

    id v15 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v17 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v32 = v7;
    id obj = v7;
    id v19 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          -[CPLCloudKitUpdateShareTask _addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:](self, "_addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:", v23, v16, v15, v17, v18, v31);
          if (![(CPLCloudKitUpdateShareTask *)self _checkParticipant:v23 inEmails:v38 phoneNumbers:v39 userRecordIDs:v37 participantIDs:v36])
          {
            if (!_CPLSilentLogging)
            {
              v24 = sub_100053134();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v56 = v23;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Adding new participant %@", buf, 0xCu);
              }
            }
            [v33 addParticipant:v23];
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v20);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obja = v31;
    id v25 = [obja countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v41;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(obja);
          }
          unsigned __int8 v29 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
          if (!-[CPLCloudKitUpdateShareTask _checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:](self, "_checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:", v29, v16, v15, v17, v18, v31)&& !_CPLSilentLogging)
          {
            unsigned __int8 v30 = sub_100053134();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v56 = v29;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Trying to remove participant %@ directly is unsupported", buf, 0xCu);
            }
          }
        }
        id v26 = [obja countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v26);
    }

    id v6 = v33;
    id v7 = v32;
  }
}

- (BOOL)_isValidListOfShareParticipants:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "role", (void)v8) == (id)1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)_isCurrentUserOwnerOrAdminOfShare:(id)a3
{
  id v3 = [a3 currentUserParticipant];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 role] == (id)1 || objc_msgSend(v4, "role") == (id)2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateCKShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = 0;
  unsigned __int8 v8 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v21];
  id v9 = v21;
  if (v8)
  {
    long long v10 = [(CPLCloudKitManageScopeTask *)self scope];
    if ([(CPLCloudKitUpdateShareTask *)self _isCurrentUserOwnerOrAdminOfShare:v6])
    {
      [v10 updateCKShare:v6];
      long long v11 = [v10 share];
      id v12 = [v11 participants];

      if ([v6 publicPermission] != (id)1 || !objc_msgSend(v12, "count"))
      {
        [(CPLCloudKitUpdateShareTask *)self _uploadCKShare:v6 completionHandler:v7];
        goto LABEL_11;
      }
      if ([(CPLCloudKitUpdateShareTask *)self _isValidListOfShareParticipants:v12])
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100057E80;
        v18[3] = &unk_100278350;
        id v20 = v7;
        v18[4] = self;
        id v19 = v6;
        [(CPLCloudKitManageScopeTask *)self fetchShareParticipantsForParticipants:v12 completionBlock:v18];

LABEL_11:
        goto LABEL_12;
      }
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      id v14 = [(CPLCloudKitManageScopeTask *)self scope];
      id v16 = [v14 scopeIdentifier];
      id v17 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v16];
      completionHandler[2](completionHandler, 0, v17);
    }
    else
    {
      uint64_t v13 = objc_opt_class();
      id v12 = [v10 scopeIdentifier];
      id v14 = +[CPLErrors cplErrorWithCode:52, @"User is not owner or admin of <%@ %@>", v13, v12 description];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
    }

    goto LABEL_11;
  }
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
LABEL_12:
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100057F64;
  v2[3] = &unk_100278378;
  v2[4] = self;
  [(CPLCloudKitUpdateShareTask *)self _fetchCKShareWithCompletionHandler:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end