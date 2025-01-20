@interface SCATSwitchControlWorkspace
+ (id)sharedWorkspace;
- (BOOL)isScannerActive;
- (BOOL)isScannerPaused;
- (CGPoint)headTrackingPoint;
- (SCATElement)currentElement;
- (SCATSwitchControlWorkspace)init;
- (int)scannerType;
- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)accessibilityManager:(id)a3 mediaDidBegin:(__CFData *)a4;
- (void)dealloc;
- (void)scannerManager:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)scannerManager:(id)a3 willUnfocusFromContext:(id)a4;
- (void)scannerManagerDidBecomeActive:(id)a3;
- (void)scannerManagerDidBecomeInactive:(id)a3;
- (void)scannerManagerDidPause:(id)a3;
@end

@implementation SCATSwitchControlWorkspace

+ (id)sharedWorkspace
{
  if (qword_1001F0AF0 != -1) {
    dispatch_once(&qword_1001F0AF0, &stru_1001AD1B8);
  }
  v2 = (void *)qword_1001F0AE8;

  return v2;
}

- (SCATSwitchControlWorkspace)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCATSwitchControlWorkspace;
  v2 = [(SCATSwitchControlWorkspace *)&v7 init];
  if (v2)
  {
    v3 = +[HNDAccessibilityManager sharedManager];
    [v3 addObserver:v2];

    v4 = +[SCATScannerManager sharedManager];
    [v4 addObserver:v2];

    *(_WORD *)&v2->_isScannerActive = 0;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[HNDAccessibilityManager sharedManager];
  [v3 removeObserver:self];

  v4 = +[SCATScannerManager sharedManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SCATSwitchControlWorkspace;
  [(SCATSwitchControlWorkspace *)&v5 dealloc];
}

- (SCATElement)currentElement
{
  return self->_currentFocusedElement;
}

- (int)scannerType
{
  return self->_scannerType;
}

- (CGPoint)headTrackingPoint
{
  v2 = +[SCATScannerManager sharedManager];
  v3 = [v2 pointPicker];
  [v3 lastReceivedPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  if (a4 == 1)
  {
    if (!_AXSAutomationEnabled()) {
      goto LABEL_8;
    }
    double v8 = +[NSDistributedNotificationCenter defaultCenter];
    double v9 = v8;
    CFStringRef v10 = @"SwitchControlDidReceiveScreenChange";
    goto LABEL_7;
  }
  if (a4 == 3 && _AXSAutomationEnabled())
  {
    double v8 = +[NSDistributedNotificationCenter defaultCenter];
    double v9 = v8;
    CFStringRef v10 = @"SwitchControlDidReceiveLayoutChange";
LABEL_7:
    [v8 postNotificationName:@"SwitchControlEventOccurred" object:v10];
  }
LABEL_8:
}

- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4
{
  if (_AXSAutomationEnabled())
  {
    id v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlApplicationDidChange"];
  }
}

- (void)accessibilityManager:(id)a3 mediaDidBegin:(__CFData *)a4
{
  if (_AXSAutomationEnabled())
  {
    id v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlMediaBeginPlaying"];
  }
}

- (void)scannerManager:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v9 = a4;
  if (_AXSAutomationEnabled())
  {
    double v6 = +[NSDistributedNotificationCenter defaultCenter];
    [v6 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlFocusElementDidChange"];
  }
  id v7 = [v9 element];
  currentFocusedElement = self->_currentFocusedElement;
  self->_currentFocusedElement = v7;
}

- (void)scannerManager:(id)a3 willUnfocusFromContext:(id)a4
{
  id v5 = [a3 activeScannerDriver];
  self->_isScannerPaused = [v5 isPaused];
}

- (void)scannerManagerDidPause:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled())
  {
    id v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerDidPause"];
  }
  double v6 = [v4 activeScannerDriver];
  self->_isScannerActive = [v6 isActive];

  id v7 = [v4 activeScannerDriver];

  self->_isScannerPaused = [v7 isPaused];
}

- (void)scannerManagerDidBecomeActive:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled())
  {
    id v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerBecameActive"];
  }
  double v6 = [v4 activeScannerDriver];
  self->_isScannerActive = [v6 isActive];

  id v7 = [v4 activeScannerDriver];
  self->_isScannerPaused = [v7 isPaused];

  id v8 = [v4 activeScannerDriver];

  self->_scannerType = [v8 driverType];
}

- (void)scannerManagerDidBecomeInactive:(id)a3
{
  id v4 = a3;
  if (_AXSAutomationEnabled())
  {
    id v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:@"SwitchControlEventOccurred" object:@"SwitchControlScannerBecameInactive"];
  }
  double v6 = [v4 activeScannerDriver];
  self->_isScannerActive = [v6 isActive];

  id v7 = [v4 activeScannerDriver];

  self->_isScannerPaused = [v7 isPaused];
}

- (BOOL)isScannerActive
{
  return self->_isScannerActive;
}

- (BOOL)isScannerPaused
{
  return self->_isScannerPaused;
}

- (void).cxx_destruct
{
}

@end