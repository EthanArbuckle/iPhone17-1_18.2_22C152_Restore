@interface CNMeCardSharingOnboardingHeaderViewController
+ (double)heightForHeaderWithContainerSize:(CGSize)a3 withTitle:(id)a4 layoutAttributes:(id)a5 hasAvatar:(BOOL)a6;
- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselController;
- (CNMeCardSharingOnboardingHeaderViewController)initWithAvatarCarouselViewController:(id)a3 headerTitle:(id)a4 layoutAttributes:(id)a5;
- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes;
- (NSString)headerTitle;
- (UILabel)headerLabel;
- (unint64_t)mode;
- (void)setAvatarCarouselController:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CNMeCardSharingOnboardingHeaderViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_avatarCarouselController, 0);

  objc_storeStrong((id *)&self->_headerTitle, 0);
}

- (void)setHeaderLabel:(id)a3
{
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setAvatarCarouselController:(id)a3
{
}

- (CNMeCardSharingOnboardingAvatarCarouselViewController)avatarCarouselController
{
  return self->_avatarCarouselController;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)viewWillLayoutSubviews
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  [(CNMeCardSharingOnboardingHeaderViewController *)&v22 viewWillLayoutSubviews];
  headerTitle = self->_headerTitle;
  v4 = [(CNMeCardSharingOnboardingHeaderViewController *)self view];
  [v4 bounds];
  double v6 = v5 + -40.0;
  uint64_t v23 = *MEMORY[0x1E4FB06F8];
  v7 = [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes headerFont];
  v24[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  -[NSString boundingRectWithSize:options:attributes:context:](headerTitle, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v6, 1.79769313e308);
  double v10 = v9;

  [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes topToAvatarPadding];
  double v12 = v11;
  v13 = [(CNMeCardSharingOnboardingHeaderViewController *)self view];
  [v13 bounds];
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", 20.0, v12, v14 + -40.0, v10);

  [(UILabel *)self->_headerLabel frame];
  double MaxY = CGRectGetMaxY(v25);
  [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes avatarViewToNamePadding];
  double v17 = MaxY + v16;
  v18 = [(CNMeCardSharingOnboardingHeaderViewController *)self view];
  [v18 bounds];
  double v20 = v19;
  v21 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselController view];
  objc_msgSend(v21, "setFrame:", 0.0, v17, v20, 220.0);
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  [(CNMeCardSharingOnboardingHeaderViewController *)&v10 viewDidLoad];
  if (self->_avatarCarouselController)
  {
    v3 = [(CNMeCardSharingOnboardingHeaderViewController *)self view];
    v4 = [(CNMeCardSharingOnboardingAvatarCarouselViewController *)self->_avatarCarouselController view];
    [v3 addSubview:v4];
  }
  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerLabel = self->_headerLabel;
  self->_headerLabel = v6;

  [(UILabel *)self->_headerLabel setNumberOfLines:0];
  [(UILabel *)self->_headerLabel setTextAlignment:1];
  v8 = [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes headerFont];
  [(UILabel *)self->_headerLabel setFont:v8];

  [(UILabel *)self->_headerLabel setAutoresizingMask:2];
  [(UILabel *)self->_headerLabel setText:self->_headerTitle];
  double v9 = [(CNMeCardSharingOnboardingHeaderViewController *)self view];
  [v9 addSubview:self->_headerLabel];
}

- (CNMeCardSharingOnboardingHeaderViewController)initWithAvatarCarouselViewController:(id)a3 headerTitle:(id)a4 layoutAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingOnboardingHeaderViewController;
  double v12 = [(CNMeCardSharingOnboardingHeaderViewController *)&v16 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarCarouselController, a3);
    objc_storeStrong((id *)&v13->_headerTitle, a4);
    objc_storeStrong((id *)&v13->_layoutAttributes, a5);
    double v14 = v13;
  }

  return v13;
}

+ (double)heightForHeaderWithContainerSize:(CGSize)a3 withTitle:(id)a4 layoutAttributes:(id)a5 hasAvatar:(BOOL)a6
{
  BOOL v6 = a6;
  double width = a3.width;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  id v10 = a4;
  id v11 = [v9 headerFont];
  v20[0] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, width + -40.0, 1.79769313e308);
  double v14 = v13;

  [v9 topToAvatarPadding];
  double v16 = v14 + v15 + 20.0;
  if (v6)
  {
    [v9 avatarViewToNamePadding];
    double v16 = v16 + v17 + 220.0;
  }

  return v16;
}

@end