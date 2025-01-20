@interface DBIconImageCache
+ (id)_iconImageCache;
+ (id)_imageKeyForBundleIdentifier:(id)a3 inVehicle:(id)a4;
- (id)iconImageForBundleIdentifier:(id)a3 inVehicle:(id)a4;
- (void)setIconImage:(id)a3 forBundleIdentifier:(id)a4 inVehicle:(id)a5;
@end

@implementation DBIconImageCache

- (id)iconImageForBundleIdentifier:(id)a3 inVehicle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _imageKeyForBundleIdentifier:v6 inVehicle:v5];

  v8 = [(id)objc_opt_class() _iconImageCache];
  v9 = [v8 imageForKey:v7];

  return v9;
}

- (void)setIconImage:(id)a3 forBundleIdentifier:(id)a4 inVehicle:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    id v11 = [(id)objc_opt_class() _imageKeyForBundleIdentifier:v8 inVehicle:v7];

    v10 = [(id)objc_opt_class() _iconImageCache];
    [v10 setImage:v9 forKey:v11 withPersistenceOptions:1];
  }
}

+ (id)_iconImageCache
{
  if (_iconImageCache_onceToken != -1) {
    dispatch_once(&_iconImageCache_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)_iconImageCache___imageCache;
  return v2;
}

uint64_t __35__DBIconImageCache__iconImageCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:@"CarPlayIconCache"];
  uint64_t v1 = _iconImageCache___imageCache;
  _iconImageCache___imageCache = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_imageKeyForBundleIdentifier:(id)a3 inVehicle:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@", a3, a4];
}

@end