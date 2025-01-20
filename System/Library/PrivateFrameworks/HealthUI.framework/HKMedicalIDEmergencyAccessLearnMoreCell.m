@interface HKMedicalIDEmergencyAccessLearnMoreCell
- (HKMedicalIDEmergencyAccessLearnMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_makeTextView;
- (void)_addSubviews;
- (void)_setUpConstraints;
- (void)_setUpViews;
- (void)setItems:(id)a3;
@end

@implementation HKMedicalIDEmergencyAccessLearnMoreCell

- (HKMedicalIDEmergencyAccessLearnMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreCell;
  v4 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKMedicalIDEmergencyAccessLearnMoreCell *)v4 _setUpViews];
    [(HKMedicalIDEmergencyAccessLearnMoreCell *)v5 _addSubviews];
    [(HKMedicalIDEmergencyAccessLearnMoreCell *)v5 _setUpConstraints];
  }
  return v5;
}

- (void)_setUpViews
{
  [(HKMedicalIDEmergencyAccessLearnMoreCell *)self setSelectionStyle:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  itemsStackView = self->_itemsStackView;
  self->_itemsStackView = v4;

  [(UIStackView *)self->_itemsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_itemsStackView setSpacing:20.0];
  [(UIStackView *)self->_itemsStackView setAxis:1];
  [(UIStackView *)self->_itemsStackView setAlignment:0];
  v6 = self->_itemsStackView;
  [(UIStackView *)v6 setDistribution:0];
}

- (void)_addSubviews
{
  id v3 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)self contentView];
  [v3 addSubview:self->_itemsStackView];
}

- (void)_setUpConstraints
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v14 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(UIStackView *)self->_itemsStackView topAnchor];
  v20 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)self contentView];
  v18 = [v20 topAnchor];
  v17 = [v19 constraintEqualToAnchor:v18 constant:16.0];
  v21[0] = v17;
  v15 = [(UIStackView *)self->_itemsStackView leadingAnchor];
  v16 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)self contentView];
  v13 = [v16 leadingAnchor];
  id v3 = [v15 constraintEqualToAnchor:v13 constant:16.0];
  v21[1] = v3;
  v4 = [(UIStackView *)self->_itemsStackView trailingAnchor];
  v5 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)self contentView];
  v6 = [v5 trailingAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6 constant:-16.0];
  v21[2] = v7;
  v8 = [(UIStackView *)self->_itemsStackView bottomAnchor];
  v9 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)self contentView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:-16.0];
  v21[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v14 activateConstraints:v12];
}

- (id)_makeTextView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setScrollEnabled:0];
  [v3 setBounces:0];
  [v3 setEditable:0];
  [v3 _setInteractiveTextSelectionDisabled:1];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  return v3;
}

- (void)setItems:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v37 = self;
  v5 = [(UIStackView *)self->_itemsStackView arrangedSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v4;
  uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v43;
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v35 = *MEMORY[0x1E4FB2990];
    uint64_t v34 = *MEMORY[0x1E4FB0700];
    uint64_t v33 = *MEMORY[0x1E4FB28C8];
    uint64_t v14 = *MEMORY[0x1E4FB06F8];
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v43 != v36) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C60]), "initWithFrame:", v10, v11, v12, v13);
        [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v17 setSpacing:0.0];
        [v17 setAxis:1];
        [v17 setAlignment:0];
        [v17 setDistribution:0];
        v18 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)v37 _makeTextView];
        v19 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v35];
        v41 = [v19 fontDescriptorWithSymbolicTraits:2];

        v40 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v41 size:0.0];
        v52[0] = v34;
        v20 = [MEMORY[0x1E4FB1618] labelColor];
        v52[1] = v14;
        v53[0] = v20;
        v53[1] = v40;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

        id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
        v22 = v16;
        v23 = [v16 title];
        v24 = (void *)[v21 initWithString:v23 attributes:v39];
        [v18 setAttributedText:v24];

        [v17 addArrangedSubview:v18];
        v25 = [(HKMedicalIDEmergencyAccessLearnMoreCell *)v37 _makeTextView];
        v50[0] = v34;
        v26 = [MEMORY[0x1E4FB1618] labelColor];
        v50[1] = v14;
        v51[0] = v26;
        v27 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v33];
        v51[1] = v27;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];

        id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
        v30 = [v22 body];
        v31 = (void *)[v29 initWithString:v30 attributes:v28];
        [v25 setAttributedText:v31];

        [v17 addArrangedSubview:v25];
        [(UIStackView *)v37->_itemsStackView addArrangedSubview:v17];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v38);
  }
}

- (void).cxx_destruct
{
}

@end