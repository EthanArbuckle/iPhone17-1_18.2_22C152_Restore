@interface CNComposeRecipientTableViewCell
+ (BOOL)avatarsAreHidden;
+ (double)additionalSeparatorInset;
+ (id)_attributedStringForGroupMembersOfRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6;
+ (id)_attributedStringForListOfGroupMemberNames:(id)a3 numberTruncated:(unint64_t)a4;
+ (id)_attributedTitleForRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6;
+ (id)attributedStringWithBoldedRangesForMatchedStrings:(id)a3 inString:(id)a4 font:(id)a5 boldAllMatches:(BOOL)a6;
+ (id)identifier;
- (BOOL)canCollapseRecipient;
- (BOOL)canExpandRecipient;
- (BOOL)shouldHighlightCompleteMatches;
- (BOOL)supportsAvatarView;
- (CNAvatarViewController)avatarViewController;
- (CNComposeRecipientActionButton)actionButton;
- (CNComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNComposeRecipientTableViewCellDelegate)delegate;
- (NSArray)activeConstraints;
- (NSUUID)displaySessionUUID;
- (double)trailingButtonWidth;
- (id)assembleContactAvatarsForRecipient:(id)a3;
- (unint64_t)actionType;
- (void)actionButtonTapped;
- (void)applyActionButtonTouchInsets;
- (void)assignContactAvatarsToController:(id)a3;
- (void)assignImageDataToController:(id)a3;
- (void)assignImageToController:(id)a3;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)prepareForReuse;
- (void)setActionButton:(id)a3;
- (void)setActionType:(unint64_t)a3;
- (void)setActionType:(unint64_t)a3 animated:(BOOL)a4;
- (void)setActiveConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setShouldHighlightCompleteMatches:(BOOL)a3;
- (void)setupAvatarViewControllerWithSettings:(id)a3;
- (void)updateButtonColor;
- (void)updateLabelsContrainedToWidth:(double)a3;
@end

@implementation CNComposeRecipientTableViewCell

+ (id)identifier
{
  return @"CNRecipientTableViewCellIdentifier";
}

+ (double)additionalSeparatorInset
{
  char v3 = [a1 avatarsAreHidden];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CNComposeRecipientTableViewCell;
    objc_msgSendSuper2(&v5, sel_additionalSeparatorInset, 0.0);
  }
  return result;
}

- (CNComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTableViewCell;
  v4 = [(CNComposeTableViewCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    if (CNComposeApplicationPreferredContentSizeIsLargerThanLarge())
    {
      objc_super v5 = [(CNComposeTableViewCell *)v4 detailLabel];
      [v5 setNumberOfLines:0];

      v6 = [(CNComposeTableViewCell *)v4 detailLabel];
      LODWORD(v7) = 1.0;
      [v6 _setHyphenationFactor:v7];

      v8 = [(CNComposeTableViewCell *)v4 titleLabel];
      [v8 setNumberOfLines:0];

      v9 = [(CNComposeTableViewCell *)v4 titleLabel];
      LODWORD(v10) = 1.0;
      [v9 _setHyphenationFactor:v10];
    }
    v11 = objc_opt_new();
    v12 = +[CNComposeRecipientActionButton systemButtonWithImage:v11 target:v4 action:sel_actionButtonTapped];

    [(id)objc_opt_class() requireIntrinsicSizeForView:v12];
    [(CNComposeRecipientTableViewCell *)v4 setActionButton:v12];
    v13 = [(NUITableViewContainerCell *)v4 containerView];
    [v13 insertArrangedSubview:v12 atIndex:1];

    [(CNComposeRecipientTableViewCell *)v4 setShouldHighlightCompleteMatches:1];
    v14 = v4;
  }
  return v4;
}

+ (BOOL)avatarsAreHidden
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  char v3 = [v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4F43778]) == NSOrderedDescending;

  return v4;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTableViewCell;
  id v4 = a3;
  [(CNComposeTableViewCell *)&v6 containerViewDidLayoutArrangedSubviews:v4];
  id v5 = [(NUITableViewContainerCell *)self containerView];

  if (v5 == v4) {
    [(CNComposeRecipientTableViewCell *)self applyActionButtonTouchInsets];
  }
}

- (void)applyActionButtonTouchInsets
{
  char v3 = [(CNComposeRecipientTableViewCell *)self actionButton];

  if (v3)
  {
    id v4 = [(CNComposeRecipientTableViewCell *)self actionButton];
    [v4 _touchInsets];

    id v5 = [(CNComposeRecipientTableViewCell *)self actionButton];
    [v5 intrinsicContentSize];
    double v7 = v6;

    v8 = [(NUITableViewContainerCell *)self containerView];
    [v8 bounds];
    double v10 = v9;
    double v11 = v7 * -0.5;

    if ([(CNComposeRecipientTableViewCell *)self _shouldReverseLayoutDirection])
    {
      v12 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v12 frame];
      double MinX = CGRectGetMinX(v25);
    }
    else
    {
      v12 = [(NUITableViewContainerCell *)self containerView];
      [v12 bounds];
      double MaxX = CGRectGetMaxX(v26);
      v15 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v15 frame];
      double MinX = MaxX - CGRectGetMaxX(v27);
    }
    double v16 = v10 + v11;

    v17 = [(CNComposeRecipientTableViewCell *)self actionButton];
    v18 = v17;
    if (v17) {
      [v17 transform];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v24);

    double v20 = -v16;
    if (IsIdentity) {
      double v21 = -MinX;
    }
    else {
      double v21 = -v16;
    }
    if (IsIdentity) {
      double v22 = v20;
    }
    else {
      double v22 = -MinX;
    }
    v23 = [(CNComposeRecipientTableViewCell *)self actionButton];
    objc_msgSend(v23, "_setTouchInsets:", v22, v21, v22, v21);
  }
}

+ (id)_attributedStringForGroupMembersOfRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v34 = objc_opt_new();
  v32 = v10;
  v33 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v13 = [v10 sortedChildren];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v19 = [v18 compositeName];
        uint64_t v20 = [v19 length];

        if (v20)
        {
          double v21 = [v18 compositeName];
          double v22 = [a1 attributedStringWithBoldedRangesForMatchedStrings:v11 inString:v21 font:v12 boldAllMatches:1];
          [v34 addObject:v22];
        }
        v23 = [v18 shortName];
        uint64_t v24 = [v23 length];

        if (v24)
        {
          CGRect v25 = [v18 shortName];
          CGRect v26 = [a1 attributedStringWithBoldedRangesForMatchedStrings:v11 inString:v25 font:v12 boldAllMatches:1];
          [v33 addObject:v26];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);
  }

  CGRect v27 = [a1 _attributedStringForListOfGroupMemberNames:v34 numberTruncated:0];
  [v27 size];
  if (v28 <= a5)
  {
    id v30 = v27;
    v29 = v33;
  }
  else
  {
    v29 = v33;
    id v30 = [a1 _attributedStringForListOfGroupMemberNames:v33 numberTruncated:0];
  }

  return v30;
}

+ (id)_attributedStringForListOfGroupMemberNames:(id)a3 numberTruncated:(unint64_t)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = v5;
  double v7 = v5;
  if (a4)
  {
    v8 = objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - a4);

    unint64_t v9 = [v6 count];
    id v10 = NSString;
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = v11;
    if (v9 <= a4)
    {
      v13 = [v11 localizedStringForKey:@"N_MEMBERS" value:&stru_1F0EC0C28 table:@"Localized"];
      v17 = objc_msgSend(v10, "localizedStringWithFormat:", v13, a4);
    }
    else
    {
      v13 = [v11 localizedStringForKey:@"N_MORE" value:&stru_1F0EC0C28 table:@"Localized"];
      uint64_t v14 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
      uint64_t v16 = [v14 localizedStringFromNumber:v15 numberStyle:1];
      v17 = objc_msgSend(v10, "stringWithFormat:", v13, v16);
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17];
    double v7 = [v8 arrayByAddingObject:v18];
  }
  if ([v7 count] == 1)
  {
    v19 = [v7 firstObject];
  }
  else
  {
    uint64_t v20 = [v7 count];
    double v21 = objc_opt_new();
    if (v20 == 2)
    {
      double v22 = [v7 firstObject];
      [v21 appendAttributedString:v22];

      id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      CGRect v25 = [v24 localizedStringForKey:@"SHORT_BINARY_RECIPIENT_SEPARATOR" value:&stru_1F0EC0C28 table:@"Localized"];
      CGRect v26 = (void *)[v23 initWithString:v25];
      [v21 appendAttributedString:v26];

      CGRect v27 = [v7 lastObject];
      [v21 appendAttributedString:v27];

      v19 = (void *)[v21 copy];
    }
    else
    {
      v50 = v7;
      v51 = v6;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v28 = v7;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        unint64_t v31 = 0x1E4F28000uLL;
        unint64_t v32 = 0x1E4F28000uLL;
        id v52 = v28;
        uint64_t v53 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v55 != v53) {
              objc_enumerationMutation(v28);
            }
            v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            long long v35 = [v28 lastObject];

            if (v34 == v35)
            {
              id v36 = objc_alloc(*(Class *)(v31 + 2840));
              long long v37 = [*(id *)(v32 + 2896) bundleForClass:objc_opt_class()];
              [v37 localizedStringForKey:@"SHORT_BINARY_RECIPIENT_SEPARATOR" value:&stru_1F0EC0C28 table:@"Localized"];
              uint64_t v38 = v30;
              unint64_t v39 = v32;
              v41 = unint64_t v40 = v31;
              v42 = (void *)[v36 initWithString:v41];
              [v21 appendAttributedString:v42];

              unint64_t v31 = v40;
              unint64_t v32 = v39;
              uint64_t v30 = v38;
              id v28 = v52;
            }
            [v21 appendAttributedString:v34];
            v43 = objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v28, "count") - 2);

            if (v34 != v35 && v34 != v43)
            {
              id v45 = objc_alloc(*(Class *)(v31 + 2840));
              v46 = [*(id *)(v32 + 2896) bundleForClass:objc_opt_class()];
              v47 = [v46 localizedStringForKey:@"ADDRESS_SEPARATOR" value:&stru_1F0EC0C28 table:@"Localized"];
              v48 = (void *)[v45 initWithString:v47];
              [v21 appendAttributedString:v48];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v30);
      }

      v19 = (void *)[v21 copy];
      double v7 = v50;
      double v6 = v51;
    }
  }

  return v19;
}

+ (id)_attributedTitleForRecipient:(id)a3 matchedStrings:(id)a4 constrainedToWidth:(double)a5 font:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v10 compositeName];
  if (([v10 isGroup] & 1) == 0 && (!v13 || !objc_msgSend(v13, "length")))
  {
    uint64_t v14 = [v10 placeholderName];

    v13 = (void *)v14;
  }
  if (![v10 isGroup]) {
    goto LABEL_9;
  }
  uint64_t v15 = [v10 displayString];
  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = (void *)v15;
  v17 = [v10 displayString];
  uint64_t v18 = [v17 length];

  if (v18)
  {
LABEL_9:
    if ([v10 kind] == 6 || objc_msgSend(v10, "kind") == 7)
    {
      v19 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v20 = [v12 fontDescriptor];
      double v21 = [v20 fontDescriptorWithSymbolicTraits:2];
      double v22 = [v19 fontWithDescriptor:v21 size:0.0];

      id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
      uint64_t v28 = *MEMORY[0x1E4FB06F8];
      v29[0] = v22;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      CGRect v25 = (void *)[v23 initWithString:v13 attributes:v24];

      goto LABEL_14;
    }
    uint64_t v26 = [a1 attributedStringWithBoldedRangesForMatchedStrings:v11 inString:v13 font:v12 boldAllMatches:1];
  }
  else
  {
LABEL_11:
    uint64_t v26 = [a1 _attributedStringForGroupMembersOfRecipient:v10 matchedStrings:v11 constrainedToWidth:v12 font:a5];
  }
  CGRect v25 = (void *)v26;
LABEL_14:

  return v25;
}

- (void)updateLabelsContrainedToWidth:(double)a3
{
  id v5 = self;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v6 = [(CNComposeTableViewCell *)self recipient];
  double v7 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v8 = [v6 completelyMatchedAttributedStrings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v62 + 1) + 8 * i) string];
        [v7 addObject:v12];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v10);
  }

  v13 = objc_opt_class();
  uint64_t v14 = [(CNComposeTableViewCell *)v5 titleLabel];
  uint64_t v15 = [v14 font];
  uint64_t v16 = [v13 _attributedTitleForRecipient:v6 matchedStrings:v7 constrainedToWidth:v15 font:a3];
  v17 = [(CNComposeTableViewCell *)v5 titleLabel];
  [v17 setAttributedText:v16];

  uint64_t v18 = [(CNComposeTableViewCell *)v5 detailLabel];
  v19 = [v18 font];

  long long v56 = v19;
  long long v57 = v6;
  if ([v6 isGroup])
  {
    uint64_t v20 = [v6 children];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      double v22 = [v6 compositeName];

      if (v22)
      {
        id v23 = [(id)objc_opt_class() _attributedStringForGroupMembersOfRecipient:v6 matchedStrings:v7 constrainedToWidth:v19 font:a3];
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
      unint64_t v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v31 localizedStringForKey:@"GROUP_NO_MEMBERS_NAME" value:&stru_1F0EC0C28 table:@"Localized"];
      id v23 = (void *)[v30 initWithString:v15];
    }
  }
  else
  {
    if ([(CNComposeRecipientTableViewCell *)v5 shouldHighlightCompleteMatches])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v17 = [v6 completelyMatchedAttributedStrings];
      uint64_t v24 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v24)
      {
        uint64_t v15 = (void *)v24;
        long long v54 = v5;
        uint64_t v25 = *(void *)v59;
        while (2)
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v59 != v25) {
              objc_enumerationMutation(v17);
            }
            CGRect v27 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) attributesAtIndex:0 effectiveRange:0];
            uint64_t v28 = [v27 objectForKey:@"CNComposeRecipientStringMatchType"];
            int v29 = [v28 isEqualToString:@"CNComposeRecipientStringMatchAddress"];

            if (!v29)
            {
              uint64_t i = 0;
              goto LABEL_25;
            }
          }
          uint64_t v15 = (void *)[v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        uint64_t i = 1;
LABEL_25:
        v19 = v56;
        double v6 = v57;
        id v5 = v54;
      }
      else
      {
        uint64_t i = 1;
      }
    }
    else
    {
      uint64_t i = 0;
    }
    if ([v6 kind] == 6 || objc_msgSend(v6, "kind") == 7)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v33 localizedStringForKey:@"STEWIE_ADDRESS_DETAIL" value:&stru_1F0EC0C28 table:@"Localized-Stewie"];
      id v23 = (void *)[v32 initWithString:v15];
    }
    else
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v35 = [v6 address];
      v33 = (void *)v35;
      if (v35) {
        id v36 = (__CFString *)v35;
      }
      else {
        id v36 = @"…";
      }
      id v23 = (void *)[v34 initWithString:v36];
    }

    if (i)
    {
      long long v37 = [v6 originContext];
      uint64_t v38 = [v37 searchTerm];

      if (v38)
      {
        unint64_t v39 = objc_opt_class();
        unint64_t v40 = [v6 originContext];
        uint64_t v15 = [v40 searchTerm];
        v66 = v15;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
        uint64_t i = [v23 string];
        uint64_t v41 = [v39 attributedStringWithBoldedRangesForMatchedStrings:v17 inString:i font:v19 boldAllMatches:0];

        id v23 = (void *)v41;
      }
    }
  }
  v42 = [(CNComposeTableViewCell *)v5 detailLabel];
  long long v55 = v23;
  [v42 setAttributedText:v23];

  uint64_t v53 = [(CNComposeTableViewCell *)v5 detailLabel];
  v43 = [v53 text];
  uint64_t v44 = [v43 length];
  if (v44)
  {
    id v52 = [(CNComposeTableViewCell *)v5 titleLabel];
    id v45 = [v52 text];
    v50 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    v51 = v45;
    v46 = objc_msgSend(v45, "stringByTrimmingCharactersInSet:");
    v17 = [(CNComposeTableViewCell *)v5 detailLabel];
    uint64_t i = [v17 text];
    v19 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    uint64_t v15 = [(id)i stringByTrimmingCharactersInSet:v19];
    v49 = v46;
    uint64_t v47 = [v46 isEqualToString:v15];
  }
  else
  {
    uint64_t v47 = 1;
  }
  v48 = [(CNComposeTableViewCell *)v5 detailLabel];
  [v48 setHidden:v47];

  if (v44)
  {
  }
}

+ (id)attributedStringWithBoldedRangesForMatchedStrings:(id)a3 inString:(id)a4 font:(id)a5 boldAllMatches:(BOOL)a6
{
  BOOL v6 = a6;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x1E4FB08E0];
  v13 = [v11 fontDescriptor];
  uint64_t v14 = [v11 fontDescriptor];
  uint64_t v15 = objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") & 0xFFFFFFFDLL);
  uint64_t v16 = [v12 fontWithDescriptor:v15 size:0.0];

  id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v18 = *MEMORY[0x1E4FB06F8];
  uint64_t v41 = *MEMORY[0x1E4FB06F8];
  v42[0] = v16;
  unint64_t v31 = (void *)v16;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  uint64_t v20 = (void *)[v17 initWithString:v10 attributes:v19];

  uint64_t v21 = (void *)MEMORY[0x1E4FB08E0];
  id v32 = v11;
  double v22 = [v11 fontDescriptor];
  id v23 = [v22 fontDescriptorWithSymbolicTraits:2];
  uint64_t v24 = [v21 fontWithDescriptor:v23 size:0.0];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v9;
  uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v27 = [v10 rangeOfString:v26];
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (uint64_t j = v27;
                j != 0x7FFFFFFFFFFFFFFFLL;
                uint64_t j = objc_msgSend(v10, "rangeOfString:options:range:", v26, 0, j + 1, objc_msgSend(v10, "length") + ~j))
          {
            objc_msgSend(v20, "addAttribute:value:range:", v18, v24, j, v28);
            if (!v6) {
              break;
            }
          }
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v35);
  }

  return v20;
}

- (void)setRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 autocompleteResult];
  BOOL v6 = [v5 identifier];
  double v7 = [(CNComposeTableViewCell *)self recipient];
  v8 = [v7 autocompleteResult];
  id v9 = [v8 identifier];
  int v10 = [v6 isEqualToString:v9];

  id v11 = [(CNComposeTableViewCell *)self recipient];

  if (v4 && v11 != v4)
  {
    v36.receiver = self;
    v36.super_class = (Class)CNComposeRecipientTableViewCell;
    [(CNComposeTableViewCell *)&v36 setRecipient:v4];
    uint64_t v30 = 0;
    unint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    uint64_t v34 = __Block_byref_object_dispose__3;
    id v35 = [MEMORY[0x1E4F29128] UUID];
    [(CNComposeRecipientTableViewCell *)self setDisplaySessionUUID:v31[5]];
    objc_initWeak(&location, self);
    id v12 = [(CNComposeRecipientTableViewCell *)self delegate];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __48__CNComposeRecipientTableViewCell_setRecipient___block_invoke;
    v27[3] = &unk_1E6128C78;
    objc_copyWeak(&v28, &location);
    v27[4] = &v30;
    char v13 = [v12 willProvideOverrideImageDataForCell:self completionBlock:v27];

    if (v13)
    {
LABEL_13:
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v30, 8);

      goto LABEL_26;
    }
    if ([v4 isGroup])
    {
      uint64_t v14 = objc_alloc_init(CNAUIMessagesImagesFacade);
      uint64_t v15 = [v4 autocompleteResult];
      uint64_t v16 = [(CNAUIMessagesImagesFacade *)v14 imageForResult:v15];

      if (v16)
      {
LABEL_11:
        [(CNComposeRecipientTableViewCell *)self assignImageToController:v16];

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      if ([v4 kind] != 6)
      {
        if ([v4 kind] == 7)
        {
          uint64_t v14 = +[CNAutocompleteAvatarUtilities roadsideImage];
          if (v14)
          {
            [(CNComposeRecipientTableViewCell *)self assignImageToController:v14];
            goto LABEL_12;
          }
        }
        goto LABEL_18;
      }
      id v17 = [(CNComposeRecipientTableViewCell *)self traitCollection];
      uint64_t v18 = [v17 userInterfaceStyle];
      v19 = @"SOS_50_light";
      if (v18 == 2) {
        v19 = @"SOS_50_dark";
      }
      uint64_t v14 = v19;

      uint64_t v20 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v16 = [v20 imageNamed:v14 inBundle:v21 compatibleWithTraitCollection:0];

      if (v16) {
        goto LABEL_11;
      }
    }

LABEL_18:
    double v22 = [(CNComposeRecipientTableViewCell *)self assembleContactAvatarsForRecipient:v4];
    [(CNComposeRecipientTableViewCell *)self assignContactAvatarsToController:v22];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v30, 8);
  }
  if (v11 == v4
    || ((v10 ^ 1) & 1) != 0
    || ([v4 address], id v23 = objc_claimAutoreleasedReturnValue(), v23, !v23))
  {
    uint64_t v24 = [v4 address];
    if (v24) {
      BOOL v25 = !CNComposeApplicationPreferredContentSizeIsLargerThanLarge();
    }
    else {
      BOOL v25 = 1;
    }
    uint64_t v26 = [(CNComposeTableViewCell *)self detailLabel];
    [v26 setNumberOfLines:v25];
  }
LABEL_26:
}

void __48__CNComposeRecipientTableViewCell_setRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained displaySessionUUID];
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  if (v4 == v5)
  {
    if (v8)
    {
      [WeakRetained assignImageDataToController:v8];
    }
    else
    {
      BOOL v6 = [WeakRetained recipient];
      double v7 = [WeakRetained assembleContactAvatarsForRecipient:v6];
      [WeakRetained assignContactAvatarsToController:v7];
    }
  }
}

- (void)assignImageToController:(id)a3
{
  UIImagePNGRepresentation((UIImage *)a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CNComposeRecipientTableViewCell *)self assignImageDataToController:v4];
}

- (void)assignImageDataToController:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setImageData:v5];

  v8[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(CNComposeRecipientTableViewCell *)self assignContactAvatarsToController:v7];
}

- (void)assignContactAvatarsToController:(id)a3
{
  id v4 = a3;
  id v5 = [(CNComposeRecipientTableViewCell *)self avatarViewController];
  [v5 setContacts:v4];

  id v6 = [(CNComposeTableViewCell *)self titleLabel];
  [v6 frame];
  [(CNComposeRecipientTableViewCell *)self updateLabelsContrainedToWidth:CGRectGetWidth(v8)];
}

- (id)assembleContactAvatarsForRecipient:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v34 = (id)objc_opt_new();
  if (v3)
  {
    id v30 = v3;
    if ([v3 isGroup])
    {
      id v4 = [v3 sortedChildren];
      id v5 = objc_msgSend(v4, "_cn_take:", objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
    }
    else
    {
      v48[0] = v3;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v5;
    uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v42;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
          CGRect v8 = objc_opt_new();
          id v9 = objc_opt_new();
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          int v10 = [v7 children];
          id v35 = v7;
          uint64_t v36 = v6;
          if ([v10 count])
          {
            [v7 children];
          }
          else
          {
            id v45 = v7;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
          id v11 = };

          uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v38 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                id v17 = [v16 address];
                uint64_t v18 = [v16 kind];
                v19 = (void *)MEMORY[0x1E4F1BA20];
                if (v18)
                {
                  uint64_t v20 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v17];
                  uint64_t v21 = [v19 labeledValueWithLabel:0 value:v20];
                  [v9 addObject:v21];
                }
                else
                {
                  uint64_t v20 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v17];
                  [v8 addObject:v20];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v13);
          }

          double v22 = objc_opt_new();
          id v23 = [v35 nameComponents];
          uint64_t v24 = v23;
          if (v23)
          {
            id v25 = v23;
          }
          else
          {
            uint64_t v26 = (void *)MEMORY[0x1E4F5A470];
            uint64_t v27 = [v35 compositeName];
            id v25 = [v26 componentsFromString:v27];
          }
          [v25 overrideComponentsInContact:v22];
          [v22 setEmailAddresses:v8];
          [v22 setPhoneNumbers:v9];
          [v34 addObject:v22];
          if (![v34 count])
          {
            id v28 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
            [v34 addObject:v28];
          }
          uint64_t v6 = v36 + 1;
        }
        while (v36 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v33);
    }

    id v3 = v30;
  }

  return v34;
}

- (void)setActionType:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_actionType = a3;
  double v7 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  CGRect v8 = [(CNComposeRecipientTableViewCell *)self actionButton];
  uint64_t v9 = 1;
  [v8 setUserInteractionEnabled:1];

  int v10 = 0;
  id v11 = @"chevron.forward.circle";
  switch(a3)
  {
    case 1uLL:

      double v7 = 0;
      int v10 = 0;
      id v11 = @"info.circle";
      goto LABEL_5;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      int v10 = 1;
      goto LABEL_5;
    case 4uLL:
      uint64_t v12 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v12 setUserInteractionEnabled:0];

      uint64_t v13 = [(CNComposeRecipientTableViewCell *)self actionButton];
      uint64_t v14 = (void *)MEMORY[0x1E4F42A98];
      uint64_t v15 = [(CNComposeTableViewCell *)self titleLabel];
      uint64_t v16 = [v15 font];
      [v16 pointSize];
      id v17 = objc_msgSend(v14, "configurationWithPointSize:weight:scale:", 6, 1);
      [v13 setPreferredSymbolConfiguration:v17 forImageInState:0];

      int v10 = 0;
      id v11 = @"chevron.forward";
LABEL_5:
      uint64_t v18 = [MEMORY[0x1E4F42A80] systemImageNamed:v11];
      v19 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v19 setImage:v18 forState:0];

      uint64_t v20 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v20 setButtonColor:v7];

      [(CNComposeRecipientTableViewCell *)self updateButtonColor];
      uint64_t v21 = [(CNComposeRecipientTableViewCell *)self effectiveUserInterfaceLayoutDirection];
      memset(&v29, 0, sizeof(v29));
      if (v10)
      {
        CGAffineTransformMakeRotation(&v29, dbl_1B5B40CF0[v21 == 0]);
        if (!v4)
        {
LABEL_7:
          CGAffineTransform v26 = v29;
          double v22 = [(CNComposeRecipientTableViewCell *)self actionButton];
          CGAffineTransform v25 = v26;
          [v22 setTransform:&v25];

          goto LABEL_10;
        }
      }
      else
      {
        long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v29.c = v23;
        *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        if (!v4) {
          goto LABEL_7;
        }
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      CGAffineTransform v28 = v29;
      v27[2] = __58__CNComposeRecipientTableViewCell_setActionType_animated___block_invoke;
      v27[3] = &unk_1E6128CA0;
      v27[4] = self;
      [MEMORY[0x1E4F42FF0] _animateUsingDefaultTimingWithOptions:2 animations:v27 completion:0];
LABEL_10:

      uint64_t v9 = 0;
LABEL_11:
      uint64_t v24 = [(CNComposeRecipientTableViewCell *)self actionButton];
      [v24 setHidden:v9];

      [(CNComposeTableViewCell *)self layoutMarginsDidChange];
      return;
    default:
      goto LABEL_11;
  }
}

void __58__CNComposeRecipientTableViewCell_setActionType_animated___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "actionButton", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

- (void)updateButtonColor
{
  id v5 = [(CNComposeRecipientTableViewCell *)self actionButton];
  id v3 = [v5 buttonColor];
  BOOL v4 = [(CNComposeRecipientTableViewCell *)self actionButton];
  [v4 setTintColor:v3];
}

- (void)setupAvatarViewControllerWithSettings:(id)a3
{
  if (!self->_avatarViewController)
  {
    BOOL v4 = (objc_class *)MEMORY[0x1E4F1BB40];
    id v5 = a3;
    uint64_t v6 = (CNAvatarViewController *)[[v4 alloc] initWithSettings:v5];

    avatarViewController = self->_avatarViewController;
    self->_avatarViewController = v6;

    CGRect v8 = objc_opt_class();
    uint64_t v9 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v8 requireIntrinsicSizeForView:v9];

    int v10 = [(NUITableViewContainerCell *)self containerView];
    id v11 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v10 insertArrangedSubview:v11 atIndex:0];

    uint64_t v12 = [(id)objc_opt_class() avatarsAreHidden];
    id v13 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v13 setHidden:v12];
  }
}

- (double)trailingButtonWidth
{
  id v3 = [(CNComposeRecipientTableViewCell *)self actionButton];
  double v4 = 0.0;
  if (([v3 isHidden] & 1) == 0)
  {
    id v5 = [(CNComposeRecipientTableViewCell *)self actionButton];
    [v5 intrinsicContentSize];
    double v4 = v6;
  }
  return v4;
}

- (void)actionButtonTapped
{
  unint64_t v3 = [(CNComposeRecipientTableViewCell *)self actionType];
  double v4 = [(CNComposeRecipientTableViewCell *)self delegate];
  id v5 = v4;
  if (v3 == 1) {
    [v4 didTapInfoButtonForCell:self];
  }
  else {
    [v4 didTapDisambiguationChevronForCell:self];
  }
}

- (void)prepareForReuse
{
  [(CNComposeRecipientTableViewCell *)self setAccessoryView:0];
  [(CNComposeRecipientTableViewCell *)self setAccessoryType:0];
  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCell;
  [(CNComposeRecipientTableViewCell *)&v3 prepareForReuse];
}

- (BOOL)supportsAvatarView
{
  return 1;
}

- (BOOL)canExpandRecipient
{
  return [(CNComposeRecipientTableViewCell *)self actionType] == 2;
}

- (BOOL)canCollapseRecipient
{
  return [(CNComposeRecipientTableViewCell *)self actionType] == 3;
}

- (CNComposeRecipientTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNComposeRecipientTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (CNComposeRecipientActionButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end