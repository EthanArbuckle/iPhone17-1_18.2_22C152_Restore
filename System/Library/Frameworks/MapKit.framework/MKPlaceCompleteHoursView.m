@interface MKPlaceCompleteHoursView
- (MKPlaceCompleteHoursView)initWithLinkedService:(id)a3 showTodaysHoursOnly:(BOOL)a4;
- (NSArray)placeHoursViews;
- (void)_contentSizeDidChange;
- (void)_setUpConstraints;
- (void)commonInit;
- (void)hoursViewDidUpdate:(id)a3;
- (void)setPlaceHoursViews:(id)a3;
@end

@implementation MKPlaceCompleteHoursView

- (MKPlaceCompleteHoursView)initWithLinkedService:(id)a3 showTodaysHoursOnly:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MKPlaceCompleteHoursView;
  v8 = -[MKPlaceCompleteHoursView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    id v22 = v7;
    objc_storeStrong((id *)&v8->_linkedService, a3);
    v10 = objc_opt_new();
    uint64_t v11 = [(GEOLinkedService *)v9->_linkedService businessHours];
    sortedBusinessHours = v9->_sortedBusinessHours;
    v9->_sortedBusinessHours = (NSArray *)v11;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = v9->_sortedBusinessHours;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [(MKPlaceHoursView *)[MKPlaceServiceHoursView alloc] initWithBusinessHours:*(void *)(*((void *)&v23 + 1) + 8 * v17)];
        [(MKPlaceHoursView *)v18 setHoursDelegate:v9];
        [v10 addObject:v18];

        if (a4) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v15) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    +[MKPlaceHoursViewHelper determineExtraRulesForPlaceHoursViews:v10 withBusinessHours:v9->_sortedBusinessHours];
    uint64_t v19 = [v10 copy];
    placeHoursViews = v9->_placeHoursViews;
    v9->_placeHoursViews = (NSArray *)v19;

    [(MKPlaceCompleteHoursView *)v9 commonInit];
    id v7 = v22;
  }

  return v9;
}

- (void)commonInit
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(MKPlaceCompleteHoursView *)self setPreservesSuperviewLayoutMargins:1];
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  containerViewForHoursAndCategoryName = self->_containerViewForHoursAndCategoryName;
  self->_containerViewForHoursAndCategoryName = v8;

  [(UIView *)self->_containerViewForHoursAndCategoryName setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKPlaceCompleteHoursView *)self addSubview:self->_containerViewForHoursAndCategoryName];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v10 = self->_placeHoursViews;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (void)v34);
        [(UIView *)self->_containerViewForHoursAndCategoryName addSubview:v15];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  uint64_t v16 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", v4, v5, v6, v7);
  localizedCategoryNameLabel = self->_localizedCategoryNameLabel;
  self->_localizedCategoryNameLabel = v16;

  [(_MKUILabel *)self->_localizedCategoryNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_localizedCategoryNameLabel set_mapkit_themeColorProvider:&__block_literal_global_122_0];
  v18 = self->_localizedCategoryNameLabel;
  uint64_t v19 = +[MKFontManager sharedManager];
  v20 = [v19 boldBodyFont];
  [(_MKUILabel *)v18 setFont:v20];

  v21 = self->_localizedCategoryNameLabel;
  id v22 = [(GEOLinkedService *)self->_linkedService localizedCategoryName];
  [(_MKUILabel *)v21 setText:v22];

  [(_MKUILabel *)self->_localizedCategoryNameLabel setNumberOfLines:1];
  [(UIView *)self->_containerViewForHoursAndCategoryName addSubview:self->_localizedCategoryNameLabel];
  long long v23 = +[MKSystemController sharedInstance];
  [v23 screenScale];
  double v25 = v24;

  long long v26 = [(GEOLinkedService *)self->_linkedService styleAttributes];
  objc_super v27 = [(MKPlaceCompleteHoursView *)self traitCollection];
  v28 = +[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v26, 3, 0, [v27 userInterfaceStyle] == 2, v25);

  if (!v28)
  {
    uint64_t v29 = [MEMORY[0x1E4F645A0] genericServiceStyleAttributes];
    v30 = [(MKPlaceCompleteHoursView *)self traitCollection];
    v28 = +[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v29, 3, 0, [v30 userInterfaceStyle] == 2, v25);
  }
  v31 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v28];
  categoryIconView = self->_categoryIconView;
  self->_categoryIconView = v31;

  [(UIImageView *)self->_categoryIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKPlaceCompleteHoursView *)self addSubview:self->_categoryIconView];
  [(MKPlaceCompleteHoursView *)self _setUpConstraints];
  [(MKPlaceCompleteHoursView *)self setClipsToBounds:0];
  v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v33 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

uint64_t __38__MKPlaceCompleteHoursView_commonInit__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

- (void)_contentSizeDidChange
{
  if ([(NSArray *)self->_placeHoursViews count])
  {
    id v4 = +[MKFontManager sharedManager];
    id v3 = [v4 boldBodyFont];
    objc_msgSend(v3, "_mapkit_scaledValueForValue:", 22.0);
    -[NSLayoutConstraint setConstant:](self->_hoursTopLabelBaselineToCategoryName, "setConstant:");
  }
}

- (void)_setUpConstraints
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(UIImageView *)self->_categoryIconView heightAnchor];
  double v5 = [v4 constraintEqualToConstant:30.0];
  [v3 addObject:v5];

  double v6 = [(UIImageView *)self->_categoryIconView widthAnchor];
  double v7 = [v6 constraintEqualToConstant:30.0];
  [v3 addObject:v7];

  v8 = [(UIImageView *)self->_categoryIconView topAnchor];
  v9 = [(MKPlaceCompleteHoursView *)self layoutMarginsGuide];
  v10 = [v9 topAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  [v3 addObject:v11];

  uint64_t v12 = [(UIImageView *)self->_categoryIconView bottomAnchor];
  uint64_t v13 = [(MKPlaceCompleteHoursView *)self layoutMarginsGuide];
  uint64_t v14 = [v13 bottomAnchor];
  uint64_t v15 = [v12 constraintLessThanOrEqualToAnchor:v14];
  [v3 addObject:v15];

  uint64_t v16 = [(UIImageView *)self->_categoryIconView leadingAnchor];
  uint64_t v17 = [(MKPlaceCompleteHoursView *)self layoutMarginsGuide];
  v18 = [v17 leadingAnchor];
  uint64_t v19 = [v16 constraintEqualToAnchor:v18];
  [v3 addObject:v19];

  v20 = [(MKPlaceCompleteHoursView *)self heightAnchor];
  v21 = [(UIImageView *)self->_categoryIconView heightAnchor];
  id v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
  [v3 addObject:v22];

  uint64_t v23 = 424;
  double v24 = [(UIView *)self->_containerViewForHoursAndCategoryName leadingAnchor];
  double v25 = [(UIImageView *)self->_categoryIconView trailingAnchor];
  long long v26 = [v24 constraintEqualToAnchor:v25];
  [v3 addObject:v26];

  objc_super v27 = [(UIView *)self->_containerViewForHoursAndCategoryName topAnchor];
  v28 = [(UIImageView *)self->_categoryIconView topAnchor];
  uint64_t v29 = [v27 constraintEqualToAnchor:v28];
  [v3 addObject:v29];

  v30 = [(UIView *)self->_containerViewForHoursAndCategoryName trailingAnchor];
  v31 = [(MKPlaceCompleteHoursView *)self layoutMarginsGuide];
  v32 = [v31 trailingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v3 addObject:v33];

  long long v34 = [(UIView *)self->_containerViewForHoursAndCategoryName bottomAnchor];
  long long v35 = [(MKPlaceCompleteHoursView *)self bottomAnchor];
  long long v36 = [v34 constraintLessThanOrEqualToAnchor:v35];
  [v3 addObject:v36];

  long long v37 = [(_MKUILabel *)self->_localizedCategoryNameLabel topAnchor];
  v38 = [(UIView *)self->_containerViewForHoursAndCategoryName topAnchor];
  uint64_t v39 = [v37 constraintEqualToAnchor:v38];
  [v3 addObject:v39];

  v40 = [(_MKUILabel *)self->_localizedCategoryNameLabel trailingAnchor];
  v41 = [(UIView *)self->_containerViewForHoursAndCategoryName trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v3 addObject:v42];

  v43 = self->_localizedCategoryNameLabel;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obj = self->_placeHoursViews;
  uint64_t v75 = [(NSArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v75)
  {
    uint64_t v74 = *(void *)v77;
    uint64_t v70 = 424;
    v71 = v3;
    do
    {
      uint64_t v44 = 0;
      v45 = v43;
      do
      {
        if (*(void *)v77 != v74) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v76 + 1) + 8 * v44);
        if (v45 == self->_localizedCategoryNameLabel)
        {
          v73 = [v46 topLabel];
          v50 = [v73 firstBaselineAnchor];
          v51 = [(_MKUILabel *)self->_localizedCategoryNameLabel lastBaselineAnchor];
          v52 = +[MKFontManager sharedManager];
          v53 = [v52 boldBodyFont];
          objc_msgSend(v53, "_mapkit_scaledValueForValue:", 22.0);
          objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
          v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
          hoursTopLabelBaselineToCategoryName = self->_hoursTopLabelBaselineToCategoryName;
          self->_hoursTopLabelBaselineToCategoryName = v54;

          uint64_t v23 = v70;
          id v3 = v71;

          [v71 addObject:self->_hoursTopLabelBaselineToCategoryName];
        }
        else
        {
          v47 = [v46 topAnchor];
          v48 = [(_MKUILabel *)v45 bottomAnchor];
          v49 = [v47 constraintEqualToAnchor:v48];
          [v3 addObject:v49];
        }
        v56 = objc_msgSend(v46, "leadingAnchor", v70);
        v57 = [*(id *)((char *)&self->super.super.super.isa + v23) leadingAnchor];
        v58 = [v56 constraintEqualToAnchor:v57];
        [v3 addObject:v58];

        v59 = [v46 trailingAnchor];
        v60 = [*(id *)((char *)&self->super.super.super.isa + v23) trailingAnchor];
        v61 = [v59 constraintEqualToAnchor:v60];
        [v3 addObject:v61];

        v43 = v46;
        ++v44;
        v45 = v43;
      }
      while (v75 != v44);
      uint64_t v75 = [(NSArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v75);
  }

  v62 = [(_MKUILabel *)v43 bottomAnchor];
  v63 = [*(id *)((char *)&self->super.super.super.isa + v23) layoutMarginsGuide];
  v64 = [v63 bottomAnchor];
  v65 = [v62 constraintLessThanOrEqualToAnchor:v64];
  [v3 addObject:v65];

  v66 = [(_MKUILabel *)self->_localizedCategoryNameLabel leadingAnchor];
  v67 = [*(id *)((char *)&self->super.super.super.isa + v23) layoutMarginsGuide];
  v68 = [v67 leadingAnchor];
  v69 = [v66 constraintEqualToAnchor:v68];
  [v3 addObject:v69];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (void)hoursViewDidUpdate:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hoursTopLabelBaselineToCategoryName)
  {
    double v5 = (void *)MEMORY[0x1E4F28DC8];
    v18[0] = self->_hoursTopLabelBaselineToCategoryName;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v5 deactivateConstraints:v6];
  }
  id v7 = [(NSArray *)self->_placeHoursViews firstObject];
  if (v7 == v4)
  {
    v8 = [v4 topLabel];
    v9 = [v8 firstBaselineAnchor];
    v10 = [(_MKUILabel *)self->_localizedCategoryNameLabel lastBaselineAnchor];
    uint64_t v11 = +[MKFontManager sharedManager];
    uint64_t v12 = [v11 boldBodyFont];
    objc_msgSend(v12, "_mapkit_scaledValueForValue:", 22.0);
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
    uint64_t v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    hoursTopLabelBaselineToCategoryName = self->_hoursTopLabelBaselineToCategoryName;
    self->_hoursTopLabelBaselineToCategoryName = v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v17 = self->_hoursTopLabelBaselineToCategoryName;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v15 activateConstraints:v16];
  }
  [(MKPlaceCompleteHoursView *)self _contentSizeDidChange];
}

- (NSArray)placeHoursViews
{
  return self->_placeHoursViews;
}

- (void)setPlaceHoursViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHoursViews, 0);
  objc_storeStrong((id *)&self->_hoursTopLabelBaselineToCategoryName, 0);
  objc_storeStrong((id *)&self->_localizedCategoryNameLabel, 0);
  objc_storeStrong((id *)&self->_categoryIconView, 0);
  objc_storeStrong((id *)&self->_containerViewForHoursAndCategoryName, 0);
  objc_storeStrong((id *)&self->_sortedBusinessHours, 0);

  objc_storeStrong((id *)&self->_linkedService, 0);
}

@end