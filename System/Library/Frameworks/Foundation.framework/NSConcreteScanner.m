@interface NSConcreteScanner
- (BOOL)caseSensitive;
- (BOOL)scanInt:(int *)a3;
- (BOOL)scanLongLong:(int64_t *)a3;
- (NSConcreteScanner)initWithString:(id)a3;
- (id)_invertedSkipSet;
- (id)charactersToBeSkipped;
- (id)locale;
- (id)string;
- (unint64_t)scanLocation;
- (void)dealloc;
- (void)setCaseSensitive:(BOOL)a3;
- (void)setCharactersToBeSkipped:(id)a3;
- (void)setLocale:(id)a3;
- (void)setScanLocation:(unint64_t)a3;
@end

@implementation NSConcreteScanner

- (id)string
{
  v2 = self->scanString;

  return v2;
}

- (unint64_t)scanLocation
{
  return self->scanLocation;
}

- (id)charactersToBeSkipped
{
  v2 = self->skipSet;

  return v2;
}

- (BOOL)caseSensitive
{
  return *(_DWORD *)&self->flags & 1;
}

- (void)setScanLocation:(unint64_t)a3
{
  unint64_t v6 = [(NSString *)self->scanString length];
  if (v6 < a3)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     v6),
                   0);
    objc_exception_throw(v7);
  }
  self->scanLocation = a3;
}

- (id)locale
{
  id v2 = self->locale;

  return v2;
}

- (void)setCaseSensitive:(BOOL)a3
{
  self->flags = ($2B5DD4196BC790A619058A8FED2FA401)(*(_DWORD *)&self->flags & 0xFFFFFFFE | a3);
}

- (NSConcreteScanner)initWithString:(id)a3
{
  v3 = (__CFString *)a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    NSLog((NSString *)@"NSScanner: nil string argument", a2);
    v3 = &stru_1ECA5C228;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteScanner;
  v5 = [(NSScanner *)&v7 initWithString:v3];
  v5->scanString = (NSString *)[(__CFString *)v3 copyWithZone:0];
  v5->skipSet = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v5->scanLocation = 0;
  return v5;
}

- (id)_invertedSkipSet
{
  id result = self->invertedSkipSet;
  if (!result)
  {
    id result = [(NSConcreteScanner *)self charactersToBeSkipped];
    if (result)
    {
      id v4 = result;
      if (result == +[NSCharacterSet whitespaceAndNewlineCharacterSet])
      {
        if (_MergedGlobals_5_0 != -1) {
          dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_104);
        }
        return (id)qword_1EB1ECB80;
      }
      else
      {
        id result = (id)objc_msgSend((id)objc_msgSend(v4, "invertedSet"), "copy");
        self->invertedSkipSet = (NSCharacterSet *)result;
      }
    }
  }
  return result;
}

- (void)setCharactersToBeSkipped:(id)a3
{
  v5 = self->skipSet;
  self->skipSet = (NSCharacterSet *)objc_msgSend(a3, "copyWithZone:", -[NSConcreteScanner zone](self, "zone"));

  self->invertedSkipSet = 0;
}

- (BOOL)scanInt:(int *)a3
{
  return _NSScanIntFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteScanner;
  [(NSConcreteScanner *)&v3 dealloc];
}

- (BOOL)scanLongLong:(int64_t *)a3
{
  return _NSScanLongLongFromString(self->scanString, self->skipSet, a3, &self->scanLocation);
}

- (void)setLocale:(id)a3
{
  id locale = self->locale;
  if (locale != a3)
  {

    self->id locale = a3;
  }
}

@end