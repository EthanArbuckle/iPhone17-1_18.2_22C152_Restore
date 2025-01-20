@interface CallRecordingButton
- (BOOL)isEnabled;
- (_TtC16CommunicationsUI19CallRecordingButton)initWithCoder:(id)a3;
- (_TtC16CommunicationsUI19CallRecordingButton)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CallRecordingButton

- (_TtC16CommunicationsUI19CallRecordingButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton_iconColor;
  v10 = self;
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_whiteColor);
  *(Class *)((char *)&v11->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon) = 0;

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[CallRecordingButton initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_24A659B48();

  return v12;
}

- (_TtC16CommunicationsUI19CallRecordingButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton_iconColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_whiteColor);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon) = 0;

  result = (_TtC16CommunicationsUI19CallRecordingButton *)sub_24A669A68();
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CallRecordingButton *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  CallRecordingButton.isEnabled.setter(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton_iconColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16CommunicationsUI19CallRecordingButton____lazy_storage___icon);
}

@end