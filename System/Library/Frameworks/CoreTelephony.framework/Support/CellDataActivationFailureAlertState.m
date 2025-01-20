@interface CellDataActivationFailureAlertState
+ (id)sharedInstance;
- (BOOL)scheduled;
- (BOOL)trylockMain;
- (CellDataActivationFailureAlertState)init;
- (id).cxx_construct;
- (int)action;
- (void)dealloc;
- (void)handleActionResponse;
- (void)lockScheduled;
- (void)setAction:(int)a3;
- (void)setDataPlanCsn:(CFSharedRef<const __CFData>)a3;
- (void)setDataPlanIccid:(CFSharedRef<const __CFString>)a3;
- (void)setDataPlanUrl:(CFSharedRef<const __CFString>)a3;
- (void)setScheduled:(BOOL)a3;
- (void)unlockMain;
- (void)unlockScheduled;
@end

@implementation CellDataActivationFailureAlertState

- (CellDataActivationFailureAlertState)init
{
  v4.receiver = self;
  v4.super_class = (Class)CellDataActivationFailureAlertState;
  v2 = [(CellDataActivationFailureAlertState *)&v4 init];
  if (v2)
  {
    v2->fLockMain = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->_scheduled = 0;
    v2->fAction = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->fLockMain = 0;
  v3.receiver = self;
  v3.super_class = (Class)CellDataActivationFailureAlertState;
  [(CellDataActivationFailureAlertState *)&v3 dealloc];
}

- (BOOL)trylockMain
{
  if ([(CellDataActivationFailureAlertState *)self scheduled])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(NSLock *)self->fLockMain tryLock];
    if (v3)
    {
      [(CellDataActivationFailureAlertState *)self setAction:0];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)unlockMain
{
}

- (void)lockScheduled
{
}

- (void)unlockScheduled
{
  [(CellDataActivationFailureAlertState *)self setAction:0];

  [(CellDataActivationFailureAlertState *)self setScheduled:0];
}

- (int)action
{
  return self->fAction;
}

- (void)setAction:(int)a3
{
  self->fAction = a3;
  if (!a3)
  {
    fRef = self->fDataPlanCsn.fRef;
    self->fDataPlanCsn.fRef = 0;
    v7 = fRef;
    sub_100030068((const void **)&v7);
    v5 = self->fDataPlanUrl.fRef;
    self->fDataPlanUrl.fRef = 0;
    v7 = v5;
    sub_1000558F4((const void **)&v7);
    v6 = self->fDataPlanIccid.fRef;
    self->fDataPlanIccid.fRef = 0;
    v7 = v6;
    sub_1000558F4((const void **)&v7);
  }
}

- (void)setDataPlanCsn:(CFSharedRef<const __CFData>)a3
{
}

- (void)setDataPlanUrl:(CFSharedRef<const __CFString>)a3
{
}

- (void)setDataPlanIccid:(CFSharedRef<const __CFString>)a3
{
}

- (void)handleActionResponse
{
  int fAction = self->fAction;
  if (fAction == 1)
  {
    CFStringRef v7 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
  }
  else
  {
    if (fAction != 3)
    {
      if (fAction == 2)
      {
        if (qword_101B14190)
        {
          objc_super v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_101B14190);
          if (v4)
          {
            v5 = v4;
            uint64_t v6 = DataPlanManagerBootstrap::sInstance;
            if (DataPlanManagerBootstrap::sInstance)
            {
              sub_100083DA4(&v11, (const void **)&self->fDataPlanIccid.fRef);
              (*(void (**)(uint64_t, const void **))(*(void *)v6 + 112))(v6, &v11);
              sub_1000558F4(&v11);
            }
            sub_10004D2C8(v5);
          }
        }
      }
      return;
    }
    CFStringRef v7 = @"prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR_ACCOUNT_OPTIONS";
  }
  v8 = +[NSURL URLWithString:v7];
  if (v8)
  {
    v9 = v8;
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    [v10 openSensitiveURL:v9 withOptions:0];
  }
}

+ (id)sharedInstance
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_101B101B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_101B101B0))
  {
    qword_101B101A8 = objc_alloc_init(CellDataActivationFailureAlertState);
    __cxa_guard_release(&qword_101B101B0);
  }
  return (id)qword_101B101A8;
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (void).cxx_destruct
{
  sub_1000558F4((const void **)&self->fDataPlanIccid.fRef);
  sub_1000558F4((const void **)&self->fDataPlanUrl.fRef);

  sub_100030068((const void **)&self->fDataPlanCsn.fRef);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end