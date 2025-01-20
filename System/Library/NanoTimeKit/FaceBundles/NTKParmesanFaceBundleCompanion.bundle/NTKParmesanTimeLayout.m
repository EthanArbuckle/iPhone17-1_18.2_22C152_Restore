@interface NTKParmesanTimeLayout
+ (NSArray)allLayouts;
+ (NSArray)allTimeScales;
+ (NTKParmesanTimeLayout)default;
+ (void)setDefault:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedTimeRectWithoutComplications;
- (NSString)description;
- (NSString)localizedAlignmentDisplayString;
- (NSString)localizedScaleDisplayString;
- (NSString)swatchIdentifier;
- (NTKParmesanTimeLayout)init;
- (NTKParmesanTimeLayout)initWithAlignment:(int64_t)a3 scale:(int64_t)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)_complicationAlignment;
- (int64_t)alignment;
- (int64_t)hash;
- (int64_t)scale;
- (int64_t)textAlignment;
- (unint64_t)pfcTimePosition;
- (void)setAlignment:(int64_t)a3;
- (void)setScale:(int64_t)a3;
@end

@implementation NTKParmesanTimeLayout

- (int64_t)_complicationAlignment
{
  uint64_t v5 = objc_msgSend_scale(self, a2, v2, v3);
  if (v5 == 3)
  {
    if (objc_msgSend_alignment(self, v6, v7, v8)) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    return v5 != 2 && v5 != 1;
  }
}

+ (NTKParmesanTimeLayout)default
{
  if (qword_2691D62B8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_2691E0068;

  return (NTKParmesanTimeLayout *)v2;
}

+ (void)setDefault:(id)a3
{
  uint64_t v3 = qword_2691D62B8;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_2691E0068;
  qword_2691E0068 = (uint64_t)v4;
}

+ (NSArray)allTimeScales
{
  sub_246BB2F4C();
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D7120);
  uint64_t v2 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (NSArray)allLayouts
{
  sub_246BB30D4();
  type metadata accessor for ParmesanTimeLayout();
  uint64_t v2 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (int64_t)alignment
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_alignment);
}

- (void)setAlignment:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_alignment) = (Class)a3;
}

- (int64_t)scale
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_scale);
}

- (void)setScale:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_scale) = (Class)a3;
}

- (NTKParmesanTimeLayout)initWithAlignment:(int64_t)a3 scale:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_alignment) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_scale) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ParmesanTimeLayout();
  return [(NTKParmesanTimeLayout *)&v5 init];
}

- (int64_t)textAlignment
{
  uint64_t v2 = self;
  int64_t v3 = sub_246BB1804();

  return v3;
}

- (CGRect)normalizedTimeRectWithoutComplications
{
  uint64_t v2 = self;
  sub_246BB1884();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)description
{
  return (NSString *)sub_246BB1D30(self, (uint64_t)a2, (void (*)(void))sub_246BB19B0);
}

- (NSString)swatchIdentifier
{
  return (NSString *)sub_246BB1D30(self, (uint64_t)a2, (void (*)(void))sub_246BB1B50);
}

- (NSString)localizedScaleDisplayString
{
  sub_246BB1104(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_scale));
  uint64_t v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)localizedAlignmentDisplayString
{
  return (NSString *)sub_246BB1D30(self, (uint64_t)a2, (void (*)(void))sub_246BB1DA0);
}

- (NTKParmesanTimeLayout)init
{
  CGRect result = (NTKParmesanTimeLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    double v5 = self;
  }
  BOOL v6 = sub_246BB247C((uint64_t)v8);

  sub_246BAD92C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  return sub_246C2D6A8();
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_alignment);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTimeLayout_scale);
  double v5 = (objc_class *)type metadata accessor for ParmesanTimeLayout();
  BOOL v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR___NTKParmesanTimeLayout_alignment] = v3;
  *(void *)&v6[OBJC_IVAR___NTKParmesanTimeLayout_scale] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  return [(NTKParmesanTimeLayout *)&v8 init];
}

- (unint64_t)pfcTimePosition
{
  return sub_246BB2A78();
}

@end