@interface CarouselItemModuleLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemModuleLockupView

- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28CarouselItemModuleLockupView *)sub_10070C178(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10070D2A4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10070C7A0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10070B828(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_smallLockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_smallLockupView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_selectionHandler);

  sub_10001A4D0(v3);
}

@end