@interface PDFAppearanceCharacteristics
- (BOOL)scaleProportional;
- (CGPDFForm)icon;
- (NSDictionary)appearanceCharacteristicsKeyValues;
- (NSInteger)rotation;
- (NSString)caption;
- (NSString)downCaption;
- (NSString)rolloverCaption;
- (PDFAppearanceCharacteristics)init;
- (PDFAppearanceCharacteristics)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forControlType:(int64_t)a4;
- (PDFWidgetControlType)controlType;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5;
- (void)dealloc;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBorderColor:(UIColor *)borderColor;
- (void)setCaption:(NSString *)caption;
- (void)setControlType:(PDFWidgetControlType)controlType;
- (void)setDownCaption:(NSString *)downCaption;
- (void)setRolloverCaption:(NSString *)rolloverCaption;
- (void)setRotation:(NSInteger)rotation;
@end

@implementation PDFAppearanceCharacteristics

- (PDFAppearanceCharacteristics)init
{
  v17.receiver = self;
  v17.super_class = (Class)PDFAppearanceCharacteristics;
  v2 = [(PDFAppearanceCharacteristics *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFAppearanceCharacteristicsPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    v5 = v2->_private;
    backgroundColor = v5->backgroundColor;
    v5->backgroundColor = 0;

    v7 = v2->_private;
    borderColor = v7->borderColor;
    v7->borderColor = 0;

    v2->_private->rotation = 0;
    v2->_private->controlType = -1;
    v9 = v2->_private;
    caption = v9->caption;
    v9->caption = 0;

    v11 = v2->_private;
    rolloverCaption = v11->rolloverCaption;
    v11->rolloverCaption = 0;

    v13 = v2->_private;
    downCaption = v13->downCaption;
    v13->downCaption = 0;

    v2->_private->icon = 0;
    v2->_private->scaleCircumstance = 0;
    v2->_private->scaleProportional = 1;
    v15 = v2;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = objc_alloc_init(PDFAppearanceCharacteristicsPrivate);
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(UIColor *)self->_private->backgroundColor copyWithZone:a3];
    uint64_t v9 = v5[1];
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;

    uint64_t v11 = [(UIColor *)self->_private->borderColor copyWithZone:a3];
    uint64_t v12 = v5[1];
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;

    *(void *)(v5[1] + 24) = self->_private->rotation;
    *(void *)(v5[1] + 32) = self->_private->controlType;
    uint64_t v14 = [(NSString *)self->_private->caption copyWithZone:a3];
    uint64_t v15 = v5[1];
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = [(NSString *)self->_private->rolloverCaption copyWithZone:a3];
    uint64_t v18 = v5[1];
    v19 = *(void **)(v18 + 48);
    *(void *)(v18 + 48) = v17;

    uint64_t v20 = [(NSString *)self->_private->downCaption copyWithZone:a3];
    uint64_t v21 = v5[1];
    v22 = *(void **)(v21 + 56);
    *(void *)(v21 + 56) = v20;

    v23 = self->_private;
    if (v23->icon)
    {
      CGPDFFormGetStream();
      *(void *)(v5[1] + 64) = CGPDFFormCreate();
      v23 = self->_private;
    }
    *(_DWORD *)(v5[1] + 72) = v23->scaleCircumstance;
    *(unsigned char *)(v5[1] + 76) = self->_private->scaleProportional;
  }
  return v5;
}

- (void)dealloc
{
  if (self->_private->icon) {
    CGPDFFormRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)PDFAppearanceCharacteristics;
  [(PDFAppearanceCharacteristics *)&v3 dealloc];
}

- (UIColor)backgroundColor
{
  return self->_private->backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  uint64_t v4 = [(UIColor *)backgroundColor copy];
  v5 = self->_private;
  v6 = v5->backgroundColor;
  v5->backgroundColor = (UIColor *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (UIColor)borderColor
{
  return self->_private->borderColor;
}

- (void)setBorderColor:(UIColor *)borderColor
{
  uint64_t v4 = [(UIColor *)borderColor copy];
  v5 = self->_private;
  v6 = v5->borderColor;
  v5->borderColor = (UIColor *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (NSInteger)rotation
{
  return self->_private->rotation;
}

- (void)setRotation:(NSInteger)rotation
{
  self->_private->rotation = rotation;
}

- (CGPDFForm)icon
{
  return self->_private->icon;
}

- (BOOL)scaleProportional
{
  return self->_private->scaleProportional;
}

- (PDFAppearanceCharacteristics)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forControlType:(int64_t)a4
{
  CGPDFArrayRef value = 0;
  CGPDFInteger v31 = 0;
  CGPDFStreamRef v28 = 0;
  CGPDFStringRef string = 0;
  __s1 = 0;
  CGPDFDictionaryRef v27 = 0;
  v6 = [(PDFAppearanceCharacteristics *)self init];
  if (v6)
  {
    if (CGPDFDictionaryGetArray(a3, "BG", &value))
    {
      uint64_t v7 = PDFColorCreateFromCGPDFArray(value);
      uint64_t v8 = v6->_private;
      backgroundColor = v8->backgroundColor;
      v8->backgroundColor = (UIColor *)v7;
    }
    if (CGPDFDictionaryGetArray(a3, "BC", &value))
    {
      uint64_t v10 = PDFColorCreateFromCGPDFArray(value);
      uint64_t v11 = v6->_private;
      borderColor = v11->borderColor;
      v11->borderColor = (UIColor *)v10;
    }
    if (CGPDFDictionaryGetInteger(a3, "R", &v31)) {
      v6->_private->rotation = v31;
    }
    v6->_private->controlType = a4;
    if (v6->_private->controlType <= 2uLL && CGPDFDictionaryGetString(a3, "CA", &string))
    {
      CFStringRef v13 = CGPDFStringCopyTextString(string);
      uint64_t v14 = v6->_private;
      caption = v14->caption;
      v14->caption = &v13->isa;
    }
    if (!v6->_private->controlType && CGPDFDictionaryGetString(a3, "RC", &string))
    {
      CFStringRef v16 = CGPDFStringCopyTextString(string);
      uint64_t v17 = v6->_private;
      rolloverCaption = v17->rolloverCaption;
      v17->rolloverCaption = &v16->isa;
    }
    if (!v6->_private->controlType && CGPDFDictionaryGetString(a3, "AC", &string))
    {
      CFStringRef v19 = CGPDFStringCopyTextString(string);
      uint64_t v20 = v6->_private;
      downCaption = v20->downCaption;
      v20->downCaption = &v19->isa;
    }
    if (!v6->_private->controlType && CGPDFDictionaryGetStream(a3, "I", &v28)) {
      v6->_private->icon = (CGPDFForm *)CGPDFFormCreate();
    }
    if (v6->_private->controlType || !CGPDFDictionaryGetDictionary(a3, "IF", &v27)) {
      goto LABEL_33;
    }
    if (CGPDFDictionaryGetName(a3, "SW", (const char **)&__s1))
    {
      v22 = __s1;
      if (!strcmp(__s1, "B"))
      {
        int v23 = 1;
        goto LABEL_29;
      }
      if (!strcmp(v22, "S"))
      {
        int v23 = 2;
        goto LABEL_29;
      }
      if (!strcmp(v22, "N"))
      {
        int v23 = 3;
LABEL_29:
        v6->_private->scaleCircumstance = v23;
      }
    }
    if (CGPDFDictionaryGetName(a3, "S", (const char **)&__s1) && !strcmp(__s1, "A")) {
      v6->_private->scaleProportional = 0;
    }
LABEL_33:
    v24 = v6;
  }

  return v6;
}

- (__CFDictionary)createDictionaryRef
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    int valuePtr = self->_private->rotation;
    if (valuePtr)
    {
      CFNumberRef v5 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
      if (v5)
      {
        CFNumberRef v6 = v5;
        CFDictionarySetValue(Mutable, @"/R", v5);
        CFRelease(v6);
      }
    }
    uint64_t v7 = [(PDFAppearanceCharacteristics *)self borderColor];
    [(PDFAppearanceCharacteristics *)self addColor:v7 forKey:@"/BC" toDictionaryRef:Mutable];

    [(PDFAppearanceCharacteristics *)self addColor:self->_private->backgroundColor forKey:@"/BG" toDictionaryRef:Mutable];
    uint64_t v8 = self->_private;
    if (v8->controlType > 2uLL)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = v8->caption;
      if (v9) {
        CFDictionarySetValue(Mutable, @"/CA", v9);
      }
    }
    uint64_t v10 = self->_private;
    if (!v10->controlType)
    {
      uint64_t v11 = v10->rolloverCaption;

      if (v11) {
        CFDictionarySetValue(Mutable, @"/RC", v11);
      }
      uint64_t v9 = self->_private->downCaption;

      if (v9) {
        CFDictionarySetValue(Mutable, @"/AC", v9);
      }
    }
  }
  return Mutable;
}

- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  if (!a3) {
    return;
  }
  uint64_t v7 = (CGColor *)[a3 CGColor];
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v7);
  Components = CGColorGetComponents(v7);
  uint64_t v10 = (double *)Components;
  if (NumberOfComponents == 5)
  {
    id v11 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v12 = [NSNumber numberWithDouble:*v10];
    CFStringRef v13 = [NSNumber numberWithDouble:v10[1]];
    uint64_t v14 = [NSNumber numberWithDouble:v10[2]];
    uint64_t v15 = [NSNumber numberWithDouble:v10[3]];
    id value = (id)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

LABEL_10:
LABEL_13:
    CFDictionarySetValue(a5, a4, value);
    goto LABEL_14;
  }
  if (NumberOfComponents == 4)
  {
    id v16 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v12 = [NSNumber numberWithDouble:*v10];
    CFStringRef v13 = [NSNumber numberWithDouble:v10[1]];
    uint64_t v17 = [NSNumber numberWithDouble:v10[2]];
    id value = (id)objc_msgSend(v16, "initWithObjects:", v12, v13, v17, 0);

    goto LABEL_10;
  }
  if (NumberOfComponents != 2)
  {
    id value = 0;
    CFDictionarySetValue(a5, a4, 0);
    goto LABEL_14;
  }
  if (Components[1] != 0.0)
  {
    id v18 = objc_alloc(MEMORY[0x263EFF8C0]);
    CFStringRef v19 = [NSNumber numberWithDouble:*v10];
    id value = (id)objc_msgSend(v18, "initWithObjects:", v19, 0);

    goto LABEL_13;
  }
  id value = objc_alloc_init(MEMORY[0x263EFF8C0]);
  CFDictionarySetValue(a5, a4, value);
LABEL_14:
}

- (PDFWidgetControlType)controlType
{
  return self->_private->controlType;
}

- (void)setControlType:(PDFWidgetControlType)controlType
{
  self->_private->controlType = controlType;
}

- (NSString)caption
{
  return self->_private->caption;
}

- (void)setCaption:(NSString *)caption
{
  uint64_t v4 = [(NSString *)caption copy];
  CFNumberRef v5 = self->_private;
  CFNumberRef v6 = v5->caption;
  v5->caption = (NSString *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (NSString)rolloverCaption
{
  return self->_private->rolloverCaption;
}

- (void)setRolloverCaption:(NSString *)rolloverCaption
{
  uint64_t v4 = [(NSString *)rolloverCaption copy];
  CFNumberRef v5 = self->_private;
  CFNumberRef v6 = v5->rolloverCaption;
  v5->rolloverCaption = (NSString *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (NSString)downCaption
{
  return self->_private->downCaption;
}

- (void)setDownCaption:(NSString *)downCaption
{
  uint64_t v4 = [(NSString *)downCaption copy];
  CFNumberRef v5 = self->_private;
  CFNumberRef v6 = v5->downCaption;
  v5->downCaption = (NSString *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (NSDictionary)appearanceCharacteristicsKeyValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [NSNumber numberWithInteger:self->_private->rotation];
  [v3 setValue:v4 forKey:@"R"];

  CFNumberRef v5 = self->_private;
  backgroundColor = v5->backgroundColor;
  if (backgroundColor)
  {
    uint64_t v7 = (void *)[(UIColor *)backgroundColor copyWithZone:0];
    [v3 setValue:v7 forKey:@"BG"];

    CFNumberRef v5 = self->_private;
  }
  borderColor = v5->borderColor;
  if (borderColor)
  {
    uint64_t v9 = (void *)[(UIColor *)borderColor copyWithZone:0];
    [v3 setValue:v9 forKey:@"BC"];

    CFNumberRef v5 = self->_private;
  }
  caption = v5->caption;
  if (caption)
  {
    id v11 = (void *)[(NSString *)caption copyWithZone:0];
    [v3 setValue:v11 forKey:@"CA"];

    CFNumberRef v5 = self->_private;
  }
  rolloverCaption = v5->rolloverCaption;
  if (rolloverCaption)
  {
    CFStringRef v13 = (void *)[(NSString *)rolloverCaption copyWithZone:0];
    [v3 setValue:v13 forKey:@"RC"];

    CFNumberRef v5 = self->_private;
  }
  downCaption = v5->downCaption;
  if (downCaption)
  {
    uint64_t v15 = (void *)[(NSString *)downCaption copyWithZone:0];
    [v3 setValue:v15 forKey:@"AC"];
  }

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
}

@end