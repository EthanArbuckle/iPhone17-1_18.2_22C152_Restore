@interface PLBatteryUIDisplayTableCell
+ (id)reuseIdentifierForClassAndType:(int64_t)a3;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (PLBatteryUIDisplayTableCellDelegate)delegate;
- (id)urlEncodedString:(id)a3;
- (void)layoutSubviews;
- (void)refresh:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)ttrPressed;
@end

@implementation PLBatteryUIDisplayTableCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return @"PLBatteryUIDisplayTableCell";
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PLBatteryUIDisplayTableCell;
  [(PLBatteryUIDisplayTableCell *)&v64 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 objectForKeyedSubscript:@"cellSubtitleText"];
  v6 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  unsigned int v7 = [v6 intValue];

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
    unsigned int v9 = [v8 intValue];

    if (v9 != 1) {
      goto LABEL_8;
    }
    v10 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppForegroundBackgroundRuntimeValueKey"];
  }
  else
  {
    v10 = [v4 objectForKeyedSubscript:@"cellSubtitleText"];

    v11 = [v4 objectForKeyedSubscript:@"PLBatteryUITypeKey"];
    unsigned int v12 = [v11 intValue];

    if (v12 == 2)
    {
      v13 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
      unsigned int v14 = [v13 intValue];

      if (v14 == 5)
      {

        v5 = @"Not accounted toward apps";
LABEL_9:
        v68[0] = &off_C9428;
        v67[0] = NSBaselineOffsetAttributeName;
        v67[1] = NSFontAttributeName;
        v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        v68[1] = v15;
        v67[2] = NSForegroundColorAttributeName;
        v16 = +[UIColor systemGrayColor];
        v68[2] = v16;
        v17 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];

        id v18 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:v17];
        v19 = [(PLBatteryUIDisplayTableCell *)self detailTextLabel];
        [v19 setAttributedText:v18];

        goto LABEL_11;
      }
    }
  }
  v5 = v10;
LABEL_8:
  if (v5) {
    goto LABEL_9;
  }
  v5 = [(PLBatteryUIDisplayTableCell *)self detailTextLabel];
  [(__CFString *)v5 setAttributedText:0];
LABEL_11:

  v20 = [(PLBatteryUIDisplayTableCell *)self detailTextLabel];
  [v20 setLineBreakMode:0];

  v21 = [(PLBatteryUIDisplayTableCell *)self detailTextLabel];
  [v21 setNumberOfLines:0];

  v22 = [v4 name];

  if (v22)
  {
    id v23 = objc_alloc((Class)NSAttributedString);
    v24 = [v4 name];
    v65[0] = NSBaselineOffsetAttributeName;
    v65[1] = NSFontAttributeName;
    v66[0] = &off_C9428;
    UIFontTextStyle v25 = UIFontTextStyleBody;
    v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v66[1] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
    id v28 = [v23 initWithString:v24 attributes:v27];
    v29 = [(PLBatteryUIDisplayTableCell *)self textLabel];
    [v29 setAttributedText:v28];
  }
  else
  {
    v30 = [(PLBatteryUIDisplayTableCell *)self textLabel];
    [v30 setAttributedText:0];

    UIFontTextStyle v25 = UIFontTextStyleBody;
  }
  v31 = [(PLBatteryUIDisplayTableCell *)self textLabel];
  [v31 setLineBreakMode:0];

  v32 = [(PLBatteryUIDisplayTableCell *)self textLabel];
  [v32 setNumberOfLines:0];

  v33 = objc_opt_new();
  v34 = +[UIFont preferredFontForTextStyle:v25];
  [v33 setFont:v34];

  [v33 setTextAlignment:2];
  v35 = +[UIColor systemGrayColor];
  [v33 setTextColor:v35];

  v36 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  unsigned int v37 = [v36 intValue];

  if (!v37)
  {
    id v46 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppEnergyDisplayPercentKey"];
    v47 = +[NSString stringWithFormat:@"%@%@", @" ", v46];
    [v33 setText:v47];
    goto LABEL_20;
  }
  v38 = [v4 objectForKeyedSubscript:@"PLIconDisplayTypeKey"];
  unsigned int v39 = [v38 intValue];

  if (v39 == 1)
  {
    v40 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
    [v40 doubleValue];
    double v42 = v41;

    v43 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
    [v43 doubleValue];
    double v45 = v44;

    if (v42 >= 60.0 || v45 >= 60.0)
    {
      id v46 = objc_alloc_init((Class)NSDateComponentsFormatter);
      objc_msgSend(v46, "setUnitsStyle:", +[PLBatteryUIUtilities localizedDateComponentsUnitsStyle](PLBatteryUIUtilities, "localizedDateComponentsUnitsStyle"));
      [v46 setIncludesApproximationPhrase:0];
      [v46 setIncludesTimeRemainingPhrase:0];
      [v46 setAllowedUnits:96];
      v47 = [v46 stringFromTimeInterval:(double)(int)(floor(v42 / 60.0) * 60.0 + floor(v45 / 60.0) * 60.0)];
      v48 = +[NSString stringWithFormat:@"%@%@", @" ", v47];
      [v33 setText:v48];

LABEL_20:
    }
  }
  [v33 sizeToFit];
  v49 = [v4 name];
  v50 = [v4 objectForKeyedSubscript:@"cellSubtitleText"];
  v51 = +[NSString stringWithFormat:@"%@, %@", v49, v50];
  [(PLBatteryUIDisplayTableCell *)self setAccessibilityLabel:v51];

  [(PLBatteryUIDisplayTableCell *)self setAccessoryView:v33];
  self->_interactiveButton = 0;
  self->_ttrButton = 0;
  v52 = [v4 propertyForKey:@"PSSubtitleTileValueTableCellDelegateWrapperKey"];

  if (v52)
  {
    self->_interactiveButton = 1;
    v53 = [v4 propertyForKey:@"PSSubtitleTileValueTableCellDelegateWrapperKey"];
    v54 = [v53 buiViewController];
    [(PLBatteryUIDisplayTableCell *)self setDelegate:v54];
  }
  v55 = [v4 propertyForKey:@"PSSubtitleTileValueTableCellTTRKey"];

  if (v55)
  {
    self->_interactiveButton = 1;
    self->_ttrButton = 1;
    v56 = [v4 propertyForKey:@"PLBatteryUIDisplayTableCellTTRDomain"];
    IssueDomain = self->_IssueDomain;
    self->_IssueDomain = v56;

    v58 = [v4 propertyForKey:@"PLBatteryUIDisplayTableCellTTRProcess"];
    IssueProcess = self->_IssueProcess;
    self->_IssueProcess = v58;

    v60 = [v4 propertyForKey:@"PLBatteryUIDisplayTableCellTTRType"];
    IssueType = self->_IssueType;
    self->_IssueType = v60;

    v62 = [v4 propertyForKey:@"PLBatteryUIDisplayTableCellTTRAttachments"];
    IssueAttachments = self->_IssueAttachments;
    self->_IssueAttachments = v62;
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PLBatteryUIDisplayTableCell;
  [(PLBatteryUIDisplayTableCell *)&v19 layoutSubviews];
  v3 = [(PLBatteryUIDisplayTableCell *)self imageView];
  [v3 setContentMode:0];

  id v4 = [(PLBatteryUIDisplayTableCell *)self imageView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  unsigned int v9 = [(PLBatteryUIDisplayTableCell *)self imageView];
  objc_msgSend(v9, "setFrame:", v6, v8, 29.0, 29.0);

  if (self->_interactiveButton)
  {
    BOOL ttrButton = self->_ttrButton;
    id v11 = objc_alloc((Class)UIView);
    [(PLBatteryUIDisplayTableCell *)self frame];
    double v13 = v12;
    [(PLBatteryUIDisplayTableCell *)self frame];
    id v14 = objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, v13);
    v15 = +[UIColor clearColor];
    [v14 setBackgroundColor:v15];

    [v14 setUserInteractionEnabled:1];
    id v16 = objc_alloc((Class)UITapGestureRecognizer);
    v17 = &selRef_refresh_;
    if (ttrButton) {
      v17 = &selRef_ttrPressed;
    }
    id v18 = [v16 initWithTarget:self action:*v17];
    [v18 setNumberOfTapsRequired:1];
    [v14 addGestureRecognizer:v18];
    [(PLBatteryUIDisplayTableCell *)self addSubview:v14];
  }
}

- (void)refresh:(id)a3
{
  id v4 = [(PLBatteryUIDisplayTableCell *)self delegate];

  if (v4)
  {
    double v5 = [(PLBatteryUIDisplayTableCell *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PLBatteryUIDisplayTableCell *)self delegate];
      [v7 didPushButton:self];
    }
  }
}

- (id)urlEncodedString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v5 objectForKey:v10];
        double v12 = sub_491C(v10);
        double v13 = sub_491C(v11);
        id v14 = +[NSString stringWithFormat:@"%@=%@", v12, v13, (void)v17];

        [v4 addObject:v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 componentsJoinedByString:@"&"];

  return v15;
}

- (void)ttrPressed
{
  unsigned int v3 = [(NSString *)self->_IssueDomain isEqualToString:@"NET"];
  id v4 = +[NSString stringWithFormat:@"[%@ Issue Detected] %@: %@", self->_IssueDomain, self->_IssueProcess, self->_IssueType];
  if ([(NSString *)self->_IssueAttachments length] < 4) {
    +[NSString stringWithFormat:@"%@\n", v4, v15];
  }
  else {
  uint64_t v5 = +[NSString stringWithFormat:@"%@\nLogs attached from %@", v4, self->_IssueAttachments];
  }
  id v6 = (void *)v5;
  v16[0] = @"ComponentName";
  v16[1] = @"ComponentVersion";
  CFStringRef v7 = @"Purple Battery UI";
  if (v3) {
    CFStringRef v7 = @"SymptomFramework";
  }
  v17[0] = v7;
  v17[1] = @"1.0";
  v16[2] = @"ComponentID";
  v16[3] = @"Reproducibility";
  CFStringRef v8 = @"606186";
  if (!v3) {
    CFStringRef v8 = @"485067";
  }
  v17[2] = v8;
  v17[3] = @"I Didn't Try";
  v16[4] = @"Classification";
  v16[5] = @"Keywords";
  v17[4] = @"Serious Bug";
  v17[5] = @"RadarFromBatteryUsageUI";
  v16[6] = @"Title";
  v16[7] = @"Description";
  v17[6] = v4;
  v17[7] = v5;
  v16[8] = @"Attachments";
  IssueAttachments = self->_IssueAttachments;
  unsigned int v9 = IssueAttachments;
  v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];
  id v11 = [(PLBatteryUIDisplayTableCell *)self urlEncodedString:v10];

  double v12 = [@"tap-to-radar://new?" stringByAppendingString:v11];

  double v13 = +[NSURL URLWithString:v12];
  id v14 = +[LSApplicationWorkspace defaultWorkspace];
  [v14 openURL:v13];
}

- (PLBatteryUIDisplayTableCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLBatteryUIDisplayTableCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_IssueAttachments, 0);
  objc_storeStrong((id *)&self->_IssueProcess, 0);
  objc_storeStrong((id *)&self->_IssueType, 0);
  objc_storeStrong((id *)&self->_IssueDomain, 0);

  objc_storeStrong((id *)&self->_prevLabel, 0);
}

@end