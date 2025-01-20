@interface LanguageCell
- (_TtC20SiriMessagesSettings12LanguageCell)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings12LanguageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC20SiriMessagesSettings12LanguageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation LanguageCell

- (_TtC20SiriMessagesSettings12LanguageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_253A0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return (_TtC20SiriMessagesSettings12LanguageCell *)sub_21C50(v4, v4, v6);
}

- (_TtC20SiriMessagesSettings12LanguageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7 = sub_253A0();
  sub_220FC(a3, v7, v8, a5);
  return result;
}

- (_TtC20SiriMessagesSettings12LanguageCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_227EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2304C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end