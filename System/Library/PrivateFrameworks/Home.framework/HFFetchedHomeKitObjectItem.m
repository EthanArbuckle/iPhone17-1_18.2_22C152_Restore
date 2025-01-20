@interface HFFetchedHomeKitObjectItem
+ (BOOL)alwaysPerformFullFetch;
- (HFFetchedHomeKitObjectItem)initWithHomeKitObject:(id)a3;
- (HFHomeKitObject)homeKitObject;
- (id)_homeKitObjectFetch;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setHomeKitObject:(id)a3;
@end

@implementation HFFetchedHomeKitObjectItem

+ (BOOL)alwaysPerformFullFetch
{
  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:HFItemUpdateOptionFullUpdateIndicated];
  if ([v5 BOOLValue]
    || ([(HFFetchedHomeKitObjectItem *)self homeKitObject],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    objc_initWeak(&location, self);
  }
  else
  {
    v7 = (void *)v6;
    char v8 = [(id)objc_opt_class() alwaysPerformFullFetch];

    objc_initWeak(&location, self);
    if ((v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263F58190];
      v10 = [(HFFetchedHomeKitObjectItem *)self homeKitObject];
      v11 = [v9 futureWithResult:v10];

      char v12 = 0;
      goto LABEL_7;
    }
  }
  v11 = [(HFFetchedHomeKitObjectItem *)self _homeKitObjectFetch];
  char v12 = 1;
LABEL_7:
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke;
  v18[3] = &unk_264095F10;
  objc_copyWeak(&v19, &location);
  char v20 = v12;
  v13 = [v11 flatMap:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke_2;
  v16[3] = &unk_26408F4B8;
  objc_copyWeak(&v17, &location);
  v14 = [v13 recover:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

id __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (*(unsigned char *)(a1 + 40)) {
      [WeakRetained setHomeKitObject:v3];
    }
    v16 = @"dependentHomeKitObjects";
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v7 = [v5 homeKitObject];
    char v8 = [v6 setWithObject:v7];
    v17[0] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

    v10 = (void *)MEMORY[0x263F58190];
    v11 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    char v12 = [v10 futureWithResult:v11];
  }
  else
  {
    v13 = (void *)MEMORY[0x263F58190];
    v14 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    char v12 = [v13 futureWithError:v14];
  }
  return v12;
}

id __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to fetch HomeKit object with error: %@. Recovering and hiding update result.", buf, 0x16u);
  }
  v5 = (void *)MEMORY[0x263F58190];
  v11 = @"hidden";
  uint64_t v12 = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v7 = +[HFItemUpdateOutcome outcomeWithResults:v6];
  char v8 = [v5 futureWithResult:v7];

  return v8;
}

- (HFFetchedHomeKitObjectItem)initWithHomeKitObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFFetchedHomeKitObjectItem;
  uint64_t v6 = [(HFFetchedHomeKitObjectItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_homeKitObject, a3);
  }

  return v7;
}

- (id)_homeKitObjectFetch
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFFetchedHomeKitObjectItem.m", 71, @"%s is an abstract method that must be overriden by subclass %@", "-[HFFetchedHomeKitObjectItem _homeKitObjectFetch]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (void)setHomeKitObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end