@interface CPLCloudKitSendFeedbackTask
- (CPLCloudKitSendFeedbackTask)initWithController:(id)a3 messages:(id)a4 completionHandler:(id)a5;
- (NSArray)messages;
- (id)completionHandler;
- (void)runOperations;
@end

@implementation CPLCloudKitSendFeedbackTask

- (CPLCloudKitSendFeedbackTask)initWithController:(id)a3 messages:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CPLCloudKitSendFeedbackTask;
  v10 = [(CPLCloudKitTransportTask *)&v16 initWithController:a3];
  if (v10)
  {
    v11 = (NSArray *)[v8 copy];
    messages = v10->_messages;
    v10->_messages = v11;

    id v13 = [v9 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v13;

    [(CPLCloudKitTransportTask *)v10 setBoostable:0];
  }

  return v10;
}

- (void)runOperations
{
  id v23 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v23];
  id v4 = v23;
  if (v3)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_messages, "count"));
    v6 = [(CPLCloudKitTransportTask *)self mainScopeIdentifier];
    v17 = v6;
    if ([v6 isEqualToString:CPLPrimaryScopeIdentifier])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = objc_alloc_init((Class)CPLServerFeedbackKeyAndValue);
      objc_msgSend(v7, "setKey:", @"mainZone", v6);
      [v7 setValue:v6];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = self->_messages;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "serverMessage", v17);
          v14 = v13;
          if (v7)
          {
            id v15 = [v13 copy];

            [v15 addKeysAndValues:v7];
            v14 = v15;
          }
          [v5 addObject:v14];
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    objc_super v16 = [[CPLCKFeedbackOperation alloc] initWithFeedbackMessages:v5];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100040964;
    v18[3] = &unk_100276328;
    v18[4] = self;
    [(CPLCKFeedbackOperation *)v16 setFeedbackCompletionBlock:v18];
    [(CPLCloudKitTransportTask *)self launchOperation:v16 type:1 withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSArray)messages
{
  return self->_messages;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end