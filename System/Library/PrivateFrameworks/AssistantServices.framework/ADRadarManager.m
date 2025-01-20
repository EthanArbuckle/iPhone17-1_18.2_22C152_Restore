@interface ADRadarManager
+ (id)sharedInstance;
- (id)_init;
- (void)_sharedCreateDraft:(id)a3 withDisplayReason:(id)a4 reproducibility:(int64_t)a5 classification:(int64_t)a6 completionHandler:(id)a7;
- (void)createCrashDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5;
- (void)createDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5;
@end

@implementation ADRadarManager

- (void)createCrashDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5
{
}

- (void)createDraft:(id)a3 withDisplayReason:(id)a4 completionHandler:(id)a5
{
}

- (void)_sharedCreateDraft:(id)a3 withDisplayReason:(id)a4 reproducibility:(int64_t)a5 classification:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  v14 = (void *)qword_100586198;
  uint64_t v42 = qword_100586198;
  if (!qword_100586198)
  {
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_1002E3DDC;
    v37 = &unk_10050E318;
    v38 = &v39;
    sub_1002E3DDC((uint64_t)&v34);
    v14 = (void *)v40[3];
  }
  v15 = v14;
  _Block_object_dispose(&v39, 8);
  id v16 = objc_alloc_init(v15);
  v17 = [v11 title];
  [v16 setTitle:v17];

  v18 = [v11 problemDescription];
  [v16 setProblemDescription:v18];

  objc_msgSend(v16, "setIsUserInitiated:", objc_msgSend(v11, "isUserInitiated"));
  v19 = [v11 deviceIDs];
  [v16 setDeviceIDs:v19];

  uint64_t v20 = [v11 componentName];
  if (v20)
  {
    v21 = (void *)v20;
    uint64_t v22 = [v11 componentVersion];
    if (!v22)
    {
LABEL_9:

      goto LABEL_10;
    }
    v23 = (void *)v22;
    id v24 = [v11 componentIdentifier];

    if (v24)
    {
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2050000000;
      v25 = (void *)qword_1005861A0;
      uint64_t v42 = qword_1005861A0;
      if (!qword_1005861A0)
      {
        v34 = _NSConcreteStackBlock;
        uint64_t v35 = 3221225472;
        v36 = sub_1002E3EA4;
        v37 = &unk_10050E318;
        v38 = &v39;
        sub_1002E3EA4((uint64_t)&v34);
        v25 = (void *)v40[3];
      }
      v26 = v25;
      _Block_object_dispose(&v39, 8);
      id v27 = [v26 alloc];
      v21 = [v11 componentName];
      v28 = [v11 componentVersion];
      id v29 = objc_msgSend(v27, "initWithName:version:identifier:", v21, v28, objc_msgSend(v11, "componentIdentifier"));
      [v16 setComponent:v29];

      goto LABEL_9;
    }
  }
LABEL_10:
  [v16 setBundleID:@"com.apple.siri"];
  [v16 setReproducibility:a5];
  [v16 setClassification:a6];
  v30 = [sub_1002E3F6C() shared];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1002E4050;
  v32[3] = &unk_10050D440;
  id v33 = v13;
  id v31 = v13;
  [v30 createDraft:v16 forProcessNamed:@"Siri" withDisplayReason:v12 completionHandler:v32];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ADRadarManager;
  return [(ADRadarManager *)&v3 init];
}

+ (id)sharedInstance
{
  if (qword_100586180 != -1) {
    dispatch_once(&qword_100586180, &stru_10050B000);
  }
  v2 = (void *)qword_100586178;
  return v2;
}

@end