@interface NSOrthography
+ (BOOL)supportsSecureCoding;
+ (NSOrthography)allocWithZone:(_NSZone *)a3;
+ (NSOrthography)defaultOrthographyForLanguage:(NSString *)language;
+ (NSOrthography)orthographyWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map;
+ (id)_orthographyWithDominantScript:(id)a3 languageMap:(id)a4;
+ (id)_scriptNameForScriptIndex:(unint64_t)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSArray)allLanguages;
- (NSArray)allScripts;
- (NSArray)languagesForScript:(NSString *)script;
- (NSDictionary)languageMap;
- (NSOrthography)initWithCoder:(NSCoder *)coder;
- (NSOrthography)initWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map;
- (NSString)dominantLanguage;
- (NSString)dominantLanguageForScript:(NSString *)script;
- (NSString)dominantScript;
- (id)description;
- (id)replacementObjectForPortCoder:(id)a3;
- (unint64_t)hash;
- (unsigned)orthographyFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSOrthography

+ (id)_scriptNameForScriptIndex:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  id result = @"Zyyy";
  if (a3 != 1 && a3 <= 0x1F) {
    return (id)objc_msgSend(&unk_1ECAB80F0, "objectAtIndex:");
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (NSOrthography)allocWithZone:(_NSZone *)a3
{
  if (NSOrthography == a1) {
    a1 = (id)objc_opt_class();
  }

  return (NSOrthography *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSOrthography)orthographyWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
  v4 = (void *)[objc_allocWithZone((Class)a1) initWithDominantScript:script languageMap:map];

  return (NSOrthography *)v4;
}

- (NSOrthography)initWithDominantScript:(NSString *)script languageMap:(NSDictionary *)map
{
}

- (unint64_t)hash
{
  LODWORD(result) = [(NSOrthography *)self orthographyFlags];
  if (result) {
    return result;
  }
  NSUInteger v4 = [(NSString *)[(NSOrthography *)self dominantScript] hash];
  return [(NSDictionary *)[(NSOrthography *)self languageMap] hash] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned int v5 = [(NSOrthography *)self orthographyFlags];
    if (v5)
    {
      LOBYTE(v6) = v5 == [a3 orthographyFlags];
    }
    else
    {
      int v6 = -[NSString isEqualToString:](-[NSOrthography dominantScript](self, "dominantScript"), "isEqualToString:", [a3 dominantScript]);
      if (v6)
      {
        v7 = [(NSOrthography *)self languageMap];
        uint64_t v8 = [a3 languageMap];
        LOBYTE(v6) = [(NSDictionary *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)description
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(NSOrthography *)self dominantScript];
  NSUInteger v4 = [(NSOrthography *)self dominantLanguage];
  unsigned int v5 = [(NSOrthography *)self allScripts];
  int v6 = [(NSOrthography *)self languagesForScript:v3];
  v7 = +[NSString stringWithFormat:@"%@->%@", v3, v4];
  if ([(NSArray *)v6 count] >= 3)
  {
    uint64_t v8 = +[NSString stringWithFormat:@" and %lu other languages", [(NSArray *)v6 count] - 1];
LABEL_5:
    v9 = (__CFString *)v8;
    goto LABEL_7;
  }
  if ([(NSArray *)v6 count] == 2)
  {
    uint64_t v8 = +[NSString stringWithFormat:@" and %@", [(NSArray *)v6 objectAtIndex:1]];
    goto LABEL_5;
  }
  v9 = &stru_1ECA5C228;
LABEL_7:
  if ([(NSArray *)v5 count] < 3)
  {
    if ([(NSArray *)v5 count] != 2)
    {
      v11 = &stru_1ECA5C228;
      goto LABEL_13;
    }
    v10 = +[NSString stringWithFormat:@", plus %@", [(NSArray *)v5 objectAtIndex:1]];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@", plus %lu other scripts", [(NSArray *)v5 count] - 1];
  }
  v11 = (__CFString *)v10;
LABEL_13:
  v13.receiver = self;
  v13.super_class = (Class)NSOrthography;
  return +[NSString stringWithFormat:@"%@{%@%@%@}", [(NSOrthography *)&v13 description], v7, v9, v11];
}

- (Class)classForCoder
{
  return (Class)NSOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v5 = [(NSOrthography *)self dominantScript];
  int v6 = [(NSOrthography *)self languageMap];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v5 forKey:@"NSDominantScript"];
    [a3 encodeObject:v6 forKey:@"NSLanguageMap"];
  }
  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v6];
  }
}

- (NSOrthography)initWithCoder:(NSCoder *)coder
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    id v6 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSDominantScript"];
    if (_NSIsNSString())
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      id v10 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), @"NSLanguageMap");
      if (_NSIsNSDictionary())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          uint64_t v26 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if ((_NSIsNSString() & 1) == 0)
              {

                v23 = @"Orthography language map key is not a string";
                goto LABEL_29;
              }
              v16 = (void *)[v10 objectForKeyedSubscript:v15];
              if ((_NSIsNSArray() & 1) == 0)
              {

                v23 = @"Orthography language map value is not a list of languages";
                goto LABEL_29;
              }
              long long v30 = 0u;
              long long v31 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v27 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v29;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v29 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    if ((_NSIsNSString() & 1) == 0)
                    {

                      v23 = @"Orthography language map list contains non-string language";
                      goto LABEL_29;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v27 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }
              uint64_t v13 = v26;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        return [(NSOrthography *)self initWithDominantScript:v6 languageMap:v10];
      }

      v23 = @"Orthography language map is not a dictionary";
    }
    else
    {

      v23 = @"Orthography dominant script is not a string";
    }
LABEL_29:
    [(NSCoder *)coder failWithError:+[NSError _readCorruptErrorWithFormat:v23]];
  }
  else
  {
    NSInteger v21 = [(NSCoder *)coder versionForClassName:@"NSOrthography"];
    if (v21 == 1)
    {
      id v6 = [(NSCoder *)coder decodeObject];
      id v10 = [(NSCoder *)coder decodeObject];
      return [(NSOrthography *)self initWithDominantScript:v6 languageMap:v10];
    }
    NSInteger v24 = v21;
    v25 = _NSFullMethodName((objc_class *)self, a2);
    NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v25, 1, v24);
    [(NSOrthography *)self dealloc];
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isBycopy] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSOrthography;
    return [(NSOrthography *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

- (NSString)dominantScript
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSOrthography");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)languageMap
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSOrthography");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unsigned)orthographyFlags
{
  v3 = [(NSOrthography *)self dominantScript];
  NSUInteger v4 = [(NSOrthography *)self languageMap];

  return NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)v3, v4);
}

- (NSArray)languagesForScript:(NSString *)script
{
  NSUInteger v4 = [(NSOrthography *)self languageMap];

  return (NSArray *)[(NSDictionary *)v4 objectForKey:script];
}

- (NSString)dominantLanguageForScript:(NSString *)script
{
  v3 = [(NSOrthography *)self languagesForScript:script];
  unint64_t result = [(NSArray *)v3 count];
  if (result)
  {
    return (NSString *)[(NSArray *)v3 objectAtIndex:0];
  }
  return result;
}

- (NSString)dominantLanguage
{
  v3 = [(NSOrthography *)self dominantScript];

  return [(NSOrthography *)self dominantLanguageForScript:v3];
}

- (NSArray)allScripts
{
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSDictionary allKeys](-[NSOrthography languageMap](self, "languageMap"), "allKeys"));
  NSUInteger v4 = [(NSOrthography *)self dominantScript];
  [(NSArray *)v3 removeObject:v4];
  [(NSArray *)v3 insertObject:v4 atIndex:0];
  return v3;
}

- (NSArray)allLanguages
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSOrthography *)self allScripts];
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(NSOrthography *)self languagesForScript:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              if (![(NSArray *)v3 containsObject:v13]) {
                [(NSArray *)v3 addObject:v13];
              }
            }
            uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v5);
  }
  return v3;
}

+ (id)_orthographyWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v6 = NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4);
  if (v6)
  {
    return +[NSSimpleOrthography orthographyWithFlags:v6];
  }
  else
  {
    return +[NSOrthography orthographyWithDominantScript:a3 languageMap:a4];
  }
}

+ (NSOrthography)defaultOrthographyForLanguage:(NSString *)language
{
  uint64_t v5 = objc_msgSend(&unk_1ECAB8060, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:language];
    uint64_t v7 = (void *)[v6 languageCode];
    uint64_t v8 = (__CFString *)[v6 scriptCode];
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (!v9)
    {
      uint64_t v10 = [&unk_1ECAB8078 indexOfObject:v7];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v10;

        uint64_t v5 = v13;
        goto LABEL_16;
      }
      uint64_t v11 = [v7 stringByAppendingString:@"-"];
      unint64_t v12 = 0;
      do
      {
        if (objc_msgSend((id)objc_msgSend(&unk_1ECAB8090, "objectAtIndex:", v12), "hasPrefix:", v11)) {
          uint64_t v5 = v12;
        }
        else {
          uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v12 > 0xF6) {
          break;
        }
        ++v12;
      }
      while (v5 == 0x7FFFFFFFFFFFFFFFLL);
    }

    if (v8) {
      goto LABEL_31;
    }
  }
LABEL_16:
  if ((unint64_t)(v5 - 1) <= 4)
  {
    uint64_t v14 = &unk_1ECAB8168;
    uint64_t v15 = v5;
LABEL_30:
    uint64_t v8 = (__CFString *)[v14 objectAtIndex:v15];
    goto LABEL_31;
  }
  if ((unint64_t)(v5 - 6) <= 0x79)
  {
    uint64_t v14 = &unk_1ECAB8180;
    uint64_t v15 = 6;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 128) <= 0x13)
  {
    uint64_t v14 = &unk_1ECAB8198;
    uint64_t v15 = 8;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 160) <= 0x1B)
  {
    uint64_t v14 = &unk_1ECAB81B0;
    uint64_t v15 = 11;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 192) <= 0xD)
  {
    uint64_t v14 = &unk_1ECAB81C8;
    uint64_t v15 = 12;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 208) <= 2)
  {
    uint64_t v14 = &unk_1ECAB81E0;
    uint64_t v15 = 29;
    goto LABEL_30;
  }
  if ((unint64_t)(v5 - 224) <= 0x18)
  {
    uint64_t v15 = v5 - 217;
    uint64_t v14 = &unk_1ECAB81F8;
    goto LABEL_30;
  }
  uint64_t v8 = 0;
LABEL_31:
  if (!v8) {
    uint64_t v8 = @"Latn";
  }
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", language), v8);

  return (NSOrthography *)[a1 _orthographyWithDominantScript:v8 languageMap:v16];
}

@end