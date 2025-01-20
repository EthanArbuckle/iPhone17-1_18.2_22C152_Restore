@interface CNMeCardSharingOnboardingAvatarCarouselCell
+ (id)cellIdentifier;
- (CNMeCardSharingOnboardingAvatarCarouselCell)initWithFrame:(CGRect)a3;
- (NSString)title;
- (NSUUID)displaySessionUUID;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)label;
- (double)imageInsetPercentage;
- (void)layoutSubviews;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageInsetPercentage:(double)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (double)imageInsetPercentage
{
  return self->_imageInsetPercentage;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselCell;
  [(CNMeCardSharingOnboardingAvatarCarouselCell *)&v11 layoutSubviews];
  [(CNMeCardSharingOnboardingAvatarCarouselCell *)self bounds];
  double v4 = floor(v3 * 0.5);
  v5 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)self contentView];
  v6 = [v5 layer];
  [v6 setCornerRadius:v4];

  v7 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)self contentView];
  [v7 bounds];
  CGFloat v9 = v8 * self->_imageInsetPercentage;

  v10 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)self contentView];
  [v10 bounds];
  CGRect v13 = CGRectInset(v12, v9, v9);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);

  [(UIImageView *)self->_imageView frame];
  -[UILabel setFrame:](self->_label, "setFrame:");
}

- (void)setImageInsetPercentage:(double)a3
{
  if (self->_imageInsetPercentage != a3)
  {
    self->_imageInsetPercentage = a3;
    [(CNMeCardSharingOnboardingAvatarCarouselCell *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_label text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label text];

  if (v4 != v6)
  {
    v5 = (void *)[v6 copy];
    [(UILabel *)self->_label setText:v5];

    [(UILabel *)self->_label setHidden:(*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))()];
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselCell;
  double v3 = -[CNMeCardSharingOnboardingAvatarCarouselCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)v3 contentView];
    [v5 bounds];
    uint64_t v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    double v8 = [MEMORY[0x1E4FB1618] _secondarySystemBackgroundColor];
    CGFloat v9 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)v3 contentView];
    [v9 setBackgroundColor:v8];

    v10 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)v3 contentView];
    [v10 addSubview:v3->_imageView];

    id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
    CGRect v12 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)v3 contentView];
    [v12 bounds];
    uint64_t v13 = objc_msgSend(v11, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v13;

    [(UILabel *)v3->_label setNumberOfLines:0];
    [(UILabel *)v3->_label setTextAlignment:1];
    v15 = +[CNUIColorRepository contactsApplicationTintColor];
    [(UILabel *)v3->_label setTextColor:v15];

    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
    [(UILabel *)v3->_label setFont:v16];

    v17 = [(CNMeCardSharingOnboardingAvatarCarouselCell *)v3 contentView];
    [v17 addSubview:v3->_label];

    v18 = v3;
  }

  return v3;
}

+ (id)cellIdentifier
{
  return @"CNMeCardSharingOnboardingAvatarCarouselCell";
}

@end