@interface CHUISControlInstanceConfiguration
- (BOOL)canAppearInSecureEnvironment;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLowLuminance;
- (CHUISControlInstanceConfiguration)init;
- (NSString)description;
- (id)launchOrigin;
- (id)mutableCopyWithZone:(void *)a3;
- (int64_t)hash;
- (unint64_t)preferredColorScheme;
@end

@implementation CHUISControlInstanceConfiguration

- (BOOL)canAppearInSecureEnvironment
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
}

- (BOOL)supportsLowLuminance
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
}

- (unint64_t)preferredColorScheme
{
  if (self->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8]) {
    return 0;
  }
  else {
    return *(void *)&self->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  }
}

- (CHUISControlInstanceConfiguration)init
{
  v2 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *(_WORD *)v2 = 0;
  *((void *)v2 + 1) = 0;
  v2[16] = 1;
  *((void *)v2 + 3) = 0;
  *((void *)v2 + 4) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CHUISControlInstanceConfiguration;
  return [(CHUISControlInstanceConfiguration *)&v4 init];
}

- (id)mutableCopyWithZone:(void *)a3
{
  id v4 = objc_allocWithZone((Class)CHUISMutableControlInstanceConfiguration);
  v5 = self;
  v6 = (char *)objc_msgSend(v4, sel_init);
  char v7 = *((unsigned char *)&v5->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  uint64_t v8 = *(void *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  unsigned __int8 v9 = v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8];
  uint64_t v11 = *(void *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16];
  uint64_t v10 = *(void *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24];
  v12 = &v6[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  char *v12 = *((unsigned char *)&v5->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  v12[1] = v7;
  *((void *)v12 + 1) = v8;
  v12[16] = v9;
  *((void *)v12 + 3) = v11;
  *((void *)v12 + 4) = v10;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1BC488CD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CHUISControlInstanceConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1BC418FE4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  sub_1BC489088();
  swift_bridgeObjectRetain();
  v3 = self;
  ControlInstanceConfiguration.hash(into:)();
  int64_t v4 = sub_1BC4890C8();

  swift_bridgeObjectRelease();
  return v4;
}

- (NSString)description
{
  v2 = self;
  CHUISControlInstanceConfiguration.description.getter();

  v3 = (void *)sub_1BC488898();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

- (id)launchOrigin
{
  if (*(void *)(a1 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 32))
  {
    swift_bridgeObjectRetain();
    v1 = (void *)sub_1BC488898();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end