@interface INFSentence
+ (id)sentenceWithIdentifier:(id)a3;
- (BOOL)containsUnresolvedTokens:(id)a3;
- (INFGrammarCollection)collection;
- (INFSentence)init;
- (INFSentence)initWithDictionary:(id)a3 identifier:(id)a4;
- (INFSentence)initWithIdentifier:(id)a3;
- (NSMutableDictionary)placeholdersToTokens;
- (NSMutableDictionary)relationships;
- (NSSet)placeholders;
- (NSString)format;
- (NSString)identifier;
- (NSString)resolvedSentence;
- (id)concreteToken:(id)a3 in:(id)a4;
- (id)dictionaryRepresentation;
- (id)filteredPlaceholders;
- (id)unresolvedInArray:(id)a3;
- (void)generatePlaceholders;
- (void)placeholder:(id)a3 dependsOn:(id)a4;
- (void)reportCyclesIfAny;
- (void)setCollection:(id)a3;
- (void)setFormat:(id)a3;
- (void)setNumber:(id)a3 forPlaceholder:(id)a4;
- (void)setPlaceholders:(id)a3;
- (void)setPlaceholdersToTokens:(id)a3;
- (void)setRelationships:(id)a3;
- (void)setToken:(id)a3 forPlaceholder:(id)a4;
@end

@implementation INFSentence

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collection);
  objc_storeStrong((id *)&self->_placeholdersToTokens, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_placeholders, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCollection:(id)a3
{
}

- (INFGrammarCollection)collection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collection);
  return (INFGrammarCollection *)WeakRetained;
}

- (void)setPlaceholdersToTokens:(id)a3
{
}

- (NSMutableDictionary)placeholdersToTokens
{
  return self->_placeholdersToTokens;
}

- (void)setRelationships:(id)a3
{
}

- (NSMutableDictionary)relationships
{
  return self->_relationships;
}

- (void)setPlaceholders:(id)a3
{
}

- (NSString)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_format forKeyedSubscript:@"LOCSentenceFormat"];
  [v3 setObject:self->_relationships forKeyedSubscript:@"LOCSentenceRelationships"];
  v4 = [(INFSentence *)self filteredPlaceholders];
  [v3 setObject:v4 forKeyedSubscript:@"LOCSentencePlaceholders"];

  return v3;
}

- (id)filteredPlaceholders
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableDictionary *)self->_placeholdersToTokens mutableCopy];
  v4 = [v3 allKeys];
  v5 = (void *)[v4 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    p_collection = &self->_collection;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v3 objectForKeyedSubscript:v11];
        id WeakRetained = objc_loadWeakRetained((id *)p_collection);
        v14 = [WeakRetained tokenWithIdentifier:v12];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [v3 setObject:0 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)concreteToken:(id)a3 in:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "originalToken", (void)v16);
        v12 = [v11 identifier];
        v13 = [v5 identifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)unresolvedInArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isResolved", (void)v12) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)containsUnresolvedTokens:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__INFSentence_containsUnresolvedTokens___block_invoke;
  v6[3] = &unk_1E6CA0CB0;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __40__INFSentence_containsUnresolvedTokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isResolved];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSString)resolvedSentence
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  [(INFSentence *)self reportCyclesIfAny];
  id v53 = [MEMORY[0x1E4F28E78] stringWithString:self->_format];
  v59 = [(INFSentence *)self collection];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v58 = self;
  char v4 = self->_placeholdersToTokens;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v73 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        char v10 = [(NSMutableDictionary *)v58->_placeholdersToTokens objectForKeyedSubscript:v9];
        uint64_t v11 = [v59 tokenWithIdentifier:v10];
        long long v12 = +[INFSentenceTokenWithContext sentenceResolvedTokenWithOriginalToken:v11 placeholderName:v9];
        [v3 addObject:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v6);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v68 objects:v78 count:16];
  long long v15 = v58;
  id obj = v13;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v69 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        relationships = v58->_relationships;
        uint64_t v21 = [v19 placeholderName];
        v22 = [(NSMutableDictionary *)relationships objectForKeyedSubscript:v21];

        if (!v22)
        {
          [v19 setResolved:1];
          uint64_t v23 = [v19 originalToken];
          v24 = [v23 contributingSentenceContext];
          [v19 setContext:v24];
        }
      }
      id v13 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v16);
  }

  if ([(INFSentence *)v58 containsUnresolvedTokens:v13])
  {
    do
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v57 = [(INFSentence *)v15 unresolvedInArray:v13];
      uint64_t v25 = [v57 countByEnumeratingWithState:&v64 objects:v77 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v65;
        uint64_t v54 = *(void *)v65;
        do
        {
          uint64_t v28 = 0;
          uint64_t v55 = v26;
          do
          {
            if (*(void *)v65 != v27) {
              objc_enumerationMutation(v57);
            }
            v29 = *(void **)(*((void *)&v64 + 1) + 8 * v28);
            v30 = v15->_relationships;
            v31 = [v29 placeholderName];
            v32 = [(NSMutableDictionary *)v30 objectForKeyedSubscript:v31];

            v33 = [(NSMutableDictionary *)v15->_placeholdersToTokens objectForKeyedSubscript:v32];
            v34 = [v59 tokenWithIdentifier:v33];
            v35 = [(INFSentence *)v15 concreteToken:v34 in:v13];
            if ([v35 isResolved])
            {
              v36 = [v35 context];
              v37 = [v29 originalToken];
              v38 = [v37 contributingSentenceContext];
              v39 = [v36 combinedWithContext:v38];

              long long v15 = v58;
              uint64_t v26 = v55;

              uint64_t v27 = v54;
              [v29 setContext:v39];
              [v29 setResolved:1];

              id v13 = obj;
            }

            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v57 countByEnumeratingWithState:&v64 objects:v77 count:16];
        }
        while (v26);
      }
    }
    while ([(INFSentence *)v15 containsUnresolvedTokens:v13]);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v40 = v13;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v60 + 1) + 8 * k);
        v46 = NSString;
        v47 = [v45 placeholderName];
        v48 = [v46 stringWithFormat:@"%%#@%@@", v47];

        v49 = [v45 originalToken];
        v50 = [v45 context];
        v51 = [v49 stringForContext:v50];

        if (v51) {
          objc_msgSend(v53, "replaceOccurrencesOfString:withString:options:range:", v48, v51, 0, 0, objc_msgSend(v53, "length"));
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v42);
  }

  return (NSString *)v53;
}

- (void)reportCyclesIfAny
{
  v2 = (void *)[(NSMutableDictionary *)self->_relationships copy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__INFSentence_reportCyclesIfAny__block_invoke;
  v4[3] = &unk_1E6CA0C88;
  id v5 = v2;
  id v3 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __32__INFSentence_reportCyclesIfAny__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v15 = v3;
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v15];
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];

  uint64_t v6 = v15;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    uint64_t v9 = v15;
    do
    {
      char v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
      uint64_t v11 = [v4 objectForKeyedSubscript:v10];

      if (v11)
      {
        long long v12 = (void *)MEMORY[0x1E4F1CA00];
        id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        [v12 raise:v7, @"Cycle detected when reaching %@ from %@", v13, v9 format];
      }
      uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

      [v4 setObject:v8 forKeyedSubscript:v6];
      uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

      uint64_t v9 = v6;
    }
    while (v14);
  }
}

- (void)placeholder:(id)a3 dependsOn:(id)a4
{
}

- (void)setNumber:(id)a3 forPlaceholder:(id)a4
{
  uint64_t v6 = NSString;
  identifier = self->_identifier;
  id v8 = a4;
  id v9 = a3;
  id v12 = [v6 stringWithFormat:@"%@_%@", identifier, v8];
  char v10 = +[INFNumber numberWithIdentifier:v12];
  [v10 setValue:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_collection);
  [WeakRetained addToken:v10];

  [(INFSentence *)self setToken:v10 forPlaceholder:v8];
}

- (void)setToken:(id)a3 forPlaceholder:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  [(NSMutableDictionary *)self->_placeholdersToTokens setObject:v7 forKeyedSubscript:v6];
}

- (void)setFormat:(id)a3
{
  char v4 = (NSString *)[a3 copy];
  format = self->_format;
  self->_format = v4;

  placeholders = self->_placeholders;
  self->_placeholders = 0;
}

- (void)generatePlaceholders
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  char v4 = (void *)MEMORY[0x1E4F28FD8];
  id v5 = [NSString stringWithFormat:@"%%#@%@@", @"([a-zA-Z0-9\\-_]+)"];
  id v6 = [v4 regularExpressionWithPattern:v5 options:0 error:0];

  format = self->_format;
  uint64_t v8 = [(NSString *)format length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__INFSentence_generatePlaceholders__block_invoke;
  v12[3] = &unk_1E6CA0C60;
  v12[4] = self;
  id v9 = v3;
  id v13 = v9;
  objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", format, 0, 0, v8, v12);
  placeholders = self->_placeholders;
  self->_placeholders = v9;
  uint64_t v11 = v9;
}

void __35__INFSentence_generatePlaceholders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v10 = v3;
    BOOL v4 = (unint64_t)[v3 numberOfRanges] >= 2;
    id v3 = v10;
    if (v4)
    {
      uint64_t v5 = [v10 rangeAtIndex:1];
      uint64_t v7 = v6;
      uint64_t v8 = [*(id *)(a1 + 32) format];
      id v9 = objc_msgSend(v8, "substringWithRange:", v5, v7);

      [*(id *)(a1 + 40) addObject:v9];
      id v3 = v10;
    }
  }
}

- (NSSet)placeholders
{
  placeholders = self->_placeholders;
  if (!placeholders)
  {
    [(INFSentence *)self generatePlaceholders];
    placeholders = self->_placeholders;
  }
  return placeholders;
}

- (INFSentence)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(INFSentence *)self init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"LOCSentenceFormat"];
    uint64_t v12 = [v11 copy];
    format = v8->_format;
    v8->_format = (NSString *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:@"LOCSentenceRelationships"];
    uint64_t v15 = [v14 mutableCopy];
    relationships = v8->_relationships;
    v8->_relationships = (NSMutableDictionary *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:@"LOCSentencePlaceholders"];

    if (v17)
    {
      long long v18 = [v6 objectForKeyedSubscript:@"LOCSentencePlaceholders"];
      uint64_t v19 = [v18 mutableCopy];
      placeholdersToTokens = v8->_placeholdersToTokens;
      v8->_placeholdersToTokens = (NSMutableDictionary *)v19;
    }
  }

  return v8;
}

- (INFSentence)initWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INFSentence *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (INFSentence)init
{
  v12.receiver = self;
  v12.super_class = (Class)INFSentence;
  v2 = [(INFSentence *)&v12 init];
  id v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1F37C4EF0;

    format = v3->_format;
    v3->_format = (NSString *)&stru_1F37C4EF0;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    relationships = v3->_relationships;
    v3->_relationships = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    placeholdersToTokens = v3->_placeholdersToTokens;
    v3->_placeholdersToTokens = (NSMutableDictionary *)v8;

    placeholders = v3->_placeholders;
    v3->_placeholders = 0;
  }
  return v3;
}

+ (id)sentenceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

@end