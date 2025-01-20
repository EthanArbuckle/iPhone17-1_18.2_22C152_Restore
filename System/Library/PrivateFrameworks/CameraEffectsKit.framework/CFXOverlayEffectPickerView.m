@interface CFXOverlayEffectPickerView
- (JTCollectionView)collectionView;
- (JTCollectionViewFlowLayout)collectionViewLayout;
- (UIView)contentView;
- (id)effectPickerCellNibName;
- (id)effectPickerCellReuseIdentifier;
- (id)effectPickerNibName;
- (void)didResizeCollectionViewToSize:(CGSize)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContentView:(id)a3;
- (void)subviewsDidLoad;
- (void)updateThumbnailColumnSizeForCollectionSize;
@end

@implementation CFXOverlayEffectPickerView

- (id)effectPickerNibName
{
  return @"CFXOverlayEffectPickerView";
}

- (id)effectPickerCellNibName
{
  return @"CFXEffectPickerCollectionViewCell";
}

- (id)effectPickerCellReuseIdentifier
{
  return @"EffectCell";
}

- (void)subviewsDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CFXOverlayEffectPickerView;
  [(CFXEffectPickerView *)&v6 subviewsDidLoad];
  v3 = [(CFXOverlayEffectPickerView *)self collectionView];
  objc_msgSend(v3, "setContentInset:", 9.0, 16.0, 0.0, 16.0);

  v4 = [(CFXOverlayEffectPickerView *)self collectionViewLayout];
  [v4 setMinimumLineSpacing:16.0];

  v5 = [(CFXOverlayEffectPickerView *)self collectionViewLayout];
  [v5 setMinimumInteritemSpacing:16.0];

  [(CFXOverlayEffectPickerView *)self updateThumbnailColumnSizeForCollectionSize];
}

- (void)updateThumbnailColumnSizeForCollectionSize
{
  v3 = [(CFXOverlayEffectPickerView *)self window];

  if (v3)
  {
    v4 = [(CFXOverlayEffectPickerView *)self collectionView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(CFXOverlayEffectPickerView *)self collectionView];
    [v13 contentInset];
    CGFloat v15 = v6 + v14;
    CGFloat v17 = v8 + v16;
    CGFloat v19 = v10 - (v14 + v18);
    CGFloat v21 = v12 - (v16 + v20);

    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    double Width = CGRectGetWidth(v28);
    v23 = [(CFXOverlayEffectPickerView *)self collectionViewLayout];
    [v23 minimumInteritemSpacing];
    double v25 = (4.0 + -1.0) * v24;

    double v26 = floor((Width - v25) / 4.0);
    if (v26 > 0.0)
    {
      -[CFXEffectPickerView setThumbnailSize:](self, "setThumbnailSize:", v26, v26);
      -[CFXEffectPickerView setCellSize:](self, "setCellSize:", v26, v26);
    }
  }
}

- (void)didResizeCollectionViewToSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXOverlayEffectPickerView;
  -[CFXEffectPickerView didResizeCollectionViewToSize:](&v4, sel_didResizeCollectionViewToSize_, a3.width, a3.height);
  [(CFXOverlayEffectPickerView *)self updateThumbnailColumnSizeForCollectionSize];
}

- (UIView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (UIView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (JTCollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (JTCollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (JTCollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_contentView);
}

@end