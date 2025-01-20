@interface CPPage
+ (void)sortByReadingOrder:(id)a3;
- (BOOL)hasTextLines;
- (BOOL)hasZones;
- (BOOL)isStartOfSection;
- (BOOL)populatePDFLayout:(CGPDFLayout *)a3;
- (CGPDFLayout)layout;
- (CGPDFPage)pdfPage;
- (CGRect)pageCropBox;
- (CPPDFClipBuffer)clipBuffer;
- (CPPDFContext)PDFContext;
- (CPPage)init;
- (CPPage)initWithPDFPage:(CGPDFPage *)a3;
- (float)complexity;
- (id)annotationsOnPage;
- (id)background;
- (id)bodyZone;
- (id)children;
- (id)columnsOnPage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)graphicsOnPage;
- (id)hitTest;
- (id)imagesOnPage;
- (id)parent;
- (id)shapesOnPage;
- (id)textLinesOnPage;
- (int)pageNumber;
- (int)rotation;
- (unsigned)setCellPositionsOf:(id)a3 from:(unsigned int)a4;
- (unsigned)setGraphicPositions:(id)a3 from:(unsigned int)a4;
- (unsigned)setPositionsOf:(id)a3 from:(unsigned int)a4;
- (unsigned)setReadingOrder:(id)a3 from:(unsigned int)a4;
- (unsigned)traverse:(id)a3 ordinal:(unsigned int)a4;
- (void)accept:(id)a3;
- (void)addAnnotation:(id)a3;
- (void)addColumns:(id)a3;
- (void)addImage:(id)a3;
- (void)addShape:(id)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)layDownObjectsOnPage;
- (void)layDownObjectsOnPageOld;
- (void)reconstruct;
- (void)restoreBackGroundObjectToPage;
- (void)setBackground:(id)a3;
- (void)setComplexity:(float)a3;
- (void)setHasTextLines:(BOOL)a3;
- (void)setHasZones:(BOOL)a3;
- (void)setIsStartOfSection:(BOOL)a3;
- (void)setPDFContext:(CPPDFContext *)a3;
- (void)setPageCropBox:(CGRect)a3;
- (void)setPageNumber:(int)a3;
- (void)setRotation:(int)a3;
- (void)sortByReadingOrder;
@end

@implementation CPPage

- (void)addColumns:(id)a3
{
  columnsOnPage = self->columnsOnPage;
  if (!columnsOnPage)
  {
    columnsOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->columnsOnPage = columnsOnPage;
  }

  [(NSMutableArray *)columnsOnPage addObjectsFromArray:a3];
}

- (id)columnsOnPage
{
  return self->columnsOnPage;
}

- (id)textLinesOnPage
{
  id result = self->textLinesOnPage;
  if (!result)
  {
    self->textLinesOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [(CPObject *)self descendantsOfClass:objc_opt_class() to:self->textLinesOnPage];
    return self->textLinesOnPage;
  }
  return result;
}

- (void)layDownObjectsOnPageOld
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  [(CPObject *)self descendantsOfClass:objc_opt_class() to:obj];
  int v3 = [obj count];
  uint64_t v4 = (v3 - 1);
  if (v3 - 1 >= 0)
  {
    do
    {
      v5 = (void *)[obj objectAtIndex:v4];
      int v6 = [v5 count];
      uint64_t v7 = 0;
      if (v6)
      {
        while (1)
        {
          [v5 childAtIndex:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          uint64_t v7 = (v7 + 1);
          if (v6 == v7) {
            goto LABEL_8;
          }
        }
      }
      if (v7 == v6) {
LABEL_8:
      }
        [obj removeObjectAtIndex:v4];
    }
    while (v4-- > 0);
  }
  if ([obj count])
  {
    [obj sortUsingFunction:compareZoneReadingOrder context:0];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v24) {
      goto LABEL_33;
    }
    uint64_t v10 = 0;
    uint64_t v23 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v12 setChunkPosition:v10];
        int v13 = [v12 count];
        if (v13)
        {
          int v14 = v13;
          uint64_t v15 = 0;
          while (1)
          {
            v16 = (void *)[v12 childAtIndex:v15];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_22;
            }
LABEL_23:
            uint64_t v15 = (v15 + 1);
            if (v14 == v15) {
              goto LABEL_24;
            }
          }
          v16 = (void *)[v16 firstChild];
LABEL_22:
          [v9 addObject:v16];
          goto LABEL_23;
        }
LABEL_24:
        uint64_t v10 = (v10 + 1);
        [v9 sortUsingFunction:compareLayoutReadingOrder context:0];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v17 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v26 != v19) {
                objc_enumerationMutation(v9);
              }
              v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              [v21 setChunkPosition:v10];
              uint64_t v10 = [(CPPage *)self setPositionsOf:v21 from:(v10 + 1)];
            }
            uint64_t v18 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v18);
        }
        [v9 removeAllObjects];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v24)
      {
LABEL_33:

        return;
      }
    }
  }
}

- (void)sortByReadingOrder
{
}

- (void)layDownObjectsOnPage
{
  id v3 = [(CPPage *)self bodyZone];

  [(CPPage *)self setReadingOrder:v3 from:0];
}

- (unsigned)setReadingOrder:(id)a3 from:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  id v21 = a3;
  int v8 = [a3 count];
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = [a3 childAtIndex:v10];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [v7 addObject:v11];
      }
      uint64_t v10 = (v10 + 1);
    }
    while (v9 != v10);
  }
  if (([v7 count] & 0xFFFFFFFELL) != 0) {
    [v7 sortUsingFunction:compareKeyOrder context:0];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v7);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = [(CPPage *)self setReadingOrder:v16 from:v4];
LABEL_22:
          uint64_t v4 = v17;
          goto LABEL_23;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = [(CPPage *)self setPositionsOf:v16 from:v4];
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v17 = [(CPPage *)self setCellPositionsOf:v16 from:v4];
          }
          else {
            uint64_t v17 = [(CPPage *)self setGraphicPositions:v16 from:v4];
          }
          goto LABEL_22;
        }
        uint64_t v18 = -[CPPage setPositionsOf:from:](self, "setPositionsOf:from:", [v16 firstChild], v4);
        uint64_t v4 = (v18 + 1);
        [v16 setChunkPosition:v18];
LABEL_23:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v19 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v13 = v19;
    }
    while (v19);
  }
  [v21 setChunkPosition:v4];

  return v4 + 1;
}

- (unsigned)setGraphicPositions:(id)a3 from:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = [a3 count];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      uint64_t v4 = -[CPPage setGraphicPositions:from:](self, "setGraphicPositions:from:", [a3 childAtIndex:v9], v4);
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
  [a3 setChunkPosition:v4];
  return v4 + 1;
}

- (unsigned)setCellPositionsOf:(id)a3 from:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v7 = [a3 count];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      uint64_t v4 = -[CPPage setReadingOrder:from:](self, "setReadingOrder:from:", [a3 childAtIndex:v9], v4);
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
  [a3 setChunkPosition:v4];
  return v4 + 1;
}

- (unsigned)setPositionsOf:(id)a3 from:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = [a3 count];
  if (v6)
  {
    int v7 = v6;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = (void *)[a3 childAtIndex:v8];
      int v10 = [v9 count];
      if (v10)
      {
        int v11 = v10;
        uint64_t v12 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend(v9, "childAtIndex:", v12), "setChunkPosition:", (v4 + v12));
          uint64_t v12 = (v12 + 1);
        }
        while (v11 != v12);
        uint64_t v4 = (v4 + v12);
      }
      uint64_t v13 = (v4 + 1);
      [v9 setChunkPosition:v4];
      uint64_t v8 = (v8 + 1);
      uint64_t v4 = v13;
    }
    while (v8 != v7);
  }
  else
  {
    uint64_t v13 = v4;
  }
  [a3 setChunkPosition:v13];
  return v13 + 1;
}

- (unsigned)traverse:(id)a3 ordinal:(unsigned int)a4
{
  uint64_t v6 = a4 + 1;
  [a3 setChunkPosition:*(void *)&a4];
  int v7 = [a3 count];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = 0;
    do
    {
      uint64_t v6 = -[CPPage traverse:ordinal:](self, "traverse:ordinal:", [a3 childAtIndex:v9], v6);
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
  return v6;
}

- (id)children
{
  return self->super.super.children;
}

- (void)restoreBackGroundObjectToPage
{
  background = self->background;
  if (background) {
    [(CPChunk *)self add:background atIndex:0];
  }
}

- (void)setBackground:(id)a3
{
  background = self->background;
  if (background != a3)
  {

    self->background = (CPChunk *)a3;
  }
}

- (id)background
{
  return self->background;
}

- (void)setRotation:(int)a3
{
  if (a3 / -90 >= 0) {
    int v3 = -((a3 / -90) & 3);
  }
  else {
    int v3 = (a3 / 90) & 3;
  }
  if (v3 >= 0) {
    int v4 = 90 * v3;
  }
  else {
    int v4 = 90 * v3 + 360;
  }
  self->rotation = v4;
}

- (int)rotation
{
  return self->rotation;
}

- (void)setIsStartOfSection:(BOOL)a3
{
  self->isStartOfSection = a3;
}

- (BOOL)isStartOfSection
{
  return self->isStartOfSection;
}

- (void)setHasTextLines:(BOOL)a3
{
  self->hasTextLines = a3;
}

- (BOOL)hasTextLines
{
  return self->hasTextLines;
}

- (id)bodyZone
{
  int v3 = [(NSMutableArray *)self->super.super.children count];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v3;
  while (1)
  {
    uint64_t v6 = (void *)[(NSMutableArray *)self->super.super.children objectAtIndex:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (v5 == ++v4) {
      return 0;
    }
  }
  return v6;
}

- (BOOL)hasZones
{
  return self->hasZones;
}

- (void)setHasZones:(BOOL)a3
{
  self->hasZones = a3;
}

- (id)graphicsOnPage
{
  return self->graphicsOnPage;
}

- (id)annotationsOnPage
{
  return self->annotationsOnPage;
}

- (void)addAnnotation:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  annotationsOnPage = self->annotationsOnPage;

  [(NSMutableArray *)annotationsOnPage addObject:a3];
}

- (id)imagesOnPage
{
  return self->imagesOnPage;
}

- (void)addImage:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  imagesOnPage = self->imagesOnPage;

  [(NSMutableArray *)imagesOnPage addObject:a3];
}

- (id)shapesOnPage
{
  return self->shapesOnPage;
}

- (void)addShape:(id)a3
{
  -[NSMutableArray addObject:](self->graphicsOnPage, "addObject:");
  shapesOnPage = self->shapesOnPage;

  [(NSMutableArray *)shapesOnPage addObject:a3];
}

- (id)parent
{
  return 0;
}

- (void)setPageNumber:(int)a3
{
  self->pageNumber = a3;
}

- (int)pageNumber
{
  return self->pageNumber;
}

- (void)setComplexity:(float)a3
{
  self->complexity = a3;
}

- (float)complexity
{
  return self->complexity;
}

- (void)accept:(id)a3
{
}

- (CGRect)pageCropBox
{
  double x = self->pageCropBox.origin.x;
  double y = self->pageCropBox.origin.y;
  double width = self->pageCropBox.size.width;
  double height = self->pageCropBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPageCropBox:(CGRect)a3
{
  self->pageCropBodouble x = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPPage;
  uint64_t v4 = [(CPChunk *)&v8 copyWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    v4[3] = self->super.super.document;
    pdfPage = self->pdfPage;
    if (pdfPage) {
      CFRetain(self->pdfPage);
    }
    v5[28] = pdfPage;
    v5[26] = self->pdfContext;
    *((unsigned char *)v5 + 216) = 0;
    v5[19] = [(CPChunk *)self->background copy];
    v5[21] = [(NSMutableArray *)self->shapesOnPage mutableCopy];
    v5[22] = [(NSMutableArray *)self->imagesOnPage mutableCopy];
    v5[25] = [(NSMutableArray *)self->annotationsOnPage mutableCopy];
    v5[23] = [(NSMutableArray *)self->graphicsOnPage mutableCopy];
    v5[29] = [(NSMutableArray *)self->textLinesOnPage mutableCopy];
    v5[31] = self->hitTest;
  }
  return v5;
}

- (CPPDFContext)PDFContext
{
  return self->pdfContext;
}

- (void)setPDFContext:(CPPDFContext *)a3
{
  self->pdfContext = a3;
  self->contextOwner = 1;
}

- (void)reconstruct
{
  if (self->pdfPage)
  {
    p_mutedouble x = &self->mutex;
    pthread_mutex_lock(&self->mutex);
    if (!self->reconstructed)
    {
      pdfPage = self->pdfPage;
      CGRect BoxRect = CGPDFPageGetBoxRect(pdfPage, kCGPDFCropBox);
      double x = BoxRect.origin.x;
      double y = BoxRect.origin.y;
      double width = BoxRect.size.width;
      double v8 = fabs(BoxRect.size.height);
      if (fabs(BoxRect.size.width) >= 1.0 && v8 >= 1.0)
      {
        double height = BoxRect.size.height;
        [(CPPage *)self setRotation:CGPDFPageGetRotationAngle(pdfPage)];
        -[CPPage setPageCropBox:](self, "setPageCropBox:", x, y, width, height);
        if (pdfPage)
        {
          int v11 = CPPDFContextCreate();
          if (v11)
          {
            *(CGRect *)v11->i8 = CGPDFPageGetBoxRect(pdfPage, kCGPDFCropBox);
            pthread_mutex_lock((pthread_mutex_t *)((char *)pdfPage + 216));
            __int32 v12 = *((_DWORD *)pdfPage + 12);
            pthread_mutex_unlock((pthread_mutex_t *)((char *)pdfPage + 216));
            v11[285].i32[1] = v12;
            v11[286] = (int32x2_t)pdfPage;
            v11[293] = 0;
            uint64_t v13 = CGPDFOperatorTableCreate();
            AddPdfOperators(v13);
            uint64_t v14 = (CGPDFContentStream *)CGPDFContentStreamCreate(*((void *)pdfPage + 5));
            uint64_t v15 = v11[257].u32[0];
            v11[257].i32[0] = v15 + 1;
            v11[v15 + 7] = (int32x2_t)v14;
            v16 = CGPDFScannerCreate(v14, v13, v11);
            *(unsigned char *)(*(void *)&v11[5] + 8) = 1;
            CPPDFContextSaveGState((uint64_t)v11);
            *(unsigned char *)(*(void *)&v11[5] + 8) = 0;
            CGPDFScannerScan(v16);
            CPPDFContextRestoreGState((uint64_t)v11);
            int32x2_t v17 = v11[5];
            if (v17) {
              *(unsigned char *)(*(void *)&v17 + 8) = 0;
            }
            if (v14) {
              CFRelease(v14);
            }
            if (v16) {
              CFRelease(v16);
            }
            if (v13) {
              CFRelease(v13);
            }
          }
        }
        else
        {
          int v11 = 0;
        }
        [(CPPage *)self setPDFContext:v11];
        for (int32x2_t i = v11[270]; *(void *)&i < *(void *)&v11[271]; *(void *)&i += 184)
        {
          uint64_t v19 = [[CPImage alloc] initWithPDFImage:*(void *)&i];
          [(CPGraphicObject *)v19 setClipIndex:*(unsigned int *)(*(void *)&i + 64)];
          [(CPPage *)self addImage:v19];
        }
        int32x2_t v20 = v11[264];
        int32x2_t v21 = v11[265];
        if (*(void *)&v20 < *(void *)&v21)
        {
          while (1)
          {
            int v22 = *(_DWORD *)(*(void *)&v20 + 88);
            if (v22 != 4) {
              break;
            }
LABEL_36:
            *(void *)&v20 += 216;
            if (*(void *)&v20 >= *(void *)&v21) {
              goto LABEL_37;
            }
          }
          long long v23 = *(const CGPath **)(*(void *)&v20 + 96);
          if (v23)
          {
            uint64_t info = 0x100000000;
            CGPathApply(v23, &info, (CGPathApplierFunction)countSubpaths);
            uint64_t v24 = info;
            if info == 1 || (*(_DWORD *)(*(void *)&v20 + 88)) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v24 = 0;
            if (v22)
            {
LABEL_26:
              long long v25 = [[CPShape alloc] initWithPDFShape:*(void *)&v20];
              [(CPGraphicObject *)v25 setClipIndex:*(unsigned int *)(*(void *)&v20 + 64)];
              [(CPPage *)self addShape:v25];

LABEL_35:
              int32x2_t v21 = v11[265];
              goto LABEL_36;
            }
          }
          long long v26 = malloc_type_malloc(0xD8uLL, 0x1060040AFBA4986uLL);
          long long v27 = *(_OWORD *)(*(void *)&v20 + 16);
          *long long v26 = *(_OWORD *)*(void *)&v20;
          v26[1] = v27;
          long long v28 = *(_OWORD *)(*(void *)&v20 + 80);
          long long v30 = *(_OWORD *)(*(void *)&v20 + 32);
          long long v29 = *(_OWORD *)(*(void *)&v20 + 48);
          v26[4] = *(_OWORD *)(*(void *)&v20 + 64);
          v26[5] = v28;
          v26[2] = v30;
          v26[3] = v29;
          long long v31 = *(_OWORD *)(*(void *)&v20 + 144);
          long long v33 = *(_OWORD *)(*(void *)&v20 + 96);
          long long v32 = *(_OWORD *)(*(void *)&v20 + 112);
          v26[8] = *(_OWORD *)(*(void *)&v20 + 128);
          v26[9] = v31;
          v26[6] = v33;
          v26[7] = v32;
          long long v35 = *(_OWORD *)(*(void *)&v20 + 176);
          long long v34 = *(_OWORD *)(*(void *)&v20 + 192);
          long long v36 = *(_OWORD *)(*(void *)&v20 + 160);
          *((void *)v26 + 26) = *(void *)(*(void *)&v20 + 208);
          v26[11] = v35;
          v26[12] = v34;
          v26[10] = v36;
          v37 = (const CGPath **)malloc_type_malloc(8 * v24, 0x2004093837F09uLL);
          v38 = *(const CGPath **)(*(void *)&v20 + 96);
          if (v38)
          {
            uint64_t v54 = 1;
            uint64_t info = (uint64_t)v37;
            uint64_t v51 = 0;
            v52 = 0;
            unint64_t v53 = v24;
            CGPathApply(v38, &info, (CGPathApplierFunction)createSubpaths);
            uint64_t v39 = HIDWORD(v53);
            if (HIDWORD(v53))
            {
              v40 = v37;
              do
              {
                v41 = *v40;
                *((void *)v26 + 12) = *v40;
                *(CGRect *)long long v26 = CGPathGetPathBoundingBox(v41);
                v42 = [[CPShape alloc] initWithPDFShape:v26];
                v43 = (const void *)*((void *)v26 + 12);
                if (v43) {
                  CFRelease(v43);
                }
                [(CPGraphicObject *)v42 setClipIndex:*((unsigned int *)v26 + 16)];
                [(CPPage *)self addShape:v42];

                ++v40;
                --v39;
              }
              while (v39);
            }
          }
          free(v37);
          free(v26);
          goto LABEL_35;
        }
LABEL_37:
        v44 = [(CPPage *)self pdfPage];
        uint64_t info = MEMORY[0x1E4F143A8];
        uint64_t v51 = 3221225472;
        v52 = __MapContextToPage_block_invoke;
        unint64_t v53 = (unint64_t)&unk_1E52B3788;
        uint64_t v54 = (uint64_t)self;
        CGPDFPageEnumerateAnnotations((uint64_t)v44, (uint64_t)&info);
        v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[CPPage graphicsOnPage](self, "graphicsOnPage"));
        [(CPChunk *)self setChildren:v45];
      }
      v46 = objc_alloc_init(CPZoneMaker);
      [(CPZoneMaker *)v46 makeZonesIn:self];

      id v47 = [(CPPage *)self bodyZone];
      if (v47)
      {
        id v48 = v47;
        v49 = objc_alloc_init(CPBuilder);
        [(CPBuilder *)v49 prepareZone:v48];
      }
      ReconstructZone([(CPPage *)self bodyZone]);
      +[CPListMaker makeListsInPage:self];
      +[CPLineBreaker breakLinesInPage:self];
      +[CPPreformatter preformatInPage:self];
      +[CPTableMaker makeTablesInPage:self];
      +[CPZoneFilter filterZonesInPage:self];
      [(CPPage *)self layDownObjectsOnPage];
      [(CPPage *)self sortByReadingOrder];
      self->reconstructed = 1;
    }
    pthread_mutex_unlock(p_mutex);
  }
}

- (CGPDFPage)pdfPage
{
  return self->pdfPage;
}

- (void)dealloc
{
  [(CPPage *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPPage;
  [(CPObject *)&v3 dealloc];
}

- (void)finalize
{
  [(CPPage *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPPage;
  [(CPPage *)&v3 finalize];
}

- (void)dispose
{
  if (self->pdfPage)
  {
    [(CPObject *)self disposeDescendants];
    pdfContext = self->pdfContext;
    if (pdfContext && self->contextOwner)
    {
      CPPDFContextRelease((uint64_t)pdfContext);
      self->pdfContext = 0;
    }
    layout = self->_layout;
    if (layout)
    {
      CFRelease(layout);
      self->_layout = 0;
    }
    pdfPage = self->pdfPage;
    if (pdfPage) {
      CFRelease(pdfPage);
    }
    pthread_mutex_destroy(&self->mutex);
    self->pdfPage = 0;
  }
}

- (CPPage)initWithPDFPage:(CGPDFPage *)a3
{
  uint64_t v4 = [(CPPage *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->pdfPage = a3;
    if (a3)
    {
      CFRetain(a3);
      pdfPage = v5->pdfPage;
      if (pdfPage) {
        LODWORD(pdfPage) = *(_DWORD *)(*((void *)pdfPage + 5) + 8);
      }
    }
    else
    {
      LODWORD(pdfPage) = 0;
    }
    v5->pageNumber = (int)pdfPage;
    pthread_mutex_init(&v5->mutex, 0);
  }
  return v5;
}

- (CPPage)init
{
  v5.receiver = self;
  v5.super_class = (Class)CPPage;
  v2 = [(CPChunk *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->hasTextLines = 0;
    v2->isStartOfSection = 0;
    v2->complexitdouble y = 0.0;
    v2->shapesOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->imagesOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->annotationsOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->graphicsOnPage = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->textLinesOnPage = 0;
    v3->pdfContext = 0;
    v3->pdfPage = 0;
    v3->_layout = 0;
    v3->columnsOnPage = 0;
    v3->reconstructed = 0;
    v3->hitTest = 0;
  }
  return v3;
}

+ (void)sortByReadingOrder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [a3 sortUsingSelector:sel_compareChunkPosition_];
      }
      int v4 = [a3 count];
      if (v4)
      {
        int v5 = v4;
        uint64_t v6 = 0;
        do
        {
          +[CPPage sortByReadingOrder:](CPPage, "sortByReadingOrder:", [a3 childAtIndex:v6]);
          uint64_t v6 = (v6 + 1);
        }
        while (v5 != v6);
      }
    }
  }
}

- (CGPDFLayout)layout
{
  CGRect result = (CGPDFLayout *)self->_layout;
  if (!result)
  {
    BOOL v4 = CGPDFCountElementsInCPChunk(self);
    if (!CGPDFLayoutGetTypeID_id) {
      CGPDFLayoutGetTypeID_id = _CFRuntimeRegisterClass();
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (!Instance) {
      goto LABEL_11;
    }
    uint64_t v6 = Instance;
    *(void *)(Instance + 16) = 0;
    if (v4 < 1) {
      int v7 = 0;
    }
    else {
      int v7 = malloc_type_malloc(24 * v4, 0x1020040EDCEB4C7uLL);
    }
    *(void *)(v6 + 24) = v7;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 40) = v4;
    *(void *)(v6 + 48) = 0;
    *(void *)(v6 + 56) = 0;
    *(void *)(v6 + 64) = 0;
    *(unsigned char *)(v6 + 72) = 0;
    *(void *)(v6 + 80) = 0;
    *(void *)(v6 + 88) = 0;
    *(_DWORD *)(v6 + 96) = 0;
    *(void *)(v6 + 104) = 0;
    *(void *)(v6 + 112) = 0;
    pthread_mutex_init((pthread_mutex_t *)(v6 + 120), 0);
    self->_layout = (void *)v6;
    *(void *)(v6 + 16) = [(CPPage *)self pdfPage];
    BOOL v8 = [(CPPage *)self populatePDFLayout:self->_layout];
    CGRect result = (CGPDFLayout *)self->_layout;
    if (!v8)
    {
      if (result) {
        CFRelease(result);
      }
LABEL_11:
      CGRect result = 0;
      self->_layout = 0;
    }
  }
  return result;
}

- (BOOL)populatePDFLayout:(CGPDFLayout *)a3
{
  unsigned int v10 = 0;
  CFTypeRef cf = 0;
  CFTypeRef v9 = 0;
  int v5 = (int *)CGPDFNodeMakeFromCPChunk(self, (uint64_t)a3, 0, (CFDictionaryRef *)&v9, (CFDictionaryRef *)&cf);
  if (v5) {
    char v6 = CGPDFNodePopulateFromCPChunk(v5, self, (uint64_t)a3, &v10, (CFDictionaryRef *)&v9, (CFDictionaryRef *)&cf);
  }
  else {
    char v6 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v6;
}

- (id)hitTest
{
  id result = self->hitTest;
  if (!result)
  {
    id result = [[CPHitTest alloc] initWithPage:self];
    self->hitTest = result;
  }
  return result;
}

- (CPPDFClipBuffer)clipBuffer
{
  return &self->pdfContext->var9;
}

@end