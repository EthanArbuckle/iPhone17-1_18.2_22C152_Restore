@interface BlastDoorPassPreview_PassText
- (BlastDoorColor)color;
- (BlastDoorPassPreview_PassText)init;
- (NSString)description;
- (NSString)text;
@end

@implementation BlastDoorPassPreview_PassText

- (NSString)description
{
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)text
{
  return (NSString *)sub_1B17AA7A8();
}

- (BlastDoorColor)color
{
  long long v9 = *(_OWORD *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 8];
  uint64_t v2 = *(void *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 24];
  uint64_t v3 = *(void *)&self->passPreview_PassText[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText + 32];
  v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v9;
  *((void *)v6 + 2) = v2;
  *((void *)v6 + 3) = v3;
  v10.receiver = v5;
  v10.super_class = v4;
  v7 = [(BlastDoorPassPreview_PassText *)&v10 init];
  return (BlastDoorColor *)v7;
}

- (BlastDoorPassPreview_PassText)init
{
  result = (BlastDoorPassPreview_PassText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end