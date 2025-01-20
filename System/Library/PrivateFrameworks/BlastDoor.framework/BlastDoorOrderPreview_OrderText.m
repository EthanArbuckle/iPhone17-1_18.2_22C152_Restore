@interface BlastDoorOrderPreview_OrderText
- (BlastDoorColor)overrideColor;
- (BlastDoorOrderPreview_OrderText)init;
- (NSString)description;
- (NSString)text;
@end

@implementation BlastDoorOrderPreview_OrderText

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

- (BlastDoorColor)overrideColor
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText;
  if (self->orderPreview_OrderText[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText + 40])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v5 = *((void *)v2 + 4);
    uint64_t v4 = *((void *)v2 + 5);
    long long v10 = *((_OWORD *)v2 + 1);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((void *)v8 + 2) = v5;
    *((void *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    v3 = [(BlastDoorOrderPreview_OrderText *)&v11 init];
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorOrderPreview_OrderText)init
{
  result = (BlastDoorOrderPreview_OrderText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end