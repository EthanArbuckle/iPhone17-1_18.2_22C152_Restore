@interface GKDashboardPlayerShadowView
- (BOOL)dimmed;
- (BOOL)isUsingPlaceholder;
- (GKDashboardPlayerPhotoView)photoView;
- (GKDashboardPlayerShadowView)initWithFrame:(CGRect)a3;
- (GKPlayer)player;
- (UICollectionViewCell)parentCell;
- (UIView)parentView;
- (void)awakeFromNib;
- (void)invalidatePhoto;
- (void)layoutSubviews;
- (void)setDimmed:(BOOL)a3;
- (void)setParentCell:(id)a3;
- (void)setPhotoView:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setupPhoto;
@end

@implementation GKDashboardPlayerShadowView

- (GKDashboardPlayerShadowView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerShadowView;
  v3 = -[GKDashboardPlayerShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GKDashboardPlayerShadowView *)v3 setupPhoto];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardPlayerShadowView;
  [(GKDashboardPlayerShadowView *)&v3 awakeFromNib];
  [(GKDashboardPlayerShadowView *)self setupPhoto];
}

- (void)setupPhoto
{
  objc_super v3 = [GKDashboardPlayerPhotoView alloc];
  [(GKDashboardPlayerShadowView *)self bounds];
  v4 = -[GKDashboardPlayerPhotoView initWithFrame:](v3, "initWithFrame:");
  [(GKDashboardPlayerShadowView *)self setPhotoView:v4];

  v5 = [(GKDashboardPlayerShadowView *)self photoView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = [(GKDashboardPlayerShadowView *)self photoView];
  [(GKDashboardPlayerShadowView *)self addSubview:v6];

  v7 = (void *)MEMORY[0x1E4F28DC8];
  id v9 = [(GKDashboardPlayerShadowView *)self photoView];
  v8 = objc_msgSend(v7, "_gkConstraintsForView:withinView:insets:", v9, self, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(GKDashboardPlayerShadowView *)self addConstraints:v8];
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  v5 = [(GKDashboardPlayerShadowView *)self photoView];
  [v5 setPlayer:v4];

  id v6 = [(GKDashboardPlayerShadowView *)self parentView];
  [v6 setNeedsDisplay];
}

- (GKPlayer)player
{
  v2 = [(GKDashboardPlayerShadowView *)self photoView];
  objc_super v3 = [v2 player];

  return (GKPlayer *)v3;
}

- (void)invalidatePhoto
{
  id v2 = [(GKDashboardPlayerShadowView *)self photoView];
  [v2 invalidatePhoto];
}

- (UIView)parentView
{
  parentCell = self->_parentCell;
  if (parentCell)
  {
    objc_super v3 = parentCell;
  }
  else
  {
    objc_super v3 = [(GKDashboardPlayerShadowView *)self superview];
  }

  return (UIView *)v3;
}

- (BOOL)isUsingPlaceholder
{
  id v2 = [(GKDashboardPlayerShadowView *)self photoView];
  char v3 = [v2 isUsingPlaceholder];

  return v3;
}

- (BOOL)dimmed
{
  id v2 = [(GKDashboardPlayerShadowView *)self photoView];
  char v3 = [v2 dimmed];

  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKDashboardPlayerShadowView *)self photoView];
  [v4 setDimmed:v3];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)GKDashboardPlayerShadowView;
  [(GKDashboardPlayerShadowView *)&v2 layoutSubviews];
}

- (UICollectionViewCell)parentCell
{
  return self->_parentCell;
}

- (void)setParentCell:(id)a3
{
  self->_parentCell = (UICollectionViewCell *)a3;
}

- (GKDashboardPlayerPhotoView)photoView
{
  return self->_photoView;
}

- (void)setPhotoView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end