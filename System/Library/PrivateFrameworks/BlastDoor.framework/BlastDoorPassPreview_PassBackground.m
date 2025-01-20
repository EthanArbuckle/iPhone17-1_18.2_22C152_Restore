@interface BlastDoorPassPreview_PassBackground
- (BlastDoorColor)color;
- (BlastDoorPassPreview_PassBackground)init;
- (BlastDoorPassPreview_PassImage)image;
- (NSString)description;
@end

@implementation BlastDoorPassPreview_PassBackground

- (NSString)description
{
  sub_1B16CFB50((char *)self + OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground, __dst);
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorPassPreview_PassImage)image
{
  v2 = self;
  id v3 = sub_1B17AB058();

  return (BlastDoorPassPreview_PassImage *)v3;
}

- (BlastDoorColor)color
{
  long long v9 = *(_OWORD *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 432];
  uint64_t v2 = *(void *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 448];
  uint64_t v3 = *(void *)&self->passPreview_PassBackground[OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground
                                                  + 456];
  v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v9;
  *((void *)v6 + 2) = v2;
  *((void *)v6 + 3) = v3;
  v10.receiver = v5;
  v10.super_class = v4;
  v7 = [(BlastDoorPassPreview_PassBackground *)&v10 init];
  return (BlastDoorColor *)v7;
}

- (BlastDoorPassPreview_PassBackground)init
{
  result = (BlastDoorPassPreview_PassBackground *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B16CFB88((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___BlastDoorPassPreview_PassBackground_passPreview_PassBackground));
}

@end