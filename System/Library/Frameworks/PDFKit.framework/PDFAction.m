@interface PDFAction
+ (Class)_classForActionDictionary:(CGPDFDictionary *)a3;
+ (PDFAction)actionWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (NSString)type;
- (PDFAction)init;
- (PDFAction)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (__CFDictionary)createDictionaryRef;
- (id)baseURLForDocument:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nextActions;
- (id)toolTip;
- (void)_setNextAction:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (void)_setNextActions:(CGPDFArray *)a3 forDocument:(id)a4 forPage:(id)a5;
- (void)_setNextActions:(id)a3;
- (void)commonInit;
- (void)setType:(id)a3;
@end

@implementation PDFAction

- (PDFAction)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFAction;
  v2 = [(PDFAction *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PDFAction *)v2 commonInit];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionPrivate);
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_private->type copyWithZone:a3];
    uint64_t v9 = v5[1];
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;

    uint64_t v11 = [(NSArray *)self->_private->nextActions copyWithZone:a3];
    uint64_t v12 = v5[1];
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;
  }
  return v5;
}

- (NSString)type
{
  return self->_private->type;
}

- (void)commonInit
{
  v3 = objc_alloc_init(PDFActionPrivate);
  v4 = self->_private;
  self->_private = v3;

  objc_super v5 = self->_private;
  type = v5->type;
  v5->type = 0;

  v7 = self->_private;
  nextActions = v7->nextActions;
  v7->nextActions = 0;
}

+ (PDFAction)actionWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (objc_class *)[a1 _classForActionDictionary:a3];
  if (!v10) {
    v10 = (objc_class *)PDFAction;
  }
  uint64_t v11 = (void *)[[v10 alloc] initWithActionDictionary:a3 forDocument:v9 forPage:v8];

  return (PDFAction *)v11;
}

+ (Class)_classForActionDictionary:(CGPDFDictionary *)a3
{
  value = 0;
  BOOL Name = CGPDFDictionaryGetName(a3, "S", (const char **)&value);
  v4 = 0;
  objc_super v5 = value;
  if (Name && value != 0)
  {
    if (!strcmp(value, "GoTo")
      || !strcmp(v5, "Named")
      || !strcmp(v5, "URI")
      || !strcmp(v5, "Launch")
      || !strcmp(v5, "GoToR")
      || !strcmp(v5, "ResetForm"))
    {
      v4 = objc_opt_class();
    }
    else
    {
      v4 = 0;
    }
  }

  return (Class)v4;
}

- (PDFAction)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  CGPDFArrayRef v20 = 0;
  value = 0;
  v18.receiver = self;
  v18.super_class = (Class)PDFAction;
  CGPDFDictionaryRef v19 = 0;
  v10 = [(PDFAction *)&v18 init];
  uint64_t v11 = v10;
  if (v10)
  {
    [(PDFAction *)v10 commonInit];
    if (CGPDFDictionaryGetName(a3, "S", (const char **)&value))
    {
      id v12 = [NSString alloc];
      uint64_t v13 = [v12 initWithUTF8String:value];
      v14 = v11->_private;
      type = v14->type;
      v14->type = (NSString *)v13;
    }
    if (CGPDFDictionaryGetDictionary(a3, "Next", &v19))
    {
      [(PDFAction *)v11 _setNextAction:v19 forDocument:v8 forPage:v9];
    }
    else if (CGPDFDictionaryGetArray(a3, "Next", &v20))
    {
      [(PDFAction *)v11 _setNextActions:v20 forDocument:v8 forPage:v9];
    }
    v16 = v11;
  }

  return v11;
}

- (__CFDictionary)createDictionaryRef
{
  return 0;
}

- (id)toolTip
{
  return 0;
}

- (id)description
{
  return 0;
}

- (void)setType:(id)a3
{
}

- (id)nextActions
{
  return self->_private->nextActions;
}

- (void)_setNextActions:(id)a3
{
}

- (void)_setNextAction:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  v10 = [MEMORY[0x263F08B88] currentThread];
  uint64_t v11 = [v10 threadDictionary];

  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    [v11 setObject:v9 forKey:v9];
    uint64_t v13 = (objc_class *)[(id)objc_opt_class() _classForActionDictionary:a3];
    if (!v13) {
      uint64_t v13 = (objc_class *)PDFAction;
    }
    v14 = (void *)[[v13 alloc] initWithActionDictionary:a3 forDocument:v18 forPage:v8];
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];
      v16 = self->_private;
      nextActions = v16->nextActions;
      v16->nextActions = (NSArray *)v15;
    }
  }
  [v11 removeObjectForKey:v9];
}

- (void)_setNextActions:(CGPDFArray *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  CGPDFDictionaryRef value = 0;
  size_t Count = CGPDFArrayGetCount(a3);
  if (Count)
  {
    size_t v11 = Count;
    id v12 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:Count];
    uint64_t v13 = 0;
    for (size_t i = 0; i != v11; ++i)
    {
      if (CGPDFArrayGetDictionary(a3, i, &value))
      {
        uint64_t v15 = (objc_class *)[(id)objc_opt_class() _classForActionDictionary:value];
        if (!v15) {
          uint64_t v15 = (objc_class *)PDFAction;
        }
        id v16 = [v15 alloc];
        uint64_t v17 = [v16 initWithActionDictionary:value forDocument:v8 forPage:v9];

        if (v17)
        {
          [(NSArray *)v12 addObject:v17];
          uint64_t v13 = (void *)v17;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
    }
    id v18 = self->_private;
    nextActions = v18->nextActions;
    v18->nextActions = v12;
    CGPDFArrayRef v20 = v12;
  }
}

- (id)baseURLForDocument:(id)a3
{
  id v3 = a3;
  CGPDFDictionaryRef value = 0;
  v4 = (CGPDFDocument *)[v3 documentRef];
  if (!v4) {
    goto LABEL_7;
  }
  Catalog = CGPDFDocumentGetCatalog(v4);
  if (!CGPDFDictionaryGetDictionary(Catalog, "URI", &value)
    || (CGPDFStringRef string = 0, !CGPDFDictionaryGetString(value, "Base", &string))
    || (BytePtr = CGPDFStringGetBytePtr(string)) == 0
    || (v7 = BytePtr, !CGPDFStringGetLength(string))
    || ([NSString stringWithCString:v7 encoding:30],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = (void *)[objc_alloc(NSURL) initWithString:v8],
        v8,
        !v9))
  {
LABEL_7:
    id v9 = [v3 documentURL];
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end