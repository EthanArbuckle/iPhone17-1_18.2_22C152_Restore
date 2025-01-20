@interface AssistantDetailListController
+ (id)bundle;
- (AssistantDetailListController)init;
- (UIImage)checkmarkImage;
- (UIImage)transparentImage;
- (void)setChecked:(BOOL)a3 forSpecifier:(id)a4;
- (void)setCheckmarkImage:(id)a3;
- (void)setTransparentImage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantDetailListController

- (AssistantDetailListController)init
{
  v4.receiver = self;
  v4.super_class = (Class)AssistantDetailListController;
  v2 = [(AssistantDetailListController *)&v4 init];
  if (v2) {
    v2->_supportsMultilingualResponses = [MEMORY[0x263F28510] isMultilingualResponseVariantSelectorEnabled];
  }
  return v2;
}

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantLanguageBundle_0;
  if (!bundle_sAssistantLanguageBundle_0)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v4 = (void *)bundle_sAssistantLanguageBundle_0;
    bundle_sAssistantLanguageBundle_0 = v3;

    v2 = (void *)bundle_sAssistantLanguageBundle_0;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantDetailListController;
  [(AssistantDetailListController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AssistantDetailListController;
  [(AssistantDetailListController *)&v13 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri"];
  v5 = +[GMEligibilityProvider shared];
  int v6 = [v5 deviceSupported];

  if (v6) {
    v7 = @"Apple Intelligence & Siri";
  }
  else {
    v7 = @"Siri";
  }
  id v8 = objc_alloc(MEMORY[0x263F08DB0]);
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 bundleURL];
  v12 = (void *)[v8 initWithKey:v7 table:0 locale:v9 bundleURL:v11];

  [(AssistantDetailListController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v12 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
}

- (void)setChecked:(BOOL)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v12 = [v6 propertyForKey:*MEMORY[0x263F602B0]];
  v7 = [v12 imageView];
  if (a3)
  {
    id v8 = [(AssistantDetailListController *)self checkmarkImage];
    [v7 setImage:v8];

    [(AssistantDetailListController *)self checkmarkImage];
  }
  else
  {
    v9 = [(AssistantDetailListController *)self transparentImage];
    [v7 setImage:v9];

    [(AssistantDetailListController *)self transparentImage];
  v10 = };
  [v6 setProperty:v10 forKey:*MEMORY[0x263F60140]];

  checkedSpecifier = self->_checkedSpecifier;
  self->_checkedSpecifier = (PSSpecifier *)v6;
}

- (UIImage)checkmarkImage
{
  checkmarkImage = self->_checkmarkImage;
  if (!checkmarkImage)
  {
    objc_super v4 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    v5 = [v4 fontDescriptorWithSymbolicTraits:2];

    id v6 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];
    v7 = [MEMORY[0x263F82818] configurationWithFont:v6 scale:2];
    id v8 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark" withConfiguration:v7];
    v9 = self->_checkmarkImage;
    self->_checkmarkImage = v8;

    checkmarkImage = self->_checkmarkImage;
  }

  return checkmarkImage;
}

- (UIImage)transparentImage
{
  transparentImage = self->_transparentImage;
  if (!transparentImage)
  {
    objc_super v4 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    v5 = [v4 fontDescriptorWithSymbolicTraits:2];

    id v6 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];
    v7 = [MEMORY[0x263F82818] configurationWithFont:v6 scale:2];
    id v8 = (void *)MEMORY[0x263F82818];
    v9 = [MEMORY[0x263F825C8] clearColor];
    v10 = [v8 configurationWithHierarchicalColor:v9];

    v11 = [v7 configurationByApplyingConfiguration:v10];
    id v12 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark" withConfiguration:v11];
    objc_super v13 = self->_transparentImage;
    self->_transparentImage = v12;

    transparentImage = self->_transparentImage;
  }

  return transparentImage;
}

- (void)setCheckmarkImage:(id)a3
{
}

- (void)setTransparentImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparentImage, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);
  objc_storeStrong((id *)&self->_checkedSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);

  objc_storeStrong((id *)&self->_previousSelectedSpecifier, 0);
}

@end