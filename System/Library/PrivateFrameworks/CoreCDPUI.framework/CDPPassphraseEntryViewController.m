@interface CDPPassphraseEntryViewController
- (BOOL)showSimplePINCancelButtonOnLeft;
- (CDPPassphraseEntryViewController)init;
- (CGSize)preferredContentSize;
- (id)stringsBundle;
@end

@implementation CDPPassphraseEntryViewController

- (CDPPassphraseEntryViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CDPPassphraseEntryViewController;
  v2 = [(DevicePINController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(DevicePINController *)v2 setMode:3];
    [(DevicePINController *)v3 setShouldDismissWhenDone:0];
    v4 = [MEMORY[0x263F5FBC0] appearance];
    v5 = [MEMORY[0x263F825C8] labelColor];
    [v4 setTextColor:v5];

    v6 = [MEMORY[0x263F5FBC0] appearance];
    v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v6 setBackgroundColor:v7];
  }
  return v3;
}

- (id)stringsBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end