@interface SoftLinker
+ (void)fetchMediaAPIMetadataForItemID:(id)a3 versionID:(id)a4 distributorID:(id)a5 completion:(id)a6;
+ (void)notifyOfGameCenterEnabledAppInstall:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation SoftLinker

+ (void)notifyOfGameCenterEnabledAppInstall:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v7 = (void *)qword_100667880;
  uint64_t v13 = qword_100667880;
  if (!qword_100667880)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100173720;
    v9[3] = &unk_100636218;
    v9[4] = &v10;
    sub_100173720((uint64_t)v9);
    v7 = (void *)v11[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v10, 8);
  [v8 notifyOfGameCenterEnabledAppInstall:v5 withCompletionHandler:v6];
}

+ (void)fetchMediaAPIMetadataForItemID:(id)a3 versionID:(id)a4 distributorID:(id)a5 completion:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100171BBC;
  v13[3] = &unk_1006361F0;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v17;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

@end