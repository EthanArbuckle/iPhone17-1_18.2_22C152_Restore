@interface ADCloudKitZoneShareCreator
- (ADCloudKitZoneShareCreator)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5;
- (void)_setupZoneSharing:(id)a3;
- (void)deleteZoneShare:(BOOL)a3 markForReinvitation:(BOOL)a4 completion:(id)a5;
- (void)fetchZoneShare:(id)a3;
- (void)saveZoneShare:(id)a3 completion:(id)a4;
@end

@implementation ADCloudKitZoneShareCreator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)saveZoneShare:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)CKModifyRecordsOperation);
  id v15 = v7;
  v9 = +[NSArray arrayWithObjects:&v15 count:1];
  id v10 = [v8 initWithRecordsToSave:v9 recordIDsToDelete:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018302C;
  v13[3] = &unk_1005046A0;
  id v14 = v6;
  id v11 = v6;
  [v10 setModifyRecordsCompletionBlock:v13];
  [v10 setQualityOfService:17];
  v12 = [(CKContainer *)self->_container privateCloudDatabase];
  [v12 addOperation:v10];
}

- (void)fetchZoneShare:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001831D8;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deleteZoneShare:(BOOL)a3 markForReinvitation:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183718;
  block[3] = &unk_10050A028;
  block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)_setupZoneSharing:(id)a3
{
  id v4 = a3;
  zoneInfo = self->_zoneInfo;
  if (zoneInfo
    && ([(ADCloudKitRecordZoneInfo *)zoneInfo zone],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = objc_alloc((Class)CKShare);
    id v8 = [(ADCloudKitRecordZoneInfo *)self->_zoneInfo zone];
    v9 = [v8 zoneID];
    id v10 = [v7 initWithRecordZoneID:v9];

    [v10 setParticipantVisibility:2];
    id v11 = objc_alloc((Class)CKModifyRecordsOperation);
    id v22 = v10;
    id v12 = +[NSArray arrayWithObjects:&v22 count:1];
    id v13 = [v11 initWithRecordsToSave:v12 recordIDsToDelete:0];

    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100183CE4;
    v19 = &unk_10050BF60;
    v20 = self;
    id v21 = v4;
    [v13 setModifyRecordsCompletionBlock:&v16];
    objc_msgSend(v13, "setQualityOfService:", 17, v16, v17, v18, v19);
    BOOL v14 = [(CKContainer *)self->_container privateCloudDatabase];
    [v14 addOperation:v13];
  }
  else
  {
    id v15 = +[AFError errorWithCode:4020];
    if (v4) {
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v15);
    }
  }
}

- (ADCloudKitZoneShareCreator)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ADCloudKitZoneShareCreator;
  id v12 = [(ADCloudKitZoneShareCreator *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_container, a4);
    objc_storeStrong((id *)&v13->_zoneInfo, a5);
  }

  return v13;
}

@end