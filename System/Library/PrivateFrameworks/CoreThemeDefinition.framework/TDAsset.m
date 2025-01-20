@interface TDAsset
+ (BOOL)isTemplateFromImageFilename:(id)a3;
+ (id)_filenameRegex;
+ (int64_t)idiomFromImageFilename:(id)a3;
+ (int64_t)subtypeFromImageFilename:(id)a3;
+ (unsigned)scaleFactorFromImageFilename:(id)a3;
- (BOOL)hasProduction;
- (NSString)baseName;
- (id)_sourceRelativePathComponents;
- (id)fileURLWithDocument:(id)a3;
- (id)sourceRelativePath;
- (unsigned)scaleFactor;
- (void)setScaleFactor:(unsigned int)a3;
@end

@implementation TDAsset

- (void)setScaleFactor:(unsigned int)a3
{
  [(TDAsset *)self willChangeValueForKey:@"scaleFactor"];
  self->_scaleFactor = a3;

  [(TDAsset *)self didChangeValueForKey:@"scaleFactor"];
}

- (unsigned)scaleFactor
{
  [(TDAsset *)self willAccessValueForKey:@"scaleFactor"];
  unsigned int scaleFactor = self->_scaleFactor;
  [(TDAsset *)self didAccessValueForKey:@"scaleFactor"];
  return scaleFactor;
}

- (id)_sourceRelativePathComponents
{
  v3 = (void *)[(TDAsset *)self name];
  v4 = (void *)[(TDAsset *)self category];
  if (![v4 length]) {
    return v3;
  }

  return (id)[v4 stringByAppendingPathComponent:v3];
}

- (id)sourceRelativePath
{
  id v3 = [(TDAsset *)self _sourceRelativePathComponents];
  v4 = objc_msgSend((id)-[TDAsset source](self, "source"), "path");
  if (![v4 length]) {
    return v3;
  }

  return (id)[v4 stringByAppendingPathComponent:v3];
}

- (id)fileURLWithDocument:(id)a3
{
  id v5 = [(TDAsset *)self _sourceRelativePathComponents];
  v6 = objc_msgSend((id)objc_msgSend((id)-[TDAsset source](self, "source"), "fileURLWithDocument:", a3), "path");
  if ([v6 length]) {
    id v5 = (id)[v6 stringByAppendingPathComponent:v5];
  }
  if (!v5) {
    return 0;
  }
  v7 = NSURL;

  return (id)[v7 fileURLWithPath:v5 isDirectory:0];
}

- (BOOL)hasProduction
{
  return 0;
}

+ (id)_filenameRegex
{
  if (_filenameRegex_onceToken != -1) {
    dispatch_once(&_filenameRegex_onceToken, &__block_literal_global_0);
  }
  return (id)_filenameRegex_sFilenameRegex;
}

uint64_t __25__TDAsset__filenameRegex__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"(Template)?((-568h)|(-163r))?(@[[:digit:]]+x)?(~[[:alnum:]]+)?.(\\w+)$" options:1 error:0];
  _filenameRegex_sFilenameRegex = result;
  return result;
}

- (NSString)baseName
{
  id v3 = objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", -[TDAsset name](self, "name"), 0, 0, objc_msgSend((id)-[TDAsset name](self, "name"), "length"));
  if (![v3 count]) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "rangeAtIndex:", 0);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v6 = v4;
  v7 = (void *)[(TDAsset *)self name];

  return (NSString *)[v7 substringToIndex:v6];
}

+ (unsigned)scaleFactorFromImageFilename:(id)a3
{
  if ([a3 length]) {
    uint64_t v4 = objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  }
  else {
    uint64_t v4 = 0;
  }
  if (![v4 count]) {
    return 1;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", 0), "rangeAtIndex:", 5);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  v8 = objc_msgSend(a3, "substringWithRange:", v5 + 1, v6 - 2);

  return [v8 intValue];
}

+ (BOOL)isTemplateFromImageFilename:(id)a3
{
  id v3 = objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  uint64_t v4 = [v3 count];
  if (v4) {
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "rangeAtIndex:", 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

+ (int64_t)idiomFromImageFilename:(id)a3
{
  uint64_t v4 = objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  int64_t result = [v4 count];
  if (result)
  {
    uint64_t v6 = (void *)[v4 objectAtIndex:0];
    uint64_t v7 = [v6 rangeAtIndex:6];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      if ([v6 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL) {
        return 2;
      }
      else {
        return 1;
      }
    }
    else
    {
      v9 = objc_msgSend(a3, "substringWithRange:", v7, v8);
      if ([v9 caseInsensitiveCompare:@"~ipad"])
      {
        if ([v9 caseInsensitiveCompare:@"~iphone"])
        {
          if ([v9 caseInsensitiveCompare:@"~appletv"])
          {
            if ([v9 caseInsensitiveCompare:@"~stark"])
            {
              if ([v9 caseInsensitiveCompare:@"~watch"]) {
                return 0;
              }
              return 5;
            }
            else
            {
              return 4;
            }
          }
          else
          {
            return 3;
          }
        }
        else
        {
          return 1;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

+ (int64_t)subtypeFromImageFilename:(id)a3
{
  id v3 = objc_msgSend(+[TDAsset _filenameRegex](TDAsset, "_filenameRegex"), "matchesInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (![v3 count]) {
    return 0;
  }
  uint64_t v4 = (void *)[v3 objectAtIndex:0];
  if ([v4 rangeAtIndex:3] != 0x7FFFFFFFFFFFFFFFLL) {
    return 568;
  }
  if ([v4 rangeAtIndex:4] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return 163;
}

@end