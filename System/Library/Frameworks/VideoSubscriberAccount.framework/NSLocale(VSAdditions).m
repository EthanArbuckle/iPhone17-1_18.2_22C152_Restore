@interface NSLocale(VSAdditions)
+ (__CFString)vs_systemLanaguage;
@end

@implementation NSLocale(VSAdditions)

+ (__CFString)vs_systemLanaguage
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.UIKit"];
  if (!v0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unable to obtain system language bundle."];
LABEL_8:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The languageID parameter must not be nil."];
    v7 = 0;
    goto LABEL_9;
  }
  v1 = v0;
  v2 = (void *)MEMORY[0x1E4F28B50];
  v3 = [v0 localizations];
  v4 = [v2 preferredLocalizationsFromArray:v3 forPreferences:0];

  if ([v4 count])
  {
    v5 = (void *)MEMORY[0x1E4F1CA20];
    v6 = [v4 objectAtIndex:0];
    v7 = [v5 canonicalLanguageIdentifierFromString:v6];

    if ([(__CFString *)v7 isEqual:@"pt"])
    {

      v7 = @"pt-BR";
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"No preferred localizations in system language bundle."];
    v7 = 0;
  }

  if (!v7) {
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

@end