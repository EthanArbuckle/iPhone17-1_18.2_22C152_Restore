@interface SPCompanionNotificationHandler
+ (id)sharedInstance;
- (SPCompanionNotificationHandler)init;
- (void)injectBulletinWithSectionID:(id)a3 gizmoAppIdentifier:(id)a4 bulletinID:(id)a5 remoteNotificationContext:(id)a6 forceStatic:(BOOL)a7 completion:(id)a8;
@end

@implementation SPCompanionNotificationHandler

- (void)injectBulletinWithSectionID:(id)a3 gizmoAppIdentifier:(id)a4 bulletinID:(id)a5 remoteNotificationContext:(id)a6 forceStatic:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v60 = a3;
  id v14 = a4;
  v15 = self;
  id v59 = v14;
  id v61 = a5;
  id v62 = a6;
  id v55 = a8;
  v16 = wk_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(void *)&buf[4] = "-[SPCompanionNotificationHandler injectBulletinWithSectionID:gizmoAppIdentifier:bulletinID:remo"
                         "teNotificationContext:forceStatic:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 65;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v60;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v59;
    *(_WORD *)&buf[38] = 2114;
    id v73 = v61;
    __int16 v74 = 2114;
    id v75 = v62;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: injecting bulletin with sectionID:%{public}@, gizmoAppIdentifier:%{public}@, bulletinID:%{public}@, remoteNotificationContext:%{public}@", buf, 0x3Au);
  }

  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2050000000;
  v17 = (void *)qword_100052670;
  uint64_t v71 = qword_100052670;
  if (!qword_100052670)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10002939C;
    *(void *)&buf[24] = &unk_100045AD8;
    *(void *)&buf[32] = &v68;
    sub_10002939C((uint64_t)buf);
    v17 = (void *)v69[3];
  }
  v18 = v17;
  _Block_object_dispose(&v68, 8);
  id v19 = objc_alloc_init(v18);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2050000000;
  v20 = (void *)qword_100052680;
  uint64_t v71 = qword_100052680;
  if (!qword_100052680)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100029568;
    *(void *)&buf[24] = &unk_100045AD8;
    *(void *)&buf[32] = &v68;
    sub_100029568((uint64_t)buf);
    v20 = (void *)v69[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v68, 8);
  v22 = [v21 requestWithIdentifier:v61 pushPayload:v62 bundleIdentifier:v60];
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2050000000;
  v23 = (void *)qword_100052690;
  uint64_t v71 = qword_100052690;
  if (!qword_100052690)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100029730;
    *(void *)&buf[24] = &unk_100045AD8;
    *(void *)&buf[32] = &v68;
    sub_100029730((uint64_t)buf);
    v23 = (void *)v69[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v68, 8);
  v25 = [v19 date];
  v58 = [v24 notificationWithRequest:v22 date:v25];

  id v67 = 0;
  v26 = +[NSKeyedArchiver archivedDataWithRootObject:v58 requiringSecureCoding:1 error:&v67];
  id v56 = v67;
  if (!v26)
  {
    v27 = wk_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002C900((uint64_t)v56, v27);
    }
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  v28 = (void *)qword_100052698;
  uint64_t v71 = qword_100052698;
  if (!qword_100052698)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100029788;
    *(void *)&buf[24] = &unk_100045AD8;
    *(void *)&buf[32] = &v68;
    v29 = (void *)sub_1000293F4();
    v30 = dlsym(v29, "BLTBulletinContextArchivedUserNotificationKey");
    *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24) = v30;
    qword_100052698 = *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24);
    v28 = (void *)v69[3];
  }
  _Block_object_dispose(&v68, 8);
  if (!v28)
  {
    sub_100029B78();
    __break(1u);
  }
  [v19 setContextValue:v26 forKey:*v28];
  v31 = [v22 content];
  v32 = [v31 title];

  v33 = [v22 content];
  v34 = [v33 subtitle];

  v35 = [v22 content];
  v57 = [v35 body];

  [v19 setBulletinID:v61];
  if (v32) {
    [v19 setTitle:v32];
  }
  if (v34) {
    [v19 setSubtitle:v34];
  }
  [v19 setMessage:v57];
  [v19 setSectionID:v60];
  v36 = +[NSUUID UUID];
  v37 = [v36 UUIDString];
  [v19 setPublisherBulletinID:v37];

  v38 = [v19 publisherBulletinID];
  [v19 setRecordID:v38];

  v39 = +[NSDate date];
  [v19 setDate:v39];

  id v40 = [objc_alloc((Class)BBSound) initWithToneAlert:17];
  [v19 setSound:v40];

  id v41 = [v62 mutableCopy];
  [v41 removeObjectForKey:@"WatchKit Simulator Actions"];
  if (v9) {
    [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:@"NFS"];
  }
  [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_WK_SFX"];
  [v19 setContextValue:v41 forKey:@"remoteNotification"];
  v42 = [v22 content];
  v43 = [v42 categoryIdentifier];
  [v19 setContextValue:v43 forKey:@"category"];

  v44 = [v22 content];
  v45 = [v44 threadIdentifier];
  [v19 setThreadID:v45];

  [v19 setContextValue:@"AppNotificationRemote" forKey:@"notificationType"];
  [v19 setContextValue:v59 forKey:@"BLTSockPuppetAppIdentifierKey"];
  v46 = [v62 objectForKeyedSubscript:@"WatchKit Simulator Actions"];
  if ([v46 count])
  {
    +[NSMutableArray array];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10002904C;
    v65[3] = &unk_1000464D0;
    id v66 = (id)objc_claimAutoreleasedReturnValue();
    id v47 = v66;
    [v46 enumerateObjectsUsingBlock:v65];
    [v19 setSupplementaryActions:v47];
  }
  if (!v15->_bltTestService)
  {
    uint64_t v68 = 0;
    v69 = &v68;
    uint64_t v70 = 0x2050000000;
    v48 = (void *)qword_1000526A0;
    uint64_t v71 = qword_1000526A0;
    if (!qword_1000526A0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1000297D8;
      *(void *)&buf[24] = &unk_100045AD8;
      *(void *)&buf[32] = &v68;
      sub_1000297D8((uint64_t)buf);
      v48 = (void *)v69[3];
    }
    v49 = v48;
    _Block_object_dispose(&v68, 8);
    v50 = (BLTTestService *)objc_alloc_init(v49);
    bltTestService = v15->_bltTestService;
    v15->_bltTestService = v50;
  }
  v52 = wk_default_log();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&buf[4] = "-[SPCompanionNotificationHandler injectBulletinWithSectionID:gizmoAppIdentifier:bulletinID:remo"
                         "teNotificationContext:forceStatic:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 145;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v60;
    *(_WORD *)&buf[28] = 2114;
    *(void *)&buf[30] = v61;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: calling -[BLTTestService addBulletin:::::] with sectionID %{public}@, bulletinID %{public}@", buf, 0x26u);
  }

  v53 = v15->_bltTestService;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_1000291CC;
  v63[3] = &unk_1000456E8;
  id v64 = v55;
  id v54 = v55;
  [(BLTTestService *)v53 addBulletin:v19 forFeed:32878 playLightsAndSirens:1 attachment:0 attachmentType:0 completion:v63];
}

+ (id)sharedInstance
{
  if (qword_100052660 != -1) {
    dispatch_once(&qword_100052660, &stru_1000464F0);
  }
  v2 = (void *)qword_100052668;

  return v2;
}

- (SPCompanionNotificationHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPCompanionNotificationHandler;
  return [(SPCompanionNotificationHandler *)&v3 init];
}

- (void).cxx_destruct
{
}

@end