@interface WDSourceMessageViewController
- (WDSourceMessageViewController)initWithStyle:(int64_t)a3 source:(id)a4;
- (int64_t)style;
- (void)_updateFont;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDSourceMessageViewController

- (WDSourceMessageViewController)initWithStyle:(int64_t)a3 source:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WDSourceMessageViewController;
  v8 = [(WDSourceMessageViewController *)&v16 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    objc_storeStrong((id *)&v8->_source, a4);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    messageLabel = v9->_messageLabel;
    v9->_messageLabel = v10;

    [(UILabel *)v9->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v9->_messageLabel setTextColor:v12];

    [(UILabel *)v9->_messageLabel setNumberOfLines:0];
    [(UILabel *)v9->_messageLabel setTextAlignment:1];
    [(WDSourceMessageViewController *)v9 _updateFont];
    v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
    v14 = [(WDSourceMessageViewController *)v9 view];
    [v14 setBackgroundColor:v13];
  }
  return v9;
}

- (void)_updateFont
{
  v3 = (void *)MEMORY[0x263F1C658];
  id v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v5 _scaledValueForValue:24.0];
  v4 = objc_msgSend(v3, "systemFontOfSize:");
  [(UILabel *)self->_messageLabel setFont:v4];
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)WDSourceMessageViewController;
  [(WDSourceMessageViewController *)&v32 viewDidLoad];
  v3 = [(WDSourceMessageViewController *)self view];
  [v3 addSubview:self->_messageLabel];

  v4 = [(WDSourceMessageViewController *)self view];
  id v5 = (void *)MEMORY[0x263F08938];
  messageLabel = self->_messageLabel;
  id v7 = [(WDSourceMessageViewController *)self view];
  v8 = [v5 constraintWithItem:messageLabel attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
  [v4 addConstraint:v8];

  v9 = [(WDSourceMessageViewController *)self view];
  v10 = (void *)MEMORY[0x263F08938];
  v11 = self->_messageLabel;
  v12 = [(WDSourceMessageViewController *)self view];
  v13 = [v10 constraintWithItem:v11 attribute:3 relatedBy:0 toItem:v12 attribute:10 multiplier:0.6 constant:0.0];
  [v9 addConstraint:v13];

  v14 = [(WDSourceMessageViewController *)self view];
  v15 = (void *)MEMORY[0x263F08938];
  objc_super v16 = self->_messageLabel;
  v17 = [(WDSourceMessageViewController *)self view];
  [v17 bounds];
  v18 = [v15 constraintWithItem:v16 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:CGRectGetWidth(v33) + -60.0];
  [v14 addConstraint:v18];

  switch(self->_style)
  {
    case 1:
      v19 = self->_messageLabel;
      v20 = HKHealthRecordsAPILocalizedStringWithSource();
      [(UILabel *)v19 setText:v20];

      break;
    case 2:
      v21 = self->_messageLabel;
      v22 = WDBundle();
      v23 = [v22 localizedStringForKey:@"SOURCES_WATCH_PAIRED" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      [(UILabel *)v21 setText:v23];
      goto LABEL_7;
    case 3:
      v24 = WDBundle();
      v25 = [v24 localizedStringForKey:@"SOURCES_WATCH_UNPAIRED" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];

      v26 = self->_messageLabel;
      v27 = NSString;
      v28 = [(HKSource *)self->_source name];
      v29 = objc_msgSend(v27, "localizedStringWithFormat:", v25, v28);
      [(UILabel *)v26 setText:v29];

      break;
    case 4:
      v30 = self->_messageLabel;
      v22 = WDBundle();
      v23 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"SOURCES_LOCAL_DEVICE"];
      v31 = [v22 localizedStringForKey:v23 value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
      [(UILabel *)v30 setText:v31];

LABEL_7:
      break;
    default:
      [(UILabel *)self->_messageLabel setText:&stru_26D2EA890];
      break;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDSourceMessageViewController;
  [(WDSourceMessageViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(WDSourceMessageViewController *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(WDSourceMessageViewController *)self _updateFont];
      v9 = [(WDSourceMessageViewController *)self view];
      [v9 setNeedsLayout];
    }
  }
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end