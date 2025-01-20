@interface AddLanguagesCell
- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithCoder:(id)a3;
- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation AddLanguagesCell

- (void)layoutSubviews
{
  v2 = self;
  sub_EA08();
}

- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_253A0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC20SiriMessagesSettings16AddLanguagesCell *)sub_EBF8(a3, v7, v9, a5);
}

- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_253A0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC20SiriMessagesSettings16AddLanguagesCell *)sub_ED10(a3, (uint64_t)a4, v6);
}

- (_TtC20SiriMessagesSettings16AddLanguagesCell)initWithCoder:(id)a3
{
  return (_TtC20SiriMessagesSettings16AddLanguagesCell *)sub_EDE0(a3);
}

@end