@interface NTKEsterbrookScenePalette
+ (NTKEsterbrookScenePalette)tritium;
+ (id)interpolateWithStart:(id)a3 end:(id)a4 fraction:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NTKEsterbrookScenePalette)init;
- (NTKEsterbrookScenePalette)initWithColorPalette:(id)a3;
- (UIColor)background;
- (UIColor)overlay;
- (UIColor)secondHand;
@end

@implementation NTKEsterbrookScenePalette

- (UIColor)background
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___NTKEsterbrookScenePalette_background));
}

- (UIColor)overlay
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___NTKEsterbrookScenePalette_overlay));
}

- (UIColor)secondHand
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___NTKEsterbrookScenePalette_secondHand));
}

+ (NTKEsterbrookScenePalette)tritium
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.156862745, 0.156862745, 0.156862745, 1.0);
  v3 = self;
  id v4 = objc_msgSend(v3, sel_blackColor);
  id v5 = objc_msgSend(v3, sel_blackColor);
  v6 = (objc_class *)type metadata accessor for ScenePalette();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_background] = v2;
  *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_overlay] = v4;
  *(void *)&v7[OBJC_IVAR___NTKEsterbrookScenePalette_secondHand] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);

  return (NTKEsterbrookScenePalette *)v8;
}

- (NTKEsterbrookScenePalette)initWithColorPalette:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  v6 = (objc_class *)objc_msgSend(a3, sel_background);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___NTKEsterbrookScenePalette_background) = v6;
  v7 = (objc_class *)objc_msgSend(a3, sel_overlay);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___NTKEsterbrookScenePalette_overlay) = v7;
  id v8 = (objc_class *)objc_msgSend(a3, sel_secondHand);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___NTKEsterbrookScenePalette_secondHand) = v8;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for ScenePalette();
  v9 = [(NTKEsterbrookScenePalette *)&v11 init];
  swift_unknownObjectRelease();
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_246AD8DC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  unsigned __int8 v6 = sub_246AD5A0C((uint64_t)v8);

  sub_246AD5CFC((uint64_t)v8);
  return v6 & 1;
}

- (NTKEsterbrookScenePalette)init
{
  result = (NTKEsterbrookScenePalette *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookScenePalette_secondHand);
}

+ (id)interpolateWithStart:(id)a3 end:(id)a4 fraction:(double)a5
{
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_246AD56FC();

  return v9;
}

@end