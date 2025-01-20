@interface CPUITableCellAccessory
+ (id)accessoryWithActivityIndicator;
+ (id)accessoryWithCloudIcon;
+ (id)accessoryWithDisclosureIndicator;
+ (id)accessoryWithImage:(id)a3;
+ (id)accessoryWithiCloudIcon;
- (UIImage)image;
- (void)setImage:(id)a3;
@end

@implementation CPUITableCellAccessory

+ (id)accessoryWithCloudIcon
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CPUITableCellAccessory_accessoryWithCloudIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithCloudIcon_onceToken != -1) {
    dispatch_once(&accessoryWithCloudIcon_onceToken, block);
  }
  v2 = (void *)accessoryWithCloudIcon__accessory;
  return v2;
}

uint64_t __48__CPUITableCellAccessory_accessoryWithCloudIcon__block_invoke()
{
  accessoryWithCloudIcon__accessory = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)accessoryWithiCloudIcon
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CPUITableCellAccessory_accessoryWithiCloudIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithiCloudIcon_onceToken != -1) {
    dispatch_once(&accessoryWithiCloudIcon_onceToken, block);
  }
  v2 = (void *)accessoryWithiCloudIcon__accessory;
  return v2;
}

uint64_t __49__CPUITableCellAccessory_accessoryWithiCloudIcon__block_invoke()
{
  accessoryWithiCloudIcon__accessory = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)accessoryWithDisclosureIndicator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPUITableCellAccessory_accessoryWithDisclosureIndicator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithDisclosureIndicator_onceToken != -1) {
    dispatch_once(&accessoryWithDisclosureIndicator_onceToken, block);
  }
  v2 = (void *)accessoryWithDisclosureIndicator__accessory;
  return v2;
}

uint64_t __58__CPUITableCellAccessory_accessoryWithDisclosureIndicator__block_invoke()
{
  accessoryWithDisclosureIndicator__accessory = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)accessoryWithActivityIndicator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CPUITableCellAccessory_accessoryWithActivityIndicator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accessoryWithActivityIndicator_onceToken != -1) {
    dispatch_once(&accessoryWithActivityIndicator_onceToken, block);
  }
  v2 = (void *)accessoryWithActivityIndicator__accessory;
  return v2;
}

uint64_t __56__CPUITableCellAccessory_accessoryWithActivityIndicator__block_invoke()
{
  accessoryWithActivityIndicator__accessory = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)accessoryWithImage:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setImage:v3];

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end