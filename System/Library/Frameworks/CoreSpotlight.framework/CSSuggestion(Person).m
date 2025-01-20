@interface CSSuggestion(Person)
- (void)updateLocalizedAttributedStringForPersonSuggestion;
@end

@implementation CSSuggestion(Person)

- (void)updateLocalizedAttributedStringForPersonSuggestion
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "CSUserQuery: Didn't update suggestion localizedAttributedString since                         updated displayText %@ was nil or same as current suggestion's displayText", (uint8_t *)&v2, 0xCu);
}

@end