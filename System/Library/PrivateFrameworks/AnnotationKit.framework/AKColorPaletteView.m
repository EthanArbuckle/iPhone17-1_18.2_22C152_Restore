@interface AKColorPaletteView
- (AKColorPaletteView)initWithCoder:(id)a3;
- (AKColorPaletteView)initWithFrame:(CGRect)a3;
- (BOOL)wantsInkUpdate;
- (CGSize)_itemSizeInContainer;
- (NSArray)colors;
- (UICollectionView)collectionView;
- (UIColor)color;
- (id)_indexPathOfColor:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)scrollDirection;
- (void)_commonInit;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
- (void)scrollToCurrentColor;
- (void)setCollectionView:(id)a3;
- (void)setColor:(id)a3;
- (void)setColors:(id)a3;
- (void)setScrollDirection:(int64_t)a3;
@end

@implementation AKColorPaletteView

- (AKColorPaletteView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKColorPaletteView;
  v3 = [(AKColorPaletteView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKColorPaletteView *)v3 _commonInit];
  }
  return v4;
}

- (AKColorPaletteView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKColorPaletteView;
  v3 = -[AKColorPaletteView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKColorPaletteView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v30[8] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C550] whiteColor];
  v30[0] = v3;
  v4 = [MEMORY[0x263F1C550] blackColor];
  v30[1] = v4;
  v5 = [MEMORY[0x263F1C550] akColorPickerPurple];
  v30[2] = v5;
  objc_super v6 = [MEMORY[0x263F1C550] akColorPickerBlue];
  v30[3] = v6;
  v7 = [MEMORY[0x263F1C550] akColorPickerGreen];
  v30[4] = v7;
  v8 = [MEMORY[0x263F1C550] akColorPickerYellow];
  v30[5] = v8;
  v9 = [MEMORY[0x263F1C550] akColorPickerOrange];
  v30[6] = v9;
  v10 = [MEMORY[0x263F1C550] akColorPickerRed];
  v30[7] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:8];
  [(AKColorPaletteView *)self setColors:v11];

  v12 = objc_opt_new();
  [v12 setScrollDirection:0];
  [v12 setMinimumInteritemSpacing:0.0];
  [v12 setMinimumLineSpacing:0.0];
  [(AKColorPaletteView *)self _itemSizeInContainer];
  objc_msgSend(v12, "setItemSize:");
  id v13 = objc_alloc(MEMORY[0x263F1C4E0]);
  [(AKColorPaletteView *)self frame];
  v14 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v12);
  [(AKColorPaletteView *)self setCollectionView:v14];

  v15 = [(AKColorPaletteView *)self collectionView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(AKColorPaletteView *)self collectionView];
  [v16 setDelegate:self];

  v17 = [(AKColorPaletteView *)self collectionView];
  [v17 setDataSource:self];

  v18 = [(AKColorPaletteView *)self collectionView];
  [v18 setPagingEnabled:1];

  v19 = [(AKColorPaletteView *)self collectionView];
  [v19 setShowsHorizontalScrollIndicator:0];

  v20 = [(AKColorPaletteView *)self collectionView];
  [v20 setShowsVerticalScrollIndicator:0];

  v21 = [MEMORY[0x263F1C550] clearColor];
  v22 = [(AKColorPaletteView *)self collectionView];
  [v22 setBackgroundColor:v21];

  v23 = [(AKColorPaletteView *)self collectionView];
  [v23 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"AnnotationKit.colorPickerReuseIdentifier"];

  v24 = [(AKColorPaletteView *)self collectionView];
  [(AKColorPaletteView *)self addSubview:v24];

  v25 = _NSDictionaryOfVariableBindings(&cfstr_Collectionview.isa, self->_collectionView, 0);
  v26 = (void *)MEMORY[0x263F08938];
  v27 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:0 views:v25];
  [v26 activateConstraints:v27];

  v28 = (void *)MEMORY[0x263F08938];
  v29 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:0 views:v25];
  [v28 activateConstraints:v29];
}

- (void)setScrollDirection:(int64_t)a3
{
  self->_scrollDirection = a3;
  id v8 = (id)objc_opt_new();
  [v8 setScrollDirection:self->_scrollDirection];
  [v8 setMinimumInteritemSpacing:0.0];
  [v8 setMinimumLineSpacing:0.0];
  if ([(AKColorPaletteView *)self scrollDirection])
  {
    objc_msgSend(v8, "setSectionInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    v4 = [(AKColorPaletteView *)self colors];
    v5 = [v4 reverseObjectEnumerator];
    objc_super v6 = [v5 allObjects];
    [(AKColorPaletteView *)self setColors:v6];
  }
  else
  {
    objc_msgSend(v8, "setSectionInset:", 4.0, 4.0, 4.0, 4.0);
  }
  [(AKColorPaletteView *)self _itemSizeInContainer];
  objc_msgSend(v8, "setItemSize:");
  v7 = [(AKColorPaletteView *)self collectionView];
  [v7 setCollectionViewLayout:v8 animated:0];
}

- (void)layoutSubviews
{
  v3 = [(AKColorPaletteView *)self collectionView];
  id v4 = [v3 collectionViewLayout];

  [(AKColorPaletteView *)self _itemSizeInContainer];
  objc_msgSend(v4, "setItemSize:");
}

- (void)scrollToCurrentColor
{
  v3 = [(AKColorPaletteView *)self color];

  if (v3)
  {
    id v4 = [(AKColorPaletteView *)self color];
    id v7 = [(AKColorPaletteView *)self _indexPathOfColor:v4];

    v5 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, objc_msgSend(v7, "section"));
    if (v7)
    {
      objc_super v6 = [(AKColorPaletteView *)self collectionView];
      [v6 scrollToItemAtIndexPath:v5 atScrollPosition:8 animated:0];
    }
  }
}

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v11 = v5;
    objc_super v6 = [MEMORY[0x263EFF9C0] set];
    id v7 = [(AKColorPaletteView *)self _indexPathOfColor:self->_color];
    id v8 = [(AKColorPaletteView *)self _indexPathOfColor:v11];
    objc_storeStrong((id *)&self->_color, a3);
    if (v7) {
      [v6 addObject:v7];
    }
    if (v8) {
      [v6 addObject:v8];
    }
    if ([v6 count])
    {
      v9 = [(AKColorPaletteView *)self collectionView];
      v10 = [v6 allObjects];
      [v9 reloadItemsAtIndexPaths:v10];
    }
    v5 = v11;
  }
}

- (CGSize)_itemSizeInContainer
{
  v3 = [(AKColorPaletteView *)self colors];
  unint64_t v4 = [v3 count];

  [(AKColorPaletteView *)self frame];
  BOOL IsEmpty = CGRectIsEmpty(v13);
  double v6 = 24.0;
  double Height = 24.0;
  if (!IsEmpty)
  {
    [(AKColorPaletteView *)self frame];
    double Height = CGRectGetHeight(v14);
    [(AKColorPaletteView *)self frame];
    double Width = CGRectGetWidth(v15);
    if ([(AKColorPaletteView *)self scrollDirection])
    {
      double v9 = (Width + (double)v4 * -24.0) / (double)v4;
      if (v9 <= 0.0) {
        double v6 = 24.0;
      }
      else {
        double v6 = v9 + 24.0;
      }
    }
    else
    {
      double v6 = Width + -8.0;
      double v10 = (Height + -8.0 + (double)v4 * -39.0) / (double)v4;
      if (v10 <= 4.0) {
        double Height = 43.0;
      }
      else {
        double Height = v10 + 39.0;
      }
    }
  }
  double v11 = Height;
  result.height = v11;
  result.width = v6;
  return result;
}

- (id)_indexPathOfColor:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(AKColorPaletteView *)self colors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v4 akIsEqualToColor:v11])
        {
          v12 = [(AKColorPaletteView *)self colors];
          uint64_t v9 = [v12 indexOfObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      CGRect v13 = [MEMORY[0x263F088C8] indexPathForItem:v9 inSection:0];
      goto LABEL_14;
    }
  }
  else
  {
  }
  CGRect v13 = 0;
LABEL_14:

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AKColorPaletteView *)self colors];
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndexedSubscript:v7];
  [(AKColorPaletteView *)self setColor:v8];

  [(AKColorPaletteView *)self sendActionsForControlEvents:4096];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(AKColorPaletteView *)self colors];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"AnnotationKit.colorPickerReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [v7 viewWithTag:1001];
  uint64_t v9 = (void *)v8;
  if (v7 && !v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    [v9 setContentMode:9];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setTag:1001];
    [v9 setClipsToBounds:0];
    double v10 = [v7 contentView];
    [v10 addSubview:v9];

    int64_t v11 = [(AKColorPaletteView *)self scrollDirection];
    double v12 = 39.0;
    if (v11) {
      double v12 = 24.0;
    }
    CGRect v13 = [NSNumber numberWithDouble:v12];
    CGRect v14 = _NSDictionaryOfVariableBindings(&cfstr_ImageviewSize.isa, v9, v13, 0);
    long long v15 = (void *)MEMORY[0x263F08938];
    long long v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[imageView(size)]" options:0 metrics:v14 views:v14];
    [v15 activateConstraints:v16];

    long long v17 = (void *)MEMORY[0x263F08938];
    long long v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[imageView(size)]" options:0 metrics:v14 views:v14];
    [v17 activateConstraints:v18];

    v19 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
    [v19 setActive:1];

    uint64_t v20 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v7 attribute:10 multiplier:1.0 constant:0.0];
    [v20 setActive:1];
  }
  v21 = [(AKColorPaletteView *)self colors];
  uint64_t v22 = [v6 row];

  v23 = [v21 objectAtIndexedSubscript:v22];

  v24 = [(AKColorPaletteView *)self color];
  uint64_t v25 = [v24 akIsEqualToColor:v23];

  int64_t v26 = [(AKColorPaletteView *)self scrollDirection];
  double v27 = 39.0;
  if (v26) {
    double v27 = 24.0;
  }
  v28 = objc_msgSend(MEMORY[0x263F1C6B0], "ak_colorSwatchPickerImageWithColor:size:selected:", v23, v25, v27, v27);
  [v9 setImage:v28];

  return v7;
}

- (BOOL)wantsInkUpdate
{
  return 1;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end