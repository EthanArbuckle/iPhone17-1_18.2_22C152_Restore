@interface NSMutableAttributedString
+ (NSMutableAttributedString)allocWithZone:(_NSZone *)a3;
- (Class)_intentResolver;
- (Class)classForCoder;
- (NSMutableString)mutableString;
- (id)_formatInflectionAlternative:(id)a3 withReplacements:(id)a4;
- (void)_addAttributesIfNotPresentMergingInlinePresentationIntents:(id)a3 toRange:(_NSRange)a4;
- (void)_inflectWithLocale:(id)a3 replacements:(id)a4 concepts:(id)a5 preflight:(BOOL)a6;
- (void)addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range;
- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range;
- (void)addAttributesWeakly:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(NSAttributedString *)attrString;
- (void)appendLocalizedFormat:(NSAttributedString *)format;
- (void)deleteCharactersInRange:(NSRange)range;
- (void)enumerateFormattableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateInflectableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc;
- (void)removeAttribute:(NSAttributedStringKey)name range:(NSRange)range;
- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (void)setAttributedString:(NSAttributedString *)attrString;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;
@end

@implementation NSMutableAttributedString

- (void)appendAttributedString:(NSAttributedString *)attrString
{
  NSUInteger v5 = [(NSString *)[(NSAttributedString *)self string] length];

  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", v5, 0, attrString);
}

uint64_t __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = (void *)[a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v7 = 0;
  }
  uint64_t result = *(void *)(*(void *)(a1[5] + 8) + 40);
  if ((void *)result != v7)
  {
    uint64_t result = [(id)result isEqual:v7];
    if ((result & 1) == 0)
    {
      uint64_t v9 = a3 + a4;
      if (*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        (*(void (**)(void))(a1[4] + 16))();
        v10 = *(void **)(*(void *)(a1[5] + 8) + 40);
      }
      else
      {
        v10 = 0;
      }

      uint64_t result = [v7 copy];
      *(void *)(*(void *)(a1[5] + 8) + 40) = result;
      *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
    }
  }
  return result;
}

+ (NSMutableAttributedString)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)a1;
  if (self == a1) {
    v4 = (objc_class *)self;
  }

  return (NSMutableAttributedString *)NSAllocateObject(v4, 0, a3);
}

- (void)_inflectWithLocale:(id)a3 replacements:(id)a4 concepts:(id)a5 preflight:(BOOL)a6
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v11 = +[NSTermOfAddress currentUser];
  v22[4] = self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke;
  v23[3] = &unk_1E51F87E0;
  v23[4] = self;
  v21[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2;
  v22[3] = &unk_1E51F8808;
  v20[4] = self;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3;
  v21[3] = &unk_1E51F8830;
  v19[4] = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4;
  v20[3] = &unk_1E51F8830;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5;
  v19[3] = &unk_1E51F8858;
  v17[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6;
  v18[3] = &unk_1E51F8880;
  v18[4] = self;
  v16[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7;
  v17[3] = &unk_1E51F88A8;
  v15[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8;
  v16[3] = &unk_1E51F88D0;
  v14[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9;
  v15[3] = &unk_1E51F8920;
  v13[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11;
  v14[3] = &unk_1E51F8948;
  v12[5] = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12;
  v13[3] = &unk_1E51F8970;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13;
  v12[3] = &unk_1E51F8998;
  v12[4] = self;
  _NSInflect((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)v11, (uint64_t)v23, a6, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v18, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) length];
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateFormattableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateInflectableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAttribute:inRange:options:usingBlock:", a2, a3, a4, 2, a5);
}

- (void)enumerateInflectableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  NSUInteger v18 = a3.location + a3.length;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke;
  id v11 = &unk_1E51F89C0;
  v13 = &v19;
  v14 = &v15;
  id v12 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:");
  uint64_t v5 = v20[5];
  if (v5)
  {
    uint64_t v6 = v16[3];
    char v7 = 0;
    (*((void (**)(id, uint64_t, void, uint64_t, char *))a4 + 2))(a4, v5, 0, v6, &v7);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)enumerateFormattableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  NSUInteger v18 = a3.location + a3.length;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke;
  id v11 = &unk_1E51F89C0;
  v13 = &v19;
  v14 = &v15;
  id v12 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:");
  uint64_t v5 = v20[5];
  if (v5)
  {
    uint64_t v6 = v16[3];
    char v7 = 0;
    (*((void (**)(id, uint64_t, void, uint64_t, char *))a4 + 2))(a4, v5, 0, v6, &v7);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)appendLocalizedFormat:(NSAttributedString *)format
{
  va_start(va, format);
  uint64_t v5 = [NSAttributedString alloc];
  id v6 = -[NSAttributedString _initWithFormat:options:locale:arguments:](v5, "_initWithFormat:options:locale:arguments:", format, 0, [MEMORY[0x1E4F1CA20] currentLocale], va);
  [(NSMutableAttributedString *)self appendAttributedString:v6];
}

- (void)addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (range.length)
  {
    if (!value)
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      v22 = _NSNameOfClass(v21);
      v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v22, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v23);
    }
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    [(NSMutableAttributedString *)self beginEditing];
    do
    {
      NSUInteger v24 = 0;
      uint64_t v25 = 0;
      v10 = (void *)[(NSDictionary *)[(NSAttributedString *)self attributesAtIndex:location effectiveRange:&v24] mutableCopyWithZone:0];
      id v11 = v10;
      if (location + length >= v25 + v24) {
        NSUInteger v12 = v25 + v24;
      }
      else {
        NSUInteger v12 = location + length;
      }
      NSUInteger v13 = v12 - v24;
      BOOL v14 = location > v24 || v24 >= location + length;
      if (v14) {
        NSUInteger v15 = 0;
      }
      else {
        NSUInteger v15 = v24;
      }
      if (v14) {
        NSUInteger v13 = 0;
      }
      NSUInteger v16 = v12 - location;
      BOOL v17 = v24 > location || location >= v25 + v24;
      if (v17) {
        NSUInteger v18 = v15;
      }
      else {
        NSUInteger v18 = location;
      }
      if (v17) {
        NSUInteger v19 = v13;
      }
      else {
        NSUInteger v19 = v16;
      }
      NSUInteger v24 = v18;
      uint64_t v25 = v19;
      [v10 setObject:value forKey:name];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v24, v25);

      location += v25;
      length -= v25;
    }
    while (length);
    if ([(NSAttributedString *)self _willRequireIntentResolutionWhenContainingAttribute:name value:value])
    {
      [(NSAttributedString *)self _markRequiringIntentResolution];
    }
    [(NSMutableAttributedString *)self endEditing];
  }
}

- (void)removeAttribute:(NSAttributedStringKey)name range:(NSRange)range
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (range.length)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    [(NSMutableAttributedString *)self beginEditing];
    do
    {
      NSUInteger v18 = 0;
      uint64_t v19 = 0;
      uint64_t v8 = (void *)[(NSDictionary *)[(NSAttributedString *)self attributesAtIndex:location effectiveRange:&v18] mutableCopyWithZone:0];
      uint64_t v9 = v8;
      if (location + length >= v19 + v18) {
        NSUInteger v10 = v19 + v18;
      }
      else {
        NSUInteger v10 = location + length;
      }
      NSUInteger v11 = v10 - v18;
      BOOL v12 = location > v18 || v18 >= location + length;
      if (v12) {
        NSUInteger v13 = 0;
      }
      else {
        NSUInteger v13 = v18;
      }
      if (v12) {
        NSUInteger v11 = 0;
      }
      NSUInteger v14 = v10 - location;
      BOOL v15 = v18 > location || location >= v19 + v18;
      if (v15) {
        NSUInteger v16 = v13;
      }
      else {
        NSUInteger v16 = location;
      }
      if (v15) {
        NSUInteger v17 = v11;
      }
      else {
        NSUInteger v17 = v14;
      }
      NSUInteger v18 = v16;
      uint64_t v19 = v17;
      [v8 removeObjectForKey:name];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v18, v19);

      location += v19;
      length -= v19;
    }
    while (length);
    [(NSMutableAttributedString *)self endEditing];
  }
}

- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (range.length)
  {
    if (!attrs)
    {
      NSUInteger v17 = (objc_class *)objc_opt_class();
      NSUInteger v18 = _NSNameOfClass(v17);
      uint64_t v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: nil value", v18, sel_getName(a2)), 0 reason userInfo];
      objc_exception_throw(v19);
    }
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    [(NSMutableAttributedString *)self beginEditing];
    do
    {
      NSUInteger v20 = 0;
      NSUInteger v21 = 0;
      uint64_t v8 = (void *)[(NSDictionary *)[(NSAttributedString *)self attributesAtIndex:location effectiveRange:&v20] mutableCopyWithZone:0];
      uint64_t v9 = v8;
      if (location + length >= v21 + v20) {
        NSUInteger v10 = v21 + v20;
      }
      else {
        NSUInteger v10 = location + length;
      }
      if (v20 >= location + length || location > v20) {
        NSUInteger v12 = 0;
      }
      else {
        NSUInteger v12 = v10 - v20;
      }
      NSUInteger v13 = v10 - location;
      if (v20 > location || location >= v21 + v20) {
        NSUInteger v15 = v12;
      }
      else {
        NSUInteger v15 = v13;
      }
      NSUInteger v20 = location;
      NSUInteger v21 = v15;
      if (v15 > length) {
        NSUInteger v21 = length;
      }
      [v8 addEntriesFromDictionary:attrs];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v20, v21);

      location += v21;
      length -= v21;
    }
    while (length);
    if ([(NSAttributedString *)self _willRequireIntentResolutionWhenContainingAttributes:attrs])
    {
      [(NSAttributedString *)self _markRequiringIntentResolution];
    }
    [(NSMutableAttributedString *)self endEditing];
  }
}

- (Class)_intentResolver
{
  return objc_lookUpClass("_UIAttributedStringIntentResolver");
}

- (NSMutableString)mutableString
{
  v2 = (void *)[objc_allocWithZone((Class)NSMutableStringProxyForMutableAttributedString) initWithMutableAttributedString:self];

  return (NSMutableString *)v2;
}

uint64_t __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = [[_NSInflectionRuleExplicit alloc] initWithAttributesDictionary:a2];
  if (!v8) {
    uint64_t v8 = (_NSInflectionRuleExplicit *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"NSInflect"), "copy");
  }
  uint64_t v9 = *(_NSInflectionRuleExplicit **)(*(void *)(a1[5] + 8) + 40);
  if (v9 == v8 || (NSUInteger v13 = v8, [(_NSInflectionRuleExplicit *)v9 isEqual:v8]))
  {
    return MEMORY[0x1F41817F8]();
  }
  else
  {
    uint64_t v10 = a3 + a4;
    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      (*(void (**)(void))(a1[4] + 16))();
      NSUInteger v11 = *(void **)(*(void *)(a1[5] + 8) + 40);
    }
    else
    {
      NSUInteger v11 = 0;
    }

    uint64_t result = (uint64_t)v13;
    *(void *)(*(void *)(a1[5] + 8) + 40) = v13;
    *(void *)(*(void *)(a1[6] + 8) + 24) = v10;
  }
  return result;
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
  id v6 = NSClassFromString((NSString *)@"NSMutableAttributedString");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  id v6 = NSClassFromString((NSString *)@"NSMutableAttributedString");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)addAttributesWeakly:(id)a3 range:(_NSRange)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    [(NSMutableAttributedString *)self beginEditing];
    do
    {
      NSUInteger v17 = 0;
      NSUInteger v18 = 0;
      uint64_t v8 = [(NSAttributedString *)self attributesAtIndex:location effectiveRange:&v17];
      uint64_t v9 = (void *)[a3 mutableCopyWithZone:0];
      uint64_t v10 = v9;
      if (location + length >= v18 + v17) {
        NSUInteger v11 = v18 + v17;
      }
      else {
        NSUInteger v11 = location + length;
      }
      if (v17 >= location + length || location > v17) {
        NSUInteger v13 = 0;
      }
      else {
        NSUInteger v13 = v11 - v17;
      }
      NSUInteger v14 = v11 - location;
      if (v17 > location || location >= v18 + v17) {
        NSUInteger v16 = v13;
      }
      else {
        NSUInteger v16 = v14;
      }
      NSUInteger v17 = location;
      NSUInteger v18 = v16;
      if (v16 > length) {
        NSUInteger v18 = length;
      }
      [v9 addEntriesFromDictionary:v8];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v10, v17, v18);

      location += v18;
      length -= v18;
    }
    while (length);
    if ([(NSAttributedString *)self _willRequireIntentResolutionWhenContainingAttributes:a3])
    {
      [(NSAttributedString *)self _markRequiringIntentResolution];
    }
    [(NSMutableAttributedString *)self endEditing];
  }
}

- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(NSAttributedString *)attrString string];
  unint64_t v9 = [(NSString *)v8 length];
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  [(NSMutableAttributedString *)self beginEditing];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);
  if (v9)
  {
    for (i = 0; i < v9; unint64_t v12 = i)
    {
      NSUInteger v11 = [(NSAttributedString *)attrString attributesAtIndex:i effectiveRange:&v12];
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v12 + location, v13);
      unint64_t i = v12 + v13;
    }
  }
  if ([(NSAttributedString *)attrString _mayRequireIntentResolution]) {
    [(NSAttributedString *)self _markRequiringIntentResolution];
  }
  [(NSMutableAttributedString *)self endEditing];
}

- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc
{
}

- (void)deleteCharactersInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v6 = objc_alloc_init(NSAttributedString);
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", location, length, v6);
}

- (void)setAttributedString:(NSAttributedString *)attrString
{
  NSUInteger v5 = [(NSString *)[(NSAttributedString *)self string] length];

  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", 0, v5, attrString);
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)_addAttributesIfNotPresentMergingInlinePresentationIntents:(id)a3 toRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9[7] = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"NSInlinePresentationIntent"];
    if (v8) {
      uint64_t v8 = (void *)[v8 unsignedIntegerValue];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke;
    v9[3] = &unk_1E51F87B8;
    v9[5] = self;
    v9[6] = v8;
    v9[4] = a3;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", location, length, 0x100000, v9);
  }
}

uint64_t __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a2, "objectForKeyedSubscript:");
  uint64_t v9 = *(void *)(a1 + 48);
  if (v8) {
    uint64_t v8 = [(id)v8 unsignedIntegerValue];
  }
  uint64_t v16 = v8 | v9;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t result = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        if (![a2 objectForKeyedSubscript:v15]) {
          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v15, objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15), a3, a4);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t result = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
      uint64_t v12 = result;
    }
    while (result);
  }
  if (v16) {
    return objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"NSInlinePresentationIntent", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"), a3, a4);
  }
  return result;
}

- (id)_formatInflectionAlternative:(id)a3 withReplacements:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v33 = [+[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
  if (_NSIsNSString())
  {
    id v6 = [[NSMutableAttributedString alloc] initWithString:a3];
  }
  else
  {
    if (!_NSIsNSAttributedString())
    {
LABEL_38:
      char v7 = 0;
      return v7;
    }
    id v6 = (NSMutableAttributedString *)[a3 mutableCopy];
  }
  char v7 = v6;
  if (v6)
  {
    [(NSAttributedString *)v6 length];
    uint64_t v8 = [(NSString *)[(NSAttributedString *)v7 string] rangeOfString:@"{"];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v11 = v8;
      uint64_t v12 = @"{";
      while (v11 < [(NSAttributedString *)v7 length] - 1)
      {
        unint64_t v13 = v11 + 1;
        if ([(NSString *)[(NSAttributedString *)v7 string] characterAtIndex:v11 + 1] == 123)
        {
          -[NSMutableString replaceCharactersInRange:withString:]([(NSMutableAttributedString *)v7 mutableString], "replaceCharactersInRange:withString:", v11, 2, v12);
        }
        else
        {
          uint64_t v14 = [(NSString *)[(NSAttributedString *)v7 string] rangeOfString:@"}", 0, v11 + 1, [(NSAttributedString *)v7 length] - v13 options range];
          if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          unint64_t v15 = v14 + ~v11;
          uint64_t v16 = -[NSString substringWithRange:]([(NSAttributedString *)v7 string], "substringWithRange:", v11 + 1, v15);
          if ([(NSString *)v16 rangeOfCharacterFromSet:v33] != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          uint64_t v17 = [(NSString *)v16 integerValue];
          unint64_t v18 = v17 - 1;
          if (v17 < 1) {
            goto LABEL_37;
          }
          uint64_t v19 = v17;
          if (v18 >= [a4 count]
            || objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v18), "index") != v19
            || (long long v20 = (void *)[a4 objectAtIndexedSubscript:v18]) == 0)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v21 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
            if (!v21) {
              goto LABEL_37;
            }
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v36;
LABEL_25:
            NSUInteger v24 = v12;
            uint64_t v25 = 0;
            while (1)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(a4);
              }
              long long v20 = *(void **)(*((void *)&v35 + 1) + 8 * v25);
              if ([v20 index] == v19) {
                break;
              }
              if (v22 == ++v25)
              {
                uint64_t v22 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
                uint64_t v12 = v24;
                if (v22) {
                  goto LABEL_25;
                }
                goto LABEL_37;
              }
            }
            uint64_t v12 = v24;
            if (!v20) {
              goto LABEL_37;
            }
          }
          uint64_t v26 = [(NSAttributedString *)self string];
          uint64_t v27 = [v20 replacementRangeInResult];
          v29 = -[NSString substringWithRange:](v26, "substringWithRange:", v27, v28);
          -[NSMutableString replaceCharactersInRange:withString:]([(NSMutableAttributedString *)v7 mutableString], "replaceCharactersInRange:withString:", v11, v15 + 2, v29);
          uint64_t v30 = [(NSString *)v29 length];
          if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_37;
          }
          unint64_t v13 = v30 + v11;
        }
        unint64_t v11 = -[NSString rangeOfString:options:range:]([(NSAttributedString *)v7 string], "rangeOfString:options:range:", v12, 0, v13, [(NSAttributedString *)v7 length] - v13);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }
      goto LABEL_37;
    }
LABEL_7:
    [(NSAttributedString *)v7 length];
    uint64_t v9 = [(NSString *)[(NSAttributedString *)v7 string] rangeOfString:@"}"];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = v9;
      while (v10 < [(NSAttributedString *)v7 length] - 1
           && [(NSString *)[(NSAttributedString *)v7 string] characterAtIndex:v10 + 1] == 125)
      {
        [(NSMutableString *)[(NSMutableAttributedString *)v7 mutableString] replaceCharactersInRange:v10, 2, @"}" withString];
        unint64_t v10 = [(NSString *)[(NSAttributedString *)v7 string] rangeOfString:@"}", 0, v10 + 1, [(NSAttributedString *)v7 length] - (v10 + 1) options range];
        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          return v7;
        }
      }
LABEL_37:

      goto LABEL_38;
    }
  }
  return v7;
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = a3;
  while (1)
  {
    unint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "rangeOfString:options:range:", @"%", 0, a2, v3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    unint64_t v8 = v6;
    uint64_t v9 = a2 + v3;
    if (v6 > v9 - 2) {
      return 0;
    }
    uint64_t v10 = v7;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "characterAtIndex:", v6 + 1) != 37) {
      break;
    }
    a2 = v8 + v10;
    uint64_t v3 = v9 - (v8 + v10);
    if (!v3) {
      return 0;
    }
  }
  return 1;
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_firstValueOfAttributeWithKey:inRange:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSUInteger v5 = (void *)[*(id *)(a1 + 32) string];

  return objc_msgSend(v5, "substringWithRange:", a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) mutableString];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10;
  v9[3] = &unk_1E51F88F8;
  v9[4] = a4;
  return objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", a2, a3, 3, v9);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (_NSIsNSString())
  {
    unint64_t v8 = (void *)[*(id *)(a1 + 32) mutableString];
    objc_msgSend(v8, "replaceCharactersInRange:withString:", a2, a3, a4);
  }
  else if (_NSIsNSAttributedString())
  {
    id v9 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_identicalAttributesInRange:", a2, a3), "mutableCopy");
    [v9 removeObjectForKey:@"NSInflectionAlternative"];
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a2, a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "_addAttributesIfNotPresentMergingInlinePresentationIntents:toRange:", v9, a2, objc_msgSend(a4, "length"));
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSMutableAttributedString(NSInflection) _inflectWithLocale:replacements:concepts:preflight:]_block_invoke_11"), @"NSAttributedString_Inflection.m", 1037, @"Unknown kind of replacement: %@", a4);
  }
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a4, a5, a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _formatInflectionAlternative:a2 withReplacements:*(void *)(a1 + 40)];
}

@end