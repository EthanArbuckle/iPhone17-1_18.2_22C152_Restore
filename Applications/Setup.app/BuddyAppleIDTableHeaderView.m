@interface BuddyAppleIDTableHeaderView
+ (id)defaultDetailTextAttributes;
+ (id)defaultTitleTextAttributes;
+ (void)initialize;
- (BOOL)topIconHasRoundedCorners;
- (BuddyAppleIDTableHeaderView)initWithFrame:(CGRect)a3;
- (CGSize)iconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)linkButtonTitle;
- (NSString)topIconName;
- (UIButton)linkButton;
- (UIColor)topIconTintColor;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (double)bottomPadding;
- (double)leftPadding;
- (double)linkButtonTopPadding;
- (double)rightPadding;
- (void)_getHeight:(double *)a3 forWidth:(double)a4 shouldLayoutViews:(BOOL)a5;
- (void)layoutSubviews;
- (void)setBottomPadding:(double)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setLeftPadding:(double)a3;
- (void)setLinkButtonTitle:(id)a3;
- (void)setLinkButtonTopPadding:(double)a3;
- (void)setRightPadding:(double)a3;
- (void)setTopIconHasRoundedCorners:(BOOL)a3;
- (void)setTopIconName:(id)a3;
- (void)setTopIconTintColor:(id)a3;
@end

@implementation BuddyAppleIDTableHeaderView

+ (void)initialize
{
  if (a1 == (id)objc_opt_class())
  {
    if (BFFIsiPad())
    {
      qword_100321DC0 = 15.0;
      qword_100321DC8 = 0;
    }
    else
    {
      qword_100321DC0 = -1.0;
      qword_100321DC8 = -1.0;
    }
  }
}

+ (id)defaultTitleTextAttributes
{
  v5 = (dispatch_once_t *)&unk_100321DD8;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B3C80);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321DD0;

  return v2;
}

+ (id)defaultDetailTextAttributes
{
  v5 = (dispatch_once_t *)&unk_100321DE8;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B3CA0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_100321DE0;

  return v2;
}

- (BuddyAppleIDTableHeaderView)initWithFrame:(CGRect)a3
{
  CGRect v25 = a3;
  SEL v23 = a2;
  id location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddyAppleIDTableHeaderView;
  id location = -[BuddyAppleIDTableHeaderView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    id v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v4 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v3;

    [*((id *)location + 4) setNumberOfLines:0];
    id v5 = +[BFFStyle sharedStyle];
    [v5 applyThemeToTitleLabel:*((void *)location + 4)];

    [location addSubview:*((void *)location + 4)];
    id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v7 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v6;

    [*((id *)location + 5) setNumberOfLines:0];
    id v8 = +[UIColor _labelColor];
    [*((id *)location + 5) setTextColor:v8];

    id v9 = +[UIColor _systemBackgroundColor];
    [*((id *)location + 5) setBackgroundColor:v9];

    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [*((id *)location + 5) setFont:v10];

    [*((id *)location + 5) setTextAlignment:1];
    [location addSubview:*((void *)location + 5)];
    *((double *)location + 6) = -1.0;
    v11 = (char *)location + 80;
    *((void *)location + 10) = *(void *)&CGSizeZero.width;
    *((void *)v11 + 1) = *(void *)&CGSizeZero.height;
    if (sub_100147F28())
    {
      double v21 = sub_100166824();
      [location setLayoutMargins:v21, v12, v13, v14];
    }
    else
    {
      double v15 = sub_100166824();
      [location setLayoutMargins:v15, v16, v17, v18, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18];
    }
  }
  v19 = (BuddyAppleIDTableHeaderView *)location;
  objc_storeStrong(&location, 0);
  return v19;
}

- (double)bottomPadding
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  return v2;
}

- (void)setBottomPadding:(double)a3
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, v4, a3, v5, *(void *)&v3, *(void *)&v4, *(void *)&a3, *(void *)&v5, *(void *)&v3, *(void *)&v4, *(void *)&a3, *(void *)&v5, *(void *)&v3, *(void *)&v4, *(void *)&a3, *(void *)&v5);
}

- (double)leftPadding
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  return v2;
}

- (void)setLeftPadding:(double)a3
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, a3, v4, v5, *(void *)&v3, *(void *)&a3, *(void *)&v4, *(void *)&v5, *(void *)&v3, *(void *)&a3, *(void *)&v4, *(void *)&v5, *(void *)&v3, *(void *)&a3, *(void *)&v4, *(void *)&v5);
}

- (double)rightPadding
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  return v2;
}

- (void)setRightPadding:(double)a3
{
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, v4, v5, a3, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&a3, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&a3, *(void *)&v3, *(void *)&v4, *(void *)&v5, *(void *)&a3);
}

- (NSString)linkButtonTitle
{
  return -[UIButton titleForState:](self->_linkButton, "titleForState:", 0, a2, self);
}

- (void)setLinkButtonTitle:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && !v10->_linkButton)
  {
    double v3 = +[UIButton buttonWithType:1];
    linkButton = v10->_linkButton;
    v10->_linkButton = v3;

    double v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    id v6 = [(UIButton *)v10->_linkButton titleLabel];
    [(UILabel *)v6 setFont:v5];

    v7 = [(UIButton *)v10->_linkButton titleLabel];
    [(UILabel *)v7 setNumberOfLines:0];

    id v8 = [(UIButton *)v10->_linkButton titleLabel];
    [(UILabel *)v8 setTextAlignment:1];

    [(BuddyAppleIDTableHeaderView *)v10 addSubview:v10->_linkButton];
  }
  [(UIButton *)v10->_linkButton setTitle:location[0] forState:0];
  [(BuddyAppleIDTableHeaderView *)v10 setNeedsLayout];
  objc_storeStrong(location, 0);
}

- (void)setTopIconName:(id)a3
{
  double v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v14->_topIconName == location[0])
  {
    int v12 = 1;
  }
  else
  {
    double v3 = (NSString *)[location[0] copy];
    topIconName = v14->_topIconName;
    v14->_topIconName = v3;

    if (![(NSString *)v14->_topIconName length] || v14->_iconView)
    {
      if ([(NSString *)v14->_topIconName length] || !v14->_iconView)
      {
        if (v14->_iconView)
        {
          char v9 = 0;
          if ([(NSString *)v14->_topIconName length])
          {
            v10 = +[UIImage imageNamed:v14->_topIconName];
            char v9 = 1;
          }
          -[BuddyRoundedRectImageView setImage:](v14->_iconView, "setImage:");
          if (v9) {
        }
          }
      }
      else
      {
        [(BuddyRoundedRectImageView *)v14->_iconView removeFromSuperview];
        objc_storeStrong((id *)&v14->_iconView, 0);
        [(BuddyAppleIDTableHeaderView *)v14 setNeedsLayout];
      }
    }
    else
    {
      id v11 = +[UIImage imageNamed:v14->_topIconName];
      if (v14->_topIconTintColor)
      {
        id v5 = [v11 _flatImageWithColor:v14->_topIconTintColor];
        id v6 = v11;
        id v11 = v5;
      }
      v7 = [[BuddyRoundedRectImageView alloc] initWithImage:v11];
      iconView = v14->_iconView;
      v14->_iconView = v7;

      [(BuddyRoundedRectImageView *)v14->_iconView setContentMode:1];
      [(BuddyAppleIDTableHeaderView *)v14 addSubview:v14->_iconView];
      [(BuddyAppleIDTableHeaderView *)v14 setNeedsLayout];
      objc_storeStrong(&v11, 0);
    }
    [(BuddyRoundedRectImageView *)v14->_iconView setUsesMask:v14->_topIconHasRoundedCorners];
    int v12 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)setTopIconHasRoundedCorners:(BOOL)a3
{
  if (self->_topIconHasRoundedCorners != a3)
  {
    self->_topIconHasRoundedCorners = a3;
    if (self->_iconView) {
      [(BuddyRoundedRectImageView *)self->_iconView setUsesMask:self->_topIconHasRoundedCorners];
    }
  }
}

- (void)_getHeight:(double *)a3 forWidth:(double)a4 shouldLayoutViews:(BOOL)a5
{
  v124 = self;
  SEL v123 = a2;
  v122 = a3;
  double v121 = a4;
  BOOL v120 = a5;
  [(BuddyAppleIDTableHeaderView *)self layoutMargins];
  uint64_t v115 = v6;
  double v116 = v7;
  uint64_t v117 = v8;
  uint64_t v118 = v9;
  double v10 = a4 - v7;
  [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
  uint64_t v111 = v11;
  uint64_t v112 = v12;
  uint64_t v113 = v13;
  double v114 = v14;
  double v119 = v10 - v14;
  double v110 = 0.0;
  id location = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  if (v124->_linkButton)
  {
    double v15 = sub_100167A34();
    *((void *)&v107 + 1) = v16;
    *(double *)&long long v107 = v15;
    *((void *)&v108 + 1) = v17;
    *(void *)&long long v108 = v18;
    CGSize size = (CGSize)0;
    CGPoint v105 = (CGPoint)0;
    CGPoint origin = CGRectZero.origin;
    CGSize size = CGRectZero.size;
    CGPoint v105 = origin;
    v20 = [(UIButton *)v124->_linkButton titleLabel];
    double v21 = [(UIButton *)v124->_linkButton titleLabel];
    -[UILabel textRectForBounds:limitedToNumberOfLines:](v20, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)v21 numberOfLines], v107, v108);
    uint64_t v102 = v22;
    uint64_t v101 = v23;
    CGFloat v104 = v24;
    CGFloat v103 = v25;
    size.width = v25;
    size.height = v24;

    [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
    uint64_t v97 = v26;
    double v98 = v27;
    uint64_t v99 = v28;
    uint64_t v100 = v29;
    double v30 = v27 + (v119 - size.width) / 2.0;
    char v31 = BFFIsiPad();
    double v32 = 1.0;
    if ((v31 & 1) == 0) {
      double v32 = 0.0;
    }
    float v33 = v30 - v32;
    v105.x = floorf(v33);
    double v96 = 0.0;
    if (v124->_linkButtonTopPadding < 0.0) {
      CGFloat linkButtonTopPadding = 10.0;
    }
    else {
      CGFloat linkButtonTopPadding = v124->_linkButtonTopPadding;
    }
    double v96 = linkButtonTopPadding;
    v105.y = linkButtonTopPadding;
    v125.size.height = size.height;
    v125.size.width = size.width;
    v125.origin.y = linkButtonTopPadding;
    v125.origin.x = v105.x;
    double v110 = CGRectGetMaxY(v125) - v96;
    if (v120)
    {
      CGSize v95 = size;
      CGPoint v94 = v105;
      linkButton = v124->_linkButton;
      CGSize v93 = size;
      CGPoint v92 = v105;
      -[UIButton setFrame:](linkButton, "setFrame:", v105, size);
    }
  }
  CGFloat v91 = 0.0;
  char v36 = BFFIsiPad();
  double v37 = 56.0;
  if ((v36 & 1) == 0) {
    double v37 = 33.5;
  }
  [location scaledValueForValue:v37];
  BFFRoundToPixel();
  CGFloat v91 = v38;
  memset(&__b, 0, sizeof(__b));
  __b.origin.x = CGRectZero.origin.x;
  __b.origin.y = CGRectZero.origin.y;
  __b.CGSize size = CGRectZero.size;
  if (v124->_iconView)
  {
    if (sub_100167A8C(v124->_iconSize.width, v124->_iconSize.height, CGSizeZero.width, CGSizeZero.height))
    {
      [(BuddyRoundedRectImageView *)v124->_iconView sizeToFit];
      [(BuddyRoundedRectImageView *)v124->_iconView frame];
    }
    else
    {
      double v39 = sub_100167A34();
    }
    __b.origin.x = v39;
    __b.origin.y = v40;
    __b.size.width = v41;
    __b.size.height = v42;
    [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
    float v44 = v43 + (v119 - __b.size.width) / 2.0;
    __b.origin.x = floorf(v44);
    __b.origin.y = v91;
    if (v120) {
      -[BuddyRoundedRectImageView setFrame:](v124->_iconView, "setFrame:", __b.origin.x, __b.origin.y, __b.size.width, __b.size.height);
    }
  }
  char v87 = 0;
  if (v124->_iconView)
  {
    double MaxY = CGRectGetMaxY(__b);
    char v46 = BFFIsiPhone();
    BOOL v47 = 0;
    if (v46)
    {
      v88 = +[UIScreen mainScreen];
      char v87 = 1;
      [(UIScreen *)v88 bounds];
      BOOL v47 = v48 <= 480.0;
    }
    double v49 = 10.0;
    if (!v47) {
      double v49 = 15.0;
    }
    double v50 = MaxY + v49;
  }
  else
  {
    double v50 = v91;
  }
  if (v87) {

  }
  double v89 = v50;
  v51 = [(UILabel *)v124->_textLabel text];
  NSUInteger v52 = [(NSString *)v51 length];

  if (v52)
  {
    textLabel = v124->_textLabel;
    sub_100165E2C();
    -[UILabel sizeThatFits:](textLabel, "sizeThatFits:", v54, v55);
    v86.size.width = v56;
    v86.size.height = v57;
    [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
    float v59 = v58 + (v119 - v86.size.width) / 2.0;
    v86.origin.x = floorf(v59);
    [(UILabel *)v124->_textLabel _firstBaselineOffsetFromTop];
    v86.origin.y = v50 - v60;
    if (v120) {
      -[UILabel setFrame:](v124->_textLabel, "setFrame:", v86.origin.x, v86.origin.y, v86.size.width, v86.size.height);
    }
    CGRectGetMaxY(v86);
    [location scaledValueForValue:32.0];
    BFFRoundToPixel();
    double v89 = v61;
  }
  detailTextLabel = v124->_detailTextLabel;
  sub_100165E2C();
  -[UILabel sizeThatFits:](detailTextLabel, "sizeThatFits:", v63, v64);
  double v84 = v65;
  double v85 = v66;
  [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
  float v68 = v67 + (v119 - v84) / 2.0;
  double v82 = floorf(v68);
  [(UILabel *)v124->_detailTextLabel _firstBaselineOffsetFromTop];
  double v83 = v89 - v69;
  if (v120) {
    -[UILabel setFrame:](v124->_detailTextLabel, "setFrame:", v82, v83, v84, v85);
  }
  if (v122)
  {
    [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
    double v71 = v85;
    if (v70 < 0.0)
    {
      double v77 = v84;
      double v78 = v83;
      double v79 = v82;
      double v80 = CGRectGetMaxY(*(CGRect *)(&v71 - 3));
      [location scaledValueForValue:16.0];
      double *v122 = v80 + v81;
    }
    else
    {
      double v72 = v84;
      double v73 = v83;
      double v74 = v82;
      double v75 = CGRectGetMaxY(*(CGRect *)(&v71 - 3));
      [(BuddyAppleIDTableHeaderView *)v124 layoutMargins];
      double *v122 = v75 + v76;
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)layoutSubviews
{
  [(BuddyAppleIDTableHeaderView *)self bounds];
  -[BuddyAppleIDTableHeaderView _getHeight:forWidth:shouldLayoutViews:](self, "_getHeight:forWidth:shouldLayoutViews:", 0, 1, v5, v3, v4, *(void *)&v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (a3.width == 0.0)
  {
    uint64_t v3 = +[UIScreen mainScreen];
    [(UIScreen *)v3 bounds];
    uint64_t v11 = v4;
    uint64_t v10 = v5;
    uint64_t v13 = v6;
    double v12 = v7;
    double width = v7;
  }
  -[BuddyAppleIDTableHeaderView _getHeight:forWidth:shouldLayoutViews:](self, "_getHeight:forWidth:shouldLayoutViews:", &self->_calculatedHeight, 0, width, v10, v11, *(void *)&v12, v13, a2);
  double calculatedHeight = self->_calculatedHeight;
  double v8 = width;
  result.height = calculatedHeight;
  result.double width = v8;
  return result;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (double)linkButtonTopPadding
{
  return self->_linkButtonTopPadding;
}

- (void)setLinkButtonTopPadding:(double)a3
{
  self->_CGFloat linkButtonTopPadding = a3;
}

- (CGSize)iconSize
{
  double height = self->_iconSize.height;
  double width = self->_iconSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (NSString)topIconName
{
  return self->_topIconName;
}

- (BOOL)topIconHasRoundedCorners
{
  return self->_topIconHasRoundedCorners;
}

- (UIColor)topIconTintColor
{
  return self->_topIconTintColor;
}

- (void)setTopIconTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end