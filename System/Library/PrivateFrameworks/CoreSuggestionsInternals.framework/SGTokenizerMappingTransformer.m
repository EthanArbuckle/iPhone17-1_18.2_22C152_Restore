@interface SGTokenizerMappingTransformer
+ (id)_purgeableNLTaggerWithNameTagging:(BOOL)a3;
+ (id)_purgeableNSLinguisticTaggerWithTagSchemes:(id)a3;
+ (id)forLocale:(id)a3;
+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 personalNameMapping:(id)a5 punctuationMapping:(id)a6;
+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7;
+ (id)forLocale:(id)a3 withPersonalNameMapping:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizerMappingTransformer:(id)a3;
- (SGTokenizerMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)initForLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)_createOrReuseNLPTagger;
- (void)transformWithCoreNLP:(id)a3 block:(id)a4;
- (void)transformWithNLLinguisticTagger:(id)a3 block:(id)a4;
@end

@implementation SGTokenizerMappingTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_personalNameMapping, 0);
  objc_storeStrong((id *)&self->_punctuationMapping, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locale hash];
  uint64_t v4 = self->_nameTagging - v3 + 32 * v3;
  uint64_t v5 = self->_trustCoreNLP - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_personalNameMapping hash] - v5 + 32 * v5;
  return [(NSString *)self->_punctuationMapping hash] - v6 + 32 * v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGTokenizerMappingTransformer *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGTokenizerMappingTransformer *)self isEqualToTokenizerMappingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToTokenizerMappingTransformer:(id)a3
{
  uint64_t v4 = (id *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  locale = self->_locale;
  v7 = (NSString *)v4[5];
  if (locale == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = locale;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
  }
  if (self->_nameTagging != *((unsigned __int8 *)v5 + 16) || self->_trustCoreNLP != *((unsigned __int8 *)v5 + 17)) {
    goto LABEL_10;
  }
  personalNameMapping = self->_personalNameMapping;
  v12 = (NSString *)v5[4];
  if (personalNameMapping == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = personalNameMapping;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_10:
      char v16 = 0;
      goto LABEL_11;
    }
  }
  v18 = self->_punctuationMapping;
  v19 = v18;
  if (v18 == v5[3]) {
    char v16 = 1;
  }
  else {
    char v16 = -[NSString isEqual:](v18, "isEqual:");
  }

LABEL_11:
  return v16;
}

- (SGTokenizerMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"LOCALE"];
  v8 = [v6 objectForKeyedSubscript:@"NAME_TAGGING"];
  uint64_t v9 = [v8 BOOLValue];
  char v10 = [v6 objectForKeyedSubscript:@"TRUST_CORENLP"];
  uint64_t v11 = [v10 BOOLValue];
  v12 = [v6 objectForKeyedSubscript:@"PERSONAL_NAME_MAPPING"];
  v13 = [v6 objectForKeyedSubscript:@"PUNCTUATION_MAPPING"];

  v14 = [(SGTokenizerMappingTransformer *)self initForLocale:v7 tagNames:v9 trustCoreNLP:v11 personalNameMapping:v12 punctuationMapping:v13];
  return v14;
}

- (id)toPlistWithChunks:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"NAME_TAGGING";
  uint64_t v4 = [NSNumber numberWithBool:self->_nameTagging];
  v13[0] = v4;
  v12[1] = @"TRUST_CORENLP";
  uint64_t v5 = [NSNumber numberWithBool:self->_trustCoreNLP];
  v12[2] = @"LOCALE";
  locale = self->_locale;
  v13[1] = v5;
  v13[2] = locale;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v8 = (void *)[v7 mutableCopy];

  punctuationMapping = self->_punctuationMapping;
  if (punctuationMapping) {
    [v8 setObject:punctuationMapping forKeyedSubscript:@"PUNCTUATION_MAPPING"];
  }
  personalNameMapping = self->_personalNameMapping;
  if (personalNameMapping) {
    [v8 setObject:personalNameMapping forKeyedSubscript:@"PERSONAL_NAME_MAPPING"];
  }
  return v8;
}

- (id)transform:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGTokenizerMappingTransformer.m", 281, @"Invalid parameter not satisfying: %@", @"[input isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  id v6 = v5;
  v7 = objc_opt_new();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__33765;
  v23[4] = __Block_byref_object_dispose__33766;
  id v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[4] = 0;
  v21[5] = 0;
  v21[3] = "";
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__SGTokenizerMappingTransformer_transform___block_invoke;
  v14[3] = &unk_1E65BC1C8;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  v18 = v23;
  v19 = v22;
  v20 = v21;
  id v16 = v9;
  v17 = self;
  char v10 = (void *)MEMORY[0x1CB79B4C0](v14);
  [(SGTokenizerMappingTransformer *)self transformWithCoreNLP:v8 block:v10];
  if ([v8 length] && !objc_msgSend(v9, "count")) {
    [(SGTokenizerMappingTransformer *)self transformWithNLLinguisticTagger:v8 block:v10];
  }
  id v11 = v9;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

  return v11;
}

void __43__SGTokenizerMappingTransformer_transform___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v31 = a2;
  v7 = (void *)MEMORY[0x1CB79B230]();
  id v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  if ([v8 hasPrefix:@"SG_"])
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = +[SGTokenString stringWithString:range:](SGTokenString, "stringWithString:range:", v8, a3, a4);
LABEL_26:
    id v16 = (id)v10;
    [v9 addObject:v10];
LABEL_27:

    goto LABEL_28;
  }
  int v11 = [v8 isEqualToString:@"SG"];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  if (v11)
  {
    *(void *)(v12 + 40) = &unk_1F2537840;

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 40) count];
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    *(void *)(v14 + 32) = a3;
    *(void *)(v14 + 40) = a4;
  }
  else if (v13)
  {
    id v15 = [v13 objectForKey:v8];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        while ((unint64_t)[*(id *)(a1 + 40) count] > *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                                  + 8)
                                                                                      + 24))
          [*(id *)(a1 + 40) removeLastObject];
        v25 = *(void **)(a1 + 40);
        v26 = +[SGTokenString stringWithString:range:](SGTokenString, "stringWithString:range:", v16, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), [v16 length]);
        [v25 addObject:v26];

        uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
        v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = 0;

        goto LABEL_27;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        v30 = [NSString stringWithUTF8String:"-[SGTokenizerMappingTransformer transform:]_block_invoke"];
        [v29 handleFailureInFunction:v30 file:@"SGTokenizerMappingTransformer.m" lineNumber:318 description:@"Must be a dictionary"];
      }
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      id v20 = v15;
      v18 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v20;
    }
    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;
    }
  }
  if (([v31 isEqualToString:*MEMORY[0x1E4F5C748]] & 1) != 0
    || ([v31 isEqualToString:*MEMORY[0x1E4F5C728]] & 1) != 0
    || (id)*MEMORY[0x1E4F28508] == v31
    || (id)*MEMORY[0x1E4F28548] == v31)
  {
    id v22 = *(id *)(*(void *)(a1 + 48) + 24);

    uint64_t v21 = 0;
    id v8 = v22;
    if (!v22) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  if (([v31 isEqualToString:*MEMORY[0x1E4F5C738]] & 1) == 0 && (id)*MEMORY[0x1E4F28500] != v31)
  {
    uint64_t v21 = 0;
    if (!v8) {
      goto LABEL_28;
    }
LABEL_25:
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", v8, a3, a4, v21);
    goto LABEL_26;
  }
  v23 = *(void **)(*(void *)(a1 + 48) + 32);
  if (v23)
  {
    id v24 = v23;

    uint64_t v21 = 6;
    id v8 = v24;
    goto LABEL_25;
  }
  uint64_t v21 = 6;
  if (v8) {
    goto LABEL_25;
  }
LABEL_28:
}

- (void)transformWithNLLinguisticTagger:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = getTokenizerDispatchQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SGTokenizerMappingTransformer_transformWithNLLinguisticTagger_block___block_invoke;
  block[3] = &unk_1E65BFFF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __71__SGTokenizerMappingTransformer_transformWithNLLinguisticTagger_block___block_invoke(void *a1)
{
  id v8 = [*(id *)(a1[4] + 8) result];
  [v8 setString:a1[5]];
  if (*(unsigned char *)(a1[4] + 16))
  {
    v2 = [v8 tagSchemes];
    NSUInteger v3 = (void *)*MEMORY[0x1E4F28528];
    int v4 = [v2 containsObject:*MEMORY[0x1E4F28528]];
    id v5 = (void *)*MEMORY[0x1E4F28540];
    if (v4) {
      id v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = (id)*MEMORY[0x1E4F28540];
  }
  id v7 = [v8 string];
  objc_msgSend(v8, "enumerateTagsInRange:scheme:options:usingBlock:", 0, objc_msgSend(v7, "length"), v6, 4, a1[6]);

  [v8 setString:@"⌘"];
}

- (void)transformWithCoreNLP:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = getTokenizerDispatchQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SGTokenizerMappingTransformer_transformWithCoreNLP_block___block_invoke;
  block[3] = &unk_1E65BFFF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __60__SGTokenizerMappingTransformer_transformWithCoreNLP_block___block_invoke(id *a1)
{
  v2 = (const void *)[a1[4] _createOrReuseNLPTagger];
  NSUInteger v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:*((void *)a1[4] + 5)];
  [a1[5] length];
  NLTaggerSetLocaleForRange();

  [a1[5] length];
  id v4 = a1[6];
  NLTaggerSetString();
  id v6 = v4;
  id v5 = v4;
  NLTaggerEnumerateTokens();
  NLTaggerSetString();

  CFRelease(v2);
}

- (void)_createOrReuseNLPTagger
{
  NSUInteger v3 = getTokenizerDispatchQueue();
  dispatch_assert_queue_V2(v3);

  BOOL v4 = self->_nameTagging && self->_trustCoreNLP;
  id v5 = +[SGTokenizerMappingTransformer _purgeableNLTaggerWithNameTagging:v4];
  id v6 = [v5 result];

  return v6;
}

- (id)initForLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)SGTokenizerMappingTransformer;
  id v16 = [(SGTokenizerMappingTransformer *)&v28 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_nameTagging = a4;
    objc_storeStrong((id *)&v16->_punctuationMapping, a7);
    objc_storeStrong((id *)&v17->_personalNameMapping, a6);
    objc_storeStrong((id *)&v17->_locale, a3);
    v17->_trustCoreNLP = a5;
    if (v13)
    {
      uint64_t v18 = [MEMORY[0x1E4F28DF0] availableTagSchemesForLanguage:v13];
    }
    else
    {
      if (v17->_nameTagging)
      {
        v30[0] = *MEMORY[0x1E4F28528];
        uint64_t v19 = (void *)MEMORY[0x1E4F1C978];
        id v20 = v30;
      }
      else
      {
        uint64_t v29 = *MEMORY[0x1E4F28540];
        uint64_t v19 = (void *)MEMORY[0x1E4F1C978];
        id v20 = &v29;
      }
      uint64_t v18 = [v19 arrayWithObjects:v20 count:1];
    }
    uint64_t v21 = (void *)v18;
    id v22 = getTokenizerDispatchQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SGTokenizerMappingTransformer_initForLocale_tagNames_trustCoreNLP_personalNameMapping_punctuationMapping___block_invoke;
    block[3] = &unk_1E65BFD88;
    v26 = v17;
    id v27 = v21;
    id v23 = v21;
    dispatch_sync(v22, block);
  }
  return v17;
}

uint64_t __108__SGTokenizerMappingTransformer_initForLocale_tagNames_trustCoreNLP_personalNameMapping_punctuationMapping___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = +[SGTokenizerMappingTransformer _purgeableNSLinguisticTaggerWithTagSchemes:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

+ (id)_purgeableNSLinguisticTaggerWithTagSchemes:(id)a3
{
  id v3 = a3;
  BOOL v4 = getTokenizerDispatchQueue();
  dispatch_assert_queue_V2(v4);

  if (!_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers;
    _purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers = v5;
  }
  id v7 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @"\n");
  id v8 = [(id)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F93B60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__SGTokenizerMappingTransformer__purgeableNSLinguisticTaggerWithTagSchemes___block_invoke;
    v11[3] = &unk_1E65BC1A0;
    id v12 = v3;
    id v8 = (void *)[v9 initWithBlock:v11 idleTimeout:1.0];
    [(id)_purgeableNSLinguisticTaggerWithTagSchemes__purgeableTaggers setObject:v8 forKeyedSubscript:v7];
  }
  return v8;
}

id __76__SGTokenizerMappingTransformer__purgeableNSLinguisticTaggerWithTagSchemes___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28DF0]) initWithTagSchemes:*(void *)(a1 + 32) options:4];
  return v1;
}

+ (id)_purgeableNLTaggerWithNameTagging:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = getTokenizerDispatchQueue();
  dispatch_assert_queue_V2(v4);

  if ((_purgeableNLTaggerWithNameTagging__registeredAssetNotification & 1) == 0)
  {
    _purgeableNLTaggerWithNameTagging__registeredAssetNotification = 1;
    int out_token = 0;
    uint64_t v5 = getTokenizerDispatchQueue();
    notify_register_dispatch("com.apple.MobileAsset.LinguisticData.ma.new-asset-installed", &out_token, v5, &__block_literal_global_33956);
  }
  id v6 = &_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  uint64_t v7 = _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  if (!v3 || _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging)
  {
    id v6 = &_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
    uint64_t v9 = _purgeableNLTaggerWithNameTagging__nlTaggerPlain;
    if (_purgeableNLTaggerWithNameTagging__nlTaggerPlain) {
      goto LABEL_9;
    }
    id v8 = &__block_literal_global_183;
  }
  else
  {
    id v8 = &__block_literal_global_181_33957;
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:v8 idleTimeout:1.0];
  int v11 = (void *)*v6;
  *id v6 = v10;

  uint64_t v7 = _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  uint64_t v9 = _purgeableNLTaggerWithNameTagging__nlTaggerPlain;
LABEL_9:
  if (v3) {
    id v12 = (void *)v7;
  }
  else {
    id v12 = (void *)v9;
  }
  return v12;
}

id __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke_2()
{
  NLPTagger = (void *)_createNLPTagger(0);
  return NLPTagger;
}

id __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke_178()
{
  NLPTagger = (void *)_createNLPTagger(1);
  return NLPTagger;
}

void __67__SGTokenizerMappingTransformer__purgeableNLTaggerWithNameTagging___block_invoke()
{
  v0 = sgLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1CA650000, v0, OS_LOG_TYPE_INFO, "SGTokenizerMappingTransformer reloading NLTagger in response to new asset installation", v3, 2u);
  }

  v1 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerPlain;
  _purgeableNLTaggerWithNameTagging__nlTaggerPlain = 0;

  v2 = (void *)_purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging;
  _purgeableNLTaggerWithNameTagging__nlTaggerWithNameTagging = 0;
}

+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 trustCoreNLP:(BOOL)a5 personalNameMapping:(id)a6 punctuationMapping:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  id v14 = [[SGTokenizerMappingTransformer alloc] initForLocale:v13 tagNames:v9 trustCoreNLP:v8 personalNameMapping:v12 punctuationMapping:v11];

  return v14;
}

+ (id)forLocale:(id)a3 tagNames:(BOOL)a4 personalNameMapping:(id)a5 punctuationMapping:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [[SGTokenizerMappingTransformer alloc] initForLocale:v11 tagNames:v7 trustCoreNLP:0 personalNameMapping:v10 punctuationMapping:v9];

  return v12;
}

+ (id)forLocale:(id)a3 withPersonalNameMapping:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGTokenizerMappingTransformer alloc] initForLocale:v6 tagNames:v5 != 0 trustCoreNLP:0 personalNameMapping:v5 punctuationMapping:0];

  return v7;
}

+ (id)forLocale:(id)a3
{
  id v3 = a3;
  id v4 = [[SGTokenizerMappingTransformer alloc] initForLocale:v3 tagNames:0 trustCoreNLP:0 personalNameMapping:0 punctuationMapping:0];

  return v4;
}

@end