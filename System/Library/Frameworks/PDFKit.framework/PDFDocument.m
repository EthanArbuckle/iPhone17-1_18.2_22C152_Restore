@interface PDFDocument
+ (BOOL)isValidPassword:(id)a3;
+ (BOOL)pdfDocumentAppendModeActiveForThisThread;
+ (id)_getDocumentID:(CGPDFDocument *)a3;
+ (void)setPDFDocumentAppendModeActiveForThisThread:(BOOL)a3;
- (BOOL)_canSaveWithEncryption;
- (BOOL)_isCommonlyMappedToNothing:(id)a3;
- (BOOL)_isNonAsciiSpace:(id)a3;
- (BOOL)_writeAppendMode:(CGDataConsumer *)a3;
- (BOOL)allowsCommenting;
- (BOOL)allowsContentAccessibility;
- (BOOL)allowsCopying;
- (BOOL)allowsDocumentAssembly;
- (BOOL)allowsDocumentChanges;
- (BOOL)allowsFormFieldEntry;
- (BOOL)allowsPrinting;
- (BOOL)bookmarksChanged;
- (BOOL)callDelegateHandleTabFrom:(id)a3 direction:(unint64_t)a4;
- (BOOL)callShouldReadAKInkAnnotations;
- (BOOL)canSaveWithAppendModeUsingOptions:(id)a3;
- (BOOL)canSaveWithTextFromOCR;
- (BOOL)createdWithWithHighLatencyDataProvider;
- (BOOL)documentChanged;
- (BOOL)enableDataDetectors;
- (BOOL)findOnPage;
- (BOOL)hasHighLatencyDataProvider;
- (BOOL)isEncrypted;
- (BOOL)isFinding;
- (BOOL)isLinearized;
- (BOOL)isLocked;
- (BOOL)isSimpleSelectionEnabled;
- (BOOL)showsAnnotations;
- (BOOL)unlockWithPassword:(NSString *)password;
- (BOOL)validateRedo:(id)a3;
- (BOOL)validateUndo:(id)a3;
- (BOOL)viewPreferenceRightToLeft;
- (BOOL)writeToConsumer:(CGDataConsumer *)a3 withOptions:(id)a4;
- (BOOL)writeToFile:(NSString *)path;
- (BOOL)writeToFile:(NSString *)path withOptions:(NSDictionary *)options;
- (BOOL)writeToURL:(NSURL *)url;
- (BOOL)writeToURL:(NSURL *)url withOptions:(NSDictionary *)options;
- (CGPDFAnnotation)_createCGPDFAnnotationForAnnotation:(id)a3;
- (CGPDFDocumentRef)documentRef;
- (CGPDFName)_convertCFStringToCGPDFName:(void *)a3 forKey:(__CFString *)a4;
- (Class)annotationSubclassForType:(id)a3;
- (Class)pageClass;
- (NSArray)findString:(NSString *)string withOptions:(NSStringCompareOptions)options;
- (NSData)dataRepresentation;
- (NSData)dataRepresentationWithOptions:(NSDictionary *)options;
- (NSDictionary)documentAttributes;
- (NSInteger)majorVersion;
- (NSInteger)minorVersion;
- (NSString)string;
- (NSUInteger)indexForPage:(PDFPage *)page;
- (NSUInteger)pageCount;
- (NSURL)documentURL;
- (PDFAccessPermissions)accessPermissions;
- (PDFDocument)init;
- (PDFDocument)initWithData:(NSData *)data;
- (PDFDocument)initWithProvider:(CGDataProvider *)a3;
- (PDFDocument)initWithURL:(NSURL *)url;
- (PDFDocumentPermissions)permissionsStatus;
- (PDFOutline)outlineItemForSelection:(PDFSelection *)selection;
- (PDFOutline)outlineRoot;
- (PDFPage)pageAtIndex:(NSUInteger)index;
- (PDFSelection)findString:(NSString *)string fromSelection:(PDFSelection *)selection withOptions:(NSStringCompareOptions)options;
- (PDFSelection)selectionForEntireDocument;
- (PDFSelection)selectionFromPage:(PDFPage *)startPage atCharacterIndex:(NSUInteger)startCharacter toPage:(PDFPage *)endPage atCharacterIndex:(NSUInteger)endCharacter;
- (PDFSelection)selectionFromPage:(PDFPage *)startPage atPoint:(CGPoint)startPoint toPage:(PDFPage *)endPage atPoint:(CGPoint)endPoint;
- (__CFData)newXMPFromData:(id)a3 preserveExistingXMPMetadata:(BOOL)a4;
- (__CFDictionary)_createInfoDictionary;
- (id)PDFAKControllerDelegate;
- (id)_SASLSanitize:(id)a3;
- (id)_addEncryptionFromOptions:(id)a3;
- (id)_bookmarksCatalog;
- (id)_convertWriteOptions:(id)a3;
- (id)_dataFromXMP:(__CFData *)a3 withRootPath:(id)a4 keys:(id)a5;
- (id)_documentCatalogMetadataForRootPath:(id)a3 withKeys:(id)a4;
- (id)_findString:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5;
- (id)_getNearestOutline:(id)a3 forDestination:(id)a4;
- (id)_namedDestination:(id)a3 forNameDictionary:(CGPDFDictionary *)a4;
- (id)_rawPageAtIndex:(unint64_t)a3;
- (id)akController;
- (id)akDocumentAdaptor;
- (id)annotationsForFieldName:(id)a3;
- (id)bookmarkedPages;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)findPageWithCGPDFDictionaryPageRef:(CGPDFDictionary *)a3;
- (id)findStringPerPage:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5;
- (id)findStrings:(id)a3 withinSelection:(id)a4 withOptions:(unint64_t)a5;
- (id)formData;
- (id)formFillingQueue;
- (id)linearizedRangesForPage:(id)a3;
- (id)namedDestination:(id)a3;
- (id)pageAnnotationChanges;
- (id)passwordUsedForUnlocking;
- (id)renderingProperties;
- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 type:(int)a7;
- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 withGranularity:(unint64_t)a7;
- (id)textExtractionQueue;
- (void)_commonInit;
- (void)_createDocumentWithDataProvider:(CGDataProvider *)a3;
- (void)_notifyAKAdaptorPagePlaceholder:(id)a3 wasReplacedWithPage:(id)a4 atIndex:(unint64_t)a5;
- (void)_sanitizeAnnotationArray:(__CFArray *)a3;
- (void)_sanitizeAnnotationDictionary:(__CFDictionary *)a3;
- (void)_setDocumentCatalogMetadata:(id)a3 withNSpace:(id)a4 prefix:(id)a5 rootPath:(id)a6;
- (void)asyncFindString:(id)a3 withDelegate:(id)a4 onQueue:(id)a5;
- (void)asyncFindStrings:(id)a3 withDelegate:(id)a4 onQueue:(id)a5;
- (void)asyncFindStrings:(id)a3 withOptions:(unint64_t)a4 withDelegate:(id)a5 onQueue:(id)a6;
- (void)beginBatchPageChanges;
- (void)beginFindString:(NSString *)string withOptions:(NSStringCompareOptions)options;
- (void)beginFindStrings:(NSArray *)strings withOptions:(NSStringCompareOptions)options;
- (void)callDelegateDidReceiveAnalysis:(id)a3 forPage:(id)a4;
- (void)cancelFindString;
- (void)cleanupFind;
- (void)coreFindString:(id)a3;
- (void)coreFindStrings:(id)a3;
- (void)dealloc;
- (void)decrementRedactionCount;
- (void)didMatchString:(id)a3;
- (void)enableDocumentMRUMode:(BOOL)a3;
- (void)enableLimitedSearch;
- (void)endBatchPageChanges;
- (void)exchangePageAtIndex:(NSUInteger)indexA withPageAtIndex:(NSUInteger)indexB;
- (void)incrementRedactionCount;
- (void)insertPage:(PDFPage *)page atIndex:(NSUInteger)index;
- (void)normalizeFindOptions:(unint64_t)a3;
- (void)preloadDataOfPagesInRange:(_NSRange)a3 onQueue:(id)a4 completion:(id)a5;
- (void)redo:(id)a3;
- (void)removePageAtIndex:(NSUInteger)index;
- (void)requirePasswordsIfNeededUsingPresentingViewController:(id)a3 completion:(id)a4;
- (void)resetFormFields:(id)a3;
- (void)resetPageAnnotationChanges;
- (void)revert;
- (void)scheduledFindOnPage:(id)a3;
- (void)setBookmarked:(BOOL)a3 atPageIndex:(unint64_t)a4;
- (void)setDelegate:(id)delegate;
- (void)setDocument:(CGPDFDocument *)a3;
- (void)setDocumentAttributes:(NSDictionary *)documentAttributes;
- (void)setDocumentHasBurnInAnnotations:(BOOL)a3;
- (void)setEnableDataDetectors:(BOOL)a3;
- (void)setFormData:(id)a3;
- (void)setHasHighLatencyDataProvider:(BOOL)a3;
- (void)setHasPageWithApplicationData:(BOOL)a3;
- (void)setOutlineRoot:(PDFOutline *)outlineRoot;
- (void)setPDFAKControllerDelegate:(id)a3;
- (void)setPageChangeDelegate:(id)a3;
- (void)setRenderingProperties:(id)a3;
- (void)setupAKDocumentAdaptorIfNecessaryWithView:(id)a3;
- (void)undo:(id)a3;
- (void)updateBookmarksInPDFDocument;
@end

@implementation PDFDocument

- (void)_commonInit
{
  self->_pageCount = CGPDFDocumentGetNumberOfPages(self->_document);
  document = self->_document;
  if (document)
  {
    self->_isEncrypted = CGPDFDocumentIsEncrypted(document);
    self->_isUnlocked = CGPDFDocumentIsUnlocked(self->_document);
    CGPDFAccessPermissions AccessPermissions = CGPDFDocumentGetAccessPermissions(self->_document);
    self->_accessPermissions = AccessPermissions;
    self->_allowsPrinting = (AccessPermissions & 3) != 0;
    self->_allowsCopying = (AccessPermissions & 0x10) != 0;
    v3.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(AccessPermissions) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFAFFFBFFFDFFFELL) & 0xFF01FF01FF01FF01;
    BOOL v6 = (AccessPermissions >> 7) & 1;
    document = self->_document;
  }
  else
  {
    *(_WORD *)&self->_isEncrypted = 256;
    *(_WORD *)&self->_allowsPrinting = 257;
    self->_accessPermissions = 255;
    v3.i64[0] = 0x1000100010001;
    LOBYTE(v6) = 1;
  }
  *(_DWORD *)&self->_allowsDocumentChanges = vmovn_s16(v3).u32[0];
  self->_allowsFormFieldEntry = v6;
  *(void *)minorVersion = 0;
  CGPDFDocumentGetVersion(document, &minorVersion[1], minorVersion);
  int v7 = minorVersion[0];
  self->_majorVersion = minorVersion[1];
  self->_minorVersion = v7;
  ownerPassword = self->_ownerPassword;
  self->_ownerPassword = 0;

  userPassword = self->_userPassword;
  self->_userPassword = 0;

  attributes = self->_attributes;
  self->_attributes = 0;

  outline = self->_outline;
  self->_outline = 0;

  textExtractionQueue = self->_textExtractionQueue;
  self->_textExtractionQueue = 0;

  formData = self->_formData;
  self->_formData = 0;

  self->_formDataLoaded = 0;
  self->_finding = 0;
  self->_findModel = 0;
  findStrings = self->_findStrings;
  self->_findStrings = 0;

  findInstance = self->_findInstance;
  self->_findInstance = 0;

  self->_findOptions = 0;
  self->_findPageIndex = 0;
  *(_OWORD *)&self->_findCharIndex = xmmword_2144230F0;
  self->_lastFindCharIndex = -1;
  v16 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  findResults = self->_findResults;
  self->_findResults = v16;

  *(_WORD *)&self->_documentChanged = 0;
  self->_documentRedactionCount = 0;
  *(unint64_t *)((char *)&self->_documentRedactionCount + 5) = 0;
  v18 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F088D0]);
  initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
  self->_initialBookmarkedPageIndices = v18;

  v20 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
  bookmarkedPages = self->_bookmarkedPages;
  self->_bookmarkedPages = v20;

  [(PDFDocument *)self setDelegate:0];
  uint64_t v22 = +[PDFDocument instanceMethodForSelector:sel_pageAtIndex_];
  self->_subclassOverridesPageAtIndex = v22 != [(PDFDocument *)self methodForSelector:sel_pageAtIndex_];
  v23 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_pageCount];
  pages = self->_pages;
  self->_pages = v23;

  v25 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:self->_pageCount];
  pageIndices = self->_pageIndices;
  self->_pageIndices = v25;

  if (self->_pageCount)
  {
    unint64_t v27 = 0;
    do
    {
      unint64_t v28 = v27 + 1;
      v29 = [NSNumber numberWithInt:v27 + 1];
      [(NSMutableArray *)self->_pages addObject:v29];
      v30 = self->_pageIndices;
      v31 = [NSNumber numberWithInt:v27];
      v32 = [NSNumber numberWithInt:v27];
      [(NSMutableDictionary *)v30 setObject:v31 forKey:v32];

      unint64_t v27 = v28;
    }
    while (self->_pageCount > v28);
  }
  v33 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
  pagesOrderedSet = self->_pagesOrderedSet;
  self->_pagesOrderedSet = v33;

  v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  pageDictionaryIndices = self->_pageDictionaryIndices;
  self->_pageDictionaryIndices = v35;

  v37 = (NSMutableIndexSet *)objc_opt_new();
  preloadingPageIndexes = self->_preloadingPageIndexes;
  self->_preloadingPageIndexes = v37;

  if (self->_isEncrypted)
  {
    if (!self->_isUnlocked)
    {
      self->_permission = 0;
      goto LABEL_13;
    }
    int64_t v39 = 1;
  }
  else
  {
    int64_t v39 = 2;
  }
  self->_permission = v39;
LABEL_13:
  documentCatalogMetadata = self->_documentCatalogMetadata;
  self->_documentCatalogMetadata = 0;

  xmpNameSpace = self->_xmpNameSpace;
  self->_xmpNameSpace = 0;

  xmpPrefix = self->_xmpPrefix;
  self->_xmpPrefix = 0;

  xmpRootPath = self->_xmpRootPath;
  self->_xmpRootPath = 0;

  if (![(PDFDocument *)self isLinearized]
    || ![(PDFDocument *)self hasHighLatencyDataProvider])
  {
    id v44 = [(PDFDocument *)self _documentCatalogMetadataForRootPath:@"apple-preview:Bookmarks" withKeys:&unk_26C52E658];
  }
  self->_limitedSearch = 0;
  v45 = objc_alloc_init(PDFRenderingProperties);
  renderingProperties = self->_renderingProperties;
  self->_renderingProperties = v45;

  asyncSearchQueue = self->_asyncSearchQueue;
  self->_asyncSearchQueue = 0;

  formFillingQueue = self->_formFillingQueue;
  self->_formFillingQueue = 0;

  self->_dataDetectorsEnabled = 1;
  accessibilityPageElements = self->_accessibilityPageElements;
  self->_accessibilityPageElements = 0;
}

- (void)setupAKDocumentAdaptorIfNecessaryWithView:(id)a3
{
  id v15 = a3;
  if (self->_akDocumentAdaptor)
  {
    v4 = [(PDFDocument *)self akDocumentAdaptor];
    [v4 setPdfView:v15];

    [v15 setPageOverlayViewProvider:self->_akPageOverlayViewProvider];
  }
  else
  {
    v5 = [[PDFAKDocumentAdaptor alloc] initWithPDFDocument:self andView:v15];
    objc_storeStrong((id *)&self->_akDocumentAdaptor, v5);
    BOOL v6 = [PDFAKPageOverlayViewProvider alloc];
    int v7 = [(PDFAKDocumentAdaptor *)v5 akMainController];
    v8 = [(PDFAKPageOverlayViewProvider *)v6 initWithPDFDocument:self pdfView:v15 andAKController:v7];
    akPageOverlayViewProvider = self->_akPageOverlayViewProvider;
    self->_akPageOverlayViewProvider = v8;

    [v15 setPageOverlayViewProvider:self->_akPageOverlayViewProvider];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfAKControllerDelegateForDeferredSetup);
    if (WeakRetained)
    {
      [(PDFAKDocumentAdaptor *)v5 setPDFAKControllerDelegate:WeakRetained];
      objc_storeWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup, 0);
    }
    v11 = self->_pages;
    objc_sync_enter(v11);
    NSUInteger v12 = [(PDFDocument *)self pageCount];
    if (v12)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        v14 = [(PDFDocument *)self _rawPageAtIndex:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v14 setupAKPageAdaptorIfNecessary];
          [(PDFAKDocumentAdaptor *)v5 pdfDocument:self didInsertPage:v14 atIndex:i];
        }
      }
    }
    objc_sync_exit(v11);
  }
}

- (BOOL)_isCommonlyMappedToNothing:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"­"] & 1) != 0
    || ([v3 isEqualToString:@"­"] & 1) != 0
    || ([v3 isEqualToString:@"᠆"] & 1) != 0
    || ([v3 isEqualToString:@"᠋"] & 1) != 0
    || ([v3 isEqualToString:@"᠌"] & 1) != 0
    || ([v3 isEqualToString:@"᠍"] & 1) != 0
    || ([v3 isEqualToString:@"​"] & 1) != 0
    || ([v3 isEqualToString:@"‌"] & 1) != 0
    || ([v3 isEqualToString:@"‍"] & 1) != 0
    || ([v3 isEqualToString:@"⁠"] & 1) != 0
    || ([v3 isEqualToString:@"︀"] & 1) != 0
    || ([v3 isEqualToString:@"︁"] & 1) != 0
    || ([v3 isEqualToString:@"︂"] & 1) != 0
    || ([v3 isEqualToString:@"︃"] & 1) != 0
    || ([v3 isEqualToString:@"︄"] & 1) != 0
    || ([v3 isEqualToString:@"︅"] & 1) != 0
    || ([v3 isEqualToString:@"︆"] & 1) != 0
    || ([v3 isEqualToString:@"︇"] & 1) != 0
    || ([v3 isEqualToString:@"︈"] & 1) != 0
    || ([v3 isEqualToString:@"︉"] & 1) != 0
    || ([v3 isEqualToString:@"︊"] & 1) != 0
    || ([v3 isEqualToString:@"︋"] & 1) != 0
    || ([v3 isEqualToString:@"︌"] & 1) != 0
    || ([v3 isEqualToString:@"︍"] & 1) != 0
    || ([v3 isEqualToString:@"︎"] & 1) != 0
    || ([v3 isEqualToString:@"️"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"﻿"];
  }

  return v4;
}

- (BOOL)_isNonAsciiSpace:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@"​"] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0
    || ([v3 isEqualToString:@" "] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"　"];
  }

  return v4;
}

- (id)_SASLSanitize:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = 0;
    BOOL v6 = &stru_26C516768;
    do
    {
      uint64_t v7 = [v4 rangeOfComposedCharacterSequenceAtIndex:v5];
      if (!v8) {
        break;
      }
      objc_msgSend(v4, "substringWithRange:", v7, v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (![(PDFDocument *)self _isCommonlyMappedToNothing:v9])
      {
        if ([(PDFDocument *)self _isNonAsciiSpace:v9])
        {
          v10 = v6;
          v11 = @" ";
        }
        else
        {
          v10 = v6;
          v11 = v9;
        }
        uint64_t v12 = [(__CFString *)v10 stringByAppendingString:v11];

        BOOL v6 = (__CFString *)v12;
      }

      ++v5;
    }
    while ([v4 length] > v5);
  }
  else
  {
    BOOL v6 = &stru_26C516768;
  }
  v13 = [(__CFString *)v6 decomposedStringWithCompatibilityMapping];

  return v13;
}

- (id)_getNearestOutline:(id)a3 forDestination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v23 = v7;
    goto LABEL_15;
  }
  id v26 = v6;
  v9 = [v6 page];
  v10 = [v9 document];
  v25 = v9;
  unint64_t v11 = [v10 indexForPage:v9];

  uint64_t v12 = [v8 numberOfChildren];
  v13 = v8;
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v14 = v12;
  uint64_t v15 = 0;
  v13 = v8;
  while (1)
  {
    v16 = [v8 childAtIndex:v15];
    if (v16) {
      break;
    }
LABEL_10:
    if (v14 == ++v15) {
      goto LABEL_14;
    }
  }
  v17 = v16;
  v18 = [v16 destination];
  if (!v18)
  {
    v19 = v17;
    goto LABEL_9;
  }
  v19 = v18;
  v20 = [v18 page];
  v21 = [v20 document];
  unint64_t v22 = [v21 indexForPage:v20];

  if (v22 <= v11)
  {

    v13 = v17;
LABEL_9:

    goto LABEL_10;
  }

LABEL_14:
  id v23 = v13;

  id v6 = v26;
LABEL_15:

  return v23;
}

- (id)_dataFromXMP:(__CFData *)a3 withRootPath:(id)a4 keys:(id)a5
{
  uint64_t v8 = (__CFString *)a4;
  id v9 = a5;
  CGImageMetadataRef v10 = CGImageMetadataCreateFromXMPData(a3);
  if (v10)
  {
    unint64_t v11 = v10;
    id v12 = objc_alloc_init(MEMORY[0x263F089C8]);
    v13 = [MEMORY[0x263EFF980] array];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__PDFDocument__dataFromXMP_withRootPath_keys___block_invoke;
    block[3] = &unk_264204D38;
    unint64_t v28 = v11;
    id v24 = v9;
    v25 = self;
    uint64_t v14 = (NSMutableIndexSet *)v12;
    id v26 = v14;
    id v15 = v13;
    id v27 = v15;
    CGImageMetadataEnumerateTagsUsingBlock(v11, v8, 0, block);
    v16 = (NSIndexSet *)[(NSMutableIndexSet *)v14 copy];
    initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
    self->_initialBookmarkedPageIndices = v16;

    bookmarkedPages = self->_bookmarkedPages;
    self->_bookmarkedPages = v14;
    v19 = v14;

    CFRelease(v11);
    v20 = v27;
    id v21 = v15;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __46__PDFDocument__dataFromXMP_withRootPath_keys___block_invoke(uint64_t a1, uint64_t a2, CGImageMetadataTag *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(__CFString **)(*((void *)&v17 + 1) + 8 * i);
        CFStringRef v12 = CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 64), a3, v11);
        if (v12)
        {
          v13 = (__CFString *)v12;
          objc_msgSend(v5, "setObject:forKey:", v12, v11, (void)v17);
          if ([(__CFString *)v11 isEqualToString:@"PageIndex"])
          {
            unsigned int v14 = [(__CFString *)v13 integerValue];
            if ((v14 & 0x80000000) == 0)
            {
              uint64_t v15 = v14;
              if (v14 < (unint64_t)[*(id *)(a1 + 40) pageCount]) {
                [*(id *)(a1 + 48) addIndex:v15];
              }
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 56) addObject:v5];
  return 1;
}

- (id)renderingProperties
{
  return self->_renderingProperties;
}

- (void)setRenderingProperties:(id)a3
{
}

+ (id)_getDocumentID:(CGPDFDocument *)a3
{
  if (a3)
  {
    id v4 = objc_opt_new();
    ID = CGPDFDocumentGetID(a3);
    if (CGPDFArrayGetCount(ID) == 2)
    {
      size_t v6 = 0;
      char v7 = 1;
      do
      {
        char v8 = v7;
        CGPDFStringRef value = 0;
        if (CGPDFArrayGetString(ID, v6, &value))
        {
          size_t Length = CGPDFStringGetLength(value);
          BytePtr = CGPDFStringGetBytePtr(value);
          if (Length && BytePtr != 0)
          {
            CFStringRef v12 = [MEMORY[0x263EFF8F8] dataWithBytes:BytePtr length:Length];
            [v4 addObject:v12];
          }
        }
        char v7 = 0;
        size_t v6 = 1;
      }
      while ((v8 & 1) != 0);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_addEncryptionFromOptions:(id)a3
{
  id v4 = a3;
  if (![(PDFDocument *)self isEncrypted]) {
    goto LABEL_6;
  }
  id v5 = [v4 objectForKey:*MEMORY[0x263F00478]];
  if (v5
    || ([v4 objectForKey:*MEMORY[0x263F00440]],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v4 objectForKey:@"PDFDocumentUserPasswordOption"],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_6:
    id v6 = v4;
    goto LABEL_7;
  }
  char v8 = [v4 objectForKey:@"PDFDocumentOwnerPasswordOption"];

  if (v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  if (CGPDFDocumentGetEncryptionVersion() > 4)
  {
    ownerPassword = self->_ownerPassword;
    if (ownerPassword) {
      [v9 setObject:ownerPassword forKey:@"PDFDocumentOwnerPasswordOption"];
    }
    userPassword = self->_userPassword;
    if (userPassword)
    {
      [v9 setObject:userPassword forKey:@"PDFDocumentUserPasswordOption"];
      id v21 = [NSNumber numberWithUnsignedInt:self->_accessPermissions];
      [v9 setObject:v21 forKey:@"PDFDocumentAccessPermissionsOption"];
    }
    else
    {
      uint64_t v22 = self->_ownerPassword;
      if (v22) {
        [v9 setObject:v22 forKey:@"PDFDocumentUserPasswordOption"];
      }
    }
  }
  else
  {
    CGImageMetadataRef v10 = (void *)CGPDFDocumentCopyHashedOwnerPassword();
    unint64_t v11 = (void *)CGPDFDocumentCopyHashedUserPassword();
    CFStringRef v12 = (void *)CGPDFDocumentCopyEncryptionKey();
    uint64_t EncryptMetadata = CGPDFDocumentGetEncryptMetadata();
    if (v10 && v11 && v12)
    {
      uint64_t v14 = EncryptMetadata;
      uint64_t v15 = [(id)objc_opt_class() _getDocumentID:self->_document];
      if ([v15 count] == 2)
      {
        [v9 setObject:v15 forKeyedSubscript:*MEMORY[0x263F003D0]];
        [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F00400]];
        [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F00408]];
        [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F00410]];
        v16 = [NSNumber numberWithBool:v14];
        [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x263F003D8]];

        switch(CGPDFDocumentGetEncryptionVersion())
        {
          case 1:
            [v9 setObject:*MEMORY[0x263F003F8] forKeyedSubscript:*MEMORY[0x263F003E0]];
            uint64_t v17 = *MEMORY[0x263F00418];
            long long v18 = &unk_26C52E460;
            goto LABEL_29;
          case 2:
            [v9 setObject:*MEMORY[0x263F003F8] forKeyedSubscript:*MEMORY[0x263F003E0]];
            uint64_t v17 = *MEMORY[0x263F00418];
            long long v18 = &unk_26C52E478;
            goto LABEL_29;
          case 4:
            id v23 = (void **)MEMORY[0x263F003E8];
            goto LABEL_28;
          case 5:
            id v23 = (void **)MEMORY[0x263F003F0];
LABEL_28:
            long long v18 = *v23;
            uint64_t v17 = *MEMORY[0x263F003E0];
LABEL_29:
            [v9 setObject:v18 forKeyedSubscript:v17];
            uint64_t RawPermissions = CGPDFDocumentGetRawPermissions();
            if (RawPermissions)
            {
              v25 = [NSNumber numberWithUnsignedInt:RawPermissions];
              [v9 setObject:v25 forKeyedSubscript:*MEMORY[0x263F00420]];
            }
            break;
          default:

            id v6 = 0;
            goto LABEL_34;
        }
      }
    }
  }
  id v6 = v9;
LABEL_34:

LABEL_7:

  return v6;
}

- (id)_convertWriteOptions:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v3 keyEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    id v27 = (void *)*MEMORY[0x263F00458];
    unint64_t v28 = (void *)*MEMORY[0x263F00460];
    v29 = (void *)*MEMORY[0x263F00388];
    v30 = (void *)*MEMORY[0x263F00478];
    v31 = (void *)*MEMORY[0x263F00440];
    v32 = (void *)*MEMORY[0x263F00430];
    v33 = (void *)*MEMORY[0x263F00488];
    v34 = (void *)*MEMORY[0x263F00480];
    v35 = (void *)*MEMORY[0x263F00490];
    v36 = (void *)*MEMORY[0x263F003B8];
    v37 = (void *)*MEMORY[0x263F00468];
    char v8 = (void *)*MEMORY[0x263F003A0];
    uint64_t v9 = (void *)*MEMORY[0x263F00470];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        CFStringRef v12 = objc_msgSend(v3, "objectForKey:", v11, v27);
        char v13 = [v11 isEqual:@"Title"];
        uint64_t v14 = v9;
        if ((v13 & 1) == 0)
        {
          char v15 = objc_msgSend(v11, "isEqual:", @"Author", v9);
          uint64_t v14 = v8;
          if ((v15 & 1) == 0)
          {
            char v16 = objc_msgSend(v11, "isEqual:", @"Subject", v8);
            uint64_t v14 = v37;
            if ((v16 & 1) == 0)
            {
              char v17 = objc_msgSend(v11, "isEqual:", @"Creator", v37);
              uint64_t v14 = v36;
              if ((v17 & 1) == 0)
              {
                char v18 = objc_msgSend(v11, "isEqual:", @"Producer", v36);
                uint64_t v14 = v35;
                if ((v18 & 1) == 0)
                {
                  char v19 = objc_msgSend(v11, "isEqual:", @"CreationDate", v35);
                  uint64_t v14 = v34;
                  if ((v19 & 1) == 0)
                  {
                    char v20 = objc_msgSend(v11, "isEqual:", @"ModDate", v34);
                    uint64_t v14 = v33;
                    if ((v20 & 1) == 0)
                    {
                      char v21 = objc_msgSend(v11, "isEqual:", @"Keywords", v33);
                      uint64_t v14 = v32;
                      if ((v21 & 1) == 0)
                      {
                        char v22 = objc_msgSend(v11, "isEqual:", @"PDFDocumentOwnerPasswordOption", v32);
                        uint64_t v14 = v31;
                        if ((v22 & 1) == 0)
                        {
                          char v23 = objc_msgSend(v11, "isEqual:", @"PDFDocumentUserPasswordOption", v31);
                          uint64_t v14 = v30;
                          if ((v23 & 1) == 0)
                          {
                            char v24 = objc_msgSend(v11, "isEqual:", @"PDFDocumentAccessPermissionsOption", v30);
                            uint64_t v14 = v29;
                            if ((v24 & 1) == 0)
                            {
                              char v25 = objc_msgSend(v11, "isEqual:", @"PDFDocumentSaveImagesAsJPEGOption", v29);
                              uint64_t v14 = v28;
                              if ((v25 & 1) == 0)
                              {
                                if (objc_msgSend(v11, "isEqual:", @"PDFDocumentOptimizeImagesForScreenOption", v28))uint64_t v14 = v27; {
                                else
                                }
                                  uint64_t v14 = v11;
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
          }
        }
        [v4 setObject:v12 forKey:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)writeToConsumer:(CGDataConsumer *)a3 withOptions:(id)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v79 = a4;
  if (![(PDFDocument *)self isLocked])
  {
    akDocumentAdaptor = self->_akDocumentAdaptor;
    v85 = self;
    if (akDocumentAdaptor)
    {
      uint64_t v7 = [(PDFAKDocumentAdaptor *)akDocumentAdaptor akMainController];
      [v7 commitEditing];

      self = v85;
    }
    v76 = [(PDFDocument *)self _addEncryptionFromOptions:v79];
    v78 = [(PDFDocument *)v85 _convertWriteOptions:v76];
    char v8 = v78;
    if ([(PDFDocument *)v85 canSaveWithAppendModeUsingOptions:v78])
    {
      if ([(PDFDocument *)v85 _writeAppendMode:a3])
      {
        BOOL v77 = 1;
LABEL_84:

        goto LABEL_85;
      }
      NSLog(&cfstr_FailedToExecut.isa);
      char v8 = v78;
    }
    uint64_t v9 = [v8 objectForKey:@"PDFDocumentBurnInAnnotationsOption"];
    char v10 = [v9 BOOLValue];
    unint64_t v11 = objc_opt_new();
    CFStringRef v12 = v85;
    uint64_t v13 = [(PDFDocument *)v85 _createInfoDictionary];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      [v11 addEntriesFromDictionary:v13];
    }
    [v11 addEntriesFromDictionary:v78];
    v72 = v11;
    CGContextRef v15 = CGPDFContextCreate(a3, 0, (CFDictionaryRef)v11);
    BOOL v77 = v15 != 0;
    context = v15;
    if (v15)
    {
      uint64_t v82 = [(PDFDocument *)v85 pageCount];
      if (v82)
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          char v17 = [(PDFDocument *)v12 pageAtIndex:i];
          char v18 = [v17 annotations];

          if (v18)
          {
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v114 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v108;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v108 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  char v23 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                  [v23 setDictionaryRef:0];
                  [v23 setShouldHideInteractiveBackgroundColor:1];
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v114 count:16];
              }
              while (v20);
            }
          }
          CFStringRef v12 = v85;
        }
      }
      v73 = [(PDFDocument *)v12 formData];
      if (v73)
      {
        char v24 = (const void *)[v73 createDictionaryRef];
        if (v24)
        {
          CGPDFContextAddCatalogEntry();
          CFRelease(v24);
        }
      }
      v75 = [(PDFDocument *)v85 outlineRoot];
      if (v75)
      {
        [v75 invalidateDictionaryRef];
        char v25 = (const void *)[v75 createDictionaryRef];
        if (v25)
        {
          CGPDFContextAddCatalogEntry();
          CFRelease(v25);
        }
      }
      if ([(PDFDocument *)v85 bookmarksChanged]
        && [(PDFDocument *)v85 allowsDocumentAssembly])
      {
        [(PDFDocument *)v85 updateBookmarksInPDFDocument];
        id v26 = [(PDFDocument *)v85 bookmarkedPages];
        uint64_t v27 = [v26 copy];
        initialBookmarkedPageIndices = v85->_initialBookmarkedPageIndices;
        v85->_initialBookmarkedPageIndices = (NSIndexSet *)v27;
      }
      CFDataRef v29 = [(PDFDocument *)v85 newXMPFromData:v85->_documentCatalogMetadata preserveExistingXMPMetadata:1];
      if (v29)
      {
        CGPDFContextAddDocumentMetadata(context, v29);
        CFRelease(v29);
      }
      Catalog = CGPDFDocumentGetCatalog(v85->_document);
      if (Catalog)
      {
        CGPDFDictionaryRef value = 0;
        CGPDFDictionaryGetDictionary(Catalog, "StructTreeRoot", &value);
        if (value)
        {
          *(double *)&CGPDFDictionaryRef valuePtr = 0.0;
          if (CGPDFDictionaryGetDictionary(value, "ParentTree", &valuePtr)) {
            CGPDFContextSetParentTree();
          }
          CGPDFDictionaryRef v105 = 0;
          if (CGPDFDictionaryGetDictionary(value, "IDTree", &v105)) {
            CGPDFContextSetIDTree();
          }
        }
      }
      v31 = [MEMORY[0x263F08A00] defaultCenter];
      [v31 postNotificationName:@"PDFDidBeginDocumentWrite" object:v85];

      BOOL v71 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
      v74 = [v78 objectForKeyedSubscript:@"PDFDocumentSaveTextFromOCROption"];

      if (v74) {
        char v81 = [v74 BOOLValue];
      }
      else {
        char v81 = 0;
      }
      if (v82)
      {
        uint64_t v32 = 0;
        key = (void *)*MEMORY[0x263F00448];
        do
        {
          uint64_t v83 = v32;
          v87 = -[PDFDocument pageAtIndex:](v85, "pageAtIndex:");
          theDict = (__CFDictionary *)[v87 gcCreateBoxDictionary];
          *(double *)&CGPDFDictionaryRef valuePtr = 0.0;
          *(double *)&CGPDFDictionaryRef valuePtr = (double)[v87 rotation];
          CFNumberRef v33 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
          if (v33)
          {
            CFDictionaryAddValue(theDict, @"Rotate", v33);
            CFRelease(v33);
          }
          CGPDFDictionaryRef value = 0;
          p_CGPDFDictionaryRef value = &value;
          uint64_t v101 = 0x3032000000;
          v102 = __Block_byref_object_copy__4;
          v103 = __Block_byref_object_dispose__4;
          id v104 = 0;
          v98[0] = MEMORY[0x263EF8330];
          v98[1] = 3221225472;
          v98[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke;
          v98[3] = &unk_264204D60;
          v98[4] = &value;
          [v87 enumerateApplicationDataUsingBlock:v98];
          CGPDFDictionaryRef v34 = p_value[5];
          if (v34) {
            CFDictionaryAddValue(theDict, key, v34);
          }
          Dictionary = CGPDFPageGetDictionary((CGPDFPageRef)[v87 pageRef]);
          CGPDFDictionaryRef v105 = 0;
          if (CGPDFDictionaryGetInteger(Dictionary, "StructParents", (CGPDFInteger *)&v105))
          {
            CFNumberRef v36 = CFNumberCreate(0, kCFNumberLongType, &v105);
            CFDictionaryAddValue(theDict, @"StructParents", v36);
            CFRelease(v36);
          }
          CGPDFContextBeginPage(context, theDict);
          path = (const CGPath *)[v87 createRedactionPath];
          CGPDFContextSetRedactionPath();
          v37 = [MEMORY[0x263F08A00] defaultCenter];
          v38 = NSDictionary;
          long long v39 = [NSNumber numberWithUnsignedInt:v83];
          long long v40 = [v38 dictionaryWithObject:v39 forKey:@"PDFDocumentPageIndex"];
          [v37 postNotificationName:@"PDFDidBeginPageWrite" object:v85 userInfo:v40];

          BOOL v41 = +[PDFPage shouldHideAnnotationsForThisThread];
          +[PDFPage setShouldHideAnnotationsForThisThread:1];
          if ((v81 & 1) != 0 || [v87 requestedOCR])
          {
            if (([v87 isTextFromOCR] & 1) == 0
              && +[PDFPageEvaluator isPageCandidateForOCR:v87])
            {
              dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
              v43 = +[PDFPageAnalyzer sharedInstance];
              v96[0] = MEMORY[0x263EF8330];
              v96[1] = 3221225472;
              v96[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke_2;
              v96[3] = &unk_264204D88;
              uint64_t v44 = v42;
              v97 = v44;
              [v43 analyzePage:v87 analysisTypes:1 completionQueue:0 completionBlock:v96];

              dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
            }
            uint64_t v45 = 1;
          }
          else
          {
            uint64_t v45 = 0;
          }
          v46 = self;
          v47 = (objc_class *)objc_opt_class();
          if (PDFSubclassOverridesSelector((objc_class *)v46, v47, sel_drawWithBox_toContext_))
          {
          }
          else
          {
            self;
            v48 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v49 = (objc_class *)objc_opt_class();
            BOOL v50 = PDFSubclassOverridesSelector(v48, v49, sel_drawWithBox_);

            if (!v50)
            {
              v112 = @"PDFPageDrawWithBoxOption_RenderExtraContentStream";
              v51 = [NSNumber numberWithBool:v45];
              v113 = v51;
              v52 = [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
              [v87 drawWithBox:0 inContext:context withOptions:v52];

              goto LABEL_65;
            }
          }
          [v87 drawWithBox:0 toContext:context];
LABEL_65:
          +[PDFPage setShouldHideAnnotationsForThisThread:v41];
          CGPDFContextSetRedactionPath();
          v94[0] = MEMORY[0x263EF8330];
          v94[1] = 3221225472;
          v94[2] = __43__PDFDocument_writeToConsumer_withOptions___block_invoke_3;
          v94[3] = &__block_descriptor_33_e23_B16__0__PDFAnnotation_8l;
          char v95 = v10;
          [v87 drawAnnotationsWithBox:0 inContext:context passingTest:v94];
          CGPDFContextSetRedactionPath();
          v53 = [v87 annotations];
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v54 = v53;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v90 objects:v111 count:16];
          if (v55)
          {
            uint64_t v56 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v91 != v56) {
                  objc_enumerationMutation(v54);
                }
                if ((v10 & 1) == 0)
                {
                  v58 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                  if (([v58 shouldBurnIn] & 1) == 0
                    && ([v58 intersectsWithRedactionPath] & 1) == 0)
                  {
                    v59 = [v58 valueForAnnotationKey:@"/AAPL:SFF"];
                    if (!v59
                      || ([v58 contents],
                          v60 = objc_claimAutoreleasedReturnValue(),
                          BOOL v61 = [v60 length] == 0,
                          v60,
                          v59,
                          !v61))
                    {
                      [v58 setShouldHideInteractiveBackgroundColor:1];
                      CFDictionaryRef v62 = (const __CFDictionary *)[v58 dictionaryRef];
                      [v58 setShouldHideInteractiveBackgroundColor:0];
                      if (v62)
                      {
                        [v58 sourceDictionary];
                        CGPDFDictionaryGetObjectReference();
                        uint64_t ObjectReference = 0;
                        [v58 sourceDictionary];
                        uint64_t ObjectReference = CGPDFDictionaryGetObjectReference();
                        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v62);
                        CFNumberRef v64 = CFNumberCreate(0, kCFNumberLongType, &ObjectReference);
                        CFDictionaryAddValue(MutableCopy, @"ObjectNumber", v64);
                        CFRelease(v64);
                        CGPDFContextAddAnnotation();
                        CFRelease(MutableCopy);
                      }
                    }
                  }
                }
              }
              uint64_t v55 = [v54 countByEnumeratingWithState:&v90 objects:v111 count:16];
            }
            while (v55);
          }

          CGPDFContextEndPage(context);
          v65 = [MEMORY[0x263F08A00] defaultCenter];
          v66 = NSDictionary;
          v67 = [NSNumber numberWithUnsignedInt:v83];
          v68 = [v66 dictionaryWithObject:v67 forKey:@"PDFDocumentPageIndex"];
          [v65 postNotificationName:@"PDFDidEndPageWrite" object:v85 userInfo:v68];

          CGPDFContextSetRedactionPath();
          CGPathRelease(path);
          if (theDict) {
            CFRelease(theDict);
          }

          _Block_object_dispose(&value, 8);
          uint64_t v32 = v83 + 1;
        }
        while (v83 + 1 != v82);
      }
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:v71];
      CGPDFContextClose(context);
      CGContextRelease(context);
      v69 = [MEMORY[0x263F08A00] defaultCenter];
      [v69 postNotificationName:@"PDFDidEndDocumentWrite" object:v85];
    }
    else
    {
      v74 = v9;
    }

    char v8 = v78;
    goto LABEL_84;
  }
  BOOL v77 = 0;
LABEL_85:

  return v77;
}

void __43__PDFDocument_writeToConsumer_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 setObject:v5 forKeyedSubscript:v10];
}

intptr_t __43__PDFDocument_writeToConsumer_withOptions___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __43__PDFDocument_writeToConsumer_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 1;
  }
  else {
    return [a2 shouldBurnIn];
  }
}

- (BOOL)canSaveWithAppendModeUsingOptions:(id)a3
{
  id v4 = a3;
  if (GetDefaultsWriteUseAppendMode()
    && ![(PDFDocument *)self isEncrypted]
    && [(PDFDocument *)self allowsPrinting])
  {
    id v5 = [v4 objectForKey:@"PDFDocumentWriteOption_UseAppendMode"];
    uint64_t v6 = v5;
    if (!v5) {
      goto LABEL_16;
    }
    if (![v5 BOOLValue]) {
      goto LABEL_16;
    }
    uint64_t v7 = [v4 objectForKey:@"QuartzFilter"];

    if (v7) {
      goto LABEL_16;
    }
    uint64_t v8 = [v4 objectForKey:*MEMORY[0x263F00478]];
    if (v8)
    {
      BOOL v9 = 1;
    }
    else
    {
      CFStringRef v12 = [v4 objectForKey:*MEMORY[0x263F00440]];
      BOOL v9 = v12 != 0;
    }
    if (((v8, [(PDFDocument *)self isEncrypted]) || !v9)
      && (![(PDFDocument *)self isEncrypted] || v9)
      && !self->_documentHasBurnInAnnotations)
    {
      uint64_t v13 = [v4 objectForKey:@"PDFDocumentBurnInAnnotationsOption"];
      if (([v13 BOOLValue] & 1) != 0
        || self->_documentHasPageWithApplicationData
        || self->_documentRedactionCount
        || self->_pagesChanged.pagesRemoved
        || self->_pagesChanged.pagesExchanged
        || self->_pagesChanged.blankPagesAdded)
      {
        BOOL v10 = 0;
      }
      else
      {
        uint64_t v14 = [v4 objectForKey:*MEMORY[0x263F003B0]];
        CGContextRef v15 = v14;
        if (v14 && ([v14 BOOLValue] & 1) != 0)
        {
          BOOL v10 = 0;
        }
        else
        {
          char v16 = [v4 objectForKey:*MEMORY[0x263F003A8]];
          char v17 = v16;
          if (v16 && ([v16 BOOLValue] & 1) != 0)
          {
            BOOL v10 = 0;
          }
          else
          {
            char v18 = [v4 objectForKey:@"PDFDocumentSaveTextFromOCROption"];
            id v19 = v18;
            if (v18 && ([v18 BOOLValue] & 1) != 0)
            {
              BOOL v10 = 0;
            }
            else
            {
              uint64_t v20 = [(PDFDocument *)self formData];
              BOOL v10 = v20 == 0;
            }
          }
        }
      }
    }
    else
    {
LABEL_16:
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)canSaveWithTextFromOCR
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = self->_pages;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      if ([*(id *)(*((void *)&v16 + 1) + 8 * v7) isTextFromOCR]) {
        goto LABEL_18;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_pages;
  uint64_t v8 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
LABEL_11:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v3);
      }
      if (+[PDFPageEvaluator isPageCandidateForOCR:](PDFPageEvaluator, "isPageCandidateForOCR:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12))
      {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v8) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v8) = 1;
  }
LABEL_19:

  return v8;
}

- (BOOL)isSimpleSelectionEnabled
{
  document = self->_document;
  if (document) {
    LOBYTE(document) = MEMORY[0x270EE6C48](document, a2);
  }
  return (char)document;
}

- (BOOL)_writeAppendMode:(CGDataConsumer *)a3
{
  id v3 = self;
  uint64_t v129 = *MEMORY[0x263EF8340];
  NSUInteger v4 = [(PDFDocument *)self pageCount];
  uint64_t v5 = objc_opt_new();
  NSUInteger v103 = v4;
  if (!v4)
  {
LABEL_5:
    BOOL v100 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread];
    +[PDFDocument setPDFDocumentAppendModeActiveForThisThread:1];
    BOOL v99 = +[PDFPage isNativeRotationDrawingEnabledForThisThread];
    +[PDFPage setNativeRotationDrawingEnabledForThisThread:1];
    id v106 = objc_alloc_init(MEMORY[0x263EFF980]);
    v102 = v5;
    if (!v103) {
      goto LABEL_78;
    }
    uint64_t v10 = 0;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    long long v108 = v3;
    while (1)
    {
      unint64_t v11 = [(PDFDocument *)v3 pageAtIndex:v10];
      uint64_t v12 = [v11 pageRef];
      [v11 rotation];
      page = (CGPDFPage *)v12;
      CGPDFPageSetRotationAngle();
      for (uint64_t i = 0; i != 5; ++i)
      {
        CGFloat v14 = PDFRectToCGRect([v11 boundsForBox:i]);
        CGFloat v16 = v15;
        double v18 = v17;
        double v20 = v19;
        CGRect BoxRect = CGPDFPageGetBoxRect(page, (CGPDFBox)i);
        if (v18 > 0.0 && v20 > 0.0)
        {
          CGRect v138 = BoxRect;
          v131.origin.CGFloat x = v14;
          v131.origin.CGFloat y = v16;
          v131.size.CGFloat width = v18;
          v131.size.CGFloat height = v20;
          if (!CGRectEqualToRect(v131, v138)) {
            CGPDFPageSetBoxRect();
          }
        }
      }
      uint64_t v104 = v10;
      CGPDFDictionaryRef v105 = v11;
      uint64_t v21 = [v5 objectAtIndex:v10];
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v121 objects:v128 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        char v24 = 0;
        uint64_t v25 = *(void *)v122;
        while (1)
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v122 != v25) {
              objc_enumerationMutation(v21);
            }
            uint64_t v27 = *(void **)(*((void *)&v121 + 1) + 8 * v26);
            unint64_t v28 = [v27 annotation];
            [v28 setShouldHideInteractiveBackgroundColor:1];
            if (![v27 changeType])
            {
              uint64_t v30 = [v28 valueForAnnotationKey:@"/AAPL:SFF"];
              if (v30)
              {
                v31 = (void *)v30;
                uint64_t v32 = [v28 contents];
                uint64_t v33 = [v32 length];

                if (!v33) {
                  goto LABEL_32;
                }
              }
              goto LABEL_30;
            }
            if ([v27 changeType] == 1
              || [v27 changeType] == 4)
            {
              if ([v28 CGPDFAnnotation]
                || ([v28 valueForAnnotationKey:@"/AAPL:SFF"],
                    CGPDFDictionaryRef v34 = objc_claimAutoreleasedReturnValue(),
                    v34,
                    !v34))
              {
                if ([v27 changeType] == 1) {
                  [v28 setDictionaryRef:0];
                }
                -[PDFDocument _sanitizeAnnotationDictionary:](v108, "_sanitizeAnnotationDictionary:", [v28 dictionaryRefExcludingParentOrPopup]);
                CGPDFPageSubstituteAnnotationDictionary();
                BOOL v29 = [v27 changeType] == 4;
                goto LABEL_25;
              }
LABEL_30:
              uint64_t v35 = [(PDFDocument *)v108 _createCGPDFAnnotationForAnnotation:v28];
              if (v35)
              {
                CFNumberRef v36 = (const void *)v35;
                CGPDFPageAddAnnotation();
                CFRelease(v36);
                char v24 = 1;
              }
              goto LABEL_32;
            }
            if ([v27 changeType] == 2)
            {
              v37 = (const void *)[v28 CGPDFAnnotation];
              if (v37)
              {
                v38 = v37;
                CFRetain(v37);
                CGPDFPageRemoveAnnotation();
                [v28 setCGPDFAnnotation:0];
                CFRelease(v38);
              }
            }
            else if ([v27 changeType] == 3)
            {
              BOOL v29 = [v28 CGPDFAnnotation] != 0;
LABEL_25:
              v24 |= v29;
            }
LABEL_32:
            [v28 setShouldHideInteractiveBackgroundColor:0];

            ++v26;
          }
          while (v23 != v26);
          uint64_t v39 = [v21 countByEnumeratingWithState:&v121 objects:v128 count:16];
          uint64_t v23 = v39;
          if (!v39)
          {
            uint64_t v5 = v102;
            if (v24)
            {
              Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x263EFFF70]);
              BOOL v41 = [v105 annotations];
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v117 objects:v127 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v118;
                do
                {
                  for (uint64_t j = 0; j != v43; ++j)
                  {
                    if (*(void *)v118 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    v46 = *(void **)(*((void *)&v117 + 1) + 8 * j);
                    uint64_t v47 = [v46 CGPDFAnnotation];
                    if (v47)
                    {
                      v48 = (const void *)v47;
                      if (([v46 shouldBurnIn] & 1) == 0) {
                        CFArrayAppendValue(Mutable, v48);
                      }
                    }
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v117 objects:v127 count:16];
                }
                while (v43);
              }
              if ([v105 pageRef] && CFArrayGetCount(Mutable) >= 1) {
                CGPDFPageSortAnnotations();
              }
              CFRelease(Mutable);
            }
            break;
          }
        }
      }
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v49 = v21;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v113 objects:v126 count:16];
      if (!v50) {
        goto LABEL_69;
      }
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v114;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v114 != v52) {
            objc_enumerationMutation(v49);
          }
          id v54 = [*(id *)(*((void *)&v113 + 1) + 8 * k) annotation];
          if ([v54 CGPDFAnnotation])
          {
            uint64_t v55 = [v54 popup];

            if (v55)
            {
              uint64_t v56 = [v54 popup];
            }
            else
            {
              v57 = [v54 parent];

              if (!v57) {
                goto LABEL_67;
              }
              uint64_t v56 = [v54 parent];
            }
            uint64_t v58 = [v56 CGPDFAnnotation];

            if (v58)
            {
              CGPDFAnnotationSetAnnotationForKey();
              [v106 addObject:v54];
            }
          }
LABEL_67:
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v113 objects:v126 count:16];
      }
      while (v51);
LABEL_69:

      v59 = [v105 akPageAdaptor];
      v60 = v59;
      if (v59)
      {
        BOOL v61 = [v59 akPageModelController];
        CFDictionaryRef v62 = [v61 cropAnnotation];
        v63 = v62;
        if (v62)
        {
          if ([v62 cropApplied])
          {
            CGRect v132 = CGPDFPageGetBoxRect(page, kCGPDFCropBox);
            CGRect v133 = CGRectIntegral(v132);
            CGFloat x = v133.origin.x;
            CGFloat y = v133.origin.y;
            CGFloat width = v133.size.width;
            CGFloat height = v133.size.height;
            [v63 rectangle];
            CGFloat v69 = v68;
            CGFloat v71 = v70;
            CGFloat v73 = v72;
            CGFloat v75 = v74;
            CGRect v139 = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
            v134.origin.CGFloat x = v69;
            v134.origin.CGFloat y = v71;
            v134.size.CGFloat width = v73;
            v134.size.CGFloat height = v75;
            CGRect v135 = CGRectIntersection(v134, v139);
            CGRect v136 = CGRectIntegral(v135);
            if (v136.size.width > 0.0)
            {
              CGFloat v76 = v136.size.height;
              if (v136.size.height > 0.0)
              {
                CGFloat v77 = v136.origin.x;
                CGFloat v78 = v136.origin.y;
                CGFloat v79 = v136.size.width;
                v137.origin.CGFloat x = x;
                v137.origin.CGFloat y = y;
                v137.size.CGFloat width = width;
                v137.size.CGFloat height = height;
                v140.origin.CGFloat x = v77;
                v140.origin.CGFloat y = v78;
                v140.size.CGFloat width = v79;
                v140.size.CGFloat height = v76;
                if (!CGRectEqualToRect(v137, v140)) {
                  CGPDFPageSetBoxRect();
                }
              }
            }
          }
        }
      }
      [v105 clearAnnotationChanges];

      uint64_t v10 = v104 + 1;
      id v3 = v108;
      if (v104 + 1 == v103)
      {
LABEL_78:
        if ([(PDFDocument *)v3 bookmarksChanged]
          && [(PDFDocument *)v3 allowsDocumentAssembly])
        {
          [(PDFDocument *)v3 updateBookmarksInPDFDocument];
          uint64_t v80 = [(PDFDocument *)v3 newXMPFromData:v3->_documentCatalogMetadata preserveExistingXMPMetadata:1];
          if (v80)
          {
            char v81 = (const void *)v80;
            CGPDFDocumentAppendMetadata();
            CFRelease(v81);
          }
          uint64_t v82 = [(PDFDocument *)v3 bookmarkedPages];
          uint64_t v83 = [v82 copy];
          initialBookmarkedPageIndices = v3->_initialBookmarkedPageIndices;
          v3->_initialBookmarkedPageIndices = (NSIndexSet *)v83;
        }
        if (v3->_attributes
          && (!v3->_appendedAttributes || !-[NSDictionary isEqualToDictionary:](v3->_attributes, "isEqualToDictionary:")))
        {
          CGPDFDocumentAppendDocumentInfo();
          uint64_t v85 = [(NSDictionary *)v3->_attributes copy];
          appendedAttributes = v3->_appendedAttributes;
          v3->_appendedAttributes = (NSDictionary *)v85;
        }
        +[PDFPage setNativeRotationDrawingEnabledForThisThread:v99];
        +[PDFDocument setPDFDocumentAppendModeActiveForThisThread:v100];
        char v87 = CGPDFDocumentCopyToConsumerWithChanges();
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v88 = v106;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v109 objects:v125 count:16];
        if (!v89)
        {
LABEL_100:

          uint64_t v5 = v102;
          goto LABEL_102;
        }
        uint64_t v90 = v89;
        uint64_t v91 = *(void *)v110;
        while (2)
        {
          uint64_t v92 = 0;
LABEL_90:
          if (*(void *)v110 != v91) {
            objc_enumerationMutation(v88);
          }
          long long v93 = *(void **)(*((void *)&v109 + 1) + 8 * v92);
          uint64_t v94 = [v93 CGPDFAnnotation];
          char v95 = [v93 popup];

          if (v95)
          {
            BOOL v96 = 0;
            if (!v94) {
              goto LABEL_98;
            }
          }
          else
          {
            v97 = [v93 parent];

            BOOL v96 = v97 == 0;
            if (!v94) {
              goto LABEL_98;
            }
          }
          if (!v96) {
            CGPDFAnnotationSetAnnotationForKey();
          }
LABEL_98:
          if (v90 == ++v92)
          {
            uint64_t v90 = [v88 countByEnumeratingWithState:&v109 objects:v125 count:16];
            if (!v90) {
              goto LABEL_100;
            }
            continue;
          }
          goto LABEL_90;
        }
      }
    }
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = [(PDFDocument *)v3 pageAtIndex:v6];
    uint64_t v8 = [v7 annotationChanges];
    if (!v8) {
      break;
    }
    uint64_t v9 = (void *)v8;
    [v5 insertObject:v8 atIndex:v6];

    if (v103 == ++v6) {
      goto LABEL_5;
    }
  }

  char v87 = 0;
LABEL_102:

  return v87;
}

- (CGPDFAnnotation)_createCGPDFAnnotationForAnnotation:(id)a3
{
  id v4 = a3;
  -[PDFDocument _sanitizeAnnotationDictionary:](self, "_sanitizeAnnotationDictionary:", [v4 dictionaryRefExcludingParentOrPopup]);
  uint64_t v5 = (CGPDFAnnotation *)CGPDFAnnotationCreate();
  if (v5)
  {
    if ([v4 shouldBurnIn]) {
      CGPDFAnnotationSetBurnIn();
    }
    [v4 setCGPDFAnnotation:v5];
  }
  else
  {
    NSLog(&cfstr_FailedToCreate_1.isa);
  }

  return v5;
}

- (CGPDFName)_convertCFStringToCGPDFName:(void *)a3 forKey:(__CFString *)a4
{
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 != CFStringGetTypeID()) {
    return 0;
  }
  if (a4)
  {
    uint64_t v7 = +[PDFAnnotation PDFAnnotationKeysWithStringValues];
    char v8 = [v7 containsObject:a4];

    if (v8) {
      return 0;
    }
  }
  if (!CFStringHasPrefix((CFStringRef)a3, @"/")) {
    return 0;
  }
  CFIndex Length = CFStringGetLength((CFStringRef)a3);
  CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  unint64_t v11 = (char *)malloc_type_malloc(v10, 0x100004077774924uLL);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  if (CFStringGetCString((CFStringRef)a3, v11, v10, 0x8000100u)) {
    long long v13 = (CGPDFName *)CGPDFNameCreate();
  }
  else {
    long long v13 = 0;
  }
  free(v12);
  return v13;
}

- (void)_sanitizeAnnotationDictionary:(__CFDictionary *)a3
{
  CFIndex Count = CFDictionaryGetCount(a3);
  CFTypeID v6 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  uint64_t v21 = v6;
  CFDictionaryGetKeysAndValues(a3, v6, v7);
  if (Count)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v9 = v21;
    CFIndex v10 = v7;
    while (1)
    {
      unint64_t v11 = (CGPDFName *)*v9;
      uint64_t v12 = *v10;
      long long v13 = [(PDFDocument *)self _convertCFStringToCGPDFName:*v9 forKey:0];
      if (v13)
      {
        CGFloat v14 = v13;
        CFRetain(v12);
        CFDictionaryRemoveValue(a3, v11);
        CFDictionarySetValue(a3, v14, v12);
        CFRelease(v12);
        CFRelease(v14);
        unint64_t v11 = v14;
      }
      double v15 = [(PDFDocument *)self _convertCFStringToCGPDFName:v12 forKey:*v9];
      if (v15) {
        break;
      }
      CFTypeID v18 = CFGetTypeID(v12);
      if (v18 == CFArrayGetTypeID())
      {
        MutableCopCGFloat y = CFArrayCreateMutableCopy(v8, 0, (CFArrayRef)v12);
        [(PDFDocument *)self _sanitizeAnnotationArray:MutableCopy];
        goto LABEL_11;
      }
      CFTypeID v20 = CFGetTypeID(v12);
      if (v20 == CFDictionaryGetTypeID())
      {
        MutableCopCGFloat y = CFDictionaryCreateMutableCopy(v8, 0, (CFDictionaryRef)v12);
        [(PDFDocument *)self _sanitizeAnnotationDictionary:MutableCopy];
LABEL_11:
        CFDictionarySetValue(a3, v11, MutableCopy);
        CFMutableArrayRef v17 = MutableCopy;
LABEL_12:
        CFRelease(v17);
      }
      ++v10;
      ++v9;
      if (!--Count) {
        goto LABEL_14;
      }
    }
    CGFloat v16 = v15;
    CFDictionarySetValue(a3, v11, v15);
    CFMutableArrayRef v17 = (CFMutableArrayRef)v16;
    goto LABEL_12;
  }
LABEL_14:
  free(v21);

  free(v7);
}

- (void)_sanitizeAnnotationArray:(__CFArray *)a3
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(a3, v7);
      CFIndex v10 = [(PDFDocument *)self _convertCFStringToCGPDFName:ValueAtIndex forKey:0];
      if (v10) {
        break;
      }
      CFTypeID v13 = CFGetTypeID(ValueAtIndex);
      if (v13 == CFArrayGetTypeID())
      {
        MutableCopCGFloat y = CFArrayCreateMutableCopy(v8, 0, (CFArrayRef)ValueAtIndex);
        [(PDFDocument *)self _sanitizeAnnotationArray:MutableCopy];
        goto LABEL_9;
      }
      CFTypeID v15 = CFGetTypeID(ValueAtIndex);
      if (v15 == CFDictionaryGetTypeID())
      {
        MutableCopCGFloat y = CFDictionaryCreateMutableCopy(v8, 0, (CFDictionaryRef)ValueAtIndex);
        [(PDFDocument *)self _sanitizeAnnotationDictionary:MutableCopy];
LABEL_9:
        CFArraySetValueAtIndex(a3, v7, MutableCopy);
        CFMutableArrayRef v12 = MutableCopy;
LABEL_10:
        CFRelease(v12);
      }
      if (v6 == ++v7) {
        return;
      }
    }
    unint64_t v11 = v10;
    CFArraySetValueAtIndex(a3, v7, v10);
    CFMutableArrayRef v12 = (CFMutableArrayRef)v11;
    goto LABEL_10;
  }
}

- (id)_documentCatalogMetadataForRootPath:(id)a3 withKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isUnlocked)
  {
    documentCatalogMetadata = self->_documentCatalogMetadata;
    if (documentCatalogMetadata)
    {
LABEL_8:
      CGFloat v14 = documentCatalogMetadata;
      goto LABEL_10;
    }
    Catalog = CGPDFDocumentGetCatalog(self->_document);
    if (Catalog)
    {
      CGPDFStreamRef value = 0;
      if (CGPDFDictionaryGetStream(Catalog, "Metadata", &value))
      {
        CGPDFDataFormat format = CGPDFDataFormatRaw;
        CFDataRef v10 = CGPDFStreamCopyData(value, &format);
        if (v10)
        {
          CFDataRef v11 = v10;
          CFMutableArrayRef v12 = [(PDFDocument *)self _dataFromXMP:v10 withRootPath:v6 keys:v7];
          CFTypeID v13 = self->_documentCatalogMetadata;
          self->_documentCatalogMetadata = v12;

          CFRelease(v11);
        }
      }
      documentCatalogMetadata = self->_documentCatalogMetadata;
      goto LABEL_8;
    }
  }
  CGFloat v14 = 0;
LABEL_10:

  return v14;
}

- (void)_setDocumentCatalogMetadata:(id)a3 withNSpace:(id)a4 prefix:(id)a5 rootPath:(id)a6
{
  uint64_t v22 = (NSArray *)a3;
  CFDataRef v10 = (NSString *)a4;
  CFDataRef v11 = (NSString *)a5;
  CFMutableArrayRef v12 = (NSString *)a6;
  CFTypeID v13 = self;
  objc_sync_enter(v13);
  if (v13->_xmpNameSpace != v10)
  {
    uint64_t v14 = [(NSString *)v10 copy];
    xmpNameSpace = v13->_xmpNameSpace;
    v13->_xmpNameSpace = (NSString *)v14;
  }
  if (v13->_xmpPrefix != v11)
  {
    uint64_t v16 = [(NSString *)v11 copy];
    xmpPrefiCGFloat x = v13->_xmpPrefix;
    v13->_xmpPrefiCGFloat x = (NSString *)v16;
  }
  if (v13->_xmpRootPath != v12)
  {
    uint64_t v18 = [(NSString *)v12 copy];
    xmpRootPath = v13->_xmpRootPath;
    v13->_xmpRootPath = (NSString *)v18;
  }
  if (v13->_documentCatalogMetadata != v22)
  {
    uint64_t v20 = [(NSArray *)v22 copy];
    documentCatalogMetadata = v13->_documentCatalogMetadata;
    v13->_documentCatalogMetadata = (NSArray *)v20;
  }
  objc_sync_exit(v13);
}

- (__CFData)newXMPFromData:(id)a3 preserveExistingXMPMetadata:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  CGPDFStreamRef value = 0;
  if (!CGPDFDictionaryGetStream(Catalog, "Metadata", &value)) {
    goto LABEL_8;
  }
  CGPDFDataFormat format = CGPDFDataFormatRaw;
  CFDataRef v8 = CGPDFStreamCopyData(value, &format);
  if (!v8) {
    goto LABEL_8;
  }
  CFDataRef XMPData = v8;
  if (!v6) {
    goto LABEL_34;
  }
  CFDataRef v10 = CGImageMetadataCreateFromXMPData(v8);
  CFRelease(XMPData);
  if (v10)
  {
    MutableCopCGFloat y = CGImageMetadataCreateMutableCopy(v10);
    if (!MutableCopy)
    {
      CFDataRef XMPData = 0;
LABEL_32:
      CFRelease(v10);
      goto LABEL_34;
    }
    CFMutableArrayRef v12 = MutableCopy;
    char v13 = 0;
  }
  else
  {
LABEL_8:
    CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
    CFDataRef v10 = 0;
    if (!Mutable)
    {
      CFDataRef XMPData = 0;
      goto LABEL_34;
    }
    CFMutableArrayRef v12 = Mutable;
    char v13 = 1;
  }
  CFStringRef xmpNameSpace = (const __CFString *)self->_xmpNameSpace;
  if (xmpNameSpace)
  {
    xmpPrefiCGFloat x = (const __CFString *)self->_xmpPrefix;
    if (xmpPrefix)
    {
      if (v6 && self->_xmpRootPath)
      {
        CGImageMetadataRegisterNamespaceForPrefix(v12, xmpNameSpace, xmpPrefix, 0);
        char v30 = v13;
        if ((v13 & 1) == 0)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __58__PDFDocument_newXMPFromData_preserveExistingXMPMetadata___block_invoke;
          block[3] = &unk_264204DD0;
          void block[4] = self;
          block[5] = v12;
          CGImageMetadataEnumerateTagsUsingBlock(v10, 0, 0, block);
        }
        v31 = v10;
        id v32 = v6;
        CFMutableArrayRef v17 = self;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id obj = v6;
        uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v35)
        {
          uint64_t v18 = 0;
          uint64_t v34 = *(void *)v42;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v42 != v34) {
                objc_enumerationMutation(obj);
              }
              uint64_t v36 = v19;
              uint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v21 = v20;
              uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v48 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v38;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v38 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                    uint64_t v27 = [v21 valueForKey:v26];
                    unint64_t v28 = [NSString stringWithFormat:@"%@[%d].%@", v17->_xmpRootPath, v18, v26];
                    CGImageMetadataSetValueWithPath(v12, 0, v28, v27);
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v48 count:16];
                }
                while (v23);
              }

              uint64_t v18 = (v18 + 1);
              uint64_t v19 = v36 + 1;
            }
            while (v36 + 1 != v35);
            uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v35);
        }

        CFDataRef v10 = v31;
        id v6 = v32;
        char v13 = v30;
      }
    }
  }
  CFDataRef XMPData = CGImageMetadataCreateXMPData(v12, 0);
  CFRelease(v12);
  if ((v13 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_34:

  return XMPData;
}

uint64_t __58__PDFDocument_newXMPFromData_preserveExistingXMPMetadata___block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  CFStringRef v5 = CGImageMetadataTagCopyPrefix(tag);
  if (CFEqual(v5, *(CFStringRef *)(*(void *)(a1 + 32) + 312))) {
    CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 40), 0, a2);
  }
  CFRelease(v5);
  return 1;
}

- (id)akDocumentAdaptor
{
  if (GetDefaultsWriteAKEnabled() && !self->_akDocumentAdaptor) {
    _PDFLog(OS_LOG_TYPE_DEFAULT, (uint64_t)"PDFDocument", (uint64_t)"%s: Called when the document adaptor wasn't set up yet.", v3, v4, v5, v6, v7, (uint64_t)"-[PDFDocument akDocumentAdaptor]");
  }
  akDocumentAdaptor = self->_akDocumentAdaptor;

  return akDocumentAdaptor;
}

- (void)setPDFAKControllerDelegate:(id)a3
{
  akDocumentAdaptor = self->_akDocumentAdaptor;
  if (akDocumentAdaptor)
  {
    [(PDFAKDocumentAdaptor *)akDocumentAdaptor setPDFAKControllerDelegate:a3];
    a3 = 0;
  }

  objc_storeWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup, a3);
}

- (id)PDFAKControllerDelegate
{
  akDocumentAdaptor = self->_akDocumentAdaptor;
  if (akDocumentAdaptor)
  {
    akDocumentAdaptor = [akDocumentAdaptor PDFAKControllerDelegate];
  }

  return akDocumentAdaptor;
}

- (void)_notifyAKAdaptorPagePlaceholder:(id)a3 wasReplacedWithPage:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_akDocumentAdaptor)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      [v9 setupAKPageAdaptorIfNecessary];
      [(PDFAKDocumentAdaptor *)self->_akDocumentAdaptor pdfDocument:self didReplacePagePlaceholder:v8 atIndex:a5 withPage:v9];
      [v9 setAKDidSetupRealPageModelController:1];
    }
    else
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3042000000;
      v17[3] = __Block_byref_object_copy__355;
      v17[4] = __Block_byref_object_dispose__356;
      objc_initWeak(&v18, self);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3042000000;
      v15[3] = __Block_byref_object_copy__355;
      v15[4] = __Block_byref_object_dispose__356;
      objc_initWeak(&v16, v9);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __75__PDFDocument__notifyAKAdaptorPagePlaceholder_wasReplacedWithPage_atIndex___block_invoke;
      v10[3] = &unk_264204DF8;
      char v13 = v17;
      uint64_t v14 = v15;
      id v11 = v8;
      id v12 = v9;
      dispatch_async(MEMORY[0x263EF83A0], v10);

      _Block_object_dispose(v15, 8);
      objc_destroyWeak(&v16);
      _Block_object_dispose(v17, 8);
      objc_destroyWeak(&v18);
    }
  }
}

void __75__PDFDocument__notifyAKAdaptorPagePlaceholder_wasReplacedWithPage_atIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v2 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (v2) {
    BOOL v3 = WeakRetained == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && WeakRetained[48])
  {
    id v4 = WeakRetained[4];
    objc_sync_enter(v4);
    uint64_t v5 = [WeakRetained[4] indexOfObjectIdenticalTo:v2];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v2 setupAKPageAdaptorIfNecessary];
      [WeakRetained[48] pdfDocument:WeakRetained didReplacePagePlaceholder:*(void *)(a1 + 32) atIndex:v5 withPage:v2];
      [*(id *)(a1 + 40) setAKDidSetupRealPageModelController:1];
    }
    objc_sync_exit(v4);
  }
}

- (void)enableDocumentMRUMode:(BOOL)a3
{
  if (self->_document) {
    MEMORY[0x270EE6BA0]();
  }
}

- (BOOL)isLinearized
{
  document = self->_document;
  if (document) {
    LOBYTE(document) = MEMORY[0x270EE6C40](document, a2);
  }
  return (char)document;
}

- (BOOL)hasHighLatencyDataProvider
{
  CFBooleanRef document = self->_document;
  if (document)
  {
    CFBooleanRef document = (const __CFBoolean *)CGPDFDocumentGetDataProvider();
    if (document)
    {
      CFBooleanRef document = (const __CFBoolean *)CGDataProviderGetProperty();
      if (document)
      {
        CFBooleanRef v3 = document;
        CFTypeID v4 = CFGetTypeID(document);
        LOBYTE(document) = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      }
    }
  }
  return (char)document;
}

- (void)setHasHighLatencyDataProvider:(BOOL)a3
{
  if ([(PDFDocument *)self hasHighLatencyDataProvider] != a3)
  {
    CGPDFDocumentGetDataProvider();
    CGDataProviderSetProperty();
    if (!a3)
    {
      objc_initWeak(&location, self);
      uint64_t v5 = [(PDFDocument *)self textExtractionQueue];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke;
      v6[3] = &unk_2642043A0;
      objc_copyWeak(&v7, &location);
      dispatch_async(v5, v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    CFBooleanRef v3 = (void *)WeakRetained[4];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke_2;
    v4[3] = &unk_264204E20;
    uint64_t v5 = WeakRetained;
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

void __45__PDFDocument_setHasHighLatencyDataProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v10 pageRef])
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    id v7 = [v5 objectForKey:v6];
    size_t v8 = [v7 integerValue] + 1;

    CGPDFPageRef Page = CGPDFDocumentGetPage(*(CGPDFDocumentRef *)(*(void *)(a1 + 32) + 8), v8);
    if (Page) {
      [v10 setPageRef:Page];
    }
  }
}

- (BOOL)createdWithWithHighLatencyDataProvider
{
  return self->_createdWithHighLatencyDataProvider;
}

- (void)preloadDataOfPagesInRange:(_NSRange)a3 onQueue:(id)a4 completion:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  if ([(PDFDocument *)self isLinearized])
  {
    if ([(PDFDocument *)self hasHighLatencyDataProvider])
    {
      v46.NSUInteger length = [(PDFDocument *)self pageCount];
      v45.NSUInteger location = location;
      v45.NSUInteger length = length;
      v46.NSUInteger location = 0;
      NSRange v11 = NSIntersectionRange(v45, v46);
      if (v11.length)
      {
        NSUInteger v12 = v11.location;
        unint64_t v28 = objc_opt_new();
        char v13 = objc_opt_new();
        id obj = self->_preloadingPageIndexes;
        objc_sync_enter(obj);
        if (v12 < v12 + v11.length)
        {
          do
          {
            pageIndices = self->_pageIndices;
            CFTypeID v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v12, obj);
            id v16 = [(NSMutableDictionary *)pageIndices objectForKey:v15];
            [v16 integerValue];

            if (([(NSMutableIndexSet *)self->_preloadingPageIndexes containsIndex:v12] & 1) == 0
              && !CGPDFDocumentGetPageNoCreate())
            {
              [(NSMutableIndexSet *)self->_preloadingPageIndexes addIndex:v12];
              [v28 addIndex:v12];
              v44[0] = 0;
              v44[4] = 0;
              if (CGPDFDocumentCreateLinearizedRangesForPage()) {
                free(v44[0]);
              }
            }
            ++v12;
          }
          while (v12 != v11.location + v11.length);
        }
        objc_sync_exit(obj);

        uint64_t DataProvider = CGPDFDocumentGetDataProvider();
        uint64_t v18 = [v13 rangeCount];
        uint64_t v19 = malloc_type_malloc(16 * v18, 0x1000040451B5BE8uLL);
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v18];
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = (void *)0x2020000000;
        v44[3] = 0;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke;
        v40[3] = &unk_264204E48;
        long long v42 = v44;
        long long v43 = v19;
        id v21 = v20;
        id v41 = v21;
        [v13 enumerateRangesUsingBlock:v40];
        uint64_t v22 = dispatch_group_create();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_2;
        block[3] = &unk_264204E70;
        uint64_t v37 = DataProvider;
        id v23 = v21;
        id v36 = v23;
        long long v38 = v19;
        uint64_t v39 = v18;
        dispatch_group_async(v22, v9, block);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_3;
        v32[3] = &unk_264204EC0;
        v32[4] = self;
        uint64_t v24 = v22;
        uint64_t v33 = v24;
        uint64_t v25 = v9;
        uint64_t v34 = v25;
        [v28 enumerateIndexesUsingBlock:v32];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_5;
        v29[3] = &unk_264203FE8;
        id v30 = v28;
        id v31 = v10;
        id v26 = v28;
        dispatch_group_notify(v24, v25, v29);

        _Block_object_dispose(v44, 8);
      }
    }
  }
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  *(void *)(v4 + 16 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = a2;
  *(void *)(v4 + 16 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8) = a3;
  uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_2(uint64_t a1)
{
  CGDataProviderGetBytesInRanges();
  id v2 = *(void **)(a1 + 48);

  free(v2);
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKey:v5];
  id v7 = (void *)([v6 integerValue] + 1);

  if (!CGPDFDocumentGetPageNoCreate())
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    size_t v8 = *(NSObject **)(a1 + 40);
    id v9 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_4;
    block[3] = &unk_264204E98;
    objc_copyWeak(v12, &location);
    uint64_t v10 = *(void *)(a1 + 32);
    v12[1] = v7;
    v12[2] = a2;
    void block[4] = v10;
    dispatch_group_async(v8, v9, block);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (CGPDFDocumentRef *)objc_loadWeakRetained((id *)(a1 + 40));
  CGPDFPageRef Page = CGPDFDocumentGetPage(WeakRetained[1], *(void *)(a1 + 48));
  if (Page)
  {
    CGPDFPageRef v3 = Page;
    uint64_t v4 = [*(id *)(a1 + 32) pageAtIndex:*(void *)(a1 + 56)];
    [v4 setPageRef:v3];
    if (*(void *)(a1 + 48) == 1) {
      [v4 ensureDisplayList];
    }
  }
}

uint64_t __60__PDFDocument_preloadDataOfPagesInRange_onQueue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)linearizedRangesForPage:(id)a3
{
  if (a3 && self->_document)
  {
    [a3 pageNumber];
    CGPDFDocumentCreateLinearizedRangesForPage();
  }

  return 0;
}

+ (BOOL)isValidPassword:(id)a3
{
  return MEMORY[0x270EE6AA0](a3, a2);
}

- (PDFDocument)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDFDocument;
  id v2 = [(PDFDocument *)&v7 init];
  CGPDFPageRef v3 = v2;
  if (v2)
  {
    v2->_CFBooleanRef document = 0;
    [(PDFDocument *)v2 _commonInit];
    uint64_t v4 = [[PDFForm alloc] initWithDocument:v3];
    formData = v3->_formData;
    v3->_formData = v4;
  }
  return v3;
}

- (PDFDocument)initWithURL:(NSURL *)url
{
  uint64_t v5 = url;
  v11.receiver = self;
  v11.super_class = (Class)PDFDocument;
  uint64_t v6 = [(PDFDocument *)&v11 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, url);
    size_t v8 = CGPDFDocumentCreateWithURL((CFURLRef)v5);
    [(PDFDocument *)v7 setDocument:v8];
    CGPDFDocumentRelease(v8);
    if (!v7->_document)
    {
      id v9 = 0;
      goto LABEL_6;
    }
    [(PDFDocument *)v7 _commonInit];
  }
  id v9 = v7;
LABEL_6:

  return v9;
}

- (PDFDocument)initWithData:(NSData *)data
{
  uint64_t v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)PDFDocument;
  uint64_t v5 = [(PDFDocument *)&v9 init];
  if (v5)
  {
    uint64_t v6 = CGDataProviderCreateWithCFData((CFDataRef)v4);
    [(PDFDocument *)v5 _createDocumentWithDataProvider:v6];
    CGDataProviderRelease(v6);
    if (!v5->_document)
    {
      objc_super v7 = 0;
      goto LABEL_6;
    }
    [(PDFDocument *)v5 _commonInit];
  }
  objc_super v7 = v5;
LABEL_6:

  return v7;
}

- (PDFDocument)initWithProvider:(CGDataProvider *)a3
{
  CGPDFPageRef v3 = a3;
  uint64_t v4 = self;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PDFDocument;
    uint64_t v5 = [(PDFDocument *)&v7 init];
    uint64_t v4 = v5;
    if (v5)
    {
      [(PDFDocument *)v5 _createDocumentWithDataProvider:v3];
      if (!v4->_document)
      {
        CGPDFPageRef v3 = 0;
        goto LABEL_7;
      }
      [(PDFDocument *)v4 _commonInit];
    }
    uint64_t v4 = v4;
    CGPDFPageRef v3 = (CGDataProvider *)v4;
  }
LABEL_7:

  return (PDFDocument *)v3;
}

- (void)_createDocumentWithDataProvider:(CGDataProvider *)a3
{
  uint64_t v4 = CGPDFDocumentCreateWithProvider(a3);
  [(PDFDocument *)self setDocument:v4];
  CGPDFDocumentRelease(v4);
  self->_createdWithHighLatencyuint64_t DataProvider = [(PDFDocument *)self hasHighLatencyDataProvider];
}

- (void)setDocument:(CGPDFDocument *)a3
{
  CFBooleanRef document = self->_document;
  if (document == a3) {
    return;
  }
  if (document)
  {
    CGPDFDocumentRelease(document);
    self->_CFBooleanRef document = 0;
  }
  BOOL IsEncrypted = CGPDFDocumentIsEncrypted(a3);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(a3);
  CGPDFDocumentGetDataProvider();
  uint64_t SizeOfData = CGDataProviderGetSizeOfData();
  uint64_t v9 = SizeOfData + 15;
  if (SizeOfData >= 0) {
    uint64_t v9 = SizeOfData;
  }
  if (NumberOfPages && NumberOfPages > v9 >> 4)
  {
    NSLog(&cfstr_ErrorGivenCgpd.isa);
    return;
  }
  if (IsEncrypted)
  {
    if (NumberOfPages || (NSUInteger v12 = CGDataProviderCreateWithURL((CFURLRef)self->_documentURL)) == 0)
    {
      uint64_t v10 = CGPDFDocumentRetain(a3);
      self->_CFBooleanRef document = v10;
      if (!v10) {
        return;
      }
    }
    else
    {
      char v13 = v12;
      self->_CFBooleanRef document = CGPDFDocumentCreateWithProvider(v12);
      CGDataProviderRelease(v13);
      uint64_t v10 = self->_document;
      if (!v10) {
        return;
      }
    }
    if (!CGPDFDocumentIsUnlocked(v10))
    {
      self->_permission = 0;
      goto LABEL_22;
    }
    int64_t v11 = 1;
  }
  else
  {
    if (!NumberOfPages) {
      return;
    }
    self->_CFBooleanRef document = CGPDFDocumentRetain(a3);
    int64_t v11 = 2;
  }
  self->_permission = v11;
LABEL_22:
  formData = self->_formData;
  self->_formData = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t DataProvider = CGPDFDocumentGetDataProvider();
    if (DataProvider)
    {
      uint64_t v7 = DataProvider;
      uint64_t v8 = [(NSURL *)self->_documentURL copyWithZone:a3];
      uint64_t v9 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v8;

      [(id)v5 _createDocumentWithDataProvider:v7];
    }
    else
    {
      uint64_t v10 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = 0;

      *(void *)(v5 + 8) = 0;
    }
    uint64_t v11 = [(NSString *)self->_ownerPassword copyWithZone:a3];
    NSUInteger v12 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v11;

    uint64_t v13 = [(NSString *)self->_userPassword copyWithZone:a3];
    uint64_t v14 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v13;

    if (self->_permission)
    {
      CFTypeID v15 = [(PDFDocument *)self passwordUsedForUnlocking];
      [(id)v5 unlockWithPassword:v15];
    }
    *(void *)(v5 + 112) = self->_pageCount;
    *(_DWORD *)(v5 + 120) = self->_majorVersion;
    *(_DWORD *)(v5 + 124) = self->_minorVersion;
    *(unsigned char *)(v5 + 128) = self->_isEncrypted;
    *(unsigned char *)(v5 + 129) = self->_isUnlocked;
    *(_DWORD *)(v5 + 132) = self->_accessPermissions;
    *(unsigned char *)(v5 + 136) = self->_allowsPrinting;
    *(unsigned char *)(v5 + 137) = self->_allowsCopying;
    *(unsigned char *)(v5 + 138) = self->_allowsDocumentChanges;
    *(unsigned char *)(v5 + 139) = self->_allowsDocumentAssembly;
    *(unsigned char *)(v5 + 140) = self->_allowsContentAccessibility;
    *(unsigned char *)(v5 + 141) = self->_allowsCommenting;
    *(unsigned char *)(v5 + 142) = self->_allowsFormFieldEntry;
    *(void *)(v5 + 144) = self->_permission;
    uint64_t v16 = [(NSDictionary *)self->_attributes copyWithZone:a3];
    CFMutableArrayRef v17 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v16;

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_storeWeak((id *)(v5 + 88), WeakRetained);

    *(unsigned char *)(v5 + 96) = self->_respondsToDidUnlock;
    *(unsigned char *)(v5 + 97) = self->_respondsToDidFindMatch;
    *(unsigned char *)(v5 + 98) = self->_respondsToDidBeginDocumentFind;
    *(unsigned char *)(v5 + 99) = self->_respondsToDidEndDocumentFind;
    *(unsigned char *)(v5 + 100) = self->_respondsToDidBeginPageFind;
    *(unsigned char *)(v5 + 101) = self->_respondsToDidEndPageFind;
    *(unsigned char *)(v5 + 102) = self->_respondsToDidMatchString;
    *(unsigned char *)(v5 + 103) = self->_respondsToPrintJobTitle;
    *(unsigned char *)(v5 + 104) = self->_respondsToClassForPage;
    *(unsigned char *)(v5 + 105) = self->_respondsToClassForAnnotationType;
    *(unsigned char *)(v5 + 106) = self->_respondsToClassForAnnotationClass;
    *(unsigned char *)(v5 + 107) = self->_respondsToShouldReadAKInkAnnotations;
    uint64_t v19 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = 0;

    uint64_t v20 = *(void **)(v5 + 192);
    *(void *)(v5 + 192) = 0;

    self->_finding = 0;
    self->_findModel = 0;
    findStrings = self->_findStrings;
    self->_findStrings = 0;

    findInstance = self->_findInstance;
    self->_findInstance = 0;

    self->_findOptions = 0;
    self->_findPageIndeCGFloat x = 0;
    *(_OWORD *)&self->_findCharIndeCGFloat x = xmmword_2144230F0;
    self->_lastFindCharIndeCGFloat x = -1;
    id v23 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    findResults = self->_findResults;
    self->_findResults = v23;

    uint64_t v25 = [(NSArray *)self->_documentCatalogMetadata copyWithZone:a3];
    id v26 = *(void **)(v5 + 296);
    *(void *)(v5 + 296) = v25;

    uint64_t v27 = [(NSString *)self->_xmpNameSpace copyWithZone:a3];
    unint64_t v28 = *(void **)(v5 + 304);
    *(void *)(v5 + 304) = v27;

    uint64_t v29 = [(NSString *)self->_xmpPrefix copyWithZone:a3];
    id v30 = *(void **)(v5 + 312);
    *(void *)(v5 + 312) = v29;

    uint64_t v31 = [(NSString *)self->_xmpRootPath copyWithZone:a3];
    id v32 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_pageCount];
    uint64_t v34 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v33;

    id v35 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v36 = (void *)[(NSMutableDictionary *)self->_pageIndices copyWithZone:a3];
    uint64_t v37 = [v35 initWithDictionary:v36];
    long long v38 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v37;

    *(unsigned char *)(v5 + 336) = self->_documentChanged;
    *(unsigned char *)(v5 + 337) = self->_documentHasBurnInAnnotations;
    *(unsigned char *)(v5 + 352) = self->_documentHasPageWithApplicationData;
    *(void *)(v5 + 344) = self->_documentRedactionCount;
    *($28735FA612DDC04BCD4AE5F2EEDE052B *)(v5 + 353) = self->_pagesChanged;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v39 = self->_pages;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v55;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v55 != v42) {
            objc_enumerationMutation(v39);
          }
          long long v44 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * v43), "copyWithZone:", a3, (void)v54);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v44 setDocument:v5];
          }
          [*(id *)(v5 + 32) addObject:v44];

          ++v43;
        }
        while (v41 != v43);
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v41);
    }

    uint64_t v45 = [MEMORY[0x263EFF9D8] orderedSetWithArray:*(void *)(v5 + 32)];
    NSRange v46 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v45;

    formData = self->_formData;
    if (formData)
    {
      v48 = [(PDFForm *)formData fieldNames];
      uint64_t v49 = [v48 count];

      if (v49)
      {
        uint64_t v50 = *(void **)(v5 + 280);
        *(void *)(v5 + 280) = 0;

        id v51 = [(PDFForm *)self->_formData copyWithZone:a3];
        uint64_t v52 = *(void **)(v5 + 280);
        *(void *)(v5 + 280) = v51;

        *(unsigned char *)(v5 + 288) = 1;
        [*(id *)(v5 + 280) setDocument:v5];
      }
    }
  }
  return (id)v5;
}

- (void)dealloc
{
  [(PDFAKDocumentAdaptor *)self->_akDocumentAdaptor teardown];
  akDocumentAdaptor = self->_akDocumentAdaptor;
  self->_akDocumentAdaptor = 0;

  CGPDFDocumentRelease(self->_document);
  self->_CFBooleanRef document = 0;
  v4.receiver = self;
  v4.super_class = (Class)PDFDocument;
  [(PDFDocument *)&v4 dealloc];
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (CGPDFDocumentRef)documentRef
{
  return self->_document;
}

- (NSDictionary)documentAttributes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!self->_isUnlocked)
  {
    objc_super v4 = 0;
    goto LABEL_23;
  }
  attributes = self->_attributes;
  if (attributes)
  {
    objc_super v4 = attributes;
    goto LABEL_23;
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v21[0] = xmmword_264204EE0;
  v21[1] = *(_OWORD *)&off_264204EF0;
  v21[2] = xmmword_264204F00;
  v21[3] = *(_OWORD *)off_264204F10;
  Info = CGPDFDocumentGetInfo(self->_document);
  for (uint64_t i = 0; i != 64; i += 8)
  {
    id v7 = *(id *)((char *)v21 + i);
    int v8 = [v7 isEqualToString:@"Keywords"];
    if ([v7 isEqualToString:@"CreationDate"]) {
      int v9 = 1;
    }
    else {
      int v9 = [v7 isEqualToString:@"ModDate"];
    }
    CGPDFStringRef value = 0;
    id v10 = v7;
    if (CGPDFDictionaryGetString(Info, (const char *)[v10 cStringUsingEncoding:1], &value))
    {
      if (v9)
      {
        CFDateRef v11 = CGPDFStringCopyDate(value);
        if (!v11) {
          goto LABEL_19;
        }
        NSUInteger v12 = v11;
        goto LABEL_17;
      }
      CFStringRef v13 = CGPDFStringCopyTextString(value);
      if (v13)
      {
        NSUInteger v12 = (void *)v13;
        if (CFStringGetLength(v13) >= 1)
        {
          if (v8)
          {
            uint64_t v14 = [v12 componentsSeparatedByString:@", "];

            [v19 setObject:v14 forKey:v10];
            NSUInteger v12 = (void *)v14;
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:
          objc_msgSend(v19, "setObject:forKey:", v12, v10, v19);
          goto LABEL_18;
        }
      }
    }
LABEL_19:
  }
  CFTypeID v15 = [NSDictionary dictionaryWithDictionary:v19];
  uint64_t v16 = self->_attributes;
  self->_attributes = v15;

  objc_super v4 = self->_attributes;
  for (uint64_t j = 56; j != -8; j -= 8)

LABEL_23:

  return v4;
}

- (void)setDocumentAttributes:(NSDictionary *)documentAttributes
{
  int v8 = documentAttributes;
  if ([(PDFDocument *)self allowsDocumentChanges])
  {
    objc_super v4 = (NSDictionary *)[(NSDictionary *)v8 copy];
    attributes = self->_attributes;
    self->_attributes = v4;
  }
  else
  {
    PDFDocumentPermissions v6 = [(PDFDocument *)self permissionsStatus];
    id v7 = @"user";
    if (v6 == kPDFDocumentPermissionsOwner) {
      id v7 = @"owner";
    }
    NSLog(&cfstr_PdfdocumentSSe.isa, v7);
  }
}

- (NSInteger)majorVersion
{
  return self->_majorVersion;
}

- (NSInteger)minorVersion
{
  return self->_minorVersion;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (BOOL)isLocked
{
  return !self->_isUnlocked;
}

- (BOOL)unlockWithPassword:(NSString *)password
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  objc_super v4 = password;
  if (self->_permission != 2)
  {
    PDFDocumentPermissions v6 = [(PDFDocument *)self _SASLSanitize:v4];
    id v7 = v6;
    if (self->_permission != 2)
    {
      id v8 = v6;
      [v8 UTF8String];
      if (CGPDFDocumentAuthenticateOwnerPassword())
      {
        [(PDFDocument *)self willChangeValueForKey:@"permissionsStatus"];
        self->_permission = 2;
        int v9 = (NSString *)[(NSString *)v4 copy];
        ownerPassword = self->_ownerPassword;
        self->_ownerPassword = v9;

        [(PDFDocument *)self didChangeValueForKey:@"permissionsStatus"];
        [v8 UTF8String];
        if (CGPDFDocumentAuthenticateUserPassword())
        {
          CFDateRef v11 = (__CFString *)v4;
        }
        else
        {
          [&stru_26C516768 UTF8String];
          if (!CGPDFDocumentAuthenticateUserPassword())
          {
LABEL_13:
            if (!CGPDFDocumentUnlockWithPassword(self->_document, (const char *)[v7 UTF8String]))
            {
              BOOL v5 = 0;
              goto LABEL_47;
            }
            CGPDFAccessPermissions AccessPermissions = CGPDFDocumentGetAccessPermissions(self->_document);
            self->_accessPermissions = AccessPermissions;
            if (self->_permission == 2) {
              unsigned int v17 = 255;
            }
            else {
              unsigned int v17 = AccessPermissions;
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v18 = [&unk_26C52E670 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v18)
            {
              uint64_t v20 = v18;
              uint64_t v21 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v51 != v21) {
                    objc_enumerationMutation(&unk_26C52E670);
                  }
                  [(PDFDocument *)self willChangeValueForKey:*(void *)(*((void *)&v50 + 1) + 8 * i)];
                }
                uint64_t v20 = [&unk_26C52E670 countByEnumeratingWithState:&v50 objects:v55 count:16];
              }
              while (v20);
            }
            self->_allowsPrinting = (v17 & 3) != 0;
            v19.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v17) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFBFFFDFFFEFFFCLL) & 0xFF01FF01FF01FF01;
            *(_DWORD *)&self->_allowsCopying = vmovn_s16(v19).u32[0];
            self->_allowsCommenting = (v17 & 0x40) != 0;
            self->_allowsFormFieldEntrCGFloat y = (v17 & 0x80) != 0;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v23 = [&unk_26C52E670 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v47;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v47 != v25) {
                    objc_enumerationMutation(&unk_26C52E670);
                  }
                  [(PDFDocument *)self didChangeValueForKey:*(void *)(*((void *)&v46 + 1) + 8 * j)];
                }
                uint64_t v24 = [&unk_26C52E670 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }
              while (v24);
            }
            if (!self->_isUnlocked)
            {
              self->_isUnlocked = CGPDFDocumentIsUnlocked(self->_document);
              self->_pageCFIndex Count = CGPDFDocumentGetNumberOfPages(self->_document);
              akDocumentAdaptor = self->_akDocumentAdaptor;
              if (akDocumentAdaptor) {
                [(PDFAKDocumentAdaptor *)akDocumentAdaptor pdfDocumentDidRemoveAllPagesOrPlaceholders:self];
              }
              unint64_t v28 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_pageCount];
              pages = self->_pages;
              self->_pages = v28;

              if (self->_pageCount)
              {
                unint64_t v30 = 0;
                do
                {
                  unint64_t v31 = v30 + 1;
                  id v32 = [NSNumber numberWithInt:v30 + 1];
                  [(NSMutableArray *)self->_pages addObject:v32];
                  pageIndices = self->_pageIndices;
                  uint64_t v34 = [NSNumber numberWithInt:v30];
                  id v35 = [NSNumber numberWithInt:v30];
                  [(NSMutableDictionary *)pageIndices setObject:v34 forKey:v35];

                  unint64_t v30 = v31;
                }
                while (self->_pageCount > v31);
              }
              id v36 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
              pagesOrderedSet = self->_pagesOrderedSet;
              self->_pagesOrderedSet = v36;

              if (self->_pageCount)
              {
                size_t v38 = 0;
                do
                {
                  uint64_t v39 = [(NSMutableArray *)self->_pages objectAtIndex:v38];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    CFBooleanRef document = self->_document;
                    ++v38;
                    id v41 = v39;
                    objc_msgSend(v41, "setPageRef:", CGPDFDocumentGetPage(document, v38));
                  }
                  else
                  {
                    ++v38;
                  }
                }
                while (v38 < self->_pageCount);
              }
            }
            uint64_t v42 = [MEMORY[0x263F08A00] defaultCenter];
            [v42 postNotificationName:@"PDFDocumentDidUnlock" object:self];

            if (self->_respondsToDidUnlock)
            {
              id WeakRetained = objc_loadWeakRetained(&self->_delegate);
              long long v44 = [MEMORY[0x263F089F8] notificationWithName:@"PDFDocumentDidUnlock" object:self];
              [WeakRetained documentDidUnlock:v44];
            }
LABEL_45:
            BOOL v5 = 1;
LABEL_47:

            goto LABEL_48;
          }
          CFDateRef v11 = &stru_26C516768;
        }
        uint64_t v14 = (NSString *)[(__CFString *)v11 copy];
        userPassword = self->_userPassword;
        self->_userPassword = v14;

        goto LABEL_13;
      }
      if (self->_permission == 1) {
        goto LABEL_45;
      }
    }
    [v7 UTF8String];
    if (CGPDFDocumentAuthenticateUserPassword())
    {
      [(PDFDocument *)self willChangeValueForKey:@"permissionsStatus"];
      self->_permission = 1;
      NSUInteger v12 = (NSString *)[(NSString *)v4 copy];
      CFStringRef v13 = self->_userPassword;
      self->_userPassword = v12;

      [(PDFDocument *)self didChangeValueForKey:@"permissionsStatus"];
    }
    goto LABEL_13;
  }
  BOOL v5 = 1;
LABEL_48:

  return v5;
}

- (id)passwordUsedForUnlocking
{
  int64_t permission = self->_permission;
  if (permission == 2)
  {
    uint64_t v3 = 152;
    goto LABEL_5;
  }
  if (permission == 1)
  {
    uint64_t v3 = 160;
LABEL_5:
    id v4 = *(id *)((char *)&self->super.isa + v3);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (void)requirePasswordsIfNeededUsingPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  int64_t permission = self->_permission;
  if (permission == 1)
  {
    id v10 = @"Owner password";
    CFDateRef v11 = @"Enter the owner password to unlock saving.";
    NSUInteger v12 = @"Without the owner password, you do not have permission to save this document.";
    goto LABEL_9;
  }
  if (permission == 2 && !self->_userPassword && self->_accessPermissions < 0xFF)
  {
    id v10 = @"User password";
    CFDateRef v11 = @"Enter the user password to preserve those permissions.";
    NSUInteger v12 = @"This document has custom access permissions for the user password";
LABEL_9:
    CFStringRef v13 = PDFKitLocalizedString(v12);
    uint64_t v14 = PDFKitLocalizedString(v11);
    CFTypeID v15 = PDFKitLocalizedString(v10);
    uint64_t v16 = [MEMORY[0x263F82418] alertControllerWithTitle:v13 message:v14 preferredStyle:1];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke;
    v33[3] = &unk_264204F28;
    id v17 = v15;
    id v34 = v17;
    [v16 addTextFieldWithConfigurationHandler:v33];
    objc_initWeak(&location, v16);
    uint64_t v18 = PDFKitLocalizedString(@"Unlock Document");
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_2;
    v30[3] = &unk_264203FE8;
    id v19 = v8;
    v30[4] = self;
    id v31 = v19;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_3;
    v28[3] = &unk_264204F50;
    objc_copyWeak(&v29, &location);
    v28[4] = self;
    [v16 _addActionWithTitle:v18 style:0 handler:v30 shouldDismissHandler:v28];

    uint64_t v20 = (void *)MEMORY[0x263F82400];
    uint64_t v21 = PDFKitLocalizedString(@"Cancel");
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_4;
    id v26 = &unk_264204F78;
    id v27 = v19;
    uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:&v23];

    objc_msgSend(v16, "addAction:", v22, v23, v24, v25, v26);
    [v6 presentViewController:v16 animated:1 completion:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_10;
  }
  if (v7) {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 2);
  }
LABEL_10:
}

void __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setPlaceholder:v2];
  [v3 setSecureTextEntry:1];
}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 32) _canSaveWithEncryption];
    if (result)
    {
      uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
      return v2();
    }
  }
  return result;
}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_3(uint64_t a1)
{
  v24[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained textFields];
    BOOL v5 = [v4 firstObject];
    id v6 = [v5 text];

    id v7 = *(void **)(a1 + 32);
    if (v7[18] == 2)
    {
      id v8 = [v7 _SASLSanitize:v6];
      [v8 UTF8String];
      if (CGPDFDocumentAuthenticateUserPassword())
      {
        uint64_t v9 = [v6 copy];
        uint64_t v10 = *(void *)(a1 + 32);
        CFDateRef v11 = *(void **)(v10 + 160);
        *(void *)(v10 + 160) = v9;
      }
    }
    else
    {
      [v7 unlockWithPassword:v6];
    }
    uint64_t v12 = [*(id *)(a1 + 32) _canSaveWithEncryption];
    if ((v12 & 1) == 0)
    {
      CFStringRef v13 = [v3 textFields];
      uint64_t v14 = [v13 firstObject];
      [v14 setText:0];

      id v15 = objc_alloc(MEMORY[0x263F086A0]);
      uint64_t v16 = PDFKitLocalizedString(@"Invalid Password");
      v23[0] = *MEMORY[0x263F82278];
      id v17 = [MEMORY[0x263F825C8] systemRedColor];
      v24[0] = v17;
      v23[1] = *MEMORY[0x263F82270];
      uint64_t v18 = (void *)MEMORY[0x263F82760];
      [MEMORY[0x263F82760] smallSystemFontSize];
      id v19 = objc_msgSend(v18, "systemFontOfSize:");
      v24[1] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      uint64_t v21 = (void *)[v15 initWithString:v16 attributes:v20];
      [v3 _setAttributedMessage:v21];
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __80__PDFDocument_requirePasswordsIfNeededUsingPresentingViewController_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)_canSaveWithEncryption
{
  return ![(PDFDocument *)self isEncrypted]
      || self->_permission == 2 && (self->_accessPermissions > 0xFE || self->_userPassword);
}

- (BOOL)allowsPrinting
{
  return self->_allowsPrinting;
}

- (BOOL)allowsCopying
{
  return self->_allowsCopying;
}

- (BOOL)allowsDocumentChanges
{
  return self->_allowsDocumentChanges;
}

- (BOOL)allowsDocumentAssembly
{
  return self->_allowsDocumentAssembly;
}

- (BOOL)allowsContentAccessibility
{
  return self->_allowsContentAccessibility;
}

- (BOOL)allowsCommenting
{
  return self->_allowsCommenting;
}

- (BOOL)allowsFormFieldEntry
{
  return self->_allowsFormFieldEntry;
}

- (PDFDocumentPermissions)permissionsStatus
{
  return self->_permission;
}

- (PDFAccessPermissions)accessPermissions
{
  return (unint64_t)LOBYTE(self->_accessPermissions);
}

- (NSString)string
{
  if (self->_isUnlocked)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
    if (self->_pageCount)
    {
      unint64_t v4 = 0;
      do
      {
        BOOL v5 = [(PDFDocument *)self pageAtIndex:v4];
        id v6 = [v5 string];

        if (v6)
        {
          [v3 appendString:v6];
          if (self->_pageCount - 1 > v4) {
            [v3 appendString:@"\n"];
          }
        }

        ++v4;
      }
      while (self->_pageCount > v4);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setDelegate:(id)delegate
{
  id v5 = delegate;
  objc_storeWeak(&self->_delegate, v5);
  if (v5)
  {
    self->_respondsToDidUnlocuint64_t k = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidFindMatch = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidBeginDocumentFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidEndDocumentFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidBeginPageFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidEndPageFind = objc_opt_respondsToSelector() & 1;
    self->_respondsToDidMatchString = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForCGPDFPageRef Page = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForAnnotationType = objc_opt_respondsToSelector() & 1;
    self->_respondsToClassForAnnotationClass = 0;
    self->_respondsToShouldReadAKInkAnnotations = objc_opt_respondsToSelector() & 1;
    self->_respondsToHandleTabFrom = objc_opt_respondsToSelector() & 1;
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
    *(_DWORD *)&self->_respondsToDidEndDocumentFind = 0;
    *(_DWORD *)&self->_respondsToDidUnlocuint64_t k = 0;
    *(_DWORD *)&self->_respondsToClassForCGPDFPageRef Page = 0;
    self->_respondsToHandleTabFrom = 0;
  }
  self->_respondsToDidReceiveAnalysis = v4 & 1;

  MEMORY[0x270F9A790]();
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (NSData)dataRepresentation
{
  id v3 = [NSDictionary dictionary];
  char v4 = [(PDFDocument *)self dataRepresentationWithOptions:v3];

  return (NSData *)v4;
}

- (NSData)dataRepresentationWithOptions:(NSDictionary *)options
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v5 = options;
  CGMutableImageMetadataRef Mutable = CFDataCreateMutable(v4, 0);
  id v7 = CGDataConsumerCreateWithCFData(Mutable);
  BOOL v8 = [(PDFDocument *)self writeToConsumer:v7 withOptions:v5];

  if (v7) {
    CGDataConsumerRelease(v7);
  }
  if (!v8 && Mutable)
  {
    CFRelease(Mutable);
    CGMutableImageMetadataRef Mutable = 0;
  }

  return (NSData *)Mutable;
}

- (BOOL)writeToFile:(NSString *)path
{
  return [(PDFDocument *)self writeToFile:path withOptions:0];
}

- (BOOL)writeToFile:(NSString *)path withOptions:(NSDictionary *)options
{
  id v6 = NSURL;
  id v7 = options;
  BOOL v8 = [v6 fileURLWithPath:path];
  LOBYTE(self) = [(PDFDocument *)self writeToURL:v8 withOptions:v7];

  return (char)self;
}

- (BOOL)writeToURL:(NSURL *)url
{
  return [(PDFDocument *)self writeToURL:url withOptions:0];
}

- (BOOL)writeToURL:(NSURL *)url withOptions:(NSDictionary *)options
{
  id v6 = url;
  id v7 = (void *)MEMORY[0x263F08850];
  BOOL v8 = options;
  uint64_t v9 = [v7 defaultManager];
  uint64_t v10 = [(NSURL *)v6 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    uint64_t v12 = NSURL;
    CFStringRef v13 = NSTemporaryDirectory();
    uint64_t v14 = [v12 fileURLWithPath:v13];

    id v15 = NSString;
    uint64_t v16 = [(NSURL *)v6 lastPathComponent];
    id v17 = [v15 stringWithFormat:@".%@", v16];
    CFURLRef v18 = [v14 URLByAppendingPathComponent:v17];
  }
  else
  {
    CFURLRef v18 = v6;
  }
  id v19 = CGDataConsumerCreateWithURL(v18);
  int v20 = [(PDFDocument *)self writeToConsumer:v19 withOptions:v8];

  if ((v11 & v20) == 1)
  {
    id v32 = 0;
    uint64_t v21 = *MEMORY[0x263EFF898];
    [(NSURL *)v6 getResourceValue:&v32 forKey:*MEMORY[0x263EFF898] error:0];
    id v22 = v32;
    id v31 = 0;
    [(__CFURL *)v18 getResourceValue:&v31 forKey:v21 error:0];
    id v23 = v31;
    uint64_t v24 = v23;
    if (v22 && v23 && ([v22 isEqualToString:v23] & 1) == 0)
    {
      id v30 = 0;
      [v9 removeItemAtURL:v6 error:&v30];
      id v26 = v30;
      id v29 = v26;
      LOBYTE(v20) = [v9 copyItemAtURL:v18 toURL:v6 error:&v29];
      id v25 = v29;
    }
    else
    {
      id v28 = 0;
      LOBYTE(v20) = [v9 replaceItemAtURL:v6 withItemAtURL:v18 backupItemName:0 options:0 resultingItemURL:0 error:&v28];
      id v25 = v28;
    }
  }
  if (v19) {
    CGDataConsumerRelease(v19);
  }

  return v20;
}

- (PDFOutline)outlineRoot
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  outline = v2->_outline;
  if (outline)
  {
LABEL_2:
    CFAllocatorRef v4 = outline;
    goto LABEL_11;
  }
  CFBooleanRef document = v2->_document;
  if (document && v2->_isUnlocked)
  {
    Catalog = CGPDFDocumentGetCatalog(document);
    if (Catalog)
    {
      CGPDFDictionaryRef value = 0;
      if (CGPDFDictionaryGetDictionary(Catalog, "Outlines", &value))
      {
        id v7 = [PDFOutline alloc];
        uint64_t v8 = [(PDFOutline *)v7 initWithDictionary:value forDocument:v2 parent:0];
        uint64_t v9 = v2->_outline;
        v2->_outline = (PDFOutline *)v8;

        if (![(PDFOutline *)v2->_outline numberOfChildren])
        {
          uint64_t v10 = v2->_outline;
          v2->_outline = 0;
        }
      }
    }
    outline = v2->_outline;
    goto LABEL_2;
  }
  CFAllocatorRef v4 = 0;
LABEL_11:
  objc_sync_exit(v2);

  return v4;
}

- (void)setOutlineRoot:(PDFOutline *)outlineRoot
{
  CFAllocatorRef v4 = outlineRoot;
  id obj = self;
  objc_sync_enter(obj);
  outline = obj->_outline;
  obj->_outline = v4;

  objc_sync_exit(obj);
}

- (PDFOutline)outlineItemForSelection:(PDFSelection *)selection
{
  if (selection)
  {
    CFAllocatorRef v4 = [(PDFSelection *)selection asDestination];
    if (v4)
    {
      id v5 = [(PDFDocument *)self outlineRoot];
      id v6 = v5;
      if (v5)
      {
        id v7 = v5;
        id v8 = 0;
        do
        {
          uint64_t v9 = v8;
          id v8 = v7;

          id v7 = [(PDFDocument *)self _getNearestOutline:v8 forDestination:v4];
        }
        while (v7 != v8);
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (PDFOutline *)v8;
}

- (NSUInteger)pageCount
{
  return self->_pageCount;
}

- (PDFPage)pageAtIndex:(NSUInteger)index
{
  id v5 = self->_pages;
  objc_sync_enter(v5);
  if (self->_pageCount <= index)
  {
    id v18 = 0;
    goto LABEL_26;
  }
  id v6 = [(NSMutableArray *)self->_pages objectAtIndex:index];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = v6;
    if (([v18 akDidSetupRealPageModelController] & 1) == 0) {
      [(PDFDocument *)self _notifyAKAdaptorPagePlaceholder:0 wasReplacedWithPage:v18 atIndex:index];
    }
    goto LABEL_25;
  }
  pageIndices = self->_pageIndices;
  id v8 = [NSNumber numberWithUnsignedInteger:index];
  uint64_t v9 = [(NSMutableDictionary *)pageIndices objectForKey:v8];

  BOOL v10 = [(PDFDocument *)self isLinearized];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  if (!v10 || ![(PDFDocument *)self hasHighLatencyDataProvider])
  {
    uint64_t Page = (uint64_t)CGPDFDocumentGetPage(self->_document, (int)([v9 intValue] + 1));
    goto LABEL_12;
  }
  [v9 intValue];
  uint64_t Page = CGPDFDocumentGetPageNoCreate();
  if (Page)
  {
LABEL_12:
    RotationAngle = 0;
    goto LABEL_13;
  }
  uint64_t v16 = CGPDFDocumentGetPage(self->_document, 1uLL);
  RotationAngle = v16;
  if (v16)
  {
    CGRect BoxRect = CGPDFPageGetBoxRect(v16, kCGPDFMediaBox);
    double x = BoxRect.origin.x;
    double y = BoxRect.origin.y;
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    uint64_t Page = 0;
    RotationAngle = (CGPDFPage *)CGPDFPageGetRotationAngle(RotationAngle);
  }
  else
  {
    uint64_t Page = 0;
  }
LABEL_13:
  if (!self->_respondsToClassForPage)
  {
    int v20 = [(PDFDocument *)self pageClass];
    if (Page) {
      goto LABEL_15;
    }
LABEL_17:
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    if (CGRectIsNull(v27)) {
      id v21 = objc_alloc_init(v20);
    }
    else {
      id v21 = (id)objc_msgSend([v20 alloc], "initWithPageNumber:pageRect:rotation:", (int)(objc_msgSend(v9, "intValue") + 1), RotationAngle, x, y, width, height);
    }
    goto LABEL_20;
  }
  id v19 = [(PDFDocument *)self delegate];
  int v20 = (objc_class *)[v19 classForPage];

  if (!Page) {
    goto LABEL_17;
  }
LABEL_15:
  id v21 = (id)[[v20 alloc] initWithPageRef:Page];
LABEL_20:
  id v18 = v21;
  [v21 setDocument:self];
  [(NSMutableArray *)self->_pages replaceObjectAtIndex:index withObject:v18];
  if (self->_pagesOrderedSet)
  {
    id v22 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
    pagesOrderedSet = self->_pagesOrderedSet;
    self->_pagesOrderedSet = v22;
  }
  [(PDFDocument *)self _notifyAKAdaptorPagePlaceholder:v6 wasReplacedWithPage:v18 atIndex:index];
  if (-[NSMutableIndexSet containsIndex:](self->_bookmarkedPages, "containsIndex:", (int)[v9 intValue]))objc_msgSend(v18, "setBookmarked:updateBookmarks:", 1, 0); {

  }
LABEL_25:
LABEL_26:
  objc_sync_exit(v5);

  return (PDFPage *)v18;
}

- (id)_rawPageAtIndex:(unint64_t)a3
{
  if (self->_subclassOverridesPageAtIndex)
  {
    if ([(PDFDocument *)self pageCount] > a3)
    {
      id v5 = [(PDFDocument *)self pageAtIndex:a3];
      goto LABEL_7;
    }
  }
  else if (self->_pageCount > a3)
  {
    id v6 = self->_pages;
    objc_sync_enter(v6);
    id v5 = [(NSMutableArray *)self->_pages objectAtIndex:a3];
    objc_sync_exit(v6);

    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (NSUInteger)indexForPage:(PDFPage *)page
{
  CFAllocatorRef v4 = page;
  id v5 = self->_pages;
  objc_sync_enter(v5);
  NSUInteger v6 = [(NSOrderedSet *)self->_pagesOrderedSet indexOfObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)insertPage:(PDFPage *)page atIndex:(NSUInteger)index
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  NSUInteger v6 = page;
  if (v6)
  {
    if ([(PDFDocument *)self allowsDocumentAssembly])
    {
      if ([(PDFDocument *)self isFinding]) {
        [(PDFDocument *)self cancelFindString];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
      id obj = self->_pages;
      objc_sync_enter(obj);
      id v7 = objc_opt_class();
      id v30 = objc_msgSend(v7, "_getDocumentID:", CGPDFPageGetDocument(-[PDFPage pageRef](v6, "pageRef")));
      uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_getDocumentID:", -[PDFDocument documentRef](self, "documentRef"));
      uint64_t v9 = (void *)v8;
      if (v30 && v8 && ([v30 isEqual:v8] & 1) == 0)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        BOOL v10 = [(PDFPage *)v6 annotations];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v33 != v12) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v32 + 1) + 8 * i) clearFormData];
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v11);
        }
      }
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained willInsertPage:v6 atIndex:index];
      }
      [(NSMutableArray *)self->_pages insertObject:v6 atIndex:index];
      uint64_t v14 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
      pagesOrderedSet = self->_pagesOrderedSet;
      self->_pagesOrderedSet = v14;

      [(PDFPage *)v6 setDocument:self];
      uint64_t v16 = v9;
      pageCFIndex Count = self->_pageCount;
      if (pageCount && (int)pageCount > (int)index)
      {
        do
        {
          int v18 = pageCount - 1;
          pageIndices = self->_pageIndices;
          int v20 = [NSNumber numberWithInt:(pageCount - 1)];
          id v21 = [(NSMutableDictionary *)pageIndices objectForKey:v20];

          if (v21)
          {
            id v22 = self->_pageIndices;
            id v23 = [NSNumber numberWithInt:(pageCount - 1)];
            [(NSMutableDictionary *)v22 removeObjectForKey:v23];

            uint64_t v24 = self->_pageIndices;
            id v25 = [NSNumber numberWithInt:pageCount];
            [(NSMutableDictionary *)v24 setObject:v21 forKey:v25];
          }
          pageCFIndex Count = (pageCount - 1);
        }
        while (v18 > (int)index);
        pageCFIndex Count = self->_pageCount;
        uint64_t v16 = v9;
      }
      self->_pageCFIndex Count = pageCount + 1;
      if (self->_akDocumentAdaptor)
      {
        [(PDFPage *)v6 setupAKPageAdaptorIfNecessary];
        [(PDFAKDocumentAdaptor *)self->_akDocumentAdaptor pdfDocument:self didInsertPage:v6 atIndex:index];
      }
      if (self->_document)
      {
        if ([(PDFPage *)v6 pageRef]) {
          CGPDFDocumentInsertPageAtIndex();
        }
        else {
          self->_pagesChanged.blankPagesAdded = 1;
        }
      }

      objc_sync_exit(obj);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained didInsertPage:v6 atIndex:index];
      }
      id v28 = [MEMORY[0x263F08A00] defaultCenter];
      [v28 postNotificationName:@"PDFDocumentDidMutate" object:self];

      self->_documentChanged = 1;
      self->_pagesChanged.pagesAdded = 1;
    }
    else
    {
      PDFDocumentPermissions v26 = [(PDFDocument *)self permissionsStatus];
      CGRect v27 = @"user";
      if (v26 == kPDFDocumentPermissionsOwner) {
        CGRect v27 = @"owner";
      }
      NSLog(&cfstr_PdfdocumentSIn.isa, v27);
    }
  }
}

- (void)removePageAtIndex:(NSUInteger)index
{
  if ([(PDFDocument *)self allowsDocumentAssembly])
  {
    if (self->_pageCount > index)
    {
      if ([(PDFDocument *)self isFinding]) {
        [(PDFDocument *)self cancelFindString];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
      NSUInteger v6 = self->_pages;
      objc_sync_enter(v6);
      id v26 = [(PDFDocument *)self pageAtIndex:index];
      if (v26)
      {
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained willRemovePage:v26 atIndex:index];
        }
        [(NSMutableArray *)self->_pages removeObjectAtIndex:index];
        id v7 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
        pagesOrderedSet = self->_pagesOrderedSet;
        self->_pagesOrderedSet = v7;

        [v26 setDocument:0];
        pageIndices = self->_pageIndices;
        BOOL v10 = [NSNumber numberWithUnsignedInteger:index];
        [(NSMutableDictionary *)pageIndices removeObjectForKey:v10];

        pageCFIndex Count = self->_pageCount;
        if (index + 1 < pageCount)
        {
          NSUInteger v12 = index;
          do
          {
            CFStringRef v13 = self->_pageIndices;
            uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12 + 1];
            id v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

            if (v15)
            {
              uint64_t v16 = self->_pageIndices;
              id v17 = [NSNumber numberWithUnsignedInteger:v12 + 1];
              [(NSMutableDictionary *)v16 removeObjectForKey:v17];

              int v18 = self->_pageIndices;
              id v19 = [NSNumber numberWithUnsignedInteger:v12];
              [(NSMutableDictionary *)v18 setObject:v15 forKey:v19];
            }
            pageCFIndex Count = self->_pageCount;
            unint64_t v20 = v12 + 2;
            ++v12;
          }
          while (v20 < pageCount);
        }
        self->_pageCFIndex Count = pageCount - 1;
        akDocumentAdaptor = self->_akDocumentAdaptor;
        if (akDocumentAdaptor) {
          [(PDFAKDocumentAdaptor *)akDocumentAdaptor pdfDocument:self didRemovePage:v26 atIndex:index];
        }
        if (self->_document)
        {
          if ([v26 pageRef])
          {
            CFBooleanRef document = self->_document;
            if (document == CGPDFPageGetDocument((CGPDFPageRef)[v26 pageRef])) {
              CGPDFDocumentRemovePageAtIndex();
            }
          }
        }
        objc_sync_exit(v6);

        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained didRemovePage:v26 atIndex:index];
        }
        id v23 = [MEMORY[0x263F08A00] defaultCenter];
        [v23 postNotificationName:@"PDFDocumentDidMutate" object:self];

        self->_documentChanged = 1;
        self->_pagesChanged.pagesRemoved = 1;
      }
      else
      {
        objc_sync_exit(v6);
      }
    }
  }
  else
  {
    PDFDocumentPermissions v24 = [(PDFDocument *)self permissionsStatus];
    id v25 = @"user";
    if (v24 == kPDFDocumentPermissionsOwner) {
      id v25 = @"owner";
    }
    NSLog(&cfstr_PdfdocumentSRe.isa, v25);
  }
}

- (void)exchangePageAtIndex:(NSUInteger)indexA withPageAtIndex:(NSUInteger)indexB
{
  if ([(PDFDocument *)self allowsDocumentAssembly])
  {
    if (indexA != indexB)
    {
      pageCFIndex Count = self->_pageCount;
      if (pageCount > indexA && pageCount > indexB)
      {
        if ([(PDFDocument *)self isFinding]) {
          [(PDFDocument *)self cancelFindString];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_pageChangeDelegate);
        id obj = self->_pages;
        objc_sync_enter(obj);
        pageIndices = self->_pageIndices;
        uint64_t v11 = [NSNumber numberWithUnsignedInteger:indexA];
        NSUInteger v12 = [(NSMutableDictionary *)pageIndices objectForKey:v11];

        CFStringRef v13 = self->_pageIndices;
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:indexB];
        id v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

        id v27 = [(NSMutableArray *)self->_pages objectAtIndex:indexA];
        uint64_t v16 = [(NSMutableArray *)self->_pages objectAtIndex:indexB];
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained willSwapPage:v27 atIndex:indexA forPage:v16 atIndex:indexB];
        }
        id v17 = self->_pageIndices;
        int v18 = [NSNumber numberWithUnsignedInteger:indexB];
        [(NSMutableDictionary *)v17 setObject:v12 forKey:v18];

        id v19 = self->_pageIndices;
        unint64_t v20 = [NSNumber numberWithUnsignedInteger:indexA];
        [(NSMutableDictionary *)v19 setObject:v15 forKey:v20];

        [(NSMutableArray *)self->_pages exchangeObjectAtIndex:indexA withObjectAtIndex:indexB];
        id v21 = [MEMORY[0x263EFF9D8] orderedSetWithArray:self->_pages];
        pagesOrderedSet = self->_pagesOrderedSet;
        self->_pagesOrderedSet = v21;

        if (self->_akDocumentAdaptor)
        {
          [v16 setupAKPageAdaptorIfNecessary];
          [(PDFAKDocumentAdaptor *)self->_akDocumentAdaptor pdfDocument:self didExchangePage:v27 atIndex:indexA withPage:v16 atIndex:indexB];
        }
        if (self->_document) {
          CGPDFDocumentExchangePagesAtIndices();
        }

        objc_sync_exit(obj);
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained didSwapPage:v27 atIndex:indexA forPage:v16 atIndex:indexB];
        }
        id v23 = [MEMORY[0x263F08A00] defaultCenter];
        [v23 postNotificationName:@"PDFDocumentDidMutate" object:self];

        self->_documentChanged = 1;
        self->_pagesChanged.pagesExchanged = 1;
      }
    }
  }
  else
  {
    PDFDocumentPermissions v24 = [(PDFDocument *)self permissionsStatus];
    id v25 = @"user";
    if (v24 == kPDFDocumentPermissionsOwner) {
      id v25 = @"owner";
    }
    NSLog(&cfstr_PdfdocumentSEx.isa, v25);
  }
}

- (Class)pageClass
{
  return (Class)objc_opt_class();
}

- (NSArray)findString:(NSString *)string withOptions:(NSStringCompareOptions)options
{
  NSUInteger v6 = string;
  id v7 = v6;
  if (v6 && [(NSString *)v6 length])
  {
    self->_findModel = 0;
    if ([(PDFDocument *)self isFinding]) {
      [(PDFDocument *)self cancelFindString];
    }
    [(PDFDocument *)self normalizeFindOptions:options];
    if ((self->_findOptions & 4) != 0)
    {
      NSUInteger v10 = [(PDFDocument *)self pageCount];
      int64_t v8 = 0;
      self->_findPageIndedouble x = v10 - 1;
    }
    else
    {
      self->_findPageIndedouble x = 0;
      int64_t v8 = [(PDFDocument *)self pageCount] - 1;
    }
    self->_findCharIndedouble x = -1;
    self->_lastFindPageIndedouble x = v8;
    self->_lastFindCharIndedouble x = -1;
    [(PDFDocument *)self coreFindString:v7];
    uint64_t v9 = self->_findResults;
  }
  else
  {
    uint64_t v9 = (NSMutableArray *)MEMORY[0x263EFFA68];
  }

  return (NSArray *)v9;
}

- (void)beginFindString:(NSString *)string withOptions:(NSStringCompareOptions)options
{
  NSUInteger v6 = string;
  id v7 = v6;
  if (v6)
  {
    uint64_t v9 = v6;
    NSUInteger v6 = [(NSString *)v6 length];
    id v7 = v9;
    if (v6)
    {
      int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v9];
      [(PDFDocument *)self beginFindStrings:v8 withOptions:options];

      id v7 = v9;
    }
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (void)beginFindStrings:(NSArray *)strings withOptions:(NSStringCompareOptions)options
{
  NSUInteger v6 = strings;
  id v7 = v6;
  if (v6)
  {
    NSUInteger v10 = v6;
    NSUInteger v6 = [(NSArray *)v6 count];
    id v7 = v10;
    if (v6)
    {
      self->_findModel = 1;
      [(PDFDocument *)self normalizeFindOptions:options];
      if ((self->_findOptions & 4) != 0)
      {
        NSUInteger v9 = [(PDFDocument *)self pageCount];
        int64_t v8 = 0;
        self->_findPageIndedouble x = v9 - 1;
      }
      else
      {
        self->_findPageIndedouble x = 0;
        int64_t v8 = [(PDFDocument *)self pageCount] - 1;
      }
      self->_findCharIndedouble x = -1;
      self->_lastFindPageIndedouble x = v8;
      self->_lastFindCharIndedouble x = -1;
      NSUInteger v6 = (NSArray *)[(PDFDocument *)self coreFindStrings:v10];
      id v7 = v10;
    }
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (PDFSelection)findString:(NSString *)string fromSelection:(PDFSelection *)selection withOptions:(NSStringCompareOptions)options
{
  int64_t v8 = string;
  NSUInteger v9 = selection;
  if (v8 && [(NSString *)v8 length])
  {
    self->_findModel = 2;
    NSUInteger v10 = [(PDFDocument *)self _findString:v8 fromSelection:v9 withOptions:options];
  }
  else
  {
    NSUInteger v10 = 0;
  }

  return (PDFSelection *)v10;
}

- (id)findStringPerPage:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 length])
  {
    self->_findModel = 3;
    NSUInteger v10 = [(PDFDocument *)self _findString:v8 fromSelection:v9 withOptions:a5];
  }
  else
  {
    NSUInteger v10 = 0;
  }

  return v10;
}

- (id)_findString:(id)a3 fromSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PDFDocument *)self normalizeFindOptions:a5];
  if ((self->_findOptions & 4) != 0)
  {
    NSUInteger v11 = [(PDFDocument *)self pageCount];
    int64_t v10 = 0;
    self->_findPageIndedouble x = v11 - 1;
  }
  else
  {
    self->_findPageIndedouble x = 0;
    int64_t v10 = [(PDFDocument *)self pageCount] - 1;
  }
  self->_findCharIndedouble x = -1;
  self->_lastFindPageIndedouble x = v10;
  self->_lastFindCharIndedouble x = -1;
  if (!v9) {
    goto LABEL_16;
  }
  int v12 = [v9 isEmpty];
  int findModel = self->_findModel;
  if (v12)
  {
    if (findModel != 3) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (findModel == 3)
  {
LABEL_9:
    uint64_t v14 = [v9 pages];
    id v15 = [v14 lastObject];

    goto LABEL_14;
  }
  if ((self->_findOptions & 4) != 0) {
    [v9 firstPage];
  }
  else {
  id v15 = [v9 lastPage];
  }
LABEL_14:
  uint64_t v16 = [v15 document];

  if (v16 != self) {
    goto LABEL_15;
  }
  self->_findPageIndedouble x = [(PDFDocument *)self indexForPage:v15];
  if (![v15 numberOfCharacters]) {
    goto LABEL_15;
  }
  if ((self->_findOptions & 4) != 0)
  {
    uint64_t v23 = [v9 pdfKitIndexOfFirstCharacterOnPage:v15];
    self->_findCharIndedouble x = v23 - 1;
    if (v23 - 1 < 0)
    {
      while (1)
      {
        findPageIndedouble x = self->_findPageIndex;
        if (!findPageIndex) {
          goto LABEL_31;
        }
        self->_findPageIndedouble x = findPageIndex - 1;
        id v22 = -[PDFDocument pageAtIndex:](self, "pageAtIndex:");
        if ([v22 numberOfCharacters])
        {
          int64_t v25 = [v22 numberOfCharacters] - 1;
LABEL_34:
          self->_findCharIndedouble x = v25;

          break;
        }
      }
    }
LABEL_15:

LABEL_16:
    findInstance = self->_findInstance;
    self->_findInstance = 0;

    [(PDFDocument *)self coreFindString:v8];
    int v18 = self->_findInstance;
    goto LABEL_17;
  }
  unint64_t v20 = [v9 pdfKitIndexOfLastCharacterOnPage:v15] + 1;
  self->_findCharIndedouble x = v20;
  if (v20 < [v15 numberOfCharacters]) {
    goto LABEL_15;
  }
  while (1)
  {
    unint64_t v21 = self->_findPageIndex + 1;
    if (v21 >= [(PDFDocument *)self pageCount]) {
      break;
    }
    ++self->_findPageIndex;
    id v22 = -[PDFDocument pageAtIndex:](self, "pageAtIndex:");
    if ([v22 numberOfCharacters])
    {
      int64_t v25 = 0;
      goto LABEL_34;
    }
  }
LABEL_31:

  int v18 = 0;
LABEL_17:

  return v18;
}

- (void)didMatchString:(id)a3
{
  id v10 = a3;
  -[NSMutableArray addObject:](self->_findResults, "addObject:");
  if (self->_respondsToDidFindMatch)
  {
    CFAllocatorRef v4 = [(PDFDocument *)self delegate];
    id v5 = (void *)MEMORY[0x263F089F8];
    NSUInteger v6 = [NSDictionary dictionaryWithObject:v10 forKey:@"PDFDocumentFoundSelection"];
    id v7 = [v5 notificationWithName:@"PDFDidFindMatch" object:self userInfo:v6];
    [v4 documentDidFindMatch:v7];
  }
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  id v9 = [NSDictionary dictionaryWithObject:v10 forKey:@"PDFDocumentFoundSelection"];
  [v8 postNotificationName:@"PDFDidFindMatch" object:self userInfo:v9];
}

- (BOOL)isFinding
{
  return self->_finding;
}

- (void)cancelFindString
{
  id v3 = [MEMORY[0x263F08A10] defaultQueue];
  CFAllocatorRef v4 = [MEMORY[0x263F089F8] notificationWithName:@"pdfDocumentFindNext" object:self];
  [v3 dequeueNotificationsMatching:v4 coalesceMask:0];

  [(PDFDocument *)self cleanupFind];
}

- (void)asyncFindStrings:(id)a3 withOptions:(unint64_t)a4 withDelegate:(id)a5 onQueue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_asyncSearchQueue)
  {
    CFStringRef v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v14 = (OS_dispatch_queue *)dispatch_queue_create("PDFDocument.asyncFindString", v13);
    asyncSearchQueue = self->_asyncSearchQueue;
    self->_asyncSearchQueue = v14;
  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  NSUInteger v50 = 0;
  NSUInteger v50 = [(PDFDocument *)self pageCount];
  id v16 = v12;
  id v17 = v16;
  if (!v16)
  {
    id v17 = (void *)MEMORY[0x263EF83A0];
    id v18 = MEMORY[0x263EF83A0];
  }
  char IsOCREnabled = PDFKitIsOCREnabled();
  char v20 = objc_opt_respondsToSelector();
  long long v32 = (void *)a4;
  char v21 = objc_opt_respondsToSelector();
  char v22 = objc_opt_respondsToSelector();
  id v29 = v10;
  id v31 = v16;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v11);
  id v30 = v11;
  uint64_t v23 = objc_opt_new();
  char v24 = v21 & 1;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2810000000;
  v45[3] = &unk_21442F44B;
  int v46 = 0;
  int64_t v25 = self->_asyncSearchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke;
  block[3] = &unk_264205058;
  uint64_t v37 = v49;
  objc_copyWeak(&v39, &from);
  char v41 = v20 & 1;
  objc_copyWeak(v40, &location);
  char v42 = IsOCREnabled;
  v40[1] = v32;
  char v43 = v24;
  id v34 = v29;
  id v35 = v17;
  size_t v38 = v45;
  id v36 = v23;
  char v44 = v22 & 1;
  id v26 = v23;
  id v27 = v17;
  id v28 = v29;
  dispatch_async(v25, block);

  objc_destroyWeak(v40);
  objc_destroyWeak(&v39);
  _Block_object_dispose(v45, 8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v49, 8);
}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke(uint64_t a1)
{
  size_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_2;
  block[3] = &unk_264205030;
  objc_copyWeak(&v15, (id *)(a1 + 72));
  char v17 = *(unsigned char *)(a1 + 96);
  objc_copyWeak(v16, (id *)(a1 + 80));
  char v18 = *(unsigned char *)(a1 + 97);
  id v3 = *(id *)(a1 + 32);
  CFAllocatorRef v4 = *(void **)(a1 + 88);
  id v10 = v3;
  v16[1] = v4;
  char v19 = *(unsigned char *)(a1 + 98);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v13 = v6;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v12 = v7;
  uint64_t v14 = v8;
  char v20 = *(unsigned char *)(a1 + 99);
  dispatch_apply(v2, 0, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (WeakRetained && (!*(unsigned char *)(a1 + 96) || ([WeakRetained cancelFind] & 1) == 0))
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 80));
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 pageAtIndex:a2];
      id v9 = v8;
      if (*(unsigned char *)(a1 + 97)
        && ([v8 isTextFromOCR] & 1) == 0
        && +[PDFPageEvaluator isPageCandidateForOCR:v9])
      {
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
        id v11 = +[PDFPageAnalyzer sharedInstance];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_3;
        v48[3] = &unk_264204D88;
        dispatch_semaphore_t v49 = v10;
        id v12 = v10;
        [v11 analyzePage:v9 analysisTypes:1 completionQueue:0 completionBlock:v48];

        dispatch_time_t v13 = dispatch_time(0, 3000000000);
        dispatch_semaphore_wait(v12, v13);
      }
      uint64_t v14 = [v9 string];
      id v15 = v14;
      uint64_t v42 = 0;
      char v43 = &v42;
      uint64_t v44 = 0x3032000000;
      uint64_t v45 = __Block_byref_object_copy__4;
      int v46 = __Block_byref_object_dispose__4;
      id v47 = 0;
      uint64_t v38 = 0;
      id v39 = &v38;
      uint64_t v40 = 0x2020000000;
      int v41 = 0;
      if (v14)
      {
        id v16 = *(void **)(a1 + 32);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_4;
        v32[3] = &unk_264204FA0;
        id v17 = v14;
        uint64_t v18 = *(void *)(a1 + 88);
        id v33 = v17;
        id v35 = &v38;
        id v36 = &v42;
        uint64_t v37 = v18;
        id v34 = v9;
        [v16 enumerateObjectsUsingBlock:v32];
        unint64_t v19 = *((int *)v39 + 6);
        if ([*(id *)(a1 + 32) count] > v19)
        {
          char v20 = (void *)v43[5];
          v43[5] = 0;
        }
        if (v43[5] && (unint64_t)[*(id *)(a1 + 32) count] >= 2) {
          [(id)v43[5] sortUsingComparator:&__block_literal_global_14];
        }
      }
      if (*(unsigned char *)(a1 + 98))
      {
        char v21 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_6;
        block[3] = &unk_264204FE8;
        id v29 = v5;
        id v31 = &v42;
        id v30 = v9;
        dispatch_async(v21, block);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      if (v43[5]) {
        objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
      }
      uint64_t v22 = --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
      if (*(unsigned char *)(a1 + 99) && !v22)
      {
        [*(id *)(a1 + 48) sortWithOptions:16 usingComparator:&__block_literal_global_524];
        uint64_t v23 = *(NSObject **)(a1 + 40);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_8;
        void v24[3] = &unk_264204420;
        id v25 = v5;
        id v26 = *(id *)(a1 + 48);
        id v27 = v7;
        dispatch_async(v23, v24);
      }
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
    }
  }
}

intptr_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v19 = a2;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v19, *(void *)(a1 + 64), 0, objc_msgSend(*(id *)(a1 + 32), "length"));
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = v6;
    char v10 = 1;
    uint64_t v11 = v7;
    do
    {
      if (v10) {
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      id v15 = objc_msgSend(*(id *)(a1 + 40), "selectionForRange:", v9, v11);
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v15];
      uint64_t v16 = v9 + v11;
      uint64_t v17 = [*(id *)(a1 + 32) length] - v16;

      uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v19, *(void *)(a1 + 64), v16, v17);
      uint64_t v11 = v18;
      char v10 = 0;
    }
    while (v18);
  }
  *a4 = v8 == 0;
}

uint64_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void *__65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_6(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (result) {
    return (void *)[result foundResults:*(void *)(*(void *)(a1[6] + 8) + 40) forPage:a1[5]];
  }
  return result;
}

uint64_t __65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 pages];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [v6 document];
  unint64_t v8 = [v7 indexForPage:v6];

  uint64_t v9 = [v4 pages];

  char v10 = [v9 firstObject];

  uint64_t v11 = [v10 document];
  unint64_t v12 = [v11 indexForPage:v10];

  uint64_t v13 = 1;
  if (v8 <= v12) {
    uint64_t v13 = -1;
  }
  if (v8 < v12) {
    uint64_t v14 = -1;
  }
  else {
    uint64_t v14 = v13;
  }

  return v14;
}

void *__65__PDFDocument_asyncFindStrings_withOptions_withDelegate_onQueue___block_invoke_8(void *a1)
{
  uint64_t result = (void *)a1[4];
  if (result) {
    return (void *)[result foundResults:a1[5] forDocument:a1[6]];
  }
  return result;
}

- (void)asyncFindStrings:(id)a3 withDelegate:(id)a4 onQueue:(id)a5
{
}

- (void)asyncFindString:(id)a3 withDelegate:(id)a4 onQueue:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v13 = a3;
  unint64_t v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = [v8 arrayWithObjects:&v13 count:1];

  -[PDFDocument asyncFindStrings:withOptions:withDelegate:onQueue:](self, "asyncFindStrings:withOptions:withDelegate:onQueue:", v12, 1, v10, v9, v13, v14);
}

- (PDFSelection)selectionForEntireDocument
{
  NSUInteger v3 = [(PDFDocument *)self pageCount];
  if (v3)
  {
    NSUInteger v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(PDFDocument *)self pageAtIndex:v5];
      uint64_t v8 = [v7 selectionForAll];
      id v9 = (void *)v8;
      if (v6)
      {
        [v6 addSelectionNoNormalize:v8];
      }
      else
      {
        uint64_t v6 = (void *)v8;
      }

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (PDFSelection *)v6;
}

- (PDFSelection)selectionFromPage:(PDFPage *)startPage atPoint:(CGPoint)startPoint toPage:(PDFPage *)endPage atPoint:(CGPoint)endPoint
{
  return (PDFSelection *)-[PDFDocument selectionFromPage:atPoint:toPage:atPoint:type:](self, "selectionFromPage:atPoint:toPage:atPoint:type:", startPage, endPage, 0, startPoint.x, startPoint.y, endPoint.x, endPoint.y);
}

- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 withGranularity:(unint64_t)a7
{
  if (a7 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = a7 == 1;
  }
  return -[PDFDocument selectionFromPage:atPoint:toPage:atPoint:type:](self, "selectionFromPage:atPoint:toPage:atPoint:type:", a3, a5, v7, a4.x, a4.y, a6.x, a6.y);
}

- (PDFSelection)selectionFromPage:(PDFPage *)startPage atCharacterIndex:(NSUInteger)startCharacter toPage:(PDFPage *)endPage atCharacterIndex:(NSUInteger)endCharacter
{
  id v10 = startPage;
  id v11 = endPage;
  unint64_t v12 = [(PDFPage *)v10 document];
  id v13 = [(PDFPage *)v11 document];
  uint64_t v14 = v13;
  id v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (v12 != self || v13 != self)
  {
LABEL_19:
    id v36 = v17;

    goto LABEL_20;
  }
  if (v10 != v11)
  {
    id v39 = v13;
    NSUInteger v18 = endCharacter;
    NSUInteger v19 = [(PDFDocument *)self indexForPage:v10];
    NSUInteger v20 = [(PDFDocument *)self indexForPage:v11];
    if (v19 >= v20) {
      char v21 = v11;
    }
    else {
      char v21 = v10;
    }
    if (v19 >= v20) {
      uint64_t v22 = v10;
    }
    else {
      uint64_t v22 = v11;
    }
    NSUInteger v38 = v18;
    if (v19 >= v20) {
      NSUInteger v23 = v18;
    }
    else {
      NSUInteger v23 = startCharacter;
    }
    uint64_t v16 = v21;
    id v15 = v22;
    uint64_t v17 = -[PDFPage selectionForRange:](v16, "selectionForRange:", v23, [(PDFPage *)v16 numberOfCharacters] - v23);
    char v24 = [(PDFPage *)v16 document];
    int v25 = [v24 indexForPage:v16];

    int v26 = v25 + 1;
    id v27 = [(PDFPage *)v15 document];
    int v28 = [v27 indexForPage:v15];

    if (v26 < v28)
    {
      uint64_t v29 = v26;
      do
      {
        id v30 = -[PDFDocument pageAtIndex:](self, "pageAtIndex:", v29, v38);
        id v31 = v30;
        if (v30)
        {
          long long v32 = [v30 selectionForAll];
          [v17 addSelection:v32];
        }
        ++v29;
        id v33 = [(PDFPage *)v15 document];
        int v34 = [v33 indexForPage:v15];
      }
      while (v29 < v34);
    }
    id v35 = -[PDFPage selectionForRange:](v15, "selectionForRange:", 0, v38 + 1, v38);
    [v17 addSelection:v35];

    uint64_t v14 = v39;
    goto LABEL_19;
  }
  -[PDFPage selectionForRange:](v10, "selectionForRange:", startCharacter, endCharacter - startCharacter + 1);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return (PDFSelection *)v36;
}

- (void)resetFormFields:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [v8 fields];
  uint64_t v5 = [(PDFDocument *)self formData];
  uint64_t v6 = v5;
  if (v4)
  {
    if (!v5) {
      goto LABEL_9;
    }
    if ([v8 fieldsIncludedAreCleared])
    {
      [v6 resetFormForFields:v4];
      goto LABEL_9;
    }
    uint64_t v5 = v6;
    uint64_t v7 = v4;
  }
  else
  {
    if (!v5) {
      goto LABEL_9;
    }
    uint64_t v7 = 0;
  }
  [v5 resetFormExcludingFields:v7];
LABEL_9:
}

- (void)setEnableDataDetectors:(BOOL)a3
{
  self->_dataDetectorsEnabled = a3;
}

- (BOOL)enableDataDetectors
{
  return self->_dataDetectorsEnabled;
}

- (BOOL)showsAnnotations
{
  return 1;
}

- (void)setBookmarked:(BOOL)a3 atPageIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  if ([(PDFDocument *)self pageCount] > a4)
  {
    int v7 = [(NSMutableIndexSet *)self->_bookmarkedPages containsIndex:a4];
    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        bookmarkedPages = self->_bookmarkedPages;
        [(NSMutableIndexSet *)bookmarkedPages addIndex:a4];
      }
    }
    else if (v7)
    {
      id v9 = self->_bookmarkedPages;
      [(NSMutableIndexSet *)v9 removeIndex:a4];
    }
  }
}

- (id)bookmarkedPages
{
  size_t v2 = (void *)[(NSMutableIndexSet *)self->_bookmarkedPages copy];

  return v2;
}

- (id)_bookmarksCatalog
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id obj = self->_pages;
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  NSUInteger v3 = self->_pages;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isBookmarked])
        {
          v19[0] = @"PageIndex";
          id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[PDFDocument indexForPage:](self, "indexForPage:", v7));
          v19[1] = @"UUID";
          v20[0] = v8;
          id v9 = [MEMORY[0x263F08C38] UUID];
          id v10 = [v9 UUIDString];
          v20[1] = v10;
          id v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

          [v14 addObject:v11];
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }

  objc_sync_exit(obj);

  return v14;
}

- (void)updateBookmarksInPDFDocument
{
  id v3 = [(PDFDocument *)self _bookmarksCatalog];
  [(PDFDocument *)self _setDocumentCatalogMetadata:v3 withNSpace:@"http://ns.apple.com/Preview/1.0/" prefix:@"apple-preview" rootPath:@"apple-preview:Bookmarks"];
}

- (BOOL)bookmarksChanged
{
  initialBookmarkedPageIndices = self->_initialBookmarkedPageIndices;
  id v3 = [(PDFDocument *)self bookmarkedPages];
  LOBYTE(initialBookmarkedPageIndices) = [(NSIndexSet *)initialBookmarkedPageIndices isEqual:v3] ^ 1;

  return (char)initialBookmarkedPageIndices;
}

+ (void)setPDFDocumentAppendModeActiveForThisThread:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v6 = [v4 threadDictionary];

  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:@"PDFKitDocumentAppendModeActiveKey"];
}

+ (BOOL)pdfDocumentAppendModeActiveForThisThread
{
  size_t v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"PDFKitDocumentAppendModeActiveKey"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)enableLimitedSearch
{
  self->_limitedSearch = 1;
}

- (id)namedDestination:(id)a3
{
  id v4 = a3;
  Catalog = CGPDFDocumentGetCatalog(self->_document);
  if (Catalog)
  {
    id v6 = Catalog;
    CGPDFDictionaryRef value = 0;
    if (CGPDFDictionaryGetDictionary(Catalog, "Dests", &value))
    {
      CGPDFDictionaryRef dict = 0;
      if (CGPDFDictionaryGetDictionary(value, (const char *)[v4 UTF8String], &dict))
      {
        int v7 = [PDFDestination alloc];
        uint64_t v8 = [(PDFDestination *)v7 initWithDictionary:dict forDocument:self];
LABEL_9:
        id v9 = (void *)v8;
        goto LABEL_11;
      }
    }
    CGPDFDictionaryRef dict = 0;
    if (CGPDFDictionaryGetDictionary(v6, "Names", &dict)) {
      CGPDFDictionaryGetDictionary(dict, "Dests", &value);
    }
    if (value)
    {
      uint64_t v8 = -[PDFDocument _namedDestination:forNameDictionary:](self, "_namedDestination:forNameDictionary:", v4);
      goto LABEL_9;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)_namedDestination:(id)a3 forNameDictionary:(CGPDFDictionary *)a4
{
  id v6 = a3;
  CGPDFArrayRef value = 0;
  int v7 = 0;
  if (CGPDFDictionaryGetArray(a4, "Limits", &value))
  {
    if (CGPDFArrayGetCount(value) != 2) {
      goto LABEL_7;
    }
    CGPDFStringRef string = 0;
    int v7 = 0;
    if (!CGPDFArrayGetString(value, 0, &string)) {
      goto LABEL_8;
    }
    CFStringRef v8 = CGPDFStringCopyTextString(string);
    uint64_t v9 = [v6 compare:v8];
    CFRelease(v8);
    if (v9 == -1) {
      goto LABEL_7;
    }
    if (!CGPDFArrayGetString(value, 1uLL, &string)) {
      goto LABEL_7;
    }
    CFStringRef v10 = CGPDFStringCopyTextString(string);
    uint64_t v11 = [v6 compare:v10];
    CFRelease(v10);
    if (v11 == 1) {
      goto LABEL_7;
    }
    arradouble y = 0;
    if (CGPDFDictionaryGetArray(a4, "Kids", &array) && (size_t v13 = CGPDFArrayGetCount(array)) != 0)
    {
      size_t v14 = v13;
      size_t v15 = 0;
      while (1)
      {
        CGPDFDictionaryRef v25 = 0;
        if (CGPDFArrayGetDictionary(array, v15, &v25))
        {
          uint64_t v16 = [(PDFDocument *)self _namedDestination:v6 forNameDictionary:v25];
          if (v16) {
            break;
          }
        }
        if (v14 == ++v15) {
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      CGPDFDictionaryRef v25 = 0;
      int v7 = 0;
      if (!CGPDFDictionaryGetArray(a4, "Names", &v25)) {
        goto LABEL_8;
      }
      size_t Count = CGPDFArrayGetCount(v25);
      if (!Count)
      {
LABEL_7:
        int v7 = 0;
        goto LABEL_8;
      }
      size_t v18 = Count;
      size_t v19 = 0;
      while (1)
      {
        CGPDFStringRef v24 = 0;
        if (CGPDFArrayGetString(v25, v19, &v24))
        {
          CFStringRef v20 = CGPDFStringCopyTextString(v24);
          uint64_t v21 = [v6 compare:v20];
          CFRelease(v20);
          if (!v21)
          {
            CGPDFDictionaryRef v23 = 0;
            if (CGPDFArrayGetDictionary(v25, v19 + 1, &v23))
            {
              uint64_t v22 = [PDFDestination alloc];
              uint64_t v16 = [(PDFDestination *)v22 initWithDictionary:v23 forDocument:self];
              if (v16) {
                break;
              }
            }
          }
        }
        v19 += 2;
        if (v19 >= v18) {
          goto LABEL_7;
        }
      }
    }
    int v7 = (void *)v16;
  }
LABEL_8:

  return v7;
}

- (id)akController
{
  return [(PDFAKDocumentAdaptor *)self->_akDocumentAdaptor akMainController];
}

- (void)undo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFDocument *)self akController];
  [v5 undo:v4];
}

- (BOOL)validateUndo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFDocument *)self akController];
  char v6 = [v5 validateUndo:v4];

  return v6;
}

- (void)redo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFDocument *)self akController];
  [v5 redo:v4];
}

- (BOOL)validateRedo:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFDocument *)self akController];
  char v6 = [v5 validateRedo:v4];

  return v6;
}

- (void)revert
{
  if ([(PDFDocument *)self validateUndo:0])
  {
    do
      [(PDFDocument *)self undo:0];
    while ([(PDFDocument *)self validateUndo:0]);
  }
}

- (BOOL)documentChanged
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_documentChanged)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    id v4 = self->_pages;
    objc_sync_enter(v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_pages;
    uint64_t v2 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v2)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v5);
          }
          CFStringRef v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
            CFStringRef v10 = objc_msgSend(v9, "annotationChanges", (void)v13);
            BOOL v11 = [v10 count] == 0;

            if (!v11)
            {
              LOBYTE(v2) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v2 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v4);
  }
  return v2;
}

- (id)pageAnnotationChanges
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_pages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          BOOL v11 = objc_msgSend(v10, "changedAnnotations", (void)v14);
          uint64_t v12 = [v11 count];

          if (v12) {
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)resetPageAnnotationChanges
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = self->_pages;
  objc_sync_enter(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_pages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          objc_msgSend(v9, "resetChangedAnnotations", (void)v10);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)beginBatchPageChanges
{
  self->_pagesOrderedSet = 0;
  MEMORY[0x270F9A758]();
}

- (void)endBatchPageChanges
{
  uint64_t v2 = self;
  if (self->_pages)
  {
    objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithArray:");
    self = (PDFDocument *)objc_claimAutoreleasedReturnValue();
    pagesOrderedSet = v2->_pagesOrderedSet;
    v2->_pagesOrderedSet = (NSOrderedSet *)self;
  }
  else
  {
    pagesOrderedSet = self->_pagesOrderedSet;
    self->_pagesOrderedSet = 0;
  }

  MEMORY[0x270F9A758](self, pagesOrderedSet);
}

- (BOOL)viewPreferenceRightToLeft
{
  CFBooleanRef document = self->_document;
  if (document)
  {
    CFBooleanRef document = CGPDFDocumentGetCatalog(document);
    if (document)
    {
      CGPDFDictionaryRef value = 0;
      LOBYTE(document) = CGPDFDictionaryGetDictionary(document, "ViewerPreferences", &value)
                      && (__s1 = 0, CGPDFDictionaryGetName(value, "Direction", (const char **)&__s1))
                      && !strncmp(__s1, "R2L", 3uLL);
    }
  }
  return (char)document;
}

- (id)selectionFromPage:(id)a3 atPoint:(CGPoint)a4 toPage:(id)a5 atPoint:(CGPoint)a6 type:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a6.y;
  double x = a6.x;
  double v11 = a4.y;
  double v12 = a4.x;
  id v14 = a3;
  id v15 = a5;
  long long v16 = [v14 document];
  long long v17 = [v15 document];
  uint64_t v18 = v17;
  id v19 = 0;
  if (v16 == self && v17 == self)
  {
    if (v14 == v15)
    {
      objc_msgSend(v14, "selectionFromPoint:toPoint:type:", v7, v12, v11, x, y);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSUInteger v20 = [(PDFDocument *)self indexForPage:v14];
      NSUInteger v21 = [(PDFDocument *)self indexForPage:v15];
      if (v20 >= v21) {
        uint64_t v22 = v15;
      }
      else {
        uint64_t v22 = v14;
      }
      if (v20 >= v21) {
        CGPDFDictionaryRef v23 = v14;
      }
      else {
        CGPDFDictionaryRef v23 = v15;
      }
      if (v20 >= v21) {
        double v24 = v11;
      }
      else {
        double v24 = y;
      }
      if (v20 >= v21) {
        double v25 = v12;
      }
      else {
        double v25 = x;
      }
      if (v20 < v21)
      {
        double x = v12;
        double y = v11;
      }
      id v26 = v22;
      id v27 = v23;
      unsigned int v39 = v7;
      int v28 = objc_msgSend(v26, "selectionFromPointToBottom:type:", v7, x, y);
      uint64_t v29 = [v26 document];
      NSUInteger v38 = v26;
      uint64_t v30 = [v29 indexForPage:v26];

      for (unint64_t i = v30 + 1; ; ++i)
      {
        long long v32 = [v27 document];
        unint64_t v33 = [v32 indexForPage:v27];

        if (i >= v33) {
          break;
        }
        int v34 = [(PDFDocument *)self pageAtIndex:i];
        id v35 = [v34 selectionForAll];
        [v28 addSelectionCore:v35 normalize:0];
      }
      id v36 = objc_msgSend(v27, "selectionFromTopToPoint:type:", v39, v25, v24);
      [v28 addSelection:v36];

      id v19 = v28;
    }
  }

  return v19;
}

- (id)textExtractionQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textExtractionQueue)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("PDFKit.PDFDocument.textExtractionQueue", v4);
    textExtractionQueue = v2->_textExtractionQueue;
    v2->_textExtractionQueue = (OS_dispatch_queue *)v5;
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_textExtractionQueue;

  return v7;
}

- (id)formFillingQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_formFillingQueue)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("PDFKit.PDFDocument.formFillingQueue", v4);
    formFillingQueue = v2->_formFillingQueue;
    v2->_formFillingQueue = (OS_dispatch_queue *)v5;
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_formFillingQueue;

  return v7;
}

- (id)findStrings:(id)a3 withinSelection:(id)a4 withOptions:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [MEMORY[0x263F086E0] mainBundle];
  double v11 = [v10 infoDictionary];
  double v12 = [v11 objectForKey:@"CFBundleName"];

  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v13 = [v8 count];
  id v14 = 0;
  if (v9 && v13)
  {
    if ([v9 isEmpty])
    {
LABEL_5:
      id v14 = 0;
      goto LABEL_44;
    }
    self->_int findModel = 0;
    if ([(PDFDocument *)self isFinding]) {
      [(PDFDocument *)self cancelFindString];
    }
    [(PDFDocument *)self normalizeFindOptions:a5];
    if ((self->_findOptions & 4) != 0)
    {
      NSUInteger v16 = [(PDFDocument *)self pageCount];
      int64_t v15 = 0;
      self->_findPageIndedouble x = v16 - 1;
    }
    else
    {
      self->_findPageIndedouble x = 0;
      int64_t v15 = [(PDFDocument *)self pageCount] - 1;
    }
    self->_findCharIndedouble x = -1;
    self->_lastFindPageIndedouble x = v15;
    self->_lastFindCharIndedouble x = -1;
    if ((self->_findOptions & 4) != 0) {
      [v9 lastPage];
    }
    else {
    long long v17 = [v9 firstPage];
    }
    uint64_t v18 = [v17 document];
    if (v18 != self)
    {
      id v19 = v17;
      goto LABEL_43;
    }
    self->_findPageIndedouble x = [(PDFDocument *)self indexForPage:v17];
    if ([v17 numberOfCharacters])
    {
      unint64_t findOptions = self->_findOptions;
      int v21 = [v12 isEqualToString:@"Preview"];
      if ((findOptions & 4) != 0)
      {
        if (v21) {
          unint64_t v23 = [v9 indexOfLastCharacterOnPage:v17];
        }
        else {
          unint64_t v23 = [v9 pdfKitIndexOfLastCharacterOnPage:v17];
        }
        self->_findCharIndedouble x = v23;
        if (v23 < [v17 numberOfCharacters]) {
          goto LABEL_28;
        }
        int64_t v24 = [v17 numberOfCharacters] - 1;
      }
      else
      {
        if (v21) {
          uint64_t v22 = [v9 indexOfFirstCharacterOnPage:v17];
        }
        else {
          uint64_t v22 = [v9 pdfKitIndexOfFirstCharacterOnPage:v17];
        }
        int64_t v24 = v22 & ~(v22 >> 63);
      }
      self->_findCharIndedouble x = v24;
    }
LABEL_28:
    if ((self->_findOptions & 4) != 0) {
      [v9 firstPage];
    }
    else {
    id v19 = [v9 lastPage];
    }

    self->_lastFindPageIndedouble x = [(PDFDocument *)self indexForPage:v19];
    if (![v19 numberOfCharacters]) {
      goto LABEL_43;
    }
    unint64_t v25 = self->_findOptions;
    int v26 = [v12 isEqualToString:@"Preview"];
    if ((v25 & 4) != 0)
    {
      if (v26) {
        uint64_t v28 = [v9 indexOfFirstCharacterOnPage:v19];
      }
      else {
        uint64_t v28 = [v9 pdfKitIndexOfFirstCharacterOnPage:v19];
      }
      int64_t v29 = v28 & ~(v28 >> 63);
    }
    else
    {
      if (v26) {
        unint64_t v27 = [v9 indexOfLastCharacterOnPage:v19];
      }
      else {
        unint64_t v27 = [v9 pdfKitIndexOfLastCharacterOnPage:v19];
      }
      self->_lastFindCharIndedouble x = v27;
      if (v27 < [v19 numberOfCharacters]) {
        goto LABEL_43;
      }
      int64_t v29 = [v19 numberOfCharacters] - 1;
    }
    self->_lastFindCharIndedouble x = v29;
LABEL_43:
    [(PDFDocument *)self coreFindStrings:v8];
    id v14 = self->_findResults;
  }
LABEL_44:

  return v14;
}

- (void)normalizeFindOptions:(unint64_t)a3
{
  self->_unint64_t findOptions = (a3 & 0x85 | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (void)coreFindString:(id)a3
{
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
  [(PDFDocument *)self coreFindStrings:v4];
}

- (void)coreFindStrings:(id)a3
{
  id v22 = a3;
  if (![(PDFDocument *)self isFinding])
  {
    dispatch_queue_t v5 = self->_findResults;
    objc_sync_enter(v5);
    self->_finding = 1;
    objc_storeStrong((id *)&self->_findStrings, a3);
    [(NSMutableArray *)self->_findResults removeAllObjects];
    if (self->_respondsToDidBeginDocumentFind)
    {
      uint64_t v6 = [(PDFDocument *)self delegate];
      uint64_t v7 = [MEMORY[0x263F089F8] notificationWithName:@"PDFDidBeginDocumentFind" object:self];
      [v6 documentDidBeginDocumentFind:v7];
    }
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"PDFDidBeginDocumentFind" object:self];

    unsigned int findModel = self->_findModel;
    if (findModel > 3 || findModel == 1)
    {
      id v19 = [MEMORY[0x263F08A00] defaultCenter];
      [v19 addObserver:self selector:sel_scheduledFindOnPage_ name:@"pdfDocumentFindNext" object:self];

      NSUInteger v20 = [MEMORY[0x263F08A10] defaultQueue];
      int v21 = [MEMORY[0x263F089F8] notificationWithName:@"pdfDocumentFindNext" object:self];
      [v20 enqueueNotification:v21 postingStyle:1];
    }
    else
    {
      unint64_t v10 = 0;
      while (1)
      {
        BOOL v11 = [(PDFDocument *)self findOnPage];
        self->_findCharIndedouble x = -1;
        if (v11 && (self->_findModel & 0xFFFFFFFE) == 2) {
          break;
        }
        findPageIndedouble x = self->_findPageIndex;
        lastFindPageIndedouble x = self->_lastFindPageIndex;
        if (findPageIndex == lastFindPageIndex)
        {
          int64_t v14 = self->_findPageIndex;
        }
        else
        {
          if ((self->_findOptions & 4) != 0) {
            int64_t v14 = findPageIndex - 1;
          }
          else {
            int64_t v14 = findPageIndex + 1;
          }
          self->_findPageIndedouble x = v14;
          ++v10;
        }
        if (self->_findModel == 3)
        {
          NSUInteger v16 = [(PDFDocument *)self pageAtIndex:v14];
          long long v17 = [[PDFSelection alloc] initWithPage:v16];
          findInstance = self->_findInstance;
          self->_findInstance = v17;

          break;
        }
        if (self->_limitedSearch)
        {
          unint64_t v15 = [(NSMutableArray *)self->_findResults count];
          if (findPageIndex == lastFindPageIndex || v15 > 0x3E7 || v10 >= 0x65) {
            break;
          }
        }
        else if (findPageIndex == lastFindPageIndex)
        {
          break;
        }
      }
      [(PDFDocument *)self cleanupFind];
    }
    objc_sync_exit(v5);
  }
}

- (BOOL)findOnPage
{
  id WeakRetained = (PDFDocument *)objc_loadWeakRetained(&self->_delegate);
  if (self->_respondsToDidBeginPageFind)
  {
    id v4 = (void *)MEMORY[0x263F089F8];
    dispatch_queue_t v5 = NSDictionary;
    uint64_t v6 = [NSNumber numberWithLong:self->_findPageIndex];
    uint64_t v7 = [v5 dictionaryWithObject:v6 forKey:@"PDFDocumentPageIndex"];
    id v8 = [v4 notificationWithName:@"PDFDidBeginPageFind" object:self userInfo:v7];
    [(PDFDocument *)WeakRetained documentDidBeginPageFind:v8];
  }
  result.id location = 0;
  result.NSUInteger length = 0;
  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  unint64_t v10 = NSDictionary;
  BOOL v11 = [NSNumber numberWithLong:self->_findPageIndex];
  double v12 = [v10 dictionaryWithObject:v11 forKey:@"PDFDocumentPageIndex"];
  [v9 postNotificationName:@"PDFDidBeginPageFind" object:self userInfo:v12];

  uint64_t v13 = [(PDFDocument *)self pageAtIndex:self->_findPageIndex];
  int64_t v14 = v13;
  if (!v13 || (CFStringRef v15 = (const __CFString *)[v13 string]) == 0)
  {
    LOBYTE(v22) = 0;
    goto LABEL_49;
  }
  CFStringRef v16 = v15;
  CFRetain(v15);
  uint64_t v17 = [v14 numberOfCharacters];
  if (!v17 || (v18 = v17, (NSUInteger v44 = [(NSArray *)self->_findStrings count]) == 0))
  {
    LOBYTE(v22) = 0;
    goto LABEL_45;
  }
  int v45 = 0;
  CFIndex v19 = 0;
  uint64_t v46 = 0;
  while (2)
  {
    CFStringRef v20 = -[NSArray objectAtIndex:](self->_findStrings, "objectAtIndex:", v46, v43);
    findCharIndedouble x = self->_findCharIndex;
    if ((self->_findOptions & 4) != 0)
    {
      if (findCharIndex == -1) {
        result.id location = v18;
      }
      else {
        result.id location = self->_findCharIndex;
      }
    }
    else if (findCharIndex == -1)
    {
      CFIndex v19 = 0;
    }
    else
    {
      CFIndex v19 = self->_findCharIndex;
    }
    CFIndex v43 = v19;
    int v22 = v45;
    while (1)
    {
      lastFindPageIndedouble x = self->_lastFindPageIndex;
      CFStringCompareFlags findOptions = self->_findOptions;
      findPageIndedouble x = self->_findPageIndex;
      if ((findOptions & 4) != 0) {
        break;
      }
      if (lastFindPageIndex != findPageIndex || (lastFindCharIndedouble x = self->_lastFindCharIndex, lastFindCharIndex == -1)) {
        v27.NSUInteger length = v18 - v19;
      }
      else {
        v27.NSUInteger length = lastFindCharIndex - v19 + 1;
      }
      v27.id location = v19;
      if (!v20) {
        goto LABEL_40;
      }
LABEL_27:
      if (!CFStringFindWithOptions(v16, v20, v27, findOptions, &result)) {
        goto LABEL_41;
      }
      uint64_t v28 = objc_msgSend(v14, "selectionForRange:", result.location, result.length);
      int findModel = self->_findModel;
      if (!findModel)
      {
        [(PDFDocument *)self didMatchString:v28];
        int findModel = self->_findModel;
      }
      if ((findModel & 0xFFFFFFFE) == 2)
      {
        objc_msgSend(v14, "selectionForRange:", result.location, result.length);
        uint64_t v30 = (PDFSelection *)objc_claimAutoreleasedReturnValue();
        findInstance = self->_findInstance;
        self->_findInstance = v30;

        goto LABEL_37;
      }
      if (self->_respondsToDidMatchString)
      {
        long long v32 = WeakRetained;
      }
      else
      {
        if (findModel != 1) {
          goto LABEL_37;
        }
        long long v32 = self;
      }
      -[PDFDocument didMatchString:](v32, "didMatchString:", v28, v43);
LABEL_37:
      if (!self->_finding)
      {
        LOBYTE(v22) = 1;
        goto LABEL_48;
      }
      CFIndex v19 = result.length + result.location;
      unsigned int v33 = self->_findModel & 0xFFFFFFFE;

      int v22 = 1;
      if (v33 == 2) {
        goto LABEL_45;
      }
    }
    if (lastFindPageIndex != findPageIndex || (v27.id location = self->_lastFindCharIndex, v27.location == -1)) {
      v27.id location = 0;
    }
    v27.NSUInteger length = result.location - v27.location + 1;
    if (v20) {
      goto LABEL_27;
    }
LABEL_40:
    CFIndex v19 = v43;
    int v22 = v45;
LABEL_41:
    int v45 = v22;
    if (++v46 != v44) {
      continue;
    }
    break;
  }
LABEL_45:
  if (self->_respondsToDidEndPageFind)
  {
    int v34 = (void *)MEMORY[0x263F089F8];
    id v35 = NSDictionary;
    id v36 = [NSNumber numberWithLong:self->_findPageIndex];
    uint64_t v37 = [v35 dictionaryWithObject:v36 forKey:@"PDFDocumentPageIndex"];
    NSUInteger v38 = [v34 notificationWithName:@"PDFDidEndPageFind" object:self userInfo:v37];
    [(PDFDocument *)WeakRetained documentDidEndPageFind:v38];
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v43);
  unsigned int v39 = NSDictionary;
  uint64_t v40 = [NSNumber numberWithLong:self->_findPageIndex];
  int v41 = [v39 dictionaryWithObject:v40 forKey:@"PDFDocumentPageIndex"];
  [v28 postNotificationName:@"PDFDidEndPageFind" object:self userInfo:v41];

LABEL_48:
  CFRelease(v16);
LABEL_49:

  return v22 & 1;
}

- (void)cleanupFind
{
  self->_finding = 0;
  if (self->_findStrings)
  {
    if (self->_respondsToDidEndDocumentFind)
    {
      id v3 = [(PDFDocument *)self delegate];
      id v4 = [MEMORY[0x263F089F8] notificationWithName:@"PDFDidEndDocumentFind" object:self];
      [v3 documentDidEndDocumentFind:v4];
    }
    dispatch_queue_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"PDFDidEndDocumentFind" object:self];

    findStrings = self->_findStrings;
    self->_findStrings = 0;

    self->_findPageIndedouble x = 0;
  }
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:@"pdfDocumentFindNext" object:self];
}

- (void)scheduledFindOnPage:(id)a3
{
  if ([(PDFDocument *)self pageCount]
    && ([(PDFDocument *)self findOnPage],
        findPageIndedouble x = self->_findPageIndex,
        findPageIndex != self->_lastFindPageIndex))
  {
    if ((self->_findOptions & 4) != 0) {
      int64_t v5 = findPageIndex - 1;
    }
    else {
      int64_t v5 = findPageIndex + 1;
    }
    self->_findPageIndedouble x = v5;
    id v7 = [MEMORY[0x263F08A10] defaultQueue];
    uint64_t v6 = [MEMORY[0x263F089F8] notificationWithName:@"pdfDocumentFindNext" object:self];
    [v7 enqueueNotification:v6 postingStyle:1];
  }
  else
  {
    [(PDFDocument *)self cleanupFind];
  }
}

- (id)formData
{
  if ([(PDFDocument *)self isLocked])
  {
    id v3 = 0;
  }
  else
  {
    if (!self->_formDataLoaded)
    {
      id v4 = [[PDFForm alloc] initWithDocument:self];
      formData = self->_formData;
      self->_formData = v4;
    }
    self->_formDataLoaded = 1;
    id v3 = self->_formData;
  }

  return v3;
}

- (void)setFormData:(id)a3
{
}

- (id)annotationsForFieldName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  uint64_t v6 = self->_pages;
  objc_sync_enter(v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_pages;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          uint64_t v13 = objc_msgSend(v12, "annotationsForFieldName:", v4, (void)v15);
          if (v13) {
            [v5 addObjectsFromArray:v13];
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v6);

  return v5;
}

- (__CFDictionary)_createInfoDictionary
{
  uint64_t v2 = [(PDFDocument *)self documentAttributes];
  if (v2)
  {
    CGMutableImageMetadataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      id v4 = [v2 objectForKey:@"Title"];
      if (v4) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00470], v4);
      }
      int64_t v5 = [v2 objectForKey:@"Author"];

      if (v5) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F003A0], v5);
      }
      uint64_t v6 = [v2 objectForKey:@"Creator"];

      if (v6) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F003B8], v6);
      }
      id v7 = [v2 objectForKey:@"Subject"];

      if (v7) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00468], v7);
      }
      uint64_t v8 = [v2 objectForKey:@"Keywords"];

      if (v8)
      {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00430], v8);
      }
    }
  }
  else
  {
    CGMutableImageMetadataRef Mutable = 0;
  }

  return Mutable;
}

- (id)findPageWithCGPDFDictionaryPageRef:(CGPDFDictionary *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = self->_pages;
  objc_sync_enter(v4);
  uint64_t ObjectReference = CGPDFDictionaryGetObjectReference();
  pageDictionaryIndices = self->_pageDictionaryIndices;
  id v7 = [NSNumber numberWithUnsignedLong:ObjectReference];
  uint64_t v8 = [(NSMutableDictionary *)pageDictionaryIndices objectForKey:v7];

  if (v8)
  {
    PageNumberForPageDictionardouble y = [v8 unsignedLongValue];
  }
  else
  {
    PageNumberForPageDictionardouble y = CGPDFDocumentGetPageNumberForPageDictionary();
    if (PageNumberForPageDictionary == -1)
    {
      uint64_t v20 = 0;
      goto LABEL_18;
    }
    unint64_t v10 = self->_pageDictionaryIndices;
    BOOL v11 = [NSNumber numberWithUnsignedLong:PageNumberForPageDictionary];
    id v12 = [NSNumber numberWithUnsignedLong:ObjectReference];
    [(NSMutableDictionary *)v10 setObject:v11 forKey:v12];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = self->_pageIndices;
  uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    uint64_t v16 = PageNumberForPageDictionary - 1;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v18)
        {
          CFIndex v19 = -[NSMutableDictionary objectForKey:](self->_pageIndices, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          if ([v19 unsignedIntegerValue] == v16)
          {
            uint64_t v20 = -[PDFDocument pageAtIndex:](self, "pageAtIndex:", [v18 unsignedIntegerValue]);

            goto LABEL_17;
          }
        }
      }
      uint64_t v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v20 = 0;
LABEL_17:

LABEL_18:
  objc_sync_exit(v4);

  return v20;
}

- (Class)annotationSubclassForType:(id)a3
{
  if (self->_respondsToClassForAnnotationType)
  {
    id v4 = a3;
    int64_t v5 = [(PDFDocument *)self delegate];
    uint64_t v6 = [v5 classForAnnotationType:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (Class)v6;
}

- (BOOL)callShouldReadAKInkAnnotations
{
  if (!self->_respondsToShouldReadAKInkAnnotations) {
    return 0;
  }
  uint64_t v2 = [(PDFDocument *)self delegate];
  char v3 = [v2 shouldReadAKInkAnnotations];

  return v3;
}

- (void)setDocumentHasBurnInAnnotations:(BOOL)a3
{
  self->_documentHasBurnInAnnotations = a3;
}

- (void)setHasPageWithApplicationData:(BOOL)a3
{
  self->_documentHasPageWithApplicationData = a3;
}

- (void)incrementRedactionCount
{
  id obj = self;
  objc_sync_enter(obj);
  ++obj->_documentRedactionCount;
  objc_sync_exit(obj);
}

- (void)decrementRedactionCount
{
  id obj = self;
  objc_sync_enter(obj);
  --obj->_documentRedactionCount;
  objc_sync_exit(obj);
}

- (void)setPageChangeDelegate:(id)a3
{
}

- (BOOL)callDelegateHandleTabFrom:(id)a3 direction:(unint64_t)a4
{
  BOOL respondsToHandleTabFrom = self->_respondsToHandleTabFrom;
  if (self->_respondsToHandleTabFrom)
  {
    p_delegate = &self->_delegate;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    [WeakRetained pdfDocument:self handleTabFrom:v8 direction:a4];
  }
  return respondsToHandleTabFrom;
}

- (void)callDelegateDidReceiveAnalysis:(id)a3 forPage:(id)a4
{
  if (self->_respondsToDidReceiveAnalysis)
  {
    p_delegate = &self->_delegate;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    [WeakRetained pdfDocument:self didReceiveAnalysis:v8 forPage:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncSearchQueue, 0);
  objc_storeStrong((id *)&self->_renderingProperties, 0);
  objc_storeStrong((id *)&self->_akPageOverlayViewProvider, 0);
  objc_destroyWeak((id *)&self->_pdfAKControllerDelegateForDeferredSetup);
  objc_storeStrong((id *)&self->_akDocumentAdaptor, 0);
  objc_storeStrong((id *)&self->_bookmarkedPages, 0);
  objc_storeStrong((id *)&self->_initialBookmarkedPageIndices, 0);
  objc_storeStrong((id *)&self->_appendedAttributes, 0);
  objc_destroyWeak((id *)&self->_pageChangeDelegate);
  objc_storeStrong((id *)&self->_xmpRootPath, 0);
  objc_storeStrong((id *)&self->_xmpPrefix, 0);
  objc_storeStrong((id *)&self->_xmpNameSpace, 0);
  objc_storeStrong((id *)&self->_documentCatalogMetadata, 0);
  objc_storeStrong((id *)&self->_formData, 0);
  objc_storeStrong((id *)&self->_findResults, 0);
  objc_storeStrong((id *)&self->_findInstance, 0);
  objc_storeStrong((id *)&self->_findStrings, 0);
  objc_storeStrong((id *)&self->_formFillingQueue, 0);
  objc_storeStrong((id *)&self->_textExtractionQueue, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);
  objc_storeStrong((id *)&self->_ownerPassword, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_accessibilityPageElements, 0);
  objc_storeStrong((id *)&self->_preloadingPageIndexes, 0);
  objc_storeStrong((id *)&self->_pageDictionaryIndices, 0);
  objc_storeStrong((id *)&self->_pageIndices, 0);
  objc_storeStrong((id *)&self->_pagesOrderedSet, 0);
  objc_storeStrong((id *)&self->_pages, 0);

  objc_storeStrong((id *)&self->_documentURL, 0);
}

@end