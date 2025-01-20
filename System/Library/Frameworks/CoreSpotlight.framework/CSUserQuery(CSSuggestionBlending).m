@interface CSUserQuery(CSSuggestionBlending)
@end

@implementation CSUserQuery(CSSuggestionBlending)

+ (void)trimSuggestions:()CSSuggestionBlending options:peopleSelectedScope:isShortQuery:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "CSUserQuery: trimmed suggestions %lu", v3, v4, v5, v6, 0);
}

+ (void)dedupedSuggestions:()CSSuggestionBlending queryContextScopeIsToPerson:options:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "CSUserQuery: deduped suggestions %lu", v3, v4, v5, v6, 0);
}

+ (void)computeEmailAddressTopicalityScore:()CSSuggestionBlending inputEmailAddress:queryUnigrams:locale:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Query string or email address is empty", v1, 2u);
}

+ (void)computeEmailAddressTopicalityScore:()CSSuggestionBlending inputEmailAddress:queryUnigrams:locale:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "Invalid email address since it does not have '@' character", v1, 2u);
}

+ (void)orderedSuggestions:()CSSuggestionBlending options:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2(&dword_18D0E3000, v1, v2, "CSUserQuery: ordered suggestions %lu", v3, v4, v5, v6, 0);
}

@end