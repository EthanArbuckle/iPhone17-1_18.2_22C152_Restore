@interface DBGColor
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5;
- (CGColor)CGColor;
- (DBGColor)initWithCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5;
- (NSString)catalogName;
- (NSString)colorName;
- (id)JSONCompatibleRepresentation;
- (void)dealloc;
@end

@implementation DBGColor

+ (id)withCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithCGColor:a3 colorName:v9 catalogName:v8];

  return v10;
}

- (DBGColor)initWithCGColor:(CGColor *)a3 colorName:(id)a4 catalogName:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DBGColor;
  v11 = [(DBGColor *)&v13 init];
  if (v11)
  {
    v11->_CGColor = CGColorRetain(a3);
    objc_storeStrong((id *)&v11->_colorName, a4);
    objc_storeStrong((id *)&v11->_catalogName, a5);
  }

  return v11;
}

- (void)dealloc
{
  CGColorRelease(self->_CGColor);
  v3.receiver = self;
  v3.super_class = (Class)DBGColor;
  [(DBGColor *)&v3 dealloc];
}

- (CGColor)CGColor
{
  return self->_CGColor;
}

- (NSString)colorName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)catalogName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogName, 0);

  objc_storeStrong((id *)&self->_colorName, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (([(__CFString *)v9 isEqualToString:@"color"] & 1) != 0
     || [(__CFString *)v9 isEqualToString:@"patternImageColor"]))
  {
    DBGDecodeValueFromJSONCompatibleValue();
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    v12 = v11;
    if (v11)
    {
      objc_super v13 = 0;
      if (a5) {
        *a5 = v11;
      }
    }
    else
    {
      v14 = 0;
      if (v9)
      {
        if (v10)
        {
          v14 = 0;
          if (CFEqual(v9, @"color"))
          {
            CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(v10, @"colorSpaceName");
            if (v15)
            {
              v16 = CGColorSpaceCreateWithName(v15);
              value = 0;
              if (CFDictionaryGetValueIfPresent(v10, @"componentValues", (const void **)&value))
              {
                CFIndex Count = CFArrayGetCount((CFArrayRef)value);
                v18 = (CGFloat *)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
                if (Count >= 1)
                {
                  for (CFIndex i = 0; i != Count; ++i)
                  {
                    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)value, i);
                    CGFloat valuePtr = 0.0;
                    CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
                    v18[i] = valuePtr;
                  }
                }
                v14 = CGColorCreate(v16, v18);
                free(v18);
              }
              else
              {
                v14 = 0;
              }
              CGColorSpaceRelease(v16);
            }
            else
            {
              v14 = 0;
            }
          }
        }
      }
      v21 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"colorName"];
      v22 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"catalogName"];
      objc_super v13 = [a1 withCGColor:v14 colorName:v21 catalogName:v22];
      CGColorRelease(v14);
    }
  }
  else
  {
    objc_super v13 = 0;
    if (!v8 && a5)
    {
      objc_super v13 = 0;
      *a5 = 0;
    }
  }

  return v13;
}

- (id)JSONCompatibleRepresentation
{
  if ([(DBGColor *)self CGColor])
  {
    objc_super v3 = [(DBGColor *)self CGColor];
    if (v3)
    {
      v4 = v3;
      Mutable = CFDictionaryCreateMutable(0, 20, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      ColorSpace = CGColorGetColorSpace(v4);
      CFStringRef v7 = CGColorSpaceCopyName(ColorSpace);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v4);
      uint64_t v9 = NumberOfComponents << 32;
      CFIndex v10 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        CFStringRef v27 = v7;
        id v11 = ColorSpace;
        v12 = CFStringCreateMutable(0, 0);
        CFIndex v13 = v10 - 1;
        if ((unint64_t)v10 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10;
        }
        do
        {
          CFStringAppend(v12, @"CGf");
          if (v13) {
            CFStringAppend(v12, @", ");
          }
          --v13;
          --v14;
        }
        while (v14);
        ColorSpace = v11;
        CFStringRef v7 = v27;
      }
      else
      {
        v12 = &stru_28750;
      }
      Components = CGColorGetComponents(v4);
      v17 = (const void **)malloc_type_malloc(v9 >> 29, 0x6004044C4A2DFuLL);
      if (v9 <= 0)
      {
        CFArrayRef v20 = CFArrayCreate(0, v17, v10, &kCFTypeArrayCallBacks);
      }
      else
      {
        uint64_t v18 = 0;
        if (v10 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v10;
        }
        do
        {
          v17[v18] = CFNumberCreate(0, kCFNumberCGFloatType, &Components[v18]);
          ++v18;
        }
        while (v19 != v18);
        CFArrayRef v20 = CFArrayCreate(0, v17, v10, &kCFTypeArrayCallBacks);
        v21 = v17;
        do
        {
          v22 = *v21++;
          CFRelease(v22);
          --v19;
        }
        while (v19);
      }
      free(v17);
      CGColorSpaceGetModel(ColorSpace);
      if (v20) {
        CFDictionaryAddValue(Mutable, @"componentValues", v20);
      }
      if (v12) {
        CFDictionaryAddValue(Mutable, @"componentValuesFormat", v12);
      }
      if (v7) {
        CFDictionaryAddValue(Mutable, @"colorSpaceName", v7);
      }
      if (v20) {
        CFRelease(v20);
      }
      if (v7) {
        CFRelease(v7);
      }
      if (v12) {
        CFRelease(v12);
      }
    }
    else
    {
      Mutable = 0;
    }
    CFStringRef v15 = DBGEncodeValueAsJSONCompatibleValue();
    id v23 = 0;
    v24 = v23;
    if (v23)
    {
      v25 = [v23 localizedDescription];
      NSLog(&cfstr_SError_0.isa, "-[DBGColor(JSONSerialization) JSONCompatibleRepresentation]", v25);

      CFStringRef v15 = 0;
    }
  }
  else
  {
    CFStringRef v15 = 0;
  }

  return v15;
}

@end