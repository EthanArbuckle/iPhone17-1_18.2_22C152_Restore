@interface CAMLWriter
+ (id)writerWithData:(id)a3;
- (BOOL)encodingForReverseSerializationTest;
- (CAMLWriter)initWithData:(id)a3;
- (CAMLWriterDelegate)delegate;
- (NSURL)baseURL;
- (id)URLStringForResource:(id)a3;
- (void)_writeElementTree:(_CAMLWriterElement *)a3;
- (void)beginElement:(unsigned int)a3;
- (void)beginPropertyElement:(id)a3;
- (void)dealloc;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 conditionally:(BOOL)a4;
- (void)endElement;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementAttribute:(id)a3 forKey:(id)a4;
- (void)setElementContent:(id)a3;
@end

@implementation CAMLWriter

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0) {
      CFRelease(priv->var0);
    }
    var4 = priv->var4;
    if (var4) {
      CFRelease(var4);
    }
    var5 = priv->var5;
    if (var5) {
      CFRelease(var5);
    }
    var6 = priv->var6;
    if (var6) {
      CFRelease(var6);
    }
    var1 = priv->var1;
    if (var1) {
      CFRelease(var1);
    }
    var3 = priv->var3;
    if (var3) {
      CAMLWriterFreeElementList(var3);
    }
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)CAMLWriter;
  [(CAMLWriter *)&v10 dealloc];
}

- (void)_writeElementTree:(_CAMLWriterElement *)a3
{
  CAMLWriterNewline((_CAMLWriterPriv *)self->_priv->var0, self->_priv->var7);
  if (a3->var1) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a3->var8 == 0;
  }
  priv = self->_priv;
  if (a3->var6)
  {
    CAMLWriterPrintf(priv, "<%S", a3->var5);
    var6 = a3->var6;
    if (var6)
    {
      if (v5) {
        v8 = "/>";
      }
      else {
        v8 = ">";
      }
      do
      {
        v9 = self->_priv;
        String = CAAtomGetString(*((_DWORD *)var6 + 2));
        if (*(void *)var6) {
          uint64_t v11 = "";
        }
        else {
          uint64_t v11 = v8;
        }
        CAMLWriterPrintf(v9, " %S=\"%S\"%s", String, *((const void **)var6 + 2), v11);
        var6 = *(_CAMLWriterAttribute **)var6;
      }
      while (var6);
    }
  }
  else
  {
    v12 = ">";
    if (v5) {
      v12 = "/>";
    }
    CAMLWriterPrintf(priv, "<%S%s", a3->var5, v12);
  }
  var1 = a3->var1;
  if (var1)
  {
    ++self->_priv->var7;
    do
    {
      [(CAMLWriter *)self _writeElementTree:var1];
      var1 = var1->var2;
    }
    while (var1);
    --self->_priv->var7;
  }
  else if (a3->var8)
  {
    CAMLWriterPrintf(self->_priv, "%S", a3->var8);
  }
  if (!v5)
  {
    v14 = self->_priv;
    if (!a3->var8)
    {
      CAMLWriterNewline((_CAMLWriterPriv *)v14->var0, v14->var7);
      v14 = self->_priv;
    }
    CAMLWriterPrintf(v14, "</%S>", a3->var5);
  }
}

- (void)endElement
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  var3 = self->_priv->var3;
  var0 = var3->var0;
  result.location = 0;
  result.length = 0;
  if (var3->var9 == 2)
  {
    CFStringRef var8 = var3->var8;
    if (var8)
    {
      if (!-[CAMLWriter endElement]::newline_set)
      {
        v35.location = 10;
        v35.length = 1;
        -[CAMLWriter endElement]::newline_set = (uint64_t)CFCharacterSetCreateWithCharactersInRange(0, v35);
        CFStringRef var8 = var3->var8;
      }
      v36.length = CFStringGetLength(var8);
      result.location = 0;
      result.length = v36.length;
      v36.location = 0;
      if (!CFStringFindCharacterFromSet(var3->var8, (CFCharacterSetRef)-[CAMLWriter endElement]::newline_set, v36, 0, &result))
      {
        [(CAMLWriter *)self setElementAttribute:var3->var8 forKey:@"value"];
        CFRelease(var3->var8);
        var3->CFStringRef var8 = 0;
      }
    }
  }
  self->_priv->var3 = var0;
  if (var0)
  {
    if ((var0->var9 & 4) != 0)
    {
      v6 = var0->var0;
      if (var0->var0)
      {
        var4 = v6->var4;
        if (var4)
        {
          if ((v6->var9 & 2) != 0)
          {
            p_var6 = &var0->var6;
            while (1)
            {
              p_var6 = (_CAMLWriterAttribute **)*p_var6;
              if (!p_var6) {
                break;
              }
              if (*((_DWORD *)p_var6 + 2) == 338)
              {
                if (p_var6[2])
                {
                  v22 = &var3->var6;
                  while (1)
                  {
                    v22 = (_CAMLWriterAttribute **)*v22;
                    if (!v22) {
                      break;
                    }
                    if (*((_DWORD *)v22 + 2) == 577)
                    {
                      CFStringRef v23 = (const __CFString *)v22[2];
                      if (v23)
                      {
                        CFStringRef v24 = (const __CFString *)objc_msgSend(var4, "CAMLTypeForKey:");
                        if (v24)
                        {
                          if (CAMLWriterTypesEqual(v23, v24)) {
                            CAMLWriterElementRemoveAttribute(var3, 577);
                          }
                        }
                      }
                      goto LABEL_12;
                    }
                  }
                }
                break;
              }
            }
          }
        }
      }
    }
LABEL_12:
    unsigned int var9 = var3->var9;
    if (var9 == 2)
    {
      if (var0->var9 == 4)
      {
        var0->unsigned int var9 = 6;
        var0->CFStringRef var8 = var3->var8;
        var3->CFStringRef var8 = 0;
        var1 = var3->var1;
        if (var1)
        {
          objc_super v10 = var3->var1;
          do
          {
            v10->var0 = var0;
            objc_super v10 = v10->var2;
          }
          while (v10);
        }
        *var0->var3 = var1;
        var0->var3 = var3->var3;
        var3->var1 = 0;
        var3->var3 = &var3->var1;
        *var0->var7 = var3->var6;
        var0->var7 = var3->var7;
        var3->var6 = 0;
        var3->var7 = &var3->var6;
        goto LABEL_51;
      }
      goto LABEL_26;
    }
  }
  else
  {
    unsigned int var9 = var3->var9;
  }
  if (var9 == 6)
  {
    if (var0)
    {
      if (!var3->var1 && var0->var9 == 2)
      {
        var6 = var3->var6;
        if (var6)
        {
          v12 = *(_CAMLWriterAttribute **)var6;
          if (*(void *)var6)
          {
            if (!*(void *)v12)
            {
              int v25 = *((_DWORD *)var6 + 2);
              if (v25 == 583)
              {
                int v27 = *((_DWORD *)v12 + 2);
                v26 = *(_CAMLWriterAttribute **)var6;
                v12 = var3->var6;
                if (v27 != 338) {
                  goto LABEL_26;
                }
              }
              else
              {
                if (v25 != 338) {
                  goto LABEL_26;
                }
                v26 = var3->var6;
                if (*((_DWORD *)v12 + 2) != 583) {
                  goto LABEL_26;
                }
              }
              CFStringRef v28 = (const __CFString *)*((void *)v26 + 2);
              uint64_t v29 = *((void *)v12 + 2);
              if (!CAMLWriterIdentifierNeedsQuoting(v28))
              {
                CFSetRef v30 = (const __CFSet *)CAMLWriterReservedAttr(__CFString const*)::reserved_attrs;
                if (!CAMLWriterReservedAttr(__CFString const*)::reserved_attrs)
                {
                  *(_OWORD *)values = xmmword_1E5280130;
                  long long v33 = *(_OWORD *)off_1E5280140;
                  CFSetRef v30 = CFSetCreate(0, (const void **)values, 4, MEMORY[0x1E4F1D548]);
                  CAMLWriterReservedAttr(__CFString const*)::reserved_attrs = (uint64_t)v30;
                }
                if (!CFSetContainsValue(v30, v28))
                {
                  [(CAMLWriter *)self setElementAttribute:v29 forKey:v28];
                  goto LABEL_51;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_26:
  if (var3->var5) {
    goto LABEL_38;
  }
  unsigned int v13 = var3->var9;
  if ((v13 & 6) != 0)
  {
    if ((v13 & 4) != 0) {
      int v14 = 338;
    }
    else {
      int v14 = 577;
    }
    v15 = &var3->var6;
    while (1)
    {
      v15 = (_CAMLWriterAttribute **)*v15;
      if (!v15) {
        break;
      }
      if (*((_DWORD *)v15 + 2) == v14)
      {
        v16 = v15[2];
        if (v16 && !CAMLWriterIdentifierNeedsQuoting((CFStringRef)v15[2]))
        {
          var3->var5 = (__CFString *)CFRetain(v16);
          CAMLWriterElementRemoveAttribute(var3, v14);
        }
        break;
      }
    }
  }
  if (var3->var5)
  {
LABEL_38:
    if (var0)
    {
LABEL_39:
      *var0->var3 = var3;
      var0->var3 = &var3->var2;
      return;
    }
  }
  else
  {
    unsigned int v17 = var3->var9;
    v18 = @"o";
    v19 = @"unknown";
    if (v17 == 8) {
      v19 = @"script";
    }
    if (v17 != 2) {
      v18 = v19;
    }
    if (v17 == 1) {
      v18 = @"caml";
    }
    if ((v17 & 4) != 0) {
      v20 = @"p";
    }
    else {
      v20 = v18;
    }
    var3->var5 = v20;
    CFRetain(v20);
    if (var0) {
      goto LABEL_39;
    }
  }
  CAMLWriterPrintf(self->_priv, "%s", "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
  [(CAMLWriter *)self _writeElementTree:var3];
  CAMLWriterNewline((_CAMLWriterPriv *)self->_priv->var0, self->_priv->var7);
LABEL_51:
  CAMLWriterFreeElementList(var3);
}

- (id)URLStringForResource:(id)a3
{
  if (!a3) {
    return 0;
  }
  priv = self->_priv;
  if ((*((unsigned char *)priv + 60) & 4) == 0) {
    return 0;
  }
  v4 = (void *)[priv->var2 CAMLWriter:self URLForResource:a3];
  if (!v4) {
    return 0;
  }
  BOOL v5 = v4;
  var1 = priv->var1;
  if (!var1) {
    goto LABEL_17;
  }
  if ([v4 baseURL] && objc_msgSend((id)objc_msgSend(v5, "baseURL"), "isEqual:", var1))
  {
    return (id)[v5 relativePath];
  }
  if ([v5 isFileURL]
    && ([(__CFURL *)var1 isFileURL] & 1) != 0
    && (v8 = objc_msgSend((id)objc_msgSend(v5, "path"), "pathComponents"),
        int v9 = [v8 count],
        objc_super v10 = objc_msgSend((id)-[__CFURL path](var1, "path"), "pathComponents"),
        unsigned int v11 = [v10 count],
        int v12 = v11,
        v9 > (int)v11))
  {
    uint64_t v13 = v11;
    while ((int)v13 >= 1)
    {
      --v13;
      if ((objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v13), "isEqualToString:", objc_msgSend(v10, "objectAtIndex:", v13)) & 1) == 0)goto LABEL_17; {
    }
      }
    uint64_t v14 = objc_msgSend(v8, "subarrayWithRange:", v12, v9 - v12);
    v15 = (void *)[NSString pathWithComponents:v14];
    uint64_t v16 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    return (id)[v15 stringByAddingPercentEncodingWithAllowedCharacters:v16];
  }
  else
  {
LABEL_17:
    return (id)[v5 absoluteString];
  }
}

- (void)setElementContent:(id)a3
{
  var3 = self->_priv->var3;
  CFStringRef var8 = var3->var8;
  if (var8 != a3)
  {
    if (var8) {
      CFRelease(var8);
    }
    CFStringRef Copy = 0;
    if (a3) {
      CFStringRef Copy = CFStringCreateCopy(0, (CFStringRef)a3);
    }
    var3->CFStringRef var8 = (__CFString *)Copy;
  }
}

- (void)setElementAttribute:(id)a3 forKey:(id)a4
{
  var3 = self->_priv->var3;
  int v6 = CAInternAtom((const __CFString *)a4, 1);
  int v7 = v6;
  p_var6 = (_CAMLWriterAttribute *)&var3->var6;
  do
  {
    p_var6 = *(_CAMLWriterAttribute **)p_var6;
    if (!p_var6)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      p_var6 = (_CAMLWriterAttribute *)malloc_type_zone_malloc(malloc_zone, 0x18uLL, 0x8BB15036uLL);
      *var3->var7 = p_var6;
      var3->var7 = (_CAMLWriterAttribute **)p_var6;
      *(void *)p_var6 = 0;
      *((_DWORD *)p_var6 + 2) = v7;
      goto LABEL_7;
    }
  }
  while (*((_DWORD *)p_var6 + 2) != v6);
  id v9 = (id)*((void *)p_var6 + 2);
  if (v9 == a3) {
    return;
  }
  CFRelease(v9);
  *((void *)p_var6 + 2) = 0;
LABEL_7:
  *((void *)p_var6 + 2) = CFStringCreateCopy(0, (CFStringRef)a3);
}

- (void)beginPropertyElement:(id)a3
{
  [(CAMLWriter *)self beginElement:2];

  [(CAMLWriter *)self setElementAttribute:a3 forKey:@"key"];
}

- (void)beginElement:(unsigned int)a3
{
  priv = self->_priv;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  int v7 = (_CAMLWriterElement *)malloc_type_zone_malloc(malloc_zone, 0x50uLL, 0x8BB15036uLL);
  if (v7)
  {
    v7->var0 = priv->var3;
    priv->var3 = v7;
    v7->var1 = 0;
    v7->var2 = 0;
    v7->var3 = &v7->var1;
    v7->var4 = 0;
    v7->var5 = 0;
    v7->var6 = 0;
    v7->var7 = &v7->var6;
    v7->CFStringRef var8 = 0;
    v7->unsigned int var9 = 1 << a3;
    if (priv->var4)
    {
      if (a3 == 1) {
        -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:");
      }
      priv->var4 = 0;
    }
  }
}

- (void)encodeObject:(id)a3 conditionally:(BOOL)a4
{
  priv = self->_priv;
  if (priv->var3)
  {
    char v8 = *((unsigned char *)priv + 60);
    if ((v8 & 8) != 0)
    {
      if (![priv->var2 CAMLWriter:self shouldEncodeObject:a3]) {
        return;
      }
      char v8 = *((unsigned char *)priv + 60);
    }
    if (a3
      && (v8 & 2) != 0
      && (CFStringRef v9 = (const __CFString *)[priv->var2 CAMLWriter:self IDForObject:a3]) != 0
      && (CFStringRef Copy = CFStringCreateCopy(0, v9)) != 0)
    {
      unsigned int v11 = (__CFString *)Copy;
      CFSetRef var5 = priv->var5;
      if (var5 && CFSetContainsValue(var5, v11))
      {
        if ((*((unsigned char *)priv + 60) & 1) == 0
          || (uint64_t v13 = [priv->var2 CAMLWriter:self typeForObject:a3]) == 0)
        {
          uint64_t v13 = [a3 CAMLType];
        }
        [(CAMLWriter *)self beginElement:1];
        [(CAMLWriter *)self setElementAttribute:v13 forKey:@"type"];
        [(CAMLWriter *)self setElementAttribute:v11 forKey:@"object"];
        [(CAMLWriter *)self endElement];
        goto LABEL_34;
      }
      if (a4)
      {
LABEL_34:
        CFRelease(v11);
        return;
      }
      priv->var4 = v11;
      Mutable = priv->var5;
      if (!Mutable)
      {
        Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
        priv->CFSetRef var5 = Mutable;
      }
      CFSetAddValue(Mutable, v11);
      char v14 = 0;
    }
    else
    {
      if (a4) {
        return;
      }
      unsigned int v11 = 0;
      priv->var4 = 0;
      char v14 = 1;
    }
    CFSetRef var6 = priv->var6;
    if (!var6)
    {
      CFSetRef var6 = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
      priv->CFSetRef var6 = var6;
    }
    if (!a3 || CFSetContainsValue(var6, a3))
    {
      if (v14) {
        return;
      }
      goto LABEL_34;
    }
    CFSetAddValue(priv->var6, a3);
    if ((*((unsigned char *)priv + 60) & 1) == 0
      || (uint64_t v17 = [priv->var2 CAMLWriter:self typeForObject:a3]) == 0)
    {
      uint64_t v17 = [a3 CAMLType];
    }
    [(CAMLWriter *)self beginElement:1];
    priv->var3->var4 = (void *)CFRetain(a3);
    [(CAMLWriter *)self setElementAttribute:v17 forKey:@"type"];
    [a3 encodeWithCAMLWriter:self];
    [(CAMLWriter *)self endElement];
    CFSetRemoveValue(priv->var6, a3);
    if ((v14 & 1) == 0) {
      goto LABEL_34;
    }
  }
  else
  {
    -[CAMLWriter beginElement:](self, "beginElement:", 0, a4);
    [(CAMLWriter *)self setElementAttribute:@"http://www.apple.com/CoreAnimation/1.0" forKey:@"xmlns"];
    [(CAMLWriter *)self encodeObject:a3];
    [(CAMLWriter *)self endElement];
  }
}

- (void)encodeObject:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  priv = self->_priv;
  if (priv->var2 != a3)
  {
    priv->var2 = a3;
    *((unsigned char *)self->_priv + 60) = *((unsigned char *)self->_priv + 60) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self->_priv + 60) = *((unsigned char *)self->_priv + 60) & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self->_priv + 60) = *((unsigned char *)self->_priv + 60) & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self->_priv + 60) = *((unsigned char *)self->_priv + 60) & 0xF7 | v7;
  }
}

- (CAMLWriterDelegate)delegate
{
  return (CAMLWriterDelegate *)self->_priv->var2;
}

- (BOOL)encodingForReverseSerializationTest
{
  return 0;
}

- (void)setBaseURL:(id)a3
{
  priv = self->_priv;
  var1 = priv->var1;
  if (var1 != a3)
  {
    if (var1) {
      CFRelease(var1);
    }
    priv->var1 = (__CFURL *)a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (NSURL)baseURL
{
  return (NSURL *)self->_priv->var1;
}

- (CAMLWriter)initWithData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CAMLWriter;
  v4 = [(CAMLWriter *)&v8 init];
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    char v6 = (_CAMLWriterPriv *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x40uLL, 0x743898A5uLL);
    v4->_priv = v6;
    if (v6)
    {
      v4->_priv->var0 = (__CFData *)CFRetain(a3);
      return v4;
    }

    return 0;
  }
  return v4;
}

+ (id)writerWithData:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithData:a3];

  return v3;
}

@end