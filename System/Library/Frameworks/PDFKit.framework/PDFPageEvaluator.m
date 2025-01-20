@interface PDFPageEvaluator
+ (BOOL)isPageCandidateForOCR:(id)a3;
+ (CGPDFOperatorTable)createOperatorTable;
+ (OS_dispatch_queue)asyncWorkQueue;
+ (void)isPageCandidateForOCR:(id)a3 completion:(id)a4;
- (BOOL)containsLargeImage;
- (BOOL)containsText;
- (BOOL)isPageCandidateForOCR;
- (CGPDFContentStream)contentStream;
- (CGPDFRState)rstate;
- (PDFPageEvaluator)initWithPage:(id)a3;
- (PDFPageEvaluator)initWithParent:(id)a3;
- (PDFPageEvaluator)initWithParent:(id)a3 stream:(CGPDFStream *)a4 resources:(CGPDFDictionary *)a5;
- (uint64_t)scan;
- (void)dealloc;
- (void)op_Do:(CGPDFScanner *)a3;
- (void)op_Q:(CGPDFScanner *)a3;
- (void)op_TJ:(CGPDFScanner *)a3;
- (void)op_Tj:(CGPDFScanner *)a3;
- (void)op_cm:(CGPDFScanner *)a3;
- (void)op_doublequote:(CGPDFScanner *)a3;
- (void)op_q:(CGPDFScanner *)a3;
- (void)op_singlequote:(CGPDFScanner *)a3;
- (void)scan;
- (void)setContainsLargeImage:(BOOL)a3;
- (void)setContainsText:(BOOL)a3;
- (void)stopScan:(CGPDFScanner *)a3;
@end

@implementation PDFPageEvaluator

+ (void)isPageCandidateForOCR:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  int v8 = [v6 isCandidateForOCR];
  if (v8 != 2) {
    v7[2](v7, v6, v8 == 1);
  }
  v9 = [[PDFPageEvaluator alloc] initWithPage:v6];
  v10 = [a1 asyncWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PDFPageEvaluator_isPageCandidateForOCR_completion___block_invoke;
  block[3] = &unk_264203EB0;
  v15 = v9;
  id v16 = v6;
  v17 = v7;
  v11 = v7;
  id v12 = v6;
  v13 = v9;
  dispatch_async(v10, block);
}

uint64_t __53__PDFPageEvaluator_isPageCandidateForOCR_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) scan];
  objc_msgSend(*(id *)(a1 + 40), "setCandidateForOCR:", objc_msgSend(*(id *)(a1 + 32), "isPageCandidateForOCR"));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

+ (BOOL)isPageCandidateForOCR:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isCandidateForOCR];
  if (v4 == 2)
  {
    v5 = [[PDFPageEvaluator alloc] initWithPage:v3];
    [(PDFPageEvaluator *)v5 scan];
    uint64_t v6 = [(PDFPageEvaluator *)v5 isPageCandidateForOCR];
    [v3 setCandidateForOCR:v6];
  }
  else
  {
    LOBYTE(v6) = v4 == 1;
  }

  return v6;
}

+ (CGPDFOperatorTable)createOperatorTable
{
  v2 = CGPDFOperatorTableCreate();
  if (v2)
  {
    for (uint64_t i = 0; i != 16; i += 2)
      CGPDFOperatorTableSetCallback(v2, (&operators)[i], (CGPDFOperatorCallback)(&operators)[i + 1]);
  }
  return v2;
}

+ (OS_dispatch_queue)asyncWorkQueue
{
  if (+[PDFPageEvaluator asyncWorkQueue]::onceToken != -1) {
    dispatch_once(&+[PDFPageEvaluator asyncWorkQueue]::onceToken, &__block_literal_global_4);
  }
  v2 = (void *)+[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue;

  return (OS_dispatch_queue *)v2;
}

void __34__PDFPageEvaluator_asyncWorkQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PDFKit.PDFPageEvaluator.asyncWorkQueue", attr);
  v2 = (void *)+[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue;
  +[PDFPageEvaluator asyncWorkQueue]::asyncWorkQueue = (uint64_t)v1;
}

- (PDFPageEvaluator)initWithPage:(id)a3
{
  id v4 = a3;
  v5 = [(PDFPageEvaluator *)self initWithParent:0];
  if (v5)
  {
    uint64_t v6 = CGPDFPageRetain((CGPDFPageRef)[v4 pageRef]);
    v5->_page = v6;
    if (!v6)
    {
LABEL_7:
      v15 = 0;
      goto LABEL_8;
    }
    CGRect BoxRect = CGPDFPageGetBoxRect(v6, kCGPDFCropBox);
    v5->_pageBounds = BoxRect;
    double Width = CGRectGetWidth(BoxRect);
    CGFloat Height = CGRectGetHeight(v5->_pageBounds);
    v5->_pageArea = (unint64_t)Width * (unint64_t)Height;
    if (!is_mul_ok((unint64_t)Width, (unint64_t)Height))
    {
      _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"OCR", (uint64_t)"%s: Page area would cause overflow", v8, v9, v10, v11, v12, (uint64_t)"-[PDFPageEvaluator initWithPage:]");
      goto LABEL_7;
    }
    CGPDFContentStreamRef v14 = CGPDFContentStreamCreateWithPage((CGPDFPageRef)[v4 pageRef]);
    v5->_cs = v14;
    if (!v14) {
      goto LABEL_7;
    }
  }
  v15 = v5;
LABEL_8:

  return v15;
}

- (PDFPageEvaluator)initWithParent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageEvaluator;
  v5 = [(PDFPageEvaluator *)&v10 init];
  if (!v5
    || (!v4 ? (uint64_t Copy = CGPDFRStateCreate()) : ([v4 rstate], uint64_t Copy = CGPDFRStateCreateCopy()),
        (v5->_rstate = (CGPDFRState *)Copy) != 0
     && (v5->_gstate = (CGPDFGState *)CGPDFRStateGetGState(),
         uint64_t v7 = [(id)objc_opt_class() createOperatorTable],
         (v5->_table = (CGPDFOperatorTable *)v7) != 0)))
  {
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PDFPageEvaluator)initWithParent:(id)a3 stream:(CGPDFStream *)a4 resources:(CGPDFDictionary *)a5
{
  id v8 = a3;
  uint64_t v9 = [(PDFPageEvaluator *)self initWithParent:v8];
  if (v9) {
    v9->_cs = CGPDFContentStreamCreateWithStream(a4, a5, (CGPDFContentStreamRef)[v8 contentStream]);
  }

  return v9;
}

- (void)dealloc
{
  CGPDFPageRelease(self->_page);
  CGPDFRStateRelease();
  CGPDFOperatorTableRelease(self->_table);
  CGPDFContentStreamRelease(self->_cs);
  v3.receiver = self;
  v3.super_class = (Class)PDFPageEvaluator;
  [(PDFPageEvaluator *)&v3 dealloc];
}

- (void)scan
{
}

- (void)stopScan:(CGPDFScanner *)a3
{
}

- (BOOL)isPageCandidateForOCR
{
  return self->_containsLargeImage && !self->_containsText;
}

- (void)op_q:(CGPDFScanner *)a3
{
  self->_gstate = (CGPDFGState *)CGPDFRStateGetGState();
}

- (void)op_Q:(CGPDFScanner *)a3
{
  self->_gstate = (CGPDFGState *)CGPDFRStateGetGState();
}

- (void)op_cm:(CGPDFScanner *)a3
{
  CGPDFReal v8 = 0.0;
  CGPDFReal v9 = 0.0;
  CGPDFReal v6 = 0.0;
  CGPDFReal v7 = 0.0;
  CGPDFReal value = 0.0;
  CGPDFReal v5 = 0.0;
  if (CGPDFScannerPopNumber(a3, &value)
    && CGPDFScannerPopNumber(a3, &v5)
    && CGPDFScannerPopNumber(a3, &v6)
    && CGPDFScannerPopNumber(a3, &v7)
    && CGPDFScannerPopNumber(a3, &v8)
    && CGPDFScannerPopNumber(a3, &v9))
  {
    CGPDFGStateConcatCTM();
  }
}

- (void)op_Tj:(CGPDFScanner *)a3
{
  CGPDFStringRef value = 0;
  if (CGPDFScannerPopString(a3, &value))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      [(PDFPageEvaluator *)self stopScan:a3];
    }
  }
}

- (void)op_TJ:(CGPDFScanner *)a3
{
  CGPDFArrayRef value = 0;
  if (CGPDFScannerPopArray(a3, &value))
  {
    uint64_t v6 = 0;
    CGPDFReal v7 = &v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __26__PDFPageEvaluator_op_TJ___block_invoke;
    v5[3] = &unk_264203ED8;
    v5[4] = &v6;
    CGPDFArrayApplyBlock(value, v5, 0);
    if (v7[3])
    {
      self->_containsText = 1;
      [(PDFPageEvaluator *)self stopScan:a3];
    }
    _Block_object_dispose(&v6, 8);
  }
}

BOOL __26__PDFPageEvaluator_op_TJ___block_invoke(uint64_t a1, int a2, CGPDFObjectRef object)
{
  if (CGPDFObjectGetType(object) == kCGPDFObjectTypeString)
  {
    CGPDFStringRef value = 0;
    if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, &value)) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += CGPDFStringGetLength(value);
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

- (void)op_singlequote:(CGPDFScanner *)a3
{
  CGPDFStringRef value = 0;
  if (CGPDFScannerPopString(a3, &value))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      [(PDFPageEvaluator *)self stopScan:a3];
    }
  }
}

- (void)op_doublequote:(CGPDFScanner *)a3
{
  CGPDFReal v6 = 0.0;
  CGPDFStringRef value = 0;
  CGPDFReal v5 = 0.0;
  if (CGPDFScannerPopString(a3, &value) && CGPDFScannerPopNumber(a3, &v6) && CGPDFScannerPopNumber(a3, &v5))
  {
    if (CGPDFStringGetLength(value))
    {
      self->_containsText = 1;
      [(PDFPageEvaluator *)self stopScan:a3];
    }
  }
}

- (void)op_Do:(CGPDFScanner *)a3
{
  CGPDFStringRef value = 0;
  if (CGPDFScannerPopName(a3, (const char **)&value))
  {
    ContentStream = CGPDFScannerGetContentStream(a3);
    if (ContentStream)
    {
      Resource = CGPDFContentStreamGetResource(ContentStream, "XObject", value);
      if (Resource)
      {
        CGPDFStreamRef v28 = 0;
        if (CGPDFObjectGetValue(Resource, kCGPDFObjectTypeStream, &v28))
        {
          DictionarCGFloat y = CGPDFStreamGetDictionary(v28);
          if (Dictionary)
          {
            uint64_t v8 = Dictionary;
            v27 = 0;
            if (CGPDFDictionaryGetName(Dictionary, "Subtype", (const char **)&v27))
            {
              uint64_t v9 = v27;
              if (!strcmp(v27, "Image"))
              {
                long long v25 = 0u;
                long long v26 = 0u;
                *(_OWORD *)v24 = 0u;
                CGPDFGStateGetCTM();
                memset(&v23, 0, sizeof(v23));
                v30.origin.CGFloat x = 0.0;
                v30.origin.CGFloat y = 0.0;
                v30.size.CGFloat width = 1.0;
                v30.size.CGFloat height = 1.0;
                CGRect v31 = CGRectApplyAffineTransform(v30, &v23);
                CGFloat x = v31.origin.x;
                CGFloat y = v31.origin.y;
                CGFloat width = v31.size.width;
                CGFloat height = v31.size.height;
                unint64_t v16 = (unint64_t)CGRectGetWidth(v31);
                v32.origin.CGFloat x = x;
                v32.origin.CGFloat y = y;
                v32.size.CGFloat width = width;
                v32.size.CGFloat height = height;
                double v22 = CGRectGetHeight(v32);
                if (is_mul_ok(v16, (unint64_t)v22)) {
                  self->_containsLargeImage |= v16 * (unint64_t)v22 >= self->_pageArea >> 1;
                }
                else {
                  _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"OCR", (uint64_t)"%s: Image area would cause overflow", v17, v18, v19, v20, v21, (uint64_t)"-[PDFPageEvaluator op_Do:]");
                }
              }
              else if (!strcmp(v9, "Form"))
              {
                v24[0] = 0;
                if (CGPDFDictionaryGetDictionary(v8, "Resources", v24))
                {
                  objc_super v10 = [PDFPageEvaluator alloc];
                  uint64_t v11 = [(PDFPageEvaluator *)v10 initWithParent:self stream:v28 resources:v24[0]];
                  [(PDFPageEvaluator *)v11 scan];
                  if (v11->_containsText)
                  {
                    self->_containsText = 1;
                    [(PDFPageEvaluator *)self stopScan:a3];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (CGPDFContentStream)contentStream
{
  return self->_contentStream;
}

- (CGPDFRState)rstate
{
  return self->_rstate;
}

- (BOOL)containsText
{
  return self->_containsText;
}

- (void)setContainsText:(BOOL)a3
{
  self->_containsText = a3;
}

- (BOOL)containsLargeImage
{
  return self->_containsLargeImage;
}

- (void)setContainsLargeImage:(BOOL)a3
{
  self->_containsLargeImage = a3;
}

- (uint64_t)scan
{
    return a1 + 8;
  else {
    return 0;
  }
}

@end