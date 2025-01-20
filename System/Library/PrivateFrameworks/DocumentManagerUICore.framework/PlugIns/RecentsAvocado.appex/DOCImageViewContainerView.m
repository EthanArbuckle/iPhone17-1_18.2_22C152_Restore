@interface DOCImageViewContainerView
- (_TtC14RecentsAvocado25DOCImageViewContainerView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation DOCImageViewContainerView

- (_TtC14RecentsAvocado25DOCImageViewContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado25DOCImageViewContainerView *)sub_1000B82E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000B841C();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCImageViewContainerView *)&v6 effectiveAppearanceDidChange:v4];
  sub_1000B8654(1);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCImageViewContainerView *)&v3 tintColorDidChange];
  sub_1000B8654(1);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado25DOCImageViewContainerView_containedView));
}

@end