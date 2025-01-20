@interface FCUICustomModeViewCell
+ (NSString)reuseIdentifier;
- (FCUICustomModeViewCell)initWithFrame:(CGRect)a3;
- (void)configureCellWithImage:(id)a3;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation FCUICustomModeViewCell

- (FCUICustomModeViewCell)initWithFrame:(CGRect)a3
{
  v64.receiver = self;
  v64.super_class = (Class)FCUICustomModeViewCell;
  v3 = -[FCUICustomModeViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    selectionView = v3->_selectionView;
    v3->_selectionView = v8;

    [(UIView *)v3->_selectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(UIView *)v3->_selectionView layer];
    id v11 = +[UIColor systemBlueColor];
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    v12 = [(UIView *)v3->_selectionView layer];
    [v12 setBorderWidth:2.0];

    v13 = [(FCUICustomModeViewCell *)v3 contentView];
    [v13 addSubview:v3->_selectionView];

    v14 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageBackgroundView = v3->_imageBackgroundView;
    v3->_imageBackgroundView = v14;

    [(UIView *)v3->_imageBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = v3->_imageBackgroundView;
    v17 = +[UIColor systemGray5Color];
    [(UIView *)v16 setBackgroundColor:v17];

    v18 = [(FCUICustomModeViewCell *)v3 contentView];
    [v18 addSubview:v3->_imageBackgroundView];

    v19 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v3->_imageView;
    v3->_imageView = v19;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setContentMode:4];
    v21 = [(FCUICustomModeViewCell *)v3 contentView];
    [v21 addSubview:v3->_imageView];

    id v22 = objc_alloc_init((Class)NSMutableArray);
    v23 = [(UIView *)v3->_selectionView leadingAnchor];
    v24 = [(FCUICustomModeViewCell *)v3 contentView];
    v25 = [v24 leadingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:4.0];
    [v22 addObject:v26];

    v27 = [(UIView *)v3->_selectionView topAnchor];
    v28 = [(FCUICustomModeViewCell *)v3 contentView];
    v29 = [v28 topAnchor];
    v30 = [v27 constraintEqualToAnchor:v29 constant:4.0];
    [v22 addObject:v30];

    v31 = [(FCUICustomModeViewCell *)v3 contentView];
    v32 = [v31 trailingAnchor];
    v33 = [(UIView *)v3->_selectionView trailingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:4.0];
    [v22 addObject:v34];

    v35 = [(FCUICustomModeViewCell *)v3 contentView];
    v36 = [v35 bottomAnchor];
    v37 = [(UIView *)v3->_selectionView bottomAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:4.0];
    [v22 addObject:v38];

    v39 = [(UIView *)v3->_imageBackgroundView leadingAnchor];
    v40 = [(FCUICustomModeViewCell *)v3 contentView];
    v41 = [v40 leadingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:8.0];
    [v22 addObject:v42];

    v43 = [(UIView *)v3->_imageBackgroundView topAnchor];
    v44 = [(FCUICustomModeViewCell *)v3 contentView];
    v45 = [v44 topAnchor];
    v46 = [v43 constraintEqualToAnchor:v45 constant:8.0];
    [v22 addObject:v46];

    v47 = [(FCUICustomModeViewCell *)v3 contentView];
    v48 = [v47 trailingAnchor];
    v49 = [(UIView *)v3->_imageBackgroundView trailingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49 constant:8.0];
    [v22 addObject:v50];

    v51 = [(FCUICustomModeViewCell *)v3 contentView];
    v52 = [v51 bottomAnchor];
    v53 = [(UIView *)v3->_imageBackgroundView bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:8.0];
    [v22 addObject:v54];

    v55 = [(UIImageView *)v3->_imageView centerXAnchor];
    v56 = [(FCUICustomModeViewCell *)v3 contentView];
    v57 = [v56 centerXAnchor];
    v58 = [v55 constraintEqualToAnchor:v57];
    [v22 addObject:v58];

    v59 = [(UIImageView *)v3->_imageView centerYAnchor];
    v60 = [(FCUICustomModeViewCell *)v3 contentView];
    v61 = [v60 centerYAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    [v22 addObject:v62];

    +[NSLayoutConstraint activateConstraints:v22];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)FCUICustomModeViewCell;
  [(FCUICustomModeViewCell *)&v11 layoutSubviews];
  v3 = [(FCUICustomModeViewCell *)self traitCollection];
  if ([v3 userInterfaceStyle] == (char *)&dword_0 + 2) {
    +[UIColor systemGrayColor];
  }
  else {
  id v4 = +[UIColor systemGrayTintColor];
  }

  [(UIView *)self->_selectionView setAlpha:(double)[(FCUICustomModeViewCell *)self isSelected]];
  imageView = self->_imageView;
  if ([(FCUICustomModeViewCell *)self isSelected])
  {
    v6 = +[UIColor systemBlueColor];
    [(UIImageView *)imageView setTintColor:v6];
  }
  else
  {
    [(UIImageView *)imageView setTintColor:v4];
  }
  selectionView = self->_selectionView;
  [(UIView *)selectionView frame];
  [(UIView *)selectionView _setCornerRadius:v8 * 0.5];
  imageBackgroundView = self->_imageBackgroundView;
  [(UIView *)imageBackgroundView frame];
  [(UIView *)imageBackgroundView _setCornerRadius:v10 * 0.5];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"FCUICustomModeViewCell";
}

- (void)configureCellWithImage:(id)a3
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(FCUICustomModeViewCell *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)FCUICustomModeViewCell;
  [(FCUICustomModeViewCell *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(FCUICustomModeViewCell *)self setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end