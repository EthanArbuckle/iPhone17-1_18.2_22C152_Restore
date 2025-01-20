@interface MOSuggestionSheetGridCollectionView
- (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation MOSuggestionSheetGridCollectionView

- (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView *)MOSuggestionSheetGridCollectionView.init(frame:collectionViewLayout:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView)initWithCoder:(id)a3
{
  return (_TtC16MomentsUIService35MOSuggestionSheetGridCollectionView *)MOSuggestionSheetGridCollectionView.init(coder:)(a3);
}

@end