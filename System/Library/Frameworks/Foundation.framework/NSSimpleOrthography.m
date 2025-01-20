@interface NSSimpleOrthography
+ (BOOL)supportsSecureCoding;
+ (id)orthographyWithFlags:(unsigned int)a3;
+ (void)initialize;
- (Class)classForCoder;
- (NSSimpleOrthography)initWithCoder:(id)a3;
- (NSSimpleOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4;
- (NSSimpleOrthography)initWithFlags:(unsigned int)a3;
- (id)allLanguages;
- (id)allScripts;
- (id)dominantLanguage;
- (id)dominantLanguageForScript:(id)a3;
- (id)dominantScript;
- (id)languageMap;
- (id)languagesForScript:(id)a3;
- (unsigned)orthographyFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSSimpleOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)orthographyWithFlags:(unsigned int)a3
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithFlags:*(void *)&a3];

  return v3;
}

- (NSSimpleOrthography)initWithFlags:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v7 = objc_opt_class();
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid orthographyFlags=0 in -[%@ %s]", v7, sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)NSSimpleOrthography;
  result = [(NSSimpleOrthography *)&v9 init];
  if (result) {
    result->_orthographyFlags = a3;
  }
  return result;
}

- (NSSimpleOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  if (!a3)
  {
    uint64_t v8 = objc_opt_class();
    objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid script=nil in -[%@ %s]", v8, sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0]);
  }
  uint64_t v5 = NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4);

  return [(NSSimpleOrthography *)self initWithFlags:v5];
}

- (Class)classForCoder
{
  return (Class)NSSimpleOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSSimpleOrthography *)self orthographyFlags];
  int v5 = v4;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt32:v4 forKey:@"NSOrthographyFlags"];
  }
  else
  {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "I", &v5);
  }
}

- (NSSimpleOrthography)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = 0;
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeInt32ForKey:@"NSOrthographyFlags"];
    unsigned int v11 = v6;
    return [(NSSimpleOrthography *)self initWithFlags:v6];
  }
  uint64_t v7 = [a3 versionForClassName:@"NSSimpleOrthography"];
  if (v7 == 1)
  {
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "I", &v11);
    uint64_t v6 = v11;
    return [(NSSimpleOrthography *)self initWithFlags:v6];
  }
  uint64_t v9 = v7;
  uint64_t v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v10, 1, v9);
  [(NSSimpleOrthography *)self dealloc];
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dominantScript
{
  uint64_t v2 = [(NSSimpleOrthography *)self orthographyFlags] >> 27;
  if (!v2) {
    return 0;
  }
  if (v2 == 1) {
    return @"Zyyy";
  }

  return (id)objc_msgSend(&unk_1ECAB80F0, "objectAtIndex:");
}

- (id)languageMap
{
  unsigned int v2 = [(NSSimpleOrthography *)self orthographyFlags];

  return NSOrthographyLanguageMapForFlags(v2);
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

- (id)languagesForScript:(id)a3
{
  id result = NSOrthographyDominantLanguageForFlagsAndScriptIndex(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"), [&unk_1ECAB7F88 indexOfObject:a3]);
  if (result)
  {
    id v4 = result;
    int v5 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v5 arrayWithObject:v4];
  }
  return result;
}

- (id)dominantLanguageForScript:(id)a3
{
  unsigned int v4 = [(NSSimpleOrthography *)self orthographyFlags];
  uint64_t v5 = [&unk_1ECAB7F88 indexOfObject:a3];

  return NSOrthographyDominantLanguageForFlagsAndScriptIndex(v4, v5);
}

- (id)dominantLanguage
{
  unsigned int v2 = [(NSSimpleOrthography *)self orthographyFlags];

  return NSOrthographyDominantLanguageForFlagsAndScriptIndex(v2, v2 >> 27);
}

- (id)allScripts
{
  unsigned int v2 = [(NSSimpleOrthography *)self orthographyFlags];

  return NSOrthographyAllScriptsForFlags(v2);
}

- (id)allLanguages
{
  unsigned int v2 = [(NSSimpleOrthography *)self orthographyFlags];

  return NSOrthographyAllLanguagesForFlags(v2);
}

@end