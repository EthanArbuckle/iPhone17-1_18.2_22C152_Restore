@interface ObjcLatinNormalizer
- (BOOL)stripAccents;
- (BOOL)toLower;
- (BOOL)trimSpaces;
- (NSDictionary)letterNormalizations;
- (NSDictionary)numberNormalizations;
- (NSString)letterNormalizationPattern;
- (NSString)numberNormalizationPattern;
- (ObjcLatinNormalizer)initWithParams:(BOOL)a3 trimSpaces:(BOOL)a4 punctMode:(int)a5 stripAccents:(BOOL)a6;
- (id)normalize:(id)a3 :(id)a4;
- (id)normalizeUnicode:(id)a3;
- (id)regexpReplace:(id)a3 :(id)a4 :(id)a5;
- (id)replacePunctuation:(id)a3;
- (id)spaceNewlines:(id)a3;
- (id)transformCase:(id)a3 :(id)a4;
- (id)trimConsecutiveSpaces:(id)a3;
- (int)punctMode;
- (void)setLetterNormalizationPattern:(id)a3;
- (void)setLetterNormalizations:(id)a3;
- (void)setNumberNormalizationPattern:(id)a3;
- (void)setNumberNormalizations:(id)a3;
- (void)setPunctMode:(int)a3;
- (void)setStripAccents:(BOOL)a3;
- (void)setToLower:(BOOL)a3;
- (void)setTrimSpaces:(BOOL)a3;
@end

@implementation ObjcLatinNormalizer

- (ObjcLatinNormalizer)initWithParams:(BOOL)a3 trimSpaces:(BOOL)a4 punctMode:(int)a5 stripAccents:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ObjcLatinNormalizer;
  v10 = [(ObjcLatinNormalizer *)&v23 init];
  v11 = v10;
  if (v10)
  {
    [(ObjcLatinNormalizer *)v10 setToLower:v9];
    [(ObjcLatinNormalizer *)v11 setTrimSpaces:v8];
    [(ObjcLatinNormalizer *)v11 setPunctMode:v7];
    [(ObjcLatinNormalizer *)v11 setStripAccents:v6];
    [(ObjcLatinNormalizer *)v11 setLetterNormalizations:&off_24F1388];
    v12 = [(ObjcLatinNormalizer *)v11 letterNormalizations];
    v13 = [v12 allKeys];
    v14 = [v13 componentsJoinedByString:&stru_24F03A8];
    v15 = [@"[" stringByAppendingString:v14];
    v16 = [v15 stringByAppendingString:@"]"];
    [(ObjcLatinNormalizer *)v11 setLetterNormalizationPattern:v16];

    [(ObjcLatinNormalizer *)v11 setNumberNormalizations:&off_24F13B0];
    v17 = [(ObjcLatinNormalizer *)v11 numberNormalizations];
    v18 = [v17 allKeys];
    v19 = [v18 componentsJoinedByString:&stru_24F03A8];
    v20 = [@"[" stringByAppendingString:v19];
    v21 = [v20 stringByAppendingString:@"]"];
    [(ObjcLatinNormalizer *)v11 setNumberNormalizationPattern:v21];
  }
  return v11;
}

- (id)normalize:(id)a3 :(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ObjcLatinNormalizer *)self normalizeUnicode:a3];
  BOOL v8 = [(ObjcLatinNormalizer *)self spaceNewlines:v7];
  BOOL v9 = [(ObjcLatinNormalizer *)self replacePunctuation:v8];
  v10 = [(ObjcLatinNormalizer *)self transformCase:v9 :v6];

  v11 = [(ObjcLatinNormalizer *)self trimConsecutiveSpaces:v10];

  return v11;
}

- (id)transformCase:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ObjcLatinNormalizer *)self toLower])
  {
    id v8 = [v6 lowercaseStringWithLocale:v7];
  }
  else
  {
    id v8 = v6;
  }
  BOOL v9 = v8;

  return v9;
}

- (id)spaceNewlines:(id)a3
{
  return [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}

- (id)trimConsecutiveSpaces:(id)a3
{
  id v4 = a3;
  if ([(ObjcLatinNormalizer *)self trimSpaces])
  {
    id v5 = [v4 length];
    id v6 = malloc_type_malloc(2 * (void)v5 + 2, 0x1000040BDFB0063uLL);
    id v7 = malloc_type_malloc(2 * (void)v5 + 2, 0x1000040BDFB0063uLL);
    id v18 = v4;
    objc_msgSend(v4, "getCharacters:range:", v6, 0, v5);
    id v8 = +[NSCharacterSet whitespaceCharacterSet];
    if (v5)
    {
      BOOL v9 = 0;
      char v10 = 0;
      char v11 = 0;
      uint64_t v12 = 0;
      char v13 = 1;
      do
      {
        unsigned __int16 v14 = v6[(void)v9];
        unsigned int v15 = [v8 characterIsMember:v14];
        if (!v15 || (v11 |= v9 == 0, v10 |= (char *)v5 - 1 == v9, (v13 & 1) != 0)) {
          v7[v12++] = v14;
        }
        char v13 = v15 ^ 1;
        ++v9;
      }
      while (v5 != v9);
    }
    else
    {
      uint64_t v12 = 0;
      char v11 = 0;
      char v10 = 0;
    }
    if (v12 - (v11 & 1) - (v10 & 1) <= 0)
    {
      v16 = &stru_24F03A8;
    }
    else
    {
      +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v7[v11 & 1]);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v4 = v18;
    free(v6);
    free(v7);
  }
  else
  {
    v16 = (__CFString *)v4;
  }

  return v16;
}

- (id)regexpReplace:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a3;
  id v26 = a5;
  id v31 = 0;
  id v8 = +[NSRegularExpression regularExpressionWithPattern:a4 options:1 error:&v31];
  id v23 = v31;
  id v9 = [v7 mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v24 = v7;
  objc_msgSend(v8, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned int v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v16 = (char *)[v15 range];
        uint64_t v18 = v17;
        v19 = &v16[v12];
        v20 = [v8 replacementStringForResult:v15 inString:v9 offset:v12 template:@"$0"];
        v21 = [v26 objectForKeyedSubscript:v20];
        objc_msgSend(v9, "replaceCharactersInRange:withString:", v19, v18, v21);
        v12 += (uint64_t)[v21 length] - v18;
      }
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  return v9;
}

- (id)replacePunctuation:(id)a3
{
  id v4 = a3;
  if ([(ObjcLatinNormalizer *)self punctMode])
  {
    v19 = self;
    id v5 = +[NSCharacterSet whitespaceCharacterSet];
    id v6 = +[NSCharacterSet alphanumericCharacterSet];
    id v7 = +[NSCharacterSet decimalDigitCharacterSet];
    uint64_t v18 = +[NSCharacterSet characterSetWithCharactersInString:@"'’"];
    id v8 = [v4 length];
    id v9 = (unsigned __int16 *)malloc_type_malloc(2 * (void)v8 + 2, 0x1000040BDFB0063uLL);
    id v10 = malloc_type_malloc(2 * (void)v8 + 2, 0x1000040BDFB0063uLL);
    id v17 = v4;
    objc_msgSend(v4, "getCharacters:range:", v9, 0, v8);
    if (v8)
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0;
      unsigned __int8 v13 = 0;
      while (1)
      {
        uint64_t v14 = v9[v11];
        if (([v6 characterIsMember:v14] & 1) == 0
          && ![v5 characterIsMember:v14])
        {
          break;
        }
        v10[v12++] = v14;
        unsigned __int8 v13 = [v7 characterIsMember:v14];
LABEL_19:
        if (v8 == (id)++v11) {
          goto LABEL_24;
        }
      }
      if (![v18 characterIsMember:v14]
        || [(ObjcLatinNormalizer *)v19 punctMode] != 3
        && [(ObjcLatinNormalizer *)v19 punctMode] != 4)
      {
        if ((char *)v11 >= (char *)v8 - 1
          || (((v14 & 0xFFFFFFFD) == 44) & v13) == 0
          || ![v7 characterIsMember:v9[v11 + 1]])
        {
          if ([(ObjcLatinNormalizer *)v19 punctMode] != 1
            && [(ObjcLatinNormalizer *)v19 punctMode] != 3)
          {
            unsigned __int8 v13 = 0;
            goto LABEL_19;
          }
          unsigned __int8 v13 = 0;
          v10[v12] = 32;
          goto LABEL_18;
        }
        unsigned __int8 v13 = 0;
      }
      v10[v12] = v14;
LABEL_18:
      ++v12;
      goto LABEL_19;
    }
    uint64_t v12 = 0;
LABEL_24:
    id v15 = +[NSString stringWithCharacters:v10 length:v12];
    free(v9);
    free(v10);

    id v4 = v17;
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (id)normalizeUnicode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decomposedStringWithCanonicalMapping];
  if ([(ObjcLatinNormalizer *)self stripAccents])
  {
    if (([v5 isEqualToString:v4] & 1) == 0)
    {
      id v6 = [v5 stringByApplyingTransform:NSStringTransformStripDiacritics reverse:0];

      id v5 = [v6 stringByApplyingTransform:NSStringTransformStripCombiningMarks reverse:0];
    }
    id v7 = [(ObjcLatinNormalizer *)self letterNormalizationPattern];
    id v8 = [(ObjcLatinNormalizer *)self letterNormalizations];
    uint64_t v9 = [(ObjcLatinNormalizer *)self regexpReplace:v5 :v7 :v8];

    id v5 = (void *)v9;
  }
  id v10 = [(ObjcLatinNormalizer *)self numberNormalizationPattern];
  unint64_t v11 = [(ObjcLatinNormalizer *)self numberNormalizations];
  uint64_t v12 = [(ObjcLatinNormalizer *)self regexpReplace:v5 :v10 :v11];

  unsigned __int8 v13 = [v12 precomposedStringWithCanonicalMapping];

  return v13;
}

- (BOOL)toLower
{
  return self->_toLower;
}

- (void)setToLower:(BOOL)a3
{
  self->_toLower = a3;
}

- (BOOL)trimSpaces
{
  return self->_trimSpaces;
}

- (void)setTrimSpaces:(BOOL)a3
{
  self->_trimSpaces = a3;
}

- (int)punctMode
{
  return self->_punctMode;
}

- (void)setPunctMode:(int)a3
{
  self->_punctMode = a3;
}

- (BOOL)stripAccents
{
  return self->_stripAccents;
}

- (void)setStripAccents:(BOOL)a3
{
  self->_stripAccents = a3;
}

- (NSDictionary)letterNormalizations
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLetterNormalizations:(id)a3
{
}

- (NSString)letterNormalizationPattern
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLetterNormalizationPattern:(id)a3
{
}

- (NSDictionary)numberNormalizations
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNumberNormalizations:(id)a3
{
}

- (NSString)numberNormalizationPattern
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNumberNormalizationPattern:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberNormalizationPattern, 0);
  objc_storeStrong((id *)&self->_numberNormalizations, 0);
  objc_storeStrong((id *)&self->_letterNormalizationPattern, 0);

  objc_storeStrong((id *)&self->_letterNormalizations, 0);
}

@end