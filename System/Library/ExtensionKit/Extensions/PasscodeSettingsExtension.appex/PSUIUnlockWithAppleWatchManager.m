@interface PSUIUnlockWithAppleWatchManager
+ (id)sharedInstance;
- (void)canUseWatchToUnlockWithCompletionHandler:(id)a3;
@end

@implementation PSUIUnlockWithAppleWatchManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001D88;
  block[3] = &unk_10000C888;
  block[4] = a1;
  if (qword_100010468 != -1) {
    dispatch_once(&qword_100010468, block);
  }
  v2 = (void *)qword_100010460;

  return v2;
}

- (void)canUseWatchToUnlockWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v4 = (void *)qword_100010470;
  uint64_t v23 = qword_100010470;
  if (!qword_100010470)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100002124;
    v18 = &unk_10000C8D8;
    v19 = &v20;
    sub_100002124((uint64_t)&v15);
    v4 = (void *)v21[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v20, 8);
  v6 = [v5 sharedInstance];
  unsigned int v7 = [v6 isPaired];

  if (v7)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v8 = (void *)qword_100010480;
    uint64_t v23 = qword_100010480;
    if (!qword_100010480)
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_1000022DC;
      v18 = &unk_10000C8D8;
      v19 = &v20;
      sub_1000022DC((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v20, 8);
    v10 = [v9 sharedUnlockManager];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v11 = (uint64_t *)qword_100010490;
    uint64_t v23 = qword_100010490;
    if (!qword_100010490)
    {
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_100002494;
      v18 = &unk_10000C8D8;
      v19 = &v20;
      sub_100002494((uint64_t)&v15);
      v11 = (uint64_t *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v11) {
      sub_1000082CC();
    }
    uint64_t v12 = *v11;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100002090;
    v13[3] = &unk_10000C8B0;
    id v14 = v3;
    [v10 unlockEnabledWithDevice:v12 completionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

@end