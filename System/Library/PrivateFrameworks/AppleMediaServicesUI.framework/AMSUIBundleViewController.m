@interface AMSUIBundleViewController
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (AMSUIBundleViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6;
- (NSString)placement;
- (NSString)serviceType;
- (id)account;
- (void)setAccount:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation AMSUIBundleViewController

- (AMSUIBundleViewController)initWithServiceType:(id)a3 placement:(id)a4 account:(id)a5 bag:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = [v9 URLForKey:@"bundleDynamicUIUrl"];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBundleViewController;
  v11 = [(AMSUIDynamicViewController *)&v13 initWithBag:v9 bagValue:v10];

  if (v11) {
    [(AMSUIBundleViewController *)v11 setAccount:v8];
  }

  return v11;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  [v2 addBagKey:@"bundleDynamicUIUrl" valueType:5 defaultValue:@"bundle"];
  v3 = +[AMSUIDynamicViewController bagKeySet];
  [v2 unionBagKeySet:v3];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"AMSUIBundle";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

- (id)account
{
  return self->account;
}

- (void)setAccount:(id)a3
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
  objc_storeStrong((id *)&self->account, 0);
}

@end