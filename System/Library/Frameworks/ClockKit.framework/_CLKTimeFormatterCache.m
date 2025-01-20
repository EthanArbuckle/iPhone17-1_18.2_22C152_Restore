@interface _CLKTimeFormatterCache
+ (id)sharedInstance;
+ (id)timeZoneName:(id)a3;
- (_CLKTimeFormatterCache)init;
- (id)timeAndDesignatorFormatterForTimeZone:(id)a3 suppressWhitespace:(BOOL)a4 forcedNumberSystem:(unint64_t)a5;
- (id)timeOnlyFormatterForTimeZone:(id)a3 hasSeconds:(BOOL)a4 forcedNumberSystem:(unint64_t)a5;
- (void)_invalidateFormatters;
- (void)dealloc;
@end

@implementation _CLKTimeFormatterCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___CLKTimeFormatterCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return v2;
}

+ (id)timeZoneName:(id)a3
{
  if (a3)
  {
    v4 = [a3 name];
  }
  else
  {
    v4 = @"[NSTimeZone localTimeZone]";
  }
  return v4;
}

- (_CLKTimeFormatterCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CLKTimeFormatterCache;
  v2 = [(_CLKTimeFormatterCache *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__invalidateFormatters name:*MEMORY[0x263EFF458] object:0];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_CLKTimeFormatterCache;
  [(_CLKTimeFormatterCache *)&v4 dealloc];
}

- (id)timeOnlyFormatterForTimeZone:(id)a3 hasSeconds:(BOOL)a4 forcedNumberSystem:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  if (!self->_timeOnlyFormatters)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    timeOnlyFormatters = self->_timeOnlyFormatters;
    self->_timeOnlyFormatters = v9;
  }
  v11 = [(id)objc_opt_class() timeZoneName:v8];
  v12 = objc_msgSend(v11, "stringByAppendingFormat:", @"%i%lu", v6, a5);

  v13 = [(NSMutableDictionary *)self->_timeOnlyFormatters objectForKeyedSubscript:v12];
  if (!v13)
  {
    v14 = objc_opt_new();
    v13 = v14;
    if (a5 != -1) {
      _ForceDateFormatterLocaleToUseNumberSystem(v14, a5);
    }
    if (v8)
    {
      [v13 setTimeZone:v8];
    }
    else
    {
      v15 = [MEMORY[0x263EFFA18] localTimeZone];
      [v13 setTimeZone:v15];
    }
    if (v6) {
      v16 = @"Jmmss";
    }
    else {
      v16 = @"Jmm";
    }
    [v13 setLocalizedDateFormatFromTemplate:v16];
    [(NSMutableDictionary *)self->_timeOnlyFormatters setObject:v13 forKeyedSubscript:v12];
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return v13;
}

- (id)timeAndDesignatorFormatterForTimeZone:(id)a3 suppressWhitespace:(BOOL)a4 forcedNumberSystem:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  v9 = [(id)objc_opt_class() timeZoneName:v8];
  v10 = objc_msgSend(v9, "stringByAppendingFormat:", @"%lu", a5);

  if (v6)
  {
    timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
    if (!timeAndDesignatorFormattersSuppressingWhitespace)
    {
      v12 = (NSMutableDictionary *)objc_opt_new();
      v13 = self->_timeAndDesignatorFormattersSuppressingWhitespace;
      self->_timeAndDesignatorFormattersSuppressingWhitespace = v12;

      timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
    }
    v14 = [(NSMutableDictionary *)timeAndDesignatorFormattersSuppressingWhitespace objectForKeyedSubscript:v10];
    if (!v14)
    {
      v15 = objc_opt_new();
      v14 = v15;
      if (a5 != -1) {
        _ForceDateFormatterLocaleToUseNumberSystem(v15, a5);
      }
      if (v8)
      {
        [v14 setTimeZone:v8];
      }
      else
      {
        v20 = [MEMORY[0x263EFFA18] localTimeZone];
        [v14 setTimeZone:v20];
      }
      v21 = _BasicTimeFormat();
      if ((CLKDesignatorRequiresWhitespace() & 1) == 0)
      {
        v22 = [v21 stringByReplacingOccurrencesOfString:@"a " withString:@"a"];

        v21 = [v22 stringByReplacingOccurrencesOfString:@" a" withString:@"a"];
      }
      [v14 setDateFormat:v21];
      [(NSMutableDictionary *)self->_timeAndDesignatorFormattersSuppressingWhitespace setObject:v14 forKeyedSubscript:v10];
    }
  }
  else
  {
    timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
    if (!timeAndDesignatorFormatters)
    {
      v17 = (NSMutableDictionary *)objc_opt_new();
      v18 = self->_timeAndDesignatorFormatters;
      self->_timeAndDesignatorFormatters = v17;

      timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
    }
    v14 = [(NSMutableDictionary *)timeAndDesignatorFormatters objectForKeyedSubscript:v10];
    if (!v14)
    {
      v19 = objc_opt_new();
      v14 = v19;
      if (v8)
      {
        [v19 setTimeZone:v8];
      }
      else
      {
        v23 = [MEMORY[0x263EFFA18] localTimeZone];
        [v14 setTimeZone:v23];
      }
      v24 = _BasicTimeFormat();
      [v14 setDateFormat:v24];

      [(NSMutableDictionary *)self->_timeAndDesignatorFormatters setObject:v14 forKeyedSubscript:v10];
    }
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return v14;
}

- (void)_invalidateFormatters
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  timeOnlyFormatters = self->_timeOnlyFormatters;
  self->_timeOnlyFormatters = 0;

  timeAndDesignatorFormatters = self->_timeAndDesignatorFormatters;
  self->_timeAndDesignatorFormatters = 0;

  timeAndDesignatorFormattersSuppressingWhitespace = self->_timeAndDesignatorFormattersSuppressingWhitespace;
  self->_timeAndDesignatorFormattersSuppressingWhitespace = 0;

  os_unfair_lock_unlock(p_cacheLock);
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"_FormatterCacheInvalidatedNotification" object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeAndDesignatorFormattersSuppressingWhitespace, 0);
  objc_storeStrong((id *)&self->_timeAndDesignatorFormatters, 0);

  objc_storeStrong((id *)&self->_timeOnlyFormatters, 0);
}

@end