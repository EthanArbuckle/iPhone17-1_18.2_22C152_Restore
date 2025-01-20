@interface LSApplicationRecord(PSAdditions)
- (uint64_t)au_supportsJournalingSuggestions;
@end

@implementation LSApplicationRecord(PSAdditions)

- (uint64_t)au_supportsJournalingSuggestions
{
  uint64_t result = objc_opt_class();
  if (result)
  {
    v3 = [MEMORY[0x263F565C8] sharedInstance];
    v4 = [a1 bundleIdentifier];
    uint64_t v5 = [v3 isJournalingSuggestionsAvailableForBundleIdentifier:v4];

    return v5;
  }
  return result;
}

@end