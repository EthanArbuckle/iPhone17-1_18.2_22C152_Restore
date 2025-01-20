@interface _ICTransientLexicon
+ (id)transientLexiconForIdentifier:(unsigned int)a3;
- (BOOL)contains:(id)a3;
- (BOOL)containsEntity:(id)a3;
- (BOOL)entityIsHyphenatedWord:(id)a3;
- (NSString)name;
- (_ICTransientLexicon)initWithName:(id)a3 typeFlags:(unsigned __int8)a4;
- (_LXLexicon)getLexiconImplementation;
- (id)getEntries;
- (id)getEntryRefCount:(id)a3;
- (id)getUsageCount:(id)a3;
- (id)namedEntitiesForEntry:(id)a3;
- (id)sortKeyEquivalents:(id)a3;
- (uint64_t)_tokenIdentiferForEntry:(uint64_t)TokenID;
- (unint64_t)entryCount;
- (unsigned)typeFlags;
- (void)_mutableNamedEntitiesForEntry:(void *)a1;
- (void)_mutableNamedEntitiesForLXEntry:(void *)a1;
- (void)addEntity:(id)a3 asAliasOfEntity:(id)a4;
- (void)addEntity:(id)a3 forEntry:(id)a4;
- (void)createAdditionalDataForEntityIfNeeded:(id)a3;
- (void)dealloc;
- (void)removeAllEntities;
- (void)removeEntity:(id)a3;
- (void)setIsHyphenatedWord:(BOOL)a3 forEntity:(id)a4;
@end

@implementation _ICTransientLexicon

- (void)_mutableNamedEntitiesForLXEntry:(void *)a1
{
  v1 = a1;
  if (a1)
  {
    uint64_t TokenID = LXEntryGetTokenID();
    v3 = (void *)v1[2];
    v4 = [NSNumber numberWithUnsignedInt:TokenID];
    v1 = [v3 objectForKeyedSubscript:v4];
  }
  return v1;
}

- (void)dealloc
{
  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)_ICTransientLexicon;
  [(_ICTransientLexicon *)&v3 dealloc];
}

- (_ICTransientLexicon)initWithName:(id)a3 typeFlags:(unsigned __int8)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_ICTransientLexicon;
  v8 = [(_ICTransientLexicon *)&v20 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_name, a3);
  v9->_typeFlags = a4;
  v9->_identifier = ++generateIdentifier_count;
  uint64_t v10 = objc_opt_new();
  tokenIdentifierToEntitiesMap = v9->_tokenIdentifierToEntitiesMap;
  v9->_tokenIdentifierToEntitiesMap = (NSMutableDictionary *)v10;

  uint64_t v12 = objc_opt_new();
  entityToTokenIdentifiersMap = v9->_entityToTokenIdentifiersMap;
  v9->_entityToTokenIdentifiersMap = (NSMutableDictionary *)v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51320], v7);
  v9->_lexicon = (_LXLexicon *)LXLexiconCreateTransient();
  CFRelease(Mutable);
  if (v9->_lexicon)
  {
    v15 = transientLexiconMap();
    v16 = [NSNumber numberWithUnsignedInt:v9->_identifier];
    [v15 setObject:v9 forKeyedSubscript:v16];

    LXLexiconRepositoryAddOrUpdate();
LABEL_4:
    v17 = v9;
    goto LABEL_8;
  }
  v18 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[_ICTransientLexicon initWithName:typeFlags:]();
  }

  v17 = 0;
LABEL_8:

  return v17;
}

+ (id)transientLexiconForIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = transientLexiconMap();
  v5 = [NSNumber numberWithUnsignedInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (uint64_t)_tokenIdentiferForEntry:(uint64_t)TokenID
{
  id v3 = a2;
  if (TokenID)
  {
    v4 = +[_ICLexiconUtilities copyEntry:*(void *)(TokenID + 8) forString:v3];
    if (v4)
    {
      v5 = v4;
      uint64_t TokenID = LXEntryGetTokenID();
      CFRelease(v5);
    }
    else
    {
      uint64_t TokenID = 0;
    }
  }

  return TokenID;
}

- (void)_mutableNamedEntitiesForEntry:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = +[_ICLexiconUtilities copyEntry:a1[1] forString:v3];
    if (v4)
    {
      v5 = v4;
      a1 = -[_ICTransientLexicon _mutableNamedEntitiesForLXEntry:](a1);
      CFRelease(v5);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)namedEntitiesForEntry:(id)a3
{
  id v3 = -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, a3);
  v4 = (void *)[v3 copy];

  return v4;
}

- (unint64_t)entryCount
{
  return [(NSMutableDictionary *)self->_tokenIdentifierToEntitiesMap count];
}

- (void)createAdditionalDataForEntityIfNeeded:(id)a3
{
  id v4 = a3;
  entityToAdditionalDataMap = self->_entityToAdditionalDataMap;
  id v9 = v4;
  if (!entityToAdditionalDataMap)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    id v7 = self->_entityToAdditionalDataMap;
    self->_entityToAdditionalDataMap = v6;

    id v4 = v9;
    entityToAdditionalDataMap = self->_entityToAdditionalDataMap;
  }
  v8 = [(NSMutableDictionary *)entityToAdditionalDataMap objectForKeyedSubscript:v4];

  if (!v8) {
    [(NSMutableDictionary *)self->_entityToAdditionalDataMap setObject:&unk_26E8A2818 forKeyedSubscript:v9];
  }
}

- (BOOL)entityIsHyphenatedWord:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_entityToAdditionalDataMap objectForKeyedSubscript:a3];
  BOOL v4 = [v3 unsignedIntegerValue] & 1;

  return v4;
}

- (void)setIsHyphenatedWord:(BOOL)a3 forEntity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(_ICTransientLexicon *)self createAdditionalDataForEntityIfNeeded:v6];
  id v7 = [(NSMutableDictionary *)self->_entityToAdditionalDataMap objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [NSNumber numberWithUnsignedInteger:v8 & 0xFFFFFFFFFFFFFFFELL | v4];
  [(NSMutableDictionary *)self->_entityToAdditionalDataMap setObject:v9 forKeyedSubscript:v6];
}

- (void)addEntity:(id)a3 asAliasOfEntity:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_entityToTokenIdentifiersMap objectForKey:a4];
  entityToTokenIdentifiersMap = self->_entityToTokenIdentifiersMap;
  id v9 = (void *)[v7 mutableCopy];
  [(NSMutableDictionary *)entityToTokenIdentifiersMap setObject:v9 forKey:v6];

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
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenIdentifierToEntitiesMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * v14), (void)v16);
        [v15 addObject:v6];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)addEntity:(id)a3 forEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ICPersNamedEntityOSLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_ICTransientLexicon addEntity:forEntry:]();
  }

  if ((self->_typeFlags & 4) != 0) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, v7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42___ICTransientLexicon_addEntity_forEntry___block_invoke;
  v15[3] = &unk_264C563A8;
  v15[4] = self;
  int v16 = v9;
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x237DDFA40](v15);
  if (v10)
  {
    [v10 addObject:v6];
    uint64_t v12 = -[_ICTransientLexicon _tokenIdentiferForEntry:]((uint64_t)self, v7);
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v9];
    [v10 addObject:v6];
    [v6 timestamp];
    uint64_t v12 = LXLexiconAddWithCreationTime();
    LXLexiconIncrementUsageCount();
    LXLexiconSetUserBitfield();
    tokenIdentifierToEntitiesMap = self->_tokenIdentifierToEntitiesMap;
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v12];
    [(NSMutableDictionary *)tokenIdentifierToEntitiesMap setObject:v10 forKeyedSubscript:v14];
  }
  ((void (**)(void, id, uint64_t))v11)[2](v11, v6, v12);
}

- (void)removeEntity:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_entityToTokenIdentifiersMap objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v12 = [(NSMutableDictionary *)self->_tokenIdentifierToEntitiesMap objectForKeyedSubscript:v11];
          [v12 removeObject:v4];
          if (![v12 count])
          {
            [(NSMutableDictionary *)self->_tokenIdentifierToEntitiesMap removeObjectForKey:v11];
            [v11 unsignedIntValue];
            LXLexiconRemoveEntry();
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [(NSMutableDictionary *)self->_entityToTokenIdentifiersMap removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_entityToAdditionalDataMap removeObjectForKey:v4];
  }
}

- (void)removeAllEntities
{
  LXLexiconClear();
  [(NSMutableDictionary *)self->_entityToTokenIdentifiersMap removeAllObjects];
  [(NSMutableDictionary *)self->_tokenIdentifierToEntitiesMap removeAllObjects];
  entityToAdditionalDataMap = self->_entityToAdditionalDataMap;
  [(NSMutableDictionary *)entityToAdditionalDataMap removeAllObjects];
}

- (BOOL)containsEntity:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_entityToTokenIdentifiersMap objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)contains:(id)a3
{
  return +[_ICLexiconUtilities lexiconContainsEntry:self->_lexicon forString:a3];
}

- (id)sortKeyEquivalents:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  v5 = [v3 name];

  id v8 = v4;
  LXLexiconEnumerateEntriesForString();

  id v6 = v8;
  return v6;
}

- (_LXLexicon)getLexiconImplementation
{
  return self->_lexicon;
}

- (unsigned)typeFlags
{
  return self->_typeFlags;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityToAdditionalDataMap, 0);
  objc_storeStrong((id *)&self->_entityToTokenIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_tokenIdentifierToEntitiesMap, 0);
}

- (id)getEntries
{
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_entityToTokenIdentifiersMap, "count"));
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  id v5 = v2;
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);

  return v5;
}

- (id)getEntryRefCount:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = NSNumber;
    id v6 = -[_ICTransientLexicon _mutableNamedEntitiesForEntry:](self, v4);
    uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)getUsageCount:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (id v5 = +[_ICLexiconUtilities copyEntry:self->_lexicon forString:v4]) != 0)
  {
    id v6 = v5;
    uint64_t v7 = [NSNumber numberWithUnsignedInt:LXEntryGetUsageCount()];
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)initWithName:typeFlags:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_235496000, v0, OS_LOG_TYPE_ERROR, "Error creating lexicon (name = %@): %@", v1, 0x16u);
}

- (void)addEntity:forEntry:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_235496000, v0, OS_LOG_TYPE_DEBUG, "Add: %@ to: %@", v1, 0x16u);
}

@end