@interface MUISearchResultsSuggesterDocumentsConfiguration
@end

@implementation MUISearchResultsSuggesterDocumentsConfiguration

void __55___MUISearchResultsSuggesterDocumentsConfiguration_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke()
{
  v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F44480];
  v14[0] = *MEMORY[0x1E4F44450];
  v14[1] = v0;
  v14[2] = *MEMORY[0x1E4F444D0];
  os_log_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_2;
  v12[3] = &unk_1E6D132D0;
  id v3 = v2;
  id v13 = v3;
  [v1 enumerateObjectsUsingBlock:v12];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_3;
  v10 = &unk_1E6D132F8;
  id v11 = v3;
  id v4 = v3;
  [&unk_1F39E1E48 enumerateObjectsUsingBlock:&v7];
  uint64_t v5 = objc_msgSend(v4, "componentsJoinedByString:", @" || ", v7, v8, v9, v10);
  v6 = (void *)documentTypeFilterQuery_documentQueryString;
  documentTypeFilterQuery_documentQueryString = v5;
}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v5 = [a2 identifier];
  id v4 = [v3 stringWithFormat:@"(kMDItemContentTypeTree = '%@*')", v5];
  [v2 addObject:v4];
}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"(kMDItemContentTypeTree = '%@*')", a2];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __67___MUISearchResultsSuggesterDocumentsConfiguration_fetchAttributes__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[MUISearchResultsSuggester dateAttributes];
  uint64_t v1 = *MEMORY[0x1E4F22CE8];
  v6[0] = *MEMORY[0x1E4F22C70];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F22B18];
  v6[2] = *MEMORY[0x1E4F22B30];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E4F235C0];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 arrayByAddingObjectsFromArray:v3];
  id v5 = (void *)fetchAttributes_fetchAttributes;
  fetchAttributes_fetchAttributes = v4;
}

id __104___MUISearchResultsSuggesterDocumentsConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v36 = [v3 searchableItem];
  uint64_t v4 = [v36 attributeSet];
  id v5 = [v4 displayName];
  v6 = [v5 lastPathComponent];
  uint64_t v7 = [v6 stringByDeletingPathExtension];

  uint64_t v8 = +[MUISearchResultsSuggester dateForSuggestionResult:v3];
  uint64_t v9 = [v4 subject];
  v10 = (void *)v9;
  id v11 = &stru_1F39CB5D8;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = [v4 contentURL];
  v14 = +[_MUISearchResultsSuggesterDocumentsConfiguration log];
  v15 = v14;
  if (v13)
  {
    v32 = v12;
    v34 = v8;
    v16 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v3 searchableItem];
      [v17 uniqueIdentifier];
      v18 = uint64_t v31 = a1;
      v19 = [v4 userSharedReceivedDate];
      v20 = [v19 firstObject];
      v21 = [v4 subject];
      *(_DWORD *)buf = 138413314;
      v38 = v18;
      __int16 v39 = 2112;
      v40 = v13;
      __int16 v41 = 2112;
      v42 = v16;
      __int16 v43 = 2112;
      v44 = v20;
      __int16 v45 = 2112;
      v46 = v21;
      _os_log_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_DEFAULT, "Creating Document suggestion ID: %@ fileURL: %@ name: %@ date: %@ subject: %@", buf, 0x34u);

      a1 = v31;
    }

    v15 = [v4 authorNames];
    v22 = [v4 authorEmailAddresses];
    [v3 objectID];
    v24 = id v23 = v3;
    uint64_t v7 = v16;
    v25 = v16;
    v12 = v32;
    uint64_t v8 = v34;
    v26 = +[MUIDocumentSuggestion suggestionWithFileURL:v13 name:v25 date:v34 subject:v32 authors:v15 authorEmailAddresses:v22 objectID:v24 messageList:*(void *)(a1 + 32)];

    id v3 = v23;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v35 = [v3 searchableItem];
      v28 = [v35 uniqueIdentifier];
      v33 = [v4 userSharedReceivedDate];
      v29 = [v33 firstObject];
      v30 = [v4 subject];
      *(_DWORD *)buf = 138413058;
      v38 = v28;
      __int16 v39 = 2112;
      v40 = v7;
      __int16 v41 = 2112;
      v42 = v29;
      __int16 v43 = 2112;
      v44 = v30;
      _os_log_error_impl(&dword_1DDCDB000, v15, OS_LOG_TYPE_ERROR, "Skipping  document suggestion with ID: %@ name: %@ date: %@ subject: %@ because there is no file URL.", buf, 0x2Au);
    }
    v26 = 0;
  }

  return v26;
}

@end