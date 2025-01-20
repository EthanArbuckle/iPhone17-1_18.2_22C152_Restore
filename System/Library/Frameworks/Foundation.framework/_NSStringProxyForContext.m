@interface _NSStringProxyForContext
- (NSFormatter)formatter;
- (NSString)string;
- (_NSStringProxyForContext)initWithCoder:(id)a3;
- (id)_dynamicContextEvaluation:(id)a3 patternString:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)item;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_retainFormatter:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setFormatter:(id)a3;
- (void)setItem:(id)a3;
- (void)setString:(id)a3;
@end

@implementation _NSStringProxyForContext

- (unint64_t)length
{
  return [(NSString *)self->_string length];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setString:", -[_NSStringProxyForContext string](self, "string"));
  objc_msgSend(v4, "setFormatter:", -[_NSStringProxyForContext formatter](self, "formatter"));
  objc_msgSend(v4, "setItem:", -[_NSStringProxyForContext item](self, "item"));
  return v4;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFormatter:(id)a3
{
}

- (id)_dynamicContextEvaluation:(id)a3 patternString:(id)a4
{
  if ([a3 isEqualToString:a4])
  {
    uint64_t v7 = 2;
  }
  else if ([a3 rangeOfString:a4])
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
    CFStringUppercase(MutableCopy, 0);
    CFStringRef Copy = CFStringCreateCopy(0, MutableCopy);
    CFRelease(MutableCopy);
    CFLocaleRef v10 = CFLocaleCopyCurrent();
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v21.length = CFStringGetLength(Copy);
    v21.CFIndex location = 0;
    v12 = CFStringTokenizerCreate(v11, Copy, v21, 1uLL, v10);
    for (i = v12; ; v12 = i)
    {
      if (!CFStringTokenizerAdvanceToNextToken(v12))
      {
        BOOL v16 = 0;
        goto LABEL_11;
      }
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(i);
      CFStringRef v14 = CFStringCreateWithSubstring(0, Copy, CurrentTokenRange);
      CFIndex location = CFStringFind(v14, (CFStringRef)a4, 0).location;
      if (location != -1) {
        break;
      }
      CFRelease(v14);
    }
    BOOL v16 = location == 0;
    CFRelease(v14);
LABEL_11:
    CFRelease(Copy);
    CFRelease(i);
    CFRelease(v10);
    if (v16) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 5;
    }
  }
  else
  {
    uint64_t v7 = 4;
  }
  v17 = [(_NSStringProxyForContext *)self formatter];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  [(NSFormatter *)v17 setFormattingContext:v7];
  id v18 = [(_NSStringProxyForContext *)self item];

  return [(NSFormatter *)v17 stringForObjectValue:v18];
}

- (id)item
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSFormatter)formatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  string = self->_string;
  if (string) {

  }
  formatter = self->_formatter;
  if (formatter) {

  }
  item = self->_item;
  if (item) {

  }
  v6.receiver = self;
  v6.super_class = (Class)_NSStringProxyForContext;
  [(_NSStringProxyForContext *)&v6 dealloc];
}

- (void)setString:(id)a3
{
}

- (void)setItem:(id)a3
{
}

- (void)_retainFormatter:(id)a3
{
  formatter = self->_formatter;
  if (formatter != a3)
  {

    self->_formatter = (NSFormatter *)a3;
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_string characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (_NSStringProxyForContext)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    CFLocaleRef v10 = +[NSString stringWithFormat:@"%@ can only be decoded by a keyed coder.", NSStringFromClass(v9)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  v5 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.string"];
  objc_super v6 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.formatter"];
  uint64_t v7 = (void *)[a3 decodeObjectForKey:@"NSStringProxyForContext.item"];
  self->_string = (NSString *)v5;
  self->_formatter = (NSFormatter *)v6;
  self->_item = (NSCopying *)v7;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ can only be encoded by a keyed coder.", NSStringFromClass(v6)), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  [a3 encodeObject:self->_string forKey:@"NSStringProxyForContext.string"];
  [a3 encodeObject:self->_formatter forKey:@"NSStringProxyForContext.formatter"];
  item = self->_item;

  [a3 encodeObject:item forKey:@"NSStringProxyForContext.item"];
}

@end