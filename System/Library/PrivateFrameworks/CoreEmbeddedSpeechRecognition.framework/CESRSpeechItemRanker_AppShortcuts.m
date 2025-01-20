@interface CESRSpeechItemRanker_AppShortcuts
- (BOOL)addSet:(id)a3;
- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)hasSets;
- (CESRSpeechItemRanker_AppShortcuts)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5;
- (id)sets;
@end

@implementation CESRSpeechItemRanker_AppShortcuts

- (void).cxx_destruct
{
}

- (BOOL)hasSets
{
  return [(NSMutableDictionary *)self->_setDict count] != 0;
}

- (id)sets
{
  return (id)[(NSMutableDictionary *)self->_setDict allValues];
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  v4 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = [(CESRSpeechItemRanker_AppShortcuts *)self sets];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Ranking %lu AppShortcuts items", buf, 0x16u);
  }
  v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_setDict, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v7 = self->_setDict;
  uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->_setDict objectForKey:v11];
        v13 = [v12 changePublisherWithUseCase:@"SpeechProfile"];
        uint64_t v14 = [v13 sharedItemCount];

        v15 = [NSNumber numberWithUnsignedInteger:v14];
        [v38 setObject:v15 forKey:v11];
      }
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v8);
  }

  v16 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v38;
    _os_log_debug_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_DEBUG, "%s AppShortcuts item count table:\n%@", buf, 0x16u);
  }
  v17 = [v38 keysSortedByValueUsingComparator:&__block_literal_global];
  unsigned int v18 = [(CESRSpeechItemRanker *)self calculateItemLimit];
  unint64_t v19 = [v17 count];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v17;
  uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v20)
  {
    unsigned int v22 = v18;
    uint64_t v35 = *(void *)v46;
    *(void *)&long long v21 = 136315906;
    long long v33 = v21;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        v25 = objc_msgSend(v38, "objectForKey:", v24, v33);
        unint64_t v26 = [v25 unsignedIntegerValue];

        if (v26 >= v22 / v19) {
          unint64_t v27 = v22 / v19;
        }
        else {
          unint64_t v27 = v26;
        }
        v28 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v33;
          *(void *)&buf[4] = "-[CESRSpeechItemRanker_AppShortcuts enumerateRankedItemsWithError:usingBlock:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v54[0]) = v22 / v19;
          WORD2(v54[0]) = 1024;
          *(_DWORD *)((char *)v54 + 6) = v27;
          _os_log_debug_impl(&dword_1B8CCB000, v28, OS_LOG_TYPE_DEBUG, "%s AppShortcuts adding item for app id %@ - fair quota: %u actual taken: %u", buf, 0x22u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        v54[0] = 0;
        v29 = [(NSMutableDictionary *)self->_setDict objectForKey:v24];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __78__CESRSpeechItemRanker_AppShortcuts_enumerateRankedItemsWithError_usingBlock___block_invoke_2;
        v41[3] = &unk_1E61C2A58;
        v43 = buf;
        unint64_t v44 = v27;
        id v42 = v37;
        v40.receiver = self;
        v40.super_class = (Class)CESRSpeechItemRanker_AppShortcuts;
        unsigned __int8 v30 = [(CESRSpeechItemRanker *)&v40 enumerateAllItemsOfSet:v29 error:a3 usingBlock:v41];

        _Block_object_dispose(buf, 8);
        if ((v30 & 1) == 0)
        {
          BOOL v31 = 0;
          goto LABEL_27;
        }
        --v19;
        v22 -= v27;
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  BOOL v31 = 1;
LABEL_27:

  return v31;
}

- (BOOL)addSet:(id)a3
{
  id v4 = a3;
  int v5 = [v4 itemType];
  if (v5 == 12010)
  {
    setDict = self->_setDict;
    v7 = [v4 descriptorWithKey:*MEMORY[0x1E4F57F68]];
    uint64_t v8 = [v7 value];
    [(NSMutableDictionary *)setDict setObject:v4 forKey:v8];
  }
  return v5 == 12010;
}

- (CESRSpeechItemRanker_AppShortcuts)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CESRSpeechItemRanker_AppShortcuts;
  int v5 = [(CESRSpeechItemRanker *)&v9 initWithInstance:a3 speechProfileSite:a4 categoryGroup:a5];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    setDict = v5->_setDict;
    v5->_setDict = v6;
  }
  return v5;
}

@end