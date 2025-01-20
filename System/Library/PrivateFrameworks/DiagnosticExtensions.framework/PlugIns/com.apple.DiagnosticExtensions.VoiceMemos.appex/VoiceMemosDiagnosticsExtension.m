@interface VoiceMemosDiagnosticsExtension
- (id)_generateAttachments;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation VoiceMemosDiagnosticsExtension

- (id)_generateAttachments
{
  v2 = objc_opt_new();
  id v3 = objc_alloc((Class)RCPersistentContainer);
  v4 = RCCloudRecordingsStoreURL();
  id v5 = [v3 initWithURL:v4];

  id v6 = [v5 newBackgroundModel];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100003128;
  v23[3] = &unk_100004160;
  id v7 = v2;
  id v24 = v7;
  v8 = objc_retainBlock(v23);
  v9 = RCLogsDirectoryURL();
  v10 = [v9 path];

  v11 = [v10 stringByAppendingPathComponent:@"VoiceMemos-AllRecordings.txt"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000032D0;
  v21[3] = &unk_1000041B0;
  id v12 = v6;
  id v22 = v12;
  ((void (*)(void *, void *, void *))v8[2])(v8, v11, v21);
  v13 = [v10 stringByAppendingPathComponent:@"VoiceMemos-PersistentHistory.txt"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000034AC;
  v19[3] = &unk_1000041B0;
  id v20 = v12;
  v14 = (void (*)(void *, void *, void *))v8[2];
  id v15 = v12;
  v14(v8, v13, v19);
  v16 = v20;
  id v17 = v7;

  return v17;
}

- (id)attachmentsForParameters:(id)a3
{
  return [(VoiceMemosDiagnosticsExtension *)self _generateAttachments];
}

@end