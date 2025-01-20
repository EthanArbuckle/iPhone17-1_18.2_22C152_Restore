@interface PDFActionRemoteGoTo
- (CGPoint)point;
- (NSUInteger)pageIndex;
- (NSURL)URL;
- (PDFActionRemoteGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5;
- (PDFActionRemoteGoTo)initWithPageIndex:(NSUInteger)pageIndex atPoint:(CGPoint)point fileURL:(NSURL *)url;
- (__CFDictionary)createDictionaryRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toolTipNoLabel;
- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3;
- (void)commonInit;
- (void)setPageIndex:(NSUInteger)pageIndex;
- (void)setPoint:(CGPoint)point;
- (void)setURL:(NSURL *)URL;
@end

@implementation PDFActionRemoteGoTo

- (PDFActionRemoteGoTo)initWithPageIndex:(NSUInteger)pageIndex atPoint:(CGPoint)point fileURL:(NSURL *)url
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  v10 = url;
  v15.receiver = self;
  v15.super_class = (Class)PDFActionRemoteGoTo;
  v11 = [(PDFAction *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(PDFActionRemoteGoTo *)v11 commonInit];
    [(PDFAction *)v12 setType:@"GoToR"];
    v12->_private2->pageIndeCGFloat x = pageIndex;
    private2 = v12->_private2;
    private2->point.CGFloat x = x;
    private2->point.CGFloat y = y;
    objc_storeStrong((id *)&v12->_private2->url, url);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PDFActionRemoteGoTo;
  v5 = -[PDFAction copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionRemoteGoToPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    *(void *)(v5[2] + 8) = self->_private2->pageIndex;
    *(CGPoint *)(v5[2] + 16) = self->_private2->point;
    uint64_t v8 = [(NSURL *)self->_private2->url copyWithZone:a3];
    uint64_t v9 = v5[2];
    v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    id v11 = [(PDFDestination *)self->_private2->destination copyWithZone:a3];
    uint64_t v12 = v5[2];
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  return v5;
}

- (NSUInteger)pageIndex
{
  return self->_private2->pageIndex;
}

- (void)setPageIndex:(NSUInteger)pageIndex
{
  self->_private2->pageIndeCGFloat x = pageIndex;
}

- (CGPoint)point
{
  private2 = self->_private2;
  double x = private2->point.x;
  double y = private2->point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)point
{
  self->_private2->point = point;
}

- (NSURL)URL
{
  return self->_private2->url;
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v4 = [(NSURL *)URL copy];
  private2 = self->_private2;
  v6 = private2->url;
  private2->url = (NSURL *)v4;

  MEMORY[0x270F9A758](v4, v6);
}

- (id)description
{
  v2 = NSString;
  v3 = [(PDFActionRemoteGoTo *)self toolTip];
  uint64_t v4 = [v2 stringWithFormat:@"GoToR Action - %@", v3];

  return v4;
}

- (PDFActionRemoteGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PDFActionRemoteGoTo;
  uint64_t v9 = [(PDFAction *)&v29 initWithActionDictionary:a3 forDocument:v8 forPage:a5];
  if (v9)
  {
    CGPDFObjectRef value = 0;
    if (CGPDFDictionaryGetObject(a3, "F", &value))
    {
      v10 = value;
      id v11 = [v8 documentURL];
      uint64_t v12 = [v11 path];
      v13 = getFilepathFromObjectDetermineEncoding(v10, (const __CFString *)[v12 stringByDeletingLastPathComponent]);

      if (v13)
      {
        uint64_t v14 = [NSURL fileURLWithPath:v13];
        private2 = v9->_private2;
        url = private2->url;
        private2->url = (NSURL *)v14;
      }
    }
    if (v9->_private2->url)
    {
      v17 = [[PDFDocument alloc] initWithURL:v9->_private2->url];
      if (v17)
      {
        v18 = [[PDFDestination alloc] initWithDictionary:a3 forDocument:v17];
        v19 = v9->_private2;
        destination = v19->destination;
        v19->destination = v18;

        v21 = v9->_private2->destination;
        if (v21)
        {
          v22 = [(PDFDestination *)v21 page];
          v9->_private2->pageIndedouble x = [(PDFDocument *)v17 indexForPage:v22];

          v23 = v9->_private2;
          [(PDFDestination *)v23->destination point];
          v23->point.double x = v24;
          v23->point.double y = v25;
        }
      }
    }
    v26 = v9;
  }

  return v9;
}

- (void)commonInit
{
  v11.receiver = self;
  v11.super_class = (Class)PDFActionRemoteGoTo;
  [(PDFAction *)&v11 commonInit];
  v3 = objc_alloc_init(PDFActionRemoteGoToPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  self->_private2->pageIndedouble x = 0;
  v5 = self->_private2;
  v5->point.double x = PDFPointMake(3.40282347e38, 3.40282347e38);
  v5->point.double y = v6;
  v7 = self->_private2;
  url = v7->url;
  v7->url = 0;

  uint64_t v9 = self->_private2;
  destination = v9->destination;
  v9->destination = 0;
}

- (__CFDictionary)createDictionaryRef
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"/S", @"/GoToR");
  [(PDFActionRemoteGoTo *)self addDestinationToDictionaryRef:Mutable];
  return Mutable;
}

- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t v4 = self->_private2->destination;
  if (v4)
  {
    CGFloat v6 = v4;
    v5 = [(PDFDestination *)v4 createArrayRef];
    uint64_t v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/D", v5);
      CFRelease(v5);
      uint64_t v4 = v6;
    }
  }
}

- (id)toolTipNoLabel
{
  v3 = [(PDFActionRemoteGoTo *)self URL];
  if (v3)
  {
    uint64_t v4 = NSString;
    v5 = PDFKitLocalizedString(@"Go to file %@, page %lu");
    CGFloat v6 = [(PDFActionRemoteGoTo *)self URL];
    v7 = [v6 path];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = objc_msgSend(v4, "stringWithFormat:", v5, v8, self->_private2->pageIndex + 1);
  }
  else
  {
    uint64_t v9 = PDFKitLocalizedString(@"Broken link");
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end