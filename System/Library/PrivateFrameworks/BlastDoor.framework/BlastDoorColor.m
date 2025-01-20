@interface BlastDoorColor
- (BlastDoorColor)init;
- (NSString)description;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
@end

@implementation BlastDoorColor

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)red
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorColor_color);
}

- (double)green
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color];
}

- (double)blue
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color + 8];
}

- (double)alpha
{
  return *(double *)&self->color[OBJC_IVAR___BlastDoorColor_color + 16];
}

- (BlastDoorColor)init
{
  result = (BlastDoorColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end