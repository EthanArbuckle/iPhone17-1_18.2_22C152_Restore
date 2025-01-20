@interface GDCFBurstTrie
- (GDCFBurstTrie)initWithPath:(id)a3;
- (unsigned)payloadForString:(id)a3;
- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4;
- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4;
- (void)dealloc;
- (void)runBlockWithTrie:(id)a3;
@end

@implementation GDCFBurstTrie

- (void)runBlockWithTrie:(id)a3
{
}

- (unsigned)payloadForUTF8String:(const char *)a3 length:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (CFBurstTrieContainsUTF8String()) {
    return 0;
  }
  return 0;
}

- (unsigned)payloadForString:(id)a3 range:(_NSRange)a4
{
  v5 = objc_msgSend_substringWithRange_(a3, a2, a4.location, a4.length);
  LODWORD(self) = objc_msgSend_payloadForString_(self, v6, (uint64_t)v5, v7);

  return self;
}

- (unsigned)payloadForString:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  unint64_t v7 = objc_msgSend_length(v3, v4, v5, v6);
  if (CFStringGetCStringPtr(v3, 0x600u)) {
    goto LABEL_2;
  }
  if (v7 <= 0xFF)
  {
    char v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)__s = 0u;
    long long v11 = 0u;
    if (objc_msgSend_getCString_maxLength_encoding_(v3, v8, (uint64_t)__s, 385, 4))
    {
      strlen(__s);
LABEL_2:
      CFBurstTrieContainsUTF8String();
      goto LABEL_3;
    }
  }
  if (v3) {
    CFBurstTrieContains();
  }
LABEL_3:

  return 0;
}

- (void)dealloc
{
  if (self->_trie) {
    CFBurstTrieRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)GDCFBurstTrie;
  [(GDCFBurstTrie *)&v3 dealloc];
}

- (GDCFBurstTrie)initWithPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    long long v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"GDCFBurstTrie.m", 32, @"Invalid parameter not satisfying: %@", @"path");
  }
  v15.receiver = self;
  v15.super_class = (Class)GDCFBurstTrie;
  v9 = [(GDCFBurstTrie *)&v15 init];
  if (v9 && (uint64_t v10 = CFBurstTrieCreateFromFile(), (v9->_trie = (_CFBurstTrie *)v10) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1C6DE6000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not open trie: %@", buf, 0xCu);
    }
    long long v11 = 0;
  }
  else
  {
    long long v11 = v9;
  }

  return v11;
}

@end