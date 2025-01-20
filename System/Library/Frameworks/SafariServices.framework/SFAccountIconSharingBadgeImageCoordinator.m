@interface SFAccountIconSharingBadgeImageCoordinator
- (SFAccountIconSharingBadgeImageCoordinator)initWithIconImageView:(id)a3 iconDiameter:(double)a4 parentView:(id)a5;
- (double)_badgeMaskDiameter;
- (double)_iconImageViewHeight;
- (id)_badgeImage;
- (void)_createBadgeImageViewIfNecessary;
- (void)_layOutBadgeImageViewIfNecessary;
- (void)reset;
- (void)setShowsBadge:(BOOL)a3;
@end

@implementation SFAccountIconSharingBadgeImageCoordinator

- (SFAccountIconSharingBadgeImageCoordinator)initWithIconImageView:(id)a3 iconDiameter:(double)a4 parentView:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFAccountIconSharingBadgeImageCoordinator;
  v11 = [(SFAccountIconSharingBadgeImageCoordinator *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_iconImageView, a3);
    objc_storeStrong((id *)&v12->_parentView, a5);
    float v13 = dbl_1A6A8B8E0[a4 > 40.0] * a4;
    v12->_badgeDiameter = ceilf(v13) + -2.0;
    v14 = +[SFAccountIconSharingBadgeImageProvider sharedProvider];
    [v14 addCoordinatorAsSubscriber:v12];

    v15 = v12;
  }

  return v12;
}

- (void)setShowsBadge:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsBadge = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SFAccountIconSharingBadgeImageCoordinator_setShowsBadge___block_invoke;
  v6[3] = &unk_1E5C724D8;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
  BOOL v5 = !v3;
  [(UIImageView *)self->_badgeImageView setHidden:v5];
  [(UIView *)self->_badgeMaskView setHidden:v5];
}

uint64_t __59__SFAccountIconSharingBadgeImageCoordinator_setShowsBadge___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createBadgeImageViewIfNecessary];
  v2 = *(void **)(a1 + 32);

  return [v2 _layOutBadgeImageViewIfNecessary];
}

- (void)_createBadgeImageViewIfNecessary
{
  if (!self->_badgeImageView)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    badgeMaskView = self->_badgeMaskView;
    self->_badgeMaskView = v3;

    BOOL v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)self->_badgeMaskView setBackgroundColor:v5];

    [(SFAccountIconSharingBadgeImageCoordinator *)self _badgeMaskDiameter];
    [(UIView *)self->_badgeMaskView _setCornerRadius:v6 * 0.5];
    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    v8 = [(UIView *)self->_badgeMaskView layer];
    [v8 setCompositingFilter:v7];

    [(UIView *)self->_parentView addSubview:self->_badgeMaskView];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v10 = [(SFAccountIconSharingBadgeImageCoordinator *)self _badgeImage];
    v11 = (UIImageView *)[v9 initWithImage:v10];
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = v11;

    parentView = self->_parentView;
    v14 = self->_badgeImageView;
    [(UIView *)parentView addSubview:v14];
  }
}

- (void)_layOutBadgeImageViewIfNecessary
{
  if (self->_badgeImageView)
  {
    [(SFAccountIconSharingBadgeImageCoordinator *)self _iconImageViewHeight];
    double badgeDiameter = self->_badgeDiameter;
    *(float *)&double v4 = badgeDiameter * -0.5 + v4 * 0.9;
    double v5 = floorf(*(float *)&v4);
    -[UIView convertRect:fromView:](self->_parentView, "convertRect:fromView:", self->_iconImageView, v5, v5, badgeDiameter, badgeDiameter);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    CGRect v19 = CGRectInset(v18, -1.0, -1.0);
    -[UIView setFrame:](self->_badgeMaskView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    [(UIView *)self->_parentView bringSubviewToFront:self->_badgeImageView];
    badgeMaskView = self->_badgeMaskView;
    parentView = self->_parentView;
    badgeImageView = self->_badgeImageView;
    [(UIView *)parentView insertSubview:badgeMaskView belowSubview:badgeImageView];
  }
}

- (double)_iconImageViewHeight
{
  [(UIImageView *)self->_iconImageView frame];
  return v2;
}

- (void)reset
{
  [(UIImageView *)self->_badgeImageView removeFromSuperview];
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = 0;

  [(UIView *)self->_badgeMaskView removeFromSuperview];
  badgeMaskView = self->_badgeMaskView;
  self->_badgeMaskView = 0;

  BOOL showsBadge = self->_showsBadge;

  [(SFAccountIconSharingBadgeImageCoordinator *)self setShowsBadge:showsBadge];
}

- (id)_badgeImage
{
  BOOL v3 = +[SFAccountIconSharingBadgeImageProvider sharedProvider];
  double v4 = [v3 badgeImageForDiameter:(unint64_t)self->_badgeDiameter];

  return v4;
}

- (double)_badgeMaskDiameter
{
  return self->_badgeDiameter + 2.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeMaskView, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_parentView, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end