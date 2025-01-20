@interface NLLexicon
+ (NLLexicon)lexiconWithOptions:(id)a3 error:(id *)a4;
- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4;
- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4;
- (NLLexicon)initWithLocalization:(id)a3;
- (NLLexicon)initWithLocalization:(id)a3 error:(id *)a4;
- (NSString)localization;
- (_LXLexicon)lexicon;
- (id)description;
- (id)entryForString:(id)a3;
- (id)entryForTokenID:(unsigned int)a3;
- (id)language;
- (id)languages;
- (int64_t)lexiconType;
- (void)_enumerateEntriesForString:(id)a3 usingBlock:(id)a4;
- (void)dealloc;
- (void)enumerateCompletionsForPrefix:(id)a3 usingBlock:(id)a4;
@end

@implementation NLLexicon

- (NLLexicon)initWithLocalization:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = 0;
  v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F72440], v7, *MEMORY[0x1E4F72458], 0);
  uint64_t v10 = LXLexiconCreate();
  if (v10)
  {
    v11 = (const void *)v10;
    v20.receiver = self;
    v20.super_class = (Class)NLLexicon;
    v12 = [(NLLexicon *)&v20 init];
    if (v12)
    {
      uint64_t v13 = [v6 copy];
      localization = v12->_localization;
      v12->_localization = (NSString *)v13;

      v12->_lexicon = v11;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    if (a4)
    {
      v16 = [NSString stringWithFormat:@"Failed to load lexicon for %@", v6];
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = v16;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      *a4 = [v17 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:10 userInfo:v18];
    }
    v15 = 0;
  }

  return v15;
}

- (NLLexicon)initWithLocalization:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  v5 = [(NLLexicon *)self initWithLocalization:v4 error:&v9];
  id v6 = v9;
  v7 = v6;
  if (v6) {
    NSLog(&cfstr_LexiconCreatio.isa, v4, v6);
  }

  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)NLLexicon;
  id v4 = [(NLLexicon *)&v7 description];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"%@(%@"), v4, self->_localization;

  [v5 appendString:@""]);

  return v5;
}

- (void)dealloc
{
  lexicon = self->_lexicon;
  if (lexicon) {
    CFRelease(lexicon);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLLexicon;
  [(NLLexicon *)&v4 dealloc];
}

- (_LXLexicon)lexicon
{
  return (_LXLexicon *)self->_lexicon;
}

- (void)_enumerateEntriesForString:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[NLLexiconCursor alloc] initWithLexicon:self string:v7];

  [(NLLexiconCursor *)v8 _enumerateEntriesUsingBlock:v6];
}

- (id)entryForTokenID:(unsigned int)a3
{
  uint64_t v3 = LXLexiconCopyEntryForTokenID();
  if (v3)
  {
    objc_super v4 = (const void *)v3;
    v5 = (const void *)LXEntryCopyString();
    uint64_t TokenID = LXEntryGetTokenID();
    unsigned int MetaFlags = LXEntryGetMetaFlags();
    LXEntryGetProbability();
    id v8 = +[NLLexiconEntry entryWithString:tokenID:flags:probability:](NLLexiconEntry, "entryWithString:tokenID:flags:probability:", v5, TokenID, MetaFlags);
    if (v5) {
      CFRelease(v5);
    }
    CFRelease(v4);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)entryForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__NLLexicon_entryForString___block_invoke;
  v8[3] = &unk_1E5C53A08;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(NLLexicon *)self _enumerateEntriesForString:v5 usingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __28__NLLexicon_entryForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5, double a6)
{
  id v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    uint64_t v11 = +[NLLexiconEntry entryWithString:v14 tokenID:a3 flags:a4 probability:a6];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a5 = 1;
  }
}

- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  id v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  unint64_t v18 = 0xC03E000000000000;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NLLexicon_getProbabilityForString_probability___block_invoke;
  v11[3] = &unk_1E5C53A30;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = &v15;
  id v14 = &v19;
  [(NLLexicon *)self _enumerateEntriesForString:v7 usingBlock:v11];
  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a4 && *((unsigned char *)v20 + 24)) {
    *a4 = v16[3];
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __49__NLLexicon_getProbabilityForString_probability___block_invoke(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (result)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4
{
  id v5 = (const void *)LXLexiconCopyEntryForTokenID();
  if (v5)
  {
    LXEntryGetProbability();
    uint64_t v7 = v6;
    CFRelease(v5);
    if (a4) {
      *(void *)a4 = v7;
    }
  }
  return v5 != 0;
}

- (void)enumerateCompletionsForPrefix:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[NLLexiconCursor alloc] initWithLexicon:self string:v7];

  [(NLLexiconCursor *)v8 enumerateCompletionsUsingBlock:v6];
}

+ (NLLexicon)lexiconWithOptions:(id)a3 error:(id *)a4
{
  id v5 = localizationForOptions(a3);
  id v6 = [[NLLexicon alloc] initWithLocalization:v5 error:a4];

  return v6;
}

- (id)language
{
  return @"und";
}

- (id)languages
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NLLexicon *)self language];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)lexiconType
{
  return 0;
}

- (void).cxx_destruct
{
}

@end