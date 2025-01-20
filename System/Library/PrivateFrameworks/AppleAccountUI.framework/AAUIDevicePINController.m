@interface AAUIDevicePINController
- (BOOL)_asyncSetPinCompatible;
- (id)pinInstructionsPrompt;
- (id)stringsBundle;
- (id)title;
@end

@implementation AAUIDevicePINController

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (id)title
{
  if ([(DevicePINController *)self mode])
  {
    v6.receiver = self;
    v6.super_class = (Class)AAUIDevicePINController;
    uint64_t v3 = [(DevicePINController *)&v6 title];
  }
  else
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v4 localizedStringForKey:@"CREATE_PASSCODE_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  }
  return v3;
}

- (id)pinInstructionsPrompt
{
  if ([(DevicePINController *)self mode]
    || *(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD38]) != 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)AAUIDevicePINController;
    v5 = [(DevicePINController *)&v7 pinInstructionsPrompt];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CREATE_PASSCODE_BODY_UPGRADE"];
    v5 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
  }
  return v5;
}

- (BOOL)_asyncSetPinCompatible
{
  return 1;
}

@end