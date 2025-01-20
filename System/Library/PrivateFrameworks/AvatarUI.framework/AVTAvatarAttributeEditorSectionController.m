@interface AVTAvatarAttributeEditorSectionController
+ (BOOL)shouldHideLabelBackgroundInSection:(id)a3 fittingWidth:(double)a4;
+ (BOOL)supportsSelection;
+ (CGSize)cellSizeForSectionItem:(id)a3 inSection:(id)a4 fittingWidth:(double)a5 environment:(id)a6;
+ (UIEdgeInsets)edgeInsetsForSection:(id)a3 fittingWidth:(double)a4 environment:(id)a5;
+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4;
+ (double)maxLabelHeightInSection:(id)a3 fittingWidth:(double)a4;
+ (double)requiredLabelSpaceForMaxLabelHeight:(double)a3 cellEdgeLength:(double)a4 sectionItemHeightRatio:(double)a5;
- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate;
- (AVTAvatarAttributeEditorSection)section;
- (AVTAvatarAttributeEditorSectionController)initWithThumbnailScheduler:(id)a3 renderingScheduler:(id)a4 environment:(id)a5;
- (AVTIndexBasedTaskScheduler)thumbnailScheduler;
- (AVTTaskScheduler)renderingScheduler;
- (AVTTransitionCoordinator)transitionCoordinator;
- (AVTUIEnvironment)environment;
- (BOOL)evaluateDisplayCondition:(id)a3;
- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3;
- (id)prefetchingSectionItemForIndex:(int64_t)a3;
- (id)viewForIndex:(int64_t)a3;
- (int64_t)numberOfItems;
- (int64_t)selectedIndex;
- (unint64_t)indexForItem:(id)a3;
- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4;
- (void)didHighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5;
- (void)didSelectItemAtIndex:(int64_t)a3 cell:(id)a4;
- (void)didUnhighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSection:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)updateWithSection:(id)a3;
@end

@implementation AVTAvatarAttributeEditorSectionController

+ (BOOL)supportsSelection
{
  return 1;
}

+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  id v5 = a4;
  char v6 = [v5 deviceIsPad];
  double v7 = 400.0;
  if (a3 <= 400.0 || (double v7 = 6.0, (v6 & 1) == 0))
  {
    unsigned __int8 v8 = objc_msgSend(v5, "deviceIsMac", v7);
    double v7 = 3.0;
    if (((a3 > 300.0) & v8) != 0) {
      double v7 = 6.0;
    }
  }
  double v9 = floor((a3 + -24.0 + (v7 + -1.0) * -0.0) / v7);

  return v9;
}

+ (CGSize)cellSizeForSectionItem:(id)a3 inSection:(id)a4 fittingWidth:(double)a5 environment:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  [a1 edgeLengthFittingWidth:a6 environment:a5];
  double v13 = v12;
  [v10 heightRatio];
  double v15 = v13 * v14;
  v16 = [v11 options];
  int v17 = [v16 showsLabel];

  if (v17)
  {
    [a1 maxLabelHeightInSection:v11 fittingWidth:v13];
    double v19 = v18;
    [v10 heightRatio];
    [a1 requiredLabelSpaceForMaxLabelHeight:v19 cellEdgeLength:v13 sectionItemHeightRatio:v20];
    double v15 = v15 + v21;
  }

  double v22 = v13;
  double v23 = v15;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (double)maxLabelHeightInSection:(id)a3 fittingWidth:(double)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [v5 options];
  int v7 = [v6 showsLabel];

  double v8 = 0.0;
  if (v7)
  {
    double v9 = +[AVTUIFontRepository attributeViewLabelFont];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = objc_msgSend(v5, "sectionItems", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v14 = *MEMORY[0x263F1C238];
      double v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          int v17 = [*(id *)(*((void *)&v25 + 1) + 8 * i) localizedName];
          uint64_t v29 = v14;
          v30 = v9;
          double v18 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, a4, 1.79769313e308);
          double v20 = v19;

          double v21 = ceil(v20);
          if (v15 < v21) {
            double v15 = v21;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v12);
    }
    else
    {
      double v15 = 0.0;
    }

    [v9 lineHeight];
    double v23 = ceil(v22 + v22) + 3.0;
    if (v15 >= v23) {
      double v8 = v23;
    }
    else {
      double v8 = v15;
    }
  }
  return v8;
}

+ (BOOL)shouldHideLabelBackgroundInSection:(id)a3 fittingWidth:(double)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [v5 options];
  int v7 = [v6 showsLabel];

  if (v7)
  {
    double v8 = +[AVTUIFontRepository attributeViewLabelFont];
    [v8 lineHeight];
    double v10 = v9;
    [v8 lineHeight];
    double v12 = v11;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = objc_msgSend(v5, "sectionItems", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v14)
    {
      double v15 = ceil(v10) + 3.0;
      double v16 = ceil(v12 + v12) + 3.0;
      uint64_t v17 = *(void *)v31;
      uint64_t v18 = *MEMORY[0x263F1C238];
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v13);
          }
          double v20 = [*(id *)(*((void *)&v30 + 1) + 8 * i) localizedName];
          uint64_t v36 = v18;
          v37 = v8;
          double v21 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v21, 0, a4, 1.79769313e308);
          double v23 = v22;
          double v25 = v24;

          if (ceil(v25) >= v15)
          {
            uint64_t v34 = v18;
            v35 = v8;
            long long v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, a4 + -4.0 + -1.0, 1.79769313e308);
            double v28 = v27;

            if (ceil(v28) > v16)
            {
LABEL_15:

              LOBYTE(v14) = 1;
              goto LABEL_16;
            }
          }
          else if (ceil(v23) >= a4 + -4.0)
          {
            goto LABEL_15;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (double)requiredLabelSpaceForMaxLabelHeight:(double)a3 cellEdgeLength:(double)a4 sectionItemHeightRatio:(double)a5
{
  return a3 + 4.0 + 7.0 + (a4 * a5 - a4) * -0.5;
}

+ (UIEdgeInsets)edgeInsetsForSection:(id)a3 fittingWidth:(double)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 localizedName];
  if (v10)
  {
    double v11 = [v8 localizedName];
    if ([v11 length]) {
      double v12 = 0.0;
    }
    else {
      double v12 = 12.0;
    }
  }
  else
  {
    double v12 = 12.0;
  }

  uint64_t v13 = [v8 sectionItems];
  uint64_t v14 = [v13 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    double v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = [v8 sectionItems];
    uint64_t v18 = [v17 firstObject];
    [v16 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v18 format];
  }
  double v19 = [v8 sectionItems];
  double v20 = [v19 firstObject];

  if (v20)
  {
    [a1 edgeLengthFittingWidth:v9 environment:a4];
    double v22 = v21;
    [v20 heightRatio];
    double v24 = v23;
    double v25 = [v8 options];
    int v26 = [v25 showsLabel];

    if (v26)
    {
      [v20 heightRatio];
      double v28 = (v22 * v27 - v22) * 0.5 + 12.0;
      double v29 = 17.0;
      double v12 = 17.0 - v28;
    }
    else
    {
      double v30 = v22 * (v24 + -1.0) * 0.5;
      double v12 = fmax(v12 - v30, 0.0);
      double v29 = fmax(12.0 - v30, 0.0);
    }
  }
  else
  {
    double v29 = 12.0;
  }

  double v31 = 12.0;
  double v32 = 12.0;
  double v33 = v12;
  double v34 = v29;
  result.right = v32;
  result.bottom = v34;
  result.left = v31;
  result.top = v33;
  return result;
}

- (AVTAvatarAttributeEditorSectionController)initWithThumbnailScheduler:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarAttributeEditorSectionController;
  double v12 = [(AVTAvatarAttributeEditorSectionController *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    v13->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v14 = +[AVTTransitionCoordinator concurrentTransitionCoordinatorWithDelay:0.015];
    transitionCoordinator = v13->_transitionCoordinator;
    v13->_transitionCoordinator = (AVTTransitionCoordinator *)v14;

    objc_storeStrong((id *)&v13->_thumbnailScheduler, a3);
    objc_storeStrong((id *)&v13->_renderingScheduler, a4);
  }

  return v13;
}

- (void)updateWithSection:(id)a3
{
  id v5 = (AVTAvatarAttributeEditorSection *)a3;
  p_section = &self->_section;
  if (self->_section != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)p_section, a3);
    int v7 = [(AVTAvatarAttributeEditorSection *)self->_section sectionItems];
    self->_selectedIndex = [v7 indexOfObjectPassingTest:&__block_literal_global_10];

    id v8 = [(AVTAvatarAttributeEditorSectionController *)self transitionCoordinator];
    [v8 cancelAllTransitions];

    id v5 = v9;
  }
  MEMORY[0x270F9A758](p_section, v5);
}

uint64_t __63__AVTAvatarAttributeEditorSectionController_updateWithSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v35 = a3;
  char v6 = [v35 valueView];
  int v7 = [v6 superview];

  if (v7)
  {
    id v8 = [(AVTAvatarAttributeEditorSectionController *)self transitionCoordinator];
    id v9 = [v35 valueView];
    [v8 cancelTransitionsMatchingModel:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(AVTAvatarAttributeEditorSectionController *)self section];
    id v11 = [v10 sectionItems];
    double v12 = [v11 objectAtIndexedSubscript:a4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v14 = (void *)MEMORY[0x263EFF940];
      double v15 = [(AVTAvatarAttributeEditorSectionController *)self section];
      double v16 = [v15 sectionItems];
      objc_super v17 = [v16 objectAtIndexedSubscript:a4];
      [v14 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v17 format];
    }
    uint64_t v18 = [(AVTAvatarAttributeEditorSectionController *)self section];
    double v19 = [v18 sectionItems];
    double v20 = [v19 objectAtIndexedSubscript:a4];

    double v21 = [v20 localizedName];
    [v35 setLabelString:v21];

    double v22 = objc_opt_class();
    double v23 = [(AVTAvatarAttributeEditorSectionController *)self section];
    [v35 bounds];
    [v22 maxLabelHeightInSection:v23 fittingWidth:v24];
    double v26 = v25;

    double v27 = objc_opt_class();
    [v35 bounds];
    double v29 = v28;
    [v20 heightRatio];
    [v27 requiredLabelSpaceForMaxLabelHeight:v26 cellEdgeLength:v29 sectionItemHeightRatio:v30];
    objc_msgSend(v35, "setLabelVerticalSpace:");
    double v31 = objc_opt_class();
    double v32 = [(AVTAvatarAttributeEditorSectionController *)self section];
    [v35 bounds];
    objc_msgSend(v35, "setShouldHideLabelBackground:", objc_msgSend(v31, "shouldHideLabelBackgroundInSection:fittingWidth:", v32, v33));
  }
  double v34 = [(AVTAvatarAttributeEditorSectionController *)self viewForIndex:a4];
  [v35 setAttributeView:v34];
}

- (id)viewForIndex:(int64_t)a3
{
  id v5 = [AVTAttributeValueView alloc];
  char v6 = -[AVTAttributeValueView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AVTAttributeValueView *)v6 setSelectionStyle:0];
  int v7 = [(AVTAvatarAttributeEditorSectionController *)self section];
  id v8 = [v7 sectionItems];
  id v9 = [v8 objectAtIndexedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x263EFF940];
    double v12 = [(AVTAvatarAttributeEditorSectionController *)self section];
    uint64_t v13 = [v12 sectionItems];
    uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
    [v11 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v14 format];
  }
  double v15 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v16 = [v15 sectionItems];
  objc_super v17 = [v16 objectAtIndexedSubscript:a3];

  [v17 heightRatio];
  -[AVTAttributeValueView setImageSizeRatio:](v6, "setImageSizeRatio:", 1.0, v18);
  [(AVTAttributeValueView *)v6 updateSelectedState:[(AVTAvatarAttributeEditorSectionController *)self selectedIndex] == a3 animated:0];

  return v6;
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  id v5 = [(AVTAvatarAttributeEditorSectionController *)self section];
  char v6 = [v5 sectionItems];
  int v7 = [v6 objectAtIndexedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x263EFF940];
    id v10 = [(AVTAvatarAttributeEditorSectionController *)self section];
    id v11 = [v10 sectionItems];
    double v12 = [v11 objectAtIndexedSubscript:a3];
    [v9 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v12 format];
  }
  uint64_t v13 = [(AVTAvatarAttributeEditorSectionController *)self section];
  uint64_t v14 = [v13 sectionItems];
  double v15 = [v14 objectAtIndexedSubscript:a3];

  return v15;
}

- (int64_t)numberOfItems
{
  v2 = [(AVTAvatarAttributeEditorSectionController *)self section];
  v3 = [v2 sectionItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  int v7 = [(AVTAvatarAttributeEditorSectionController *)self section];
  id v8 = [v7 sectionItems];
  id v9 = [v8 objectAtIndexedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x263EFF940];
    double v12 = [(AVTAvatarAttributeEditorSectionController *)self section];
    uint64_t v13 = [v12 sectionItems];
    uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
    [v11 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v14 format];
  }
  double v15 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v16 = [v15 sectionItems];
  objc_super v17 = [v16 objectAtIndexedSubscript:a3];

  double v18 = objc_opt_class();
  double v19 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v20 = [(AVTAvatarAttributeEditorSectionController *)self environment];
  [v18 cellSizeForSectionItem:v17 inSection:v19 fittingWidth:v20 environment:width];
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.height = v26;
  result.double width = v25;
  return result;
}

- (unint64_t)indexForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorSectionController *)self section];
  char v6 = [v5 sectionItems];
  unint64_t v7 = [v6 indexOfObject:v4];

  return v7;
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double width = a3.width;
  id v5 = objc_opt_class();
  char v6 = [(AVTAvatarAttributeEditorSectionController *)self section];
  unint64_t v7 = [(AVTAvatarAttributeEditorSectionController *)self environment];
  [v5 edgeInsetsForSection:v6 fittingWidth:v7 environment:width];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 valueView];
  v45 = [MEMORY[0x263F08C38] UUID];
  id val = v7;
  objc_msgSend(v7, "setDisplaySessionUUID:");
  double v8 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v9 = [v8 sectionItems];
  double v10 = [v9 objectAtIndexedSubscript:a4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    double v12 = (void *)MEMORY[0x263EFF940];
    double v13 = [(AVTAvatarAttributeEditorSectionController *)self section];
    double v14 = [v13 sectionItems];
    double v15 = [v14 objectAtIndexedSubscript:a4];
    [v12 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v15 format];
  }
  double v16 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v17 = [v16 sectionItems];
  double v18 = [v17 objectAtIndexedSubscript:a4];

  double v19 = [(AVTAvatarAttributeEditorSectionController *)self transitionCoordinator];
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__5;
  v71[4] = __Block_byref_object_dispose__5;
  id v72 = 0;
  objc_initWeak(&location, val);
  objc_initWeak(&v69, v18);
  v42 = [(AVTAvatarAttributeEditorSectionController *)self section];
  objc_initWeak(&v68, v42);
  objc_initWeak(&from, self);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke;
  v62[3] = &unk_263FF0E98;
  objc_copyWeak(&v65, &location);
  objc_copyWeak(&v66, &from);
  v64 = v71;
  id v44 = v19;
  id v63 = v44;
  double v20 = (void *)[v62 copy];
  double v21 = [(AVTAvatarAttributeEditorSectionController *)self thumbnailScheduler];
  v43 = [(AVTAvatarAttributeEditorSectionController *)self renderingScheduler];
  double v22 = [(AVTAvatarAttributeEditorSectionController *)self environment];
  double v23 = [v22 logger];

  [v21 scheduleTask:v20 forIndex:a4];
  double v24 = [(AVTAvatarAttributeEditorSectionController *)self section];
  double v25 = [v24 identifier];
  double v26 = [v25 description];
  [v23 logRequestingThumbnailForIndex:a4 section:v26];

  double v27 = [v18 stickerResourceProvider];

  v40 = v23;
  v41 = v6;
  if (v27)
  {
    double v28 = [v18 stickerResourceProvider];
    double v29 = (id *)v59;
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_4;
    v59[3] = &unk_263FF0EC0;
    double v30 = &v60;
    objc_copyWeak(&v60, &location);
    double v31 = v61;
    objc_copyWeak(v61, &v69);
    v59[4] = v45;
    v59[7] = v71;
    v59[5] = v21;
    v59[6] = v20;
    v61[1] = (id)a4;
    uint64_t v32 = ((void (**)(void, void *, void))v28)[2](v28, v59, 0);
  }
  else
  {
    double v28 = [v18 thumbnailProvider];
    double v29 = (id *)v56;
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_5;
    v56[3] = &unk_263FF0EE8;
    double v30 = &v57;
    objc_copyWeak(&v57, &location);
    double v31 = v58;
    objc_copyWeak(v58, &v69);
    v56[4] = v45;
    v56[7] = v71;
    v56[5] = v21;
    v56[6] = v20;
    v58[1] = (id)a4;
    uint64_t v32 = ((void (**)(void, void *, void))v28)[2](v28, v56, 0);
  }
  double v33 = (void *)v32;

  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_6;
  v47[3] = &unk_263FF0F10;
  objc_copyWeak(&v53, &location);
  objc_copyWeak(&v54, &v69);
  objc_copyWeak(&v55, &v68);
  id v34 = v44;
  id v48 = v34;
  id v35 = v21;
  id v49 = v35;
  id v36 = v20;
  id v51 = v36;
  id v37 = v43;
  id v50 = v37;
  id v38 = v33;
  id v52 = v38;
  [val setDiscardableContentHandler:v47];
  uint64_t v39 = [v18 cachedThumbnail];
  if (v39) {
    [val updateWithImage:v39];
  }
  else {
    [val setShowPlaceholder:1];
  }

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);
  _Block_object_dispose(v71, 8);
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  unint64_t v7 = [AVTSectionItemTransition alloc];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_2;
  v16[3] = &unk_263FF0E70;
  id v8 = WeakRetained;
  uint64_t v9 = *(void *)(a1 + 40);
  id v17 = v8;
  uint64_t v18 = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_3;
  v14[3] = &unk_263FF04A0;
  id v15 = v8;
  id v10 = v8;
  double v11 = [v6 environment];
  double v12 = [v11 logger];
  double v13 = [(AVTSectionItemTransition *)v7 initWithModel:v10 animated:1 setupHandler:v16 completionHandler:v14 logger:v12];

  [*(id *)(a1 + 32) addTransition:v13];
  v4[2](v4);
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  [v2 prepareForTransitionToImage:v3];
  v4[2](v4, 1);
}

uint64_t __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) cleanupAfterTransition];
  }
  return result;
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = [WeakRetained displaySessionUUID];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    unint64_t v7 = [v11 image];
    [v4 setCachedThumbnail:v7];

    uint64_t v8 = [v11 image];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 40) taskReady:*(void *)(a1 + 48) forIndex:*(void *)(a1 + 80)];
  }
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = objc_loadWeakRetained((id *)(a1 + 72));
  id v6 = [WeakRetained displaySessionUUID];
  unint64_t v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    [v5 setCachedThumbnail:v8];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    [*(id *)(a1 + 40) taskReady:*(void *)(a1 + 48) forIndex:*(void *)(a1 + 80)];
  }
}

void __69__AVTAvatarAttributeEditorSectionController_cell_willDisplayAtIndex___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v2 = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained setDisplaySessionUUID:0];
  [v2 discardContent];
  [*(id *)(a1 + 32) cancelTransitionsMatchingModel:WeakRetained];
  [*(id *)(a1 + 40) cancelTask:*(void *)(a1 + 56)];
  if (v3
    && ([v3 sectionItems],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 containsObject:v2],
        v4,
        v5))
  {
    [*(id *)(a1 + 48) lowerTaskPriority:*(void *)(a1 + 64)];
  }
  else
  {
    [*(id *)(a1 + 48) cancelTask:*(void *)(a1 + 64)];
  }
}

- (void)didHighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5
{
  id v6 = a5;
  id v7 = [a4 valueView];
  [v7 updateHighlightedState:1 animated:1 completionBlock:v6];
}

- (void)didUnhighlightItemAtIndex:(int64_t)a3 cell:(id)a4 completionBlock:(id)a5
{
  id v6 = a5;
  id v7 = [a4 valueView];
  [v7 updateHighlightedState:0 animated:1 completionBlock:v6];
}

- (void)didSelectItemAtIndex:(int64_t)a3 cell:(id)a4
{
  id v9 = [(AVTAvatarAttributeEditorSectionController *)self delegate];
  id v6 = [(AVTAvatarAttributeEditorSectionController *)self section];
  id v7 = [v6 sectionItems];
  id v8 = [v7 objectAtIndexedSubscript:a3];
  [v9 attributeEditorSectionController:self didSelectSectionItem:v8];
}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  return 0;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  id v7 = [(AVTAvatarAttributeEditorSectionController *)self section];
  id v8 = [v7 sectionItems];
  unint64_t v9 = [v8 count];

  if (v9 <= a3)
  {
    double v17 = *MEMORY[0x263F001B0];
    double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    id v10 = objc_opt_class();
    id v11 = [(AVTAvatarAttributeEditorSectionController *)self section];
    double v12 = [v11 sectionItems];
    double v13 = [v12 objectAtIndexedSubscript:a3];
    double v14 = [(AVTAvatarAttributeEditorSectionController *)self section];
    id v15 = [(AVTAvatarAttributeEditorSectionController *)self environment];
    [v10 cellSizeForSectionItem:v13 inSection:v14 fittingWidth:v15 environment:width];
    double v17 = v16;
    double v19 = v18;
  }
  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.double width = v20;
  return result;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (AVTTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTIndexBasedTaskScheduler)thumbnailScheduler
{
  return self->_thumbnailScheduler;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_thumbnailScheduler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end