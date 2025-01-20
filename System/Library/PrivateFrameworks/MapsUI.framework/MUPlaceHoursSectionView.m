@interface MUPlaceHoursSectionView
- (MUPlaceHoursSectionView)initWithSectionViewConfiguration:(id)a3;
- (MUPlaceHoursSectionViewConfiguration)sectionViewConfiguration;
- (MUPlaceHoursSectionViewDelegate)expandDelegate;
- (void)_performExpansion;
- (void)_recalculateStackingIfNeeded;
- (void)_setupViews;
- (void)expandableHoursViewDidExpand:(id)a3;
- (void)layoutSubviews;
- (void)setExpandDelegate:(id)a3;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation MUPlaceHoursSectionView

- (MUPlaceHoursSectionView)initWithSectionViewConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceHoursSectionView;
  v6 = [(MUPlaceVerticalCardContainerView *)&v9 initWithShowsSeparators:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionViewConfiguration, a3);
    [(MUPlaceHoursSectionView *)v7 _setupViews];
    [(MUPlaceVerticalCardContainerView *)v7 setDelegate:v7];
  }

  return v7;
}

- (void)_setupViews
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MUPlaceHoursSectionViewConfiguration *)self->_sectionViewConfiguration placeHours];

  if (v4)
  {
    id v5 = [MUExpandableHoursView alloc];
    v6 = [(MUPlaceHoursSectionViewConfiguration *)self->_sectionViewConfiguration placeHours];
    v7 = [(MUExpandableHoursView *)v5 initWithBusinessHoursConfiguration:v6];

    [(MUExpandableHoursView *)v7 setDelegate:self];
    [v3 addObject:v7];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v8 = [(MUPlaceHoursSectionViewConfiguration *)self->_sectionViewConfiguration serviceHoursList];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v9)
  {

    v33 = (NSArray *)[v3 copy];
    hoursViews = self->_hoursViews;
    self->_hoursViews = v33;
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  v43 = v3;
  char v41 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = [[MUExpandableHoursView alloc] initWithBusinessHoursConfiguration:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      [(MUExpandableHoursView *)v14 setDelegate:self];
      [v43 addObject:v14];
      if (v11 + i >= [(MUPlaceHoursSectionViewConfiguration *)self->_sectionViewConfiguration numberOfInlineServiceHours])
      {
        char v41 = 1;
        [(MUExpandableHoursView *)v14 setHidden:1];
      }
    }
    v11 += v10;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v10);

  id v3 = v43;
  v15 = (NSArray *)[v43 copy];
  v16 = self->_hoursViews;
  self->_hoursViews = v15;

  if (v41)
  {
    v17 = +[MUInfoCardStyle labelForProminence:0];
    moreLabel = self->_moreLabel;
    self->_moreLabel = v17;

    [(MULabelViewProtocol *)self->_moreLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = _MULocalizedStringFromThisBundle(@"More [Hours]");
    [(MULabelViewProtocol *)self->_moreLabel setText:v19];

    v20 = +[MUInfoCardStyle tintColor];
    [(MULabelViewProtocol *)self->_moreLabel setTextColor:v20];

    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(MULabelViewProtocol *)self->_moreLabel setFont:v21];

    [(MULabelViewProtocol *)self->_moreLabel setAdjustsFontForContentSizeCategory:1];
    v22 = [MUPlaceSectionRowView alloc];
    v23 = -[MUPlaceSectionRowView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MUPlaceSectionRowView *)v23 setHandlesHighlighting:1];
    [(MUPlaceSectionRowView *)v23 addSubview:self->_moreLabel];
    moreRowView = self->_moreRowView;
    self->_moreRowView = v23;
    hoursViews = v23;

    id v3 = v43;
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(MULabelViewProtocol *)self->_moreLabel leadingAnchor];
    v40 = [(NSArray *)hoursViews leadingAnchor];
    v39 = [v42 constraintEqualToAnchor:v40 constant:16.0];
    v48[0] = v39;
    v38 = [(MULabelViewProtocol *)self->_moreLabel topAnchor];
    v37 = [(NSArray *)hoursViews topAnchor];
    v35 = [v38 constraintEqualToAnchor:v37 constant:11.0];
    v48[1] = v35;
    v26 = [(MULabelViewProtocol *)self->_moreLabel bottomAnchor];
    v27 = [(NSArray *)hoursViews bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:-11.0];
    v48[2] = v28;
    v29 = [(MULabelViewProtocol *)self->_moreLabel trailingAnchor];
    v30 = [(NSArray *)hoursViews trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:-16.0];
    v48[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [v36 activateConstraints:v32];

    [v43 addObject:hoursViews];
LABEL_15:
  }
  v34 = (void *)[v3 copy];
  [(MUPlaceVerticalCardContainerView *)self setRowViews:v34];
}

- (void)_performExpansion
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MUPlaceHoursSectionView__performExpansion__block_invoke;
  v5[3] = &unk_1E574F3A8;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MUPlaceHoursSectionView__performExpansion__block_invoke_2;
  v3[3] = &unk_1E574F070;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v5 animations:v3 completion:0.200000003];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__MUPlaceHoursSectionView__performExpansion__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = objc_msgSend(WeakRetained, "arrangedSubviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setHidden:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [v2[58] setHidden:1];
  }
}

void __44__MUPlaceHoursSectionView__performExpansion__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained removeArrangedSubview:WeakRetained[58]];
    WeakRetained = v2;
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceHoursSectionView;
  [(MUPlaceHoursSectionView *)&v4 layoutSubviews];
  [(MUPlaceHoursSectionView *)self _recalculateStackingIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceHoursSectionView;
  [(MUPlaceHoursSectionView *)&v3 layoutSubviews];
}

- (void)_recalculateStackingIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = self->_hoursViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [(MUPlaceHoursSectionView *)self bounds];
        if ([v7 shouldStackForProposedWidth:CGRectGetWidth(v24)])
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v8 = self->_hoursViews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * j), "setStacked:", v4, (void)v13);
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  if (self->_moreRowView == a4) {
    [(MUPlaceHoursSectionView *)self _performExpansion];
  }
}

- (void)expandableHoursViewDidExpand:(id)a3
{
  id v7 = a3;
  unint64_t v4 = -[NSArray indexOfObject:](self->_hoursViews, "indexOfObject:");
  if (v4 < [(NSArray *)self->_hoursViews count])
  {
    uint64_t v5 = [v7 hoursConfiguration];
    uint64_t v6 = [(MUPlaceHoursSectionView *)self expandDelegate];
    objc_msgSend(v6, "hoursSectionView:didExpand:forConfiguration:", self, objc_msgSend(v7, "isExpanded"), v5);
  }
}

- (MUPlaceHoursSectionViewDelegate)expandDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandDelegate);
  return (MUPlaceHoursSectionViewDelegate *)WeakRetained;
}

- (void)setExpandDelegate:(id)a3
{
}

- (MUPlaceHoursSectionViewConfiguration)sectionViewConfiguration
{
  return self->_sectionViewConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_expandDelegate);
  objc_storeStrong((id *)&self->_hoursViews, 0);
  objc_storeStrong((id *)&self->_moreRowView, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
}

@end