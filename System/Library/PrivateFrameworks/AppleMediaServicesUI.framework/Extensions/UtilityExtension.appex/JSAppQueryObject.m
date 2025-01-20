@interface JSAppQueryObject
- (_TtC16UtilityExtension16JSAppQueryObject)init;
- (id)queryAlmondApps;
- (id)queryBundleIds:(id)a3;
- (id)queryStoreIds:(id)a3;
@end

@implementation JSAppQueryObject

- (id)queryAlmondApps
{
  v2 = self;
  v3 = (void *)sub_100012D78();

  return v3;
}

- (id)queryBundleIds:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100012F34();

  return v6;
}

- (id)queryStoreIds:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100013974();

  return v6;
}

- (_TtC16UtilityExtension16JSAppQueryObject)init
{
  return (_TtC16UtilityExtension16JSAppQueryObject *)sub_100014EF4();
}

@end