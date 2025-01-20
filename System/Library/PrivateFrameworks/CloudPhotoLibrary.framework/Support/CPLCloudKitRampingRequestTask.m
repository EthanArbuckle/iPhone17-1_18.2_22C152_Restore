@interface CPLCloudKitRampingRequestTask
- (BOOL)_shouldSkipRampingRequest;
- (CPLCloudKitRampingRequestTask)initWithController:(id)a3 resourceType:(unint64_t)a4 numRequested:(unint64_t)a5 completionHandler:(id)a6;
- (double)timeoutIntervalForRequest;
- (void)runOperations;
@end

@implementation CPLCloudKitRampingRequestTask

- (CPLCloudKitRampingRequestTask)initWithController:(id)a3 resourceType:(unint64_t)a4 numRequested:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitRampingRequestTask;
  v11 = [(CPLCloudKitTransportTask *)&v16 initWithController:a3];
  v12 = v11;
  if (v11)
  {
    v11->_resourceType = a4;
    v11->_numRequested = a5;
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;

    [(CPLCloudKitTransportTask *)v12 setBoostable:0];
  }

  return v12;
}

- (double)timeoutIntervalForRequest
{
  return 30.0;
}

- (BOOL)_shouldSkipRampingRequest
{
  if (qword_1002CE7C0 != -1) {
    dispatch_once(&qword_1002CE7C0, &stru_1002790F0);
  }
  return byte_1002CE7B8;
}

- (void)runOperations
{
  if (![(CPLCloudKitRampingRequestTask *)self _shouldSkipRampingRequest])
  {
    id v21 = 0;
    unsigned __int8 v4 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v21];
    id v5 = v21;
    if (v4)
    {
      v6 = [(CPLCloudKitTransportTask *)self controller];
      unsigned __int8 v7 = [v6 isNetworkConnected];

      if (v7)
      {
        id v8 = objc_alloc_init((Class)CPLRampingRequestResource);
        v9 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, self->_resourceType);
        id v10 = sub_1000379BC((uint64_t)v9);
        [v8 setResource:v10];

        v11 = [v8 resource];

        if (v11)
        {
          [v8 setNumRequested:self->_numRequested];
          id v12 = objc_alloc_init((Class)CPLRampingRequest);
          [v12 addRequest:v8];
          id v13 = [objc_alloc((Class)CKCodeOperation) initWithServiceName:@"Ramping" functionName:@"request" responseClass:objc_opt_class()];
          [v13 setRequest:v12];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100074EB4;
          v20[3] = &unk_100279118;
          v20[4] = self;
          [v13 setCodeOperationCompletionBlock:v20];
          [(CPLCloudKitTransportTask *)self launchOperation:v13 type:1 withContext:0];
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            if (qword_1002CE7C8 != -1) {
              dispatch_once(&qword_1002CE7C8, &stru_100279138);
            }
            v15 = (void *)qword_1002CE7D0;
            if (os_log_type_enabled((os_log_t)qword_1002CE7D0, OS_LOG_TYPE_ERROR))
            {
              unint64_t resourceType = self->_resourceType;
              v17 = v15;
              v18 = +[CPLResource shortDescriptionForResourceType:resourceType];
              *(_DWORD *)buf = 138412290;
              v23 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Trying to ask for a remapping request for an unsupported resource type: %@", buf, 0xCu);
            }
          }
          id completionHandler = self->_completionHandler;
          id v12 = +[CPLErrors incorrectParametersErrorForParameter:@"resourceType"];
          (*((void (**)(id, void, void, id))completionHandler + 2))(completionHandler, 0, 0, v12);
        }

        goto LABEL_19;
      }
      v14 = (void (*)(void))*((void *)self->_completionHandler + 2);
    }
    else
    {
      v14 = (void (*)(void))*((void *)self->_completionHandler + 2);
    }
    v14();
LABEL_19:

    return;
  }
  v3 = (void (*)(void))*((void *)self->_completionHandler + 2);
  v3();
}

- (void).cxx_destruct
{
}

@end