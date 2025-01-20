@interface NLLMTokenIDConverter
- (NLLMTokenIDConverter)initWithLanguageModel:(id)a3;
- (NLLanguageModel)languageModel;
- (NLTagger)tagger;
- (id)stringForTokenID:(unsigned int)a3;
- (id)stringForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4;
- (unsigned)tokenIDForString:(id)a3;
- (void)enumerateTokenIDsForString:(id)a3 range:(_NSRange)a4 withBlock:(id)a5;
@end

@implementation NLLMTokenIDConverter

- (NLLMTokenIDConverter)initWithLanguageModel:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)NLLMTokenIDConverter;
    v5 = [(NLLMTokenIDConverter *)&v13 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_languageModel, v4);
      v7 = [NLTagger alloc];
      v14[0] = @"TokenType";
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v9 = [(NLTagger *)v7 initWithTagSchemes:v8];
      tagger = v6->_tagger;
      v6->_tagger = (NLTagger *)v9;
    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)tokenIDForString:(id)a3
{
  id v4 = a3;
  p_languageModel = &self->_languageModel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  v7 = [WeakRetained lexicon];
  v8 = [v7 entryForString:v4];

  if (v8)
  {
    unsigned int v9 = [v8 tokenID];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)p_languageModel);
    unsigned int v9 = [v10 tokenIDForString:v4];
  }
  return v9;
}

- (id)stringForTokenID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_languageModel = &self->_languageModel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  v6 = [WeakRetained lexicon];
  v7 = [v6 entryForTokenID:v3];

  if (v7)
  {
    v8 = [v7 string];
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)p_languageModel);
    v8 = [v9 stringForTokenID:v3];
  }

  return v8;
}

- (id)stringForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  for (i = [MEMORY[0x1E4F28E78] string];
  {
    unsigned int v8 = *a3++;
    if (v8 >= 6)
    {
      uint64_t v9 = -[NLLMTokenIDConverter stringForTokenID:](self, "stringForTokenID:");
      if (v9)
      {
        id v10 = (void *)v9;
        if ([i length])
        {
          v11 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          [v10 rangeOfCharacterFromSet:v11];
          uint64_t v13 = v12;

          if (v13) {
            [i appendString:@" "];
          }
        }
        [i appendString:v10];
      }
    }
  }

  return i;
}

- (void)enumerateTokenIDsForString:(id)a3 range:(_NSRange)a4 withBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  [(NLTagger *)self->_tagger setString:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);
  uint64_t v12 = [WeakRetained language];

  if (v12)
  {
    tagger = self->_tagger;
    id v14 = objc_loadWeakRetained((id *)&self->_languageModel);
    v15 = [v14 language];
    -[NLTagger setLanguage:range:](tagger, "setLanguage:range:", v15, 0, [v9 length]);
  }
  v16 = self->_tagger;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __67__NLLMTokenIDConverter_enumerateTokenIDsForString_range_withBlock___block_invoke;
  v19[3] = &unk_1E5C540B8;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v17 = v10;
  id v18 = v9;
  [(NLTagger *)v16 enumerateTagsInRange:location, length, 0, @"TokenType", 36, v19 unit scheme options usingBlock];
}

uint64_t __67__NLLMTokenIDConverter_enumerateTokenIDsForString_range_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v7 = *(void **)(a1 + 32);
  unsigned int v8 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:");
  [v7 tokenIDForString:v8];

  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  *a5 = 0;
  return result;
}

- (NLLanguageModel)languageModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageModel);

  return (NLLanguageModel *)WeakRetained;
}

- (NLTagger)tagger
{
  return self->_tagger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagger, 0);

  objc_destroyWeak((id *)&self->_languageModel);
}

@end