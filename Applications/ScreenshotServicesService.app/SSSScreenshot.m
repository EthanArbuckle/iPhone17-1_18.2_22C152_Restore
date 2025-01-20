@interface SSSScreenshot
+ (id)_sanitizedFilenameString:(id)a3;
+ (id)nameForScreenshot:(id)a3;
- (BOOL)_canProvidePDF;
- (BOOL)_elementHasValidPDFData:(id)a3;
- (BOOL)_hasGeneratedPDF;
- (BOOL)_screenshotWasTakenFromScreenshots;
- (BOOL)canAutosaveToFiles;
- (BOOL)canRedoForViewState:(id)a3;
- (BOOL)canUndoForViewState:(id)a3;
- (BOOL)hasEverBeenEditedForMode:(int64_t)a3;
- (BOOL)hasUnsavedImageEdits;
- (BOOL)hasUnsavedPDFEdits;
- (BOOL)isDeleted;
- (BOOL)isPDFRequested;
- (BOOL)isSavingForMode:(int64_t)a3;
- (BOOL)isWaitingForPDF;
- (BOOL)pdfCanBeConvertedToImage;
- (CGRect)visiblePDFRectWhenScreenshotted;
- (Class)classForPage;
- (NSArray)snapUnitRects;
- (NSData)imageModificationData;
- (NSData)pdfData;
- (NSMutableArray)pdfModelModificationInfos;
- (NSMutableArray)pdfViewModificationInfos;
- (NSMutableDictionary)elementPDFValidationDictionary;
- (NSString)filename;
- (NSString)identifier;
- (NSString)imageDescription;
- (NSString)userActivityTitle;
- (NSURL)PDFURL;
- (NSURL)temporaryPDFURL;
- (PDFDocument)PDFDocument;
- (SSEnvironmentDescription)environmentDescription;
- (SSSScreenshot)initWithEnvironmentDescription:(id)a3;
- (SSSScreenshotImageGenerator)imageGenerator;
- (SSSScreenshotImageProvider)imageProvider;
- (SSSScreenshotItemProviderImage)itemProviderImage;
- (SSSScreenshotItemProviderPDF)itemProviderPDF;
- (SSSScreenshotItemProviderPDFAsImage)itemProviderPDFAsImage;
- (SSSScreenshotModificationInfo)modelModificationInfo;
- (SSSScreenshotMutableModificationInfo)viewModificationInfo;
- (SSSScreenshotPDFDocumentGenerator)documentGenerator;
- (SSSScreenshotRepresentation)representation;
- (SSScreenshotAssetManagerRegistrationOptions)registrationOptions;
- (UIImage)backingImage;
- (id)_actionNameForDeletePDFPage;
- (id)_elementDocument;
- (id)_savePDFToTemporaryPathWithData:(id)a3;
- (id)editedPDFDataForShareSheet;
- (id)itemProviderForDragItems;
- (id)loggableDescription;
- (id)modelModificationInfoForState:(id)a3;
- (id)pdfAsImage;
- (id)temporaryPDFFile;
- (id)undoManagerForEditMode:(int64_t)a3;
- (id)viewModificationInfoForState:(id)a3;
- (int64_t)_elementIndexForDocument;
- (int64_t)lastViewEditMode;
- (int64_t)visiblePDFPageWhenScreenshotted;
- (unint64_t)saveLocation;
- (void)_addPageInPDF:(id)a3;
- (void)_deletePageInPDF:(id)a3;
- (void)_harvestPDFIfNecessary;
- (void)_informRepresentationOfUndoStackChange;
- (void)_markAsBeingEditedForMode:(int64_t)a3;
- (void)_markImageAsBeingEdited;
- (void)_markPDFAsBeingEdited;
- (void)_removeSecurityScopedURL:(id)a3;
- (void)_removeURL:(id)a3;
- (void)_setDocumentIsSaving:(BOOL)a3;
- (void)_setModelModificationDictionary:(id)a3;
- (void)_setModelModificationDictionary:(id)a3 createUndoCommand:(BOOL)a4;
- (void)dealloc;
- (void)deletePDFPage:(id)a3;
- (void)didProcessDocumentUpdate;
- (void)insertIntoQuickNoteWithCompletion:(id)a3;
- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4;
- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4 createUndoCommand:(BOOL)a5;
- (void)q_saveEditedPDF;
- (void)redoForViewState:(id)a3;
- (void)removePDF;
- (void)requestImageInTransition:(BOOL)a3 withBlock:(id)a4;
- (void)revertForViewState:(id)a3;
- (void)savePDFWithBlock:(id)a3;
- (void)screenshotMutableModificationInfo:(id)a3 valueChangedForKey:(unint64_t)a4;
- (void)setBackingImage:(id)a3;
- (void)setDocumentGenerator:(id)a3;
- (void)setElementPDFValidationDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageGenerator:(id)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setIsPDFRequested:(BOOL)a3;
- (void)setLastViewEditMode:(int64_t)a3;
- (void)setModelModificationInfo:(id)a3 forState:(id)a4;
- (void)setPDFURL:(id)a3;
- (void)setRepresentation:(id)a3;
- (void)setTemporaryPDFURL:(id)a3;
- (void)setViewModificationInfo:(id)a3 forState:(id)a4;
- (void)undoForViewState:(id)a3;
- (void)wasJustSavedForMode:(int64_t)a3;
@end

@implementation SSSScreenshot

- (SSSScreenshot)initWithEnvironmentDescription:(id)a3
{
  v4 = (SSEnvironmentDescription *)a3;
  v43.receiver = self;
  v43.super_class = (Class)SSSScreenshot;
  v5 = [(SSSScreenshot *)&v43 init];
  environmentDescription = v5->_environmentDescription;
  v5->_environmentDescription = v4;
  v7 = v4;

  v8 = [(SSEnvironmentDescription *)v7 imageSurface];
  uint64_t v9 = +[UIImage ss_imageFromImageSurface:v8];
  backingImage = v5->_backingImage;
  v5->_backingImage = (UIImage *)v9;

  v11 = [[SSSScreenshotModificationInfo alloc] initForScreenshotWithEnvironmentDescription:v7];
  modelModificationInfo = v5->_modelModificationInfo;
  v5->_modelModificationInfo = v11;

  v13 = [(SSSScreenshotModificationInfo *)[SSSScreenshotMutableModificationInfo alloc] initForScreenshotWithEnvironmentDescription:v7];
  viewModificationInfo = v5->_viewModificationInfo;
  v5->_viewModificationInfo = v13;

  v15 = [(SSSScreenshot *)v5 viewModificationInfo];
  [v15 setChangeObserver:v5];

  v16 = [[SSSScreenshotItemProviderImage alloc] initWithScreenshot:v5];
  itemProviderImage = v5->_itemProviderImage;
  v5->_itemProviderImage = v16;

  v18 = [[SSSScreenshotItemProviderPDF alloc] initWithScreenshot:v5];
  itemProviderPDF = v5->_itemProviderPDF;
  v5->_itemProviderPDF = v18;

  v20 = [[SSSScreenshotItemProviderPDFAsImage alloc] initWithScreenshot:v5];
  itemProviderPDFAsImage = v5->_itemProviderPDFAsImage;
  v5->_itemProviderPDFAsImage = v20;

  v22 = [[SSSScreenshotImageProvider alloc] initWithScreenshot:v5];
  imageProvider = v5->_imageProvider;
  v5->_imageProvider = v22;

  [(SSSScreenshot *)v5 _harvestPDFIfNecessary];
  v24 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
  [(NSUndoManager *)v24 setGroupsByEvent:1];
  imageUndoManager = v5->_imageUndoManager;
  v5->_imageUndoManager = v24;
  v26 = v24;

  v27 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
  [(NSUndoManager *)v27 setGroupsByEvent:1];
  pdfUndoManager = v5->_pdfUndoManager;
  v5->_pdfUndoManager = v27;
  v29 = v27;

  v5->_lastViewEditMode = 0;
  v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  elementPDFValidationDictionary = v5->_elementPDFValidationDictionary;
  v5->_elementPDFValidationDictionary = v30;

  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v33 = dispatch_queue_create("com.apple.screenshotservices.pdfSavingQueue", v32);
  pdfSavingQueue = v5->_pdfSavingQueue;
  v5->_pdfSavingQueue = (OS_dispatch_queue *)v33;

  ct_green_tea_logger_create_static();
  switch([(SSSScreenshot *)v5 saveLocation])
  {
    case 0uLL:
      v35 = getCTGreenTeaOsLogHandle();
      v36 = v35;
      if (!v35 || !os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      v42[0] = 0;
      v37 = "Received screen image";
      break;
    case 1uLL:
      v38 = getCTGreenTeaOsLogHandle();
      v36 = v38;
      if (!v38 || !os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      v42[0] = 0;
      v37 = "Received AR image";
      break;
    case 2uLL:
      v39 = getCTGreenTeaOsLogHandle();
      v36 = v39;
      if (!v39 || !os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      v42[0] = 0;
      v37 = "Received game highlights image";
      break;
    case 3uLL:
      v40 = getCTGreenTeaOsLogHandle();
      v36 = v40;
      if (!v40 || !os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      v42[0] = 0;
      v37 = "Received request to save screenshot to quick note";
      break;
    default:
      return v5;
  }
  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, (uint8_t *)v42, 2u);
LABEL_15:

  return v5;
}

- (void)dealloc
{
  savedCropBoxes = self->_savedCropBoxes;
  if (savedCropBoxes) {
    free(savedCropBoxes);
  }
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SSSScreenshot;
  [(SSSScreenshot *)&v5 dealloc];
}

- (void)setBackingImage:(id)a3
{
}

- (UIImage)backingImage
{
  return self->_backingImage;
}

- (void)setViewModificationInfo:(id)a3 forState:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v8 = a3;
  [v8 setChangeObserver:0];
  if (var0) {
    [(NSMutableArray *)self->_pdfViewModificationInfos setObject:v8 atIndexedSubscript:var1];
  }
  else {
    objc_storeStrong((id *)&self->_viewModificationInfo, a3);
  }
  [v8 setChangeObserver:self];
}

- (void)setModelModificationInfo:(id)a3 forState:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v8 = a3;
  id v9 = v8;
  if (var0) {
    [(NSMutableArray *)self->_pdfModelModificationInfos setObject:v8 atIndexedSubscript:var1];
  }
  else {
    objc_storeStrong((id *)&self->_modelModificationInfo, a3);
  }
}

- (id)viewModificationInfoForState:(id)a3
{
  if (a3.var0
    && (pdfViewModificationInfos = self->_pdfViewModificationInfos) != 0
    && (int64_t var1 = a3.var1, (unint64_t)[(NSMutableArray *)pdfViewModificationInfos count] > a3.var1))
  {
    v6 = [(NSMutableArray *)self->_pdfViewModificationInfos objectAtIndexedSubscript:var1];
  }
  else
  {
    v6 = self->_viewModificationInfo;
  }

  return v6;
}

- (id)modelModificationInfoForState:(id)a3
{
  if (a3.var0
    && (pdfModelModificationInfos = self->_pdfModelModificationInfos) != 0
    && (int64_t var1 = a3.var1, (unint64_t)[(NSMutableArray *)pdfModelModificationInfos count] > a3.var1))
  {
    v6 = [(NSMutableArray *)self->_pdfModelModificationInfos objectAtIndexedSubscript:var1];
  }
  else
  {
    v6 = self->_modelModificationInfo;
  }

  return v6;
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4
{
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3 forState:(id)a4 createUndoCommand:(BOOL)a5
{
  BOOL v5 = a5;
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  v10 = -[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", a4.var0, a4.var1);
  id v11 = [v10 copy];

  v12 = -[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", var0, var1);
  id v13 = [v12 mutableCopy];

  v14 = -[SSSScreenshot viewModificationInfoForState:](self, "viewModificationInfoForState:", var0, var1);
  [v13 takeValueFromModificationInfo:v14 forKey:a3];

  if (([v13 isEqual:v11] & 1) == 0)
  {
    if (var0)
    {
      v17[0] = @"modelModificationInfo";
      v17[1] = @"previousModificationInfo";
      v18[0] = v13;
      v18[1] = v11;
      v17[2] = @"page";
      v15 = +[NSNumber numberWithInteger:var1];
      v18[2] = v15;
      v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    }
    else
    {
      v19[0] = @"modelModificationInfo";
      v19[1] = @"previousModificationInfo";
      v20[0] = v13;
      v20[1] = v11;
      v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    }
    [(SSSScreenshot *)self _setModelModificationDictionary:v16 createUndoCommand:v5];
  }
}

- (void)_setModelModificationDictionary:(id)a3
{
}

- (void)_setModelModificationDictionary:(id)a3 createUndoCommand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"modelModificationInfo"];
  id v8 = [v6 objectForKeyedSubscript:@"previousModificationInfo"];
  uint64_t v9 = [v6 objectForKey:@"page"];

  if (v9)
  {
    v10 = [v6 objectForKeyedSubscript:@"page"];
    uint64_t v9 = (int)[v10 intValue];

    v19[0] = @"modelModificationInfo";
    v19[1] = @"previousModificationInfo";
    v20[0] = v8;
    v20[1] = v7;
    void v19[2] = @"page";
    id v11 = +[NSNumber numberWithInteger:v9];
    void v20[2] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    uint64_t v13 = 1;
  }
  else
  {
    v17[0] = @"modelModificationInfo";
    v17[1] = @"previousModificationInfo";
    v18[0] = v8;
    v18[1] = v7;
    v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v13 = 0;
  }
  v14 = [(SSSScreenshot *)self undoManagerForEditMode:v13];
  if (v4)
  {
    [(SSSScreenshot *)self _undoableModelChangePrequel:v14];
    [v14 registerUndoWithTarget:self selector:"_setModelModificationDictionary:" object:v12];
    -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v7, v13, v9);
    id v15 = [v7 mutableCopy];
    -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v15, v13, v9);

    [(SSSScreenshot *)self _undoableModelChangeSequel:v14];
    [(SSSScreenshot *)self _markAsBeingEditedForMode:v13];
LABEL_8:
    [(SSSScreenshot *)self _informRepresentationOfUndoStackChange];
    goto LABEL_9;
  }
  -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v7, v13, v9);
  id v16 = [v7 mutableCopy];
  -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v16, v13, v9);

  [(SSSScreenshot *)self _markAsBeingEditedForMode:v13];
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)screenshotMutableModificationInfo:(id)a3 valueChangedForKey:(unint64_t)a4
{
  id v5 = [(SSSScreenshot *)self representation];
  [v5 screenshotDidHaveViewModificationInfoChanged:self];
}

- (NSData)imageModificationData
{
  v2 = [(SSSScreenshot *)self modelModificationInfo];
  v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:0 error:0];

  return (NSData *)v3;
}

- (unint64_t)saveLocation
{
  v2 = [(SSSScreenshot *)self environmentDescription];
  v3 = [v2 serviceOptions];
  id v4 = [v3 saveLocation];

  return (unint64_t)v4;
}

- (int64_t)_elementIndexForDocument
{
  if (![(SSSScreenshot *)self _screenshotWasTakenFromScreenshots])
  {
    v3 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
    id v4 = [v3 count];

    if (v4)
    {
      unint64_t v5 = 0;
      double v6 = 0.0;
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        id v8 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
        uint64_t v9 = [v8 objectAtIndexedSubscript:v5];

        if (self->_didFinishReceivingDocumentUpdates)
        {
          if (![(SSSScreenshot *)self _elementHasValidPDFData:v9]) {
            goto LABEL_14;
          }
        }
        else
        {
          v10 = [v9 metadata];
          unsigned __int8 v11 = [v10 canGenerateDocument];

          if ((v11 & 1) == 0) {
            goto LABEL_14;
          }
        }
        [v9 rect];
        double v13 = v12;
        [v9 rect];
        double v15 = v14;
        int64_t v16 = v5;
        if (v13 <= v6)
        {
          if (v14 == v6)
          {
            if ([v9 hasKeyboardFocus]) {
              int64_t v16 = v5;
            }
            else {
              int64_t v16 = v7;
            }
            double v15 = v6;
            goto LABEL_15;
          }
LABEL_14:
          double v15 = v6;
          int64_t v16 = v7;
        }
LABEL_15:

        ++v5;
        v17 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
        id v18 = [v17 count];

        uint64_t v7 = v16;
        double v6 = v15;
        if (v5 >= (unint64_t)v18) {
          return v16;
        }
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_elementHasValidPDFData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  double v6 = [v4 document];
  uint64_t v7 = [v6 PDFData];

  if (v7)
  {
    id v8 = [(NSMutableDictionary *)v5->_elementPDFValidationDictionary allKeys];
    unsigned int v9 = [v8 containsObject:v4];

    if (v9)
    {
      id v10 = [(NSMutableDictionary *)v5->_elementPDFValidationDictionary objectForKeyedSubscript:v4];
      LOBYTE(v7) = [v10 BOOLValue];
    }
    else
    {
      id v11 = objc_alloc((Class)PDFDocument);
      double v12 = [v4 document];
      double v13 = [v12 PDFData];
      id v10 = [v11 initWithData:v13];

      if ([v10 pageCount])
      {
        double v14 = [v10 pageAtIndex:0];
        [v14 boundsForBox:1];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;

        v26.origin.x = v16;
        v26.origin.y = v18;
        v26.size.width = v20;
        v26.size.height = v22;
        uint64_t v7 = !CGRectIsEmpty(v26);
      }
      else
      {
        uint64_t v7 = 0;
      }
      elementPDFValidationDictionary = v5->_elementPDFValidationDictionary;
      v24 = +[NSNumber numberWithBool:v7];
      [(NSMutableDictionary *)elementPDFValidationDictionary setObject:v24 forKey:v4];
    }
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)_elementDocument
{
  int64_t v3 = [(SSSScreenshot *)self _elementIndexForDocument];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    int64_t v5 = v3;
    double v6 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
    uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
    id v4 = [v7 document];
  }

  return v4;
}

- (BOOL)_hasGeneratedPDF
{
  v2 = [(SSSScreenshot *)self _elementDocument];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_canProvidePDF
{
  return [(SSSScreenshot *)self _elementIndexForDocument] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWaitingForPDF
{
  unsigned int v3 = [(SSSScreenshot *)self _canProvidePDF];
  id v4 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
  if ([v4 count])
  {
    int64_t v5 = [(SSSScreenshot *)self _elementDocument];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  BOOL result = 0;
  if (v3)
  {
    if (!v6) {
      return self->_isPDFRequested;
    }
  }
  return result;
}

- (void)didProcessDocumentUpdate
{
  p_documentUpdateCount = &self->_documentUpdateCount;
  ++self->_documentUpdateCount;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) metadata];
        unsigned int v11 = [v10 canGenerateDocument];

        v7 += v11;
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (*p_documentUpdateCount == v7)
  {
    self->_didFinishReceivingDocumentUpdates = 1;
  }
  else if (*p_documentUpdateCount > v7)
  {
    self->_didFinishReceivingDocumentUpdates = 1;
    double v12 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10005EF7C(p_documentUpdateCount, v7, v12);
    }
  }
}

- (NSData)pdfData
{
  if ([(SSSScreenshot *)self _hasGeneratedPDF])
  {
    unsigned int v3 = [(SSSScreenshot *)self _elementDocument];
    id v4 = [v3 PDFData];
  }
  else
  {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (int64_t)visiblePDFPageWhenScreenshotted
{
  if (![(SSSScreenshot *)self _hasGeneratedPDF]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v3 = [(SSSScreenshot *)self _elementDocument];
  id v4 = [v3 PDFPage];

  return (int64_t)v4;
}

- (CGRect)visiblePDFRectWhenScreenshotted
{
  if ([(SSSScreenshot *)self _hasGeneratedPDF])
  {
    unsigned int v3 = [(SSSScreenshot *)self _elementDocument];
    [v3 PDFVisibleRect];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_screenshotWasTakenFromScreenshots
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = [v6 bundleIdentifier];
        if (!v7 && ![v6 isAppLauncher])
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_markImageAsBeingEdited
{
  self->_imageHasEverBeenEdited = 1;
  self->_imageHasUnsavedEdits = 1;
}

- (void)_markPDFAsBeingEdited
{
  self->_pdfHasEverBeenEdited = 1;
  self->_pdfHasUnsavedEdits = 1;
}

- (void)_markAsBeingEditedForMode:(int64_t)a3
{
  if (a3)
  {
    [(SSSScreenshot *)self _markPDFAsBeingEdited];
  }
  else
  {
    uint64_t v4 = +[NSUserActivity _currentUserActivityUUID];
    id v5 = v4;
    if (v4 && !self->_imageHasEverBeenEdited)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001947C;
      v6[3] = &unk_100099E78;
      id v7 = v4;
      double v8 = self;
      +[NSUserActivity _fetchUserActivityWithUUID:v7 completionHandler:v6];
    }
    else
    {
      [(SSSScreenshot *)self _markImageAsBeingEdited];
    }
  }
}

- (BOOL)hasUnsavedImageEdits
{
  return self->_imageHasUnsavedEdits;
}

- (BOOL)hasUnsavedPDFEdits
{
  return self->_pdfHasUnsavedEdits;
}

- (BOOL)hasEverBeenEditedForMode:(int64_t)a3
{
  uint64_t v3 = 42;
  if (a3) {
    uint64_t v3 = 43;
  }
  return *((unsigned char *)&self->super.isa + v3);
}

- (BOOL)isSavingForMode:(int64_t)a3
{
  uint64_t v3 = 44;
  if (a3) {
    uint64_t v3 = 45;
  }
  return *((unsigned char *)&self->super.isa + v3);
}

- (void)wasJustSavedForMode:(int64_t)a3
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 41;
  }
  *((unsigned char *)&self->super.isa + v3) = 0;
}

- (void)_informRepresentationOfUndoStackChange
{
  id v3 = [(SSSScreenshot *)self representation];
  [v3 screenshotDidHaveUndoStackChanged:self];
}

- (BOOL)canUndoForViewState:(id)a3
{
  id v3 = -[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1);
  unsigned __int8 v4 = [v3 canUndo];

  return v4;
}

- (BOOL)canRedoForViewState:(id)a3
{
  id v3 = -[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1);
  unsigned __int8 v4 = [v3 canRedo];

  return v4;
}

- (void)undoForViewState:(id)a3
{
  unsigned __int8 v4 = -[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1);
  [v4 undo];

  [(SSSScreenshot *)self _informRepresentationOfUndoStackChange];
}

- (void)revertForViewState:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  double v6 = [SSSScreenshotModificationInfo alloc];
  id v7 = [(SSSScreenshot *)self environmentDescription];
  id v8 = [(SSSScreenshotModificationInfo *)v6 initForScreenshotWithEnvironmentDescription:v7];
  -[SSSScreenshot setModelModificationInfo:forState:](self, "setModelModificationInfo:forState:", v8, var0, var1);

  long long v9 = [SSSScreenshotMutableModificationInfo alloc];
  long long v10 = [(SSSScreenshot *)self environmentDescription];
  id v11 = [(SSSScreenshotModificationInfo *)v9 initForScreenshotWithEnvironmentDescription:v10];
  -[SSSScreenshot setViewModificationInfo:forState:](self, "setViewModificationInfo:forState:", v11, var0, var1);

  long long v12 = [(SSSScreenshot *)self undoManagerForEditMode:var0];
  [v12 removeAllActions];

  id v13 = [(SSSScreenshot *)self representation];
  [v13 screenshotDidRevert:self];
}

- (void)redoForViewState:(id)a3
{
  unsigned __int8 v4 = -[SSSScreenshot undoManagerForEditMode:](self, "undoManagerForEditMode:", a3.var0, a3.var1);
  [v4 redo];

  [(SSSScreenshot *)self _informRepresentationOfUndoStackChange];
}

- (id)undoManagerForEditMode:(int64_t)a3
{
  uint64_t v3 = 56;
  if (!a3) {
    uint64_t v3 = 48;
  }
  id v4 = *(id *)((char *)&self->super.isa + v3);

  return v4;
}

- (void)requestImageInTransition:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  self->_imageIsSaving = 1;
  id v7 = [(SSSScreenshot *)self imageProvider];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001991C;
  v9[3] = &unk_100099EA0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 requestOutputImageInTransition:v4 forSaving:v9];
}

- (SSScreenshotAssetManagerRegistrationOptions)registrationOptions
{
  id v3 = objc_alloc_init((Class)SSScreenshotAssetManagerRegistrationOptions);
  BOOL v4 = [(SSSScreenshot *)self environmentDescription];
  id v5 = [v4 serviceOptions];
  [v3 setSaveLocation:[v5 saveLocation]];

  id v6 = [(SSSScreenshot *)self environmentDescription];
  id v7 = [v6 serviceOptions];
  id v8 = [v7 assetMetadata];
  [v3 setAssetMetadata:v8];

  long long v9 = [(SSSScreenshot *)self environmentDescription];
  id v10 = [v9 harvestedMetadata];
  [v3 setHarvestedMetadata:v10];

  return (SSScreenshotAssetManagerRegistrationOptions *)v3;
}

- (NSString)imageDescription
{
  v2 = [(SSSScreenshot *)self modelModificationInfo];
  id v3 = [v2 imageDescription];

  return (NSString *)v3;
}

+ (id)nameForScreenshot:(id)a3
{
  id v3 = a3;
  CGFloat v22 = +[NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:0];
  id v21 = objc_alloc_init((Class)NSDateFormatter);
  [v21 setDateFormat:v22];
  BOOL v4 = [v3 environmentDescription];

  id v5 = [v4 date];

  id v6 = [v21 stringFromDate:v5];
  id v7 = +[NSDateFormatter localizedStringFromDate:v5 dateStyle:0 timeStyle:2];
  id v8 = +[NSBundle mainBundle];
  long long v9 = [v8 localizedStringForKey:@"SCREENSHOT_SAVE_FILE_NAME" value:@"Screenshot" table:0];

  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"SCREENSHOT_SAVE_FILE_DATE_DELIMITER" value:@"-" table:0];

  long long v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"SCREENSHOT_SAVE_FILE_TIME_DELIMITER" value:@"." table:0];

  double v14 = +[NSBundle mainBundle];
  double v15 = [v14 localizedStringForKey:@"SCREENSHOT_SAVE_FILE_FORMAT" value:@"%@ %@ at %@" table:0];

  long long v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9, v6, v7);
  double v17 = [v16 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  CGFloat v18 = [v17 stringByReplacingOccurrencesOfString:@"-" withString:v11];

  double v19 = [v18 stringByReplacingOccurrencesOfString:@":" withString:v13];

  return v19;
}

- (NSString)filename
{
  uint64_t v3 = [(SSSScreenshot *)self userActivityTitle];
  if (!v3) {
    goto LABEL_5;
  }
  BOOL v4 = (void *)v3;
  id v5 = +[SSSScreenshot _sanitizedFilenameString:v3];

  if (![v5 length]
    || (+[NSURL fileURLWithPath:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {

LABEL_5:
    id v5 = 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(SSSScreenshot *)self environmentDescription];
  id v8 = [v7 elements];

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) bundleIdentifier];
        unsigned int v14 = [v13 isEqual:@"com.apple.MobileSMS"];

        if (v14)
        {

          goto LABEL_17;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v5)
  {
    id v15 = v5;
  }
  else
  {
LABEL_17:
    id v15 = +[SSSScreenshot nameForScreenshot:self];
  }
  long long v16 = v15;

  return (NSString *)v16;
}

+ (id)_sanitizedFilenameString:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if ([v3 length])
  {
    id v5 = v3;
    if ((unint64_t)[v3 length] >= 0x81)
    {
      id v5 = [v3 substringToIndex:128];
    }
    id v6 = +[NSCharacterSet characterSetWithCharactersInString:@"///\\?%*|\"<>:"];
    id v7 = v5;
    id v8 = [v7 rangeOfCharacterFromSet:v6];
    if (v8 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v11 = v8;
      uint64_t v12 = v9;
      id v10 = 0;
      do
      {
        if (!v10) {
          id v10 = [v7 mutableCopy];
        }
        [v10 replaceCharactersInRange:v11 withString:v12];
        uint64_t v11 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v6, 2, v11, (unsigned char *)objc_msgSend(v10, "length") - v11);
        uint64_t v12 = v13;
      }
      while (v11 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL);
    }
    if (v10) {
      unsigned int v14 = v10;
    }
    else {
      unsigned int v14 = v7;
    }
    id v15 = v14;

    long long v16 = +[NSCharacterSet characterSetWithCharactersInString:@"."];
    id v17 = [v16 mutableCopy];

    long long v18 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    [v17 formUnionWithCharacterSet:v18];

    BOOL v4 = [v15 stringByTrimmingCharactersInSet:v17];
  }

  return v4;
}

- (NSString)userActivityTitle
{
  id v3 = [(SSSScreenshot *)self environmentDescription];
  BOOL v4 = [v3 elements];

  int64_t v5 = [(SSSScreenshot *)self _elementIndexForDocument];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) metadata:v15];
        uint64_t v12 = [v11 userActivityTitle];

        if (v12) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v6 = [v4 objectAtIndexedSubscript:v5];
    uint64_t v13 = [v6 metadata];
    uint64_t v12 = [v13 userActivityTitle];
  }

  return (NSString *)v12;
}

- (NSArray)snapUnitRects
{
  id v3 = +[NSMutableArray array];
  BOOL v4 = [(SSSScreenshot *)self environmentDescription];
  [v4 imagePointSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v9 = [(SSSScreenshot *)self environmentDescription];
  uint64_t v10 = [v9 elements];

  id obj = v10;
  id v35 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v12 rect];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10001A660;
        v40[3] = &unk_100099EC0;
        v40[4] = v6;
        v40[5] = v8;
        long long v21 = objc_retainBlock(v40);
        ((void (*)(double, double, double, double))v21[2])(v14, v16, v18, v20);
        CGFloat v22 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
        [v3 addObject:v22];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v23 = [v12 metadata];
        v24 = [v23 contentRects];

        id v25 = [v24 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v37;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v37 != v27) {
                objc_enumerationMutation(v24);
              }
              [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) CGRectValue];
              ((void (*)(void *, double, double))v21[2])(v21, v14 + v29, v16 + v30);
              v31 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
              [v3 addObject:v31];
            }
            id v26 = [v24 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v26);
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v35);
  }

  return (NSArray *)v3;
}

- (PDFDocument)PDFDocument
{
  id v3 = [(SSSScreenshot *)self documentGenerator];

  if (!v3) {
    goto LABEL_3;
  }
  BOOL v4 = [(SSSScreenshot *)self documentGenerator];
  uint64_t v5 = [(SSSScreenshot *)self pdfData];
  uint64_t v6 = [v4 documentFromPDFData:v5];

  if (!v6)
  {
LABEL_3:
    pdfDocument = self->_pdfDocument;
    if (!pdfDocument)
    {
      id v8 = objc_alloc((Class)PDFDocument);
      uint64_t v9 = [(SSSScreenshot *)self pdfData];
      uint64_t v10 = (PDFDocument *)[v8 initWithData:v9];

      [(PDFDocument *)v10 setDelegate:self];
      uint64_t v11 = self->_pdfDocument;
      self->_pdfDocument = v10;

      pdfDocument = self->_pdfDocument;
    }
    uint64_t v6 = pdfDocument;
  }

  return v6;
}

- (void)_harvestPDFIfNecessary
{
  id v3 = [(SSEnvironmentDescription *)self->_environmentDescription elements];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(SSSScreenshot *)self pdfData];
    if (!v5) {
      goto LABEL_9;
    }
    id v21 = v5;
    uint64_t v6 = +[NSMutableArray array];
    uint64_t v7 = +[NSMutableArray array];
    id v8 = [(SSSScreenshot *)self PDFDocument];
    uint64_t v9 = (uint64_t)[v8 pageCount];
    if (v9 >= 1)
    {
      uint64_t v10 = v9;
      do
      {
        id v11 = [[SSSScreenshotModificationInfo alloc] initForScreenshotWithEnvironmentDescription:self->_environmentDescription];
        id v12 = [(SSSScreenshotModificationInfo *)[SSSScreenshotMutableModificationInfo alloc] initForScreenshotWithEnvironmentDescription:self->_environmentDescription];
        [v12 setChangeObserver:self];
        [(NSMutableArray *)v6 addObject:v11];
        [(NSMutableArray *)v7 addObject:v12];

        --v10;
      }
      while (v10);
    }
    pdfModelModificationInfos = self->_pdfModelModificationInfos;
    self->_pdfModelModificationInfos = v6;
    double v14 = v6;

    pdfViewModificationInfos = self->_pdfViewModificationInfos;
    self->_pdfViewModificationInfos = v7;

    double v16 = [(SSSScreenshot *)self representation];
    [v16 screenshotDidReceivePDFData];
  }
  else
  {
    id v17 = [[SSSScreenshotModificationInfo alloc] initForScreenshotWithEnvironmentDescription:self->_environmentDescription];
    double v18 = +[NSMutableArray arrayWithObject:v17];
    double v19 = self->_pdfModelModificationInfos;
    self->_pdfModelModificationInfos = v18;

    id v21 = [(SSSScreenshotModificationInfo *)[SSSScreenshotMutableModificationInfo alloc] initForScreenshotWithEnvironmentDescription:self->_environmentDescription];
    +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:");
    double v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_pdfViewModificationInfos;
    self->_pdfViewModificationInfos = v20;
  }

  uint64_t v5 = v21;
LABEL_9:
}

- (void)removePDF
{
  id v3 = [(SSSScreenshot *)self PDFURL];

  if (v3)
  {
    id v4 = [(SSSScreenshot *)self PDFURL];
    [(SSSScreenshot *)self _removeSecurityScopedURL:v4];

    [(SSSScreenshot *)self setPDFURL:0];
  }
  uint64_t v5 = [(SSSScreenshot *)self temporaryPDFURL];

  if (v5)
  {
    uint64_t v6 = [(SSSScreenshot *)self temporaryPDFURL];
    [(SSSScreenshot *)self _removeURL:v6];

    [(SSSScreenshot *)self setTemporaryPDFURL:0];
  }
}

- (void)_removeURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v12 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v12];
  id v6 = v12;
  uint64_t v7 = v6;
  if (v6 || (v5 & 1) == 0)
  {
    NSErrorDomain v8 = [v6 domain];
    NSErrorDomain v9 = v8;
    if (v8 == NSCocoaErrorDomain)
    {
      id v10 = [v7 code];

      if (v10 == (id)4)
      {
        id v11 = os_log_create("com.apple.screenshotservices", "PDF");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10005F0A0();
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v11 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10005F114();
    }
LABEL_10:
  }
}

- (void)_removeSecurityScopedURL:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [v5 startAccessingSecurityScopedResource];
  [(SSSScreenshot *)self _removeURL:v5];
  if (v4) {
    [v5 stopAccessingSecurityScopedResource];
  }
}

- (void)savePDFWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  uint64_t v5 = [(SSSScreenshot *)self PDFDocument];
  if (v5 && (id v6 = (void *)v5, v7 = [(SSSScreenshot *)self isDeleted], v6, (v7 & 1) == 0))
  {
    self->_pdfIsSaving = 1;
    objc_initWeak(&location, self);
    pdfSavingQueue = self->_pdfSavingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001ACC0;
    block[3] = &unk_100099EE8;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    dispatch_async(pdfSavingQueue, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (id)editedPDFDataForShareSheet
{
  id v3 = [(SSSScreenshot *)self PDFDocument];

  if (v3)
  {
    [(SSSScreenshot *)self _setDocumentIsSaving:1];
    unsigned int v4 = [(SSSScreenshot *)self PDFDocument];
    id v3 = [v4 dataRepresentation];

    [(SSSScreenshot *)self _setDocumentIsSaving:0];
  }

  return v3;
}

- (id)temporaryPDFFile
{
  id v3 = [(SSSScreenshot *)self editedPDFDataForShareSheet];
  if (v3)
  {
    unsigned int v4 = [(SSSScreenshot *)self _savePDFToTemporaryPathWithData:v3];
    [(SSSScreenshot *)self setTemporaryPDFURL:v4];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)_savePDFToTemporaryPathWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSSScreenshot *)self filename];
  id v6 = [v5 stringByAppendingPathExtension:@"pdf"];

  if (!v6)
  {
    unsigned __int8 v7 = os_log_create("com.apple.screenshotservices", "Saving");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_10005F198(self, v7);
    }

    NSErrorDomain v8 = +[SSSScreenshot nameForScreenshot:self];
    id v6 = [v8 stringByAppendingPathExtension:@"pdf"];
  }
  NSErrorDomain v9 = NSTemporaryDirectory();
  id v10 = +[NSURL fileURLWithPath:v9];
  id v11 = [v10 URLByAppendingPathComponent:v6];

  id v19 = 0;
  unsigned int v12 = [v4 writeToURL:v11 options:1 error:&v19];

  id v13 = v19;
  double v14 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v18 = @"Could not save";
    *(_DWORD *)buf = 138412802;
    if (v12) {
      CFStringRef v18 = @"Saved";
    }
    CFStringRef v21 = v18;
    __int16 v22 = 2112;
    v23 = v11;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@ PDF to %@ (%@)", buf, 0x20u);
  }

  if (v12) {
    double v15 = v11;
  }
  else {
    double v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (void)q_saveEditedPDF
{
  id v3 = [(SSSScreenshot *)self PDFDocument];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B4FC;
    block[3] = &unk_100099A20;
    void block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    id v4 = [(SSSScreenshot *)self PDFDocument];
    uint64_t v5 = [v4 dataRepresentation];

    id v6 = os_log_create("com.apple.screenshotservices", "PDF");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10005F2B0(v5, v6);
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001B508;
    v37[3] = &unk_100099A20;
    v37[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v37);

    if (v5)
    {
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 0;
      unsigned __int8 v7 = [(SSSScreenshot *)self PDFURL];
      NSErrorDomain v8 = v7;
      if (v7)
      {
        unsigned int v9 = [v7 startAccessingSecurityScopedResource];
        id v10 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10001B514;
        v29[3] = &unk_100099F10;
        v31 = &v33;
        id v32 = 0;
        id v30 = v5;
        [v10 coordinateWritingItemAtURL:v8 options:0 error:&v32 byAccessor:v29];
        id v11 = v32;
        if (v9) {
          [v8 stopAccessingSecurityScopedResource];
        }
        unsigned int v12 = os_log_create("com.apple.screenshotservices", "PDF");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_10005F23C();
        }
      }
      if (*((unsigned char *)v34 + 24))
      {
        id v13 = v8;
      }
      else
      {
        id v13 = [(SSSScreenshot *)self _savePDFToTemporaryPathWithData:v5];

        if (v13)
        {
          double v14 = +[NSFileManager defaultManager];
          id v28 = 0;
          double v15 = [v14 _doc_importItemAtURL:v13 toDestination:1 error:&v28];
          id v16 = v28;

          objc_initWeak(&location, self);
          double v20 = _NSConcreteStackBlock;
          uint64_t v21 = 3221225472;
          __int16 v22 = sub_10001B64C;
          v23 = &unk_100099F38;
          objc_copyWeak(&v26, &location);
          id v17 = v15;
          id v24 = v17;
          id v18 = v16;
          id v25 = v18;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v20);

          id v19 = +[NSFileManager defaultManager];
          [v19 removeItemAtURL:v13 error:0];

          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
      }

      _Block_object_dispose(&v33, 8);
    }
  }
}

- (void)_setDocumentIsSaving:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v5 = [(SSSScreenshot *)self PDFDocument];

    if (v5)
    {
      if (v3 && !self->_savedCropBoxes)
      {
        id v6 = [(SSSScreenshot *)self PDFDocument];
        self->_savedCropBoxes = (CGRect *)malloc_type_calloc((size_t)[v6 pageCount], 0x20uLL, 0x1000040E0EAB150uLL);
      }
      unsigned __int8 v7 = [(SSSScreenshot *)self PDFDocument];
      id v8 = [v7 pageCount];

      if (v8)
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        do
        {
          id v11 = [(SSSScreenshot *)self PDFDocument];
          unsigned int v12 = [v11 pageAtIndex:v10];

          id v13 = v12;
          if (objc_opt_respondsToSelector()) {
            [v13 setIsSaving:v3];
          }
          savedCropBoxes = self->_savedCropBoxes;
          if (v3)
          {
            [v13 boundsForBox:1];
            p_CGFloat x = (void *)&savedCropBoxes[v9].origin.x;
            *p_CGFloat x = v16;
            p_x[1] = v17;
            p_x[2] = v18;
            p_x[3] = v19;
            [v13 boundsForBox:0];
            double v21 = v20;
            double v23 = v22;
            id v24 = [(NSMutableArray *)self->_pdfModelModificationInfos objectAtIndexedSubscript:v10];
            id v25 = v24;
            if (v24)
            {
              [v24 cropInfo];
              double v27 = *((double *)&v40 + 1);
              double v26 = *(double *)&v40;
              double v28 = *((double *)&v41 + 1);
              double v29 = *(double *)&v41;
              [v25 cropInfo];
              double v30 = *((double *)&v36 + 1);
              double v31 = *(double *)&v36;
            }
            else
            {
              long long v40 = 0u;
              long long v41 = 0u;
              double v30 = 0.0;
              long long v38 = 0u;
              long long v39 = 0u;
              double v31 = 0.0;
              double v28 = 0.0;
              double v29 = 0.0;
              long long v36 = 0u;
              long long v37 = 0u;
              double v27 = 0.0;
              double v26 = 0.0;
            }
            v42.origin.CGFloat y = v23 * v27 / v30;
            CGFloat v32 = v23 * v28 / v30;
            v42.origin.CGFloat x = v21 * v26 / v31;
            v42.size.CGFloat width = v21 * v29 / v31;
            v42.size.CGFloat height = v32;
            [v13 setBounds:1 forBox:v42.origin.x, v23 - CGRectGetMaxY(v42), v42.size.width, v32];
          }
          else
          {
            [v13 setBounds:1 forBox:savedCropBoxes[v9].origin.x, savedCropBoxes[v9].origin.y, savedCropBoxes[v9].size.width, savedCropBoxes[v9].size.height];
          }

          ++v10;
          uint64_t v33 = [(SSSScreenshot *)self PDFDocument];
          id v34 = [v33 pageCount];

          ++v9;
        }
        while ((unint64_t)v34 > v10);
      }
      if (!v3)
      {
        uint64_t v35 = self->_savedCropBoxes;
        if (v35)
        {
          free(v35);
          self->_savedCropBoxes = 0;
        }
      }
    }
  }
}

- (BOOL)canAutosaveToFiles
{
  v2 = [(SSSScreenshot *)self environmentDescription];
  unsigned __int8 v3 = [v2 canAutosaveToFiles];

  return v3;
}

- (BOOL)pdfCanBeConvertedToImage
{
  v2 = [(SSSScreenshot *)self PDFDocument];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    id v4 = [v2 pageCount];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = 0;
      double v7 = 0.0;
      double v8 = 0.0;
      while (1)
      {
        uint64_t v9 = [v3 pageAtIndex:v6];
        [v9 boundsForBox:1];
        double v11 = v10;
        double v13 = v12;
        double v14 = +[UIScreen mainScreen];
        [v14 scale];
        double v16 = v11 * v15;
        uint64_t v17 = +[UIScreen mainScreen];
        [v17 scale];
        double v19 = v13 * v18;

        double v7 = v7 + v19;
        double v8 = fmax(v8, v16);
        double v20 = v8 * v7;
        if (v8 * v7 > 50000000.0) {
          break;
        }

        if (v5 == (id)++v6) {
          goto LABEL_9;
        }
      }
      double v22 = os_log_create("com.apple.screenshotservices", "Screenshot");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 67110144;
        int v25 = 0;
        __int16 v26 = 2048;
        double v27 = v7;
        __int16 v28 = 2048;
        double v29 = v8;
        __int16 v30 = 2048;
        double v31 = v8 * v7;
        __int16 v32 = 2048;
        uint64_t v33 = 0x4187D78400000000;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "PDF to Image: canBeConverted: %u, partialHeight: %f, maxWidth: %f, size: %f, limit: %f", (uint8_t *)&v24, 0x30u);
      }

      BOOL v21 = 0;
    }
    else
    {
      double v20 = 0.0;
      double v8 = 0.0;
      double v7 = 0.0;
LABEL_9:
      uint64_t v9 = os_log_create("com.apple.screenshotservices", "Screenshot");
      BOOL v21 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v24 = 67110144;
        int v25 = 1;
        __int16 v26 = 2048;
        double v27 = v7;
        __int16 v28 = 2048;
        double v29 = v8;
        __int16 v30 = 2048;
        double v31 = v20;
        __int16 v32 = 2048;
        uint64_t v33 = 0x4187D78400000000;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PDF to Image: canBeConverted: %u, totalHeight: %f, maxWidth: %f, size: %f, limit: %f", (uint8_t *)&v24, 0x30u);
      }
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)pdfAsImage
{
  v2 = [(SSSScreenshot *)self PDFDocument];
  unsigned __int8 v3 = [v2 asImage];

  return v3;
}

- (Class)classForPage
{
  return (Class)objc_opt_class();
}

- (void)deletePDFPage:(id)a3
{
  id v9 = a3;
  id v4 = [(SSSScreenshot *)self PDFDocument];

  if (v4)
  {
    id v5 = [(SSSScreenshot *)self representation];
    id v6 = [v5 screenshotPDFPageIndex:v9];

    double v7 = -[SSSScreenshot modelModificationInfoForState:](self, "modelModificationInfoForState:", 1, v6);
    id v8 = +[SSSPDFPageUndoObject newPageUndoObjectWithPDFPage:v9 index:v6 modificationInfo:v7];
    [(SSSScreenshot *)self _deletePageInPDF:v8];
  }
}

- (id)_actionNameForDeletePDFPage
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"DELETE_PDF_PAGE" value:@"Delete Page" table:0];

  return v3;
}

- (void)_deletePageInPDF:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 index];
  id v6 = [(SSSScreenshot *)self representation];
  [v6 screenshotDeletePDFPage:v5];

  id v10 = [(SSSScreenshot *)self undoManagerForEditMode:1];
  double v7 = [(SSSScreenshot *)self _actionNameForDeletePDFPage];
  [v10 setActionName:v7];

  [v10 registerUndoWithTarget:self selector:"_addPageInPDF:" object:v4];
  [(NSMutableArray *)self->_pdfModelModificationInfos removeObjectAtIndex:v5];
  [(NSMutableArray *)self->_pdfViewModificationInfos removeObjectAtIndex:v5];
  if (v5) {
    id v8 = v5 - 1;
  }
  else {
    id v8 = 0;
  }
  id v9 = [(SSSScreenshot *)self representation];
  [v9 screenshotShouldJumpToPDFPageIndex:v8];
}

- (void)_addPageInPDF:(id)a3
{
  id v4 = a3;
  id v5 = [v4 index];
  id v13 = [v4 modificationInfo];
  id v6 = [(SSSScreenshot *)self representation];
  double v7 = [v4 page];
  [v6 screenshotInsertPDFPage:v7 pageIndex:[v4 index]];

  id v8 = [(SSSScreenshot *)self undoManagerForEditMode:1];
  id v9 = [(SSSScreenshot *)self _actionNameForDeletePDFPage];
  [v8 setActionName:v9];

  [v8 registerUndoWithTarget:self selector:"_deletePageInPDF:" object:v4];
  [(NSMutableArray *)self->_pdfModelModificationInfos insertObject:v13 atIndex:v5];
  pdfViewModificationInfos = self->_pdfViewModificationInfos;
  id v11 = [v13 mutableCopy];
  [(NSMutableArray *)pdfViewModificationInfos insertObject:v11 atIndex:v5];

  double v12 = [(SSSScreenshot *)self representation];
  [v12 screenshotShouldJumpToPDFPageIndex:v5];
}

- (id)itemProviderForDragItems
{
  id v3 = objc_alloc_init((Class)NSItemProvider);
  if ([(SSSScreenshot *)self lastViewEditMode])
  {
    id v4 = [UTTypePDF identifier];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001C260;
    v13[3] = &unk_100099F88;
    v13[4] = self;
    [v3 registerDataRepresentationForTypeIdentifier:v4 visibility:0 loadHandler:v13];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001C19C;
    v14[3] = &unk_100099F60;
    v14[4] = self;
    [v3 registerObjectOfClass:objc_opt_class() visibility:0 loadHandler:v14];
  }
  id v5 = [(SSSScreenshot *)self filename];
  [v3 setSuggestedName:v5];

  id v6 = [(SSSScreenshot *)self modelModificationInfo];
  double v7 = v6;
  if (v6)
  {
    [v6 cropInfo];
    double v8 = v12;
    double v9 = v11;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
  }

  [v3 setPreferredPresentationSize:v9, v8];

  return v3;
}

- (id)loggableDescription
{
  id v3 = +[NSMutableString string];
  id v4 = [(SSSScreenshot *)self modelModificationInfo];
  id v5 = v4;
  if (v4)
  {
    [v4 cropInfo];
    uint64_t v7 = v24;
    uint64_t v6 = v23;
    uint64_t v9 = v26;
    uint64_t v8 = v25;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  id v10 = NSStringFromCGRect(*(CGRect *)&v6);
  double v11 = +[NSString stringWithFormat:@"image crop: %@ ", v10];
  [v3 appendString:v11];

  double v12 = [(SSSScreenshot *)self modelModificationInfo];
  id v13 = [v12 annotations];
  double v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"image # of annotations: %lu ", [v13 count]);
  [v3 appendString:v14];

  double v15 = [(SSSScreenshot *)self modelModificationInfo];
  [v15 vellumOpacity];
  uint64_t v17 = +[NSString stringWithFormat:@"image vellum opacity: %f ", v16];
  [v3 appendString:v17];

  double v18 = [(SSSScreenshot *)self pdfData];

  if (v18)
  {
    double v19 = [(SSSScreenshot *)self PDFDocument];
    double v20 = [(SSSScreenshot *)self PDFDocument];
    BOOL v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"PDF %@ available with %lu pages", v19, [v20 pageCount]);
    [v3 appendString:v21];
  }
  else
  {
    [v3 appendString:@"No PDFData available"];
  }

  return v3;
}

- (void)insertIntoQuickNoteWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_linkContextClient)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v5 = (void *)qword_1000B5770;
    uint64_t v18 = qword_1000B5770;
    if (!qword_1000B5770)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_10001CB44;
      location[3] = &unk_100099928;
      location[4] = &v15;
      sub_10001CB44((uint64_t)location);
      id v5 = (void *)v16[3];
    }
    uint64_t v6 = v5;
    _Block_object_dispose(&v15, 8);
    uint64_t v7 = (SYLinkContextClient *)objc_alloc_init(v6);
    linkContextClient = self->_linkContextClient;
    self->_linkContextClient = v7;
  }
  objc_initWeak(location, self);
  pdfSavingQueue = self->_pdfSavingQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C668;
  v11[3] = &unk_100099BF8;
  objc_copyWeak(&v13, location);
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(pdfSavingQueue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(location);
}

- (SSSScreenshotRepresentation)representation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representation);

  return (SSSScreenshotRepresentation *)WeakRetained;
}

- (void)setRepresentation:(id)a3
{
}

- (SSSScreenshotImageGenerator)imageGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageGenerator);

  return (SSSScreenshotImageGenerator *)WeakRetained;
}

- (void)setImageGenerator:(id)a3
{
}

- (SSSScreenshotPDFDocumentGenerator)documentGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentGenerator);

  return (SSSScreenshotPDFDocumentGenerator *)WeakRetained;
}

- (void)setDocumentGenerator:(id)a3
{
}

- (SSEnvironmentDescription)environmentDescription
{
  return self->_environmentDescription;
}

- (SSSScreenshotModificationInfo)modelModificationInfo
{
  return self->_modelModificationInfo;
}

- (SSSScreenshotMutableModificationInfo)viewModificationInfo
{
  return self->_viewModificationInfo;
}

- (SSSScreenshotImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (SSSScreenshotItemProviderImage)itemProviderImage
{
  return self->_itemProviderImage;
}

- (SSSScreenshotItemProviderPDF)itemProviderPDF
{
  return self->_itemProviderPDF;
}

- (SSSScreenshotItemProviderPDFAsImage)itemProviderPDFAsImage
{
  return self->_itemProviderPDFAsImage;
}

- (BOOL)isPDFRequested
{
  return self->_isPDFRequested;
}

- (void)setIsPDFRequested:(BOOL)a3
{
  self->_isPDFRequested = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)lastViewEditMode
{
  return self->_lastViewEditMode;
}

- (void)setLastViewEditMode:(int64_t)a3
{
  self->_lastViewEditMode = a3;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (NSMutableArray)pdfModelModificationInfos
{
  return self->_pdfModelModificationInfos;
}

- (NSMutableArray)pdfViewModificationInfos
{
  return self->_pdfViewModificationInfos;
}

- (NSURL)PDFURL
{
  return self->_PDFURL;
}

- (void)setPDFURL:(id)a3
{
}

- (NSURL)temporaryPDFURL
{
  return self->_temporaryPDFURL;
}

- (void)setTemporaryPDFURL:(id)a3
{
}

- (NSMutableDictionary)elementPDFValidationDictionary
{
  return self->_elementPDFValidationDictionary;
}

- (void)setElementPDFValidationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementPDFValidationDictionary, 0);
  objc_storeStrong((id *)&self->_temporaryPDFURL, 0);
  objc_storeStrong((id *)&self->_PDFURL, 0);
  objc_storeStrong((id *)&self->_pdfViewModificationInfos, 0);
  objc_storeStrong((id *)&self->_pdfModelModificationInfos, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_viewModificationInfo, 0);
  objc_storeStrong((id *)&self->_modelModificationInfo, 0);
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_documentGenerator);
  objc_destroyWeak((id *)&self->_imageGenerator);
  objc_destroyWeak((id *)&self->_representation);
  objc_storeStrong((id *)&self->_linkContextClient, 0);
  objc_storeStrong((id *)&self->_pdfSavingQueue, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);
  objc_storeStrong((id *)&self->_imageUndoManager, 0);
  objc_storeStrong((id *)&self->_itemProviderPDFAsImage, 0);
  objc_storeStrong((id *)&self->_itemProviderPDF, 0);
  objc_storeStrong((id *)&self->_itemProviderImage, 0);

  objc_storeStrong((id *)&self->_backingImage, 0);
}

@end