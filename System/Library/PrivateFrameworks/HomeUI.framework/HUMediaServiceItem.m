@interface HUMediaServiceItem
- (HMHome)home;
- (HUMediaServiceItem)init;
- (HUMediaServiceItem)initWithMediaService:(id)a3 home:(id)a4;
- (MediaService)mediaService;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMediaService:(id)a3;
@end

@implementation HUMediaServiceItem

- (HUMediaServiceItem)initWithMediaService:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUMediaServiceItem;
  v9 = [(HUMediaServiceItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaService, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (HUMediaServiceItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaService_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaServiceItem.m", 38, @"%s is unavailable; use %@ instead",
    "-[HUMediaServiceItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F692B8], "sharedManager", a3);
  v5 = [(HUMediaServiceItem *)self home];
  v6 = [v4 mediaServicesForHome:v5];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__HUMediaServiceItem__subclass_updateWithOptions___block_invoke;
  v23[3] = &unk_1E638B6F0;
  v23[4] = self;
  id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v23);
  if (v7) {
    [(HUMediaServiceItem *)self setMediaService:v7];
  }
  id v8 = objc_opt_new();
  v9 = [(HUMediaServiceItem *)self mediaService];
  v10 = [v9 serviceName];
  v11 = (void *)[v10 copy];
  objc_msgSend(v8, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68AB8]);

  objc_super v12 = [MEMORY[0x1E4F692B8] sharedManager];
  v13 = [(HUMediaServiceItem *)self home];
  v14 = [v12 defaultMediaServiceForHome:v13];

  v15 = NSNumber;
  v16 = [(HUMediaServiceItem *)self mediaService];
  v17 = [v16 bundleIdentifier];
  v18 = [v14 bundleIdentifier];
  v19 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v17, "isEqualToString:", v18));
  objc_msgSend(v8, "na_safeSetObject:forKey:", v19, *MEMORY[0x1E4F68B40]);

  objc_msgSend(v8, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F68A70]);
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F692F0]) initWithResults:v8];
  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v20];

  return v21;
}

uint64_t __50__HUMediaServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 mediaService];
  v5 = [v4 bundleIdentifier];
  v6 = [v3 bundleIdentifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUMediaServiceItem *)self mediaService];
  v6 = [(HUMediaServiceItem *)self home];
  uint64_t v7 = (void *)[v4 initWithMediaService:v5 home:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (MediaService)mediaService
{
  return self->_mediaService;
}

- (void)setMediaService:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_mediaService, 0);
}

@end