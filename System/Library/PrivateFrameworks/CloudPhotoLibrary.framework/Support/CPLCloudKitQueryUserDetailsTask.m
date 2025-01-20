@interface CPLCloudKitQueryUserDetailsTask
- (CPLCloudKitQueryUserDetailsTask)initWithController:(id)a3 participants:(id)a4 completionHandler:(id)a5;
- (void)queryUserDetailsWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitQueryUserDetailsTask

- (CPLCloudKitQueryUserDetailsTask)initWithController:(id)a3 participants:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitQueryUserDetailsTask;
  v11 = [(CPLCloudKitTransportTask *)&v16 initWithController:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_participants, a4);
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }
  return v12;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000BA85C;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)queryUserDetailsWithCurrentUserID:(id)a3
{
  id v26 = a3;
  v27 = self;
  id v36 = 0;
  LOBYTE(self) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v36];
  id v25 = v36;
  if ((self & 1) == 0)
  {
    (*((void (**)(void))v27->_completionHandler + 2))();
    goto LABEL_26;
  }
  uint64_t v24 = 272;
  if (!v27->_participants)
  {
    id completionHandler = (void (**)(id, void, void *))v27->_completionHandler;
    v23 = +[CPLErrors incorrectParametersErrorForParameter:@"participants"];
    completionHandler[2](completionHandler, 0, v23);

    goto LABEL_26;
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v27->_participants, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = v27->_participants;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)v33;
  do
  {
    v8 = 0;
    do
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v8);
      id v10 = objc_msgSend(v9, "email", v24, v25);

      if (v10)
      {
        id v11 = objc_alloc((Class)CKUserIdentityLookupInfo);
        id v12 = [v9 email];
        id v13 = [v11 initWithEmailAddress:v12];
LABEL_14:
        v19 = v13;

        if (!v19) {
          goto LABEL_17;
        }
        [v4 addObject:v19];
        goto LABEL_16;
      }
      v14 = [v9 phoneNumber];

      if (v14)
      {
        id v15 = objc_alloc((Class)CKUserIdentityLookupInfo);
        id v12 = [v9 phoneNumber];
        id v13 = [v15 initWithPhoneNumber:v12];
        goto LABEL_14;
      }
      objc_super v16 = [v9 userIdentifier];

      if (v16)
      {
        id v17 = objc_alloc((Class)CKRecordID);
        v18 = [v9 userIdentifier];
        id v12 = [v17 initWithRecordName:v18];

        id v13 = [objc_alloc((Class)CKUserIdentityLookupInfo) initWithUserRecordID:v12];
        goto LABEL_14;
      }
      if (!_CPLSilentLogging)
      {
        v19 = sub_1000BAD84();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Missing information to query for user identity for %@", (uint8_t *)&buf, 0xCu);
        }
LABEL_16:
      }
LABEL_17:
      v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    id v20 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
    id v6 = v20;
  }
  while (v20);
LABEL_23:

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1000BADD8;
  v40 = sub_1000BADE8;
  id v41 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)((char *)&v27->super.super.isa + v24), "count"));
  id v21 = [objc_alloc((Class)CKFetchShareParticipantsOperation) initWithUserIdentityLookupInfos:v4];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000BADF0;
  v29[3] = &unk_10027A8B8;
  id v30 = v26;
  p_long long buf = &buf;
  [v21 setPerShareParticipantCompletionBlock:v29];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000BAF28;
  v28[3] = &unk_10027A8E0;
  v28[4] = v27;
  v28[5] = &buf;
  [v21 setFetchShareParticipantsCompletionBlock:v28];
  [(CPLCloudKitTransportTask *)v27 launchOperation:v21 type:0 withContext:0];

  _Block_object_dispose(&buf, 8);
LABEL_26:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end