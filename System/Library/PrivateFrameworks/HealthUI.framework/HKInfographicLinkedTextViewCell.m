@interface HKInfographicLinkedTextViewCell
- (HKInfographicLinkedTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_descriptionTextColor;
- (id)didTapLinkedText;
- (void)didTapDescriptionLabel;
- (void)setDidTapLinkedText:(id)a3;
- (void)updateAutomationIdentifiersWith:(id)a3;
@end

@implementation HKInfographicLinkedTextViewCell

- (HKInfographicLinkedTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HKInfographicLinkedTextViewCell;
  v4 = [(HKInfographicTextViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_didTapDescriptionLabel];
    v6 = [(HKInfographicTextViewCell *)v4 descriptionLabel];
    [v6 addGestureRecognizer:v5];

    v7 = [(HKInfographicTextViewCell *)v4 descriptionLabel];
    [v7 setUserInteractionEnabled:1];
  }
  return v4;
}

- (id)_descriptionTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (void)didTapDescriptionLabel
{
  v2 = [(HKInfographicLinkedTextViewCell *)self didTapLinkedText];
  v2[2]();
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    v13[1] = @"InfographicLinkedTextItem";
    v13[2] = @"Cell";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    v7 = HKUIJoinStringsForAutomationIdentifier(v6);
    [(HKInfographicLinkedTextViewCell *)self setAccessibilityIdentifier:v7];

    v12[0] = v5;
    v12[1] = @"InfographicLinkedTextItem";
    v12[2] = @"Description";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    objc_super v9 = HKUIJoinStringsForAutomationIdentifier(v8);
    v10 = [(HKInfographicTextViewCell *)self descriptionLabel];
    [v10 setAccessibilityIdentifier:v9];
  }
  else
  {
    [(HKInfographicLinkedTextViewCell *)self setAccessibilityIdentifier:0];
    v11 = [(HKInfographicTextViewCell *)self descriptionLabel];
    [v11 setAccessibilityIdentifier:0];
  }
}

- (id)didTapLinkedText
{
  return self->_didTapLinkedText;
}

- (void)setDidTapLinkedText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end