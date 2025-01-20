@interface AVTAvatarListCell
+ (id)reuseIdentifier;
- (AVTAvatarListCell)initWithFrame:(CGRect)a3;
- (AVTAvatarRecord)avatar;
- (AVTImageTransitioningContainerView)containerView;
- (AVTStickerConfiguration)configuration;
- (AVTView)avtView;
- (CGSize)aspectRatio;
- (UIImage)image;
- (UIView)avtViewContainer;
- (id)snapshotViewAfterScreenUpdates:(BOOL)a3;
- (void)applyFullAlpha;
- (void)beginUsingAVTViewFromSession:(id)a3;
- (void)downcastWithCellHandler:(id)a3 listCellHandler:(id)a4;
- (void)endUsingAVTView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAspectRatio:(CGSize)a3;
- (void)setAvatar:(id)a3;
- (void)setAvtView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setImageViewVisible:(BOOL)a3;
- (void)transitionLiveViewToFront;
- (void)transitionStaticViewToFront;
@end

@implementation AVTAvatarListCell

+ (id)reuseIdentifier
{
  return @"listCell";
}

- (AVTAvatarListCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarListCell;
  v3 = -[AVTAvatarListCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(AVTAvatarListCell *)v3 contentView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    v14 = -[AVTImageTransitioningContainerView initWithFrame:]([AVTImageTransitioningContainerView alloc], "initWithFrame:", v7, v9, v11, v13);
    containerView = v4->_containerView;
    v4->_containerView = v14;

    v16 = [(AVTAvatarListCell *)v4 contentView];
    [v16 addSubview:v4->_containerView];
  }
  return v4;
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  return 0;
}

- (UIImage)image
{
  v2 = [(AVTAvatarListCell *)self containerView];
  v3 = [v2 staticImage];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarListCell *)self containerView];
  [v5 setStaticImage:v4];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AVTAvatarListCell *)self containerView];
  [v7 setStaticImage:v6 animated:v4];
}

- (UIView)avtViewContainer
{
  v2 = [(AVTAvatarListCell *)self containerView];
  v3 = [v2 liveView];

  return (UIView *)v3;
}

- (void)setAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AVTAvatarListCell *)self aspectRatio];
  if (v7 != width || v6 != height)
  {
    double v9 = [(AVTAvatarListCell *)self containerView];
    objc_msgSend(v9, "setAspectRatio:", width, height);

    [(AVTAvatarListCell *)self setNeedsLayout];
  }
}

- (CGSize)aspectRatio
{
  v2 = [(AVTAvatarListCell *)self containerView];
  [v2 aspectRatio];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)beginUsingAVTViewFromSession:(id)a3
{
  id v4 = a3;
  double v5 = [v4 avtView];
  [(AVTAvatarListCell *)self setAvtView:v5];

  id v7 = [(AVTAvatarListCell *)self containerView];
  double v6 = [v4 avtViewContainer];

  [v7 setLiveView:v6];
}

- (void)endUsingAVTView
{
  double v3 = [(AVTAvatarListCell *)self containerView];
  [v3 setLiveView:0];

  [(AVTAvatarListCell *)self setAvtView:0];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarListCell;
  [(AVTAvatarListCell *)&v19 layoutSubviews];
  double v3 = [(AVTAvatarListCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(AVTAvatarListCell *)self containerView];
  [v12 frame];
  v21.origin.x = v13;
  v21.origin.y = v14;
  v21.size.double width = v15;
  v21.size.double height = v16;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.double width = v9;
  v20.size.double height = v11;
  BOOL v17 = CGRectEqualToRect(v20, v21);

  if (!v17)
  {
    objc_super v18 = [(AVTAvatarListCell *)self containerView];
    objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)prepareForReuse
{
  [(AVTAvatarListCell *)self transitionStaticViewToFront];
  [(AVTAvatarListCell *)self setImage:0];
  [(AVTAvatarListCell *)self setImageViewVisible:1];
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarListCell;
  [(AVTAvatarListCell *)&v3 prepareForReuse];
}

- (void)setImageViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVTAvatarListCell *)self containerView];
  [v4 setStaticViewVisible:v3];
}

- (void)transitionStaticViewToFront
{
  id v2 = [(AVTAvatarListCell *)self containerView];
  [v2 transitionStaticViewToFront];
}

- (void)transitionLiveViewToFront
{
  id v2 = [(AVTAvatarListCell *)self containerView];
  [v2 transitionLiveViewToFront];
}

- (void)applyFullAlpha
{
  id v2 = [(AVTAvatarListCell *)self containerView];
  [v2 setAlpha:1.0];
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
}

- (AVTAvatarRecord)avatar
{
  return self->_avatar;
}

- (void)setAvatar:(id)a3
{
}

- (AVTStickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (AVTImageTransitioningContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
}

- (void)downcastWithCellHandler:(id)a3 listCellHandler:(id)a4
{
  if (a4)
  {
    id v4 = (void (*)(id, AVTAvatarListCell *))*((void *)a4 + 2);
    v4(a4, self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTAvatarListCell;
    -[UICollectionViewCell downcastWithCellHandler:listCellHandler:](&v5, sel_downcastWithCellHandler_listCellHandler_, a3);
  }
}

@end