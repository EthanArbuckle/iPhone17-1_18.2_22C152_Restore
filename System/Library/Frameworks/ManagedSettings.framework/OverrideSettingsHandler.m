@interface OverrideSettingsHandler
- (_TtC15ManagedSettings23OverrideSettingsHandler)init;
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation OverrideSettingsHandler

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BC9B20CC(v4);
}

- (_TtC15ManagedSettings23OverrideSettingsHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OverrideSettingsHandler();
  return [(OverrideSettingsHandler *)&v3 init];
}

@end