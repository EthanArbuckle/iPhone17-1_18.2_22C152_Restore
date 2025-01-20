@interface CHUISMutableControlInstanceConfiguration
- (CHUISMutableControlInstanceConfiguration)init;
- (id)copyWithZone:(void *)a3;
- (void)setCanAppearInSecureEnvironment:(BOOL)a3;
- (void)setLaunchOrigin:(id)a3;
- (void)setPreferredColorScheme:(unint64_t)a3;
- (void)setSupportsLowLuminance:(BOOL)a3;
@end

@implementation CHUISMutableControlInstanceConfiguration

- (CHUISMutableControlInstanceConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHUISMutableControlInstanceConfiguration;
  return [(CHUISControlInstanceConfiguration *)&v3 init];
}

- (id)copyWithZone:(void *)a3
{
  char v4 = *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  char v5 = *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  uint64_t v6 = *(void *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  unsigned __int8 v7 = self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8];
  uint64_t v9 = *(void *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16];
  uint64_t v8 = *(void *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24];
  id v10 = objc_allocWithZone((Class)CHUISControlInstanceConfiguration);
  swift_bridgeObjectRetain();
  v11 = self;
  v12 = (char *)objc_msgSend(v10, sel_init);
  v13 = &v12[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  char *v13 = v4;
  v13[1] = v5;
  *((void *)v13 + 1) = v6;
  v13[16] = v7;
  *((void *)v13 + 3) = v9;
  *((void *)v13 + 4) = v8;

  swift_bridgeObjectRelease();
  return v12;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration) = a3;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1) = a3;
}

- (void)setPreferredColorScheme:(unint64_t)a3
{
  objc_super v3 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *((void *)v3 + 1) = a3;
  v3[16] = a3 == 0;
}

- (void)setLaunchOrigin:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BC4888A8();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *((void *)v6 + 3) = v4;
  *((void *)v6 + 4) = v5;

  swift_bridgeObjectRelease();
}

@end