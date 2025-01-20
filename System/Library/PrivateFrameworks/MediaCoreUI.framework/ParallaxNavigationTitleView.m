@interface ParallaxNavigationTitleView
- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)tintColorDidChange;
- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ParallaxNavigationTitleView

- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate) = 1;
  uint64_t v5 = OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_customBackButton;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_buttonWithType_, 0);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_didSetupBackButtonsAlphas) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_isNavigationBarOverParallaxHeader) = 1;

  result = (_TtC11MediaCoreUI27ParallaxNavigationTitleView *)sub_255C81248();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_255C1B0AC();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ParallaxNavigationTitleView *)&v3 tintColorDidChange];
  sub_255C1BF08(1);
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_255C1C184((uint64_t)a3);
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(ParallaxNavigationTitleView *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3) {
    sub_255C1BF08(1);
  }
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  [(_UINavigationBarTitleView *)&v7 transitionWillBegin:a3 willBeDisplayed:v4];
  v6[OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate] = v4;
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  [(_UINavigationBarTitleView *)&v7 transitionCompleted:a3 willBeDisplayed:v4];
  v6[OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_allowsNavigationBarTintColorUpdate] = v4;
  sub_255C1BF08(v4);
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v6 = v7.receiver;
  [(_UINavigationBarTitleView *)&v7 performTransition:a3 willBeDisplayed:v4];
  sub_255C1BF08(v4);
}

- (_TtC11MediaCoreUI27ParallaxNavigationTitleView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MediaCoreUI27ParallaxNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUI27ParallaxNavigationTitleView_customBackButton));
}

@end