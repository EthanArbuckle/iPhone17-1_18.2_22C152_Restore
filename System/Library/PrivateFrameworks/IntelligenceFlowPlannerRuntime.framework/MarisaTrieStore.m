@interface MarisaTrieStore
+ (id)logContext;
- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4;
- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5;
- (MarisaTrieStore)init;
- (MarisaTrieStore)initWithURL:(id)a3;
- (id).cxx_construct;
- (id)reverseLookup:(int)a3;
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

@implementation MarisaTrieStore

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  array = self->keyset.key_blocks_.array_;
  if (array)
  {
    uint64_t v6 = *(array - 1);
    v5 = (char *)(array - 1);
    uint64_t v4 = v6;
    if (v6)
    {
      uint64_t v7 = 8 * v4;
      do
      {
        uint64_t v8 = *(void *)&v5[v7];
        if (v8) {
          MEMORY[0x2533D8060](v8, 0x1050C80717B85FCLL);
        }
        v7 -= 8;
      }
      while (v7);
    }
    MEMORY[0x2533D8060](v5 - 8, 0x20C8093837F09);
  }
  sub_25326CC00((uint64_t *)&self->keyset.extra_blocks_);
  sub_25326CC00((uint64_t *)&self->keyset);
  JUMPOUT(0x2533D7F70);
}

- (BOOL)reverseLookupKey:(int)a3 dataLength:(unint64_t)a4 resultBlock:(id)a5
{
  uint64_t v7 = (void (**)(id, void *, void *))a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v17);
  marisa::Agent::set_query((marisa::Agent *)&v17);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)&v17);
  uint64_t v8 = *((void *)&v18 + 1);
  uint64_t v9 = v19;
  id v10 = [NSString alloc];
  v12 = objc_msgSend_initWithBytes_length_encoding_(v10, v11, v8, v9 + ~a4, 4);
  id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
  v15 = objc_msgSend_initWithBytes_length_(v13, v14, v8 + v9 - a4, a4);
  v7[2](v7, v12, v15);

  marisa::Agent::~Agent((marisa::Agent *)&v17);
  return 1;
}

- (id)reverseLookupRow:(int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v10);
  marisa::Agent::set_query((marisa::Agent *)&v10);
  marisa::Trie::reverse_lookup((marisa::Trie *)&self->trie, (marisa::Agent *)&v10);
  uint64_t v4 = *((void *)&v11 + 1);
  uint64_t v5 = v12;
  id v6 = [NSString alloc];
  uint64_t v8 = objc_msgSend_initWithBytes_length_encoding_(v6, v7, v4, v5, 4);
  marisa::Agent::~Agent((marisa::Agent *)&v10);
  return v8;
}

- (id)reverseLookup:(int)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_reverseLookupRow_, *(void *)&a3);
}

- (void)lookupPrefix:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  *(_OWORD *)__s = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v25);
  id v8 = v6;
  long long v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
  marisa::Agent::set_query((marisa::Agent *)&v25, v11);
  p_trie = &self->trie;
  while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)&v25))
  {
    uint64_t v13 = __s[1];
    size_t v15 = v27;
    uint64_t v14 = DWORD1(v27);
    v16 = strchr(__s[1], 255);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v24 = 0;
    if (v16) {
      long long v17 = sub_25326D170(&__dst, v13, v16 - v13);
    }
    else {
      long long v17 = sub_25326D170(&__dst, v13, v15);
    }
    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = __dst;
    uint64_t v24 = v22;
    long long v19 = (void *)MEMORY[0x2533D8220](v17);
    if (v24 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v18, (uint64_t)__p);
    }
    else {
    v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, (uint64_t)__p[0]);
    }
    v7[2](v7, v20, v14);

    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
  }
  marisa::Agent::~Agent((marisa::Agent *)&v25);
}

- (void)lookupKey:(id)a3 resultBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v32);
  uint64_t v9 = objc_msgSend_dataUsingEncoding_(v6, v8, 4);
  id v31 = (id)objc_msgSend_mutableCopy(v9, v10, v11);

  if (v31)
  {
    uint64_t v14 = objc_msgSend_length(v31, v12, v13);
    *(_WORD *)buf = 255;
    objc_msgSend_appendBytes_length_(v31, v15, (uint64_t)buf, 2);
    id v16 = v31;
    long long v19 = (const char *)objc_msgSend_bytes(v16, v17, v18);
    marisa::Agent::set_query((marisa::Agent *)&v32, v19);
    p_trie = &self->trie;
    while (marisa::Trie::predictive_search((marisa::Trie *)p_trie, (marisa::Agent *)&v32))
    {
      uint64_t v21 = *((void *)&v33 + 1);
      unsigned int v23 = v34;
      uint64_t v22 = DWORD1(v34);
      uint64_t v24 = (void *)MEMORY[0x2533D8220]();
      v26 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v25, v21 + v14 + 1, ~v14 + v23);
      v7[2](v7, v26, v22);
    }
  }
  else
  {
    long long v27 = (void *)MEMORY[0x2533D8220]();
    v30 = objc_msgSend_logContext(MarisaTrieStore, v28, v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_error_impl(&dword_252E65000, v30, OS_LOG_TYPE_ERROR, "Unable to convert NSString to UTF8 NSData. String is:%@", buf, 0xCu);
    }

    v7[2](v7, 0, 0);
  }

  marisa::Agent::~Agent((marisa::Agent *)&v32);
}

- (BOOL)lookupRow:(id)a3 outIdx:(int64_t *)a4
{
  id v6 = a3;
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  marisa::Agent::Agent((marisa::Agent *)v14);
  id v7 = v6;
  uint64_t v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  marisa::Agent::set_query((marisa::Agent *)v14, v10);
  char v11 = marisa::Trie::lookup((marisa::Trie *)&self->trie, (marisa::Agent *)v14);
  char v12 = v11 ^ 1;
  if (!a4) {
    char v12 = 1;
  }
  if ((v12 & 1) == 0) {
    *a4 = DWORD1(v15);
  }
  marisa::Agent::~Agent((marisa::Agent *)v14);

  return v11;
}

- (void)enumerateAllRowsWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void))a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v16);
  unint64_t v5 = 0;
  p_trie = &self->trie;
  *(void *)&long long v7 = 138543362;
  long long v15 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)&v16);
    uint64_t v8 = marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)&v16);
    uint64_t v9 = (void *)*((void *)&v17 + 1);
    size_t v11 = v18;
    uint64_t v10 = DWORD1(v18);
    char v12 = (void *)MEMORY[0x2533D8220](v8);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v20 = 0;
    sub_25326D170(__p, v9, v11);
    if (v20 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)__p, v15);
    }
    else {
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)__p[0], v15);
    }
    v4[2](v4, v14, v10);

    if (SHIBYTE(v20) < 0) {
      operator delete(__p[0]);
    }
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)&v16);
}

- (void)enumerateAllEntriesWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void *, void))a3;
  *(_OWORD *)__s = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  marisa::Agent::Agent((marisa::Agent *)&v20);
  unint64_t v5 = 0;
  p_trie = &self->trie;
  *(void *)&long long v7 = 138543362;
  long long v19 = v7;
  while (v5 < marisa::Trie::size((marisa::Trie *)p_trie))
  {
    marisa::Agent::set_query((marisa::Agent *)&v20);
    marisa::Trie::reverse_lookup((marisa::Trie *)p_trie, (marisa::Agent *)&v20);
    uint64_t v8 = __s[1];
    uint64_t v9 = v22;
    uint64_t v10 = DWORD1(v22);
    size_t v11 = strchr(__s[1], -1);
    uint64_t v13 = (void *)MEMORY[0x2533D8220](v11, v12);
    int64_t v14 = v11 - v8;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v24 = 0;
    sub_25326D170(__p, v8, v11 - v8);
    if (v24 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)__p, v19);
    }
    else {
    long long v16 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)__p[0], v19);
    }
    long long v18 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v17, (uint64_t)&v8[v14 + 1], ~v14 + v9);
    v4[2](v4, v16, v18, v10);

    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
    ++v5;
  }
  marisa::Agent::~Agent((marisa::Agent *)&v20);
}

- (void)writeToURL:(id)a3
{
  id v11 = a3;
  p_trie = &self->trie;
  marisa::Trie::build((marisa::Trie *)&self->trie, &self->keyset);
  objc_msgSend_path(v11, v5, v6);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
  marisa::Trie::save((marisa::Trie *)p_trie, v10);
}

- (void)buildKeyset
{
}

- (void)addRow:(id)a3
{
  long long __dst = 0;
  size_t v15 = 0;
  int64_t v16 = 0;
  id v4 = a3;
  id v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25326D218();
  }
  size_t v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    size_t v15 = v9;
    int64_t v16 = v12 | 0x8000000000000000;
    long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v16) = v8;
  p_dst = (void **)&__dst;
  if (v8) {
LABEL_8:
  }
    memmove(p_dst, v7, v9);
  *((unsigned char *)p_dst + v9) = 0;
  if (v16 >= 0) {
    uint64_t v13 = (const char *)&__dst;
  }
  else {
    uint64_t v13 = (const char *)__dst;
  }
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v13, 1.0);
  if (SHIBYTE(v16) < 0) {
    operator delete(__dst);
  }
}

- (void)addKey:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFF990]);
  uint64_t v10 = objc_msgSend_dataUsingEncoding_(v6, v9, 4);
  uint64_t v12 = objc_msgSend_initWithData_(v8, v11, (uint64_t)v10);

  char v23 = -1;
  objc_msgSend_appendBytes_length_(v12, v13, (uint64_t)&v23, 1);
  if (v7 && objc_msgSend_length(v7, v14, v15)) {
    objc_msgSend_appendData_(v12, v16, (uint64_t)v7);
  }
  id v17 = v12;
  long long v20 = (const char *)objc_msgSend_bytes(v17, v18, v19);
  objc_msgSend_length(v17, v21, v22);
  marisa::Keyset::push_back((marisa::Keyset *)&self->keyset, v20, 1.0);
}

- (int64_t)count
{
  return marisa::Trie::size((marisa::Trie *)&self->trie);
}

- (MarisaTrieStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)MarisaTrieStore;
  return [(MarisaTrieStore *)&v3 init];
}

- (MarisaTrieStore)initWithURL:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v5, v6);
  uint64_t v10 = objc_msgSend_path(v4, v8, v9);
  char v12 = objc_msgSend_fileExistsAtPath_(v7, v11, (uint64_t)v10);

  if (v12)
  {
    v35.receiver = self;
    v35.super_class = (Class)MarisaTrieStore;
    id v17 = [(MarisaTrieStore *)&v35 init];
    if (v17)
    {
      objc_msgSend_path(v4, v15, v16);
      id v18 = objc_claimAutoreleasedReturnValue();
      uint64_t v21 = (const char *)objc_msgSend_UTF8String(v18, v19, v20);
      marisa::Trie::mmap((marisa::Trie *)&v17->trie, v21);

      uint64_t v24 = objc_msgSend_logContext(MarisaTrieStore, v22, v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v27 = objc_msgSend_lastPathComponent(v4, v25, v26);
        uint64_t v28 = marisa::Trie::num_keys((marisa::Trie *)&v17->trie);
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v27;
        __int16 v38 = 2048;
        uint64_t v39 = v28;
        _os_log_impl(&dword_252E65000, v24, OS_LOG_TYPE_INFO, "MarisaTrieStore %@ loaded {count: %lu}", buf, 0x16u);
      }
    }
    self = v17;
    uint64_t v29 = self;
  }
  else
  {
    v30 = objc_msgSend_logContext(MarisaTrieStore, v13, v14);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      long long v34 = objc_msgSend_path(v4, v31, v32);
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v34;
      _os_log_error_impl(&dword_252E65000, v30, OS_LOG_TYPE_ERROR, "Unable to locate marisa trie {path: %@}", buf, 0xCu);
    }
    uint64_t v29 = 0;
  }

  return v29;
}

+ (id)logContext
{
  if (qword_269CDA348 != -1) {
    dispatch_once(&qword_269CDA348, &unk_270336258);
  }
  v2 = (void *)qword_269CDA340;
  return v2;
}

@end