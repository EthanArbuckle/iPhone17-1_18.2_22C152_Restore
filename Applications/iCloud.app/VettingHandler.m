@interface VettingHandler
- (CKTestDevice)testDevice;
- (NSURL)url;
- (VettingHandler)initWithCloudKitURL:(id)a3;
- (void)completeVettingWithCompletionHandler:(id)a3 willIssueCompletionOperationHandler:(id)a4;
- (void)fetchVettingRecordWithVettingToken:(id)a3 completionHandler:(id)a4;
- (void)setTestDevice:(id)a3;
@end

@implementation VettingHandler

- (VettingHandler)initWithCloudKitURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VettingHandler;
  v5 = [(VettingHandler *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    url = v5->_url;
    v5->_url = v6;
  }
  return v5;
}

- (void)fetchVettingRecordWithVettingToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)CKContainerID);
  id v9 = [v8 initWithContainerIdentifier:kCKCompleteParticipantVettingVettingRecordContainerName environment:1];
  if (__sTestOverridesAvailable
    && ([(VettingHandler *)self testDevice],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v11 = [(VettingHandler *)self testDevice];
    id v12 = [v11 containerWithContainerID:v9];
  }
  else
  {
    id v12 = [objc_alloc((Class)CKContainer) initWithContainerID:v9];
  }
  v13 = +[NSString stringWithFormat:@"V:%@", v6];
  id v14 = [objc_alloc((Class)CKRecordID) initWithRecordName:v13];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_100012D34;
  v36[4] = sub_100012D44;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100012D34;
  v34[4] = sub_100012D44;
  id v35 = 0;
  id v15 = objc_alloc((Class)CKFetchRecordsOperation);
  id v38 = v14;
  v16 = +[NSArray arrayWithObjects:&v38 count:1];
  id v17 = [v15 initWithRecordIDs:v16];

  v18 = [v17 resolvedConfiguration];
  [v18 setRequestOriginator:2];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100012D4C;
  v29[3] = &unk_100024B10;
  id v19 = v14;
  id v30 = v19;
  v32 = v34;
  id v20 = v6;
  id v31 = v20;
  v33 = v36;
  [v17 setPerRecordCompletionBlock:v29];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100012FA0;
  v24[3] = &unk_100024B38;
  v27 = v34;
  id v21 = v20;
  id v25 = v21;
  id v22 = v7;
  id v26 = v22;
  v28 = v36;
  [v17 setFetchRecordsCompletionBlock:v24];
  v23 = [v12 publicCloudDatabase];
  [v23 addOperation:v17];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

- (void)completeVettingWithCompletionHandler:(id)a3 willIssueCompletionOperationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(VettingHandler *)self url];
  v10 = [v9 pathComponents];

  if ((unint64_t)[v10 count] <= 2)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VettingHandler.m", 89, @"Too short vetting URL (should have already been checked): %@", v10 object file lineNumber description];
  }
  [v10 objectAtIndexedSubscript:2];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000131E8;
  v15[3] = &unk_100024B88;
  v15[4] = self;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v16;
  id v13 = v7;
  [(VettingHandler *)self fetchVettingRecordWithVettingToken:v12 completionHandler:v15];
}

- (CKTestDevice)testDevice
{
  return self->_testDevice;
}

- (void)setTestDevice:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_testDevice, 0);
}

@end