@interface _ASPasskeysLearnMoreContentViewController
- (_ASPasskeysLearnMoreContentViewController)init;
- (id)_contentBodyAttributedString;
- (id)_passkeySymbolHeaderImage;
- (void)_setUpContentBodyText;
- (void)viewDidLoad;
@end

@implementation _ASPasskeysLearnMoreContentViewController

- (_ASPasskeysLearnMoreContentViewController)init
{
  v3 = +[_ASPasskeysLearnMoreContent titleString];
  v4 = +[_ASPasskeysLearnMoreContent subtitleString];
  v7.receiver = self;
  v7.super_class = (Class)_ASPasskeysLearnMoreContentViewController;
  v5 = [(_ASPasskeysLearnMoreContentViewController *)&v7 initWithTitle:v3 detailText:v4 symbolName:0];

  return v5;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_ASPasskeysLearnMoreContentViewController;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  [(_ASPasskeysLearnMoreContentViewController *)self _setUpContentBodyText];
  v3 = [(_ASPasskeysLearnMoreContentViewController *)self headerView];
  v4 = [(_ASPasskeysLearnMoreContentViewController *)self _passkeySymbolHeaderImage];
  [v3 setIcon:v4 accessibilityLabel:0];
}

- (id)_passkeySymbolHeaderImage
{
  v2 = [MEMORY[0x263F82818] configurationWithScale:3];
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] tintColor];
  objc_super v5 = [v3 configurationWithHierarchicalColor:v4];

  v6 = [v5 configurationByApplyingConfiguration:v2];
  objc_super v7 = (void *)MEMORY[0x263F827E8];
  v8 = +[_ASPasskeysLearnMoreContent systemImageName];
  v9 = [v7 systemImageNamed:v8 withConfiguration:v6];

  return v9;
}

- (void)_setUpContentBodyText
{
  v23[4] = *MEMORY[0x263EF8340];
  v3 = [(_ASPasskeysLearnMoreContentViewController *)self contentView];
  id v4 = objc_alloc_init(MEMORY[0x263F828E0]);
  objc_super v5 = [(_ASPasskeysLearnMoreContentViewController *)self _contentBodyAttributedString];
  [v4 setAttributedText:v5];

  v6 = (void *)MEMORY[0x263F82760];
  objc_super v7 = [MEMORY[0x263F82768] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
  v8 = [v6 fontWithDescriptor:v7 size:0.0];
  [v4 setFont:v8];

  [v4 setAdjustsFontForContentSizeCategory:1];
  [v4 setNumberOfLines:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v4];
  v17 = (void *)MEMORY[0x263F08938];
  v22 = [v4 topAnchor];
  v21 = [v3 topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [v4 bottomAnchor];
  v18 = [v3 bottomAnchor];
  v9 = [v19 constraintEqualToAnchor:v18];
  v23[1] = v9;
  v10 = [v4 leadingAnchor];
  v11 = [v3 leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  v13 = [v4 trailingAnchor];
  v14 = [v3 trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v23[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v17 activateConstraints:v16];
}

- (id)_contentBodyAttributedString
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
  v3 = [MEMORY[0x263F82818] configurationWithScale:-1];
  id v4 = [v2 imageWithConfiguration:v3];
  objc_super v5 = [v4 imageWithRenderingMode:2];

  v6 = [MEMORY[0x263F825C8] tintColor];
  objc_super v7 = [v5 imageWithTintColor:v6 renderingMode:2];

  v8 = [MEMORY[0x263F82380] textAttachmentWithImage:v7];
  v9 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
  id v10 = objc_alloc(MEMORY[0x263F089B8]);
  v11 = +[_ASPasskeysLearnMoreContent bodyString];
  v12 = (void *)[v10 initWithString:v11];

  v15 = @"{square.and.arrow.up}";
  v16[0] = v9;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_msgSend(v12, "safari_replaceCharactersWithStringBindings:", v13);

  return v12;
}

@end