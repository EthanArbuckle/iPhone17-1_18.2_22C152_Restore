@interface AXAttributedString
+ (id)axAttributedStringWithString:(id)a3;
+ (id)string;
- (AXAttributedString)initWithCFAttributedString:(__CFAttributedString *)a3;
- (AXAttributedString)initWithString:(id)a3;
- (AXAttributedString)initWithStringOrAttributedString:(id)a3;
- (BOOL)hasAttribute:(id)a3;
- (BOOL)hasAttributes;
- (BOOL)isAXAttributedString;
- (Class)classForCoder;
- (__CFAttributedString)cfAttributedString;
- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:(id *)a3;
- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:(id *)a3;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attributeValueForKey:(id)a3;
- (id)attributedString;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)axAttributedStringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4;
- (id)axAttributedStringDescription;
- (id)axStringByReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (id)coalescedAttributes;
- (id)coalescedFontAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)lowercaseString;
- (id)string;
- (id)stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (id)stringByTrimmingCharactersInSet:(id)a3;
- (id)substringFromIndex:(unint64_t)a3;
- (id)substringWithRange:(_NSRange)a3;
- (id)uppercaseString;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)addAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5;
- (void)appendAXAttributedString:(id)a3;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)appendStringOrAXAttributedString:(id)a3;
- (void)convertAttachmentsWithBlock:(id)a3;
- (void)dealloc;
- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateAttributesInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateAttributesUsingBlock:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)removeAttributes:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)replaceString:(__CFString *)a3;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5;
- (void)setAttributes:(id)a3;
- (void)setAttributes:(id)a3 withRange:(_NSRange)a4;
@end

@implementation AXAttributedString

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[AXAttributedString setAttribute:forKey:withRange:](self, "setAttribute:forKey:withRange:", v7, v6, 0, [(AXAttributedString *)self length]);
}

- (void)setAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (__CFString *)a4;
  if (v10 && location + length <= CFAttributedStringGetLength(self->_string))
  {
    string = self->_string;
    if (v9)
    {
      v13 = v10;
      v14[0] = v9;
      CFDictionaryRef v12 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      v15.NSUInteger location = location;
      v15.NSUInteger length = length;
      CFAttributedStringSetAttributes(string, v15, v12, 0);
    }
    else
    {
      v16.NSUInteger location = location;
      v16.NSUInteger length = length;
      CFAttributedStringRemoveAttribute(string, v16, v10);
    }
  }
}

- (unint64_t)length
{
  unint64_t result = (unint64_t)self->_string;
  if (result) {
    return CFAttributedStringGetLength((CFAttributedStringRef)result);
  }
  return result;
}

+ (id)axAttributedStringWithString:(id)a3
{
  id v3 = a3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 copy];
  }
  else {
    uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithString:v3];
  }
  v5 = (void *)v4;

  return v5;
}

- (AXAttributedString)initWithString:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1F141B5A8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (AXAttributedString *)[(__CFString *)v5 copy];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXAttributedString;
    id v7 = [(AXAttributedString *)&v13 init];
    if (v7)
    {
      v8 = v7;
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFAttributedStringRef v10 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0);
      v8->_string = CFAttributedStringCreateMutableCopy(v9, 0, v10);
      CFRelease(v10);
      v11 = [(__CFString *)v5 _accessibilityAttributedLocalizedString];
      [v8 _setAccessibilityAttributedLocalizedString:v11];
      id v6 = v8;
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (AXAttributedString)initWithCFAttributedString:(__CFAttributedString *)a3
{
  if (a3)
  {
    uint64_t v4 = a3;
    v5 = [(__CFAttributedString *)v4 string];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v7 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[AXAttributedString initWithCFAttributedString:]((uint64_t)v5, v7);
      }
      v8 = 0;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)AXAttributedString;
      self = [(AXAttributedString *)&v10 init];
      if (!self)
      {
        v8 = 0;
        goto LABEL_12;
      }
      self->_string = CFAttributedStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v4);
      id v6 = [self _accessibilityAttributedLocalizedString];
      id v7 = [v6 copy];

      [self _setAccessibilityAttributedLocalizedString:v7];
      self = self;
      v8 = self;
    }

LABEL_12:
    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[AXAttributedString allocWithZone:a3] initWithCFAttributedString:[(AXAttributedString *)self cfAttributedString]];
  v5 = [self _accessibilityAttributedLocalizedString];
  if (v5)
  {
    id v6 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", [v5 cfAttributedString]);
    [v4 _setAccessibilityAttributedLocalizedString:v6];
  }
  return v4;
}

- (__CFAttributedString)cfAttributedString
{
  return self->_string;
}

- (void)dealloc
{
  string = self->_string;
  if (string)
  {
    CFRelease(string);
    self->_string = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXAttributedString;
  [(AXAttributedString *)&v4 dealloc];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)string
{
  return (id)[a1 axAttributedStringWithString:&stru_1F141B5A8];
}

- (AXAttributedString)initWithStringOrAttributedString:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = [(AXAttributedString *)self initWithCFAttributedString:v4];
  }
  else {
    v5 = [(AXAttributedString *)self initWithString:v4];
  }
  id v6 = v5;

  id v7 = v6;
  return v7;
}

- (id)stringByTrimmingCharactersInSet:(id)a3
{
  id v4 = a3;
  v5 = (CFMutableAttributedStringRef *)[(AXAttributedString *)self copy];
  uint64_t v6 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, [(CFMutableAttributedStringRef *)v5 length]);
  if (v7.location && !v6)
  {
    v7.NSUInteger length = v7.location;
    do
    {
      v7.NSUInteger location = 0;
      CFAttributedStringReplaceString(v5[1], v7, &stru_1F141B5A8);
      uint64_t v8 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, [(CFMutableAttributedStringRef *)v5 length]);
      if (!v7.location) {
        break;
      }
      v7.NSUInteger length = v7.location;
    }
    while (!v8);
  }
  do
  {
    uint64_t v9 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 4, 0, [(CFMutableAttributedStringRef *)v5 length]);
    if (!v10) {
      break;
    }
    CFIndex v11 = v9;
    CFIndex v12 = v10;
    if (v9 + v10 != [(CFMutableAttributedStringRef *)v5 length]) {
      break;
    }
    v15.NSUInteger location = v11;
    v15.NSUInteger length = v12;
    CFAttributedStringReplaceString(v5[1], v15, &stru_1F141B5A8);
  }
  while (v11 != 0x7FFFFFFFFFFFFFFFLL);

  return v5;
}

- (void)convertAttachmentsWithBlock:(id)a3
{
  id v4 = (uint64_t (**)(id, uint64_t))a3;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  unint64_t v5 = [(AXAttributedString *)self length];
  unint64_t v6 = 0;
  while (1)
  {
    CFRange v7 = [(AXAttributedString *)self attributesAtIndex:v6 effectiveRange:&v12];
    uint64_t v8 = v7;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v9 = [v7 objectForKey:UIAccessibilityTokenAttachment];
    CFIndex v10 = (void *)v9;
    if (v4 && v9)
    {
      uint64_t v11 = v4[2](v4, v9);
      -[AXAttributedString setAttribute:forKey:withRange:](self, "setAttribute:forKey:withRange:", v11, UIAccessibilityTokenAttachment, v12, v13);
    }
    v12 += v13;

    unint64_t v6 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v5) {
      goto LABEL_10;
    }
  }

LABEL_10:
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFAttributedStringGetString(self->_string);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCharacters:range:", a3, location, length);
}

- (id)substringWithRange:(_NSRange)a3
{
  id v3 = -[__CFAttributedString attributedSubstringFromRange:](self->_string, "attributedSubstringFromRange:", a3.location, a3.length);
  id v4 = [[AXAttributedString alloc] initWithStringOrAttributedString:v3];

  return v4;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4 = CFAttributedStringGetString(self->_string);
  LOWORD(a3) = [v4 characterAtIndex:a3];

  return a3;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

- (void)replaceString:(__CFString *)a3
{
  if (a3)
  {
    string = self->_string;
    v5.NSUInteger length = [(AXAttributedString *)self length];
    v5.NSUInteger location = 0;
    CFAttributedStringReplaceString(string, v5, a3);
  }
}

- (id)attributedString
{
  return self->_string;
}

- (void)setAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        CFIndex v10 = [v4 objectForKey:v9];
        [(AXAttributedString *)self setAttribute:v10 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5
{
}

- (void)removeAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFAttributedStringBeginEditing(self->_string);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v12 + 1) + 8 * i);
        string = self->_string;
        v18.NSUInteger length = CFAttributedStringGetLength(string);
        v18.NSUInteger location = 0;
        CFAttributedStringRemoveAttribute(string, v18, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  CFAttributedStringEndEditing(self->_string);
}

- (void)setAttributes:(id)a3 withRange:(_NSRange)a4
{
  int64_t length = a4.length;
  NSUInteger location = a4.location;
  CFDictionaryRef replacement = (const __CFDictionary *)a3;
  if (location + length <= CFAttributedStringGetLength(self->_string))
  {
    if (length >= 1)
    {
      v9.NSUInteger location = location;
      v9.int64_t length = length;
      CFAttributedStringSetAttributes(self->_string, v9, replacement, 0);
    }
  }
  else
  {
    NSLog((NSString *)@"AX: bad range passed into setAttributes: %lu %lu", location, length);
  }
}

- (id)axAttributedStringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[AXAttributedString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, [(AXAttributedString *)self length]);

  return v8;
}

- (id)axStringByReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = (__CFString *)a4;
  uint64_t v8 = (CFMutableAttributedStringRef *)[(AXAttributedString *)self copy];
  v11.NSUInteger location = location;
  v11.NSUInteger length = length;
  CFAttributedStringSetAttributes(v8[1], v11, MEMORY[0x1E4F1CC08], 1u);
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  CFAttributedStringReplaceString(v8[1], v12, v7);

  return v8;
}

- (id)stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v63 = CFAttributedStringGetString(self->_string);
  int64_t v12 = [(AXAttributedString *)self length];
  long long v13 = [MEMORY[0x1E4F1CA48] array];
  v61 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__AXAttributedString_stringByReplacingOccurrencesOfString_withString_options_range___block_invoke;
  aBlock[3] = &unk_1E62206C8;
  v62 = self;
  aBlock[4] = self;
  long long v14 = (uint64_t (**)(void *, void *, void))_Block_copy(aBlock);
  if (location)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = v14[2](v14, v13, v15);
      uint64_t v15 = v16 + v17;
    }
    while (v16 + v17 < location);
  }
  NSUInteger v18 = location + length;
  if ((uint64_t)(location + length) < v12)
  {
    NSUInteger v19 = location + length;
    do
    {
      uint64_t v20 = v14[2](v14, v13, v19);
      NSUInteger v19 = v20 + v21;
    }
    while (v20 + v21 < v12);
  }
  if (location < v18)
  {
    NSUInteger v22 = location;
    do
    {
      uint64_t v23 = v14[2](v14, v61, v22);
      NSUInteger v22 = v23 + v24;
    }
    while (v23 + v24 < v18);
  }
  v58 = v14;
  v25 = objc_msgSend(v63, "substringWithRange:", location, length, 8);
  v59 = v11;
  v60 = v10;
  objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:options:range:", v10, v11, a5, 0, objc_msgSend(v25, "length"));
  CFStringRef v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  MutableCopy = CFAttributedStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFAttributedStringRef *)((char *)&v62->super.super.super.isa + v56));
  v79.NSUInteger location = location;
  v79.NSUInteger length = length;
  v57 = (__CFString *)v26;
  CFAttributedStringReplaceString(MutableCopy, v79, v26);
  v80.NSUInteger length = CFAttributedStringGetLength(MutableCopy);
  v80.NSUInteger location = 0;
  CFAttributedStringSetAttributes(MutableCopy, v80, MEMORY[0x1E4F1CC08], 1u);
  v28 = [[AXAttributedString alloc] initWithCFAttributedString:MutableCopy];
  CFRelease(MutableCopy);
  unint64_t v29 = [(AXAttributedString *)v28 length] - v12;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obja = v13;
  uint64_t v30 = [obja countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v71 != v32) {
          objc_enumerationMutation(obja);
        }
        v34 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v35 = objc_msgSend(v34, "objectAtIndex:", 0, v57);
        unint64_t v36 = [v35 rangeValue];
        uint64_t v38 = v37;

        v39 = [v34 objectAtIndex:1];
        if (v36 >= v18) {
          unint64_t v40 = v29;
        }
        else {
          unint64_t v40 = 0;
        }
        -[AXAttributedString setAttributes:withRange:](v28, "setAttributes:withRange:", v39, v40 + v36, v38);
      }
      uint64_t v31 = [obja countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v31);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v41 = v61;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v67;
    unint64_t v45 = v29 + v18;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v41);
        }
        v47 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        v48 = objc_msgSend(v47, "objectAtIndex:", 0, v57);
        uint64_t v49 = [v48 rangeValue];
        uint64_t v51 = v50;

        v52 = [v47 objectAtIndex:1];
        if (v49 + v51 <= v45) {
          -[AXAttributedString setAttributes:withRange:](v28, "setAttributes:withRange:", v52, v49, v51);
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v43);
  }

  v53 = [v62 _accessibilityAttributedLocalizedString];
  v54 = (void *)[v53 copy];

  if (v54) {
    [v28 _setAccessibilityAttributedLocalizedString:v54];
  }

  return v28;
}

uint64_t __84__AXAttributedString_stringByReplacingOccurrencesOfString_withString_options_range___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v10 = xmmword_1BA6A6360;
  id v6 = [*(id *)(a1 + 32) attributesAtIndex:a3 effectiveRange:&v10];
  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F29238] valueWithRange:v10];
    v11[0] = v7;
    v11[1] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [v5 addObject:v8];
  }
  return v10;
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  id v5 = [[AXAttributedString alloc] initWithString:v4];

  [(AXAttributedString *)self appendAXAttributedString:v5];
}

- (void)appendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 locale:0 arguments:&v7];

  [(AXAttributedString *)self appendString:v6];
}

- (void)appendAXAttributedString:(id)a3
{
  if (a3)
  {
    string = self->_string;
    uint64_t v4 = [a3 cfAttributedString];
    [(__CFAttributedString *)string appendAttributedString:v4];
  }
}

- (void)appendStringOrAXAttributedString:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AXAttributedString *)self appendAXAttributedString:v4];
  }
  else {
    [(AXAttributedString *)self appendString:v4];
  }
}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  CFDictionaryRef Length = (const __CFDictionary *)CFAttributedStringGetLength(self->_string);
  if (Length)
  {
    CFRange v10 = (CFRange)xmmword_1BA6A6370;
    CFDictionaryRef Attributes = CFAttributedStringGetAttributes(self->_string, a3, &v10);
    if (a4) {
      *(CFRange *)a4 = v10;
    }
    CFDictionaryRef Length = Attributes;
  }
  return Length;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v8 = (__CFString *)a3;
  if (CFAttributedStringGetLength(self->_string))
  {
    CFRange v12 = (CFRange)xmmword_1BA6A6370;
    Attribute = (void *)CFAttributedStringGetAttribute(self->_string, a4, v8, &v12);
    if (a5) {
      *(CFRange *)a5 = v12;
    }
    id v10 = Attribute;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)attributeValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CFRange v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AXAttributedString_attributeValueForKey___block_invoke;
  v8[3] = &unk_1E62206F0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(AXAttributedString *)self enumerateAttributesUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __43__AXAttributedString_attributeValueForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = [a2 objectForKey:*(void *)(a1 + 32)];
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
    *a5 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

- (void)enumerateAttributesUsingBlock:(id)a3
{
  id v4 = a3;
  -[AXAttributedString enumerateAttributesInRange:usingBlock:](self, "enumerateAttributesInRange:usingBlock:", 0, [(AXAttributedString *)self length], v4);
}

- (void)enumerateAttributesInRange:(_NSRange)a3 usingBlock:(id)a4
{
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0) {
    -[__CFAttributedString enumerateAttributesInRange:options:usingBlock:](self->_string, "enumerateAttributesInRange:options:usingBlock:");
  }
}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
}

- (BOOL)isAXAttributedString
{
  return 1;
}

- (BOOL)hasAttributes
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__AXAttributedString_hasAttributes__block_invoke;
  v4[3] = &unk_1E6220718;
  v4[4] = &v5;
  [(AXAttributedString *)self enumerateAttributesUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__AXAttributedString_hasAttributes__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7 && [v7 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

- (id)string
{
  return (id)CFAttributedStringGetString(self->_string);
}

- (id)lowercaseString
{
  id v3 = (void *)[(AXAttributedString *)self copy];
  id v4 = (__CFAttributedString *)v3[1];
  CFIndex v5 = [(AXAttributedString *)self length];
  id v6 = [(AXAttributedString *)self string];
  id v7 = [v6 lowercaseString];
  v10.NSUInteger location = 0;
  v10.NSUInteger length = v5;
  CFAttributedStringReplaceString(v4, v10, v7);

  return v3;
}

- (id)uppercaseString
{
  id v3 = (void *)[(AXAttributedString *)self copy];
  id v4 = (__CFAttributedString *)v3[1];
  CFIndex v5 = [(AXAttributedString *)self length];
  id v6 = [(AXAttributedString *)self string];
  id v7 = [v6 uppercaseString];
  v10.NSUInteger location = 0;
  v10.NSUInteger length = v5;
  CFAttributedStringReplaceString(v4, v10, v7);

  return v3;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  MutableCopy = CFAttributedStringCreateMutableCopy(0, 0, self->_string);
  CFAttributedStringRef v7 = CFAttributedStringCreate(0, &stru_1F141B5A8, 0);
  CFAttributedStringRef v8 = v7;
  if (MutableCopy) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    CFRange v10 = 0;
    if (!v7)
    {
      if (!MutableCopy) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (location + length <= CFAttributedStringGetLength(self->_string))
  {
    if (location)
    {
      v14.NSUInteger location = 0;
      v14.NSUInteger length = location;
      CFAttributedStringReplaceAttributedString(MutableCopy, v14, v8);
    }
    v12.NSUInteger length = CFAttributedStringGetLength(MutableCopy) - length;
    if (v12.length >= 1)
    {
      v12.NSUInteger location = length;
      CFAttributedStringReplaceAttributedString(MutableCopy, v12, v8);
    }
    CFRange v10 = (void *)[objc_allocWithZone((Class)AXAttributedString) initWithCFAttributedString:MutableCopy];
  }
  else
  {
    CFRange v10 = 0;
  }
  CFRelease(v8);
  if (MutableCopy) {
LABEL_8:
  }
    CFRelease(MutableCopy);
LABEL_9:
  return v10;
}

- (id)coalescedAttributes
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__AXAttributedString_coalescedAttributes__block_invoke;
  v6[3] = &unk_1E6220740;
  id v4 = v3;
  id v7 = v4;
  [(AXAttributedString *)self enumerateAttributesUsingBlock:v6];

  return v4;
}

void __41__AXAttributedString_coalescedAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        CFRange v10 = *(void **)(a1 + 32);
        uint64_t v11 = [v3 objectForKeyedSubscript:v9];
        [v10 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)coalescedFontAttributes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  unint64_t v16 = [(AXAttributedString *)self length];
  char v2 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v3 = 0;
  do
  {
    id v4 = [(AXAttributedString *)self attributesAtIndex:v3 effectiveRange:&v22];
    uint64_t v5 = v4;
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {

      break;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (!v6) {
      goto LABEL_24;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        CFRange v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v5 objectForKey:v10];
          long long v12 = [v2 objectForKey:v10];
          if (!v12)
          {
            if (([v10 isEqualToString:UIAccessibilityTokenBold] & 1) != 0
              || ([v10 isEqualToString:UIAccessibilityTokenItalic] & 1) != 0
              || ([v10 isEqualToString:UIAccessibilityTokenUnderline] & 1) != 0
              || [v10 isEqualToString:UIAccessibilityTokenMisspelled])
            {
              if ([v11 BOOLValue]) {
                goto LABEL_15;
              }
            }
            else if (([v10 isEqualToString:UIAccessibilityTokenFontSize] & 1) == 0 {
                   && ![v10 isEqualToString:UIAccessibilityTokenBlockquoteLevel]
            }
                   || ([v11 floatValue], v13 > 0.01))
            {
LABEL_15:
              [v2 setObject:v11 forKey:v10];
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v14 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v7 = v14;
    }
    while (v14);
LABEL_24:
    v22 += v23;

    unint64_t v3 = v22;
  }
  while (v22 != 0x7FFFFFFFFFFFFFFFLL && v22 < v16);
  return v2;
}

- (BOOL)hasAttribute:(id)a3
{
  id v4 = a3;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  unint64_t v5 = [(AXAttributedString *)self length];
  unint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = [(AXAttributedString *)self attributesAtIndex:v6 effectiveRange:&v12];
    uint64_t v8 = v7;
    BOOL v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    CFRange v10 = [v7 objectForKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v10 BOOLValue]) {
        goto LABEL_10;
      }
    }
    else if (v10)
    {
LABEL_10:

      break;
    }
    v12 += v13;

    BOOL v9 = 0;
    unint64_t v6 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v5) {
      goto LABEL_12;
    }
  }

LABEL_12:
  return v9;
}

- (id)substringFromIndex:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AXAttributedString;
  unint64_t v5 = -[AXAttributedString substringFromIndex:](&v18, sel_substringFromIndex_);
  unint64_t v6 = +[AXAttributedString axAttributedStringWithString:v5];
  unint64_t v7 = [(AXAttributedString *)self length];
  if (v7 > a3)
  {
    unint64_t v8 = v7;
    unint64_t v16 = a3;
    uint64_t v17 = 0;
    unint64_t v9 = a3;
    while (1)
    {
      CFRange v10 = [(AXAttributedString *)self attributesAtIndex:v9 effectiveRange:&v16];
      uint64_t v11 = v10;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v12 = a3 - v16;
      if (a3 < v16) {
        unint64_t v12 = 0;
      }
      uint64_t v13 = v17 - v12;
      if (v16 >= a3) {
        unint64_t v14 = v16 - a3;
      }
      else {
        unint64_t v14 = 0;
      }
      if (v13 + v14 <= objc_msgSend(v5, "length", v16)) {
        objc_msgSend(v6, "setAttributes:withRange:", v11, v14, v13);
      }
      v16 += v17;

      unint64_t v9 = v16;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL || v16 >= v8) {
        goto LABEL_15;
      }
    }
  }
LABEL_15:

  return v6;
}

- (id)axAttributedStringDescription
{
  char v2 = [(AXAttributedString *)self cfAttributedString];
  return (id)[(__CFAttributedString *)v2 description];
}

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:(id *)a3
{
  id v4 = [(AXAttributedString *)self attributedString];
  unint64_t v5 = [v4 _axRecursivelyPropertyListCoercedRepresentationWithError:a3];

  return v5;
}

- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
  }
  return 0;
}

- (void)initWithCFAttributedString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1BA657000, a2, OS_LOG_TYPE_FAULT, "attributedStringRef.string expected to be a string, was actually: %@", (uint8_t *)&v2, 0xCu);
}

@end