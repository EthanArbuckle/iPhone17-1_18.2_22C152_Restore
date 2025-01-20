@interface VPNPrimaryTableCell
- (BOOL)disabled;
- (NSMutableString)detailText;
- (NSString)alert;
- (NSString)subtitle;
- (NSString)vpnPrimaryTableCellStatus;
- (UILabel)specialStatusLabel;
- (VPNPrimaryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
- (void)setAlert:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setSpecialStatusLabel:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setVpnPrimaryTableCellStatus:(id)a3;
- (void)updateDetail;
@end

@implementation VPNPrimaryTableCell

- (VPNPrimaryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)VPNPrimaryTableCell;
  v5 = [(PSTableCell *)&v13 initWithStyle:3 reuseIdentifier:a4 specifier:a5];
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

    specialStatusLabel = v6->_specialStatusLabel;
    v6->_specialStatusLabel = 0;
  }
  return v6;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)vpnPrimaryTableCellStatus
{
  return self->_vpnPrimaryTableCellStatus;
}

- (NSString)alert
{
  return self->_alert;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)updateDetail
{
  [(NSMutableString *)self->_detailText setString:&stru_26E7C6230];
  subtitle = self->_subtitle;
  if (subtitle && ![(NSString *)subtitle isEqualToString:&stru_26E7C6230])
  {
    [(NSMutableString *)self->_detailText appendString:self->_subtitle];
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
  v4 = self->_alert;
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
    v22.super_class = (Class)VPNPrimaryTableCell;
    v7 = [(VPNPrimaryTableCell *)&v22 detailTextLabel];
    [v7 setText:self->_detailText];
    v21.receiver = self;
    v21.super_class = (Class)VPNPrimaryTableCell;
    v8 = [(VPNPrimaryTableCell *)&v21 detailTextLabel];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(VPNPrimaryTableCell *)self contentView];
    [v15 size];
    double v17 = v16 + -30.0;

    v20.receiver = self;
    v20.super_class = (Class)VPNPrimaryTableCell;
    v18 = [(VPNPrimaryTableCell *)&v20 detailTextLabel];
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
    [(VPNPrimaryTableCell *)self updateDetail];
    [(VPNPrimaryTableCell *)self setNeedsLayout];
  }

  MEMORY[0x270F9A758]();
}

- (void)setVpnPrimaryTableCellStatus:(id)a3
{
  id v5 = a3;
  if (v5 && ![(NSString *)self->_vpnPrimaryTableCellStatus isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_vpnPrimaryTableCellStatus, a3);
    [(VPNPrimaryTableCell *)self updateDetail];
    [(VPNPrimaryTableCell *)self setNeedsLayout];
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
  [(VPNPrimaryTableCell *)self updateDetail];
  [(VPNPrimaryTableCell *)self setNeedsLayout];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(VPNPrimaryTableCell *)self updateDetail];
    [(VPNPrimaryTableCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)VPNPrimaryTableCell;
  v3 = [(PSTableCell *)&v43 titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];
  if ([(VPNPrimaryTableCell *)self disabled]) {
    [MEMORY[0x263F1C550] _secondaryLabelColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] _labelColor];
  }
  [v3 setColor:v4];

  v42.receiver = self;
  v42.super_class = (Class)VPNPrimaryTableCell;
  [(PSTableCell *)&v42 layoutSubviews];
  id v5 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained userInfo];
  v8 = [v7 objectForKey:@"vpn-status"];

  if (v8)
  {
    double v9 = [(VPNPrimaryTableCell *)self specialStatusLabel];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
      [(VPNPrimaryTableCell *)self setSpecialStatusLabel:v10];

      double v11 = [(VPNPrimaryTableCell *)self contentView];
      double v12 = [(VPNPrimaryTableCell *)self specialStatusLabel];
      [v11 addSubview:v12];
    }
    double v13 = [(VPNPrimaryTableCell *)self specialStatusLabel];
    double v14 = [(VPNPrimaryTableCell *)self vpnPrimaryTableCellStatus];
    [v13 setText:v14];

    [v13 setTextAlignment:2];
    v15 = [MEMORY[0x263F1C550] _secondaryLabelColor];
    [v13 setColor:v15];

    double v16 = [(VPNPrimaryTableCell *)self contentView];
    [v16 size];
    double v18 = v17;
    v19 = [(VPNPrimaryTableCell *)self contentView];
    [v19 size];
    objc_msgSend(v13, "setFrame:", 0.0, 0.0, v18, v20);

    [v13 sizeToFit];
    objc_super v21 = [(VPNPrimaryTableCell *)self contentView];
    [v21 size];
    double v23 = v22;
    [v13 frame];
    double v25 = v23 - v24;

    id v26 = objc_loadWeakRetained(v5);
    uint64_t v27 = [v26 cellType];

    if (v27 == 3)
    {
      id v28 = objc_loadWeakRetained(v5);
      v29 = [v28 propertyForKey:*MEMORY[0x263F5FEE8]];
      int v30 = [v29 intValue];

      if (!v30) {
        double v25 = v25 + -40.0;
      }
    }
    [v13 frame];
    double v32 = v31;
    v33 = [(VPNPrimaryTableCell *)self contentView];
    [v33 size];
    objc_msgSend(v13, "setFrame:", v25, 0.0, v32, v34);

    [v3 setAdjustsFontSizeToFitWidth:0];
    [v3 frame];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    [v3 origin];
    objc_msgSend(v3, "setFrame:", v36, v38, v25 - v41, v40);
  }
}

- (UILabel)specialStatusLabel
{
  return self->_specialStatusLabel;
}

- (void)setSpecialStatusLabel:(id)a3
{
}

- (NSMutableString)detailText
{
  return (NSMutableString *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setDetailText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_specialStatusLabel, 0);
  objc_storeStrong((id *)&self->_vpnPrimaryTableCellStatus, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end