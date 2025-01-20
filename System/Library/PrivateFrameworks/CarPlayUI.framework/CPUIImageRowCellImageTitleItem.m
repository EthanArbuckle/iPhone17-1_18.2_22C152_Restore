@interface CPUIImageRowCellImageTitleItem
@end

@implementation CPUIImageRowCellImageTitleItem

uint64_t __86___CPUIImageRowCellImageTitleItem_configureWithArtwork_title_imageSize_fallbackImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    a3 = *(void *)(a1 + 32);
  }
  return [a2 setImage:a3 forState:0];
}

@end