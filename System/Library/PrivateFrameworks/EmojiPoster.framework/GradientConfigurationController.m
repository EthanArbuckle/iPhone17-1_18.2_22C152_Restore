@interface GradientConfigurationController
- (_TtC11EmojiPoster31GradientConfigurationController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster31GradientConfigurationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)attributeSliderValueChangedWithSlider:(id)a3;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)viewDidLoad;
@end

@implementation GradientConfigurationController

- (_TtC11EmojiPoster31GradientConfigurationController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster31GradientConfigurationController *)GradientConfigurationController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B8FFAA4();
}

- (void)attributeSliderValueChangedWithSlider:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B900A3C(v4);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  if (v5)
  {
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    sub_20B901584((uint64_t)v5);
    v5(v9);
    sub_20B8F960C((uint64_t)v5);
  }
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  void *v3 = 0;
  v3[1] = 0;
  sub_20B8F960C(v4);
}

- (_TtC11EmojiPoster31GradientConfigurationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster31GradientConfigurationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20B8E7820(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties));
  sub_20B8E7820(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties));
  sub_20B8F966C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_styleSegmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_attributeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController____lazy_storage___colorPicker));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  sub_20B8F960C(v3);
}

@end