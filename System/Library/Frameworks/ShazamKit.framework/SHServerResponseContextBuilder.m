@interface SHServerResponseContextBuilder
- (void)loadContextForClientIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SHServerResponseContextBuilder

- (void)loadContextForClientIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_group_create();
  v8 = dispatch_queue_create("com.apple.ShazamKit.serverResponseContextBuilder.dispatch", 0);
  v9 = objc_alloc_init(SHServerResponseContext);
  if (v7)
  {
    dispatch_group_enter(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001299C;
    block[3] = &unk_100074FC0;
    v10 = v9;
    v23 = v10;
    v11 = v7;
    v24 = v11;
    dispatch_async(v8, block);
    dispatch_group_enter(v11);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100012AE8;
    v18[3] = &unk_100074F98;
    v12 = v10;
    v19 = v12;
    id v20 = v5;
    v13 = v11;
    v21 = v13;
    dispatch_async(v8, v18);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100012C3C;
    v15[3] = &unk_100075088;
    id v17 = v6;
    v16 = v12;
    dispatch_group_notify(v13, v8, v15);
  }
  else
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create dispatch group while loading context", buf, 2u);
    }

    (*((void (**)(id, SHServerResponseContext *))v6 + 2))(v6, v9);
  }
}

@end