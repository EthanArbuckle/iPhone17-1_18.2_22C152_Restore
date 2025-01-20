@interface _MUISearchResultsSuggesterDocumentsConfiguration
+ (OS_os_log)log;
+ (id)documentTypeFilterQuery;
- (NSArray)categories;
- (NSArray)fetchAttributes;
- (NSString)logIdentifier;
- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5;
- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4;
- (unint64_t)maxItemCount;
@end

@implementation _MUISearchResultsSuggesterDocumentsConfiguration

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___MUISearchResultsSuggesterDocumentsConfiguration_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;
  return (OS_os_log *)v2;
}

- (NSArray)categories
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[MUISearchSuggestionCategory documentCategory];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (id)documentTypeFilterQuery
{
  self;
  if (documentTypeFilterQuery_onceToken != -1) {
    dispatch_once(&documentTypeFilterQuery_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)documentTypeFilterQuery_documentQueryString;
  return v0;
}

- (NSString)logIdentifier
{
  return (NSString *)@"Documents";
}

- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4
{
  id v5 = a4;
  v6 = [a3 phrase];
  v7 = NSString;
  v8 = +[MUISearchResultsSuggester dateQueryString];
  v9 = +[_MUISearchResultsSuggesterDocumentsConfiguration documentTypeFilterQuery]();
  v10 = [v7 stringWithFormat:@"(%@) && (%@) && (%@)", @"(kMDItemAccountIdentifier = '*') && (kMDItemRelatedUniqueIdentifier = '*') && (kMDItemContentURL = '*')", v8, v9];

  if ([v6 length])
  {
    uint64_t v11 = [NSString stringWithFormat:@"(%@) && ((kMDItemDisplayName = '%@*'cdw) || (kMDItemTextContent = '%@*'cdw))", v10, v6, v6];

    v10 = (void *)v11;
  }
  if ([v5 length])
  {
    uint64_t v12 = [v10 stringByAppendingFormat:@" && (%@)", v5];

    v10 = (void *)v12;
  }

  return v10;
}

- (NSArray)fetchAttributes
{
  if (fetchAttributes_onceToken != -1) {
    dispatch_once(&fetchAttributes_onceToken, &__block_literal_global_36_0);
  }
  v2 = (void *)fetchAttributes_fetchAttributes;
  return (NSArray *)v2;
}

- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5
{
  id v6 = a5;
  v7 = +[MUISearchResultsSuggester suggestionResultsSortedByDate:a3];
  v8 = objc_msgSend(v7, "ef_prefix:", 3);

  v9 = objc_msgSend(v8, "ef_prefix:", 3);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104___MUISearchResultsSuggesterDocumentsConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke;
  v13[3] = &unk_1E6D13320;
  id v14 = v6;
  id v10 = v6;
  uint64_t v11 = objc_msgSend(v9, "ef_compactMap:", v13);

  return v11;
}

- (unint64_t)maxItemCount
{
  return 3;
}

@end