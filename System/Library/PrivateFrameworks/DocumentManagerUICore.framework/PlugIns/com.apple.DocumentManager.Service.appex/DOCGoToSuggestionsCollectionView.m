@interface DOCGoToSuggestionsCollectionView
- (_TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation DOCGoToSuggestionsCollectionView

- (_TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate);
  void *v10 = 0;
  v10[1] = 0;
  uint64_t v11 = OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView_focusableCollectionViewState;
  type metadata accessor for DOCFocusableCollectionViewState();
  v12 = (objc_class *)swift_allocObject();
  v13 = (char *)v12
      + OBJC_IVAR____TtC33com_apple_DocumentManager_Service31DOCFocusableCollectionViewState_indexPathForMostRecentlySelectedItem;
  uint64_t v14 = sub_1004CA770();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  v15((char *)v12+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service31DOCFocusableCollectionViewState_indexPathForSelectionExtensionStart, 1, 1, v14);
  *((unsigned char *)v12 + OBJC_IVAR____TtC33com_apple_DocumentManager_Service31DOCFocusableCollectionViewState_hasFocus) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for DOCGoToSuggestionsCollectionView();
  return -[DOCGoToSuggestionsCollectionView initWithFrame:collectionViewLayout:](&v17, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView)initWithCoder:(id)a3
{
  return (_TtC33com_apple_DocumentManager_ServiceP33_16BA7D74683FD3942AE7E13AFB21BBDC32DOCGoToSuggestionsCollectionView *)sub_1000F3148(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

@end