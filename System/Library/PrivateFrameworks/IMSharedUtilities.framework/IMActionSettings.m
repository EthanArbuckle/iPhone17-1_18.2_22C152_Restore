@interface IMActionSettings
- (IMActionSettings)init;
- (IMActionSettings)initWithDictionary:(id)a3;
- (IMActionSettings)initWithType:(int64_t)a3;
- (id)dictionaryRepresentation;
- (int64_t)type;
@end

@implementation IMActionSettings

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMActionSettings_type);
}

- (IMActionSettings)initWithType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionSettings_type) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)IMActionSettings;
  return [(IMActionSettings *)&v4 init];
}

- (IMActionSettings)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionSettings *)IMActionSettings.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = 1701869940;
  *(void *)(inited + 40) = 0xE400000000000000;
  objc_super v4 = self;
  int64_t v5 = [(IMActionSettings *)v4 type];
  *(void *)(inited + 72) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 48) = v5;
  sub_1A08D7480(inited);

  v6 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v6;
}

- (IMActionSettings)init
{
  result = (IMActionSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end