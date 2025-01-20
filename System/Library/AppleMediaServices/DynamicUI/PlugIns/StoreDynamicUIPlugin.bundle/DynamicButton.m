@interface DynamicButton
- (BOOL)hasContent;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)init;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation DynamicButton

- (_TtC20StoreDynamicUIPlugin13DynamicButton)init
{
  return (_TtC20StoreDynamicUIPlugin13DynamicButton *)sub_778C0();
}

- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3
{
  return (_TtC20StoreDynamicUIPlugin13DynamicButton *)sub_7799C(a3);
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_77ABC();

  return v3 & 1;
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_77B1C();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_77BA4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_77C00();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_77CB0((uint64_t)a4);
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
  sub_77DCC();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_10AD80();
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
    sub_10ADB0();
  }
  uint64_t v4 = self;
  sub_77EA0();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_77EEC();
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
  sub_77F04();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  double v3 = *(void **)&self->AMSUICommonControl_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin13DynamicButton_color];
}

@end