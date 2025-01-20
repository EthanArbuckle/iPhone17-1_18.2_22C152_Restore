@interface DynamicButton
- (BOOL)hasContent;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)init;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation DynamicButton

- (_TtC19CoreDynamicUIPlugin13DynamicButton)init
{
  return (_TtC19CoreDynamicUIPlugin13DynamicButton *)sub_302F8();
}

- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3
{
  return (_TtC19CoreDynamicUIPlugin13DynamicButton *)sub_303D4(a3);
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_304F4();

  return v3 & 1;
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_30554();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_305DC(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_30638();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_306E8((uint64_t)a4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_30804();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_8F9A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_8F9D0();
  }
  uint64_t v4 = self;
  sub_1CE1C();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_3091C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = self;
  sub_30934();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  double v3 = *(void **)&self->AMSUICommonControl_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin13DynamicButton_color];
}

@end