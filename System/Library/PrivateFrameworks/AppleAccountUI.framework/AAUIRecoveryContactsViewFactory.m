@interface AAUIRecoveryContactsViewFactory
+ (id)createViewModelWithAccountManager:(id)a3;
+ (id)createWithViewModel:(id)a3;
- (AAUIRecoveryContactsViewFactory)init;
@end

@implementation AAUIRecoveryContactsViewFactory

+ (id)createWithViewModel:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = sub_2097E2C7C(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = sub_2097E32DC(a3);

  return v6;
}

- (AAUIRecoveryContactsViewFactory)init
{
  return (AAUIRecoveryContactsViewFactory *)RecoveryContactsViewFactory.init()();
}

@end