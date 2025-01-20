@interface MKFullDeveloperPlaceCardSelectionAccessoryView
- (id)_createErrorView;
- (id)_createLoadingView;
- (id)_createMapItemViewController:(id)a3;
- (id)initAsAccessory;
- (id)initAsStandAloneHidingInlineMap:(BOOL)a3;
@end

@implementation MKFullDeveloperPlaceCardSelectionAccessoryView

- (id)initAsAccessory
{
  v3.receiver = self;
  v3.super_class = (Class)MKFullDeveloperPlaceCardSelectionAccessoryView;
  id result = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](&v3, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result)
  {
    *((unsigned char *)result + 472) = 0;
    *((unsigned char *)result + 473) = 1;
  }
  return result;
}

- (id)initAsStandAloneHidingInlineMap:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKFullDeveloperPlaceCardSelectionAccessoryView;
  id result = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result)
  {
    *((unsigned char *)result + 472) = 1;
    *((unsigned char *)result + 473) = a3;
  }
  return result;
}

- (id)_createLoadingView
{
  v2 = objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);

  return v2;
}

- (id)_createMapItemViewController:(id)a3
{
  BOOL isStandAlonePlaceCard = self->_isStandAlonePlaceCard;
  id v5 = a3;
  v6 = [MKFullDeveloperPlaceCardRemoteUIHostViewController alloc];
  v7 = [(MKSelectionAccessoryView *)self delegate];
  BOOL v8 = v7 != 0;
  if (isStandAlonePlaceCard) {
    uint64_t v9 = [(MKFullDeveloperPlaceCardRemoteUIHostViewController *)v6 initAsStandAloneWithMapItem:v5 dismissButtonDisplayed:v8 hideInlineMap:self->_hideInlineMap];
  }
  else {
    uint64_t v9 = [(MKFullDeveloperPlaceCardRemoteUIHostViewController *)v6 initAsAccessoryWithMapItem:v5 dismissButtonDisplayed:v8];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_createErrorView
{
  v2 = objc_alloc_init(MKFullDeveloperPlaceCardErrorView);

  return v2;
}

@end