@interface HearingAidConnectionTableCell
- (AXRemoteHearingAidDevice)device;
- (BOOL)accessibilityRespondsToUserInteraction;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HearingAidConnectionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UILabel)availabilityLabel;
- (id)accessibilityHint;
- (id)detailString;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAvailabilityLabel:(id)a3;
- (void)setDevice:(id)a3;
- (void)updateAvailability;
- (void)updateTextColor;
@end

@implementation HearingAidConnectionTableCell

- (HearingAidConnectionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v31.receiver = self;
  v31.super_class = (Class)HearingAidConnectionTableCell;
  v8 = [(HearingAidConnectionTableCell *)&v31 initWithStyle:3 reuseIdentifier:a4 specifier:v7];
  if (v8)
  {
    v9 = [v7 userInfo];
    [(HearingAidConnectionTableCell *)v8 setDevice:v9];

    HAInitializeLogging();
    v10 = [(HearingAidConnectionTableCell *)v8 device];
    unsigned int v11 = [v10 isPaired];
    v12 = [(HearingAidConnectionTableCell *)v8 device];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ConnectionTableCell init: paired %d, connected %d", v11, [v12 isConnected]);

    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidConnectionTableCell initWithStyle:reuseIdentifier:specifier:]", 31, v13);
    v15 = (void *)HAEngineeringLog;
    if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      v17 = v15;
      id v18 = [v16 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v33 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v19 = objc_alloc_init((Class)UILabel);
    v20 = [(HearingAidConnectionTableCell *)v8 contentView];
    [v20 addSubview:v19];

    [(HearingAidConnectionTableCell *)v8 setAvailabilityLabel:v19];
    v21 = [(HearingAidConnectionTableCell *)v8 valueLabel];
    v22 = [(HearingAidConnectionTableCell *)v8 detailString];
    [v21 setText:v22];

    v23 = [(HearingAidConnectionTableCell *)v8 titleLabel];
    [v23 setNumberOfLines:0];

    v24 = [(HearingAidConnectionTableCell *)v8 valueLabel];
    [v24 setNumberOfLines:0];

    v25 = [(HearingAidConnectionTableCell *)v8 availabilityLabel];
    [v25 setNumberOfLines:0];

    v26 = [(HearingAidConnectionTableCell *)v8 valueLabel];
    v27 = [v26 font];
    v28 = [(HearingAidConnectionTableCell *)v8 availabilityLabel];
    [v28 setFont:v27];

    [(HearingAidConnectionTableCell *)v8 updateAvailability];
    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v8 selector:"updateAvailability" name:HUNearbyDevicesDidChangeNotification object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v4 removeFromSuperview];

  v5.receiver = self;
  v5.super_class = (Class)HearingAidConnectionTableCell;
  [(HearingAidConnectionTableCell *)&v5 dealloc];
}

- (id)detailString
{
  v3 = [(AXRemoteHearingAidDevice *)self->_device manufacturer];
  id v4 = [v3 copy];

  objc_super v5 = [(AXRemoteHearingAidDevice *)self->_device model];
  id v6 = [v5 copy];

  id v7 = hearingLocString();
  v8 = [v4 firstObject];
  v9 = [v6 firstObject];
  v10 = hearingLocString();
  objc_super v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8, v9, v10);

  unsigned int v11 = hearingLocString();
  v12 = v4;
  v13 = [v4 lastObject];
  v14 = [v6 lastObject];
  v15 = hearingLocString();
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v14, v15);

  if (![(AXRemoteHearingAidDevice *)self->_device leftAvailable]
    || ![(AXRemoteHearingAidDevice *)self->_device rightAvailable])
  {
    if (![(AXRemoteHearingAidDevice *)self->_device leftAvailable])
    {
      id v27 = v16;
      v22 = v31;
      goto LABEL_12;
    }
    v22 = v31;
    id v28 = v31;
LABEL_11:
    id v27 = v28;
    goto LABEL_12;
  }
  v17 = [v12 firstObject];
  id v18 = [v12 lastObject];
  if (([v17 isEqualToString:v18] & 1) == 0)
  {

    v22 = v31;
    goto LABEL_10;
  }
  id v19 = [v6 firstObject];
  v20 = [v6 lastObject];
  unsigned int v21 = [v19 isEqualToString:v20];

  v22 = v31;
  if (!v21)
  {
LABEL_10:
    id v28 = +[NSString stringWithFormat:@"%@\n%@", v22, v16];
    goto LABEL_11;
  }
  v23 = hearingLocString();
  v24 = [v12 firstObject];
  v25 = [v6 firstObject];
  v26 = hearingLocString();
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24, v25, v26);
  id v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  id v29 = v27;

  return v29;
}

- (void)updateTextColor
{
  id v9 = +[UIColor labelColor];
  if ([(AXRemoteHearingAidDevice *)self->_device isPaired])
  {
    v3 = +[UIColor tableCellBlueTextColor];

    id v4 = +[AXHAServer sharedInstance];
    unsigned __int8 v5 = [v4 hearingAidReachable];

    if (v5)
    {
      id v9 = v3;
    }
    else
    {
      id v9 = +[UIColor tableCellGrayTextColor];
    }
  }
  id v6 = [(HearingAidConnectionTableCell *)self titleLabel];
  [v6 setTextColor:v9];

  id v7 = [(HearingAidConnectionTableCell *)self valueLabel];
  [v7 setTextColor:v9];

  v8 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v8 setTextColor:v9];
}

- (void)updateAvailability
{
}

- (void)layoutSubviews
{
  v86.receiver = self;
  v86.super_class = (Class)HearingAidConnectionTableCell;
  [(HearingAidConnectionTableCell *)&v86 layoutSubviews];
  [(HearingAidConnectionTableCell *)self setAccessoryType:1];
  [(HearingAidConnectionTableCell *)self updateTextColor];
  v3 = [(HearingAidConnectionTableCell *)self titleLabel];
  [v3 setNumberOfLines:0];

  id v4 = [(HearingAidConnectionTableCell *)self valueLabel];
  [v4 setNumberOfLines:0];

  unsigned __int8 v5 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v5 setNumberOfLines:0];

  id v6 = [(HearingAidConnectionTableCell *)self valueLabel];
  id v7 = [v6 font];
  v8 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v8 setFont:v7];

  id v9 = [(HearingAidConnectionTableCell *)self titleLabel];
  v10 = [(AXRemoteHearingAidDevice *)self->_device name];
  [v9 setText:v10];

  uint64_t v11 = [v9 text];
  if (!v11) {
    goto LABEL_3;
  }
  v12 = (void *)v11;
  v13 = [v9 text];
  v14 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v15 = [v13 stringByTrimmingCharactersInSet:v14];
  unsigned int v16 = [v15 isEqualToString:&stru_3D6D8];

  if (v16)
  {
LABEL_3:
    v17 = hearingSettingsLocString(@"HearingAidFallbackName", @"HearingAidSettings");
    [v9 setText:v17];
  }
  id v18 = [(HearingAidConnectionTableCell *)self traitCollection];
  id v19 = [v18 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  unsigned int v21 = [(HearingAidConnectionTableCell *)self contentView];
  [v21 bounds];
  double v23 = v22;
  double v80 = v24;

  [(HearingAidConnectionTableCell *)self layoutMargins];
  double v26 = v25 * 0.5;
  [(HearingAidConnectionTableCell *)self layoutMargins];
  double v28 = v23 - v27 - v26;
  if (IsAccessibilityCategory) {
    double v29 = v23 - v27 - v26;
  }
  else {
    double v29 = v28 / 3.0;
  }
  v30 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  objc_msgSend(v30, "sizeThatFits:", v29, 1.79769313e308);
  double v32 = v31;
  double v84 = v33;

  v34 = [(HearingAidConnectionTableCell *)self traitCollection];
  v35 = [v34 preferredContentSizeCategory];
  BOOL v36 = UIContentSizeCategoryIsAccessibilityCategory(v35);

  double v37 = 0.0;
  if (!v36) {
    double v37 = v32;
  }
  double v38 = v28 - v37;
  v39 = [(HearingAidConnectionTableCell *)self titleLabel];
  objc_msgSend(v39, "sizeThatFits:", v38, 1.79769313e308);
  double v41 = v40;
  double v85 = v42;

  v43 = [(HearingAidConnectionTableCell *)self valueLabel];
  objc_msgSend(v43, "sizeThatFits:", v38, 1.79769313e308);
  double v45 = v44;
  double v82 = v46;

  if (v41 >= v45) {
    double v47 = v41;
  }
  else {
    double v47 = v45;
  }
  if (v47 < v38 && !IsAccessibilityCategory)
  {
    double v48 = v28 - v47;
    if (v48 >= v28 / 2.5) {
      double v49 = v28 / 2.5;
    }
    else {
      double v49 = v48;
    }
    v50 = [(HearingAidConnectionTableCell *)self availabilityLabel];
    objc_msgSend(v50, "sizeThatFits:", v49, 1.79769313e308);
    double v32 = v51;
    double v84 = v52;
  }
  v53 = [(HearingAidConnectionTableCell *)self titleLabel];
  [v53 frame];
  double v55 = v54;

  v56 = [(HearingAidConnectionTableCell *)self valueLabel];
  [v56 frame];
  double v58 = v57;

  v59 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v59 frame];

  double v83 = v32;
  if (IsAccessibilityCategory) {
    double v60 = v55;
  }
  else {
    double v60 = v23 - v32 - v26;
  }
  double v81 = v45;
  if ([(HearingAidConnectionTableCell *)self _shouldReverseLayoutDirection])
  {
    [(HearingAidConnectionTableCell *)self layoutMargins];
    double v55 = v23 - v61 - v41;
    [(HearingAidConnectionTableCell *)self layoutMargins];
    double v78 = v23 - v62 - v45;
    if (IsAccessibilityCategory)
    {
      [(HearingAidConnectionTableCell *)self layoutMargins];
      double v60 = v23 - v63 - v83;
    }
    else
    {
      double v60 = v26;
    }
  }
  else
  {
    double v78 = v58;
  }
  double v64 = v85 + 5.0 + v82;
  double v65 = 5.0;
  double v66 = v60;
  if (IsAccessibilityCategory)
  {
    float v67 = (v80 - (v64 + v84 + 5.0)) * 0.5;
    double v68 = floorf(v67);
    double v69 = v85;
    double v70 = v85 + v68 + 5.0;
    double v71 = v82 + v70 + 5.0;
  }
  else
  {
    float v72 = (v80 - v64) * 0.5;
    double v68 = floorf(v72);
    double v69 = v85;
    double v70 = v85 + v68 + 5.0;
    double v65 = (v80 - v84) * 0.5;
    *(float *)&double v65 = v65;
    *(float *)&double v65 = floorf(*(float *)&v65);
    double v71 = *(float *)&v65;
  }
  v73 = [(HearingAidConnectionTableCell *)self titleLabel];
  objc_msgSend(v73, "setFrame:", v55, v68, v41, v69);

  v74 = [(HearingAidConnectionTableCell *)self valueLabel];
  objc_msgSend(v74, "setFrame:", v79, v70, v81, v82);

  v75 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  objc_msgSend(v75, "setFrame:", v66, v71, v83, v84);

  if ([(HearingAidConnectionTableCell *)self _shouldReverseLayoutDirection])uint64_t v76 = 0; {
  else
  }
    uint64_t v76 = 2;
  if (IsAccessibilityCategory)
  {
    if ([(HearingAidConnectionTableCell *)self _shouldReverseLayoutDirection])uint64_t v76 = 2; {
    else
    }
      uint64_t v76 = 0;
  }
  v77 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v77 setTextAlignment:v76];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v54.receiver = self;
  v54.super_class = (Class)HearingAidConnectionTableCell;
  -[HearingAidConnectionTableCell sizeThatFits:](&v54, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(HearingAidConnectionTableCell *)self contentView];
  double v53 = v5;
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  double v10 = v9;

  [(HearingAidConnectionTableCell *)self layoutMargins];
  double v12 = v11 * -0.5;
  v13 = [(HearingAidConnectionTableCell *)self traitCollection];
  v14 = [v13 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

  [(HearingAidConnectionTableCell *)self layoutMargins];
  double v17 = v10 - v16 + v12;
  if (IsAccessibilityCategory) {
    double v18 = v17;
  }
  else {
    double v18 = v17 / 3.0;
  }
  id v19 = [(HearingAidConnectionTableCell *)self valueLabel];
  v20 = [v19 font];
  unsigned int v21 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  [v21 setFont:v20];

  [(HearingAidConnectionTableCell *)self setAccessoryType:1];
  double v22 = [(HearingAidConnectionTableCell *)self availabilityLabel];
  objc_msgSend(v22, "sizeThatFits:", v18, 1.79769313e308);
  double v25 = v24;
  if (IsAccessibilityCategory) {
    double v26 = 0.0;
  }
  else {
    double v26 = v23;
  }

  double v27 = v17 - v26;
  double v28 = [(HearingAidConnectionTableCell *)self titleLabel];
  objc_msgSend(v28, "sizeThatFits:", v27, 1.79769313e308);
  double v30 = v29;
  double v32 = v31;

  double v33 = [(HearingAidConnectionTableCell *)self valueLabel];
  objc_msgSend(v33, "sizeThatFits:", v27, 1.79769313e308);
  double v35 = v34;
  double v37 = v36;

  double v38 = v32 + 5.0 + v37;
  if (v30 >= v35) {
    double v39 = v30;
  }
  else {
    double v39 = v35;
  }
  if (v39 < v27 && !IsAccessibilityCategory)
  {
    double v40 = v17 - v39;
    if (v40 >= v17 / 2.5) {
      double v41 = v17 / 2.5;
    }
    else {
      double v41 = v40;
    }
    double v42 = [(HearingAidConnectionTableCell *)self availabilityLabel];
    objc_msgSend(v42, "sizeThatFits:", v41, 1.79769313e308);
    double v25 = v43;
  }
  if (v38 >= v25) {
    double v44 = v38;
  }
  else {
    double v44 = v25;
  }
  [(HearingAidConnectionTableCell *)self layoutMargins];
  double v46 = v45;
  [(HearingAidConnectionTableCell *)self layoutMargins];
  if (IsAccessibilityCategory)
  {
    [(HearingAidConnectionTableCell *)self layoutMargins];
    double v49 = v38 + 5.0 + v25 + v48;
    [(HearingAidConnectionTableCell *)self layoutMargins];
    double v51 = v49 + v50;
  }
  else
  {
    double v51 = v47 + v46 + v44;
  }
  double v52 = v53;
  if (v7 >= v51) {
    double v51 = v7;
  }
  result.height = v51;
  result.width = v52;
  return result;
}

- (id)accessibilityHint
{
  v2 = [(HearingAidConnectionTableCell *)self device];
  if ([v2 isConnected]) {
    v3 = @"ConnectionCellHintConnected";
  }
  else {
    v3 = @"ConnectionCellHint";
  }
  double v4 = hearingSettingsLocString(v3, @"HearingAidSettings");

  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (AXRemoteHearingAidDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UILabel)availabilityLabel
{
  return self->_availabilityLabel;
}

- (void)setAvailabilityLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end