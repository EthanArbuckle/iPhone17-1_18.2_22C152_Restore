@interface IKJSFoundation
- (IKAppContext)appContext;
- (IKAppDeviceConfig)deviceConfig;
- (IKJSFoundation)initWithAppContext:(id)a3 deviceConfig:(id)a4;
- (NSMutableDictionary)dateFormatterCache;
- (NSMutableDictionary)jsTimers;
- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5;
- (id)_stringForKey:(id)a3 fromDict:(id)a4;
- (id)getCookieForURL:(id)a3 useSSCookieStorage:(BOOL)a4;
- (id)setInterval:(id)a3 time:(int64_t)a4;
- (id)setTimeout:(id)a3 time:(int64_t)a4;
- (void)_clearTimer:(id)a3;
- (void)_jsTimerFired:(id)a3;
- (void)clearCookies;
- (void)setAppContext:(id)a3;
- (void)setCookie:(id)a3 useSSCookieStorage:(BOOL)a4;
- (void)setDateFormatterCache:(id)a3;
- (void)setDeviceConfig:(id)a3;
- (void)setJsTimers:(id)a3;
- (void)stopTimers;
@end

@implementation IKJSFoundation

- (IKJSFoundation)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKJSFoundation;
  v8 = [(IKJSFoundation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    jsTimers = v9->_jsTimers;
    v9->_jsTimers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dateFormatterCache = v9->_dateFormatterCache;
    v9->_dateFormatterCache = v12;

    objc_storeWeak((id *)&v9->_deviceConfig, v7);
  }

  return v9;
}

- (id)setInterval:(id)a3 time:(int64_t)a4
{
  return [(IKJSFoundation *)self _startTimer:a3 time:a4 repeating:1];
}

- (id)setTimeout:(id)a3 time:(int64_t)a4
{
  return [(IKJSFoundation *)self _startTimer:a3 time:a4 repeating:0];
}

- (void)stopTimers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(IKJSFoundation *)self jsTimers];
  v4 = [v3 allValues];

  if ([v4 count])
  {
    v5 = [v4 valueForKey:@"timer"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v10++) removeManagedReferences];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__IKJSFoundation_stopTimers__block_invoke;
    block[3] = &unk_1E6DE3CC0;
    id v14 = v5;
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v12 = [(IKJSFoundation *)self jsTimers];
  [v12 removeAllObjects];
}

void __28__IKJSFoundation_stopTimers__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 isObject])
  {
    if (a4 >= 1) {
      int64_t v9 = a4;
    }
    else {
      int64_t v9 = 0;
    }
    if (a4 > 0 || !v5)
    {
      id v14 = [MEMORY[0x1E4F30920] currentArguments];
      if ((unint64_t)[v14 count] < 3)
      {
        long long v15 = 0;
      }
      else
      {
        long long v15 = objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
      }
      long long v16 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__jsTimerFired_ selector:0 userInfo:v5 repeats:(float)((float)v9 / 1000.0)];
      long long v17 = [IKJSTimerContext alloc];
      long long v18 = [(IKJSFoundation *)self appContext];
      v19 = [v18 jsContext];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"App"];
      v21 = [(IKJSTimerContext *)v17 initWithCallback:v8 callbackArgs:v15 repeating:v5 ownerObject:v20 timer:v16];

      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v16);
      v22 = [(IKJSFoundation *)self jsTimers];
      [v22 setObject:v21 forKey:v13];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__IKJSFoundation__startTimer_time_repeating___block_invoke;
      block[3] = &unk_1E6DE3CC0;
      id v26 = v16;
      id v23 = v16;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_14;
    }
    uint64_t v10 = [(IKJSFoundation *)self appContext];
    uint64_t v11 = v10;
    v12 = @"starting timer with invalid timeout";
  }
  else
  {
    uint64_t v10 = [(IKJSFoundation *)self appContext];
    uint64_t v11 = v10;
    v12 = @"starting timer with empty handler";
  }
  [v10 setException:0 withErrorMessage:v12];

  v13 = 0;
LABEL_14:

  return v13;
}

void __45__IKJSFoundation__startTimer_time_repeating___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v2 addTimer:*(void *)(a1 + 32) forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_clearTimer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    BOOL v5 = [(IKJSFoundation *)self jsTimers];
    long long v6 = [v5 objectForKey:v4];

    if (v6)
    {
      long long v7 = [v6 timer];
      [v6 removeManagedReferences];
      id v8 = [(IKJSFoundation *)self jsTimers];
      [v8 removeObjectForKey:v4];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__IKJSFoundation__clearTimer___block_invoke;
      block[3] = &unk_1E6DE3CC0;
      id v11 = v7;
      id v9 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    long long v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[IKJSFoundation _clearTimer:]((uint64_t)v4, v6);
    }
  }
}

uint64_t __30__IKJSFoundation__clearTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_jsTimerFired:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
  objc_initWeak(&location, self);
  long long v6 = [(IKJSFoundation *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__IKJSFoundation__jsTimerFired___block_invoke;
  v8[3] = &unk_1E6DE48E8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 evaluate:v8 completionBlock:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __32__IKJSFoundation__jsTimerFired___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained jsTimers];
    long long v6 = [v5 objectForKey:*(void *)(a1 + 32)];

    if (v6)
    {
      id v7 = [v6 managedCallback];
      id v8 = [v7 value];

      id v9 = [v6 managedArgs];
      id v10 = [v9 jsValuesWithContext:v13];
      id v11 = (id)[v8 callWithArguments:v10];

      if (([v6 isRepeating] & 1) == 0)
      {
        [v6 removeManagedReferences];
        v12 = [v4 jsTimers];
        [v12 removeObjectForKey:*(void *)(a1 + 32)];
      }
    }
  }
}

- (id)getCookieForURL:(id)a3 useSSCookieStorage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 length])
  {
    long long v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    if (v6) {
      BOOL v7 = !v4;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4FA8320] sharedStorage];
      id v9 = [v8 cookieHeadersForURL:v6 userIdentifier:0];

      id v10 = [v9 objectForKey:@"Cookie"];

      goto LABEL_9;
    }
  }
  else
  {
    long long v6 = 0;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (void)setCookie:(id)a3 useSSCookieStorage:(BOOL)a4
{
  BOOL v4 = a4;
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;
  objc_opt_class();
  unint64_t v9 = 0x1E4F1C000uLL;
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v12 = [MEMORY[0x1E4F28FE8] scannerWithString:v6];
    do
    {
      id v56 = 0;
      [v12 scanUpToString:@"=" intoString:&v56];
      id v13 = v56;
      [v12 scanString:@"=" intoString:0];
      id v55 = 0;
      [v12 scanUpToString:@";" intoString:&v55];
      id v14 = v55;
      [v12 scanString:@";" intoString:0];
      long long v15 = [v13 stringByTrimmingCharactersInSet:v11];

      long long v16 = [v14 stringByTrimmingCharactersInSet:v11];

      if (-[__CFString length](v15, "length") && [v16 length])
      {
        if ([v10 count])
        {
          long long v17 = v10;
          long long v18 = v16;
          v19 = v15;
        }
        else
        {
          [v10 setObject:v15 forKey:@"name"];
          long long v17 = v10;
          long long v18 = v16;
          v19 = @"value";
        }
        [v17 setObject:v18 forKey:v19];
      }
      int v20 = [v12 isAtEnd];
    }
    while (!v20);

    unint64_t v9 = 0x1E4F1C000;
  }
  else
  {
    id v10 = v8;
  }
  if ([v10 count])
  {
    v21 = objc_msgSend(objc_alloc(*(Class *)(v9 + 2656)), "initWithCapacity:", objc_msgSend(v10, "count"));
    v22 = [(IKJSFoundation *)self _stringForKey:@"name" fromDict:v10];

    if (v22)
    {
      id v23 = [(IKJSFoundation *)self _stringForKey:@"name" fromDict:v10];
      [v21 setObject:v23 forKey:*MEMORY[0x1E4F28418]];
    }
    v24 = [(IKJSFoundation *)self _stringForKey:@"value" fromDict:v10];

    if (v24)
    {
      v25 = [(IKJSFoundation *)self _stringForKey:@"value" fromDict:v10];
      [v21 setObject:v25 forKey:*MEMORY[0x1E4F28448]];
    }
    id v26 = [(IKJSFoundation *)self _stringForKey:@"originURL" fromDict:v10];

    if (v26)
    {
      v27 = [(IKJSFoundation *)self _stringForKey:@"originURL" fromDict:v10];
      [v21 setObject:v27 forKey:*MEMORY[0x1E4F28420]];
    }
    v28 = [(IKJSFoundation *)self _stringForKey:@"version" fromDict:v10];

    if (v28)
    {
      v29 = [(IKJSFoundation *)self _stringForKey:@"version" fromDict:v10];
      [v21 setObject:v29 forKey:*MEMORY[0x1E4F28450]];
    }
    v30 = [(IKJSFoundation *)self _stringForKey:@"domain" fromDict:v10];

    if (v30)
    {
      v31 = [(IKJSFoundation *)self _stringForKey:@"domain" fromDict:v10];
      [v21 setObject:v31 forKey:*MEMORY[0x1E4F28400]];
    }
    v32 = [(IKJSFoundation *)self _stringForKey:@"path" fromDict:v10];

    if (v32)
    {
      v33 = [(IKJSFoundation *)self _stringForKey:@"path" fromDict:v10];
      [v21 setObject:v33 forKey:*MEMORY[0x1E4F28428]];
    }
    v34 = [(IKJSFoundation *)self _stringForKey:@"secure" fromDict:v10];

    if (v34)
    {
      v35 = [(IKJSFoundation *)self _stringForKey:@"secure" fromDict:v10];
      [v21 setObject:v35 forKey:*MEMORY[0x1E4F28440]];
    }
    v36 = [(IKJSFoundation *)self _stringForKey:@"comment" fromDict:v10];

    if (v36)
    {
      v37 = [(IKJSFoundation *)self _stringForKey:@"comment" fromDict:v10];
      [v21 setObject:v37 forKey:*MEMORY[0x1E4F283E8]];
    }
    v38 = [(IKJSFoundation *)self _stringForKey:@"commentURL" fromDict:v10];

    if (v38)
    {
      v39 = [(IKJSFoundation *)self _stringForKey:@"commentURL" fromDict:v10];
      [v21 setObject:v39 forKey:*MEMORY[0x1E4F283F0]];
    }
    v40 = [(IKJSFoundation *)self _stringForKey:@"discard" fromDict:v10];

    if (v40)
    {
      v41 = [(IKJSFoundation *)self _stringForKey:@"discard" fromDict:v10];
      [v21 setObject:v41 forKey:*MEMORY[0x1E4F283F8]];
    }
    v42 = [(IKJSFoundation *)self _stringForKey:@"maxAge" fromDict:v10];

    if (v42)
    {
      v43 = [(IKJSFoundation *)self _stringForKey:@"maxAge" fromDict:v10];
      [v21 setObject:v43 forKey:*MEMORY[0x1E4F28410]];
    }
    v44 = [(IKJSFoundation *)self _stringForKey:@"port" fromDict:v10];

    if (v44)
    {
      v45 = [(IKJSFoundation *)self _stringForKey:@"port" fromDict:v10];
      [v21 setObject:v45 forKey:*MEMORY[0x1E4F28430]];
    }
    v46 = [v10 objectForKeyedSubscript:@"expires"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = +[IKFormatting rfc1123DateFormatter];
      v48 = [v47 dateFromString:v46];
      if (v48)
      {
        [v21 setObject:v48 forKey:*MEMORY[0x1E4F28408]];
      }
      else
      {
        v50 = ITMLKitGetLogObject(0);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[IKJSFoundation setCookie:useSSCookieStorage:]((uint64_t)v46, v50);
        }
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v21 setObject:v46 forKey:*MEMORY[0x1E4F28408]];
      }
    }
    v51 = (void *)[objc_alloc(MEMORY[0x1E4F28D10]) initWithProperties:v21];
    if (v51)
    {
      if (v4)
      {
        v52 = [MEMORY[0x1E4FA8320] sharedStorage];
        v57[0] = v51;
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
        [v52 setCookies:v53 forUserIdentifier:&unk_1F3E3DF20];
      }
      else
      {
        v52 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
        [v52 setCookie:v51];
      }

      v49 = 0;
    }
    else
    {
      v49 = @"failed to create cookie";
    }
  }
  else
  {
    v49 = @"invalid argument";
  }
  if ([(__CFString *)v49 length])
  {
    v54 = [(IKJSFoundation *)self appContext];
    [v54 setException:0 withErrorMessage:v49];
  }
}

- (void)clearCookies
{
  id v2 = [MEMORY[0x1E4FA8320] sharedStorage];
  [v2 removeAllCookies];
}

- (id)_stringForKey:(id)a3 fromDict:(id)a4
{
  BOOL v4 = [a4 objectForKeyedSubscript:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
}

- (NSMutableDictionary)dateFormatterCache
{
  return self->_dateFormatterCache;
}

- (void)setDateFormatterCache:(id)a3
{
}

- (IKAppDeviceConfig)deviceConfig
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceConfig);
  return (IKAppDeviceConfig *)WeakRetained;
}

- (void)setDeviceConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceConfig);
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_jsTimers, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)_clearTimer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unknown timer: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setCookie:(uint64_t)a1 useSSCookieStorage:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Failed to convert [%@] to date", (uint8_t *)&v2, 0xCu);
}

@end