@interface SCATModernMenuContentViewContainer
- (CGSize)intrinsicContentSize;
- (NSArray)contentViewConstraints;
- (SCATModernMenuContentViewContainer)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (id)collectionView;
- (void)setContentView:(id)a3;
- (void)setContentViewConstraints:(id)a3;
@end

@implementation SCATModernMenuContentViewContainer

- (SCATModernMenuContentViewContainer)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATModernMenuContentViewContainer;
  return -[SCATModernMenuContentViewContainer initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(SCATModernMenuContentViewContainer *)self addSubview:v5];
    v8 = [(SCATModernMenuContentViewContainer *)self contentViewConstraints];
    +[NSLayoutConstraint deactivateConstraints:v8];

    [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(UIView *)*p_contentView topAnchor];
    v21 = [(SCATModernMenuContentViewContainer *)self topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(UIView *)*p_contentView bottomAnchor];
    v9 = [(SCATModernMenuContentViewContainer *)self bottomAnchor];
    v10 = [v19 constraintEqualToAnchor:v9];
    v24[1] = v10;
    v11 = [(UIView *)*p_contentView leadingAnchor];
    v12 = [(SCATModernMenuContentViewContainer *)self leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    v14 = [(UIView *)*p_contentView trailingAnchor];
    v15 = [(SCATModernMenuContentViewContainer *)self trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    +[NSArray arrayWithObjects:v24 count:4];
    v17 = v23 = v5;
    [(SCATModernMenuContentViewContainer *)self setContentViewConstraints:v17];

    v18 = [(SCATModernMenuContentViewContainer *)self contentViewConstraints];
    v5 = v23;
    +[NSLayoutConstraint activateConstraints:v18];

    [(SCATModernMenuContentViewContainer *)self invalidateIntrinsicContentSize];
  }
}

- (id)collectionView
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SCATModernMenuContentViewContainer *)self contentView];
  v3 = [v2 subviews];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(SCATModernMenuContentViewContainer *)self collectionView];
  v3 = [v2 collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSArray)contentViewConstraints
{
  return self->_contentViewConstraints;
}

- (void)setContentViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewConstraints, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end