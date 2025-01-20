@interface WDDisplayTypeDescriptionTableViewCell
+ (NSString)defaultReuseIdentifier;
+ (double)minimumHeight;
- (BOOL)showAttributionText;
- (HKDisplayType)displayType;
- (WDDisplayTypeDescriptionTableViewCell)initWithCoder:(id)a3;
- (WDDisplayTypeDescriptionTableViewCell)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 reuseIdentifier:(id)a5;
- (WDDisplayTypeDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setDisplayType:(id)a3;
- (void)setShowAttributionText:(BOOL)a3;
- (void)setupSubviews;
@end

@implementation WDDisplayTypeDescriptionTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"WDDisplayTypeDescriptionTableViewCell";
}

- (WDDisplayTypeDescriptionTableViewCell)initWithDisplayType:(id)a3 showAttributionText:(BOOL)a4 reuseIdentifier:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDDisplayTypeDescriptionTableViewCell;
  v9 = [(WDDisplayTypeDescriptionTableViewCell *)&v12 initWithStyle:0 reuseIdentifier:a5];
  v10 = v9;
  if (v9)
  {
    v9->_showAttributionText = a4;
    [(WDDisplayTypeDescriptionTableViewCell *)v9 setDisplayType:v8];
  }

  return v10;
}

- (WDDisplayTypeDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(WDDisplayTypeDescriptionTableViewCell *)self initWithDisplayType:0 showAttributionText:1 reuseIdentifier:a4];
}

- (WDDisplayTypeDescriptionTableViewCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDDisplayTypeDescriptionTableViewCell;
  return [(WDDisplayTypeDescriptionTableViewCell *)&v4 initWithCoder:a3];
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);

  [(WDDisplayTypeDescriptionTableViewCell *)self setupSubviews];
}

- (void)setupSubviews
{
  v15[1] = *MEMORY[0x263EF8340];
  v3 = [WDDisplayTypeDescriptionView alloc];
  objc_super v4 = [(WDDisplayTypeDescriptionTableViewCell *)self displayType];
  v5 = [(WDDisplayTypeDescriptionView *)v3 initWithDisplayType:v4 showAttributionText:[(WDDisplayTypeDescriptionTableViewCell *)self showAttributionText] style:0];
  descriptionView = self->_descriptionView;
  self->_descriptionView = v5;

  [(WDDisplayTypeDescriptionView *)self->_descriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(WDDisplayTypeDescriptionTableViewCell *)self contentView];
  [v7 addSubview:self->_descriptionView];

  id v8 = self->_descriptionView;
  v14 = @"descriptionView";
  v15[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = [(WDDisplayTypeDescriptionTableViewCell *)self contentView];
  v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"|-M-[descriptionView]-M-|" options:0 metrics:&unk_26D2FD6A0 views:v9];
  [v10 addConstraints:v11];

  objc_super v12 = [(WDDisplayTypeDescriptionTableViewCell *)self contentView];
  v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[descriptionView]|" options:0 metrics:&unk_26D2FD6A0 views:v9];
  [v12 addConstraints:v13];
}

+ (double)minimumHeight
{
  +[WDDisplayTypeDescriptionView minimumHeightForStyle:0];
  return result;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (BOOL)showAttributionText
{
  return self->_showAttributionText;
}

- (void)setShowAttributionText:(BOOL)a3
{
  self->_showAttributionText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);

  objc_storeStrong((id *)&self->_descriptionView, 0);
}

@end