@interface CPLCloudKitSendSharedLibraryExitFeedbackTask
- (CKRecordZoneID)exitZoneID;
- (CPLCloudKitScope)scope;
- (CPLCloudKitSendSharedLibraryExitFeedbackTask)initWithController:(id)a3 sourceRecordIDs:(id)a4 destinationRecordIDs:(id)a5 moveError:(id)a6 operationID:(id)a7 moveBatchID:(id)a8 exitZoneID:(id)a9 scope:(id)a10 completionHandler:(id)a11;
- (NSArray)destinationRecordIDs;
- (NSArray)sourceRecordIDs;
- (NSError)moveError;
- (NSString)moveBatchID;
- (NSString)operationID;
- (id)_itemErrorFromError:(id)a3 forID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitSendSharedLibraryExitFeedbackTask

- (CPLCloudKitSendSharedLibraryExitFeedbackTask)initWithController:(id)a3 sourceRecordIDs:(id)a4 destinationRecordIDs:(id)a5 moveError:(id)a6 operationID:(id)a7 moveBatchID:(id)a8 exitZoneID:(id)a9 scope:(id)a10 completionHandler:(id)a11
{
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CPLCloudKitSendSharedLibraryExitFeedbackTask;
  v19 = [(CPLCloudKitTransportTask *)&v30 initWithController:a3];
  if (v19)
  {
    id v20 = [v18 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v20;

    objc_storeStrong((id *)&v19->_sourceRecordIDs, a4);
    objc_storeStrong((id *)&v19->_destinationRecordIDs, a5);
    objc_storeStrong((id *)&v19->_moveError, a6);
    objc_storeStrong((id *)&v19->_operationID, a7);
    objc_storeStrong((id *)&v19->_moveBatchID, a8);
    objc_storeStrong((id *)&v19->_scope, a10);
    objc_storeStrong((id *)&v19->_exitZoneID, a9);
  }

  return v19;
}

- (id)_itemErrorFromError:(id)a3 forID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [v5 domain];
    unsigned __int8 v8 = [v7 isEqualToString:CKErrorDomain];

    if ((v8 & 1) == 0 || [v5 code] != (id)2)
    {
      id v13 = v5;
      goto LABEL_8;
    }
    v9 = [v5 userInfo];
    v10 = [v9 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    if (v10)
    {
      v11 = [v5 userInfo];
      v12 = [v11 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
      id v13 = [v12 objectForKeyedSubscript:v6];

      goto LABEL_8;
    }
  }
  id v13 = 0;
LABEL_8:

  return v13;
}

- (void)runOperations
{
  id v15 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v15];
  id v4 = v15;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    sourceRecordIDs = self->_sourceRecordIDs;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C6490;
    v13[3] = &unk_10027AD20;
    v13[4] = self;
    id v14 = v5;
    id v7 = v5;
    [(NSArray *)sourceRecordIDs enumerateObjectsUsingBlock:v13];
    operationID = self->_operationID;
    moveBatchID = self->_moveBatchID;
    exitZoneID = self->_exitZoneID;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C6698;
    v12[3] = &unk_1002777A8;
    v12[4] = self;
    v11 = +[CPLCKPhotosSharedLibraryOperation sendExitMoveBatchFeedbackWithMoveBatchOperationID:operationID moveBatchID:moveBatchID exitZoneID:exitZoneID feedbackItems:v7 completionHandler:v12];
    [(CPLCloudKitTransportTask *)self launchOperation:v11 type:CPLCloudKitOperationTypeForScope(self->_scope) withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSArray)sourceRecordIDs
{
  return self->_sourceRecordIDs;
}

- (NSArray)destinationRecordIDs
{
  return self->_destinationRecordIDs;
}

- (NSError)moveError
{
  return self->_moveError;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (NSString)moveBatchID
{
  return self->_moveBatchID;
}

- (CPLCloudKitScope)scope
{
  return self->_scope;
}

- (CKRecordZoneID)exitZoneID
{
  return self->_exitZoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitZoneID, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_moveBatchID, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_moveError, 0);
  objc_storeStrong((id *)&self->_destinationRecordIDs, 0);
  objc_storeStrong((id *)&self->_sourceRecordIDs, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end