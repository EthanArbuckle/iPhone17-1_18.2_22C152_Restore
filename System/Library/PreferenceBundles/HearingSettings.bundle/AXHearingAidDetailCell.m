@interface AXHearingAidDetailCell
+ (double)heightRequiredForDevice:(id)a3;
- (AXHearingAidDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 andDevice:(id)a5;
- (AXHearingAidDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AXRemoteHearingAidDevice)device;
- (id)accessibilityValue;
- (id)imageForBatteryLevel:(double)a3;
- (unint64_t)accessibilityTraits;
- (void)bluetoothAvailabilityDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDevice:(id)a3;
- (void)updateAvailability;
- (void)updateDetails;
@end

@implementation AXHearingAidDetailCell

+ (double)heightRequiredForDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 manufacturer];
  v5 = [v4 firstObject];
  v6 = [v3 model];
  v7 = [v6 firstObject];
  v8 = +[NSString stringWithFormat:@"%@ %@", v5, v7];

  v9 = [v3 manufacturer];
  v10 = [v9 lastObject];
  v11 = [v3 model];

  v12 = [v11 lastObject];
  v13 = +[NSString stringWithFormat:@"%@ %@", v10, v12];

  double v14 = 65.0;
  if (([v8 isEqualToString:v13] & 1) == 0
    && (unint64_t)[v8 length] >= 2)
  {
    if ((unint64_t)[v13 length] <= 1) {
      double v14 = 65.0;
    }
    else {
      double v14 = 80.0;
    }
  }

  return v14;
}

- (AXHearingAidDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a5)
  {
    id v8 = a4;
    v9 = [a5 userInfo];
    v10 = [(AXHearingAidDetailCell *)self initWithStyle:a3 reuseIdentifier:v8 andDevice:v9];

    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (AXHearingAidDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 andDevice:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AXHearingAidDetailCell;
  v9 = [(AXHearingAidDetailCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(AXHearingAidDetailCell *)v9 setDevice:v8];
    v10->_bluetoothAvailable = 1;
    [(AXHearingAidDetailCell *)v10 bluetoothAvailabilityDidChange:0];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v10 selector:"bluetoothAvailabilityDidChange:" name:BluetoothAvailabilityChangedNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v10 selector:"bluetoothAvailabilityDidChange:" name:BluetoothPowerChangedNotification object:0];

    v13 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    numberFormatter = v10->_numberFormatter;
    v10->_numberFormatter = v13;

    [(NSNumberFormatter *)v10->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v10->_numberFormatter setMaximumFractionDigits:0];
    [(AXHearingAidDetailCell *)v10 updateAvailability];
  }

  return v10;
}

- (void)updateDetails
{
  id v3 = [(AXRemoteHearingAidDevice *)self->_device manufacturer];
  v4 = [v3 firstObject];

  v5 = [(AXRemoteHearingAidDevice *)self->_device model];
  v6 = [v5 firstObject];

  v7 = [(AXRemoteHearingAidDevice *)self->_device manufacturer];
  id v8 = [v7 lastObject];

  v9 = [(AXRemoteHearingAidDevice *)self->_device model];
  v10 = [v9 lastObject];

  if (v4) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v12 = &stru_3D6D8;
  }
  else
  {
    v12 = +[NSString stringWithFormat:@"%@ %@", v4, v6];
  }
  if (v8) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    double v14 = &stru_3D6D8;
  }
  else
  {
    double v14 = +[NSString stringWithFormat:@"%@ %@", v8, v10];
  }
  if ([(AXRemoteHearingAidDevice *)self->_device leftAvailable]
    && [(AXRemoteHearingAidDevice *)self->_device rightAvailable]
    && ([(__CFString *)v12 isEqualToString:v14] & 1) == 0
    && (unint64_t)[(__CFString *)v12 length] >= 2
    && (unint64_t)[(__CFString *)v14 length] >= 2)
  {
    v23 = +[NSString stringWithFormat:@"%@\n%@", v14, v12];
    v15 = [(AXHearingAidDetailCell *)self valueLabel];
    objc_super v16 = v15;
    uint64_t v17 = 2;
  }
  else
  {
    if ((unint64_t)[(__CFString *)v12 length] <= 1) {
      v18 = v14;
    }
    else {
      v18 = v12;
    }
    v23 = v18;
    v15 = [(AXHearingAidDetailCell *)self valueLabel];
    objc_super v16 = v15;
    uint64_t v17 = 1;
  }
  [v15 setNumberOfLines:v17];

  v19 = [(AXHearingAidDetailCell *)self valueLabel];
  [v19 setText:v23];

  v20 = [(AXHearingAidDetailCell *)self valueLabel];
  v21 = [v20 text];

  if (!v21)
  {
    v22 = [(AXHearingAidDetailCell *)self valueLabel];
    [v22 setText:@" "];
  }
}

- (void)bluetoothAvailabilityDidChange:(id)a3
{
  v4 = +[BluetoothManager sharedInstance];
  if ([v4 available])
  {
    v5 = +[BluetoothManager sharedInstance];
    unsigned __int8 v6 = [v5 powered];

    if (v6)
    {
      self->_bluetoothAvailable = 1;
      v7 = [(AXHearingAidDetailCell *)self device];
      id v8 = [v7 name];
      v9 = [(AXHearingAidDetailCell *)self titleLabel];
      [v9 setText:v8];

      v10 = [(AXHearingAidDetailCell *)self titleLabel];
      BOOL v11 = [v10 text];

      if (!v11)
      {
        v12 = hearingLocString();
        BOOL v13 = [(AXHearingAidDetailCell *)self titleLabel];
        [v13 setText:v12];
      }
      [(AXHearingAidDetailCell *)self updateDetails];
      return;
    }
  }
  else
  {
  }
  self->_bluetoothAvailable = 0;
  double v14 = hearingLocString();
  v15 = [(AXHearingAidDetailCell *)self titleLabel];
  [v15 setText:v14];

  objc_super v16 = [(AXHearingAidDetailCell *)self detailTextLabel];
  [v16 setText:@" "];

  uint64_t v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothAvailabilityChangedNotification object:0];

  id v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothPowerChangedNotification object:0];
}

- (void)dealloc
{
  [(UILabel *)self->_leftLabel removeFromSuperview];
  [(UIView *)self->_leftStatusIndicator removeFromSuperview];
  [(UILabel *)self->_rightLabel removeFromSuperview];
  [(UIView *)self->_rightStatusIndicator removeFromSuperview];
  [(UIActivityIndicatorView *)self->_loadingIndicator removeFromSuperview];
  [(AXHearingAidDetailCell *)self setDevice:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXHearingAidDetailCell;
  [(AXHearingAidDetailCell *)&v4 dealloc];
}

- (id)imageForBatteryLevel:(double)a3
{
  objc_super v4 = accessibilityHearingAidImageNamed();
  [v4 size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  v9 = +[UIScreen mainScreen];
  [v9 scale];
  CGFloat v11 = v10;
  v21.width = v6;
  v21.height = v8;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v11);

  objc_msgSend(v4, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  float v12 = a3 * 19.0;
  double v13 = fmax(ceilf(v12) + 0.0, 3.0);
  double v14 = +[UIColor systemGrayColor];
  [v14 set];

  v15 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 2.0, 6.5, v13, 7.0);
  [v15 fill];

  objc_super v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  uint64_t v17 = [v16 imageFlippedForRightToLeftLayoutDirection];

  id v18 = [v17 imageWithRenderingMode:2];

  return v18;
}

- (void)updateAvailability
{
  id v3 = [(AXHearingAidDetailCell *)self device];
  if ([v3 leftAvailable])
  {
    leftLabel = self->_leftLabel;

    if (leftLabel) {
      goto LABEL_5;
    }
    double v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    CGFloat v6 = self->_leftLabel;
    self->_leftLabel = v5;

    double v7 = self->_leftLabel;
    CGFloat v8 = +[UIColor clearColor];
    [(UILabel *)v7 setBackgroundColor:v8];

    v9 = self->_leftLabel;
    double v10 = hearingLocString();
    [(UILabel *)v9 setText:v10];

    CGFloat v11 = self->_leftLabel;
    float v12 = +[UIFont systemFontOfSize:14.0];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)self->_leftLabel sizeToFit];
    double v13 = self->_leftLabel;
    double v14 = +[UIColor systemGrayColor];
    [(UILabel *)v13 setTextColor:v14];

    id v3 = [(AXHearingAidDetailCell *)self contentView];
    [v3 addSubview:self->_leftLabel];
  }

LABEL_5:
  v15 = [(AXHearingAidDetailCell *)self device];
  if ([v15 rightAvailable])
  {
    rightLabel = self->_rightLabel;

    if (rightLabel) {
      goto LABEL_9;
    }
    uint64_t v17 = (UILabel *)objc_alloc_init((Class)UILabel);
    id v18 = self->_rightLabel;
    self->_rightLabel = v17;

    v19 = self->_rightLabel;
    v20 = +[UIColor clearColor];
    [(UILabel *)v19 setBackgroundColor:v20];

    CGSize v21 = self->_rightLabel;
    v22 = hearingLocString();
    [(UILabel *)v21 setText:v22];

    v23 = self->_rightLabel;
    v24 = +[UIFont systemFontOfSize:14.0];
    [(UILabel *)v23 setFont:v24];

    [(UILabel *)self->_rightLabel sizeToFit];
    v25 = self->_rightLabel;
    v26 = +[UIColor systemGrayColor];
    [(UILabel *)v25 setTextColor:v26];

    v15 = [(AXHearingAidDetailCell *)self contentView];
    [v15 addSubview:self->_rightLabel];
  }

LABEL_9:
  HAInitializeLogging();
  v27 = [(AXHearingAidDetailCell *)self device];
  unsigned int v28 = [v27 isPaired];
  v29 = +[AXHAServer sharedInstance];
  v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SPINNER hidden: paired %d, reachable %d, BT on %d", v28, [v29 hearingAidReachable], self->_bluetoothAvailable);

  v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[AXHearingAidDetailCell updateAvailability]", 223, v30);
  v32 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v31;
    v34 = v32;
    *(_DWORD *)buf = 136446210;
    id v81 = [v33 UTF8String];
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v35 = [(AXHearingAidDetailCell *)self device];
  if (![v35 isPaired]) {
    goto LABEL_19;
  }
  v36 = +[AXHAServer sharedInstance];
  if (([v36 hearingAidReachable] & 1) == 0)
  {

LABEL_19:
    goto LABEL_20;
  }
  BOOL bluetoothAvailable = self->_bluetoothAvailable;

  if (bluetoothAvailable)
  {
    [(UIActivityIndicatorView *)self->_loadingIndicator removeFromSuperview];
    loadingIndicator = self->_loadingIndicator;
    self->_loadingIndicator = 0;

    v39 = [(AXHearingAidDetailCell *)self device];
    unsigned int v40 = [v39 leftAvailable];

    if (v40)
    {
      [(UIView *)self->_leftStatusIndicator removeFromSuperview];
      leftStatusIndicator = self->_leftStatusIndicator;
      self->_leftStatusIndicator = 0;

      v42 = [(AXHearingAidDetailCell *)self device];
      unsigned int v43 = [v42 isLeftConnected];

      if (v43)
      {
        v44 = [(AXHearingAidDetailCell *)self device];
        unsigned int v45 = [v44 propertyIsAvailable:4 forEar:2];

        if (v45)
        {
          id v46 = objc_alloc((Class)UIImageView);
          [(AXRemoteHearingAidDevice *)self->_device leftBatteryLevel];
          v47 = -[AXHearingAidDetailCell imageForBatteryLevel:](self, "imageForBatteryLevel:");
          v48 = (UIView *)[v46 initWithImage:v47];
          v49 = self->_leftStatusIndicator;
          self->_leftStatusIndicator = v48;

          v50 = self->_leftStatusIndicator;
          v51 = +[UIColor systemGrayColor];
          [(UIView *)v50 setTintColor:v51];

          [(UIView *)self->_leftStatusIndicator sizeToFit];
          v52 = [(AXHearingAidDetailCell *)self contentView];
          [v52 addSubview:self->_leftStatusIndicator];
        }
      }
      else
      {
        v61 = (UIView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
        v62 = self->_leftStatusIndicator;
        self->_leftStatusIndicator = v61;

        v63 = [(AXHearingAidDetailCell *)self contentView];
        [v63 addSubview:self->_leftStatusIndicator];

        [(UIView *)self->_leftStatusIndicator startAnimating];
      }
    }
    v64 = [(AXHearingAidDetailCell *)self device];
    unsigned int v65 = [v64 rightAvailable];

    if (!v65) {
      goto LABEL_30;
    }
    [(UIView *)self->_rightStatusIndicator removeFromSuperview];
    rightStatusIndicator = self->_rightStatusIndicator;
    self->_rightStatusIndicator = 0;

    v67 = [(AXHearingAidDetailCell *)self device];
    unsigned int v68 = [v67 isRightConnected];

    if (v68)
    {
      v69 = [(AXHearingAidDetailCell *)self device];
      unsigned int v70 = [v69 propertyIsAvailable:4 forEar:4];

      if (v70)
      {
        id v71 = objc_alloc((Class)UIImageView);
        [(AXRemoteHearingAidDevice *)self->_device rightBatteryLevel];
        v72 = -[AXHearingAidDetailCell imageForBatteryLevel:](self, "imageForBatteryLevel:");
        v73 = (UIView *)[v71 initWithImage:v72];
        v74 = self->_rightStatusIndicator;
        self->_rightStatusIndicator = v73;

        v75 = self->_rightStatusIndicator;
        v76 = +[UIColor systemGrayColor];
        [(UIView *)v75 setTintColor:v76];

        [(UIView *)self->_rightStatusIndicator sizeToFit];
        v53 = [(AXHearingAidDetailCell *)self contentView];
        [v53 addSubview:self->_rightStatusIndicator];
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v77 = (UIView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    v78 = self->_rightStatusIndicator;
    self->_rightStatusIndicator = v77;

    v79 = [(AXHearingAidDetailCell *)self contentView];
    [v79 addSubview:self->_rightStatusIndicator];

    v60 = (UIActivityIndicatorView *)self->_rightStatusIndicator;
LABEL_23:
    [(UIActivityIndicatorView *)v60 startAnimating];
    goto LABEL_30;
  }
LABEL_20:
  v53 = [(AXHearingAidDetailCell *)self device];
  if (![v53 isPaired])
  {
LABEL_29:

    goto LABEL_30;
  }
  v54 = self->_loadingIndicator;

  if (!v54)
  {
    [(UIView *)self->_leftStatusIndicator removeFromSuperview];
    [(UIView *)self->_rightStatusIndicator removeFromSuperview];
    v55 = self->_leftStatusIndicator;
    self->_leftStatusIndicator = 0;

    v56 = self->_rightStatusIndicator;
    self->_rightStatusIndicator = 0;

    v57 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    v58 = self->_loadingIndicator;
    self->_loadingIndicator = v57;

    v59 = [(AXHearingAidDetailCell *)self contentView];
    [v59 addSubview:self->_loadingIndicator];

    v60 = self->_loadingIndicator;
    goto LABEL_23;
  }
LABEL_30:
  [(AXHearingAidDetailCell *)self updateDetails];
}

- (void)layoutSubviews
{
  v92.receiver = self;
  v92.super_class = (Class)AXHearingAidDetailCell;
  [(AXHearingAidDetailCell *)&v92 layoutSubviews];
  [(AXHearingAidDetailCell *)self updateAvailability];
  id v3 = [(AXHearingAidDetailCell *)self contentView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v93.origin.x = v5;
  v93.origin.y = v7;
  v93.size.width = v9;
  v93.size.height = v11;
  double Width = CGRectGetWidth(v93);
  rightLabel = self->_rightLabel;
  if (rightLabel)
  {
    [(UILabel *)rightLabel frame];
    double v15 = v14;
    double v17 = v16;
    if ([UIApp userInterfaceLayoutDirection])
    {
      double v18 = 45.0;
    }
    else
    {
      v94.origin.x = v5;
      v94.origin.y = v7;
      v94.size.width = v9;
      v94.size.height = v11;
      double v18 = CGRectGetWidth(v94) + -45.0 - v15;
    }
    double v20 = 16.0;
    if (!self->_leftLabel)
    {
      CGSize v21 = [(AXHearingAidDetailCell *)self contentView];
      [v21 frame];
      float v23 = v22 * 0.5 - v17 * 0.5;
      double v20 = floorf(v23);
    }
    -[UILabel setFrame:](self->_rightLabel, "setFrame:", v18, v20, v15, v17);
    [(UILabel *)self->_rightLabel setHidden:self->_loadingIndicator != 0];
    if ([UIApp userInterfaceLayoutDirection])
    {
      v24 = [(AXHearingAidDetailCell *)self contentView];
      [v24 bounds];
      v95.size.height = v17;
      double v25 = v11;
      double v26 = v9;
      double v27 = v7;
      double v28 = v5;
      double v30 = v29;
      v95.origin.x = v18;
      v95.origin.y = v20;
      v95.size.width = v15;
      double MinX = v30 - CGRectGetMaxX(v95);
      CGFloat v5 = v28;
      CGFloat v7 = v27;
      CGFloat v9 = v26;
      CGFloat v11 = v25;
    }
    else
    {
      v96.origin.x = v18;
      v96.origin.y = v20;
      v96.size.width = v15;
      v96.size.height = v17;
      double MinX = CGRectGetMinX(v96);
    }
    rightStatusIndicator = self->_rightStatusIndicator;
    if (rightStatusIndicator)
    {
      double v32 = MinX;
      [(UIView *)rightStatusIndicator frame];
      double v34 = v33;
      double v36 = v35;
      id v37 = [UIApp userInterfaceLayoutDirection];
      double v38 = 15.0;
      if (!v37)
      {
        v97.origin.x = v5;
        v97.origin.y = v7;
        v97.size.width = v9;
        v97.size.height = v11;
        double v38 = CGRectGetWidth(v97) + -40.0;
      }
      -[UIView setFrame:](self->_rightStatusIndicator, "setFrame:", v38, v20 + -1.0, v34, v36);
      double MinX = v32;
    }
  }
  else
  {
    double MinX = Width;
  }
  leftLabel = self->_leftLabel;
  if (leftLabel)
  {
    [(UILabel *)leftLabel frame];
    double v41 = v40;
    double v43 = v42;
    if ([UIApp userInterfaceLayoutDirection])
    {
      double v44 = 45.0;
    }
    else
    {
      v98.origin.x = v5;
      v98.origin.y = v7;
      v98.size.width = v9;
      v98.size.height = v11;
      double v44 = CGRectGetWidth(v98) + -45.0 - v41;
    }
    if (self->_rightLabel)
    {
      double v45 = 32.0;
    }
    else
    {
      id v46 = [(AXHearingAidDetailCell *)self contentView];
      [v46 frame];
      float v48 = v47 * 0.5 - v43 * 0.5;
      double v45 = floorf(v48);
    }
    -[UILabel setFrame:](self->_leftLabel, "setFrame:", v44, v45, v41, v43);
    [(UILabel *)self->_leftLabel setHidden:self->_loadingIndicator != 0];
    if ([UIApp userInterfaceLayoutDirection])
    {
      v49 = [(AXHearingAidDetailCell *)self contentView];
      [v49 bounds];
      v99.size.height = v43;
      double v50 = v11;
      double v51 = v9;
      double v52 = v7;
      double v53 = v5;
      double v55 = v54;
      v99.origin.x = v44;
      v99.origin.y = v45;
      v99.size.width = v41;
      double MinX = v55 - CGRectGetMaxX(v99);
      CGFloat v5 = v53;
      CGFloat v7 = v52;
      CGFloat v9 = v51;
      CGFloat v11 = v50;
    }
    else
    {
      v100.origin.x = v44;
      v100.origin.y = v45;
      v100.size.width = v41;
      v100.size.height = v43;
      double MinX = CGRectGetMinX(v100);
    }
    leftStatusIndicator = self->_leftStatusIndicator;
    if (leftStatusIndicator)
    {
      double v57 = MinX;
      [(UIView *)leftStatusIndicator frame];
      double v59 = v58;
      double v61 = v60;
      id v62 = [UIApp userInterfaceLayoutDirection];
      double v63 = 15.0;
      if (!v62)
      {
        v101.origin.x = v5;
        v101.origin.y = v7;
        v101.size.width = v9;
        v101.size.height = v11;
        double v63 = CGRectGetWidth(v101) + -40.0;
      }
      -[UIView setFrame:](self->_leftStatusIndicator, "setFrame:", v63, v45 + -1.0, v59, v61);
      double MinX = v57;
    }
  }
  loadingIndicator = self->_loadingIndicator;
  if (loadingIndicator)
  {
    [(UIActivityIndicatorView *)loadingIndicator frame];
    double v66 = v65;
    double v68 = v67;
    if ([UIApp userInterfaceLayoutDirection])
    {
      double v69 = 40.0;
    }
    else
    {
      v102.origin.x = v5;
      v102.origin.y = v7;
      v102.size.width = v9;
      v102.size.height = v11;
      double v69 = CGRectGetWidth(v102) + -40.0;
    }
    unsigned int v70 = [(AXHearingAidDetailCell *)self contentView];
    [v70 frame];
    float v72 = v71 * 0.5 - v68 * 0.5;
    double v73 = floorf(v72);

    -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:", v69, v73, v66, v68);
  }
  v74 = [(AXHearingAidDetailCell *)self titleLabel];
  [v74 setEnabled:1];
  [v74 frame];
  double v76 = v75;
  double v77 = MinX + -10.0 + -10.0;
  double v78 = 15.0;
  double v79 = 15.0;
  if ([UIApp userInterfaceLayoutDirection])
  {
    v80 = [(AXHearingAidDetailCell *)self contentView];
    [v80 frame];
    double v79 = v81 - v77 + -15.0;
  }
  double v91 = 16.0;
  v82 = [v74 text];
  v83 = [v74 font];
  v103.origin.y = 14.0;
  v103.origin.x = v79;
  v103.size.width = MinX + -10.0 + -10.0;
  v103.size.height = v76;
  objc_msgSend(v82, "_legacy_sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:", v83, &v91, objc_msgSend(v74, "lineBreakMode"), 16.0, CGRectGetWidth(v103));

  double v84 = v91;
  if (v91 > 18.0) {
    double v84 = 18.0;
  }
  v85 = +[UIFont boldSystemFontOfSize:v84];
  [v74 setFont:v85];

  objc_msgSend(v74, "setFrame:", v79, 14.0, MinX + -10.0 + -10.0, v76);
  v86 = [(AXHearingAidDetailCell *)self valueLabel];
  v87 = +[UIColor _labelColor];
  [v86 setTextColor:v87];

  [v86 setEnabled:1];
  v88 = +[UIFont systemFontOfSize:14.0];
  [v86 setFont:v88];

  [v86 setTextAlignment:4];
  [v86 frame];
  if ([UIApp userInterfaceLayoutDirection])
  {
    v89 = [(AXHearingAidDetailCell *)self contentView];
    [v89 frame];
    double v78 = v90 - v77 + -15.0;
  }
  objc_msgSend(v86, "setFrame:", v78, 36.0, MinX + -10.0 + -10.0, v76 * (double)(uint64_t)objc_msgSend(v86, "numberOfLines"));
}

- (id)accessibilityValue
{
  id v3 = [(AXHearingAidDetailCell *)self device];
  unsigned int v4 = [v3 isConnected];

  if (v4)
  {
    CGFloat v5 = [(AXHearingAidDetailCell *)self device];
    unsigned int v6 = [v5 leftAvailable];

    if (v6)
    {
      CGFloat v7 = hearingLocString();
      numberFormatter = self->_numberFormatter;
      [(AXRemoteHearingAidDevice *)self->_device leftBatteryLevel];
      *(float *)&double v9 = v9;
      double v10 = +[NSNumber numberWithFloat:v9];
      CGFloat v11 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v10];
      float v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v11);
    }
    else
    {
      float v12 = 0;
    }
    double v16 = [(AXHearingAidDetailCell *)self device];
    unsigned int v17 = [v16 rightAvailable];

    if (v17)
    {
      double v18 = hearingLocString();
      v19 = self->_numberFormatter;
      [(AXRemoteHearingAidDevice *)self->_device rightBatteryLevel];
      *(float *)&double v20 = v20;
      CGSize v21 = +[NSNumber numberWithFloat:v20];
      double v22 = [(NSNumberFormatter *)v19 stringFromNumber:v21];
      double v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v22);
    }
    else
    {
      double v13 = 0;
    }
    v26.receiver = self;
    v26.super_class = (Class)AXHearingAidDetailCell;
    double v14 = [(AXHearingAidDetailCell *)&v26 accessibilityValue];
    v24 = hearingLocString();
    double v15 = __AXStringForVariables();
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)AXHearingAidDetailCell;
    float v12 = [(AXHearingAidDetailCell *)&v25 accessibilityValue];
    double v13 = hearingLocString();
    double v14 = [(UILabel *)self->_rightLabel accessibilityLabel];
    double v15 = __AXStringForVariables();
  }

  return v15;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitNone;
}

- (AXRemoteHearingAidDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_rightStatusIndicator, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);
  objc_storeStrong((id *)&self->_leftStatusIndicator, 0);
  objc_storeStrong((id *)&self->_leftLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end