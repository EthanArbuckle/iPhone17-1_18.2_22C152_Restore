@interface PDFActionResetForm
- (BOOL)fieldsIncludedAreCleared;
- (NSArray)fields;
- (PDFActionResetForm)init;
- (PDFActionResetForm)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toolTip;
- (void)addFieldsToDictionaryRef:(__CFDictionary *)a3;
- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3;
- (void)commonInit;
- (void)setFields:(NSArray *)fields;
- (void)setFieldsIncludedAreCleared:(BOOL)fieldsIncludedAreCleared;
@end

@implementation PDFActionResetForm

- (PDFActionResetForm)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFActionResetForm;
  v2 = [(PDFAction *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PDFActionResetForm *)v2 commonInit];
    [(PDFAction *)v3 setType:@"ResetForm"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDFActionResetForm;
  objc_super v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionResetFormPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSArray *)self->_private2->fields copyWithZone:a3];
    uint64_t v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;

    *(unsigned char *)(v5[2] + 16) = self->_private2->included;
  }
  return v5;
}

- (NSArray)fields
{
  return self->_private2->fields;
}

- (void)setFields:(NSArray *)fields
{
  uint64_t v4 = [(NSArray *)fields copy];
  private2 = self->_private2;
  v6 = private2->fields;
  private2->fields = (NSArray *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (BOOL)fieldsIncludedAreCleared
{
  return self->_private2->included;
}

- (void)setFieldsIncludedAreCleared:(BOOL)fieldsIncludedAreCleared
{
  self->_private2->included = fieldsIncludedAreCleared;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PDFActionResetForm *)self toolTip];
  uint64_t v4 = [v2 stringWithFormat:@"ResetForm Action - %@", v3];

  return v4;
}

- (PDFActionResetForm)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)PDFActionResetForm;
  CGPDFArrayRef value = 0;
  v6 = [(PDFAction *)&v20 initWithActionDictionary:a3 forDocument:a4 forPage:a5];
  if (v6)
  {
    if (CGPDFDictionaryGetArray(a3, "Fields", &value))
    {
      CGPDFInteger v19 = 0;
      size_t Count = CGPDFArrayGetCount(value);
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
      if (Count)
      {
        for (size_t i = 0; i != Count; ++i)
        {
          CGPDFObjectRef object = 0;
          if (CGPDFArrayGetObject(value, i, &object))
          {
            uint64_t v16 = 0;
            CGPDFStringRef string = 0;
            if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, &string))
            {
              v10 = (__CFString *)CGPDFStringCopyTextString(string);
              [v8 addObject:v10];
            }
            else if (CGPDFObjectGetValue(object, kCGPDFObjectTypeDictionary, &v16))
            {
              NSLog(&cfstr_NeedToHandleRe.isa);
            }
          }
        }
      }
      uint64_t v11 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v8];
      private2 = v6->_private2;
      fields = private2->fields;
      private2->fields = (NSArray *)v11;

      if (CGPDFDictionaryGetInteger(a3, "Flags", &v19) && (v19 & 1) != 0) {
        v6->_private2->included = 0;
      }
    }
    else
    {
      v6->_private2->included = 0;
    }
    v14 = v6;
  }

  return v6;
}

- (void)commonInit
{
  v7.receiver = self;
  v7.super_class = (Class)PDFActionResetForm;
  [(PDFAction *)&v7 commonInit];
  v3 = objc_alloc_init(PDFActionResetFormPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  objc_super v5 = self->_private2;
  fields = v5->fields;
  v5->fields = 0;

  self->_private2->included = 1;
}

- (__CFDictionary)createDictionaryRef
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"/S", @"/ResetForm");
  [(PDFActionResetForm *)self addFieldsToDictionaryRef:Mutable];
  [(PDFActionResetForm *)self addFlagsToDictionaryRef:Mutable];
  return Mutable;
}

- (void)addFieldsToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFActionResetForm *)self fields];
  if (v4)
  {
    id v8 = v4;
    CFIndex v5 = [v4 count];
    uint64_t v4 = v8;
    if (v5)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, MEMORY[0x263EFFF70]);
      for (uint64_t i = 0; i != v5; ++i)
        CFArrayAppendValue(Mutable, (const void *)[v8 objectAtIndex:i]);
      CFDictionarySetValue(a3, @"/Fields", Mutable);
      uint64_t v4 = v8;
      if (Mutable)
      {
        CFRelease(Mutable);
        uint64_t v4 = v8;
      }
    }
  }
}

- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3
{
  int valuePtr = 1;
  if (![(PDFActionResetForm *)self fieldsIncludedAreCleared])
  {
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      CFNumberRef v5 = v4;
      CFDictionarySetValue(a3, @"/Flags", v4);
      CFRelease(v5);
    }
  }
}

- (id)toolTip
{
  v2 = NSString;
  v3 = PDFKitLocalizedString(@"Reset forms");
  CFNumberRef v4 = [v2 stringWithString:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end