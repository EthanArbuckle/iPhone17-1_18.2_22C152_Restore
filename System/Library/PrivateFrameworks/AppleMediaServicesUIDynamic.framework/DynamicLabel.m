@interface DynamicLabel
- (BOOL)hasContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGRect)jet_focusedFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)maximumContentSizeCategory;
- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)init;
- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithFrame:(CGRect)a3;
- (void)invalidateIntrinsicContentSize;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicLabel

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF3FD8A4();
}

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)initWithFrame:(CGRect)a3
{
}

- (void)invalidateIntrinsicContentSize
{
  v2 = self;
  DynamicLabel.invalidateIntrinsicContentSize()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  DynamicLabel.traitCollectionDidChange(_:)(v9);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  DynamicLabel.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)maximumContentSizeCategory
{
  v2 = self;
  id v3 = DynamicLabel.maximumContentSizeCategory.getter();

  return (NSString *)v3;
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  id v5 = a3;
  double v6 = self;
  DynamicLabel.maximumContentSizeCategory.setter(a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double v4 = (objc_class *)a4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  UITraitCollection_optional v9 = self;
  v11.value.super.isa = v4;
  LOBYTE(v4) = DynamicLabel.point(inside:with:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v11);

  return v4 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  CGSize v6 = DynamicLabel.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  CGSize v6 = DynamicLabel.systemLayoutSizeFitting(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic12DynamicLabel)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_defaultColor));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_defaultCustomTextStyle);
  sub_1BF3E9E30((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_dynamicText, &qword_1EBA935A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic12DynamicLabel_label));

  swift_release();
}

- (void)textViewDidChangeSelection:(id)a3
{
  double v4 = (UITextView *)a3;
  id v5 = self;
  DynamicLabel.textViewDidChangeSelection(_:)(v4);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = sub_1BF464E58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  UIEvent_optional v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF464E08();
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = DynamicLabel.textView(_:shouldInteractWith:in:interaction:)((uint64_t)v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = DynamicLabel.hasContent.getter();

  return v3 & 1;
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  DynamicLabel.focusedFrame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  DynamicLabel.measurements(fitting:in:)((uint64_t)a4);
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

@end