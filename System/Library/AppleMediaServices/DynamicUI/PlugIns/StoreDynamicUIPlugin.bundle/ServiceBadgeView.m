@interface ServiceBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20StoreDynamicUIPlugin16ServiceBadgeView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin16ServiceBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceBadgeView

- (_TtC20StoreDynamicUIPlugin16ServiceBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin16ServiceBadgeView *)sub_BBE84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin16ServiceBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_BBF34();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_BC170();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_BC3A0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView));
  id v3 = (char *)self + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_referenceLineHeight;

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)v3);
}

@end