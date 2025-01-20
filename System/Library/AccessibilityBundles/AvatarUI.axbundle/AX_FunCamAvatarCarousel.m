@interface AX_FunCamAvatarCarousel
- (AX_FunCamAvatarCarousel)initWithFunCamAvatarPickerController:(id)a3 accessibilityContainer:(id)a4;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrameInContainerSpace;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)fcAVTPickerController;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setFcAVTPickerController:(id)a3;
@end

@implementation AX_FunCamAvatarCarousel

- (AX_FunCamAvatarCarousel)initWithFunCamAvatarPickerController:(id)a3 accessibilityContainer:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AX_FunCamAvatarCarousel;
  v7 = [(AX_FunCamAvatarCarousel *)&v10 initWithAccessibilityContainer:a4];
  v8 = v7;
  if (v7) {
    [(AX_FunCamAvatarCarousel *)v7 setFcAVTPickerController:v6];
  }

  return v8;
}

- (BOOL)isAccessibilityElement
{
  id WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  char v3 = [WeakRetained safeBoolForKey:@"isDisplayingGridLayout"] ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"starfish.carousel");
}

- (id)accessibilityValue
{
  objc_opt_class();
  self = (AX_FunCamAvatarCarousel *)((char *)self + 56);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  v4 = [WeakRetained safeValueForKey:@"selectedIndexPath"];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  v7 = [v6 _axLabelForIndexPath:v5];

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AX_FunCamAvatarCarousel;
  return *MEMORY[0x263F1CED8] | [(AX_FunCamAvatarCarousel *)&v3 accessibilityTraits];
}

- (void)accessibilityIncrement
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  v4 = [WeakRetained safeValueForKey:@"items"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  id v6 = objc_loadWeakRetained(&self->_fcAVTPickerController);
  v7 = [v6 safeValueForKey:@"selectedIndexPath"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v8, "item") + 1, objc_msgSend(v8, "section"));
  unint64_t v10 = [v9 item];
  if (v10 < [v5 count])
  {
    id v11 = objc_loadWeakRetained(&self->_fcAVTPickerController);
    v12 = [v11 safeValueForKey:@"collectionView"];

    id v14 = v9;
    id v13 = v12;
    AXPerformSafeBlock();
  }
}

- (void)accessibilityDecrement
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  v4 = [WeakRetained safeValueForKey:@"selectedIndexPath"];
  v5 = __UIAccessibilityCastAsClass();

  id v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
  if (([v6 item] & 0x8000000000000000) == 0)
  {
    id v7 = objc_loadWeakRetained(&self->_fcAVTPickerController);
    v8 = [v7 safeValueForKey:@"collectionView"];

    id v10 = v6;
    id v9 = v8;
    AXPerformSafeBlock();
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);
  id v6 = [WeakRetained safeValueForKey:@"collectionView"];

  if (a3 == 1)
  {
    unsigned __int8 v7 = [v6 accessibilityScrollRightPage];
  }
  else if (a3 == 2)
  {
    unsigned __int8 v7 = [v6 accessibilityScrollLeftPage];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AX_FunCamAvatarCarousel;
    unsigned __int8 v7 = [(AX_FunCamAvatarCarousel *)&v10 accessibilityScroll:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  v2 = [(AX_FunCamAvatarCarousel *)self accessibilityContainer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)fcAVTPickerController
{
  id WeakRetained = objc_loadWeakRetained(&self->_fcAVTPickerController);

  return WeakRetained;
}

- (void)setFcAVTPickerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end