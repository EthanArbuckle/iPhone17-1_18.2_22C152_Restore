@interface IKNetworkUtilities
+ (id)sharedInstance;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isNetworkReachable;
- (IKNetworkUtilities)init;
- (NSString)networkType;
- (double)lastNetworkChangedTime;
- (void)_notifyObservers;
- (void)dealloc;
@end

@implementation IKNetworkUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_33);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __36__IKNetworkUtilities_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (IKNetworkUtilities)init
{
  v22.receiver = self;
  v22.super_class = (Class)IKNetworkUtilities;
  v2 = [(IKNetworkUtilities *)&v22 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4BE78]);
    uint64_t v4 = [v3 initWithQueue:MEMORY[0x1E4F14428]];
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v4;

    [(RadiosPreferences *)v2->_radioPrefs setDelegate:v2];
    objc_initWeak(&location, v2);
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7 = [MEMORY[0x1E4FB8820] sharedInstance];
    uint64_t v8 = *MEMORY[0x1E4FB87E0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __26__IKNetworkUtilities_init__block_invoke;
    v19[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v20, &location);
    uint64_t v9 = [v6 addObserverForName:v8 object:v7 queue:0 usingBlock:v19];
    id isNetworkTypeChangedToken = v2->_isNetworkTypeChangedToken;
    v2->_id isNetworkTypeChangedToken = (id)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v12 = [MEMORY[0x1E4FB8820] sharedInstance];
    uint64_t v13 = *MEMORY[0x1E4FB87D8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __26__IKNetworkUtilities_init__block_invoke_2;
    v17[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = [v11 addObserverForName:v13 object:v12 queue:0 usingBlock:v17];
    id networkReachabilityChangedToken = v2->_networkReachabilityChangedToken;
    v2->_id networkReachabilityChangedToken = (id)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__IKNetworkUtilities_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _notifyObservers];
    id WeakRetained = v2;
  }
}

void __26__IKNetworkUtilities_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _notifyObservers];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(RadiosPreferences *)self->_radioPrefs setDelegate:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_isNetworkTypeChangedToken];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_networkReachabilityChangedToken];

  v5.receiver = self;
  v5.super_class = (Class)IKNetworkUtilities;
  [(IKNetworkUtilities *)&v5 dealloc];
}

- (BOOL)isNetworkReachable
{
  id v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  unsigned int v3 = ([v2 networkReachabilityFlags] >> 1) & 1;

  return v3;
}

- (BOOL)isAirplaneModeEnabled
{
  return [(RadiosPreferences *)self->_radioPrefs airplaneMode];
}

- (NSString)networkType
{
  id v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  uint64_t v3 = [v2 networkType];
  if (NetworkTypeString_onceToken != -1) {
    dispatch_once(&NetworkTypeString_onceToken, &__block_literal_global_50);
  }
  uint64_t v4 = (void *)NetworkTypeString_networkTypeDictionary;
  objc_super v5 = [NSNumber numberWithInteger:v3];
  v6 = [v4 objectForKey:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%li", v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return (NSString *)v9;
}

- (double)lastNetworkChangedTime
{
  id v2 = [MEMORY[0x1E4FB8820] sharedInstance];
  [v2 lastNetworkTypeChangeTime];
  double v4 = v3;

  return v4;
}

- (void)_notifyObservers
{
  id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  double v3 = objc_msgSend(NSNumber, "numberWithBool:", -[IKNetworkUtilities isNetworkReachable](self, "isNetworkReachable"));
  [v9 setObject:v3 forKey:@"isNetworkReachable"];

  if (+[IKUtilites isAppTrusted])
  {
    double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IKNetworkUtilities isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
    [v9 setObject:v4 forKey:@"isInAirplaneMode"];

    objc_super v5 = [(IKNetworkUtilities *)self networkType];
    [v9 setObject:v5 forKey:@"NetworkType"];

    v6 = NSNumber;
    [(IKNetworkUtilities *)self lastNetworkChangedTime];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [v9 setObject:v7 forKey:@"LastNetworkChangedTime"];
  }
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"IKNetworkPropertiesChangedNotification" object:self userInfo:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPrefs, 0);
  objc_storeStrong(&self->_networkReachabilityChangedToken, 0);
  objc_storeStrong(&self->_isNetworkTypeChangedToken, 0);
}

@end