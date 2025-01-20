@interface TapbackPickerBalloonAccessoryView
- (UIColor)tintColor;
- (void)hoverRecognized:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TapbackPickerBalloonAccessoryView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerBalloonAccessoryView();
  v2 = [(TapbackPickerContainerView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TapbackPickerBalloonAccessoryView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TapbackPickerContainerView *)&v6 setTintColor:v4];
  sub_18F6D0E0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_cancelButton));
  sub_18F609E48(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView____lazy_storage___backwardArrow));
  sub_18F609E48(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView____lazy_storage___forwardArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_collectionViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_hoverGestureRecognizer));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit33TapbackPickerBalloonAccessoryView_tapbackPickerCollectionView);
}

- (void)hoverRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F6D0EC4(1);
}

@end