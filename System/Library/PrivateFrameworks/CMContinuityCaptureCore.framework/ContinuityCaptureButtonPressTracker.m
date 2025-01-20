@interface ContinuityCaptureButtonPressTracker
- (BOOL)valid;
- (ContinuityCaptureButtonPressTracker)init;
- (id)description;
- (void)clear;
- (void)registerCordPress:(int64_t)a3 down:(BOOL)a4;
@end

@implementation ContinuityCaptureButtonPressTracker

- (ContinuityCaptureButtonPressTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureButtonPressTracker;
  v2 = [(ContinuityCaptureButtonPressTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    buttonPressStateByUsage = v2->_buttonPressStateByUsage;
    v2->_buttonPressStateByUsage = v3;

    v2->_buttonLongPressTimeout = 500000000;
  }
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[%p] _buttonPressStateByUsage:%@", self, self->_buttonPressStateByUsage];
}

- (BOOL)valid
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
  unint64_t creationTime = self->_creationTime;
  unint64_t v5 = HostTimeInNanoSec - creationTime;
  if (HostTimeInNanoSec < creationTime) {
    return 0;
  }
  objc_super v6 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = self->_creationTime;
    unint64_t buttonLongPressTimeout = self->_buttonLongPressTimeout;
    int v10 = 138544130;
    v11 = self;
    __int16 v12 = 2048;
    unint64_t v13 = v7;
    __int16 v14 = 2048;
    unint64_t v15 = v5;
    __int16 v16 = 2048;
    unint64_t v17 = buttonLongPressTimeout;
    _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ _creationTime:%llu pressDelta:%llu _buttonLongPressTimeout:%llu", (uint8_t *)&v10, 0x2Au);
  }

  return ![(NSMutableSet *)self->_buttonPressStateByUsage count] && v5 < self->_buttonLongPressTimeout;
}

- (void)registerCordPress:(int64_t)a3 down:(BOOL)a4
{
  if (a3 == 48 && a4)
  {
    self->_unint64_t creationTime = CMContinuityCaptureGetHostTimeInNanoSec();
    return;
  }
  if (a3 == 48 || !a4)
  {
    if (a3 == 48 || a4 || self->_creationTime) {
      return;
    }
    buttonPressStateByUsage = self->_buttonPressStateByUsage;
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)buttonPressStateByUsage removeObject:v6];
  }
  else
  {
    v4 = self->_buttonPressStateByUsage;
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)v4 addObject:v6];
  }
}

- (void)clear
{
  self->_unint64_t creationTime = 0;
}

- (void).cxx_destruct
{
}

@end