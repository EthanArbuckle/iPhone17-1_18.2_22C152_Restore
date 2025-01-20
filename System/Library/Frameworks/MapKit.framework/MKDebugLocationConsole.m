@interface MKDebugLocationConsole
- (BOOL)customTextEnabled;
- (CGRect)_debugViewFrameWithMapView:(id)a3;
- (MKDebugLocationConsole)initWithMapView:(id)a3;
- (id)timeStampFormatter;
- (unint64_t)pageIndex;
- (void)_showNextPage;
- (void)_updateCustomText;
- (void)_updateGPSInfo;
- (void)_updateVehicleInfo;
- (void)setCustomTextEnabled:(BOOL)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)update;
- (void)updateCustomText:(id)a3 textColor:(id)a4;
- (void)updateFrameWithEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation MKDebugLocationConsole

- (MKDebugLocationConsole)initWithMapView:(id)a3
{
  id v5 = a3;
  [(MKDebugLocationConsole *)self _debugViewFrameWithMapView:v5];
  v16.receiver = self;
  v16.super_class = (Class)MKDebugLocationConsole;
  v6 = -[MKDebugLocationConsole initWithFrame:](&v16, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentMapView, a3);
    v8 = [MEMORY[0x1E4F428B8] blackColor];
    [(MKDebugLocationConsole *)v7 setBackgroundColor:v8];

    v9 = [MEMORY[0x1E4F428B8] greenColor];
    [(MKDebugLocationConsole *)v7 setTextColor:v9];

    [(MKDebugLocationConsole *)v7 setAlpha:0.800000012];
    [(MKDebugLocationConsole *)v7 setTextAlignment:1];
    v10 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    [(MKDebugLocationConsole *)v7 setFont:v10];

    [(MKDebugLocationConsole *)v7 setNumberOfLines:2];
    [(MKDebugLocationConsole *)v7 setLineBreakMode:0];
    [(MKDebugLocationConsole *)v7 setUserInteractionEnabled:1];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v7 action:sel__consoleTapped_];
    [v11 setNumberOfTapsRequired:1];
    [v11 setNumberOfTouchesRequired:1];
    [v11 setCancelsTouchesInView:0];
    [v11 setDelaysTouchesBegan:0];
    [(MKDebugLocationConsole *)v7 addGestureRecognizer:v11];
    [(MKDebugLocationConsole *)v7 update];
    uint64_t v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v7 target:sel_update selector:0 userInfo:1 repeats:1.0];
    updateTimer = v7->_updateTimer;
    v7->_updateTimer = (NSTimer *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)updateFrameWithEdgeInsets:(UIEdgeInsets)a3
{
  -[MKDebugLocationConsole _debugViewFrameWithMapView:](self, "_debugViewFrameWithMapView:", self->_parentMapView, a3.top, a3.left, a3.bottom, a3.right);

  -[MKDebugLocationConsole setFrame:](self, "setFrame:");
}

- (void)update
{
  unint64_t pageIndex = self->_pageIndex;
  switch(pageIndex)
  {
    case 2uLL:
      [(MKDebugLocationConsole *)self _updateCustomText];
      break;
    case 1uLL:
      [(MKDebugLocationConsole *)self _updateVehicleInfo];
      break;
    case 0uLL:
      [(MKDebugLocationConsole *)self _updateGPSInfo];
      break;
  }
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_unint64_t pageIndex = a3;
}

- (void)updateCustomText:(id)a3 textColor:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (UIColor *)a4;
  customText = self->_customText;
  self->_customText = v6;
  v9 = v6;

  customTextColor = self->_customTextColor;
  self->_customTextColor = v7;

  [(MKDebugLocationConsole *)self update];
}

- (void)_updateGPSInfo
{
  v3 = [(MKMapView *)self->_parentMapView _locationManager];
  id v20 = [v3 lastLocation];

  if (v20)
  {
    if ([(MKMapView *)self->_parentMapView ignoreLocationUpdates]
      || [(MKMapView *)self->_parentMapView _isHandlingUserEvent])
    {
      uint64_t v4 = [MEMORY[0x1E4F428B8] orangeColor];
    }
    else
    {
      if ([v20 referenceFrame] == 2) {
        [MEMORY[0x1E4F428B8] redColor];
      }
      else {
      uint64_t v4 = [MEMORY[0x1E4F428B8] greenColor];
      }
    }
    id v5 = (void *)v4;
    v6 = NSString;
    v7 = objc_msgSend(MEMORY[0x1E4F1E5F0], "_navigation_stringWithType:", objc_msgSend(v20, "type"));
    v8 = [v20 shortDescription];
    [v20 altitude];
    uint64_t v10 = v9;
    [v20 verticalAccuracy];
    uint64_t v12 = [v6 stringWithFormat:@"%@:%@ Alt:%.0fm ±%.0fm", v7, v8, v10, v11];

    v13 = [v20 floor];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", @" Floor: %d", [v13 level]);

      uint64_t v12 = (__CFString *)v15;
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F428B8] grayColor];
    uint64_t v12 = @"No Location";
  }
  objc_super v16 = [(MKMapView *)self->_parentMapView _debugConsoleAdditionalInfoProvider];

  if (v16)
  {
    v17 = [(MKMapView *)self->_parentMapView _debugConsoleAdditionalInfoProvider];
    v18 = v17[2]();

    if (v18)
    {
      uint64_t v19 = [NSString stringWithFormat:@"%@ %@", v12, v18];

      uint64_t v12 = (__CFString *)v19;
    }
  }
  [(MKDebugLocationConsole *)self setText:v12];
  [(MKDebugLocationConsole *)self setTextColor:v5];
}

- (void)_updateVehicleInfo
{
  id v14 = [(MKMapView *)self->_parentMapView _locationManager];
  [v14 currentVehicleHeading];
  double v4 = v3;
  [v14 currentVehicleSpeed];
  double v6 = v5;
  if (v4 == -1.0)
  {
    v7 = @"No vehicle heading";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Vehicle heading: %0.1f", *(void *)&v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6 == -1.0)
  {
    v8 = @"No vehicle speed";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Vehicle speed: %0.1f", *(void *)&v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = [NSString stringWithFormat:@"%@ | %@", v7, v8];
  if (v4 == -1.0 || v6 == -1.0)
  {
    if (v4 == -1.0 && v6 == -1.0) {
      [MEMORY[0x1E4F428B8] grayColor];
    }
    else {
    uint64_t v12 = [MEMORY[0x1E4F428B8] redColor];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F428B8] greenColor];
  }
  v13 = (void *)v12;
  [(MKDebugLocationConsole *)self setText:v9];
  [(MKDebugLocationConsole *)self setTextColor:v13];
}

- (void)_updateCustomText
{
  if (self->_customTextEnabled)
  {
    [(MKDebugLocationConsole *)self setText:self->_customText];
    customTextColor = self->_customTextColor;
    [(MKDebugLocationConsole *)self setTextColor:customTextColor];
  }
  else
  {
    [(MKDebugLocationConsole *)self setText:@"No custom text set"];
    id v4 = [MEMORY[0x1E4F428B8] grayColor];
    [(MKDebugLocationConsole *)self setTextColor:v4];
  }
}

- (CGRect)_debugViewFrameWithMapView:(id)a3
{
  id v3 = a3;
  if (*(double *)&_debugViewFrameWithMapView__height == 0.0)
  {
    id v4 = +[MKSystemController sharedInstance];
    int v5 = [v4 userInterfaceIdiom];
    double v6 = 18.0;
    if (!v5) {
      double v6 = 30.0;
    }
    _debugViewFrameWithMapView__double height = *(void *)&v6;
  }
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v3, "bounds", 0, 0, 0, 0);
  CGRectDivide(v13, &slice, &v11, *(CGFloat *)&_debugViewFrameWithMapView__height, CGRectMaxYEdge);

  double x = slice.origin.x;
  double y = slice.origin.y;
  double width = slice.size.width;
  double height = slice.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_showNextPage
{
  unint64_t v2 = (self->_pageIndex + 1) % 3;
  self->_unint64_t pageIndex = v2;
  if (v2 == 2 && !self->_customTextEnabled) {
    [(MKDebugLocationConsole *)self _showNextPage];
  }
  else {
    [(MKDebugLocationConsole *)self update];
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  int v5 = [(MKDebugLocationConsole *)self timeStampFormatter];
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = [v5 stringFromDate:v6];

  v8 = [NSString stringWithFormat:@"%@ %@", v7, v4];

  v9.receiver = self;
  v9.super_class = (Class)MKDebugLocationConsole;
  [(MKDebugLocationConsole *)&v9 setText:v8];
}

- (id)timeStampFormatter
{
  timeStampFormatter = self->_timeStampFormatter;
  if (!timeStampFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    int v5 = self->_timeStampFormatter;
    self->_timeStampFormatter = v4;

    [(NSDateFormatter *)self->_timeStampFormatter setDateFormat:@"HH:mm:ss"];
    timeStampFormatter = self->_timeStampFormatter;
  }

  return timeStampFormatter;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (BOOL)customTextEnabled
{
  return self->_customTextEnabled;
}

- (void)setCustomTextEnabled:(BOOL)a3
{
  self->_customTextEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStampFormatter, 0);
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_customText, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_parentMapView, 0);
}

@end