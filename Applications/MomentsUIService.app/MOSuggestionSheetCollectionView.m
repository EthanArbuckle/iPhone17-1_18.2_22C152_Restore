@interface MOSuggestionSheetCollectionView
- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)layoutSubviews;
@end

@implementation MOSuggestionSheetCollectionView

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MOSuggestionSheetCollectionView();
  v2 = v7.receiver;
  id v3 = [(MOSuggestionSheetCollectionView *)&v7 layoutSubviews];
  v4 = (void (*)(void, uint64_t))(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x58))(v3);
  if (v4)
  {
    uint64_t v6 = (uint64_t)v4;
    v4(v4, v5);
    outlined consume of (@escaping @callee_guaranteed () -> ())?(v6);
  }
  (*(void (**)(void, void))((swift_isaMask & *v2) + 0x60))(0, 0);
}

- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback);
  v11 = (objc_class *)type metadata accessor for MOSuggestionSheetCollectionView();
  void *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[MOSuggestionSheetCollectionView initWithFrame:collectionViewLayout:](&v13, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC16MomentsUIService31MOSuggestionSheetCollectionView)initWithCoder:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback);
  uint64_t v6 = (objc_class *)type metadata accessor for MOSuggestionSheetCollectionView();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MOSuggestionSheetCollectionView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetCollectionView_callback));
}

@end