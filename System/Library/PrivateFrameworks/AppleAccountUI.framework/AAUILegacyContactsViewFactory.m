@interface AAUILegacyContactsViewFactory
+ (id)createViewModelWithAccountManager:(id)a3;
+ (id)createViewModelWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4;
+ (id)createWithViewModel:(id)a3;
- (AAUILegacyContactsViewFactory)init;
@end

@implementation AAUILegacyContactsViewFactory

+ (id)createWithViewModel:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = sub_20988C0BC(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = sub_20988C71C(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = a4;
  uint64_t v8 = sub_2098BF368();
  uint64_t v9 = v6;
  swift_getObjCClassMetadata();
  id v12 = sub_20988CBD4(a3, v8, v9);
  swift_bridgeObjectRelease();

  return v12;
}

- (AAUILegacyContactsViewFactory)init
{
  return (AAUILegacyContactsViewFactory *)LegacyContactsViewFactory.init()();
}

@end