@interface NSComplexOrthography
+ (void)initialize;
- (NSComplexOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4;
- (id)dominantScript;
- (id)languageMap;
- (unsigned)orthographyFlags;
- (void)dealloc;
@end

@implementation NSComplexOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSComplexOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v11 = objc_opt_class();
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid script=nil in -[%@ %s]", v11, sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  v13.receiver = self;
  v13.super_class = (Class)NSComplexOrthography;
  id v7 = [(NSComplexOrthography *)&v13 init];
  if (v7)
  {
    *((void *)v7 + 1) = [a3 copy];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a4];
    *((void *)v7 + 2) = v8;
    *((_DWORD *)v7 + 6) = NSOrthographyFlagsForDominantScriptAndLanguageMap(*((void *)v7 + 1), v8);
  }
  return (NSComplexOrthography *)v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSComplexOrthography;
  [(NSComplexOrthography *)&v3 dealloc];
}

- (id)dominantScript
{
  v2 = self->_dominantScript;

  return v2;
}

- (id)languageMap
{
  v2 = self->_languageMap;

  return v2;
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

@end