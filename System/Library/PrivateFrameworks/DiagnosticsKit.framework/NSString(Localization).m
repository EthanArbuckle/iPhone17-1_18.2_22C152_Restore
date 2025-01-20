@interface NSString(Localization)
- (id)localizedString;
@end

@implementation NSString(Localization)

- (id)localizedString
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.DiagnosticsKit"];
  v3 = [v2 localizedStringForKey:a1 value:&stru_26F0D5118 table:0];

  return v3;
}

@end