@interface BSDescriptionBuilder
+ (id)builderWithObject:(id)a3;
+ (id)componentSeparator;
+ (id)descriptionForObject:(id)a3;
+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4;
+ (id)nameObjectSeparator;
+ (id)succinctDescriptionForObject:(id)a3;
- (BOOL)hasDebugStyle;
- (BOOL)hasSuccinctStyle;
- (BOOL)useDebugDescription;
- (BSDescriptionBuilder)initWithObject:(id)a3;
- (NSString)activeMultilinePrefix;
- (id)appendBool:(BOOL)a3 withName:(id)a4;
- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5;
- (id)appendCString:(const char *)a3 withName:(id)a4;
- (id)appendClass:(Class)a3 withName:(id)a4;
- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5;
- (id)appendFlag:(int64_t)a3 withName:(id)a4;
- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5;
- (id)appendFloat:(double)a3 withName:(id)a4;
- (id)appendFormat:(id)a3;
- (id)appendInt64:(int64_t)a3 withName:(id)a4;
- (id)appendInt:(int)a3 withName:(id)a4;
- (id)appendInteger:(int64_t)a3 withName:(id)a4;
- (id)appendKey:(id)a3;
- (id)appendKeys:(id)a3;
- (id)appendObject:(id)a3 withName:(id)a4;
- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5;
- (id)appendObjectsAndNames:(id *)a3 args:;
- (id)appendObjectsAndNames:(id)a3;
- (id)appendPoint:(CGPoint)a3 withName:(id)a4;
- (id)appendPointer:(void *)a3 withName:(id)a4;
- (id)appendQueue:(id)a3 withName:(id)a4;
- (id)appendRect:(CGRect)a3 withName:(id)a4;
- (id)appendSelector:(SEL)a3 withName:(id)a4;
- (id)appendSize:(CGSize)a3 withName:(id)a4;
- (id)appendString:(id)a3;
- (id)appendSuper;
- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5;
- (id)appendUInt64:(unint64_t)a3 withName:(id)a4;
- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5;
- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5;
- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4;
- (id)build;
- (id)modifyBody:(id)a3;
- (id)modifyProem:(id)a3;
- (id)style;
- (int)activeComponent;
- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5;
- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6;
- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7;
- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6;
- (void)appendCustomFormatWithName:(id)a3 block:(id)a4;
- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)appendObjectWithName:(uint64_t)a3 formatBlock:;
- (void)appendProem:(id)a3 block:(id)a4;
- (void)appendString:(id)a3 withName:(id)a4;
- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)setActiveComponent:(int)a3;
- (void)setActiveMultilinePrefix:(id)a3;
- (void)setUseDebugDescription:(BOOL)a3;
- (void)tryAppendKey:(id *)a1;
@end

@implementation BSDescriptionBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proem, 0);
}

- (void)setUseDebugDescription:(BOOL)a3
{
  self->_useDebugDescription = a3;
}

- (id)appendSuper
{
  object = self->_object;
  if (object)
  {
    Class Class = object_getClass(object);
    if (!Class)
    {
LABEL_18:
      id v15 = [(BSDescriptionBuilder *)self appendObject:@"(super does not implement description)" withName:0];
      return self;
    }
    Superclass = Class;
    int v6 = 0;
    while (1)
    {
      unsigned int outCount = 0;
      v7 = class_copyMethodList(Superclass, &outCount);
      v8 = v7;
      if (outCount)
      {
        unint64_t v9 = 0;
        IMP Implementation = 0;
        do
        {
          char v11 = v6;
          v12 = v8[v9];
          Name = (char *)method_getName(v12);
          v6 |= Name == sel_description;
          if (Name == sel_description && (v11 & 1) != 0)
          {
            IMP Implementation = method_getImplementation(v12);
            int v6 = 1;
          }
          ++v9;
        }
        while (Name != sel_description && v9 < outCount);
        free(v8);
        if (Implementation)
        {
          v16 = ((void (*)(NSObject *, char *))Implementation)(self->_object, sel_description);
          v17 = objc_msgSend(NSString, "stringWithFormat:", @"%p ", self->_object);;
          uint64_t v18 = [v16 rangeOfString:v17];

          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = [(BSDescriptionBuilder *)self appendObject:@"(super's description format doesn't match)" withName:0];
          }
          else
          {
            [v16 length];
            v20 = objc_msgSend(v16, "substringWithRange:");
            id v21 = [(BSDescriptionBuilder *)self appendObject:v20 withName:0 skipIfNil:1];
          }
          return self;
        }
      }
      else
      {
        free(v7);
      }
      Superclass = class_getSuperclass(Superclass);
      if (!Superclass) {
        goto LABEL_18;
      }
    }
  }
  return self;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  int v6 = NSStringFromBOOL();
  id v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return self;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return [(BSDescriptionBuilder *)self appendObject:a3 withName:a4 skipIfNil:0];
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  if (!a3)
  {
    if (a5) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v9 = [a3 length];
  if (!v5 || v9)
  {
    if (!v9)
    {
      v14 = @"\"\"";
      v13 = self;
      goto LABEL_10;
    }
    v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v11 = [a3 rangeOfCharacterFromSet:v10];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __58__BSDescriptionBuilder_appendString_withName_skipIfEmpty___block_invoke;
      v16[3] = &unk_1E5445608;
      v16[4] = a3;
      id v12 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v16);
      return;
    }
LABEL_8:
    v13 = self;
    v14 = (__CFString *)a3;
LABEL_10:
    id v15 = [(BSDescriptionBuilder *)v13 appendObject:v14 withName:a4 skipIfNil:v5];
  }
}

- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5
{
  int activeComponent = self->_activeComponent;
  self->_int activeComponent = 1;
  if (a3)
  {
    if (a4) {
      [(NSMutableString *)self->_description appendString:a4];
    }
    [(NSMutableString *)self->_description appendString:a3];
    [(NSMutableString *)self->_description appendString:@" = "];
  }
  uint64_t v10 = [(NSMutableString *)self->_description appendString:@"{"];
  if (a5)
  {
    uint64_t v11 = (void *)MEMORY[0x18C125360](v10);
    [(NSMutableString *)self->_description appendString:@"\n"];
    id v12 = &stru_1ED76E928;
    if (a4) {
      id v12 = (__CFString *)a4;
    }
    v13 = v12;
    v14 = self->_activePrefix;
    id v15 = [(__CFString *)v13 stringByAppendingString:@"    "];

    [(BSDescriptionBuilder *)self setActiveMultilinePrefix:v15];
    (*((void (**)(id))a5 + 2))(a5);
    [(BSDescriptionBuilder *)self setActiveMultilinePrefix:v14];
    if (a4) {
      [(NSMutableString *)self->_description appendString:a4];
    }
    [(NSMutableString *)self->_description appendString:@"}\n"];
  }
  else
  {
    [(NSMutableString *)self->_description appendString:@" }\n"];
  }
  self->_int activeComponent = activeComponent;
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  if (a3 || !a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke;
      v18[3] = &unk_1E5445608;
      v18[4] = a3;
      id v8 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v18);
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x18C125360]();
      if (self->_useDebugDescription && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v10 = [a3 debugDescriptionWithMultilinePrefix:self->_activePrefix];
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [a3 descriptionWithMultilinePrefix:self->_activePrefix];
      }
      else if (self->_useDebugDescription && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v10 = [a3 debugDescription];
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          [a3 description];
        }
        else {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
        }
      }
      uint64_t v11 = (void *)v10;
      if (!v10)
      {
        id v12 = +[BSDescriptionBuilder builderWithObject:a3];
        uint64_t v11 = [v12 build];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke_2;
      v16[3] = &unk_1E5445608;
      id v17 = v11;
      id v13 = v11;
      id v14 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v16);
    }
  }
  return self;
}

- (void)appendObjectWithName:(uint64_t)a3 formatBlock:
{
  if (a1)
  {
    if (*((_DWORD *)a1 + 9) == 1)
    {
      int v6 = (__CFString *)a1[5];
      if (!v6) {
        int v6 = &stru_1ED76E928;
      }
      id v7 = v6;
      id v8 = @" = ";
      uint64_t v9 = @";\n";
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      id v7 = [v10 componentSeparator];
      id v8 = [v10 nameObjectSeparator];
      uint64_t v9 = &stru_1ED76E928;
    }
    uint64_t v11 = 3;
    if (!*((_DWORD *)a1 + 9)) {
      uint64_t v11 = 2;
    }
    id v12 = (id)a1[v11];
    [v12 appendString:v7];
    if ([a2 length])
    {
      [v12 appendString:a2];
      [v12 appendString:v8];
    }
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v12);
    [v12 appendString:v9];
    id v13 = a1;
  }
  return a1;
}

+ (id)nameObjectSeparator
{
  return @": ";
}

+ (id)componentSeparator
{
  return @"; ";
}

uint64_t __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appendString:*(void *)(a1 + 32)];
}

- (void)appendString:(id)a3 withName:(id)a4
{
}

- (void)setActiveMultilinePrefix:(id)a3
{
}

uint64_t __56__BSDescriptionBuilder_appendObject_withName_skipIfNil___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendString:*(void *)(a1 + 32)];
}

uint64_t __47__BSDescriptionBuilder_appendInteger_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%ld", *(void *)(a1 + 32));
}

+ (id)builderWithObject:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithObject:a3];
  return v3;
}

- (BSDescriptionBuilder)initWithObject:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BSDescriptionBuilder;
  v4 = [(BSDescriptionBuilder *)&v15 init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_object = a3;
    int v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    description = v5->_description;
    v5->_description = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
    proem = v5->_proem;
    v5->_proem = (NSMutableString *)v8;

    if (v5->_object)
    {
      objc_opt_class();
      uint64_t v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      id v12 = v5->_proem;
      if (v10 == (objc_class *)v5->_object) {
        [(NSMutableString *)v12 appendFormat:@"%s", class_getName(v10)];
      }
      else {
        [(NSMutableString *)v12 appendFormat:@"%s: %p", class_getName(v10), v5->_object];
      }
    }
    v5->_int activeComponent = 0;
    id v13 = v5;
  }

  return v5;
}

uint64_t __43__BSDescriptionBuilder_appendInt_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%d", *(unsigned int *)(a1 + 32));
}

uint64_t __58__BSDescriptionBuilder_appendString_withName_skipIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  [a2 appendString:@"\""];
  [a2 appendString:*(void *)(a1 + 32)];
  return [a2 appendString:@"\""];
}

void __85__BSDescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (void)v12);
        uint64_t v8 = [(id)objc_opt_class() succinctDescriptionForObject:v6];
        if ([v7 isNSDictionary])
        {
          [*(id *)(a1 + 40) appendDictionarySection:v7 withName:v8 skipIfEmpty:0];
        }
        else
        {
          int v9 = [v7 isNSArray];
          uint64_t v10 = *(void **)(a1 + 40);
          if (v9) {
            [v10 appendArraySection:v7 withName:v8 skipIfEmpty:0];
          }
          else {
            id v11 = (id)[v10 appendObject:v7 withName:v8];
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

+ (id)succinctDescriptionForObject:(id)a3
{
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v5 = [a3 succinctDescription];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a3 description];
    }
    else {
    BOOL v5 = [a1 descriptionForObject:a3];
    }
  }
  return v5;
}

uint64_t __47__BSDescriptionBuilder_appendPointer_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%p", *(void *)(a1 + 32));
}

uint64_t __55__BSDescriptionBuilder_appendUnsignedInteger_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%lu", *(void *)(a1 + 32));
}

void __85__BSDescriptionBuilder_appendCollectionSection_withName_multilinePrefix_skipIfEmpty___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), 0, (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"%.2fs", *(void *)(a1 + 32)];
}

uint64_t __62__BSDescriptionBuilder_appendUnsignedInteger_withName_format___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 1) {
    id v2 = @"0x%lX";
  }
  else {
    id v2 = @"%lu";
  }
  return objc_msgSend(a2, "appendFormat:", v2, *(void *)(a1 + 40));
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%.1fs", *(void *)(a1 + 32));
}

uint64_t __51__BSDescriptionBuilder_appendUnsignedInt_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%u", *(unsigned int *)(a1 + 32));
}

uint64_t __46__BSDescriptionBuilder_appendUInt64_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%llu", *(void *)(a1 + 32));
}

uint64_t __57__BSDescriptionBuilder_appendCustomFormatWithName_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a7)
  {
    BOOL v19 = a6;
    long long v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = a3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v16 = (*((void (**)(id, uint64_t))a7 + 2))(a7, v15);
          if (v16) {
            [v10 setObject:v16 forKey:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(BSDescriptionBuilder *)self appendDictionarySection:v10 withName:a4 multilinePrefix:a5 skipIfEmpty:v19];
  }
  else
  {
    [(BSDescriptionBuilder *)self appendDictionarySection:a3 withName:a4 multilinePrefix:a5 skipIfEmpty:a6];
  }
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  id v8 = [(BSDescriptionBuilder *)self activeMultilinePrefix];
  -[BSDescriptionBuilder appendDictionarySection:withName:multilinePrefix:skipIfEmpty:](self, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", a3, a4);
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  id v8 = [(BSDescriptionBuilder *)self activeMultilinePrefix];
  -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:", a3, a4);
}

- (NSString)activeMultilinePrefix
{
  if (self->_activePrefix) {
    return self->_activePrefix;
  }
  else {
    return (NSString *)&stru_1ED76E928;
  }
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  if ([a3 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__BSDescriptionBuilder_appendCollectionSection_withName_multilinePrefix_skipIfEmpty___block_invoke;
    v12[3] = &unk_1E54456B8;
    v12[4] = a3;
    v12[5] = self;
    [(BSDescriptionBuilder *)self appendBodySectionWithName:a4 multilinePrefix:a5 block:v12];
  }
  else if (a4)
  {
    if (!a6) {
      id v11 = [(BSDescriptionBuilder *)self appendObject:@"(empty)" withName:a4];
    }
  }
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
  if ([a3 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__BSDescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty___block_invoke;
    v12[3] = &unk_1E54456B8;
    v12[4] = a3;
    v12[5] = self;
    [(BSDescriptionBuilder *)self appendBodySectionWithName:a4 multilinePrefix:a5 block:v12];
  }
  else if (a4)
  {
    if (!a6) {
      id v11 = [(BSDescriptionBuilder *)self appendObject:@"(empty)" withName:a4];
    }
  }
}

- (id)appendFloat:(double)a3 withName:(id)a4
{
  return [(BSDescriptionBuilder *)self appendFloat:a4 withName:0x7FFFFFFFFFFFFFFFLL decimalPrecision:a3];
}

- (id)modifyProem:(id)a3
{
  if (a3)
  {
    int activeComponent = self->_activeComponent;
    self->_int activeComponent = 0;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_int activeComponent = activeComponent;
  }
  return self;
}

- (id)modifyBody:(id)a3
{
  if (a3)
  {
    int activeComponent = self->_activeComponent;
    self->_int activeComponent = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_int activeComponent = activeComponent;
  }
  return self;
}

+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = +[BSDescriptionBuilder builderWithObject:a3];
      id v7 = -[BSDescriptionBuilder appendObjectsAndNames:args:](v6, a4, &v13);
      id v8 = [v6 build];
    }
    else
    {
      long long v9 = NSString;
      long long v10 = (objc_class *)objc_opt_class();
      objc_msgSend(v9, "stringWithFormat:", @"<%s: %p>", class_getName(v10), a3);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = @"(null)";
  }
  return v8;
}

+ (id)descriptionForObject:(id)a3
{
  return (id)[a1 descriptionForObject:a3 withObjectsAndNames:0];
}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  if (a3 == a5) {
    id v6 = -[BSDescriptionBuilder appendBool:withName:](self, "appendBool:withName:");
  }
  return self;
}

- (id)build
{
  [(NSMutableString *)self->_proem appendString:@">"];
  description = self->_description;
  uint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v5 = [(NSMutableString *)description stringByTrimmingCharactersInSet:v4];

  if ([v5 length]) {
    uint64_t v6 = [[NSString alloc] initWithFormat:@"%@ %@", self->_proem, v5];
  }
  else {
    uint64_t v6 = [(NSMutableString *)self->_proem copy];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BSDescriptionBuilder_appendInteger_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v6[4] = a3;
  uint64_t v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__BSDescriptionBuilder_appendInt_withName___block_invoke;
  v6[3] = &__block_descriptor_36_e25_v16__0__NSMutableString_8l;
  int v7 = a3;
  uint64_t v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

- (id)appendRect:(CGRect)a3 withName:(id)a4
{
  uint64_t v6 = BSStringFromCGRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return v7;
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__BSDescriptionBuilder_appendPointer_withName___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  v5[4] = a3;
  return -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v5);
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__BSDescriptionBuilder_appendUnsignedInteger_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  void v6[4] = a3;
  uint64_t v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

- (id)appendSize:(CGSize)a3 withName:(id)a4
{
  uint64_t v6 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a3.width, 17, *(void *)&a3.height];
  int v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return v7;
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a3);
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFLL;
    if (a5 < 0x7FFFFFFF) {
      unint64_t v8 = a5;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%.*f", v8, *(void *)&a3);
  }
  long long v9 = (void *)v7;
  id v10 = [(BSDescriptionBuilder *)self appendObject:v7 withName:a4];

  return self;
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  uint64_t v6 = self;
  if (fabs(a3) == INFINITY)
  {
    uint64_t v6 = [(BSDescriptionBuilder *)self appendObject:@"(inf)" withName:a4];
  }
  else
  {
    double v8 = (a3 - (double)(uint64_t)a3) * 1000.0;
    if (a5)
    {
      if (qword_1EB21AFA0 != -1) {
        dispatch_once(&qword_1EB21AFA0, &__block_literal_global_1);
      }
      long long v9 = [(id)_MergedGlobals_5 stringFromTimeInterval:a3];
      id v10 = v9;
      if (fabs(v8) >= 2.22044605e-16)
      {
        uint64_t v13 = objc_msgSend(v9, "stringByAppendingFormat:", @" %.0fms", *(void *)&v8);

        id v11 = (void *)v13;
      }
      else
      {
        id v11 = v9;
      }
      uint64_t v6 = [v6 appendObject:v11 withName:a4];
    }
    else
    {
      if (fabs(v8) >= 2.22044605e-16)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_3;
        v15[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
        *(double *)&v15[4] = a3;
        uint64_t v12 = v15;
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke_2;
        v16[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
        *(double *)&void v16[4] = a3;
        uint64_t v12 = v16;
      }
      -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v12);
      objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__BSDescriptionBuilder_appendUnsignedInteger_withName_format___block_invoke;
  v7[3] = &__block_descriptor_48_e25_v16__0__NSMutableString_8l;
  v7[4] = a5;
  v7[5] = a3;
  uint64_t v5 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v7);
  return v5;
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__BSDescriptionBuilder_appendUnsignedInt_withName___block_invoke;
  v6[3] = &__block_descriptor_36_e25_v16__0__NSMutableString_8l;
  unsigned int v7 = a3;
  uint64_t v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

- (id)appendPoint:(CGPoint)a3 withName:(id)a4
{
  uint64_t v6 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a3.x, 17, *(void *)&a3.y];
  unsigned int v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return v7;
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__BSDescriptionBuilder_appendUInt64_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  void v6[4] = a3;
  uint64_t v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

- (void)appendCustomFormatWithName:(id)a3 block:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__BSDescriptionBuilder_appendCustomFormatWithName_block___block_invoke;
  v5[3] = &unk_1E5445630;
  v5[4] = a4;
  id v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a3, (uint64_t)v5);
}

- (id)appendObjectsAndNames:(id *)a3 args:
{
  if (a1)
  {
    id v4 = a2;
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        id v6 = *a3;
        id v7 = (id)[a1 appendObject:v5 withName:v6];
        double v8 = a3 + 1;
        a3 += 2;
        id v9 = *v8;

        uint64_t v5 = v9;
      }
      while (v9);
    }
    id v10 = a1;
  }
  return a1;
}

- (id)style
{
  if (self->_useDebugDescription) {
    +[BSDescriptionStyle debugStyle];
  }
  else {
  id v2 = _BSDefaultDescriptionStyle();
  }
  return v2;
}

- (BOOL)hasSuccinctStyle
{
  return 0;
}

- (BOOL)hasDebugStyle
{
  return self->_useDebugDescription;
}

- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4
{
  id v6 = [(id)objc_opt_class() succinctDescriptionForObject:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__BSDescriptionBuilder_appendCustomFormatWithNameFromObjectDescription_block___block_invoke;
  v8[3] = &unk_1E5445630;
  v8[4] = a4;
  id v7 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, v6, (uint64_t)v8);
}

uint64_t __78__BSDescriptionBuilder_appendCustomFormatWithNameFromObjectDescription_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appendProem:(id)a3 block:(id)a4
{
  id v4 = [(BSDescriptionBuilder *)self modifyProem:a4];
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4
{
  return [(BSDescriptionBuilder *)self appendFlag:a3 withName:a4 skipIfNotSet:0];
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL || !a5)
  {
    id v7 = BSSettingFlagDescription(a3);
    id v8 = [(BSDescriptionBuilder *)self appendObject:v7 withName:a4];
  }
  return self;
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__BSDescriptionBuilder_appendInt64_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  void v6[4] = a3;
  id v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

uint64_t __45__BSDescriptionBuilder_appendInt64_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%lld", *(void *)(a1 + 32));
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__BSDescriptionBuilder_appendUInt64_withName_format___block_invoke;
  v7[3] = &__block_descriptor_48_e25_v16__0__NSMutableString_8l;
  v7[4] = a5;
  v7[5] = a3;
  uint64_t v5 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v7);
  return v5;
}

uint64_t __53__BSDescriptionBuilder_appendUInt64_withName_format___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 1) {
    id v2 = @"0x%llX";
  }
  else {
    id v2 = @"%llu";
  }
  return objc_msgSend(a2, "appendFormat:", v2, *(void *)(a1 + 40));
}

uint64_t __67__BSDescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = (uint64_t)v0;

  id v2 = (void *)_MergedGlobals_5;
  return [v2 setUnitsStyle:1];
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  id v6 = NSStringFromSelector(a3);
  id v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return self;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BSDescriptionBuilder_appendCString_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  void v6[4] = a3;
  id v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

uint64_t __47__BSDescriptionBuilder_appendCString_withName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendFormat:", @"%s", *(void *)(a1 + 32));
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  return [(BSDescriptionBuilder *)self appendCString:label withName:a4];
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  id v6 = NSStringFromClass(a3);
  id v7 = [(BSDescriptionBuilder *)self appendObject:v6 withName:a4];

  return v7;
}

- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__BSDescriptionBuilder_appendVersionedPID_withName___block_invoke;
  v6[3] = &__block_descriptor_40_e25_v16__0__NSMutableString_8l;
  void v6[4] = a3;
  id v4 = -[BSDescriptionBuilder appendObjectWithName:formatBlock:](self, a4, (uint64_t)v6);
  return v4;
}

void __52__BSDescriptionBuilder_appendVersionedPID_withName___block_invoke(uint64_t a1, void *a2)
{
}

- (id)appendObjectsAndNames:(id)a3
{
  return -[BSDescriptionBuilder appendObjectsAndNames:args:](self, a3, &v4);
}

- (id)appendKey:(id)a3
{
  return self;
}

- (void)tryAppendKey:(id *)a1
{
  if (a1)
  {
    id v4 = [a1[1] valueForKey:a2];
    id v3 = (id)objc_msgSend(a1, "appendObject:withName:");
  }
}

- (id)appendKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        -[BSDescriptionBuilder tryAppendKey:]((id *)&self->super.isa, *(void *)(*((void *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return self;
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6
{
  id v9 = [(BSDescriptionBuilder *)self activeMultilinePrefix];
  -[BSDescriptionBuilder appendCollectionSection:withName:multilinePrefix:skipIfEmpty:objectTransformer:](self, "appendCollectionSection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", a3, a4);
}

- (void)appendCollectionSection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a7)
  {
    BOOL v18 = a6;
    long long v11 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = a3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = (*((void (**)(id, void))a7 + 2))(a7, *(void *)(*((void *)&v19 + 1) + 8 * v15));
          if (v16) {
            [v11 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [(BSDescriptionBuilder *)self appendCollectionSection:v11 withName:a4 multilinePrefix:a5 skipIfEmpty:v18];
  }
  else
  {
    [(BSDescriptionBuilder *)self appendCollectionSection:a3 withName:a4 multilinePrefix:a5 skipIfEmpty:a6];
  }
}

- (id)appendString:(id)a3
{
  if (a3)
  {
    uint64_t v5 = 24;
    if (!self->_activeComponent) {
      uint64_t v5 = 16;
    }
    id v6 = *(id *)((char *)&self->super.isa + v5);
    [v6 appendString:a3];
  }
  return self;
}

- (id)appendFormat:(id)a3
{
  id v3 = a3;
  if (a3) {
    id v3 = (id)[[NSString alloc] initWithFormat:a3 arguments:&v8];
  }
  uint64_t v5 = [(BSDescriptionBuilder *)self appendString:v3];

  return v5;
}

- (int)activeComponent
{
  return self->_activeComponent;
}

- (void)setActiveComponent:(int)a3
{
  self->_int activeComponent = a3;
}

- (BOOL)useDebugDescription
{
  return self->_useDebugDescription;
}

@end