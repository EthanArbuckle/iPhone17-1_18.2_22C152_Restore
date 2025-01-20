@interface PDFActionNamed
- (PDFActionNamed)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (PDFActionNamed)initWithName:(PDFActionNamedName)name;
- (PDFActionNamedName)name;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toolTip;
- (void)addNameToDictionaryRef:(__CFDictionary *)a3;
- (void)commonInit;
- (void)setName:(PDFActionNamedName)name;
@end

@implementation PDFActionNamed

- (PDFActionNamed)initWithName:(PDFActionNamedName)name
{
  v7.receiver = self;
  v7.super_class = (Class)PDFActionNamed;
  v4 = [(PDFAction *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(PDFActionNamed *)v4 commonInit];
    [(PDFAction *)v5 setType:@"Named"];
    v5->_private2->name = name;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDFActionNamed;
  v4 = [(PDFAction *)&v8 copyWithZone:a3];
  if (v4)
  {
    v5 = objc_alloc_init(PDFActionNamedPrivateVars);
    v6 = (void *)v4[2];
    v4[2] = v5;

    *(void *)(v4[2] + 8) = self->_private2->name;
  }
  return v4;
}

- (PDFActionNamedName)name
{
  return self->_private2->name;
}

- (void)setName:(PDFActionNamedName)name
{
  self->_private2->name = name;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PDFActionNamed *)self toolTip];
  v4 = [v2 stringWithFormat:@"Named Action - %@", v3];

  return v4;
}

- (PDFActionNamed)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PDFActionNamed;
  value = 0;
  v6 = [(PDFAction *)&v11 initWithActionDictionary:a3 forDocument:a4 forPage:a5];
  if (!v6 || !CGPDFDictionaryGetName(a3, "N", (const char **)&value)) {
    goto LABEL_14;
  }
  objc_super v7 = value;
  if (!strcmp(value, "Find"))
  {
    uint64_t v9 = 8;
LABEL_26:
    v6->_private2->name = v9;
    objc_super v8 = v6;
    goto LABEL_27;
  }
  if (!strcmp(v7, "FirstPage"))
  {
    uint64_t v9 = 3;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoBack"))
  {
    uint64_t v9 = 5;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoForward"))
  {
    uint64_t v9 = 6;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoToPage"))
  {
    uint64_t v9 = 7;
    goto LABEL_26;
  }
  if (!strcmp(v7, "LastPage"))
  {
    uint64_t v9 = 4;
    goto LABEL_26;
  }
  if (!strcmp(v7, "NextPage"))
  {
    uint64_t v9 = 1;
    goto LABEL_26;
  }
  if (!strcmp(v7, "PrevPage"))
  {
    uint64_t v9 = 2;
    goto LABEL_26;
  }
  if (!strcmp(v7, "Print"))
  {
    uint64_t v9 = 9;
    goto LABEL_26;
  }
  if (!strcmp(v7, "ZoomViewIn"))
  {
    uint64_t v9 = 10;
    goto LABEL_26;
  }
  if (!strcmp(v7, "ZoomViewOut"))
  {
    uint64_t v9 = 11;
    goto LABEL_26;
  }
LABEL_14:
  objc_super v8 = 0;
LABEL_27:

  return v8;
}

- (void)commonInit
{
  v5.receiver = self;
  v5.super_class = (Class)PDFActionNamed;
  [(PDFAction *)&v5 commonInit];
  v3 = objc_alloc_init(PDFActionNamedPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  self->_private2->name = 0;
}

- (__CFDictionary)createDictionaryRef
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"/S", @"/Named");
  [(PDFActionNamed *)self addNameToDictionaryRef:Mutable];
  return Mutable;
}

- (void)addNameToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4 = [(PDFActionNamed *)self name] - 1;
  if (v4 <= 0xA)
  {
    objc_super v5 = off_2642045C0[v4];
    CFDictionarySetValue(a3, @"/N", v5);
  }
}

- (id)toolTip
{
  unint64_t v2 = [(PDFActionNamed *)self name] - 1;
  if (v2 <= 8 && ((0x1BFu >> v2) & 1) != 0)
  {
    v3 = PDFKitLocalizedString(off_264204618[v2]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end