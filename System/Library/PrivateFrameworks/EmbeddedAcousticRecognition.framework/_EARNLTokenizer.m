@interface _EARNLTokenizer
- (BOOL)replacePunctuation;
- (BOOL)toLowerCase;
- (_EARNLTokenizer)init;
- (id)tokenize:(id)a3;
- (id)tokenize:(id)a3 limit:(unint64_t)a4;
- (unint64_t)tagOptions;
- (void)setReplacePunctuation:(BOOL)a3;
- (void)setTagOptions:(unint64_t)a3;
- (void)setToLowerCase:(BOOL)a3;
@end

@implementation _EARNLTokenizer

- (_EARNLTokenizer)init
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_EARNLTokenizer;
  v2 = [(_EARNLTokenizer *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F388F8]);
    v9[0] = *MEMORY[0x1E4F38888];
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v5 = [v3 initWithTagSchemes:v4];
    nlTagger = v2->_nlTagger;
    v2->_nlTagger = (NLTagger *)v5;
  }
  v2->_toLowerCase = 1;
  v2->_replacePunctuation = 1;
  v2->_tagOptions = 36;
  return v2;
}

- (id)tokenize:(id)a3
{
  id v4 = a3;
  [(NLTagger *)self->_nlTagger setString:v4];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  nlTagger = self->_nlTagger;
  uint64_t v7 = [v4 length];
  uint64_t v8 = *MEMORY[0x1E4F38888];
  unint64_t tagOptions = self->_tagOptions;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __28___EARNLTokenizer_tokenize___block_invoke;
  v15[3] = &unk_1E60004D8;
  id v10 = v4;
  id v16 = v10;
  v17 = self;
  id v11 = v5;
  id v18 = v11;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](nlTagger, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v7, 0, v8, tagOptions, v15);
  v12 = v18;
  id v13 = v11;

  return v13;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  uint64_t v5 = [(_EARNLTokenizer *)self tokenize:a3];
  unint64_t v6 = [v5 count];
  if (v6 <= a4)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)toLowerCase
{
  return self->_toLowerCase;
}

- (void)setToLowerCase:(BOOL)a3
{
  self->_toLowerCase = a3;
}

- (BOOL)replacePunctuation
{
  return self->_replacePunctuation;
}

- (void)setReplacePunctuation:(BOOL)a3
{
  self->_replacePunctuation = a3;
}

- (unint64_t)tagOptions
{
  return self->_tagOptions;
}

- (void)setTagOptions:(unint64_t)a3
{
  self->_unint64_t tagOptions = a3;
}

- (void).cxx_destruct
{
}

@end