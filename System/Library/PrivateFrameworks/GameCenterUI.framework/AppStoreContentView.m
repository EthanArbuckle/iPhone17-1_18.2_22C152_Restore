@interface AppStoreContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI19AppStoreContentView)init;
- (_TtC12GameCenterUI19AppStoreContentView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI19AppStoreContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppStoreContentView

- (_TtC12GameCenterUI19AppStoreContentView)init
{
  return (_TtC12GameCenterUI19AppStoreContentView *)sub_1AF3B32AC();
}

- (_TtC12GameCenterUI19AppStoreContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3B3464();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGSizeMake(self, a2, (__n128)a3, *(__n128 *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3B37F4();
}

- (_TtC12GameCenterUI19AppStoreContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19AppStoreContentView_scrollView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end