@interface CDMMarisaTrie
- (BOOL)_loadTrie;
- (BOOL)createFromEntries:(id)a3;
- (BOOL)createFromEntries:(id)a3 withHashValue:(id)a4;
- (BOOL)hasEntry:(id)a3;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)isValid;
- (CDMMarisaTrie)initWithFilePath:(id)a3 versionNumber:(id)a4;
- (NSNumber)hashValue;
- (id).cxx_construct;
- (id)_readCachedNumberValueForKey:(id)a3;
- (id)traversePrefix:(id)a3;
- (void)dealloc;
@end

@implementation CDMMarisaTrie

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  MEMORY[0x22A6564E0](&self->_readOnlyTrie);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (id)_readCachedNumberValueForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CDMMarisaTrie *)self traversePrefix:v4];
  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    v7 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v4, "length"));

    id v8 = v7;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v8, "UTF8String"), 0, 0));
  }
  else
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[CDMMarisaTrie _readCachedNumberValueForKey:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s WARNING: Failed to find entry for key: %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)_loadTrie
{
  p_readOnlyTrie = &self->_readOnlyTrie;
  marisa::Trie::clear((marisa::Trie *)&self->_readOnlyTrie);
  id v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:self->_filePath];

  if (v5) {
    marisa::Trie::mmap((marisa::Trie *)p_readOnlyTrie, [(NSString *)self->_filePath UTF8String]);
  }
  return marisa::Trie::empty((marisa::Trie *)p_readOnlyTrie) ^ 1;
}

- (id)traversePrefix:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  marisa::Agent::Agent((marisa::Agent *)v11);
  id v6 = v4;
  marisa::Agent::set_query((marisa::Agent *)v11, (const char *)[v6 UTF8String]);
  p_readOnlyTrie = &self->_readOnlyTrie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_readOnlyTrie, (marisa::Agent *)v11))
  {
    id v8 = [NSString alloc];
    v9 = (void *)[v8 initWithBytes:v11[3] length:v12 encoding:4];
    [v5 addObject:v9];
  }
  marisa::Agent::~Agent((marisa::Agent *)v11);

  return v5;
}

- (BOOL)hasPrefix:(id)a3
{
  id v4 = a3;
  marisa::Agent::Agent((marisa::Agent *)v7);
  id v5 = v4;
  marisa::Agent::set_query((marisa::Agent *)v7, (const char *)[v5 UTF8String]);
  LOBYTE(self) = marisa::Trie::predictive_search((marisa::Trie *)&self->_readOnlyTrie, (marisa::Agent *)v7);
  marisa::Agent::~Agent((marisa::Agent *)v7);

  return (char)self;
}

- (BOOL)hasEntry:(id)a3
{
  id v4 = a3;
  marisa::Agent::Agent((marisa::Agent *)v7);
  id v5 = v4;
  marisa::Agent::set_query((marisa::Agent *)v7, (const char *)[v5 UTF8String]);
  LOBYTE(self) = marisa::Trie::lookup((marisa::Trie *)&self->_readOnlyTrie, (marisa::Agent *)v7);
  marisa::Agent::~Agent((marisa::Agent *)v7);

  return (char)self;
}

- (BOOL)createFromEntries:(id)a3 withHashValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  marisa::Keyset::Keyset((marisa::Keyset *)v26);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)[*(id *)(*((void *)&v22 + 1) + 8 * v11++) UTF8String]);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  unsigned int v12 = NSString;
  v13 = (void *)[@"~~_ver_~~%@" copy];
  __int16 v14 = objc_msgSend(v12, "stringWithFormat:", v13, self->_versionNumber);

  id v15 = NSString;
  uint64_t v16 = (void *)[@"~~_hash_~~%@" copy];
  v17 = objc_msgSend(v15, "stringWithFormat:", v16, v7);

  id v18 = v14;
  marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)[v18 UTF8String]);
  id v19 = v17;
  marisa::Keyset::push_back((marisa::Keyset *)v26, (const char *)[v19 UTF8String]);
  marisa::Trie::Trie((marisa::Trie *)v29);
  marisa::Trie::build((marisa::Trie *)v29, (marisa::Keyset *)v26);
  marisa::Trie::save((marisa::Trie *)v29, [(NSString *)self->_filePath UTF8String]);
  marisa::Trie::clear((marisa::Trie *)v29);
  MEMORY[0x22A6564E0](v29);
  BOOL v20 = [(CDMMarisaTrie *)self _loadTrie];

  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array(v28);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(v27);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(v26);

  return v20;
}

- (BOOL)createFromEntries:(id)a3
{
  return [(CDMMarisaTrie *)self createFromEntries:a3 withHashValue:&unk_26DA3E670];
}

- (NSNumber)hashValue
{
  v3 = (void *)[@"~~_hash_~~" copy];
  id v4 = [(CDMMarisaTrie *)self _readCachedNumberValueForKey:v3];

  return (NSNumber *)v4;
}

- (BOOL)isValid
{
  return marisa::Trie::empty((marisa::Trie *)&self->_readOnlyTrie) ^ 1;
}

- (void)dealloc
{
  marisa::Trie::clear((marisa::Trie *)&self->_readOnlyTrie);
  v3.receiver = self;
  v3.super_class = (Class)CDMMarisaTrie;
  [(CDMMarisaTrie *)&v3 dealloc];
}

- (CDMMarisaTrie)initWithFilePath:(id)a3 versionNumber:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CDMMarisaTrie;
  id v8 = [(CDMMarisaTrie *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    filePath = v8->_filePath;
    v8->_filePath = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    versionNumber = v8->_versionNumber;
    v8->_versionNumber = (NSNumber *)v11;

    if ([(CDMMarisaTrie *)v8 _loadTrie])
    {
      v13 = (void *)[@"~~_ver_~~" copy];
      __int16 v14 = [(CDMMarisaTrie *)v8 _readCachedNumberValueForKey:v13];

      if (![(NSNumber *)v8->_versionNumber isEqualToNumber:v14])
      {
        id v15 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v19 = "-[CDMMarisaTrie initWithFilePath:versionNumber:]";
          _os_log_impl(&dword_2263A0000, v15, OS_LOG_TYPE_INFO, "%s WARNING : Version mismatch", buf, 0xCu);
        }

        marisa::Trie::clear((marisa::Trie *)&v8->_readOnlyTrie);
      }
    }
  }

  return v8;
}

@end