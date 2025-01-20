@interface DetailViewWrapper
+ (id)hostingControllerWithApplicationBundleID:(id)a3;
- (_TtC17StorageSettingsUI17DetailViewWrapper)init;
@end

@implementation DetailViewWrapper

+ (id)hostingControllerWithApplicationBundleID:(id)a3
{
  uint64_t v3 = sub_76C10();
  v5 = (void *)sub_691A0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC17StorageSettingsUI17DetailViewWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DetailViewWrapper();
  return [(DetailViewWrapper *)&v3 init];
}

@end