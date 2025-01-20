@interface VPNTableCell
- (NSMutableString)detailText;
- (NSString)alert;
- (NSString)subtitle;
- (VPNTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
- (void)setAlert:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setDetailText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)updateDetail;
@end

@implementation VPNTableCell

- (VPNTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VPNTableCell;
  v5 = [(PSTableCell *)&v12 initWithStyle:3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    alert = v5->_alert;
    v5->_alert = 0;

    subtitle = v6->_subtitle;
    v6->_subtitle = 0;

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    detailText = v6->_detailText;
    v6->_detailText = v9;
  }
  return v6;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v4 = (int)*MEMORY[0x263F5FE50];
  if (*((unsigned char *)&self->super.super.super.super.super.isa + v4) != a3) {
    *((unsigned char *)&self->super.super.super.super.super.isa + v4) = a3;
  }
  v5 = [(PSTableCell *)self titleLabel];
  v6 = [MEMORY[0x263F1C550] _labelColor];
  [v5 setColor:v6];

  v7 = [(VPNTableCell *)self detailTextLabel];
  v8 = [MEMORY[0x263F1C550] _secondaryLabelColor];
  [v7 setColor:v8];

  if (!setChecked__checkmark)
  {
    uint64_t v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
    v10 = (void *)setChecked__checkmark;
    setChecked__checkmark = v9;
  }
  -[PSTableCell setIcon:](self, "setIcon:");
  BOOL v11 = *((unsigned char *)&self->super.super.super.super.super.isa + v4) == 0;
  id v12 = [(VPNTableCell *)self imageView];
  [v12 setHidden:v11];
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)alert
{
  return self->_alert;
}

- (void)updateDetail
{
  [(NSMutableString *)self->_detailText setString:&stru_26E7C6230];
  subtitle = self->_subtitle;
  if (subtitle && ![(NSString *)subtitle isEqualToString:&stru_26E7C6230])
  {
    [(NSMutableString *)self->_detailText setString:self->_subtitle];
    alert = self->_alert;
    if (alert && ![(NSString *)alert isEqualToString:&stru_26E7C6230])
    {
      [(NSMutableString *)self->_detailText appendString:@" - "];
      [(NSMutableString *)self->_detailText appendString:self->_alert];
      goto LABEL_10;
    }
LABEL_8:
    int v6 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = self->_alert;
  if (!v4 || [(NSString *)v4 isEqualToString:&stru_26E7C6230]) {
    goto LABEL_8;
  }
  [(NSMutableString *)self->_detailText setString:self->_alert];
LABEL_10:
  int v6 = 1;
LABEL_11:
  if (([(NSMutableString *)self->_detailText isEqualToString:&stru_26E7C6230] & 1) == 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)VPNTableCell;
    v7 = [(VPNTableCell *)&v22 detailTextLabel];
    [v7 setText:self->_detailText];
    v21.receiver = self;
    v21.super_class = (Class)VPNTableCell;
    v8 = [(VPNTableCell *)&v21 detailTextLabel];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(VPNTableCell *)self contentView];
    [v15 size];
    double v17 = v16 + -30.0;

    v20.receiver = self;
    v20.super_class = (Class)VPNTableCell;
    v18 = [(VPNTableCell *)&v20 detailTextLabel];
    objc_msgSend(v18, "setFrame:", v10, v12, v17, v14);

    if (v6) {
      [MEMORY[0x263F1C550] redColor];
    }
    else {
    v19 = [MEMORY[0x263F1C550] _secondaryLabelColor];
    }
    [v7 setColor:v19];
  }
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  if (v5 && ![(NSString *)self->_subtitle isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(VPNTableCell *)self updateDetail];
    [(VPNTableCell *)self setNeedsLayout];
  }

  MEMORY[0x270F9A758]();
}

- (void)setAlert:(id)a3
{
  id v4 = a3;
  alert = self->_alert;
  id v7 = v4;
  if (v4)
  {
    if ([(NSString *)alert isEqualToString:v4]) {
      goto LABEL_6;
    }
    int v6 = (NSString *)v7;
    alert = self->_alert;
  }
  else
  {
    int v6 = 0;
  }
  self->_alert = v6;

LABEL_6:
  [(VPNTableCell *)self updateDetail];
  [(VPNTableCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VPNTableCell;
  v3 = [(PSTableCell *)&v5 titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];
  v4.receiver = self;
  v4.super_class = (Class)VPNTableCell;
  [(PSTableCell *)&v4 layoutSubviews];
}

- (NSMutableString)detailText
{
  return (NSMutableString *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setDetailText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end