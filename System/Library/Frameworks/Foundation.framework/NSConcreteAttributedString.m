@interface NSConcreteAttributedString
- (NSConcreteAttributedString)init;
- (NSConcreteAttributedString)initWithAttributedString:(id)a3;
- (NSConcreteAttributedString)initWithString:(id)a3;
- (NSConcreteAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (id)_runArrayHoldingAttributes;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)string;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation NSConcreteAttributedString

- (NSConcreteAttributedString)initWithAttributedString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = -[NSConcreteAttributedString initWithString:](self, "initWithString:", [a3 string]);
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      v5 = (void *)[a3 _runArrayHoldingAttributes];
      if (v5) {
        v4->attributes = (NSRLEArray *)objc_msgSend(v5, "copyWithZone:", -[NSConcreteAttributedString zone](v4, "zone"));
      }
    }
    if (!v4->attributes)
    {
      unint64_t v6 = [(NSString *)v4->string length];
      v7 = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:[(NSConcreteAttributedString *)v4 zone]] init];
      if (v6)
      {
        for (unint64_t i = 0; i < v6; i += v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = 0;
          v9 = objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v13));
          if (v14 + v13 <= v6) {
            unint64_t v10 = v13 - i + v14;
          }
          else {
            unint64_t v10 = v6 - i;
          }
          if (v13 != i || v14 + v13 > v6) {
            unint64_t v14 = v10;
          }
          -[NSMutableRLEArray insertObject:range:](v7, "insertObject:range:", v9, i, v10);
        }
      }
      v4->attributes = &v7->super;
    }
    if ([a3 _mayRequireIntentResolution]) {
      [(NSAttributedString *)v4 _markRequiringIntentResolution];
    }
  }
  return v4;
}

- (NSConcreteAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  v5 = [(NSConcreteAttributedString *)self initWithString:a3];
  unint64_t v6 = v5;
  if (a4 && v5)
  {
    v7 = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:[(NSConcreteAttributedString *)v5 zone]] init];
    v8 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a4];
    -[NSMutableRLEArray insertObject:range:](v7, "insertObject:range:", v8, 0, [(NSConcreteAttributedString *)v6 length]);
    if ([(NSAttributedString *)v6 _willRequireIntentResolutionWhenContainingAttributes:v8])
    {
      [(NSAttributedString *)v6 _markRequiringIntentResolution];
    }

    v6->attributes = &v7->super;
  }
  return v6;
}

- (NSConcreteAttributedString)initWithString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = _NSNameOfClass(v12);
      unint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v13, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    if ((initWithString__warned & 1) == 0)
    {
      uint64_t v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog((NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.", v6, v7);
      initWithString__warned = 1;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)NSConcreteAttributedString;
  v8 = [(NSConcreteAttributedString *)&v15 init];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(a3, "copyWithZone:", -[NSConcreteAttributedString zone](v8, "zone"));
    v9->string = (NSString *)v10;
    if (!a3 || v10)
    {
      v9->attributes = 0;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (id)string
{
  return self->string;
}

- (unint64_t)length
{
  return [(NSString *)self->string length];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  if (self->attributes)
  {
    id v7 = [(NSRLEArray *)self->attributes objectAtIndex:a4 effectiveRange:a5];
    return (id)[v7 objectForKey:a3];
  }
  else
  {
    if (a5)
    {
      NSUInteger v9 = [(NSString *)self->string length];
      a5->location = 0;
      a5->length = v9;
    }
    return 0;
  }
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if (self->attributes)
  {
    attributes = self->attributes;
    return -[NSRLEArray objectAtIndex:effectiveRange:](attributes, "objectAtIndex:effectiveRange:", a3);
  }
  else
  {
    if (a4)
    {
      NSUInteger v7 = [(NSString *)self->string length];
      a4->location = 0;
      a4->length = v7;
    }
    v8 = (void *)_NSAttributeDictionaryClass();
    return (id)[v8 emptyAttributeDictionary];
  }
}

- (id)_runArrayHoldingAttributes
{
  return self->attributes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (_CFExecutableLinkedOnOrAfter())
  {
    return self;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSConcreteAttributedString;
    return [(NSAttributedString *)&v6 copyWithZone:a3];
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteAttributedString;
  [(NSConcreteAttributedString *)&v3 dealloc];
}

- (NSConcreteAttributedString)init
{
  return [(NSConcreteAttributedString *)self initWithString:&stru_1ECA5C228];
}

@end