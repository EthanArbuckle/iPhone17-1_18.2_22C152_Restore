@interface AudiogramGraphDetectorResult
+ (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)defaultResult;
- (CGRect)box;
- (CGRect)scaledBoxWithSize:(CGSize)a3;
- (NSString)description;
- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)init;
- (void)setBox:(CGRect)a3;
@end

@implementation AudiogramGraphDetectorResult

- (CGRect)box
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setBox:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramGraphDetectorResult_box);
  swift_beginAccess();
  CGFloat *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (NSString)description
{
  return (NSString *)sub_23F10F3BC(self, (uint64_t)a2, (void (*)(void))sub_23F10F42C);
}

- (CGRect)scaledBoxWithSize:(CGSize)a3
{
  double width = a3.width;
  double v4 = self;
  CGFloat v5 = sub_23F10F540(width);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

+ (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)defaultResult
{
  if (qword_268C35308 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268C35560;
  return (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)v2;
}

- (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult)init
{
  CGRect result = (_TtC18AudiogramIngestion28AudiogramGraphDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end