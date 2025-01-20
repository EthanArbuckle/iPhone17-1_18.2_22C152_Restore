@interface NLCFROLanguageRecognizer
+ (id)dominantLanguageForString:(id)a3;
- (NLCFROLanguageRecognizer)init;
- (id)dominantLanguage;
- (id)languageHypothesesWithMaximum:(unint64_t)a3;
- (void)dealloc;
- (void)processString:(id)a3;
- (void)reset;
@end

@implementation NLCFROLanguageRecognizer

- (NLCFROLanguageRecognizer)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F5C8F8];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v3 = NLTaggerCreate();
  if (v3)
  {
    v4 = (void *)v3;
    v9.receiver = self;
    v9.super_class = (Class)NLCFROLanguageRecognizer;
    v5 = [(NLLanguageRecognizer *)&v9 init];
    self = v5;
    if (v5)
    {
      v5->_tagger = v4;
      v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
      string = self->_string;
      self->_string = v6;
    }
  }
  return self;
}

- (void)dealloc
{
  tagger = self->_tagger;
  if (tagger) {
    CFRelease(tagger);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLCFROLanguageRecognizer;
  [(NLLanguageRecognizer *)&v4 dealloc];
}

+ (id)dominantLanguageForString:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F5C8F8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  [v3 arrayWithObjects:v8 count:1];
  v5 = (const void *)NLTaggerCreate();
  NLTaggerSetString();

  v6 = (void *)NLTaggerCopyTagAtIndex();
  CFRelease(v5);

  return v6;
}

- (void)processString:(id)a3
{
  id v4 = a3;
  if ([(NSMutableString *)self->_string length]) {
    [(NSMutableString *)self->_string appendString:@" "];
  }
  [(NSMutableString *)self->_string appendString:v4];
}

- (void)reset
{
  string = self->_string;
  uint64_t v3 = [(NSMutableString *)string length];

  -[NSMutableString replaceCharactersInRange:withString:](string, "replaceCharactersInRange:withString:", 0, v3, &stru_1EFB303D0);
}

- (id)dominantLanguage
{
  NLTaggerSetString();
  v2 = (void *)NLTaggerCopyTagAtIndex();
  NLTaggerSetString();

  return v2;
}

- (id)languageHypothesesWithMaximum:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a3)
  {
    v6 = [(NLCFROLanguageRecognizer *)self dominantLanguage];
    if (v6) {
      [v5 setObject:&unk_1EFB3AAD8 forKey:v6];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end