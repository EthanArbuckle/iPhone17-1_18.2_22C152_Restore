@interface CUIKiCloudKVStore
+ (BOOL)_haveiCloudKVStoreEntitlement;
+ (id)sharediCloudKVStore;
- (BOOL)_canAccessiCloudKVStore;
- (BOOL)hasConnectedToCarBluetooth;
- (CUIKiCloudKVStore)init;
- (NSDate)lastCarConnectionDate;
- (NSObject)ubiquityIdentityToken;
- (void)_identityChanged:(id)a3;
- (void)_storeDidChange:(id)a3;
- (void)dealloc;
- (void)setHasConnectedToCarBluetooth:(BOOL)a3;
- (void)setLastCarConnectionDate:(id)a3;
- (void)setUbiquityIdentityToken:(id)a3;
@end

@implementation CUIKiCloudKVStore

+ (id)sharediCloudKVStore
{
  if (sharediCloudKVStore_onceToken != -1) {
    dispatch_once(&sharediCloudKVStore_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharediCloudKVStore_iCloudKVStore;

  return v2;
}

void __40__CUIKiCloudKVStore_sharediCloudKVStore__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharediCloudKVStore_iCloudKVStore;
  sharediCloudKVStore_iCloudKVStore = v0;
}

+ (BOOL)_haveiCloudKVStoreEntitlement
{
  return 1;
}

- (BOOL)_canAccessiCloudKVStore
{
  v2 = objc_opt_class();

  return [v2 _haveiCloudKVStoreEntitlement];
}

- (CUIKiCloudKVStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)CUIKiCloudKVStore;
  v3 = [(CUIKiCloudKVStore *)&v11 self];

  if (v3)
  {
    v3->_hasConnectedToCarBluetooth = 0;
    if ([(id)objc_opt_class() _haveiCloudKVStoreEntitlement])
    {
      v4 = [MEMORY[0x1E4F29130] defaultStore];
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:v3 selector:sel__storeDidChange_ name:*MEMORY[0x1E4F28A30] object:v4];

      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v3 selector:sel__identityChanged_ name:*MEMORY[0x1E4F28A38] object:0];

      v7 = [MEMORY[0x1E4F29130] defaultStore];
      [v7 synchronize];

      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      v9 = [v8 ubiquityIdentityToken];
      [(CUIKiCloudKVStore *)v3 setUbiquityIdentityToken:v9];

      [(CUIKiCloudKVStore *)v3 _storeDidChange:0];
    }
  }
  return v3;
}

- (void)dealloc
{
  if ([(id)objc_opt_class() _haveiCloudKVStoreEntitlement])
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)CUIKiCloudKVStore;
  [(CUIKiCloudKVStore *)&v4 dealloc];
}

- (void)setHasConnectedToCarBluetooth:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CUIKiCloudKVStore *)self _canAccessiCloudKVStore])
  {
    self->_hasConnectedToCarBluetooth = v3;
    id v5 = [MEMORY[0x1E4F29130] defaultStore];
    [v5 setBool:v3 forKey:@"HasConnectedToCarBluetoothKey"];
    [v5 synchronize];
  }
}

- (void)setLastCarConnectionDate:(id)a3
{
  id v5 = a3;
  lastCarConnectionDate = self->_lastCarConnectionDate;
  id v10 = v5;
  if (lastCarConnectionDate) {
    BOOL v7 = [(NSDate *)lastCarConnectionDate isEqualToDate:v5];
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if ([(CUIKiCloudKVStore *)self _canAccessiCloudKVStore] && !v7)
  {
    objc_storeStrong((id *)&self->_lastCarConnectionDate, a3);
    v8 = [MEMORY[0x1E4F29130] defaultStore];
    v9 = v8;
    if (v10) {
      [v8 setObject:v10 forKey:@"LastCarConnectionDate"];
    }
    else {
      [v8 removeObjectForKey:@"LastCarConnectionDate"];
    }
    [v9 synchronize];
  }
}

- (void)_identityChanged:(id)a3
{
  objc_super v4 = [(CUIKiCloudKVStore *)self ubiquityIdentityToken];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 ubiquityIdentityToken];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [v8 ubiquityIdentityToken];
    [(CUIKiCloudKVStore *)self setUbiquityIdentityToken:v9];

    self->_hasConnectedToCarBluetooth = 0;
    lastCarConnectionDate = self->_lastCarConnectionDate;
    self->_lastCarConnectionDate = 0;

    objc_super v11 = [(CUIKiCloudKVStore *)self ubiquityIdentityToken];

    if (v11)
    {
      [(CUIKiCloudKVStore *)self _storeDidChange:0];
    }
  }
}

- (void)_storeDidChange:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v26 = 0;
    uint64_t v10 = *MEMORY[0x1E4F28A28];
    v34[0] = @"HasConnectedToCarBluetoothKey";
    v34[1] = @"LastCarConnectionDate";
    uint64_t v35 = v10;
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v36[0] = v11;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

    goto LABEL_6;
  }
  v6 = [v4 userInfo];
  char v7 = [v6 objectForKey:*MEMORY[0x1E4F28A20]];
  if (v7)
  {
    v8 = v7;
    unint64_t v9 = [v7 integerValue];

    if (v9 <= 1)
    {
      v26 = v5;
      uint64_t v10 = *MEMORY[0x1E4F28A28];
LABEL_6:
      v25 = v6;
      v12 = [v6 objectForKey:v10];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (!v13) {
        goto LABEL_25;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      unint64_t v16 = 0x1E4F29000uLL;
      while (1)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v18 isEqualToString:@"HasConnectedToCarBluetoothKey"])
          {
            v19 = [*(id *)(v16 + 304) defaultStore];
            self->_hasConnectedToCarBluetooth = [v19 BOOLForKey:@"HasConnectedToCarBluetoothKey"];
          }
          else
          {
            if (![v18 isEqualToString:@"LastCarConnectionDate"]) {
              continue;
            }
            unint64_t v20 = v16;
            v19 = [*(id *)(v16 + 304) defaultStore];
            v21 = [v19 objectForKey:@"LastCarConnectionDate"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = v21;
            }
            else
            {
              if (v21)
              {
                v23 = +[CUIKLogSubsystem defaultCategory];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  -[CUIKiCloudKVStore _storeDidChange:](v31, (uint64_t)v21, &v32, v23);
                }
              }
              v22 = 0;
            }
            lastCarConnectionDate = self->_lastCarConnectionDate;
            self->_lastCarConnectionDate = v22;

            unint64_t v16 = v20;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (!v14)
        {
LABEL_25:

          v6 = v25;
          id v5 = v26;
          break;
        }
      }
    }
  }
}

- (BOOL)hasConnectedToCarBluetooth
{
  return self->_hasConnectedToCarBluetooth;
}

- (NSDate)lastCarConnectionDate
{
  return self->_lastCarConnectionDate;
}

- (NSObject)ubiquityIdentityToken
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUbiquityIdentityToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityIdentityToken, 0);

  objc_storeStrong((id *)&self->_lastCarConnectionDate, 0);
}

- (void)_storeDidChange:(void *)a3 .cold.1(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  char v7 = objc_opt_class();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  id v8 = v7;
  _os_log_error_impl(&dword_1BDF08000, a4, OS_LOG_TYPE_ERROR, "Got unexpected object for last car connection date. Expected NSDate, got %@", a1, 0xCu);
}

@end