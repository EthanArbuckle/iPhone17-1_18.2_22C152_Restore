@interface BlastDoorOrderPreview
- (BlastDoorColor)backgroundColor;
- (BlastDoorOrderPreview)init;
- (BlastDoorOrderPreview_OrderImage)headerImage;
- (BlastDoorOrderPreview_OrderText)primaryText;
- (BlastDoorOrderPreview_OrderText)secondaryText;
- (BlastDoorOrderPreview_OrderText)tertiaryText;
- (NSString)description;
@end

@implementation BlastDoorOrderPreview

- (NSString)description
{
  sub_1B15605D0((char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview, v4);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorOrderPreview_OrderImage)headerImage
{
  v2 = self;
  id v3 = sub_1B1792BE0();

  return (BlastDoorOrderPreview_OrderImage *)v3;
}

- (BlastDoorColor)backgroundColor
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  if (self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 472])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *((void *)v2 + 58);
    uint64_t v4 = *((void *)v2 + 59);
    long long v10 = *((_OWORD *)v2 + 28);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((void *)v8 + 2) = v5;
    *((void *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    id v3 = [(BlastDoorOrderPreview *)&v11 init];
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorOrderPreview_OrderText)primaryText
{
  uint64_t v3 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 480];
  uint64_t v2 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 488];
  long long v12 = *(_OWORD *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 496];
  uint64_t v4 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 512];
  uint64_t v5 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 520];
  unsigned __int8 v6 = self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 528];
  v7 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
  *(void *)v9 = v3;
  *((void *)v9 + 1) = v2;
  *((_OWORD *)v9 + 1) = v12;
  *((void *)v9 + 4) = v4;
  *((void *)v9 + 5) = v5;
  v9[48] = v6;
  v13.receiver = v8;
  v13.super_class = v7;
  swift_bridgeObjectRetain();
  long long v10 = [(BlastDoorOrderPreview *)&v13 init];
  return (BlastDoorOrderPreview_OrderText *)v10;
}

- (BlastDoorOrderPreview_OrderText)secondaryText
{
  uint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  uint64_t v3 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 544];
  if (v3)
  {
    char v4 = v2[592];
    uint64_t v5 = *((void *)v2 + 73);
    uint64_t v6 = *((void *)v2 + 72);
    long long v13 = *((_OWORD *)v2 + 35);
    uint64_t v7 = *((void *)v2 + 68);
    v8 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    long long v10 = &v9[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
    *(void *)long long v10 = v7;
    *((void *)v10 + 1) = v3;
    *((_OWORD *)v10 + 1) = v13;
    *((void *)v10 + 4) = v6;
    *((void *)v10 + 5) = v5;
    v10[48] = v4 & 1;
    v14.receiver = v9;
    v14.super_class = v8;
    swift_bridgeObjectRetain();
    objc_super v11 = [(BlastDoorOrderPreview *)&v14 init];
  }
  else
  {
    objc_super v11 = 0;
  }
  return (BlastDoorOrderPreview_OrderText *)v11;
}

- (BlastDoorOrderPreview_OrderText)tertiaryText
{
  uint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorOrderPreview_orderPreview;
  uint64_t v3 = *(void *)&self->orderPreview[OBJC_IVAR___BlastDoorOrderPreview_orderPreview + 600];
  if (v3)
  {
    char v4 = v2[648];
    uint64_t v5 = *((void *)v2 + 80);
    uint64_t v6 = *((void *)v2 + 79);
    long long v13 = *(_OWORD *)(v2 + 616);
    uint64_t v7 = *((void *)v2 + 75);
    v8 = (objc_class *)type metadata accessor for _ObjCOrderPreview_OrderTextWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    long long v10 = &v9[OBJC_IVAR___BlastDoorOrderPreview_OrderText_orderPreview_OrderText];
    *(void *)long long v10 = v7;
    *((void *)v10 + 1) = v3;
    *((_OWORD *)v10 + 1) = v13;
    *((void *)v10 + 4) = v6;
    *((void *)v10 + 5) = v5;
    v10[48] = v4 & 1;
    v14.receiver = v9;
    v14.super_class = v8;
    swift_bridgeObjectRetain();
    objc_super v11 = [(BlastDoorOrderPreview *)&v14 init];
  }
  else
  {
    objc_super v11 = 0;
  }
  return (BlastDoorOrderPreview_OrderText *)v11;
}

- (BlastDoorOrderPreview)init
{
  result = (BlastDoorOrderPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end