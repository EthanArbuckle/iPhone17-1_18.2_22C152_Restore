@interface MUExpandableHoursView
- (BOOL)isExpanded;
- (BOOL)isStacked;
- (BOOL)shouldStackForProposedWidth:(double)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MUBusinessHoursConfiguration)hoursConfiguration;
- (MUExpandableHoursView)initWithBusinessHoursConfiguration:(id)a3;
- (MUExpandableHoursViewDelegate)delegate;
- (void)_addDayRowViewsToStackViewIfNeeded;
- (void)_buildDayRowViewModels;
- (void)_createDayRowViewsIfNeeded;
- (void)_invokeChildrenOfStackingChange;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)_setupStackView;
- (void)_updateHoursVisibilityAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setStacked:(BOOL)a3;
@end

@implementation MUExpandableHoursView

- (MUExpandableHoursView)initWithBusinessHoursConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUExpandableHoursView;
  v6 = -[MUPlaceSectionRowView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    v7 = MUGetMUExpandableHoursViewLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUExpandableHoursViewInit", "", v10, 2u);
    }

    objc_storeStrong((id *)&v6->_config, a3);
    v6->_expanded = 0;
    [(MUExpandableHoursView *)v6 setAccessibilityIdentifier:@"ExpandableHours"];
    [(MUExpandableHoursView *)v6 _buildDayRowViewModels];
    [(MUExpandableHoursView *)v6 _setupStackView];
    [(UIView *)v6 _mapsui_addSelectGestureRecognizerWithTarget:v6->_hoursSummaryView action:sel_expandButtonTapped];
    v8 = MUGetMUExpandableHoursViewLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUExpandableHoursViewInit", "", v10, 2u);
    }
  }
  return v6;
}

- (void)_buildDayRowViewModels
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v36 = self;
  id obj = [(MUBusinessHoursConfiguration *)self->_config businessHours];
  uint64_t v37 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v37)
  {
    uint64_t v38 = 1;
    uint64_t v35 = *(void *)v43;
    unint64_t v4 = 0x1E4F31000uLL;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v5;
        v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        v41 = &stru_1EE3BF360;
        if ([v6 hoursType] != v38)
        {
          uint64_t v38 = [v6 hoursType];
          uint64_t v7 = [v6 hoursType];
          if (v7 == 2)
          {
            v8 = [v6 localizedMessage];
            if (v8) {
              goto LABEL_12;
            }
            v10 = [*(id *)(v4 + 224) localizedHoursDayRangeString:v6];
            objc_super v11 = v10;
            if (v10)
            {
              v12 = v10;
            }
            else
            {
              v12 = [*(id *)(v4 + 224) localizedHoursStringSpecialHours];
            }
            v41 = v12;

LABEL_18:
            v9 = 0;
          }
          else
          {
            if (v7 != 1)
            {
              v41 = &stru_1EE3BF360;
              goto LABEL_20;
            }
            v8 = [v6 localizedMessage];
            if (!v8)
            {
              v41 = [*(id *)(v4 + 224) localizedHoursStringNormalHours];
              goto LABEL_18;
            }
LABEL_12:
            v9 = v8;
            v41 = v9;
          }
        }
LABEL_20:
        id v13 = objc_alloc(*(Class *)(v4 + 224));
        v14 = [(MUBusinessHoursConfiguration *)v36->_config placeTimeZone];
        v15 = (void *)[v13 initWithBusinessHours:v6 timeZone:v14 localizedHoursStringOptions:2];

        v16 = [v15 operatingHours];
        v17 = [v16 placeDailyHours];
        v18 = [v15 formatData:v17];

        v19 = [v18 objectForKeyedSubscript:@"DaysShort"];
        v20 = [v18 objectForKeyedSubscript:@"DaysFull"];
        v21 = [v18 objectForKeyedSubscript:@"HoursFull"];
        v39 = v18;
        v22 = [v18 objectForKeyedSubscript:@"SingularWeekdayIdentifier"];
        if ([v19 count])
        {
          unint64_t v23 = 0;
          do
          {
            v24 = objc_alloc_init(MUDayRowViewModel);
            v25 = v24;
            if (!v23) {
              [(MUDayRowViewModel *)v24 setLabelHeaderString:v41];
            }
            v26 = [v22 objectAtIndexedSubscript:v23];
            int v27 = [v26 BOOLValue];

            if (v27) {
              v28 = v20;
            }
            else {
              v28 = v19;
            }
            v29 = [v28 objectAtIndexedSubscript:v23];
            [(MUDayRowViewModel *)v25 setDayString:v29];

            v30 = [v21 objectAtIndexedSubscript:v23];
            [(MUDayRowViewModel *)v25 setHourStrings:v30];

            v31 = [v15 AMPMSymbols];
            [(MUDayRowViewModel *)v25 setAMPMStrings:v31];

            [v3 addObject:v25];
            ++v23;
          }
          while (v23 < [v19 count]);
        }

        uint64_t v5 = v40 + 1;
        unint64_t v4 = 0x1E4F31000;
      }
      while (v40 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v37);
  }

  uint64_t v32 = [v3 copy];
  dayRowViewModels = v36->_dayRowViewModels;
  v36->_dayRowViewModels = (NSArray *)v32;
}

- (void)_createDayRowViewsIfNeeded
{
  if (!self->_dayRowViews)
  {
    MUMap(self->_dayRowViewModels, &__block_literal_global_31);
    id v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dayRowViews = self->_dayRowViews;
    self->_dayRowViews = v3;
    MEMORY[0x1F41817F8](v3, dayRowViews);
  }
}

MUDayRowView *__51__MUExpandableHoursView__createDayRowViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MUDayRowView alloc] initWithViewModel:v2];

  return v3;
}

- (void)_addDayRowViewsToStackViewIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(MUStackView *)self->_contentStackView arrangedSubviews];
  char v4 = [v3 isEqual:self->_dayRowViews];

  if ((v4 & 1) == 0)
  {
    [(MUExpandableHoursView *)self _createDayRowViewsIfNeeded];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = self->_dayRowViews;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          v10 = v7;
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          objc_super v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [(MUStackView *)self->_contentStackView addArrangedSubview:v11];
          v12 = [v11 viewModel];
          id v13 = [v12 labelHeaderString];
          uint64_t v14 = [v13 length];

          if (v10)
          {
            if (v14) {
              [(MUStackView *)self->_contentStackView setCustomSpacing:v10 afterView:12.0];
            }
          }
          id v7 = v11;

          v15 = [v7 widthAnchor];
          v16 = [(MUStackView *)self->_contentStackView widthAnchor];
          v17 = [v15 constraintEqualToAnchor:v16];
          [v17 setActive:1];

          [v7 setHidden:1];
          [v7 layoutIfNeeded];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
}

- (void)_setupStackView
{
  v39[2] = *MEMORY[0x1E4F143B8];
  [(MUExpandableHoursView *)self setInsetsLayoutMarginsFromSafeArea:0];
  -[MUExpandableHoursView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 12.0, 16.0, 12.0, 16.0);
  id v3 = [MUStackView alloc];
  char v4 = -[MUStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  [(MUStackView *)self->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUStackView *)self->_contentStackView setAxis:1];
  [(MUStackView *)self->_contentStackView setAlpha:0.0];
  [(MUStackView *)self->_contentStackView setAccessibilityIdentifier:@"ExpandedStack"];
  id v6 = objc_alloc(MEMORY[0x1E4F310E0]);
  id v7 = [(MUBusinessHoursConfiguration *)self->_config businessHours];
  uint64_t v8 = [v7 firstObject];
  v9 = [(MUBusinessHoursConfiguration *)self->_config placeTimeZone];
  v10 = (void *)[v6 initWithBusinessHours:v8 timeZone:v9 localizedHoursStringOptions:272];

  objc_super v11 = objc_alloc_init(MUHoursSummaryViewModel);
  v12 = [(MUBusinessHoursConfiguration *)self->_config hoursName];
  [(MUHoursSummaryViewModel *)v11 setTitleText:v12];

  id v13 = [v10 AMPMSymbols];
  [(MUHoursSummaryViewModel *)v11 setAMPMSymbols:v13];

  [(MUHoursSummaryViewModel *)v11 setServiceHours:[(MUBusinessHoursConfiguration *)self->_config isServiceHours]];
  [(MUHoursSummaryViewModel *)v11 setHideChevron:[(NSArray *)self->_dayRowViewModels count] == 0];
  if (([v10 geoMapItemOpeningHourOptions] & 0x198) == 0)
  {
    uint64_t v14 = [v10 localizedOperatingHours];
    [(MUHoursSummaryViewModel *)v11 setHoursText:v14];
  }
  v15 = [v10 localizedOpenState];
  [(MUHoursSummaryViewModel *)v11 setOpenStateText:v15];

  v16 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [v10 updateHoursLabelColorWithDefaultLabelColor:v16];

  v17 = [v10 hoursStateLabelColor];
  v18 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v17];
  [(MUHoursSummaryViewModel *)v11 setOpenStateColor:v18];

  long long v19 = [v10 AMPMSymbols];
  [(MUHoursSummaryViewModel *)v11 setAMPMSymbols:v19];

  long long v20 = [[MUHoursSummaryView alloc] initWithViewModel:v11];
  hoursSummaryView = self->_hoursSummaryView;
  self->_hoursSummaryView = v20;

  [(MUHoursSummaryView *)self->_hoursSummaryView setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(NSArray *)self->_dayRowViewModels count])
  {
    objc_initWeak(&location, self);
    long long v22 = self->_hoursSummaryView;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __40__MUExpandableHoursView__setupStackView__block_invoke;
    uint64_t v35 = &unk_1E574F3A8;
    objc_copyWeak(&v36, &location);
    [(MUHoursSummaryView *)v22 setActionHandler:&v32];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  -[MUExpandableHoursView addSubview:](self, "addSubview:", self->_hoursSummaryView, v32, v33, v34, v35);
  [(MUExpandableHoursView *)self addSubview:self->_contentStackView];
  unint64_t v23 = [MUStackLayout alloc];
  uint64_t v24 = [(MUExpandableHoursView *)self layoutMarginsGuide];
  v25 = [(MUStackLayout *)v23 initWithContainer:v24 axis:1];
  p_summaryAndHoursStackLayout = &self->_summaryAndHoursStackLayout;
  summaryAndHoursStackLayout = self->_summaryAndHoursStackLayout;
  self->_summaryAndHoursStackLayout = v25;

  v28 = self->_contentStackView;
  v39[0] = self->_hoursSummaryView;
  v39[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [(MUStackLayout *)*p_summaryAndHoursStackLayout setArrangedLayoutItems:v29];

  v30 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v38 = *p_summaryAndHoursStackLayout;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  objc_msgSend(v30, "_mapsui_activateLayouts:", v31);
}

void __40__MUExpandableHoursView__setupStackView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setExpanded:animated:", objc_msgSend(WeakRetained, "isExpanded") ^ 1, 1);
    id WeakRetained = v2;
  }
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if ([(MUExpandableHoursView *)self isExpanded] != a3)
  {
    [(MUExpandableHoursView *)self setExpanded:v4];
    [(MUExpandableHoursView *)self _updateHoursVisibilityAnimated:1];
    id v6 = [(MUExpandableHoursView *)self delegate];
    [v6 expandableHoursViewDidExpand:self];
  }
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4FB2C68];
  double v4 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
  -[MUHoursSummaryView systemLayoutSizeFittingSize:](self->_hoursSummaryView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], v4);
  double v6 = v5;
  double v8 = v7;
  -[MUStackView systemLayoutSizeFittingSize:](self->_contentStackView, "systemLayoutSizeFittingSize:", v3, v4);
  double v11 = v10;
  if (v6 >= v9) {
    double v12 = v6;
  }
  else {
    double v12 = v9;
  }
  [(MUExpandableHoursView *)self directionalLayoutMargins];
  double v14 = v13 + v12;
  [(MUExpandableHoursView *)self directionalLayoutMargins];
  double v16 = v15 + v14;
  BOOL v17 = [(MUExpandableHoursView *)self isExpanded];
  double v18 = 0.0;
  if (v17) {
    double v18 = v11;
  }
  double v19 = v8 + v18;
  [(MUExpandableHoursView *)self directionalLayoutMargins];
  double v21 = v19 + v20;
  [(MUExpandableHoursView *)self directionalLayoutMargins];
  double v23 = v21 + v22;
  double v24 = v16;
  result.height = v23;
  result.width = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(MUExpandableHoursView *)self intrinsicContentSize];
  if (width < v5) {
    double v5 = width;
  }
  if (height < v6) {
    double v6 = height;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)_updateHoursVisibilityAnimated:(BOOL)a3
{
  if (a3) {
    double v4 = 0.300000012;
  }
  else {
    double v4 = 0.0;
  }
  objc_initWeak(&location, self);
  if ([(MUExpandableHoursView *)self isExpanded]) {
    [(MUExpandableHoursView *)self _addDayRowViewsToStackViewIfNeeded];
  }
  [(MUHoursSummaryView *)self->_hoursSummaryView handleAnimationStart];
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MUExpandableHoursView__updateHoursVisibilityAnimated___block_invoke;
  v6[3] = &unk_1E574F110;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "_mapsui_animateWithDuration:animations:completion:", v6, 0, v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__MUExpandableHoursView__updateHoursVisibilityAnimated___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[59] handleAnimation];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3[60];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8++), "setHidden:", objc_msgSend(v3, "isExpanded", (void)v13) ^ 1);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    int v9 = [v3 isExpanded];
    double v10 = 1.0;
    if (!v9) {
      double v10 = 0.0;
    }
    objc_msgSend(v3[58], "setAlpha:", v10, (void)v13);
    int v11 = [v3 isExpanded];
    double v12 = 12.0;
    if (!v11) {
      double v12 = 0.0;
    }
    [v3[61] setSpacing:v12];
    [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  }
}

- (BOOL)shouldStackForProposedWidth:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_dayRowViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "shouldStackForProposedWidth:", a3, (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)setStacked:(BOOL)a3
{
  if (self->_stacked != a3)
  {
    self->_stacked = a3;
    [(MUExpandableHoursView *)self _invokeChildrenOfStackingChange];
  }
}

- (void)_invokeChildrenOfStackingChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_dayRowViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setStacked:", self->_stacked, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (MUBusinessHoursConfiguration)hoursConfiguration
{
  return self->_config;
}

- (BOOL)isStacked
{
  return self->_stacked;
}

- (MUExpandableHoursViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUExpandableHoursViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dayRowViewModels, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_summaryAndHoursStackLayout, 0);
  objc_storeStrong((id *)&self->_dayRowViews, 0);
  objc_storeStrong((id *)&self->_hoursSummaryView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end