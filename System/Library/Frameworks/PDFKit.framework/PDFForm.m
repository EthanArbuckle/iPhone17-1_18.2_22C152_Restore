@interface PDFForm
- (CGPDFString)defaultDAStringRef;
- (PDFForm)init;
- (PDFForm)initWithDocument:(id)a3;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultStringValueForFieldNamed:(id)a3;
- (id)description;
- (id)document;
- (id)fieldNamed:(id)a3;
- (id)fieldNames;
- (id)stringValueForFieldNamed:(id)a3;
- (void)_commonResetForm:(id)a3 inclusive:(BOOL)a4;
- (void)addFormField:(id)a3;
- (void)addNeedsAppearanceToDictionaryRef:(__CFDictionary *)a3;
- (void)dealloc;
- (void)removeFormFieldWithFieldName:(id)a3;
- (void)resetFormExcludingFields:(id)a3;
- (void)resetFormForFields:(id)a3;
- (void)setDocument:(id)a3;
- (void)setStringValue:(id)a3 forFieldNamed:(id)a4 postFormChangeNotification:(BOOL)a5;
@end

@implementation PDFForm

- (PDFForm)init
{
  v9.receiver = self;
  v9.super_class = (Class)PDFForm;
  v2 = [(PDFForm *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(PDFFormPrivateVars);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->document, 0);
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    v6 = v2->_private;
    fieldArray = v6->fieldArray;
    v6->fieldArray = (NSMutableArray *)v5;

    v2->_private->appearString = 0;
  }
  return v2;
}

- (PDFForm)initWithDocument:(id)a3
{
  id v4 = a3;
  CGPDFArrayRef array = 0;
  CGPDFDictionaryRef value = 0;
  v23.receiver = self;
  v23.super_class = (Class)PDFForm;
  uint64_t v5 = [(PDFForm *)&v23 init];
  if (!v5) {
    goto LABEL_18;
  }
  v6 = objc_alloc_init(PDFFormPrivateVars);
  v7 = v5->_private;
  v5->_private = v6;

  objc_storeWeak((id *)&v5->_private->document, v4);
  uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  objc_super v9 = v5->_private;
  fieldArray = v9->fieldArray;
  v9->fieldArray = (NSMutableArray *)v8;

  v5->_private->appearString = 0;
  v11 = (CGPDFDocument *)[v4 documentRef];
  if (!v11) {
    goto LABEL_18;
  }
  Catalog = CGPDFDocumentGetCatalog(v11);
  if (Catalog
    && CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    && CGPDFDictionaryGetArray(value, "Fields", &array)
    && CGPDFArrayGetCount(array))
  {
    size_t Count = CGPDFArrayGetCount(array);
    if (Count)
    {
      size_t v14 = Count;
      for (size_t i = 0; i != v14; ++i)
      {
        CGPDFObjectRef object = 0;
        if (CGPDFArrayGetObject(array, i, &object))
        {
          uint64_t v21 = 0;
          if (CGPDFObjectGetValue(object, kCGPDFObjectTypeDictionary, &v21))
          {
            v16 = [PDFFormField alloc];
            v17 = [(PDFFormField *)v16 initWithFormDictionary:v21];
            v18 = v17;
            if (v17)
            {
              [(PDFFormField *)v17 setDocument:v4];
              [(NSMutableArray *)v5->_private->fieldArray addObject:v18];
            }
          }
        }
      }
    }
    if (CGPDFDictionaryGetString(value, "DA", &v5->_private->appearString)) {
      CGPDFStringRetain();
    }
    v19 = v5;
  }
  else
  {
LABEL_18:
    v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = objc_alloc_init(PDFFormPrivateVars);
  v7 = (void *)v5[1];
  v5[1] = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  objc_storeWeak((id *)(v5[1] + 8), WeakRetained);

  uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  uint64_t v10 = v5[1];
  v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;

  *(void *)(v5[1] + 24) = CGPDFStringRetain();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_private->fieldArray;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [*(id *)(v5[1] + 16) addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v5;
}

- (void)dealloc
{
  CGPDFStringRelease();
  v3.receiver = self;
  v3.super_class = (Class)PDFForm;
  [(PDFForm *)&v3 dealloc];
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return WeakRetained;
}

- (id)fieldNames
{
  fieldArray = self->_private->fieldArray;
  if (fieldArray && [(NSMutableArray *)fieldArray count])
  {
    uint64_t v4 = [(NSMutableArray *)self->_private->fieldArray count];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        v7 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:i];
        uint64_t v8 = [v7 fieldName];

        if (v8) {
          [v5 addObject:v8];
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setStringValue:(id)a3 forFieldNamed:(id)a4 postFormChangeNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  uint64_t v8 = [(PDFForm *)self fieldNamed:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setStringValue:v15];
    if (v5)
    {
      uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
      v11 = [(PDFForm *)self document];
      v12 = NSDictionary;
      uint64_t v13 = [v9 fieldName];
      uint64_t v14 = [v12 dictionaryWithObject:v13 forKey:@"PDFFormFieldName"];
      [v10 postNotificationName:@"PDFFormDidChangeValue" object:v11 userInfo:v14];
    }
  }
}

- (id)stringValueForFieldNamed:(id)a3
{
  objc_super v3 = [(PDFForm *)self fieldNamed:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 stringValue];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)defaultStringValueForFieldNamed:(id)a3
{
  objc_super v3 = [(PDFForm *)self fieldNamed:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 defaultStringValue];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGPDFString)defaultDAStringRef
{
  return self->_private->appearString;
}

- (void)addFormField:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 fieldName];
  BOOL v5 = [(PDFForm *)self fieldNamed:v4];

  if (!v5)
  {
    v6 = [(PDFForm *)self document];
    [v7 setDocument:v6];

    [(NSMutableArray *)self->_private->fieldArray addObject:v7];
  }
}

- (void)removeFormFieldWithFieldName:(id)a3
{
  uint64_t v4 = [(PDFForm *)self fieldNamed:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(NSMutableArray *)self->_private->fieldArray removeObject:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)resetFormForFields:(id)a3
{
}

- (void)resetFormExcludingFields:(id)a3
{
}

- (id)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"fields: ["];
  uint64_t v4 = [(NSMutableArray *)self->_private->fieldArray count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:i];
      uint64_t v8 = [v7 description];
      [v3 appendString:v8];
    }
  }
  [v3 appendString:@"]"];

  return v3;
}

- (void)_commonResetForm:(id)a3 inclusive:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  id v21 = v6;
  if (v6) {
    uint64_t v7 = [v6 count];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_private->fieldArray count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:i];
      v12 = [v11 fieldName];
      if (v7)
      {
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = [v21 objectAtIndex:v13];
          int v15 = [v14 isEqualToString:v12];

          if (v15) {
            break;
          }
          if (v7 == ++v13) {
            goto LABEL_10;
          }
        }
        int v16 = 1;
      }
      else
      {
LABEL_10:
        int v16 = 0;
      }
      if (v16 == v4)
      {
        v17 = [v11 defaultStringValue];
        [v11 setStringValue:v17];

        v18 = [MEMORY[0x263F08A00] defaultCenter];
        long long v19 = [(PDFForm *)self document];
        long long v20 = [NSDictionary dictionaryWithObject:v12 forKey:@"PDFFormFieldName"];
        [v18 postNotificationName:@"PDFFormDidChangeValue" object:v19 userInfo:v20];
      }
    }
  }
}

- (id)fieldNamed:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    NSLog(&cfstr_TempFieldnamed.isa);
    goto LABEL_8;
  }
  uint64_t v5 = [(NSMutableArray *)self->_private->fieldArray count];
  if (!v5)
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:v7];
    uint64_t v9 = [v8 fieldName];
    char v10 = [v9 isEqualToString:v4];

    if (v10) {
      break;
    }

    if (v6 == ++v7) {
      goto LABEL_8;
    }
  }
LABEL_9:

  return v8;
}

- (void)addNeedsAppearanceToDictionaryRef:(__CFDictionary *)a3
{
}

- (__CFDictionary)createDictionaryRef
{
  uint64_t v3 = [(NSMutableArray *)self->_private->fieldArray count];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable) {
    return 0;
  }
  uint64_t v7 = Mutable;
  for (uint64_t i = 0; i != v4; ++i)
  {
    uint64_t v9 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:i];
    [v9 clearDictionaryRef];

    char v10 = [(NSMutableArray *)self->_private->fieldArray objectAtIndex:i];
    v11 = (const void *)[v10 dictionaryRef];

    if (v11) {
      CFArrayAppendValue(v7, v11);
    }
  }
  v12 = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v12, @"/Fields", v7);
  [(PDFForm *)self addNeedsAppearanceToDictionaryRef:v12];
  CFRelease(v7);
  return v12;
}

- (void)setDocument:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_private->document, v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFAllocatorRef v5 = self->_private->fieldArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDocument:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end