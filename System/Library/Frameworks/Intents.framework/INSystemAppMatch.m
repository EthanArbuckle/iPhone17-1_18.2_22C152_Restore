@interface INSystemAppMatch
+ (id)matchWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5;
- (BOOL)appIsUnavailableOnCurrentPlatform;
- (INSystemAppMatch)initWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5;
- (NSString)iOSBundleIdentifier;
- (NSString)macOSBundleIdentifier;
- (NSString)watchOSBundleIdentifier;
@end

@implementation INSystemAppMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchOSBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_macOSBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_iOSBundleIdentifier, 0);
}

- (NSString)watchOSBundleIdentifier
{
  return self->_watchOSBundleIdentifier;
}

- (NSString)macOSBundleIdentifier
{
  return self->_macOSBundleIdentifier;
}

- (NSString)iOSBundleIdentifier
{
  return self->_iOSBundleIdentifier;
}

- (BOOL)appIsUnavailableOnCurrentPlatform
{
  v2 = [(INSystemAppMatch *)self bundleIdentifierForCurrentPlatform];
  BOOL v3 = v2 == 0;

  return v3;
}

- (INSystemAppMatch)initWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INSystemAppMatch;
  v11 = [(INSystemAppMatch *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    iOSBundleIdentifier = v11->_iOSBundleIdentifier;
    v11->_iOSBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    macOSBundleIdentifier = v11->_macOSBundleIdentifier;
    v11->_macOSBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    watchOSBundleIdentifier = v11->_watchOSBundleIdentifier;
    v11->_watchOSBundleIdentifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

+ (id)matchWithiOSBundleIdentifier:(id)a3 macOSBundleIdentifier:(id)a4 watchOSBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithiOSBundleIdentifier:v8 macOSBundleIdentifier:v9 watchOSBundleIdentifier:v10];

  return v11;
}

@end