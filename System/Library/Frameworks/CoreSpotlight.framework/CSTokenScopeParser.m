@interface CSTokenScopeParser
- (CSTokenScopeParser)init;
- (id)messageSuggestionTokenForString:(id)a3;
- (id)scopeKeyMapTable;
- (id)suggestionTokenForString:(id)a3;
- (id)tokenFromConfiguration:(id)a3 userString:(id)a4 displayString:(id)a5 handle:(id)a6;
- (id)tokenScopeConfigurationForKey:(id)a3;
- (id)tokenScopeConfigurationTable;
- (int64_t)indexForScopeKey:(id)a3;
- (void)loadDefaultScopeKeyMapTable;
- (void)loadScopeKeyMapTableForCurrentLocale;
- (void)updateScopeKeyMapTableIfNeeded;
@end

@implementation CSTokenScopeParser

- (void)loadScopeKeyMapTableForCurrentLocale
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = [(CSTokenScopeParser *)self tokenScopeConfigurationTable];
  v3 = [v2 allKeys];

  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = CSGetLocalizedString(v8);
        v10 = [v9 localizedLowercaseString];

        v11 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":,"];
        v12 = [v10 componentsSeparatedByCharactersInSet:v11];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              [(id)_scopeKeyMapTable setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * j)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v15);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }
}

- (void)loadDefaultScopeKeyMapTable
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(CSTokenScopeParser *)self tokenScopeConfigurationTable];
  v3 = [v2 allKeys];

  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        v9 = [(CSTokenScopeParser *)self tokenScopeConfigurationTable];
        v10 = [v9 objectForKeyedSubscript:v8];
        v11 = [v10 objectAtIndexedSubscript:3];

        v12 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":,"];
        id v13 = [v11 componentsSeparatedByCharactersInSet:v12];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              [(id)_scopeKeyMapTable setObject:v8 forKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v18++)];
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v16);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
}

- (id)tokenScopeConfigurationTable
{
  if (tokenScopeConfigurationTable_once != -1) {
    dispatch_once(&tokenScopeConfigurationTable_once, &__block_literal_global_26);
  }
  v2 = (void *)tokenScopeConfigurationTable_configuration;

  return v2;
}

void __50__CSTokenScopeParser_tokenScopeConfigurationTable__block_invoke()
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v0 = +[_CSTokenScope tokenScopesForPerson];
  id v13 = +[_CSTokenScope tokenScopesForSubjectContains];
  v12 = +[_CSTokenScope tokenScopesForAttachmentType];
  v1 = +[_CSTokenScope tokenScopesForMessageWithAttachments];
  v2 = +[_CSTokenScope tokenScopesForAllTokens];
  v20[0] = @"FROM_SCOPE_KEY";
  v19[0] = v0;
  v19[1] = &unk_1EDBD6A18;
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  v19[2] = MEMORY[0x1E4F1CC28];
  v19[3] = @"from";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v21[0] = v4;
  v20[1] = @"TO_SCOPE_KEY";
  v18[0] = v0;
  v18[1] = &unk_1EDBD6A30;
  v18[2] = v3;
  v18[3] = @"to";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  v21[1] = v5;
  v20[2] = @"SUBJECT_SCOPE_KEY";
  v17[0] = v13;
  v17[1] = &unk_1EDBD6A18;
  v17[2] = v3;
  v17[3] = @"subject";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  v21[2] = v6;
  v20[3] = @"ATTACHMENT_TYPE_SCOPE_KEY";
  v16[0] = v12;
  v16[1] = &unk_1EDBD6A18;
  v16[2] = v3;
  v16[3] = @"kind";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v21[3] = v7;
  v20[4] = @"ATTACHMENTS_SCOPE_KEY";
  v15[0] = v1;
  v15[1] = &unk_1EDBD6A18;
  v15[2] = MEMORY[0x1E4F1CC38];
  v15[3] = @"attachment:attachments";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  v21[4] = v8;
  v20[5] = @"MESSAGE_SCOPE_KEY";
  v14[0] = v2;
  v14[1] = &unk_1EDBD6A48;
  v14[2] = v3;
  v14[3] = @"message";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v21[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  v11 = (void *)tokenScopeConfigurationTable_configuration;
  tokenScopeConfigurationTable_configuration = v10;
}

- (id)scopeKeyMapTable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CSTokenScopeParser_scopeKeyMapTable__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  if (scopeKeyMapTable_once != -1) {
    dispatch_once(&scopeKeyMapTable_once, block);
  }
  return (id)_scopeKeyMapTable;
}

uint64_t __38__CSTokenScopeParser_scopeKeyMapTable__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = (void *)_scopeKeyMapTable;
  _scopeKeyMapTable = v2;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 loadDefaultScopeKeyMapTable];
}

- (CSTokenScopeParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSTokenScopeParser;
  uint64_t v2 = [(CSTokenScopeParser *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [(CSTokenScopeParser *)v2 scopeKeyMapTable];
    [(CSTokenScopeParser *)v3 updateScopeKeyMapTableIfNeeded];
  }
  return v3;
}

- (id)tokenScopeConfigurationForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (id)_scopeKeyMapTable;
    objc_sync_enter(v5);
    objc_super v6 = [(id)_scopeKeyMapTable objectForKeyedSubscript:v4];
    uint64_t v7 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CSTokenScopeParser tokenScopeConfigurationForKey:](v7);
    }

    objc_sync_exit(v5);
    uint64_t v8 = [(CSTokenScopeParser *)self tokenScopeConfigurationTable];
    v9 = [v8 objectForKeyedSubscript:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateScopeKeyMapTableIfNeeded
{
  obuint64_t j = (id)_scopeKeyMapTable;
  objc_sync_enter(obj);
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v3 localeIdentifier];

  if (([(id)updateScopeKeyMapTableIfNeeded_lastLocalIdentifer isEqualToString:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&updateScopeKeyMapTableIfNeeded_lastLocalIdentifer, v4);
    [(CSTokenScopeParser *)self loadScopeKeyMapTableForCurrentLocale];
  }

  objc_sync_exit(obj);
}

- (int64_t)indexForScopeKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CSTokenScopeParser *)self tokenScopeConfigurationTable];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:1];
    int64_t v8 = [v7 integerValue];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (id)tokenFromConfiguration:(id)a3 userString:(id)a4 displayString:(id)a5 handle:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 objectAtIndexedSubscript:1];
  uint64_t v14 = [v13 integerValue];

  uint64_t v15 = [v12 objectAtIndexedSubscript:0];

  if (v9) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = &stru_1EDBB3A50;
  }
  v22[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v18 = +[_CSTokenScope scopesFromCSTokenScopes:v15 displayString:v10 handles:v17];

  long long v19 = [_CSSuggestionToken alloc];
  long long v20 = [(_CSSuggestionToken *)v19 initWithUserString:v11 scopes:v18 selectedIndex:v14 displayString:v10];

  return v20;
}

- (id)suggestionTokenForString:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  objc_super v6 = [v4 whitespaceCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  int64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":："];
  uint64_t v9 = [v7 rangeOfCharacterFromSet:v8];
  uint64_t v11 = v10;
  id v12 = v7;
  id v13 = v12;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v12;
  }
  else
  {
    uint64_t v15 = [v12 substringToIndex:v9];

    uint64_t v14 = [v13 substringFromIndex:v9 + v11];
  }
  uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v17 = [v15 stringByTrimmingCharactersInSet:v16];
  uint64_t v18 = [v17 localizedLowercaseString];

  long long v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  long long v20 = [v14 stringByTrimmingCharactersInSet:v19];

  long long v21 = [(CSTokenScopeParser *)self tokenScopeConfigurationForKey:v18];
  long long v22 = v21;
  if (!v21) {
    goto LABEL_7;
  }
  long long v23 = [v21 objectAtIndexedSubscript:2];
  int v24 = [v23 BOOLValue];

  uint64_t v25 = [v20 length];
  if (!v24)
  {
    if (!v25) {
      goto LABEL_7;
    }
LABEL_9:
    long long v27 = CSGetLocalizedString(@"TOKEN_TEXT_ANY");
    if ([v20 length]) {
      long long v28 = v20;
    }
    else {
      long long v28 = v27;
    }
    long long v26 = [(CSTokenScopeParser *)self tokenFromConfiguration:v22 userString:v13 displayString:v28 handle:v20];

    goto LABEL_13;
  }
  if (!v25) {
    goto LABEL_9;
  }
LABEL_7:
  long long v26 = 0;
LABEL_13:

  return v26;
}

- (id)messageSuggestionTokenForString:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  objc_super v6 = [v4 whitespaceCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v7 length])
  {
    int64_t v8 = [(CSTokenScopeParser *)self tokenScopeConfigurationForKey:@"message"];
    uint64_t v9 = [(CSTokenScopeParser *)self tokenFromConfiguration:v8 userString:v7 displayString:v7 handle:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)tokenScopeConfigurationForKey:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = _scopeKeyMapTable;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "scopeKeyMapTable: %@", (uint8_t *)&v1, 0xCu);
}

@end