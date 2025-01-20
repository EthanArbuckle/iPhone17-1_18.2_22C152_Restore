@interface AMSUIMarketingItemViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSUIMarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4;
- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5;
- (NSDictionary)contextInfo;
- (NSString)offerHints;
- (NSString)placement;
- (NSString)seed;
- (NSString)serviceType;
- (void)_setInternalClientOptionsValue:(id)a3 forKey:(id)a4;
- (void)setContextInfo:(id)a3;
- (void)setOfferHints:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setSeed:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation AMSUIMarketingItemViewController

- (AMSUIMarketingItemViewController)initWithMarketingItem:(id)a3 bag:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 URLForKey:@"marketingItemDynamicUIUrl"];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIMarketingItemViewController;
  v9 = [(AMSUIDynamicViewController *)&v13 initWithBag:v7 bagValue:v8];

  if (v9)
  {
    v14 = @"marketingItem";
    v10 = [v6 rawValues];
    v15[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [(AMSUIDynamicViewController *)v9 setInternalClientOptions:v11];
  }
  return v9;
}

- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5
{
  v17[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 URLForKey:@"marketingItemDynamicUIUrl"];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIMarketingItemViewController;
  v12 = [(AMSUIDynamicViewController *)&v15 initWithBag:v10 bagValue:v11];

  if (v12)
  {
    v16[0] = @"serviceType";
    v16[1] = @"placement";
    v17[0] = v8;
    v17[1] = v9;
    objc_super v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [(AMSUIDynamicViewController *)v12 setInternalClientOptions:v13];
  }
  return v12;
}

- (NSString)offerHints
{
  v2 = [(AMSUIDynamicViewController *)self internalClientOptions];
  v3 = [v2 objectForKeyedSubscript:@"offerHints"];

  return (NSString *)v3;
}

- (NSString)seed
{
  v2 = [(AMSUIDynamicViewController *)self internalClientOptions];
  v3 = [v2 objectForKeyedSubscript:@"seed"];

  return (NSString *)v3;
}

- (void)setOfferHints:(id)a3
{
}

- (void)setSeed:(id)a3
{
}

- (void)_setInternalClientOptionsValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSUIDynamicViewController *)self internalClientOptions];
  id v9 = (id)[v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  [(AMSUIDynamicViewController *)self setInternalClientOptions:v9];
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  [v2 addBagKey:@"marketingItemDynamicUIUrl" valueType:5 defaultValue:@"https://amsui.apple.com/dynamic/marketing#route=marketingItem"];
  v3 = +[AMSUIDynamicViewController bagKeySet];
  [v2 unionBagKeySet:v3];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIMarketingItem";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = (void *)MEMORY[0x263F27B40];
  v3 = [(id)objc_opt_class() bagKeySet];
  v4 = [(id)objc_opt_class() bagSubProfile];
  v5 = [(id)objc_opt_class() bagSubProfileVersion];
  [v2 registerBagKeySet:v3 forProfile:v4 profileVersion:v5];

  id v6 = (void *)MEMORY[0x263F27B28];
  id v7 = [(id)objc_opt_class() bagSubProfile];
  id v8 = [(id)objc_opt_class() bagSubProfileVersion];
  id v9 = [v6 bagForProfile:v7 profileVersion:v8];

  return v9;
}

- (AMSUIMarketingItemViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v10 = a5;
  v11 = [(AMSUIMarketingItemViewController *)self initWithServiceType:a3 placement:a4 bag:a6];
  v12 = v11;
  if (v11) {
    [(AMSUIDynamicViewController *)v11 setAccount:v10];
  }

  return v12;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
}

@end