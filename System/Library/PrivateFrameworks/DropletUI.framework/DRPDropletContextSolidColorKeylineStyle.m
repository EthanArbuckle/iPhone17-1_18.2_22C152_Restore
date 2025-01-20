@interface DRPDropletContextSolidColorKeylineStyle
- (BOOL)isEqual:(id)a3;
- (DRPDropletContextSolidColorKeylineStyle)init;
- (DRPDropletContextSolidColorKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 color:(id)a7;
- (DRPDropletContextSolidColorKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 normalizedStartLocation:(double)a7 normalizedStopLocation:(double)a8 color:(id)a9;
- (DRPDropletContextSolidColorKeylineStyle)initWithWidth:(double)a3 boundaryFadeLength:(double)a4 color:(id)a5;
- (NSString)debugDescription;
- (NSString)description;
- (UIColor)color;
- (UIEdgeInsets)keylineFadeLengths;
- (UIEdgeInsets)keylineOutsets;
- (double)innerWidth;
- (double)normalizedStartLocation;
- (double)normalizedStopLocation;
- (double)outerWidth;
- (id)copy;
- (void)setColor:(id)a3;
- (void)setInnerWidth:(double)a3;
- (void)setKeylineFadeLengths:(UIEdgeInsets)a3;
- (void)setKeylineOutsets:(UIEdgeInsets)a3;
- (void)setNormalizedStartLocation:(double)a3;
- (void)setNormalizedStopLocation:(double)a3;
- (void)setOuterWidth:(double)a3;
@end

@implementation DRPDropletContextSolidColorKeylineStyle

- (double)innerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setInnerWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)outerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setOuterWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (UIEdgeInsets)keylineOutsets
{
  double v2 = sub_24D131D18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineOutsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)keylineFadeLengths
{
  double v2 = sub_24D131D18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineFadeLengths:(UIEdgeInsets)a3
{
}

- (double)normalizedStartLocation
{
  double v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStartLocation:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)normalizedStopLocation
{
  double v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStopLocation:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  double *v4 = a3;
}

- (UIColor)color
{
  double v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setColor:(id)a3
{
  double v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color);
  swift_beginAccess();
  double v5 = *v4;
  double *v4 = a3;
  id v6 = a3;
}

- (DRPDropletContextSolidColorKeylineStyle)initWithWidth:(double)a3 boundaryFadeLength:(double)a4 color:(id)a5
{
  return -[DRPDropletContextSolidColorKeylineStyle initWithInnerWidth:outerWidth:keylineOutsets:keylineFadeLengths:color:](self, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_color_, a5, 0.0, a3, -(a3 + a4), -(a3 + a4), -(a3 + a4), -(a3 + a4), *(void *)&a4, *(void *)&a4, *(void *)&a4, *(void *)&a4);
}

- (DRPDropletContextSolidColorKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 color:(id)a7
{
  return -[DRPDropletContextSolidColorKeylineStyle initWithInnerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:color:](self, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_color_, a7, a3, a4, a5.top, a5.left, a5.bottom, a5.right, *(void *)&a6.top, *(void *)&a6.left, *(void *)&a6.bottom, *(void *)&a6.right, 0, 0x3FF0000000000000);
}

- (DRPDropletContextSolidColorKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 normalizedStartLocation:(double)a7 normalizedStopLocation:(double)a8 color:(id)a9
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_innerWidth) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_outerWidth) = a4;
  *(UIEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineOutsets) = a5;
  *(UIEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_keylineFadeLengths) = a6;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStartLocation) = a7;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_normalizedStopLocation) = a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextSolidColorKeylineStyle_color) = (Class)a9;
  v11.receiver = self;
  v11.super_class = (Class)DRPDropletContextSolidColorKeylineStyle;
  id v9 = a9;
  return [(DRPDropletContextSolidColorKeylineStyle *)&v11 init];
}

- (BOOL)isEqual:(id)a3
{
  return sub_24D132A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DRPDropletContextSolidColorKeylineStyle.isEqual(_:));
}

- (id)copy
{
  return (id)sub_24D132D24(self, (uint64_t)a2, (void (*)(void *__return_ptr))DRPDropletContextSolidColorKeylineStyle.copy());
}

- (NSString)description
{
  return (NSString *)sub_24D1334B8(self, (uint64_t)a2, (void (*)(void))sub_24D12F550);
}

- (NSString)debugDescription
{
  return (NSString *)sub_24D1334B8(self, (uint64_t)a2, (void (*)(void))sub_24D12F550);
}

- (DRPDropletContextSolidColorKeylineStyle)init
{
  UIEdgeInsets result = (DRPDropletContextSolidColorKeylineStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end