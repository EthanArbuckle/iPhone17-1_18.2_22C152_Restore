@interface StoreKitExternalNotificationPresentationTask
- (void)mainWithCompletionHandler:(id)a3;
- (void)processMessageActions:(NSArray *)a3 with:(id)a4 completionHandler:;
@end

@implementation StoreKitExternalNotificationPresentationTask

- (void)processMessageActions:(NSArray *)a3 with:(id)a4 completionHandler:
{
  v5 = v4;
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(v5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = v12;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A3BF0;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1005A35A0;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A4930, (uint64_t)v17);
  swift_release();
}

- (void)mainWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(&self->super._finished + 1);
    if (v6)
    {
      v7 = (void *)v6[2];
      v6 = (void *)v6[3];
    }
    else
    {
      v7 = 0;
    }
    v8 = v6;
    id v9 = v7;
    uint64_t v10 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138412546;
    v34 = v7;
    __int16 v35 = 2114;
    v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Running external notification sheet task for %{public}@", buf, 0x16u);
  }
  v11 = *(void **)(&self->super._finished + 1);
  if (v11) {
    v11 = (void *)v11[2];
  }
  v12 = v11;
  id v13 = objc_alloc((Class)AMSEngagementPlacementInfo);
  uint64_t v14 = *(void *)(&self->super._finished + 1);
  if (v14) {
    uint64_t v15 = *(void *)(v14 + 8);
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = [v13 initWithPlacement:@"ThirdPartyPurchaseAppLaunch" context:v15];
  id v17 = objc_alloc((Class)AMSEngagementMessageEvent);
  id v32 = v16;
  v18 = +[NSArray arrayWithObjects:&v32 count:1];
  id v19 = [v17 initWithServiceType:@"appstored" placementInfo:v18];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1002064EC;
  v30[3] = &unk_100521C18;
  v30[4] = self;
  id v31 = v4;
  id v20 = v4;
  v21 = objc_retainBlock(v30);
  v22 = objc_opt_new();
  v23 = [v22 enqueueMessageEvent:v19];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100206768;
  v26[3] = &unk_100521C68;
  v28 = self;
  id v29 = v21;
  id v27 = v12;
  v24 = v21;
  v25 = v12;
  [v23 addFinishBlock:v26];
}

- (void).cxx_destruct
{
}

@end