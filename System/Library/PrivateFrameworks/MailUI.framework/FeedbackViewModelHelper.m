@interface FeedbackViewModelHelper
- (NSArray)selectedMailboxes;
- (_TtC6MailUI23FeedbackViewModelHelper)init;
- (_TtC6MailUI23FeedbackViewModelHelper)initWithSelectedBucket:(int64_t)a3 selectedMailboxes:(id)a4;
- (int64_t)selectedBucket;
- (void)setSelectedBucket:(int64_t)a3;
- (void)setSelectedMailboxes:(id)a3;
@end

@implementation FeedbackViewModelHelper

- (int64_t)selectedBucket
{
  v2 = self;
  int64_t v5 = FeedbackViewModelHelper.selectedBucket.getter();

  return v5;
}

- (void)setSelectedBucket:(int64_t)a3
{
  v3 = self;
  sub_1DDDB5BA8(a3);
}

- (NSArray)selectedMailboxes
{
  v2 = self;
  uint64_t v7 = FeedbackViewModelHelper.selectedMailboxes.getter();

  if (v7)
  {
    sub_1DDD79318();
    uint64_t v4 = sub_1DDEEED98();
    swift_bridgeObjectRelease();
    id v5 = (id)v4;
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setSelectedMailboxes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = self;
  if (a3)
  {
    sub_1DDD79318();
    uint64_t v5 = sub_1DDEEEDA8();

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_1DDDB5DF0(v6);
}

- (_TtC6MailUI23FeedbackViewModelHelper)initWithSelectedBucket:(int64_t)a3 selectedMailboxes:(id)a4
{
  id v4 = a4;
  if (a4)
  {
    sub_1DDD79318();
    uint64_t v6 = sub_1DDEEEDA8();

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (_TtC6MailUI23FeedbackViewModelHelper *)FeedbackViewModelHelper.init(selectedBucket:selectedMailboxes:)(a3, v7);
}

- (_TtC6MailUI23FeedbackViewModelHelper)init
{
  return (_TtC6MailUI23FeedbackViewModelHelper *)FeedbackViewModelHelper.init()();
}

- (void).cxx_destruct
{
}

@end