@interface PDFFormField
- (BOOL)_isRedacted;
- (BOOL)writeDefaultValue;
- (PDFFormField)initWithAnnotation:(id)a3;
- (PDFFormField)initWithFormDictionary:(CGPDFDictionary *)a3;
- (__CFDictionary)createDictionaryRef;
- (__CFDictionary)dictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultStringValue;
- (id)description;
- (id)document;
- (id)fieldName;
- (id)stringValue;
- (int)fieldType;
- (int64_t)buttonType;
- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3;
- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3;
- (void)addNameDefaultValueToDictionaryRef:(__CFDictionary *)a3;
- (void)addNameValueToDictionaryRef:(__CFDictionary *)a3;
- (void)addStringDefaultValueToDictionaryRef:(__CFDictionary *)a3;
- (void)addStringValueToDictionaryRef:(__CFDictionary *)a3;
- (void)clearDictionaryRef;
- (void)commonCreateDictionaryRef:(__CFDictionary *)a3;
- (void)commonInit;
- (void)dealloc;
- (void)setButtonType:(int64_t)a3;
- (void)setDefaultStringValue:(id)a3;
- (void)setDocument:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setFieldType:(int)a3;
- (void)setStringValue:(id)a3;
- (void)setWriteDefaultValue:(BOOL)a3;
@end

@implementation PDFFormField

- (PDFFormField)initWithAnnotation:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PDFFormField;
  v5 = [(PDFFormField *)&v30 init];
  v6 = v5;
  if (v5)
  {
    [(PDFFormField *)v5 commonInit];
    v7 = [v4 page];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 document];
      if (v9) {
        [(PDFFormField *)v6 setDocument:v9];
      }
    }
    v10 = [v4 valueForAnnotationKey:@"/Subtype"];
    if (![v10 isEqualToString:@"/Widget"])
    {
      v11 = v6;
      v6 = 0;
LABEL_26:

      v6 = v6;
      goto LABEL_27;
    }
    v11 = [v4 valueForAnnotationKey:@"/FT"];
    if ([v11 isEqualToString:@"/Btn"])
    {
      int v12 = 0;
    }
    else if ([v11 isEqualToString:@"/Tx"])
    {
      int v12 = 1;
    }
    else
    {
      if (![v11 isEqualToString:@"/Ch"])
      {
LABEL_15:
        if ([v11 isEqualToString:@"/Btn"]) {
          v6->_private->buttonType = [v4 widgetControlType];
        }
        v13 = [v4 fieldName];
        uint64_t v14 = [v13 copy];
        v15 = v6->_private;
        fieldName = v15->fieldName;
        v15->fieldName = (NSString *)v14;

        if ([v11 isEqualToString:@"/Btn"]
          && [v4 buttonWidgetState] == 1)
        {
          v17 = [v4 widgetOnStateString];
          uint64_t v18 = [v17 copy];
          v19 = v6->_private;
          stringValue = v19->stringValue;
          v19->stringValue = (NSString *)v18;
        }
        else if (([v11 isEqualToString:@"/Tx"] & 1) != 0 {
               || [v11 isEqualToString:@"/Ch"])
        }
        {
          v21 = [v4 widgetStringValue];
          uint64_t v22 = [v21 copy];
          v23 = v6->_private;
          v24 = v23->stringValue;
          v23->stringValue = (NSString *)v22;
        }
        if (([v11 isEqualToString:@"/Tx"] & 1) != 0
          || [v11 isEqualToString:@"/Ch"])
        {
          v25 = [v4 widgetDefaultStringValue];
          uint64_t v26 = [v25 copy];
          v27 = v6->_private;
          defaultStringValue = v27->defaultStringValue;
          v27->defaultStringValue = (NSString *)v26;
        }
        goto LABEL_26;
      }
      int v12 = 2;
    }
    v6->_private->fieldType = v12;
    goto LABEL_15;
  }
LABEL_27:

  return v6;
}

- (PDFFormField)initWithFormDictionary:(CGPDFDictionary *)a3
{
  long long v39 = 0u;
  long long v40 = 0u;
  CGPDFInteger value = 0;
  CGPDFStringRef string = 0;
  v35.receiver = self;
  v35.super_class = (Class)PDFFormField;
  v36 = 0;
  id v4 = [(PDFFormField *)&v35 init];
  v5 = v4;
  if (v4)
  {
    [(PDFFormField *)v4 commonInit];
    if (CGPDFDictionaryGetInteger(a3, "Ff", &value)) {
      int v6 = value;
    }
    else {
      int v6 = 0;
    }
    if (CGPDFDictionaryGetRect())
    {
      v7 = v5->_private;
      v7->bounds.origin.x = PDFRectFromCGRect(*(double *)&v39, *((double *)&v39 + 1), *(double *)&v40, *((double *)&v40 + 1));
      v7->bounds.origin.y = v8;
      v7->bounds.size.width = v9;
      v7->bounds.size.height = v10;
    }
    if (!CGPDFDictionaryGetName(a3, "FT", (const char **)&v36))
    {
LABEL_23:
      if (!CGPDFDictionaryGetString(a3, "T", &string))
      {
        NSLog(&cfstr_PdfformfieldHa.isa);
        goto LABEL_37;
      }
      CFStringRef v18 = CGPDFStringCopyTextString(string);
      v19 = v5->_private;
      fieldName = v19->fieldName;
      v19->fieldName = &v18->isa;

      if (!CGPDFDictionaryGetName(a3, "V", (const char **)&v36))
      {
        if (CGPDFDictionaryGetString(a3, "V", &string))
        {
          CFStringRef v21 = CGPDFStringCopyTextString(string);
LABEL_30:
          v23 = v5->_private;
          stringValue = v23->stringValue;
          v23->stringValue = &v21->isa;

          goto LABEL_31;
        }
        if (!CGPDFDictionaryGetName(a3, "AS", (const char **)&v36))
        {
LABEL_31:
          if (CGPDFDictionaryGetString(a3, "DV", &string))
          {
            CFStringRef v25 = CGPDFStringCopyTextString(string);
            uint64_t v26 = v5->_private;
            defaultStringValue = v26->defaultStringValue;
            v26->defaultStringValue = &v25->isa;
            char v28 = 1;
          }
          else
          {
            v29 = v5->_private;
            objc_super v30 = v29->stringValue;
            if (!v30 || !v29->fieldType) {
              goto LABEL_37;
            }
            uint64_t v31 = [(NSString *)v30 copy];
            char v28 = 0;
            v32 = v5->_private;
            defaultStringValue = v32->defaultStringValue;
            v32->defaultStringValue = (NSString *)v31;
          }

          v5->_private->writeDefaultValue = v28;
LABEL_37:
          v33 = v5;
          goto LABEL_38;
        }
      }
      id v22 = [NSString alloc];
      CFStringRef v21 = (CFStringRef)[v22 initWithCString:v36 encoding:1];
      goto LABEL_30;
    }
    id v11 = [NSString alloc];
    int v12 = (void *)[v11 initWithUTF8String:v36];
    v13 = +[PDFAnnotation getProperNameStringFromString:v12];

    if (![v13 isEqualToString:@"/Btn"])
    {
      if ([v13 isEqualToString:@"/Tx"])
      {
        v16 = v5->_private;
        int v17 = 1;
      }
      else if ([v13 isEqualToString:@"/Ch"])
      {
        v16 = v5->_private;
        int v17 = 2;
      }
      else
      {
        if (![v13 isEqualToString:@"/Sig"]) {
          goto LABEL_22;
        }
        v16 = v5->_private;
        int v17 = 3;
      }
      v16->fieldType = v17;
      goto LABEL_22;
    }
    v5->_private->fieldType = 0;
    if ((v6 & 0x8000) != 0)
    {
      uint64_t v14 = v5->_private;
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v14 = v5->_private;
      if ((v6 & 0x10000) != 0)
      {
        v14->buttonType = 0;
        goto LABEL_22;
      }
      uint64_t v15 = 2;
    }
    v14->buttonType = v15;
LABEL_22:

    goto LABEL_23;
  }
LABEL_38:

  return v5;
}

- (void)commonInit
{
  v3 = objc_alloc_init(PDFFormFieldPrivateVars);
  id v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  v5 = self->_private;
  CGSize v6 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v5->bounds.origin = (CGPoint)*MEMORY[0x263F001A8];
  v5->bounds.size = v6;
  self->_private->fieldType = -1;
  self->_private->buttonType = -1;
  v7 = self->_private;
  fieldName = v7->fieldName;
  v7->fieldName = 0;

  CGFloat v9 = self->_private;
  stringValue = v9->stringValue;
  v9->stringValue = 0;

  id v11 = self->_private;
  defaultStringValue = v11->defaultStringValue;
  v11->defaultStringValue = 0;

  self->_private->writeDefaultValue = 0;
  self->_private->dictionary = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 commonInit];
    CGSize v6 = [(PDFFormField *)self document];
    [v5 setDocument:v6];

    objc_msgSend(v5, "setFieldType:", -[PDFFormField fieldType](self, "fieldType"));
    objc_msgSend(v5, "setButtonType:", -[PDFFormField buttonType](self, "buttonType"));
    v7 = [(PDFFormField *)self fieldName];
    [v5 setFieldName:v7];

    CGFloat v8 = [(PDFFormField *)self stringValue];
    [v5 setStringValue:v8];

    CGFloat v9 = [(PDFFormField *)self defaultStringValue];
    [v5 setDefaultStringValue:v9];

    objc_msgSend(v5, "setWriteDefaultValue:", -[PDFFormField writeDefaultValue](self, "writeDefaultValue"));
    id v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(PDFFormField *)self clearDictionaryRef];
  v3.receiver = self;
  v3.super_class = (Class)PDFFormField;
  [(PDFFormField *)&v3 dealloc];
}

- (void)clearDictionaryRef
{
  objc_super v3 = self->_private;
  CFDictionaryRef dictionary = v3->dictionary;
  if (dictionary)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(dictionary, @"/Kids");
    if (Value)
    {
      CFArrayRef v6 = Value;
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v6, i);
          if (ValueAtIndex) {
            CFDictionaryRemoveValue(ValueAtIndex, @"/Parent");
          }
        }
      }
    }
    CFRelease(self->_private->dictionary);
    objc_super v3 = self->_private;
  }
  v3->CFDictionaryRef dictionary = 0;
}

- (__CFDictionary)dictionaryRef
{
  if ([(PDFFormField *)self _isRedacted]) {
    return 0;
  }
  result = self->_private->dictionary;
  if (!result)
  {
    self->_private->CFDictionaryRef dictionary = [(PDFFormField *)self createDictionaryRef];
    return self->_private->dictionary;
  }
  return result;
}

- (void)commonCreateDictionaryRef:(__CFDictionary *)a3
{
  v5 = self->_private;
  unsigned int fieldType = v5->fieldType;
  if (fieldType)
  {
    if (fieldType <= 2) {
      [(PDFFormField *)self addStringValueToDictionaryRef:a3];
    }
  }
  else if (v5->buttonType)
  {
    [(PDFFormField *)self addNameValueToDictionaryRef:a3];
  }
  v7 = self->_private;
  if (v7->writeDefaultValue)
  {
    unsigned int v8 = v7->fieldType;
    if (v8)
    {
      if (v8 <= 2)
      {
        [(PDFFormField *)self addStringDefaultValueToDictionaryRef:a3];
      }
    }
    else if (v7->buttonType)
    {
      [(PDFFormField *)self addNameDefaultValueToDictionaryRef:a3];
    }
  }
}

- (__CFDictionary)createDictionaryRef
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = [(PDFFormField *)self document];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableDictionaryRef cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    theArray = CFArrayCreateMutable(v3, 0, MEMORY[0x263EFFF70]);
    uint64_t v34 = [v2 pageCount];
    if (v34)
    {
      uint64_t v4 = 0;
      v36 = v2;
      do
      {
        uint64_t v35 = v4;
        v5 = objc_msgSend(v2, "pageAtIndex:");
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v38 = v5;
        obCFIndex j = [v5 annotations];
        uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v43 != v8) {
                objc_enumerationMutation(obj);
              }
              id v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              id v11 = [v10 valueForAnnotationKey:@"/Subtype"];
              int v12 = [v10 valueForAnnotationKey:@"/FT"];
              if ([v11 isEqualToString:@"/Widget"])
              {
                if ([v12 isEqualToString:@"/Btn"])
                {
                  v13 = [v10 fieldName];
                  uint64_t v14 = [(PDFFormField *)self fieldName];
                  int v15 = [v13 isEqualToString:v14];

                  if (v15) {
                    goto LABEL_16;
                  }
                }
                if ([v12 isEqualToString:@"/Ch"])
                {
                  v16 = [v10 fieldName];
                  int v17 = [(PDFFormField *)self fieldName];
                  int v18 = [v16 isEqualToString:v17];

                  if (v18) {
                    goto LABEL_16;
                  }
                }
                if ([v12 isEqualToString:@"/Tx"])
                {
                  v19 = [v10 fieldName];
                  v20 = [(PDFFormField *)self fieldName];
                  int v21 = [v19 isEqualToString:v20];

                  if (v21)
                  {
LABEL_16:
                    id v22 = (const void *)[v10 dictionaryRef];
                    if (!v22)
                    {

                      v2 = v36;
                      ValueAtIndex = cf;
                      v23 = theArray;
                      goto LABEL_25;
                    }
                    CFArrayAppendValue(theArray, v22);
                  }
                }
              }
            }
            uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }

        uint64_t v4 = v35 + 1;
        v2 = v36;
      }
      while (v35 + 1 != v34);
    }
    v23 = theArray;
    if (CFArrayGetCount(theArray))
    {
      ValueAtIndex = cf;
      if (CFArrayGetCount(theArray) == 1)
      {
        CFRelease(cf);
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
        [(PDFFormField *)self commonCreateDictionaryRef:ValueAtIndex];
        CFRetain(ValueAtIndex);
      }
      else if (CFArrayGetCount(theArray) >= 2)
      {
        [(PDFFormField *)self addFieldTypeToDictionaryRef:cf];
        [(PDFFormField *)self addFieldNameToDictionaryRef:cf];
        [(PDFFormField *)self commonCreateDictionaryRef:cf];
        CFIndex Count = CFArrayGetCount(theArray);
        if (Count >= 1)
        {
          CFIndex v27 = Count;
          for (CFIndex j = 0; j != v27; ++j)
          {
            v29 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v29, @"/FT");
            objc_super v30 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v30, @"/T");
            uint64_t v31 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v31, @"/V");
            v32 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v32, @"/DV");
            v33 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionarySetValue(v33, @"/Parent", cf);
          }
        }
        CFDictionarySetValue(cf, @"/Kids", theArray);
      }
    }
    else
    {
      CFRelease(cf);
      NSLog(&cfstr_PdfformfieldWi.isa);
      ValueAtIndex = 0;
    }
LABEL_25:
    if (v23) {
      CFRelease(v23);
    }
  }
  else
  {
    ValueAtIndex = 0;
  }

  return (__CFDictionary *)ValueAtIndex;
}

- (void)setDocument:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_private->document, v4);
  v5 = self->_private;
  if (!v5->stringValue)
  {
    id v27 = v4;
    [v4 annotationsForFieldName:v5->fieldName];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obCFIndex j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      CGFloat v9 = @"/Subtype";
      v29 = &stru_26C516768;
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          int v12 = self->_private;
          [v11 bounds];
          v37.origin.x = v13;
          v37.origin.y = v14;
          v37.size.width = v15;
          v37.size.height = v16;
          if (PDFRectEqualToRect(v12->bounds, v37))
          {
            int v17 = [v11 valueForAnnotationKey:v9];
            if ([v17 isEqualToString:@"/Widget"])
            {
              int v18 = v9;
              v19 = [v11 valueForAnnotationKey:@"/FT"];
              v20 = [v11 valueForAnnotationKey:@"/V"];
              if ([v19 isEqualToString:@"/Btn"])
              {
                int v21 = [v11 widgetOnStateString];
                if (v20 && [v20 isEqualToString:v21])
                {
                  uint64_t v28 = [v20 copy];

                  v29 = (__CFString *)v28;
                }
LABEL_17:
              }
              else if ((([v19 isEqualToString:@"/Tx"] & 1) != 0 {
                      || [v19 isEqualToString:@"/Ch"])
              }
                     && v20)
              {
                int v21 = v29;
                v29 = (__CFString *)[v20 copy];
                goto LABEL_17;
              }

              CGFloat v9 = v18;
            }

            continue;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (!v7) {
          goto LABEL_24;
        }
      }
    }
    v29 = &stru_26C516768;
LABEL_24:
    objc_storeStrong((id *)&self->_private->stringValue, v29);
    id v22 = self->_private;
    stringCFArrayRef Value = v22->stringValue;
    if (stringValue && !v22->defaultStringValue && v22->fieldType)
    {
      uint64_t v24 = [(NSString *)stringValue copy];
      CFStringRef v25 = self->_private;
      defaultStringCFArrayRef Value = v25->defaultStringValue;
      v25->defaultStringCFArrayRef Value = (NSString *)v24;

      self->_private->writeDefaultCFArrayRef Value = 0;
    }

    id v4 = v27;
  }
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return WeakRetained;
}

- (void)setFieldType:(int)a3
{
  self->_private->unsigned int fieldType = a3;
}

- (int)fieldType
{
  return self->_private->fieldType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_private->buttonType = a3;
}

- (int64_t)buttonType
{
  return self->_private->buttonType;
}

- (void)setFieldName:(id)a3
{
  v5 = (NSString *)a3;
  uint64_t v6 = self->_private;
  fieldName = v6->fieldName;
  p_fieldName = (id *)&v6->fieldName;
  if (fieldName != v5)
  {
    CGFloat v9 = v5;
    objc_storeStrong(p_fieldName, a3);
    v5 = v9;
  }

  MEMORY[0x270F9A758](p_fieldName, v5);
}

- (id)fieldName
{
  return self->_private->fieldName;
}

- (void)setStringValue:(id)a3
{
  v5 = (NSString *)a3;
  uint64_t v6 = self->_private;
  stringCFArrayRef Value = v6->stringValue;
  p_stringCFArrayRef Value = (id *)&v6->stringValue;
  if (stringValue != v5)
  {
    CGFloat v9 = v5;
    objc_storeStrong(p_stringValue, a3);
    v5 = v9;
  }

  MEMORY[0x270F9A758](p_stringValue, v5);
}

- (id)stringValue
{
  return self->_private->stringValue;
}

- (void)setDefaultStringValue:(id)a3
{
  v5 = (NSString *)a3;
  uint64_t v6 = self->_private;
  defaultStringCFArrayRef Value = v6->defaultStringValue;
  p_defaultStringCFArrayRef Value = (id *)&v6->defaultStringValue;
  if (defaultStringValue != v5)
  {
    CGFloat v9 = v5;
    objc_storeStrong(p_defaultStringValue, a3);
    v5 = v9;
  }

  MEMORY[0x270F9A758](p_defaultStringValue, v5);
}

- (id)defaultStringValue
{
  return self->_private->defaultStringValue;
}

- (void)setWriteDefaultValue:(BOOL)a3
{
  self->_private->writeDefaultCFArrayRef Value = a3;
}

- (BOOL)writeDefaultValue
{
  return self->_private->writeDefaultValue;
}

- (id)description
{
  CFAllocatorRef v3 = NSString;
  id v4 = [(PDFFormField *)self fieldName];
  v5 = [(PDFFormField *)self stringValue];
  uint64_t v6 = [(PDFFormField *)self defaultStringValue];
  uint64_t v7 = [v3 stringWithFormat:@"Field \"%@\" = \"%@\" (\"%@\"", v4, v5, v6];

  return v7;
}

- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t fieldType = self->_private->fieldType;
  if (fieldType <= 3) {
    CFDictionarySetValue(a3, @"/FT", off_2642042D8[fieldType]);
  }
}

- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  id v4 = [(PDFFormField *)self fieldName];
  if (v4) {
    CFDictionarySetValue(a3, @"/T", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addNameValueToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFFormField *)self stringValue];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    CFDictionarySetValue(a3, @"/V", (const void *)[NSString stringWithFormat:@"/%@", v4]);
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)addStringValueToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFFormField *)self stringValue];
  if (v4) {
    CFDictionarySetValue(a3, @"/V", v4);
  }

  MEMORY[0x270F9A790]();
}

- (void)addNameDefaultValueToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFFormField *)self defaultStringValue];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    CFDictionarySetValue(a3, @"/DV", (const void *)[NSString stringWithFormat:@"/%@", v4]);
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)addStringDefaultValueToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = [(PDFFormField *)self defaultStringValue];
  if (v4) {
    CFDictionarySetValue(a3, @"/DV", v4);
  }

  MEMORY[0x270F9A790]();
}

- (BOOL)_isRedacted
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  uint64_t v4 = [WeakRetained annotationsForFieldName:v2->_private->fieldName];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 page];

  LOBYTE(v2) = objc_msgSend(v6, "rectIntersectsWithRedactionPath:", v2->_private->bounds.origin.x, v2->_private->bounds.origin.y, v2->_private->bounds.size.width, v2->_private->bounds.size.height);
  return (char)v2;
}

- (void).cxx_destruct
{
}

@end