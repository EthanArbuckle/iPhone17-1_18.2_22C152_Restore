@interface HKInfographicTitleDetailOptionalButtonCell
- (HKInfographicTitleDetailOptionalButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6;
- (void)updateAutomationIdentifiersWith:(id)a3;
@end

@implementation HKInfographicTitleDetailOptionalButtonCell

- (HKInfographicTitleDetailOptionalButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HKInfographicTitleDetailOptionalButtonCell;
  v4 = [(HKInfographicTitleDetailOptionalButtonCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(HKTitleDetailOptionalButtonView);
    titleDetailOptionalButtonView = v4->_titleDetailOptionalButtonView;
    v4->_titleDetailOptionalButtonView = v5;

    v7 = [(HKInfographicTitleDetailOptionalButtonCell *)v4 contentView];
    [v7 addSubview:v4->_titleDetailOptionalButtonView];

    v8 = v4->_titleDetailOptionalButtonView;
    v9 = [(HKInfographicTitleDetailOptionalButtonCell *)v4 contentView];
    [(UIView *)v8 hk_alignConstraintsWithView:v9];
  }
  return v4;
}

- (void)populateWithTitle:(id)a3 detail:(id)a4 buttonText:(id)a5 buttonAction:(id)a6
{
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v11[0] = a3;
    v11[1] = @"InfographicTitleDetailOptionalButtonItem";
    v11[2] = @"Cell";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:v11 count:3];
    v7 = HKUIJoinStringsForAutomationIdentifier(v6);
    [(HKInfographicTitleDetailOptionalButtonCell *)self setAccessibilityIdentifier:v7];

    v10[0] = v5;
    v10[1] = @"InfographicTitleDetailOptionalButtonItem";
    v10[2] = @"View";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    v9 = HKUIJoinStringsForAutomationIdentifier(v8);
    [(HKTitleDetailOptionalButtonView *)self->_titleDetailOptionalButtonView setAccessibilityIdentifier:v9];
  }
  else
  {
    id v8 = 0;
    [(HKInfographicTitleDetailOptionalButtonCell *)self setAccessibilityIdentifier:0];
    [(HKTitleDetailOptionalButtonView *)self->_titleDetailOptionalButtonView setAccessibilityIdentifier:0];
  }
}

- (void).cxx_destruct
{
}

@end