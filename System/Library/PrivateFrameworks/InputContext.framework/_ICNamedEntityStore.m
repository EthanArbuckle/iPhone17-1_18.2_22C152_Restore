@interface _ICNamedEntityStore
+ (id)tokenize:(id)a3;
- (BOOL)areStringCharactersWhitelisted:(id)a3;
- (BOOL)entityIsHyphenatedWord:(id)a3;
- (BOOL)isCloserToTitleCase:(id)a3 than:(id)a4;
- (BOOL)isValidNamedEntity:(id)a3 explanation:(id *)a4;
- (BOOL)treatHyphenatedWordAsPhrase;
- (NSSet)acceptedLanguages;
- (NSString)name;
- (USet)_exemplarSetForCustomLocales:(id)a3;
- (USet)exemplarSetForSupportedLocales;
- (_ICLexiconView)phraseLexicon;
- (_ICLexiconView)wordLexicon;
- (_ICNamedEntityStore)initWithName:(id)a3;
- (_ICNamedEntityStore)initWithName:(id)a3 maximumRecentlyAddedEntities:(unint64_t)a4;
- (_ICTransientLexicon)phraseLexiconImpl;
- (_ICTransientLexicon)wordLexiconImpl;
- (id)_adjustWordsForHyphenationIfNeeded:(id)a3 didAdjust:(BOOL *)a4;
- (unint64_t)durableEntitiesAdded;
- (unint64_t)minimumWordLength;
- (unint64_t)recentEntitiesAdded;
- (void)_addEntity:(void *)a3 asAliasOfEntity:(int)a4 isPhrase:;
- (void)_addEntity:(void *)a3 tokens:;
- (void)addEntity:(id)a3 isDurable:(BOOL)a4;
- (void)reloadRecents;
- (void)removeAllEntities;
- (void)setAcceptedLanguages:(id)a3;
- (void)setMinimumWordLength:(unint64_t)a3;
- (void)setPhraseLexiconImpl:(id)a3;
- (void)setTreatHyphenatedWordAsPhrase:(BOOL)a3;
- (void)setWordLexiconImpl:(id)a3;
@end

@implementation _ICNamedEntityStore

- (_ICNamedEntityStore)initWithName:(id)a3
{
  return [(_ICNamedEntityStore *)self initWithName:a3 maximumRecentlyAddedEntities:500];
}

- (_ICNamedEntityStore)initWithName:(id)a3 maximumRecentlyAddedEntities:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_ICNamedEntityStore;
  v7 = [(_ICNamedEntityStore *)&v22 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_maximumRecentlyAddedEntities = a4;
    uint64_t v10 = [MEMORY[0x263EFF9B0] orderedSetWithCapacity:a4];
    leastRecentlyAddedEntities = v7->_leastRecentlyAddedEntities;
    v7->_leastRecentlyAddedEntities = (NSMutableOrderedSet *)v10;

    v12 = [_ICTransientLexicon alloc];
    v13 = [v6 stringByAppendingString:@"Words"];
    uint64_t v14 = [(_ICTransientLexicon *)v12 initWithName:v13 typeFlags:1];
    wordLexiconImpl = v7->_wordLexiconImpl;
    v7->_wordLexiconImpl = (_ICTransientLexicon *)v14;

    v16 = [_ICTransientLexicon alloc];
    v17 = [v6 stringByAppendingString:@"Phrases"];
    uint64_t v18 = [(_ICTransientLexicon *)v16 initWithName:v17 typeFlags:5];
    phraseLexiconImpl = v7->_phraseLexiconImpl;
    v7->_phraseLexiconImpl = (_ICTransientLexicon *)v18;

    v7->_minimumWordLength = 4;
    v7->_treatHyphenatedWordAsPhrase = 0;
    v20 = v7;
  }

  return v7;
}

- (_ICLexiconView)wordLexicon
{
  wordLexiconView = self->_wordLexiconView;
  if (!wordLexiconView)
  {
    v4 = [_ICLexiconView alloc];
    v5 = [(NSString *)self->_name stringByAppendingString:@"Words"];
    id v6 = [(_ICLexiconView *)v4 initWithName:v5 typeFlags:1];
    v7 = self->_wordLexiconView;
    self->_wordLexiconView = v6;

    wordLexiconView = self->_wordLexiconView;
  }
  uint64_t v8 = wordLexiconView;
  return v8;
}

- (_ICLexiconView)phraseLexicon
{
  phraseLexiconView = self->_phraseLexiconView;
  if (!phraseLexiconView)
  {
    v4 = [_ICLexiconView alloc];
    v5 = [(NSString *)self->_name stringByAppendingString:@"Phrases"];
    id v6 = [(_ICLexiconView *)v4 initWithName:v5 typeFlags:5];
    v7 = self->_phraseLexiconView;
    self->_phraseLexiconView = v6;

    phraseLexiconView = self->_phraseLexiconView;
  }
  uint64_t v8 = phraseLexiconView;
  return v8;
}

- (BOOL)isCloserToTitleCase:(id)a3 than:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:v5])
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 capitalizedString];
    if ([v5 isEqualToString:v8]
      && ![v6 isEqualToString:v8])
    {
      BOOL v7 = 1;
    }
    else if ([v6 isEqualToString:v8])
    {
      BOOL v7 = 0;
    }
    else
    {
      unint64_t v9 = [v5 length];
      unint64_t v10 = [v6 length];
      if (v9 >= v10) {
        unint64_t v9 = v10;
      }
      unint64_t v11 = [v8 length];
      if (v9 >= v11) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = v9;
      }
      if (v12)
      {
        uint64_t v13 = 0;
        unsigned int v14 = 0;
        unsigned int v15 = 0;
        do
        {
          int v16 = [v5 characterAtIndex:v13];
          if (v16 == [v8 characterAtIndex:v13]) {
            ++v14;
          }
          int v17 = [v6 characterAtIndex:v13];
          if (v17 == [v8 characterAtIndex:v13]) {
            ++v15;
          }
          ++v13;
        }
        while (v12 != v13);
      }
      else
      {
        unsigned int v15 = 0;
        unsigned int v14 = 0;
      }
      BOOL v7 = v14 > v15;
    }
  }
  return v7;
}

- (void)_addEntity:(void *)a3 asAliasOfEntity:(int)a4 isPhrase:
{
  id v8 = a2;
  id v7 = a3;
  if (a1)
  {
    if (a4) {
      [*(id *)(a1 + 96) addEntity:v8 asAliasOfEntity:v7];
    }
    if ([*(id *)(a1 + 88) containsEntity:v7]) {
      [*(id *)(a1 + 88) addEntity:v8 asAliasOfEntity:v7];
    }
  }
}

- (void)_addEntity:(void *)a3 tokens:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      id v8 = *(void **)(a1 + 96);
      unint64_t v9 = [v5 name];
      [v8 addEntity:v5 forEntry:v9];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v15, "length", (void)v16) >= *(void *)(a1 + 72)) {
            [*(id *)(a1 + 88) addEntity:v5 forEntry:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (USet)_exemplarSetForCustomLocales:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!_exemplarSetForCustomLocales__cachedExemplarSets)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = (void *)_exemplarSetForCustomLocales__cachedExemplarSets;
    _exemplarSetForCustomLocales__cachedExemplarSets = v4;
  }
  id v6 = [MEMORY[0x263EFF9C0] setWithArray:v3];
  id v7 = [(id)_exemplarSetForCustomLocales__cachedExemplarSets objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    unint64_t v9 = (USet *)[v7 pointerValue];
  }
  else
  {
    int v12 = 0;
    unint64_t v9 = (USet *)_createExemplarSetForLocales(v3, &v12);
    if (v9)
    {
      id v10 = [MEMORY[0x263F08D40] valueWithPointer:v9];
      [(id)_exemplarSetForCustomLocales__cachedExemplarSets setObject:v10 forKeyedSubscript:v6];
    }
    else
    {
      id v10 = _ICPersNamedEntityOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v14 = v12;
        _os_log_impl(&dword_235496000, v10, OS_LOG_TYPE_DEFAULT, "Unable to create exemplar set for given languages (UErrorCode=%d)", buf, 8u);
      }
    }
  }
  return v9;
}

- (USet)exemplarSetForSupportedLocales
{
  if (exemplarSetForSupportedLocales_onceToken != -1) {
    dispatch_once(&exemplarSetForSupportedLocales_onceToken, &__block_literal_global_4);
  }
  return (USet *)exemplarSetForSupportedLocales_exemplarSet;
}

- (BOOL)areStringCharactersWhitelisted:(id)a3
{
  id v4 = a3;
  id v5 = [(_ICNamedEntityStore *)self acceptedLanguages];

  if (v5)
  {
    id v6 = [(_ICNamedEntityStore *)self acceptedLanguages];
    id v7 = [v6 allObjects];
    id v8 = [(_ICNamedEntityStore *)self _exemplarSetForCustomLocales:v7];

    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    id v8 = [(_ICNamedEntityStore *)self exemplarSetForSupportedLocales];
    if (!v8) {
      goto LABEL_9;
    }
  }
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  unint64_t v9 = [v4 precomposedStringWithCanonicalMapping];
  uint64_t v10 = [v9 length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54___ICNamedEntityStore_areStringCharactersWhitelisted___block_invoke;
  v12[3] = &unk_264C56448;
  v12[4] = &v13;
  v12[5] = v8;
  if (objc_msgSend(v9, "_ICEnumerateLongCharactersInRange:usingBlock:", 0, v10, v12)) {
    LOBYTE(v8) = *((unsigned char *)v14 + 24) != 0;
  }
  else {
    LOBYTE(v8) = 0;
  }

  _Block_object_dispose(&v13, 8);
LABEL_9:

  return (char)v8;
}

- (BOOL)isValidNamedEntity:(id)a3 explanation:(id *)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 0x81)
  {
    if (a4)
    {
      id v7 = @"too long";
LABEL_8:
      BOOL v8 = 0;
      *a4 = v7;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (![(_ICNamedEntityStore *)self areStringCharactersWhitelisted:v6])
  {
    if (a4)
    {
      id v7 = @"characters are not whitelisted";
      goto LABEL_8;
    }
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (id)_adjustWordsForHyphenationIfNeeded:(id)a3 didAdjust:(BOOL *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_treatHyphenatedWordAsPhrase
    && [v6 count] == 1
    && ([v7 objectAtIndexedSubscript:0],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsString:@"-"],
        v8,
        (v9 & 1) != 0))
  {
    if (a4) {
      *a4 = 1;
    }
    uint64_t v10 = [v7 objectAtIndexedSubscript:0];
    id v11 = [v10 componentsSeparatedByString:@"-"];
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    id v11 = v7;
  }

  return v11;
}

- (void)addEntity:(id)a3 isDurable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (isTransientLexiconIngestionV2Enabled() && ([v6 passesFilters] & 1) == 0)
  {
    uint64_t v8 = _ICPersNamedEntityOSLogFacility();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
      -[_ICNamedEntityStore addEntity:isDurable:].cold.5((uint64_t)v6, v8);
    }
  }
  else
  {
    uint64_t v7 = 64;
    if (v4) {
      uint64_t v7 = 56;
    }
    ++*(Class *)((char *)&self->super.isa + v7);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __43___ICNamedEntityStore_addEntity_isDurable___block_invoke;
    v32[3] = &unk_264C56470;
    v32[4] = self;
    uint64_t v8 = MEMORY[0x237DDFA40](v32);
    char v9 = [v6 name];
    id v31 = 0;
    BOOL v10 = [(_ICNamedEntityStore *)self isValidNamedEntity:v9 explanation:&v31];
    id v11 = v31;

    if (v10)
    {
      int v12 = objc_opt_class();
      uint64_t v13 = [v6 name];
      int v14 = [v12 tokenize:v13];

      char v30 = 0;
      uint64_t v15 = [(_ICNamedEntityStore *)self _adjustWordsForHyphenationIfNeeded:v14 didAdjust:&v30];

      if ([v15 count])
      {
        unint64_t v28 = [v15 count];
        uint64_t v16 = 88;
        if (v28 > 1) {
          uint64_t v16 = 96;
        }
        long long v17 = [*(id *)((char *)&self->super.isa + v16) sortKeyEquivalents:v6];
        long long v18 = [v6 name];
        long long v19 = __43___ICNamedEntityStore_addEntity_isDurable___block_invoke_2((uint64_t)v18, v17, v18);

        if (!v19) {
          goto LABEL_11;
        }
        v20 = [v6 name];
        [v19 name];
        uint64_t v21 = v29 = v11;
        int v22 = [v20 isEqualToString:v21];

        id v11 = v29;
        if (!v22)
        {
          v23 = [v6 name];
          v24 = [v19 name];
          BOOL v27 = [(_ICNamedEntityStore *)self isCloserToTitleCase:v23 than:v24];

          v25 = _ICPersNamedEntityOSLogFacility();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
          if (v27)
          {
            if (v26) {
              -[_ICNamedEntityStore addEntity:isDurable:](v19, v6);
            }

            [(_ICTransientLexicon *)self->_phraseLexiconImpl removeEntity:v19];
            [(_ICTransientLexicon *)self->_wordLexiconImpl removeEntity:v19];
            -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v6, v15);
            -[_ICNamedEntityStore _addEntity:asAliasOfEntity:isPhrase:]((uint64_t)self, v19, v6, v28 > 1);
            id v11 = v29;
            if (!v4)
            {
              [(NSMutableOrderedSet *)self->_leastRecentlyAddedEntities removeObject:v19];
              (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
            }
          }
          else
          {
            if (v26) {
              -[_ICNamedEntityStore addEntity:isDurable:](v6, v19);
            }

            -[_ICNamedEntityStore _addEntity:asAliasOfEntity:isPhrase:]((uint64_t)self, v6, v19, v28 > 1);
            id v11 = v29;
            if (!v4) {
              (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v19);
            }
          }
          if (v30) {
            [(_ICTransientLexicon *)self->_wordLexiconImpl setIsHyphenatedWord:1 forEntity:v6];
          }
        }
        else
        {
LABEL_11:
          -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v6, v15);
          if (v30) {
            [(_ICTransientLexicon *)self->_wordLexiconImpl setIsHyphenatedWord:1 forEntity:v6];
          }
          if (!v4) {
            (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
          }
        }
      }
      else
      {
        long long v17 = _ICPersNamedEntityOSLogFacility();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[_ICNamedEntityStore addEntity:isDurable:](v6, v17);
        }
      }
    }
    else
    {
      uint64_t v15 = _ICPersNamedEntityOSLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[_ICNamedEntityStore addEntity:isDurable:].cold.4(v6);
      }
    }
  }
}

- (void)reloadRecents
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_leastRecentlyAddedEntities;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v9 = objc_opt_class();
        BOOL v10 = [v8 name];
        id v11 = [v9 tokenize:v10];

        char v13 = 0;
        int v12 = [(_ICNamedEntityStore *)self _adjustWordsForHyphenationIfNeeded:v11 didAdjust:&v13];

        -[_ICNamedEntityStore _addEntity:tokens:]((uint64_t)self, v8, v12);
        if (v13) {
          [(_ICTransientLexicon *)self->_wordLexiconImpl setIsHyphenatedWord:1 forEntity:v8];
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)removeAllEntities
{
  self->_durableEntitiesAdded = 0;
  self->_recentEntitiesAdded = 0;
}

- (BOOL)entityIsHyphenatedWord:(id)a3
{
  return [(_ICTransientLexicon *)self->_wordLexiconImpl entityIsHyphenatedWord:a3];
}

+ (id)tokenize:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  uint64_t v6 = [v4 stringByAppendingString:@" "];

  size_t v7 = 4 * [v6 length];
  uint64_t v8 = [v6 length];
  char v9 = malloc_type_malloc(v7, 0x100004077774924uLL);
  uint64_t v13 = [v6 length];
  objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v7, &v13, 4, 0, 0, v8, 0);
  CFLocaleRef v10 = CFLocaleCreate(0, @"en_US");
  LMStreamTokenizerCreate();
  id v12 = v5;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  CFRelease(v10);
  free(v9);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)durableEntitiesAdded
{
  return self->_durableEntitiesAdded;
}

- (unint64_t)recentEntitiesAdded
{
  return self->_recentEntitiesAdded;
}

- (unint64_t)minimumWordLength
{
  return self->_minimumWordLength;
}

- (void)setMinimumWordLength:(unint64_t)a3
{
  self->_minimumWordLength = a3;
}

- (BOOL)treatHyphenatedWordAsPhrase
{
  return self->_treatHyphenatedWordAsPhrase;
}

- (void)setTreatHyphenatedWordAsPhrase:(BOOL)a3
{
  self->_treatHyphenatedWordAsPhrase = a3;
}

- (NSSet)acceptedLanguages
{
  return self->_acceptedLanguages;
}

- (void)setAcceptedLanguages:(id)a3
{
}

- (_ICTransientLexicon)wordLexiconImpl
{
  return self->_wordLexiconImpl;
}

- (void)setWordLexiconImpl:(id)a3
{
}

- (_ICTransientLexicon)phraseLexiconImpl
{
  return self->_phraseLexiconImpl;
}

- (void)setPhraseLexiconImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseLexiconImpl, 0);
  objc_storeStrong((id *)&self->_wordLexiconImpl, 0);
  objc_storeStrong((id *)&self->_acceptedLanguages, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_phraseLexiconView, 0);
  objc_storeStrong((id *)&self->_wordLexiconView, 0);
  objc_storeStrong((id *)&self->_leastRecentlyAddedEntities, 0);
}

- (void)addEntity:(void *)a1 isDurable:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 name];
  int v4 = 138739971;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_235496000, a2, OS_LOG_TYPE_DEBUG, "Filtering \"%{sensitive}@\" because it does not contain any words.", (uint8_t *)&v4, 0xCu);
}

- (void)addEntity:(void *)a1 isDurable:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = [a1 name];
  int v4 = [a2 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_235496000, v5, v6, "Replacing \"%{sensitive}@\" with \"%{sensitive}@\".", v7, v8, v9, v10, v11);
}

- (void)addEntity:(void *)a1 isDurable:(void *)a2 .cold.3(void *a1, void *a2)
{
  id v3 = [a1 name];
  int v4 = [a2 name];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_235496000, v5, v6, "Adding \"%{sensitive}@\" as alias of \"%{sensitive}@\".", v7, v8, v9, v10, v11);
}

- (void)addEntity:(void *)a1 isDurable:.cold.4(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2(&dword_235496000, v2, v3, "Filtering \"%{sensitive}@\" because %@.", v4, v5, v6, v7, 3u);
}

- (void)addEntity:(uint64_t)a1 isDurable:(NSObject *)a2 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_235496000, a2, OS_LOG_TYPE_DEBUG, "Rejecting named entity %@ (does not pass local filters)", (uint8_t *)&v2, 0xCu);
}

@end