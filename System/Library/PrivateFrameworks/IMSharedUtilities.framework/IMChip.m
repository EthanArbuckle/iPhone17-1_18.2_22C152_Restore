@interface IMChip
+ (id)chipWithType:(int64_t)a3 dictionary:(id)a4;
- (BOOL)isEqual:(id)a3;
- (IMAttributableContent)chip;
- (IMChip)init;
- (IMChip)initWithDictionary:(id)a3;
- (IMChip)initWithType:(int64_t)a3 chip:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)type;
@end

@implementation IMChip

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMChip_type);
}

- (IMAttributableContent)chip
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IMAttributableContent *)v2;
}

- (IMChip)initWithType:(int64_t)a3 chip:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChip_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChip_chip) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)IMChip;
  swift_unknownObjectRetain();
  return [(IMChip *)&v5 init];
}

- (IMChip)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMChip *)IMChip.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A096C074();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)chipWithType:(int64_t)a3 dictionary:(id)a4
{
  if (a4) {
    objc_super v5 = (void *)sub_1A09F3D08();
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = sub_1A096C4B0(a3, v5);
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  BOOL v6 = IMChip.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6;
}

- (IMChip)init
{
  result = (IMChip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end