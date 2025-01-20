@interface AVTStickerSheetCollectionView
- (void)safeAreaInsetsDidChange;
@end

@implementation AVTStickerSheetCollectionView

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)AVTStickerSheetCollectionView;
  [(AVTStickerSheetCollectionView *)&v4 safeAreaInsetsDidChange];
  v3 = [(AVTStickerSheetCollectionView *)self collectionViewLayout];
  [v3 invalidateLayout];
}

@end