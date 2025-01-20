@interface MKPlaceReservationRowView
- (MKPlaceReservationRowView)initWithReservationInfo:(id)a3;
- (NSString)selectedTimeString;
- (_MKPlaceReservationInfo)reservationInfo;
- (double)_buttonBottomMargin;
- (double)_buttonTopMargin;
- (id)_attributedStringFromButtonTitle:(id)a3 useSmallFont:(BOOL)a4;
- (id)_buttonFontLarge;
- (id)_buttonFontSmall;
- (id)_newButtonForAttribution:(BOOL)a3;
- (unint64_t)selectedTimeIndex;
- (void)_actionMakeReservation;
- (void)_contentSizeDidChange;
- (void)_setupImmutableConstraints;
- (void)_updateButtonTitleAttributes;
- (void)_updateMutableConstraints;
- (void)_updateTintColor;
- (void)_updateWithReservationInfo;
- (void)setSelectedTimeIndex:(unint64_t)a3;
- (void)setSelectedTimeString:(id)a3;
- (void)tintColorDidChange;
@end

@implementation MKPlaceReservationRowView

- (MKPlaceReservationRowView)initWithReservationInfo:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v26.receiver = self;
    v26.super_class = (Class)MKPlaceReservationRowView;
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[MKPlaceSectionItemView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
    v11 = v10;
    if (v10)
    {
      [(MKPlaceReservationRowView *)v10 setPreservesSuperviewLayoutMargins:1];
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DD0]), "initWithFrame:", v6, v7, v8, v9);
      v13 = *(void **)&v11->super._selected;
      *(void *)&v11->super._selected = v12;

      [*(id *)&v11->super._selected setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MKPlaceReservationRowView *)v11 addSubview:*(void *)&v11->super._selected];
      v14 = _MKLocalizedStringFromThisBundle(@"PLACEVIEW_RESERVATION_BUTTON");
      uint64_t v15 = [(MKPlaceReservationRowView *)v11 _newButtonForAttribution:0];
      openTimesControl = v11->_openTimesControl;
      v11->_openTimesControl = (UISegmentedControl *)v15;

      v17 = v11->_openTimesControl;
      v18 = [(MKPlaceReservationRowView *)v11 _attributedStringFromButtonTitle:v14 useSmallFont:0];
      [(UISegmentedControl *)v17 _mapkit_setAttributedTitle:v18];

      [(UISegmentedControl *)v11->_openTimesControl _mapkit_setTarget:v11 action:sel__actionMakeReservation];
      [(MKPlaceReservationRowView *)v11 addSubview:v11->_openTimesControl];
      uint64_t v19 = [(MKPlaceReservationRowView *)v11 _newButtonForAttribution:1];
      buttonMakeReservation = v11->_buttonMakeReservation;
      v11->_buttonMakeReservation = (UIButton *)v19;

      [(UIButton *)v11->_buttonMakeReservation _mapkit_setTarget:v11 action:sel__actionMakeReservation];
      [(MKPlaceReservationRowView *)v11 addSubview:v11->_buttonMakeReservation];
      [(MKPlaceReservationRowView *)v11 _updateTintColor];
      [(MKPlaceReservationRowView *)v11 _setupImmutableConstraints];
      uint64_t v21 = objc_opt_new();
      buttonAttribution = v11->_buttonAttribution;
      v11->_buttonAttribution = (UIButton *)v21;

      objc_storeStrong((id *)&v11->_constraintButtonBottomMargin, a3);
      [(MKPlaceReservationRowView *)v11 _updateWithReservationInfo];
      v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 addObserver:v11 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
    }
    self = v11;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)selectedTimeIndex
{
  if (!objc_msgSend(*(id *)&self->super._selected, "_mapkit_numberOfSegments")) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = *(void **)&self->super._selected;

  return objc_msgSend(v3, "_mapkit_selectedSegmentIndex");
}

- (void)setSelectedTimeIndex:(unint64_t)a3
{
}

- (NSString)selectedTimeString
{
  unint64_t v3 = [(MKPlaceReservationRowView *)self selectedTimeIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    unint64_t v5 = v3;
    double v6 = [(MKPlaceReservationRowView *)self reservationInfo];
    double v7 = [v6 openTimes];
    v4 = [v7 objectAtIndexedSubscript:v5];
  }

  return (NSString *)v4;
}

- (void)setSelectedTimeString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MKPlaceReservationRowView *)self reservationInfo];
  double v6 = [v5 openTimes];
  uint64_t v7 = [v6 indexOfObject:v4];

  [(MKPlaceReservationRowView *)self setSelectedTimeIndex:v7];
}

- (id)_newButtonForAttribution:(BOOL)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F427E0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (void)_actionMakeReservation
{
  id v3 = [(MKPlaceReservationRowView *)self reservationInfo];
  id v4 = [v3 reservationDelegate];

  if (v4)
  {
    id v7 = [(MKPlaceReservationRowView *)self reservationInfo];
    unint64_t v5 = [v7 reservationDelegate];
    double v6 = [(MKPlaceReservationRowView *)self reservationInfo];
    objc_msgSend(v5, "reservationInfo:makeReservationForSelectedTimeAtIndex:", v6, -[MKPlaceReservationRowView selectedTimeIndex](self, "selectedTimeIndex"));
  }
}

- (id)_buttonFontLarge
{
  v2 = +[MKFontManager sharedManager];
  id v3 = [v2 boldBodyFont];

  return v3;
}

- (id)_buttonFontSmall
{
  v2 = +[MKFontManager sharedManager];
  id v3 = [v2 smallAttributionFont];

  return v3;
}

- (double)_buttonTopMargin
{
  v2 = [(MKPlaceReservationRowView *)self _buttonFontLarge];
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 27.0);
  double v4 = v3;

  return v4;
}

- (double)_buttonBottomMargin
{
  v2 = [(MKPlaceReservationRowView *)self _buttonFontLarge];
  objc_msgSend(v2, "_mapkit_scaledValueForValue:", 18.0);
  double v4 = v3;

  return v4;
}

- (id)_attributedStringFromButtonTitle:(id)a3 useSmallFont:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = objc_opt_new();
    if (a4) {
      [(MKPlaceReservationRowView *)self _buttonFontSmall];
    }
    else {
    double v9 = [(MKPlaceReservationRowView *)self _buttonFontLarge];
    }
    v10 = [(UIView *)self mk_theme];
    v11 = [v10 textColor];

    if (v9) {
      [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F42508]];
    }
    if (v11) {
      [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F42510]];
    }
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_updateWithReservationInfo
{
  objc_msgSend(*(id *)&self->super._selected, "_mapkit_removeAllSegments");
  id v12 = [(NSLayoutConstraint *)self->_constraintButtonBottomMargin openTimes];
  if ([v12 count])
  {
    unint64_t v3 = 0;
    do
    {
      double v4 = *(void **)&self->super._selected;
      unint64_t v5 = [v12 objectAtIndexedSubscript:v3];
      objc_msgSend(v4, "_mapkit_setTitle:forSegmentAtIndex:insertIfNeeded:", v5, v3, 1);

      ++v3;
    }
    while (v3 < [v12 count]);
  }
  objc_msgSend(*(id *)&self->super._selected, "setHidden:", objc_msgSend(v12, "count") == 0);
  if ([v12 count]) {
    -[MKPlaceReservationRowView setSelectedTimeIndex:](self, "setSelectedTimeIndex:", (unint64_t)[v12 count] > 1);
  }
  id v6 = [(NSLayoutConstraint *)self->_constraintButtonBottomMargin attributionProviderDisplayName];
  id v7 = [(MKPlaceReservationRowView *)self _attributedStringFromButtonTitle:v6 useSmallFont:1];
  double v8 = [(NSLayoutConstraint *)self->_constraintButtonBottomMargin attributionProviderLogoImage];
  double v9 = [(UIView *)self mk_theme];
  v10 = [v9 textColor];
  uint64_t v11 = [v8 _flatImageWithColor:v10];

  [(UIButton *)self->_buttonMakeReservation _mapkit_setAttributedTitle:v7];
  [(UIButton *)self->_buttonMakeReservation _mapkit_setImage:v11];
  -[UIButton setHidden:](self->_buttonMakeReservation, "setHidden:", ([v6 length] | v11) == 0);
  [(MKPlaceReservationRowView *)self _updateMutableConstraints];
}

- (void)_setupImmutableConstraints
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_new();
  double v4 = _NSDictionaryOfVariableBindings(&cfstr_Buttonmakerese.isa, self->_openTimesControl, *(void *)&self->super._selected, self->_buttonMakeReservation, 0);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [&unk_1ED97F578 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(&unk_1ED97F578);
        }
        double v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:*(void *)(*((void *)&v33 + 1) + 8 * i) options:0 metrics:0 views:v4];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [&unk_1ED97F578 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }
  v10 = [*(id *)&self->super._selected leadingAnchor];
  uint64_t v11 = [(MKPlaceReservationRowView *)self layoutMarginsGuide];
  id v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v3 addObject:v13];

  v14 = [*(id *)&self->super._selected trailingAnchor];
  uint64_t v15 = [(MKPlaceReservationRowView *)self layoutMarginsGuide];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v3 addObject:v17];

  v18 = [(UISegmentedControl *)self->_openTimesControl leadingAnchor];
  uint64_t v19 = [(MKPlaceReservationRowView *)self layoutMarginsGuide];
  v20 = [v19 leadingAnchor];
  uint64_t v21 = [v18 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  v22 = [(UIButton *)self->_buttonMakeReservation trailingAnchor];
  v23 = [(MKPlaceReservationRowView *)self layoutMarginsGuide];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v3 addObject:v25];

  objc_super v26 = [(UIButton *)self->_buttonMakeReservation lastBaselineAnchor];
  v27 = [(UISegmentedControl *)self->_openTimesControl lastBaselineAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  v29 = [(MKPlaceReservationRowView *)self bottomAnchor];
  v30 = [(UISegmentedControl *)self->_openTimesControl lastBaselineAnchor];
  [(MKPlaceReservationRowView *)self _buttonBottomMargin];
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  constraintButtonTopMargin = self->_constraintButtonTopMargin;
  self->_constraintButtonTopMargin = v31;

  [v3 addObject:self->_constraintButtonTopMargin];
  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (void)_updateMutableConstraints
{
  if ([(UIButton *)self->_buttonAttribution count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_buttonAttribution];
    [(UIButton *)self->_buttonAttribution removeAllObjects];
  }
  if ([*(id *)&self->super._selected isHidden])
  {
    unint64_t v3 = [(UISegmentedControl *)self->_openTimesControl firstBaselineAnchor];
    [(MKPlaceReservationRowView *)self topAnchor];
  }
  else
  {
    buttonAttribution = self->_buttonAttribution;
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC8];
    double v8 = _NSDictionaryOfVariableBindings(&cfstr_Opentimescontr.isa, *(id *)&self->super._selected, self->_openTimesControl, 0);
    double v9 = [v7 constraintsWithVisualFormat:@"V:|-(>=0)-[_openTimesControl]-(>=0)-[_buttonMakeReservation]" options:0 metrics:0 views:v8];
    [(UIButton *)buttonAttribution addObjectsFromArray:v9];

    v10 = self->_buttonAttribution;
    uint64_t v11 = [*(id *)&self->super._selected topAnchor];
    id v12 = [(MKPlaceReservationRowView *)self topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:12.0];
    [(UIButton *)v10 addObject:v13];

    unint64_t v3 = [(UISegmentedControl *)self->_openTimesControl firstBaselineAnchor];
    [*(id *)&self->super._selected bottomAnchor];
  double v4 = };
  [(MKPlaceReservationRowView *)self _buttonTopMargin];
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mutableConstraints = self->_mutableConstraints;
  self->_mutableConstraints = v5;

  [(UIButton *)self->_buttonAttribution addObject:self->_mutableConstraints];
  if ([(UIButton *)self->_buttonAttribution count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_buttonAttribution];
  }

  [(UIView *)self _mapkit_setNeedsLayout];
}

- (void)_updateButtonTitleAttributes
{
  openTimesControl = self->_openTimesControl;
  double v4 = [(UISegmentedControl *)openTimesControl _mapkit_title];
  uint64_t v5 = [(MKPlaceReservationRowView *)self _attributedStringFromButtonTitle:v4 useSmallFont:0];
  [(UISegmentedControl *)openTimesControl _mapkit_setAttributedTitle:v5];

  buttonMakeReservation = self->_buttonMakeReservation;
  id v8 = [(UIButton *)buttonMakeReservation _mapkit_title];
  uint64_t v7 = [(MKPlaceReservationRowView *)self _attributedStringFromButtonTitle:v8 useSmallFont:1];
  [(UIButton *)buttonMakeReservation _mapkit_setAttributedTitle:v7];
}

- (void)_updateTintColor
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIView *)self mk_theme];
  double v4 = [v3 textColor];

  if (v4)
  {
    [*(id *)&self->super._selected setTintColor:v4];
    uint64_t v5 = *(void **)&self->super._selected;
    uint64_t v7 = *MEMORY[0x1E4F42510];
    v8[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 setTitleTextAttributes:v6 forState:0];

    [(MKPlaceReservationRowView *)self _updateButtonTitleAttributes];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceReservationRowView;
  [(MKPlaceReservationRowView *)&v3 tintColorDidChange];
  [(MKPlaceReservationRowView *)self _updateTintColor];
}

- (void)_contentSizeDidChange
{
  [(MKPlaceReservationRowView *)self _updateButtonTitleAttributes];
  [(MKPlaceReservationRowView *)self _buttonTopMargin];
  -[NSMutableArray setConstant:](self->_mutableConstraints, "setConstant:");
  [(MKPlaceReservationRowView *)self _buttonBottomMargin];
  constraintButtonTopMargin = self->_constraintButtonTopMargin;

  -[NSLayoutConstraint setConstant:](constraintButtonTopMargin, "setConstant:");
}

- (_MKPlaceReservationInfo)reservationInfo
{
  return (_MKPlaceReservationInfo *)self->_constraintButtonBottomMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintButtonBottomMargin, 0);
  objc_storeStrong((id *)&self->_constraintButtonTopMargin, 0);
  objc_storeStrong((id *)&self->_mutableConstraints, 0);
  objc_storeStrong((id *)&self->_buttonAttribution, 0);
  objc_storeStrong((id *)&self->_buttonMakeReservation, 0);
  objc_storeStrong((id *)&self->_openTimesControl, 0);

  objc_storeStrong((id *)&self->super._selected, 0);
}

@end