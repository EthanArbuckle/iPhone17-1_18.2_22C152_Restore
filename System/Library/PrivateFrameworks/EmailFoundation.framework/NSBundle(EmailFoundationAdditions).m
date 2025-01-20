@interface NSBundle(EmailFoundationAdditions)
- (id)ef_normalizedStringForLocale:()EmailFoundationAdditions;
- (id)ef_preferredLanguageIdentifier;
@end

@implementation NSBundle(EmailFoundationAdditions)

- (id)ef_preferredLanguageIdentifier
{
  v2 = [a1 preferredLocalizations];
  v3 = [v2 firstObject];
  v4 = objc_msgSend(a1, "ef_normalizedStringForLocale:", v3);

  return v4;
}

- (id)ef_normalizedStringForLocale:()EmailFoundationAdditions
{
  v0 = objc_msgSend(MEMORY[0x1E4F70FE8], "normalizedLanguageIDFromString:");
  return v0;
}

@end