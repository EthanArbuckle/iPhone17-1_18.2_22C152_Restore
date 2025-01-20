@interface _COMessagingServiceMeter
- (BOOL)clientIdentifier:(id)a3 canReceiveLength:(unint64_t)a4;
- (BOOL)clientIdentifier:(id)a3 canSendLength:(unint64_t)a4;
- (BOOL)isEvaluatingIdentifier:(id)a3;
- (NSDictionary)limits;
- (NSMutableDictionary)peaks;
- (_COMessagingServiceMeter)init;
- (int)registration;
- (unint64_t)receiveLimitForIdentifier:(id)a3;
- (unint64_t)sendLimitForIdentifier:(id)a3;
- (void)_withLock:(id)a3;
- (void)dealloc;
@end

@implementation _COMessagingServiceMeter

- (_COMessagingServiceMeter)init
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)_COMessagingServiceMeter;
  val = [(_COMessagingServiceMeter *)&v49 init];
  if (val)
  {
    val->_lock._os_unfair_lock_opaque = 0;
    id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v37 setObject:&unk_26D3EB878 forKey:@"com.apple.homepodsettingsd"];
    [v37 setObject:&unk_26D3EB890 forKey:@"com.apple.coordinated"];
    v2 = [MEMORY[0x263F08AB0] processInfo];
    v35 = [v2 arguments];

    uint64_t v3 = [v35 indexOfObject:@"--limits"];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL && v3 + 1 < (unint64_t)[v35 count])
    {
      v4 = objc_msgSend(v35, "objectAtIndex:");
      v5 = [v4 componentsSeparatedByString:@","];

      v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v46 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = [*(id *)(*((void *)&v45 + 1) + 8 * i) stringByTrimmingCharactersInSet:v6];
            if ([v11 length])
            {
              v12 = [v11 componentsSeparatedByString:@"="];
              if ([v12 count] == 2)
              {
                v13 = [v12 objectAtIndex:0];
                v14 = [v13 stringByTrimmingCharactersInSet:v6];

                v15 = [v12 objectAtIndex:1];
                v16 = [v15 stringByTrimmingCharactersInSet:v6];

                if ([v14 length])
                {
                  if ([v16 length])
                  {
                    uint64_t v17 = [v16 integerValue];
                    if (v17 >= 1)
                    {
                      v18 = [NSNumber numberWithInteger:v17];
                      [v37 setObject:v18 forKey:v14];
                    }
                  }
                }
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v8);
      }
    }
    uint64_t v19 = [v35 indexOfObject:@"--evaluating"];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 + 1 < (unint64_t)[v35 count])
    {
      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      peaks = val->_peaks;
      val->_peaks = v20;

      v22 = [v35 objectAtIndex:v19 + 1];
      v23 = [v22 componentsSeparatedByString:@","];

      v24 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            v30 = [v29 stringByTrimmingCharactersInSet:v24];
            if ([v30 length])
            {
              [(NSMutableDictionary *)val->_peaks setObject:&unk_26D3EB8A8 forKey:v29];
              [v37 setObject:&unk_26D3EB8C0 forKey:v29];
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v26);
      }

      objc_initWeak(&location, val);
      v31 = dispatch_get_global_queue(21, 0);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __32___COMessagingServiceMeter_init__block_invoke;
      handler[3] = &unk_2645CDB58;
      objc_copyWeak(&v39, &location);
      notify_register_dispatch("com.apple.CoordinationCore.COMessagingServiceMeter", &val->_registration, v31, handler);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    uint64_t v32 = [v37 copy];
    limits = val->_limits;
    val->_limits = (NSDictionary *)v32;
  }
  return val;
}

- (void)dealloc
{
  int v3 = [(_COMessagingServiceMeter *)self registration];
  if (notify_is_valid_token(v3)) {
    notify_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)_COMessagingServiceMeter;
  [(_COMessagingServiceMeter *)&v4 dealloc];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  objc_super v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)clientIdentifier:(id)a3 canSendLength:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(_COMessagingServiceMeter *)self sendLimitForIdentifier:v6];
  if ([(_COMessagingServiceMeter *)self isEvaluatingIdentifier:v6])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59___COMessagingServiceMeter_clientIdentifier_canSendLength___block_invoke;
    v9[3] = &unk_2645CD7A8;
    v9[4] = self;
    id v10 = v6;
    unint64_t v11 = a4;
    [(_COMessagingServiceMeter *)self _withLock:v9];
  }
  return v7 > a4;
}

- (BOOL)clientIdentifier:(id)a3 canReceiveLength:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(_COMessagingServiceMeter *)self receiveLimitForIdentifier:v6];
  if ([(_COMessagingServiceMeter *)self isEvaluatingIdentifier:v6])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62___COMessagingServiceMeter_clientIdentifier_canReceiveLength___block_invoke;
    v9[3] = &unk_2645CD7A8;
    v9[4] = self;
    id v10 = v6;
    unint64_t v11 = a4;
    [(_COMessagingServiceMeter *)self _withLock:v9];
  }
  return v7 > a4;
}

- (BOOL)isEvaluatingIdentifier:(id)a3
{
  id v4 = a3;
  if ([(_COMessagingServiceMeter *)self sendLimitForIdentifier:v4] == -1)
  {
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51___COMessagingServiceMeter_isEvaluatingIdentifier___block_invoke;
    v7[3] = &unk_2645CB1E8;
    uint64_t v9 = &v10;
    v7[4] = self;
    id v8 = v4;
    [(_COMessagingServiceMeter *)self _withLock:v7];
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)sendLimitForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_COMessagingServiceMeter *)self limits];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 10240;
  }

  return v7;
}

- (unint64_t)receiveLimitForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_COMessagingServiceMeter *)self limits];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 10240;
  }

  return v7;
}

- (NSDictionary)limits
{
  return self->_limits;
}

- (NSMutableDictionary)peaks
{
  return self->_peaks;
}

- (int)registration
{
  return self->_registration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peaks, 0);
  objc_storeStrong((id *)&self->_limits, 0);
}

@end