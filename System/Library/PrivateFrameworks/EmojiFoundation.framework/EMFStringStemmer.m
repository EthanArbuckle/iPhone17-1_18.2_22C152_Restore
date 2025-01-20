@interface EMFStringStemmer
+ (id)stemmerLanguageNameForLocale:(id)a3;
+ (id)supportedLanguageNames;
+ (sb_stemmer)_createSnowballStemmerForLocale:(id)a3;
+ (unsigned)supportsLocale:(id)a3;
- (EMFStringStemmer)initWithLocale:(id)a3;
- (NSLocale)locale;
- (id)stemToken:(id)a3;
- (id)stemTokens:(id)a3;
- (unint64_t)encoding;
- (void)dealloc;
- (void)setEncoding:(unint64_t)a3;
@end

@implementation EMFStringStemmer

+ (unsigned)supportsLocale:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() stemmerLanguageNameForLocale:v3];
  v5 = v4;
  if (v4
    && (uint64_t v6 = [v4 cStringUsingEncoding:1]) != 0
    && (v7 = (const char *)v6, v8 = sb_stemmer_list(), (v9 = *v8) != 0))
  {
    v10 = (const char **)(v8 + 1);
    do
    {
      int v11 = strcmp(v9, v7);
      unsigned __int8 v12 = v11 == 0;
      if (!v11) {
        break;
      }
      v13 = *v10++;
      v9 = v13;
    }
    while (v13);
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

+ (id)supportedLanguageNames
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = sb_stemmer_list();
  if (*v3)
  {
    v4 = v3 + 1;
    do
    {
      v5 = objc_msgSend(NSString, "stringWithCString:encoding:");
      [v2 addObject:v5];
    }
    while (*v4++);
  }
  v7 = (void *)[v2 copy];

  return v7;
}

+ (id)stemmerLanguageNameForLocale:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  v5 = [v3 localeWithLocaleIdentifier:@"en"];
  uint64_t v6 = [v4 languageCode];

  v7 = [v5 localizedStringForLanguageCode:v6];
  v8 = [v7 lowercaseString];

  v9 = [v8 componentsSeparatedByString:@" "];
  uint64_t v10 = [v9 firstObject];
  int v11 = (void *)v10;
  if (v10) {
    unsigned __int8 v12 = (void *)v10;
  }
  else {
    unsigned __int8 v12 = v8;
  }
  id v13 = v12;

  return v13;
}

- (EMFStringStemmer)initWithLocale:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFStringStemmer;
  uint64_t v6 = [(EMFStringStemmer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_encoding = 4;
    objc_storeStrong((id *)&v6->_locale, a3);
    v7->_stemmer = (sb_stemmer *)[(id)objc_opt_class() _createSnowballStemmerForLocale:v5];
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    stemmerLock = v7->_stemmerLock;
    v7->_stemmerLock = v8;
  }
  return v7;
}

- (void)dealloc
{
  stemmer = self->_stemmer;
  if (stemmer) {
    sb_stemmer_delete(stemmer);
  }
  v4.receiver = self;
  v4.super_class = (Class)EMFStringStemmer;
  [(EMFStringStemmer *)&v4 dealloc];
}

- (id)stemToken:(id)a3
{
  if (self->_stemmer)
  {
    objc_super v4 = (char *)[a3 cStringUsingEncoding:self->_encoding];
    [(NSLock *)self->_stemmerLock lock];
    int v5 = strlen(v4);
    uint64_t v6 = sb_stemmer_stem((uint64_t)self->_stemmer, v4, v5);
    v7 = (void *)[[NSString alloc] initWithBytes:v6 length:(int)sb_stemmer_length((uint64_t)self->_stemmer) encoding:self->_encoding];
    [(NSLock *)self->_stemmerLock unlock];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)stemTokens:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = -[EMFStringStemmer stemToken:](self, "stemToken:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  unsigned __int8 v12 = (void *)[v5 copy];
  return v12;
}

+ (sb_stemmer)_createSnowballStemmerForLocale:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() stemmerLanguageNameForLocale:v3];

  id v5 = v4;
  id v6 = (sb_stemmer *)sb_stemmer_new((char *)[v5 cStringUsingEncoding:1], "UTF_8");

  return v6;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(unint64_t)a3
{
  self->_encoding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_stemmerLock, 0);
}

@end