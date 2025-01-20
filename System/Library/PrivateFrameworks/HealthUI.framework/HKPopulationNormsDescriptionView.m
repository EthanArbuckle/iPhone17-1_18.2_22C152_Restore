@interface HKPopulationNormsDescriptionView
- (HKPopulationNormsDescriptionView)init;
- (UILabel)classificationDescriptionLabel;
- (UILabel)classificationTitleLabel;
- (void)setClassificationDescriptionLabel:(id)a3;
- (void)setClassificationTitleLabel:(id)a3;
- (void)updateWithTitle:(id)a3 description:(id)a4;
@end

@implementation HKPopulationNormsDescriptionView

- (HKPopulationNormsDescriptionView)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKPopulationNormsDescriptionView;
  v2 = -[HKPopulationNormsDescriptionView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    classificationTitleLabel = v2->_classificationTitleLabel;
    v2->_classificationTitleLabel = v3;

    [(UILabel *)v2->_classificationTitleLabel setNumberOfLines:0];
    v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2908], 32770);
    [(UILabel *)v2->_classificationTitleLabel setFont:v5];

    [(UILabel *)v2->_classificationTitleLabel setAdjustsFontForContentSizeCategory:1];
    [(HKPopulationNormsDescriptionView *)v2 addSubview:v2->_classificationTitleLabel];
    [(UILabel *)v2->_classificationTitleLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1F9F0 constant:0.0];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    classificationDescriptionLabel = v2->_classificationDescriptionLabel;
    v2->_classificationDescriptionLabel = v6;

    [(UILabel *)v2->_classificationDescriptionLabel setNumberOfLines:0];
    v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    [(UILabel *)v2->_classificationDescriptionLabel setFont:v8];

    [(HKPopulationNormsDescriptionView *)v2 addSubview:v2->_classificationDescriptionLabel];
    [(UILabel *)v2->_classificationDescriptionLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v2->_classificationDescriptionLabel hk_constrainToView:v2->_classificationTitleLabel fromEdge:3 toEdge:4 constant:5.0];
    [(UILabel *)v2->_classificationDescriptionLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1FA08 constant:0.0];
  }
  return v2;
}

- (void)updateWithTitle:(id)a3 description:(id)a4
{
  id v6 = a4;
  [(UILabel *)self->_classificationTitleLabel setText:a3];
  v7 = (void *)MEMORY[0x1E4FB1EB0];
  classificationDescriptionLabel = self->_classificationDescriptionLabel;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HKPopulationNormsDescriptionView_updateWithTitle_description___block_invoke;
  v10[3] = &unk_1E6D513B0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 transitionWithView:classificationDescriptionLabel duration:5242880 options:v10 animations:0 completion:0.2];
}

uint64_t __64__HKPopulationNormsDescriptionView_updateWithTitle_description___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setText:*(void *)(a1 + 40)];
}

- (UILabel)classificationTitleLabel
{
  return self->_classificationTitleLabel;
}

- (void)setClassificationTitleLabel:(id)a3
{
}

- (UILabel)classificationDescriptionLabel
{
  return self->_classificationDescriptionLabel;
}

- (void)setClassificationDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_classificationTitleLabel, 0);
}

@end