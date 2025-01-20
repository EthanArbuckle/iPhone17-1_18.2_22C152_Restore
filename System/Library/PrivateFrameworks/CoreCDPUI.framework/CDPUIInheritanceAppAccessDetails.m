@interface CDPUIInheritanceAppAccessDetails
- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3;
- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3 accessString:(id)a4;
- (NSString)accessString;
- (NSString)appName;
- (NSString)bundleID;
- (UIImage)appIcon;
- (void)_prepareIcon;
- (void)setAccessString:(id)a3;
@end

@implementation CDPUIInheritanceAppAccessDetails

- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3
{
  return [(CDPUIInheritanceAppAccessDetails *)self initWithBundleID:a3 accessString:0];
}

- (CDPUIInheritanceAppAccessDetails)initWithBundleID:(id)a3 accessString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDPUIInheritanceAppAccessDetails;
  v8 = [(CDPUIInheritanceAppAccessDetails *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    accessString = v8->_accessString;
    v8->_accessString = (NSString *)v11;

    v13 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8->_bundleID allowPlaceholder:1 error:0];
    v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 localizedName];
      appName = v8->_appName;
      v8->_appName = (NSString *)v15;
    }
    [(CDPUIInheritanceAppAccessDetails *)v8 _prepareIcon];
  }
  return v8;
}

- (void)_prepareIcon
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:self->_bundleID];
  if (v3)
  {
    v4 = dispatch_get_global_queue(25, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __48__CDPUIInheritanceAppAccessDetails__prepareIcon__block_invoke;
    v5[3] = &unk_26433CC30;
    id v6 = v3;
    id v7 = self;
    dispatch_async(v4, v5);
  }
}

void __48__CDPUIInheritanceAppAccessDetails__prepareIcon__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 40.0, 40.0, v4);
  [v12 setShouldApplyMask:1];
  [v12 setShape:1];
  id v5 = (id)[*(id *)(a1 + 32) prepareImageForDescriptor:v12];
  id v6 = [*(id *)(a1 + 32) imageForDescriptor:v12];
  id v7 = (void *)MEMORY[0x263F827E8];
  uint64_t v8 = [v6 CGImage];
  [v6 scale];
  uint64_t v9 = objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v8, 0);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (NSString)accessString
{
  return self->_accessString;
}

- (void)setAccessString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessString, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end