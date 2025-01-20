@interface BlastDoorPassPreview
- (BlastDoorColor)backgroundColor;
- (BlastDoorPassPreview)init;
- (BlastDoorPassPreview_PassBackground)background;
- (BlastDoorPassPreview_PassImage)headerImage;
- (BlastDoorPassPreview_PassImage)icon;
- (BlastDoorPassPreview_PassText)primaryText;
- (BlastDoorPassPreview_PassText)secondaryText;
- (BlastDoorPassPreview_PassText)tertiaryText;
- (NSString)description;
@end

@implementation BlastDoorPassPreview

- (NSString)description
{
  sub_1B16D0E4C((char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview, __dst);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorPassPreview_PassImage)headerImage
{
  v2 = self;
  id v3 = sub_1B1793698();

  return (BlastDoorPassPreview_PassImage *)v3;
}

- (BlastDoorPassPreview_PassImage)icon
{
  v2 = self;
  id v3 = sub_1B1793830();

  return (BlastDoorPassPreview_PassImage *)v3;
}

- (BlastDoorPassPreview_PassBackground)background
{
  sub_1B16CFB50((char *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 872], (char *)__dst);
  id v3 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassBackgroundWrapper();
  v4 = (char *)objc_allocWithZone(v3);
  sub_1B16CFB50((char *)__dst, &v4[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground]);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = [(BlastDoorPassPreview *)&v8 init];
  sub_1B16CFB88(__dst);

  return (BlastDoorPassPreview_PassBackground *)v6;
}

- (BlastDoorPassPreview_PassText)primaryText
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  uint64_t v3 = *(void *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1352];
  if (v3)
  {
    uint64_t v4 = *((void *)v2 + 174);
    uint64_t v5 = *((void *)v2 + 173);
    long long v12 = *(_OWORD *)(v2 + 1368);
    uint64_t v6 = *((void *)v2 + 169);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    objc_super v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(void *)v9 = v6;
    *((void *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((void *)v9 + 4) = v5;
    *((void *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = [(BlastDoorPassPreview *)&v13 init];
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorPassPreview_PassText)secondaryText
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  uint64_t v3 = *(void *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1400];
  if (v3)
  {
    uint64_t v4 = *((void *)v2 + 180);
    uint64_t v5 = *((void *)v2 + 179);
    long long v12 = *(_OWORD *)(v2 + 1416);
    uint64_t v6 = *((void *)v2 + 175);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    objc_super v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(void *)v9 = v6;
    *((void *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((void *)v9 + 4) = v5;
    *((void *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = [(BlastDoorPassPreview *)&v13 init];
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorPassPreview_PassText)tertiaryText
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview;
  uint64_t v3 = *(void *)&self->passPreview[OBJC_IVAR___BlastDoorPassPreview_passPreview + 1448];
  if (v3)
  {
    uint64_t v4 = *((void *)v2 + 186);
    uint64_t v5 = *((void *)v2 + 185);
    long long v12 = *(_OWORD *)(v2 + 1464);
    uint64_t v6 = *((void *)v2 + 181);
    v7 = (objc_class *)type metadata accessor for _ObjCPassPreview_PassTextWrapper();
    objc_super v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR___BlastDoorPassPreview_PassText_passPreview_PassText];
    *(void *)v9 = v6;
    *((void *)v9 + 1) = v3;
    *((_OWORD *)v9 + 1) = v12;
    *((void *)v9 + 4) = v5;
    *((void *)v9 + 5) = v4;
    v13.receiver = v8;
    v13.super_class = v7;
    swift_bridgeObjectRetain();
    v10 = [(BlastDoorPassPreview *)&v13 init];
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorPassPreview_PassText *)v10;
}

- (BlastDoorColor)backgroundColor
{
  sub_1B16D0E4C((char *)self + OBJC_IVAR___BlastDoorPassPreview_passPreview, (char *)__dst);
  long long v11 = v14;
  uint64_t v3 = v15;
  uint64_t v4 = v16;
  uint64_t v5 = self;
  sub_1B16D0E84(__dst);
  uint64_t v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  objc_super v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)objc_super v8 = v11;
  *((void *)v8 + 2) = v3;
  *((void *)v8 + 3) = v4;
  v12.receiver = v7;
  v12.super_class = v6;
  v9 = [(BlastDoorPassPreview *)&v12 init];

  return (BlastDoorColor *)v9;
}

- (BlastDoorPassPreview)init
{
  result = (BlastDoorPassPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end