@interface ExternalAIModelSettings
+ (BOOL)available;
+ (Class)controllerClass;
- (_TtC24AssistantSettingsSupport23ExternalAIModelSettings)init;
@end

@implementation ExternalAIModelSettings

+ (BOOL)available
{
  return sub_220C748E0() & 1;
}

+ (Class)controllerClass
{
  sub_220C748F0();
  if ((sub_220C748E0() & 1) == 0) {
    return 0;
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC24AssistantSettingsSupport23ExternalAIModelSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExternalAIModelSettings();
  return [(ExternalAIModelSettings *)&v3 init];
}

@end