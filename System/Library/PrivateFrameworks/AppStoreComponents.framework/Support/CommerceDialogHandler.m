@interface CommerceDialogHandler
- (_TtC19appstorecomponentsd21CommerceDialogHandler)init;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation CommerceDialogHandler

- (_TtC19appstorecomponentsd21CommerceDialogHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = [(CommerceDialogHandler *)&v7 init];
  v3 = self;
  v4 = v2;
  id v5 = [v3 defaultCenter];
  [v5 setDialogObserver:v4];

  return v4;
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = objc_allocWithZone((Class)AMSAuthenticateTask);
  id v9 = a3;
  v10 = self;
  id v11 = [v8 initWithRequest:v9];
  id v12 = [v11 performAuthentication];
  v14[4] = sub_1000B685C;
  v14[5] = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1000B6488;
  v14[3] = &unk_1001872C0;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v12 addFinishBlock:v13];
  _Block_release(v13);

  swift_release();
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = objc_allocWithZone((Class)AMSSystemAlertDialogTask);
  id v9 = a3;
  v10 = self;
  id v11 = [v8 initWithRequest:v9];
  id v12 = [v11 present];
  v14[4] = sub_1000B6828;
  v14[5] = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1000B6488;
  v14[3] = &unk_100187270;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [v12 addFinishBlock:v13];
  _Block_release(v13);

  swift_release();
}

@end