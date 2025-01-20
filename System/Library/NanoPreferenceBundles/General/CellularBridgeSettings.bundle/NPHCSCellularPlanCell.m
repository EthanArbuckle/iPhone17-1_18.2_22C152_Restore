@interface NPHCSCellularPlanCell
+ (BOOL)_showStatusSpinnerForPlanStatus:(int)a3;
+ (id)_planStatusDescriptionForPlanPropertyStatus:(int)a3;
+ (id)cellForTableView:(id)a3 reuseIdentifier:(id)a4 cellularPlanItem:(id)a5 hasMultipleActiveSIM:(BOOL)a6;
- (NPHCSCellularPlanCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation NPHCSCellularPlanCell

- (NPHCSCellularPlanCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCSCellularPlanCell;
  return [(NPHCSCellularPlanCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

+ (id)cellForTableView:(id)a3 reuseIdentifier:(id)a4 cellularPlanItem:(id)a5 hasMultipleActiveSIM:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  v11 = [a3 dequeueReusableCellWithIdentifier:v9];
  if (!v11) {
    v11 = [[NPHCSCellularPlanCell alloc] initWithStyle:3 reuseIdentifier:v9];
  }
  v12 = +[NPHCellularBridgeUIManager sharedInstance];
  v13 = [v12 displayNameForCellularPlan:v10];

  v14 = v13;
  if (!v13)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v12 localizedStringForKey:@"WAITING_FOR_CARRIER_NAME" value:&stru_1CDE0 table:0];
  }
  v15 = [(NPHCSCellularPlanCell *)v11 textLabel];
  [v15 setText:v14];

  if (v13)
  {
    if (!v10) {
      goto LABEL_10;
    }
  }
  else
  {

    if (!v10)
    {
LABEL_10:
      id v18 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v18 startAnimating];
      [(NPHCSCellularPlanCell *)v11 setAccessoryView:v18];

      int v19 = 1;
      goto LABEL_12;
    }
  }
  v16 = [v10 plan];
  unsigned int v17 = +[NPHCSCellularPlanCell _showStatusSpinnerForPlanStatus:](NPHCSCellularPlanCell, "_showStatusSpinnerForPlanStatus:", [v16 status]);

  if (v17) {
    goto LABEL_10;
  }
  [(NPHCSCellularPlanCell *)v11 setAccessoryType:4];
  int v19 = 0;
LABEL_12:
  v20 = [v10 plan];
  v21 = +[NPHCSCellularPlanCell _planStatusDescriptionForPlanPropertyStatus:](NPHCSCellularPlanCell, "_planStatusDescriptionForPlanPropertyStatus:", [v20 status]);

  if (v10)
  {
    if (((v21 == 0) & ~v19) != 0)
    {
      if (!v6) {
        goto LABEL_24;
      }
      v25 = [v10 phoneNumber];
      v26 = [(NPHCSCellularPlanCell *)v11 detailTextLabel];
      [v26 setText:v25];

LABEL_20:
      v27 = +[UIImage systemImageNamed:@"checkmark"];
      v28 = [(NPHCSCellularPlanCell *)v11 imageView];
      [v28 setImage:v27];

      if ([v10 isSelected]) {
        double v29 = 1.0;
      }
      else {
        double v29 = 0.0;
      }
      v30 = [(NPHCSCellularPlanCell *)v11 imageView];
      [v30 setAlpha:v29];

      goto LABEL_24;
    }
    v22 = [(NPHCSCellularPlanCell *)v11 detailTextLabel];
    [v22 setText:v21];
  }
  else
  {
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"WAITING_FOR_CARRIER_LOADING_PLAN_INFORMATION" value:&stru_1CDE0 table:0];
    v24 = [(NPHCSCellularPlanCell *)v11 detailTextLabel];
    [v24 setText:v23];
  }
  if (v6) {
    goto LABEL_20;
  }
LABEL_24:

  return v11;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)NPHCSCellularPlanCell;
  [(NPHCSCellularPlanCell *)&v6 prepareForReuse];
  [(NPHCSCellularPlanCell *)self setAccessoryView:0];
  v3 = [(NPHCSCellularPlanCell *)self imageView];
  [v3 setImage:0];

  v4 = [(NPHCSCellularPlanCell *)self textLabel];
  [v4 setText:0];

  objc_super v5 = [(NPHCSCellularPlanCell *)self detailTextLabel];
  [v5 setText:0];
}

+ (BOOL)_showStatusSpinnerForPlanStatus:(int)a3
{
  return (a3 < 0xC) & (0xDC4u >> a3);
}

+ (id)_planStatusDescriptionForPlanPropertyStatus:(int)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
    case 5:
      goto LABEL_13;
    case 1:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_EXPIRED";
      goto LABEL_12;
    case 2:
    case 6:
    case 7:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_ACTIVATING";
      goto LABEL_12;
    case 3:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_DEVICE_MISMATCH";
      goto LABEL_12;
    case 4:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_PROVISIONING_ERROR";
      goto LABEL_12;
    case 8:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_DELETING";
      goto LABEL_12;
    case 9:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_WAITING";
      goto LABEL_12;
    case 10:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_SWITCHING";
      goto LABEL_12;
    case 11:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_TRANSFERRING";
      goto LABEL_12;
    case 13:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_PENDING";
      goto LABEL_12;
    default:
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v5 = v4;
      CFStringRef v6 = @"CELLULAR_PLAN_STATUS_OTHER";
LABEL_12:
      v3 = [v4 localizedStringForKey:v6 value:&stru_1CDE0 table:0];

LABEL_13:
      return v3;
  }
}

@end