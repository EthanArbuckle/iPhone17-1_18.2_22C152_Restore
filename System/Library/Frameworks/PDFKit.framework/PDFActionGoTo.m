@interface PDFActionGoTo
- (PDFActionGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (PDFActionGoTo)initWithDestination:(PDFDestination *)destination;
- (PDFDestination)destination;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toolTip;
- (id)toolTipNoLabel;
- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3;
- (void)commonInit;
- (void)setDestination:(PDFDestination *)destination;
@end

@implementation PDFActionGoTo

- (PDFActionGoTo)initWithDestination:(PDFDestination *)destination
{
  v5 = destination;
  v9.receiver = self;
  v9.super_class = (Class)PDFActionGoTo;
  v6 = [(PDFAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(PDFAction *)v6 setType:@"GoTo"];
    objc_storeStrong((id *)&v7->_private2->destination, destination);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDFActionGoTo;
  v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionGoToPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    id v8 = [(PDFDestination *)self->_private2->destination copyWithZone:a3];
    uint64_t v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v8;
  }
  return v5;
}

- (PDFDestination)destination
{
  return self->_private2->destination;
}

- (void)setDestination:(PDFDestination *)destination
{
}

- (id)description
{
  v2 = NSString;
  v3 = [(PDFActionGoTo *)self toolTip];
  v4 = [v2 stringWithFormat:@"GoTo Action - %@", v3];

  return v4;
}

- (PDFActionGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDFActionGoTo;
  uint64_t v9 = [(PDFAction *)&v15 initWithActionDictionary:a3 forDocument:v8 forPage:a5];
  if (v9)
  {
    v10 = [[PDFDestination alloc] initWithDictionary:a3 forDocument:v8];
    private2 = v9->_private2;
    destination = private2->destination;
    private2->destination = v10;

    v13 = v9;
  }

  return v9;
}

- (void)commonInit
{
  v7.receiver = self;
  v7.super_class = (Class)PDFActionGoTo;
  [(PDFAction *)&v7 commonInit];
  v3 = objc_alloc_init(PDFActionGoToPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  v5 = self->_private2;
  destination = v5->destination;
  v5->destination = 0;
}

- (__CFDictionary)createDictionaryRef
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"/S", @"/GoTo");
  [(PDFActionGoTo *)self addDestinationToDictionaryRef:Mutable];
  return Mutable;
}

- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  v4 = [(PDFActionGoTo *)self destination];
  if (v4)
  {
    id v6 = v4;
    v5 = (const void *)[v4 createArrayRef];
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/D", v5);
      CFRelease(v5);
      v4 = v6;
    }
  }
}

- (id)toolTip
{
  v3 = NSString;
  v4 = PDFKitLocalizedString(@"Go to page %@");
  v5 = [(PDFActionGoTo *)self destination];
  id v6 = [v5 page];
  objc_super v7 = [v6 label];
  id v8 = objc_msgSend(v3, "stringWithFormat:", v4, v7);

  return v8;
}

- (id)toolTipNoLabel
{
  v2 = [(PDFActionGoTo *)self destination];
  v3 = [v2 page];
  v4 = PDFGetToolTipNoLabel(v3);

  return v4;
}

- (void).cxx_destruct
{
}

@end