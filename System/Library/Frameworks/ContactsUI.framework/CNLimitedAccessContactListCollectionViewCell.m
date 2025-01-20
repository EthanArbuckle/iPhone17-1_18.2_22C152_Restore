@interface CNLimitedAccessContactListCollectionViewCell
- (BOOL)isShowingSearchResult;
- (CNContact)contact;
- (CNContactFormatter)contactFormatter;
- (CNLimitedAccessContactListCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)avatarImage;
- (unint64_t)caption;
- (void)applyContactListStyleWithAvatarImage;
- (void)layoutSubviews;
- (void)setAvatarImage:(id)a3;
- (void)setCaption:(unint64_t)a3;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setIsShowingSearchResult:(BOOL)a3;
@end

@implementation CNLimitedAccessContactListCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)isShowingSearchResult
{
  return self->_isShowingSearchResult;
}

- (void)setCaption:(unint64_t)a3
{
  self->_caption = a3;
}

- (unint64_t)caption
{
  return self->_caption;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)applyContactListStyleWithAvatarImage
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB06F8];
  v42[0] = *MEMORY[0x1E4FB06F8];
  v4 = +[CNUIFontRepository contactStyleDefaultTextFont];
  v43[0] = v4;
  v42[1] = *MEMORY[0x1E4F1AEA8];
  v5 = +[CNUIFontRepository contactStyleDefaultBoldTextFont];
  v43[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

  v7 = [(CNContactFormatter *)self->_contactFormatter attributedStringForObjectValue:self->_contact withDefaultAttributes:v6];
  v38 = v6;
  if (![v7 length])
  {
    v8 = objc_msgSend(v6, "mutableCopy", v6);
    v9 = +[CNUIFontRepository contactStyleDefaultTextFont];
    v10 = [v9 fontDescriptor];
    v11 = [v10 fontDescriptorWithSymbolicTraits:1];

    v12 = (void *)MEMORY[0x1E4FB08E0];
    v13 = +[CNUIFontRepository contactStyleDefaultTextFont];
    [v13 pointSize];
    v14 = objc_msgSend(v12, "fontWithDescriptor:size:", v11);
    [v8 setObject:v14 forKeyedSubscript:v3];

    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v16 = CNContactsUIBundle();
    v17 = [v16 localizedStringForKey:@"NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v18 = [v15 initWithString:v17 attributes:v8];

    v7 = (void *)v18;
  }
  objc_opt_class();
  v19 = [(CNLimitedAccessContactListCollectionViewCell *)self contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  if (!v21)
  {
    v19 = [MEMORY[0x1E4FB1948] cellConfiguration];
  }
  objc_msgSend(v19, "setAttributedText:", v7, v38);
  v22 = [(CNContact *)self->_contact phoneNumbers];
  uint64_t v23 = [v22 count];

  contact = self->_contact;
  if (v23)
  {
    v25 = [(CNContact *)contact phoneNumbers];
    v26 = [v25 firstObject];
    v27 = [v26 value];
    v28 = [v27 formattedStringValue];

    v29 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v30 = [(CNContact *)contact emailAddresses];
  v29 = (void *)[v30 count];

  if (v29)
  {
    v25 = [(CNContact *)self->_contact emailAddresses];
    v26 = [v25 firstObject];
    v29 = [v26 value];
    v28 = 0;
    goto LABEL_12;
  }
  v28 = 0;
LABEL_13:
  v40[0] = v3;
  v31 = +[CNUIFontRepository navigationListDetailCellSubtitleFontRegular];
  v41[0] = v31;
  v40[1] = *MEMORY[0x1E4FB0700];
  v32 = +[CNUIColorRepository navigationListDetailCellSubtitleTextColorRegular];
  v41[1] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

  unint64_t caption = self->_caption;
  if (caption == 1)
  {
    v35 = v29;
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
      goto LABEL_19;
    }
LABEL_18:
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v35 attributes:v33];
    [v19 setSecondaryAttributedText:v36];

    goto LABEL_19;
  }
  if (caption == 2)
  {
    v35 = v28;
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
      goto LABEL_18;
    }
  }
LABEL_19:
  v37 = [(CNLimitedAccessContactListCollectionViewCell *)self avatarImage];
  [v19 setImage:v37];

  [(CNLimitedAccessContactListCollectionViewCell *)self setContentConfiguration:v19];
}

- (void)setAvatarImage:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImage, a3);

  [(CNLimitedAccessContactListCollectionViewCell *)self applyContactListStyleWithAvatarImage];
}

- (void)setIsShowingSearchResult:(BOOL)a3
{
  self->_isShowingSearchResult = a3;
  if (a3)
  {
    id v9 = [(CNLimitedAccessContactListCollectionViewCell *)self separatorLayoutGuide];
    v4 = [v9 leadingAnchor];
    v5 = [(CNLimitedAccessContactListCollectionViewCell *)self contentView];
    v6 = [v5 layoutMarginsGuide];
    v7 = [v6 leadingAnchor];
    v8 = [v4 constraintEqualToAnchor:v7];
    [v8 setActive:1];
  }
}

- (void)setContact:(id)a3
{
  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    [(CNLimitedAccessContactListCollectionViewCell *)self applyContactListStyleWithAvatarImage];
    [(UIView *)self annotateWithContact:v5];
  }
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CNLimitedAccessContactListCollectionViewCell;
  [(CNLimitedAccessContactListCollectionViewCell *)&v2 layoutSubviews];
}

- (CNLimitedAccessContactListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNLimitedAccessContactListCollectionViewCell;
  uint64_t v3 = -[CNLimitedAccessContactListCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end