@interface QuotesLabel
- (_TtC18ASMessagesProviderP33_D787071B922294CEF2328549F685170911QuotesLabel)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_D787071B922294CEF2328549F685170911QuotesLabel)initWithFrame:(CGRect)a3;
@end

@implementation QuotesLabel

- (_TtC18ASMessagesProviderP33_D787071B922294CEF2328549F685170911QuotesLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for QuotesLabel();
  return -[QuotesLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18ASMessagesProviderP33_D787071B922294CEF2328549F685170911QuotesLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuotesLabel();
  return [(QuotesLabel *)&v5 initWithCoder:a3];
}

@end