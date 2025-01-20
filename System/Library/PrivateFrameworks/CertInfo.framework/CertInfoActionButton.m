@interface CertInfoActionButton
@end

@implementation CertInfoActionButton

void __53___CertInfoActionButton_initWithTitle_isDestructive___block_invoke()
{
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v0 = [MEMORY[0x263F1C6B0] imageNamed:@"InstallButton" inBundle:v12];
  uint64_t v1 = [v0 stretchableImageWithLeftCapWidth:3 topCapHeight:0];
  v2 = (void *)_installButtonImage;
  _installButtonImage = v1;

  v3 = [MEMORY[0x263F1C6B0] imageNamed:@"InstallButtonPressed" inBundle:v12];
  uint64_t v4 = [v3 stretchableImageWithLeftCapWidth:3 topCapHeight:0];
  v5 = (void *)_installButtonPressedImage;
  _installButtonPressedImage = v4;

  v6 = [MEMORY[0x263F1C6B0] imageNamed:@"RemoveButton" inBundle:v12];
  uint64_t v7 = [v6 stretchableImageWithLeftCapWidth:3 topCapHeight:0];
  v8 = (void *)_removeButtonImage;
  _removeButtonImage = v7;

  v9 = [MEMORY[0x263F1C6B0] imageNamed:@"RemoveButtonPressed" inBundle:v12];
  uint64_t v10 = [v9 stretchableImageWithLeftCapWidth:3 topCapHeight:0];
  v11 = (void *)_removeButtonPressedImage;
  _removeButtonPressedImage = v10;
}

@end