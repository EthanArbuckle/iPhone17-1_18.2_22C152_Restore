@interface EMFDefaultAutocompleteCandidateProvider
+ (id)providerFromInvertedIndex:(id)a3;
- (BOOL)isValidToken:(id)a3;
- (EMFDefaultAutocompleteCandidateProvider)initWithBundle:(id)a3;
- (EMFDefaultAutocompleteCandidateProvider)initWithTokens:(id)a3;
- (NSArray)tokens;
- (id)firstMatchForPrefix:(id)a3;
- (id)matchesForPrefix:(id)a3 usingAlgorithm:(unint64_t)a4;
- (void)enumerateCandidatesMatchingPrefix:(id)a3 withEnumerationType:(int64_t)a4 maxCandidates:(unint64_t)a5 usingBlock:(id)a6;
@end

@implementation EMFDefaultAutocompleteCandidateProvider

+ (id)providerFromInvertedIndex:(id)a3
{
  v4 = [a3 termIndex];
  v5 = [v4 allKeys];
  v6 = (void *)[v5 copy];

  v7 = (void *)[objc_alloc((Class)a1) initWithTokens:v6];
  return v7;
}

- (EMFDefaultAutocompleteCandidateProvider)initWithBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 URLForResource:@"vocabulary" withExtension:@"plist"];
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[EMFDefaultAutocompleteCandidateProvider initWithBundle:](v4);
    }
    __assert_rtn("-[EMFDefaultAutocompleteCandidateProvider initWithBundle:]", "EMFDefaultAutocompleteCandidateProvider.m", 35, "vocabularyFileURL");
  }
  v6 = (void *)v5;
  id v10 = 0;
  v7 = [MEMORY[0x1E4F1C978] arrayWithContentsOfURL:v5 error:&v10];
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[EMFDefaultAutocompleteCandidateProvider initWithBundle:]((uint64_t)v6);
    }
    __assert_rtn("-[EMFDefaultAutocompleteCandidateProvider initWithBundle:]", "EMFDefaultAutocompleteCandidateProvider.m", 42, "!deserializationError");
  }
  v8 = [(EMFDefaultAutocompleteCandidateProvider *)self initWithTokens:v7];

  return v8;
}

- (EMFDefaultAutocompleteCandidateProvider)initWithTokens:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFDefaultAutocompleteCandidateProvider;
  uint64_t v5 = [(EMFDefaultAutocompleteCandidateProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;
  }
  return v5;
}

- (id)matchesForPrefix:(id)a3 usingAlgorithm:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    uint64_t v8 = [(EMFDefaultAutocompleteCandidateProvider *)self firstMatchForPrefix:v6];
    objc_super v9 = (void *)v8;
    if (v8)
    {
      v17[0] = v8;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__4;
    v15[4] = __Block_byref_object_dispose__4;
    id v16 = (id)[v6 copy];
    tokens = self->_tokens;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__EMFDefaultAutocompleteCandidateProvider_matchesForPrefix_usingAlgorithm___block_invoke;
    v14[3] = &unk_1E61A9B28;
    v14[4] = v15;
    v12 = [(NSArray *)tokens indexesOfObjectsWithOptions:a4 == 2 passingTest:v14];
    id v10 = [(NSArray *)self->_tokens objectsAtIndexes:v12];

    _Block_object_dispose(v15, 8);
  }

  return v10;
}

uint64_t __75__EMFDefaultAutocompleteCandidateProvider_matchesForPrefix_usingAlgorithm___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)firstMatchForPrefix:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__4;
  id v12 = (id)[v4 copy];
  tokens = self->_tokens;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__EMFDefaultAutocompleteCandidateProvider_firstMatchForPrefix___block_invoke;
  v10[3] = &unk_1E61A9B28;
  v10[4] = v11;
  uint64_t v6 = [(NSArray *)tokens indexOfObjectPassingTest:v10];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_tokens objectAtIndex:v6];
    v7 = (void *)[v8 copy];
  }
  _Block_object_dispose(v11, 8);

  return v7;
}

uint64_t __63__EMFDefaultAutocompleteCandidateProvider_firstMatchForPrefix___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)enumerateCandidatesMatchingPrefix:(id)a3 withEnumerationType:(int64_t)a4 maxCandidates:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = (void (**)(id, void, uint64_t, uint8_t *))a6;
  id v10 = emf_signpost_get_log();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = emf_signpost_get_log();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B8C45000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "YieldAutocompleteCandidates", (const char *)&unk_1B8CB9A5E, buf, 2u);
  }

  v14 = [(EMFDefaultAutocompleteCandidateProvider *)self matchesForPrefix:v8 usingAlgorithm:2];
  v15 = emf_signpost_get_log();
  id v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B8C45000, v16, OS_SIGNPOST_INTERVAL_END, v11, "YieldAutocompleteCandidates", (const char *)&unk_1B8CB9A5E, buf, 2u);
  }

  buf[0] = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v24;
LABEL_9:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v24 != v21) {
        objc_enumerationMutation(v17);
      }
      if (buf[0]) {
        break;
      }
      v9[2](v9, *(void *)(*((void *)&v23 + 1) + 8 * v22), v20 + v22, buf);
      if (v19 == ++v22)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
        v20 += v22;
        if (v19) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
}

- (BOOL)isValidToken:(id)a3
{
  return [(NSArray *)self->_tokens indexOfObject:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void).cxx_destruct
{
}

- (void)initWithBundle:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 bundlePath];
  int v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_1B8C45000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Vocabulary file could not be loaded from the supplied bundle: '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundle:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B8C45000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to deserialize vocabulary file: '%@'", (uint8_t *)&v1, 0xCu);
}

@end