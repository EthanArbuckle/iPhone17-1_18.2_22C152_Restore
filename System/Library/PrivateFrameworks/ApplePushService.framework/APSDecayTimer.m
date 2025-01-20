@interface APSDecayTimer
- (APSDecayTimer)initWithHourlyCostThreshold:(unint64_t)a3 costMaximum:(unint64_t)a4 identifier:(id)a5;
- (unint64_t)currentCost;
- (void)_clearDecayTimer;
- (void)_decayCost;
- (void)_decayTimerFired;
- (void)_handleSignificantTimeChange;
- (void)addCost:(unint64_t)a3;
- (void)dealloc;
- (void)forceTimerFire;
- (void)setDelegate:(id)a3;
@end

@implementation APSDecayTimer

- (APSDecayTimer)initWithHourlyCostThreshold:(unint64_t)a3 costMaximum:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)APSDecayTimer;
  v9 = [(APSDecayTimer *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_maxCost = a4;
    v9->_hourlyCostThreshold = a3;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_1000A8EFC, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = (NSDate *)objc_alloc_init((Class)NSDate);
    lastCostDecayAdjustment = v10->_lastCostDecayAdjustment;
    v10->_lastCostDecayAdjustment = v12;

    v14 = (NSString *)[v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = v14;
  }
  return v10;
}

- (void)dealloc
{
  [(APSDecayTimer *)self _clearDecayTimer];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)APSDecayTimer;
  [(APSDecayTimer *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (void)addCost:(unint64_t)a3
{
  [(APSDecayTimer *)self _decayCost];
  unint64_t maxCost = self->_currentCost + a3;
  if (maxCost >= self->_maxCost) {
    unint64_t maxCost = self->_maxCost;
  }
  self->_currentCost = maxCost;
}

- (void)forceTimerFire
{
}

- (void)_handleSignificantTimeChange
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    v9 = identifier;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@:%@ Resetting cost due to significant time change note", (uint8_t *)&v6, 0x16u);
  }
  objc_super v4 = (NSDate *)objc_alloc_init((Class)NSDate);
  lastCostDecayAdjustment = self->_lastCostDecayAdjustment;
  self->_lastCostDecayAdjustment = v4;

  self->_currentCost = 0;
}

- (void)_decayCost
{
  [(NSDate *)self->_lastCostDecayAdjustment timeIntervalSinceNow];
  double v4 = v3;
  if (v3 >= 2.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138412802;
      v21 = self;
      __int16 v22 = 2112;
      v23 = identifier;
      __int16 v24 = 2048;
      double v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@:%@ decay time %f is too far from the current date, throwing it out", buf, 0x20u);
    }
    self->_unint64_t currentCost = 0;
    goto LABEL_11;
  }
  double v5 = -v3;
  if (v4 > -0.0) {
    double v5 = 0.0;
  }
  double v6 = v5 * (double)self->_hourlyCostThreshold / 3600.0;
  unint64_t currentCost = self->_currentCost;
  BOOL v8 = currentCost >= (unint64_t)v6;
  unint64_t v9 = currentCost - (unint64_t)v6;
  if (!v8) {
    unint64_t v9 = 0;
  }
  self->_unint64_t currentCost = v9;
  if ((unint64_t)v6)
  {
LABEL_11:
    v11 = (NSDate *)objc_alloc_init((Class)NSDate);
    lastCostDecayAdjustment = self->_lastCostDecayAdjustment;
    self->_lastCostDecayAdjustment = v11;
  }
  if (!self->_decayTimer)
  {
    id v13 = objc_alloc((Class)PCSimpleTimer);
    v14 = +[NSString stringWithFormat:@"APSDecayTimer-%@:%@", self, self->_identifier];
    v15 = (PCSimpleTimer *)[v13 initWithTimeInterval:v14 serviceIdentifier:self target:"_decayTimerFired" selector:0 userInfo:420.0];
    decayTimer = self->_decayTimer;
    self->_decayTimer = v15;

    [(PCSimpleTimer *)self->_decayTimer setDisableSystemWaking:1];
    objc_super v17 = self->_decayTimer;
    v18 = +[NSRunLoop mainRunLoop];
    [(PCSimpleTimer *)v17 scheduleInRunLoop:v18];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_decayTimer;
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ scheduled decay timer %@", buf, 0x16u);
    }
  }
}

- (void)_decayTimerFired
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v4 = 138412546;
    double v5 = self;
    __int16 v6 = 2112;
    v7 = identifier;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@:%@ decay timer fired", (uint8_t *)&v4, 0x16u);
  }
  [(APSDecayTimer *)self _clearDecayTimer];
  [(APSDecayTimer *)self _decayCost];
  [(APSDecayTimerDelegate *)self->_delegate decayTimerFired:self];
}

- (void)_clearDecayTimer
{
  [(PCSimpleTimer *)self->_decayTimer invalidate];
  decayTimer = self->_decayTimer;
  self->_decayTimer = 0;
}

- (unint64_t)currentCost
{
  return self->_currentCost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_decayTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_lastCostDecayAdjustment, 0);
}

@end