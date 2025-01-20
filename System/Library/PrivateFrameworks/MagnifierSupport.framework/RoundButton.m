@interface RoundButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (_TtC16MagnifierSupport11RoundButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport11RoundButton)initWithFrame:(CGRect)a3;
@end

@implementation RoundButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v10.receiver;
  [(RoundButton *)&v10 menuAttachmentPointForConfiguration:v4];
  objc_msgSend(v5, sel_frame, v10.receiver, v10.super_class);
  double v7 = v6;

  double v8 = -24.0;
  double v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

- (_TtC16MagnifierSupport11RoundButton)initWithCoder:(id)a3
{
  CGPoint result = (_TtC16MagnifierSupport11RoundButton *)sub_23594A968();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport11RoundButton)initWithFrame:(CGRect)a3
{
}

@end