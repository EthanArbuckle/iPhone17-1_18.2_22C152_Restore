@interface _CDComplications
+ (id)sharedComplication;
- (BOOL)admissionCheckOnComplication:(id)a3 forRemote:(BOOL)a4 error:(id *)a5;
- (BOOL)isBundleActiveComplication:(id)a3;
- (BOOL)watchIsCharging;
- (NSDictionary)activeComplications;
- (id)initForComplications;
- (int)remainingPushesOnComplication:(id)a3 andReduceBy:(id)a4;
- (int)remainingPushesOnComplicationForiOSApplicationWithBundleID:(id)a3;
- (void)initForComplications;
- (void)readOutActiveComplications;
- (void)setActiveComplications:(id)a3;
@end

@implementation _CDComplications

+ (id)sharedComplication
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___CDComplications_sharedComplication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedComplication_init_once_token != -1) {
    dispatch_once(&sharedComplication_init_once_token, block);
  }
  v2 = (void *)sharedInstance;
  return v2;
}

- (void)readOutActiveComplications
{
  _CDDCurrentActiveComplications();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [v9 count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      v7 = [NSNumber numberWithUnsignedInteger:i];
      v8 = [v9 objectAtIndex:i];
      [v3 setObject:v7 forKey:v8];
    }
  }
  [(_CDComplications *)self setActiveComplications:v3];
}

- (id)initForComplications
{
  v28.receiver = self;
  v28.super_class = (Class)_CDComplications;
  v2 = [(_CDComplications *)&v28 init];
  if (v2)
  {
    id v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    activeComplications = v2->_activeComplications;
    v2->_activeComplications = v3;

    v2->deviceChangeToken = 0;
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.complications", v5);
    complicationQueue = v2->complicationQueue;
    v2->complicationQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    meterTokens = v2->meterTokens;
    v2->meterTokens = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.complications.pushLimits"];
    pushLimits = v2->pushLimits;
    v2->pushLimits = (NSUserDefaults *)v10;

    if (!v2->pushLimits)
    {
      v12 = +[_CDLogging admissionCheckChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_CDComplications initForComplications](v12);
      }
    }
    v13 = _CDDComplicationChangeNotificationString();
    v14 = v13;
    if (v13)
    {
      v15 = (const char *)[v13 UTF8String];
      v16 = v2->complicationQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __40___CDComplications_initForComplications__block_invoke;
      handler[3] = &unk_1E560E910;
      v27 = v2;
      notify_register_dispatch(v15, &v2->deviceChangeToken, v16, handler);
    }
    v17 = _CDDComplicationChangeOverCloudNotificationString();

    if (v17)
    {
      v18 = (const char *)[v17 UTF8String];
      v19 = v2->complicationQueue;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __40___CDComplications_initForComplications__block_invoke_2;
      v24[3] = &unk_1E560E910;
      v25 = v2;
      notify_register_dispatch(v18, &v2->deviceChangeToken, v19, v24);
    }
    v20 = v2->complicationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40___CDComplications_initForComplications__block_invoke_3;
    block[3] = &unk_1E560D578;
    v23 = v2;
    dispatch_sync(v20, block);
  }
  return v2;
}

- (int)remainingPushesOnComplicationForiOSApplicationWithBundleID:(id)a3
{
  return [(_CDComplications *)self remainingPushesOnComplication:a3 andReduceBy:&unk_1EDE1D9A0];
}

- (int)remainingPushesOnComplication:(id)a3 andReduceBy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSUserDefaults *)self->pushLimits objectForKey:@"complicationPushLimits"];
  id v9 = v8;
  if (v8) {
    id v10 = (id)[v8 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v11 = v10;
  v12 = [v10 objectForKey:v6];
  if (v12)
  {
    if ((int)[v7 intValue] >= 1 && objc_msgSend(v12, "integerValue") >= 1)
    {
      v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") - objc_msgSend(v7, "intValue"));
      [v11 setValue:v13 forKey:v6];

      [(NSUserDefaults *)self->pushLimits setObject:v11 forKey:@"complicationPushLimits"];
    }
    int v14 = [v12 intValue];
  }
  else
  {
    [v11 setValue:&unk_1EDE1D9B8 forKey:v6];
    [(NSUserDefaults *)self->pushLimits setObject:v11 forKey:@"complicationPushLimits"];
    int v14 = 50;
  }

  return v14;
}

- (BOOL)watchIsCharging
{
  uint64_t state64 = 0;
  out_int token = 0;
  LOBYTE(v2) = 0;
  if (!notify_register_check("com.apple.coreduetd.nearbydeviceschanged", &out_token))
  {
    if (notify_get_state(out_token, &state64)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = state64 == 1;
    }
    if (!v3)
    {
      v2 = +[_CDLogging admissionCheckChannel];
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "Watch is not nearby\n", buf, 2u);
      }

      LOBYTE(v2) = 0;
      goto LABEL_24;
    }
    *(void *)buf = 0;
    int token = 0;
    LOBYTE(v2) = 0;
    if (notify_register_check("com.apple.coreduetd.watchischarging", &token))
    {
LABEL_23:
      notify_cancel(token);
LABEL_24:
      notify_cancel(out_token);
      return (char)v2;
    }
    if (notify_get_state(token, (uint64_t *)buf)) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = *(void *)buf == 1;
    }
    LODWORD(v2) = v4;
    uint64_t v5 = +[_CDLogging admissionCheckChannel];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v2 == 1)
    {
      if (v6)
      {
        *(_WORD *)id v9 = 0;
        id v7 = "Watch is nearby and charging, approving complication push\n";
LABEL_21:
        _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, v7, v9, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)id v9 = 0;
      id v7 = "Watch is nearby but not charging\n";
      goto LABEL_21;
    }

    goto LABEL_23;
  }
  return (char)v2;
}

- (BOOL)admissionCheckOnComplication:(id)a3 forRemote:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    complicationQueue = self->complicationQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke;
    v13[3] = &unk_1E560E938;
    v13[4] = self;
    id v14 = v8;
    v15 = &v17;
    BOOL v16 = a4;
    dispatch_sync(complicationQueue, v13);
    if (a5) {
      *a5 = 0;
    }
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isBundleActiveComplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  complicationQueue = self->complicationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___CDComplications_isBundleActiveComplication___block_invoke;
  block[3] = &unk_1E560E960;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(complicationQueue, block);
  LOBYTE(complicationQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)complicationQueue;
}

- (NSDictionary)activeComplications
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveComplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_storeStrong((id *)&self->meterTokens, 0);
  objc_storeStrong((id *)&self->pushLimits, 0);
  objc_storeStrong((id *)&self->complicationQueue, 0);
}

- (void)initForComplications
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "no access to complication push limits (wcd sandbox violation?)\n", v1, 2u);
}

@end