@interface AudioMessageRecordingAppendButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithCoder:(id)a3;
- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AudioMessageRecordingAppendButton

- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit33AudioMessageRecordingAppendButton *)AudioMessageRecordingAppendButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit33AudioMessageRecordingAppendButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7ChatKit33AudioMessageRecordingAppendButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F7523A4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_18F75252C();
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_durationButton), sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_durationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_textStyle));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingAppendButton_textColor);
}

@end