@interface MUPhotoTileCollectionViewCell
+ (id)reuseIdentifier;
- (CGSize)targetFrameSize;
- (MUPhotoTileCollectionViewCell)initWithFrame:(CGRect)a3;
- (MUPhotoTileOverlay)photoOverlay;
- (MUPhotoTileViewModel)viewModel;
- (UIImageView)contentImageView;
- (void)setPhotoOverlay:(id)a3;
- (void)setTargetFrameSize:(CGSize)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPhotoTileCollectionViewCell

- (MUPhotoTileCollectionViewCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MUPhotoTileCollectionViewCell;
  v3 = -[MUPhotoTileCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MUPhotoTileView alloc];
    uint64_t v5 = -[MUPhotoTileView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    photoTileView = v3->_photoTileView;
    v3->_photoTileView = (MUPhotoTileView *)v5;

    v7 = [(MUPhotoTileCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_photoTileView];

    v8 = [MUEdgeLayout alloc];
    v9 = v3->_photoTileView;
    v10 = [(MUPhotoTileCollectionViewCell *)v3 contentView];
    v11 = [(MUEdgeLayout *)v8 initWithItem:v9 container:v10];
    [(MUConstraintLayout *)v11 activate];

    [(UIView *)v3 _mapsui_setCardCorner];
  }
  return v3;
}

- (MUPhotoTileViewModel)viewModel
{
  return [(MUPhotoTileView *)self->_photoTileView viewModel];
}

- (void)setViewModel:(id)a3
{
}

- (MUPhotoTileOverlay)photoOverlay
{
  return [(MUPhotoTileView *)self->_photoTileView photoOverlay];
}

- (void)setPhotoOverlay:(id)a3
{
}

- (UIImageView)contentImageView
{
  return [(MUPhotoTileView *)self->_photoTileView contentImageView];
}

- (CGSize)targetFrameSize
{
  [(MUPhotoTileView *)self->_photoTileView targetFrameSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTargetFrameSize:(CGSize)a3
{
}

+ (id)reuseIdentifier
{
  double v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end