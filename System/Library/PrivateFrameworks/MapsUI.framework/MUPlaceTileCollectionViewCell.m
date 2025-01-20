@interface MUPlaceTileCollectionViewCell
+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5;
+ (id)reuseIdentifier;
- (MUPlaceTileCellConfiguration)cellConfiguration;
- (MUPlaceTileViewModel)viewModel;
- (UIImageView)tileImageView;
- (void)_addSelectionBadgeIfNeeded;
- (void)_updateAccessoryViewsForCurrentCellConfiguration;
- (void)_updateSelectionBadgeState;
- (void)_updateTemplateViewWithOldCellConfiguration:(id)a3;
- (void)setCellConfiguration:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceTileCollectionViewCell

- (UIImageView)tileImageView
{
  return (UIImageView *)[(MUPlaceTileTemplateView *)self->_tileContentView tileImageView];
}

- (void)setViewModel:(id)a3
{
}

- (MUPlaceTileViewModel)viewModel
{
  return (MUPlaceTileViewModel *)[(MUPlaceTileTemplateView *)self->_tileContentView viewModel];
}

- (void)setCellConfiguration:(id)a3
{
  id v8 = a3;
  if ((-[MUPlaceTileCellConfiguration isEqual:](self->_cellConfiguration, "isEqual:") & 1) == 0)
  {
    cellConfiguration = self->_cellConfiguration;
    v5 = (MUPlaceTileCellConfiguration *)v8;
    v6 = self->_cellConfiguration;
    self->_cellConfiguration = v5;
    v7 = cellConfiguration;

    [(MUPlaceTileCollectionViewCell *)self _updateTemplateViewWithOldCellConfiguration:v7];
  }
}

- (void)_updateTemplateViewWithOldCellConfiguration:(id)a3
{
  [(MUPlaceTileTemplateView *)self->_tileContentView removeFromSuperview];
  unint64_t v4 = [(MUPlaceTileCellConfiguration *)self->_cellConfiguration variant];
  if (v4 > 2) {
    v5 = 0;
  }
  else {
    v5 = (MUPlaceTileTemplateView *)[objc_alloc(*off_1E5750210[v4]) initWithCellConfiguration:self->_cellConfiguration];
  }
  tileContentView = self->_tileContentView;
  self->_tileContentView = v5;
  v7 = v5;

  id v8 = [(MUPlaceTileCollectionViewCell *)self viewModel];
  [(MUPlaceTileTemplateView *)v7 setViewModel:v8];

  v9 = [(MUPlaceTileCollectionViewCell *)self contentView];
  [v9 addSubview:v7];

  v10 = [MUEdgeLayout alloc];
  v11 = [(MUPlaceTileCollectionViewCell *)self contentView];
  v12 = [(MUEdgeLayout *)v10 initWithItem:v7 container:v11];

  [(MUConstraintLayout *)v12 activate];
  [(MUPlaceTileCollectionViewCell *)self _updateAccessoryViewsForCurrentCellConfiguration];
}

- (void)_updateAccessoryViewsForCurrentCellConfiguration
{
  [(UIImageView *)self->_selectionBadgeView setHidden:1];
  if (![(MUPlaceTileCellConfiguration *)self->_cellConfiguration variant])
  {
    [(MUPlaceTileCollectionViewCell *)self _addSelectionBadgeIfNeeded];
  }
}

- (void)_addSelectionBadgeIfNeeded
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ([(MUPlaceTileCellConfiguration *)self->_cellConfiguration showSelectionControlWhileEditing])
  {
    selectionBadgeView = self->_selectionBadgeView;
    if (!selectionBadgeView)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
      v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v6 = self->_selectionBadgeView;
      self->_selectionBadgeView = v5;

      [(UIImageView *)self->_selectionBadgeView setAccessibilityIdentifier:@"PlaceTileSelectionBadge"];
      [(UIImageView *)self->_selectionBadgeView setHidden:1];
      selectionBadgeView = self->_selectionBadgeView;
    }
    v7 = [(UIImageView *)selectionBadgeView superview];
    id v8 = [(MUPlaceTileCollectionViewCell *)self contentView];

    v9 = [(MUPlaceTileCollectionViewCell *)self contentView];
    v10 = v9;
    v11 = self->_selectionBadgeView;
    if (v7 == v8)
    {
      [v9 bringSubviewToFront:v11];
    }
    else
    {
      [v9 addSubview:v11];

      v10 = [MEMORY[0x1E4F1CA48] array];
      v12 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_selectionBadgeView, 24.0, 24.0);
      [v10 addObject:v12];
      v13 = [MUBoxLayout alloc];
      v14 = [(MUPlaceTileCollectionViewCell *)self contentView];
      v15 = [(MUBoxLayout *)v13 initWithContainer:v14];

      v17[0] = self->_selectionBadgeView;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [(MUBoxLayout *)v15 setArrangedLayoutItems:v16];

      [(MUBoxLayout *)v15 setHorizontalAlignment:3];
      [(MUBoxLayout *)v15 setVerticalAlignment:1];
      -[MUBoxLayout setOffset:forArrangedLayoutItem:](v15, "setOffset:forArrangedLayoutItem:", self->_selectionBadgeView, -16.0, 16.0);
      [v10 addObject:v15];
      objc_msgSend(MEMORY[0x1E4F28DC8], "_mapsui_activateLayouts:", v10);
    }
    [(MUPlaceTileCollectionViewCell *)self _updateSelectionBadgeState];
  }
}

- (void)_updateSelectionBadgeState
{
  if ([(MUPlaceTileCellConfiguration *)self->_cellConfiguration showSelectionControlWhileEditing])
  {
    v3 = [(MUPlaceTileCollectionViewCell *)self configurationState];
    int v4 = [v3 isEditing];

    if (v4)
    {
      v5 = [(MUPlaceTileCollectionViewCell *)self configurationState];
      int v6 = [v5 isSelected];

      if (v6)
      {
        v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
        id v8 = [v7 imageWithRenderingMode:1];
        objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_accentColor");
      }
      else
      {
        v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
        id v8 = [v7 imageWithRenderingMode:1];
        [MEMORY[0x1E4FB1618] whiteColor];
      v9 = };
      v10 = [v8 imageWithTintColor:v9];
      [(UIImageView *)self->_selectionBadgeView setImage:v10];
    }
    selectionBadgeView = self->_selectionBadgeView;
    [(UIImageView *)selectionBadgeView setHidden:v4 ^ 1u];
  }
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (CGSize)preferredSizeForViewModels:(id)a3 cellConfiguration:(id)a4 usingMeasurements:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 variant];
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      v11 = MUPlaceCompactTileContentView;
      goto LABEL_6;
    }
    if (v10)
    {
      double v13 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_8;
    }
  }
  v11 = MUPlaceTileContentView;
LABEL_6:
  [(__objc2_class *)v11 preferredSizeForViewModels:v7 cellConfiguration:v8 usingMeasurements:v9];
  double v13 = v12;
  double v15 = v14;
LABEL_8:

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (MUPlaceTileCellConfiguration)cellConfiguration
{
  return self->_cellConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConfiguration, 0);
  objc_storeStrong((id *)&self->_selectionBadgeView, 0);
  objc_storeStrong((id *)&self->_tileContentView, 0);
}

@end