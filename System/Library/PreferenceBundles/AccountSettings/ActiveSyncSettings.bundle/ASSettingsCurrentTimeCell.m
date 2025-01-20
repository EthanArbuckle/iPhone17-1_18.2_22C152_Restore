@interface ASSettingsCurrentTimeCell
- (ASSettingsCurrentTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)cellFocusColor;
- (UIColor)oldTextColor;
- (void)layoutSubviews;
- (void)setCellFocusColor:(BOOL)a3;
- (void)setOldTextColor:(id)a3;
@end

@implementation ASSettingsCurrentTimeCell

- (ASSettingsCurrentTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ASSettingsCurrentTimeCell;
  v9 = [(ASSettingsCurrentTimeCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"kPSOofScheduleEndDateTextColor"];
    -[ASSettingsCurrentTimeCell setCellFocusColor:](v9, "setCellFocusColor:", [v10 BOOLValue]);
  }
  return v9;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)ASSettingsCurrentTimeCell;
  [(ASSettingsCurrentTimeCell *)&v22 layoutSubviews];
  v3 = [(ASSettingsCurrentTimeCell *)self textLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(ASSettingsCurrentTimeCell *)self textLabel];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(ASSettingsCurrentTimeCell *)self oldTextColor];

  if (!v13)
  {
    v14 = [(ASSettingsCurrentTimeCell *)self valueLabel];
    v15 = [v14 color];
    [(ASSettingsCurrentTimeCell *)self setOldTextColor:v15];
  }
  if ([(ASSettingsCurrentTimeCell *)self cellFocusColor])
  {
    v16 = [(ASSettingsCurrentTimeCell *)self valueLabel];
    v17 = [v16 color];
    [(ASSettingsCurrentTimeCell *)self setOldTextColor:v17];

    v18 = +[UIApplication sharedApplication];
    v19 = [v18 keyWindow];
    v20 = [v19 tintColor];
    v21 = [(ASSettingsCurrentTimeCell *)self valueLabel];
    [v21 setColor:v20];
  }
  else
  {
    v18 = [(ASSettingsCurrentTimeCell *)self oldTextColor];
    v19 = [(ASSettingsCurrentTimeCell *)self valueLabel];
    [v19 setColor:v18];
  }

  [(ASSettingsCurrentTimeCell *)self setSelectionStyle:3];
}

- (UIColor)oldTextColor
{
  return self->_oldTextColor;
}

- (void)setOldTextColor:(id)a3
{
}

- (BOOL)cellFocusColor
{
  return self->_cellFocusColor;
}

- (void)setCellFocusColor:(BOOL)a3
{
  self->_cellFocusColor = a3;
}

- (void).cxx_destruct
{
}

@end