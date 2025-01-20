@interface LocalSceneExtension
+ (id)clientComponents;
+ (id)hostComponents;
+ (id)settingsExtensions;
- (_TtC12DrawingBoard19LocalSceneExtension)init;
@end

@implementation LocalSceneExtension

+ (id)settingsExtensions
{
  return sub_24CFAC4CC((uint64_t)a1, (uint64_t)a2, 0, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneSettingsExtension);
}

+ (id)hostComponents
{
  return sub_24CFAC4CC((uint64_t)a1, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneExtension.HostComponent);
}

+ (id)clientComponents
{
  return sub_24CFAC4CC((uint64_t)a1, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneExtension.ClientComponent);
}

- (_TtC12DrawingBoard19LocalSceneExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LocalSceneExtension *)&v3 init];
}

@end