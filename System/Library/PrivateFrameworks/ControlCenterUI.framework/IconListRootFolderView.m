@interface IconListRootFolderView
- (BOOL)canBeginPagingAtLocation:(CGPoint)a3 inView:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldExtendAreaForPagingContinuation;
- (CGPoint)pageContentTranslation;
- (SBFolder)folder;
- (_TtC15ControlCenterUI22IconListRootFolderView)initWithConfiguration:(id)a3;
- (double)pageContentAlpha;
- (double)pageContentScale;
- (id)indicatorDescriptionForPageIndex:(int64_t)a3;
- (void)_didAddIconListView:(id)a3;
- (void)_updatePageControlNumberOfPages;
- (void)addPagingDidChangeHandler:(id)a3;
- (void)handlePageControlInteraction:(id)a3;
- (void)layoutSubviews;
- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5;
- (void)setFolder:(id)a3;
- (void)setPageContentAlpha:(double)a3;
- (void)setPageContentScale:(double)a3;
- (void)setPageContentTranslation:(CGPoint)a3;
- (void)setShouldExtendAreaForPagingContinuation:(BOOL)a3;
- (void)willBeginPagingInteractively:(BOOL)a3;
@end

@implementation IconListRootFolderView

- (_TtC15ControlCenterUI22IconListRootFolderView)initWithConfiguration:(id)a3
{
  return (_TtC15ControlCenterUI22IconListRootFolderView *)sub_1D7BA1730(a3);
}

- (SBFolder)folder
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IconListRootFolderView();
  v2 = [(SBFolderView *)&v4 folder];

  return v2;
}

- (void)setFolder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IconListRootFolderView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(SBFolderView *)&v6 setFolder:v4];
  sub_1D7B66350(objc_msgSend(v5, sel_folder, v6.receiver, v6.super_class));
}

- (void)_didAddIconListView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D7BA2148(v4);
}

- (void)_updatePageControlNumberOfPages
{
  v2 = self;
  v3 = [(SBFolderView *)v2 pageControl];
  id v4 = [(SBIconListPageControl *)v3 numberOfPages];

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for IconListRootFolderView();
  [(SBFolderView *)&v7 _updatePageControlNumberOfPages];
  id v5 = [(SBFolderView *)v2 pageControl];
  id v6 = [(SBIconListPageControl *)v5 numberOfPages];

  if (v4 != v6)
  {
    sub_1D7BA2D80();
    [(SBFolderView *)v2 setNeedsLayout];
  }
}

- (void)pageControl:(id)a3 didMoveCurrentPageToPage:(int64_t)a4 withScrubbing:(BOOL)a5
{
  char v7 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_isScrubbing);
  id v8 = a3;
  v9 = self;
  sub_1D7BA237C(a4, 1, v7);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer) == a3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IconListRootFolderView();
  id v2 = v3.receiver;
  [(SBFolderView *)&v3 layoutSubviews];
  sub_1D7BA281C();
}

- (id)indicatorDescriptionForPageIndex:(int64_t)a3
{
  sub_1D7BA301C(a3);
  objc_super v3 = (void *)sub_1D7BB7228();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)handlePageControlInteraction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D7BA354C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageIndicatorProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_interactivePagingTouchContinuationTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pageControlScrubbingGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___pagingDidChangeAnimationSettings));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView____lazy_storage___scrubbingAnimationSettings);
}

- (double)pageContentAlpha
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewAlpha);
}

- (void)setPageContentAlpha:(double)a3
{
  id v4 = self;
  sub_1D7BA4710(a3);
}

- (double)pageContentScale
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewScale);
}

- (void)setPageContentScale:(double)a3
{
  id v4 = self;
  sub_1D7BA4898(a3);
}

- (CGPoint)pageContentTranslation
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  double v3 = *(double *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_iconListViewTranslation);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPageContentTranslation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = self;
  sub_1D7BA4AAC(x, y);
}

- (BOOL)shouldExtendAreaForPagingContinuation
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation);
}

- (void)setShouldExtendAreaForPagingContinuation:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView__shouldExtendAreaForPagingContinuation) = a3;
  if (v3 != a3)
  {
    id v4 = self;
    sub_1D7BA281C();
  }
}

- (void)addPagingDidChangeHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1D7BA5C48;
  *(void *)(v6 + 24) = v5;
  char v7 = (void **)((char *)self + OBJC_IVAR____TtC15ControlCenterUI22IconListRootFolderView_pagingDidChangeHandlers);
  swift_beginAccess();
  id v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *char v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v8 = sub_1D7BA5540(0, v8[2] + 1, 1, v8);
    *char v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    id v8 = sub_1D7BA5540((void *)(v11 > 1), v12 + 1, 1, v8);
    *char v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1D7BA5C98;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (BOOL)canBeginPagingAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  LOBYTE(self) = sub_1D7BA4E34((uint64_t)v7, x, y);

  return self & 1;
}

- (void)willBeginPagingInteractively:(BOOL)a3
{
  int v3 = self;
  sub_1D7BA5A30();
}

@end