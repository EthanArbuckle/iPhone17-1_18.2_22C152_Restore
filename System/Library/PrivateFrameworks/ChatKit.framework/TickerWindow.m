@interface TickerWindow
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithContentRect:(CGRect)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithFrame:(CGRect)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithWindowScene:(id)a3;
@end

@implementation TickerWindow

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_18F7A2330(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithWindowScene:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TickerWindow();
  return [(TickerWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TickerWindow();
  return [(TickerWindow *)&v5 initWithCoder:a3];
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TickerWindow();
  return -[TickerWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end