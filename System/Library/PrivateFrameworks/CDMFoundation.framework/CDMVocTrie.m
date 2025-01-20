@interface CDMVocTrie
+ (id)getTrieURLs:(id)a3;
- (CDMVocTrie)initWithTriePath:(id)a3;
- (id)entriesForText:(id)a3;
- (id)usoGraphForLabel:(id)a3 semantic:(id)a4;
- (int)getUsoNodeIndex:(id)a3 semantic:(id)a4;
- (int64_t)getLabelTrieCount;
- (int64_t)getTextTrieCount;
@end

@implementation CDMVocTrie

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vocUsoNodeIndexTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocUsoTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocSemanticTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocLabelTrieReadOnly, 0);
  objc_storeStrong((id *)&self->vocTextTrieReadOnly, 0);
}

- (int64_t)getTextTrieCount
{
  return (int64_t *)[(OVMarisaTrie *)self->vocTextTrieReadOnly count];
}

- (int64_t)getLabelTrieCount
{
  return (int64_t *)[(OVMarisaTrie *)self->vocLabelTrieReadOnly count];
}

- (int)getUsoNodeIndex:(id)a3 semantic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  if (self->vocUsoNodeIndexTrieReadOnly)
  {
    v8 = [NSString stringWithFormat:@"%@+%@", v6, v7];
    vocUsoNodeIndexTrieReadOnly = self->vocUsoNodeIndexTrieReadOnly;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__CDMVocTrie_getUsoNodeIndex_semantic___block_invoke;
    v12[3] = &unk_2647A5580;
    v12[4] = &v13;
    [(OVMarisaTrie *)vocUsoNodeIndexTrieReadOnly lookupKey:v8 resultBlock:v12];

    int v10 = *((_DWORD *)v14 + 6);
  }
  else
  {
    int v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __39__CDMVocTrie_getUsoNodeIndex_semantic___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getBytes:*(void *)(*(void *)(a1 + 32) + 8) + 24 length:4];
}

- (id)usoGraphForLabel:(id)a3 semantic:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8535;
  v18 = __Block_byref_object_dispose__8536;
  id v19 = 0;
  v8 = [NSString stringWithFormat:@"%@+%@", v6, v7];
  vocUsoTrieReadOnly = self->vocUsoTrieReadOnly;
  if (vocUsoTrieReadOnly)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__CDMVocTrie_usoGraphForLabel_semantic___block_invoke;
    v13[3] = &unk_2647A5580;
    v13[4] = &v14;
    [(OVMarisaTrie *)vocUsoTrieReadOnly lookupKey:v8 resultBlock:v13];
  }
  else
  {
    int v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CDMVocTrie usoGraphForLabel:semantic:]";
      _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s no uso trie loaded", buf, 0xCu);
    }
  }
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __40__CDMVocTrie_usoGraphForLabel_semantic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F71DA8];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithData:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v8
    || ([v8 nodes],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        !v10))
  {
    id v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[CDMVocTrie usoGraphForLabel:semantic:]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s uso graph can't be converted", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
}

- (id)entriesForText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  vocTextTrieReadOnly = self->vocTextTrieReadOnly;
  if (vocTextTrieReadOnly && self->vocLabelTrieReadOnly)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__CDMVocTrie_entriesForText___block_invoke;
    v8[3] = &unk_2647A5558;
    id v9 = v4;
    uint64_t v10 = self;
    id v11 = v5;
    [(OVMarisaTrie *)vocTextTrieReadOnly lookupKey:v9 resultBlock:v8];
  }
  return v5;
}

void __29__CDMVocTrie_entriesForText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(_DWORD *)buf = 0;
    [a2 getBytes:buf length:4];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 16);
    uint64_t v5 = *(unsigned int *)buf;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__CDMVocTrie_entriesForText___block_invoke_20;
    v8[3] = &unk_2647A5530;
    void v8[4] = v3;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v4 reverseLookupKey:v5 dataLength:4 resultBlock:v8];
  }
  else
  {
    uint64_t v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[CDMVocTrie entriesForText:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: VOC trie look up returns nil data for text:%@", buf, 0x16u);
    }
  }
}

void __29__CDMVocTrie_entriesForText___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    unsigned int v10 = 0;
    [a3 getBytes:&v10 length:4];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) reverseLookupRow:v10];
    if (v6)
    {
      uint64_t v7 = [[CDMVocEntry alloc] initWithText:*(void *)(a1 + 40) label:v5 semantic:v6];
      v8 = [*(id *)(a1 + 32) usoGraphForLabel:v5 semantic:v6];
      if (v8)
      {
        uint64_t v9 = [*(id *)(a1 + 32) getUsoNodeIndex:v5 semantic:v6];
        [(CDMVocEntry *)v7 setUsoGraph:v8];
        [(CDMVocEntry *)v7 setNodeIndex:v9];
      }
      [*(id *)(a1 + 48) addObject:v7];
    }
  }
}

- (CDMVocTrie)initWithTriePath:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CDMVocTrie;
  id v5 = [(CDMVocTrie *)&v34 init];
  if (v5)
  {
    if (!v4)
    {
      uint64_t v6 = NSTemporaryDirectory();
      id v4 = [v6 stringByStandardizingPath];
    }
    uint64_t v7 = +[CDMVocTrie getTrieURLs:v4];
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMVocTrie initWithTriePath:]";
      __int16 v37 = 2112;
      v38 = v7;
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Reading VOC trie from %@", buf, 0x16u);
    }

    uint64_t v9 = [OVMarisaTrie alloc];
    unsigned int v10 = [v7 objectAtIndexedSubscript:0];
    uint64_t v11 = [(OVMarisaTrie *)v9 initWithURL:v10];
    vocTextTrieReadOnly = v5->vocTextTrieReadOnly;
    v5->vocTextTrieReadOnly = (OVMarisaTrie *)v11;

    __int16 v13 = [OVMarisaTrie alloc];
    uint64_t v14 = [v7 objectAtIndexedSubscript:1];
    uint64_t v15 = [(OVMarisaTrie *)v13 initWithURL:v14];
    vocLabelTrieReadOnly = v5->vocLabelTrieReadOnly;
    v5->vocLabelTrieReadOnly = (OVMarisaTrie *)v15;

    v17 = [OVMarisaTrie alloc];
    v18 = [v7 objectAtIndexedSubscript:2];
    uint64_t v19 = [(OVMarisaTrie *)v17 initWithURL:v18];
    vocSemanticTrieReadOnly = v5->vocSemanticTrieReadOnly;
    v5->vocSemanticTrieReadOnly = (OVMarisaTrie *)v19;

    v21 = [OVMarisaTrie alloc];
    uint64_t v22 = [v7 objectAtIndexedSubscript:3];
    uint64_t v23 = [(OVMarisaTrie *)v21 initWithURL:v22];
    vocUsoTrieReadOnly = v5->vocUsoTrieReadOnly;
    v5->vocUsoTrieReadOnly = (OVMarisaTrie *)v23;

    v25 = [OVMarisaTrie alloc];
    v26 = [v7 objectAtIndexedSubscript:4];
    uint64_t v27 = [(OVMarisaTrie *)v25 initWithURL:v26];
    vocUsoNodeIndexTrieReadOnly = v5->vocUsoNodeIndexTrieReadOnly;
    v5->vocUsoNodeIndexTrieReadOnly = (OVMarisaTrie *)v27;

    if (!v5->vocTextTrieReadOnly || !v5->vocLabelTrieReadOnly || !v5->vocSemanticTrieReadOnly)
    {
      v31 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        _os_log_error_impl(&dword_2263A0000, v31, OS_LOG_TYPE_ERROR, "%s [ERR]: CDMVocTrie failing to init without required assets", buf, 0xCu);
      }

      v32 = 0;
      goto LABEL_19;
    }
    if (v5->vocUsoTrieReadOnly && v5->vocUsoNodeIndexTrieReadOnly)
    {
      v29 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        v30 = "%s CDMVocTrie Using VOC 2.0 assets that contains USO";
LABEL_22:
        _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, v30, buf, 0xCu);
      }
    }
    else
    {
      v29 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CDMVocTrie initWithTriePath:]";
        v30 = "%s CDMVocTrie Using VOC 1.0 assets that does not contain USO, still relying on CDMVocMapper";
        goto LABEL_22;
      }
    }

    v32 = v5;
LABEL_19:

    goto LABEL_20;
  }
  v32 = 0;
LABEL_20:

  return v32;
}

+ (id)getTrieURLs:(id)a3
{
  id v3 = a3;
  uint64_t v15 = [v3 stringByAppendingPathComponent:@"vocText.trie"];
  id v4 = [v3 stringByAppendingPathComponent:@"vocLabel.trie"];
  id v5 = [v3 stringByAppendingPathComponent:@"vocSemantic.trie"];
  uint64_t v6 = [v3 stringByAppendingPathComponent:@"vocUso.trie"];
  uint64_t v7 = [v3 stringByAppendingPathComponent:@"vocUsoNodeIndex.trie"];

  v8 = [NSURL fileURLWithPath:v15];
  uint64_t v9 = [NSURL fileURLWithPath:v4];
  unsigned int v10 = [NSURL fileURLWithPath:v5];
  uint64_t v11 = [NSURL fileURLWithPath:v6];
  uint64_t v12 = [NSURL fileURLWithPath:v7];
  __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v8, v9, v10, v11, v12, 0);

  return v13;
}

@end