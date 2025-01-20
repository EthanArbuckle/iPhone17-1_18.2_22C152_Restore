@interface WordmarkView
- (BOOL)hasContent;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal12WordmarkView)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal12WordmarkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WordmarkView

- (_TtC19AppStoreKitInternal12WordmarkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)objc_allocWithZone((Class)swift_getObjectType());
  v8 = sub_1E1B58744(1, 0, v7, x, y, width, height, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC19AppStoreKitInternal12WordmarkView *)v8;
}

- (_TtC19AppStoreKitInternal12WordmarkView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC19AppStoreKitInternal12WordmarkView_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC19AppStoreKitInternal12WordmarkView *)sub_1E1D5D108();
  __break(1u);
  return result;
}

- (BOOL)hasContent
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC19AppStoreKitInternal12WordmarkView_imageView);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_image);

  if (v4) {
  return v4 != 0;
  }
}

- (void)layoutSubviews
{
  v2 = self;
  WordmarkView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = WordmarkView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = WordmarkView.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal12WordmarkView_imageView));
  double v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal12WordmarkView_referenceLineHeight;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end