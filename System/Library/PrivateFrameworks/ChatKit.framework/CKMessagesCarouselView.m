@interface CKMessagesCarouselView
+ (id)resolvedBackgroundColorFor:(id)a3;
- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4;
- (CKMessagesCarouselView)initWithItemAspectRatio:(double)a3;
- (CKMessagesCarouselViewDelegate)carouselDelegate;
- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4;
- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3;
- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4;
- (void)setCarouselDelegate:(id)a3;
- (void)setViewClass:(Class)a3;
@end

@implementation CKMessagesCarouselView

- (Class)viewClassForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  return self->viewClass;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  return 0;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  return 0;
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)viewUserDataForItemAtIndex:(int64_t)a3 inStackLayout:(id)a4
{
  v6 = [(PXBaseMessagesStackView *)self dataSourceManager];
  v7 = [v6 dataSource];
  v8 = [(PXBaseMessagesStackView *)self dataSourceManager];
  v9 = [v8 dataSource];
  v12[0] = [v9 identifier];
  v12[1] = 0;
  v12[2] = a3;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v10 = [v7 objectAtIndexPath:v12];

  return v10;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  return self->viewAspectRatio;
}

- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessagesCarouselView;
  [(PXBaseMessagesStackView *)&v6 primaryItemDidChange:a3 didChangeIndex:a4];
  v5 = [(CKMessagesCarouselView *)self carouselDelegate];
  objc_msgSend(v5, "carousel:didScrollToIndex:", self, -[PXBaseMessagesStackView currentIndex](self, "currentIndex"));
}

- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4
{
  return 0;
}

- (CKMessagesCarouselView)initWithItemAspectRatio:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKMessagesCarouselView;
  v4 = -[PXBaseMessagesStackView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    [(PXBaseMessagesStackView *)v4 setUseAspectTiles:0];
    objc_super v6 = [(PXBaseMessagesStackView *)v5 layout];
    [v6 setDelegate:v5];
    [v6 setMediaKind:10];
    if (objc_opt_respondsToSelector()) {
      [v6 setKeepItemAspectRatioConstant:1];
    }
    v5->viewAspectRatio = a3;
  }
  return v5;
}

- (void)setViewClass:(Class)a3
{
  self->viewClass = a3;
}

+ (id)resolvedBackgroundColorFor:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 _resolvedBackgroundColor];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CKMessagesCarouselViewDelegate)carouselDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselDelegate);

  return (CKMessagesCarouselViewDelegate *)WeakRetained;
}

- (void)setCarouselDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end