@interface MessageListCollectionHeaderView
- (BOOL)useSplitViewStyling;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (NSString)title;
- (_TtC6MailUI31MessageListCollectionHeaderView)initWithCoder:(id)a3;
- (_TtC6MailUI31MessageListCollectionHeaderView)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseSplitViewStyling:(BOOL)a3;
@end

@implementation MessageListCollectionHeaderView

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  v2 = self;
  id v5 = MessageListCollectionHeaderView.layoutValuesHelper.getter();

  return (MessageListCellLayoutValuesHelper *)v5;
}

- (void)setLayoutValuesHelper:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MessageListCollectionHeaderView.layoutValuesHelper.setter(a3);
}

- (BOOL)useSplitViewStyling
{
  v2 = self;
  MessageListCollectionHeaderView.useSplitViewStyling.getter();

  return sub_1DDEECF48() & 1;
}

- (void)setUseSplitViewStyling:(BOOL)a3
{
  v3 = self;
  char v4 = sub_1DDEECF58();
  MessageListCollectionHeaderView.useSplitViewStyling.setter(v4 & 1);
}

- (NSString)title
{
  v2 = self;
  MessageListCollectionHeaderView.title.getter();
  uint64_t v8 = v3;

  if (v8)
  {
    uint64_t v5 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    id v6 = (id)v5;
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setTitle:(id)a3
{
  id v3 = a3;
  char v4 = self;
  if (a3)
  {
    uint64_t v6 = sub_1DDEEEB78();
    uint64_t v7 = v5;

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  MessageListCollectionHeaderView.title.setter(v8, v9);
}

- (_TtC6MailUI31MessageListCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI31MessageListCollectionHeaderView *)sub_1DDE1358C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI31MessageListCollectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DDE13AE0();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = sub_1DDEED488();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)MEMORY[0x1F4188790](v12);
  uint64_t v5 = self;
  sub_1DDEED468();
  MessageListCollectionHeaderView.updateConfiguration(using:)(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (void).cxx_destruct
{
  sub_1DDD31B20((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI31MessageListCollectionHeaderView_layoutValuesHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI31MessageListCollectionHeaderView_titleLabel));
}

@end