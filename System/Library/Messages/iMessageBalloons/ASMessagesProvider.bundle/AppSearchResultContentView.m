@interface AppSearchResultContentView
- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider26AppSearchResultContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider26AppSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppSearchResultContentView

- (_TtC18ASMessagesProvider26AppSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider26AppSearchResultContentView *)sub_569DFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider26AppSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_56DC84();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_56A170();
}

- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider26AppSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider26AppSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider26AppSearchResultContentView_impressionsUpdateBlock);

  sub_13308(v3);
}

@end