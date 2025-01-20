@interface MUISearchResultsSuggesterRichLinksConfiguration
@end

@implementation MUISearchResultsSuggesterRichLinksConfiguration

void __55___MUISearchResultsSuggesterRichLinksConfiguration_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;
}

void __67___MUISearchResultsSuggesterRichLinksConfiguration_fetchAttributes__block_invoke()
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v0 = +[MUISearchResultsSuggester dateAttributes];
  os_log_t v1 = [MEMORY[0x1E4F60C60] idAttributeKey];
  v2 = objc_msgSend(MEMORY[0x1E4F60C60], "titleAttributeKey", v1);
  v8[1] = v2;
  id v3 = [MEMORY[0x1E4F60C60] urlAttributeKey];
  uint64_t v4 = *MEMORY[0x1E4F22B30];
  v8[2] = v3;
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E4F22B18];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  uint64_t v6 = [v0 arrayByAddingObjectsFromArray:v5];
  v7 = (void *)fetchAttributes_fetchAttributes_0;
  fetchAttributes_fetchAttributes_0 = v6;
}

void __104___MUISearchResultsSuggesterRichLinksConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [v6 searchableItem];
  v8 = [v7 attributeSet];
  v9 = [MEMORY[0x1E4F60C60] idAttributeKey];
  v10 = [v8 attributeForKey:v9];

  if (v10 && ([*(id *)(*(void *)(a1[5] + 8) + 40) containsObject:v10] & 1) == 0)
  {
    v27 = a4;
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v10];
    v28 = [v6 objectID];
    id v11 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v12 = [v7 attributeSet];
    v13 = [MEMORY[0x1E4F60C60] urlAttributeKey];
    v14 = [v12 attributeForKey:v13];
    v29 = (void *)[v11 initWithString:v14];

    v15 = [v7 attributeSet];
    v16 = [MEMORY[0x1E4F60C60] titleAttributeKey];
    v31 = [v15 attributeForKey:v16];

    v17 = [v7 attributeSet];
    v18 = [v17 relatedUniqueIdentifier];

    v19 = [v7 attributeSet];
    v30 = [v19 attributeForKey:*MEMORY[0x1E4F22B30]];

    v20 = [v7 attributeSet];
    v21 = [v20 attributeForKey:*MEMORY[0x1E4F22B18]];

    v22 = +[_MUISearchResultsSuggesterRichLinksConfiguration log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v7 attributeSet];
      v24 = [v23 relatedUniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v10;
      __int16 v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_1DDCDB000, v22, OS_LOG_TYPE_DEFAULT, "Creating rich link suggestion messageID: %@, richLinkID: %@ URL: %@", buf, 0x20u);
    }
    v25 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v26 = +[MUILinkSuggestion suggestionWithURL:title:richLinkID:authors:authorEmailAddresses:objectID:messageID:messageList:](MUILinkSuggestion, "suggestionWithURL:title:richLinkID:authors:authorEmailAddresses:objectID:messageID:messageList:", v18, a1[4]);
    [v25 addObject:v26];

    if ((unint64_t)[*(id *)(*(void *)(a1[6] + 8) + 40) count] >= 4) {
      unsigned char *v27 = 1;
    }
  }
}

@end