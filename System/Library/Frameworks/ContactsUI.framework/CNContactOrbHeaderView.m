@interface CNContactOrbHeaderView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3 includingAvatarViewDescriptors:(BOOL)a4;
+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3;
- (BOOL)alwaysShowsMonogram;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)centersPhotoAndLabels;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CNContactFormatter)contactFormatter;
- (CNContactOrbHeaderView)initWithContact:(id)a3 frame:(CGRect)a4;
- (CNContactPhotoView)photoView;
- (NSArray)contacts;
- (NSDictionary)nameTextAttributes;
- (NSDictionary)taglineTextAttributes;
- (NSMutableArray)headerConstraints;
- (NSString)alternateName;
- (NSString)message;
- (UIEdgeInsets)contentMargins;
- (UILabel)fakeTaglineAlignmentLabel;
- (UILabel)nameLabel;
- (UILabel)taglineLabel;
- (UIView)markerView;
- (double)photoLabelSpacing;
- (id)_headerStringForContacts:(id)a3;
- (id)_taglineStringForContacts:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)handleNameLabelLongPress:(id)a3;
- (void)menuWillHide:(id)a3;
- (void)reloadData;
- (void)setAlternateName:(id)a3;
- (void)setAlwaysShowsMonogram:(BOOL)a3;
- (void)setCentersPhotoAndLabels:(BOOL)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContentMargins:(UIEdgeInsets)a3;
- (void)setFakeTaglineAlignmentLabel:(id)a3;
- (void)setHeaderConstraints:(id)a3;
- (void)setMarkerView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setTaglineLabel:(id)a3;
- (void)setTaglineTextAttributes:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
- (void)updateFontSizes;
- (void)updateWithContacts:(id)a3;
@end

@implementation CNContactOrbHeaderView

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3 includingAvatarViewDescriptors:(BOOL)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [a1 descriptorForRequiredKeysIncludingAvatarViewDescriptors:a4];
  v7 = [v5 arrayWithObject:v6];

  if (a3)
  {
    v8 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    [v7 addObject:v8];
  }
  v9 = (void *)MEMORY[0x1E4F1B8F8];
  v10 = [NSString stringWithUTF8String:"+[CNContactOrbHeaderView descriptorForRequiredKeysForContactFormatter:includingAvatarViewDescriptors:]"];
  v11 = [v9 descriptorWithKeyDescriptors:v7 description:v10];

  return v11;
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  BOOL v3 = a3;
  v23[21] = *MEMORY[0x1E4F143B8];
  v4 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:1];
  v5 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 1, v4);
  uint64_t v6 = *MEMORY[0x1E4F1AEB0];
  v23[1] = v5;
  v23[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEA0];
  v23[3] = *MEMORY[0x1E4F1ADF0];
  v23[4] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AF30];
  v23[5] = *MEMORY[0x1E4F1ADE0];
  v23[6] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AEC0];
  v23[7] = *MEMORY[0x1E4F1AEB8];
  v23[8] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AF00];
  v23[9] = *MEMORY[0x1E4F1AEF8];
  v23[10] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AF38];
  v23[11] = *MEMORY[0x1E4F1AEF0];
  v23[12] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AED8];
  v23[13] = *MEMORY[0x1E4F1AF40];
  v23[14] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1AFA8];
  v23[15] = *MEMORY[0x1E4F1AF08];
  v23[16] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1AE78];
  v23[17] = *MEMORY[0x1E4F1ADB8];
  v23[18] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1AF98];
  v23[19] = *MEMORY[0x1E4F1AE20];
  v23[20] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:21];

  if (v3)
  {
    v17 = +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:0];
    uint64_t v18 = [v16 arrayByAddingObject:v17];

    v16 = (void *)v18;
  }
  v19 = (void *)MEMORY[0x1E4F1B8F8];
  v20 = [NSString stringWithUTF8String:"+[CNContactOrbHeaderView descriptorForRequiredKeysIncludingAvatarViewDescriptors:]"];
  v21 = [v19 descriptorWithKeyDescriptors:v16 description:v20];

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerView, 0);
  objc_storeStrong((id *)&self->_fakeTaglineAlignmentLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_storeStrong((id *)&self->_headerConstraints, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);

  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

- (void)setMarkerView:(id)a3
{
}

- (UIView)markerView
{
  return self->_markerView;
}

- (void)setFakeTaglineAlignmentLabel:(id)a3
{
}

- (UILabel)fakeTaglineAlignmentLabel
{
  return self->_fakeTaglineAlignmentLabel;
}

- (void)setTaglineLabel:(id)a3
{
}

- (UILabel)taglineLabel
{
  return self->_taglineLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)setHeaderConstraints:(id)a3
{
}

- (NSMutableArray)headerConstraints
{
  return self->_headerConstraints;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setAlwaysShowsMonogram:(BOOL)a3
{
  self->_alwaysShowsMonogram = a3;
}

- (BOOL)alwaysShowsMonogram
{
  return self->_alwaysShowsMonogram;
}

- (CNContactPhotoView)photoView
{
  return self->_photoView;
}

- (void)setCentersPhotoAndLabels:(BOOL)a3
{
  self->_centersPhotoAndLabels = a3;
}

- (BOOL)centersPhotoAndLabels
{
  return self->_centersPhotoAndLabels;
}

- (NSString)message
{
  return self->_message;
}

- (void)setAlternateName:(id)a3
{
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (UIEdgeInsets)contentMargins
{
  double top = self->_contentMargins.top;
  double left = self->_contentMargins.left;
  double bottom = self->_contentMargins.bottom;
  double right = self->_contentMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)menuWillHide:(id)a3
{
  [(UILabel *)self->_nameLabel setHighlighted:0];
  taglineLabel = self->_taglineLabel;

  [(UILabel *)taglineLabel setHighlighted:0];
}

- (void)handleNameLabelLongPress:(id)a3
{
  if ([(CNContactOrbHeaderView *)self becomeFirstResponder])
  {
    id v19 = [MEMORY[0x1E4FB1978] sharedMenuController];
    nameLabel = self->_nameLabel;
    [(UILabel *)nameLabel bounds];
    -[UILabel textRectForBounds:limitedToNumberOfLines:](nameLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_nameLabel numberOfLines], v5, v6, v7, v8);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(UILabel *)self->_taglineLabel text];

    if (v17)
    {
      [(UILabel *)self->_taglineLabel bounds];
      double v16 = v16 + v18;
    }
    objc_msgSend(v19, "setTargetRect:inView:", self->_nameLabel, v10, v12, v14, v16);
    [v19 setMenuVisible:1 animated:1];
    [(UILabel *)self->_nameLabel setHighlighted:1];
    [(UILabel *)self->_taglineLabel setHighlighted:1];
  }
}

- (id)_taglineStringForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] != 1)
  {
    uint64_t v8 = [v4 count];

    double v5 = +[CNNumberFormatting localizedStringWithInteger:v8];
    double v9 = NSString;
    double v10 = CNContactsUIBundle();
    double v11 = [v10 localizedStringForKey:@"CARD_NAME_GROUP_MEMBERS_COUNT-%@" value:&stru_1ED8AC728 table:@"Localized"];
    double v6 = objc_msgSend(v9, "stringWithFormat:", v11, v5);
    goto LABEL_6;
  }
  double v5 = [v4 firstObject];

  if ([v5 contactType] == 1)
  {
    double v6 = [v5 organizationName];

    if (!v6) {
      goto LABEL_12;
    }
    uint64_t v7 = [v5 personName];
    goto LABEL_11;
  }
  double v12 = [v5 personName];
  if (![v12 length])
  {

    goto LABEL_21;
  }
  double v13 = [(CNContactOrbHeaderView *)self alternateName];

  if (!v13)
  {
LABEL_21:
    double v6 = [MEMORY[0x1E4F28E78] string];
    double v10 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:1];
    if ([v10 length]) {
      [v6 appendString:v10];
    }
    v20 = [v5 nickname];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      if ([v6 length]) {
        [v6 appendString:@"\n"];
      }
      v22 = CNContactsUIBundle();
      v23 = [v22 localizedStringForKey:@"CARD_NAME_NICKNAME_FORMAT-%@" value:&stru_1ED8AC728 table:@"Localized"];
      v24 = [v5 nickname];
      objc_msgSend(v6, "appendFormat:", v23, v24);
    }
    v25 = [v5 previousFamilyName];
    uint64_t v26 = [v25 length];

    if (v26)
    {
      if ([v6 length]) {
        [v6 appendString:@"\n"];
      }
      v27 = [v5 previousFamilyName];
      [v6 appendString:v27];
    }
    v28 = [v5 jobTitle];
    uint64_t v29 = [v28 length];

    if (v29)
    {
      if ([v6 length]) {
        [v6 appendString:@"\n"];
      }
      v30 = [v5 jobTitle];
      [v6 appendString:v30];
    }
    v31 = [v5 departmentName];
    uint64_t v32 = [v31 length];

    if (v32)
    {
      v33 = [v5 jobTitle];
      uint64_t v34 = [v33 length];

      if (v34)
      {
        v35 = CNContactsUIBundle();
        v36 = [v35 localizedStringForKey:@"CARD_NAME_JOB_TITLE_DEPARTMENT_SEPARATOR" value:&stru_1ED8AC728 table:@"Localized"];

        [v6 appendString:v36];
      }
      else if ([v6 length])
      {
        [v6 appendString:@"\n"];
      }
      v37 = [v5 departmentName];
      [v6 appendString:v37];
    }
    v38 = [v5 organizationName];
    uint64_t v39 = [v38 length];

    if (!v39) {
      goto LABEL_7;
    }
    if ([v6 length]) {
      [v6 appendString:@"\n"];
    }
    double v11 = [v5 organizationName];
    [v6 appendString:v11];
LABEL_6:

LABEL_7:
    goto LABEL_12;
  }
  uint64_t v7 = [(CNContactOrbHeaderView *)self alternateName];
LABEL_11:
  double v6 = (void *)v7;
LABEL_12:

  double v14 = [(CNContactOrbHeaderView *)self message];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    if ([v6 length])
    {
      double v16 = NSString;
      uint64_t v17 = [(CNContactOrbHeaderView *)self message];
      uint64_t v18 = [v16 stringWithFormat:@"%@\n%@", v6, v17];

      double v6 = (void *)v17;
    }
    else
    {
      uint64_t v18 = [(CNContactOrbHeaderView *)self message];
    }

    double v6 = (void *)v18;
  }

  return v6;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    double v5 = [(CNContactOrbHeaderView *)self contactFormatter];
    double v6 = [v4 firstObject];
    uint64_t v7 = [v5 stringFromContact:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (![v7 length])
  {
    uint64_t v8 = [(CNContactOrbHeaderView *)self alternateName];

    uint64_t v7 = (void *)v8;
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (void)copy:(id)a3
{
  id v4 = [(UILabel *)self->_nameLabel text];
  id v8 = (id)[v4 mutableCopy];

  double v5 = [(UILabel *)self->_taglineLabel text];

  if (v5)
  {
    double v6 = [(UILabel *)self->_taglineLabel text];
    [v8 appendFormat:@"\n%@", v6];
  }
  uint64_t v7 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v7 setString:v8];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setNameTextAttributes:(id)a3
{
  double v5 = (NSDictionary *)a3;
  if (self->_nameTextAttributes != v5)
  {
    objc_storeStrong((id *)&self->_nameTextAttributes, a3);
    [(UILabel *)self->_nameLabel setAb_textAttributes:v5];
  }
}

- (void)setTaglineTextAttributes:(id)a3
{
  double v5 = (NSDictionary *)a3;
  if (self->_taglineTextAttributes != v5)
  {
    objc_storeStrong((id *)&self->_taglineTextAttributes, a3);
    [(UILabel *)self->_taglineLabel setAb_textAttributes:v5];
    [(UILabel *)self->_fakeTaglineAlignmentLabel setAb_textAttributes:v5];
  }
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactOrbHeaderView;
  [(CNContactOrbHeaderView *)&v5 tintColorDidChange];
  BOOL v3 = [(CNContactOrbHeaderView *)self tintColor];
  [(UILabel *)self->_nameLabel setHighlightedTextColor:v3];

  id v4 = [(CNContactOrbHeaderView *)self tintColor];
  [(UILabel *)self->_taglineLabel setHighlightedTextColor:v4];
}

- (void)setMessage:(id)a3
{
  objc_super v5 = (NSString *)a3;
  if (self->_message != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_message, a3);
    [(CNContactOrbHeaderView *)self reloadData];
    objc_super v5 = v6;
  }
}

- (double)photoLabelSpacing
{
  return 16.0;
}

- (void)reloadData
{
  [(CNContactPhotoView *)self->_photoView resetPhoto];
  BOOL v3 = [(CNContactOrbHeaderView *)self contacts];
  id v17 = [(CNContactOrbHeaderView *)self _headerStringForContacts:v3];

  id v4 = [(CNContactOrbHeaderView *)self contacts];
  objc_super v5 = [(CNContactOrbHeaderView *)self _taglineStringForContacts:v4];

  double v6 = [(CNContactOrbHeaderView *)self message];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [v17 length];

    if (v7) {
      goto LABEL_5;
    }
    double v6 = v17;
    id v17 = v5;
    objc_super v5 = 0;
  }

LABEL_5:
  if (![v5 length])
  {

    objc_super v5 = 0;
  }
  id v8 = [(UILabel *)self->_nameLabel text];
  if (v17)
  {
    if (!v8) {
      goto LABEL_17;
    }
  }
  else if (v8)
  {

    goto LABEL_17;
  }
  double v9 = [(UILabel *)self->_taglineLabel text];

  if (v5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = v9 != 0;
  }
  if (v17)
  {

    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v10) {
LABEL_17:
  }
    [(CNContactOrbHeaderView *)self setNeedsUpdateConstraints];
LABEL_18:
  [(UILabel *)self->_nameLabel setAb_text:v17];
  [(UILabel *)self->_taglineLabel setAb_text:v5];
  double v11 = [(CNContactOrbHeaderView *)self photoView];
  int v12 = [v11 isHidden];
  double v13 = [(CNContactOrbHeaderView *)self contacts];
  if ((unint64_t)[v13 count] > 1)
  {
    [v11 setHidden:0];
  }
  else
  {
    double v14 = [(CNContactOrbHeaderView *)self contacts];
    uint64_t v15 = [v14 firstObject];
    if ([v15 imageDataAvailable]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = [(CNContactOrbHeaderView *)self alwaysShowsMonogram] ^ 1;
    }
    [v11 setHidden:v16];
  }
  if (v12 != [v11 isHidden]) {
    [(CNContactOrbHeaderView *)self setNeedsUpdateConstraints];
  }
}

- (void)setContentMargins:(UIEdgeInsets)a3
{
  if (self->_contentMargins.left != a3.left
    || self->_contentMargins.top != a3.top
    || self->_contentMargins.right != a3.right
    || self->_contentMargins.bottom != a3.bottom)
  {
    self->_contentMargins = a3;
    [(CNContactOrbHeaderView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateFontSizes
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  uint64_t v3 = v14;
  id v4 = (void *)MEMORY[0x1E4FB08E0];
  objc_super v5 = [(CNContactOrbHeaderView *)self nameTextAttributes];
  double v6 = [v5 objectForKeyedSubscript:@"ABTextStyleAttributeName"];
  uint64_t v7 = objc_msgSend(v4, "ab_preferredRowFontForTextStyle:", v6);
  v15[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v8];

  uint64_t v9 = *MEMORY[0x1E4FB2950];
  v12[1] = v3;
  v13[0] = v9;
  v12[0] = @"ABTextStyleAttributeName";
  BOOL v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:");
  v13[1] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [self cn_updateDictionaryForKey:@"taglineTextAttributes" withChanges:v11];
}

- (void)updateWithContacts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(NSArray *)self->_contacts isEqual:v5] & 1) == 0)
  {
    p_contacts = &self->_contacts;
    id v15 = a3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
          int v12 = objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", 1, p_contacts, v15, (void)v16);
          v20 = v12;
          double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
          [v11 assertKeysAreAvailable:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    [(CNContactPhotoView *)self->_photoView setContacts:v6];
    -[CNContactOrbHeaderView setHidden:](self, "setHidden:", [v6 count] == 0);
  }
  [(CNContactOrbHeaderView *)self reloadData];
}

- (void)updateConstraints
{
  v105[2] = *MEMORY[0x1E4F143B8];
  [(CNContactOrbHeaderView *)self reloadData];
  v95.receiver = self;
  v95.super_class = (Class)CNContactOrbHeaderView;
  [(CNContactOrbHeaderView *)&v95 updateConstraints];
  uint64_t v3 = [(CNContactOrbHeaderView *)self headerConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(CNContactOrbHeaderView *)self headerConstraints];
    [v4 deactivateConstraints:v5];

    id v6 = [(CNContactOrbHeaderView *)self headerConstraints];
    [v6 removeAllObjects];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    [(CNContactOrbHeaderView *)self setHeaderConstraints:v6];
  }

  nameLabel = self->_nameLabel;
  v104[0] = @"name";
  v104[1] = @"photo";
  v105[0] = nameLabel;
  uint64_t v8 = [(CNContactOrbHeaderView *)self photoView];
  v105[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  double v11 = [(CNContactOrbHeaderView *)self photoView];
  char v12 = [v11 isHidden];

  double v13 = (void *)MEMORY[0x1E4F28DC8];
  if (v12)
  {
    v96[0] = @"leftMargin";
    uint64_t v14 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    long long v16 = [v14 numberWithDouble:v15];
    v96[1] = @"rightMargin";
    v97[0] = v16;
    long long v17 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    long long v19 = [v17 numberWithDouble:v18];
    v97[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
    uint64_t v21 = [v13 constraintsWithVisualFormat:@"H:|-(leftMargin)-[name]-(rightMargin)-|" options:0 metrics:v20 views:v9];
    [v10 addObjectsFromArray:v21];
  }
  else
  {
    v102[0] = @"topMargin";
    uint64_t v22 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    v23 = objc_msgSend(v22, "numberWithDouble:");
    v103[0] = v23;
    v102[1] = @"bottomMargin";
    v24 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    uint64_t v26 = [v24 numberWithDouble:v25];
    v102[2] = @"photoSize";
    v103[1] = v26;
    v103[2] = &unk_1ED915520;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
    v100 = @"photo";
    v28 = [(CNContactOrbHeaderView *)self photoView];
    v101 = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v30 = [v13 constraintsWithVisualFormat:@"V:|-(>=topMargin)-[photo(photoSize)]-(>=bottomMargin)-|" options:0 metrics:v27 views:v29];
    [v10 addObjectsFromArray:v30];

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v98[0] = @"leftMargin";
    uint64_t v32 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    long long v16 = [v32 numberWithDouble:v33];
    v99[0] = v16;
    v98[1] = @"photoLabelSpacing";
    uint64_t v34 = NSNumber;
    [(CNContactOrbHeaderView *)self photoLabelSpacing];
    long long v19 = objc_msgSend(v34, "numberWithDouble:");
    v99[1] = v19;
    v98[2] = @"rightMargin";
    v35 = NSNumber;
    [(CNContactOrbHeaderView *)self contentMargins];
    v20 = [v35 numberWithDouble:v36];
    v99[2] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:3];
    v37 = [v31 constraintsWithVisualFormat:@"H:|-(leftMargin)-[photo]-(photoLabelSpacing)-[name]-(rightMargin)-|" options:0 metrics:v21 views:v9];
    [v10 addObjectsFromArray:v37];
  }
  p_taglineLabel = (id *)&self->_taglineLabel;
  uint64_t v39 = [(UILabel *)self->_taglineLabel text];

  v40 = (void *)MEMORY[0x1E4F28DC8];
  if (v39)
  {
    id v41 = *p_taglineLabel;
    [(CNContactOrbHeaderView *)self contentMargins];
    v43 = [v40 constraintWithItem:self attribute:4 relatedBy:1 toItem:v41 attribute:4 multiplier:1.0 constant:v42];
    [v10 addObject:v43];
    v44 = [*p_taglineLabel font];
    [v44 _scaledValueForValue:20.0];
    double v46 = v45;

    v47 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_taglineLabel attribute:12 relatedBy:0 toItem:self->_nameLabel attribute:11 multiplier:1.0 constant:v46];
    [v10 addObject:v47];

    v48 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_taglineLabel attribute:5 relatedBy:0 toItem:self->_nameLabel attribute:5 multiplier:1.0 constant:0.0];
    [v10 addObject:v48];

    v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:*p_taglineLabel attribute:6 relatedBy:0 toItem:self->_nameLabel attribute:6 multiplier:1.0 constant:0.0];
    [v10 addObject:v49];

    v50 = [(CNContactOrbHeaderView *)self photoView];
    char v51 = [v50 isHidden];

    v52 = [(UILabel *)self->_nameLabel font];
    v53 = v52;
    if (v51)
    {
      [v52 _scaledValueForValue:40.0];
      double v55 = v54;

      v56 = (void *)MEMORY[0x1E4F28DC8];
      fakeTaglineAlignmentLabel = self->_nameLabel;
      double v58 = 1.0;
      uint64_t v59 = 12;
      v60 = self;
      uint64_t v61 = 3;
      double v62 = v55;
    }
    else
    {
      [v52 _scaledValueForValue:24.0];
      double v74 = v73;

      v75 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_nameLabel attribute:12 relatedBy:1 toItem:self attribute:3 multiplier:1.0 constant:v74];
      [v10 addObject:v75];

      v76 = [v10 lastObject];
      LODWORD(v77) = 1148829696;
      [v76 setPriority:v77];

      v78 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_markerView attribute:3 relatedBy:0 toItem:self->_nameLabel attribute:3 multiplier:1.0 constant:0.0];
      [v10 addObject:v78];

      BOOL v79 = [(CNContactOrbHeaderView *)self centersPhotoAndLabels];
      p_fakeTaglineAlignmentLabel = &self->_taglineLabel;
      if (!v79) {
        p_fakeTaglineAlignmentLabel = &self->_fakeTaglineAlignmentLabel;
      }
      v81 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_markerView attribute:4 relatedBy:0 toItem:*p_fakeTaglineAlignmentLabel attribute:4 multiplier:1.0 constant:0.0];
      [v10 addObject:v81];

      v82 = (void *)MEMORY[0x1E4F28DC8];
      markerView = self->_markerView;
      v84 = [(CNContactOrbHeaderView *)self photoView];
      v85 = [v82 constraintWithItem:markerView attribute:10 relatedBy:0 toItem:v84 attribute:10 multiplier:1.0 constant:0.0];
      [v10 addObject:v85];

      v86 = [v10 lastObject];
      LODWORD(v87) = 1148813312;
      [v86 setPriority:v87];

      v88 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_fakeTaglineAlignmentLabel attribute:5 relatedBy:0 toItem:*p_taglineLabel attribute:5 multiplier:1.0 constant:0.0];
      [v10 addObject:v88];

      v89 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_fakeTaglineAlignmentLabel attribute:6 relatedBy:0 toItem:*p_taglineLabel attribute:6 multiplier:1.0 constant:0.0];
      [v10 addObject:v89];

      v56 = (void *)MEMORY[0x1E4F28DC8];
      fakeTaglineAlignmentLabel = self->_fakeTaglineAlignmentLabel;
      v60 = (CNContactOrbHeaderView *)*p_taglineLabel;
      double v58 = 1.0;
      double v62 = 0.0;
      uint64_t v59 = 3;
      uint64_t v61 = 3;
    }
  }
  else
  {
    v63 = self->_nameLabel;
    [(CNContactOrbHeaderView *)self contentMargins];
    v65 = [v40 constraintWithItem:self attribute:4 relatedBy:1 toItem:v63 attribute:4 multiplier:1.0 constant:v64];
    [v10 addObject:v65];

    v66 = [(CNContactOrbHeaderView *)self photoView];
    char v67 = [v66 isHidden];

    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = self->_nameLabel;
    if (v67)
    {
      v70 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_nameLabel attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:40.0];
      [v10 addObject:v70];

      v71 = (void *)MEMORY[0x1E4F28DC8];
      v43 = [(CNContactOrbHeaderView *)self nameLabel];
      [(CNContactOrbHeaderView *)self contentMargins];
      double v62 = v72;
    }
    else
    {
      v90 = [(CNContactOrbHeaderView *)self photoView];
      v91 = [v68 constraintWithItem:v69 attribute:10 relatedBy:0 toItem:v90 attribute:10 multiplier:1.0 constant:0.0];
      [v10 addObject:v91];

      v71 = (void *)MEMORY[0x1E4F28DC8];
      v43 = [(CNContactOrbHeaderView *)self photoView];
      [(CNContactOrbHeaderView *)self contentMargins];
      double v62 = -v92;
    }
    double v58 = 1.0;
    v56 = v71;
    fakeTaglineAlignmentLabel = v43;
    uint64_t v59 = 4;
    v60 = self;
    uint64_t v61 = 4;
  }
  v93 = [v56 constraintWithItem:fakeTaglineAlignmentLabel attribute:v59 relatedBy:0 toItem:v60 attribute:v61 multiplier:v58 constant:v62];
  [v10 addObject:v93];

  v94 = [(CNContactOrbHeaderView *)self headerConstraints];
  [v94 addObjectsFromArray:v10];

  [MEMORY[0x1E4F28DC8] activateConstraints:v10];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(CNContactOrbHeaderView *)self reloadData];
  v14.receiver = self;
  v14.super_class = (Class)CNContactOrbHeaderView;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[CNContactOrbHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactOrbHeaderView;
  [(CNContactOrbHeaderView *)&v4 dealloc];
}

- (CNContactOrbHeaderView)initWithContact:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v53[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CNContactOrbHeaderView;
  double v10 = -[CNContactOrbHeaderView initWithFrame:](&v48, sel_initWithFrame_, x, y, width, height);
  *(_OWORD *)&v10->_contentMargins.double top = xmmword_18B9C3700;
  *(_OWORD *)&v10->_contentMargins.double bottom = xmmword_18B9C3710;
  double v11 = [CNContactPhotoView alloc];
  double v12 = +[CNUIContactsEnvironment currentEnvironment];
  double v13 = [v12 cachingLikenessRenderer];
  uint64_t v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v11, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", 0, 0, 0, 0, v13, x, y, width, height);
  photoView = v10->_photoView;
  v10->_photoView = (CNContactPhotoView *)v14;

  [(CNContactPhotoView *)v10->_photoView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactOrbHeaderView *)v10 addSubview:v10->_photoView];
  uint64_t v16 = *MEMORY[0x1E4FB2908];
  uint64_t v17 = *MEMORY[0x1E4FB0700];
  v52[0] = @"ABTextStyleAttributeName";
  v52[1] = v17;
  v53[0] = v16;
  double v18 = +[CNUIColorRepository contactStyleDefaultTextColor];
  v53[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
  nameTextAttributes = v10->_nameTextAttributes;
  v10->_nameTextAttributes = (NSDictionary *)v19;

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v10 action:sel_handleNameLabelLongPress_];
  id v22 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v23 = *MEMORY[0x1E4F1DB28];
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v27 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], v24, v25, v26);
  nameLabel = v10->_nameLabel;
  v10->_nameLabel = (UILabel *)v27;

  [(UILabel *)v10->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v10->_nameLabel setTextAlignment:4];
  [(UILabel *)v10->_nameLabel setNumberOfLines:2];
  [(UILabel *)v10->_nameLabel setUserInteractionEnabled:1];
  uint64_t v29 = [(CNContactOrbHeaderView *)v10 tintColor];
  [(UILabel *)v10->_nameLabel setHighlightedTextColor:v29];

  LODWORD(v30) = 1148829696;
  [(UILabel *)v10->_nameLabel setContentHuggingPriority:1 forAxis:v30];
  LODWORD(v31) = 1148829696;
  [(UILabel *)v10->_nameLabel setContentCompressionResistancePriority:1 forAxis:v31];
  [(UILabel *)v10->_nameLabel addGestureRecognizer:v21];
  [(UILabel *)v10->_nameLabel _cnui_applyContactStyle];
  [(UILabel *)v10->_nameLabel setAb_textAttributes:v10->_nameTextAttributes];
  [(CNContactOrbHeaderView *)v10 addSubview:v10->_nameLabel];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v10 action:sel_handleNameLabelLongPress_];
  uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v23, v24, v25, v26);
  taglineLabel = v10->_taglineLabel;
  v10->_taglineLabel = (UILabel *)v33;

  [(UILabel *)v10->_taglineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v10->_taglineLabel setTextAlignment:4];
  [(UILabel *)v10->_taglineLabel setNumberOfLines:0];
  [(UILabel *)v10->_taglineLabel setUserInteractionEnabled:1];
  v35 = [(CNContactOrbHeaderView *)v10 tintColor];
  [(UILabel *)v10->_taglineLabel setHighlightedTextColor:v35];

  LODWORD(v36) = 1148829696;
  [(UILabel *)v10->_taglineLabel setContentCompressionResistancePriority:1 forAxis:v36];
  [(UILabel *)v10->_taglineLabel addGestureRecognizer:v32];
  [(UILabel *)v10->_taglineLabel _cnui_applyContactStyle];
  [(CNContactOrbHeaderView *)v10 addSubview:v10->_taglineLabel];
  uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v23, v24, v25, v26);
  fakeTaglineAlignmentLabel = v10->_fakeTaglineAlignmentLabel;
  v10->_fakeTaglineAlignmentLabel = (UILabel *)v37;

  [(UILabel *)v10->_fakeTaglineAlignmentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v10->_fakeTaglineAlignmentLabel setTextAlignment:4];
  [(UILabel *)v10->_fakeTaglineAlignmentLabel setText:@"X"];
  [(UILabel *)v10->_fakeTaglineAlignmentLabel setHidden:1];
  LODWORD(v39) = 1148829696;
  [(UILabel *)v10->_fakeTaglineAlignmentLabel setContentHuggingPriority:1 forAxis:v39];
  [(CNContactOrbHeaderView *)v10 addSubview:v10->_fakeTaglineAlignmentLabel];
  uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v23, v24, v25, v26);
  markerView = v10->_markerView;
  v10->_markerView = (UIView *)v40;

  [(UIView *)v10->_markerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactOrbHeaderView *)v10 addSubview:v10->_markerView];
  uint64_t v42 = *MEMORY[0x1E4FB2950];
  v50[1] = v17;
  v51[0] = v42;
  v50[0] = @"ABTextStyleAttributeName";
  v43 = +[CNUIColorRepository contactStyleDefaultTextColor];
  v51[1] = v43;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  [(CNContactOrbHeaderView *)v10 setTaglineTextAttributes:v44];

  [(CNContactOrbHeaderView *)v10 updateFontSizes];
  double v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v45 addObserver:v10 selector:sel_menuWillHide_ name:*MEMORY[0x1E4FB2CB8] object:0];

  [(CNContactOrbHeaderView *)v10 setNeedsUpdateConstraints];
  if (v9)
  {
    id v49 = v9;
    double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    [(CNContactOrbHeaderView *)v10 updateWithContacts:v46];
  }
  else
  {
    [(CNContactOrbHeaderView *)v10 updateWithContacts:MEMORY[0x1E4F1CBF0]];
  }

  return v10;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end