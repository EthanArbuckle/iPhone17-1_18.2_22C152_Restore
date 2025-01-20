@interface CKDetailsLocationShareCell
+ (id)identifier;
- (BOOL)showOfferTimeRemaining;
- (CKDetailsLocationShareCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CKStandardButton)button;
- (UILabel)timeRemainingLabel;
- (UIMenu)menu;
- (double)offerTimeRemaining;
- (id)timeStringForTimeInterval:(double)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setButton:(id)a3;
- (void)setMenu:(id)a3;
- (void)setOfferTimeRemaining:(double)a3;
- (void)setShowOfferTimeRemaining:(BOOL)a3;
- (void)setTimeRemainingLabel:(id)a3;
@end

@implementation CKDetailsLocationShareCell

+ (id)identifier
{
  return @"offer_time_remaining_cell";
}

- (CKDetailsLocationShareCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v41[4] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)CKDetailsLocationShareCell;
  v4 = [(CKTranscriptDetailsResizableCell *)&v40 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CKDetailsLocationShareCell *)v4 detailTextLabel];
    [(CKDetailsLocationShareCell *)v5 setTimeRemainingLabel:v6];

    v7 = [(CKDetailsLocationShareCell *)v5 timeRemainingLabel];
    v8 = +[CKUIBehavior sharedBehaviors];
    v9 = [v8 theme];
    v10 = [v9 secondaryLabelColor];
    [v7 setTextColor:v10];

    v11 = [(CKDetailsLocationShareCell *)v5 textLabel];
    [v11 setNumberOfLines:0];

    v12 = [(CKDetailsLocationShareCell *)v5 textLabel];
    [v12 setLineBreakMode:0];

    v13 = objc_alloc_init(CKStandardButton);
    [(CKDetailsLocationShareCell *)v5 setButton:v13];

    v14 = [(CKDetailsLocationShareCell *)v5 button];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(CKDetailsLocationShareCell *)v5 button];
    [v15 setContextMenuIsPrimary:1];

    v16 = [(CKDetailsLocationShareCell *)v5 menu];
    v17 = [(CKDetailsLocationShareCell *)v5 button];
    [v17 setMenu:v16];

    v18 = [(CKDetailsLocationShareCell *)v5 menu];
    v19 = [(CKDetailsLocationShareCell *)v5 button];
    [v19 setHidden:v18 == 0];

    v20 = [(CKDetailsLocationShareCell *)v5 button];
    [(CKDetailsLocationShareCell *)v5 addSubview:v20];

    v32 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [(CKDetailsLocationShareCell *)v5 button];
    v38 = [v39 leftAnchor];
    v37 = [(CKDetailsLocationShareCell *)v5 leftAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v41[0] = v36;
    v35 = [(CKDetailsLocationShareCell *)v5 button];
    v34 = [v35 rightAnchor];
    v33 = [(CKDetailsLocationShareCell *)v5 rightAnchor];
    v31 = [v34 constraintEqualToAnchor:v33];
    v41[1] = v31;
    v21 = [(CKDetailsLocationShareCell *)v5 button];
    v22 = [v21 topAnchor];
    v23 = [(CKDetailsLocationShareCell *)v5 topAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v41[2] = v24;
    v25 = [(CKDetailsLocationShareCell *)v5 button];
    v26 = [v25 bottomAnchor];
    v27 = [(CKDetailsLocationShareCell *)v5 bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v41[3] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
    [v32 activateConstraints:v29];
  }
  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareCell;
  [(CKDetailsCell *)&v4 layoutSubviews];
  v3 = [(CKDetailsLocationShareCell *)self timeRemainingLabel];
  objc_msgSend(v3, "setHidden:", -[CKDetailsLocationShareCell showOfferTimeRemaining](self, "showOfferTimeRemaining") ^ 1);
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsLocationShareCell;
  [(CKDetailsCell *)&v7 prepareForReuse];
  [(CKDetailsLocationShareCell *)self setShowOfferTimeRemaining:0];
  v3 = [(CKDetailsLocationShareCell *)self timeRemainingLabel];
  [v3 setText:&stru_1EDE4CA38];

  objc_super v4 = [(CKDetailsLocationShareCell *)self textLabel];
  [v4 setText:&stru_1EDE4CA38];

  [(CKDetailsLocationShareCell *)self setMenu:0];
  v5 = [(CKDetailsLocationShareCell *)self menu];
  v6 = [(CKDetailsLocationShareCell *)self button];
  [v6 setHidden:v5 == 0];
}

- (void)setMenu:(id)a3
{
  objc_super v7 = (UIMenu *)a3;
  if (self->_menu != v7)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    v5 = [(CKDetailsLocationShareCell *)self button];
    [v5 setMenu:v7];

    v6 = [(CKDetailsLocationShareCell *)self button];
    [v6 setHidden:v7 == 0];
  }
}

- (void)setShowOfferTimeRemaining:(BOOL)a3
{
  if (self->_showOfferTimeRemaining != a3)
  {
    self->_showOfferTimeRemaining = a3;
    [(CKDetailsLocationShareCell *)self setNeedsLayout];
  }
}

- (void)setOfferTimeRemaining:(double)a3
{
  if (self->_offerTimeRemaining != a3)
  {
    self->_offerTimeRemaining = a3;
    if ([(CKDetailsLocationShareCell *)self showOfferTimeRemaining])
    {
      v5 = [(CKDetailsLocationShareCell *)self timeRemainingLabel];
      v6 = [(CKDetailsLocationShareCell *)self timeStringForTimeInterval:a3];
      [v5 setText:v6];

      [(CKDetailsLocationShareCell *)self setNeedsLayout];
    }
  }
}

- (id)timeStringForTimeInterval:(double)a3
{
  uint64_t v3 = (uint64_t)a3;
  if ((unint64_t)((uint64_t)a3 + 3599) >= 0x1C1F)
  {
    uint64_t v4 = v3 / 3600;
    v5 = NSString;
    v6 = CKFrameworkBundle();
    objc_super v7 = v6;
    v8 = @"OFFER_TIME_REMAINING_HOURS";
    goto LABEL_5;
  }
  uint64_t v4 = v3 / 60 % 60;
  if (v4)
  {
    v5 = NSString;
    v6 = CKFrameworkBundle();
    objc_super v7 = v6;
    v8 = @"OFFER_TIME_REMAINING_MINUTES";
LABEL_5:
    v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
    v10 = [NSNumber numberWithInteger:v4];
    v11 = CKLocalizedStringForNumber(v10);
    v12 = objc_msgSend(v5, "stringWithFormat:", v9, v11);

    v13 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (v14 == 1) {
      v15 = @"\u200F";
    }
    else {
      v15 = @"\u200E";
    }
    uint64_t v16 = [(__CFString *)v15 stringByAppendingString:v12];
    goto LABEL_10;
  }
  v12 = CKFrameworkBundle();
  uint64_t v16 = [v12 localizedStringForKey:@"OFFER_TIME_REMAINING_LESS_THAN_ONE_MINUTE" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_10:
  v17 = (void *)v16;

  return v17;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)showOfferTimeRemaining
{
  return self->_showOfferTimeRemaining;
}

- (double)offerTimeRemaining
{
  return self->_offerTimeRemaining;
}

- (CKStandardButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UILabel)timeRemainingLabel
{
  return self->_timeRemainingLabel;
}

- (void)setTimeRemainingLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_menu, 0);
}

@end