@interface MKTransitDeparturesCell
+ (BOOL)_needsUpdateMaxLabelWidths;
+ (double)_maxExpectedDepartureLabelWidth;
+ (double)_minTextWidth;
+ (double)maxLineImageWidthforWidth:(double)a3;
+ (id)_attributedStringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5;
+ (id)_departureDetailLabelFont;
+ (id)_departureLabelFont;
+ (id)_nowString;
+ (id)_primaryFont;
+ (id)_stringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5;
+ (id)_stringFromTimestampDate:(id)a3 departureTimeZone:(id)a4;
+ (id)defaultSecondaryFont;
+ (id)displayableCountdowDepartureDatesFromDates:(id)a3 withReferenceDate:(id)a4;
+ (id)strongSecondaryFont;
+ (void)_addEmDashAttributes:(id)a3;
+ (void)_calculateMaxLabelWidths;
+ (void)_enumerateMinutesUntilDepartureDates:(id)a3 withReferenceDate:(id)a4 block:(id)a5;
+ (void)useCompressedGutter:(BOOL *)a3 compressedLeading:(BOOL *)a4 forImageWidth:(double)a5 inWidth:(double)a6;
- (BOOL)_isDisplayingDepartureInfo;
- (BOOL)_newStationCardUIEnabled;
- (BOOL)_shouldEnforceDepartureDependentConstraints;
- (BOOL)_shouldEnforceMinimumDepartureLabelWidth;
- (BOOL)_shouldPinSecondaryStackViewToBottom;
- (BOOL)isInactive;
- (BOOL)isOpaque;
- (BOOL)isShowingIncidentIcon;
- (BOOL)isShowingNoConnectionEmDash;
- (BOOL)useCompressedGutter;
- (BOOL)useCompressedLeading;
- (BOOL)useMultilineDeparturesLabel;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MKTransitDeparturesCell)initWithReuseIdentifier:(id)a3;
- (MKTransitDeparturesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MKTransitDeparturesCellDelegate)delegate;
- (NSArray)departures;
- (NSDate)countdownReferenceDate;
- (NSDate)departureCutoffDate;
- (NSString)frequency;
- (NSString)incidentTitle;
- (NSString)operatingHours;
- (NSTimeZone)departureTimeZone;
- (double)_baselineSpacingAboveView:(id)a3;
- (double)_labelMarginWithLineImageViewWidth:(double)a3;
- (double)_labelToBottomScaledConstantForFullCenteredCellStyle;
- (double)_labelToTopScaledConstantForFullCenteredCellStyle;
- (double)_separatorHeight;
- (double)labelMargin;
- (double)lineImageViewSize;
- (id)_constraintsForCellStyle:(unint64_t)a3;
- (id)_departureDates;
- (id)_fontForView:(id)a3;
- (id)_incidentIcon;
- (id)_operatingHoursDescriptionForSequence:(id)a3 mapItem:(id)a4 useNewLineDelimeter:(BOOL)a5;
- (id)_startEndDatesForSequence:(id)a3 date:(id)a4 mapItem:(id)a5;
- (id)multipartStringSeparator;
- (unint64_t)_bestCellStyleForCurrentState;
- (unint64_t)_displayableDeparturesCount;
- (unint64_t)departureStyle;
- (void)_addIncidentIcon;
- (void)_commonInit;
- (void)_contentSizeCategoryDidChange;
- (void)_getDepartureDependentConstraintsToActivate:(id *)a3 toDeactivate:(id *)a4;
- (void)_incidentButtonPressed;
- (void)_removeIncidentIcon;
- (void)_setCellStyle:(unint64_t)a3;
- (void)_updateConstraintValues;
- (void)_updateDepartureDependentConstraintsForCurrentState;
- (void)_updateLabelFonts;
- (void)_updateLineImageViewConstraintConstants;
- (void)configureCellForRowIndex:(int64_t)a3 withMapItem:(id)a4 sectionController:(id)a5 outNextLineIsSame:(BOOL *)a6;
- (void)configureLeadingWithTableViewContentMargin:(double)a3 width:(double)a4;
- (void)dealloc;
- (void)infoCardThemeChanged;
- (void)layoutSubviews;
- (void)refreshDeparturesDisplay;
- (void)setAccessibilityOrder;
- (void)setCountdownReferenceDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepartureCutoffDate:(id)a3;
- (void)setDepartureStyle:(unint64_t)a3;
- (void)setDepartureTimeZone:(id)a3;
- (void)setDepartures:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setInactive:(BOOL)a3;
- (void)setIncidentButtonHidden:(BOOL)a3;
- (void)setIncidentTitle:(id)a3;
- (void)setLineImage:(id)a3;
- (void)setLineImageViewSize:(double)a3;
- (void)setOperatingHours:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setShowDisclosureArrow:(BOOL)a3;
- (void)setShowIncidentIcon:(BOOL)a3;
- (void)setShowNoConnectionEmDash:(BOOL)a3;
- (void)setShowNoConnectionEnDash:(BOOL)a3;
- (void)setTertiaryText:(id)a3;
- (void)setUseCompressedGutter:(BOOL)a3;
- (void)setUseCompressedLeading:(BOOL)a3;
- (void)setUseMultilineDeparturesLabel:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation MKTransitDeparturesCell

- (id)multipartStringSeparator
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  v3 = _MKLocalizedStringFromThisBundle(@"Departures_Cell_Secondary_Separator");
  v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (void)configureLeadingWithTableViewContentMargin:(double)a3 width:(double)a4
{
  __int16 v5 = 0;
  [(MKTransitDeparturesCell *)self lineImageViewSize];
  +[MKTransitDeparturesCell useCompressedGutter:compressedLeading:forImageWidth:inWidth:](MKTransitDeparturesCell, "useCompressedGutter:compressedLeading:forImageWidth:inWidth:", (char *)&v5 + 1, &v5);
  [(MKTransitDeparturesCell *)self setUseCompressedLeading:v5];
  [(MKTransitDeparturesCell *)self setUseCompressedGutter:HIBYTE(v5)];
}

- (id)_startEndDatesForSequence:(id)a3 date:(id)a4 mapItem:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [a5 timeZone];
  v10 = [v7 operatingHoursForDate:v8 inTimeZone:v9];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "startDate", (void)v21);
        [v11 addObject:v18];

        v19 = [v17 endDate];
        [v11 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)_operatingHoursDescriptionForSequence:(id)a3 mapItem:(id)a4 useNewLineDelimeter:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 departureTimeDisplayStyle] == 3
    && ([v8 operatingHours],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 firstObject],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    id v12 = [(MKTransitDeparturesCell *)self departureCutoffDate];
    uint64_t v13 = [(MKTransitDeparturesCell *)self _startEndDatesForSequence:v8 date:v12 mapItem:v9];

    uint64_t v14 = [v9 timeZone];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v16 = [v18 timeZone];
    }
    if (v5) {
      objc_msgSend(NSString, "_navigation_formattedStringForHourRanges:timeZone:delimeter:", v13, v16, @"\n");
    }
    else {
    v17 = objc_msgSend(NSString, "_navigation_formattedStringForHourRanges:timeZone:", v13, v16);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)configureCellForRowIndex:(int64_t)a3 withMapItem:(id)a4 sectionController:(id)a5 outNextLineIsSame:(BOOL *)a6
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  char v94 = 1;
  [(MKTransitDeparturesCell *)self setInactive:0];
  [(MKTransitDeparturesCell *)self setFrequency:0];
  [(MKTransitDeparturesCell *)self setOperatingHours:0];
  id v12 = [[MKTransitItemIncidentsController alloc] initWithMapItem:v10];
  uint64_t v13 = [(MKTransitDeparturesCell *)self departureCutoffDate];
  [(MKTransitItemIncidentsController *)v12 setReferenceDate:v13];

  BOOL v14 = [(MKTransitDeparturesCell *)self _newStationCardUIEnabled];
  [(MKTransitDeparturesCell *)self setUseMultilineDeparturesLabel:v14];
  if (a3 != -1 || !v14)
  {
    uint64_t v26 = [v11 sequenceForRow:a3 outIsNewLine:&v94 outNextLineIsSame:a6];
    uint64_t v79 = [v26 displayStyle];
    uint64_t v87 = [v26 line];
    -[MKTransitDeparturesCell setDepartureStyle:](self, "setDepartureStyle:", [v26 departureTimeDisplayStyle]);
    v27 = [(MKTransitDeparturesCell *)self departureCutoffDate];
    v28 = [v26 departuresValidForDate:v27];

    [(MKTransitDeparturesCell *)self setDepartures:v28];
    v29 = [(MKTransitItemIncidentsController *)v12 incidentsForDepartureSequence:v26];
    v83 = [v29 firstObject];

    if (!v14)
    {
      if (v83)
      {
        v30 = [v83 messageForRouteStepping];
        if (v30)
        {
          [(MKTransitDeparturesCell *)self setIncidentTitle:v30];
        }
        else
        {
          v31 = [v83 title];
          [(MKTransitDeparturesCell *)self setIncidentTitle:v31];
        }
      }
      else
      {
        [(MKTransitDeparturesCell *)self setIncidentTitle:0];
      }
    }
    v32 = [v26 line];
    v33 = [v32 name];

    v84 = [(MKTransitDeparturesCell *)self _operatingHoursDescriptionForSequence:v26 mapItem:v10 useNewLineDelimeter:v14];
    if ([v84 length])
    {
      v89 = 0;
    }
    else
    {
      v89 = [v11 serviceGapDescriptionForRow:a3];
    }
    v85 = [MEMORY[0x1E4F1CA48] array];
    v80 = v28;
    id v81 = v10;
    v82 = v33;
    if (![v11 departuresAreVehicleSpecific])
    {
      if (v14)
      {
        v40 = [v26 displayName];
        [(MKTransitDeparturesCell *)self setPrimaryText:v40];

        v41 = v84;
        if ([v84 length]) {
LABEL_66:
        }
          [(MKTransitDeparturesCell *)self setOperatingHours:v41];
LABEL_68:
        if (![v89 length])
        {
          v61 = [(MKTransitDeparturesCell *)self countdownReferenceDate];
          int v62 = [v26 hasFrequencyAtDate:v61];

          if (v62)
          {
            v63 = NSString;
            v64 = [(MKTransitDeparturesCell *)self countdownReferenceDate];
            v65 = [v26 frequencyToDescribeAtDate:v64];
            v66 = objc_msgSend(v63, "_navigation_formattedDescriptionForFrequency:", v65);

            if ([v66 length])
            {
              if (v14)
              {
                [(MKTransitDeparturesCell *)self setFrequency:v66];
              }
              else
              {
                v67 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v66];
                [v85 addObject:v67];
              }
            }
          }
        }
        if ([v85 count])
        {
          v68 = [(MKTransitDeparturesCell *)self multipartStringSeparator];
          v69 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v85 repeatedSeparator:v68];
        }
        else
        {
          v69 = 0;
        }
        v70 = v26;
        [(MKTransitDeparturesCell *)self setSecondaryText:v69];
        if (v89)
        {
          v95 = v89;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
          v72 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED919588];
          v73 = +[MKMultiPartAttributedString multiPartAttributedStringWithComponents:v71 repeatedSeparator:v72];
        }
        else
        {
          v73 = 0;
        }
        id v74 = v11;
        [(MKTransitDeparturesCell *)self setTertiaryText:v73];
        if (v14)
        {
          [(MKTransitDeparturesCell *)self setLineImage:0];
          [(MKTransitDeparturesCell *)self setShowIncidentIcon:0];
          v17 = v70;
          v75 = v83;
        }
        else
        {
          v75 = v83;
          v76 = [(MKTransitDeparturesCell *)self delegate];
          v77 = [v76 imageForTransitLine:v87];

          [(MKTransitDeparturesCell *)self setLineImage:v77];
          [(MKTransitDeparturesCell *)self setShowIncidentIcon:v83 != 0];

          v17 = v70;
        }

        uint64_t v15 = (void *)v87;
        id v11 = v74;
        id v10 = v81;
        goto LABEL_85;
      }
      v41 = v84;
      if (![v33 length] || v79 != 1)
      {
        v58 = [v26 headsign];
        [(MKTransitDeparturesCell *)self setPrimaryText:v58];

        if (v79 != 2 || ![v33 length]) {
          goto LABEL_64;
        }
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v33];
        [v85 addObject:v34];
        goto LABEL_63;
      }
      [(MKTransitDeparturesCell *)self setPrimaryText:v33];
      v42 = [v26 headsign];
      uint64_t v43 = [v42 length];

      if (!v43)
      {
LABEL_64:
        if (![v41 length]) {
          goto LABEL_68;
        }
        if (v14) {
          goto LABEL_66;
        }
        v60 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v41];
        [v85 addObject:v60];

        goto LABEL_68;
      }
      id v44 = objc_alloc(MEMORY[0x1E4F28B18]);
      v34 = [v26 headsign];
      v39 = (__CFString *)[v44 initWithString:v34];
      [v85 addObject:v39];
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    v34 = [v28 firstObject];
    v35 = [v34 vehicleIdentifier];
    uint64_t v36 = [v35 length];
    uint64_t v37 = [v33 length];
    v78 = v35;
    if (v36)
    {
      if (v37) {
        char v38 = v14;
      }
      else {
        char v38 = 1;
      }
      if (v38)
      {
        v39 = v35;
      }
      else
      {
        v45 = NSString;
        v46 = _MKLocalizedStringFromThisBundle(@"train number line name format");
        [v34 vehicleIdentifier];
        v48 = v47 = v26;
        objc_msgSend(v45, "stringWithFormat:", v46, v48, v82, v78);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

        uint64_t v26 = v47;
      }
      v41 = v84;
    }
    else
    {
      v41 = v84;
      if (v37) {
        v39 = v33;
      }
      else {
        v39 = &stru_1ED919588;
      }
    }
    if (![v41 length])
    {
      uint64_t v49 = [v11 serviceGapDescriptionForRow:a3];

      v89 = (void *)v49;
    }
    if ([(__CFString *)v39 length] && v79 == 1)
    {
      [(MKTransitDeparturesCell *)self setPrimaryText:v39];
      v50 = [v26 headsign];
      uint64_t v51 = [v50 length];

      if (v51)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F28B18]);
        v53 = [v26 headsign];
        v54 = (void *)[v52 initWithString:v53];
        [v85 addObject:v54];

LABEL_60:
      }
    }
    else
    {
      if (v14)
      {
        v55 = [v34 displayName];
        v56 = v55;
        if (v55)
        {
          id v57 = v55;
        }
        else
        {
          id v57 = [v26 displayName];
        }
        v53 = v57;

        [(MKTransitDeparturesCell *)self setPrimaryText:v53];
        goto LABEL_60;
      }
      v59 = [v26 headsign];
      [(MKTransitDeparturesCell *)self setPrimaryText:v59];

      if ([(__CFString *)v39 length])
      {
        v53 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v39];
        [v85 addObject:v53];
        goto LABEL_60;
      }
    }

    goto LABEL_62;
  }
  uint64_t v15 = [v11 sequenceForRow:0 outIsNewLine:&v94 outNextLineIsSame:a6];
  id v16 = [(MKTransitDeparturesCell *)self delegate];
  v17 = [v16 imageForDepartureSequence:v15];

  [(MKTransitDeparturesCell *)self setLineImage:v17];
  [(MKTransitDeparturesCell *)self setIncidentTitle:0];
  [(MKTransitDeparturesCell *)self setDepartures:MEMORY[0x1E4F1CBF0]];
  [(MKTransitDeparturesCell *)self setSecondaryText:0];
  [(MKTransitDeparturesCell *)self setTertiaryText:0];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v18 = [v11 sequences];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (v19)
  {
    v86 = v15;
    v88 = v17;
    id v20 = v11;
    id v21 = v10;
    uint64_t v22 = *(void *)v91;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v91 != v22) {
          objc_enumerationMutation(v18);
        }
        long long v24 = [(MKTransitItemIncidentsController *)v12 incidentsForDepartureSequence:*(void *)(*((void *)&v90 + 1) + 8 * i)];
        uint64_t v25 = [v24 count];

        if (v25)
        {
          uint64_t v19 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v19) {
        continue;
      }
      break;
    }
LABEL_17:
    id v10 = v21;
    id v11 = v20;
    uint64_t v15 = v86;
    v17 = v88;
  }

  [(MKTransitDeparturesCell *)self setShowIncidentIcon:v19];
LABEL_85:
}

- (MKTransitDeparturesCell)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  v3 = [(MKCustomSeparatorCell *)&v6 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(MKTransitDeparturesCell *)v3 _commonInit];
  }
  return v4;
}

- (MKTransitDeparturesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(MKTransitDeparturesCell *)self initWithReuseIdentifier:a4];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MKTransitDeparturesCell;
  [(MKTransitDeparturesCell *)&v4 dealloc];
}

- (void)setInactive:(BOOL)a3
{
  if (self->_inactive != a3)
  {
    self->_inactive = a3;
    if (a3)
    {
      objc_super v4 = [(MKMultiPartLabel *)self->_secondaryLabel textColor];
      [(_MKUILabel *)self->_primaryLabel setTextColor:v4];
    }
    else
    {
      objc_super v4 = [(UIView *)self mk_theme];
      BOOL v5 = [v4 textColor];
      [(_MKUILabel *)self->_primaryLabel setTextColor:v5];
    }
    [(MKTransitDeparturesCell *)self _updateConstraintValues];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitDeparturesCell;
  [(MKTransitDeparturesCell *)&v8 setSelected:a3 animated:a4];
  if (v4) {
    [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
  }
  else {
  objc_super v6 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  id v7 = [(MKTransitDeparturesCell *)self contentView];
  [v7 setBackgroundColor:v6];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKTransitDeparturesCell;
  [(MKTransitDeparturesCell *)&v8 setHighlighted:a3 animated:a4];
  if (v4) {
    [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
  }
  else {
  objc_super v6 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  id v7 = [(MKTransitDeparturesCell *)self contentView];
  [v7 setBackgroundColor:v6];
}

- (void)_commonInit
{
  v100[1] = *MEMORY[0x1E4F143B8];
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
  {
    BOOL v4 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
    BOOL v5 = [(MKTransitDeparturesCell *)self contentView];
    [v5 setBackgroundColor:v4];
  }
  else
  {
    LODWORD(v3) = 1148846080;
    [(UIImageView *)self->_lineImageView _mapkit_setContentCompressionResistancePriority:1 forAxis:v3];
  }
  objc_super v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [(MKTransitDeparturesCell *)self setAccessibilityIdentifier:v7];

  objc_super v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
  lineImageView = self->_lineImageView;
  self->_lineImageView = v8;

  [(UIImageView *)self->_lineImageView setAccessibilityIdentifier:@"LineImageView"];
  BOOL v10 = [(MKTransitDeparturesCell *)self _newStationCardUIEnabled];
  id v11 = self->_lineImageView;
  if (v10)
  {
    id v12 = [(UIImageView *)v11 heightAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:24.0];
    lineImageViewHeightConstraint = self->_lineImageViewHeightConstraint;
    self->_lineImageViewHeightConstraint = v13;

    LODWORD(v15) = 1144750080;
    [(NSLayoutConstraint *)self->_lineImageViewHeightConstraint setPriority:v15];
    [(NSLayoutConstraint *)self->_lineImageViewHeightConstraint setActive:0];
    id v11 = self->_lineImageView;
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 4;
  }
  [(UIImageView *)v11 setContentMode:v16];
  v17 = [(UIView *)self mk_theme];
  v18 = [v17 lightTextColor];
  [(UIImageView *)self->_lineImageView setTintColor:v18];

  uint64_t v19 = objc_alloc_init(_MKUILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v19;

  [(_MKUILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(_MKUILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_primaryLabel setTextAlignment:4];
  [(_MKUILabel *)self->_primaryLabel set_mapkit_themeColorProvider:&__block_literal_global_88];
  LODWORD(v21) = 1148846080;
  [(UIView *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v21];
  LODWORD(v22) = 1132068864;
  [(UIView *)self->_primaryLabel _mapkit_setContentHuggingPriority:0 forAxis:v22];
  LODWORD(v23) = 1148846080;
  [(UIView *)self->_primaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v23];
  long long v24 = [(MKTransitDeparturesCell *)self contentView];
  [v24 addSubview:self->_primaryLabel];

  uint64_t v25 = objc_alloc_init(MKThemeMultiPartLabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v25;

  [(MKThemeMultiPartLabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(MKThemeMultiPartLabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKMultiPartLabel *)self->_secondaryLabel setTextAlignment:4];
  double v27 = *MEMORY[0x1E4F437F8];
  double v28 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v29 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v30 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  -[MKMultiPartLabel setTextInset:](self->_secondaryLabel, "setTextInset:", *MEMORY[0x1E4F437F8], v28, v29, v30);
  [(MKThemeMultiPartLabel *)self->_secondaryLabel set_mapkit_themeColorProvider:&__block_literal_global_19_0];
  LODWORD(v31) = 1148846080;
  [(UIView *)self->_secondaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v31];
  LODWORD(v32) = 1132068864;
  [(UIView *)self->_secondaryLabel _mapkit_setContentHuggingPriority:0 forAxis:v32];
  LODWORD(v33) = 1144750080;
  [(UIView *)self->_secondaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v33];
  v34 = objc_alloc_init(MKThemeMultiPartLabel);
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v34;

  [(MKThemeMultiPartLabel *)self->_tertiaryLabel setAccessibilityIdentifier:@"TertiaryLabel"];
  [(MKThemeMultiPartLabel *)self->_tertiaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKMultiPartLabel *)self->_tertiaryLabel setTextAlignment:4];
  -[MKMultiPartLabel setTextInset:](self->_tertiaryLabel, "setTextInset:", v27, v28, v29, v30);
  [(MKThemeMultiPartLabel *)self->_tertiaryLabel set_mapkit_themeColorProvider:&__block_literal_global_24_0];
  LODWORD(v36) = 1148846080;
  [(UIView *)self->_tertiaryLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v36];
  LODWORD(v37) = 1132068864;
  [(UIView *)self->_tertiaryLabel _mapkit_setContentHuggingPriority:0 forAxis:v37];
  LODWORD(v38) = 1144750080;
  [(UIView *)self->_tertiaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v38];
  [(MKThemeMultiPartLabel *)self->_tertiaryLabel setHidden:1];
  v39 = objc_alloc_init(_MKUILabel);
  departureLabel = self->_departureLabel;
  self->_departureLabel = v39;

  [(_MKUILabel *)self->_departureLabel setAccessibilityIdentifier:@"DepartureLabel"];
  [(_MKUILabel *)self->_departureLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_departureLabel set_mapkit_themeColorProvider:&__block_literal_global_29];
  LODWORD(v41) = 1148846080;
  [(UIView *)self->_departureLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v41];
  v42 = objc_alloc_init(_MKUILabel);
  departureDetailLabel = self->_departureDetailLabel;
  self->_departureDetailLabel = v42;

  [(_MKUILabel *)self->_departureDetailLabel setAccessibilityIdentifier:@"DepartureDetailLabel"];
  [(_MKUILabel *)self->_departureDetailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_departureDetailLabel setHidden:1];
  LODWORD(v44) = 1148846080;
  [(UIView *)self->_departureDetailLabel _mapkit_setContentCompressionResistancePriority:1 forAxis:v44];
  LODWORD(v45) = 1148846080;
  [(UIView *)self->_departureLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v45];
  LODWORD(v46) = 1148846080;
  [(UIView *)self->_departureDetailLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v46];
  id v47 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v47 setAccessibilityIdentifier:@"LineImageContainer"];
  [(UIImageView *)self->_lineImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v47 addSubview:self->_lineImageView];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  v48 = [(MKTransitDeparturesCell *)self contentView];
  v98 = v47;
  [v48 addSubview:v47];

  uint64_t v49 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward"];
  v50 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v51 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890]];
  uint64_t v99 = *MEMORY[0x1E4F43940];
  id v52 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43930]];
  v100[0] = v52;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:&v99 count:1];
  v54 = [v51 fontDescriptorByAddingAttributes:v53];
  v55 = [v50 fontWithDescriptor:v54 size:0.0];

  v56 = [MEMORY[0x1E4F42A98] configurationWithFont:v55];
  id v57 = [v49 imageWithConfiguration:v56];

  v58 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v57];
  disclosureArrowImageView = self->_disclosureArrowImageView;
  self->_disclosureArrowImageView = v58;

  [(UIImageView *)self->_disclosureArrowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v60 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
  [(UIImageView *)self->_disclosureArrowImageView setTintColor:v60];

  LODWORD(v61) = 1148846080;
  [(UIImageView *)self->_disclosureArrowImageView _mapkit_setContentCompressionResistancePriority:1 forAxis:v61];
  LODWORD(v62) = 1148846080;
  [(UIImageView *)self->_disclosureArrowImageView _mapkit_setContentCompressionResistancePriority:0 forAxis:v62];
  LODWORD(v63) = 1148846080;
  [(UIImageView *)self->_disclosureArrowImageView _mapkit_setContentHuggingPriority:1 forAxis:v63];
  LODWORD(v64) = 1148846080;
  [(UIImageView *)self->_disclosureArrowImageView _mapkit_setContentHuggingPriority:0 forAxis:v64];
  v65 = [(MKTransitDeparturesCell *)self contentView];
  [v65 addSubview:self->_disclosureArrowImageView];

  [(_MKUILabel *)self->_primaryLabel setAccessibilityElementsHidden:1];
  [(MKThemeMultiPartLabel *)self->_secondaryLabel setAccessibilityElementsHidden:1];
  [(MKThemeMultiPartLabel *)self->_tertiaryLabel setAccessibilityElementsHidden:1];
  [(_MKUILabel *)self->_departureLabel setAccessibilityElementsHidden:1];
  [(_MKUILabel *)self->_departureDetailLabel setAccessibilityElementsHidden:1];
  [(_MKUILabel *)self->_primaryLabel setNumberOfLines:0];
  [(MKMultiPartLabel *)self->_secondaryLabel setNumberOfLines:0];
  [(MKMultiPartLabel *)self->_tertiaryLabel setNumberOfLines:0];
  id v66 = objc_alloc(MEMORY[0x1E4F42E20]);
  uint64_t v67 = MEMORY[0x1E4F1CBF0];
  v68 = (UIStackView *)[v66 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  secondaryTextStackView = self->_secondaryTextStackView;
  self->_secondaryTextStackView = v68;

  [(UIStackView *)self->_secondaryTextStackView setAccessibilityIdentifier:@"SecondaryTextStackView"];
  [(UIStackView *)self->_secondaryTextStackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_secondaryTextStackView setAlignment:1];
  v70 = (UIStackView *)[objc_alloc(MEMORY[0x1E4F42E20]) initWithArrangedSubviews:v67];
  departureStackView = self->_departureStackView;
  self->_departureStackView = v70;

  [(UIStackView *)self->_departureStackView setAccessibilityIdentifier:@"DepartureStackView"];
  [(UIStackView *)self->_departureStackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_departureStackView setAlignment:4];
  v72 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  [v72 contentInsets];
  double v74 = v73;
  [v72 contentInsets];
  objc_msgSend(v72, "setContentInsets:", v74, 0.0);
  v75 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v72 primaryAction:0];
  incidentButton = self->_incidentButton;
  self->_incidentButton = v75;

  v77 = [(MKTransitDeparturesCell *)self traitCollection];
  uint64_t v78 = [v77 userInterfaceIdiom];

  if (v78 == 5)
  {
    [(UIButton *)self->_incidentButton setPreferredBehavioralStyle:1];
    uint64_t v79 = self->_incidentButton;
    v80 = [(MKTransitDeparturesCell *)self tintColor];
    [(UIButton *)v79 setTitleColor:v80 forState:0];
  }
  id v81 = [(id)objc_opt_class() defaultSecondaryFont];
  v82 = [(UIButton *)self->_incidentButton titleLabel];
  [v82 setFont:v81];

  if (MKIsHostedInSiri())
  {
    [(UIButton *)self->_incidentButton setEnabled:0];
    v83 = self->_incidentButton;
    v84 = [(UIView *)self mk_theme];
    v85 = [v84 lightTextColor];
    [(UIButton *)v83 setTitleColor:v85 forState:2];
  }
  v86 = [(UIButton *)self->_incidentButton titleLabel];
  [v86 setNumberOfLines:2];

  uint64_t v87 = [(UIButton *)self->_incidentButton titleLabel];
  [v87 setLineBreakMode:4];

  v88 = [(UIButton *)self->_incidentButton titleLabel];
  [v88 setTextAlignment:4];

  [(UIButton *)self->_incidentButton setContentHorizontalAlignment:4];
  [(UIButton *)self->_incidentButton addTarget:self action:sel__incidentButtonPressed forControlEvents:64];
  [(UIStackView *)self->_secondaryTextStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_secondaryTextStackView set_mk_axis:1];
  [(UIStackView *)self->_secondaryTextStackView setDistribution:0];
  v89 = [(MKTransitDeparturesCell *)self contentView];
  [v89 addSubview:self->_secondaryTextStackView];

  [(UIStackView *)self->_departureStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_departureStackView set_mk_axis:1];
  [(UIStackView *)self->_departureStackView setDistribution:0];
  long long v90 = [(MKTransitDeparturesCell *)self contentView];
  [v90 addSubview:self->_departureStackView];

  LODWORD(v91) = 1148813312;
  [(UIStackView *)self->_secondaryTextStackView _mapkit_setContentCompressionResistancePriority:0 forAxis:v91];
  LODWORD(v92) = 1148829696;
  [(UIStackView *)self->_secondaryTextStackView _mapkit_setContentCompressionResistancePriority:1 forAxis:v92];
  LODWORD(v93) = 1148846080;
  [(UIStackView *)self->_secondaryTextStackView _mapkit_setContentHuggingPriority:1 forAxis:v93];
  LODWORD(v94) = 1132068864;
  [(UIStackView *)self->_secondaryTextStackView _mapkit_setContentHuggingPriority:0 forAxis:v94];
  LODWORD(v95) = 1148846080;
  [(UIStackView *)self->_departureStackView _mapkit_setContentCompressionResistancePriority:1 forAxis:v95];
  LODWORD(v96) = 1148846080;
  [(UIStackView *)self->_departureStackView _mapkit_setContentCompressionResistancePriority:0 forAxis:v96];
  [(UIButton *)self->_incidentButton setHidden:1];
  [(UIButton *)self->_incidentButton setEnabled:MKIsHostedInSiri() ^ 1];
  [(UIButton *)self->_incidentButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKTransitDeparturesCell *)self setSeparatorHidden:0];
  [(MKTransitDeparturesCell *)self setUseCompressedGutter:0];
  [(MKTransitDeparturesCell *)self setUseCompressedLeading:0];
  uint64_t v97 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v97 addObserver:self selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

  [(MKTransitDeparturesCell *)self _updateLabelFonts];
  [(MKTransitDeparturesCell *)self _setCellStyle:0];
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 lightTextColor];
}

uint64_t __38__MKTransitDeparturesCell__commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

- (void)updateConstraints
{
  constraintsByCellStyle = self->_constraintsByCellStyle;
  if (!constraintsByCellStyle)
  {
    BOOL v4 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    BOOL v5 = self->_constraintsByCellStyle;
    self->_constraintsByCellStyle = v4;

    constraintsByCellStyle = self->_constraintsByCellStyle;
  }
  objc_super v6 = [NSNumber numberWithUnsignedInteger:self->_cellStyle];
  id v7 = [(NSMutableDictionary *)constraintsByCellStyle objectForKeyedSubscript:v6];

  p_currentCellStyleConstraints = (id *)&self->_currentCellStyleConstraints;
  currentCellStyleConstraints = self->_currentCellStyleConstraints;
  if (v7) {
    BOOL v10 = v7 == currentCellStyleConstraints;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    if (currentCellStyleConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      id v11 = *p_currentCellStyleConstraints;
      id *p_currentCellStyleConstraints = 0;
    }
    if (!v7)
    {
      [(NSMutableDictionary *)self->_constraintsByCellStyle removeAllObjects];
      id v7 = [(MKTransitDeparturesCell *)self _constraintsForCellStyle:self->_cellStyle];
      id v12 = self->_constraintsByCellStyle;
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:self->_cellStyle];
      [(NSMutableDictionary *)v12 setObject:v7 forKeyedSubscript:v13];
    }
    objc_storeStrong(p_currentCellStyleConstraints, v7);
    [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  }
  [(MKTransitDeparturesCell *)self _updateConstraintValues];
  v14.receiver = self;
  v14.super_class = (Class)MKTransitDeparturesCell;
  [(MKTransitDeparturesCell *)&v14 updateConstraints];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  [(MKTransitDeparturesCell *)&v6 layoutSubviews];
  double v3 = [(MKTransitDeparturesCell *)self contentView];
  [v3 layoutSubviews];

  unint64_t v4 = [(MKTransitDeparturesCell *)self _bestCellStyleForCurrentState];
  if (v4 != self->_cellStyle)
  {
    [(MKTransitDeparturesCell *)self _setCellStyle:v4];
    [(MKTransitDeparturesCell *)self updateConstraints];
    v5.receiver = self;
    v5.super_class = (Class)MKTransitDeparturesCell;
    [(MKTransitDeparturesCell *)&v5 layoutSubviews];
  }
}

- (void)setUseMultilineDeparturesLabel:(BOOL)a3
{
  if (self->_useMultilineDeparturesLabel != a3)
  {
    self->_useMultilineDeparturesLabel = a3;
    [(_MKUILabel *)self->_departureLabel setNumberOfLines:!a3];
  }
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)_contentSizeCategoryDidChange
{
  double v3 = (void *)qword_1EB315B68;
  qword_1EB315B68 = 0;

  unint64_t v4 = (void *)qword_1EB315B70;
  qword_1EB315B70 = 0;

  objc_super v5 = (void *)qword_1EB315B80;
  qword_1EB315B80 = 0;

  objc_super v6 = (void *)qword_1EB315B88;
  qword_1EB315B88 = 0;

  id v7 = (void *)qword_1EB315B70;
  qword_1EB315B70 = 0;

  objc_super v8 = (void *)qword_1EB315B78;
  qword_1EB315B78 = 0;

  [(MKTransitDeparturesCell *)self _updateLabelFonts];

  [(MKTransitDeparturesCell *)self _updateConstraintValues];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  unint64_t cellStyle = self->_cellStyle;
  unint64_t v11 = [(MKTransitDeparturesCell *)self _bestCellStyleForCurrentState];
  if (v11 != cellStyle)
  {
    [(MKTransitDeparturesCell *)self _setCellStyle:v11];
    [(UIView *)self _mapkit_updateConstraintsIfNeeded];
  }
  v16.receiver = self;
  v16.super_class = (Class)MKTransitDeparturesCell;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  -[MKTransitDeparturesCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v16, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v12, v13);
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (unint64_t)_bestCellStyleForCurrentState
{
  double v3 = [MEMORY[0x1E4F42738] sharedApplication];
  unint64_t v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    unint64_t v5 = 2;
    goto LABEL_11;
  }
  objc_super v6 = [(MKMultiPartLabel *)self->_secondaryLabel text];
  if ([v6 length]) {
    goto LABEL_6;
  }
  id v7 = [(MKMultiPartLabel *)self->_tertiaryLabel text];
  if ([v7 length])
  {

LABEL_6:
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  int v12 = [(UIButton *)self->_incidentButton isHidden];

  if (!v12) {
    goto LABEL_7;
  }
  [(_MKUILabel *)self->_primaryLabel bounds];
  double v14 = v13;
  -[_MKUILabel textRectForBounds:limitedToNumberOfLines:](self->_primaryLabel, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0);
  double v16 = v15;
  -[_MKUILabel textRectForBounds:limitedToNumberOfLines:](self->_primaryLabel, "textRectForBounds:limitedToNumberOfLines:", 1, 0.0, 0.0, v14, 1.79769313e308);
  BOOL v8 = v16 == v17;
LABEL_8:
  id v9 = [(_MKUILabel *)self->_departureDetailLabel attributedText];
  uint64_t v10 = [v9 length];

  if (v10) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = v8;
  }
LABEL_11:

  return v5;
}

- (void)_setCellStyle:(unint64_t)a3
{
  v34[3] = *MEMORY[0x1E4F143B8];
  self->_unint64_t cellStyle = a3;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      [(_MKUILabel *)self->_primaryLabel removeFromSuperview];
      [(_MKUILabel *)self->_departureLabel setTextAlignment:4];
      [(_MKUILabel *)self->_departureDetailLabel setTextAlignment:4];
      LODWORD(v16) = 1148829696;
      [(UIView *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v16];
      LODWORD(v17) = 1148829696;
      [(UIView *)self->_secondaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v17];
      LODWORD(v18) = 1148829696;
      [(UIView *)self->_tertiaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v18];
      LODWORD(v19) = 1148829696;
      [(UIView *)self->_departureLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v19];
      LODWORD(v20) = 1148829696;
      [(UIView *)self->_departureDetailLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v20];
      LODWORD(v21) = 1148829696;
      [(UIView *)self->_primaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v21];
      LODWORD(v22) = 1148846080;
      [(UIView *)self->_secondaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v22];
      LODWORD(v23) = 1148846080;
      [(UIView *)self->_tertiaryLabel _mapkit_setContentHuggingPriority:1 forAxis:v23];
      LODWORD(v24) = 1148846080;
      [(UIView *)self->_departureLabel _mapkit_setContentHuggingPriority:1 forAxis:v24];
      LODWORD(v25) = 1148846080;
      [(UIView *)self->_departureDetailLabel _mapkit_setContentHuggingPriority:1 forAxis:v25];
      secondaryTextStackView = self->_secondaryTextStackView;
      secondaryLabel = self->_secondaryLabel;
      departureLabel = self->_departureLabel;
      departureDetailLabel = self->_departureDetailLabel;
      v32[0] = self->_primaryLabel;
      v32[1] = secondaryLabel;
      v32[2] = departureLabel;
      v32[3] = departureDetailLabel;
      incidentButton = self->_incidentButton;
      v32[4] = self->_tertiaryLabel;
      v32[5] = incidentButton;
      double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:6];
      [(UIStackView *)secondaryTextStackView _mapkit_setArrangedSubviews:v31];

      [(UIStackView *)self->_departureStackView _mapkit_setArrangedSubviews:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    unint64_t v4 = [(MKTransitDeparturesCell *)self contentView];
    [v4 addSubview:self->_primaryLabel];

    if (MKApplicationLayoutDirectionIsRightToLeft()) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 2;
    }
    [(_MKUILabel *)self->_departureLabel setTextAlignment:v5];
    [(_MKUILabel *)self->_departureDetailLabel setTextAlignment:[(_MKUILabel *)self->_departureLabel textAlignment]];
    objc_super v6 = self->_secondaryTextStackView;
    tertiaryLabel = self->_tertiaryLabel;
    v34[0] = self->_secondaryLabel;
    v34[1] = tertiaryLabel;
    v34[2] = self->_incidentButton;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    [(UIStackView *)v6 _mapkit_setArrangedSubviews:v8];

    departureStackView = self->_departureStackView;
    uint64_t v10 = self->_departureDetailLabel;
    v33[0] = self->_departureLabel;
    v33[1] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    [(UIStackView *)departureStackView _mapkit_setArrangedSubviews:v11];

    LODWORD(v12) = 1132068864;
    [(UIView *)self->_primaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1132068864;
    [(UIView *)self->_secondaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v13];
    LODWORD(v14) = 1132068864;
    [(UIView *)self->_tertiaryLabel _mapkit_setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148829696;
    [(UIStackView *)self->_secondaryTextStackView _mapkit_setContentCompressionResistancePriority:1 forAxis:v15];
  }
  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (id)_constraintsForCellStyle:(unint64_t)a3
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v6 = [(MKTransitDeparturesCell *)self contentView];
  id v7 = [v6 bottomAnchor];
  BOOL v8 = [(UIImageView *)self->_lineImageView bottomAnchor];
  id v9 = [v7 constraintGreaterThanOrEqualToAnchor:v8];
  lineImageViewToBottomConstraint = self->_lineImageViewToBottomConstraint;
  self->_lineImageViewToBottomConstraint = v9;

  [v5 addObject:self->_lineImageViewToBottomConstraint];
  unint64_t v11 = (void *)MEMORY[0x1E4F28DC8];
  double v12 = _NSDictionaryOfVariableBindings(&cfstr_Lineimageview_0.isa, self->_lineImageView, 0);
  double v13 = [v11 constraintsWithVisualFormat:@"V:|[_lineImageView]|" options:0 metrics:0 views:v12];
  [v5 addObjectsFromArray:v13];

  double v14 = [(UIImageView *)self->_lineImageView leadingAnchor];
  double v15 = [(UIImageView *)self->_lineImageView superview];
  double v16 = [v15 leadingAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];
  [v5 addObject:v17];

  double v18 = [(UIImageView *)self->_lineImageView trailingAnchor];
  double v19 = [(UIImageView *)self->_lineImageView superview];
  double v20 = [v19 trailingAnchor];
  double v21 = [v18 constraintEqualToAnchor:v20];
  lineImageToContainerTrailingConstraint = self->_lineImageToContainerTrailingConstraint;
  self->_lineImageToContainerTrailingConstraint = v21;

  v190 = v5;
  [v5 addObject:self->_lineImageToContainerTrailingConstraint];
  double v23 = [(MKTransitDeparturesCell *)self contentView];
  double v24 = [v23 layoutMarginsGuide];
  v189 = [v24 leadingAnchor];

  double v25 = [(MKTransitDeparturesCell *)self contentView];
  uint64_t v26 = [v25 layoutMarginsGuide];
  v192 = [v26 trailingAnchor];

  v191 = self;
  if (a3 > 1)
  {
    departureDependentConstraintsByView = self->_departureDependentConstraintsByView;
    self->_departureDependentConstraintsByView = 0;

    minimumDepartureLabelWidthConstraint = self->_minimumDepartureLabelWidthConstraint;
    self->_minimumDepartureLabelWidthConstraint = 0;

    v115 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v115 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

    v59 = v5;
  }
  else
  {
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    unint64_t v188 = a3;
    secondaryLabel = self->_secondaryLabel;
    v210[0] = self->_primaryLabel;
    v210[1] = secondaryLabel;
    incidentButton = self->_incidentButton;
    v210[2] = self->_tertiaryLabel;
    v210[3] = incidentButton;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:4];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v202 objects:v211 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v203;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v203 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v202 + 1) + 8 * i) trailingAnchor];
          v35 = [v192 constraintEqualToAnchor:v34 constant:0.0];

          LODWORD(v36) = 1148829696;
          [v35 setPriority:v36];
          [v190 addObject:v35];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v202 objects:v211 count:16];
      }
      while (v31);
    }

    double v37 = [(_MKUILabel *)v191->_departureLabel widthAnchor];
    BOOL v38 = [(MKTransitDeparturesCell *)v191 isInactive];
    double v39 = 0.0;
    if (!v38) {
      [(id)objc_opt_class() _maxExpectedDepartureLabelWidth];
    }
    uint64_t v40 = [v37 constraintGreaterThanOrEqualToConstant:v39];
    double v41 = v191->_minimumDepartureLabelWidthConstraint;
    v191->_minimumDepartureLabelWidthConstraint = (NSLayoutConstraint *)v40;

    LODWORD(v42) = 1148829696;
    [(NSLayoutConstraint *)v191->_minimumDepartureLabelWidthConstraint setPriority:v42];
    uint64_t v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 addObserver:v191 selector:sel__updateConstraintValues name:*MEMORY[0x1E4F1C370] object:0];

    if ([(MKTransitDeparturesCell *)v191 _shouldEnforceMinimumDepartureLabelWidth])
    {
      [v190 addObject:v191->_minimumDepartureLabelWidthConstraint];
    }
    double v44 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v198 = 0u;
    long long v199 = 0u;
    primaryLabel = v191->_primaryLabel;
    long long v200 = 0u;
    long long v201 = 0u;
    double v46 = v191->_secondaryLabel;
    tertiaryLabel = v191->_tertiaryLabel;
    v208[0] = primaryLabel;
    v208[1] = v46;
    v48 = v191->_incidentButton;
    v208[2] = tertiaryLabel;
    v208[3] = v48;
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:4];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v198 objects:v209 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v199;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v199 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v198 + 1) + 8 * j);
          v55 = [(UIStackView *)v191->_departureStackView leadingAnchor];
          v56 = [v54 trailingAnchor];
          id v57 = [v55 constraintEqualToAnchor:v56 constant:12.0];
          [v44 setObject:v57 forKey:v54];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v198 objects:v209 count:16];
      }
      while (v51);
    }

    objc_storeStrong((id *)&v191->_departureDependentConstraintsByView, v44);
    id v197 = 0;
    [(MKTransitDeparturesCell *)v191 _getDepartureDependentConstraintsToActivate:&v197 toDeactivate:0];
    id v58 = v197;
    v59 = v190;
    if ([v58 count]) {
      [v190 addObjectsFromArray:v58];
    }
    v60 = [(UIImageView *)v191->_disclosureArrowImageView firstBaselineAnchor];
    double v61 = [(UIStackView *)v191->_departureStackView firstBaselineAnchor];
    double v62 = [v60 constraintEqualToAnchor:v61 constant:-1.0];
    [v190 addObject:v62];

    double v63 = [(UIImageView *)v191->_disclosureArrowImageView trailingAnchor];
    double v64 = [v63 constraintEqualToAnchor:v192];
    [v190 addObject:v64];

    v65 = [(UIImageView *)v191->_disclosureArrowImageView leadingAnchor];
    id v66 = [(UIStackView *)v191->_departureStackView trailingAnchor];
    uint64_t v67 = [v65 constraintEqualToAnchor:v66 constant:4.0];
    labelToDisclosureArrowConstraint = v191->_labelToDisclosureArrowConstraint;
    v191->_labelToDisclosureArrowConstraint = (NSLayoutConstraint *)v67;

    if (([(UIImageView *)v191->_disclosureArrowImageView isHidden] & 1) == 0) {
      [v190 addObject:v191->_labelToDisclosureArrowConstraint];
    }
    v69 = [(UIStackView *)v191->_departureStackView trailingAnchor];
    v187 = [v192 constraintGreaterThanOrEqualToAnchor:v69 constant:0.0];

    [v190 addObject:v187];
    v70 = [(MKTransitDeparturesCell *)v191 contentView];
    v71 = [v70 bottomAnchor];
    v72 = [(UIStackView *)v191->_departureStackView bottomAnchor];
    uint64_t v73 = [v71 constraintGreaterThanOrEqualToAnchor:v72];
    departureStackViewToBottomConstraint = v191->_departureStackViewToBottomConstraint;
    v191->_departureStackViewToBottomConstraint = (NSLayoutConstraint *)v73;

    [v190 addObject:v191->_departureStackViewToBottomConstraint];
    v75 = [(_MKUILabel *)v191->_primaryLabel topAnchor];
    v76 = [(MKTransitDeparturesCell *)v191 contentView];
    v77 = [v76 topAnchor];
    uint64_t v78 = [v75 constraintEqualToAnchor:v77];
    primaryToTopConstraint = v191->_primaryToTopConstraint;
    v191->_primaryToTopConstraint = (NSLayoutConstraint *)v78;

    [v190 addObject:v191->_primaryToTopConstraint];
    v80 = [(_MKUILabel *)v191->_primaryLabel leadingAnchor];
    uint64_t v81 = [v80 constraintEqualToAnchor:v189];
    labelLeadingMarginConstraint = v191->_labelLeadingMarginConstraint;
    v191->_labelLeadingMarginConstraint = (NSLayoutConstraint *)v81;

    [v190 addObject:v191->_labelLeadingMarginConstraint];
    v83 = [(UIStackView *)v191->_secondaryTextStackView leadingAnchor];
    v84 = [(_MKUILabel *)v191->_primaryLabel leadingAnchor];
    v85 = [v83 constraintEqualToAnchor:v84];
    [v190 addObject:v85];

    v86 = [(_MKUILabel *)v191->_primaryLabel trailingAnchor];
    uint64_t v87 = [v192 constraintGreaterThanOrEqualToAnchor:v86 constant:12.0];
    [v190 addObject:v87];

    v88 = [(UIStackView *)v191->_secondaryTextStackView topAnchor];
    v89 = [(_MKUILabel *)v191->_departureLabel topAnchor];
    long long v90 = [v88 constraintGreaterThanOrEqualToAnchor:v89];
    [v190 addObject:v90];

    double v91 = [(UIStackView *)v191->_secondaryTextStackView trailingAnchor];
    double v92 = [v192 constraintGreaterThanOrEqualToAnchor:v91 constant:0.0];
    [v190 addObject:v92];

    double v93 = [(UIStackView *)v191->_secondaryTextStackView firstBaselineAnchor];
    double v94 = [(_MKUILabel *)v191->_primaryLabel lastBaselineAnchor];
    uint64_t v95 = [v93 constraintEqualToAnchor:v94 constant:20.0];
    secondaryStackToPrimaryConstraint = v191->_secondaryStackToPrimaryConstraint;
    v191->_secondaryStackToPrimaryConstraint = (NSLayoutConstraint *)v95;

    [v190 addObject:v191->_secondaryStackToPrimaryConstraint];
    uint64_t v97 = [(MKTransitDeparturesCell *)v191 contentView];
    v98 = [v97 bottomAnchor];
    uint64_t v99 = [(UIStackView *)v191->_secondaryTextStackView lastBaselineAnchor];
    uint64_t v100 = [v98 constraintGreaterThanOrEqualToAnchor:v99];
    secondaryStackToBottomConstraint = v191->_secondaryStackToBottomConstraint;
    v191->_secondaryStackToBottomConstraint = (NSLayoutConstraint *)v100;

    [v190 addObject:v191->_secondaryStackToBottomConstraint];
    v102 = [(MKTransitDeparturesCell *)v191 contentView];
    v103 = [v102 bottomAnchor];
    v104 = [(_MKUILabel *)v191->_primaryLabel lastBaselineAnchor];
    uint64_t v105 = [v103 constraintGreaterThanOrEqualToAnchor:v104];
    primaryToBottomConstraint = v191->_primaryToBottomConstraint;
    v191->_primaryToBottomConstraint = (NSLayoutConstraint *)v105;

    [v190 addObject:v191->_primaryToBottomConstraint];
    v107 = [(UIImageView *)v191->_lineImageView superview];
    v108 = [v107 trailingAnchor];
    v109 = [(_MKUILabel *)v191->_primaryLabel leadingAnchor];
    uint64_t v110 = [v108 constraintEqualToAnchor:v109 constant:-12.0];
    lineImageToTextGutterConstraint = v191->_lineImageToTextGutterConstraint;
    v191->_lineImageToTextGutterConstraint = (NSLayoutConstraint *)v110;

    LODWORD(v112) = 1148829696;
    [(NSLayoutConstraint *)v191->_lineImageToTextGutterConstraint setPriority:v112];
    [v190 addObject:v191->_lineImageToTextGutterConstraint];

    self = v191;
    a3 = v188;
  }
  if (a3 == 2)
  {
    v126 = [(UIImageView *)self->_lineImageView topAnchor];
    v127 = [(MKTransitDeparturesCell *)self contentView];
    v128 = [v127 topAnchor];
    v129 = [v126 constraintEqualToAnchor:v128];
    lineImageViewTopConstraint = self->_lineImageViewTopConstraint;
    self->_lineImageViewTopConstraint = v129;

    [v190 addObject:self->_lineImageViewTopConstraint];
    v131 = [(UIStackView *)self->_secondaryTextStackView topAnchor];
    v132 = [(UIImageView *)self->_lineImageView topAnchor];
    v133 = [v131 constraintEqualToAnchor:v132];
    v134 = self->_primaryToTopConstraint;
    self->_primaryToTopConstraint = v133;

    [v190 addObject:self->_primaryToTopConstraint];
    v135 = [(UIStackView *)self->_secondaryTextStackView leadingAnchor];
    v136 = [v135 constraintEqualToAnchor:v189];
    v137 = self->_labelLeadingMarginConstraint;
    self->_labelLeadingMarginConstraint = v136;

    [v190 addObject:self->_labelLeadingMarginConstraint];
    v138 = v190;
    v139 = [(UIImageView *)self->_lineImageView superview];
    v140 = [v139 trailingAnchor];
    v141 = [(UIStackView *)self->_secondaryTextStackView leadingAnchor];
    v142 = [v140 constraintEqualToAnchor:v141 constant:-12.0];
    v143 = self->_lineImageToTextGutterConstraint;
    self->_lineImageToTextGutterConstraint = v142;

    LODWORD(v144) = 1148829696;
    [(NSLayoutConstraint *)self->_lineImageToTextGutterConstraint setPriority:v144];
    [v190 addObject:self->_lineImageToTextGutterConstraint];
    v145 = [(UIImageView *)self->_disclosureArrowImageView firstBaselineAnchor];
    v146 = [(_MKUILabel *)self->_primaryLabel firstBaselineAnchor];
    v147 = [v145 constraintEqualToAnchor:v146 constant:-1.0];
    [v190 addObject:v147];

    v148 = [(UIImageView *)self->_disclosureArrowImageView trailingAnchor];
    v149 = [v148 constraintEqualToAnchor:v192];
    [v190 addObject:v149];

    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    v150 = self->_secondaryLabel;
    v206[0] = self->_primaryLabel;
    v206[1] = v150;
    departureLabel = self->_departureLabel;
    v206[2] = self->_tertiaryLabel;
    v206[3] = departureLabel;
    v206[4] = self->_departureDetailLabel;
    v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:5];
    uint64_t v153 = [v152 countByEnumeratingWithState:&v193 objects:v207 count:16];
    if (v153)
    {
      uint64_t v154 = v153;
      uint64_t v155 = *(void *)v194;
      do
      {
        for (uint64_t k = 0; k != v154; ++k)
        {
          if (*(void *)v194 != v155) {
            objc_enumerationMutation(v152);
          }
          v157 = *(_MKUILabel **)(*((void *)&v193 + 1) + 8 * k);
          if (v157 == self->_primaryLabel && (disclosureArrowImageView = self->_disclosureArrowImageView) != 0)
          {
            v160 = [(UIImageView *)disclosureArrowImageView leadingAnchor];
            v161 = [(_MKUILabel *)self->_primaryLabel trailingAnchor];
            uint64_t v162 = [v160 constraintEqualToAnchor:v161 constant:4.0];
            v163 = v191->_labelToDisclosureArrowConstraint;
            v191->_labelToDisclosureArrowConstraint = (NSLayoutConstraint *)v162;

            self = v191;
            v138 = v190;
            [v190 addObject:v191->_labelToDisclosureArrowConstraint];
            int v158 = 1148829696;
          }
          else
          {
            int v158 = 1148846080;
          }
          v164 = [(_MKUILabel *)v157 trailingAnchor];
          v165 = [v192 constraintEqualToAnchor:v164];

          LODWORD(v166) = v158;
          [v165 setPriority:v166];
          [v138 addObject:v165];
        }
        uint64_t v154 = [v152 countByEnumeratingWithState:&v193 objects:v207 count:16];
      }
      while (v154);
    }

    v167 = [(UIStackView *)self->_secondaryTextStackView trailingAnchor];
    v168 = [v192 constraintEqualToAnchor:v167];
    [v138 addObject:v168];

    v169 = [(MKTransitDeparturesCell *)self contentView];
    v170 = [v169 bottomAnchor];
    v171 = [(UIStackView *)self->_secondaryTextStackView bottomAnchor];
    v172 = [v170 constraintEqualToAnchor:v171 constant:8.0];
    [v190 addObject:v172];

    v59 = v190;
  }
  else
  {
    if (a3 == 1)
    {
      v173 = [(UIStackView *)self->_departureStackView topAnchor];
      v174 = [(_MKUILabel *)self->_primaryLabel topAnchor];
      v175 = [v173 constraintEqualToAnchor:v174];
      departureStackViewTopToPrimaryTopConstraint = self->_departureStackViewTopToPrimaryTopConstraint;
      self->_departureStackViewTopToPrimaryTopConstraint = v175;

      [v190 addObject:self->_departureStackViewTopToPrimaryTopConstraint];
      v177 = (void *)MEMORY[0x1E4F28DC8];
      lineImageView = self->_lineImageView;
      v179 = [(MKTransitDeparturesCell *)self contentView];
      v180 = [v177 constraintWithItem:lineImageView attribute:20 relatedBy:0 toItem:v179 attribute:20 multiplier:1.0 constant:0.0];
      lineImageViewCenteringConstraint = self->_lineImageViewCenteringConstraint;
      self->_lineImageViewCenteringConstraint = v180;

      v59 = v190;
      [v190 addObject:self->_lineImageViewCenteringConstraint];
      v121 = [(UIImageView *)self->_lineImageView topAnchor];
      v122 = [(MKTransitDeparturesCell *)self contentView];
      v182 = [v122 topAnchor];
      v183 = [v121 constraintGreaterThanOrEqualToAnchor:v182];
      uint64_t v124 = 1248;
      lineImageViewCenteringVerticalPaddingConstraint = self->_lineImageViewCenteringVerticalPaddingConstraint;
      self->_lineImageViewCenteringVerticalPaddingConstraint = v183;
    }
    else
    {
      if (a3) {
        goto LABEL_44;
      }
      v116 = [(UIImageView *)self->_lineImageView topAnchor];
      v117 = [(MKTransitDeparturesCell *)self contentView];
      v118 = [v117 topAnchor];
      v119 = [v116 constraintEqualToAnchor:v118];
      v120 = self->_lineImageViewTopConstraint;
      self->_lineImageViewTopConstraint = v119;

      v59 = v190;
      [v190 addObject:self->_lineImageViewTopConstraint];
      v121 = [(UIStackView *)self->_departureStackView topAnchor];
      v122 = [(_MKUILabel *)self->_primaryLabel topAnchor];
      v123 = [v121 constraintEqualToAnchor:v122];
      uint64_t v124 = 1232;
      v125 = self->_departureStackViewTopToPrimaryTopConstraint;
      self->_departureStackViewTopToPrimaryTopConstraint = v123;
    }
    [v59 addObject:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v124)];
  }
LABEL_44:
  v185 = (void *)[v59 copy];

  return v185;
}

- (void)_updateConstraintValues
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  double v3 = [(id)objc_opt_class() defaultSecondaryFont];
  objc_msgSend(v3, "_mapkit_lineHeight");
  -[UIStackView setSpacing:](self->_secondaryTextStackView, "setSpacing:");
  BOOL v4 = [(MKTransitDeparturesCell *)self useCompressedGutter];
  double v5 = -12.0;
  if (v4) {
    double v5 = -8.0;
  }
  [(NSLayoutConstraint *)self->_lineImageToTextGutterConstraint setConstant:v5];
  unint64_t cellStyle = self->_cellStyle;
  double v7 = 23.0;
  if (cellStyle)
  {
    if (cellStyle == 2)
    {
      v34 = [(_MKUILabel *)self->_primaryLabel font];
      objc_msgSend(v34, "_mapkit_lineHeight");
      double v36 = v35;
      double v37 = [(_MKUILabel *)self->_primaryLabel font];
      [v37 ascender];
      [(NSLayoutConstraint *)self->_primaryToTopConstraint setConstant:-(v36 - v38)];

      double v39 = [(UIStackView *)self->_secondaryTextStackView arrangedSubviews];
      uint64_t v40 = [v39 count];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __50__MKTransitDeparturesCell__updateConstraintValues__block_invoke;
      v50[3] = &unk_1E54BD198;
      uint64_t v52 = self;
      uint64_t v53 = v40;
      id v51 = v39;
      id v41 = v39;
      [v41 enumerateObjectsUsingBlock:v50];

      goto LABEL_31;
    }
    if (cellStyle != 1) {
      goto LABEL_31;
    }
    [(MKTransitDeparturesCell *)self _labelToTopScaledConstantForFullCenteredCellStyle];
    double v9 = v8;
    if (self->_cellStyle == 1)
    {
      [(MKTransitDeparturesCell *)self _labelToBottomScaledConstantForFullCenteredCellStyle];
      double v7 = v10;
    }
  }
  else
  {
    double v9 = 35.0;
  }
  unint64_t v11 = [(id)objc_opt_class() _primaryFont];
  [v11 _scaledValueForValue:v9];
  double v13 = v12;
  [(MKTransitDeparturesCell *)self _separatorHeight];
  double v15 = v13 - v14;
  double v16 = [(id)objc_opt_class() _primaryFont];
  [v16 pointSize];
  [(NSLayoutConstraint *)self->_primaryToTopConstraint setConstant:v15 - v17];

  [v3 _scaledValueForValue:20.0];
  -[NSLayoutConstraint setConstant:](self->_secondaryStackToPrimaryConstraint, "setConstant:");
  [v3 _scaledValueForValue:v7];
  double v19 = v18;
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled]
    && [(UIStackView *)self->_secondaryTextStackView isHidden])
  {
    double v19 = 0.0;
  }
  [(NSLayoutConstraint *)self->_secondaryStackToBottomConstraint setConstant:v19];
  double v20 = [(id)objc_opt_class() _primaryFont];
  [v20 _scaledValueForValue:v7];
  -[NSLayoutConstraint setConstant:](self->_primaryToBottomConstraint, "setConstant:");

  [(id)objc_opt_class() _maxExpectedDepartureLabelWidth];
  -[NSLayoutConstraint setConstant:](self->_minimumDepartureLabelWidthConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_minimumDepartureLabelWidthConstraint setActive:[(MKTransitDeparturesCell *)self _shouldEnforceMinimumDepartureLabelWidth]];
  if ([(MKCustomSeparatorCell *)self isSeparatorHidden])
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v22 = v21;
    if (self->_primaryToBottomConstraint) {
      objc_msgSend(v21, "addObject:");
    }
    if (self->_secondaryStackToBottomConstraint) {
      objc_msgSend(v22, "addObject:");
    }
    if (self->_departureStackViewToBottomConstraint) {
      objc_msgSend(v22, "addObject:");
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v55 != v26) {
            objc_enumerationMutation(v23);
          }
          double v28 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          [v28 constant];
          double v30 = v29 + -8.0;
          double v31 = 0.0;
          if (v30 >= 0.0)
          {
            objc_msgSend(v28, "constant", 0.0);
            double v31 = v32 + -8.0;
          }
          [v28 setConstant:v31];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v25);
    }
  }
  double v33 = [(id)objc_opt_class() _departureDetailLabelFont];
  [v33 _scaledValueForValue:20.0];
  -[UIStackView setSpacing:](self->_departureStackView, "setSpacing:");

  [(NSLayoutConstraint *)self->_secondaryStackToBottomConstraint constant];
  -[NSLayoutConstraint setConstant:](self->_departureStackViewToBottomConstraint, "setConstant:");
  [(UIStackView *)self->_secondaryTextStackView setCustomSpacing:self->_primaryLabel afterView:3.40282347e38];
  [(UIStackView *)self->_secondaryTextStackView setCustomSpacing:self->_secondaryLabel afterView:3.40282347e38];
  [(UIStackView *)self->_secondaryTextStackView setCustomSpacing:self->_tertiaryLabel afterView:3.40282347e38];
LABEL_31:
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
  {
    double v42 = [(UIImageView *)self->_lineImageView image];
    [v42 size];
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");
  }
  else
  {
    [(MKTransitDeparturesCell *)self lineImageViewSize];
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");
  }
  [(NSLayoutConstraint *)self->_lineImageToContainerTrailingConstraint setConstant:self->_lineImageCenteringValue];
  if ([(NSLayoutConstraint *)self->_incidentIconHorizontalConstraint isActive])
  {
    double v43 = 10.0;
    if (![(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
    {
      double v44 = [(UIImageView *)self->_incidentIconImageView image];
      [v44 size];
      double v43 = v45;
    }
    double v46 = [(UIImageView *)self->_lineImageView image];
    [v46 size];
    double v48 = v47;

    double v49 = 2.0;
    if (v43 >= v48) {
      UIRoundToViewScale();
    }
    [(NSLayoutConstraint *)self->_incidentIconHorizontalConstraint setConstant:v49];
  }
  [(NSLayoutConstraint *)self->_secondaryStackToBottomConstraint setActive:[(MKTransitDeparturesCell *)self _shouldPinSecondaryStackViewToBottom]];
  [(NSLayoutConstraint *)self->_labelToDisclosureArrowConstraint setActive:[(UIImageView *)self->_disclosureArrowImageView isHidden] ^ 1];
  [(MKTransitDeparturesCell *)self _updateDepartureDependentConstraintsForCurrentState];
  [(MKTransitDeparturesCell *)self _updateLineImageViewConstraintConstants];
}

void __50__MKTransitDeparturesCell__updateConstraintValues__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = a3 + 1;
  if (a3 + 1 != *(void *)(a1 + 48))
  {
    id v9 = v5;
    double v7 = 0;
    do
    {
      double v8 = v7;
      double v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];

      if (![v7 isHidden]) {
        break;
      }
      ++v6;
    }
    while (v6 < *(void *)(a1 + 48));
    [*(id *)(a1 + 40) _baselineSpacingAboveView:v7];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1144), "setCustomSpacing:afterView:", v9);

    id v5 = v9;
  }
}

- (double)_baselineSpacingAboveView:(id)a3
{
  BOOL v4 = (UIButton *)a3;
  id v5 = [(MKTransitDeparturesCell *)self _fontForView:v4];
  if (v5)
  {
    if ((UIButton *)self->_departureLabel == v4)
    {
      double v6 = 3.0;
    }
    else
    {
      double v6 = 0.0;
      if (self->_incidentButton == v4)
      {
        double v7 = [(UIButton *)v4 configuration];
        [v7 contentInsets];
        double v6 = v8 + 3.0;
      }
    }
    [v5 _scaledValueForValue:v6];
    double v11 = v10;
    objc_msgSend(v5, "_mapkit_lineHeight");
    double v9 = v11 + v12;
  }
  else
  {
    double v9 = 3.40282347e38;
  }

  return v9;
}

- (id)_fontForView:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v4 = [v3 font];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 titleLabel];
    BOOL v4 = [v5 font];
  }
  else
  {
LABEL_7:
    BOOL v4 = 0;
  }
LABEL_8:

  return v4;
}

- (void)_updateLineImageViewConstraintConstants
{
  unint64_t cellStyle = self->_cellStyle;
  if (cellStyle < 2)
  {
    BOOL v4 = [(UIImageView *)self->_lineImageView image];
    [v4 size];
    double v6 = v5;

    [(MKTransitDeparturesCell *)self _separatorHeight];
    double v8 = v7;
    if (v6 >= 35.0)
    {
      double v9 = [(id)objc_opt_class() _primaryFont];
      double v10 = v9;
      if (v6 < 40.0)
      {
        objc_msgSend(v9, "_mapkit_scaledValueForValue:", 21.5);
        UIRoundToViewScale();
LABEL_10:
        double v15 = v14 - v8;
        [(NSLayoutConstraint *)self->_lineImageViewCenteringVerticalPaddingConstraint setConstant:v15];
        p_lineImageViewToBottomConstraint = &self->_lineImageViewToBottomConstraint;
        [(NSLayoutConstraint *)self->_lineImageViewToBottomConstraint setConstant:v15];
        [(NSLayoutConstraint *)self->_lineImageViewTopConstraint setConstant:v15];

        double v13 = 0.0;
        if ([(MKCustomSeparatorCell *)self isSeparatorHidden])
        {
          [(NSLayoutConstraint *)*p_lineImageViewToBottomConstraint constant];
          if (v16 + -8.0 >= 0.0)
          {
            [(NSLayoutConstraint *)*p_lineImageViewToBottomConstraint constant];
            double v13 = v17 + -8.0;
          }
        }
        goto LABEL_13;
      }
      double v11 = 19.0;
    }
    else
    {
      double v9 = [(id)objc_opt_class() _primaryFont];
      double v10 = v9;
      double v11 = 23.0;
    }
    objc_msgSend(v9, "_mapkit_scaledValueForValue:", v11);
    goto LABEL_10;
  }
  if (cellStyle != 2) {
    return;
  }
  [(NSLayoutConstraint *)self->_lineImageViewTopConstraint setConstant:12.0];
  p_lineImageViewToBottomConstraint = &self->_lineImageViewToBottomConstraint;
  double v13 = 8.0;
LABEL_13:
  double v18 = *p_lineImageViewToBottomConstraint;

  [(NSLayoutConstraint *)v18 setConstant:v13];
}

- (BOOL)_shouldEnforceDepartureDependentConstraints
{
  return self->_cellStyle != 2
      && [(MKTransitDeparturesCell *)self _isDisplayingDepartureInfo];
}

- (BOOL)_shouldEnforceMinimumDepartureLabelWidth
{
  return self->_enforceMinimumDepartureLabelWidth
      && ![(MKTransitDeparturesCell *)self isInactive]
      && self->_cellStyle != 2;
}

- (BOOL)_isDisplayingDepartureInfo
{
  id v3 = [(_MKUILabel *)self->_departureLabel attributedText];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(_MKUILabel *)self->_departureDetailLabel attributedText];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (BOOL)_shouldPinSecondaryStackViewToBottom
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_cellStyle == 2) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(UIStackView *)self->_secondaryTextStackView arrangedSubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      double v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      if (([v9 isHidden] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v10 = [v9 attributedText];
        }
        else
        {
          if (![(MKTransitDeparturesCell *)self _newStationCardUIEnabled]) {
            goto LABEL_18;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_15;
          }
          double v10 = [v9 text];
        }
        double v11 = v10;
        uint64_t v12 = [v10 length];

        if (v12)
        {
LABEL_18:
          BOOL v2 = 1;
          goto LABEL_19;
        }
      }
LABEL_15:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  BOOL v2 = 0;
LABEL_19:

  return v2;
}

- (void)_getDepartureDependentConstraintsToActivate:(id *)a3 toDeactivate:(id *)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if (![(NSMapTable *)self->_departureDependentConstraintsByView count]) {
    return;
  }
  if ([(MKTransitDeparturesCell *)self _shouldEnforceDepartureDependentConstraints])
  {
    uint64_t v7 = [(_MKUILabel *)self->_departureLabel attributedText];
    uint64_t v8 = [v7 length];

    double v9 = [(_MKUILabel *)self->_departureDetailLabel attributedText];
    uint64_t v10 = [v9 length];

    uint64_t v11 = 1;
    if (v8) {
      uint64_t v11 = 2;
    }
    if (v10) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = v8 != 0;
    }
    secondaryLabel = self->_secondaryLabel;
    v27[0] = self->_primaryLabel;
    v27[1] = secondaryLabel;
    incidentButton = self->_incidentButton;
    v27[2] = self->_tertiaryLabel;
    v27[3] = incidentButton;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    if (a3)
    {
      long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
      if (a4)
      {
LABEL_10:
        long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
LABEL_16:
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __84__MKTransitDeparturesCell__getDepartureDependentConstraintsToActivate_toDeactivate___block_invoke;
        v23[3] = &unk_1E54BD1C0;
        v23[4] = self;
        id v20 = v16;
        id v24 = v20;
        BOOL v26 = v12;
        id v21 = v17;
        id v25 = v21;
        [v15 enumerateObjectsUsingBlock:v23];
        if (a4) {
          *a4 = v21;
        }
        if (a3) {
          *a3 = v20;
        }

        return;
      }
    }
    else
    {
      long long v16 = 0;
      if (a4) {
        goto LABEL_10;
      }
    }
    long long v17 = 0;
    goto LABEL_16;
  }
  double v18 = (void *)MEMORY[0x1E4F28DC8];
  id v22 = [(NSMapTable *)self->_departureDependentConstraintsByView objectEnumerator];
  uint64_t v19 = [v22 allObjects];
  [v18 deactivateConstraints:v19];
}

void __84__MKTransitDeparturesCell__getDepartureDependentConstraintsToActivate_toDeactivate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1176), "objectForKey:");
  if (v3)
  {
    BOOL v4 = (id *)(a1 + 40);
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 56)
      || [v5 isHidden])
    {
      BOOL v4 = (id *)(a1 + 48);
    }
    [*v4 addObject:v3];
  }
}

- (void)_updateDepartureDependentConstraintsForCurrentState
{
  id v4 = 0;
  id v5 = 0;
  [(MKTransitDeparturesCell *)self _getDepartureDependentConstraintsToActivate:&v5 toDeactivate:&v4];
  id v2 = v5;
  id v3 = v4;
  if (v3) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3];
  }
  if (v2) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v2];
  }
}

- (void)infoCardThemeChanged
{
  v5.receiver = self;
  v5.super_class = (Class)MKTransitDeparturesCell;
  [(UIView *)&v5 infoCardThemeChanged];
  id v3 = [(UIView *)self mk_theme];
  id v4 = [v3 lightTextColor];
  [(UIImageView *)self->_lineImageView setTintColor:v4];

  [(MKTransitDeparturesCell *)self refreshDeparturesDisplay];
}

- (void)_updateLabelFonts
{
  id v3 = [(id)objc_opt_class() _primaryFont];
  [(_MKUILabel *)self->_primaryLabel setFont:v3];

  id v4 = [(id)objc_opt_class() defaultSecondaryFont];
  [(MKMultiPartLabel *)self->_secondaryLabel setFont:v4];

  objc_super v5 = [(id)objc_opt_class() defaultSecondaryFont];
  [(MKMultiPartLabel *)self->_tertiaryLabel setFont:v5];

  uint64_t v6 = [(id)objc_opt_class() _departureLabelFont];
  [(_MKUILabel *)self->_departureLabel setFont:v6];

  uint64_t v7 = [(id)objc_opt_class() _departureDetailLabelFont];
  [(_MKUILabel *)self->_departureDetailLabel setFont:v7];

  id v9 = [(id)objc_opt_class() defaultSecondaryFont];
  uint64_t v8 = [(UIButton *)self->_incidentButton titleLabel];
  [v8 setFont:v9];
}

- (double)_separatorHeight
{
  id v2 = [(MKTransitDeparturesCell *)self _screen];
  [v2 nativeScale];
  double v4 = 1.0 / v3;

  return v4;
}

- (void)setLineImage:(id)a3
{
  -[UIImageView setImage:](self->_lineImageView, "setImage:");
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
  {
    objc_super v5 = [(UIImageView *)self->_lineImageView image];
    [v5 size];
    -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
    -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");

    [(NSLayoutConstraint *)self->_lineImageViewHeightConstraint setActive:a3 != 0];
  }

  [(MKTransitDeparturesCell *)self _updateLineImageViewConstraintConstants];
}

- (void)setPrimaryText:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sPrimaryLabelParagraphStyle;
  if (!sPrimaryLabelParagraphStyle)
  {
    uint64_t v6 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
    uint64_t v7 = (void *)[v6 mutableCopy];

    LODWORD(v8) = 1008981770;
    [v7 setHyphenationFactor:v8];
    id v9 = (void *)sPrimaryLabelParagraphStyle;
    sPrimaryLabelParagraphStyle = (uint64_t)v7;

    uint64_t v5 = sPrimaryLabelParagraphStyle;
  }
  uint64_t v12 = *MEMORY[0x1E4F42540];
  v13[0] = v5;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  if (v4)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v10];
    [(_MKUILabel *)self->_primaryLabel setAttributedText:v11];
  }
  else
  {
    [(_MKUILabel *)self->_primaryLabel setAttributedText:0];
  }
}

- (void)setSecondaryText:(id)a3
{
  secondaryLabel = self->_secondaryLabel;
  id v5 = a3;
  LODWORD(secondaryLabel) = [(MKThemeMultiPartLabel *)secondaryLabel isHidden];
  [(MKMultiPartLabel *)self->_secondaryLabel setMultiPartString:v5];

  uint64_t v6 = [(MKMultiPartLabel *)self->_secondaryLabel text];
  -[MKThemeMultiPartLabel setHidden:](self->_secondaryLabel, "setHidden:", [v6 length] == 0);

  if (secondaryLabel != [(MKThemeMultiPartLabel *)self->_secondaryLabel isHidden])
  {
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)setTertiaryText:(id)a3
{
  tertiaryLabel = self->_tertiaryLabel;
  id v5 = a3;
  LODWORD(tertiaryLabel) = [(MKThemeMultiPartLabel *)tertiaryLabel isHidden];
  [(MKMultiPartLabel *)self->_tertiaryLabel setMultiPartString:v5];

  uint64_t v6 = [(MKMultiPartLabel *)self->_tertiaryLabel text];
  -[MKThemeMultiPartLabel setHidden:](self->_tertiaryLabel, "setHidden:", [v6 length] == 0);

  if (tertiaryLabel != [(MKThemeMultiPartLabel *)self->_tertiaryLabel isHidden])
  {
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)setShowDisclosureArrow:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIImageView *)self->_disclosureArrowImageView isHidden] == a3)
  {
    [(UIImageView *)self->_disclosureArrowImageView setHidden:!v3];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)refreshDeparturesDisplay
{
  v42[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKTransitDeparturesCell *)self _displayableDeparturesCount];
  id v4 = [(MKTransitDeparturesCell *)self departures];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 liveStatus];
  if (self->_departureStyle == 1 && v6 == 3) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = v6;
  }
  unint64_t v9 = [(MKTransitDeparturesCell *)self departureStyle];
  if (v9 - 2 > 3)
  {
    uint64_t v10 = 1;
    if (!v3) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v10 = qword_18BD1BE50[v9 - 2];
    if (!v3) {
      goto LABEL_15;
    }
  }
  if (v10 == 2)
  {
    self->_enforceMinimumDepartureLabelWidth = 0;
    if ((unint64_t)(v8 - 1) >= 2) {
      [v5 scheduledDepartureDate];
    }
    else {
    BOOL v3 = [v5 liveDepartureDate];
    }
    long long v16 = objc_opt_class();
    long long v17 = [(MKTransitDeparturesCell *)self departureTimeZone];
    double v18 = [v16 _stringFromTimestampDate:v3 departureTimeZone:v17];

    BOOL v19 = [(UIView *)self _mapkit_isDarkModeEnabled];
    if (v18)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28B18], "_mapkit_attributedLiveTransitStringFromDepartureString:departure:darkMode:", v18, v5, v19);
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v20 = [v5 liveStatusString];

    if (v20)
    {
      long long v15 = 0;
    }
    else
    {
      id v21 = objc_opt_class();
      id v22 = [v5 liveDepartureDate];
      id v23 = [(MKTransitDeparturesCell *)self departureTimeZone];
      long long v15 = [v21 _stringFromTimestampDate:v22 departureTimeZone:v23];
    }
    goto LABEL_27;
  }
  if (v10 != 1)
  {
    long long v15 = 0;
    BOOL v3 = 0;
    goto LABEL_28;
  }
  self->_enforceMinimumDepartureLabelWidth = 1;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(MKTransitDeparturesCell *)self _departureDates];
  double v13 = [(MKTransitDeparturesCell *)self countdownReferenceDate];
  BOOL v3 = objc_msgSend(v11, "_attributedStringForCountdownDepartures:referenceDate:isShowingNoConnectionEmDash:", v12, v13, -[MKTransitDeparturesCell isShowingNoConnectionEmDash](self, "isShowingNoConnectionEmDash"));

  if (!v5)
  {
LABEL_15:
    long long v15 = 0;
    goto LABEL_28;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28B18], "_mapkit_attributedLiveTransitStringFromAttributedDepartureString:liveStatus:darkMode:symbolOverrideColor:", v3, v8, -[UIView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), 0);
  long long v15 = 0;
LABEL_27:

  BOOL v3 = (void *)v14;
LABEL_28:
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 4) {
    goto LABEL_34;
  }
  id v24 = [v5 liveStatusString];

  if (!v24)
  {
    double v32 = [v5 departureDate];

    if (v32)
    {
      MKTransitLiveDepartureColorForViewWithLiveStatus(self, v8);
      BOOL v26 = (MKServerFormattedStringParameters *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = *MEMORY[0x1E4F42510];
      v42[0] = v26;
      double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v35 = objc_msgSend(NSString, "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", v8, v15);
      double v31 = (void *)[v34 initWithString:v35 attributes:v33];

      goto LABEL_33;
    }
LABEL_34:
    double v31 = 0;
    goto LABEL_35;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  MKFormattedStringOptionsMakeDefault((uint64_t)&v39);
  id v25 = [MKServerFormattedStringParameters alloc];
  v38[0] = v39;
  v38[1] = v40;
  BOOL v26 = [(MKServerFormattedStringParameters *)v25 initWithOptions:v38 variableOverrides:0];
  double v27 = [MKServerFormattedString alloc];
  double v28 = [v5 liveStatusString];
  double v29 = [(MKServerFormattedString *)v27 initWithGeoServerString:v28 parameters:v26];

  double v30 = [(MKServerFormattedString *)v29 multiPartAttributedStringWithAttributes:MEMORY[0x1E4F1CC08]];
  double v31 = [v30 attributedString];

LABEL_33:
LABEL_35:
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled]
    && ![v3 length]
    && [(NSString *)self->_frequency length])
  {
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_frequency];

    BOOL v3 = (void *)v36;
  }
  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled]
    && ![v3 length]
    && [(NSString *)self->_operatingHours length])
  {
    uint64_t v37 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_operatingHours];

    BOOL v3 = (void *)v37;
  }
  -[_MKUILabel setHidden:](self->_departureDetailLabel, "setHidden:", [v31 length] == 0);
  -[_MKUILabel setHidden:](self->_departureLabel, "setHidden:", [v3 length] == 0);
  [(_MKUILabel *)self->_departureLabel setAttributedText:v3];
  [(_MKUILabel *)self->_departureDetailLabel setAttributedText:v31];
  [(MKTransitDeparturesCell *)self _updateDepartureDependentConstraintsForCurrentState];
  [(NSLayoutConstraint *)self->_minimumDepartureLabelWidthConstraint setActive:[(MKTransitDeparturesCell *)self _shouldEnforceMinimumDepartureLabelWidth]];
}

- (void)setAccessibilityOrder
{
  v39[5] = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  BOOL v3 = [(_MKUILabel *)self->_primaryLabel text];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v6 = v5;

  v39[0] = v6;
  uint64_t v7 = [(MKMultiPartLabel *)self->_secondaryLabel text];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v10 = v9;

  v39[1] = v10;
  uint64_t v11 = [(_MKUILabel *)self->_departureLabel text];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v14 = v13;

  v39[2] = v14;
  long long v15 = [(_MKUILabel *)self->_departureDetailLabel text];
  long long v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1CA98] null];
  }
  double v18 = v17;

  v39[3] = v18;
  BOOL v19 = [(MKMultiPartLabel *)self->_tertiaryLabel text];
  id v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1CA98] null];
  }
  id v22 = v21;

  v39[4] = v22;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:5];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v30 = [MEMORY[0x1E4F1CA98] null];
        char v31 = [v29 isEqual:v30];

        if ((v31 & 1) == 0)
        {
          double v32 = [NSString stringWithFormat:@"%@,", v29];
          [v33 appendString:v32];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v26);
  }

  [(MKTransitDeparturesCell *)self setAccessibilityLabel:v33];
}

+ (id)_stringFromTimestampDate:(id)a3 departureTimeZone:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9A8];
    id v7 = a3;
    uint64_t v8 = [v6 currentCalendar];
    id v9 = [v8 timeZone];
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    if (v5) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = qword_1EB315B98;
    id v12 = v10;
    if (v11 != -1) {
      dispatch_once(&qword_1EB315B98, &__block_literal_global_97);
    }
    [(id)qword_1EB315B90 setTimeZone:v12];

    id v13 = [(id)qword_1EB315B90 stringFromDate:v7];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __70__MKTransitDeparturesCell__stringFromTimestampDate_departureTimeZone___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB315B90;
  qword_1EB315B90 = (uint64_t)v0;

  id v2 = (void *)qword_1EB315B90;
  BOOL v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [(id)qword_1EB315B90 setDateStyle:0];
  id v4 = (void *)qword_1EB315B90;

  return [v4 setTimeStyle:1];
}

+ (id)_stringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 2;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = (void *)[v9 initWithCapacity:v34[3]];
  uint64_t v11 = objc_opt_class();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __99__MKTransitDeparturesCell__stringForCountdownDepartures_referenceDate_isShowingNoConnectionEmDash___block_invoke;
  v25[3] = &unk_1E54BD1E8;
  uint64_t v27 = &v29;
  double v28 = &v33;
  id v12 = v10;
  id v26 = v12;
  [v11 _enumerateMinutesUntilDepartureDates:v7 withReferenceDate:v8 block:v25];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  char IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  if ([v12 count])
  {
    long long v15 = objc_msgSend(v12, "_mapkit_componentsJoinedInCommaDelimitedList");
    long long v16 = _MKLocalizedStringFromThisBundle(@"%@ min [PlaceCard, Transit, Departures, Countdown]");
    id v17 = _MKLocalizedStringFromThisBundle(@"min [PlaceCard, Transit, Departures, Countdown, Unit]");
    double v18 = objc_msgSend(NSString, "stringWithFormat:", v16, v15, v17);
    [v13 addObject:v18];
  }
  if (*((unsigned char *)v30 + 24))
  {
    BOOL v19 = +[MKTransitDeparturesCell _nowString];
    [v13 insertObject:v19 atIndex:0];
  }
  uint64_t v20 = [v12 count];
  if (v5 && v20 + (unint64_t)*((unsigned __int8 *)v30 + 24) <= 1)
  {
    id v21 = [NSString stringWithFormat:@"—"];
    if (IsRightToLeft) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = [v13 count];
    }
    [v13 insertObject:v21 atIndex:v22];
  }
  id v23 = objc_msgSend(v13, "_mapkit_componentsJoinedInCommaDelimitedList");

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void __99__MKTransitDeparturesCell__stringForCountdownDepartures_referenceDate_isShowingNoConnectionEmDash___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if (a3)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a3);
    [v7 addObject:v8];
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v9 + 24))
    {
      *(unsigned char *)(v9 + 24) = 1;
      --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  if ([*(id *)(a1 + 32) count] == *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

+ (id)_attributedStringForCountdownDepartures:(id)a3 referenceDate:(id)a4 isShowingNoConnectionEmDash:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4F42508];
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _departureLabelFont];
  v17[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  id v12 = [a1 _stringForCountdownDepartures:v9 referenceDate:v8 isShowingNoConnectionEmDash:v5];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v11];
  [a1 _addEmDashAttributes:v13];
  uint64_t v14 = (void *)[v13 copy];

  return v14;
}

- (void)setLineImageViewSize:(double)a3
{
  if (self->_lineImageViewSize != a3)
  {
    self->_lineImageViewSize = a3;
    if (![(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
    {
      [(MKTransitDeparturesCell *)self lineImageViewSize];
      -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
      -[NSLayoutConstraint setConstant:](self->_labelLeadingMarginConstraint, "setConstant:");
    }
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (void)setShowNoConnectionEnDash:(BOOL)a3
{
  if (self->_showNoConnectionEmDash != a3) {
    self->_showNoConnectionEmDash = a3;
  }
}

- (void)setCountdownReferenceDate:(id)a3
{
  p_countdownReferenceDate = &self->_countdownReferenceDate;
  id v5 = a3;
  if (!-[NSDate isEqualToDate:](*p_countdownReferenceDate, "isEqualToDate:")) {
    objc_storeStrong((id *)p_countdownReferenceDate, a3);
  }
}

- (void)setDepartures:(id)a3
{
  p_departures = &self->_departures;
  id v5 = a3;
  if ((-[NSArray isEqual:](*p_departures, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_departures, a3);
  }
}

- (void)setOperatingHours:(id)a3
{
  p_operatingHours = &self->_operatingHours;
  id v5 = a3;
  if ((-[NSString isEqual:](*p_operatingHours, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_operatingHours, a3);
  }
}

- (void)setFrequency:(id)a3
{
  p_frequency = &self->_frequency;
  id v5 = a3;
  if ((-[NSString isEqual:](*p_frequency, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_frequency, a3);
  }
}

+ (id)displayableCountdowDepartureDatesFromDates:(id)a3 withReferenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__MKTransitDeparturesCell_displayableCountdowDepartureDatesFromDates_withReferenceDate___block_invoke;
  v11[3] = &unk_1E54BD210;
  id v13 = v15;
  id v9 = v8;
  id v12 = v9;
  uint64_t v14 = 2;
  [a1 _enumerateMinutesUntilDepartureDates:v6 withReferenceDate:v7 block:v11];

  _Block_object_dispose(v15, 8);

  return v9;
}

void __88__MKTransitDeparturesCell_displayableCountdowDepartureDatesFromDates_withReferenceDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v9 = v7;
  if (a3) {
    goto LABEL_2;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
LABEL_2:
    [*(id *)(a1 + 32) addObject:v7];
  }
  if ([*(id *)(a1 + 32) count] == *(void *)(a1 + 48)) {
    *a4 = 1;
  }
}

+ (id)_nowString
{
  return _MKLocalizedStringFromThisBundle(@"TransitDeparture_Now");
}

+ (void)_enumerateMinutesUntilDepartureDates:(id)a3 withReferenceDate:(id)a4 block:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, uint64_t, unsigned char *))a5;
  if (v9)
  {
    char v23 = 0;
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        objc_msgSend(v15, "timeIntervalSinceDate:", v8, (void)v19);
        double v17 = v16;
        if ((GEOTransitDepartureIsImminentDepartureTimeInterval() & 1) != 0 || (uint64_t)v17 < -59) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = (uint64_t)v17 / 60;
        }
        v9[2](v9, v15, v18, &v23);
        if (v23) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v12) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
}

- (id)_departureDates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(MKTransitDeparturesCell *)self departures];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(MKTransitDeparturesCell *)self departures];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 departureDate];
        if (([v11 isCanceled] & 1) == 0 && v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)[v5 copy];

  return v13;
}

- (unint64_t)_displayableDeparturesCount
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  BOOL v3 = objc_opt_class();
  id v4 = [(MKTransitDeparturesCell *)self _departureDates];
  id v5 = [(MKTransitDeparturesCell *)self countdownReferenceDate];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MKTransitDeparturesCell__displayableDeparturesCount__block_invoke;
  v9[3] = &unk_1E54BD238;
  v9[4] = v14;
  v9[5] = &v10;
  [v3 _enumerateMinutesUntilDepartureDates:v4 withReferenceDate:v5 block:v9];

  unint64_t v6 = [(MKTransitDeparturesCell *)self departureStyle];
  if (v6 > 5 || ((1 << v6) & 0x34) == 0)
  {
    if ([(MKTransitDeparturesCell *)self isShowingNoConnectionEmDash]) {
      ++v11[3];
    }
  }
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v7;
}

uint64_t __54__MKTransitDeparturesCell__displayableDeparturesCount__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    goto LABEL_2;
  }
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
LABEL_2:
    ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  return result;
}

+ (void)_addEmDashAttributes:(id)a3
{
  id v11 = a3;
  uint64_t v3 = [v11 string];
  uint64_t v4 = [v3 rangeOfString:@"—"];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    uint64_t v8 = *MEMORY[0x1E4F42510];
    uint64_t v9 = +[MKInfoCardThemeManager currentTheme];
    uint64_t v10 = [v9 lightTextColor];
    objc_msgSend(v11, "addAttribute:value:range:", v8, v10, v6, v7);
  }
}

- (id)_incidentIcon
{
  id v2 = [(MKTransitDeparturesCell *)self window];
  uint64_t v3 = [v2 screen];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 scale];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 scale];
  }

  return MKTransitIncidentIcon();
}

- (void)_addIncidentIcon
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (!self->_incidentIconImageView)
  {
    uint64_t v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    incidentIconImageView = self->_incidentIconImageView;
    self->_incidentIconImageView = v3;

    [(UIImageView *)self->_incidentIconImageView setAccessibilityIdentifier:@"IncidentIconImageView"];
    [(UIImageView *)self->_incidentIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 4;
    }
    [(UIImageView *)self->_incidentIconImageView setContentMode:v5];
    uint64_t v6 = [(MKTransitDeparturesCell *)self _incidentIcon];
    [(UIImageView *)self->_incidentIconImageView setImage:v6];
  }
  uint64_t v7 = [(MKTransitDeparturesCell *)self contentView];
  [v7 addSubview:self->_incidentIconImageView];

  if ([(MKTransitDeparturesCell *)self _newStationCardUIEnabled])
  {
    uint64_t v8 = [(UIImageView *)self->_incidentIconImageView heightAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:10.0];

    [v9 setActive:1];
    uint64_t v10 = [(UIImageView *)self->_incidentIconImageView widthAnchor];
    id v11 = [(UIImageView *)self->_incidentIconImageView heightAnchor];
    uint64_t v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];
  }
  incidentIconHorizontalConstraint = self->_incidentIconHorizontalConstraint;
  if (!incidentIconHorizontalConstraint)
  {
    uint64_t v14 = [(UIImageView *)self->_incidentIconImageView trailingAnchor];
    char v15 = [(UIImageView *)self->_lineImageView trailingAnchor];
    long long v16 = [v14 constraintEqualToAnchor:v15];
    long long v17 = self->_incidentIconHorizontalConstraint;
    self->_incidentIconHorizontalConstraint = v16;

    incidentIconHorizontalConstraint = self->_incidentIconHorizontalConstraint;
  }
  long long v18 = (void *)MEMORY[0x1E4F28DC8];
  v23[0] = incidentIconHorizontalConstraint;
  long long v19 = [(UIImageView *)self->_incidentIconImageView bottomAnchor];
  uint64_t v20 = [(UIImageView *)self->_lineImageView bottomAnchor];
  long long v21 = [v19 constraintEqualToAnchor:v20 constant:4.0];
  v23[1] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v18 activateConstraints:v22];

  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (void)_removeIncidentIcon
{
}

- (void)setShowIncidentIcon:(BOOL)a3
{
  if (self->_showIncidentIcon != a3)
  {
    self->_showIncidentIcon = a3;
    if (a3) {
      [(MKTransitDeparturesCell *)self _addIncidentIcon];
    }
    else {
      [(MKTransitDeparturesCell *)self _removeIncidentIcon];
    }
  }
}

- (void)setIncidentTitle:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  incidentTitle = self->_incidentTitle;
  if (incidentTitle != v4)
  {
    uint64_t v9 = v4;
    BOOL v6 = [(NSString *)incidentTitle isEqualToString:v4];
    uint64_t v4 = v9;
    if (!v6)
    {
      uint64_t v7 = (NSString *)[(NSString *)v9 copy];
      uint64_t v8 = self->_incidentTitle;
      self->_incidentTitle = v7;

      [(MKTransitDeparturesCell *)self setIncidentButtonHidden:[(NSString *)self->_incidentTitle length] == 0];
      uint64_t v4 = v9;
    }
  }
}

- (void)_incidentButtonPressed
{
  id v3 = [(MKTransitDeparturesCell *)self delegate];
  [v3 incidentButtonSelectedInDeparturesCell:self];
}

- (void)setIncidentButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIButton *)self->_incidentButton isHidden] != a3)
  {
    [(UIButton *)self->_incidentButton setHidden:v3];
    if (!v3)
    {
      incidentButton = self->_incidentButton;
      id v6 = [(MKTransitDeparturesCell *)self incidentTitle];
      [(UIButton *)incidentButton setTitle:v6 forState:0];
    }
  }
}

+ (double)maxLineImageWidthforWidth:(double)a3
{
  double result = a3 * 0.150000006;
  if (result < 22.0) {
    return 22.0;
  }
  return result;
}

- (double)_labelMarginWithLineImageViewWidth:(double)a3
{
  if (![(MKTransitDeparturesCell *)self _newStationCardUIEnabled]) {
    return a3 + 12.0;
  }
  uint64_t v5 = [(UIImageView *)self->_lineImageView image];

  double result = a3 + 12.0;
  if (!v5) {
    return 0.0;
  }
  return result;
}

+ (BOOL)_needsUpdateMaxLabelWidths
{
  id v2 = (void *)_MergedGlobals_3_7;
  BOOL v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  if ([v2 isEqual:v3])
  {
    uint64_t v4 = (void *)qword_1EB315B60;
    uint64_t v5 = [MEMORY[0x1E4F42738] sharedApplication];
    id v6 = [v5 preferredContentSizeCategory];
    int v7 = [v4 isEqualToString:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

+ (void)_calculateMaxLabelWidths
{
  v40[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  v40[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*MEMORY[0x1E4F64CB8]];
  v40[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  int v7 = [a1 _attributedStringForCountdownDepartures:v5 referenceDate:v6 isShowingNoConnectionEmDash:1];

  uint64_t v33 = v7;
  uint64_t v8 = [v7 string];
  uint64_t v9 = *MEMORY[0x1E4F42508];
  uint64_t v38 = *MEMORY[0x1E4F42508];
  uint64_t v10 = [a1 _departureLabelFont];
  long long v39 = v10;
  unint64_t v11 = 0x1E4F1C000uLL;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v8 sizeWithAttributes:v12];
  double v14 = v13;

  char v15 = [MEMORY[0x1E4F1C9C8] date];
  long long v16 = [a1 _stringFromTimestampDate:v15 departureTimeZone:0];
  unint64_t v17 = 0;
  double v18 = 0.0;
  while (1)
  {

    if (v17 > 5 || ((1 << v17) & 0x35) == 0) {
      break;
    }
    char v15 = objc_msgSend(NSString, "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", v17, v16);
    if (v15)
    {
      uint64_t v36 = v9;
      long long v19 = [a1 _departureDetailLabelFont];
      long long v37 = v19;
      uint64_t v20 = [*(id *)(v11 + 2536) dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v15 sizeWithAttributes:v20];
      if (v18 <= v21)
      {
        uint64_t v34 = v9;
        long long v22 = [a1 _departureDetailLabelFont];
        uint64_t v35 = v22;
        [*(id *)(v11 + 2536) dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v24 = unint64_t v23 = v11;
        [v15 sizeWithAttributes:v24];
        double v18 = v25;

        unint64_t v11 = v23;
      }
    }
    ++v17;
  }
  if (v14 <= v18) {
    *(double *)&uint64_t v26 = v18;
  }
  else {
    *(double *)&uint64_t v26 = v14;
  }
  qword_1EB315BA0 = v26;
  uint64_t v27 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v28 = (void *)_MergedGlobals_3_7;
  _MergedGlobals_3_7 = v27;

  uint64_t v29 = [MEMORY[0x1E4F42738] sharedApplication];
  double v30 = [v29 preferredContentSizeCategory];
  uint64_t v31 = [v30 copy];
  char v32 = (void *)qword_1EB315B60;
  qword_1EB315B60 = v31;
}

+ (double)_maxExpectedDepartureLabelWidth
{
  if ([a1 _needsUpdateMaxLabelWidths]) {
    [a1 _calculateMaxLabelWidths];
  }
  return *(double *)&qword_1EB315BA0;
}

+ (double)_minTextWidth
{
  return 200.0;
}

+ (void)useCompressedGutter:(BOOL *)a3 compressedLeading:(BOOL *)a4 forImageWidth:(double)a5 inWidth:(double)a6
{
  uint64_t v8 = a4;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  [(id)objc_opt_class() _minTextWidth];
  double v11 = a6 - v10 - a5;
  if (v11 + -12.0 < 0.0)
  {
    if (v11 + -8.0 >= 0.0)
    {
      uint64_t v8 = a3;
      if (!a3) {
        return;
      }
    }
    else
    {
      if (a3) {
        *a3 = 1;
      }
      if (!v8) {
        return;
      }
    }
    *uint64_t v8 = 1;
  }
}

- (void)setUseCompressedGutter:(BOOL)a3
{
  if (self->_useCompressedGutter != a3)
  {
    self->_useCompressedGutter = a3;
    lineImageToTextGutterConstraint = self->_lineImageToTextGutterConstraint;
    double v4 = -12.0;
    if (a3) {
      double v4 = -8.0;
    }
    [(NSLayoutConstraint *)lineImageToTextGutterConstraint setConstant:v4];
  }
}

- (void)setUseCompressedLeading:(BOOL)a3
{
  if (self->_useCompressedLeading == a3)
  {
    if (self->_useCompressedLeading) {
      uint64_t v4 = 1304;
    }
    else {
      uint64_t v4 = 1296;
    }
    if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + v4)) {
      return;
    }
  }
  else
  {
    self->_useCompressedLeading = a3;
  }
  uint64_t v5 = [(MKTransitDeparturesCell *)self contentView];
  id v6 = [v5 layoutMarginsGuide];
  id v16 = [v6 leadingAnchor];

  if (self->_useCompressedLeading)
  {
    int v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageLeadingConstraint;
    p_lineImageCompressedLeadingConstraint = (id *)&self->_lineImageCompressedLeadingConstraint;
    if (!self->_lineImageCompressedLeadingConstraint)
    {
      int v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageLeadingConstraint;
      uint64_t v9 = [(UIImageView *)self->_lineImageView leadingAnchor];
      uint64_t v10 = [v9 constraintGreaterThanOrEqualToAnchor:v16 constant:12.0];
      id v11 = *p_lineImageCompressedLeadingConstraint;
      id *p_lineImageCompressedLeadingConstraint = (id)v10;

      LODWORD(v12) = 1148813312;
      [*p_lineImageCompressedLeadingConstraint setPriority:v12];
    }
  }
  else
  {
    int v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageCompressedLeadingConstraint;
    p_lineImageCompressedLeadingConstraint = (id *)&self->_lineImageLeadingConstraint;
    if (!self->_lineImageLeadingConstraint)
    {
      int v7 = &OBJC_IVAR___MKTransitDeparturesCell__lineImageCompressedLeadingConstraint;
      double v13 = [(UIImageView *)self->_lineImageView leadingAnchor];
      uint64_t v14 = [v13 constraintGreaterThanOrEqualToAnchor:v16];
      id v15 = *p_lineImageCompressedLeadingConstraint;
      id *p_lineImageCompressedLeadingConstraint = (id)v14;
    }
  }
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v7) setActive:0];
  [*p_lineImageCompressedLeadingConstraint setActive:1];
}

- (double)labelMargin
{
  [(MKTransitDeparturesCell *)self lineImageViewSize];

  -[MKTransitDeparturesCell _labelMarginWithLineImageViewWidth:](self, "_labelMarginWithLineImageViewWidth:");
  return result;
}

+ (id)strongSecondaryFont
{
  id v2 = (void *)qword_1EB315B80;
  if (!qword_1EB315B80)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 32770);
    uint64_t v4 = (void *)qword_1EB315B80;
    qword_1EB315B80 = v3;

    id v2 = (void *)qword_1EB315B80;
  }

  return v2;
}

+ (id)defaultSecondaryFont
{
  id v2 = (void *)qword_1EB315B88;
  if (!qword_1EB315B88)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 0x8000);
    uint64_t v4 = (void *)qword_1EB315B88;
    qword_1EB315B88 = v3;

    id v2 = (void *)qword_1EB315B88;
  }

  return v2;
}

+ (id)_departureLabelFont
{
  id v2 = (void *)qword_1EB315B70;
  if (!qword_1EB315B70)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F43870], 0);
    uint64_t v4 = (void *)qword_1EB315B70;
    qword_1EB315B70 = v3;

    id v2 = (void *)qword_1EB315B70;
  }

  return v2;
}

+ (id)_departureDetailLabelFont
{
  id v2 = (void *)qword_1EB315B78;
  if (!qword_1EB315B78)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleTimeDisplayInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 0);
    uint64_t v4 = (void *)qword_1EB315B78;
    qword_1EB315B78 = v3;

    id v2 = (void *)qword_1EB315B78;
  }

  return v2;
}

+ (id)_primaryFont
{
  id v2 = (void *)qword_1EB315B68;
  if (!qword_1EB315B68)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43870]);
    uint64_t v4 = (void *)qword_1EB315B68;
    qword_1EB315B68 = v3;

    id v2 = (void *)qword_1EB315B68;
  }

  return v2;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MKCustomSeparatorCell *)self isSeparatorHidden];
  v6.receiver = self;
  v6.super_class = (Class)MKTransitDeparturesCell;
  [(MKCustomSeparatorCell *)&v6 setSeparatorHidden:v3];
  if (v5 != [(MKCustomSeparatorCell *)self isSeparatorHidden]) {
    [(MKTransitDeparturesCell *)self _updateConstraintValues];
  }
}

- (BOOL)_newStationCardUIEnabled
{
  return 1;
}

- (double)_labelToTopScaledConstantForFullCenteredCellStyle
{
  if (![(MKTransitDeparturesCell *)self _newStationCardUIEnabled]) {
    return 45.0;
  }
  BOOL v3 = [(UIImageView *)self->_lineImageView image];

  double result = 37.0;
  if (!v3) {
    return 29.0;
  }
  return result;
}

- (double)_labelToBottomScaledConstantForFullCenteredCellStyle
{
  BOOL v2 = [(MKTransitDeparturesCell *)self _newStationCardUIEnabled];
  double result = 33.0;
  if (v2) {
    return 17.0;
  }
  return result;
}

- (double)lineImageViewSize
{
  return self->_lineImageViewSize;
}

- (NSArray)departures
{
  return self->_departures;
}

- (unint64_t)departureStyle
{
  return self->_departureStyle;
}

- (void)setDepartureStyle:(unint64_t)a3
{
  self->_departureStyle = a3;
}

- (NSDate)countdownReferenceDate
{
  return self->_countdownReferenceDate;
}

- (NSTimeZone)departureTimeZone
{
  return self->_departureTimeZone;
}

- (void)setDepartureTimeZone:(id)a3
{
}

- (BOOL)isShowingNoConnectionEmDash
{
  return self->_showNoConnectionEmDash;
}

- (void)setShowNoConnectionEmDash:(BOOL)a3
{
  self->_showNoConnectionEmDash = a3;
}

- (BOOL)isShowingIncidentIcon
{
  return self->_showIncidentIcon;
}

- (NSString)incidentTitle
{
  return self->_incidentTitle;
}

- (MKTransitDeparturesCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKTransitDeparturesCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (NSString)operatingHours
{
  return self->_operatingHours;
}

- (NSString)frequency
{
  return self->_frequency;
}

- (BOOL)useCompressedGutter
{
  return self->_useCompressedGutter;
}

- (BOOL)useCompressedLeading
{
  return self->_useCompressedLeading;
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (void)setDepartureCutoffDate:(id)a3
{
}

- (BOOL)useMultilineDeparturesLabel
{
  return self->_useMultilineDeparturesLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_operatingHours, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentTitle, 0);
  objc_storeStrong((id *)&self->_departureTimeZone, 0);
  objc_storeStrong((id *)&self->_countdownReferenceDate, 0);
  objc_storeStrong((id *)&self->_departures, 0);
  objc_storeStrong((id *)&self->_lineImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelToDisclosureArrowConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureArrowImageView, 0);
  objc_storeStrong((id *)&self->_lineImageCompressedLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageToTextGutterConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStackToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryStackToPrimaryConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_incidentIconHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewCenteringVerticalPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewCenteringConstraint, 0);
  objc_storeStrong((id *)&self->_departureStackViewTopToPrimaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_departureStackViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_lineImageToContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_departureDependentConstraintsByView, 0);
  objc_storeStrong((id *)&self->_minimumDepartureLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTextStackView, 0);
  objc_storeStrong((id *)&self->_departureStackView, 0);
  objc_storeStrong((id *)&self->_departureDetailLabel, 0);
  objc_storeStrong((id *)&self->_departureLabel, 0);
  objc_storeStrong((id *)&self->_incidentButton, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_incidentIconImageView, 0);
  objc_storeStrong((id *)&self->_lineImageView, 0);
  objc_storeStrong((id *)&self->_currentCellStyleConstraints, 0);

  objc_storeStrong((id *)&self->_constraintsByCellStyle, 0);
}

@end