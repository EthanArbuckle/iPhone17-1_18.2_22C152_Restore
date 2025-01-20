@interface PDFPage
+ (BOOL)_getBooleanProperty:(id)a3 forKey:(id)a4 withDefault:(BOOL)a5;
+ (BOOL)isExcludingAKAnnotationRenderingForThisThread;
+ (BOOL)isNativeRotationDrawingEnabledForThisThread;
+ (BOOL)shouldHideAnnotationsForThisThread;
+ (BOOL)useLegacyImageHandling;
+ (CGPDFPage)_createPageRefFromImage:(CGImage *)a3 andOptions:(id)a4;
+ (OS_dispatch_queue)displayListCreationQueue;
+ (id)fontWithPDFFont:(CGPDFFont *)a3 size:(float)a4;
+ (void)setExcludingAKAnnotationRenderingForThisThread:(BOOL)a3;
+ (void)setNativeRotationDrawingEnabledForThisThread:(BOOL)a3;
+ (void)setShouldHideAnnotationsForThisThread:(BOOL)a3;
- (BOOL)_writeToConsumer:(CGDataConsumer *)a3;
- (BOOL)akDidSetupRealPageModelController;
- (BOOL)colorWidgetBackgrounds;
- (BOOL)columnAtPoint:(CGPoint)a3;
- (BOOL)columnAtPointIfAvailable:(CGPoint)a3;
- (BOOL)containsDetectedFormFields;
- (BOOL)containsFormFields;
- (BOOL)containsFormFieldsWithContentType;
- (BOOL)didChangeBounds;
- (BOOL)didPerformFormDetection;
- (BOOL)didPerformOCR;
- (BOOL)disableUndoManagerForAK;
- (BOOL)displaysAnnotations;
- (BOOL)hasArtBox;
- (BOOL)hasBleedBox;
- (BOOL)hasCropBox;
- (BOOL)hasPopups;
- (BOOL)hasTrimBox;
- (BOOL)isBookmarked;
- (BOOL)isTextFromOCR;
- (BOOL)pathIntersectsWithRedactionPath:(CGPath *)a3;
- (BOOL)rectIntersectsWithRedactionPath:(CGRect)a3;
- (BOOL)requestedOCR;
- (BOOL)setPageRef:(CGPDFPage *)a3;
- (CGAffineTransform)getDrawingTransformForBox:(SEL)a3;
- (CGColor)pageBackgroundColorHint;
- (CGDisplayList)_createDisplayListTrackingGlyphs:(BOOL)a3;
- (CGDisplayList)copyDisplayList;
- (CGDisplayList)createDisplayListForFormDetection;
- (CGImage)_newCGImageWithBox:(int64_t)a3 bitmapSize:(PDFSizeIntegral)a4 scale:(double)a5 offset:(CGPoint)a6 colorSpace:(CGColorSpace *)a7 backgroundColor:(id)a8 withRotation:(BOOL)a9 withAntialiasing:(BOOL)a10 withAnnotations:(BOOL)a11 withBookmark:(BOOL)a12 withOptions:(id)a13 withDelegate:(id)a14;
- (CGPDFLayout)pageLayout;
- (CGPDFLayout)pageLayoutIfAvail;
- (CGPDFPageRef)pageRef;
- (CGPath)createRedactionPath;
- (CGRect)boundsForBox:(PDFDisplayBox)box;
- (CGRect)characterBoundsAtIndex:(NSInteger)index;
- (CGRect)columnFrameAtPoint:(CGPoint)a3;
- (Class)annotationSubclassForSubtype:(id)a3;
- (NSAttributedString)attributedString;
- (NSData)dataRepresentation;
- (NSInteger)characterIndexAtPoint:(CGPoint)point;
- (NSInteger)rotation;
- (NSString)label;
- (NSString)string;
- (NSUInteger)numberOfCharacters;
- (PDFAnnotation)annotationAtPoint:(CGPoint)point;
- (PDFDetectedForm)detectedForm;
- (PDFDocument)document;
- (PDFPage)init;
- (PDFPage)initWithCGImage:(CGImage *)a3 options:(id)a4;
- (PDFPage)initWithImage:(UIImage *)image;
- (PDFPage)initWithImage:(UIImage *)image options:(NSDictionary *)options;
- (PDFPage)initWithImageSource:(CGImageSource *)a3;
- (PDFPage)initWithPageNumber:(unint64_t)a3 pageRect:(CGRect)a4 rotation:(int64_t)a5;
- (PDFPage)initWithPageRef:(CGPDFPage *)a3;
- (PDFSelection)selectionForLineAtPoint:(CGPoint)point;
- (PDFSelection)selectionForRange:(NSRange)range;
- (PDFSelection)selectionForRect:(CGRect)rect;
- (PDFSelection)selectionForWordAtPoint:(CGPoint)point;
- (PDFSelection)selectionFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint;
- (UIImage)thumbnailOfSize:(CGSize)size forBox:(PDFDisplayBox)box;
- (__CFDictionary)gcCreateBoxDictionary;
- (char)isCandidateForFormDetection;
- (char)isCandidateForOCR;
- (id)_createAttributedString;
- (id)_rvItemAtPoint:(CGPoint)a3;
- (id)akPageAdaptor;
- (id)annotationAtRect:(CGRect)a3;
- (id)annotationChanges;
- (id)annotationForDetectedFormField:(id)a3;
- (id)annotationWithUUID:(id)a3;
- (id)annotationsForFieldName:(id)a3;
- (id)annotationsIfAvail;
- (id)applicationDataWithName:(id)a3;
- (id)changedAnnotations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataDetectorResults;
- (id)debugQuickLookObject;
- (id)description;
- (id)detectedAnnotations;
- (id)detectedFormFieldForAnnotation:(id)a3;
- (id)fetchAnnotationFromTaggedNodeRef:(CGPDFTaggedNode *)a3;
- (id)formFieldGroupForAnnotation:(id)a3;
- (id)imageOfSize:(CGSize)a3 forBox:(int64_t)a4 withOptions:(id)a5;
- (id)lastAnnotationChange;
- (id)lazilyLoadAnnotations;
- (id)pdfScannerResultAtPoint:(CGPoint)a3;
- (id)pdfScannerResultAtPoint:(CGPoint)a3 onPageLayer:(id)a4;
- (id)rvItemAtPoint:(CGPoint)a3;
- (id)rvItemAtPoint:(CGPoint)a3 onPageLayer:(id)a4;
- (id)rvItemWithPDFScannerResult:(id)a3;
- (id)scannedAnnotationAtPoint:(CGPoint)a3;
- (id)selectionForAll;
- (id)selectionForCharacterAtPoint:(CGPoint)a3;
- (id)selectionForCodeRange:(_NSRange)a3;
- (id)selectionForRangeCommon:(_NSRange)a3 isCodeRange:(BOOL)a4;
- (id)selectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 type:(int)a5;
- (id)selectionFromPointToBottom:(CGPoint)a3 type:(int)a4;
- (id)selectionFromTopToPoint:(CGPoint)a3 type:(int)a4;
- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5;
- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5 withAnnotations:(BOOL)a6;
- (id)view;
- (int64_t)areaOfInterestAtPoint:(CGPoint)a3;
- (int64_t)characterIndexNearestPoint:(CGPoint)a3;
- (unint64_t)_documentIndex;
- (unint64_t)detectedFormFieldsRecognitionConfidence;
- (unint64_t)pageNumber;
- (void)_addBox:(int)a3 toDictionary:(__CFDictionary *)a4 offset:(CGPoint)a5;
- (void)_addWidgetAnnotationToLookupDictionary:(id)a3;
- (void)_buildPageLayout;
- (void)_commonInit;
- (void)_createRetainedDisplayList;
- (void)_drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)_drawBookmarkInContext:(CGContext *)a3;
- (void)_postAnnotationsChangedNotificationCoalesced;
- (void)_releaseDisplayList;
- (void)_removeWidgetAnnotationFromLookupDictionary:(id)a3;
- (void)_scanData:(id)a3;
- (void)addAnnotation:(PDFAnnotation *)annotation;
- (void)addAnnotation:(id)a3 withUndo:(BOOL)a4;
- (void)addAnnotationFormField:(id)a3;
- (void)addDetectedAnnotations:(id)a3;
- (void)addFormFieldGroup:(id)a3;
- (void)addRedactionFromRectangularSelectionWithRect:(CGRect)a3;
- (void)addedAnnotation:(id)a3 forFormField:(id)a4;
- (void)changedAnnotation:(id)a3;
- (void)clearAnnotationChanges;
- (void)dealloc;
- (void)drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4 passingTest:(id)a5;
- (void)drawWithBox:(PDFDisplayBox)box toContext:(CGContextRef)context;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 isThumbnail:(BOOL)a5;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5;
- (void)enableUndoManagerForAK:(BOOL)a3;
- (void)ensureDisplayList;
- (void)enumerateApplicationDataUsingBlock:(id)a3;
- (void)fetchAnnotationsWithCompletion:(id)a3 deliveredOnQueue:(id)a4;
- (void)fetchPageLayoutWithCompletion:(id)a3 deliveredOnQueue:(id)a4;
- (void)getAnnotations;
- (void)getDisplayListWithCompletion:(id)a3 onQueue:(id)a4;
- (void)insertAnnotation:(id)a3 atIndex:(int64_t)a4;
- (void)postAnnotationsChangedNotification;
- (void)postPageDidChangeBoundsNotification;
- (void)postPageDidRotateNotification;
- (void)printActivePageAnnotations;
- (void)purgeAll;
- (void)purgePageLayout;
- (void)removeAnnotation:(PDFAnnotation *)annotation;
- (void)removeAnnotation:(id)a3 atIndex:(int64_t)a4;
- (void)removeAnnotation:(id)a3 withUndo:(BOOL)a4;
- (void)removeFromDetectedAnnotations:(id)a3;
- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4;
- (void)resetChangedAnnotations;
- (void)setAKDidSetupRealPageModelController:(BOOL)a3;
- (void)setApplicationData:(id)a3 withName:(id)a4;
- (void)setBookmarked:(BOOL)a3;
- (void)setBookmarked:(BOOL)a3 updateBookmarks:(BOOL)a4;
- (void)setBounds:(CGRect)bounds forBox:(PDFDisplayBox)box;
- (void)setCandidateForOCR:(char)a3;
- (void)setColorWidgetBackgrounds:(BOOL)a3;
- (void)setDetectedForm:(id)a3;
- (void)setDetectedFormFieldsRecognitionConfidence:(unint64_t)a3;
- (void)setDidPerformFormDetection:(BOOL)a3;
- (void)setDidPerformOCR:(BOOL)a3;
- (void)setDisplaysAnnotations:(BOOL)displaysAnnotations;
- (void)setDisplaysMarkupAnnotations:(BOOL)a3;
- (void)setDocument:(id)a3;
- (void)setExtraContentStream:(CGPDFStream *)a3 steamDocument:(CGPDFDocument *)a4;
- (void)setRotation:(NSInteger)rotation;
- (void)setView:(id)a3;
- (void)setupAKPageAdaptorIfNecessary;
- (void)transformContext:(CGContextRef)context forBox:(PDFDisplayBox)box;
@end

@implementation PDFPage

+ (OS_dispatch_queue)displayListCreationQueue
{
  if (displayListCreationQueue_onceToken != -1) {
    dispatch_once(&displayListCreationQueue_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)displayListCreationQueue_displayListCreationQueue;

  return (OS_dispatch_queue *)v2;
}

void __35__PDFPage_displayListCreationQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PDFKit.PDFPage.displayListCreationQueue", attr);
  v2 = (void *)displayListCreationQueue_displayListCreationQueue;
  displayListCreationQueue_displayListCreationQueue = (uint64_t)v1;
}

+ (BOOL)useLegacyImageHandling
{
  unsigned int v2 = NSVersionOfLinkTimeLibrary("PDFKit");
  if (v2 != -1) {
    return v2 >> 18 < 0x113;
  }

  return GetDefaultsWriteValue(@"PDFKit2_PDFPageUseLegacyImageHandling", 0);
}

- (id)akPageAdaptor
{
  return self->_akPageAdaptor;
}

- (PDFPage)initWithPageRef:(CGPDFPage *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDFPage;
  v4 = [(PDFPage *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(PDFPage *)v4 _commonInit];
    [(PDFPage *)v5 setPageRef:a3];
    v5->_pageNumber = CGPDFPageGetPageNumber(a3);
    v5->_isFullyConstructed = 1;
  }
  return v5;
}

- (PDFPage)initWithImageSource:(CGImageSource *)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    CGImageGetSizeAfterOrientation();
    double v6 = v5;
    double v8 = v7;
    v9.n128_u64[0] = 0;
    v10.n128_u64[0] = 0;
    v15 = @"PDFPageImageInitializationOptionMediaBox";
    v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", PDFRectMake(v9, v10, v6, v8));
    v16[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    v13 = [(PDFPage *)self initWithCGImage:ImageAtIndex options:v12];
    CGImageRelease(ImageAtIndex);
    self = v13;

    ImageAtIndex = (CGImage *)self;
  }

  return (PDFPage *)ImageAtIndex;
}

- (PDFPage)initWithCGImage:(CGImage *)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() _createPageRefFromImage:a3 andOptions:v6];
  if (v7)
  {
    double v8 = (CGPDFPage *)v7;
    __n128 v9 = [(PDFPage *)self initWithPageRef:v7];
    __n128 v10 = v9;
    if (v9)
    {
      v9->_candidateForOCR = 1;
      v9->_requestedOCR = [(id)objc_opt_class() _getBooleanProperty:v6 forKey:@"PDFPageImageInitializationOptionPerformOCR" withDefault:0];
      v10->candidateForFormDetection = 1;
      if ([(id)objc_opt_class() useLegacyImageHandling])
      {
        v10->_pageImage = CGImageRetain(a3);
        uint64_t v11 = [v6 copy];
        pageImageOptions = v10->_pageImageOptions;
        v10->_pageImageOptions = (NSDictionary *)v11;
      }
    }
    CGPDFPageRelease(v8);
    self = v10;
    v13 = self;
  }
  else
  {
    NSLog(&cfstr_Cgpdfpagecreat.isa, a3);
    v13 = 0;
  }

  return v13;
}

- (PDFPage)initWithPageNumber:(unint64_t)a3 pageRect:(CGRect)a4 rotation:(int64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PDFPage;
  uint64_t v11 = [(PDFPage *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(PDFPage *)v11 _commonInit];
    v12->_pageNumber = a3;
    v12->_mediaBox.origin.CGFloat x = x;
    v12->_mediaBox.origin.CGFloat y = y;
    v12->_mediaBox.size.CGFloat width = width;
    v12->_mediaBox.size.CGFloat height = height;
    v12->_rotation = PDFNormalizeRotation(a5);
  }
  return v12;
}

- (void)setupAKPageAdaptorIfNecessary
{
  if (!self->_akPageAdaptor)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke;
    aBlock[3] = &unk_264203940;
    aBlock[4] = self;
    unsigned int v2 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v2[2](v2);
    }
    else
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke_2;
      v3[3] = &unk_264205168;
      v4 = v2;
      dispatch_async(MEMORY[0x263EF83A0], v3);
    }
  }
}

void __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unsigned int v2 = [[PDFAKPageAdaptor alloc] initWithPDFPage:*(void *)(a1 + 32)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 120);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setupAKAnnotationAdaptorIfNecessary", (void)v9);
        [(PDFAKPageAdaptor *)v2 pdfPage:*(void *)(a1 + 32) didAddAnnotation:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __40__PDFPage_setupAKPageAdaptorIfNecessary__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)akDidSetupRealPageModelController
{
  return self->_akDidSetupRealPageModelController;
}

- (void)setAKDidSetupRealPageModelController:(BOOL)a3
{
  self->_akDidSetupRealPageModelController = a3;
}

- (BOOL)setPageRef:(CGPDFPage *)a3
{
  if (!a3) {
    return 0;
  }
  page = self->_page;
  if (page == a3) {
    return 1;
  }
  if (page) {
    CGPDFPageRelease(page);
  }
  int64_t rotation = self->_rotation;
  CGFloat x = self->_mediaBox.origin.x;
  CGFloat y = self->_mediaBox.origin.y;
  CGFloat width = self->_mediaBox.size.width;
  CGFloat height = self->_mediaBox.size.height;
  self->_page = CGPDFPageRetain(a3);
  int RotationAngle = CGPDFPageGetRotationAngle(a3);
  self->_int64_t rotation = PDFNormalizeRotation(RotationAngle);
  [(PDFPage *)self boundsForBox:0];
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 0);
  [(PDFPage *)self boundsForBox:1];
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 1);
  [(PDFPage *)self boundsForBox:2];
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 2);
  [(PDFPage *)self boundsForBox:3];
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 3);
  [(PDFPage *)self boundsForBox:4];
  -[PDFPage setBounds:forBox:](self, "setBounds:forBox:", 4);
  self->_didChangeBounds = 0;
  [(PDFPage *)self boundsForBox:0];
  BOOL result = 0;
  if (v14 > 0.0 && v12 > 0.0)
  {
    DictionarCGFloat y = CGPDFPageGetDictionary(a3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __22__PDFPage_setPageRef___block_invoke;
    block[3] = &unk_264203B18;
    block[4] = self;
    CGPDFDictionaryApplyBlock(Dictionary, block, 0);
    v16 = [(PDFPage *)self document];

    if (v16)
    {
      self->_isFullyConstructed = 1;
      v17 = [MEMORY[0x263F08A00] defaultCenter];
      [v17 postNotificationName:@"PDFPagePageRefChanged" object:self];

      if (self->_rotation != rotation)
      {
        if ([MEMORY[0x263F08B88] isMainThread]) {
          [(PDFPage *)self postPageDidRotateNotification];
        }
        else {
          [(PDFPage *)self performSelectorOnMainThread:sel_postPageDidRotateNotification withObject:0 waitUntilDone:0];
        }
      }
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      if (!PDFRectEqualToRect(v19, self->_mediaBox))
      {
        if ([MEMORY[0x263F08B88] isMainThread]) {
          [(PDFPage *)self postPageDidChangeBoundsNotification];
        }
        else {
          [(PDFPage *)self performSelectorOnMainThread:sel_postPageDidChangeBoundsNotification withObject:0 waitUntilDone:0];
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t __22__PDFPage_setPageRef___block_invoke(uint64_t a1, uint64_t a2, CGPDFObject *a3)
{
  uint64_t v5 = [NSString stringWithUTF8String:a2];
  if ([v5 hasPrefix:@"AAPL:"])
  {
    uint64_t v6 = [v5 substringFromIndex:5];

    CGPDFStreamRef value = 0;
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeStream, &value))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      CFDataRef v8 = CGPDFStreamCopyData(value, 0);
      [v7 setApplicationData:v8 withName:v6];
    }
  }
  else
  {
    uint64_t v6 = v5;
  }

  return 1;
}

- (void)setDocument:(id)a3
{
}

- (void)purgeAll
{
  text = self->_text;
  self->_text = 0;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  CGPDFLayoutRelease();
  self->_layout = 0;
  [(PDFPage *)self pageRef];

  CGPDFPageRemoveLayout();
}

- (void)_drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(PDFPage *)self lazilyLoadAnnotations];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (+[PDFPage isExcludingAKAnnotationRenderingForThisThread])
        {
          double v12 = [v11 akAnnotationAdaptor];
          v13 = [v12 akAnnotation];

          if (v13) {
            continue;
          }
        }
        if (!+[PDFPage shouldHideAnnotationsForThisThread]
          && (self->_displaysMarkups || ([v11 isMarkupAnnotation] & 1) == 0)
          && ([v11 isHidden] & 1) == 0
          && [v11 shouldDisplay])
        {
          [v11 drawWithBox:a3 inContext:a4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (int64_t)areaOfInterestAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PDFPage *)self annotationsIfAvail];

  if (v6
    && ((-[PDFPage annotationAtPoint:](self, "annotationAtPoint:", x, y),
         (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
     || (-[PDFPage scannedAnnotationAtPoint:](self, "scannedAnnotationAtPoint:", x, y),
         (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v8 = [v7 valueForAnnotationKey:@"/Subtype"];
    uint64_t v9 = [v7 valueForAnnotationKey:@"/FT"];
    long long v10 = [v7 valueForAnnotationKey:@"/Subtype"];
    char v11 = [v10 isEqualToString:@"/Link"];

    if (v11)
    {
      int64_t v12 = 13;
    }
    else if ([v8 isEqualToString:@"/Popup"])
    {
      int64_t v12 = 133;
    }
    else if ([v8 isEqualToString:@"/Widget"] {
           && [v9 isEqualToString:@"/Tx"]
    }
           && ![v7 isReadOnly])
    {
      int64_t v12 = 37;
    }
    else if ([v8 isEqualToString:@"/Widget"] {
           && [v9 isEqualToString:@"/Btn"]
    }
           && ![v7 isReadOnly])
    {
      int64_t v12 = 21;
    }
    else if ([v8 isEqualToString:@"/Text"])
    {
      int64_t v12 = 69;
    }
    else
    {
      int64_t v12 = 5;
    }
  }
  else
  {
    int64_t v12 = 1;
  }
  v13 = [(PDFPage *)self document];
  if ([v13 isSimpleSelectionEnabled])
  {
    if ([(PDFPage *)self pageLayoutIfAvail])
    {
      PDFPointToCGPoint(x, y);
      int AreaOfInterestAtPoint = CGPDFPageLayoutGetAreaOfInterestAtPoint();
      v12 |= (AreaOfInterestAtPoint << 7) & 0x100 | (2 * (AreaOfInterestAtPoint & 1u));
    }
  }
  else
  {
    if (-[PDFPage columnAtPointIfAvailable:](self, "columnAtPointIfAvailable:", x, y)) {
      v12 |= 2uLL;
    }
    if ([(PDFPage *)self pageLayoutIfAvail]
      && CGPDFLayoutGetRootNode()
      && CGPDFNodeGetNodeContainingPoint())
    {
      v12 |= 0x100uLL;
    }
  }

  return v12;
}

- (PDFPage)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFPage;
  unsigned int v2 = [(PDFPage *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(PDFPage *)v2 _commonInit];
    -[PDFPage setBounds:forBox:](v3, "setBounds:forBox:", 0, 0.0, 0.0, 612.0, 792.0);
    v3->_isFullyConstructed = 1;
  }
  return v3;
}

- (PDFPage)initWithImage:(UIImage *)image
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = image;
  [(UIImage *)v4 size];
  double v6 = v5;
  double v8 = v7;
  v9.n128_u64[0] = 0;
  v10.n128_u64[0] = 0;
  long long v15 = @"PDFPageImageInitializationOptionMediaBox";
  char v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", PDFRectMake(v9, v10, v6, v8));
  v16[0] = v11;
  int64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v13 = [(PDFPage *)self initWithImage:v4 options:v12];
  return v13;
}

- (PDFPage)initWithImage:(UIImage *)image options:(NSDictionary *)options
{
  double v6 = image;
  double v7 = options;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  double v8 = v6;
  CGImageRef v9 = CGImageRetain([(UIImage *)v8 CGImage]);
  v21[3] = (uint64_t)v9;
  if (!v9)
  {
    __n128 v10 = (const void *)CGDisplayListCreate();
    if (v10)
    {
      char v11 = (CGContext *)CGDisplayListContextCreate();
      if (v11)
      {
        [(UIImage *)v8 size];
        double v13 = v12;
        double v15 = v14;
        UIGraphicsPushContext(v11);
        -[UIImage drawInRect:](v8, "drawInRect:", 0.0, 0.0, v13, v15);
        UIGraphicsPopContext();
        uint64_t NumberOfEntries = CGDisplayListGetNumberOfEntries();
        uint64_t NumberOfEntriesOfType = CGDisplayListGetNumberOfEntriesOfType();
        if (NumberOfEntries == 1 && NumberOfEntriesOfType == 1) {
          CGDisplayListEnumerateEntriesWithOptions();
        }
        CFRelease(v11);
      }
      CFRelease(v10);
    }
  }
  long long v18 = [(PDFPage *)self initWithCGImage:v21[3] options:v7];
  CGImageRelease((CGImageRef)v21[3]);
  _Block_object_dispose(&v20, 8);

  return v18;
}

CGImageRef __33__PDFPage_initWithImage_options___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGDisplayListEntryImageGetImage();
  CGImageRef result = CGImageRetain(*(CGImageRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *a3 = 1;
  return result;
}

- (void)dealloc
{
  akPageAdaptor = self->_akPageAdaptor;
  if (akPageAdaptor)
  {
    [(PDFAKPageAdaptor *)akPageAdaptor teardown];
    uint64_t v4 = self->_akPageAdaptor;
    self->_akPageAdaptor = 0;
  }
  if (self->_layout)
  {
    CGPDFLayoutRelease();
    self->_layout = 0;
  }
  CGImageRelease(self->_pageImage);
  page = self->_page;
  if (page)
  {
    CGPDFPageRelease(page);
    self->_page = 0;
  }
  pageBackgroundColorHint = self->_pageBackgroundColorHint;
  if (pageBackgroundColorHint)
  {
    CGColorRelease(pageBackgroundColorHint);
    self->_pageBackgroundColorHint = 0;
  }
  displayList = self->_displayList;
  if (displayList) {
    CFRelease(displayList);
  }
  v8.receiver = self;
  v8.super_class = (Class)PDFPage;
  [(PDFPage *)&v8 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 357) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    objc_storeWeak((id *)(v6 + 8), WeakRetained);

    uint64_t Document = (uint64_t)CGPDFPageGetDocument(self->_page);
    if (Document)
    {
      CGPDFPageGetPageNumber(self->_page);
      uint64_t Document = CGPDFDocumentCopyPage();
    }
    *(void *)(v6 + 16) = Document;
    uint64_t v9 = [(NSString *)self->_label copyWithZone:a3];
    __n128 v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v9;

    *(void *)(v6 + 48) = CGImageRetain(self->_pageImage);
    uint64_t v11 = [(NSDictionary *)self->_pageImageOptions copyWithZone:a3];
    double v12 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = v11;

    *(_DWORD *)(v6 + 64) = 0;
    *(void *)(v6 + 72) = 0;
    *(unsigned char *)(v6 + 80) = 0;
    *(_DWORD *)(v6 + 84) = 0;
    *(unsigned char *)(v6 + 88) = 0;
    double v13 = *(void **)(v6 + 96);
    *(void *)(v6 + 96) = 0;

    double v14 = *(void **)(v6 + 104);
    *(void *)(v6 + 104) = 0;

    *(unsigned char *)(v6 + 112) = self->_displaysAnnotations;
    *(unsigned char *)(v6 + 113) = self->_displaysMarkups;
    id v15 = objc_alloc_init(MEMORY[0x263F08958]);
    long long v16 = *(void **)(v6 + 136);
    *(void *)(v6 + 136) = v15;

    id v17 = objc_alloc_init(MEMORY[0x263F08958]);
    long long v18 = *(void **)(v6 + 144);
    *(void *)(v6 + 144) = v17;

    if (self->_annotations)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v20 = *(void **)(v6 + 120);
      *(void *)(v6 + 120) = v19;

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v21 = self->_annotations;
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v27 = [v26 type];
            char v28 = [v27 isEqualToString:@"Popup"];

            if ((v28 & 1) == 0)
            {
              v29 = (void *)[v26 copyWithZone:a3];
              [v29 setPage:v6];
              [*(id *)(v6 + 120) addObject:v29];
              v30 = [v29 popup];

              if (v30)
              {
                v31 = *(void **)(v6 + 120);
                v32 = [v29 popup];
                [v31 addObject:v32];
              }
            }
          }
          uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v23);
      }
    }
    else
    {
      v33 = *(void **)(v6 + 120);
      *(void *)(v6 + 120) = 0;
    }
    *(unsigned char *)(v6 + 128) = *(void *)(v6 + 120) != 0;
    v34 = *(void **)(v6 + 152);
    *(void *)(v6 + 152) = 0;

    *(void *)(v6 + 160) = self->_rotation;
    [(id)v6 setRotation:self->_rotation];
    [(PDFPage *)self boundsForBox:0];
    objc_msgSend((id)v6, "setBounds:forBox:", 0);
    [(PDFPage *)self boundsForBox:1];
    objc_msgSend((id)v6, "setBounds:forBox:", 1);
    [(PDFPage *)self boundsForBox:2];
    objc_msgSend((id)v6, "setBounds:forBox:", 2);
    [(PDFPage *)self boundsForBox:3];
    objc_msgSend((id)v6, "setBounds:forBox:", 3);
    [(PDFPage *)self boundsForBox:4];
    objc_msgSend((id)v6, "setBounds:forBox:", 4);
    *(unsigned char *)(v6 + 416) = 0;
    *(void *)(v6 + 328) = 0;
    *(unsigned char *)(v6 + 336) = 0;
    *(_DWORD *)(v6 + 352) = 0;
    *(unsigned char *)(v6 + 417) = self->_candidateForOCR;
    *(unsigned char *)(v6 + 418) = self->_requestedOCR;
    *(unsigned char *)(v6 + 419) = self->_textFromOCR;
    *(unsigned char *)(v6 + 421) = self->candidateForFormDetection;
    uint64_t v35 = [(NSMutableArray *)self->_formFieldGroups mutableCopy];
    v36 = *(void **)(v6 + 440);
    *(void *)(v6 + 440) = v35;

    uint64_t v37 = [(NSMutableDictionary *)self->_persistentApplicationData mutableCopy];
    v38 = *(void **)(v6 + 448);
    *(void *)(v6 + 448) = v37;

    *(unsigned char *)(v6 + 357) = 1;
  }
  return (id)v6;
}

- (PDFDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return (PDFDocument *)WeakRetained;
}

- (CGPDFPageRef)pageRef
{
  return self->_page;
}

- (NSString)label
{
  label = self->_label;
  if (!label)
  {
    uint64_t v4 = (NSString *)CGPDFPageCopyPageLabel();
    uint64_t v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }

  return label;
}

- (CGRect)boundsForBox:(PDFDisplayBox)box
{
  if ((unint64_t)box < (kPDFDisplayBoxArtBox|kPDFDisplayBoxCropBox))
  {
    objc_super v8 = self;
    uint64_t v9 = (double *)((char *)self + 32 * box);
    double x = v9[21];
    CGFloat y = v9[22];
    double width = v9[23];
    CGFloat height = v9[24];
    if (width == 0.0)
    {
      self = (PDFPage *)self->_page;
      if (self)
      {
        CGRect BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)self, (CGPDFBox)box);
        double x = PDFRectMake((__n128)BoxRect.origin, *(__n128 *)&BoxRect.origin.y, BoxRect.size.width, BoxRect.size.height);
        CGFloat y = v10;
        double width = v11;
        CGFloat height = v12;
      }
      else
      {
        if ((unint64_t)box >= kPDFDisplayBoxBleedBox)
        {
          double x = v8->_cropBox.origin.x;
          CGFloat y = v8->_cropBox.origin.y;
          double width = v8->_cropBox.size.width;
          CGFloat height = v8->_cropBox.size.height;
        }
        if (width == 0.0)
        {
          double x = v8->_mediaBox.origin.x;
          CGFloat y = v8->_mediaBox.origin.y;
          double width = v8->_mediaBox.size.width;
          CGFloat height = v8->_mediaBox.size.height;
        }
      }
    }
    if (box)
    {
      CGFloat v13 = PDFRectToCGRect(self);
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      v34.origin.double x = PDFRectToCGRect([(PDFPage *)v8 boundsForBox:0]);
      v34.origin.CGFloat y = v20;
      v34.size.double width = v21;
      v34.size.CGFloat height = v22;
      v31.origin.double x = v13;
      v31.origin.CGFloat y = v15;
      v31.size.double width = v17;
      v31.size.CGFloat height = v19;
      CGRect v32 = CGRectIntersection(v31, v34);
      double x = PDFRectFromCGRect(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      CGFloat y = v23;
      double width = v24;
      CGFloat height = v25;
    }
  }
  else
  {
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
    double x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"boundsForBox: box is out of range"];
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)setBounds:(CGRect)bounds forBox:(PDFDisplayBox)box
{
  if ((unint64_t)box < (kPDFDisplayBoxArtBox|kPDFDisplayBoxCropBox))
  {
    CGFloat height = bounds.size.height;
    double width = bounds.size.width;
    CGFloat y = bounds.origin.y;
    CGFloat x = bounds.origin.x;
    if (box || bounds.size.width != 0.0)
    {
      switch(box)
      {
        case kPDFDisplayBoxMediaBox:
          goto LABEL_8;
        case kPDFDisplayBoxCropBox:
          self->_cropBoCGFloat x = bounds;
          break;
        case kPDFDisplayBoxBleedBox:
          self->_bleedBoCGFloat x = bounds;
          break;
        case kPDFDisplayBoxTrimBox:
          self->_trimBoCGFloat x = bounds;
          break;
        case kPDFDisplayBoxArtBox:
          self->_artBoCGFloat x = bounds;
          break;
        default:
          break;
      }
    }
    else
    {
      NSLog(&cfstr_WarningPdfpage.isa, a2);
      CGFloat y = 0.0;
      double width = 612.0;
      CGFloat height = 792.0;
      CGFloat x = 0.0;
LABEL_8:
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.double width = width;
      v16.size.CGFloat height = height;
      if (!PDFRectEqualToRect(v16, self->_mediaBox))
      {
        self->_mediaBox.origin.CGFloat x = x;
        self->_mediaBox.origin.CGFloat y = y;
        self->_mediaBox.size.double width = width;
        self->_mediaBox.size.CGFloat height = height;
        if (self->_pageImage)
        {
          if ([(id)objc_opt_class() useLegacyImageHandling])
          {
            double v11 = (void *)[(NSDictionary *)self->_pageImageOptions mutableCopy];
            double v12 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", self->_mediaBox.origin.x, self->_mediaBox.origin.y, self->_mediaBox.size.width, self->_mediaBox.size.height);
            [v11 setObject:v12 forKeyedSubscript:@"PDFPageImageInitializationOptionMediaBox"];

            objc_storeStrong((id *)&self->_pageImageOptions, v11);
            uint64_t v13 = [(id)objc_opt_class() _createPageRefFromImage:self->_pageImage andOptions:self->_pageImageOptions];
            if (v13)
            {
              double v14 = (CGPDFPage *)v13;
              CGPDFPageRelease(self->_page);
              self->_page = v14;
            }
          }
        }
      }
    }
    if (self->_mediaBox.size.width == 0.0 && width > 0.0 && ![(PDFPage *)self pageRef])
    {
      self->_mediaBox.origin.CGFloat x = x;
      self->_mediaBox.origin.CGFloat y = y;
      self->_mediaBox.size.double width = width;
      self->_mediaBox.size.CGFloat height = height;
    }
    if (self->_isFullyConstructed) {
      self->_didChangeBounds = 1;
    }
    [(PDFPage *)self postPageDidChangeBoundsNotification];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF578];
    objc_msgSend(v4, "raise:format:", v5, @"setBounds:forBox: box is out of range", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  }
}

- (void)postPageDidChangeBoundsNotification
{
  if (self->_isFullyConstructed)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"PDFPageChangedBoundsForBox" object:self];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v10 = WeakRetained;
      uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 postNotificationName:@"PDFPageChangedBoundsForBox" object:v10];

      double v7 = [MEMORY[0x263F08A00] defaultCenter];
      objc_super v8 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", self, @"page", 0);
      [v7 postNotificationName:@"PDFPageDidChangeBounds" object:v10 userInfo:v8];

      uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 postNotificationName:@"PDFPageDidChangeBounds" object:self userInfo:0];

      id v5 = v10;
    }
    MEMORY[0x270F9A758](WeakRetained, v5);
  }
}

- (NSInteger)rotation
{
  return PDFNormalizeRotation(self->_rotation);
}

- (void)setRotation:(NSInteger)rotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  id v11 = WeakRetained;
  if (WeakRetained && ([WeakRetained allowsDocumentAssembly] & 1) == 0)
  {
    uint64_t v9 = [v11 permissionsStatus];
    id v10 = @"user";
    if (v9 == 2) {
      id v10 = @"owner";
    }
    NSLog(&cfstr_PdfdocumentSSe_0.isa, v10);
  }
  else
  {
    int64_t v6 = self->_rotation;
    uint64_t v7 = PDFNormalizeRotation(rotation);
    if (v6 != v7)
    {
      int64_t v8 = v7;
      [(PDFPage *)self pageRef];
      CGPDFPageSetRotationAngle();
      self->_int64_t rotation = v8;
      [(PDFPage *)self _releaseDisplayList];
      [(PDFAKPageAdaptor *)self->_akPageAdaptor pdfPageWasRotated:self];
      [(PDFPage *)self postPageDidRotateNotification];
    }
  }
}

- (void)postPageDidRotateNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  if (WeakRetained && self->_isFullyConstructed)
  {
    id v7 = WeakRetained;
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", self, @"page", 0);
    [v4 postNotificationName:@"PDFPageDidRotate" object:v7 userInfo:v5];

    int64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"PDFPageDidRotate" object:self userInfo:0];

    id WeakRetained = v7;
  }
}

- (id)lazilyLoadAnnotations
{
  [(NSLock *)self->_lock_getAnnotations lock];
  annotations = self->_annotations;
  if (!annotations)
  {
    [(PDFPage *)self getAnnotations];
    atomic_store(1u, (unsigned __int8 *)&self->_loadedAnnotations);
    annotations = self->_annotations;
  }
  uint64_t v4 = (void *)[(NSMutableArray *)annotations copy];
  [(NSLock *)self->_lock_getAnnotations unlock];

  return v4;
}

- (id)annotationsIfAvail
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_loadedAnnotations);
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [(PDFPage *)self document];
    id v5 = v4;
    if (v4)
    {
      int64_t v6 = [v4 textExtractionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__PDFPage_annotationsIfAvail__block_invoke;
      block[3] = &unk_264203940;
      block[4] = self;
      dispatch_async(v6, block);
    }
  }
  annotations = self->_annotations;

  return annotations;
}

id __29__PDFPage_annotationsIfAvail__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) lazilyLoadAnnotations];
}

- (id)fetchAnnotationFromTaggedNodeRef:(CGPDFTaggedNode *)a3
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__5;
  CGFloat v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  uint64_t ObjectReference = CGPDFTaggedNodeGetObjectReference();
  if (ObjectReference | (unsigned __int16)v5)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__PDFPage_fetchAnnotationFromTaggedNodeRef___block_invoke;
    v10[3] = &unk_2642051B8;
    v10[5] = ObjectReference;
    v10[6] = v5;
    v10[4] = &v11;
    uint64_t v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
    [(PDFPage *)self fetchAnnotationsWithCompletion:v10 deliveredOnQueue:v6];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __44__PDFPage_fetchAnnotationFromTaggedNodeRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "sourceDictionary", (void)v10)
          && CGPDFDictionaryGetObjectReference() == *(void *)(a1 + 40)
          && *(unsigned __int16 *)(a1 + 48) == v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)fetchAnnotationsWithCompletion:(id)a3 deliveredOnQueue:(id)a4
{
  uint64_t v6 = (void (**)(id, NSMutableArray *))a3;
  id v7 = a4;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_loadedAnnotations);
  if (v8)
  {
    v6[2](v6, self->_annotations);
  }
  else
  {
    unsigned __int16 v9 = [(PDFPage *)self document];
    long long v10 = v9;
    if (v9)
    {
      long long v11 = [v9 textExtractionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke;
      block[3] = &unk_2642051E0;
      block[4] = self;
      id v16 = v7;
      CGFloat v17 = v6;
      dispatch_async(v11, block);

      long long v12 = v16;
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_3;
      v13[3] = &unk_264205168;
      double v14 = v6;
      dispatch_async(v7, v13);
      long long v12 = v14;
    }
  }
}

void __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) lazilyLoadAnnotations];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_2;
  v6[3] = &unk_264203FE8;
  id v3 = *(NSObject **)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __59__PDFPage_fetchAnnotationsWithCompletion_deliveredOnQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)displaysAnnotations
{
  return self->_displaysAnnotations;
}

- (void)setDisplaysAnnotations:(BOOL)displaysAnnotations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_displaysAnnotations != displaysAnnotations)
  {
    self->_displaysAnnotations = displaysAnnotations;
    id v3 = [(PDFPage *)self annotations];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) updateAnnotationEffect];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)addAnnotation:(PDFAnnotation *)annotation
{
}

- (void)addAnnotation:(id)a3 withUndo:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  uint64_t v7 = WeakRetained;
  if (!WeakRetained || ([WeakRetained allowsCommenting] & 1) != 0)
  {
    [(PDFPage *)self insertAnnotation:v19 atIndex:-1];
    id v8 = objc_loadWeakRetained((id *)&self->_view);
    if (!v8 || !v4) {
      goto LABEL_9;
    }
    long long v9 = [v19 akAnnotationAdaptor];
    if (!v9)
    {
      if (![v8 allowsUndo])
      {
LABEL_9:

        goto LABEL_13;
      }
      long long v10 = NSString;
      long long v11 = PDFKitLocalizedString(@"Add %@");
      long long v12 = [v19 displayName];
      long long v9 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

      uint64_t v13 = [v8 undoManager];
      double v14 = [v13 prepareWithInvocationTarget:self];
      [v14 removeAnnotation:v19 withUndo:1];

      uint64_t v15 = [v8 undoManager];
      id v16 = PDFKitLocalizedString(v9);
      [v15 setActionName:v16];
    }
    goto LABEL_9;
  }
  uint64_t v17 = [v7 permissionsStatus];
  double v18 = @"user";
  if (v17 == 2) {
    double v18 = @"owner";
  }
  NSLog(&cfstr_PdfpageSAddann.isa, v18);
LABEL_13:
}

- (void)insertAnnotation:(id)a3 atIndex:(int64_t)a4
{
  v33[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  id v8 = WeakRetained;
  if (!WeakRetained || ([WeakRetained allowsCommenting] & 1) != 0)
  {
    if (!v6) {
      goto LABEL_32;
    }
    [v6 setPage:self];
    [(NSLock *)self->_lock_accessAnnotations lock];
    annotations = self->_annotations;
    if (annotations
      || (id v10 = [(PDFPage *)self annotations],
          (annotations = self->_annotations) != 0))
    {
      if (a4 < 0) {
        goto LABEL_9;
      }
    }
    else
    {
      double v27 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
      double v28 = self->_annotations;
      self->_annotations = v27;

      annotations = self->_annotations;
      if (a4 < 0) {
        goto LABEL_9;
      }
    }
    if ([(NSMutableArray *)annotations count] >= (unint64_t)a4)
    {
LABEL_10:
      if (([(NSMutableArray *)self->_annotations containsObject:v6] & 1) == 0)
      {
        [(NSMutableArray *)self->_annotations insertObject:v6 atIndex:a4];
        double v29 = [[PDFAnnotationChange alloc] initWithAddedAnnotation:v6];
        -[NSMutableArray addObject:](self->_annotationChanges, "addObject:");
        [(NSMutableSet *)self->_changedAnnotations addObject:v6];
        int v11 = [v6 shouldBurnIn];
        if (v8 && v11) {
          [v8 setDocumentHasBurnInAnnotations:1];
        }
        if ([v6 isRedaction]) {
          [v8 incrementRedactionCount];
        }
        if (self->_akPageAdaptor)
        {
          [v6 setupAKAnnotationAdaptorIfNecessary];
          [(PDFAKPageAdaptor *)self->_akPageAdaptor pdfPage:self didAddAnnotation:v6];
        }
        long long v12 = [v6 valueForAnnotationKey:@"/Popup"];
        if (v12 && ([(NSMutableArray *)self->_annotations containsObject:v12] & 1) == 0)
        {
          [v12 setPage:self];
          [(NSMutableArray *)self->_annotations insertObject:v12 atIndex:a4 + 1];
          uint64_t v13 = [[PDFAnnotationChange alloc] initWithAddedAnnotation:v12];
          [(NSMutableArray *)self->_annotationChanges addObject:v13];
          [(NSMutableSet *)self->_changedAnnotations addObject:v12];
          if (self->_akPageAdaptor)
          {
            [v12 setupAKAnnotationAdaptorIfNecessary];
            [(PDFAKPageAdaptor *)self->_akPageAdaptor pdfPage:self didAddAnnotation:v12];
          }
        }
        double v14 = [v6 valueForAnnotationKey:@"/Subtype"];
        int v15 = [v14 isEqualToString:@"/Widget"];

        if (v15) {
          [(PDFPage *)self _addWidgetAnnotationToLookupDictionary:v6];
        }
        [v6 addToPageView];
        id v16 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v17 = [(PDFPage *)self view];
        v32[0] = @"page";
        v32[1] = @"annotation";
        v33[0] = self;
        v33[1] = v6;
        v32[2] = @"changeType";
        double v18 = [NSNumber numberWithInt:0];
        v33[2] = v18;
        id v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
        [v16 postNotificationName:@"PDFViewAnnotationsDidChange" object:v17 userInfo:v19];

        CGFloat v20 = [(PDFPage *)self view];
        int v21 = [v20 allowsMarkupAnnotationEditing];

        if (v21)
        {
          CGFloat v22 = [MEMORY[0x263F08A00] defaultCenter];
          double v23 = [(PDFPage *)self view];
          v30 = @"annotation";
          id v31 = v6;
          double v24 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          [v22 postNotificationName:@"PDFPageAnnotationAddedNotificationNotification" object:v23 userInfo:v24];
        }
      }
      [(NSLock *)self->_lock_accessAnnotations unlock];
      goto LABEL_32;
    }
    annotations = self->_annotations;
LABEL_9:
    a4 = [(NSMutableArray *)annotations count];
    goto LABEL_10;
  }
  uint64_t v25 = [v8 permissionsStatus];
  double v26 = @"user";
  if (v25 == 2) {
    double v26 = @"owner";
  }
  NSLog(&cfstr_PdfDocumentSPe.isa, v26);
LABEL_32:
}

- (void)removeAnnotation:(PDFAnnotation *)annotation
{
}

- (void)removeAnnotation:(id)a3 withUndo:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  uint64_t v7 = WeakRetained;
  if (WeakRetained && ([WeakRetained allowsCommenting] & 1) == 0)
  {
    uint64_t v19 = [v7 permissionsStatus];
    CGFloat v20 = @"user";
    if (v19 == 2) {
      CGFloat v20 = @"owner";
    }
    NSLog(&cfstr_PdfpageSRemove.isa, v20);
  }
  else
  {
    annotations = self->_annotations;
    if (annotations)
    {
      uint64_t v9 = [(NSMutableArray *)annotations indexOfObject:v21];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(PDFPage *)self removeAnnotation:v21 atIndex:v9];
        id v10 = objc_loadWeakRetained((id *)&self->_view);
        if (!v10 || !v4) {
          goto LABEL_11;
        }
        int v11 = [v21 akAnnotationAdaptor];
        if (!v11)
        {
          if (![v10 allowsUndo])
          {
LABEL_11:

            goto LABEL_15;
          }
          long long v12 = NSString;
          uint64_t v13 = PDFKitLocalizedString(@"Remove %@");
          double v14 = [v21 displayName];
          int v11 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

          int v15 = [v10 undoManager];
          id v16 = [v15 prepareWithInvocationTarget:self];
          [v16 addAnnotation:v21 withUndo:1];

          uint64_t v17 = [v10 undoManager];
          double v18 = PDFKitLocalizedString(v11);
          [v17 setActionName:v18];
        }
        goto LABEL_11;
      }
    }
  }
LABEL_15:
}

- (void)removeAnnotation:(id)a3 atIndex:(int64_t)a4
{
  v33[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  uint64_t v7 = WeakRetained;
  if (WeakRetained && ([WeakRetained allowsCommenting] & 1) == 0)
  {
    uint64_t v26 = [v7 permissionsStatus];
    double v27 = @"user";
    if (v26 == 2) {
      double v27 = @"owner";
    }
    NSLog(&cfstr_PdfDocumentSPe.isa, v27);
  }
  else if (v5)
  {
    [(NSLock *)self->_lock_accessAnnotations lock];
    if (self->_annotations)
    {
      if ([v5 isRedaction]) {
        [v7 decrementRedactionCount];
      }
      uint64_t v8 = [v5 valueForAnnotationKey:@"/Popup"];
      if (v8)
      {
        annotations = self->_annotations;
        if (annotations)
        {
          if ([(NSMutableArray *)annotations containsObject:v8])
          {
            [(NSMutableArray *)self->_annotations removeObject:v8];
            id v10 = [[PDFAnnotationChange alloc] initWithRemovedAnnotation:v8];
            [(NSMutableArray *)self->_annotationChanges addObject:v10];
            [(NSMutableSet *)self->_changedAnnotations addObject:v8];
          }
        }
      }
      double v29 = (void *)v8;
      double v28 = [v5 valueForAnnotationKey:@"/Subtype"];
      if ([v28 isEqualToString:@"/Widget"])
      {
        int v11 = [v5 valueForAnnotationKey:@"/FT"];
        if ([v11 isEqualToString:@"/Tx"])
        {
          long long v12 = [v7 formData];
          if (v12)
          {
            uint64_t v13 = [v5 fieldName];
            [v12 removeFormFieldWithFieldName:v13];
          }
        }
        [(PDFPage *)self _removeWidgetAnnotationFromLookupDictionary:v5];
      }
      double v14 = [(PDFPage *)self detectedFormFieldForAnnotation:v5];
      int v15 = v14;
      if (v14) {
        objc_setAssociatedObject(v14, @"com.apple.pdfkit.AnnotationAssociatedObjectKey", 0, 0);
      }
      [v5 removeFromPageView];
      akPageAdaptor = self->_akPageAdaptor;
      if (akPageAdaptor) {
        [(PDFAKPageAdaptor *)akPageAdaptor pdfPage:self didRemoveAnnotation:v5];
      }
      [v5 setPage:0];
      [(NSMutableArray *)self->_annotations removeObject:v5];
      uint64_t v17 = [[PDFAnnotationChange alloc] initWithRemovedAnnotation:v5];
      [(NSMutableArray *)self->_annotationChanges addObject:v17];
      [(NSMutableSet *)self->_changedAnnotations addObject:v5];
      double v18 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v19 = [(PDFPage *)self view];
      v32[0] = @"page";
      v32[1] = @"annotation";
      v33[0] = self;
      v33[1] = v5;
      v32[2] = @"changeType";
      CGFloat v20 = [NSNumber numberWithInt:2];
      v33[2] = v20;
      id v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
      [v18 postNotificationName:@"PDFViewAnnotationsDidChange" object:v19 userInfo:v21];

      CGFloat v22 = [(PDFPage *)self view];
      LODWORD(v20) = [v22 allowsMarkupAnnotationEditing];

      if (v20)
      {
        double v23 = [MEMORY[0x263F08A00] defaultCenter];
        double v24 = [(PDFPage *)self view];
        v30 = @"annotation";
        id v31 = v5;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        [v23 postNotificationName:@"PDFPageAnnotationRemovedNotificationNotification" object:v24 userInfo:v25];
      }
      [(NSLock *)self->_lock_accessAnnotations unlock];
    }
    else
    {
      [(NSLock *)self->_lock_accessAnnotations unlock];
    }
  }
}

- (void)replaceAnnotation:(id)a3 withAnnotation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6)
  {
    if (v9 != v6)
    {
      uint64_t v7 = [(NSMutableArray *)self->_annotations indexOfObjectIdenticalTo:v9];
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(&cfstr_SOldannotation.isa, "-[PDFPage replaceAnnotation:withAnnotation:]");
      }
      else
      {
        uint64_t v8 = v7;
        [(PDFPage *)self removeAnnotation:v9 atIndex:v7];
        [(PDFPage *)self insertAnnotation:v6 atIndex:v8];
      }
    }
  }
  else
  {
    NSLog(&cfstr_SInvalidNilPar.isa, "-[PDFPage replaceAnnotation:withAnnotation:]");
  }
}

- (PDFAnnotation)annotationAtPoint:(CGPoint)point
{
  double v4 = PDFPointToCGPoint(point.x, point.y);
  uint64_t v6 = v5;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__5;
  id v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  [(NSLock *)self->_lock_accessAnnotations lock];
  uint64_t v7 = [(PDFPage *)self annotations];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__PDFPage_annotationAtPoint___block_invoke;
  v11[3] = &unk_264205208;
  *(double *)&v11[5] = v4;
  v11[6] = v6;
  v11[4] = &v12;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v11];
  if (!v13[5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __29__PDFPage_annotationAtPoint___block_invoke_2;
    v10[3] = &unk_264205208;
    *(double *)&v10[5] = v4;
    v10[6] = v6;
    v10[4] = &v12;
    [v7 enumerateObjectsWithOptions:2 usingBlock:v10];
  }
  [(NSLock *)self->_lock_accessAnnotations unlock];
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return (PDFAnnotation *)v8;
}

void __29__PDFPage_annotationAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 valueForAnnotationKey:@"/Subtype"];
  char v8 = [v7 isEqualToString:@"/Popup"];

  if ((v8 & 1) == 0
    && [v9 shouldDisplay]
    && ((objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || objc_msgSend(v9, "noteContainsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48))))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __29__PDFPage_annotationAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 valueForAnnotationKey:@"/Subtype"];
  char v8 = [v7 isEqualToString:@"/Popup"];

  if ((v8 & 1) == 0
    && [v9 shouldDisplay]
    && ((objc_msgSend(v9, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || objc_msgSend(v9, "noteContainsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48))))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)annotationAtRect:(CGRect)a3
{
  CGFloat v4 = PDFRectToCGRect(self);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NSLock *)self->_lock_accessAnnotations lock];
  int v11 = [(PDFPage *)self annotations];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    while (1)
    {
      uint64_t v14 = [v11 objectAtIndex:v13];
      int v15 = [v14 valueForAnnotationKey:@"/Subtype"];
      char v16 = [v15 isEqualToString:@"/Popup"];

      if ((v16 & 1) == 0)
      {
        if ([v14 shouldDisplay])
        {
          v19.origin.CGFloat x = PDFRectToCGRect([v14 bounds]);
          v20.origin.CGFloat x = v4;
          v20.origin.CGFloat y = v6;
          v20.size.double width = v8;
          v20.size.CGFloat height = v10;
          if (CGRectContainsRect(v19, v20)) {
            break;
          }
        }
      }

      if (--v13 == -1) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v14 = 0;
  }
  [(NSLock *)self->_lock_accessAnnotations unlock];

  return v14;
}

- (BOOL)hasPopups
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(PDFPage *)self lazilyLoadAnnotations];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "valueForAnnotationKey:", @"/Subtype", (void)v11);
        char v8 = [v7 isEqualToString:@"/Popup"];

        if (v8)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)drawWithBox:(PDFDisplayBox)box toContext:(CGContextRef)context
{
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 isThumbnail:(BOOL)a5
{
  BOOL v5 = a5;
  v14[4] = *MEMORY[0x263EF8340];
  BOOL v9 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  v13[0] = @"PDFPageDrawWithBoxOption_WithRotation";
  CGFloat v10 = [NSNumber numberWithBool:!v9];
  v14[0] = v10;
  v13[1] = @"PDFPageDrawWithBoxOption_IsThumbnail";
  long long v11 = [NSNumber numberWithBool:v5];
  v14[1] = v11;
  v14[2] = MEMORY[0x263EFFA88];
  v13[2] = @"PDFPageDrawWithBoxOption_DrawAnnotations";
  v13[3] = @"PDFPageDrawWithBoxOption_DrawBookmark";
  v14[3] = MEMORY[0x263EFFA80];
  long long v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  [(PDFPage *)self drawWithBox:a3 inContext:a4 withOptions:v12];
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5
{
  id v8 = a5;
  int v9 = [(id)objc_opt_class() _getBooleanProperty:v8 forKey:@"PDFPageDrawWithBoxOption_WithRotation" withDefault:0];
  char v10 = [(id)objc_opt_class() _getBooleanProperty:v8 forKey:@"PDFPageDrawWithBoxOption_IsThumbnail" withDefault:0];
  int v22 = [(id)objc_opt_class() _getBooleanProperty:v8 forKey:@"PDFPageDrawWithBoxOption_DrawAnnotations" withDefault:0];
  int v21 = [(id)objc_opt_class() _getBooleanProperty:v8 forKey:@"PDFPageDrawWithBoxOption_DrawBookmark" withDefault:0];
  [(id)objc_opt_class() _getBooleanProperty:v8 forKey:@"PDFPageDrawWithBoxOption_RenderExtraContentStream" withDefault:0];
  long long v11 = [v8 objectForKeyedSubscript:@"PDFPageDrawWithBoxOption_DrawProgressCallback"];
  BOOL v12 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v9 ^ 1u];
  long long v13 = [(PDFPage *)self copyDisplayList];
  if (v13)
  {
    long long v14 = v13;
    CGDisplayListDrawInContext();
    CFRelease(v14);
  }
  else if (self->_page)
  {
    CGContextSaveGState(a4);
    memset(&v24, 0, sizeof(v24));
    int64_t v20 = a3;
    [(PDFPage *)self getDrawingTransformForBox:a3];
    CGAffineTransform transform = v24;
    CGContextConcatCTM(a4, &transform);
    int v15 = [(PDFPage *)self document];
    uint64_t v16 = [v15 renderingProperties];

    if (!v16) {
      uint64_t v16 = objc_alloc_init(PDFRenderingProperties);
    }
    BOOL v17 = [(PDFRenderingProperties *)v16 shouldAntiAlias];
    CGContextSetAllowsAntialiasing(a4, v17);
    CGContextSetShouldAntialias(a4, v17);
    [(PDFRenderingProperties *)v16 greekingThreshold];
    CGContextSetTextGreekingThreshold();
    if ((v10 & 1) == 0) {
      [(PDFRenderingProperties *)v16 lineWidthThreshold];
    }
    CGContextSetLineWidthThreshold();
    unint64_t v18 = [(PDFRenderingProperties *)v16 interpolationQuality];
    if (v18 < 3) {
      CGInterpolationQuality v19 = v18 + 1;
    }
    else {
      CGInterpolationQuality v19 = kCGInterpolationDefault;
    }
    CGContextSetInterpolationQuality(a4, v19);
    a3 = v20;
    v25.origin.CGFloat x = PDFRectToCGRect([(PDFPage *)self boundsForBox:v20]);
    CGContextClipToRect(a4, v25);
    if (GetDefaultsWriteDrawInvisibleText()) {
      CGPDFPageSetProperty();
    }
    if (CGContextGetType() == 1) {
      CGPDFPageSetProperty();
    }
    *(void *)&transform.a = v11;
    transform.b = 0.0;
    CGContextDrawPDFPageWithProgressCallback();
    if (*(void *)&transform.b >= 0xFBuLL) {
      [(PDFPage *)self getDisplayListWithCompletion:0 onQueue:0];
    }
    if (CGContextGetType() == 1) {
      CGPDFPageRemoveProperty();
    }
    if (GetDefaultsWriteDrawInvisibleText()) {
      CGPDFPageRemoveProperty();
    }
    if (!self->_pageBackgroundColorHint) {
      self->_pageBackgroundColorHint = (CGColor *)CGPDFPageCopyBackgroundColorHint();
    }
    CGContextRestoreGState(a4);
  }
  if (([(PDFPage *)self displaysAnnotations] & v22) == 1) {
    [(PDFPage *)self _drawAnnotationsWithBox:a3 inContext:a4];
  }
  if (v21) {
    [(PDFPage *)self _drawBookmarkInContext:a4];
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v12];
}

- (void)_drawBookmarkInContext:(CGContext *)a3
{
  double Width = (double)CGBitmapContextGetWidth(a3);
  double Height = (double)CGBitmapContextGetHeight(a3);
  CGContextSetRGBFillColor(a3, 0.92, 0.19, 0.21, 1.0);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 21.0);
  CGPathAddLineToPoint(Mutable, 0, 6.5, 16.0);
  CGPathAddLineToPoint(Mutable, 0, 13.0, 21.0);
  CGPathAddLineToPoint(Mutable, 0, 13.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 0.0);
  CGPathCloseSubpath(Mutable);
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v12.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v11.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&v11.c = v7;
  *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)&v12.tx;
  CGAffineTransformTranslate(&v12, &v11, Width + 425.0, Height + 555.0);
  CGAffineTransform v10 = v12;
  CGAffineTransformTranslate(&v11, &v10, 52.0, 84.0);
  CGAffineTransform v12 = v11;
  CGAffineTransform v10 = v11;
  CGAffineTransformScale(&v11, &v10, 8.0, 8.0);
  CGAffineTransform v12 = v11;
  double v8 = PDFDegToRad(180.0);
  CGAffineTransform v10 = v12;
  CGAffineTransformRotate(&v11, &v10, v8);
  CGAffineTransform v12 = v11;
  CGAffineTransform v10 = v11;
  CGAffineTransformTranslate(&v11, &v10, -6.5, -10.5);
  CGAffineTransform v12 = v11;
  int v9 = (const CGPath *)MEMORY[0x2166A0680](Mutable, &v12);
  CGContextAddPath(a3, v9);
  CGContextFillPath(a3);
  CGPathRelease(Mutable);
  CGPathRelease(v9);
}

- (UIImage)thumbnailOfSize:(CGSize)size forBox:(PDFDisplayBox)box
{
  double height = size.height;
  double width = size.width;
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"PDFPageImageProperty_DrawBookmark";
  v11[1] = @"PDFPageImageProperty_DrawAnnotations";
  v12[0] = MEMORY[0x263EFFA80];
  v12[1] = MEMORY[0x263EFFA88];
  v11[2] = @"PDFPageImageProperty_WithRotation";
  v12[2] = MEMORY[0x263EFFA88];
  double v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  int v9 = -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", box, v8, width, height);

  return (UIImage *)v9;
}

- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5
{
  return -[PDFPage thumbnailOfSize:forBox:withBookmark:withAnnotations:](self, "thumbnailOfSize:forBox:withBookmark:withAnnotations:", a4, a5, 1, a3.width, a3.height);
}

- (id)thumbnailOfSize:(CGSize)a3 forBox:(int64_t)a4 withBookmark:(BOOL)a5 withAnnotations:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = @"PDFPageImageProperty_DrawBookmark";
  CGAffineTransform v11 = [NSNumber numberWithBool:a5];
  v17[0] = v11;
  v16[1] = @"PDFPageImageProperty_DrawAnnotations";
  CGAffineTransform v12 = [NSNumber numberWithBool:v6];
  void v16[2] = @"PDFPageImageProperty_WithRotation";
  v17[1] = v12;
  v17[2] = MEMORY[0x263EFFA88];
  long long v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  long long v14 = -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", a4, v13, width, height);

  return v14;
}

+ (BOOL)_getBooleanProperty:(id)a3 forKey:(id)a4 withDefault:(BOOL)a5
{
  BOOL v6 = [a3 valueForKey:a4];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a5 = [v6 BOOLValue];
    }
  }

  return a5;
}

- (id)imageOfSize:(CGSize)a3 forBox:(int64_t)a4 withOptions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  uint64_t v10 = [v9 valueForKey:@"PDFPageImageProperty_ColorSpace"];
  CGAffineTransform v11 = [v9 valueForKey:@"PDFPageImageProperty_BackgroundColor"];
  BOOL v32 = +[PDFPage _getBooleanProperty:v9 forKey:@"PDFPageImageProperty_DrawBookmark" withDefault:0];
  BOOL v31 = +[PDFPage _getBooleanProperty:v9 forKey:@"PDFPageImageProperty_DrawAnnotations" withDefault:0];
  BOOL v12 = +[PDFPage _getBooleanProperty:v9 forKey:@"PDFPageImageProperty_WithRotation" withDefault:0];
  long long v13 = [v9 objectForKey:@"PDFPageImageProperty_DrawProgressCallback"];
  if (!self->_page
    || (uint64_t Thumbnail = CGPDFPageGetThumbnail()) == 0
    || ((int v15 = (CGImage *)Thumbnail, v16 = CGPDFPageContainsWideGamutContent(), !v10)
      ? (char v17 = 0)
      : (CGImageGetColorSpace(v15), char v17 = CGColorSpaceEqualToColorSpace() ^ 1),
        v16 != PDFKitCGImageIsWideGamut(v15)
     || (v17 & 1) != 0
     || width >= (double)CGImageGetWidth(v15)
     || height >= (double)CGImageGetHeight(v15)
     || (unint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v15]) == 0))
  {
    [(PDFPage *)self boundsForBox:a4];
    double v22 = v21;
    double v24 = v23;
    if (v12)
    {
      PDFRectRotate([(PDFPage *)self rotation], v19, v20);
      double v22 = v25;
      double v24 = v26;
    }
    double v27 = width / v22;
    if (v24 * (width / v22) > height) {
      double v27 = height / v24;
    }
    BYTE2(v30) = v32;
    BYTE1(v30) = v31;
    LOBYTE(v30) = 1;
    double v28 = [(PDFPage *)self _newCGImageWithBox:a4 bitmapSize:vcvtmd_u64_f64(v22 * v27) scale:vcvtmd_u64_f64(v24 * v27) offset:v10 colorSpace:v11 backgroundColor:v12 withRotation:v27 withAntialiasing:*MEMORY[0x263F00148] withAnnotations:*(double *)(MEMORY[0x263F00148] + 8) withBookmark:v30 withOptions:v9 withDelegate:v13];
    unint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v28];
    CGImageRelease(v28);
  }

  return v18;
}

- (CGImage)_newCGImageWithBox:(int64_t)a3 bitmapSize:(PDFSizeIntegral)a4 scale:(double)a5 offset:(CGPoint)a6 colorSpace:(CGColorSpace *)a7 backgroundColor:(id)a8 withRotation:(BOOL)a9 withAntialiasing:(BOOL)a10 withAnnotations:(BOOL)a11 withBookmark:(BOOL)a12 withOptions:(id)a13 withDelegate:(id)a14
{
  BOOL v14 = a9;
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  size_t var1 = a4.var1;
  size_t var0 = a4.var0;
  id v22 = a8;
  id v23 = a13;
  id v24 = a14;
  if (a7)
  {
    CFRetain(a7);
  }
  else
  {
    if (CGPDFPageContainsWideGamutContent()) {
      DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
    }
    else {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    }
    a7 = DeviceRGB;
    if (!DeviceRGB)
    {
      Image = 0;
      goto LABEL_22;
    }
  }
  if (CGColorSpaceGetModel(a7)) {
    uint32_t v26 = 8194;
  }
  else {
    uint32_t v26 = 0;
  }
  double v27 = CGBitmapContextCreate(0, var0, var1, 8uLL, 0, a7, v26);
  if (v27)
  {
    double v28 = v27;
    id v36 = v24;
    CGContextSaveGState(v27);
    if (v22 && (id v29 = v22, [v29 CGColor])) {
      CGContextSetFillColorWithColor(v28, (CGColorRef)[v29 CGColor]);
    }
    else {
      CGContextSetRGBFillColor(v28, 1.0, 1.0, 1.0, 1.0);
    }
    v38.size.double width = (double)var0;
    v38.size.double height = (double)var1;
    v38.origin.CGFloat x = 0.0;
    v38.origin.CGFloat y = 0.0;
    CGContextFillRect(v28, v38);
    CGContextTranslateCTM(v28, x, y);
    CGContextScaleCTM(v28, a5, a5);
    BOOL v31 = (void *)[v23 mutableCopy];
    BOOL v32 = [NSNumber numberWithBool:v14];
    [v31 setObject:v32 forKeyedSubscript:@"PDFPageDrawWithBoxOption_WithRotation"];

    [v31 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"PDFPageDrawWithBoxOption_IsThumbnail"];
    v33 = [NSNumber numberWithBool:a11];
    [v31 setObject:v33 forKeyedSubscript:@"PDFPageDrawWithBoxOption_DrawAnnotations"];

    CGRect v34 = [NSNumber numberWithBool:a12];
    [v31 setObject:v34 forKeyedSubscript:@"PDFPageDrawWithBoxOption_DrawBookmark"];

    [(PDFPage *)self drawWithBox:a3 inContext:v28 withOptions:v31];
    if (GetDefaultsWriteAKEnabled() && [(PDFPage *)self displaysAnnotations] && a11) {
      [(PDFPage *)self _drawAnnotationsWithBox:a3 inContext:v28];
    }
    CGContextRestoreGState(v28);
    Image = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);

    id v24 = v36;
  }
  else
  {
    Image = 0;
  }
  CGColorSpaceRelease(a7);
LABEL_22:

  return Image;
}

- (id)selectionForCodeRange:(_NSRange)a3
{
  return -[PDFPage selectionForRangeCommon:isCodeRange:](self, "selectionForRangeCommon:isCodeRange:", a3.location, a3.length, 1);
}

- (CGRect)columnFrameAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(PDFPage *)self document];
  int v7 = [v6 isSimpleSelectionEnabled];
  double v8 = [(PDFPage *)self pageLayout];
  if (!v7)
  {
    if (v8)
    {
      if (CGPDFLayoutGetRootNode())
      {
        PDFPointToCGPoint(x, y);
        if (CGPDFNodeGetNodeContainingPoint())
        {
          CGPDFNodeGetBounds();
          double v12 = PDFRectFromCGRect(v16, v17, v18, v19);
          double v13 = v20;
          double v14 = v21;
          double v15 = v22;
          goto LABEL_12;
        }
      }
    }
LABEL_9:
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    goto LABEL_12;
  }
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v30 = 0;
  BOOL v31 = (CGRect *)&v30;
  uint64_t v32 = 0x4010000000;
  v33 = &unk_21442F44B;
  long long v34 = 0u;
  long long v35 = 0u;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  PDFPointToCGPoint(x, y);
  uint64_t v10 = [v6 textExtractionQueue];
  CGAffineTransform v11 = v9;
  CGPDFPageLayoutGetColumnBoundsAtPointWithCompletion();

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (CGRectIsNull(v31[1]))
  {
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    double v12 = PDFRectFromCGRect(v31[1].origin.x, v31[1].origin.y, v31[1].size.width, v31[1].size.height);
    double v13 = v23;
    double v14 = v24;
    double v15 = v25;
  }

  _Block_object_dispose(&v30, 8);
LABEL_12:

  double v26 = v12;
  double v27 = v13;
  double v28 = v14;
  double v29 = v15;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

intptr_t __30__PDFPage_columnFrameAtPoint___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = *(double **)(*(void *)(a1 + 40) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)transformContext:(CGContextRef)context forBox:(PDFDisplayBox)box
{
  CurrentContext = context;
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v9.c = v7;
  *(_OWORD *)&v9.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (context || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
  {
    [(PDFPage *)self getDrawingTransformForBox:box];
    CGAffineTransform v8 = v9;
    CGContextConcatCTM(CurrentContext, &v8);
  }
}

- (NSUInteger)numberOfCharacters
{
  uint64_t v3 = [(PDFPage *)self document];
  if ([v3 isLocked])
  {
    NSUInteger v4 = 0;
  }
  else if ([v3 isSimpleSelectionEnabled])
  {
    BOOL v5 = [(PDFPage *)self string];
    BOOL v6 = v5;
    if (v5) {
      NSUInteger v4 = [v5 length];
    }
    else {
      NSUInteger v4 = 0;
    }
  }
  else
  {
    [(PDFPage *)self pageLayout];
    NSUInteger v4 = [(NSString *)self->_text length];
  }

  return v4;
}

- (NSString)string
{
  uint64_t v3 = [(PDFPage *)self document];
  if ([v3 isLocked])
  {
    NSUInteger v4 = 0;
  }
  else
  {
    if ([v3 isSimpleSelectionEnabled])
    {
      [(PDFPage *)self pageRef];
      BOOL v5 = (NSString *)CGPDFPageCopyString();
    }
    else
    {
      [(PDFPage *)self pageLayout];
      BOOL v5 = self->_text;
    }
    NSUInteger v4 = v5;
  }

  return v4;
}

- (NSAttributedString)attributedString
{
  uint64_t v3 = [(PDFPage *)self document];
  char v4 = [v3 isLocked];

  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    attributedString = self->_attributedString;
    if (!attributedString)
    {
      long long v7 = [(PDFPage *)self _createAttributedString];
      CGAffineTransform v8 = self->_attributedString;
      self->_attributedString = v7;

      attributedString = self->_attributedString;
    }
    BOOL v5 = attributedString;
  }

  return v5;
}

- (CGRect)characterBoundsAtIndex:(NSInteger)index
{
  char v4 = [(PDFPage *)self document];
  *(_OWORD *)double v24 = *MEMORY[0x263F08670];
  *(_OWORD *)&v24[16] = *(_OWORD *)(MEMORY[0x263F08670] + 16);
  if ([v4 isLocked])
  {
LABEL_2:
    double v6 = *(double *)&v24[8];
    double v5 = *(double *)v24;
    double v8 = *(double *)&v24[24];
    double v7 = *(double *)&v24[16];
    goto LABEL_3;
  }
  if (![v4 isSimpleSelectionEnabled])
  {
    if (self->_page)
    {
      if ([(PDFPage *)self pageLayout])
      {
        CGPDFLayoutGetCharacterBounds();
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
      }
      else
      {
        CGFloat v14 = *MEMORY[0x263F001A0];
        CGFloat v16 = *(double *)(MEMORY[0x263F001A0] + 8);
        CGFloat v18 = *(double *)(MEMORY[0x263F001A0] + 16);
        CGFloat v20 = *(double *)(MEMORY[0x263F001A0] + 24);
      }
      v25.origin.double x = v14;
      v25.origin.double y = v16;
      v25.size.double width = v18;
      v25.size.double height = v20;
      if (!CGRectIsNull(v25))
      {
        *(CGFloat *)double v24 = v14;
        *(CGFloat *)&v24[8] = v16;
        *(CGFloat *)&v24[16] = v18;
        *(CGFloat *)&v24[24] = v20;
      }
    }
    goto LABEL_2;
  }
  [(PDFPage *)self pageLayout];
  CGPDFPageLayoutGetCharacterSelectionBoundingBox();
  if (CGRectIsNull(*(CGRect *)v24))
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    double v5 = PDFRectFromCGRect(*(double *)v24, *(double *)&v24[8], *(double *)&v24[16], *(double *)&v24[24]);
    double v6 = v21;
    double v7 = v22;
    double v8 = v23;
  }
LABEL_3:

  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (NSInteger)characterIndexAtPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  double v6 = [(PDFPage *)self document];
  if ([v6 isLocked]) {
    goto LABEL_2;
  }
  if ([v6 isSimpleSelectionEnabled])
  {
    [(PDFPage *)self pageLayout];
    PDFPointToCGPoint(x, y);
    uint64_t TextRangeIndexAtPoint = CGPDFPageLayoutGetTextRangeIndexAtPoint();
    if (TextRangeIndexAtPoint == -1) {
      NSInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      NSInteger v7 = TextRangeIndexAtPoint;
    }
  }
  else
  {
    if (!self->_page)
    {
LABEL_2:
      NSInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    LODWORD(v10) = [(PDFPage *)self numberOfCharacters];
    double v11 = [(PDFPage *)self pageLayout];
    NSInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 && (int)v10 >= 1)
    {
      NSInteger v7 = 0;
      if (v10 <= 1uLL) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v10;
      }
      while (1)
      {
        CGPDFLayoutGetCharacterBounds();
        v12.double x = x;
        v12.double y = y;
        if (CGRectContainsPoint(v13, v12) && (unsigned __int16)(CGPDFLayoutGetCharacterUnicode() + 16) > 0xDu) {
          break;
        }
        if (v10 == ++v7) {
          goto LABEL_2;
        }
      }
    }
  }
LABEL_7:

  return v7;
}

- (int64_t)characterIndexNearestPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PDFPage *)self document];
  if ([v6 isLocked]) {
    goto LABEL_2;
  }
  int v8 = [v6 isSimpleSelectionEnabled];
  double v9 = [(PDFPage *)self pageLayout];
  if (v8)
  {
    PDFPointToCGPoint(x, y);
    uint64_t StringRangeIndexNearestPoint = CGPDFPageLayoutGetStringRangeIndexNearestPoint();
    if (StringRangeIndexNearestPoint == -1) {
      int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v7 = StringRangeIndexNearestPoint;
    }
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_2:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }
  PDFPointToCGPoint(x, y);
  if (CGPDFLayoutCreateSelectionAtPoint())
  {
    StartIndedouble x = CGPDFSelectionGetStartIndex();
    if (StartIndex != -1)
    {
      int64_t v7 = StartIndex;
      CGPDFSelectionRelease();
      goto LABEL_7;
    }
    goto LABEL_2;
  }
  CGRect v13 = [(PDFPage *)self selectionForAll];
  uint64_t v14 = [v13 numberOfTextRangesOnPage:self];
  if (!v14)
  {

    goto LABEL_2;
  }
  uint64_t v15 = v14;
  uint64_t v16 = 0;
  int64_t v7 = -1;
  double v17 = 1.79769313e308;
  do
  {
    unint64_t v18 = [v13 rangeAtIndex:v16 onPage:self];
    if (v18 < v18 + v19)
    {
      unint64_t v20 = v18;
      uint64_t v21 = v19;
      do
      {
        double v22 = -[PDFPage selectionForRange:](self, "selectionForRange:", v20, 1);
        [v22 boundsForPage:self];
        double v27 = PDFRectFromCGRect(v23, v24, v25, v26);
        double CenterPoint = PDFRectGetCenterPoint(v27, v28, v29);
        double v32 = PDFPointToCGPoint(CenterPoint, v31);
        double v34 = vabdd_f64(v32, x) + vabdd_f64(v33, y);
        if (v34 < v17)
        {
          double v17 = v34;
          int64_t v7 = v20;
        }

        ++v20;
        --v21;
      }
      while (v21);
    }
    ++v16;
  }
  while (v16 != v15);

  if (v7 < 0) {
    goto LABEL_2;
  }
LABEL_7:

  return v7;
}

- (PDFSelection)selectionForRect:(CGRect)rect
{
  char v4 = [PDFSelection alloc];
  double v5 = [(PDFPage *)self document];
  double v6 = [(PDFSelection *)v4 initWithDocument:v5];

  uint64_t v7 = CGPDFSelectionCreateInRect();
  if (v7)
  {
    [(PDFSelection *)v6 addCGSelection:v7 forPage:self];
    CGPDFSelectionRelease();
  }
  [(PDFSelection *)v6 setForceBreaks:1];

  return v6;
}

- (id)selectionForCharacterAtPoint:(CGPoint)a3
{
  PDFPointToCGPoint(a3.x, a3.y);
  uint64_t v4 = CGPDFSelectionCreateAtPointWithOptions();
  if (v4)
  {
    uint64_t v5 = v4;
    double v6 = [PDFSelection alloc];
    uint64_t v7 = [(PDFPage *)self document];
    int v8 = [(PDFSelection *)v6 initWithDocument:v7];

    [(PDFSelection *)v8 addCGSelection:v5 forPage:self];
    CGPDFSelectionRelease();
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (PDFSelection)selectionForWordAtPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  double v6 = -[PDFPage rvItemAtPoint:](self, "rvItemAtPoint:");
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 clientHints];
    double v9 = [v8 objectForKey:@"selection"];
  }
  else
  {
    double v9 = -[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 1, x, y, x, y);
  }

  return (PDFSelection *)v9;
}

- (PDFSelection)selectionForLineAtPoint:(CGPoint)point
{
  return (PDFSelection *)-[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 2, point.x, point.y, point.x, point.y);
}

- (PDFSelection)selectionFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint
{
  return (PDFSelection *)-[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 0, startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}

- (PDFSelection)selectionForRange:(NSRange)range
{
  return (PDFSelection *)-[PDFPage selectionForRangeCommon:isCodeRange:](self, "selectionForRangeCommon:isCodeRange:", range.location, range.length, 0);
}

- (NSData)dataRepresentation
{
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v4 = Mutable;
  if (Mutable)
  {
    uint64_t v5 = CGDataConsumerCreateWithCFData(Mutable);
    BOOL v6 = [(PDFPage *)self _writeToConsumer:v5];
    if (v5) {
      CGDataConsumerRelease(v5);
    }
    if (!v6)
    {
      CFRelease(v4);
      uint64_t v4 = 0;
    }
  }

  return (NSData *)v4;
}

- (void)_commonInit
{
  objc_storeWeak((id *)&self->_document, 0);
  self->_page = 0;
  self->_layoutLock._os_unfair_lock_opaque = 0;
  self->_layout = 0;
  self->_builtLayout = 0;
  self->_dataDetectorsLock._os_unfair_lock_opaque = 0;
  self->_ranDataDetectors = 0;
  text = self->_text;
  self->_text = 0;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  self->_loadedAnnotations = 0;
  annotations = self->_annotations;
  self->_annotations = 0;

  *(_WORD *)&self->_displaysAnnotations = 257;
  BOOL v6 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  lock_getAnnotations = self->_lock_getAnnotations;
  self->_lock_getAnnotations = v6;

  int v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  lock_accessAnnotations = self->_lock_accessAnnotations;
  self->_lock_accessAnnotations = v8;

  detectedAnnotations = self->_detectedAnnotations;
  self->_detectedAnnotations = 0;

  self->_int64_t rotation = 0;
  CGPoint v11 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v12 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_mediaBox.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_mediaBox.size = v12;
  self->_cropBox.origin = v11;
  self->_cropBox.size = v12;
  self->_bleedBox.origin = v11;
  self->_bleedBox.size = v12;
  self->_trimBox.origin = v11;
  self->_trimBox.size = v12;
  self->_artBox.origin = v11;
  self->_artBox.size = v12;
  self->_displayList = 0;
  self->_creatingDisplayList = 0;
  CGRect v13 = (NSMutableArray *)objc_opt_new();
  createDisplayListCompletionBlocks = self->_createDisplayListCompletionBlocks;
  self->_createDisplayListCompletionBlocks = v13;

  self->_akDidSetupRealPageModelController = 0;
  self->_displayListMutex._os_unfair_lock_opaque = 0;
  *(uint32_t *)((char *)&self->_displayListMutex._os_unfair_lock_opaque + 3) = 0;
  uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  annotationChanges = self->_annotationChanges;
  self->_annotationChanges = v15;

  double v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v17;

  uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  widgetAnnotationLookup = self->_widgetAnnotationLookup;
  self->_widgetAnnotationLookup = v19;

  self->_widgetAnnotationLookupLock._os_unfair_lock_opaque = 0;
  uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  scannerResults = self->_scannerResults;
  self->_scannerResults = v21;

  self->_candidateForOCR = 2;
  self->candidateForFormDetection = 1;
}

- (id)_createAttributedString
{
  id v2 = [(PDFPage *)self selectionForAll];
  uint64_t v3 = [v2 attributedString];

  return v3;
}

+ (CGPDFPage)_createPageRefFromImage:(CGImage *)a3 andOptions:(id)a4
{
  id v5 = a4;
  if (!a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"%s: image must not be NULL", "+[PDFPage _createPageRefFromImage:andOptions:]");
  }
  BOOL v6 = [v5 objectForKeyedSubscript:@"PDFPageImageInitializationOptionRotation"];
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 intValue];
    HIDWORD(v9) = -1527099483 * v8 + 47721858;
    LODWORD(v9) = HIDWORD(v9);
    if ((v9 >> 1) >= 0x2D82D83) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"%s: PDFPageImageInitializationOptionRotation must be a multiple of 90", "+[PDFPage _createPageRefFromImage:andOptions:]");
    }
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"PDFPageImageInitializationOptionMediaBox"];
  CGPoint v11 = v10;
  if (v10) {
    [v10 PDFKitPDFRectValue];
  }
  else {
    CGImageGetSizeAfterOrientation();
  }
  CGSize v12 = (void *)[v5 mutableCopy];
  CGRect v13 = [v5 objectForKeyedSubscript:@"PDFPageImageInitializationOptionUpscaleIfSmaller"];

  if (v13)
  {
    int v14 = [v13 BOOLValue];
    uint64_t v15 = (void *)MEMORY[0x263EFFB40];
    if (!v14) {
      uint64_t v15 = (void *)MEMORY[0x263EFFB38];
    }
    [v12 setObject:*v15 forKeyedSubscript:*MEMORY[0x263F004A0]];
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:@"PDFPageImageInitializationOptionCompressionQuality"];

  if (v16)
  {
    [v16 doubleValue];
    double v18 = v17;
    if (v17 < 0.0 || v17 > 1.0) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"%s: PDFPageImageInitializationOptionCompressionQuality must be between 0.0 and 1.0", "+[PDFPage _createPageRefFromImage:andOptions:]");
    }
    uint64_t v19 = [NSNumber numberWithDouble:v18];
    [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x263F00428]];
  }
  id v20 = v12;

  uint64_t v21 = (CGPDFPage *)CGPDFPageCreateWithImage();
  if (!v21) {
    NSLog(&cfstr_Cgpdfpagecreat.isa, a3);
  }

  return v21;
}

- (id)selectionForRangeCommon:(_NSRange)a3 isCodeRange:(BOOL)a4
{
  if (a3.length)
  {
    BOOL v4 = a4;
    [(PDFPage *)self numberOfCharacters];
    BOOL v6 = [PDFSelection alloc];
    uint64_t v7 = [(PDFPage *)self document];
    int v8 = [(PDFSelection *)v6 initWithDocument:v7];

    if (v8)
    {
      uint64_t v9 = v4 ? CGPDFSelectionCreateForRange() : CGPDFSelectionCreateForStringRange();
      if (v9)
      {
        [(PDFSelection *)v8 addCGSelection:v9 forPage:self];
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)fontWithPDFFont:(CGPDFFont *)a3 size:(float)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  Font = (CGFont *)CGPDFFontGetFont();
  CFStringRef v6 = CGFontCopyPostScriptName(Font);
  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_35;
  }
  uint64_t v7 = (__CFString *)v6;
  uint64_t v8 = *MEMORY[0x263F03AE8];
  uint64_t v25 = *MEMORY[0x263F03AE8];
  v26[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  uint64_t v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

  if (v10)
  {
    CTFontDescriptorRef MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v10, 0);
    CFRelease(v10);
    if (!MatchingFontDescriptor
      || ([MEMORY[0x263F82760] fontWithDescriptor:MatchingFontDescriptor size:a4],
          uint64_t v10 = (const __CTFontDescriptor *)objc_claimAutoreleasedReturnValue(),
          MatchingFontDescriptor,
          !v10))
    {
      if ((unint64_t)[(__CFString *)v7 length] >= 8
        && [(__CFString *)v7 characterAtIndex:6] == 43)
      {
        CGSize v12 = [(__CFString *)v7 substringFromIndex:7];

        uint64_t v23 = v8;
        double v24 = v12;
        CGRect v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v10 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

        if (!v10) {
          goto LABEL_34;
        }
        CTFontDescriptorRef v14 = CTFontDescriptorCreateMatchingFontDescriptor(v10, 0);
        CFRelease(v10);
        if (v14)
        {
          uint64_t v10 = [MEMORY[0x263F82760] fontWithDescriptor:v14 size:a4];

          if (v10) {
            goto LABEL_34;
          }
        }
      }
      else
      {
        CGSize v12 = v7;
      }
      if ([v12 isEqualToString:@"Arial,Bold"])
      {
        uint64_t v15 = @"Arial-BoldMT";
      }
      else if ([v12 isEqualToString:@"Arial,BoldItalic"])
      {
        uint64_t v15 = @"Arial-BoldItalicMT";
      }
      else if ([v12 isEqualToString:@"Arial,Italic"])
      {
        uint64_t v15 = @"Arial-ItalicMT";
      }
      else if (([v12 isEqualToString:@"Helvetica-Black"] & 1) != 0 {
             || ([v12 isEqualToString:@"Helvetica-Narrow-Bold"] & 1) != 0)
      }
      {
        uint64_t v15 = @"Helvetica-Bold";
      }
      else if ([v12 isEqualToString:@"HelveticaNeue-Black"])
      {
        uint64_t v15 = @"HelveticaNeue-Bold";
      }
      else if ([v12 isEqualToString:@"TimesNewRoman"])
      {
        uint64_t v15 = @"TimesNewRomanPSMT";
      }
      else if ([v12 isEqualToString:@"TimesNewRoman,Bold"])
      {
        uint64_t v15 = @"TimesNewRomanPS-BoldMT";
      }
      else if ([v12 isEqualToString:@"TimesNewRoman,BoldItalic"])
      {
        uint64_t v15 = @"TimesNewRomanPS-BoldItalicMT";
      }
      else if ([v12 isEqualToString:@"TimesNewRoman,Italic"])
      {
        uint64_t v15 = @"TimesNewRomanPS-ItalicMT";
      }
      else
      {
        if (![v12 isEqualToString:@"ZapfDingbats"]) {
          goto LABEL_24;
        }
        uint64_t v15 = @"ZapfDingbatsITC";
      }
      uint64_t v16 = [MEMORY[0x263F82760] fontWithName:v15 size:a4];
      if (v16)
      {
LABEL_33:
        uint64_t v10 = (const __CTFontDescriptor *)v16;
        goto LABEL_34;
      }
LABEL_24:
      CGPDFFontGetFontDescriptor();
      char Flags = CGPDFFontDescriptorGetFlags();
      double v18 = @"Courier";
      double v19 = a4;
      if ((Flags & 1) == 0) {
        double v18 = @"Times";
      }
      id v20 = @"Helvetica";
      if (Flags) {
        id v20 = @"Monaco";
      }
      if ((Flags & 2) != 0) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v16 = [MEMORY[0x263F82760] fontWithName:v21 size:v19];
      if (!v16)
      {
        uint64_t v16 = [MEMORY[0x263F82760] fontWithName:@"Times" size:v19];
      }
      goto LABEL_33;
    }
  }
  CGSize v12 = v7;
LABEL_34:

LABEL_35:

  return v10;
}

- (id)selectionFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 type:(int)a5
{
  double y = a4.y;
  double x = a4.x;
  PDFPointToCGPoint(a3.x, a3.y);
  PDFPointToCGPoint(x, y);
  uint64_t v8 = [(PDFPage *)self document];
  [v8 isSimpleSelectionEnabled];
  if (![(PDFPage *)self pageLayout])
  {
LABEL_7:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = [[PDFSelection alloc] initWithDocument:v8];
  if (v9)
  {
    uint64_t BetweenPointsWithOptions = CGPDFSelectionCreateBetweenPointsWithOptions();
    if (BetweenPointsWithOptions)
    {
      uint64_t v11 = BetweenPointsWithOptions;
      CGPDFSelectionGetBounds();
      if (v12 != 0.0)
      {
        [(PDFSelection *)v9 addCGSelection:v11 forPage:self];
        CGPDFSelectionRelease();
        goto LABEL_8;
      }
      CGPDFSelectionRelease();

      goto LABEL_7;
    }
  }
LABEL_8:

  return v9;
}

- (id)selectionForAll
{
  uint64_t v3 = [PDFSelection alloc];
  BOOL v4 = [(PDFPage *)self document];
  id v5 = [(PDFSelection *)v3 initWithDocument:v4];

  if (v5)
  {
    if ([(PDFPage *)self numberOfCharacters])
    {
      uint64_t v6 = CGPDFSelectionCreateForStringRange();
      if (v6)
      {
        [(PDFSelection *)v5 addCGSelection:v6 forPage:self];
        CGPDFSelectionRelease();
      }
    }
    uint64_t v7 = v5;
  }

  return v5;
}

- (id)selectionFromTopToPoint:(CGPoint)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v6 = PDFPointToCGPoint(a3.x, a3.y);
  double v8 = v7;
  uint64_t v9 = [(PDFPage *)self document];
  [v9 isSimpleSelectionEnabled];
  if ([(PDFPage *)self pageLayout])
  {
    uint64_t v10 = [[PDFSelection alloc] initWithDocument:v9];
    if (v10)
    {
      uint64_t v11 = MEMORY[0x2166A0460](self->_page, v4, v6, v8, 20.0);
      if (v11)
      {
        [(PDFSelection *)v10 addCGSelection:v11 forPage:self];
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)selectionFromPointToBottom:(CGPoint)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v6 = PDFPointToCGPoint(a3.x, a3.y);
  double v8 = v7;
  uint64_t v9 = [(PDFPage *)self document];
  [v9 isSimpleSelectionEnabled];
  if ([(PDFPage *)self pageLayout])
  {
    uint64_t v10 = [[PDFSelection alloc] initWithDocument:v9];
    if (v10)
    {
      uint64_t v11 = MEMORY[0x2166A0410](self->_page, v4, v6, v8, 20.0);
      if (v11)
      {
        [(PDFSelection *)v10 addCGSelection:v11 forPage:self];
        CGPDFSelectionRelease();
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_addBox:(int)a3 toDictionary:(__CFDictionary *)a4 offset:(CGPoint)a5
{
  if (a4 && a3 <= 4)
  {
    v18[4] = v8;
    v18[5] = v7;
    v18[10] = v5;
    v18[11] = v6;
    uint64_t v9 = (const void *)**((void **)&unk_264205328 + a3);
    if (v9)
    {
      double y = a5.y;
      double x = a5.x;
      double v13 = PDFRectToCGRect([(PDFPage *)self boundsForBox:a3]);
      v18[2] = v14;
      v18[3] = v15;
      v18[0] = v13 - x;
      v18[1] = v16 - y;
      CFDataRef v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v18, 32);
      CFDictionaryAddValue(a4, v9, v17);
      CFRelease(v17);
    }
  }
}

- (BOOL)hasCropBox
{
  [(PDFPage *)self boundsForBox:1];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PDFPage *)self boundsForBox:0];
  v17.origin.double x = v11;
  v17.origin.double y = v12;
  v17.size.double width = v13;
  v17.size.double height = v14;
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  if (NSEqualRects(v16, v17)) {
    return 0;
  }
  if (v10 > 0.0) {
    return v8 > 0.0;
  }
  return 0;
}

- (BOOL)hasBleedBox
{
  [(PDFPage *)self boundsForBox:2];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PDFPage *)self boundsForBox:1];
  v17.origin.double x = v11;
  v17.origin.double y = v12;
  v17.size.double width = v13;
  v17.size.double height = v14;
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  if (NSEqualRects(v16, v17)) {
    return 0;
  }
  if (v10 > 0.0) {
    return v8 > 0.0;
  }
  return 0;
}

- (BOOL)hasTrimBox
{
  [(PDFPage *)self boundsForBox:3];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PDFPage *)self boundsForBox:1];
  v17.origin.double x = v11;
  v17.origin.double y = v12;
  v17.size.double width = v13;
  v17.size.double height = v14;
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  if (NSEqualRects(v16, v17)) {
    return 0;
  }
  if (v10 > 0.0) {
    return v8 > 0.0;
  }
  return 0;
}

- (BOOL)hasArtBox
{
  [(PDFPage *)self boundsForBox:4];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PDFPage *)self boundsForBox:1];
  v17.origin.double x = v11;
  v17.origin.double y = v12;
  v17.size.double width = v13;
  v17.size.double height = v14;
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  if (NSEqualRects(v16, v17)) {
    return 0;
  }
  if (v10 > 0.0) {
    return v8 > 0.0;
  }
  return 0;
}

- (CGDisplayList)copyDisplayList
{
  p_displayListMutedouble x = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  displayList = self->_displayList;
  CGDisplayListRetain();
  os_unfair_lock_unlock(p_displayListMutex);
  return displayList;
}

- (CGDisplayList)_createDisplayListTrackingGlyphs:(BOOL)a3
{
  if (!self->_page) {
    return 0;
  }
  CGFloat v4 = [(PDFPage *)self document];
  double v5 = [v4 renderingProperties];

  if (!v5) {
    double v5 = objc_alloc_init(PDFRenderingProperties);
  }
  [(PDFPage *)self boundsForBox:[(PDFRenderingProperties *)v5 displayBox]];
  [(PDFPage *)self rotation];
  CGFloat v6 = (CGDisplayList *)CGDisplayListCreateWithRect();
  if (v6)
  {
    uint64_t v7 = CGDisplayListContextCreate();
    if (v7)
    {
      double v8 = (CGContext *)v7;
      [(PDFPage *)self drawWithBox:[(PDFRenderingProperties *)v5 displayBox] inContext:v7];
      CGContextRelease(v8);
    }
  }

  return v6;
}

- (void)_createRetainedDisplayList
{
  if (self->_page)
  {
    double v3 = [(PDFPage *)self _createDisplayListTrackingGlyphs:0];
    if (v3)
    {
      CGFloat v4 = v3;
      os_unfair_lock_lock(&self->_displayListMutex);
      self->_displayList = v4;
      self->_creatingDisplayList = 0;
      id v5 = (id)[(NSMutableArray *)self->_createDisplayListCompletionBlocks copy];
      [(NSMutableArray *)self->_createDisplayListCompletionBlocks removeAllObjects];
      os_unfair_lock_unlock(&self->_displayListMutex);
      [v5 enumerateObjectsWithOptions:0 usingBlock:&__block_literal_global_302];
    }
  }
}

void __37__PDFPage__createRetainedDisplayList__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [v5 queue];

  if (v2)
  {
    uint64_t v3 = [v5 queue];
    CGFloat v4 = [v5 block];
    dispatch_async((dispatch_queue_t)v3, v4);
  }
  else
  {
    uint64_t v3 = [v5 block];
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)_releaseDisplayList
{
  p_displayListMutedouble x = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  displayList = self->_displayList;
  if (displayList)
  {
    CFRelease(displayList);
    self->_displayList = 0;
  }

  os_unfair_lock_unlock(p_displayListMutex);
}

- (void)ensureDisplayList
{
  if (!self->_displayList) {
    [(PDFPage *)self _createRetainedDisplayList];
  }
}

- (void)getDisplayListWithCompletion:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    double v9 = v7;
  }
  else
  {
    double v9 = MEMORY[0x263EF83A0];
    id v10 = MEMORY[0x263EF83A0];
  }
  p_displayListMutedouble x = &self->_displayListMutex;
  os_unfair_lock_lock(&self->_displayListMutex);
  if (!self->_displayList)
  {
    if (v6)
    {
      uint64_t v12 = +[PDFBlockQueuePair blockQueuePairWithBlock:v6 andQueue:v8];
      CGFloat v13 = (void *)v12;
      if (self->_creatingDisplayList)
      {
        if (v12) {
          [(NSMutableArray *)self->_createDisplayListCompletionBlocks addObject:v12];
        }
        goto LABEL_13;
      }
      self->_creatingDisplayList = 1;
      objc_initWeak(&location, self);
      if (v13) {
        [(NSMutableArray *)self->_createDisplayListCompletionBlocks addObject:v13];
      }
    }
    else
    {
      if (self->_creatingDisplayList)
      {
        CGFloat v13 = 0;
LABEL_13:
        os_unfair_lock_unlock(&self->_displayListMutex);
LABEL_18:

        goto LABEL_19;
      }
      self->_creatingDisplayList = 1;
      objc_initWeak(&location, self);
      CGFloat v13 = 0;
    }
    CGFloat v14 = [(id)objc_opt_class() displayListCreationQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__PDFPage_getDisplayListWithCompletion_onQueue___block_invoke;
    v15[3] = &unk_2642043A0;
    objc_copyWeak(&v16, &location);
    dispatch_async(v14, v15);

    os_unfair_lock_unlock(p_displayListMutex);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  os_unfair_lock_unlock(&self->_displayListMutex);
  if (v6) {
    dispatch_async(v9, v6);
  }
LABEL_19:
}

void __48__PDFPage_getDisplayListWithCompletion_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _createRetainedDisplayList];
}

- (CGDisplayList)createDisplayListForFormDetection
{
  return [(PDFPage *)self _createDisplayListTrackingGlyphs:1];
}

- (BOOL)_writeToConsumer:(CGDataConsumer *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
  id v6 = CGPDFContextCreate(a3, 0, 0);
  if (v6)
  {
    BOOL v7 = [(PDFPage *)self displaysAnnotations];
    double v8 = [(PDFPage *)self gcCreateBoxDictionary];
    double valuePtr = (double)[(PDFPage *)self rotation];
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionaryAddValue(v8, @"Rotate", v9);
    CGPDFContextBeginPage(v6, v8);
    [(PDFPage *)self setDisplaysAnnotations:0];
    [(PDFPage *)self drawWithBox:0 toContext:v6];
    [(PDFPage *)self setDisplaysAnnotations:v7];
    [(NSLock *)self->_lock_accessAnnotations lock];
    id v10 = [(PDFPage *)self annotations];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * v14) dictionaryRef]) {
            CGPDFContextAddAnnotation();
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
    [(NSLock *)self->_lock_accessAnnotations unlock];
    CGPDFContextEndPage(v6);
    CGPDFContextClose(v6);

    CGContextRelease(v6);
    if (v8) {
      CFRelease(v8);
    }
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:v5];
  return v6 != 0;
}

- (__CFDictionary)gcCreateBoxDictionary
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  [(PDFPage *)self boundsForBox:0];
  double v6 = v5;
  double v8 = v7;
  -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 0, Mutable);
  CFNumberRef v9 = self->_akPageAdaptor;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [(PDFAKPageAdaptor *)v9 akPageModelController];
    uint64_t v12 = [v11 cropAnnotation];
    uint64_t v13 = v12;
    if (v12)
    {
      if ([v12 cropApplied])
      {
        uint64_t v14 = [(PDFPage *)self pageRef];
        CGRect BoxRect = CGPDFPageGetBoxRect(v14, kCGPDFCropBox);
        CGRect v38 = CGRectIntegral(BoxRect);
        CGFloat x = v38.origin.x;
        CGFloat y = v38.origin.y;
        CGFloat height = v38.size.height;
        CGFloat width = v38.size.width;
        [v13 rectangle];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGRect v42 = CGPDFPageGetBoxRect(v14, kCGPDFMediaBox);
        v39.origin.CGFloat x = v18;
        v39.origin.CGFloat y = v20;
        v39.size.CGFloat width = v22;
        v39.size.CGFloat height = v24;
        CGRect v40 = CGRectIntersection(v39, v42);
        CGRect v41 = CGRectIntegral(v40);
        double v25 = v41.origin.x;
        double v26 = v41.origin.y;
        double v27 = v41.size.width;
        double v28 = v41.size.height;
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat height = height;
        v41.size.CGFloat width = width;
        v43.origin.CGFloat x = v25;
        v43.origin.CGFloat y = v26;
        v43.size.CGFloat width = v27;
        v43.size.CGFloat height = v28;
        if (!CGRectEqualToRect(v41, v43) && v27 > 0.0 && v28 > 0.0)
        {
          double v35 = v27;
          double v36 = v28;
          *(double *)bytes = v25 - v6;
          double v34 = v26 - v8;
          CFDataRef v29 = CFDataCreate(v3, bytes, 32);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F003C0], v29);
          CFRelease(v29);

          goto LABEL_11;
        }
      }
    }
  }
  if ([(PDFPage *)self hasCropBox]) {
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 1, Mutable, v6, v8);
  }
LABEL_11:
  if ([(PDFPage *)self hasBleedBox]) {
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 2, Mutable, v6, v8);
  }
  if ([(PDFPage *)self hasTrimBox]) {
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 3, Mutable, v6, v8);
  }
  if ([(PDFPage *)self hasArtBox]) {
    -[PDFPage _addBox:toDictionary:offset:](self, "_addBox:toDictionary:offset:", 4, Mutable, v6, v8);
  }
  return Mutable;
}

- (void)_buildPageLayout
{
  if (self->_page && !self->_layout && !self->_ranDataDetectors)
  {
    id v8 = [(PDFPage *)self document];
    if ([v8 isSimpleSelectionEnabled])
    {
      CFAllocatorRef v3 = (CGPDFLayout *)CGPDFPageCopyPageLayout();
      self->_layout = v3;
      if (v3) {
        atomic_store(1u, (unsigned __int8 *)&self->_builtLayout);
      }
    }
    else
    {
      CGFloat v4 = (void *)MEMORY[0x2166A0EA0]();
      [(PDFPage *)self pageRef];
      Layout = (CGPDFLayout *)CGPDFPageGetLayout();
      self->_layout = Layout;
      if (Layout)
      {
        atomic_store(1u, (unsigned __int8 *)&self->_builtLayout);
        CGPDFLayoutRetain();
        String = (NSString *)CGPDFLayoutCreateString();
        text = self->_text;
        self->_text = String;
      }
    }
    [(PDFPage *)self _scanData:v8];
  }
}

- (void)purgePageLayout
{
  if (self->_page)
  {
    p_builtLayout = &self->_builtLayout;
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_builtLayout);
    if (v4)
    {
      os_unfair_lock_lock(&self->_layoutLock);
      os_unfair_lock_lock(&self->_dataDetectorsLock);
      CGPDFLayoutRelease();
      self->_layout = 0;
      [(PDFPage *)self pageRef];
      CGPDFPageRemoveLayout();
      self->_ranDataDetectors = 0;
      os_unfair_lock_unlock(&self->_dataDetectorsLock);
      os_unfair_lock_unlock(&self->_layoutLock);
      atomic_store(0, (unsigned __int8 *)p_builtLayout);
    }
  }
}

- (void)fetchPageLayoutWithCompletion:(id)a3 deliveredOnQueue:(id)a4
{
  double v6 = (void (**)(id, CGPDFLayout *))a3;
  id v7 = a4;
  if (self->_page)
  {
    unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_builtLayout);
    if (v8)
    {
      v6[2](v6, self->_layout);
    }
    else
    {
      p_layoutLock = &self->_layoutLock;
      os_unfair_lock_lock(&self->_layoutLock);
      if (!self->_layout)
      {
        objc_initWeak(&location, self);
        id v10 = [(PDFPage *)self document];
        uint64_t v11 = [v10 textExtractionQueue];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke;
        v12[3] = &unk_264205278;
        objc_copyWeak(&v15, &location);
        id v13 = v7;
        uint64_t v14 = v6;
        dispatch_async(v11, v12);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
      os_unfair_lock_unlock(p_layoutLock);
    }
  }
}

void __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  CFAllocatorRef v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    uint64_t v4 = *(void *)&v3[18]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v3 + 16);
    if (!v4) {
      [(os_unfair_lock_s *)v3 _buildPageLayout];
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke_2;
    v6[3] = &unk_264203FE8;
    double v5 = *(NSObject **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __58__PDFPage_fetchPageLayoutWithCompletion_deliveredOnQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 72));
}

- (CGPDFLayout)pageLayout
{
  CGRect result = self->_layout;
  if (!result)
  {
    [(PDFPage *)self _buildPageLayout];
    return self->_layout;
  }
  return result;
}

- (CGPDFLayout)pageLayoutIfAvail
{
  CGRect result = self->_layout;
  if (!result)
  {
    [(PDFPage *)self fetchPageLayoutWithCompletion:&__block_literal_global_309 deliveredOnQueue:MEMORY[0x263EF83A0]];
    return self->_layout;
  }
  return result;
}

- (BOOL)isBookmarked
{
  return self->_bookmarked;
}

- (void)setBookmarked:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  id v11 = WeakRetained;
  if (WeakRetained && ([WeakRetained allowsDocumentAssembly] & 1) == 0)
  {
    uint64_t v9 = [v11 permissionsStatus];
    id v10 = @"user";
    if (v9 == 2) {
      id v10 = @"owner";
    }
    NSLog(&cfstr_CannotSetBookm.isa, v10);
  }
  else
  {
    [(PDFPage *)self setBookmarked:v3 updateBookmarks:1];
    id v6 = objc_loadWeakRetained((id *)&self->_view);
    if ([v6 displaysBookmarksForPages])
    {
      id v7 = objc_msgSend(v6, "pageViewForPageAtIndex:", objc_msgSend(v11, "indexForPage:", self));
      id v8 = v7;
      if (v7)
      {
        if (self->_bookmarked) {
          [v7 addBookmark];
        }
        else {
          [v7 removeBookmark];
        }
      }
    }
    if (v11) {
      objc_msgSend(v11, "setBookmarked:atPageIndex:", v3, objc_msgSend(v11, "indexForPage:", self));
    }
  }
}

- (void)setBookmarked:(BOOL)a3 updateBookmarks:(BOOL)a4
{
  self->_bookmarked = a3;
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    [WeakRetained updateBookmarksInPDFDocument];
  }
}

- (char)isCandidateForOCR
{
  return self->_candidateForOCR;
}

- (void)setCandidateForOCR:(char)a3
{
  self->_candidateForOCR = a3;
}

- (BOOL)didPerformOCR
{
  return self->_didPerformOCR;
}

- (void)setDidPerformOCR:(BOOL)a3
{
  self->_didPerformOCR = a3;
}

- (char)isCandidateForFormDetection
{
  return self->candidateForFormDetection;
}

- (BOOL)didPerformFormDetection
{
  return self->_didPerformFormDetection;
}

- (void)setDidPerformFormDetection:(BOOL)a3
{
  self->_didPerformFormDetection = a3;
}

- (BOOL)requestedOCR
{
  return self->_requestedOCR;
}

- (BOOL)isTextFromOCR
{
  return self->_textFromOCR;
}

- (BOOL)containsFormFields
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_annotations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isActivatableTextField", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsDetectedFormFields
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = self->_detectedAnnotations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(v3);
      }
      long long v8 = [*(id *)(*((void *)&v20 + 1) + 8 * v7) valueForAnnotationKey:@"/AAPL:SFF"];

      if (v8) {
        goto LABEL_18;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_annotations;
  uint64_t v9 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_11:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v3);
      }
      id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "valueForAnnotationKey:", @"/AAPL:SFF", (void)v16);

      if (v13) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    BOOL v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (BOOL)containsFormFieldsWithContentType
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = self->_detectedAnnotations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(v3);
      }
      long long v8 = [*(id *)(*((void *)&v18 + 1) + 8 * v7) autoFillTextContentType];

      if (v8) {
        goto LABEL_18;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_annotations;
  uint64_t v9 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v3);
      }
      uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "autoFillTextContentType", (void)v14);

      if (v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v9) = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)detectedFormFieldsRecognitionConfidence
{
  return self->_detectedFormFieldsRecognitionConfidence;
}

- (void)setDetectedFormFieldsRecognitionConfidence:(unint64_t)a3
{
  self->_detectedFormFieldsRecognitionConfidence = a3;
}

- (BOOL)colorWidgetBackgrounds
{
  return self->_colorWidgetBackgrounds;
}

- (void)setColorWidgetBackgrounds:(BOOL)a3
{
  self->_colorWidgetBackgrounds = a3;
}

- (void)addRedactionFromRectangularSelectionWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v8 = self->_akPageAdaptor;
  if (v8)
  {
    long long v16 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    uint64_t v10 = [WeakRetained akController];
    uint64_t v11 = [WeakRetained indexForPage:self];
    id v12 = objc_alloc_init((Class)AKRedactionRectAnnotationClass());
    id v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setRectangle:", x, y, width, height);
      objc_msgSend(v13, "setOriginalExifOrientation:", objc_msgSend(v10, "currentExifOrientationForPageAtIndex:", v11));
      [v10 currentModelBaseScaleFactorForPageAtIndex:v11];
      objc_msgSend(v13, "setOriginalModelBaseScaleFactor:");
      long long v14 = [(PDFAKPageAdaptor *)v16 akPageModelController];
      long long v15 = [v14 mutableArrayValueForKey:@"annotations"];
      [v15 addObject:v13];
    }
    long long v8 = v16;
  }
}

+ (void)setNativeRotationDrawingEnabledForThisThread:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFKitNativeRotationDrawingEnabledKey"];
}

+ (BOOL)isNativeRotationDrawingEnabledForThisThread
{
  id v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"PDFKitNativeRotationDrawingEnabledKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (void)setShouldHideAnnotationsForThisThread:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  char v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFKitShouldDrawAnnotationsKey"];
}

+ (BOOL)shouldHideAnnotationsForThisThread
{
  id v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"PDFKitShouldDrawAnnotationsKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

+ (void)setExcludingAKAnnotationRenderingForThisThread:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  char v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFKitRenderingForTilesKey"];
}

+ (BOOL)isExcludingAKAnnotationRenderingForThisThread
{
  id v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"PDFKitRenderingForTilesKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)columnAtPointIfAvailable:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PDFPage *)self document];
  if ([v6 isSimpleSelectionEnabled])
  {
    -[PDFPage columnFrameAtPoint:](self, "columnFrameAtPoint:", x, y);
    BOOL v7 = CGRectEqualToRect(v10, *MEMORY[0x263F001A8]);
  }
  else
  {
    if (![(PDFPage *)self pageLayoutIfAvail])
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    BOOL v7 = -[PDFPage columnAtPoint:](self, "columnAtPoint:", x, y);
  }
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)columnAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PDFPage *)self document];
  if ([v6 isSimpleSelectionEnabled])
  {
    -[PDFPage columnFrameAtPoint:](self, "columnFrameAtPoint:", x, y);
    BOOL v7 = CGRectEqualToRect(v9, *MEMORY[0x263F001A8]);
  }
  else
  {
    BOOL v7 = [(PDFPage *)self pageLayout] && CGPDFLayoutGetRootNode() && CGPDFNodeGetNodeContainingPoint() != 0;
  }

  return v7;
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_view, obj);
    [(PDFPage *)self enableUndoManagerForAK:[(PDFPage *)self disableUndoManagerForAK]];
  }
}

- (id)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return WeakRetained;
}

- (CGAffineTransform)getDrawingTransformForBox:(SEL)a3
{
  BOOL v7 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
  uint64_t v8 = MEMORY[0x263F000D0];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  CGRect result = (CGAffineTransform *)[(PDFPage *)self boundsForBox:a4];
  double x = v11;
  double y = v13;
  double width = v15;
  double height = v17;
  if (a4)
  {
    [(PDFPage *)self boundsForBox:0];
    v30.origin.double x = v19;
    v30.origin.double y = v20;
    v30.size.double width = v21;
    v30.size.double height = v22;
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    NSRect v29 = NSIntersectionRect(v28, v30);
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
  }
  if (!v7)
  {
    CGRect result = [(PDFPage *)self rotation];
    if (result == (CGAffineTransform *)270)
    {
      double v23 = height + y;
      long long v24 = xmmword_2144231A0;
      long long v25 = xmmword_214423050;
      double v26 = -x;
      goto LABEL_11;
    }
    if (result == (CGAffineTransform *)180)
    {
      double v23 = width + x;
      double v26 = height + y;
      CGFloat v27 = -1.0;
      goto LABEL_9;
    }
    if (result == (CGAffineTransform *)90)
    {
      double v23 = -y;
      long long v24 = xmmword_2144231B0;
      long long v25 = xmmword_2144231C0;
      double v26 = width + x;
LABEL_11:
      *(_OWORD *)&retstr->a = v24;
      *(_OWORD *)&retstr->c = v25;
      goto LABEL_12;
    }
  }
  double v23 = -x;
  double v26 = -y;
  CGFloat v27 = 1.0;
LABEL_9:
  retstr->a = v27;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v27;
LABEL_12:
  retstr->tdouble x = v23;
  retstr->tdouble y = v26;
  return result;
}

- (void)drawAnnotationsWithBox:(int64_t)a3 inContext:(CGContext *)a4 passingTest:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = (unsigned int (**)(id, void))a5;
  long long v9 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_annotations];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if ((!v8 || v8[2](v8, *(void *)(*((void *)&v16 + 1) + 8 * v13)))
          && ([v14 intersectsWithRedactionPath] & 1) == 0)
        {
          uint64_t v15 = [v14 isTransparent];
          [v14 setIsTransparent:0];
          [v14 drawWithBox:a3 inContext:a4];
          [v14 setIsTransparent:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)detectedAnnotations
{
  return self->_detectedAnnotations;
}

- (BOOL)disableUndoManagerForAK
{
  if (GetDefaultsWriteAKEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (!WeakRetained)
    {
      uint64_t v4 = [(PDFPage *)self document];
      char v5 = [v4 renderingProperties];
      id WeakRetained = [v5 pdfView];
    }
    id v6 = [WeakRetained undoManager];
    int v7 = [v6 isUndoRegistrationEnabled];
    if (v7) {
      [v6 disableUndoRegistration];
    }
    if (WeakRetained) {
      [(PDFPage *)self setupAKPageAdaptorIfNecessary];
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)enableUndoManagerForAK:(BOOL)a3
{
  BOOL v3 = a3;
  if (!GetDefaultsWriteAKEnabled()) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (!WeakRetained)
  {
    int v7 = [(PDFPage *)self document];
    uint64_t v8 = [v7 renderingProperties];
    id v10 = [v8 pdfView];

    id WeakRetained = v10;
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v3)
  {
LABEL_4:
    id v9 = WeakRetained;
    id v6 = [WeakRetained undoManager];
    [v6 enableUndoRegistration];

    id WeakRetained = v9;
  }
LABEL_5:
}

- (Class)annotationSubclassForSubtype:(id)a3
{
  id v4 = a3;
  char v5 = [(PDFPage *)self document];
  id v6 = v5;
  if (v5 && (int v7 = (void *)[v5 annotationSubclassForType:v4]) != 0)
  {
    id v8 = v7;
  }
  else
  {
    objc_opt_class();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return (Class)v9;
}

- (void)getAnnotations
{
  if (self->_page)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    if (v3)
    {
      double MachSeconds = GetMachSeconds();
      char v5 = [MEMORY[0x263EFF980] array];
      id v6 = [(PDFPage *)self document];
      int v7 = [v6 hasHighLatencyDataProvider];
      char v8 = v7;
      if (v7 && [MEMORY[0x263F08B88] isMainThread])
      {
        _PDFLog(OS_LOG_TYPE_FAULT, (uint64_t)"PDFAnnotation", (uint64_t)"getAnnotations() is being called on main thread", v9, v10, v11, v12, v13, v28);
      }
      else
      {
        char v14 = [v6 callShouldReadAKInkAnnotations];
        uint64_t v36 = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        CGRect v38 = __25__PDFPage_getAnnotations__block_invoke;
        CGRect v39 = &unk_2642052C0;
        CGRect v40 = self;
        char v43 = v14;
        id v15 = v3;
        id v41 = v15;
        id v16 = v5;
        id v42 = v16;
        char v44 = v8;
        CGPDFPageEnumerateAnnotations();
        long long v17 = [MEMORY[0x263EFF980] arrayWithArray:v15];
        annotations = self->_annotations;
        self->_annotations = v17;

        long long v19 = [v6 delegate];
        if (objc_opt_respondsToSelector()) {
          [v19 pdfDocument:v6 loadedAnnotations:self->_annotations forPage:self];
        }
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v30 = 3221225472;
        double v31 = __25__PDFPage_getAnnotations__block_invoke_3;
        double v32 = &unk_264204420;
        double v33 = self;
        id v34 = v15;
        id v35 = v16;
        CGFloat v20 = (void (**)(void))_Block_copy(&aBlock);
        if (self->_akPageAdaptor && ![MEMORY[0x263F08B88] isMainThread]) {
          dispatch_async(MEMORY[0x263EF83A0], v20);
        }
        else {
          v20[2](v20);
        }
        if (GetDefaultsWriteLogPerfTimes())
        {
          float v21 = MachSeconds;
          CGFloat v22 = [MEMORY[0x263EFF910] date];
          [v22 timeIntervalSince1970];
          unint64_t v24 = (unint64_t)(v23 * 1000.0);

          long long v25 = [(PDFPage *)self document];
          uint64_t v26 = [v25 indexForPage:self];
          double v27 = GetMachSeconds();
          NSLog(&cfstr_Pdfkit2Logperf_5.isa, v26, v24, v27 - v21, aBlock, v30, v31, v32, v33, v34);
        }
      }
    }
  }
}

void __25__PDFPage_getAnnotations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGPDFDictionardouble y = (CGPDFDictionary *)CGPDFAnnotationGetCGPDFDictionary();
  CGPDFStreamRef value = 0;
  if (!CGPDFDictionaryGetName(CGPDFDictionary, "Subtype", (const char **)&value)
    || (id v6 = *(void **)(a1 + 32),
        [NSString stringWithUTF8String:value],
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = (objc_class *)[v6 annotationSubclassForSubtype:v7],
        v7,
        !v8))
  {
    char v8 = (objc_class *)objc_opt_class();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v9 = +[PDFAKAnnotationSerializationHelper akAnnotationFromCGPDFAnnotation:a3 andDictionary:CGPDFDictionary];
    AKInkAnnotationClass();
    if (objc_opt_isKindOfClass()) {
      char v8 = (objc_class *)self;
    }
  }
  if (v8)
  {
    uint64_t v10 = (void *)[[v8 alloc] initWithCGPDFAnnotation:a3 forPage:*(void *)(a1 + 32)];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 setIsFullyConstructed:0];
      [*(id *)(a1 + 40) addObject:v11];
      uint64_t v12 = [v11 valueForAnnotationKey:@"/Subtype"];
      if ([v12 isEqualToString:@"/Popup"]) {
        [*(id *)(a1 + 48) addObject:v11];
      }
      uint64_t v13 = [v11 valueForAnnotationKey:@"/Subtype"];
      int v14 = [v13 isEqualToString:@"/Widget"];

      if (v14) {
        [*(id *)(a1 + 32) _addWidgetAnnotationToLookupDictionary:v11];
      }
      [v11 setCGPDFAnnotation:a3];
      if (*(unsigned char *)(a1 + 57)) {
        [v11 cacheAppearances];
      }
      uint64_t v15 = *(void *)(a1 + 32);
      if (*(void *)(v15 + 360))
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __25__PDFPage_getAnnotations__block_invoke_2;
        aBlock[3] = &unk_264203F98;
        aBlock[4] = v15;
        id v18 = v11;
        id v16 = (void (**)(void))_Block_copy(aBlock);
        if ([MEMORY[0x263F08B88] isMainThread]) {
          v16[2](v16);
        }
        else {
          dispatch_async(MEMORY[0x263EF83A0], v16);
        }
      }
      [v11 setIsFullyConstructed:1];
    }
  }
}

uint64_t __25__PDFPage_getAnnotations__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) disableUndoManagerForAK];
  [*(id *)(a1 + 40) setupAKAnnotationAdaptorIfNecessary];
  [*(id *)(*(void *)(a1 + 32) + 360) pdfPage:*(void *)(a1 + 32) didAddAnnotation:*(void *)(a1 + 40)];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 enableUndoManagerForAK:v2];
}

uint64_t __25__PDFPage_getAnnotations__block_invoke_3(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unsigned int v17 = [*(id *)(a1 + 32) disableUndoManagerForAK];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v6 popupDictionary])
        {
          uint64_t ObjectReference = CGPDFDictionaryGetObjectReference();
          if (ObjectReference | v8)
          {
            uint64_t v9 = ObjectReference;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            id v10 = *(id *)(v18 + 48);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v21;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v21 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                  if (v6 != v15)
                  {
                    [*(id *)(*((void *)&v20 + 1) + 8 * j) sourceDictionary];
                    if (v9 == CGPDFDictionaryGetObjectReference())
                    {
                      [v6 setIsFullyConstructed:0];
                      [v15 setIsFullyConstructed:0];
                      [v6 setPopupInternal:v15 scanPage:0];
                      [v15 setIsFullyConstructed:1];
                      [v6 setIsFullyConstructed:1];
                      goto LABEL_19;
                    }
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }
LABEL_19:
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v3);
  }

  return [*(id *)(v18 + 32) enableUndoManagerForAK:v17];
}

- (id)annotationWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_annotations;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "pdfAnnotationUUID", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)annotationsForFieldName:(id)a3
{
  if (a3)
  {
    p_widgetAnnotationLookupLock = &self->_widgetAnnotationLookupLock;
    id v5 = a3;
    os_unfair_lock_lock(p_widgetAnnotationLookupLock);
    id v6 = [(NSMutableDictionary *)self->_widgetAnnotationLookup objectForKey:v5];

    os_unfair_lock_unlock(p_widgetAnnotationLookupLock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_addWidgetAnnotationToLookupDictionary:(id)a3
{
  id v6 = a3;
  id v4 = [v6 fieldName];
  if (v4)
  {
    os_unfair_lock_lock(&self->_widgetAnnotationLookupLock);
    id v5 = [(NSMutableDictionary *)self->_widgetAnnotationLookup objectForKey:v4];
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    [v5 addObject:v6];
    [(NSMutableDictionary *)self->_widgetAnnotationLookup setObject:v5 forKey:v4];
    os_unfair_lock_unlock(&self->_widgetAnnotationLookupLock);
  }
}

- (void)_removeWidgetAnnotationFromLookupDictionary:(id)a3
{
  id v8 = a3;
  id v4 = [v8 fieldName];
  if (v4)
  {
    p_widgetAnnotationLookupLock = &self->_widgetAnnotationLookupLock;
    os_unfair_lock_lock(&self->_widgetAnnotationLookupLock);
    id v6 = [(NSMutableDictionary *)self->_widgetAnnotationLookup objectForKey:v4];
    uint64_t v7 = v6;
    if (v6) {
      [v6 removeObject:v8];
    }
    os_unfair_lock_unlock(p_widgetAnnotationLookupLock);
  }
}

- (void)addAnnotationFormField:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PDFPage *)self document];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 formData];
    if (v7)
    {
      unsigned int v17 = self;
      id v18 = v4;
      if (v4)
      {
        [MEMORY[0x263EFF8C0] arrayWithObject:v4];
      }
      else
      {
        [(NSLock *)self->_lock_accessAnnotations lock];
        [(PDFPage *)self annotations];
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            long long v14 = objc_msgSend(v13, "fieldName", v17);
            if (v14)
            {
              long long v15 = [v7 fieldNamed:v14];

              if (!v15)
              {
                long long v16 = [[PDFFormField alloc] initWithAnnotation:v13];
                [v7 addFormField:v16];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      id v4 = v18;
      if (!v18) {
        [(NSLock *)v17->_lock_accessAnnotations unlock];
      }
    }
    else
    {
      NSLog(&cfstr_TempAddannotat.isa);
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
}

- (void)setDisplaysMarkupAnnotations:(BOOL)a3
{
  self->_displaysMarkups = a3;
}

- (void)addDetectedAnnotations:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(NSLock *)self->_lock_accessAnnotations lock];
    if (!self->_detectedAnnotations)
    {
      id v5 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
      detectedAnnotations = self->_detectedAnnotations;
      self->_detectedAnnotations = v5;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "setPage:", self, (void)v14);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)self->_detectedAnnotations addObjectsFromArray:v7];
    [(NSLock *)self->_lock_accessAnnotations unlock];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
    long long v13 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v13 pdfDocument:WeakRetained detectedAnnotations:self->_detectedAnnotations forPage:self];
    }
  }
}

- (void)removeFromDetectedAnnotations:(id)a3
{
  detectedAnnotations = self->_detectedAnnotations;
  if (detectedAnnotations) {
    [(NSMutableArray *)detectedAnnotations removeObjectsInArray:a3];
  }
}

- (id)scannedAnnotationAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  int v7 = [WeakRetained enableDataDetectors];

  if (v7)
  {
    [(PDFPage *)self _buildPageLayout];
    uint64_t v8 = self->_detectedAnnotations;
    uint64_t v9 = v8;
    if (v8 && (uint64_t v10 = [(NSMutableArray *)v8 count]) != 0)
    {
      uint64_t v11 = v10 - 1;
      while (1)
      {
        uint64_t v12 = [(NSMutableArray *)v9 objectAtIndex:v11];
        [v12 bounds];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        v23.CGFloat x = x;
        v23.CGFloat y = y;
        v24.origin.CGFloat x = v14;
        v24.origin.CGFloat y = v16;
        v24.size.double width = v18;
        v24.size.double height = v20;
        if (NSPointInRect(v23, v24)) {
          break;
        }

        if (--v11 == -1) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)changedAnnotation:(id)a3
{
  id v5 = a3;
  if ([v5 isFullyConstructed]
    && [(NSMutableArray *)self->_annotations containsObject:v5])
  {
    id v4 = [[PDFAnnotationChange alloc] initWithChangedAnnotation:v5];
    [(NSMutableArray *)self->_annotationChanges addObject:v4];
    [(NSMutableSet *)self->_changedAnnotations addObject:v5];
  }
}

- (id)annotationChanges
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v4 = self->_annotationChanges;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v10 = [v9 annotation];
        uint64_t v11 = [v3 objectForKey:v10];
        if (!v11)
        {
          uint64_t v11 = objc_opt_new();
          [v3 setObject:v11 forKey:v10];
        }
        [v11 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v6);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [v3 keyEnumerator];
  uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (!v40) {
    goto LABEL_63;
  }
  uint64_t v39 = *(void *)v50;
  uint64_t v37 = v3;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v50 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * v12);
      CGFloat v14 = [v3 objectForKey:v13];
      double v15 = [v14 sortedArrayWithOptions:0 usingComparator:&__block_literal_global_348];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      CGFloat v16 = v15;
      uint64_t v17 = [(PDFAnnotationChange *)v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (!v17)
      {
        id v44 = 0;
        id v22 = 0;
        long long v21 = 0;
        uint64_t v30 = v16;
        goto LABEL_58;
      }
      uint64_t v18 = v17;
      uint64_t v38 = v13;
      uint64_t v41 = v12;
      id v42 = v14;
      unint64_t v19 = 0;
      int v20 = 0;
      char v43 = 0;
      long long v21 = 0;
      id v22 = 0;
      id v44 = 0;
      uint64_t v23 = *(void *)v46;
      int v24 = 1;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v16);
          }
          long long v26 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          if ([v26 changeType])
          {
            if ([v26 changeType] == 2)
            {
              v20 |= v24;
              if (v24) {
                unint64_t v19 = 0;
              }
              else {
                --v19;
              }
              if (!v22) {
                id v22 = v26;
              }
              int v24 = 0;
            }
            else if ([v26 changeType] == 1)
            {
              if (v24) {
                unint64_t v19 = 1;
              }
              v20 |= v24;
              if (!v44) {
                id v44 = v26;
              }
              int v24 = 0;
              char v43 = 1;
            }
            else if ([v26 changeType] != 3)
            {
              [v26 changeType];
            }
          }
          else
          {
            v20 &= v24 ^ 1;
            if (v24) {
              unint64_t v19 = 1;
            }
            else {
              ++v19;
            }
            long long v27 = v26;

            int v24 = 0;
            long long v21 = v27;
          }
        }
        uint64_t v18 = [(PDFAnnotationChange *)v16 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v18);

      if (v19 >= 2)
      {
        NSLog(&cfstr_SAnnotationCha.isa, "-[PDFPage annotationChanges]", v19, v16);

        id v33 = 0;
        double v32 = v35;
        uint64_t v3 = v37;
        goto LABEL_65;
      }
      uint64_t v3 = v37;
      if (v19 != 1)
      {
        uint64_t v12 = v41;
        CGFloat v14 = v42;
        if ((v20 & 1) == 0) {
          goto LABEL_59;
        }
        NSRect v29 = (PDFAnnotationChange *)v22;
LABEL_56:
        uint64_t v30 = v29;
        if (!v29) {
          goto LABEL_59;
        }
LABEL_57:
        [v35 addObject:v30];
LABEL_58:

        goto LABEL_59;
      }
      uint64_t v12 = v41;
      CGFloat v14 = v42;
      if ((v20 & 1) == 0)
      {
        NSRect v29 = v21;
        long long v21 = v29;
        goto LABEL_56;
      }
      if (v21)
      {
        uint64_t v28 = [PDFAnnotationChange alloc];
        if (v43) {
          NSRect v29 = [(PDFAnnotationChange *)v28 initWithReorderedAndChangedAnnotation:v38];
        }
        else {
          NSRect v29 = [(PDFAnnotationChange *)v28 initWithReorderedAnnotation:v38];
        }
        goto LABEL_56;
      }
      if (v43)
      {
        uint64_t v30 = (PDFAnnotationChange *)v44;
        long long v21 = 0;
        if (v30) {
          goto LABEL_57;
        }
      }
      else
      {
        long long v21 = 0;
      }
LABEL_59:

      ++v12;
    }
    while (v12 != v40);
    uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    uint64_t v40 = v31;
  }
  while (v31);
LABEL_63:

  [v3 removeAllObjects];
  double v32 = v35;
  id v33 = v35;
LABEL_65:

  return v33;
}

uint64_t __28__PDFPage_annotationChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 changeTimestamp];
  if (v6 == [v5 changeTimestamp])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [v4 changeTimestamp];
    if (v8 < [v5 changeTimestamp]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)lastAnnotationChange
{
  return (id)[(NSMutableArray *)self->_annotationChanges lastObject];
}

- (void)clearAnnotationChanges
{
}

- (id)changedAnnotations
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_changedAnnotations copy];

  return v2;
}

- (void)resetChangedAnnotations
{
  uint64_t v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  changedAnnotations = self->_changedAnnotations;
  self->_changedAnnotations = v3;

  MEMORY[0x270F9A758](v3, changedAnnotations);
}

- (void)printActivePageAnnotations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  uint64_t v4 = [WeakRetained indexForPage:self];
  id v5 = [(PDFPage *)self annotations];
  NSLog(&cfstr_CurrentPageInd.isa, v4, [v5 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_annotations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        NSLog(&cfstr_PrintingDictio.isa, v9 + v11);
        [v12 printDictionaryKeyValues];
        NSLog(&stru_26C516768.isa);
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v9 = (v9 + v11);
    }
    while (v8);
  }
}

- (BOOL)didChangeBounds
{
  return self->_didChangeBounds;
}

- (CGColor)pageBackgroundColorHint
{
  return self->_pageBackgroundColorHint;
}

- (void)addFormFieldGroup:(id)a3
{
  id v4 = a3;
  formFieldGroups = self->_formFieldGroups;
  id v8 = v4;
  if (!formFieldGroups)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_formFieldGroups;
    self->_formFieldGroups = v6;

    id v4 = v8;
    formFieldGroups = self->_formFieldGroups;
  }
  [(NSMutableArray *)formFieldGroups addObject:v4];
}

- (id)formFieldGroupForAnnotation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_formFieldGroups;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setApplicationData:(id)a3 withName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  persistentApplicationData = self->_persistentApplicationData;
  if (v13)
  {
    if (!persistentApplicationData)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
      long long v11 = self->_persistentApplicationData;
      self->_persistentApplicationData = v10;

      id v7 = v13;
      persistentApplicationData = self->_persistentApplicationData;
    }
    [(NSMutableDictionary *)persistentApplicationData setObject:v7 forKeyedSubscript:v8];
    long long v12 = [(PDFPage *)self document];
    [v12 setHasPageWithApplicationData:1];
  }
  else
  {
    [(NSMutableDictionary *)persistentApplicationData removeObjectForKey:v8];
  }
}

- (id)applicationDataWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_persistentApplicationData objectForKeyedSubscript:a3];
}

- (void)enumerateApplicationDataUsingBlock:(id)a3
{
  id v4 = a3;
  persistentApplicationData = self->_persistentApplicationData;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__PDFPage_enumerateApplicationDataUsingBlock___block_invoke;
  v7[3] = &unk_264205308;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)persistentApplicationData enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __46__PDFPage_enumerateApplicationDataUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postAnnotationsChangedNotification
{
  uint64_t v3 = [(PDFPage *)self view];

  if (v3)
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__postAnnotationsChangedNotificationCoalesced object:0];
    [(PDFPage *)self performSelector:sel__postAnnotationsChangedNotificationCoalesced withObject:0 afterDelay:0.0];
  }
}

- (void)_postAnnotationsChangedNotificationCoalesced
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = [(PDFPage *)self view];
  id v4 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", self, @"page", 0);
  [v5 postNotificationName:@"PDFViewAnnotationsDidChange" object:v3 userInfo:v4];
}

- (void)_scanData:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  p_dataDetectorsLock = &self->_dataDetectorsLock;
  os_unfair_lock_lock(&self->_dataDetectorsLock);
  if (self->_ranDataDetectors)
  {
    os_unfair_lock_unlock(p_dataDetectorsLock);
  }
  else
  {
    self->_ranDataDetectors = 1;
    id v5 = [(PDFPage *)self string];
    id v6 = v5;
    if (v5 && [v5 length])
    {
      lock = p_dataDetectorsLock;
      id v7 = (void *)[objc_alloc(MEMORY[0x263F394B8]) initWithScannerType:0 passiveIntent:1];
      [v7 setSpotlightSuggestionsEnabled:1];
      long long v25 = v7;
      long long v26 = v6;
      id v8 = objc_msgSend(MEMORY[0x263F394B0], "scanString:range:configuration:", v6, 0, objc_msgSend(v6, "length"), v7);
      uint64_t v28 = [MEMORY[0x263EFF980] array];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id obj = v8;
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            long long v14 = [[PDFScannerResult alloc] initWithDDScannerResult:v13 foundOnPage:self];
            if (v14)
            {
              [(NSMutableArray *)self->_scannerResults addObject:v14];
              long long v15 = [v13 url];
              if (v15)
              {
                [(PDFScannerResult *)v14 bounds];
                unint64_t v19 = [(PDFPage *)self annotationAtPoint:PDFRectGetCenterPoint(v16, v17, v18)];
                int v20 = [v19 valueForAnnotationKey:@"/Subtype"];
                char v21 = [v20 isEqualToString:@"/Link"];

                if ((v21 & 1) == 0)
                {
                  id v22 = objc_alloc([(PDFPage *)self annotationSubclassForSubtype:@"/Link"]);
                  [(PDFScannerResult *)v14 bounds];
                  uint64_t v23 = objc_msgSend(v22, "initCommonWithBounds:");
                  [v23 setType:@"/Link"];
                  [v23 setURL:v15];
                  [v23 setForExport:0];
                  [v28 addObject:v23];
                }
              }
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v10);
      }

      if ([v28 count])
      {
        int v24 = [(PDFPage *)self view];

        if (v24) {
          [(PDFPage *)self addDetectedAnnotations:v28];
        }
      }
      os_unfair_lock_unlock(lock);

      id v6 = v26;
    }
    else
    {
      os_unfair_lock_unlock(p_dataDetectorsLock);
    }
  }
}

- (id)dataDetectorResults
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  int v4 = [WeakRetained enableDataDetectors];

  if (v4 && (p_dataDetectorsLock = &self->_dataDetectorsLock, os_unfair_lock_trylock(&self->_dataDetectorsLock)))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self->_scannerResults;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "ddResult", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock(p_dataDetectorsLock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pdfScannerResultAtPoint:(CGPoint)a3
{
  return -[PDFPage pdfScannerResultAtPoint:onPageLayer:](self, "pdfScannerResultAtPoint:onPageLayer:", 0, a3.x, a3.y);
}

- (id)pdfScannerResultAtPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a4;
  p_dataDetectorsLock = &self->_dataDetectorsLock;
  if (!os_unfair_lock_trylock(&self->_dataDetectorsLock))
  {
    id v22 = 0;
    goto LABEL_31;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_scannerResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v10)
  {
    id v22 = 0;
    goto LABEL_30;
  }
  uint64_t v11 = v10;
  int v24 = p_dataDetectorsLock;
  uint64_t v12 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if ([v14 resultIsPastDate]) {
        continue;
      }
      if (v7)
      {
        if (objc_msgSend(v14, "containsPoint:onPageLayer:", v7, x, y)) {
          goto LABEL_12;
        }
      }
      else if (objc_msgSend(v14, "containsPoint:", x, y))
      {
LABEL_12:
        id v15 = v14;
        if (v15)
        {
          id v22 = v15;
          goto LABEL_29;
        }
      }
      long long v16 = [v14 rects];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v26;
LABEL_15:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v21) PDFKitPDFRectValue];
          v37.double x = x;
          v37.double y = y;
          if (PDFRectContainsPoint(v38, v37)) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v19) {
              goto LABEL_15;
            }
            goto LABEL_21;
          }
        }
        id v22 = v14;

        if (v22) {
          goto LABEL_29;
        }
      }
      else
      {
LABEL_21:
      }
    }
    uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  id v22 = 0;
LABEL_29:
  p_dataDetectorsLock = v24;
LABEL_30:

  os_unfair_lock_unlock(p_dataDetectorsLock);
LABEL_31:

  return v22;
}

- (id)rvItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[PDFPage pdfScannerResultAtPoint:](self, "pdfScannerResultAtPoint:");
  if (v6) {
    [(PDFPage *)self rvItemWithPDFScannerResult:v6];
  }
  else {
  id v7 = -[PDFPage _rvItemAtPoint:](self, "_rvItemAtPoint:", x, y);
  }

  return v7;
}

- (id)rvItemAtPoint:(CGPoint)a3 onPageLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = -[PDFPage pdfScannerResultAtPoint:onPageLayer:](self, "pdfScannerResultAtPoint:onPageLayer:", a4);
  if (v7) {
    [(PDFPage *)self rvItemWithPDFScannerResult:v7];
  }
  else {
  uint64_t v8 = -[PDFPage _rvItemAtPoint:](self, "_rvItemAtPoint:", x, y);
  }

  return v8;
}

- (id)_rvItemAtPoint:(CGPoint)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  int v4 = -[PDFPage selectionFromPoint:toPoint:type:](self, "selectionFromPoint:toPoint:type:", 1, a3.x, a3.y, a3.x, a3.y);
  id v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    uint64_t v7 = [v5 rangeAtIndex:0 onPage:self];
    id v8 = objc_alloc((Class)RVItemClass());
    uint64_t v9 = [(PDFPage *)self string];
    uint64_t v10 = objc_msgSend(v8, "initWithText:selectedRange:", v9, v7, 0);

    [v10 highlightRange];
    if (v11)
    {
      uint64_t v12 = [v10 highlightRange];
      long long v14 = -[PDFPage selectionForRange:](self, "selectionForRange:", v12, v13);
      id v17 = @"selection";
      v18[0] = v14;
      id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [v10 setClientHints:v15];
      id v6 = v10;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)rvItemWithPDFScannerResult:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)RVItemClass());
    id v6 = [v4 ddResult];
    uint64_t v7 = (void *)[v5 initWithDDResult:v6];

    id v8 = [v4 ddResult];

    uint64_t v9 = [v8 urlificationRange];
    uint64_t v11 = -[PDFPage selectionForRange:](self, "selectionForRange:", v9, v10);

    long long v14 = @"selection";
    v15[0] = v11;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v7 setClientHints:v12];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_documentIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  unint64_t v4 = [WeakRetained indexForPage:self];

  return v4;
}

- (CGPath)createRedactionPath
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  Mutable = CGPathCreateMutable();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = self->_annotations;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isRedaction", (void)v12))
        {
          uint64_t v10 = (const CGPath *)[v9 quadPointsPath];
          if (v10)
          {
            CGPathAddPath(Mutable, 0, v10);
          }
          else
          {
            [v9 bounds];
            CGPathAddRect(Mutable, 0, v18);
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if (CGPathIsEmpty(Mutable))
  {
    CGPathRelease(Mutable);
    return 0;
  }
  return Mutable;
}

- (BOOL)rectIntersectsWithRedactionPath:(CGRect)a3
{
  uint64_t v3 = [(PDFPage *)self createRedactionPath];
  char v4 = CGPathIntersectsRect();
  CGPathRelease(v3);
  return v4;
}

- (BOOL)pathIntersectsWithRedactionPath:(CGPath *)a3
{
  char v4 = [(PDFPage *)self createRedactionPath];
  LOBYTE(a3) = MEMORY[0x2166A06B0](v4, a3, 1);
  CGPathRelease(v4);
  return (char)a3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDFPage;
  uint64_t v3 = [(PDFPage *)&v7 description];
  char v4 = [(PDFPage *)self document];
  uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" page index %ld", objc_msgSend(v4, "indexForPage:", self));

  return v5;
}

- (id)debugQuickLookObject
{
  v10[1] = *MEMORY[0x263EF8340];
  double v3 = PDFSizeMake(self, 600.0, 600.0);
  double v5 = v4;
  uint64_t v9 = @"PDFPageImageProperty_WithRotation";
  v10[0] = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  objc_super v7 = -[PDFPage imageOfSize:forBox:withOptions:](self, "imageOfSize:forBox:withOptions:", 1, v6, v3, v5);

  return v7;
}

- (void)setExtraContentStream:(CGPDFStream *)a3 steamDocument:(CGPDFDocument *)a4
{
  [(PDFPage *)self pageRef];
  CGPDFPageSetExtraContentStream();
  self->_textFromOCR = a3 != 0;
  [(PDFPage *)self purgePageLayout];

  [(PDFPage *)self _releaseDisplayList];
}

- (PDFDetectedForm)detectedForm
{
  return self->_detectedForm;
}

- (void)setDetectedForm:(id)a3
{
}

- (id)annotationForDetectedFormField:(id)a3
{
  if (a3)
  {
    double v3 = objc_getAssociatedObject(a3, @"com.apple.pdfkit.AnnotationAssociatedObjectKey");
    double v4 = [v3 object];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)detectedFormFieldForAnnotation:(id)a3
{
  if (a3)
  {
    double v3 = objc_getAssociatedObject(a3, @"com.apple.pdfkit.DetectedFormFieldAssociatedObjectKey");
    double v4 = [v3 object];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)addedAnnotation:(id)a3 forFormField:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = +[PDFWeakWrapper weakWrapperWithObject:v5];
  objc_setAssociatedObject(v6, @"com.apple.pdfkit.DetectedFormFieldAssociatedObjectKey", v7, (void *)0x301);

  id value = +[PDFWeakWrapper weakWrapperWithObject:v6];

  objc_setAssociatedObject(v5, @"com.apple.pdfkit.AnnotationAssociatedObjectKey", value, (void *)0x301);
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentApplicationData, 0);
  objc_storeStrong((id *)&self->_formFieldGroups, 0);
  objc_storeStrong((id *)&self->_detectedForm, 0);
  objc_storeStrong((id *)&self->_scannerResults, 0);
  objc_storeStrong((id *)&self->_widgetAnnotationLookup, 0);
  objc_storeStrong((id *)&self->_changedAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationChanges, 0);
  objc_storeStrong((id *)&self->_akPageAdaptor, 0);
  objc_storeStrong((id *)&self->_createDisplayListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_detectedAnnotations, 0);
  objc_storeStrong((id *)&self->_lock_accessAnnotations, 0);
  objc_storeStrong((id *)&self->_lock_getAnnotations, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_pageImageOptions, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_view);

  objc_destroyWeak((id *)&self->_document);
}

@end