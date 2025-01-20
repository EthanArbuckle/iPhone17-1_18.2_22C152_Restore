@interface ModuleOverlayGradientBlurView
- (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation ModuleOverlayGradientBlurView

- (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_effectVisibilityThreshold) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_alignment;
  uint64_t v6 = enum case for HeroCarouselItemOverlay.DisplayOptions.Placement.leading(_:);
  uint64_t v7 = sub_775130();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  id v8 = a3;

  result = (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(ModuleOverlayGradientBlurView *)&v6 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_overlayView];
  sub_772580();
  objc_msgSend(v3, "setFrame:", v6.receiver, v6.super_class);
  v4 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_plusDarkerView];
  sub_772580();
  objc_msgSend(v4, "setFrame:");
  v5 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_gradientMaskView];
  sub_772580();
  objc_msgSend(v5, "setFrame:");
  sub_2A599C();
}

- (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC18ASMessagesProvider29ModuleOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_plusDarkerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_gradientMaskView));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider29ModuleOverlayGradientBlurView_alignment;
  uint64_t v4 = sub_775130();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end