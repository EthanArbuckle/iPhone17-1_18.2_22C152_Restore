@interface LocalSceneSettingsExtension
+ (id)protocol;
- (_TtC12DrawingBoard27LocalSceneSettingsExtension)init;
@end

@implementation LocalSceneSettingsExtension

+ (id)protocol
{
  return &unk_26FF69678;
}

- (_TtC12DrawingBoard27LocalSceneSettingsExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(LocalSceneSettingsExtension *)&v3 init];
}

@end