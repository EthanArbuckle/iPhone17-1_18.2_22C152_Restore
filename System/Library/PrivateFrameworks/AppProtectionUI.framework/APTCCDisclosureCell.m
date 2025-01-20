@interface APTCCDisclosureCell
- (APTCCDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureForRecord:(id)a3;
- (void)prepareForReuse;
- (void)updateConfigurationWithPreparedIconImage:(id)a3;
@end

@implementation APTCCDisclosureCell

- (APTCCDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)APTCCDisclosureCell;
  v4 = [(APTCCDisclosureCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_1];
    [(APTCCDisclosureCell *)v4 setBackgroundColor:v5];
  }
  return v4;
}

id __53__APTCCDisclosureCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  }

  return v2;
}

- (void)updateConfigurationWithPreparedIconImage:(id)a3
{
  v4 = (void *)MEMORY[0x263F82918];
  id v5 = a3;
  id v10 = [v4 cellConfiguration];
  [v10 setText:self->_appName];
  v6 = (void *)MEMORY[0x263F827E8];
  uint64_t v7 = [v5 CGImage];

  v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  v9 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v7, 0);
  [v10 setImage:v9];

  [(APTCCDisclosureCell *)self setContentConfiguration:v10];
}

- (void)configureForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  char v6 = [v5 isEqualToString:self->_bundleID];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v4 bundleIdentifier];
    bundleID = self->_bundleID;
    self->_bundleID = v7;

    v9 = [v4 localizedName];
    appName = self->_appName;
    self->_appName = v9;

    v11 = [MEMORY[0x263F82918] cellConfiguration];
    [v11 setText:self->_appName];
    v12 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:self->_bundleID];
    v13 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B5A0]];
    v14 = [v12 imageForDescriptor:v13];
    if ([v14 placeholder])
    {
      v15 = self->_bundleID;
      v16 = APUIImageIOQueue();
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __42__APTCCDisclosureCell_configureForRecord___block_invoke;
      v25 = &unk_26522DA48;
      id v26 = v12;
      id v27 = v13;
      v28 = self;
      v29 = v15;
      v17 = v15;
      dispatch_async(v16, &v22);
    }
    v18 = (void *)MEMORY[0x263F827E8];
    uint64_t v19 = objc_msgSend(v14, "CGImage", v22, v23, v24, v25);
    v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 scale];
    v21 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
    [v11 setImage:v21];

    [(APTCCDisclosureCell *)self setContentConfiguration:v11];
  }
}

void __42__APTCCDisclosureCell_configureForRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prepareImageForDescriptor:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__APTCCDisclosureCell_configureForRecord___block_invoke_2;
  block[3] = &unk_26522DA20;
  v3 = *(void **)(a1 + 56);
  block[4] = *(void *)(a1 + 48);
  id v6 = v3;
  id v7 = v2;
  id v4 = v2;
  dispatch_sync(MEMORY[0x263EF83A0], block);
}

uint64_t __42__APTCCDisclosureCell_configureForRecord___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 1016) isEqual:a1[5]];
  if (result)
  {
    v3 = (void *)a1[4];
    uint64_t v4 = a1[6];
    return [v3 updateConfigurationWithPreparedIconImage:v4];
  }
  return result;
}

- (void)prepareForReuse
{
  bundleID = self->_bundleID;
  self->_bundleID = 0;

  appName = self->_appName;
  self->_appName = 0;

  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = 0;

  v6.receiver = self;
  v6.super_class = (Class)APTCCDisclosureCell;
  [(APTCCDisclosureCell *)&v6 prepareForReuse];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end