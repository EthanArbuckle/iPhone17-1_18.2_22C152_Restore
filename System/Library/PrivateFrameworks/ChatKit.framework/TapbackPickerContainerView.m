@interface TapbackPickerContainerView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIColor)tintColor;
- (void)setTintColor:(id)a3;
@end

@implementation TapbackPickerContainerView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerContainerView();
  v2 = [(TapbackPickerContainerView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18F71EF04((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_displayConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_presentationTintColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit26TapbackPickerContainerView_backingBalloon);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F71ED80(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

@end