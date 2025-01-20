@interface EKUIPasteboardResultsTableViewCell
+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4;
+ (id)_aggregateTitleStringForAggregateResult:(id)a3;
+ (id)_titleStringForResult:(id)a3;
+ (id)reuseIdentifier;
- (EKUIPasteboardResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setLabelFonts;
- (void)setupConstraints;
- (void)updateWithResult:(id)a3;
@end

@implementation EKUIPasteboardResultsTableViewCell

+ (id)reuseIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EKUIPasteboardResultsTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_0 != -1) {
    dispatch_once(&reuseIdentifier_onceToken_0, block);
  }
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;

  return v2;
}

void __53__EKUIPasteboardResultsTableViewCell_reuseIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;
  reuseIdentifier_reuseIdentifier_0 = v1;
}

- (EKUIPasteboardResultsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)EKUIPasteboardResultsTableViewCell;
  v4 = [(EKUIAutocompleteSearchResultBaseCell *)&v35 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(EKUITableViewCell *)v4 setDrawsOwnRowSeparators:1];
    v6 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
    [(EKUITableViewCell *)v5 setRowSeparatorColor:v6];

    [(EKUITableViewCell *)v5 setUsesInsetMargin:0];
    v7 = EKHalfSystemGroupedBackgroundColor();
    [(EKUIPasteboardResultsTableViewCell *)v5 setBackgroundColor:v7];

    uint64_t v8 = 4;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    eventCalendarColors = v5->_eventCalendarColors;
    v5->_eventCalendarColors = (NSMutableArray *)v9;

    do
    {
      v11 = v5->_eventCalendarColors;
      v12 = [MEMORY[0x1E4FB1618] clearColor];
      [(NSMutableArray *)v11 addObject:v12];

      --v8;
    }
    while (v8);
    uint64_t v13 = 4;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    eventTitles = v5->_eventTitles;
    v5->_eventTitles = (NSMutableArray *)v14;

    do
    {
      v16 = v5->_eventTitles;
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0CC2140];
      [(NSMutableArray *)v16 addObject:v17];

      --v13;
    }
    while (v13);
    uint64_t v18 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createPrimaryLabel];
    aggregateTextLabel = v5->_aggregateTextLabel;
    v5->_aggregateTextLabel = (UILabel *)v18;

    v20 = [(EKUIPasteboardResultsTableViewCell *)v5 contentView];
    [v20 addSubview:v5->_aggregateTextLabel];

    uint64_t v21 = 4;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    colorDotViews = v5->_colorDotViews;
    v5->_colorDotViews = (NSMutableArray *)v22;

    do
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      v25 = [(EKUIPasteboardResultsTableViewCell *)v5 contentView];
      [v25 addSubview:v24];

      [(NSMutableArray *)v5->_colorDotViews addObject:v24];
      --v21;
    }
    while (v21);
    uint64_t v26 = 4;
    uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    titleTextLabels = v5->_titleTextLabels;
    v5->_titleTextLabels = (NSMutableArray *)v27;

    do
    {
      v29 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createPrimaryLabel];
      v30 = [(EKUIPasteboardResultsTableViewCell *)v5 contentView];
      [v30 addSubview:v29];

      [(NSMutableArray *)v5->_titleTextLabels addObject:v29];
      --v26;
    }
    while (v26);
    uint64_t v31 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createPrimaryLabel];
    xMoreLabel = v5->_xMoreLabel;
    v5->_xMoreLabel = (UILabel *)v31;

    v33 = [(EKUIPasteboardResultsTableViewCell *)v5 contentView];
    [v33 addSubview:v5->_xMoreLabel];

    [(EKUIPasteboardResultsTableViewCell *)v5 setLabelFonts];
    [(EKUIPasteboardResultsTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setLabelFonts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self primaryTextLabelFont];
  v4 = [(id)objc_opt_class() secondaryTextLabelFont];
  [(UILabel *)self->_aggregateTextLabel setFont:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_titleTextLabels;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setFont:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(UILabel *)self->_xMoreLabel setFont:v4];
}

- (void)setupConstraints
{
  if (self->_cellConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    cellConstraints = self->_cellConstraints;
    self->_cellConstraints = 0;
  }
  uint64_t v71 = 1136;
  v4 = objc_opt_new();
  v5 = [(UILabel *)self->_aggregateTextLabel leadingAnchor];
  uint64_t v6 = [(EKUIPasteboardResultsTableViewCell *)self contentView];
  uint64_t v7 = [v6 layoutMarginsGuide];
  uint64_t v8 = [v7 leadingAnchor];
  uint64_t v9 = [v5 constraintEqualToAnchor:v8];
  [v4 addObject:v9];

  long long v10 = [(UILabel *)self->_aggregateTextLabel trailingAnchor];
  long long v11 = [(EKUIPasteboardResultsTableViewCell *)self contentView];
  long long v12 = [v11 layoutMarginsGuide];
  long long v13 = [v12 trailingAnchor];
  uint64_t v14 = [v10 constraintEqualToAnchor:v13];
  [v4 addObject:v14];

  uint64_t v15 = [(UILabel *)self->_aggregateTextLabel firstBaselineAnchor];
  v16 = [(EKUIPasteboardResultsTableViewCell *)self contentView];
  v17 = [v16 topAnchor];
  [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToBaselineForTopLabel];
  uint64_t v18 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  [v4 addObject:v18];

  v19 = [(UILabel *)self->_xMoreLabel leadingAnchor];
  v20 = [(NSMutableArray *)self->_colorDotViews objectAtIndexedSubscript:3];
  uint64_t v21 = [v20 leadingAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21];
  [v4 addObject:v22];

  v23 = [(UILabel *)self->_xMoreLabel trailingAnchor];
  id v24 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:3];
  v25 = [v24 trailingAnchor];
  uint64_t v26 = [v23 constraintEqualToAnchor:v25];
  [v4 addObject:v26];

  uint64_t v27 = [(UILabel *)self->_xMoreLabel firstBaselineAnchor];
  v28 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:3];
  v29 = [v28 firstBaselineAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v4 addObject:v30];

  for (uint64_t i = 0; i != 4; ++i)
  {
    v32 = -[NSMutableArray objectAtIndexedSubscript:](self->_colorDotViews, "objectAtIndexedSubscript:", i, v71);
    v33 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:i];
    v34 = [v32 leadingAnchor];
    objc_super v35 = [(EKUIPasteboardResultsTableViewCell *)self contentView];
    v36 = [v35 layoutMarginsGuide];
    v37 = v36;
    if (i)
    {
      v38 = [v36 centerXAnchor];
      [v34 constraintEqualToAnchor:v38 constant:4.0];
    }
    else
    {
      v38 = [v36 leadingAnchor];
      [v34 constraintEqualToAnchor:v38];
    v39 = };
    [v4 addObject:v39];

    v40 = [v32 centerYAnchor];
    v41 = [v33 centerYAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    [v4 addObject:v42];

    v43 = [v32 widthAnchor];
    v44 = [v32 image];
    [v44 size];
    v45 = objc_msgSend(v43, "constraintEqualToConstant:");
    [v4 addObject:v45];

    v46 = [v32 heightAnchor];
    v47 = [v32 image];
    [v47 size];
    v49 = [v46 constraintEqualToConstant:v48];
    [v4 addObject:v49];

    v50 = [v33 trailingAnchor];
    v51 = [(EKUIPasteboardResultsTableViewCell *)self contentView];
    v52 = [v51 layoutMarginsGuide];
    v53 = v52;
    if (i)
    {
      v64 = [v52 trailingAnchor];
      v65 = [v50 constraintEqualToAnchor:v64];
      [v4 addObject:v65];

      v66 = [v33 leadingAnchor];
      v67 = [(NSMutableArray *)self->_colorDotViews objectAtIndexedSubscript:1];
      v68 = [v67 trailingAnchor];
      v69 = [v66 constraintEqualToAnchor:v68 constant:12.0];
      [v4 addObject:v69];

      v60 = [v33 firstBaselineAnchor];
      if (i != 1)
      {
LABEL_9:
        v61 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:i - 2];
        v62 = [v61 lastBaselineAnchor];
        [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToBaselineForBottomLabel];
        v63 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62);
        [v4 addObject:v63];

        goto LABEL_12;
      }
    }
    else
    {
      v54 = [v52 centerXAnchor];
      v55 = [v50 constraintEqualToAnchor:v54 constant:-4.0];
      [v4 addObject:v55];

      v56 = [v33 leadingAnchor];
      v57 = [(NSMutableArray *)self->_colorDotViews objectAtIndexedSubscript:0];
      v58 = [v57 trailingAnchor];
      v59 = [v56 constraintEqualToAnchor:v58 constant:12.0];
      [v4 addObject:v59];

      v60 = [v33 firstBaselineAnchor];
      if (i) {
        goto LABEL_9;
      }
    }
    v61 = [(UILabel *)self->_aggregateTextLabel lastBaselineAnchor];
    [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToBaselineForBottomLabel];
    v62 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61);
    [v4 addObject:v62];
LABEL_12:
  }
  v70 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71) = (Class)v4;
  id v72 = v4;

  [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v71)];
}

+ (id)_aggregateTitleStringForAggregateResult:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB0870];
  v4 = (void *)MEMORY[0x1E4FB1818];
  id v5 = a3;
  uint64_t v6 = [v4 systemImageNamed:@"doc.on.clipboard"];
  uint64_t v7 = [v3 textAttachmentWithImage:v6];

  uint64_t v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
  uint64_t v9 = NSString;
  long long v10 = EventKitUIBundle();
  long long v11 = [v10 localizedStringForKey:@"multiple_events_from_pasteboard" value:&stru_1F0CC2140 table:0];
  long long v12 = [v5 pasteboardResults];

  long long v13 = objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(v12, "count"));

  uint64_t v14 = (void *)MEMORY[0x1E4F28B18];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"%@ %@"];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
  v17 = objc_msgSend(v14, "localizedAttributedStringWithFormat:", v15, v8, v16);

  return v17;
}

+ (id)_titleStringForResult:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 title];

  uint64_t v7 = (void *)[v5 initWithString:v6];

  return v7;
}

- (void)updateWithResult:(id)a3
{
  id v37 = a3;
  id v4 = [v37 pasteboardResults];
  unint64_t v5 = [v4 count];

  unint64_t v35 = v5;
  if (v5 <= 4)
  {
    uint64_t v7 = [v37 pasteboardResults];
    uint64_t v8 = [v7 count];

    uint64_t v36 = v8;
    uint64_t v6 = 4 - v8;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v36 = 3;
  }
  uint64_t v9 = [(id)objc_opt_class() _aggregateTitleStringForAggregateResult:v37];
  if (![(NSAttributedString *)self->_aggregateTitle isEqualToAttributedString:v9])
  {
    objc_storeStrong((id *)&self->_aggregateTitle, v9);
    [(UILabel *)self->_aggregateTextLabel setAttributedText:self->_aggregateTitle];
  }
  if (v6 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = -v6;
    do
    {
      long long v12 = [(NSMutableArray *)self->_colorDotViews objectAtIndexedSubscript:v10 + 3];
      [v12 setHidden:1];

      long long v13 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:v10 + 3];
      [v13 setHidden:1];

      --v10;
    }
    while (v11 != v10);
  }
  if (v36 >= 1)
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      uint64_t v15 = [v37 pasteboardResults];
      v16 = [v15 objectAtIndexedSubscript:i];

      v17 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(v16, "calendarColor"));
      uint64_t v18 = [(NSMutableArray *)self->_eventCalendarColors objectAtIndexedSubscript:i];

      if (v18 != v17)
      {
        [(NSMutableArray *)self->_eventCalendarColors setObject:v17 atIndexedSubscript:i];
        v19 = [(NSMutableArray *)self->_eventCalendarColors objectAtIndexedSubscript:i];
        v20 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:i];
        uint64_t v21 = [v20 font];
        uint64_t v22 = ScaledCalendarColorDotImageForColor_SuggestedEvent((uint64_t)v19, (uint64_t)v21);
        v23 = [(NSMutableArray *)self->_colorDotViews objectAtIndexedSubscript:i];
        [v23 setImage:v22];
      }
      id v24 = [(id)objc_opt_class() _titleStringForResult:v16];
      v25 = [(NSMutableArray *)self->_eventTitles objectAtIndexedSubscript:i];
      char v26 = [v25 isEqualToAttributedString:v24];

      if ((v26 & 1) == 0)
      {
        [(NSMutableArray *)self->_eventTitles setObject:v24 atIndexedSubscript:i];
        uint64_t v27 = [(NSMutableArray *)self->_eventTitles objectAtIndexedSubscript:i];
        v28 = [(NSMutableArray *)self->_titleTextLabels objectAtIndexedSubscript:i];
        [v28 setAttributedText:v27];
      }
    }
  }
  xMoreLabel = self->_xMoreLabel;
  if (v35 <= 4)
  {
    [(UILabel *)xMoreLabel setHidden:1];
  }
  else
  {
    [(UILabel *)xMoreLabel setHidden:0];
    v30 = NSString;
    uint64_t v31 = EventKitUIBundle();
    v32 = [v31 localizedStringForKey:@"and %d more" value:&stru_1F0CC2140 table:0];
    v33 = [v37 pasteboardResults];
    v34 = objc_msgSend(v30, "localizedStringWithFormat:", v32, objc_msgSend(v33, "count") - v36);
    [(UILabel *)self->_xMoreLabel setText:v34];
  }
  [(EKUIPasteboardResultsTableViewCell *)self setupConstraints];
}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 primaryTextLabelFontForWidth:a4];
  uint64_t v8 = [a1 secondaryTextLabelFont];
  uint64_t v9 = [v6 pasteboardResults];

  unint64_t v10 = [v9 count];
  uint64_t v11 = 4;
  if (v10 < 4) {
    uint64_t v11 = v10;
  }
  double v12 = ceil((double)v11 * 0.5);
  [a1 verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:v7];
  double v14 = v13;
  [a1 verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:v7];
  double v16 = v14 + v15;
  [a1 verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:v8];
  double v18 = v16 + (double)(uint64_t)v12 * v17;
  [a1 rowSeparatorThickness];
  CalRoundToScreenScale(v19 + v18);
  double v21 = v20;

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_eventTitles, 0);
  objc_storeStrong((id *)&self->_eventCalendarColors, 0);
  objc_storeStrong((id *)&self->_aggregateTitle, 0);
  objc_storeStrong((id *)&self->_xMoreLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabels, 0);
  objc_storeStrong((id *)&self->_colorDotViews, 0);

  objc_storeStrong((id *)&self->_aggregateTextLabel, 0);
}

@end