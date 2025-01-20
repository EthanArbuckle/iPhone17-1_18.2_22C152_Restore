@interface GMOptInStatusProvider
- (BOOL)userOptInStatus;
- (_TtC24AssistantSettingsSupport21GMOptInStatusProvider)init;
- (void)setUserOptInStatus:(BOOL)a3;
@end

@implementation GMOptInStatusProvider

- (BOOL)userOptInStatus
{
  sub_220C748B0();
  v3 = self;
  v4 = (void *)MEMORY[0x223C70E10]();
  char v5 = sub_220C74880();

  return v5 & 1;
}

- (void)setUserOptInStatus:(BOOL)a3
{
  sub_220C748B0();
  v4 = self;
  id v5 = (id)MEMORY[0x223C70E10]();
  sub_220C74890();
}

- (_TtC24AssistantSettingsSupport21GMOptInStatusProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return [(GMOptInStatusProvider *)&v3 init];
}

@end