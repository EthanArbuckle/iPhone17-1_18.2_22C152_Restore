@interface AISAppleIDMicaView
- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithCoder:(id)a3;
- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AISAppleIDMicaView

- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAppleIDMicaView();
  id v4 = a3;
  v5 = [(AISAppleIDMicaView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_2482C5D20();
  }
  return v6;
}

- (_TtC14AppleIDSetupUI18AISAppleIDMicaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAppleIDMicaView();
  v7 = -[AISAppleIDMicaView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2482C5D20();

  return v7;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2482C5F2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI18AISAppleIDMicaView_micaPlayer));
}

@end