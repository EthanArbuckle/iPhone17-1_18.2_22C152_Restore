@interface CNEnvironment
@end

@implementation CNEnvironment

CNAPeopleSuggesterFacade *__46__CNEnvironment_Autocomplete__peopleSuggester__block_invoke()
{
  return +[CNAPeopleSuggesterProxy bestAvailableProxy];
}

CNACDPeopleSuggesterFacade *__48__CNEnvironment_Autocomplete__cdPeopleSuggester__block_invoke()
{
  return +[CNACDPeopleSuggesterProxy bestAvailableProxy];
}

id __60__CNEnvironment_Autocomplete__suggestedResultPrioritization__block_invoke()
{
  return +[CNAutocompleteSuggestedResultPrioritizer bestAvailablePrioritizer];
}

CNACTStewieFacade *__37__CNEnvironment_Autocomplete__stewie__block_invoke()
{
  v0 = objc_alloc_init(CNACTStewieFacade);
  [(CNACTStewieFacade *)v0 startMonitoring];
  return v0;
}

uint64_t __51__CNEnvironment_Autocomplete__dataAccessConnection__block_invoke()
{
  return [MEMORY[0x1E4F5E950] sharedConnection];
}

@end