@interface NSConcreteMutableAttributedString
+ (BOOL)supportsSecureCoding;
+ (Class)_mutableStringClass;
- (BOOL)_mayRequireIntentResolution;
- (NSConcreteMutableAttributedString)init;
- (NSConcreteMutableAttributedString)initWithAttributedString:(id)a3;
- (NSConcreteMutableAttributedString)initWithCoder:(id)a3;
- (NSConcreteMutableAttributedString)initWithString:(id)a3;
- (NSConcreteMutableAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (id)_runArrayHoldingAttributes;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)string;
- (unint64_t)length;
- (void)_markIntentsResolved;
- (void)_markRequiringIntentResolution;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)dealloc;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation NSConcreteMutableAttributedString

- (NSConcreteMutableAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = _NSNameOfClass(v15);
      v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v16, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    if ((initWithString_attributes__warned & 1) == 0)
    {
      uint64_t v8 = objc_opt_class();
      v9 = NSStringFromSelector(a2);
      NSLog((NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.", v8, v9);
      initWithString_attributes__warned = 1;
    }
  }
  v10 = [(NSConcreteMutableAttributedString *)self initWithAttributedString:0];
  v11 = v10;
  if (v10)
  {
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:](v10, "replaceCharactersInRange:withString:", 0, 0, a3);
    v12 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a4];
    uint64_t v13 = [(NSConcreteMutableAttributedString *)v11 length];
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](v11->mutableAttributes, "replaceObjectsInRange:withObject:length:", 0, v13, v12, v13);
    if ([(NSAttributedString *)v11 _willRequireIntentResolutionWhenContainingAttributes:v12])
    {
      [(NSConcreteMutableAttributedString *)v11 _markRequiringIntentResolution];
    }
  }
  return v11;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = [a4 length];
  if (!v8)
  {
    if (!length) {
      goto LABEL_8;
    }
    id v9 = 0;
LABEL_6:
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", location, length, v9, v8);
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (length)
  {
    id v9 = [(NSRLEArray *)self->mutableAttributes objectAtIndex:location effectiveRange:0];
    id v10 = v9;
    goto LABEL_6;
  }
  if (location)
  {
    mutableAttributes = self->mutableAttributes;
    NSUInteger v12 = location - 1;
LABEL_15:
    id v13 = [(NSRLEArray *)mutableAttributes objectAtIndex:v12 effectiveRange:0];
    goto LABEL_16;
  }
  if ([(NSString *)self->mutableString length])
  {
    mutableAttributes = self->mutableAttributes;
    NSUInteger v12 = 0;
    goto LABEL_15;
  }
  id v13 = (id)[(id)_NSAttributeDictionaryClass() emptyAttributeDictionary];
LABEL_16:
  id v9 = v13;
  id v14 = v13;
  -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v9, location, v8);
  if (v9) {
LABEL_7:
  }

LABEL_8:
  -[NSMutableString replaceCharactersInRange:withString:](self->mutableString, "replaceCharactersInRange:withString:", location, length, a4);

  -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 2, location, length, v8 - length);
}

- (id)string
{
  return self->mutableString;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    v7 = (void *)[(id)_NSAttributeDictionaryClass() newWithDictionary:a3];
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", location, length, v7, length);
    if ([(NSAttributedString *)self _willRequireIntentResolutionWhenContainingAttributes:v7])
    {
      [(NSConcreteMutableAttributedString *)self _markRequiringIntentResolution];
    }

    -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
  }
}

- (NSConcreteMutableAttributedString)initWithAttributedString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)NSConcreteMutableAttributedString;
  v4 = [(NSConcreteMutableAttributedString *)&v18 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSConcreteMutableAttributedString *)v4 zone];
    v7 = (void *)[(id)objc_opt_class() _mutableStringClass];
    if (a3)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = (void *)[a3 _runArrayHoldingAttributes];
        if (v8) {
          v5->mutableAttributes = (NSMutableRLEArray *)[v8 mutableCopyWithZone:v6];
        }
      }
      if (!v5->mutableAttributes)
      {
        unint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "string"), "length");
        v5->mutableAttributes = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:v6] init];
        if (v9)
        {
          for (unint64_t i = 0; i < v9; i += v17)
          {
            uint64_t v16 = 0;
            unint64_t v17 = 0;
            v11 = objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v16));
            if (v17 + v16 <= v9) {
              unint64_t v12 = v16 - i + v17;
            }
            else {
              unint64_t v12 = v9 - i;
            }
            if (v16 != i || v17 + v16 > v9) {
              unint64_t v17 = v12;
            }
            -[NSMutableRLEArray insertObject:range:](v5->mutableAttributes, "insertObject:range:", v11, i, v12);
          }
        }
      }
      if (v7 == (void *)__NSMutableStringClass) {
        uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "string"), "mutableCopyWithZone:", v6);
      }
      else {
        uint64_t v14 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "initWithString:", objc_msgSend(a3, "string"));
      }
      v5->mutableString = (NSMutableString *)v14;
      if ([a3 _mayRequireIntentResolution]) {
        [(NSConcreteMutableAttributedString *)v5 _markRequiringIntentResolution];
      }
    }
    else
    {
      v5->mutableAttributes = [(NSRLEArray *)+[NSMutableRLEArray allocWithZone:v6] init];
      v5->mutableString = (NSMutableString *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "init");
    }
  }
  return v5;
}

+ (Class)_mutableStringClass
{
  return (Class)__NSMutableStringClass;
}

- (BOOL)_mayRequireIntentResolution
{
  return *((unsigned char *)&self->fields + 1) != 0;
}

- (id)_runArrayHoldingAttributes
{
  return self->mutableAttributes;
}

- (unint64_t)length
{
  return [(NSString *)self->mutableString length];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36[0] = 0;
  NSUInteger v34 = 0;
  id v10 = objc_msgSend(-[NSRLEArray objectAtIndex:effectiveRange:runIndex:](self->mutableAttributes, "objectAtIndex:effectiveRange:runIndex:", a4, &v34, v36), "objectForKey:", a3);
  if (a5)
  {
    v29 = a5;
    uint64_t v33 = 0;
    NSUInteger v11 = v34;
    NSUInteger v12 = v35 + v34;
    NSUInteger v30 = location + length;
    id v13 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v13, sel_objectAtRunIndex_length_);
    if (v10)
    {
      v15 = (objc_class *)objc_opt_class();
      IMP v31 = class_getMethodImplementation(v15, sel_isEqual_);
    }
    else
    {
      IMP v31 = 0;
    }
    uint64_t v16 = v36[0];
    if (v12 < v30)
    {
      NSUInteger v17 = location;
      uint64_t v18 = v36[0] + 1;
      do
      {
        uint64_t v19 = (void *)((uint64_t (*)(NSMutableRLEArray *, char *, uint64_t, uint64_t *))MethodImplementation)(self->mutableAttributes, sel_objectAtRunIndex_length_, v18, &v33);
        if (!v19) {
          break;
        }
        uint64_t v20 = [v19 objectForKey:a3];
        if (v10 != (void *)v20
          && (!v10 || !((unsigned int (*)(void *, char *, uint64_t))v31)(v10, sel_isEqual_, v20)))
        {
          break;
        }
        v12 += v33;
        ++v18;
      }
      while (v12 < v30);
      uint64_t v16 = v36[0];
      NSUInteger location = v17;
    }
    NSUInteger v21 = location;
    if (v11 > location)
    {
      uint64_t v22 = v16 - 1;
      do
      {
        uint64_t v23 = objc_msgSend((id)((uint64_t (*)(NSMutableRLEArray *, char *, uint64_t, uint64_t *))MethodImplementation)(self->mutableAttributes, sel_objectAtRunIndex_length_, v22, &v33), "objectForKey:", a3);
        if (v10 != (void *)v23
          && (!v10 || !((unsigned int (*)(void *, char *, uint64_t))v31)(v10, sel_isEqual_, v23)))
        {
          break;
        }
        v11 -= v33;
        --v22;
      }
      while (v11 > v21);
    }
    NSUInteger v24 = v30;
    if (v30 >= v12) {
      NSUInteger v24 = v12;
    }
    if (v11 > v21 || v21 >= v12)
    {
      NSUInteger v25 = v24 - v11;
      if (v11 < v30) {
        NSUInteger v26 = v11;
      }
      else {
        NSUInteger v26 = 0;
      }
      if (v11 >= v30) {
        NSUInteger v25 = 0;
      }
      BOOL v27 = v21 > v11;
      if (v21 <= v11) {
        NSUInteger v21 = v26;
      }
      else {
        NSUInteger v21 = 0;
      }
      if (v27) {
        NSUInteger v25 = 0;
      }
    }
    else
    {
      NSUInteger v25 = v24 - v21;
    }
    v29->NSUInteger location = v21;
    v29->NSUInteger length = v25;
  }
  return v10;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v6 = [(NSRLEArray *)self->mutableAttributes objectAtIndex:a4 effectiveRange:a5];

  return (id)[v6 objectForKey:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMutableAttributedString;
  [(NSConcreteMutableAttributedString *)&v3 dealloc];
}

- (NSConcreteMutableAttributedString)initWithString:(id)a3
{
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      NSUInteger v11 = (objc_class *)objc_opt_class();
      NSUInteger v12 = _NSNameOfClass(v11);
      id v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v12, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v13);
    }
    if ((initWithString__warned_133 & 1) == 0)
    {
      uint64_t v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog((NSString *)@"-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once.", v6, v7);
      initWithString__warned_133 = 1;
    }
  }
  uint64_t v8 = [(NSConcreteMutableAttributedString *)self initWithAttributedString:0];
  unint64_t v9 = v8;
  if (v8) {
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:](v8, "replaceCharactersInRange:withString:", 0, 0, a3);
  }
  return v9;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a4 string];
  unint64_t v9 = [v8 length];
  if (v9)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      id v10 = objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a4, "attributesAtIndex:effectiveRange:", v11, &v11));
      -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v10, v11 + location, v12);

      v11 += v12;
    }
    while (v11 < v9);
  }
  if (length) {
    -[NSMutableRLEArray deleteObjectsInRange:](self->mutableAttributes, "deleteObjectsInRange:", v9 + location, length);
  }
  -[NSMutableString replaceCharactersInRange:withString:](self->mutableString, "replaceCharactersInRange:withString:", location, length, v8);
  if ([a4 _mayRequireIntentResolution]) {
    [(NSConcreteMutableAttributedString *)self _markRequiringIntentResolution];
  }
  -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 3, location, length, v9 - length);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a5.length)
  {
    if (!a4)
    {
      NSUInteger v24 = (objc_class *)objc_opt_class();
      NSUInteger v25 = _NSNameOfClass(v24);
      NSUInteger v26 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v25, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v26);
    }
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    NSUInteger v10 = a5.length;
    NSUInteger v11 = a5.location;
    do
    {
      NSUInteger v27 = 0;
      uint64_t v28 = 0;
      id v12 = [(NSRLEArray *)self->mutableAttributes objectAtIndex:v11 effectiveRange:&v27];
      id v13 = v12;
      NSUInteger v14 = v27;
      if (v28 + v27 >= v11 + v10) {
        NSUInteger v15 = v11 + v10;
      }
      else {
        NSUInteger v15 = v28 + v27;
      }
      NSUInteger v16 = v15 - v11;
      BOOL v17 = v27 > v11 || v11 >= v28 + v27;
      if (v17) {
        NSUInteger v18 = 0;
      }
      else {
        NSUInteger v18 = v11;
      }
      if (v17) {
        NSUInteger v16 = 0;
      }
      NSUInteger v19 = v15 - v27;
      if (v11 > v27 || v27 >= v11 + v10)
      {
        NSUInteger v14 = v18;
        NSUInteger v21 = v16;
      }
      else
      {
        NSUInteger v21 = v19;
      }
      NSUInteger v27 = v14;
      uint64_t v28 = v21;
      id v22 = (id)[v12 newWithKey:a3 object:a4];
      if (v22 != v13) {
        -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", v27, v28, v22, v28);
      }

      v11 += v28;
      v10 -= v28;
    }
    while (v10);
    if ([(NSAttributedString *)self _willRequireIntentResolutionWhenContainingAttribute:a3 value:a4])
    {
      [(NSConcreteMutableAttributedString *)self _markRequiringIntentResolution];
    }
    -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
  }
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(NSRLEArray *)self->mutableAttributes objectAtIndex:a3 effectiveRange:a4];
}

- (NSConcreteMutableAttributedString)initWithCoder:(id)a3
{
  uint64_t v4 = [(NSConcreteMutableAttributedString *)self init];
  if ((_NSReadMutableAttributedStringWithCoder(a3, v4) & 1) == 0)
  {

    return 0;
  }
  return v4;
}

- (NSConcreteMutableAttributedString)init
{
  return [(NSConcreteMutableAttributedString *)self initWithString:&stru_1ECA5C228];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_markRequiringIntentResolution
{
  *((unsigned char *)&self->fields + 1) = 1;
}

- (void)_markIntentsResolved
{
  *(_DWORD *)&self->fields &= 0xFFFF00FF;
}

@end