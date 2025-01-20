@interface _MUISearchResultsSuggesterRichLinksConfiguration
+ (OS_os_log)log;
- (NSArray)categories;
- (NSArray)fetchAttributes;
- (NSString)logIdentifier;
- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5;
- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4;
- (unint64_t)maxItemCount;
@end

@implementation _MUISearchResultsSuggesterRichLinksConfiguration

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___MUISearchResultsSuggesterRichLinksConfiguration_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1) {
    dispatch_once(&log_onceToken_12, block);
  }
  v2 = (void *)log_log_12;
  return (OS_os_log *)v2;
}

- (NSArray)categories
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[MUISearchSuggestionCategory linkCategory];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (NSString)logIdentifier
{
  return (NSString *)@"Links";
}

- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4
{
  id v5 = a4;
  v6 = [a3 phrase];
  if ([v6 length])
  {
    v7 = [NSString stringWithFormat:@"'%@*'cdw", v6];
  }
  else
  {
    v7 = @"'*'";
  }
  v8 = NSString;
  v9 = [MEMORY[0x1E4F60C60] idAttributeKey];
  v10 = [v8 stringWithFormat:@"(%@ = %@)", v9, v7];

  v11 = NSString;
  v12 = +[MUISearchResultsSuggester dateQueryString];
  v13 = [v11 stringWithFormat:@"(%@) && (%@)", v10, v12];

  if ([v5 length])
  {
    uint64_t v14 = [v13 stringByAppendingFormat:@" && (%@)", v5];

    v13 = (void *)v14;
  }

  return v13;
}

- (NSArray)fetchAttributes
{
  if (fetchAttributes_onceToken_0 != -1) {
    dispatch_once(&fetchAttributes_onceToken_0, &__block_literal_global_33);
  }
  v2 = (void *)fetchAttributes_fetchAttributes_0;
  return (NSArray *)v2;
}

- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[MUISearchResultsSuggester suggestionResultsSortedByDate:v7];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__4;
  v24[4] = __Block_byref_object_dispose__4;
  id v25 = (id)0xAAAAAAAAAAAAAAAALL;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104___MUISearchResultsSuggesterRichLinksConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke;
  v14[3] = &unk_1E6D13550;
  v16 = v24;
  v17 = &v18;
  id v11 = v9;
  id v15 = v11;
  [v10 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (unint64_t)maxItemCount
{
  return 4;
}

@end