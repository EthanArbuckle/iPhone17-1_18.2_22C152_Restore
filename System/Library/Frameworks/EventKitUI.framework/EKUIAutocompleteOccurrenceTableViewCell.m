@interface EKUIAutocompleteOccurrenceTableViewCell
+ (BOOL)_shouldShowOtherTimeZoneForResult:(id)a3;
+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4;
+ (id)_foundInStringForResult:(id)a3 pasteboardEvent:(BOOL)a4;
+ (id)_inviteeStringForResult:(id)a3;
+ (id)_locationStringForResult:(id)a3;
+ (id)_timeStringForResult:(id)a3 usingTimeZone:(id)a4;
+ (id)_titleStringForResult:(id)a3;
+ (id)reuseIdentifier;
- (EKUIAutocompleteOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_addConstraintsForLabel:(id)a3 belowView:(id)a4 toArray:(id)a5;
- (void)setLabelFonts;
- (void)setupConstraints;
- (void)updateWithResult:(id)a3;
@end

@implementation EKUIAutocompleteOccurrenceTableViewCell

+ (id)reuseIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__EKUIAutocompleteOccurrenceTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken != -1) {
    dispatch_once(&reuseIdentifier_onceToken, block);
  }
  v2 = (void *)reuseIdentifier_reuseIdentifier;

  return v2;
}

void __58__EKUIAutocompleteOccurrenceTableViewCell_reuseIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  v2 = (void *)reuseIdentifier_reuseIdentifier;
  reuseIdentifier_reuseIdentifier = v1;
}

- (EKUIAutocompleteOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v33[5] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)EKUIAutocompleteOccurrenceTableViewCell;
  v4 = [(EKUIAutocompleteSearchResultBaseCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(EKUITableViewCell *)v4 setDrawsOwnRowSeparators:1];
    v6 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
    [(EKUITableViewCell *)v5 setRowSeparatorColor:v6];

    [(EKUITableViewCell *)v5 setUsesInsetMargin:0];
    v7 = EKHalfSystemGroupedBackgroundColor();
    [(EKUIAutocompleteOccurrenceTableViewCell *)v5 setBackgroundColor:v7];

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    colorDotView = v5->_colorDotView;
    v5->_colorDotView = v8;

    [(UIImageView *)v5->_colorDotView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v10 addSubview:v5->_colorDotView];

    uint64_t v11 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createPrimaryLabel];
    titleTextLabel = v5->_titleTextLabel;
    v5->_titleTextLabel = (UILabel *)v11;

    v13 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v13 addSubview:v5->_titleTextLabel];

    uint64_t v14 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createSecondaryLabel];
    locationTextLabel = v5->_locationTextLabel;
    v5->_locationTextLabel = (UILabel *)v14;

    v16 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v16 addSubview:v5->_locationTextLabel];

    uint64_t v17 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createSecondaryLabel];
    timeTextLabelWithThisTimeZone = v5->_timeTextLabelWithThisTimeZone;
    v5->_timeTextLabelWithThisTimeZone = (UILabel *)v17;

    v19 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v19 addSubview:v5->_timeTextLabelWithThisTimeZone];

    uint64_t v20 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createSecondaryLabel];
    timeTextLabelWithResultTimeZone = v5->_timeTextLabelWithResultTimeZone;
    v5->_timeTextLabelWithResultTimeZone = (UILabel *)v20;

    v22 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v22 addSubview:v5->_timeTextLabelWithResultTimeZone];

    uint64_t v23 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createSecondaryLabel];
    inviteesTextLabel = v5->_inviteesTextLabel;
    v5->_inviteesTextLabel = (UILabel *)v23;

    v25 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v25 addSubview:v5->_inviteesTextLabel];

    uint64_t v26 = [(EKUIAutocompleteSearchResultBaseCell *)v5 createSecondaryLabel];
    foundInTextLabel = v5->_foundInTextLabel;
    v5->_foundInTextLabel = (UILabel *)v26;

    v28 = [(EKUIAutocompleteOccurrenceTableViewCell *)v5 contentView];
    [v28 addSubview:v5->_foundInTextLabel];

    v33[0] = v5->_locationTextLabel;
    v33[1] = v5->_timeTextLabelWithThisTimeZone;
    v33[2] = v5->_timeTextLabelWithResultTimeZone;
    v33[3] = v5->_inviteesTextLabel;
    v33[4] = v5->_foundInTextLabel;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
    secondaryLabels = v5->_secondaryLabels;
    v5->_secondaryLabels = (NSArray *)v29;

    [(EKUIAutocompleteOccurrenceTableViewCell *)v5 setLabelFonts];
    [(EKUIAutocompleteOccurrenceTableViewCell *)v5 setupConstraints];
  }
  return v5;
}

- (void)setLabelFonts
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(EKUITableViewCellWithPrimaryAndSecondaryFonts *)self primaryTextLabelFont];
  v4 = [(id)objc_opt_class() secondaryTextLabelFont];
  [(UILabel *)self->_titleTextLabel setFont:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_secondaryLabels;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setupConstraints
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_ekUIAutocompleteOccurrenceTableViewCellConstraints)
  {
    v3 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
    [v3 removeConstraints:self->_ekUIAutocompleteOccurrenceTableViewCellConstraints];

    ekUIAutocompleteOccurrenceTableViewCellConstraints = self->_ekUIAutocompleteOccurrenceTableViewCellConstraints;
    self->_ekUIAutocompleteOccurrenceTableViewCellConstraints = 0;
  }
  v5 = (NSArray *)objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC8];
  colorDotView = self->_colorDotView;
  uint64_t v8 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  uint64_t v9 = [v6 constraintWithItem:colorDotView attribute:5 relatedBy:0 toItem:v8 attribute:5 multiplier:1.0 constant:18.0];
  [(NSArray *)v5 addObject:v9];

  long long v10 = (void *)MEMORY[0x1E4F28DC8];
  long long v11 = self->_colorDotView;
  long long v12 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToColorDot];
  uint64_t v14 = [v10 constraintWithItem:v11 attribute:3 relatedBy:0 toItem:v12 attribute:3 multiplier:1.0 constant:v13];
  [(NSArray *)v5 addObject:v14];

  uint64_t v15 = (void *)MEMORY[0x1E4F28DC8];
  v16 = self->_colorDotView;
  uint64_t v17 = [(UIImageView *)v16 image];
  [v17 size];
  v19 = [v15 constraintWithItem:v16 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v18];
  [(NSArray *)v5 addObject:v19];

  uint64_t v20 = (void *)MEMORY[0x1E4F28DC8];
  v21 = self->_colorDotView;
  v22 = [(UIImageView *)v21 image];
  [v22 size];
  uint64_t v23 = objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 8, 0, 0, 0, 1.0);
  [(NSArray *)v5 addObject:v23];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  titleTextLabel = self->_titleTextLabel;
  uint64_t v26 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToBaselineForTopLabel];
  v28 = [v24 constraintWithItem:titleTextLabel attribute:11 relatedBy:0 toItem:v26 attribute:3 multiplier:1.0 constant:v27];
  [(NSArray *)v5 addObject:v28];

  [(EKUIAutocompleteOccurrenceTableViewCell *)self _addConstraintsForLabel:self->_titleTextLabel belowView:0 toArray:v5];
  uint64_t v29 = self->_titleTextLabel;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v30 = self->_secondaryLabels;
  uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v35, "isHidden", (void)v40) & 1) == 0)
        {
          [(EKUIAutocompleteOccurrenceTableViewCell *)self _addConstraintsForLabel:v35 belowView:v29 toArray:v5];
          v36 = v35;

          uint64_t v29 = v36;
        }
      }
      uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v32);
  }

  v37 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  [v37 addConstraints:v5];

  v38 = self->_ekUIAutocompleteOccurrenceTableViewCellConstraints;
  self->_ekUIAutocompleteOccurrenceTableViewCellConstraints = v5;
  v39 = v5;
}

- (void)_addConstraintsForLabel:(id)a3 belowView:(id)a4 toArray:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v19 attribute:5 relatedBy:0 toItem:self->_colorDotView attribute:6 multiplier:1.0 constant:12.0];
  [v9 addObject:v10];

  long long v11 = (void *)MEMORY[0x1E4F28DC8];
  long long v12 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  double v13 = [(EKUIAutocompleteOccurrenceTableViewCell *)self contentView];
  [v13 layoutMargins];
  uint64_t v15 = [v11 constraintWithItem:v19 attribute:6 relatedBy:0 toItem:v12 attribute:6 multiplier:1.0 constant:-v14];
  [v9 addObject:v15];

  if (v8)
  {
    v16 = (void *)MEMORY[0x1E4F28DC8];
    [(EKUIAutocompleteSearchResultBaseCell *)self verticalSpacingTopToBaselineForBottomLabel];
    double v18 = [v16 constraintWithItem:v19 attribute:11 relatedBy:0 toItem:v8 attribute:11 multiplier:1.0 constant:v17];
    [v9 addObject:v18];
  }
}

+ (id)_titleStringForResult:(id)a3
{
  id v3 = a3;
  if ([v3 source] == 2)
  {
    v4 = NSString;
    v5 = EventKitUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"Maybe: %@" value:&stru_1F0CC2140 table:0];
    uint64_t v7 = [v3 title];
    id v8 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v7);
  }
  else
  {
    id v8 = [v3 title];
  }

  return v8;
}

+ (id)_locationStringForResult:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F25508];
  v5 = [v3 notes];
  uint64_t v6 = [v4 deserializeConference:v5];
  uint64_t v7 = [v6 conference];

  id v8 = [v7 joinMethods];
  id v9 = [v8 firstObject];
  long long v10 = [v9 URL];

  long long v11 = [v7 joinMethods];
  long long v12 = [v11 firstObject];
  uint64_t v13 = [v12 isBroadcast];

  double v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = [v3 displayLocationWithoutPrediction];

  if (v15)
  {
    v16 = [v3 displayLocationWithoutPrediction];
    [v14 addObject:v16];
  }
  double v17 = [v3 notes];

  if (v17)
  {
    double v18 = [v3 notes];
    [v14 addObject:v18];
  }
  id v19 = [v3 URL];

  if (v19)
  {
    uint64_t v20 = [v3 URL];
    v21 = [v20 absoluteString];
    [v14 addObject:v21];
  }
  v22 = [MEMORY[0x1E4F576A0] conferenceURLFromSources:v14];
  uint64_t v23 = (void *)MEMORY[0x1E4F57BA0];
  v24 = [v3 displayLocation];
  v25 = [v3 displayLocationWithoutPrediction];
  uint64_t v26 = [v3 preferredLocation];
  if (v10) {
    double v27 = v10;
  }
  else {
    double v27 = v22;
  }
  v28 = [v23 locationStringForLocation:v24 locationWithoutPrediction:v25 preferredLocation:v26 conferenceURL:v27 conferenceURLIsBroadcast:v13];

  return v28;
}

+ (id)_foundInStringForResult:(id)a3 pasteboardEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [a3 foundInBundleID];
  if (v5)
  {
    id v19 = 0;
    uint64_t v6 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v5 allowPlaceholder:1 error:&v19];
    id v7 = v19;
    if (v6)
    {
      id v8 = [v6 localizedName];
      id v9 = [MEMORY[0x1E4F57C40] brandedOriginDescriptionStringWithAppName:v8];
      long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];

LABEL_6:
      goto LABEL_11;
    }
    double v17 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "Unable to find bundle for id %@, %@", buf, 0x16u);
    }
  }
  else if (v4)
  {
    long long v11 = (void *)MEMORY[0x1E4FB0870];
    long long v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.clipboard"];
    id v7 = [v11 textAttachmentWithImage:v12];

    uint64_t v6 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v14 = EventKitUIBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"%@ From clipboard" value:&stru_1F0CC2140 table:0];
    v16 = (void *)[v13 initWithString:v15];

    long long v10 = objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v16, v6);

    goto LABEL_6;
  }
  long long v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)_shouldShowOtherTimeZoneForResult:(id)a3
{
  id v3 = a3;
  if (([v3 allDay] & 1) != 0
    || ([v3 timeZone], BOOL v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    char v7 = 0;
  }
  else
  {
    v5 = [v3 timeZone];
    uint64_t v6 = [v3 startDate];
    if (CUIKShouldShowTimezoneClarification())
    {
      char v7 = 1;
    }
    else
    {
      id v8 = [v3 timeZone];
      id v9 = [v3 endDate];
      char v7 = CUIKShouldShowTimezoneClarification();
    }
  }

  return v7;
}

+ (id)_timeStringForResult:(id)a3 usingTimeZone:(id)a4
{
  BOOL v5 = a4 != 0;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[EKStringFactory sharedInstance];
  id v9 = [v7 startDate];
  long long v10 = [v7 endDate];
  uint64_t v11 = [v7 allDay];

  long long v12 = [v8 dateStringForSuggestedEventWithStartDate:v9 endDate:v10 timeZone:v6 allDay:v11 showTimeZone:v5];

  return v12;
}

+ (id)_inviteeStringForResult:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F57B98];
  BOOL v4 = [a3 attendees];
  BOOL v5 = [v3 inviteeStringForAttendees:v4];

  return v5;
}

- (void)updateWithResult:(id)a3
{
  id v32 = a3;
  uint64_t v4 = [v32 source];
  if (v4 == 4)
  {
    BOOL v5 = [v32 pasteboardResults];
    uint64_t v6 = [v5 firstObject];

    id v7 = (void *)v6;
  }
  else
  {
    id v7 = v32;
  }
  id v33 = v7;
  objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", objc_msgSend(v7, "calendarColor"));
  id v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  if (self->_eventCalendarColor != v8)
  {
    objc_storeStrong((id *)&self->_eventCalendarColor, v8);
    eventCalendarColor = self->_eventCalendarColor;
    long long v10 = [(UILabel *)self->_titleTextLabel font];
    uint64_t v11 = ScaledCalendarColorDotImageForColor_SuggestedEvent((uint64_t)eventCalendarColor, (uint64_t)v10);
    [(UIImageView *)self->_colorDotView setImage:v11];
  }
  long long v12 = [(id)objc_opt_class() _titleStringForResult:v33];
  p_eventTitle = &self->_eventTitle;
  eventTitle = self->_eventTitle;
  if (!eventTitle)
  {
    if ([v12 length]) {
      goto LABEL_10;
    }
    eventTitle = *p_eventTitle;
  }
  if (![(NSString *)eventTitle isEqualToString:v12])
  {
LABEL_10:
    objc_storeStrong((id *)&self->_eventTitle, v12);
    [(UILabel *)self->_titleTextLabel setText:*p_eventTitle];
  }
  uint64_t v15 = [(id)objc_opt_class() _locationStringForResult:v33];
  p_eventLocation = &self->_eventLocation;
  eventLocation = self->_eventLocation;
  if (!eventLocation)
  {
    if ([v15 length]) {
      goto LABEL_15;
    }
    eventLocation = *p_eventLocation;
  }
  if (![(NSAttributedString *)eventLocation isEqualToAttributedString:v15])
  {
LABEL_15:
    objc_storeStrong((id *)&self->_eventLocation, v15);
    [(UILabel *)self->_locationTextLabel setAttributedText:v15];
  }
  [(UILabel *)self->_locationTextLabel setHidden:*p_eventLocation == 0];
  double v18 = [(id)objc_opt_class() _timeStringForResult:v33 usingTimeZone:0];
  p_eventTimeWithThisTimeZone = &self->_eventTimeWithThisTimeZone;
  eventTimeWithThisTimeZone = self->_eventTimeWithThisTimeZone;
  if (!eventTimeWithThisTimeZone)
  {
    if ([v18 length]) {
      goto LABEL_20;
    }
    eventTimeWithThisTimeZone = *p_eventTimeWithThisTimeZone;
  }
  if (![(NSString *)eventTimeWithThisTimeZone isEqualToString:v18])
  {
LABEL_20:
    objc_storeStrong((id *)&self->_eventTimeWithThisTimeZone, v18);
    [(UILabel *)self->_timeTextLabelWithThisTimeZone setText:v18];
  }
  [(UILabel *)self->_timeTextLabelWithThisTimeZone setHidden:*p_eventTimeWithThisTimeZone == 0];
  if (![(id)objc_opt_class() _shouldShowOtherTimeZoneForResult:v33])
  {
    [(UILabel *)self->_timeTextLabelWithResultTimeZone setHidden:1];
    goto LABEL_29;
  }
  v21 = objc_opt_class();
  __int16 v22 = [v33 timeZone];
  id v23 = [v21 _timeStringForResult:v33 usingTimeZone:v22];

  p_eventTimeWithResultTimeZone = &self->_eventTimeWithResultTimeZone;
  eventTimeWithResultTimeZone = self->_eventTimeWithResultTimeZone;
  if (eventTimeWithResultTimeZone)
  {
LABEL_23:
    if ([(NSString *)eventTimeWithResultTimeZone isEqualToString:v23]) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (![v23 length])
  {
    eventTimeWithResultTimeZone = *p_eventTimeWithResultTimeZone;
    goto LABEL_23;
  }
LABEL_27:
  objc_storeStrong((id *)&self->_eventTimeWithResultTimeZone, v23);
  [(UILabel *)self->_timeTextLabelWithResultTimeZone setText:v23];
LABEL_28:
  [(UILabel *)self->_timeTextLabelWithResultTimeZone setHidden:*p_eventTimeWithResultTimeZone == 0];

LABEL_29:
  uint64_t v26 = [(id)objc_opt_class() _inviteeStringForResult:v33];
  p_eventInvitees = &self->_eventInvitees;
  eventInvitees = self->_eventInvitees;
  if (!eventInvitees)
  {
    if ([v26 length]) {
      goto LABEL_33;
    }
    eventInvitees = *p_eventInvitees;
  }
  if (![(NSString *)eventInvitees isEqualToString:v26])
  {
LABEL_33:
    objc_storeStrong((id *)&self->_eventInvitees, v26);
    [(UILabel *)self->_inviteesTextLabel setText:v26];
  }
  [(UILabel *)self->_inviteesTextLabel setHidden:*p_eventInvitees == 0];
  uint64_t v29 = [(id)objc_opt_class() _foundInStringForResult:v33 pasteboardEvent:v4 == 4];
  p_eventFoundIn = &self->_eventFoundIn;
  eventFoundIn = self->_eventFoundIn;
  if (!eventFoundIn)
  {
    if ([v29 length]) {
      goto LABEL_38;
    }
    eventFoundIn = *p_eventFoundIn;
  }
  if (![(NSAttributedString *)eventFoundIn isEqualToAttributedString:v29])
  {
LABEL_38:
    objc_storeStrong((id *)&self->_eventFoundIn, v29);
    [(UILabel *)self->_foundInTextLabel setAttributedText:*p_eventFoundIn];
  }
  [(UILabel *)self->_foundInTextLabel setHidden:*p_eventFoundIn == 0];
  [(EKUIAutocompleteOccurrenceTableViewCell *)self setupConstraints];
}

+ (double)cellHeightForResult:(id)a3 forWidth:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 source];
  if (v7 == 4)
  {
    id v8 = [v6 pasteboardResults];
    uint64_t v9 = [v8 firstObject];

    id v6 = (id)v9;
  }
  long long v10 = [a1 primaryTextLabelFontForWidth:a4];
  uint64_t v11 = [a1 secondaryTextLabelFont];
  long long v12 = [a1 _locationStringForResult:v6];

  id v13 = [a1 _timeStringForResult:v6 usingTimeZone:0];

  uint64_t v14 = 1;
  if (v12) {
    uint64_t v14 = 2;
  }
  if (v13) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v12 != 0;
  }
  if ([a1 _shouldShowOtherTimeZoneForResult:v6])
  {
    v16 = [v6 timeZone];
    double v17 = [a1 _timeStringForResult:v6 usingTimeZone:v16];

    if (v17) {
      ++v15;
    }
  }
  BOOL v18 = v7 == 4;
  id v19 = [a1 _inviteeStringForResult:v6];

  if (v19) {
    uint64_t v20 = v15 + 1;
  }
  else {
    uint64_t v20 = v15;
  }
  v21 = [a1 _foundInStringForResult:v6 pasteboardEvent:v18];

  if (v21) {
    uint64_t v22 = v20 + 1;
  }
  else {
    uint64_t v22 = v20;
  }
  [a1 verticalSpacingTopToBaselineForTopLabelWithPrimaryFont:v10];
  double v24 = v23;
  [a1 verticalSpacingBottomToBaselineForBottomLabelWithPrimaryFont:v10];
  double v26 = v24 + v25;
  [a1 verticalSpacingTopToBaselineForBottomLabelWithSecondaryFont:v11];
  double v28 = v26 + (double)v22 * v27;
  [a1 rowSeparatorThickness];
  CalRoundToScreenScale(v28 + v29);
  double v31 = v30;

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekUIAutocompleteOccurrenceTableViewCellConstraints, 0);
  objc_storeStrong((id *)&self->_eventFoundIn, 0);
  objc_storeStrong((id *)&self->_eventInvitees, 0);
  objc_storeStrong((id *)&self->_eventTimeWithResultTimeZone, 0);
  objc_storeStrong((id *)&self->_eventTimeWithThisTimeZone, 0);
  objc_storeStrong((id *)&self->_eventLocation, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventCalendarColor, 0);
  objc_storeStrong((id *)&self->_secondaryLabels, 0);
  objc_storeStrong((id *)&self->_foundInTextLabel, 0);
  objc_storeStrong((id *)&self->_inviteesTextLabel, 0);
  objc_storeStrong((id *)&self->_timeTextLabelWithResultTimeZone, 0);
  objc_storeStrong((id *)&self->_timeTextLabelWithThisTimeZone, 0);
  objc_storeStrong((id *)&self->_locationTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);

  objc_storeStrong((id *)&self->_colorDotView, 0);
}

@end