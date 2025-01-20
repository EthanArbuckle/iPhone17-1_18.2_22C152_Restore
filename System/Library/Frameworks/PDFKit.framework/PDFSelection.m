@interface PDFSelection
+ (id)defaultActiveColor;
+ (id)defaultInactiveColor;
- (BOOL)containsPoint:(CGPoint)a3 onPage:(id)a4;
- (BOOL)forceBreaks;
- (BOOL)isEmpty;
- (BOOL)isEqualToSelection:(id)a3;
- (BOOL)isStandaloneGraphic;
- (CGPDFSelection)cgSelectionForPage:(id)a3;
- (CGPoint)firstCharCenter;
- (CGPoint)leftMostCharCenter;
- (CGPoint)rightMostCharCenter;
- (CGRect)boundsForPage:(PDFPage *)page;
- (CGRect)firstSpanBoundsForPage:(id)a3;
- (CGRect)lastSpanBoundsForPage:(id)a3;
- (CGRect)spanBoundsForPage:(id)a3 atPoint:(CGPoint)a4;
- (NSArray)pages;
- (NSArray)selectionsByLine;
- (NSAttributedString)attributedString;
- (NSRange)rangeAtIndex:(NSUInteger)index onPage:(PDFPage *)page;
- (NSString)string;
- (NSUInteger)numberOfTextRangesOnPage:(PDFPage *)page;
- (PDFSelection)initWithDocument:(PDFDocument *)document;
- (PDFSelection)initWithPage:(id)a3;
- (UIColor)color;
- (_NSRange)previewRangeAtIndex:(unint64_t)a3 onPage:(id)a4;
- (__CFArray)cgSelections;
- (id)asDestination;
- (id)attributedStringScaled:(double)a3;
- (id)boundsArrayForPage:(id)a3;
- (id)cgSelectionPages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createAttributedStringForCGSelection:(CGPDFSelection *)a3 scaled:(double)a4;
- (id)description;
- (id)document;
- (id)firstPage;
- (id)html;
- (id)htmlData;
- (id)lastPage;
- (id)pdfSelectionUUID;
- (id)rtfData;
- (id)webArchive;
- (int64_t)compare:(id)a3;
- (unint64_t)indexOfFirstCharacterOnPage:(id)a3;
- (unint64_t)indexOfLastCharacterOnPage:(id)a3;
- (unint64_t)pdfKitIndexOfFirstCharacterOnPage:(id)a3;
- (unint64_t)pdfKitIndexOfLastCharacterOnPage:(id)a3;
- (void)addCGSelection:(CGPDFSelection *)a3 forPage:(id)a4;
- (void)addSelection:(PDFSelection *)selection;
- (void)addSelectionCore:(id)a3 normalize:(BOOL)a4;
- (void)addSelectionNoNormalize:(id)a3;
- (void)addSelectionRange:(_NSRange)a3 page:(id)a4 normalize:(BOOL)a5;
- (void)addSelections:(NSArray *)selections;
- (void)dealloc;
- (void)drawForPage:(PDFPage *)page active:(BOOL)active;
- (void)drawForPage:(PDFPage *)page withBox:(PDFDisplayBox)box active:(BOOL)active;
- (void)drawForPage:(id)a3 withBox:(int)a4 active:(BOOL)a5 inContext:(CGContext *)a6;
- (void)enumerateRectsAndTransformsForPage:(id)a3 usingBlock:(id)a4;
- (void)extendSelectionAtEnd:(NSInteger)succeed;
- (void)extendSelectionAtStart:(NSInteger)precede;
- (void)extendSelectionForLineBoundaries;
- (void)normalize;
- (void)setColor:(UIColor *)color;
- (void)setForceBreaks:(BOOL)a3;
@end

@implementation PDFSelection

- (PDFSelection)initWithDocument:(PDFDocument *)document
{
  v4 = document;
  v13.receiver = self;
  v13.super_class = (Class)PDFSelection;
  v5 = [(PDFSelection *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pageRanges = v6->_pageRanges;
    v6->_pageRanges = v7;

    v6->_forceBreaks = 0;
    pages = v6->_pages;
    v6->_cgSelections = 0;
    v6->_pages = 0;

    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    pdfSelectionUUID = v6->_pdfSelectionUUID;
    v6->_pdfSelectionUUID = (NSUUID *)v10;
  }
  return v6;
}

- (PDFSelection)initWithPage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDFSelection;
  v5 = [(PDFSelection *)&v12 init];
  if (v5)
  {
    v6 = [v4 document];
    objc_storeWeak((id *)&v5->_document, v6);

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pageRanges = v5->_pageRanges;
    v5->_pageRanges = v7;

    v5->_forceBreaks = 0;
    v5->_cgSelections = 0;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v4, 0);
    pages = v5->_pages;
    v5->_pages = (NSMutableArray *)v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v6 = (void *)[v4 initWithDocument:WeakRetained];

  uint64_t v7 = [(NSMutableArray *)self->_pageRanges count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = [(NSMutableArray *)self->_pageRanges objectAtIndex:i];
      uint64_t v11 = [v10 range];
      uint64_t v13 = v12;
      v14 = [v10 page];
      objc_msgSend(v6, "addSelectionRange:page:normalize:", v11, v13, v14, 0);
    }
  }
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    CFIndex Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      CFIndex v17 = Count;
      for (CFIndex j = 0; j != v17; ++j)
      {
        CFArrayGetValueAtIndex(self->_cgSelections, j);
        uint64_t v19 = CGPDFSelectionCreateFromSelection();
        v20 = [(NSMutableArray *)self->_pages objectAtIndex:j];
        [v6 addCGSelection:v19 forPage:v20];
        CGPDFSelectionRelease();
      }
    }
  }
  v21 = [(PDFSelection *)self color];
  [v6 setColor:v21];

  objc_msgSend(v6, "setForceBreaks:", -[PDFSelection forceBreaks](self, "forceBreaks"));
  uint64_t v22 = [MEMORY[0x263F08C38] UUID];
  v23 = (void *)v6[7];
  v6[7] = v22;

  return v6;
}

- (NSArray)pages
{
  if (self->_pages)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_pages];
  }
  else
  {
    int v4 = [(NSMutableArray *)self->_pageRanges count];
    if (v4 < 1)
    {
      v3 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      v5 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
      v6 = [(NSMutableArray *)self->_pageRanges objectAtIndex:0];
      uint64_t v7 = [v6 page];
      [v5 addObject:v7];

      if (v4 != 1)
      {
        uint64_t v8 = v4;
        for (uint64_t i = 1; i != v8; ++i)
        {
          uint64_t v10 = [(NSMutableArray *)self->_pageRanges objectAtIndex:i];
          uint64_t v11 = [v10 page];

          if (([v5 containsObject:v11] & 1) == 0) {
            [v5 addObject:v11];
          }
        }
      }
      v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    }
  }

  return (NSArray *)v3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(UIColor *)color
{
  int v4 = (UIColor *)[(UIColor *)color copy];
  v5 = self->_color;
  self->_color = v4;

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"PDFSelectionChangedColor" object:self userInfo:0];
}

- (NSString)string
{
  cgSelections = self->_cgSelections;
  if (cgSelections && (CFIndex Count = CFArrayGetCount(cgSelections)) != 0)
  {
    unint64_t v5 = Count;
    id v6 = 0;
    CFIndex v7 = 0;
    do
    {
      if (!v6)
      {
        id v6 = [MEMORY[0x263F089D8] stringWithCapacity:16];
      }
      CFArrayGetValueAtIndex(self->_cgSelections, v7);
      uint64_t String = CGPDFSelectionCreateString();
      if (String)
      {
        uint64_t v9 = (void *)String;
        [v6 appendString:String];
      }
      if (++v7 < v5) {
        [v6 appendString:@"\n"];
      }
    }
    while (v5 != v7);
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)[(PDFSelection *)self attributedStringScaled:1.0];
}

- (CGRect)boundsForPage:(PDFPage *)page
{
  int v4 = page;
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    CFIndex Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0; i != v11; ++i)
      {
        uint64_t v13 = [(NSMutableArray *)self->_pages objectAtIndex:i];

        if (v13 == v4)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          CGPDFSelectionGetBounds();
          v32.origin.double x = v14;
          v32.origin.double y = v15;
          v32.size.double width = v16;
          v32.size.double height = v17;
          v29.origin.double x = x;
          v29.origin.double y = y;
          v29.size.double width = width;
          v29.size.double height = height;
          CGRect v30 = CGRectUnion(v29, v32);
          double x = v30.origin.x;
          double y = v30.origin.y;
          double width = v30.size.width;
          double height = v30.size.height;
        }
      }
    }
  }
  double v18 = PDFRectFromCGRect(x, y, width, height);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 onPage:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = [(PDFSelection *)self boundsArrayForPage:a4];
  CFIndex v7 = v6;
  if (v6 && [v6 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "PDFKitPDFRectValue", (void)v13);
          v19.CGFloat x = x;
          v19.CGFloat y = y;
          if (PDFRectContainsPoint(v20, v19))
          {
            LOBYTE(v9) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (CGRect)spanBoundsForPage:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v10 = [(PDFSelection *)self boundsArrayForPage:a3];
  CFIndex v11 = v10;
  if (v10 && [v10 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      double v16 = 1.79769313e308;
LABEL_5:
      double v25 = v6;
      double v26 = v7;
      double v27 = width;
      double v28 = height;
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v17) PDFKitPDFRectValue];
        double v6 = v36.origin.x;
        double v7 = v36.origin.y;
        double width = v36.size.width;
        CGFloat height = v36.size.height;
        v35.double x = x;
        v35.double y = y;
        if (PDFRectContainsPoint(v36, v35)) {
          break;
        }
        double v18 = x - PDFRectGetCenterPoint(v6, v7, width);
        PDFRectGetCenterPoint(v6, v7, width);
        double v20 = sqrt((y - v19) * 1000.0 * ((y - v19) * 1000.0) + v18 * v18);
        if (v20 < v16)
        {
          double v16 = v20;
          double v27 = width;
          double v28 = height;
          double v25 = v6;
          double v26 = v7;
        }
        if (v14 == ++v17)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
          double width = v27;
          CGFloat height = v28;
          double v6 = v25;
          double v7 = v26;
          if (v14) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  double v21 = v6;
  double v22 = v7;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)firstSpanBoundsForPage:(id)a3
{
  v3 = [(PDFSelection *)self boundsArrayForPage:a3];
  int v4 = v3;
  if (v3 && [v3 count])
  {
    unint64_t v5 = [v4 firstObject];
    [v5 PDFKitPDFRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)lastSpanBoundsForPage:(id)a3
{
  v3 = [(PDFSelection *)self boundsArrayForPage:a3];
  int v4 = v3;
  if (v3 && [v3 count])
  {
    unint64_t v5 = [v4 lastObject];
    [v5 PDFKitPDFRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)pdfSelectionUUID
{
  return self->_pdfSelectionUUID;
}

- (NSUInteger)numberOfTextRangesOnPage:(PDFPage *)page
{
  int v4 = page;
  if (v4 && (cgSelections = self->_cgSelections) != 0 && (CFIndex Count = CFArrayGetCount(cgSelections)) != 0)
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    while (1)
    {
      double v9 = [(NSMutableArray *)self->_pages objectAtIndex:v8];

      if (v9 == v4) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_7;
      }
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v8);
    NSUInteger NumberOfStringRanges = CGPDFSelectionGetNumberOfStringRanges();
  }
  else
  {
LABEL_7:
    NSUInteger NumberOfStringRanges = 0;
  }

  return NumberOfStringRanges;
}

- (NSRange)rangeAtIndex:(NSUInteger)index onPage:(PDFPage *)page
{
  unint64_t v5 = page;
  if (v5 && (cgSelections = self->_cgSelections) != 0 && (CFIndex Count = CFArrayGetCount(cgSelections)) != 0)
  {
    CFIndex v8 = Count;
    CFIndex v9 = 0;
    while (1)
    {
      double v10 = [(NSMutableArray *)self->_pages objectAtIndex:v9];

      if (v10 == v5) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_7;
      }
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v9);
    uint64_t StringRange = CGPDFSelectionGetStringRange();
    if (StringRange == -1) {
      NSUInteger v11 = 0;
    }
    else {
      NSUInteger v11 = v16;
    }
    if (StringRange == -1) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v12 = StringRange;
    }
  }
  else
  {
LABEL_7:
    NSUInteger v11 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v12;
  NSUInteger v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

- (NSArray)selectionsByLine
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!self->_cgSelections) {
    goto LABEL_10;
  }
  id v4 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];

  CFIndex Count = CFArrayGetCount(self->_cgSelections);
  if (!Count)
  {
LABEL_9:
    id v3 = v4;
LABEL_10:
    id v4 = v3;
    NSUInteger v16 = v4;
    goto LABEL_11;
  }
  CFIndex v5 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(self->_cgSelections, v5);
    CFArrayRef SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
    if (!SelectionsByLine) {
      break;
    }
    CFArrayRef v7 = SelectionsByLine;
    CFIndex v8 = CFArrayGetCount(SelectionsByLine);
    if (v8)
    {
      CFIndex v9 = v8;
      for (CFIndex i = 0; i != v9; ++i)
      {
        NSUInteger v11 = [PDFSelection alloc];
        uint64_t v12 = [(PDFSelection *)self document];
        NSUInteger v13 = [(PDFSelection *)v11 initWithDocument:v12];

        ValueAtIndedouble x = CFArrayGetValueAtIndex(v7, i);
        double v15 = [(NSMutableArray *)self->_pages objectAtIndex:v5];
        [(PDFSelection *)v13 addCGSelection:ValueAtIndex forPage:v15];

        [v4 addObject:v13];
      }
    }
    CFRelease(v7);
    if (++v5 == Count) {
      goto LABEL_9;
    }
  }
  NSUInteger v16 = (void *)MEMORY[0x263EFFA68];
LABEL_11:

  return (NSArray *)v16;
}

- (void)enumerateRectsAndTransformsForPage:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    CFIndex Count = CFArrayGetCount(cgSelections);
    if (Count)
    {
      uint64_t v10 = Count;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PDFSelection_enumerateRectsAndTransformsForPage_usingBlock___block_invoke;
      aBlock[3] = &unk_264205360;
      id v15 = v7;
      NSUInteger v11 = _Block_copy(aBlock);
      if (v10 >= 1)
      {
        for (CFIndex i = 0; i != v10; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          uint64_t Page = CGPDFSelectionGetPage();
          if (Page == [v6 pageRef]) {
            CGPDFSelectionEnumerateRectsAndTransforms();
          }
        }
      }
    }
  }
}

uint64_t __62__PDFSelection_enumerateRectsAndTransformsForPage_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
  long long v8 = a2[1];
  v10[0] = *a2;
  v10[1] = v8;
  v10[2] = a2[2];
  return v7(v6, v10, a3, a4, a5, a6);
}

- (void)addSelection:(PDFSelection *)selection
{
}

- (void)addSelections:(NSArray *)selections
{
  id v4 = selections;
  if (v4)
  {
    NSUInteger v11 = v4;
    unint64_t v5 = [(NSArray *)v4 count];
    if (v5 >= 2)
    {
      uint64_t v6 = 0;
      unint64_t v7 = v5 - 1;
      do
      {
        long long v8 = [(NSArray *)v11 objectAtIndex:v6];
        [(PDFSelection *)self addSelectionCore:v8 normalize:0];

        ++v6;
      }
      while (v7 != v6);
      goto LABEL_9;
    }
    BOOL v9 = v5 == 1;
    id v4 = v11;
    if (v9)
    {
      unint64_t v7 = 0;
LABEL_9:
      uint64_t v10 = [(NSArray *)v11 objectAtIndex:v7];
      [(PDFSelection *)self addSelectionCore:v10 normalize:1];

      id v4 = v11;
    }
  }
}

- (void)extendSelectionAtEnd:(NSInteger)succeed
{
  if (succeed)
  {
    unint64_t v5 = [(PDFSelection *)self document];

    if (v5)
    {
      cgSelections = self->_cgSelections;
      if (cgSelections)
      {
        if (CFArrayGetCount(cgSelections))
        {
          unint64_t v7 = self->_cgSelections;
          CFIndex Count = CFArrayGetCount(v7);
          CFArrayGetValueAtIndex(v7, Count - 1);
          uint64_t v9 = CGPDFSelectionExtendAtEnd();
          if (succeed < 0)
          {
            uint64_t v10 = self->_cgSelections;
            CFIndex v11 = CFArrayGetCount(v10);
            CFArrayGetValueAtIndex(v10, v11 - 1);
            if (CGPDFSelectionIsEmpty())
            {
              uint64_t v12 = self->_cgSelections;
              CFIndex v13 = CFArrayGetCount(v12);
              CFArrayRemoveValueAtIndex(v12, v13 - 1);
              [(NSMutableArray *)self->_pages removeLastObject];
            }
          }
          if ([(NSMutableArray *)self->_pages count])
          {
            if (succeed < 1 || (unint64_t v14 = succeed - v9, succeed <= v9))
            {
              if (succeed < 0 && succeed < v9)
              {
                double v28 = self->_cgSelections;
                CFIndex v29 = CFArrayGetCount(v28);
                CFArrayGetValueAtIndex(v28, v29 - 1);
                if (CGPDFSelectionIsEmpty())
                {
                  long long v30 = self->_cgSelections;
                  CFIndex v31 = CFArrayGetCount(v30);
                  CFArrayRemoveValueAtIndex(v30, v31 - 1);
                  [(NSMutableArray *)self->_pages removeLastObject];
                }
                if (CFArrayGetCount(self->_cgSelections) >= 1)
                {
                  do
                  {
                    unint64_t v32 = succeed - v9;
                    v33 = self->_cgSelections;
                    CFIndex v34 = CFArrayGetCount(v33);
                    CFArrayGetValueAtIndex(v33, v34 - 1);
                    uint64_t v9 = CGPDFSelectionExtendAtEnd();
                    CGPoint v35 = self->_cgSelections;
                    CFIndex v36 = CFArrayGetCount(v35);
                    CFArrayGetValueAtIndex(v35, v36 - 1);
                    if (CGPDFSelectionIsEmpty())
                    {
                      v37 = self->_cgSelections;
                      CFIndex v38 = CFArrayGetCount(v37);
                      CFArrayRemoveValueAtIndex(v37, v38 - 1);
                      [(NSMutableArray *)self->_pages removeLastObject];
                    }
                  }
                  while (v9 > v32 && CFArrayGetCount(self->_cgSelections) > 0);
                }
              }
            }
            else
            {
              id v15 = [(PDFSelection *)self document];
              NSUInteger v16 = [(NSMutableArray *)self->_pages lastObject];
              uint64_t v17 = [v15 indexForPage:v16];

              double v18 = [(PDFSelection *)self document];
              unint64_t v19 = [v18 pageCount];

              if (v17 + 1 < v19 && v14)
              {
                unint64_t v20 = v17 + 2;
                do
                {
                  double v21 = [(PDFSelection *)self document];
                  double v22 = [v21 pageAtIndex:v20 - 1];
                  unint64_t v23 = [v22 numberOfCharacters];

                  if (v23)
                  {
                    if (v14 >= v23) {
                      unint64_t v24 = v14 - v23;
                    }
                    else {
                      unint64_t v24 = 0;
                    }
                    if (v14 <= v23) {
                      unint64_t v23 = v14;
                    }
                    double v25 = [(PDFSelection *)self document];
                    double v26 = [v25 pageAtIndex:v20 - 1];
                    double v27 = objc_msgSend(v26, "selectionForRange:", 0, v23);
                    [(PDFSelection *)self addSelectionCore:v27 normalize:1];

                    unint64_t v14 = v24;
                  }
                  if (v20 >= v19) {
                    break;
                  }
                  ++v20;
                }
                while (v14);
              }
            }
          }
        }
      }
    }
  }
}

- (void)extendSelectionAtStart:(NSInteger)precede
{
  if (precede)
  {
    unint64_t v5 = [(PDFSelection *)self document];

    if (v5)
    {
      cgSelections = self->_cgSelections;
      if (cgSelections)
      {
        if (CFArrayGetCount(cgSelections))
        {
          CFArrayGetValueAtIndex(self->_cgSelections, 0);
          uint64_t v7 = CGPDFSelectionExtendAtStart();
          uint64_t v8 = v7;
          if (precede < 0)
          {
            CFArrayGetValueAtIndex(self->_cgSelections, 0);
            if (CGPDFSelectionIsEmpty())
            {
              CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
              [(NSMutableArray *)self->_pages removeObjectAtIndex:0];
            }
            if (precede < v8)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, 0);
              if (CGPDFSelectionIsEmpty())
              {
                CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
                [(NSMutableArray *)self->_pages removeObjectAtIndex:0];
              }
              if (CFArrayGetCount(self->_cgSelections) >= 1)
              {
                do
                {
                  unint64_t v23 = precede - v8;
                  unint64_t v24 = self->_cgSelections;
                  CFIndex Count = CFArrayGetCount(v24);
                  CFArrayGetValueAtIndex(v24, Count - 1);
                  uint64_t v8 = CGPDFSelectionExtendAtStart();
                  CFArrayGetValueAtIndex(self->_cgSelections, 0);
                  if (CGPDFSelectionIsEmpty())
                  {
                    CFArrayRemoveValueAtIndex(self->_cgSelections, 0);
                    [(NSMutableArray *)self->_pages removeObjectAtIndex:0];
                  }
                }
                while (v8 > v23 && CFArrayGetCount(self->_cgSelections) > 0);
              }
            }
          }
          else
          {
            unint64_t v9 = precede - v7;
            if (precede > v7)
            {
              uint64_t v10 = [(PDFSelection *)self document];
              CFIndex v11 = [(NSMutableArray *)self->_pages objectAtIndex:0];
              uint64_t v12 = [v10 indexForPage:v11];

              if (v12)
              {
                uint64_t v13 = v12 - 1;
                do
                {
                  unint64_t v14 = [(PDFSelection *)self document];
                  id v15 = [v14 pageAtIndex:v13];
                  unint64_t v16 = [v15 numberOfCharacters];

                  if (v16)
                  {
                    if (v16 >= v9) {
                      unint64_t v17 = v16 - v9;
                    }
                    else {
                      unint64_t v17 = 0;
                    }
                    if (v9 >= v16) {
                      unint64_t v18 = v9 - v16;
                    }
                    else {
                      unint64_t v18 = 0;
                    }
                    if (v9 < v16) {
                      unint64_t v16 = v9;
                    }
                    unint64_t v19 = [(PDFSelection *)self document];
                    unint64_t v20 = [v19 pageAtIndex:v13];
                    double v21 = objc_msgSend(v20, "selectionForRange:", v17, v16);
                    [(PDFSelection *)self addSelectionCore:v21 normalize:1];

                    unint64_t v9 = v18;
                  }
                  BOOL v22 = v13-- != 0;
                }
                while (v22 && (uint64_t)v9 > 0);
              }
            }
          }
        }
      }
    }
  }
}

- (void)extendSelectionForLineBoundaries
{
  cgSelections = self->_cgSelections;
  if (cgSelections)
  {
    int Count = CFArrayGetCount(cgSelections);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

    if (WeakRetained)
    {
      if (Count >= 1)
      {
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
        for (CFIndex i = 0; i != Count; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          int NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
          if (NumberOfRectsAndTransforms >= 1)
          {
            char v9 = 0;
            char v10 = 1;
            do
            {
              char v11 = v10;
              if ((v9 & 1) != 0 && NumberOfRectsAndTransforms == 1) {
                break;
              }
              CGPDFSelectionGetRectAndTransform();
              float64x2_t v12 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, 0.0 * 0.5 + 0.0), (float64x2_t)0, 0.0 * 0.5 + 0.0));
              double v13 = PDFPointFromCGPoint(v12.f64[0], v12.f64[1]);
              double v15 = v14;
              unint64_t v16 = CGPDFSelectionGetClientProperty();
              unint64_t v17 = objc_msgSend(v16, "selectionForLineAtPoint:", v13, v15);
              if (v17) {
                [v6 addObject:v17];
              }

              char v10 = 0;
              char v9 = 1;
            }
            while ((v11 & 1) != 0);
          }
        }
        [(PDFSelection *)self addSelections:v6];
      }
    }
  }
}

- (void)drawForPage:(PDFPage *)page active:(BOOL)active
{
}

- (void)drawForPage:(PDFPage *)page withBox:(PDFDisplayBox)box active:(BOOL)active
{
}

- (void)dealloc
{
  cgSelections = self->_cgSelections;
  if (cgSelections) {
    CFRelease(cgSelections);
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFSelection;
  [(PDFSelection *)&v4 dealloc];
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return WeakRetained;
}

- (id)asDestination
{
  id v3 = [(PDFSelection *)self pages];
  if (![v3 count])
  {
    objc_super v4 = 0;
LABEL_9:
    char v11 = 0;
    goto LABEL_10;
  }
  objc_super v4 = [v3 objectAtIndex:0];
  if (!v4) {
    goto LABEL_9;
  }
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  CFArrayRef SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
  if (!SelectionsByLine) {
    goto LABEL_9;
  }
  CFArrayRef v6 = SelectionsByLine;
  if (!CFArrayGetCount(SelectionsByLine)) {
    goto LABEL_9;
  }
  CFArrayGetValueAtIndex(v6, 0);
  CGPDFSelectionGetBounds();
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  char v11 = 0;
  if (!CGRectEqualToRect(v17, *MEMORY[0x263F001A0]))
  {
    float64x2_t v12 = [PDFDestination alloc];
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v19);
    char v11 = [(PDFDestination *)v12 initWithPage:v4 atPoint:PDFPointMake(MinX, MidY)];
  }
  CFRelease(v6);
LABEL_10:

  return v11;
}

- (BOOL)isEmpty
{
  cgSelections = self->_cgSelections;
  if (cgSelections && (CFIndex Count = CFArrayGetCount(cgSelections), v5 = Count - 1, Count >= 1))
  {
    CFIndex v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(self->_cgSelections, v6);
      IsEmptCGFloat y = CGPDFSelectionIsEmpty();
      if (IsEmpty) {
        BOOL v8 = v5 == v6;
      }
      else {
        BOOL v8 = 1;
      }
      ++v6;
    }
    while (!v8);
  }
  else
  {
    LOBYTE(IsEmpty) = 1;
  }
  return IsEmpty;
}

- (BOOL)isEqualToSelection:(id)a3
{
  objc_super v4 = (CFArrayRef *)a3;
  if (!v4) {
    goto LABEL_9;
  }
  CFIndex Count = CFArrayGetCount(self->_cgSelections);
  if (CFArrayGetCount(v4[5]) != Count) {
    goto LABEL_9;
  }
  if (Count < 1)
  {
    BOOL v9 = 1;
    goto LABEL_10;
  }
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  CFArrayGetValueAtIndex(v4[5], 0);
  if (CGPDFSelectionEqualToSelection())
  {
    CFIndex v6 = 1;
    do
    {
      CFIndex v7 = v6;
      if (Count == v6) {
        break;
      }
      CFArrayGetValueAtIndex(self->_cgSelections, v6);
      CFArrayGetValueAtIndex(v4[5], v7);
      char v8 = CGPDFSelectionEqualToSelection();
      CFIndex v6 = v7 + 1;
    }
    while ((v8 & 1) != 0);
    BOOL v9 = v7 >= Count;
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }
LABEL_10:

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  CFIndex v5 = v4;
  if (!v4
    || ([v4 document],
        CFIndex v6 = objc_claimAutoreleasedReturnValue(),
        [(PDFSelection *)self document],
        CFIndex v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v6 != v7))
  {
    char v8 = 0;
LABEL_4:
    BOOL v9 = 0;
LABEL_5:
    char v10 = 0;
    int64_t v11 = -1;
    goto LABEL_6;
  }
  double v13 = [(PDFSelection *)self pages];
  char v8 = v13;
  if (!v13 || ![v13 count]) {
    goto LABEL_4;
  }
  BOOL v9 = [v8 objectAtIndex:0];
  double v14 = [v5 pages];

  if (!v14)
  {
    char v8 = 0;
    goto LABEL_5;
  }
  if ([v14 count])
  {
    char v10 = [v14 objectAtIndex:0];
    double v15 = [(PDFSelection *)self document];
    unint64_t v16 = [v15 indexForPage:v9];

    CGRect v17 = [v5 document];
    unint64_t v18 = [v17 indexForPage:v10];

    int64_t v11 = -1;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL && v16 >= v18)
    {
      if (v18 >= v16)
      {
        unint64_t v19 = [(PDFSelection *)self pdfKitIndexOfFirstCharacterOnPage:v9];
        unint64_t v20 = [v5 pdfKitIndexOfFirstCharacterOnPage:v10];
        if (v19 >= v20) {
          int64_t v11 = v20 < v19;
        }
      }
      else
      {
        int64_t v11 = 1;
      }
    }
  }
  else
  {
    char v10 = 0;
    int64_t v11 = -1;
  }
  char v8 = v14;
LABEL_6:

  return v11;
}

- (id)boundsArrayForPage:(id)a3
{
  id v4 = a3;
  cgSelections = self->_cgSelections;
  if (cgSelections && (CFIndex Count = CFArrayGetCount(cgSelections)) != 0)
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0;
    BOOL v9 = 0;
    id v17 = v4;
    do
    {
      id v10 = [(NSMutableArray *)self->_pages objectAtIndex:v8];

      if (v10 == v4)
      {
        memset(v19, 0, sizeof(v19));
        CFArrayGetValueAtIndex(self->_cgSelections, v8);
        uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
        if (NumberOfRectsAndTransforms >= 1)
        {
          uint64_t v12 = NumberOfRectsAndTransforms;
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (!v9)
            {
              BOOL v9 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
            }
            CGPDFSelectionGetRectAndTransform();
            double v14 = (void *)MEMORY[0x263F08D40];
            CGAffineTransform v18 = *(CGAffineTransform *)&v19[32];
            CGRect v21 = CGRectApplyAffineTransform(*(CGRect *)v19, &v18);
            double v15 = objc_msgSend(v14, "PDFKitValueWithPDFRect:", PDFRectFromCGRect(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height));
            [v9 addObject:v15];
          }
        }
        id v4 = v17;
      }
      ++v8;
    }
    while (v8 != v7);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)addCGSelection:(CGPDFSelection *)a3 forPage:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    if ((id v10 = v6, self->_cgSelections) && self->_pages
      || (self->_cgSelections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]),
          CFIndex v8 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3],
          pages = self->_pages,
          self->_pages = v8,
          pages,
          id v7 = v10,
          self->_cgSelections))
    {
      if (self->_pages)
      {
        CGPDFSelectionSetClientProperty();
        CFArrayAppendValue(self->_cgSelections, a3);
        id v6 = (id)[(NSMutableArray *)self->_pages addObject:v10];
        id v7 = v10;
      }
    }
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (__CFArray)cgSelections
{
  return self->_cgSelections;
}

- (id)cgSelectionPages
{
  return self->_pages;
}

- (CGPDFSelection)cgSelectionForPage:(id)a3
{
  id v4 = a3;
  if (v4
    && self->_cgSelections
    && ((uint64_t v5 = [(NSMutableArray *)self->_pages count], CFArrayGetCount(self->_cgSelections) == v5)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        !v6))
  {
    CFIndex v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_pages objectAtIndex:v7];

      if (v8 == v4) {
        break;
      }
      if (v5 == ++v7) {
        goto LABEL_10;
      }
    }
    ValueAtIndeCGFloat x = (CGPDFSelection *)CFArrayGetValueAtIndex(self->_cgSelections, v7);
  }
  else
  {
LABEL_10:
    ValueAtIndeCGFloat x = 0;
  }

  return ValueAtIndex;
}

- (void)addSelectionNoNormalize:(id)a3
{
}

- (void)addSelectionCore:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  if (!v20) {
    goto LABEL_5;
  }
  BOOL v6 = [(PDFSelection *)self document];

  if (!v6) {
    goto LABEL_5;
  }
  CFIndex v7 = [(PDFSelection *)self document];
  id v8 = [v20 document];

  if (v7 != v8)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"addSelection: selection document mismatch"];
    goto LABEL_5;
  }
  uint64_t v9 = [v20 cgSelections];
  if (!v9) {
    goto LABEL_20;
  }
  CFArrayRef v10 = (const __CFArray *)v9;
  if (!self->_cgSelections) {
    self->_cgSelections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  }
  if (!self->_pages)
  {
    int64_t v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    pages = self->_pages;
    self->_pages = v11;
  }
  CFIndex Count = CFArrayGetCount(v10);
  double v14 = [v20 cgSelectionPages];
  uint64_t v15 = [v14 count];

  if (Count == v15)
  {
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v10, i);
        id v17 = (const void *)CGPDFSelectionCreateFromSelection();
        if (v17) {
          CFArrayAppendValue(self->_cgSelections, v17);
        }
        CGPDFSelectionRelease();
      }
    }
    CGAffineTransform v18 = self->_pages;
    unint64_t v19 = [v20 cgSelectionPages];
    [(NSMutableArray *)v18 addObjectsFromArray:v19];

LABEL_20:
    if (v4) {
      [(PDFSelection *)self normalize];
    }
  }
LABEL_5:
}

- (void)addSelectionRange:(_NSRange)a3 page:(id)a4 normalize:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  uint64_t v9 = [(PDFSelection *)self document];

  CFArrayRef v10 = 0;
  if (v9)
  {
    if (length)
    {
      CFArrayRef v10 = -[PDFPageRange initWithPage:range:]([PDFPageRange alloc], "initWithPage:range:", v11, location, length);
      [(NSMutableArray *)self->_pageRanges addObject:v10];
      if (v5) {
        [(PDFSelection *)self normalize];
      }
    }
  }
}

- (CGPoint)firstCharCenter
{
  if (CFArrayGetValueAtIndex(self->_cgSelections, 0))
  {
    CGPDFSelectionGetRectAndTransform();
    v8.origin = 0u;
    v8.size = 0u;
    double MidX = CGRectGetMidX(v8);
    v9.origin = 0u;
    v9.size = 0u;
    double v3 = CGRectGetMidY(v9) * 0.0 + 0.0 * MidX + 0.0;
    double v4 = v3;
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v5 = PDFPointFromCGPoint(v3, v4);
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (CGPoint)leftMostCharCenter
{
  if (CFArrayGetValueAtIndex(self->_cgSelections, 0))
  {
    CGPDFSelectionGetRectAndTransform();
    v8.origin = 0u;
    v8.size = 0u;
    double MinX = CGRectGetMinX(v8);
    v9.origin = 0u;
    v9.size = 0u;
    double v3 = CGRectGetMidY(v9) * 0.0 + 0.0 * MinX + 0.0;
    double v4 = v3;
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v5 = PDFPointFromCGPoint(v3, v4);
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (CGPoint)rightMostCharCenter
{
  CFIndex Count = CFArrayGetCount(self->_cgSelections);
  if (CFArrayGetValueAtIndex(self->_cgSelections, Count - 1))
  {
    CGPDFSelectionGetNumberOfRectsAndTransforms();
    CGPDFSelectionGetRectAndTransform();
    v10.origin = 0u;
    v10.size = 0u;
    double MaxX = CGRectGetMaxX(v10);
    v11.origin = 0u;
    v11.size = 0u;
    double v5 = CGRectGetMidY(v11) * 0.0 + 0.0 * MaxX + 0.0;
    double v6 = v5;
  }
  else
  {
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v7 = PDFPointFromCGPoint(v5, v6);
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (id)firstPage
{
  if ([(PDFSelection *)self isEmpty])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(NSMutableArray *)self->_pages objectAtIndex:0];
  }

  return v3;
}

- (id)lastPage
{
  if ([(PDFSelection *)self isEmpty])
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(NSMutableArray *)self->_pages lastObject];
  }

  return v3;
}

- (unint64_t)indexOfFirstCharacterOnPage:(id)a3
{
  if (a3) {
    return [(PDFSelection *)self previewRangeAtIndex:0 onPage:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)indexOfLastCharacterOnPage:(id)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [(PDFSelection *)self previewRangeAtIndex:[(PDFSelection *)self numberOfTextRangesOnPage:v5] - 1 onPage:v5];
    uint64_t v8 = v7;

    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return v8 + v6 - 1;
    }
  }
  return v3;
}

- (unint64_t)pdfKitIndexOfFirstCharacterOnPage:(id)a3
{
  if (a3) {
    return [(PDFSelection *)self rangeAtIndex:0 onPage:a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)pdfKitIndexOfLastCharacterOnPage:(id)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [(PDFSelection *)self rangeAtIndex:[(PDFSelection *)self numberOfTextRangesOnPage:v5] - 1 onPage:v5];
    uint64_t v8 = v7;

    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return v8 + v6 - 1;
    }
  }
  return v3;
}

- (id)createAttributedStringForCGSelection:(CGPDFSelection *)a3 scaled:(double)a4
{
  id v5 = [(PDFSelection *)self document];
  int v6 = [v5 isSimpleSelectionEnabled];
  AttributedCFStringRef String = (void *)CGPDFSelectionCreateAttributedString();
  uint64_t v8 = AttributedString;
  if (v6)
  {
    CGRect v9 = (void *)[AttributedString mutableCopy];
    uint64_t v10 = [v9 length];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __60__PDFSelection_createAttributedStringForCGSelection_scaled___block_invoke;
    v37[3] = &unk_264205388;
    double v39 = a4;
    id v11 = v9;
    id v38 = v11;
    objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v37);

    goto LABEL_26;
  }
  if (!AttributedString) {
    goto LABEL_25;
  }
  CFStringRef String = CFAttributedStringGetString((CFAttributedStringRef)AttributedString);
  if (!String)
  {
    CFRelease(v8);
LABEL_25:
    id v11 = 0;
    goto LABEL_26;
  }
  CFStringRef v13 = String;
  id v11 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:String];
  if (CFStringGetLength(v13) >= 1)
  {
    CFIndex v14 = 0;
    uint64_t v32 = *MEMORY[0x263F82270];
    uint64_t v33 = *MEMORY[0x263F82278];
    uint64_t v15 = *MEMORY[0x263F82248];
    unint64_t v16 = (const void **)MEMORY[0x263F36D38];
    do
    {
      effectiveRange.NSUInteger location = 0;
      effectiveRange.NSUInteger length = 0;
      CFDictionaryRef Attributes = CFAttributedStringGetAttributes((CFAttributedStringRef)v8, v14, &effectiveRange);
      if (Attributes)
      {
        CFDictionaryRef v18 = Attributes;
        unint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x263F36D48]);
        CFDataRef v21 = (const __CFData *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x263F36D50]);
        if (Value) {
          BOOL v22 = v21 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          CFDataRef v23 = v21;
          *(double *)CFIndex v34 = 0.0;
          *(double *)buffer = 0.0;
          v41.NSUInteger location = 0;
          v41.NSUInteger length = 8;
          CFDataGetBytes(Value, v41, buffer);
          v42.NSUInteger location = 0;
          v42.NSUInteger length = 8;
          CFDataGetBytes(v23, v42, v34);
          double v24 = *(double *)v34 * a4;
          *(float *)&double v24 = *(double *)v34 * a4;
          double v25 = +[PDFPage fontWithPDFFont:*(void *)buffer size:v24];
          if (v25) {
            [v19 setObject:v25 forKey:v32];
          }
        }
        double v26 = CFDictionaryGetValue(v18, (const void *)*MEMORY[0x263F36D40]);
        if (v26)
        {
          double v27 = [MEMORY[0x263F825C8] colorWithCGColor:v26];
          if (v27) {
            [v19 setObject:v27 forKey:v33];
          }
        }
        CFDataRef v28 = (const __CFData *)CFDictionaryGetValue(v18, *v16);
        if (v28)
        {
          *(double *)buffer = 0.0;
          v43.NSUInteger location = 0;
          v43.NSUInteger length = 8;
          CFDataGetBytes(v28, v43, buffer);
          HIDWORD(v29) = *(_DWORD *)&buffer[4];
          *(float *)&double v29 = *(double *)buffer;
          long long v30 = [NSNumber numberWithFloat:v29];
          [v19 setObject:v30 forKey:v15];
        }
        objc_msgSend(v11, "setAttributes:range:", v19, effectiveRange.location, effectiveRange.length, v32);
      }
      CFIndex v14 = effectiveRange.length + effectiveRange.location;
    }
    while (v14 < CFStringGetLength(v13));
  }
  CFRelease(v8);
LABEL_26:

  return v11;
}

void __60__PDFSelection_createAttributedStringForCGSelection_scaled___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  uint64_t v7 = (void *)[v14 mutableCopy];
  uint64_t v8 = [v14 valueForKey:*MEMORY[0x263F039A0]];
  CGRect v9 = v8;
  if (v8)
  {
    [v8 pointSize];
    id v11 = [v9 fontWithSize:v10 * *(double *)(a1 + 40)];
    [v7 setObject:v11 forKey:*MEMORY[0x263F82270]];
  }
  uint64_t v12 = [v14 valueForKey:*MEMORY[0x263F004B0]];
  if (v12)
  {
    CFStringRef v13 = [MEMORY[0x263F825C8] colorWithCGColor:v12];
    [v7 setObject:v13 forKey:*MEMORY[0x263F82278]];
  }
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v7, a3, a4);
}

- (id)attributedStringScaled:(double)a3
{
  if (self->_cgSelections)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
    CFIndex Count = CFArrayGetCount(self->_cgSelections);
    if (Count)
    {
      unint64_t v7 = Count;
      CFIndex v8 = 0;
      CGRect v9 = 0;
      do
      {
        double v10 = [(PDFSelection *)self createAttributedStringForCGSelection:CFArrayGetValueAtIndex(self->_cgSelections, v8) scaled:a3];
        if (v10)
        {
          if (!v9) {
            CGRect v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26C516768];
          }
          [v9 appendAttributedString:v10];
          if (++v8 < v7 && [(PDFSelection *)self forceBreaks]) {
            [v9 appendAttributedString:v5];
          }
        }
        else
        {
          ++v8;
        }
      }
      while (v8 != v7);
    }
    else
    {
      CGRect v9 = 0;
    }
  }
  else
  {
    CGRect v9 = 0;
    id v5 = 0;
  }

  return v9;
}

- (id)rtfData
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PDFSelection *)self attributedString];
  uint64_t v6 = *MEMORY[0x263F82258];
  v7[0] = *MEMORY[0x263F822B8];
  unint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  double v4 = objc_msgSend(v2, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v2, "length"), v3, 0);

  return v4;
}

- (id)htmlData
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PDFSelection *)self attributedString];
  uint64_t v6 = *MEMORY[0x263F82258];
  v7[0] = *MEMORY[0x263F82280];
  unint64_t v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  double v4 = objc_msgSend(v2, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v2, "length"), v3, 0);

  return v4;
}

- (id)html
{
  id v3 = [NSString alloc];
  double v4 = [(PDFSelection *)self htmlData];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

- (id)webArchive
{
  return 0;
}

+ (id)defaultActiveColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.698 green:0.843 blue:1.0 alpha:0.5];
}

+ (id)defaultInactiveColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.698 green:0.843 blue:1.0 alpha:0.5];
}

- (BOOL)forceBreaks
{
  return self->_forceBreaks;
}

- (void)setForceBreaks:(BOOL)a3
{
  self->_forceBreaks = a3;
}

- (void)drawForPage:(id)a3 withBox:(int)a4 active:(BOOL)a5 inContext:(CGContext *)a6
{
  id v10 = a3;
  if (a4 <= 4)
  {
    cgSelections = self->_cgSelections;
    if (cgSelections)
    {
      CFIndex Count = CFArrayGetCount(cgSelections);
      if (a6)
      {
        uint64_t v13 = Count;
        if (Count)
        {
          id v14 = [(PDFSelection *)self color];
          if (!v14)
          {
            if (a5) {
              +[PDFSelection defaultActiveColor];
            }
            else {
            id v14 = +[PDFSelection defaultInactiveColor];
            }
          }
          id v15 = v14;
          CGContextSetFillColorWithColor(a6, (CGColorRef)[v15 CGColor]);
          CGContextSaveGState(a6);
          CGFloat rect = PDFRectToCGRect([v10 boundsForBox:0]);
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat rect_16 = v20;
          v36.origin.CGFloat x = PDFRectToCGRect([v10 boundsForBox:a4]);
          CGFloat x = v36.origin.x;
          CGFloat y = v36.origin.y;
          CGFloat width = v36.size.width;
          CGFloat height = v36.size.height;
          double MinX = CGRectGetMinX(v36);
          v37.origin.CGFloat x = rect;
          v37.origin.CGFloat y = v17;
          v37.size.CGFloat width = v19;
          v37.size.CGFloat height = rect_16;
          double rect_8 = MinX - CGRectGetMinX(v37);
          v38.origin.CGFloat x = x;
          v38.origin.CGFloat y = y;
          v38.size.CGFloat width = width;
          v38.size.CGFloat height = height;
          double MinY = CGRectGetMinY(v38);
          v39.origin.CGFloat x = rect;
          v39.origin.CGFloat y = v17;
          v39.size.CGFloat width = v19;
          v39.size.CGFloat height = rect_16;
          CGFloat v27 = CGRectGetMinY(v39);
          CGContextTranslateCTM(a6, -rect_8, -(MinY - v27));
          CGContextSetCompositeOperation();
          if (v13 >= 1)
          {
            for (CFIndex i = 0; i != v13; ++i)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, i);
              uint64_t Page = CGPDFSelectionGetPage();
              if (Page == [v10 pageRef])
              {
                CGContextBeginPath(a6);
                uint64_t NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
                if (NumberOfRectsAndTransforms >= 1)
                {
                  uint64_t v31 = NumberOfRectsAndTransforms;
                  for (uint64_t j = 0; j != v31; ++j)
                  {
                    CGPDFSelectionGetRectAndTransform();
                    CGContextMoveToPoint(a6, 0.0 * 0.0 + 0.0 * 0.0 + 0.0, 0.0 * 0.0 + 0.0 * 0.0 + 0.0);
                    CGContextAddLineToPoint(a6, (0.0 + 0.0) * 0.0 + 0.0 * 0.0 + 0.0, (0.0 + 0.0) * 0.0 + 0.0 * 0.0 + 0.0);
                    CGContextAddLineToPoint(a6, (0.0 + 0.0) * 0.0 + 0.0 * (0.0 + 0.0) + 0.0, (0.0 + 0.0) * 0.0 + 0.0 * (0.0 + 0.0) + 0.0);
                    CGContextAddLineToPoint(a6, 0.0 * 0.0 + 0.0 * (0.0 + 0.0) + 0.0, 0.0 * 0.0 + 0.0 * (0.0 + 0.0) + 0.0);
                    CGContextAddLineToPoint(a6, 0.0 * 0.0 + 0.0 * 0.0 + 0.0, 0.0 * 0.0 + 0.0 * 0.0 + 0.0);
                  }
                }
                CGContextFillPath(a6);
              }
            }
          }
          CGContextRestoreGState(a6);
        }
      }
    }
  }
}

- (void)normalize
{
  if (self->_cgSelections)
  {
    uint64_t v3 = [(NSMutableArray *)self->_pages count];
    if (v3)
    {
      unint64_t v4 = v3;
      CFIndex v5 = 0;
      uint64_t v6 = 0;
      do
      {
        unint64_t v7 = v6;
        uint64_t v6 = [(NSMutableArray *)self->_pages objectAtIndex:v5];

        unint64_t v8 = v5 + 1;
        if (v5 + 1 < v4)
        {
          unint64_t v9 = v5 + 1;
          do
          {
            id v10 = [(NSMutableArray *)self->_pages objectAtIndex:v9];

            if (v10 == v6)
            {
              CFArrayGetValueAtIndex(self->_cgSelections, v5);
              CFArrayGetValueAtIndex(self->_cgSelections, v9);
              CGPDFSelectionAddSelection();
              CFArrayRemoveValueAtIndex(self->_cgSelections, v9);
              [(NSMutableArray *)self->_pages removeObjectAtIndex:v9];
              --v4;
            }
            else
            {
              ++v9;
            }
          }
          while (v9 < v4);
        }
        ++v5;
      }
      while (v8 < v4);
      [(__CFArray *)self->_cgSelections sortUsingFunction:_sortCGSelections context:0];
      [(NSMutableArray *)self->_pages removeAllObjects];
      if (v4)
      {
        for (CFIndex i = 0; i != v4; ++i)
        {
          CFArrayGetValueAtIndex(self->_cgSelections, i);
          uint64_t v12 = CGPDFSelectionGetClientProperty();
          if (v12) {
            [(NSMutableArray *)self->_pages addObject:v12];
          }
          else {
            NSLog(&cfstr_PdfselectionNo.isa);
          }
        }
      }
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->_pageRanges count] < 2)
  {
    uint64_t v13 = 0;
    goto LABEL_40;
  }
  [(NSMutableArray *)self->_pageRanges sortUsingFunction:_sortPageRanges context:0];
  id v35 = [(PDFSelection *)self pages];
  uint64_t v34 = [v35 count];
  if (!v34) {
    goto LABEL_39;
  }
  uint64_t v14 = 0;
  do
  {
    uint64_t v36 = v14;
    id v15 = [v35 objectAtIndex:v34];
    unint64_t v16 = 0;
    do
    {
      CGFloat v17 = [(NSMutableArray *)self->_pageRanges objectAtIndex:v16];
      double v18 = [v17 page];

      if (v18 != v15)
      {
        unint64_t v19 = v16 + 1;
        goto LABEL_37;
      }
      double v20 = [(NSMutableArray *)self->_pageRanges objectAtIndex:v16];
      unint64_t v21 = [v20 range];
      unint64_t v23 = v22;

      unint64_t v19 = v16 + 1;
      if (v16 + 1 < [(NSMutableArray *)self->_pageRanges count])
      {
        unint64_t v37 = v23;
        unint64_t v24 = v21 + v23;
        for (unint64_t j = v16 + 1; j < [(NSMutableArray *)self->_pageRanges count]; ++j)
        {
          double v26 = [(NSMutableArray *)self->_pageRanges objectAtIndex:j];
          CGFloat v27 = [v26 page];

          if (v27 == v15)
          {
            CFDataRef v28 = [(NSMutableArray *)self->_pageRanges objectAtIndex:j];
            unint64_t v29 = [v28 range];
            unint64_t v31 = v30;

            if (v29 == v21)
            {
              if (v31 > v37) {
                continue;
              }
            }
            else
            {
              if (v29 <= v21 || v29 > v24) {
                continue;
              }
              if (v29 + v31 > v24)
              {
                unint64_t v32 = v29 + v31 - v21;
                uint64_t v33 = [(NSMutableArray *)self->_pageRanges objectAtIndex:v16];
                objc_msgSend(v33, "setRange:", v21, v32);
              }
            }
            [(NSMutableArray *)self->_pageRanges removeObjectAtIndex:j];
          }
        }
      }
LABEL_37:
      unint64_t v16 = v19;
    }
    while (v19 < [(NSMutableArray *)self->_pageRanges count]);

    uint64_t v14 = v36 + 1;
  }
  while (v36 + 1 != v34);
LABEL_39:
  uint64_t v13 = v35;
LABEL_40:
}

- (BOOL)isStandaloneGraphic
{
  CFIndex Count = CFArrayGetCount(self->_cgSelections);
  if (!Count) {
    return 0;
  }
  unint64_t v4 = Count;
  CFArrayGetValueAtIndex(self->_cgSelections, 0);
  CGPDFSelectionCreateFromSelection();
  if (CGPDFSelectionIsStandaloneGraphic())
  {
    CFIndex v5 = 1;
    while (1)
    {
      CGPDFSelectionRelease();
      if (v4 == v5) {
        return 1;
      }
      CFArrayGetValueAtIndex(self->_cgSelections, v5);
      CGPDFSelectionCreateFromSelection();
      ++v5;
      if ((CGPDFSelectionIsStandaloneGraphic() & 1) == 0)
      {
        BOOL v6 = v5 - 1 >= v4;
        goto LABEL_9;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
LABEL_9:
    CGPDFSelectionRelease();
  }
  return v6;
}

- (id)description
{
  if ([(PDFSelection *)self isEmpty] || !self->_cgSelections)
  {
    unint64_t v7 = @"<empty selection>";
  }
  else
  {
    uint64_t v3 = [(PDFSelection *)self string];
    if ((unint64_t)[v3 length] >= 0x19)
    {
      unint64_t v4 = NSString;
      CFIndex v5 = objc_msgSend(v3, "substringWithRange:", 0, 24);
      uint64_t v6 = [v4 stringWithFormat:@"%@...", v5];

      uint64_t v3 = (void *)v6;
    }
    [NSString stringWithFormat:@"Page count=%ld, \"%@\"", CFArrayGetCount(self->_cgSelections), v3];
    unint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (_NSRange)previewRangeAtIndex:(unint64_t)a3 onPage:(id)a4
{
  id v5 = a4;
  if (v5 && (cgSelections = self->_cgSelections) != 0 && (CFIndex Count = CFArrayGetCount(cgSelections)) != 0)
  {
    CFIndex v8 = Count;
    CFIndex v9 = 0;
    while (1)
    {
      id v10 = [(NSMutableArray *)self->_pages objectAtIndex:v9];

      if (v10 == v5) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_7;
      }
    }
    CFArrayGetValueAtIndex(self->_cgSelections, v9);
    uint64_t TextRange = CGPDFSelectionGetTextRange();
    if (TextRange == -1) {
      NSUInteger v11 = 0;
    }
    else {
      NSUInteger v11 = v16;
    }
    if (TextRange == -1) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v12 = TextRange;
    }
  }
  else
  {
LABEL_7:
    NSUInteger v11 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v12;
  NSUInteger v14 = v11;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfSelectionUUID, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_destroyWeak((id *)&self->_document);
}

@end