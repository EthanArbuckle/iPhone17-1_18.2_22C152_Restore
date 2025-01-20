@interface TapbackPickerTintableMessageBalloonView
- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithCoder:(id)a3;
- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TapbackPickerTintableMessageBalloonView

- (void)layoutSubviews
{
  v2 = self;
  sub_18F52B798();
}

- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerTintableMessageBalloonView();
  return -[TapbackPickerTintableMessageBalloonView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKit39TapbackPickerTintableMessageBalloonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapbackPickerTintableMessageBalloonView();
  return [(TapbackPickerTintableMessageBalloonView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_primaryBalloon));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit39TapbackPickerTintableMessageBalloonView_tintBalloon);
}

@end