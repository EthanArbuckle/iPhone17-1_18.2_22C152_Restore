@interface ENXPCTimer
- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9;
- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9;
- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8;
- (ENXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7;
- (NSDate)date;
- (NSString)name;
- (OS_xpc_object)activity;
- (double)gracePeriod;
- (id)activityHandler;
- (id)block;
- (id)criteria;
- (id)description;
- (int64_t)priority;
- (unint64_t)cadence;
- (unint64_t)options;
- (void)handleActivity;
- (void)invalidate;
- (void)setActivity:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCadence:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setGracePeriod:(double)a3;
- (void)setName:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation ENXPCTimer

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  [v15 timeIntervalSinceNow];
  v18 = [(ENXPCTimer *)self initWithName:v16 date:v15 gracePeriod:(unint64_t)v17 cadence:a6 priority:a7 options:v14 block:a5];

  return v18;
}

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ENXPCTimer;
  v19 = [(ENXPCTimer *)&v22 init];
  v20 = v19;
  if (v19)
  {
    [(ENXPCTimer *)v19 setName:v16];
    [(ENXPCTimer *)v20 setDate:v17];
    [(ENXPCTimer *)v20 setGracePeriod:a5];
    [(ENXPCTimer *)v20 setPriority:a7];
    [(ENXPCTimer *)v20 setOptions:a8];
    [(ENXPCTimer *)v20 setCadence:a6 & ((int64_t)([(ENXPCTimer *)v20 options] << 50) >> 63)];
    [(ENXPCTimer *)v20 setBlock:v18];
    [(ENXPCTimer *)v20 handleActivity];
  }

  return v20;
}

- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 cadence:(unint64_t)a6 priority:(int64_t)a7 options:(unint64_t)a8 block:(id)a9
{
  id v16 = (void *)MEMORY[0x1E4F1C9C0];
  id v17 = a9;
  id v18 = a3;
  v19 = [v16 dateWithTimeIntervalSinceNow:a4];
  v20 = [(ENXPCTimer *)self initWithName:v18 date:v19 gracePeriod:a6 cadence:a7 priority:a8 options:v17 block:a5];

  return v20;
}

- (ENXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return [(ENXPCTimer *)self initWithName:a3 date:a4 gracePeriod:a5 priority:a6 options:a7 block:0.0];
}

- (ENXPCTimer)initWithName:(id)a3 delay:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14 = (void *)MEMORY[0x1E4F1C9C0];
  id v15 = a8;
  id v16 = a3;
  id v17 = [v14 dateWithTimeIntervalSinceNow:a4];
  id v18 = [(ENXPCTimer *)self initWithName:v16 date:v17 gracePeriod:a6 priority:a7 options:v15 block:a5];

  return v18;
}

- (ENXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F1C9C0];
  id v13 = a7;
  id v14 = a3;
  id v15 = [v12 dateWithTimeIntervalSinceNow:a4];
  id v16 = [(ENXPCTimer *)self initWithName:v14 date:v15 gracePeriod:a5 priority:a6 options:v13 block:0.0];

  return v16;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F29020];
  v4 = [(ENXPCTimer *)self name];
  v5 = [(ENXPCTimer *)self criteria];
  v6 = [v3 stringWithFormat:@"EN XPC Activity: %@, %@", v4, v5];

  return v6;
}

- (id)criteria
{
  v3 = [(ENXPCTimer *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  int64_t v7 = (uint64_t)v6;
  [(ENXPCTimer *)self gracePeriod];
  int64_t v9 = (uint64_t)v8;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  __int16 v11 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F142F8], (v11 & 0x2000) != 0);
  xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E4F14170], v7);
  xpc_dictionary_set_int64(v10, (const char *)*MEMORY[0x1E4F141A8], v9);
  int64_t v12 = [(ENXPCTimer *)self priority];
  id v13 = (const char **)MEMORY[0x1E4F142E0];
  if (v12 != 1) {
    id v13 = (const char **)MEMORY[0x1E4F142D0];
  }
  xpc_dictionary_set_string(v10, (const char *)*MEMORY[0x1E4F142C8], *v13);
  uint64_t v14 = [(ENXPCTimer *)self cadence];
  if (v14 <= 3599)
  {
    if (v14 <= 299)
    {
      if (!v14) {
        goto LABEL_31;
      }
      if (v14 == 60)
      {
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F14200];
        goto LABEL_29;
      }
    }
    else
    {
      switch(v14)
      {
        case 300:
          id v15 = (const char *)*MEMORY[0x1E4F141C8];
          id v16 = (int64_t *)MEMORY[0x1E4F14220];
          goto LABEL_29;
        case 900:
          id v15 = (const char *)*MEMORY[0x1E4F141C8];
          id v16 = (int64_t *)MEMORY[0x1E4F141D8];
          goto LABEL_29;
        case 1800:
          id v15 = (const char *)*MEMORY[0x1E4F141C8];
          id v16 = (int64_t *)MEMORY[0x1E4F14210];
          goto LABEL_29;
      }
    }
  }
  else if (v14 > 86399)
  {
    switch(v14)
    {
      case 86400:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F141E8];
        goto LABEL_29;
      case 604800:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F14228];
        goto LABEL_29;
      case 2592000:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v17 = v10;
        int64_t v18 = 2592000;
LABEL_30:
        xpc_dictionary_set_int64(v17, v15, v18);
        goto LABEL_31;
    }
  }
  else
  {
    switch(v14)
    {
      case 3600:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F141F8];
        goto LABEL_29;
      case 14400:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F14218];
        goto LABEL_29;
      case 28800:
        id v15 = (const char *)*MEMORY[0x1E4F141C8];
        id v16 = (int64_t *)MEMORY[0x1E4F14238];
LABEL_29:
        int64_t v18 = *v16;
        id v17 = v10;
        goto LABEL_30;
    }
  }
  unint64_t v31 = [(ENXPCTimer *)self cadence];
  if (([(ENXPCTimer *)self options] & 0x2000) != 0)
  {
    id v15 = (const char *)*MEMORY[0x1E4F141C8];
    id v17 = v10;
    int64_t v18 = v31;
    goto LABEL_30;
  }
LABEL_31:
  char v19 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F142B0], v19 & 1);
  char v20 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14348], (v20 & 4) != 0);
  char v21 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14358], (v21 & 2) != 0);
  char v22 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14370], (v22 & 8) != 0);
  if (([(ENXPCTimer *)self options] & 0x10) != 0)
  {
    v23 = (const char **)MEMORY[0x1E4F14310];
  }
  else if (([(ENXPCTimer *)self options] & 0x20) != 0)
  {
    v23 = (const char **)MEMORY[0x1E4F14318];
  }
  else
  {
    if (([(ENXPCTimer *)self options] & 0x40) == 0) {
      goto LABEL_39;
    }
    v23 = (const char **)MEMORY[0x1E4F14320];
  }
  if (*v23) {
    xpc_dictionary_set_BOOL(v10, *v23, 1);
  }
LABEL_39:
  char v24 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14338], v24 < 0);
  unint64_t v25 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14330], v25 & 0x100);
  __int16 v26 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14138], (v26 & 0x200) != 0);
  __int16 v27 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14250], (v27 & 0x400) != 0);
  __int16 v28 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14168], (v28 & 0x800) != 0);
  __int16 v29 = [(ENXPCTimer *)self options];
  xpc_dictionary_set_BOOL(v10, (const char *)*MEMORY[0x1E4F14188], (v29 & 0x1000) != 0);

  return v10;
}

- (void)invalidate
{
  if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    int64_t v7 = [(ENXPCTimer *)self name];
    LogPrintF_safe();
  }
  id v3 = [(ENXPCTimer *)self name];
  double v4 = (const char *)[v3 UTF8String];

  xpc_activity_unregister(v4);
  double v5 = [(ENXPCTimer *)self block];

  if (v5) {
    [(ENXPCTimer *)self setBlock:0];
  }
  double v6 = [(ENXPCTimer *)self activity];

  if (v6)
  {
    [(ENXPCTimer *)self setActivity:0];
  }
}

- (id)activityHandler
{
  id v3 = [(ENXPCTimer *)self name];
  double v4 = [(ENXPCTimer *)self date];
  [v4 timeIntervalSinceNow];

  if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    [(ENXPCTimer *)self cadence];
    [(ENXPCTimer *)self gracePeriod];
    LogPrintF_safe();
  }
  id location = 0;
  objc_initWeak(&location, self);
  double v5 = [(ENXPCTimer *)self block];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__ENXPCTimer_activityHandler__block_invoke;
  v10[3] = &unk_1E69AE0C8;
  objc_copyWeak(&v13, &location);
  id v11 = v3;
  id v12 = v5;
  id v6 = v5;
  id v7 = v3;
  double v8 = (void *)MEMORY[0x1D9439FF0](v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __29__ENXPCTimer_activityHandler__block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (gLogCategory_ENXPCTimer <= 90 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize())) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
  if (!xpc_activity_get_state(activity))
  {
    [WeakRetained setActivity:activity];
    xpc_object_t v4 = xpc_activity_copy_criteria(activity);
    if (v4)
    {
      double v5 = [WeakRetained criteria];
      BOOL v6 = xpc_equal(v5, v4);

      if (v6)
      {
        if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize()) {
          goto LABEL_45;
        }
        goto LABEL_25;
      }
      id v16 = [WeakRetained criteria];
      xpc_activity_set_criteria(activity, v16);

      if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize()) {
        goto LABEL_45;
      }
      id v17 = [WeakRetained criteria];
      LogPrintF_safe();
    }
    else
    {
      if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        [WeakRetained criteria];
        v19 = uint64_t v18 = v15;
        LogPrintF_safe();
      }
      id v17 = objc_msgSend(WeakRetained, "criteria", v18, v19);
      xpc_activity_set_criteria(activity, v17);
    }

    goto LABEL_45;
  }
  if (!xpc_activity_should_defer(activity))
  {
    xpc_activity_state_t state = xpc_activity_get_state(activity);
    xpc_object_t v4 = xpc_activity_copy_criteria(activity);
    if (state == 2)
    {
      xpc_activity_set_state(activity, 5);
      double v8 = (void *)MEMORY[0x1E4F29020];
      uint64_t v9 = *(void *)(a1 + 32);
      xpc_object_t v10 = [MEMORY[0x1E4F29120] UUID];
      id v11 = [v10 UUIDString];
      id v12 = [v8 stringWithFormat:@"%@-%@", v9, v11];

      id v13 = v12;
      [v13 UTF8String];
      uint64_t v14 = (void *)os_transaction_create();
      if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), WeakRetained);

      goto LABEL_45;
    }
    if (gLogCategory_ENXPCTimer > 30 || gLogCategory_ENXPCTimer == -1 && !_LogCategory_Initialize())
    {
LABEL_45:

      goto LABEL_46;
    }
LABEL_25:
    LogPrintF_safe();
    goto LABEL_45;
  }
  if (xpc_activity_set_state(activity, 3))
  {
    if (gLogCategory_ENXPCTimer <= 30 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize())) {
LABEL_22:
    }
      LogPrintF_safe();
  }
  else if (gLogCategory_ENXPCTimer <= 90 && (gLogCategory_ENXPCTimer != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_22;
  }
LABEL_46:
}

- (void)handleActivity
{
  id v6 = [(ENXPCTimer *)self name];
  id v3 = (const char *)[v6 utf8ValueSafe];
  xpc_object_t v4 = (void *)*MEMORY[0x1E4F14158];
  double v5 = [(ENXPCTimer *)self activityHandler];
  xpc_activity_register(v3, v4, v5);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (unint64_t)cadence
{
  return self->_cadence;
}

- (void)setCadence:(unint64_t)a3
{
  self->_cadence = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end