@interface AVTAvatarAttributeEditorSectionColorDataSource
+ (id)selectedItemFromItems:(id)a3;
+ (int64_t)indexOfItem:(id)a3 inItems:(id)a4;
- (AVTAvatarAttributeEditorColorSection)colorSection;
- (AVTAvatarAttributeEditorSectionColorDataSource)init;
- (AVTAvatarAttributeEditorSectionColorDataSourceDelegate)delegate;
- (BOOL)isShowingExtended;
- (BOOL)isShowingSlider;
- (id)indexPathOfExtendedIcon;
- (id)sectionItemAtIndex:(int64_t)a3;
- (int64_t)displayMode;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)selectedExtendedColorIndex;
- (int64_t)selectedItemIndex;
- (int64_t)selectedPrimaryColorIndex;
- (void)resetToDefaultDisplayMode;
- (void)selectSectionItemAtIndexPath:(id)a3;
- (void)setColorSection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setSelectedExtendedColorIndex:(int64_t)a3;
- (void)setSelectedPrimaryColorIndex:(int64_t)a3;
- (void)toggleExtendedMode;
- (void)toggleSliderMode;
- (void)updateSelectedIndexesSelectingItem:(id)a3 fromUserInteraction:(BOOL)a4;
@end

@implementation AVTAvatarAttributeEditorSectionColorDataSource

+ (id)selectedItemFromItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isSelected", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (int64_t)indexOfItem:(id)a3 inItems:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__AVTAvatarAttributeEditorSectionColorDataSource_indexOfItem_inItems___block_invoke;
  v9[3] = &unk_263FF26B0;
  id v10 = v5;
  id v6 = v5;
  int64_t v7 = [a4 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __70__AVTAvatarAttributeEditorSectionColorDataSource_indexOfItem_inItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 color];
  id v4 = [*(id *)(a1 + 32) color];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (AVTAvatarAttributeEditorSectionColorDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorSectionColorDataSource;
  result = [(AVTAvatarAttributeEditorSectionColorDataSource *)&v3 init];
  if (result) {
    *(int64x2_t *)&result->_selectedPrimaryColorIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

- (void)setColorSection:(id)a3
{
  uint64_t v5 = (AVTAvatarAttributeEditorColorSection *)a3;
  if (self->_colorSection != v5)
  {
    v15 = v5;
    id v6 = [(AVTAvatarAttributeEditorColorSection *)v5 identifier];
    int64_t v7 = [(AVTAvatarAttributeEditorColorSection *)self->_colorSection identifier];
    char v8 = [v6 isEqualToString:v7];

    objc_storeStrong((id *)&self->_colorSection, a3);
    if ((v8 & 1) == 0) {
      [(AVTAvatarAttributeEditorSectionColorDataSource *)self resetToDefaultDisplayMode];
    }
    long long v9 = objc_opt_class();
    id v10 = [(AVTAvatarAttributeEditorColorSection *)v15 primaryItems];
    long long v11 = [v9 selectedItemFromItems:v10];

    if (!v11 || [(AVTAvatarAttributeEditorColorSection *)v15 alwaysShowExtended])
    {
      long long v12 = objc_opt_class();
      v13 = [(AVTAvatarAttributeEditorColorSection *)v15 extendedItems];
      uint64_t v14 = [v12 selectedItemFromItems:v13];

      long long v11 = (void *)v14;
    }
    [(AVTAvatarAttributeEditorSectionColorDataSource *)self updateSelectedIndexesSelectingItem:v11 fromUserInteraction:0];

    uint64_t v5 = v15;
  }
}

- (int64_t)selectedItemIndex
{
  if ([(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended])
  {
    return [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedExtendedColorIndex];
  }
  else if ([(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedPrimaryColorIndex] == 0x7FFFFFFFFFFFFFFFLL&& [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedExtendedColorIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self indexPathOfExtendedIcon];
    int64_t v5 = [v4 item];

    return v5;
  }
  else
  {
    return [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedPrimaryColorIndex];
  }
}

- (void)updateSelectedIndexesSelectingItem:(id)a3 fromUserInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  int64_t v6 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedItemIndex];
  if (v19)
  {
    int64_t v7 = objc_opt_class();
    char v8 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
    long long v9 = [v8 primaryItems];
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedPrimaryColorIndex:](self, "setSelectedPrimaryColorIndex:", [v7 indexOfItem:v19 inItems:v9]);

    id v10 = objc_opt_class();
    long long v11 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
    long long v12 = [v11 extendedItems];
    -[AVTAvatarAttributeEditorSectionColorDataSource setSelectedExtendedColorIndex:](self, "setSelectedExtendedColorIndex:", [v10 indexOfItem:v19 inItems:v12]);
  }
  else
  {
    [(AVTAvatarAttributeEditorSectionColorDataSource *)self setSelectedPrimaryColorIndex:0x7FFFFFFFFFFFFFFFLL];
    [(AVTAvatarAttributeEditorSectionColorDataSource *)self setSelectedExtendedColorIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  int64_t v13 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedItemIndex];
  if (v13 != v6 || v4)
  {
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self delegate];
      [v14 colorDataSource:self didDeselectItemAtIndex:v6 shouldReloadModel:v4];
    }
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self delegate];
      objc_msgSend(v15, "colorDataSource:didSelectItemAtIndex:shouldReloadModel:", self, -[AVTAvatarAttributeEditorSectionColorDataSource selectedItemIndex](self, "selectedItemIndex"), v4);
    }
  }
  BOOL v16 = ![(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended]
     && [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedPrimaryColorIndex] == 0x7FFFFFFFFFFFFFFFLL;
  BOOL v17 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingSlider];
  int v18 = v13 == 0x7FFFFFFFFFFFFFFFLL || v16;
  if (v17 && v18) {
    [(AVTAvatarAttributeEditorSectionColorDataSource *)self toggleSliderMode];
  }
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
  {
    int64_t v5 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self displayMode];
    self->_displayMode = a3;
    id v6 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self delegate];
    [v6 colorDataSource:self didChangeDisplayMode:a3 previousDisplayMode:v5];
  }
}

- (BOOL)isShowingSlider
{
  return ([(AVTAvatarAttributeEditorSectionColorDataSource *)self displayMode] & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)isShowingExtended
{
  return ([(AVTAvatarAttributeEditorSectionColorDataSource *)self displayMode] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)toggleSliderMode
{
  BOOL v3 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingSlider];
  BOOL v4 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended];
  uint64_t v5 = 2;
  if (!v3) {
    uint64_t v5 = 3;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = !v3;
  }
  [(AVTAvatarAttributeEditorSectionColorDataSource *)self setDisplayMode:v6];
}

- (void)toggleExtendedMode
{
  BOOL v3 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingSlider];
  BOOL v4 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended];
  uint64_t v5 = 2;
  if (v3) {
    uint64_t v5 = 3;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  [(AVTAvatarAttributeEditorSectionColorDataSource *)self setDisplayMode:v6];
}

- (void)resetToDefaultDisplayMode
{
  uint64_t v5 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  if ([v5 alwaysShowExtended])
  {

LABEL_3:
    uint64_t v6 = 2;
    goto LABEL_15;
  }
  int64_t v7 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  char v8 = [v7 primaryItems];
  if (v8)
  {
    v2 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
    BOOL v3 = [v2 primaryItems];
    if ([v3 count]) {
      goto LABEL_12;
    }
  }
  long long v9 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  uint64_t v10 = [v9 extendedItems];
  if (!v10)
  {

    if (!v8)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:

    goto LABEL_13;
  }
  long long v11 = (void *)v10;
  long long v12 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  int64_t v13 = [v12 extendedItems];
  uint64_t v14 = [v13 count];

  if (v8)
  {
  }
  if (v14) {
    goto LABEL_3;
  }
LABEL_14:
  uint64_t v6 = 0;
LABEL_15:
  [(AVTAvatarAttributeEditorSectionColorDataSource *)self setDisplayMode:v6];
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  BOOL v4 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  uint64_t v5 = [v4 primaryItems];
  int64_t v6 = [v5 count];

  BOOL v7 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended];
  char v8 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  long long v9 = [v8 extendedItems];
  uint64_t v10 = v9;
  if (v7)
  {
    int64_t v6 = [v9 count];

LABEL_7:
    return v6;
  }
  if (!v9) {
    goto LABEL_7;
  }
  long long v11 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
  long long v12 = [v11 extendedItems];
  uint64_t v13 = [v12 count];

  if (v13) {
    ++v6;
  }
  return v6;
}

- (id)sectionItemAtIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = 0;
  }
  else
  {
    int64_t v6 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    BOOL v7 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self indexPathOfExtendedIcon];
    char v8 = [v6 isEqual:v7];

    BOOL v3 = 0;
    if ((v8 & 1) == 0)
    {
      BOOL v9 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended];
      uint64_t v10 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
      long long v11 = v10;
      if (v9) {
        [v10 extendedItems];
      }
      else {
      long long v12 = [v10 primaryItems];
      }

      if ([v12 count] <= (unint64_t)a3) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Index of out of currently showing colors bounds"];
      }
      BOOL v3 = [v12 objectAtIndexedSubscript:a3];
    }
  }
  return v3;
}

- (void)selectSectionItemAtIndexPath:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self indexPathOfExtendedIcon];
  int v5 = [v13 isEqual:v4];

  if (v5)
  {
    [(AVTAvatarAttributeEditorSectionColorDataSource *)self toggleExtendedMode];
    int64_t v6 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self sectionItemAtIndex:[(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedItemIndex]];
  }
  else
  {
    int64_t v7 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self selectedItemIndex];
    uint64_t v8 = [v13 row];
    int64_t v6 = -[AVTAvatarAttributeEditorSectionColorDataSource sectionItemAtIndex:](self, "sectionItemAtIndex:", [v13 item]);
    BOOL v9 = [v6 color];
    int v10 = [v9 canShowSlider];

    BOOL v11 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingSlider];
    if (v7 == v8) {
      char v12 = 0;
    }
    else {
      char v12 = v10;
    }
    if (v11 && (v12 & 1) == 0
      || ![(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingSlider]
      && ((v10 ^ 1) & 1) == 0)
    {
      [(AVTAvatarAttributeEditorSectionColorDataSource *)self toggleSliderMode];
    }
  }
  [(AVTAvatarAttributeEditorSectionColorDataSource *)self updateSelectedIndexesSelectingItem:v6 fromUserInteraction:1];
}

- (id)indexPathOfExtendedIcon
{
  if (![(AVTAvatarAttributeEditorSectionColorDataSource *)self isShowingExtended])
  {
    BOOL v3 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
    uint64_t v4 = [v3 extendedItems];
    if (v4)
    {
      int v5 = (void *)v4;
      int64_t v6 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
      int64_t v7 = [v6 extendedItems];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        BOOL v9 = [(AVTAvatarAttributeEditorSectionColorDataSource *)self colorSection];
        int v10 = [v9 primaryItems];
        uint64_t v11 = [v10 count];

        char v12 = [MEMORY[0x263F088C8] indexPathForItem:v11 inSection:0];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  char v12 = 0;
LABEL_7:
  return v12;
}

- (AVTAvatarAttributeEditorColorSection)colorSection
{
  return self->_colorSection;
}

- (AVTAvatarAttributeEditorSectionColorDataSourceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AVTAvatarAttributeEditorSectionColorDataSourceDelegate *)a3;
}

- (int64_t)selectedPrimaryColorIndex
{
  return self->_selectedPrimaryColorIndex;
}

- (void)setSelectedPrimaryColorIndex:(int64_t)a3
{
  self->_selectedPrimaryColorIndex = a3;
}

- (int64_t)selectedExtendedColorIndex
{
  return self->_selectedExtendedColorIndex;
}

- (void)setSelectedExtendedColorIndex:(int64_t)a3
{
  self->_selectedExtendedColorIndex = a3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void).cxx_destruct
{
}

@end