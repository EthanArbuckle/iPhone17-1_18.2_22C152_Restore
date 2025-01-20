@interface CNMeCardSharingHeaderViewController
- (CNMeCardSharingAvatarViewController)avatarViewController;
- (CNMeCardSharingHeaderViewController)initWithAvatarViewController:(id)a3 name:(id)a4 layoutAttributes:(id)a5;
- (CNMeCardSharingPickerLayoutAttributes)layoutAttributes;
- (NSString)name;
- (UILabel)nameLabel;
- (double)desiredHeight;
- (unint64_t)mode;
- (void)setAvatarViewController:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CNMeCardSharingHeaderViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
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

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNMeCardSharingAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (double)desiredHeight
{
  return 180.0;
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CNMeCardSharingHeaderViewController;
  [(CNMeCardSharingHeaderViewController *)&v14 viewWillLayoutSubviews];
  [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes topToAvatarPadding];
  double v4 = v3;
  v5 = [(CNMeCardSharingHeaderViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  v8 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
  objc_msgSend(v8, "setFrame:", 0.0, v4, v7, 100.0);

  v9 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
  [v9 frame];
  double MaxY = CGRectGetMaxY(v15);
  [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes avatarViewToNamePadding];
  double v12 = MaxY + v11;
  v13 = [(CNMeCardSharingHeaderViewController *)self view];
  [v13 bounds];
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, v12);
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingHeaderViewController;
  [(CNMeCardSharingHeaderViewController *)&v10 viewDidLoad];
  double v3 = [(CNMeCardSharingHeaderViewController *)self view];
  double v4 = [(CNMeCardSharingAvatarViewController *)self->_avatarViewController view];
  [v3 addSubview:v4];

  [(CNMeCardSharingHeaderViewController *)self addChildViewController:self->_avatarViewController];
  [(CNMeCardSharingAvatarViewController *)self->_avatarViewController didMoveToParentViewController:self];
  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v6 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  [(UILabel *)self->_nameLabel setTextAlignment:1];
  v8 = [(CNMeCardSharingPickerLayoutAttributes *)self->_layoutAttributes headerFont];
  [(UILabel *)self->_nameLabel setFont:v8];

  [(UILabel *)self->_nameLabel setAutoresizingMask:2];
  [(UILabel *)self->_nameLabel setText:self->_name];
  v9 = [(CNMeCardSharingHeaderViewController *)self view];
  [v9 addSubview:self->_nameLabel];
}

- (CNMeCardSharingHeaderViewController)initWithAvatarViewController:(id)a3 name:(id)a4 layoutAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNMeCardSharingHeaderViewController;
  double v12 = [(CNMeCardSharingHeaderViewController *)&v16 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarViewController, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_layoutAttributes, a5);
    objc_super v14 = v13;
  }

  return v13;
}

@end