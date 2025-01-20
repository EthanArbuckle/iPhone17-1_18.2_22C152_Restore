@interface CNContactListBannerView
+ (id)descriptorForRequiredKeys;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)displaysContactInfo;
- (CALayer)topSeparator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)meContact;
- (CNContactFormatter)formatter;
- (CNContactListBannerView)init;
- (CNContactListBannerViewDelegate)delegate;
- (CNContactListStyleApplier)contactListStyleApplier;
- (CNContactStore)contactStore;
- (NSArray)constraintsPendingActivation;
- (NSLayoutConstraint)footnoteTitleToTitleVerticalConstraint;
- (NSLayoutConstraint)footnoteTitleToValueHorizontalSpaceConstraint;
- (UIDragInteraction)dragInteraction;
- (UIGestureRecognizer)longPress;
- (UILabel)footnoteLabel;
- (UILabel)footnoteValueLabel;
- (UILabel)titleLabel;
- (UIView)avatarView;
- (UIView)avatarViewContainer;
- (UIView)bottomSeparator;
- (UIView)footnoteContainer;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (void)activatePendingConstraints;
- (void)cellWasLongPressed:(id)a3;
- (void)cellWasSingleTapped:(id)a3;
- (void)configureDragInteraction;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)menuDidHide:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setConstraintsPendingActivation:(id)a3;
- (void)setContactListStyleApplier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteraction:(id)a3;
- (void)setFootnoteTitleToTitleVerticalConstraint:(id)a3;
- (void)setFootnoteTitleToValueHorizontalSpaceConstraint:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setMeContact:(id)a3 footnoteTitle:(id)a4 footnoteValue:(id)a5;
- (void)setTopSeparatorWithInset:(double)a3 andLength:(double)a4;
- (void)showMenu;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontRelatedConstraints;
@end

@implementation CNContactListBannerView

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactListBannerView;
  id v4 = a3;
  [(CNContactListBannerView *)&v8 traitCollectionDidChange:v4];
  v5 = [(CNContactListBannerView *)self traitCollection];
  int v6 = [v4 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6)
  {
    id v7 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
    -[CALayer setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", [v7 CGColor]);
  }
}

- (void)setMeContact:(id)a3 footnoteTitle:(id)a4 footnoteValue:(id)a5
{
  id v23 = a4;
  id v9 = a5;
  [(CNContactListBannerView *)self setMeContact:a3];
  uint64_t v10 = *MEMORY[0x1E4F5A298];
  int v11 = (*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v23);
  v12 = v23;
  if (v11)
  {
    v5 = CNContactsUIBundle();
    v12 = [v5 localizedStringForKey:@"MY_CARD" value:&stru_1ED8AC728 table:@"Localized"];
  }
  v13 = [(CNContactListBannerView *)self footnoteLabel];
  [v13 setText:v12];

  if (v11)
  {
  }
  v14 = [(CNContactListBannerView *)self footnoteValueLabel];
  [v14 setText:v9];

  int v15 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v9);
  v16 = [(CNContactListBannerView *)self longPress];
  [v16 setEnabled:v15 ^ 1u];

  if (v15) {
    double v17 = 0.0;
  }
  else {
    double v17 = -5.0;
  }
  v18 = [(CNContactListBannerView *)self footnoteTitleToValueHorizontalSpaceConstraint];
  [v18 setConstant:v17];

  if ([(CNContactListBannerView *)self displaysContactInfo])
  {
    v19 = [(CNContactListBannerView *)self formatter];
    v20 = [(CNContactListBannerView *)self meContact];
    v21 = [v19 stringFromContact:v20];
    v22 = [(CNContactListBannerView *)self titleLabel];
    [v22 setText:v21];
  }
  else
  {
    v19 = [(CNContactListBannerView *)self titleLabel];
    [v19 setText:0];
  }

  [(CNContactListBannerView *)self updateFontRelatedConstraints];
  [(CNContactListBannerView *)self activatePendingConstraints];
  [(CNContactListBannerView *)self configureDragInteraction];
}

- (void)updateFontRelatedConstraints
{
  v3 = [(CNContactListBannerView *)self contactListStyleApplier];
  id v4 = [(CNContactListBannerView *)self titleLabel];
  objc_msgSend(v3, "applyContactListStyleToBannerTitle:primaryAppearance:", v4, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  v5 = [(CNContactListBannerView *)self contactListStyleApplier];
  int v6 = [(CNContactListBannerView *)self footnoteLabel];
  objc_msgSend(v5, "applyContactListStyleToBannerFootnote:primaryAppearance:", v6, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  id v7 = [(CNContactListBannerView *)self contactListStyleApplier];
  objc_super v8 = [(CNContactListBannerView *)self footnoteValueLabel];
  objc_msgSend(v7, "applyContactListStyleToBannerFootnote:primaryAppearance:", v8, -[CNContactListBannerView displaysContactInfo](self, "displaysContactInfo"));

  id v9 = [(CNContactListBannerView *)self footnoteLabel];
  uint64_t v10 = [v9 font];
  [v10 _scaledValueForValue:20.0];
  double v12 = v11;

  v13 = [(CNContactListBannerView *)self footnoteTitleToTitleVerticalConstraint];
  [v13 setConstant:v12];

  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory")) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  id v15 = [(CNContactListBannerView *)self titleLabel];
  [v15 setNumberOfLines:v14];
}

- (BOOL)displaysContactInfo
{
  v2 = [(CNContactListBannerView *)self meContact];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (UILabel)footnoteValueLabel
{
  return self->_footnoteValueLabel;
}

- (NSLayoutConstraint)footnoteTitleToTitleVerticalConstraint
{
  return self->_footnoteTitleToTitleVerticalConstraint;
}

- (void)setMeContact:(id)a3
{
}

- (void)setConstraintsPendingActivation:(id)a3
{
}

- (UIGestureRecognizer)longPress
{
  return self->_longPress;
}

- (CNContactListBannerView)init
{
  v70[6] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)CNContactListBannerView;
  v2 = [(CNContactListBannerView *)&v68 init];
  if (v2)
  {
    BOOL v3 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    [(CNContactFormatter *)v2->_formatter setStyle:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v2 action:sel_cellWasLongPressed_];
    longPress = v2->_longPress;
    v2->_longPress = (UIGestureRecognizer *)v5;

    [(CNContactListBannerView *)v2 addGestureRecognizer:v2->_longPress];
    v67 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v2 action:sel_cellWasSingleTapped_];
    [v67 setNumberOfTapsRequired:1];
    [(CNContactListBannerView *)v2 addGestureRecognizer:v67];
    id v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    avatarViewContainer = v2->_avatarViewContainer;
    v2->_avatarViewContainer = v7;

    [(UIView *)v2->_avatarViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactListBannerView *)v2 addSubview:v2->_avatarViewContainer];
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactListBannerView *)v2 addSubview:v9];
    uint64_t v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v10;

    [(UILabel *)v2->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 addSubview:v2->_titleLabel];
    double v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    footnoteContainer = v2->_footnoteContainer;
    v2->_footnoteContainer = v12;

    [(UIView *)v2->_footnoteContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v2->_footnoteContainer setBackgroundColor:v14];

    [v9 addSubview:v2->_footnoteContainer];
    id v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    footnoteLabel = v2->_footnoteLabel;
    v2->_footnoteLabel = v15;

    [(UILabel *)v2->_footnoteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v2->_footnoteContainer addSubview:v2->_footnoteLabel];
    double v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    footnoteValueLabel = v2->_footnoteValueLabel;
    v2->_footnoteValueLabel = v17;

    [(UILabel *)v2->_footnoteValueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v2->_footnoteContainer addSubview:v2->_footnoteValueLabel];
    v69[0] = @"avatarViewContainer";
    v70[0] = v2->_avatarViewContainer;
    v69[1] = @"title";
    v70[1] = v2->_titleLabel;
    v69[2] = @"footnoteContainer";
    v70[2] = v2->_footnoteContainer;
    v69[3] = @"footnoteTitle";
    v70[3] = v2->_footnoteLabel;
    v69[4] = @"footnoteValue";
    v19 = v2->_footnoteValueLabel;
    v69[5] = @"labelContainer";
    v70[4] = v19;
    v70[5] = v9;
    v64 = v9;
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:6];
    v20 = [MEMORY[0x1E4F1CA48] array];
    v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    LODWORD(v21) = 1132068864;
    [v66 setPriority:v21];
    [(NSArray *)v20 addObject:v66];
    double v22 = 1.0;
    id v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_avatarViewContainer attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v23];

    v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_avatarViewContainer attribute:8 relatedBy:-1 toItem:v2 attribute:8 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v24];

    if ([(CNContactListBannerView *)v2 effectiveUserInterfaceLayoutDirection] != 1) {
      double v22 = 2.0;
    }
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = v2->_avatarViewContainer;
    v27 = [(CNContactListBannerView *)v2 layoutMarginsGuide];
    v28 = [v25 constraintWithItem:v26 attribute:5 relatedBy:0 toItem:v27 attribute:5 multiplier:v22 constant:0.0];
    [(NSArray *)v20 addObject:v28];

    LODWORD(v29) = 1132068864;
    [(UIView *)v2->_avatarViewContainer setContentHuggingPriority:1 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(UIView *)v2->_avatarViewContainer setContentHuggingPriority:0 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(UIView *)v2->_avatarViewContainer setContentCompressionResistancePriority:1 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UIView *)v2->_avatarViewContainer setContentCompressionResistancePriority:0 forAxis:v32];
    v65 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_avatarViewContainer attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    LODWORD(v33) = 1132068864;
    [v65 setPriority:v33];
    [(NSArray *)v20 addObject:v65];
    v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v34];

    v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_titleLabel attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:10.0];
    [(NSArray *)v20 addObject:v35];

    LODWORD(v36) = 1148846080;
    [(UILabel *)v2->_titleLabel setContentCompressionResistancePriority:1 forAxis:v36];
    v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_titleLabel attribute:5 relatedBy:0 toItem:v2->_avatarViewContainer attribute:6 multiplier:1.0 constant:15.0];
    [(NSArray *)v20 addObject:v37];

    v38 = (void *)MEMORY[0x1E4F28DC8];
    v39 = v2->_titleLabel;
    v40 = [(CNContactListBannerView *)v2 layoutMarginsGuide];
    v41 = [v38 constraintWithItem:v39 attribute:6 relatedBy:-1 toItem:v40 attribute:6 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v41];

    v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[title]" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v42];

    v43 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[title]|" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v43];

    uint64_t v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_footnoteLabel attribute:12 relatedBy:0 toItem:v2->_titleLabel attribute:11 multiplier:1.0 constant:0.0];
    footnoteTitleToTitleVerticalConstraint = v2->_footnoteTitleToTitleVerticalConstraint;
    v2->_footnoteTitleToTitleVerticalConstraint = (NSLayoutConstraint *)v44;

    [(NSArray *)v20 addObject:v2->_footnoteTitleToTitleVerticalConstraint];
    v46 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_footnoteLabel attribute:4 relatedBy:-1 toItem:v2 attribute:4 multiplier:1.0 constant:-10.0];
    [(NSArray *)v20 addObject:v46];

    v47 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[footnoteTitle]" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v47];

    v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[footnoteValue]|" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v48];

    v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_footnoteValueLabel attribute:10 relatedBy:0 toItem:v2->_footnoteLabel attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v49];

    uint64_t v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_footnoteLabel attribute:6 relatedBy:0 toItem:v2->_footnoteValueLabel attribute:5 multiplier:1.0 constant:0.0];
    footnoteTitleToValueHorizontalSpaceConstraint = v2->_footnoteTitleToValueHorizontalSpaceConstraint;
    v2->_footnoteTitleToValueHorizontalSpaceConstraint = (NSLayoutConstraint *)v50;

    [(NSArray *)v20 addObject:v2->_footnoteTitleToValueHorizontalSpaceConstraint];
    LODWORD(v52) = 1144750080;
    [(UILabel *)v2->_footnoteLabel setContentHuggingPriority:0 forAxis:v52];
    v53 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[footnoteTitle]|" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v53];

    v54 = [MEMORY[0x1E4F28DC8] constraintWithItem:v2->_footnoteContainer attribute:5 relatedBy:0 toItem:v2->_avatarViewContainer attribute:6 multiplier:1.0 constant:15.0];
    [(NSArray *)v20 addObject:v54];

    v55 = (void *)MEMORY[0x1E4F28DC8];
    v56 = v2->_footnoteContainer;
    v57 = [(CNContactListBannerView *)v2 layoutMarginsGuide];
    v58 = [v55 constraintWithItem:v56 attribute:6 relatedBy:0 toItem:v57 attribute:6 multiplier:1.0 constant:0.0];
    [(NSArray *)v20 addObject:v58];

    v59 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[footnoteContainer]|" options:0 metrics:0 views:v63];
    [(NSArray *)v20 addObjectsFromArray:v59];

    constraintsPendingActivation = v2->_constraintsPendingActivation;
    v2->_constraintsPendingActivation = v20;

    v61 = v2;
  }

  return v2;
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (NSLayoutConstraint)footnoteTitleToValueHorizontalSpaceConstraint
{
  return self->_footnoteTitleToValueHorizontalSpaceConstraint;
}

- (void)configureDragInteraction
{
  if ([MEMORY[0x1E4FB1708] isEnabledByDefault])
  {
    BOOL v3 = [(CNContactListBannerView *)self meContact];

    id v8 = [(CNContactListBannerView *)self dragInteraction];
    if (v3)
    {

      if (!v8)
      {
        id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:self];
        [(CNContactListBannerView *)self setDragInteraction:v4];

        uint64_t v5 = [(CNContactListBannerView *)self dragInteraction];
        [(CNContactListBannerView *)self addInteraction:v5];
      }
      int v6 = [(CNContactListBannerView *)self dragInteraction];
      id v8 = v6;
      uint64_t v7 = 1;
    }
    else
    {
      int v6 = v8;
      uint64_t v7 = 0;
    }
    [v6 setEnabled:v7];
  }
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (void)activatePendingConstraints
{
  BOOL v3 = [(CNContactListBannerView *)self constraintsPendingActivation];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
    int v6 = [(CNContactListBannerView *)self constraintsPendingActivation];
    [v5 activateConstraints:v6];

    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    [(CNContactListBannerView *)self setConstraintsPendingActivation:v7];
  }
}

- (NSArray)constraintsPendingActivation
{
  return self->_constraintsPendingActivation;
}

- (void)setTopSeparatorWithInset:(double)a3 andLength:(double)a4
{
  if (!self->_topSeparator)
  {
    uint64_t v7 = [MEMORY[0x1E4F39BE8] layer];
    topSeparator = self->_topSeparator;
    self->_topSeparator = v7;

    id v9 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
    -[CALayer setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", [v9 CGColor]);
  }
  uint64_t v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  -[CALayer setFrame:](self->_topSeparator, "setFrame:", a3, 0.0, a4, 1.0 / v11);

  id v12 = [(CNContactListBannerView *)self layer];
  [v12 addSublayer:self->_topSeparator];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    [(UILabel *)self->_titleLabel setPreferredMaxLayoutWidth:floor(width + -60.0 + -30.0)];
LABEL_5:
    -[CNContactListBannerView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", width, height);
    double width = v8;
    goto LABEL_6;
  }
  int v6 = [(CNContactListBannerView *)self avatarView];

  if (!v6) {
    goto LABEL_5;
  }
  double v7 = 80.0;
LABEL_6:
  double v9 = width;
  result.double height = v7;
  result.double width = v9;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);

  [(CNContactListBannerView *)self applyStyle];
}

- (void)setAvatarView:(id)a3
{
  id firstValue = a3;
  [(UIView *)self->_avatarView removeFromSuperview];
  objc_storeStrong((id *)&self->_avatarView, a3);
  if (firstValue)
  {
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = _NSDictionaryOfVariableBindings(&cfstr_Avatarview.isa, firstValue, 0);
    int v6 = [(CNContactListBannerView *)self avatarViewContainer];
    [v6 addSubview:firstValue];

    double v7 = [MEMORY[0x1E4F1CA48] array];
    double v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[avatarView(avatarSize)]|" options:0 metrics:&unk_1ED915CB0 views:v5];
    [v7 addObjectsFromArray:v8];

    double v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(verticalMargin)-[avatarView(avatarSize)]-(verticalMargin)-|" options:0 metrics:&unk_1ED915CB0 views:v5];
    [v7 addObjectsFromArray:v9];

    [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  }
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (UIView)avatarViewContainer
{
  return self->_avatarViewContainer;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_18273 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_18273, &__block_literal_global_18274);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_18275;

  return v2;
}

void __52__CNContactListBannerView_descriptorForRequiredKeys__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  BOOL v3 = [NSString stringWithUTF8String:"+[CNContactListBannerView descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  uint64_t v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_18275;
  descriptorForRequiredKeys_cn_once_object_1_18275 = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_constraintsPendingActivation, 0);
  objc_storeStrong((id *)&self->_footnoteTitleToValueHorizontalSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_footnoteTitleToTitleVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_footnoteValueLabel, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarViewContainer, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_longPress, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFootnoteTitleToValueHorizontalSpaceConstraint:(id)a3
{
}

- (void)setFootnoteTitleToTitleVerticalConstraint:(id)a3
{
}

- (CALayer)topSeparator
{
  return self->_topSeparator;
}

- (UIView)footnoteContainer
{
  return self->_footnoteContainer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (CNContactListBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListBannerViewDelegate *)WeakRetained;
}

- (void)cellWasSingleTapped:(id)a3
{
  uint64_t v4 = [(CNContactListBannerView *)self meContact];

  if (v4)
  {
    id v6 = [(CNContactListBannerView *)self delegate];
    uint64_t v5 = [(CNContactListBannerView *)self meContact];
    [v6 bannerView:self wasSelectedToPresentMeContact:v5];
  }
}

- (void)cellWasLongPressed:(id)a3
{
  if ([a3 state] == 1
    && [(CNContactListBannerView *)self becomeFirstResponder])
  {
    [(CNContactListBannerView *)self showMenu];
  }
}

- (void)showMenu
{
  id v4 = [MEMORY[0x1E4FB1978] sharedMenuController];
  [(CNContactListBannerView *)self bounds];
  objc_msgSend(v4, "setTargetRect:inView:", self);
  [v4 setMenuVisible:1 animated:1];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_menuDidHide_ name:*MEMORY[0x1E4FB2CB0] object:v4];
}

- (void)menuDidHide:(id)a3
{
  [(CNContactListBannerView *)self resignFirstResponder];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  BOOL v3 = [(CNContactListBannerView *)self footnoteValueLabel];
  id v5 = [v3 text];

  if (v5)
  {
    id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v4 setString:v5];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ == a3) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)CNContactListBannerView;
  return -[CNContactListBannerView canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(CNContactListBannerView *)self meContact];
  id v6 = [(CNContactListBannerView *)self contactStore];
  double v7 = +[CNUIDraggingContacts dragItemForContact:v5 withContactStore:v6];
  v10[0] = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactListBannerView;
  [(CNContactListBannerView *)&v4 dealloc];
}

@end