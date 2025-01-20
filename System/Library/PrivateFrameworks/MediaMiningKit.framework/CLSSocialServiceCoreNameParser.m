@interface CLSSocialServiceCoreNameParser
+ (id)_dictionaryKeyForPersonRelationship:(unint64_t)a3;
+ (unint64_t)_personRelationshipFromString:(id)a3;
- (CLSSocialServiceCoreNameParser)init;
- (NPNameParser)nameParser;
- (NSCharacterSet)nonLetterCharacterSet;
- (NSDictionary)vocabularyByRelationshipByLocale;
- (NSMutableDictionary)regularExpressionByRelationshipByLocale;
- (NSMutableDictionary)sexHintByCNIdentifier;
- (id)_normalizeName:(id)a3;
- (id)_parentRelationships;
- (id)_regularExpressionForRelationship:(unint64_t)a3 languageCode:(id)a4;
- (unint64_t)_sexHintForRelationship:(unint64_t)a3;
- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4;
- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4;
- (void)invalidateMemoryCaches;
- (void)setNameParser:(id)a3;
- (void)setNonLetterCharacterSet:(id)a3;
- (void)setRegularExpressionByRelationshipByLocale:(id)a3;
- (void)setSexHintByCNIdentifier:(id)a3;
- (void)setVocabularyByRelationshipByLocale:(id)a3;
@end

@implementation CLSSocialServiceCoreNameParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonLetterCharacterSet, 0);
  objc_storeStrong((id *)&self->_regularExpressionByRelationshipByLocale, 0);
  objc_storeStrong((id *)&self->_vocabularyByRelationshipByLocale, 0);
  objc_storeStrong((id *)&self->_sexHintByCNIdentifier, 0);
  objc_storeStrong((id *)&self->_nameParser, 0);
}

- (void)setNonLetterCharacterSet:(id)a3
{
}

- (NSCharacterSet)nonLetterCharacterSet
{
  return self->_nonLetterCharacterSet;
}

- (void)setRegularExpressionByRelationshipByLocale:(id)a3
{
}

- (NSMutableDictionary)regularExpressionByRelationshipByLocale
{
  return self->_regularExpressionByRelationshipByLocale;
}

- (void)setVocabularyByRelationshipByLocale:(id)a3
{
}

- (NSDictionary)vocabularyByRelationshipByLocale
{
  return self->_vocabularyByRelationshipByLocale;
}

- (void)setSexHintByCNIdentifier:(id)a3
{
}

- (NSMutableDictionary)sexHintByCNIdentifier
{
  return self->_sexHintByCNIdentifier;
}

- (void)setNameParser:(id)a3
{
}

- (NPNameParser)nameParser
{
  return (NPNameParser *)objc_getProperty(self, a2, 8, 1);
}

- (id)_regularExpressionForRelationship:(unint64_t)a3 languageCode:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_regularExpressionByRelationshipByLocale objectForKeyedSubscript:v6];
  if (v7) {
    goto LABEL_5;
  }
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(NSDictionary *)self->_vocabularyByRelationshipByLocale objectForKeyedSubscript:v6];
  if (v8)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __81__CLSSocialServiceCoreNameParser__regularExpressionForRelationship_languageCode___block_invoke;
    v18 = &unk_1E6910420;
    id v9 = v7;
    id v19 = v9;
    id v10 = v6;
    id v20 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:&v15];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regularExpressionByRelationshipByLocale, "setObject:forKeyedSubscript:", v9, v10, v15, v16, v17, v18);
  }
  if (v7)
  {
LABEL_5:
    uint64_t v11 = [(id)objc_opt_class() _dictionaryKeyForPersonRelationship:a3];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v7 objectForKeyedSubscript:v11];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __81__CLSSocialServiceCoreNameParser__regularExpressionForRelationship_languageCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = NSString;
  v7 = [a3 componentsJoinedByString:@"|"];
  v8 = [v6 stringWithFormat:@"^(%@)$", v7];

  id v14 = 0;
  id v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v8 options:1 error:&v14];
  id v10 = v14;
  if (v10)
  {
    uint64_t v11 = +[CLSLogging sharedLogging];
    v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "[CLSSocialServiceCoreNameParser] Error creating regular expression from relationship vocabulary for language %@ and relationship %@", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
  }
}

- (id)_parentRelationships
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28F2E40];
}

- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 fullName];
  id v9 = [(CLSSocialServiceCoreNameParser *)self _normalizeName:v8];

  id v10 = [v6 nickname];
  v46 = self;
  v45 = [(CLSSocialServiceCoreNameParser *)self _normalizeName:v10];

  if ([v9 length] || objc_msgSend(v45, "length"))
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v56 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = [*(id *)(*((void *)&v55 + 1) + 8 * i) languageCode];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v14);
    }

    id v18 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v19 = [(CLSSocialServiceCoreNameParser *)v46 _parentRelationships];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v20 = v11;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      id v39 = v7;
      id v40 = v6;
      v43 = v19;
      v44 = v18;
      id v42 = v20;
      uint64_t v37 = *(void *)v52;
      do
      {
        uint64_t v24 = 0;
        uint64_t v38 = v22;
        do
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v51 + 1) + 8 * v24);
          if ((objc_msgSend(v18, "containsObject:", v25, v37) & 1) == 0)
          {
            uint64_t v41 = v24;
            [v18 addObject:v25];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v26 = v19;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v48;
              while (2)
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v48 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  unint64_t v31 = [*(id *)(*((void *)&v47 + 1) + 8 * j) unsignedIntegerValue];
                  v32 = [(CLSSocialServiceCoreNameParser *)v46 _regularExpressionForRelationship:v31 languageCode:v25];
                  if (v32)
                  {
                    v33 = objc_msgSend(v32, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
                    if (![v33 count])
                    {
                      uint64_t v34 = objc_msgSend(v32, "matchesInString:options:range:", v45, 0, 0, objc_msgSend(v45, "length"));

                      v33 = (void *)v34;
                    }
                    uint64_t v35 = [v33 count];

                    if (v35)
                    {

                      id v7 = v39;
                      id v6 = v40;
                      uint64_t v19 = v43;
                      id v18 = v44;
                      id v20 = v42;
                      goto LABEL_35;
                    }
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }

            uint64_t v19 = v43;
            id v18 = v44;
            uint64_t v24 = v41;
            id v20 = v42;
            uint64_t v23 = v37;
            uint64_t v22 = v38;
          }
          ++v24;
        }
        while (v24 != v22);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v60 count:16];
        unint64_t v31 = 0;
        id v7 = v39;
        id v6 = v40;
      }
      while (v22);
    }
    else
    {
      unint64_t v31 = 0;
    }
LABEL_35:
  }
  else
  {
    unint64_t v31 = 0;
  }

  return v31;
}

- (id)_normalizeName:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [v4 lowercaseString];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [MEMORY[0x1E4F1CA48] array];
    [v6 length];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __49__CLSSocialServiceCoreNameParser__normalizeName___block_invoke;
    uint64_t v27 = &unk_1E69103F8;
    id v8 = v7;
    id v28 = v8;
    CEMEnumerateEmojiTokensInStringWithBlock();
    if ([v8 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v15 = (void *)MEMORY[0x1D2602300]();
            uint64_t v16 = [v14 rangeValue];
            objc_msgSend(v6, "deleteCharactersInRange:", v16, v17);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v11);
      }
    }
    id v18 = [v6 stringByTrimmingCharactersInSet:self->_nonLetterCharacterSet];
  }
  else
  {
    id v18 = &stru_1F28DF9D8;
  }

  return v18;
}

void __49__CLSSocialServiceCoreNameParser__normalizeName___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (unint64_t)_sexHintForRelationship:(unint64_t)a3
{
  if (a3 > 0x11) {
    return 0;
  }
  else {
    return qword_1D21C5400[a3];
  }
}

- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 CNIdentifier];
  id v9 = [(NSMutableDictionary *)self->_sexHintByCNIdentifier objectForKeyedSubscript:v8];
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v12 = [v6 firstName];
    uint64_t v13 = [v12 lowercaseString];

    if ([v13 length])
    {
      id v14 = v13;
      if ([v14 UTF8String])
      {
        uint64_t v15 = [(NPNameParser *)self->_nameParser genderMajorityForGivenName:v14];
        if (v15)
        {
          if (v15 == 2) {
            unint64_t v11 = 2;
          }
          else {
            unint64_t v11 = v15 == 1;
          }
        }
        else
        {
          uint64_t v18 = [v6 relationship];
          if (!v18) {
            uint64_t v18 = [(CLSSocialServiceCoreNameParser *)self relationshipHintForPerson:v6 usingLocales:v7];
          }
          unint64_t v11 = [(CLSSocialServiceCoreNameParser *)self _sexHintForRelationship:v18];
        }
      }
      else
      {
        uint64_t v16 = +[CLSLogging sharedLogging];
        uint64_t v17 = [v16 loggingConnection];

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v25 = 138412546;
          id v26 = v6;
          __int16 v27 = 2112;
          id v28 = v14;
          _os_log_error_impl(&dword_1D2150000, v17, OS_LOG_TYPE_ERROR, "[CLSSocialServiceCoreNameParser] Person %@ has an invalid UTF8 given name (%@)", (uint8_t *)&v25, 0x16u);
        }

        unint64_t v11 = 0;
      }
      if ([v8 length])
      {
        uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
        [(NSMutableDictionary *)self->_sexHintByCNIdentifier setObject:v19 forKeyedSubscript:v8];
      }
      else
      {
        long long v20 = +[CLSLogging sharedLogging];
        uint64_t v19 = [v20 loggingConnection];

        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          id v26 = v6;
          _os_log_impl(&dword_1D2150000, v19, OS_LOG_TYPE_INFO, "[CLSSocialServiceCoreNameParser] Person %@ does not have cnIdentifier, not adding to sex hint cache", (uint8_t *)&v25, 0xCu);
        }
      }

      if (v11) {
        goto LABEL_24;
      }
      long long v21 = +[CLSLogging sharedLogging];
      long long v22 = [v21 loggingConnection];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = [v6 fullName];
        int v25 = 138412290;
        id v26 = v23;
        _os_log_impl(&dword_1D2150000, v22, OS_LOG_TYPE_INFO, "[CLSSocialServiceCoreNameParser] No sex hint extracted from name %@", (uint8_t *)&v25, 0xCu);
      }
    }
    unint64_t v11 = 0;
LABEL_24:

    goto LABEL_25;
  }
  unint64_t v11 = [v9 integerValue];
LABEL_25:

  return v11;
}

- (void)invalidateMemoryCaches
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sexHintByCNIdentifier = self->_sexHintByCNIdentifier;
  self->_sexHintByCNIdentifier = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  vocabularyByRelationshipByLocale = self->_vocabularyByRelationshipByLocale;
  self->_vocabularyByRelationshipByLocale = v5;

  self->_regularExpressionByRelationshipByLocale = [MEMORY[0x1E4F1CA60] dictionary];
  MEMORY[0x1F41817F8]();
}

- (CLSSocialServiceCoreNameParser)init
{
  v17.receiver = self;
  v17.super_class = (Class)CLSSocialServiceCoreNameParser;
  id v2 = [(CLSSocialServiceCoreNameParser *)&v17 init];
  if (v2)
  {
    v3 = (NPNameParser *)objc_alloc_init(MEMORY[0x1E4F5C968]);
    nameParser = v2->_nameParser;
    v2->_nameParser = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sexHintByCNIdentifier = v2->_sexHintByCNIdentifier;
    v2->_sexHintByCNIdentifier = (NSMutableDictionary *)v5;

    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 URLForResource:@"personRelationshipVocabulary" withExtension:@"plist"];

    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v8];
    vocabularyByRelationshipByLocale = v2->_vocabularyByRelationshipByLocale;
    v2->_vocabularyByRelationshipByLocale = (NSDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    regularExpressionByRelationshipByLocale = v2->_regularExpressionByRelationshipByLocale;
    v2->_regularExpressionByRelationshipByLocale = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v14 = [v13 invertedSet];
    nonLetterCharacterSet = v2->_nonLetterCharacterSet;
    v2->_nonLetterCharacterSet = (NSCharacterSet *)v14;
  }
  return v2;
}

+ (unint64_t)_personRelationshipFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"mother"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"father"])
  {
    unint64_t v4 = 10;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_dictionaryKeyForPersonRelationship:(unint64_t)a3
{
  id v3 = @"father";
  if (a3 != 10) {
    id v3 = 0;
  }
  if (a3 == 9) {
    return @"mother";
  }
  else {
    return v3;
  }
}

@end