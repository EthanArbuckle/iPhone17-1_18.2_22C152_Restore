@interface MFRecipientTableViewCell
+ (double)_constrainedWidthForDetailViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4;
+ (double)_constrainedWidthForTitleViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4;
+ (double)_deviceSpecificLayoutMargin;
+ (double)_realDetailButtonAccessoryMargin;
+ (double)detailLineHeight;
+ (double)height;
+ (double)heightWithRecipient:(id)a3 width:(double)a4;
+ (id)_attributedStringRepresentationOfCompleteMatchesForRecipient:(id)a3 constrainedToWidth:(double)a4 overflowRecipients:(id *)a5 useHighlighting:(BOOL)a6;
+ (id)_attributedStringRepresentationOfPartialEmailMatchForSingleRecipient:(id)a3 useHighlighting:(BOOL)a4;
+ (id)_copyAttributedStringRepresentationOfGroupRecipient:(id)a3 withSortedRecipientList:(id)a4;
+ (id)_defaultTintColor;
+ (id)_tintedAttributedString:(id)a3 toColor:(id)a4 shouldDim:(BOOL)a5;
+ (id)cellForRecipient:(id)a3;
+ (id)defaultDetailStringAttributes;
+ (id)defaultTitleStringAttributes;
+ (id)groupDetailStringAttributes;
+ (id)highlightedDetailStringAttributes;
+ (id)highlightedTitleStringAttributes;
+ (id)identifier;
+ (id)labelDetailStringAttributes;
+ (id)regularTitleStringAttributes;
- (BOOL)shouldDimIrrelevantInformation;
- (BOOL)shouldHighlightCompleteMatches;
- (MFRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)activeConstraints;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (id)recipient;
- (id)tintColor;
- (void)animateSnapshotOfLabel:(id)a3 withBlock:(id)a4;
- (void)setActiveConstraints:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setRecipient:(id)a3;
- (void)setShouldDimIrrelevantInformation:(BOOL)a3;
- (void)setShouldHighlightCompleteMatches:(BOOL)a3;
- (void)setTintColor:(id)a3 animated:(BOOL)a4;
- (void)updateActiveConstraints;
@end

@implementation MFRecipientTableViewCell

+ (id)identifier
{
  return @"MFRecipientTableViewCellIdentifier";
}

+ (id)cellForRecipient:(id)a3
{
  id v3 = a3;
  v4 = [MFRecipientTableViewCell alloc];
  v5 = +[MFRecipientTableViewCell identifier];
  v6 = [(MFRecipientTableViewCell *)v4 initWithStyle:0 reuseIdentifier:v5];

  if (v6) {
    [(MFRecipientTableViewCell *)v6 setRecipient:v3];
  }

  return v6;
}

- (MFRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MFRecipientTableViewCell;
  v4 = [(MFRecipientTableViewCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    int v5 = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad");
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    uint64_t v7 = v5 ^ 1u;
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v6;

    [(UILabel *)v4->_detailLabel setOpaque:v7];
    LODWORD(v9) = 1148846080;
    [(UILabel *)v4->_detailLabel setContentHuggingPriority:1 forAxis:v9];
    LODWORD(v10) = 1112014848;
    [(UILabel *)v4->_detailLabel setContentHuggingPriority:0 forAxis:v10];
    v11 = [(MFRecipientTableViewCell *)v4 contentView];
    [v11 addSubview:v4->_detailLabel];

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    [(UILabel *)v4->_titleLabel setOpaque:v7];
    LODWORD(v14) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:1 forAxis:v14];
    LODWORD(v15) = 1112014848;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:0 forAxis:v15];
    v16 = [(MFRecipientTableViewCell *)v4 contentView];
    [v16 addSubview:v4->_titleLabel];

    if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge())
    {
      [(UILabel *)v4->_detailLabel setNumberOfLines:0];
      LODWORD(v17) = 1.0;
      [(UILabel *)v4->_detailLabel _setHyphenationFactor:v17];
      [(UILabel *)v4->_titleLabel setNumberOfLines:0];
      LODWORD(v18) = 1.0;
      [(UILabel *)v4->_titleLabel _setHyphenationFactor:v18];
    }
    [(MFRecipientTableViewCell *)v4 setOpaque:v7];
    [(MFRecipientTableViewCell *)v4 setShouldHighlightCompleteMatches:1];
    [(MFRecipientTableViewCell *)v4 setShouldDimIrrelevantInformation:1];
    v4->_shouldHideDetailLabel = 0;
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (void)updateActiveConstraints
{
  id v3 = [(MFRecipientTableViewCell *)self activeConstraints];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC8];
    id v69 = [(MFRecipientTableViewCell *)self activeConstraints];
    objc_msgSend(v4, "deactivateConstraints:");
  }
  if ([(MFRecipientTableViewCell *)self accessoryType] == 4)
  {
    [(id)objc_opt_class() _realDetailButtonAccessoryMargin];
    double v6 = v5 + 0.0;
  }
  else if ([(MFRecipientTableViewCell *)self accessoryType] == 1)
  {
    double v6 = 16.0;
  }
  else
  {
    double v6 = 0.0;
  }
  uint64_t v7 = *MEMORY[0x1E4FB2950];
  id v70 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v70 _bodyLeading];
  double v9 = v8;
  double v10 = [(MFRecipientTableViewCell *)self titleLabel];
  v11 = [v10 font];
  [v11 ascender];
  double v13 = v12;
  double v14 = [(MFRecipientTableViewCell *)self titleLabel];
  double v15 = [v14 font];
  [v15 capHeight];
  double v17 = v16;

  double v18 = objc_opt_class();
  [(MFRecipientTableViewCell *)self bounds];
  [v18 _constrainedWidthForTitleViewWithAccessoryWidth:v6 containerWidth:v19];
  double v21 = v20;
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22 = [(MFRecipientTableViewCell *)self titleLabel];
  v23 = [v22 topAnchor];
  v24 = [(MFRecipientTableViewCell *)self contentView];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:round(-(v13 - v17 - v9 * 0.6))];
  [v71 addObject:v26];

  v27 = [(MFRecipientTableViewCell *)self titleLabel];
  v28 = [v27 leadingAnchor];
  v29 = [(MFRecipientTableViewCell *)self contentView];
  v30 = [v29 leadingAnchor];
  [(MFRecipientTableViewCell *)self separatorInset];
  v32 = [v28 constraintEqualToAnchor:v30 constant:v31];
  [v71 addObject:v32];

  v33 = [(MFRecipientTableViewCell *)self titleLabel];
  v34 = [v33 widthAnchor];
  v35 = [v34 constraintEqualToConstant:v21];
  [v71 addObject:v35];

  v36 = objc_opt_class();
  [(MFRecipientTableViewCell *)self bounds];
  [v36 _constrainedWidthForDetailViewWithAccessoryWidth:v6 containerWidth:v37];
  double v39 = v38;
  v40 = [(MFRecipientTableViewCell *)self detailLabel];
  v41 = [v40 font];
  [v41 descender];
  double v43 = v42;
  v44 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  [v44 _bodyLeading];
  double v46 = v45;

  v47 = [(MFRecipientTableViewCell *)self detailLabel];
  LODWORD(v40) = [v47 isHidden];
  double v48 = round(v43 + v46 * 0.6);

  if (v40)
  {
    v49 = [(MFRecipientTableViewCell *)self titleLabel];
    v50 = [v49 bottomAnchor];
    v51 = [(MFRecipientTableViewCell *)self contentView];
    v52 = [v51 bottomAnchor];
    v53 = [v50 constraintEqualToAnchor:v52 constant:-v48];
    [v71 addObject:v53];
  }
  else
  {
    v54 = [(MFRecipientTableViewCell *)self detailLabel];
    v55 = [v54 topAnchor];
    v56 = [(MFRecipientTableViewCell *)self titleLabel];
    v57 = [v56 bottomAnchor];
    v58 = [v55 constraintEqualToAnchor:v57 constant:0.0];
    [v71 addObject:v58];

    v59 = [(MFRecipientTableViewCell *)self detailLabel];
    v60 = [v59 leadingAnchor];
    v61 = [(MFRecipientTableViewCell *)self titleLabel];
    v62 = [v61 leadingAnchor];
    v63 = [v60 constraintEqualToAnchor:v62];
    [v71 addObject:v63];

    v64 = [(MFRecipientTableViewCell *)self detailLabel];
    v65 = [v64 bottomAnchor];
    v66 = [(MFRecipientTableViewCell *)self contentView];
    v67 = [v66 bottomAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:-v48];
    [v71 addObject:v68];

    v49 = [(MFRecipientTableViewCell *)self detailLabel];
    v50 = [v49 widthAnchor];
    v51 = [v50 constraintEqualToConstant:v39];
    [v71 addObject:v51];
  }

  [(MFRecipientTableViewCell *)self setActiveConstraints:v71];
  [MEMORY[0x1E4F28DC8] activateConstraints:v71];
}

+ (double)_deviceSpecificLayoutMargin
{
  if (_deviceSpecificLayoutMargin_onceToken != -1) {
    dispatch_once(&_deviceSpecificLayoutMargin_onceToken, &__block_literal_global_31);
  }
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v3 = v2;
  if (_deviceSpecificLayoutMargin_wantsWideContentMargins)
  {
    [v2 bounds];
    if (CGRectGetWidth(v6) <= 320.0) {
      double v4 = 16.0;
    }
    else {
      double v4 = 20.0;
    }
  }
  else
  {
    double v4 = 15.0;
  }

  return v4;
}

void __55__MFRecipientTableViewCell__deviceSpecificLayoutMargin__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  uint64_t v1 = MGCopyAnswer();
  CFBooleanRef v2 = (const __CFBoolean *)v1;
  if (!v0)
  {
    _deviceSpecificLayoutMargin_wantsWideContentMargins = 0;
    if (!v1) {
      return;
    }
    goto LABEL_6;
  }
  int Value = CFBooleanGetValue(v0);
  BOOL v4 = 0;
  if (Value && v2) {
    BOOL v4 = CFBooleanGetValue(v2) != 0;
  }
  _deviceSpecificLayoutMargin_wantsWideContentMargins = v4;
  CFRelease(v0);
  if (v2)
  {
LABEL_6:
    CFRelease(v2);
  }
}

+ (double)_constrainedWidthForTitleViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4
{
  [a1 _deviceSpecificLayoutMargin];
  return a4 + v6 * -2.0 - a3;
}

+ (double)_constrainedWidthForDetailViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4
{
  [a1 _deviceSpecificLayoutMargin];
  return a4 + v6 * -2.0 - a3;
}

+ (double)_realDetailButtonAccessoryMargin
{
  if (_realDetailButtonAccessoryMargin_onceToken != -1) {
    dispatch_once(&_realDetailButtonAccessoryMargin_onceToken, &__block_literal_global_36);
  }
  return *(double *)&_realDetailButtonAccessoryMargin_realAccessoryMargin + 4.0;
}

void __60__MFRecipientTableViewCell__realDetailButtonAccessoryMargin__block_invoke()
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  [v3 setAccessoryType:4];
  [v3 layoutSubviews];
  CFBooleanRef v0 = [v3 _defaultAccessoryView];
  if ([v3 _shouldReverseLayoutDirection])
  {
    [v0 frame];
    double MaxX = CGRectGetMaxX(v5);
  }
  else
  {
    [v3 frame];
    double Width = CGRectGetWidth(v6);
    [v0 frame];
    double MaxX = Width - CGRectGetMinX(v7);
  }
  _realDetailButtonAccessoryMargin_realAccessoryMargin = *(void *)&MaxX;
}

+ (id)_attributedStringRepresentationOfCompleteMatchesForRecipient:(id)a3 constrainedToWidth:(double)a4 overflowRecipients:(id *)a5 useHighlighting:(BOOL)a6
{
  BOOL v79 = a6;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  v80 = [v81 displayString];
  if (([v81 isGroup] & 1) == 0 && (!v80 || !objc_msgSend(v80, "length")))
  {
    uint64_t v7 = [v81 placeholderName];

    v80 = (void *)v7;
  }
  if ([v81 isGroup] && (objc_msgSend(v81, "wasCompleteMatch") & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"RECENT_GROUP" value:&stru_1F0817A00 table:@"Main"];

    v80 = (void *)v9;
  }
  if (v79) {
    [(id)objc_opt_class() defaultTitleStringAttributes];
  }
  else {
  v77 = [(id)objc_opt_class() highlightedTitleStringAttributes];
  }
  if (v80) {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v80 attributes:v77];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  v11 = v10;
  if ([v81 isGroup] && objc_msgSend(v81, "wasCompleteMatch"))
  {
    double v12 = [v81 childrenWithCompleteMatches];
    v78 = v12;
    double v13 = [v81 children];
    if ([v13 count] == 2)
    {
      double v14 = [v81 children];
      uint64_t v15 = [v14 count];
      BOOL v75 = v15 - [v12 count] == 1;
    }
    else
    {
      BOOL v75 = 0;
    }

    int v16 = (unint64_t)[v12 count] > 1 || v75;
    v84 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    double v17 = MFLocalizedAddressSeparator();
    double v18 = [(id)objc_opt_class() highlightedTitleStringAttributes];
    [v17 sizeWithAttributes:v18];
    double v20 = v19;

    double v21 = 0;
    unint64_t v22 = 0;
    double v23 = 0.0;
    while (v22 < [v12 count])
    {
      v24 = [v12 objectAtIndex:v22];
      v25 = _displayNameForRecipient(v24, v16);
      v26 = [(id)objc_opt_class() highlightedTitleStringAttributes];
      [v25 sizeWithAttributes:v26];
      double v28 = v27;

      double v23 = v23 + v20 + v28;
      if (a4 <= 0.0 || v23 <= a4)
      {
        [v84 addObject:v25];
      }
      else
      {
        v29 = v21;
        if (!v21)
        {
          v29 = [MEMORY[0x1E4F1CA48] array];
        }
        double v21 = v29;
        [v29 addObject:v24];
      }

      ++v22;
    }
    if ([v21 count]) {
      *a5 = v21;
    }
    if ([v84 count])
    {
      if ([v84 count] != 2
        || (uint64_t v30 = [v84 count],
            [v81 children],
            double v31 = objc_claimAutoreleasedReturnValue(),
            uint64_t v32 = [v31 count],
            v31,
            v30 != v32))
      {
        obuint64_t j = [MEMORY[0x1E4F28E78] string];
        for (unint64_t i = 0; [v84 count] > i; ++i)
        {
          double v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          if (i) {
            [v39 localizedStringForKey:@"GROUP_NON_FINAL_ITEM" value:&stru_1F0817A00 table:@"Main"];
          }
          else {
          v40 = [v39 localizedStringForKey:@"GROUP_INITIAL_ITEM" value:&stru_1F0817A00 table:@"Main"];
          }

          v41 = [v84 objectAtIndexedSubscript:i];
          objc_msgSend(obj, "appendFormat:", v40, v41);
        }
        unint64_t v42 = [v84 count];
        double v43 = [v81 children];
        unint64_t v44 = [v43 count];

        if (v42 < v44)
        {
          MFLocalizedAddressSeparator();
          double v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_48;
        }
LABEL_47:
        double v45 = &stru_1F0817A00;
LABEL_48:
        if (v75)
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          double v46 = [v81 children];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v90 objects:v96 count:16];
          if (v47)
          {
            id v48 = 0;
            uint64_t v49 = *(void *)v91;
LABEL_51:
            uint64_t v50 = 0;
            v51 = v48;
            while (1)
            {
              if (*(void *)v91 != v49) {
                objc_enumerationMutation(v46);
              }
              id v48 = *(id *)(*((void *)&v90 + 1) + 8 * v50);

              if (([v78 containsObject:v48] & 1) == 0) {
                break;
              }
              ++v50;
              v51 = v48;
              if (v47 == v50)
              {
                uint64_t v47 = [v46 countByEnumeratingWithState:&v90 objects:v96 count:16];
                if (v47) {
                  goto LABEL_51;
                }
                break;
              }
            }

            if (!v48) {
              goto LABEL_66;
            }
            v52 = _displayNameForRecipient(v48, 1);
            [v52 sizeWithAttributes:v77];
            if (v23 + v53 >= a4)
            {
              if (v21)
              {
                [v21 addObject:v48];
              }
              else
              {
                id v95 = v48;
                *a5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
              }
            }
            else
            {
              v54 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v55 = [v54 localizedStringForKey:@"SHORT_BINARY_RECIPIENT_SEPARATOR" value:&stru_1F0817A00 table:@"Main"];

              uint64_t v56 = objc_msgSend(NSString, "stringWithFormat:", v55, obj, v52);

              double v45 = &stru_1F0817A00;
              obuint64_t j = (id)v56;
            }
          }
          else
          {
            id v48 = v46;
          }
        }
LABEL_66:
        v57 = [obj stringByAppendingString:v45];
        v58 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v57 attributes:v77];
        [v11 setAttributedString:v58];

        goto LABEL_67;
      }
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"SHORT_BINARY_RECIPIENT_SEPARATOR" value:&stru_1F0817A00 table:@"Main"];

      v35 = NSString;
      v36 = [v84 objectAtIndexedSubscript:0];
      double v37 = [v84 objectAtIndexedSubscript:1];
      objc_msgSend(v35, "stringWithFormat:", v34, v36, v37);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      obuint64_t j = [v34 localizedStringForKey:@"RECENT_GROUP" value:&stru_1F0817A00 table:@"Main"];
    }

    goto LABEL_47;
  }
LABEL_67:
  if (v79)
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obja = [v81 completelyMatchedAttributedStrings];
    uint64_t v59 = [obja countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v59)
    {
      uint64_t v85 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v87 != v85) {
            objc_enumerationMutation(obja);
          }
          v61 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v62 = [v11 string];
          v63 = [v61 string];
          uint64_t v64 = [v62 rangeOfString:v63];
          uint64_t v66 = v65;

          while (v64 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v67 = [(id)objc_opt_class() highlightedTitleStringAttributes];
            objc_msgSend(v11, "addAttributes:range:", v67, v64, v66);

            v68 = [v11 string];
            uint64_t v69 = [v68 length];

            id v70 = [v11 string];
            id v71 = [v61 string];
            uint64_t v64 = objc_msgSend(v70, "rangeOfString:options:range:", v71, 0, v64 + 1, v69 + ~v64);
            uint64_t v66 = v72;
          }
        }
        uint64_t v59 = [obja countByEnumeratingWithState:&v86 objects:v94 count:16];
      }
      while (v59);
    }
    v73 = obja;
  }
  else
  {
    v73 = [(id)objc_opt_class() regularTitleStringAttributes];
    objc_msgSend(v11, "setAttributes:range:", v73, 0, objc_msgSend(v11, "length"));
  }

  return v11;
}

+ (id)_copyAttributedStringRepresentationOfGroupRecipient:(id)a3 withSortedRecipientList:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v35 = v5;
  v36 = v6;
  if ([v6 count])
  {
    if ([v6 count] == 1)
    {
      uint64_t v7 = [v5 children];
      [v7 count];
    }
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 children];
  }
  id v9 = v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = _displayNameForRecipient(*(void **)(*((void *)&v37 + 1) + 8 * i), 1);
        [v10 addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }

  if ((unint64_t)[v10 count] >= 8)
  {
    uint64_t v16 = [v10 count] - 7;
    objc_msgSend(v10, "removeObjectsInRange:", 7, v16);
    double v17 = [NSNumber numberWithUnsignedInteger:v16];
    double v18 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v17 numberStyle:0];
    double v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v20 = [v19 localizedStringForKey:@"N_MORE" value:&stru_1F0817A00 table:@"Main"];

    double v21 = objc_msgSend(NSString, "stringWithFormat:", v20, v18);
    [v10 addObject:v21];
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if ([v10 count] == 1)
  {
    double v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"GROUP_FINAL_ITEM" value:&stru_1F0817A00 table:@"Main"];

    v25 = [v22 mutableString];
    v26 = [v10 objectAtIndex:0];
    objc_msgSend(v25, "appendFormat:", v24, v26);
  }
  else
  {
    for (unint64_t j = 0; [v10 count] > j; ++j)
    {
      if (j)
      {
        if ([v10 count] - 1 <= j)
        {
          uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          [v30 localizedStringForKey:@"GROUP_FINAL_ITEM" value:&stru_1F0817A00 table:@"Main"];
        }
        else
        {
          uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          [v30 localizedStringForKey:@"GROUP_NON_FINAL_ITEM" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v31 = };
      }
      else
      {
        uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v31 = [v30 localizedStringForKey:@"GROUP_INITIAL_ITEM" value:&stru_1F0817A00 table:@"Main"];
      }
      uint64_t v32 = (void *)v31;

      v33 = [v22 mutableString];
      v34 = [v10 objectAtIndexedSubscript:j];
      objc_msgSend(v33, "appendFormat:", v32, v34);
    }
  }
  double v27 = [(id)objc_opt_class() groupDetailStringAttributes];
  objc_msgSend(v22, "setAttributes:range:", v27, 0, objc_msgSend(v22, "length"));

  return v22;
}

+ (id)_attributedStringRepresentationOfPartialEmailMatchForSingleRecipient:(id)a3 useHighlighting:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isGroup])
  {
    id v6 = 0;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v8 = [v5 address];
    id v9 = [(id)objc_opt_class() defaultDetailStringAttributes];
    id v6 = (void *)[v7 initWithString:v8 attributes:v9];

    if (v4)
    {
      id v10 = [v5 originContext];
      id v11 = [v10 searchTerm];

      if ([v11 length])
      {
        uint64_t v12 = [v6 string];
        uint64_t v13 = [v12 rangeOfString:v11];
        uint64_t v15 = v14;

        if (!v13)
        {
          uint64_t v16 = [(id)objc_opt_class() highlightedDetailStringAttributes];
          objc_msgSend(v6, "setAttributes:range:", v16, 0, v15);
        }
      }
    }
  }

  return v6;
}

+ (id)_tintedAttributedString:(id)a3 toColor:(id)a4 shouldDim:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[v7 mutableCopy];
  id v10 = v9;
  if (v5)
  {
    id v11 = v8;
    ColorSpace = CGColorGetColorSpace((CGColorRef)[v11 CGColor]);
    if (CGColorSpaceGetModel(ColorSpace))
    {
      double v25 = NAN;
      double v26 = NAN;
      double v23 = NAN;
      double v24 = NAN;
      [v11 getHue:&v25 saturation:&v24 brightness:&v23 alpha:&v26];
      uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithHue:v25 saturation:v24 * 0.5 brightness:v23 * 0.75 alpha:v26];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.44];
    }
    uint64_t v15 = (void *)v13;
    uint64_t v16 = [v7 length];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__MFRecipientTableViewCell__tintedAttributedString_toColor_shouldDim___block_invoke;
    v19[3] = &unk_1E5F7D130;
    id v20 = v11;
    id v17 = v15;
    id v21 = v17;
    id v22 = v10;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v16, 0x100000, v19);
  }
  else
  {
    uint64_t v14 = [v9 length];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v8, 0, v14);
  }

  return v10;
}

void __70__MFRecipientTableViewCell__tintedAttributedString_toColor_shouldDim___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = [v12 objectForKey:@"mf_tintType"];

  if (v7 == @"mf_ttstrong")
  {
    id v10 = a1 + 4;
  }
  else
  {
    id v8 = [v12 objectForKey:@"mf_tintType"];

    if (v8 != @"mf_ttdimmed")
    {
      id v9 = 0;
      goto LABEL_8;
    }
    id v10 = a1 + 5;
  }
  id v9 = *v10;
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x1E4FB0700];
    objc_msgSend(a1[6], "removeAttribute:range:", *MEMORY[0x1E4FB0700], a3, a4);
    objc_msgSend(a1[6], "addAttribute:value:range:", v11, v9, a3, a4);
  }
LABEL_8:
}

- (id)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (MFComposeRecipient *)a3;
  id v6 = v5;
  if (v5)
  {
    p_recipient = (id *)&self->_recipient;
    if (self->_recipient != v5)
    {
      objc_storeStrong((id *)&self->_recipient, a3);
      self->_shouldHideDetailLabel = 0;
      id v8 = [(MFRecipientTableViewCell *)self titleLabel];
      [v8 bounds];
      double v10 = v9;

      uint64_t v11 = objc_opt_class();
      id v12 = *p_recipient;
      id v64 = 0;
      v58 = objc_msgSend(v11, "_attributedStringRepresentationOfCompleteMatchesForRecipient:constrainedToWidth:overflowRecipients:useHighlighting:", v12, &v64, -[MFRecipientTableViewCell shouldHighlightCompleteMatches](self, "shouldHighlightCompleteMatches"), v10);
      id v59 = v64;
      uint64_t v13 = [(MFRecipientTableViewCell *)self titleLabel];
      uint64_t v14 = [(MFRecipientTableViewCell *)self tintColor];
      uint64_t v15 = +[MFRecipientTableViewCell _tintedAttributedString:v58 toColor:v14 shouldDim:self->_shouldDimIrrelevantInformation];
      [v13 setAttributedText:v15];

      if ([(MFComposeRecipient *)v6 isGroup])
      {
        uint64_t v16 = [(MFComposeRecipient *)v6 childrenWithCompleteMatches];
        self->_shouldHideDetailLabel = [v16 count] != 0;

        id v17 = [(MFComposeRecipient *)v6 children];
        BOOL v19 = (unint64_t)[v17 count] < 3 && self->_shouldHideDetailLabel;
        self->_shouldHideDetailLabel = v19;

        if ([v59 count]) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = !self->_shouldHideDetailLabel;
        }
        BOOL v21 = !v20;
        self->_shouldHideDetailLabel = v21;
        id v22 = [(MFComposeRecipient *)v6 childrenWithCompleteMatches];
        if ([v59 count])
        {
          uint64_t v23 = [v22 arrayByExcludingObjectsInArray:v59];

          id v22 = (void *)v23;
        }
        double v24 = [(MFComposeRecipient *)v6 sortedChildren];
        double v25 = [v24 arrayByExcludingObjectsInArray:v22];

        double v26 = (void *)[(id)objc_opt_class() _copyAttributedStringRepresentationOfGroupRecipient:v6 withSortedRecipientList:v25];
        double v27 = [(MFRecipientTableViewCell *)self detailLabel];
        double v28 = [(MFRecipientTableViewCell *)self tintColor];
        v29 = +[MFRecipientTableViewCell _tintedAttributedString:v26 toColor:v28 shouldDim:self->_shouldDimIrrelevantInformation];
        [v27 setAttributedText:v29];

        uint64_t v30 = [(MFRecipientTableViewCell *)self detailLabel];
        [v30 setNumberOfLines:0];

        goto LABEL_41;
      }
      uint64_t v31 = [(MFRecipientTableViewCell *)self detailLabel];
      [v31 setHidden:0];

      uint64_t v32 = [(MFComposeRecipient *)v6 address];
      if ([v32 length])
      {
        BOOL v33 = [(MFComposeRecipient *)v6 kind] == 4;

        if (!v33)
        {
          if ([(MFRecipientTableViewCell *)self shouldHighlightCompleteMatches])
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            v34 = [*p_recipient completelyMatchedAttributedStrings];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v60 objects:v65 count:16];
            if (v35)
            {
              obunint64_t j = v34;
              uint64_t v36 = *(void *)v61;
              while (2)
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v61 != v36) {
                    objc_enumerationMutation(obj);
                  }
                  long long v38 = [*(id *)(*((void *)&v60 + 1) + 8 * i) attributesAtIndex:0 effectiveRange:0];
                  long long v39 = [v38 objectForKey:@"MFComposeRecipientStringMatchType"];
                  char v40 = [v39 isEqualToString:@"MFComposeRecipientStringMatchAddress"];

                  if ((v40 & 1) == 0)
                  {
                    uint64_t v41 = 0;
                    goto LABEL_35;
                  }
                }
                uint64_t v35 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
                if (v35) {
                  continue;
                }
                break;
              }
              uint64_t v41 = 1;
LABEL_35:
              v34 = obj;
            }
            else
            {
              uint64_t v41 = 1;
            }
          }
          else
          {
            uint64_t v41 = 0;
          }
          unint64_t v44 = [(MFRecipientTableViewCell *)self detailLabel];
          [v44 setNumberOfLines:!MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()];

          id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F0817A00];
          double v45 = [(MFComposeRecipient *)v6 label];
          uint64_t v46 = [v45 length];

          if (v46)
          {
            id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
            id v48 = [(MFComposeRecipient *)v6 label];
            uint64_t v49 = [(id)objc_opt_class() labelDetailStringAttributes];
            uint64_t v50 = (void *)[v47 initWithString:v48 attributes:v49];

            v51 = [(MFRecipientTableViewCell *)self tintColor];
            v52 = +[MFRecipientTableViewCell _tintedAttributedString:v50 toColor:v51 shouldDim:self->_shouldDimIrrelevantInformation];
            [v22 appendAttributedString:v52];

            double v53 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"  "];
            [v22 appendAttributedString:v53];
          }
          double v25 = [(id)objc_opt_class() _attributedStringRepresentationOfPartialEmailMatchForSingleRecipient:v6 useHighlighting:v41];
          v54 = [(MFRecipientTableViewCell *)self tintColor];
          v55 = +[MFRecipientTableViewCell _tintedAttributedString:v25 toColor:v54 shouldDim:self->_shouldDimIrrelevantInformation];
          [v22 appendAttributedString:v55];

          double v26 = [(MFRecipientTableViewCell *)self detailLabel];
          [v26 setAttributedText:v22];
LABEL_41:

          if (!self->_shouldHideDetailLabel)
          {
            uint64_t v56 = [(MFRecipientTableViewCell *)self detailLabel];
            [v56 setHidden:0];
            goto LABEL_44;
          }
LABEL_42:
          uint64_t v56 = [(MFRecipientTableViewCell *)self detailLabel];
          [v56 setHidden:1];
LABEL_44:

          [(MFRecipientTableViewCell *)self updateActiveConstraints];
          goto LABEL_45;
        }
      }
      else
      {
      }
      uint64_t v42 = [(MFRecipientTableViewCell *)self detailLabel];
      double v43 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0817A00];
      [v42 setAttributedText:v43];

      self->_shouldHideDetailLabel = 1;
      goto LABEL_42;
    }
  }
LABEL_45:
}

+ (double)height
{
  +[MFRecipientTableViewCell heightWithRecipient:0 width:0.0];
  return result;
}

+ (double)heightWithRecipient:(id)a3 width:(double)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() defaultTitleStringAttributes];
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  id v8 = [v6 objectForKey:*MEMORY[0x1E4FB06F8]];
  [v8 capHeight];

  double v9 = [(id)objc_opt_class() defaultDetailStringAttributes];
  double v10 = [v9 objectForKey:v7];
  [v10 capHeight];

  uint64_t v11 = +[MFFontMetricCache sharedFontMetricCache];
  [v11 cachedFloat:&__block_literal_global_78 forKey:@"MFRecipientTableViewCellSpaceBtwnTitleAndDetail"];

  uint64_t v12 = *MEMORY[0x1E4FB2950];
  uint64_t v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v13 _bodyLeading];
  uint64_t v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v12];
  [v14 _bodyLeading];

  if (v5 && [v5 isGroup])
  {
    uint64_t v15 = [v5 sortedChildren];
    uint64_t v16 = [v5 childrenWithCompleteMatches];
    if ([v16 count])
    {
      [a1 _realDetailButtonAccessoryMargin];
      objc_msgSend(a1, "_constrainedWidthForTitleViewWithAccessoryWidth:containerWidth:");
      id v29 = 0;
      id v17 = (id)objc_msgSend(a1, "_attributedStringRepresentationOfCompleteMatchesForRecipient:constrainedToWidth:overflowRecipients:useHighlighting:", v5, &v29, 0);
      id v18 = v29;
      if ([v18 count])
      {
        uint64_t v19 = [v16 arrayByExcludingObjectsInArray:v18];

        uint64_t v16 = (void *)v19;
      }
      if ([v16 count])
      {
        uint64_t v20 = [v15 arrayByExcludingObjectsInArray:v16];

        uint64_t v15 = (void *)v20;
      }
    }
    if ([v15 count])
    {
      [a1 _realDetailButtonAccessoryMargin];
      objc_msgSend(a1, "_constrainedWidthForDetailViewWithAccessoryWidth:containerWidth:");
      double v22 = v21;
      uint64_t v23 = (void *)[a1 _copyAttributedStringRepresentationOfGroupRecipient:v5 withSortedRecipientList:v15];
      objc_msgSend(v23, "boundingRectWithSize:options:context:", 1, 0, v22, 1.79769313e308);
      double v24 = [v23 attribute:v7 atIndex:0 effectiveRange:0];
      [v24 lineHeight];
    }
  }
  double v25 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
  UIRoundToViewScale();
  double v27 = v26;

  return v27;
}

double __54__MFRecipientTableViewCell_heightWithRecipient_width___block_invoke()
{
  CFBooleanRef v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v0 _bodyLeading];
  double v2 = v1 * 0.475;

  return v2;
}

- (void)setOpaque:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFRecipientTableViewCell;
  -[MFRecipientTableViewCell setOpaque:](&v8, sel_setOpaque_);
  if (a3) {
    [(MFRecipientTableViewCell *)self backgroundColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  id v6 = [(MFRecipientTableViewCell *)self detailLabel];
  [v6 setBackgroundColor:v5];
  uint64_t v7 = [(MFRecipientTableViewCell *)self titleLabel];
  [v7 setBackgroundColor:v5];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFRecipientTableViewCell;
  [(MFRecipientTableViewCell *)&v9 setBackgroundColor:v4];
  if ([(MFRecipientTableViewCell *)self isOpaque])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  id v6 = v5;
  uint64_t v7 = [(MFRecipientTableViewCell *)self detailLabel];
  [v7 setBackgroundColor:v6];
  objc_super v8 = [(MFRecipientTableViewCell *)self titleLabel];
  [v8 setBackgroundColor:v6];
}

+ (id)_defaultTintColor
{
  return (id)[MEMORY[0x1E4FB1618] mailComposeSuggestionsListTintColor];
}

- (id)tintColor
{
  tintColor = self->_tintColor;
  if (!tintColor)
  {
    id v4 = +[MFRecipientTableViewCell _defaultTintColor];
    id v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }

  return tintColor;
}

- (void)setTintColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (UIColor *)a3;
  if (v7 && self->_tintColor != v7)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke;
    aBlock[3] = &unk_1E5F79088;
    aBlock[4] = self;
    objc_super v8 = (void (**)(void))_Block_copy(aBlock);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke_2;
    v12[3] = &unk_1E5F79088;
    v12[4] = self;
    objc_super v9 = (void (**)(void))_Block_copy(v12);
    if (v4)
    {
      double v10 = [(MFRecipientTableViewCell *)self titleLabel];
      [(MFRecipientTableViewCell *)self animateSnapshotOfLabel:v10 withBlock:v8];

      uint64_t v11 = [(MFRecipientTableViewCell *)self detailLabel];
      [(MFRecipientTableViewCell *)self animateSnapshotOfLabel:v11 withBlock:v9];
    }
    else
    {
      v8[2](v8);
      v9[2](v9);
    }
  }
}

void __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) titleLabel];
  double v2 = [v6 attributedText];
  id v3 = [*(id *)(a1 + 32) tintColor];
  BOOL v4 = +[MFRecipientTableViewCell _tintedAttributedString:v2 toColor:v3 shouldDim:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1034)];
  id v5 = [*(id *)(a1 + 32) titleLabel];
  [v5 setAttributedText:v4];
}

void __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) detailLabel];
  double v2 = [v6 attributedText];
  id v3 = [*(id *)(a1 + 32) tintColor];
  BOOL v4 = +[MFRecipientTableViewCell _tintedAttributedString:v2 toColor:v3 shouldDim:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1034)];
  id v5 = [*(id *)(a1 + 32) detailLabel];
  [v5 setAttributedText:v4];
}

- (void)animateSnapshotOfLabel:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id v8 = objc_alloc(MEMORY[0x1E4FB1C40]);
  [v6 frame];
  objc_super v9 = objc_msgSend(v8, "initWithFrame:");
  [v9 captureSnapshotOfView:v6 withSnapshotType:1];
  [(MFRecipientTableViewCell *)self addSubview:v9];
  [v6 setAlpha:0.0];
  v7[2](v7);
  double v10 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke;
  v15[3] = &unk_1E5F79038;
  id v16 = v9;
  id v11 = v6;
  id v17 = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke_2;
  v13[3] = &unk_1E5F7A210;
  id v12 = v16;
  id v14 = v12;
  [v10 animateWithDuration:v15 animations:v13 completion:0.3];
}

uint64_t __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:1.0];
}

uint64_t __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

+ (id)defaultTitleStringAttributes
{
  double v2 = +[_MFTableCellAttributesCache sharedInstance];
  id v3 = [v2 cachedAttributesForIdentifier:@"defaultTitle" constructionBlock:&__block_literal_global_96_0];

  return v3;
}

id __56__MFRecipientTableViewCell_defaultTitleStringAttributes__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = 4;
  }
  [v0 setLineBreakMode:v1];
  double v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
  id v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v7[0] = @"mf_tintType";
  v7[1] = v4;
  v8[0] = @"mf_ttdimmed";
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E4FB0738];
  v8[2] = v0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)regularTitleStringAttributes
{
  id v3 = +[_MFTableCellAttributesCache sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MFRecipientTableViewCell_regularTitleStringAttributes__block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a1;
  uint64_t v4 = [v3 cachedAttributesForIdentifier:@"regularTitle" constructionBlock:v6];

  return v4;
}

id __56__MFRecipientTableViewCell_regularTitleStringAttributes__block_invoke()
{
  id v0 = [(id)objc_opt_class() defaultTitleStringAttributes];
  uint64_t v1 = (void *)[v0 mutableCopy];

  [v1 setObject:@"mf_ttstrong" forKey:@"mf_tintType"];

  return v1;
}

+ (id)highlightedTitleStringAttributes
{
  double v2 = +[_MFTableCellAttributesCache sharedInstance];
  id v3 = [v2 cachedAttributesForIdentifier:@"emphasizedTitle" constructionBlock:&__block_literal_global_107];

  return v3;
}

id __60__MFRecipientTableViewCell_highlightedTitleStringAttributes__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = 4;
  }
  [v0 setLineBreakMode:v1];
  double v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32770 options:0];
  id v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v7[0] = @"mf_tintType";
  v7[1] = v4;
  v8[0] = @"mf_ttstrong";
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E4FB0738];
  v8[2] = v0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)defaultDetailStringAttributes
{
  double v2 = +[_MFTableCellAttributesCache sharedInstance];
  id v3 = [v2 cachedAttributesForIdentifier:@"detailDefault" constructionBlock:&__block_literal_global_112];

  return v3;
}

id __57__MFRecipientTableViewCell_defaultDetailStringAttributes__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge()) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = 4;
  }
  [v0 setLineBreakMode:v1];
  double v2 = _baseDetailAttributes();
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:v0 forKeyedSubscript:*MEMORY[0x1E4FB0738]];

  return v3;
}

+ (id)highlightedDetailStringAttributes
{
  id v3 = +[_MFTableCellAttributesCache sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__MFRecipientTableViewCell_highlightedDetailStringAttributes__block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a1;
  uint64_t v4 = [v3 cachedAttributesForIdentifier:@"detailHigh" constructionBlock:v6];

  return v4;
}

id __61__MFRecipientTableViewCell_highlightedDetailStringAttributes__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) defaultDetailStringAttributes];
  double v2 = (void *)[v1 mutableCopy];

  id v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:2 options:0];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  [v2 setObject:@"mf_ttstrong" forKeyedSubscript:@"mf_tintType"];

  return v2;
}

+ (id)groupDetailStringAttributes
{
  double v2 = +[_MFTableCellAttributesCache sharedInstance];
  id v3 = [v2 cachedAttributesForIdentifier:@"detailGroup" constructionBlock:&__block_literal_global_120];

  return v3;
}

id __55__MFRecipientTableViewCell_groupDetailStringAttributes__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v0 setLineBreakMode:0];
  [v0 setLineSpacing:3.0];
  uint64_t v1 = _baseDetailAttributes();
  double v2 = (void *)[v1 mutableCopy];

  [v2 setObject:v0 forKeyedSubscript:*MEMORY[0x1E4FB0738]];

  return v2;
}

+ (id)labelDetailStringAttributes
{
  double v2 = +[_MFTableCellAttributesCache sharedInstance];
  id v3 = [v2 cachedAttributesForIdentifier:@"detailLabelLabel" constructionBlock:&__block_literal_global_125];

  return v3;
}

id __55__MFRecipientTableViewCell_labelDetailStringAttributes__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:2 options:0];
  v8[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];
  v9[0] = v1;
  v8[1] = *MEMORY[0x1E4FB0700];
  double v2 = (void *)_colorForLabelType__labelColors_0;
  if (!_colorForLabelType__labelColors_0)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    uint64_t v4 = (void *)_colorForLabelType__labelColors_0;
    _colorForLabelType__labelColors_0 = v3;

    double v2 = (void *)_colorForLabelType__labelColors_0;
  }
  id v5 = v2;
  v8[2] = @"mf_tintType";
  v9[1] = v5;
  v9[2] = @"mf_ttdimmed";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (double)detailLineHeight
{
  double v2 = _baseDetailAttributes();
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4FB06F8]];
  [v3 lineHeight];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (BOOL)shouldDimIrrelevantInformation
{
  return self->_shouldDimIrrelevantInformation;
}

- (void)setShouldDimIrrelevantInformation:(BOOL)a3
{
  self->_shouldDimIrrelevantInformation = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end