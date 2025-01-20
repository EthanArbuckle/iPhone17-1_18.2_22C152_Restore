@interface FloatingTitleView
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC14FitnessAppRoot17FloatingTitleView)initWithCoder:(id)a3;
- (_TtC14FitnessAppRoot17FloatingTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation FloatingTitleView

- (_TtC14FitnessAppRoot17FloatingTitleView)initWithFrame:(CGRect)a3
{
  sub_24E9DBC40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC14FitnessAppRoot17FloatingTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24E9DED6C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24E9DC340();
}

- (void).cxx_destruct
{
  sub_24E9DEF5C((uint64_t)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_floatingTabBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_pendingScrollView));
  id v3 = (char *)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate;
  sub_24E9DEF5C((uint64_t)v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v5 = (void *)MEMORY[0x253346E30]((char *)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate, a2);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_scrollViewWillBeginDragging_))
    {
      id v7 = a3;
      v8 = self;
      objc_msgSend(v6, sel_scrollViewWillBeginDragging_, v7);
    }
    swift_unknownObjectRelease();
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  v10 = (void *)MEMORY[0x253346E30]((char *)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate, a2);
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, sel_respondsToSelector_, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_))
    {
      id v12 = a3;
      v13 = self;
      objc_msgSend(v11, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v12, a5, x, y);
    }
    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_24E9DD7BC(v6, a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24E9DDB9C(v4, (SEL *)&selRef_scrollViewDidEndDecelerating_);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24E9DDB9C(v4, (SEL *)&selRef_scrollViewDidEndScrollingAnimation_);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = (void *)MEMORY[0x253346E30]((char *)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate, a2);
  if (v4)
  {
    v5 = v4;
    unsigned __int8 v6 = objc_msgSend(v4, sel_respondsToSelector_, sel_scrollViewDidScroll_);
    id v7 = a3;
    v8 = self;
    if (v6) {
      objc_msgSend(v5, sel_scrollViewDidScroll_, v7);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = a3;
    v10 = self;
  }
  sub_24E9DC9E8(a3);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  v5 = (void *)MEMORY[0x253346E30]((char *)self + OBJC_IVAR____TtC14FitnessAppRoot17FloatingTitleView_scrollingDelegate, a2);
  if (!v5) {
    return 1;
  }
  unsigned __int8 v6 = v5;
  if (objc_msgSend(v5, sel_respondsToSelector_, sel_scrollViewShouldScrollToTop_))
  {
    id v7 = a3;
    v8 = self;
    unsigned __int8 v9 = objc_msgSend(v6, sel_scrollViewShouldScrollToTop_, v7);
  }
  else
  {
    unsigned __int8 v9 = 1;
  }
  swift_unknownObjectRelease();
  return v9;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24E9DDB9C(v4, (SEL *)&selRef_scrollViewDidScrollToTop_);
}

@end