@interface HUWheelControlPanelCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isDisabled;
- (BOOL)wheelViewVisible;
- (HUWheelControlPanelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUWheelControlPopUpButton)wheelButton;
- (HUWheelControlView)wheelView;
- (NSArray)dynamicConstraints;
- (NSArray)staticConstraints;
- (NSArray)wheelValues;
- (NSFormatter)valueFormatter;
- (NSNumber)maxValue;
- (NSNumber)minValue;
- (NSNumber)stepValue;
- (NSString)detailText;
- (NSString)titleText;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (id)_defaultMaxValue;
- (id)_defaultMinValue;
- (id)_defaultStepValue;
- (id)_defaultValueFormatter;
- (id)allControlViews;
- (void)_generateWheelValuesWithMinValue:(double)a3 maxValue:(double)a4 stepValue:(double)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDetailText:(id)a3;
- (void)setDynamicConstraints:(id)a3;
- (void)setMaxValue:(id)a3;
- (void)setMinValue:(id)a3;
- (void)setStaticConstraints:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setValueFormatter:(id)a3;
- (void)setWheelButton:(id)a3;
- (void)setWheelValues:(id)a3;
- (void)setWheelView:(id)a3;
- (void)setWheelViewVisible:(BOOL)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
- (void)wheelControlView:(id)a3 didUpdateValue:(id)a4;
@end

@implementation HUWheelControlPanelCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUWheelControlPanelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)HUWheelControlPanelCell;
  v4 = [(HUWheelControlPanelCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = *MEMORY[0x1E4F43870];
    v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v4->_titleLabel setFont:v8];

    v9 = [(HUWheelControlPanelCell *)v4 contentView];
    [v9 addSubview:v4->_titleLabel];

    if ([MEMORY[0x1E4F69758] useMacIdiom])
    {
      uint64_t v10 = +[HUWheelControlPopUpButton buttonWithType:124];
      p_wheelButton = &v4->_wheelButton;
      wheelButton = v4->_wheelButton;
      v4->_wheelButton = (HUWheelControlPopUpButton *)v10;

      [(HUWheelControlPopUpButton *)v4->_wheelButton setContextMenuEnabled:1];
      [(HUWheelControlPopUpButton *)v4->_wheelButton setContextMenuIsPrimary:1];
      [(HUWheelControlPopUpButton *)v4->_wheelButton setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      p_wheelButton = &v4->_detailLabel;
      detailLabel = v4->_detailLabel;
      v4->_detailLabel = v13;

      [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v15 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v7];
      [(UILabel *)v4->_detailLabel setFont:v15];
    }
    v16 = [(HUWheelControlPanelCell *)v4 contentView];
    [v16 addSubview:*p_wheelButton];

    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v17;

    [(UIView *)v4->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(HUWheelControlPanelCell *)v4 contentView];
    [v19 addSubview:v4->_separatorView];
  }
  return v4;
}

- (id)allControlViews
{
  int v3 = [MEMORY[0x1E4F69758] useMacIdiom];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  if (v3) {
    [(HUWheelControlPanelCell *)self wheelButton];
  }
  else {
  v5 = [(HUWheelControlPanelCell *)self wheelView];
  }
  v6 = objc_msgSend(v4, "na_setWithSafeObject:", v5);

  return v6;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUWheelControlPanelCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)titleText
{
  v2 = [(HUWheelControlPanelCell *)self titleLabel];
  int v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUWheelControlPanelCell *)self detailLabel];
  [v5 setText:v4];
}

- (NSString)detailText
{
  v2 = [(HUWheelControlPanelCell *)self detailLabel];
  int v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setWheelView:(id)a3
{
  id v5 = (HUWheelControlView *)a3;
  p_wheelView = &self->_wheelView;
  wheelView = self->_wheelView;
  if (wheelView != v5)
  {
    v9 = v5;
    [(HUWheelControlView *)wheelView removeFromSuperview];
    objc_storeStrong((id *)&self->_wheelView, a3);
    [(HUWheelControlView *)*p_wheelView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(HUWheelControlPanelCell *)self contentView];
    [v8 addSubview:*p_wheelView];

    [(HUWheelControlView *)*p_wheelView setWheelDelegate:self];
    self->_wheelViewVisible = 0;
    [(HUWheelControlView *)*p_wheelView setHidden:1];
    [(UIView *)self->_separatorView setHidden:1];
    [(HUWheelControlPanelCell *)self setNeedsUpdateConstraints];
    id v5 = v9;
  }
}

- (void)setWheelViewVisible:(BOOL)a3
{
  if (self->_wheelViewVisible != a3)
  {
    self->_wheelViewVisible = a3;
    BOOL v4 = !a3;
    id v5 = [(HUWheelControlPanelCell *)self wheelView];
    [v5 setHidden:v4];

    BOOL v6 = !self->_wheelViewVisible;
    uint64_t v7 = [(HUWheelControlPanelCell *)self separatorView];
    [v7 setHidden:v6];

    [(HUWheelControlPanelCell *)self setNeedsUpdateConstraints];
  }
}

- (BOOL)isDisabled
{
  v2 = [(HUWheelControlPanelCell *)self wheelView];
  char v3 = [v2 isDisabled];

  return v3;
}

- (void)updateConstraints
{
  char v3 = [(HUWheelControlPanelCell *)self contentView];
  BOOL v4 = [v3 layoutMarginsGuide];

  id v5 = [(HUWheelControlPanelCell *)self staticConstraints];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = [(HUWheelControlPanelCell *)self titleLabel];
    v8 = [v7 topAnchor];
    v9 = [v4 topAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    [v6 addObject:v10];

    v11 = [(HUWheelControlPanelCell *)self titleLabel];
    v12 = [v11 leadingAnchor];
    v13 = [v4 leadingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v6 addObject:v14];

    v15 = [(HUWheelControlPanelCell *)self titleLabel];
    v16 = [v15 centerYAnchor];
    v17 = [(HUWheelControlPanelCell *)self topAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:22.0];
    [v6 addObject:v18];

    if ([MEMORY[0x1E4F69758] useMacIdiom])
    {
      v19 = [(HUWheelControlPanelCell *)self wheelButton];
      v20 = [v19 topAnchor];
      objc_super v21 = [v4 topAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      [v6 addObject:v22];

      v23 = [(HUWheelControlPanelCell *)self wheelButton];
      v24 = [v23 trailingAnchor];
      v25 = [v4 trailingAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];
      [v6 addObject:v26];

      [(HUWheelControlPanelCell *)self wheelButton];
    }
    else
    {
      v27 = [(HUWheelControlPanelCell *)self titleLabel];
      v28 = [v27 trailingAnchor];
      v29 = [(HUWheelControlPanelCell *)self detailLabel];
      v30 = [v29 leadingAnchor];
      v31 = [v28 constraintEqualToAnchor:v30];
      [v6 addObject:v31];

      v32 = [(HUWheelControlPanelCell *)self detailLabel];
      LODWORD(v33) = 1144766464;
      [v32 setContentCompressionResistancePriority:0 forAxis:v33];

      v34 = [(HUWheelControlPanelCell *)self detailLabel];
      LODWORD(v35) = 1132134400;
      [v34 setContentHuggingPriority:0 forAxis:v35];

      v36 = [(HUWheelControlPanelCell *)self detailLabel];
      v37 = [v36 topAnchor];
      v38 = [v4 topAnchor];
      v39 = [v37 constraintEqualToAnchor:v38];
      [v6 addObject:v39];

      v40 = [(HUWheelControlPanelCell *)self detailLabel];
      v41 = [v40 trailingAnchor];
      v42 = [v4 trailingAnchor];
      v43 = [v41 constraintEqualToAnchor:v42];
      [v6 addObject:v43];

      [(HUWheelControlPanelCell *)self detailLabel];
    v44 = };
    v45 = [v44 centerYAnchor];
    v46 = [(HUWheelControlPanelCell *)self topAnchor];
    v47 = [v45 constraintEqualToAnchor:v46 constant:22.0];
    [v6 addObject:v47];

    [MEMORY[0x1E4F28DC8] activateConstraints:v6];
    [(HUWheelControlPanelCell *)self setStaticConstraints:v6];
  }
  v48 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [(HUWheelControlPanelCell *)self dynamicConstraints];
  [v48 deactivateConstraints:v49];

  LODWORD(v49) = [(HUWheelControlPanelCell *)self wheelViewVisible];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v49)
  {
    v51 = [(HUWheelControlPanelCell *)self separatorView];
    v52 = [v51 topAnchor];
    v53 = [(HUWheelControlPanelCell *)self titleLabel];
    v54 = [v53 bottomAnchor];
    [(HUWheelControlPanelCell *)self layoutMargins];
    v56 = [v52 constraintEqualToAnchor:v54 constant:v55];
    [v50 addObject:v56];

    v57 = [(HUWheelControlPanelCell *)self separatorView];
    v58 = [v57 leadingAnchor];
    v59 = [v4 leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    [v50 addObject:v60];

    v61 = [(HUWheelControlPanelCell *)self separatorView];
    v62 = [v61 trailingAnchor];
    v63 = [(HUWheelControlPanelCell *)self contentView];
    v64 = [v63 trailingAnchor];
    v65 = [v62 constraintEqualToAnchor:v64];
    [v50 addObject:v65];

    v66 = [(HUWheelControlPanelCell *)self separatorView];
    v67 = [v66 heightAnchor];
    v68 = [MEMORY[0x1E4F42D90] mainScreen];
    [v68 scale];
    v70 = [v67 constraintEqualToConstant:1.0 / v69];
    [v50 addObject:v70];

    v71 = [(HUWheelControlPanelCell *)self wheelView];
    v72 = [v71 topAnchor];
    v73 = [(HUWheelControlPanelCell *)self separatorView];
    v74 = [v73 bottomAnchor];
    v75 = [v72 constraintEqualToAnchor:v74];
    [v50 addObject:v75];

    v76 = [(HUWheelControlPanelCell *)self wheelView];
    v77 = [v76 leadingAnchor];
    v78 = [v4 leadingAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v50 addObject:v79];

    v80 = [(HUWheelControlPanelCell *)self wheelView];
    v81 = [v80 trailingAnchor];
    v82 = [v4 trailingAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    [v50 addObject:v83];

    v84 = [(HUWheelControlPanelCell *)self wheelView];
    v85 = [v84 bottomAnchor];
    v86 = [v4 bottomAnchor];
    uint64_t v87 = [v85 constraintEqualToAnchor:v86];
  }
  else
  {
    v88 = [(HUWheelControlPanelCell *)self titleLabel];
    v89 = [v88 bottomAnchor];
    v90 = [v4 bottomAnchor];
    v91 = [v89 constraintEqualToAnchor:v90 constant:-5.0];
    [v50 addObject:v91];

    if ([MEMORY[0x1E4F69758] useMacIdiom]) {
      [(HUWheelControlPanelCell *)self wheelButton];
    }
    else {
    v84 = [(HUWheelControlPanelCell *)self detailLabel];
    }
    v85 = [v84 bottomAnchor];
    v86 = [v4 bottomAnchor];
    uint64_t v87 = [v85 constraintEqualToAnchor:v86 constant:-5.0];
  }
  v92 = (void *)v87;
  [v50 addObject:v87];

  [(HUWheelControlPanelCell *)self setDynamicConstraints:v50];
  v93 = (void *)MEMORY[0x1E4F28DC8];
  v94 = [(HUWheelControlPanelCell *)self dynamicConstraints];
  [v93 activateConstraints:v94];

  v95.receiver = self;
  v95.super_class = (Class)HUWheelControlPanelCell;
  [(HUControlPanelCell *)&v95 updateConstraints];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUWheelControlPanelCell;
  [(HUWheelControlPanelCell *)&v5 layoutSubviews];
  char v3 = [(HUWheelControlPanelCell *)self separatorColor];
  BOOL v4 = [(HUWheelControlPanelCell *)self separatorView];
  [v4 setBackgroundColor:v3];
}

- (void)prepareForReuse
{
  [(HUWheelControlPanelCell *)self setWheelView:0];
  v3.receiver = self;
  v3.super_class = (Class)HUWheelControlPanelCell;
  [(HUWheelControlPanelCell *)&v3 prepareForReuse];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [(HUControlPanelCell *)self item];
  if (!v5) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = v5;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];

LABEL_7:
    id v8 = 0;
  }
  id v39 = v8;

  uint64_t v11 = objc_opt_class();
  v12 = [v39 controlItems];
  id v13 = [v12 anyObject];
  if (!v13)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  v15 = v13;
  if (!v14)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  v18 = (void *)MEMORY[0x1E4F28CF8];
  v19 = [v15 incrementalCharacteristicType];
  v20 = [v15 valueSource];
  objc_super v21 = [v15 incrementalCharacteristicType];
  v22 = [v20 metadataForCharacteristicType:v21];
  v23 = objc_msgSend(v18, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v19, v22, 0);

  v24 = [v15 minValue];
  [v24 doubleValue];
  double v26 = v25;

  v27 = [v15 maxValue];
  [v27 doubleValue];
  double v29 = v28;

  v30 = [v15 stepValue];
  [v30 doubleValue];

  [(HUWheelControlPanelCell *)self _generateWheelValuesWithMinValue:v26 maxValue:v29 stepValue:1.0];
  LODWORD(v20) = [MEMORY[0x1E4F69758] useMacIdiom];
  v31 = [v39 identifierForControlItem:v15];
  if (v20)
  {
    v32 = [(HUWheelControlPanelCell *)self wheelButton];
    [v32 setIdentifier:v31];

    double v33 = [(HUWheelControlPanelCell *)self wheelButton];
    [v33 setValueFormatter:v23];
  }
  else
  {
    v34 = [(HUWheelControlPanelCell *)self wheelView];
    [v34 setIdentifier:v31];

    double v35 = [(HUWheelControlPanelCell *)self wheelView];
    [v35 setValueFormatter:v23];

    double v33 = [(HUWheelControlPanelCell *)self wheelView];
    [v33 setCanBeHighlighted:1];
  }

  v36 = [(HUControlPanelCell *)self item];
  v37 = [v36 latestResults];
  v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUWheelControlPanelCell *)self setTitleText:v38];
}

- (void)wheelControlView:(id)a3 didUpdateValue:(id)a4
{
  id v6 = a4;
  id v8 = [a3 valueFormatter];
  id v7 = [v8 stringForObjectValue:v6];

  [(HUWheelControlPanelCell *)self setDetailText:v7];
}

- (void)setMaxValue:(id)a3
{
  p_maxValue = (id *)&self->_maxValue;
  id v15 = a3;
  if ((objc_msgSend(*p_maxValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_maxValue, a3);
    if (!*p_maxValue || [*p_maxValue isEqualToNumber:&unk_1F19B5570])
    {
      uint64_t v6 = [(HUWheelControlPanelCell *)self _defaultMaxValue];
      id v7 = *p_maxValue;
      id *p_maxValue = (id)v6;
    }
    id v8 = [(HUWheelControlPanelCell *)self minValue];
    [v8 doubleValue];
    double v10 = v9;
    [v15 doubleValue];
    double v12 = v11;
    id v13 = [(HUWheelControlPanelCell *)self stepValue];
    [v13 doubleValue];
    [(HUWheelControlPanelCell *)self _generateWheelValuesWithMinValue:v10 maxValue:v12 stepValue:v14];
  }
}

- (void)setMinValue:(id)a3
{
  p_minValue = (id *)&self->_minValue;
  id v15 = a3;
  if ((objc_msgSend(*p_minValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_minValue, a3);
    if (!*p_minValue || [*p_minValue isEqualToNumber:&unk_1F19B5570])
    {
      uint64_t v6 = [(HUWheelControlPanelCell *)self _defaultMinValue];
      id v7 = *p_minValue;
      id *p_minValue = (id)v6;
    }
    [v15 doubleValue];
    double v9 = v8;
    double v10 = [(HUWheelControlPanelCell *)self maxValue];
    [v10 doubleValue];
    double v12 = v11;
    id v13 = [(HUWheelControlPanelCell *)self stepValue];
    [v13 doubleValue];
    [(HUWheelControlPanelCell *)self _generateWheelValuesWithMinValue:v9 maxValue:v12 stepValue:v14];
  }
}

- (void)setStepValue:(id)a3
{
  p_stepValue = (id *)&self->_stepValue;
  id v15 = a3;
  if ((objc_msgSend(*p_stepValue, "isEqualToNumber:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stepValue, a3);
    if (!*p_stepValue || [*p_stepValue compare:&unk_1F19B5588] == -1)
    {
      uint64_t v6 = [(HUWheelControlPanelCell *)self _defaultStepValue];
      id v7 = *p_stepValue;
      id *p_stepValue = (id)v6;
    }
    double v8 = [(HUWheelControlPanelCell *)self minValue];
    [v8 doubleValue];
    double v10 = v9;
    double v11 = [(HUWheelControlPanelCell *)self maxValue];
    [v11 doubleValue];
    double v13 = v12;
    [v15 doubleValue];
    [(HUWheelControlPanelCell *)self _generateWheelValuesWithMinValue:v10 maxValue:v13 stepValue:v14];
  }
}

- (void)setValueFormatter:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(HUWheelControlPanelCell *)self _defaultValueFormatter];
  }
  id v6 = v4;
  objc_storeStrong((id *)&self->_valueFormatter, v4);
  if ([MEMORY[0x1E4F69758] isAMac]) {
    [(HUWheelControlPanelCell *)self wheelButton];
  }
  else {
  id v5 = [(HUWheelControlPanelCell *)self wheelView];
  }
  [v5 setValueFormatter:v6];
}

- (void)_generateWheelValuesWithMinValue:(double)a3 maxValue:(double)a4 stepValue:(double)a5
{
  uint64_t v8 = llround(a4 - a3);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8 < 1)
  {
    if (a4 == a3) {
      [v13 addObject:&unk_1F19B5570];
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8 + 1;
    do
    {
      double v11 = [NSNumber numberWithDouble:(double)v9 + a3];
      [v13 addObject:v11];

      ++v9;
    }
    while (v10 != v9);
  }
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    [(HUWheelControlPanelCell *)self wheelButton];
  }
  else {
  double v12 = [(HUWheelControlPanelCell *)self wheelView];
  }
  [v12 setValues:v13];
}

- (id)_defaultValueFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v2 setMaximumFractionDigits:0];

  return v2;
}

- (id)_defaultMaxValue
{
  return &unk_1F19B55A0;
}

- (id)_defaultMinValue
{
  return &unk_1F19B5570;
}

- (id)_defaultStepValue
{
  return &unk_1F19B5588;
}

- (HUWheelControlView)wheelView
{
  return self->_wheelView;
}

- (BOOL)wheelViewVisible
{
  return self->_wheelViewVisible;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (HUWheelControlPopUpButton)wheelButton
{
  return self->_wheelButton;
}

- (void)setWheelButton:(id)a3
{
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (NSArray)wheelValues
{
  return self->_wheelValues;
}

- (void)setWheelValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelValues, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_wheelButton, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_wheelView, 0);
}

@end