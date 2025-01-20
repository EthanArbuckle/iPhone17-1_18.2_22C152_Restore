@interface CNSharingProfileOnboardingNameCell
+ (double)desiredMinimumCellHeight;
+ (id)cellIdentifier;
- (CNSharingProfileOnboardingNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)familyName;
- (NSString)givenName;
- (UIImage)avatarImage;
- (UIImageView)avatarImageView;
- (UITextField)familyNameField;
- (UITextField)givenNameField;
- (UIView)fakeSeparator;
- (double)separatorHeight;
- (id)textFieldForIndex:(int64_t)a3;
- (int64_t)nameOrder;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarImage:(id)a3;
- (void)setAvatarImageView:(id)a3;
- (void)setFakeSeparator:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setFamilyNameField:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGivenNameField:(id)a3;
- (void)setGivenNameField:(id)a3 familyNameField:(id)a4;
- (void)setNameOrder:(int64_t)a3;
@end

@implementation CNSharingProfileOnboardingNameCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_fakeSeparator, 0);
  objc_storeStrong((id *)&self->_familyNameField, 0);
  objc_storeStrong((id *)&self->_givenNameField, 0);

  objc_storeStrong((id *)&self->_avatarImage, 0);
}

- (void)setAvatarImageView:(id)a3
{
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setFakeSeparator:(id)a3
{
}

- (UIView)fakeSeparator
{
  return self->_fakeSeparator;
}

- (void)setFamilyNameField:(id)a3
{
}

- (UITextField)familyNameField
{
  return self->_familyNameField;
}

- (void)setGivenNameField:(id)a3
{
}

- (UITextField)givenNameField
{
  return self->_givenNameField;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (void)setNameOrder:(int64_t)a3
{
  self->_nameOrder = a3;
}

- (int64_t)nameOrder
{
  return self->_nameOrder;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CNSharingProfileOnboardingNameCell;
  [(CNSharingProfileOnboardingNameCell *)&v5 prepareForReuse];
  [(UIImageView *)self->_avatarImageView setImage:0];
  [(UITextField *)self->_familyNameField removeFromSuperview];
  familyNameField = self->_familyNameField;
  self->_familyNameField = 0;

  [(UITextField *)self->_givenNameField removeFromSuperview];
  givenNameField = self->_givenNameField;
  self->_givenNameField = 0;
}

- (void)setFamilyName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UITextField *)self->_familyNameField setText:v4];
}

- (NSString)familyName
{
  return [(UITextField *)self->_familyNameField text];
}

- (void)setGivenName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UITextField *)self->_givenNameField setText:v4];
}

- (NSString)givenName
{
  return [(UITextField *)self->_givenNameField text];
}

- (void)setGivenNameField:(id)a3 familyNameField:(id)a4
{
  v18 = (UITextField *)a3;
  v7 = (UITextField *)a4;
  p_givenNameField = &self->_givenNameField;
  givenNameField = self->_givenNameField;
  if (givenNameField != v18)
  {
    v10 = [(UITextField *)givenNameField superview];
    v11 = [(CNSharingProfileOnboardingNameCell *)self contentView];

    if (v10 == v11) {
      [(UITextField *)*p_givenNameField removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_givenNameField, a3);
    v12 = [(CNSharingProfileOnboardingNameCell *)self contentView];
    [v12 addSubview:*p_givenNameField];
  }
  p_familyNameField = &self->_familyNameField;
  familyNameField = self->_familyNameField;
  if (familyNameField != v7)
  {
    v15 = [(UITextField *)familyNameField superview];
    v16 = [(CNSharingProfileOnboardingNameCell *)self contentView];

    if (v15 == v16) {
      [(UITextField *)*p_familyNameField removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_familyNameField, a4);
    v17 = [(CNSharingProfileOnboardingNameCell *)self contentView];
    [v17 addSubview:*p_familyNameField];
  }
  [(CNSharingProfileOnboardingNameCell *)self setNeedsLayout];
}

- (void)setAvatarImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_avatarImage != v5)
  {
    objc_storeStrong((id *)&self->_avatarImage, a3);
    [(UIImageView *)self->_avatarImageView setImage:v5];
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CNSharingProfileOnboardingNameCell;
  [(CNSharingProfileOnboardingNameCell *)&v27 layoutSubviews];
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  double v4 = 24.0;
  if (v3 == 1)
  {
    objc_super v5 = [(CNSharingProfileOnboardingNameCell *)self contentView];
    [v5 bounds];
    double v4 = CGRectGetWidth(v28) + -84.0;

    double v6 = 24.0;
  }
  else
  {
    double v6 = 24.0 + 60.0 + 15.0;
  }
  if (v3 == 1) {
    double v7 = 0.0;
  }
  else {
    double v7 = v4 + 60.0 + 15.0;
  }
  v8 = [(CNSharingProfileOnboardingNameCell *)self contentView];
  [v8 bounds];
  CGFloat v9 = CGRectGetWidth(v29) + -123.0;

  v10 = [(CNSharingProfileOnboardingNameCell *)self contentView];
  [v10 bounds];
  CGFloat v11 = CGRectGetWidth(v30) + -99.0;

  v12 = [(CNSharingProfileOnboardingNameCell *)self contentView];
  [v12 bounds];
  -[UIImageView setFrame:](self->_avatarImageView, "setFrame:", v4, (CGRectGetHeight(v31) + -60.0) * 0.5, 60.0, 60.0);

  v13 = [(UIImageView *)self->_avatarImageView layer];
  [v13 setCornerRadius:30.0];

  v14 = [(CNSharingProfileOnboardingNameCell *)self textFieldForIndex:0];
  v15 = [(CNSharingProfileOnboardingNameCell *)self textFieldForIndex:1];
  v16 = [(CNSharingProfileOnboardingNameCell *)self contentView];
  [v16 bounds];
  double v18 = v17 * 0.5;
  [(CNSharingProfileOnboardingNameCell *)self separatorHeight];
  objc_msgSend(v14, "setFrame:", v6, 0.0, v9, v18 - v19);

  [v14 frame];
  double MaxY = CGRectGetMaxY(v32);
  v21 = [(CNSharingProfileOnboardingNameCell *)self contentView];
  [v21 bounds];
  double Height = CGRectGetHeight(v33);
  [v14 bounds];
  double v23 = Height - CGRectGetHeight(v34);
  [(CNSharingProfileOnboardingNameCell *)self separatorHeight];
  objc_msgSend(v15, "setFrame:", v6, MaxY, v9, v23 - v24);

  [v14 frame];
  double v25 = CGRectGetMaxY(v35);
  [(CNSharingProfileOnboardingNameCell *)self separatorHeight];
  -[UIView setFrame:](self->_fakeSeparator, "setFrame:", v7, v25, v11, v26);
}

- (id)textFieldForIndex:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (self->_nameOrder == 2)
  {
    v10[0] = self->_familyNameField;
    double v4 = &OBJC_IVAR___CNSharingProfileOnboardingNameCell__givenNameField;
    p_givenNameField = (UITextField **)v10;
  }
  else
  {
    givenNameField = self->_givenNameField;
    double v4 = &OBJC_IVAR___CNSharingProfileOnboardingNameCell__familyNameField;
    p_givenNameField = &givenNameField;
  }
  p_givenNameField[1] = *(UITextField **)((char *)&self->super.super.super.super.isa + *v4);
  double v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  double v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

- (double)separatorHeight
{
  uint64_t v3 = [(CNSharingProfileOnboardingNameCell *)self window];

  double v4 = 0.5;
  if (v3)
  {
    objc_super v5 = [(CNSharingProfileOnboardingNameCell *)self superview];

    if (v5)
    {
      double v6 = [(CNSharingProfileOnboardingNameCell *)self window];
      double v7 = [v6 screen];
      [v7 scale];
      double v4 = 1.0 / v8;
    }
  }
  return v4;
}

- (CNSharingProfileOnboardingNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CNSharingProfileOnboardingNameCell;
  double v4 = [(CNSharingProfileOnboardingNameCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    avatarImageView = v4->_avatarImageView;
    v4->_avatarImageView = (UIImageView *)v10;

    [(UIImageView *)v4->_avatarImageView setClipsToBounds:1];
    v12 = [(CNSharingProfileOnboardingNameCell *)v4 contentView];
    [v12 addSubview:v4->_avatarImageView];

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
    fakeSeparator = v4->_fakeSeparator;
    v4->_fakeSeparator = (UIView *)v13;

    v15 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
    [(UIView *)v4->_fakeSeparator setBackgroundColor:v15];

    v16 = [(CNSharingProfileOnboardingNameCell *)v4 contentView];
    [v16 addSubview:v4->_fakeSeparator];

    double v17 = v4;
  }

  return v4;
}

+ (double)desiredMinimumCellHeight
{
  return 88.0;
}

+ (id)cellIdentifier
{
  return @"CNSharingProfileOnboardingNameCell";
}

@end