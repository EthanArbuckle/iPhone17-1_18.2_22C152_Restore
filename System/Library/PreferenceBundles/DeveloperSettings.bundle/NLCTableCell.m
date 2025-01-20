@interface NLCTableCell
- (NLCTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)alert;
- (id)subtitle;
- (void)layoutSubviews;
- (void)setAlert:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation NLCTableCell

- (NLCTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NLCTableCell;
  v5 = [(NLCTableCell *)&v12 initWithStyle:3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    alert = v5->_alert;
    v5->_alert = 0;

    subtitle = v6->_subtitle;
    v6->_subtitle = 0;

    v9 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    detailText = v6->_detailText;
    v6->_detailText = v9;
  }
  return v6;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v4 = OBJC_IVAR___PSTableCell__checked;
  if (self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked] != a3)
  {
    self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked] = a3;
    v5 = [(NLCTableCell *)self titleLabel];
    if (self->PSTableCell_opaque[v4]) {
      +[UIColor tableCellBlueTextColor];
    }
    else {
    v6 = +[UIColor blackColor];
    }
    [v5 setColor:v6];

    v7 = [(NLCTableCell *)self detailTextLabel];
    if (self->PSTableCell_opaque[v4]) {
      +[UIColor tableCellBlueTextColor];
    }
    else {
    v8 = +[UIColor lightGrayColor];
    }
    [v7 setColor:v8];
  }
  uint64_t v9 = qword_412B8;
  if (!qword_412B8)
  {
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = +[UIImage imageNamed:@"BlueCheck.png" inBundle:v10];
    objc_super v12 = (void *)qword_412B8;
    qword_412B8 = v11;

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v14 = +[UIImage imageNamed:@"spacer.png" inBundle:v13];
    v15 = (void *)qword_412C0;
    qword_412C0 = v14;

    uint64_t v9 = qword_412B8;
  }
  if (self->PSTableCell_opaque[v4]) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = qword_412C0;
  }

  [(NLCTableCell *)self setIcon:v16];
}

- (id)subtitle
{
  return self->_subtitle;
}

- (id)alert
{
  return self->_alert;
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  if (v5 && ![(NSString *)self->_subtitle isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(NLCTableCell *)self setNeedsLayout];
  }

  _objc_release_x1();
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
    v6 = (NSString *)v7;
    alert = self->_alert;
  }
  else
  {
    v6 = 0;
  }
  self->_alert = v6;

LABEL_6:
  [(NLCTableCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)NLCTableCell;
  [(NLCTableCell *)&v32 layoutSubviews];
  v31.receiver = self;
  v31.super_class = (Class)NLCTableCell;
  v3 = [(NLCTableCell *)&v31 titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];
  id v4 = UISystemFontBoldForSize();
  [v3 setFont:v4];

  [(NSMutableString *)self->_detailText setString:&stru_35910];
  subtitle = self->_subtitle;
  if (subtitle && ![(NSString *)subtitle isEqualToString:&stru_35910])
  {
    [(NSMutableString *)self->_detailText setString:self->_subtitle];
    alert = self->_alert;
    if (alert && ![(NSString *)alert isEqualToString:&stru_35910])
    {
      [(NSMutableString *)self->_detailText appendString:@" - "];
      [(NSMutableString *)self->_detailText appendString:self->_alert];
      goto LABEL_10;
    }
LABEL_8:
    int v8 = 0;
    goto LABEL_11;
  }
  v6 = self->_alert;
  if (!v6 || [(NSString *)v6 isEqualToString:&stru_35910]) {
    goto LABEL_8;
  }
  [(NSMutableString *)self->_detailText setString:self->_alert];
LABEL_10:
  int v8 = 1;
LABEL_11:
  if (([(NSMutableString *)self->_detailText isEqualToString:&stru_35910] & 1) == 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)NLCTableCell;
    uint64_t v9 = [(NLCTableCell *)&v30 detailTextLabel];
    [v9 setText:self->_detailText];
    v29.receiver = self;
    v29.super_class = (Class)NLCTableCell;
    v10 = [(NLCTableCell *)&v29 detailTextLabel];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    v19 = [(NLCTableCell *)self contentView];
    [v19 size];
    double v21 = v20 + -30.0;

    unsigned int v22 = [(NLCTableCell *)self _shouldReverseLayoutDirection];
    double v23 = v16 - v21;
    if (!v22) {
      double v23 = -0.0;
    }
    double v24 = v12 + v23;
    v28.receiver = self;
    v28.super_class = (Class)NLCTableCell;
    v25 = [(NLCTableCell *)&v28 detailTextLabel];
    objc_msgSend(v25, "setFrame:", v24, v14, v21, v18);

    if (v8)
    {
      uint64_t v26 = +[UIColor redColor];
    }
    else
    {
      if (self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked]) {
        +[UIColor tableCellBlueTextColor];
      }
      else {
      uint64_t v26 = +[UIColor lightGrayColor];
      }
    }
    v27 = (void *)v26;
    [v9 setColor:v26];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_alert, 0);

  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end