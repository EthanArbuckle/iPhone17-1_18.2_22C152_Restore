@interface OVMarisaTrie
- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4;
- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5;
- (OVMarisaTrie)init;
- (OVMarisaTrie)initWithURL:(id)a3;
- (id).cxx_construct;
- (id)reverseLookupRow:(int)a3;
- (int64_t)count;
- (void)addKey:(id)a3 payload:(id)a4;
- (void)addRow:(id)a3;
- (void)buildKeyset;
- (void)enumerateAllEntriesWithBlock:(id)a3;
- (void)enumerateAllRowsWithBlock:(id)a3;
- (void)lookupKey:(id)a3 resultBlock:(id)a4;
- (void)lookupPrefix:(id)a3 resultBlock:(id)a4;
- (void)writeToURL:(id)a3;
@end

@implementation OVMarisaTrie

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  p_keyset = (uint64_t *)&self->keyset;
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)&self->keyset.key_blocks_);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)&self->keyset.extra_blocks_);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(p_keyset);
  JUMPOUT(0x22A6564E0);
}

- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void *, void *))a5;
  marisa::Agent::Agent((marisa::Agent *)v13);
  marisa::Agent::set_query((marisa::Agent *)v13);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v13);
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  v10 = (void *)[[NSString alloc] initWithBytes:v14 length:v15 + ~a4 encoding:4];
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v8 + v9 - a4 length:a4];
  v7[2](v7, v10, v11);

  marisa::Agent::~Agent((marisa::Agent *)v13);
  return 1;
}

- (id)reverseLookupRow:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  marisa::Agent::Agent((marisa::Agent *)v6);
  marisa::Agent::set_query((marisa::Agent *)v6);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v6);
  v4 = (void *)[[NSString alloc] initWithBytes:v6[3] length:v7 encoding:4];
  marisa::Agent::~Agent((marisa::Agent *)v6);
  return v4;
}

- (void)lookupPrefix:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *, void))a4;
  marisa::Agent::Agent((marisa::Agent *)v22);
  id v8 = v6;
  marisa::Agent::set_query((marisa::Agent *)v22, (const char *)[v8 UTF8String]);
  p_trie = &self->trie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)v22))
  {
    v10 = __s;
    size_t v12 = v24;
    uint64_t v11 = v25;
    v13 = strchr(__s, 255);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v21 = 0;
    if (v13) {
      uint64_t v14 = std::string::basic_string[abi:ne180100](&__dst, v10, v13 - v10);
    }
    else {
      uint64_t v14 = std::string::basic_string[abi:ne180100](&__dst, v10, v12);
    }
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = __dst;
    uint64_t v21 = v19;
    unsigned int v15 = (void *)MEMORY[0x22A656D00](v14);
    if (v21 >= 0) {
      uint64_t v16 = __p;
    }
    else {
      uint64_t v16 = (void **)__p[0];
    }
    v17 = [NSString stringWithUTF8String:v16];
    v7[2](v7, v17, v11);

    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
  }
  marisa::Agent::~Agent((marisa::Agent *)v22);
}

- (void)lookupKey:(id)a3 resultBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *, void))a4;
  marisa::Agent::Agent((marisa::Agent *)v19);
  id v8 = [v6 dataUsingEncoding:4];
  id v18 = (id)[v8 mutableCopy];

  if (v18)
  {
    uint64_t v9 = [v18 length];
    *(_WORD *)buf = 255;
    [v18 appendBytes:buf length:2];
    marisa::Agent::set_query((marisa::Agent *)v19, (const char *)[v18 bytes]);
    p_trie = &self->trie;
    while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)v19))
    {
      uint64_t v11 = v20;
      unsigned int v13 = v21;
      uint64_t v12 = v22;
      uint64_t v14 = (void *)MEMORY[0x22A656D00]();
      unsigned int v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 + v9 + 1 length:~v9 + v13];
      v7[2](v7, v15, v12);
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x22A656D00]();
    v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v24 = "-[OVMarisaTrie lookupKey:resultBlock:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to convert NSString to UTF8 NSData. String is:%@", buf, 0x16u);
    }

    v7[2](v7, 0, 0);
  }

  marisa::Agent::~Agent((marisa::Agent *)v19);
}

- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4
{
  id v6 = a3;
  marisa::Agent::Agent((marisa::Agent *)v11);
  id v7 = v6;
  marisa::Agent::set_query((marisa::Agent *)v11, (const char *)[v7 UTF8String]);
  char v8 = marisa::Trie::lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v11);
  char v9 = v8 ^ 1;
  if (!a4) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0) {
    *a4 = v11[9];
  }
  marisa::Agent::~Agent((marisa::Agent *)v11);

  return v8;
}

- (void)enumerateAllRowsWithBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void))a3;
  marisa::Agent::Agent((marisa::Agent *)v16);
  unint64_t v5 = 0;
  p_trie = &self->trie;
  *(void *)&long long v7 = 136315394;
  long long v15 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)v16);
    uint64_t v8 = marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)v16);
    char v9 = v17;
    size_t v11 = v18;
    uint64_t v10 = v19;
    uint64_t v12 = (void *)MEMORY[0x22A656D00](v8);
    std::string::basic_string[abi:ne180100](&__p, v9, v11);
    if (v21 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, v15);
    v4[2](v4, v14, v10);

    if (v21 < 0) {
      operator delete(__p);
    }
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)v16);
}

- (void)enumerateAllEntriesWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void *, void))a3;
  marisa::Agent::Agent((marisa::Agent *)v19);
  unint64_t v5 = 0;
  p_trie = &self->trie;
  *(void *)&long long v7 = 136315394;
  long long v18 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)v19);
    marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)v19);
    uint64_t v8 = __s;
    uint64_t v9 = v21;
    uint64_t v10 = v22;
    size_t v11 = strchr(__s, -1);
    unsigned int v13 = (void *)MEMORY[0x22A656D00](v11, v12);
    int64_t v14 = v11 - v8;
    std::string::basic_string[abi:ne180100](&__p, v8, v11 - v8);
    if (v24 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", p_p, v18);
    v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8[v14 + 1] length:~v14 + v9];
    v4[2](v4, v16, v17, v10);

    if (v24 < 0) {
      operator delete(__p);
    }
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)v19);
}

- (void)buildKeyset
{
}

- (void)writeToURL:(id)a3
{
  id v6 = a3;
  p_trie = &self->trie;
  marisa::Trie::build((marisa::Trie *)&self->trie, (marisa::Keyset *)&self->keyset);
  id v5 = [v6 path];
  marisa::Trie::save((marisa::Trie *)p_trie, (const char *)[v5 UTF8String]);
}

- (void)addRow:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v4 UTF8String]);
  if (v7 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, p_p, 1.0);
  if (v7 < 0) {
    operator delete(__p);
  }
}

- (void)addKey:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v9 = [v6 dataUsingEncoding:4];
  uint64_t v10 = (void *)[v8 initWithData:v9];

  char v13 = -1;
  [v10 appendBytes:&v13 length:1];
  if (v7 && [v7 length]) {
    [v10 appendData:v7];
  }
  id v11 = v10;
  uint64_t v12 = (const char *)[v11 bytes];
  [v11 length];
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v12, 1.0);
}

- (int64_t)count
{
  return marisa::Trie::size((marisa::Trie *)&self->trie);
}

- (OVMarisaTrie)init
{
  v3.receiver = self;
  v3.super_class = (Class)OVMarisaTrie;
  return [(OVMarisaTrie *)&v3 init];
}

- (OVMarisaTrie)initWithURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)OVMarisaTrie;
    id v8 = [(OVMarisaTrie *)&v17 init];
    if (v8)
    {
      id v9 = [v4 path];
      marisa::Trie::mmap((marisa::Trie *)&v8->trie, (const char *)[v9 UTF8String]);

      uint64_t v10 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v4 lastPathComponent];
        uint64_t v12 = marisa::Trie::num_keys((marisa::Trie *)&v8->trie);
        *(_DWORD *)buf = 136315650;
        unsigned int v19 = "-[OVMarisaTrie initWithURL:]";
        __int16 v20 = 2112;
        unsigned int v21 = v11;
        __int16 v22 = 2048;
        uint64_t v23 = v12;
        _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s OVMarisaTrie %@ loaded {count: %lu}", buf, 0x20u);
      }
    }
    self = v8;
    char v13 = self;
  }
  else
  {
    int64_t v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = [v4 path];
      *(_DWORD *)buf = 136315394;
      unsigned int v19 = "-[OVMarisaTrie initWithURL:]";
      __int16 v20 = 2112;
      unsigned int v21 = v15;
      _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to locate marisa trie {path: %@}", buf, 0x16u);
    }
    char v13 = 0;
  }

  return v13;
}

@end