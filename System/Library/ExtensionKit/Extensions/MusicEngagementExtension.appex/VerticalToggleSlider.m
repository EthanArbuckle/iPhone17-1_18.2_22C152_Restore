@interface VerticalToggleSlider
- (BOOL)accessibilityAutomaticallyDisablesOnMaxValue;
- (BOOL)accessibilityToggleIsOn;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithFrame:(CGRect)a3;
- (float)accessibilityMaxValue;
- (float)accessibilityMinValue;
- (float)accessibilitySliderValue;
- (void)accessibilitySetSliderValue:(double)a3;
- (void)didMoveToWindow;
- (void)dragged:(id)a3;
- (void)longPressed:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation VerticalToggleSlider

- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithFrame:(CGRect)a3
{
  return (_TtC11MusicCoreUI20VerticalToggleSlider *)VerticalToggleSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MusicCoreUI20VerticalToggleSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized VerticalToggleSlider.init(coder:)();
}

- (CGSize)intrinsicContentSize
{
  if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) == 2)
  {
    uint64_t v3 = one-time initialization token for size;
    v4 = self;
    if (v3 != -1) {
      swift_once();
    }
    v5 = &static VerticalToggleSlider.DesignSpecs.size;
  }
  else
  {
    uint64_t v6 = one-time initialization token for expandedSize;
    v7 = self;
    if (v6 != -1) {
      swift_once();
    }
    v5 = &static VerticalToggleSlider.DesignSpecs.expandedSize;
  }
  double v8 = *(double *)v5;
  double v9 = *((double *)v5 + 1);

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)isEnabled
{
  return @objc VerticalToggleSlider.isEnabled.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VerticalToggleSlider();
  id v2 = v3.receiver;
  [(VerticalToggleSlider *)&v3 tintColorDidChange];
  VerticalToggleSlider.updateColors()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  LOBYTE(self) = specialized VerticalToggleSlider.point(inside:with:)(x, y);

  return self & 1;
}

- (void)didMoveToWindow
{
  id v2 = self;
  VerticalToggleSlider.didMoveToWindow()();
}

- (BOOL)isHighlighted
{
  return @objc VerticalToggleSlider.isEnabled.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)longPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  VerticalToggleSlider.longPressed(_:)(v4);
}

- (void)dragged:(id)a3
{
  id v4 = a3;
  v5 = self;
  VerticalToggleSlider.dragged(_:)(v4);
}

- (void).cxx_destruct
{
  outlined consume of CAPackageDefinition?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition), *(void *)&self->packageDefinition[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition], *(void **)&self->packageDefinition[OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageDefinition + 8]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___stretchView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___growView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_blurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_packageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider____lazy_storage___levelView));
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_longPressGestureRecognizer);
}

- (BOOL)accessibilityToggleIsOn
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_mode) != 2;
}

- (BOOL)accessibilityAutomaticallyDisablesOnMaxValue
{
  id v2 = (BOOL *)self + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider_automaticallyDisablesOnMaxValue;
  swift_beginAccess();
  return *v2;
}

- (float)accessibilityMinValue
{
  return *(float *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__minValue);
}

- (float)accessibilityMaxValue
{
  return *(float *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11MusicCoreUI20VerticalToggleSlider__maxValue);
}

- (float)accessibilitySliderValue
{
  VerticalToggleSlider.value.getter();
  return result;
}

- (void)accessibilitySetSliderValue:(double)a3
{
  id v4 = self;
  VerticalToggleSlider.accessibilitySetSliderValue(_:)(a3);
}

@end