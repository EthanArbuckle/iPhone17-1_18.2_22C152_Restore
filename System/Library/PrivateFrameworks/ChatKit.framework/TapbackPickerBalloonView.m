@interface TapbackPickerBalloonView
@end

@implementation TapbackPickerBalloonView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_pickerPill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_emojiTail));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_mediumTail));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_smallTail));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_platterContentContainer));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit24TapbackPickerBalloonView_gyroSpring);
}

@end