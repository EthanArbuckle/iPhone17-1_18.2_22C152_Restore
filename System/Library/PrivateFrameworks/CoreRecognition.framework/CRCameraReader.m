@interface CRCameraReader
+ (CGRect)aspectRatioPaddedRect:(CGRect)a3 expectedWidth:(double)a4 height:(double)a5 orientation:(unsigned int)a6;
+ (CGRect)uniformPadRect:(CGRect)a3 widthPadding:(float)a4 heightPadding:(float)a5 width:(double)a6 height:(double)a7;
+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 cameraIntrinsicData:(id)a6;
+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7;
+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7 padding:(float)a8 inputOrientation:(int)a9;
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4;
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 outputObjectTypes:(id)a5;
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5;
+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5 outputObjectTypes:(id)a6;
+ (id)targetRectsForImage:(id)a3;
+ (id)textFeatureWithVNTextObservation:(id)a3;
+ (unint64_t)supportedCameraCount;
+ (void)loadFonts;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFieldFoundTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSendFindBox;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pointsFound;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStarted;
- (BOOL)codeInverted;
- (BOOL)configPresentCentered;
- (BOOL)configUseFastScanning;
- (BOOL)configUseJPEGForColor;
- (BOOL)continousMode;
- (BOOL)didSendEndOrCancel;
- (BOOL)didSendFindBox;
- (BOOL)enableAltIDCardScan;
- (BOOL)hidePlacementText;
- (BOOL)isCaptureMode;
- (BOOL)isQRCode;
- (BOOL)previousIdleState;
- (BOOL)sessionIsStopping;
- (BOOL)showDiagnosticHUD;
- (CATextLayer)overlayTextLayer;
- (CGRect)boxLayerPresentationFrame;
- (CRAlignmentLayer)alignmentLayer;
- (CRBoxLayer)boxLayer;
- (CRCameraReader)init;
- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4;
- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4 options:(id)a5;
- (CRCameraReader)initWithOptions:(id)a3;
- (CRCameraReaderDelegate)callbackDelegate;
- (CRCaptureSessionManager)sessionManager;
- (CRImageReader)ocrImageReader;
- (CRMLCCModel)embossedCardholderModel;
- (CRMLCCModel)embossedExpirationModel;
- (CRMLCCModel)embossedNumberModel;
- (CRMLCCModel)flatPrintedModel;
- (CRPollingTimer)boxLayerHideTimer;
- (DiagnosticHUDLayer)diagnosticHUDLayer;
- (NSArray)foundPoints;
- (NSArray)outputObjectTypes;
- (NSCache)previousContactMatches;
- (NSDate)codePresented;
- (NSDictionary)contactsCache;
- (NSMutableArray)cardBlurValues;
- (NSMutableArray)dateCutRects;
- (NSMutableArray)nameCutRects;
- (NSMutableArray)textDetectorRTFeedback;
- (NSMutableDictionary)cardNumberCounts;
- (NSMutableDictionary)cardholderCounts;
- (NSMutableDictionary)expirationDateCounts;
- (NSMutableDictionary)optionsDictionary;
- (NSMutableDictionary)pinnedFoundInfo;
- (NSPointerArray)captureBuffer;
- (NSString)cameraMode;
- (NSString)foundCode;
- (NSString)ocrOverlayFontName;
- (NSString)previousCode;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_semaphore)processingImage;
- (UIActivityIndicatorView)activityIndicator;
- (UIColor)capturedTextColor;
- (UIColor)maskColor;
- (UIColor)maskOutlineColor;
- (UIColor)placementTextColor;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (__CVBuffer)correctedCardBuffer;
- (__CVBuffer)createFastAccessPixelBufferWithSize:(CGSize)a3 videoFormat:(int)a4;
- (double)configDemoSpeed;
- (double)sessionTimeout;
- (float)borderPaddingIDCard;
- (float)ocrOverlayBackgroundOpacity;
- (id)attributedStringWithFrame:(CGSize)a3 withFont:(id)a4 withString:(id)a5 color:(CGColor *)a6;
- (id)cameraIntrinsicDataForSampleBuffer:(opaqueCMSampleBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (id)createTextLayerForRecognizedObject:(id)a3;
- (id)currentDeviceID;
- (id)extractFinalDigitStringFromNumbers:(id)a3;
- (id)findCCExpDateInImageEmbossed:(id)a3;
- (id)findCCNameInImageEmbossed:(id)a3;
- (id)findCCNumberInImageEmbossed:(id)a3;
- (id)findCCNumberInImageEmbossed:(id)a3 withFinalDigit:(id)a4;
- (id)findCCObjectEmbossed:(id)a3 inImage:(id)a4 forRect:(id)a5;
- (id)findCCObjectsEmbossed:(id)a3 inImage:(id)a4 numberRects:(id)a5 nameRects:(id)a6 dateRects:(id)a7;
- (id)findCCResultsInImageFlat:(id)a3 usingTextFeatures:(id)a4 invert:(BOOL)a5;
- (id)findObjects:(id)a3 inImage:(id)a4 properties:(id)a5;
- (id)findObjectsEmbossed:(id)a3 inImage:(id)a4;
- (id)findObjectsFlat:(id)a3 inImage:(id)a4 numberRects:(id)a5 invert:(BOOL)a6;
- (id)generateStringFromDate:(id)a3;
- (id)getCorrectedIDImageFromAuxiliaryPoints:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5;
- (int64_t)cameraPosition;
- (int64_t)currentCameraIdentifier;
- (int64_t)exposureMode;
- (int64_t)focusMode;
- (int64_t)torchMode;
- (int64_t)whiteBalanceMode;
- (opaqueCMSampleBuffer)lastBuffer;
- (unint64_t)captureCount;
- (unint64_t)getFirstTimeFrameIndexForPinnedField:(id)a3;
- (unint64_t)imagesToCapture;
- (void)aetPlacementTextColor:(id)a3;
- (void)animatePresentCodeAtFrameTime:(id *)a3;
- (void)cancel;
- (void)captureImage;
- (void)captureImageFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)createCorrectedCardBuffer;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)findCodeInSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)findIDObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6;
- (void)findOCRTextObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 attachments:(id)a5 frameTime:(id *)a6;
- (void)findObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6;
- (void)flashScreenAndPlayCaptureSound;
- (void)hideBoxLayer;
- (void)loadModels;
- (void)loadView;
- (void)mergeInfo:(id)a3 intoFindInfo:(id)a4;
- (void)orientationDidChange:(id)a3;
- (void)pauseBoxLayerHideTimer;
- (void)primeBoxLayerHideTimerWithFrameTime:(id *)a3;
- (void)releaseCorrectedCardBuffer;
- (void)removeLayerTree;
- (void)sendDidCancel;
- (void)sendDidDisplayMessageStyle:(int64_t)a3;
- (void)sendDidEndAnimation;
- (void)sendDidEndWithError:(id)a3;
- (void)sendDidEndWithErrorDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (void)sendDidEndWithInfo:(id)a3;
- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4;
- (void)sendDidRecognizeNewObjects:(id)a3;
- (void)sendProvideOverlayObjects:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAlignmentLayer:(id)a3;
- (void)setBorderPaddingIDCard:(float)a3;
- (void)setBoxLayer:(id)a3;
- (void)setBoxLayerHideTimer:(id)a3;
- (void)setCallbackDelegate:(id)a3;
- (void)setCameraMode:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCaptureBuffer:(id)a3;
- (void)setCaptureCount:(unint64_t)a3;
- (void)setCaptureMode:(BOOL)a3;
- (void)setCapturedTextColor:(id)a3;
- (void)setCardBlurValues:(id)a3;
- (void)setCardNumberCounts:(id)a3;
- (void)setCardholderCounts:(id)a3;
- (void)setCodeInverted:(BOOL)a3;
- (void)setCodePresented:(id)a3;
- (void)setConfigDemoSpeed:(double)a3;
- (void)setConfigPresentCentered:(BOOL)a3;
- (void)setConfigUseFastScanning:(BOOL)a3;
- (void)setConfigUseJPEGForColor:(BOOL)a3;
- (void)setContactsCache:(id)a3;
- (void)setContinousMode:(BOOL)a3;
- (void)setCorrectedCardBuffer:(__CVBuffer *)a3;
- (void)setDateCutRects:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDiagnosticHUDLayer:(id)a3;
- (void)setDidSendEndOrCancel:(BOOL)a3;
- (void)setDidSendFindBox:(BOOL)a3;
- (void)setEmbossedCardholderModel:(id)a3;
- (void)setEmbossedExpirationModel:(id)a3;
- (void)setEmbossedNumberModel:(id)a3;
- (void)setEnableAltIDCardScan:(BOOL)a3;
- (void)setExpirationDateCounts:(id)a3;
- (void)setExposureMode:(int64_t)a3;
- (void)setFirstTimeFrameIndexForPinnedField:(id)a3;
- (void)setFlatPrintedModel:(id)a3;
- (void)setFocusMode:(int64_t)a3;
- (void)setFoundCode:(id)a3;
- (void)setFoundPoints:(id)a3;
- (void)setHidePlacementText:(BOOL)a3;
- (void)setImagesToCapture:(unint64_t)a3;
- (void)setIsQRCode:(BOOL)a3;
- (void)setLastBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setLastFieldFoundTime:(id *)a3;
- (void)setLastSendFindBox:(id *)a3;
- (void)setMaskColor:(id)a3;
- (void)setMaskOutlineColor:(id)a3;
- (void)setNameCutRects:(id)a3;
- (void)setOcrImageReader:(id)a3;
- (void)setOcrOverlayBackgroundOpacity:(float)a3;
- (void)setOcrOverlayFontName:(id)a3;
- (void)setOptionsDictionary:(id)a3;
- (void)setOutputObjectTypes:(id)a3;
- (void)setOverlayTextLayer:(id)a3;
- (void)setPinnedFoundInfo:(id)a3;
- (void)setPlacementTextColor:(id)a3;
- (void)setPointsFound:(id *)a3;
- (void)setPreviousCode:(id)a3;
- (void)setPreviousContactMatches:(id)a3;
- (void)setPreviousIdleState:(BOOL)a3;
- (void)setProcessingImage:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setSessionIsStopping:(BOOL)a3;
- (void)setSessionManager:(id)a3;
- (void)setSessionStarted:(id *)a3;
- (void)setSessionTimeout:(double)a3;
- (void)setShowDiagnosticHUD:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextDetectorRTFeedback:(id)a3;
- (void)setTorchMode:(int64_t)a3;
- (void)setWhiteBalanceMode:(int64_t)a3;
- (void)setupInitialLayerConfiguration;
- (void)showMessage:(id)a3 color:(id)a4 style:(int64_t)a5 duration:(double)a6;
- (void)showTextDetectorObjects:(id)a3;
- (void)start;
- (void)startSession;
- (void)stopSession;
- (void)switchToCamera:(int64_t)a3;
- (void)switchToCameraWithDeviceID:(id)a3;
- (void)toggleCamera;
- (void)updateContactsCache:(id)a3;
- (void)updatePinnedInfoFrameIndex;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRCameraReader

+ (unint64_t)supportedCameraCount
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFA5A8];
  uint64_t v3 = *MEMORY[0x263EF9660];
  v9[0] = *MEMORY[0x263EF9670];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v5 = [v2 discoverySessionWithDeviceTypes:v4 mediaType:*MEMORY[0x263EF9D48] position:0];

  v6 = [v5 devices];
  unint64_t v7 = [v6 count];

  return v7;
}

+ (void)loadFonts
{
  if (+[CRCameraReader loadFonts]::onceToken != -1) {
    dispatch_once(&+[CRCameraReader loadFonts]::onceToken, &__block_literal_global_2);
  }
}

void __27__CRCameraReader_loadFonts__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
  v1 = [v0 resourceURL];
  CFURLRef v2 = [v1 URLByAppendingPathComponent:@"Fonts/Scancardium_2.0.ttf"];

  CFErrorRef error = 0;
  CTFontManagerRegisterFontsForURL(v2, kCTFontManagerScopeProcess, &error);
  uint64_t v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
  v4 = [v3 resourceURL];
  CFURLRef v5 = [v4 URLByAppendingPathComponent:@"Fonts/Spendcardium.ttf"];

  CTFontManagerRegisterFontsForURL(v5, kCTFontManagerScopeProcess, &error);
}

- (CRCameraReader)initWithOptions:(id)a3
{
  return [(CRCameraReader *)self initWithNibName:0 bundle:0 options:a3];
}

- (CRCameraReader)init
{
  return [(CRCameraReader *)self initWithNibName:0 bundle:0];
}

- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(CRCameraReader *)self initWithNibName:0 bundle:0 options:0];
}

- (CRCameraReader)initWithNibName:(id)a3 bundle:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[v10 mutableCopy];
  [(CRCameraReader *)self setOptionsDictionary:v11];

  [(id)objc_opt_class() loadFonts];
  v36.receiver = self;
  v36.super_class = (Class)CRCameraReader;
  v12 = [(CRCameraReader *)&v36 initWithNibName:v8 bundle:v9];
  if (v12)
  {
    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[CRCameraReader setConfigPresentCentered:](v12, "setConfigPresentCentered:", [v13 BOOLForKey:@"com.apple.CoreRecognition.RedeemerPresentCentered"]);

    v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v15 = [v14 BOOLForKey:@"com.apple.CoreRecognition.RedeemerDemoMode"];
    double v16 = 1.0;
    if (v15) {
      double v16 = 0.25;
    }
    [(CRCameraReader *)v12 setConfigDemoSpeed:v16];

    v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[CRCameraReader setConfigUseFastScanning:](v12, "setConfigUseFastScanning:", [v17 BOOLForKey:@"com.apple.CoreRecognition.UseFastScanning"]);

    v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[CRCameraReader setConfigUseJPEGForColor:](v12, "setConfigUseJPEGForColor:", [v18 BOOLForKey:@"com.apple.CoreRecognition.useJPEGForColor"]);

    v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
    -[CRCameraReader setShowDiagnosticHUD:](v12, "setShowDiagnosticHUD:", [v19 BOOLForKey:@"com.apple.CoreRecognition.showDiagnosticHUD"]);

    [(CRCameraReader *)v12 setCaptureCount:1];
    v20 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    [(CRCameraReader *)v12 setCaptureBuffer:v20];

    [(CRCameraReader *)v12 setSessionTimeout:INFINITY];
    [(CRCameraReader *)v12 setWhiteBalanceMode:2];
    [(CRCameraReader *)v12 setFocusMode:2];
    [(CRCameraReader *)v12 setExposureMode:2];
    [(CRCameraReader *)v12 setTorchMode:0];
    [(CRCameraReader *)v12 setCameraMode:*MEMORY[0x263EF9750]];
    [(CRCameraReader *)v12 setHidePlacementText:0];
    [(CRCameraReader *)v12 setEnableAltIDCardScan:0];
    v21 = [MEMORY[0x263F1C5C0] currentDevice];
    -[CRCameraReader setCameraPosition:](v12, "setCameraPosition:", [v21 userInterfaceIdiom] == 1);

    dispatch_semaphore_t v22 = dispatch_semaphore_create(1);
    [(CRCameraReader *)v12 setProcessingImage:v22];

    [(CRCameraReader *)v12 setLastBuffer:0];
    LODWORD(v23) = 1036831949;
    [(CRCameraReader *)v12 setBorderPaddingIDCard:v23];
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.CoreRecognition.processingQueue", 0);
    [(CRCameraReader *)v12 setProcessingQueue:v24];

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.CoreRecognition.callbackQueue", 0);
    [(CRCameraReader *)v12 setDelegateQueue:v25];

    uint64_t v26 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
    maskColor = v12->_maskColor;
    v12->_maskColor = (UIColor *)v26;

    uint64_t v28 = [MEMORY[0x263F1C550] whiteColor];
    maskOutlineColor = v12->_maskOutlineColor;
    v12->_maskOutlineColor = (UIColor *)v28;

    uint64_t v30 = [MEMORY[0x263F1C550] whiteColor];
    placementTextColor = v12->_placementTextColor;
    v12->_placementTextColor = (UIColor *)v30;

    uint64_t v32 = [MEMORY[0x263F1C550] whiteColor];
    capturedTextColor = v12->_capturedTextColor;
    v12->_capturedTextColor = (UIColor *)v32;

    v34 = [(CRCameraReader *)v12 alignmentLayer];
    [v34 propogateMaskColor:v12->_maskColor outlineColor:v12->_maskOutlineColor placementTextColor:v12->_placementTextColor capturedTextColor:v12->_capturedTextColor];
  }
  return v12;
}

- (void)setMaskColor:(id)a3
{
  id v7 = a3;
  v4 = (UIColor *)[v7 copy];
  maskColor = self->_maskColor;
  self->_maskColor = v4;

  if ([(CRCameraReader *)self isViewLoaded])
  {
    v6 = [(CRCameraReader *)self alignmentLayer];
    [v6 propogateMaskColor:self->_maskColor outlineColor:self->_maskOutlineColor placementTextColor:self->_placementTextColor capturedTextColor:self->_capturedTextColor];
  }
}

- (void)setMaskOutlineColor:(id)a3
{
  id v7 = a3;
  v4 = (UIColor *)[v7 copy];
  maskOutlineColor = self->_maskOutlineColor;
  self->_maskOutlineColor = v4;

  if ([(CRCameraReader *)self isViewLoaded])
  {
    v6 = [(CRCameraReader *)self alignmentLayer];
    [v6 propogateMaskColor:self->_maskColor outlineColor:self->_maskOutlineColor placementTextColor:self->_placementTextColor capturedTextColor:self->_capturedTextColor];
  }
}

- (void)aetPlacementTextColor:(id)a3
{
  id v7 = a3;
  v4 = (UIColor *)[v7 copy];
  placementTextColor = self->_placementTextColor;
  self->_placementTextColor = v4;

  if ([(CRCameraReader *)self isViewLoaded])
  {
    v6 = [(CRCameraReader *)self alignmentLayer];
    [v6 propogateMaskColor:self->_maskColor outlineColor:self->_maskOutlineColor placementTextColor:self->_placementTextColor capturedTextColor:self->_capturedTextColor];
  }
}

- (void)setCapturedTextColor:(id)a3
{
  id v7 = a3;
  v4 = (UIColor *)[v7 copy];
  capturedTextColor = self->_capturedTextColor;
  self->_capturedTextColor = v4;

  if ([(CRCameraReader *)self isViewLoaded])
  {
    v6 = [(CRCameraReader *)self alignmentLayer];
    [v6 propogateMaskColor:self->_maskColor outlineColor:self->_maskOutlineColor placementTextColor:self->_placementTextColor capturedTextColor:self->_capturedTextColor];
  }
}

- (void)orientationDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__CRCameraReader_orientationDidChange___block_invoke;
  v3[3] = &unk_26429E598;
  v3[4] = self;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v3);
}

uint64_t __39__CRCameraReader_orientationDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewDidLayoutSubviews];
}

- (__CVBuffer)createFastAccessPixelBufferWithSize:(CGSize)a3 videoFormat:(int)a4
{
  return 0;
}

- (void)loadView
{
  uint64_t v3 = +[CRInsights sharedInsights];
  [v3 attachNewContextToCurrentThreadWithCameraReader:self];

  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  CFURLRef v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  v6 = objc_msgSend(v4, "initWithFrame:");
  [(CRCameraReader *)self setView:v6];

  id v7 = +[CRColor blackColor];
  id v8 = [(CRCameraReader *)self view];
  [v8 setBackgroundColor:v7];

  id v9 = +[CRInsights sharedInsights];
  if (v9)
  {
    id v10 = +[CRInsights sharedInsights];
    v11 = [v10 allowOverrideWithKey:@"kCROverrideCaptureSessionManager" forResultFromBlock:&__block_literal_global_86];
  }
  else
  {
    v11 = objc_alloc_init(CRDefaultCaptureSessionManager);
    id v10 = v11;
  }
  v12 = v11;
  [(CRCameraReader *)self setSessionManager:v11];
  if (v9) {

  }
  v13 = [(CRCameraReader *)self sessionManager];
  [v13 setCaptureSessionDelegate:self];

  v14 = [(CRCameraReader *)self sessionManager];
  [v14 setCaptureSessionMetadataDelegate:self];

  int64_t v15 = [(CRCameraReader *)self cameraPosition];
  double v16 = [(CRCameraReader *)self sessionManager];
  [v16 setCameraPosition:v15];

  int64_t v17 = [(CRCameraReader *)self whiteBalanceMode];
  v18 = [(CRCameraReader *)self sessionManager];
  [v18 setWhiteBalanceMode:v17];

  int64_t v19 = [(CRCameraReader *)self focusMode];
  v20 = [(CRCameraReader *)self sessionManager];
  [v20 setFocusMode:v19];

  int64_t v21 = [(CRCameraReader *)self exposureMode];
  dispatch_semaphore_t v22 = [(CRCameraReader *)self sessionManager];
  [v22 setExposureMode:v21];

  int64_t v23 = [(CRCameraReader *)self torchMode];
  dispatch_queue_t v24 = [(CRCameraReader *)self sessionManager];
  [v24 setTorchMode:v23];

  dispatch_queue_t v25 = (void *)MEMORY[0x263EFFA08];
  uint64_t v26 = [(CRCameraReader *)self outputObjectTypes];
  v27 = [v25 setWithArray:v26];

  uint64_t v28 = [v27 containsObject:@"CROutputTypeQRCode"];
  v29 = [(CRCameraReader *)self sessionManager];
  [v29 setEnableMetadataOutput:v28];

  if (([v27 containsObject:@"CROutputTypeQRCode"] & 1) != 0
    || [v27 containsObject:@"CROutputTypeHomeKitCode"])
  {
    uint64_t v30 = [(CRCameraReader *)self sessionManager];
    [v30 setTargetFocusDistance:140];
  }
  else
  {
    uint64_t v30 = [(CRCameraReader *)self sessionManager];
    [v30 setTargetFocusDistance:160];
  }

  v31 = [(CRCameraReader *)self cameraMode];
  uint64_t v32 = [(CRCameraReader *)self sessionManager];
  [v32 setCameraMode:v31];

  char v33 = [v27 containsObject:@"CROutputTypeiTunesCode"];
  v34 = (void *)MEMORY[0x263EF9780];
  if ((v33 & 1) == 0 && ([v27 containsObject:@"CROutputTypeHomeKitCode"] & 1) == 0)
  {
    v35 = [(CRCameraReader *)self sessionManager];
    [v35 setCameraMode:*v34];

    objc_super v36 = [(CRCameraReader *)self sessionManager];
    [v36 setCameraPosition:0];
  }
  v37 = [(CRCameraReader *)self sessionManager];
  int v38 = [v37 enableMetadataOutput];

  if (v38)
  {
    [(CRCameraReader *)self setCameraMode:*MEMORY[0x263EF9730]];
    v39 = [(CRCameraReader *)self cameraMode];
    v40 = [(CRCameraReader *)self sessionManager];
    [v40 setCameraMode:v39];
  }
  v41 = [(CRCameraReader *)self sessionManager];
  [v41 setupCameraSession];

  v42 = [(CRCameraReader *)self sessionManager];
  v43 = [v42 cameraMode];
  v44 = (void *)*v34;

  if (v43 == v44)
  {
    [(CRCameraReader *)self releaseCorrectedCardBuffer];
    [(CRCameraReader *)self createCorrectedCardBuffer];
  }
  v45 = [(CRCameraReader *)self view];
  v46 = [v45 layer];
  v47 = [(CRCameraReader *)self sessionManager];
  v48 = [v47 previewLayer];
  [v46 addSublayer:v48];

  v49 = +[CRAlignmentLayer layer];
  [(CRCameraReader *)self setAlignmentLayer:v49];

  v50 = [(CRCameraReader *)self alignmentLayer];
  v51 = [v50 instructionLayer];
  objc_msgSend(v51, "setHidden:", -[CRCameraReader hidePlacementText](self, "hidePlacementText"));

  v52 = [(CRCameraReader *)self view];
  v53 = [v52 layer];
  v54 = [(CRCameraReader *)self alignmentLayer];
  [v53 addSublayer:v54];

  v55 = [(CRCameraReader *)self alignmentLayer];
  [v55 setDelegate:self];

  if ([(CRCameraReader *)self showDiagnosticHUD])
  {
    v56 = +[DiagnosticHUDLayer layer];
    [(CRCameraReader *)self setDiagnosticHUDLayer:v56];

    v57 = [(CRCameraReader *)self view];
    v58 = [v57 layer];
    v59 = [(CRCameraReader *)self diagnosticHUDLayer];
    [v58 addSublayer:v59];
  }
  long long v60 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v77 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v78 = v60;
  long long v79 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  uint64_t v80 = *(void *)(MEMORY[0x263F15740] + 80);
  long long v61 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v75 = *MEMORY[0x263F15740];
  long long v76 = v61;
  long long v62 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v73 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v74 = v62;
  v63 = [(CRCameraReader *)self view];
  v64 = [v63 layer];
  v68[2] = v77;
  v68[3] = v78;
  v68[4] = v79;
  v68[0] = v75;
  v68[1] = v76;
  uint64_t v69 = v80;
  unint64_t v70 = 0xBF45D867C3ECE2A5;
  long long v71 = v73;
  long long v72 = v74;
  [v64 setSublayerTransform:v68];

  v65 = objc_opt_new();
  [(CRCameraReader *)self setPreviousContactMatches:v65];

  v66 = [(CRCameraReader *)self processingQueue];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __26__CRCameraReader_loadView__block_invoke_2;
  v67[3] = &unk_26429E598;
  v67[4] = self;
  cr_dispatch_async((uint64_t)v66, (uint64_t)v67);
}

CRDefaultCaptureSessionManager *__26__CRCameraReader_loadView__block_invoke()
{
  v0 = objc_alloc_init(CRDefaultCaptureSessionManager);
  return v0;
}

uint64_t __26__CRCameraReader_loadView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadModels];
}

- (void)loadModels
{
  uint64_t v3 = objc_alloc_init(CRMLEmbossedNumberModel);
  -[CRCameraReader setEmbossedNumberModel:](self, "setEmbossedNumberModel:");

  id v4 = objc_alloc_init(CRMLEmbossedCardholderModel);
  -[CRCameraReader setEmbossedCardholderModel:](self, "setEmbossedCardholderModel:");

  CFURLRef v5 = objc_alloc_init(CRMLEmbossedExpirationModel);
  -[CRCameraReader setEmbossedExpirationModel:](self, "setEmbossedExpirationModel:");

  v6 = objc_alloc_init(CRMLFlatModel);
  -[CRCameraReader setFlatPrintedModel:](self, "setFlatPrintedModel:");
}

- (void)viewDidLayoutSubviews
{
  id v38 = [(CRCameraReader *)self sessionManager];
  uint64_t v3 = [v38 previewLayer];
  id v4 = [v3 superlayer];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CRCameraReader *)self sessionManager];
  v14 = [v13 previewLayer];
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  id v39 = [(CRCameraReader *)self alignmentLayer];
  int64_t v15 = [v39 superlayer];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  dispatch_queue_t v24 = [(CRCameraReader *)self alignmentLayer];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  id v40 = [(CRCameraReader *)self diagnosticHUDLayer];
  dispatch_queue_t v25 = [v40 superlayer];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(CRCameraReader *)self diagnosticHUDLayer];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  id v41 = [(CRCameraReader *)self sessionManager];
  v35 = [(CRCameraReader *)self view];
  objc_super v36 = [v35 window];
  v37 = [v36 windowScene];
  objc_msgSend(v41, "setPreviewOrientation:", objc_msgSend(v37, "interfaceOrientation"));

  id v42 = [(CRCameraReader *)self alignmentLayer];
  [v42 setNeedsLayout];

  id v43 = [(CRCameraReader *)self diagnosticHUDLayer];
  [v43 setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CRCameraReader;
  [(CRCameraReader *)&v21 viewWillAppear:a3];
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  [v4 beginGeneratingDeviceOrientationNotifications];
  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_orientationDidChange_ name:*MEMORY[0x263F1D1B0] object:v4];

  double v6 = [[CRPollingTimer alloc] initWithTarget:self selector:sel_hideBoxLayer];
  [(CRCameraReader *)self setBoxLayerHideTimer:v6];

  if ([(CRCameraReader *)self isCaptureMode])
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleTapFrom_];
    [(CRCameraReader *)self setTapGestureRecognizer:v7];

    double v8 = [(CRCameraReader *)self tapGestureRecognizer];
    [v8 setNumberOfTapsRequired:1];

    double v9 = [(CRCameraReader *)self tapGestureRecognizer];
    [v9 setNumberOfTouchesRequired:1];

    double v10 = [(CRCameraReader *)self view];
    double v11 = [(CRCameraReader *)self tapGestureRecognizer];
    [v10 addGestureRecognizer:v11];
  }
  double v12 = [(CRCameraReader *)self view];
  v13 = [v12 layer];
  [v13 setMasksToBounds:1];

  [(CRCameraReader *)self startSession];
  v14 = (void *)MEMORY[0x263EFFA08];
  int64_t v15 = [(CRCameraReader *)self outputObjectTypes];
  double v16 = [v14 setWithArray:v15];

  if ([v16 containsObject:@"CROutputTypeCreditCardName"])
  {
    if (![MEMORY[0x263EFEA58] authorizationStatusForEntityType:0])
    {
      id v17 = objc_alloc_init(MEMORY[0x263EFEA58]);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __33__CRCameraReader_viewWillAppear___block_invoke;
      v20[3] = &unk_26429E5E0;
      v20[4] = self;
      [v17 requestAccessForEntityType:0 completionHandler:v20];
      goto LABEL_8;
    }
    if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
    {
      dispatch_get_global_queue(0, 0);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __33__CRCameraReader_viewWillAppear___block_invoke_3;
      v19[3] = &unk_26429E598;
      v19[4] = self;
      cr_dispatch_async((uint64_t)v17, (uint64_t)v19);
LABEL_8:
    }
  }
  double v18 = [(CRCameraReader *)self alignmentLayer];
  [v18 fadePlacementImage];
}

void __33__CRCameraReader_viewWillAppear___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __33__CRCameraReader_viewWillAppear___block_invoke_2;
    v4[3] = &unk_26429E598;
    v4[4] = *(void *)(a1 + 32);
    cr_dispatch_async((uint64_t)v3, (uint64_t)v4);
  }
}

void __33__CRCameraReader_viewWillAppear___block_invoke_2(uint64_t a1)
{
  CFURLRef v2 = [*(id *)(a1 + 32) contactsCache];

  if (!v2)
  {
    [*(id *)(a1 + 32) updateContactsCache:0];
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:*(void *)(a1 + 32) selector:sel_updateContactsCache_ name:*MEMORY[0x263EFE118] object:0];
  }
}

void __33__CRCameraReader_viewWillAppear___block_invoke_3(uint64_t a1)
{
  CFURLRef v2 = [*(id *)(a1 + 32) contactsCache];

  if (!v2)
  {
    [*(id *)(a1 + 32) updateContactsCache:0];
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:*(void *)(a1 + 32) selector:sel_updateContactsCache_ name:*MEMORY[0x263EFE118] object:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRCameraReader;
  [(CRCameraReader *)&v10 viewDidDisappear:a3];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  double v5 = [MEMORY[0x263F1C5C0] currentDevice];
  [v4 removeObserver:self name:*MEMORY[0x263F1D1B0] object:v5];

  double v6 = [(CRCameraReader *)self tapGestureRecognizer];

  if (v6)
  {
    double v7 = [(CRCameraReader *)self view];
    double v8 = [(CRCameraReader *)self tapGestureRecognizer];
    [v7 removeGestureRecognizer:v8];

    [(CRCameraReader *)self setTapGestureRecognizer:0];
  }
  double v9 = [(CRCameraReader *)self boxLayerHideTimer];
  [v9 invalidate];

  [(CRCameraReader *)self setBoxLayerHideTimer:0];
  [(CRCameraReader *)self stopSession];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CRCameraReader;
  -[CRCameraReader viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CRCameraReader_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_26429E608;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __69__CRCameraReader_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) view];
  CFURLRef v2 = [v10 window];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v11 = [v3 view];
    id v4 = [v11 window];
    double v5 = [v4 windowScene];
    uint64_t v6 = [v5 interfaceOrientation];
  }
  else
  {
    id v12 = [v3 parentViewController];
    id v7 = [v12 view];
    double v8 = [v7 window];

    if (!v8) {
      goto LABEL_7;
    }
    id v11 = [*(id *)(a1 + 32) parentViewController];
    id v4 = [v11 view];
    double v5 = [v4 window];
    objc_super v9 = [v5 windowScene];
    uint64_t v6 = [v9 interfaceOrientation];
  }
  if (v6)
  {
    id v13 = [*(id *)(a1 + 32) sessionManager];
    [v13 setPreviewOrientation:v6];
  }
LABEL_7:
  id v14 = [*(id *)(a1 + 32) alignmentLayer];
  [v14 setNeedsLayout];

  id v15 = [*(id *)(a1 + 32) diagnosticHUDLayer];
  [v15 setNeedsLayout];
}

- (void)releaseCorrectedCardBuffer
{
  correctedCardBuffer = self->_correctedCardBuffer;
  if (correctedCardBuffer)
  {
    CVPixelBufferRelease(correctedCardBuffer);
    self->_correctedCardBuffer = 0;
  }
}

- (void)createCorrectedCardBuffer
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(CRCameraReader *)self outputObjectTypes];
  id v7 = [v3 setWithArray:v4];

  if (([v7 containsObject:@"CROutputTypeIDCardFront"] & 1) != 0
    || [v7 containsObject:@"CROutputTypeIDCardBack"])
  {
    double v5 = [(CRCameraReader *)self sessionManager];
    uint64_t v6 = -[CRCameraReader createFastAccessPixelBufferWithSize:videoFormat:](self, "createFastAccessPixelBufferWithSize:videoFormat:", [v5 targetVideoFormat], 1536.0, 960.0);
  }
  else
  {
    double v5 = [(CRCameraReader *)self sessionManager];
    uint64_t v6 = -[CRCameraReader createFastAccessPixelBufferWithSize:videoFormat:](self, "createFastAccessPixelBufferWithSize:videoFormat:", [v5 targetVideoFormat], 768.0, 480.0);
  }
  self->_correctedCardBuffer = v6;
}

- (void)dealloc
{
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = 0;

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263EFE118] object:0];

  double v5 = [MEMORY[0x263F1C5C0] currentDevice];
  [v5 endGeneratingDeviceOrientationNotifications];

  [(CRCameraReader *)self removeLayerTree];
  [(CRCaptureSessionManager *)self->_sessionManager teardownCameraSession];
  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  [(CRCameraReader *)self releaseCorrectedCardBuffer];
  [(NSPointerArray *)self->_captureBuffer compact];
  while (1)
  {
    NSUInteger v8 = [(NSPointerArray *)self->_captureBuffer count];
    captureBuffer = self->_captureBuffer;
    if (!v8) {
      break;
    }
    id v10 = [(NSPointerArray *)captureBuffer pointerAtIndex:0];
    [(NSPointerArray *)self->_captureBuffer removePointerAtIndex:0];
    CFRelease(v10);
  }
  self->_captureBuffer = 0;

  lastBuffer = self->_lastBuffer;
  if (lastBuffer)
  {
    CFRelease(lastBuffer);
    self->_lastBuffer = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)CRCameraReader;
  [(CRCameraReader *)&v12 dealloc];
}

- (void)setupInitialLayerConfiguration
{
  id v13 = [(CRCameraReader *)self boxLayer];
  [v13 setHidden:1];

  id v14 = [(CRCameraReader *)self alignmentLayer];
  [v14 resetLayer];

  BOOL v3 = [(CRCameraReader *)self hidePlacementText];
  id v15 = [(CRCameraReader *)self alignmentLayer];
  id v4 = [v15 instructionLayer];
  [v4 setHidden:v3];

  double v5 = [(CRCameraReader *)self boxLayer];

  if (v5)
  {
    id v16 = [(CRCameraReader *)self boxLayer];
    [v16 removeFromSuperlayer];
  }
  id v17 = +[CRBoxLayer layer];
  -[CRCameraReader setBoxLayer:](self, "setBoxLayer:");

  id v18 = [(CRCameraReader *)self view];
  uint64_t v6 = [v18 layer];
  id v7 = [(CRCameraReader *)self boxLayer];
  [v6 addSublayer:v7];

  id v19 = [(CRCameraReader *)self sessionManager];
  NSUInteger v8 = [v19 previewLayer];
  LODWORD(v9) = 1.0;
  [v8 setOpacity:v9];

  id v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = [(CRCameraReader *)self outputObjectTypes];
  id v20 = [v10 setWithArray:v11];

  if (([v20 containsObject:@"CROutputTypeCreditCardNumber"] & 1) != 0
    || ([v20 containsObject:@"CROutputTypeCreditCardName"] & 1) != 0
    || ([v20 containsObject:@"CRCameraReaderCreditCardExpirationDate"] & 1) != 0
    || ([v20 containsObject:@"CROutputTypeIDCardFront"] & 1) != 0
    || [v20 containsObject:@"CROutputTypeIDCardBack"])
  {
    objc_super v12 = [(CRCameraReader *)self alignmentLayer];
    [v12 setHidden:0];
  }
  else
  {
    objc_super v12 = [(CRCameraReader *)self alignmentLayer];
    [v12 setHidden:1];
  }
}

- (void)didReceiveMemoryWarning
{
  v6.receiver = self;
  v6.super_class = (Class)CRCameraReader;
  [(CRCameraReader *)&v6 didReceiveMemoryWarning];
  if ([(CRCameraReader *)self isViewLoaded])
  {
    BOOL v3 = [(CRCameraReader *)self view];
    id v4 = [v3 window];

    if (!v4)
    {
      [(CRCameraReader *)self setView:0];
      [(CRCameraReader *)self stopSession];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __41__CRCameraReader_didReceiveMemoryWarning__block_invoke;
      v5[3] = &unk_26429E598;
      v5[4] = self;
      cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v5);
    }
  }
}

uint64_t __41__CRCameraReader_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  CFURLRef v2 = [*(id *)(a1 + 32) sessionManager];
  [v2 teardownCameraSession];

  [*(id *)(a1 + 32) setSessionManager:0];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 releaseCorrectedCardBuffer];
}

- (void)toggleCamera
{
  BOOL v3 = [(CRCameraReader *)self sessionManager];

  if (v3)
  {
    id v4 = [(CRCameraReader *)self sessionManager];
    [v4 toggleCamera];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__CRCameraReader_toggleCamera__block_invoke;
    block[3] = &unk_26429E598;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __30__CRCameraReader_toggleCamera__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupInitialLayerConfiguration];
}

- (void)switchToCameraWithDeviceID:(id)a3
{
  id v5 = a3;
  id v4 = [(CRCameraReader *)self sessionManager];
  [v4 switchToCameraWithDeviceID:v5];
}

- (int64_t)currentCameraIdentifier
{
  CFURLRef v2 = [(CRCameraReader *)self sessionManager];
  int64_t v3 = [v2 cameraPosition];

  return v3;
}

- (id)currentDeviceID
{
  CFURLRef v2 = [(CRCameraReader *)self sessionManager];
  int64_t v3 = [v2 currentDeviceID];

  return v3;
}

- (void)switchToCamera:(int64_t)a3
{
  id v5 = [(CRCameraReader *)self sessionManager];

  if (v5)
  {
    id v6 = [(CRCameraReader *)self sessionManager];
    [v6 switchToCamera:a3];
  }
}

- (void)captureImage
{
  unint64_t v3 = [(CRCameraReader *)self captureCount];
  unint64_t v4 = [(CRCameraReader *)self imagesToCapture] + v3;
  [(CRCameraReader *)self setImagesToCapture:v4];
}

- (void)start
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __23__CRCameraReader_start__block_invoke;
  v2[3] = &unk_26429E598;
  v2[4] = self;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v2);
}

void __23__CRCameraReader_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startSession];
  id v2 = [*(id *)(a1 + 32) alignmentLayer];
  [v2 fadePlacementImage];
}

- (void)cancel
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __24__CRCameraReader_cancel__block_invoke;
  v2[3] = &unk_26429E598;
  v2[4] = self;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v2);
}

uint64_t __24__CRCameraReader_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopSession];
  id v2 = *(void **)(a1 + 32);
  return [v2 sendDidCancel];
}

- (void)startSession
{
  [(CRCameraReader *)self setFoundCode:0];
  [(CRCameraReader *)self setIsQRCode:0];
  [(CRCameraReader *)self setPreviousCode:0];
  long long v19 = *MEMORY[0x263F01090];
  uint64_t v20 = *(void *)(MEMORY[0x263F01090] + 16);
  [(CRCameraReader *)self setSessionStarted:&v19];
  unint64_t v3 = (long long *)MEMORY[0x263F010A0];
  long long v17 = *MEMORY[0x263F010A0];
  uint64_t v18 = *(void *)(MEMORY[0x263F010A0] + 16);
  [(CRCameraReader *)self setPointsFound:&v17];
  unint64_t v4 = [MEMORY[0x263EFF910] distantPast];
  [(CRCameraReader *)self setCodePresented:v4];

  [(CRCameraReader *)self setCodeInverted:0];
  [(CRCameraReader *)self setDidSendEndOrCancel:0];
  [(CRCameraReader *)self setDidSendFindBox:0];
  long long v15 = *v3;
  uint64_t v16 = *((void *)v3 + 2);
  [(CRCameraReader *)self setLastSendFindBox:&v15];
  [(CRCameraReader *)self setImagesToCapture:0];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CRCameraReader *)self setCardNumberCounts:v5];

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  [(CRCameraReader *)self setCardholderCounts:v6];

  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  [(CRCameraReader *)self setExpirationDateCounts:v7];

  NSUInteger v8 = [MEMORY[0x263EFF9A0] dictionary];
  [(CRCameraReader *)self setPinnedFoundInfo:v8];

  long long v13 = *MEMORY[0x263F010B8];
  uint64_t v14 = *(void *)(MEMORY[0x263F010B8] + 16);
  [(CRCameraReader *)self setLastFieldFoundTime:&v13];
  double v9 = [MEMORY[0x263EFF980] array];
  [(CRCameraReader *)self setNameCutRects:v9];

  id v10 = [MEMORY[0x263EFF980] array];
  [(CRCameraReader *)self setDateCutRects:v10];

  id v11 = [MEMORY[0x263EFF980] array];
  [(CRCameraReader *)self setCardBlurValues:v11];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30__CRCameraReader_startSession__block_invoke;
  v12[3] = &unk_26429E598;
  v12[4] = self;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v12);
}

void __30__CRCameraReader_startSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  char v3 = [v2 isRunning];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setupInitialLayerConfiguration];
    unint64_t v4 = [*(id *)(a1 + 32) sessionManager];
    [v4 startRunning];

    id v5 = [*(id *)(a1 + 32) diagnosticHUDLayer];
    id v6 = [*(id *)(a1 + 32) sessionManager];
    id v7 = [v6 previewLayer];
    NSUInteger v8 = [*(id *)(a1 + 32) sessionManager];
    [v8 previewVisibleRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    long long v17 = [*(id *)(a1 + 32) sessionManager];
    [v17 cameraResolution];
    objc_msgSend(v5, "setPreviewLayer:visibleRect:cameraResolution:", v7, v10, v12, v14, v16, v18, v19);

    uint64_t v20 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(*(id *)(a1 + 32), "setPreviousIdleState:", objc_msgSend(v20, "isIdleTimerDisabled"));

    objc_super v21 = [MEMORY[0x263F1C408] sharedApplication];
    [v21 setIdleTimerDisabled:1];

    double v22 = *(void **)(a1 + 32);
    [v22 setSessionIsStopping:0];
  }
}

- (void)stopSession
{
  [(CRCameraReader *)self setSessionIsStopping:1];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __29__CRCameraReader_stopSession__block_invoke;
  v3[3] = &unk_26429E598;
  v3[4] = self;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v3);
}

void __29__CRCameraReader_stopSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  int v3 = [v2 isRunning];

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) sessionManager];
    [v4 stopRunning];

    id v5 = [MEMORY[0x263F1C408] sharedApplication];
    objc_msgSend(v5, "setIdleTimerDisabled:", objc_msgSend(*(id *)(a1 + 32), "previousIdleState"));

    id v6 = [*(id *)(a1 + 32) previousContactMatches];
    [v6 removeAllObjects];

    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setCardNumberCounts:v7];

    NSUInteger v8 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setCardholderCounts:v8];

    double v9 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setExpirationDateCounts:v9];
  }
  double v10 = [*(id *)(a1 + 32) processingQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __29__CRCameraReader_stopSession__block_invoke_2;
  v11[3] = &unk_26429E598;
  v11[4] = *(void *)(a1 + 32);
  cr_dispatch_async((uint64_t)v10, (uint64_t)v11);
}

uint64_t __29__CRCameraReader_stopSession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSessionIsStopping:0];
}

- (id)cameraIntrinsicDataForSampleBuffer:(opaqueCMSampleBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  NSUInteger v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F01028], 0);
  double v9 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2C510], 0);
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 objectForKey:*MEMORY[0x263F2D3D8]];
    double v12 = v11;
    if (v8) {
      _ZF = 1;
    }
    else {
      _ZF = v11 == 0;
    }
    if (!_ZF)
    {
      [v11 floatValue];
      objc_msgSend(v12, "floatValue", v14, 0);
      v15.i64[0] = a4;
      v15.i64[1] = a5;
      __asm { FMOV            V2.2S, #-1.0 }
      LODWORD(v20) = 0;
      HIDWORD(v20) = v21;
      *(float32x2_t *)&long long v22 = vmul_f32(vadd_f32(vcvt_f32_f64(vcvtq_f64_u64(v15)), _D2), (float32x2_t)0x3F0000003F000000);
      DWORD2(v22) = 1.0;
      v24[1] = v20;
      v24[2] = v22;
      [0 getBytes:v24 length:48];
    }
  }
  else
  {
    double v12 = 0;
  }

  return v8;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7 = +[CRInsights sharedInsights];
  [v7 attachNewContextToCurrentThreadWithCameraReader:self];

  memset(&v26, 0, sizeof(v26));
  CMSampleBufferGetPresentationTimeStamp(&v26, a4);
  [(CRCameraReader *)self sessionStarted];
  if ((time.flags & 1) == 0)
  {
    CMTime v25 = v26;
    [(CRCameraReader *)self setSessionStarted:&v25];
  }
  NSUInteger v8 = [(CRCameraReader *)self boxLayerHideTimer];
  CMTime v24 = v26;
  [v8 evalAtTime:&v24];

  double v9 = [(CRCameraReader *)self sessionManager];
  if ([v9 isAdjustingFocus])
  {
    CMTime v23 = v26;
    [(CRCameraReader *)self lastFieldFoundTime];
    CMTime lhs = v23;
    CMTime rhs = v22;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) <= 1.0) {
      goto LABEL_16;
    }
  }
  BOOL v10 = [(CRCameraReader *)self sessionIsStopping];

  if (v10) {
    return;
  }
  if ([(CRCameraReader *)self isCaptureMode])
  {
    [(CRCameraReader *)self captureImageFromSampleBuffer:a4];
    return;
  }
  CMTime v21 = v26;
  [(CRCameraReader *)self sessionStarted];
  CMTime lhs = v21;
  CMTime rhs = v20;
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  [(CRCameraReader *)self sessionTimeout];
  if (Seconds > v12)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v19[3] = &unk_26429E598;
    v19[4] = self;
    cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v19);
    return;
  }
  if ([(CRCameraReader *)self lastBuffer])
  {
    CFRelease(self->_lastBuffer);
    [(CRCameraReader *)self setLastBuffer:0];
  }
  [(CRCameraReader *)self setLastBuffer:CFRetain(a4)];
  double v13 = [(CRCameraReader *)self processingImage];
  intptr_t v14 = dispatch_semaphore_wait(v13, 0);

  if (!v14)
  {
    CFRetain(a4);
    uint64x2_t v15 = [(CRCameraReader *)self diagnosticHUDLayer];

    if (v15)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
      v18[3] = &unk_26429E598;
      v18[4] = self;
      cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v18);
    }
    double v9 = [(CRCameraReader *)self processingQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3;
    v16[3] = &unk_26429E630;
    v16[4] = self;
    v16[5] = a4;
    CMTime v17 = v26;
    cr_dispatch_async((uint64_t)v9, (uint64_t)v16);
LABEL_16:
  }
}

uint64_t __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopSession];
  id v2 = *(void **)(a1 + 32);
  return [v2 sendDidEndWithErrorDomain:@"Core Recognition Error Domain" code:1 userInfo:0];
}

void __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) diagnosticHUDLayer];
  [v1 refreshFrameIndicator];
}

void __69__CRCameraReader_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_3(uint64_t a1)
{
  id v2 = +[CRInsights sharedInsights];
  [v2 notifySampleBufferProcessingStart:*(void *)(a1 + 40)];

  int v3 = (void *)MEMORY[0x263EFFA08];
  unint64_t v4 = [*(id *)(a1 + 32) outputObjectTypes];
  id v5 = [v3 setWithArray:v4];

  if (([v5 containsObject:@"CROutputTypeiTunesCode"] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    id v7 = [*(id *)(a1 + 32) outputObjectTypes];
    NSUInteger v8 = [v6 setWithArray:v7];
    int v9 = [v8 containsObject:@"CROutputTypeHomeKitCode"];

    if (!v9)
    {
      if ([v5 containsObject:@"CROutputTypeCreditCardNumber"])
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
        double v12 = *(void **)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        size_t Width = CVPixelBufferGetWidth(ImageBuffer);
        uint64x2_t v15 = [v12 cameraIntrinsicDataForSampleBuffer:v13 width:Width height:CVPixelBufferGetHeight(ImageBuffer)];
        double v16 = *(void **)(a1 + 32);
        CMTime v17 = [v16 outputObjectTypes];
        CMSampleBufferGetPresentationTimeStamp(&v31, *(CMSampleBufferRef *)(a1 + 40));
        [v16 findObjects:v17 inPixelBuffer:ImageBuffer cameraIntrinsicData:v15 frameTime:&v31];
      }
      else
      {
        if (([v5 containsObject:@"CROutputTypeIDCardFront"] & 1) == 0
          && ![v5 containsObject:@"CROutputTypeIDCardBack"])
        {
          if (![v5 containsObject:@"CROutputTypeCameraText"]) {
            goto LABEL_11;
          }
          CVImageBufferRef v25 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
          BOOL v10 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), (CFStringRef)*MEMORY[0x263F2C510], 0);
          CMTime v26 = *(void **)(a1 + 32);
          double v27 = [v26 outputObjectTypes];
          long long v28 = *(_OWORD *)(a1 + 48);
          uint64_t v29 = *(void *)(a1 + 64);
          [v26 findOCRTextObjects:v27 inPixelBuffer:v25 attachments:v10 frameTime:&v28];

          goto LABEL_4;
        }
        double v18 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
        double v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        size_t v21 = CVPixelBufferGetWidth(v18);
        uint64x2_t v15 = [v19 cameraIntrinsicDataForSampleBuffer:v20 width:v21 height:CVPixelBufferGetHeight(v18)];
        CMTime v22 = *(void **)(a1 + 32);
        CMTime v17 = [v22 outputObjectTypes];
        CMSampleBufferGetPresentationTimeStamp(&v30, *(CMSampleBufferRef *)(a1 + 40));
        [v22 findIDObjects:v17 inPixelBuffer:v18 cameraIntrinsicData:v15 frameTime:&v30];
      }

      goto LABEL_11;
    }
  }
  [*(id *)(a1 + 32) findCodeInSampleBuffer:*(void *)(a1 + 40)];
  BOOL v10 = [*(id *)(a1 + 32) sessionManager];
  [v10 highISOAdjustExposure];
LABEL_4:

LABEL_11:
  CMTime v23 = [*(id *)(a1 + 32) processingImage];
  dispatch_semaphore_signal(v23);

  CMTime v24 = +[CRInsights sharedInsights];
  [v24 notifySampleBufferProcessingEnd:*(void *)(a1 + 40)];

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  v51[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v51[0] = *MEMORY[0x263EF9F40];
  double v33 = v6;
  double v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
  if (v6 && [v6 count])
  {
    v37 = [v6 objectAtIndex:0];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v32;
    uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v36) {
      goto LABEL_22;
    }
    uint64_t v35 = *(void *)v46;
    while (1)
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        NSUInteger v8 = [v37 type];
        LODWORD(v7) = [v8 isEqualToString:v7];

        if (v7)
        {
          int v9 = [v37 stringValue];
          if (([v9 isEqualToString:&stru_26C7BF850] & 1) == 0)
          {
            BOOL v10 = [(CRCameraReader *)self callbackDelegate];
            double v11 = [v37 stringValue];
            int v12 = [v10 cameraReader:self shouldReturnQRCode:v11];

            if (!v12) {
              continue;
            }
            int v9 = [MEMORY[0x263EFF980] array];
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            uint64_t v13 = [v37 corners];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v42;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v42 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  CMTime v17 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                  double v18 = [v17 objectForKey:@"X"];
                  [v18 floatValue];
                  float v20 = v19;
                  size_t v21 = [(CRCameraReader *)self sessionManager];
                  [v21 cameraResolution];
                  double v23 = v22;
                  CMTime v24 = [v17 objectForKey:@"Y"];
                  [v24 floatValue];
                  float v26 = v25;
                  double v27 = [(CRCameraReader *)self sessionManager];
                  [v27 cameraResolution];
                  double v29 = v28;

                  CMTime v30 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v23 * v20, v29 * v26);
                  [v9 addObject:v30];
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
              }
              while (v14);
            }

            CMTime v31 = [v37 stringValue];
            [(CRCameraReader *)self setFoundCode:v31];

            [(CRCameraReader *)self setFoundPoints:v9];
            CMSampleBufferGetPresentationTimeStamp(&v40, [(CRCameraReader *)self lastBuffer]);
            CMTime v39 = v40;
            [(CRCameraReader *)self setPointsFound:&v39];
            [(CRCameraReader *)self setIsQRCode:1];
          }
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v36)
      {
LABEL_22:

        break;
      }
    }
  }
}

- (void)flashScreenAndPlayCaptureSound
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  unint64_t v4 = [(CRCameraReader *)self view];
  id v5 = [v4 window];
  [v5 frame];
  id v6 = objc_msgSend(v3, "initWithFrame:");

  uint64_t v7 = +[CRColor whiteColor];
  [v6 setBackgroundColor:v7];

  NSUInteger v8 = [(CRCameraReader *)self view];
  int v9 = [v8 window];
  [v9 addSubview:v6];

  BOOL v10 = (void *)MEMORY[0x263F1CB60];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke;
  v14[3] = &unk_26429E598;
  id v15 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke_2;
  v12[3] = &unk_26429E658;
  id v11 = v15;
  id v13 = v11;
  [v10 animateWithDuration:v14 animations:v12 completion:1.0];
  AudioServicesPlaySystemSound(0x454u);
}

uint64_t __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __48__CRCameraReader_flashScreenAndPlayCaptureSound__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)captureImageFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFRetain(a3);
  id v5 = [(CRCameraReader *)self captureBuffer];
  [v5 addPointer:a3];

  id v6 = [(CRCameraReader *)self captureBuffer];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(CRCameraReader *)self captureCount];

  if (v7 > v8)
  {
    int v9 = [(CRCameraReader *)self captureBuffer];
    BOOL v10 = (const void *)[v9 pointerAtIndex:0];

    id v11 = [(CRCameraReader *)self captureBuffer];
    [v11 removePointerAtIndex:0];

    CFRelease(v10);
  }
  if ([(CRCameraReader *)self imagesToCapture])
  {
    int v12 = [(CRCameraReader *)self captureBuffer];
    id v13 = (void *)[v12 copy];

    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263EF83A0];
    while ([v13 count] > v14)
    {
      double v16 = (const void *)[v13 pointerAtIndex:v14];
      CMTime v17 = v16;
      if (v16)
      {
        CFRetain(v16);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke;
        v18[3] = &unk_26429E6A8;
        v18[4] = self;
        void v18[5] = v17;
        cr_dispatch_async(v15, (uint64_t)v18);
      }
      ++v14;
    }
  }
}

void __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) imagesToCapture])
  {
    objc_msgSend(*(id *)(a1 + 32), "setImagesToCapture:", objc_msgSend(*(id *)(a1 + 32), "imagesToCapture") - 1);
    ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(a1 + 40));
    CVPixelBufferLockBaseAddress(ImageBuffer, 0);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(ImageBuffer, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(ImageBuffer, 0);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 0);
    unint64_t v7 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 40), (CFStringRef)*MEMORY[0x263F2C510], 0);
    unint64_t v8 = *(void **)(a1 + 32);
    int v9 = [MEMORY[0x263EFF910] date];
    BOOL v10 = [v8 generateStringFromDate:v9];

    id v11 = [v10 stringByAppendingPathExtension:@"tif"];
    CMTime v24 = BaseAddressOfPlane;
    size_t v25 = HeightOfPlane;
    size_t v26 = WidthOfPlane;
    size_t v27 = BytesPerRowOfPlane;
    writeBuffer();
    int v12 = [*(id *)(a1 + 32) configUseJPEGForColor];
    id v13 = @"jpg";
    if (!v12) {
      id v13 = @"tif";
    }
    unint64_t v14 = v13;
    uint64_t v15 = [v10 stringByAppendingString:@"Color"];
    double v16 = [v15 stringByAppendingPathExtension:v14];
    writeBufferWithFullColor();

    CMTime v17 = [*(id *)(a1 + 32) callbackDelegate];
    if (v17)
    {
      double v18 = [*(id *)(a1 + 32) callbackDelegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        float v20 = [NSDictionary dictionaryWithObject:v11 forKey:@"PNGFileName"];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke_2;
        v22[3] = &unk_26429E680;
        v22[4] = *(void *)(a1 + 32);
        id v23 = v20;
        id v21 = v20;
        cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v22);
      }
    }
    CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __47__CRCameraReader_captureImageFromSampleBuffer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) flashScreenAndPlayCaptureSound];
  id v2 = [*(id *)(a1 + 32) callbackDelegate];
  [v2 cameraReader:*(void *)(a1 + 32) didWriteToFile:*(void *)(a1 + 40)];
}

- (void)findCodeInSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  memset(&v85, 0, sizeof(v85));
  CMSampleBufferGetPresentationTimeStamp(&v85, a3);
  pixelBuffer = CMSampleBufferGetImageBuffer(a3);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if (WidthOfPlane)
  {
    if (HeightOfPlane)
    {
      size_t v7 = BytesPerRowOfPlane;
      if (!CVPixelBufferLockBaseAddress(pixelBuffer, 0))
      {
        CFRetain(a3);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
        int v9 = [(CRCameraReader *)self foundCode];
        BOOL v60 = v9 != 0;

        BOOL v10 = objc_opt_class();
        v84[0] = BaseAddressOfPlane;
        v84[1] = HeightOfPlane;
        v84[2] = WidthOfPlane;
        v84[3] = v7;
        id v11 = [(CRCameraReader *)self outputObjectTypes];
        long long v61 = [v10 findCodeInImage:v84 maxStage:v60 outputObjectTypes:v11];

        int v12 = [v61 objectForKey:@"boxPoints"];
        long long v62 = [v61 objectForKey:@"code"];
        id v13 = [v61 objectForKey:@"inverted"];
        char v58 = [v13 BOOLValue];

        unint64_t v14 = [v61 objectForKey:@"accepted"];
        int v59 = [v14 BOOLValue];

        uint64_t v15 = [MEMORY[0x263EFF980] array];
        double v16 = [(CRCameraReader *)self sessionManager];
        CMTime v17 = [v16 previewLayer];
        [v17 bounds];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;

        if (![(CRCameraReader *)self isQRCode]
          || ([(CRCameraReader *)self foundCode],
              size_t v26 = objc_claimAutoreleasedReturnValue(),
              BOOL v27 = v26 == 0,
              v26,
              v27))
        {
          CMTime v30 = v12;
        }
        else
        {
          uint64_t v28 = [(CRCameraReader *)self foundCode];

          double v29 = [(CRCameraReader *)self foundCode];
          [(CRCameraReader *)self setPreviousCode:v29];

          CMTime v30 = [(CRCameraReader *)self foundPoints];

          CMTime v31 = [(CRCameraReader *)self boxLayer];
          [v31 setFrameRatio:1.0];

          int v59 = 1;
          long long v62 = (void *)v28;
          LODWORD(v60) = 1;
        }
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        obuint64_t j = v30;
        uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v81;
          LOBYTE(v34) = 1;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v81 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v36 = *(void **)(*((void *)&v80 + 1) + 8 * i);
              v37 = [(CRCameraReader *)self sessionManager];
              [v36 CGPointValue];
              double v39 = v38;
              double v41 = v40;
              long long v42 = [(CRCameraReader *)self sessionManager];
              long long v43 = [v42 previewLayer];
              objc_msgSend(v37, "convertCameraPoint:toLayer:", v43, v39, v41);
              double v45 = v44;
              double v47 = v46;

              long long v48 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v45, v47);
              [v15 addObject:v48];

              if (v34)
              {
                v92.origin.x = v19;
                v92.origin.y = v21;
                v92.size.double width = v23;
                v92.size.double height = v25;
                v91.x = v45;
                v91.y = v47;
                BOOL v34 = CGRectContainsPoint(v92, v91);
              }
              else
              {
                BOOL v34 = 0;
              }
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
          }
          while (v32);
        }
        else
        {
          BOOL v34 = 1;
        }

        int v49 = v59 & v34;
        if ((v59 & v34) == 1 && v62)
        {
          v50 = [(CRCameraReader *)self previousCode];
          if (v50
            && ([(CRCameraReader *)self previousCode],
                v51 = objc_claimAutoreleasedReturnValue(),
                char v52 = [v51 isEqualToString:v62],
                v51,
                v50,
                (v52 & 1) != 0))
          {
            int v49 = 1;
          }
          else
          {
            [(CRCameraReader *)self setPreviousCode:v62];
            int v49 = 0;
          }
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        CFRelease(a3);
        if (v62) {
          int v53 = v49;
        }
        else {
          int v53 = 0;
        }
        if (v53 == 1) {
          [(CRCameraReader *)self stopSession];
        }
        if (obj)
        {
          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v71[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke;
          v71[3] = &unk_26429E6D0;
          v71[4] = self;
          id v54 = obj;
          CMTime v76 = v85;
          id v72 = v54;
          id v73 = v15;
          char v77 = v49;
          char v78 = v58;
          char v79 = v53;
          id v74 = v62;
          long long v75 = a3;
          cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v71);
        }
        else
        {
          CMTime v70 = v85;
          [(CRCameraReader *)self pointsFound];
          CMTime lhs = v70;
          CMTime rhs = v69;
          CMTimeSubtract(&time, &lhs, &rhs);
          if (CMTimeGetSeconds(&time) > 0.3)
          {
            v55 = [(CRCameraReader *)self sessionManager];
            [v55 resetFocus];
          }
          [(CRCameraReader *)self setFoundPoints:0];
        }
        if (v60)
        {
          v67[0] = MEMORY[0x263EF8330];
          v67[1] = 3221225472;
          v67[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_2;
          v67[3] = &unk_26429E6F8;
          v67[4] = self;
          CMTime v68 = v85;
          cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v67);
        }
        v56 = [(CRCameraReader *)self diagnosticHUDLayer];
        BOOL v57 = v56 == 0;

        if (!v57)
        {
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_3;
          v66[3] = &unk_26429E598;
          v66[4] = self;
          cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v66);
        }
      }
    }
  }
}

void __41__CRCameraReader_findCodeInSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 32) foundPoints];

  if (!v3) {
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  do
  {
    id v5 = [*(id *)(a1 + 32) foundPoints];
    id v6 = [v5 objectAtIndex:v4];
    [v6 CGPointValue];
    double v8 = v7;
    double v10 = v9;

    id v11 = [*(id *)(a1 + 40) objectAtIndex:v4];
    [v11 CGPointValue];
    double v13 = v12;
    double v15 = v14;

    double v16 = sqrt((v13 - v8) * (v13 - v8) + (v15 - v10) * (v15 - v10));
  }
  while (v16 <= 20.0 && v4++ < 3);
  if (v16 <= 20.0)
  {
    CMTime v121 = *(CMTime *)(a1 + 72);
    double v18 = *(void **)(a1 + 32);
    if (v18) {
      [v18 pointsFound];
    }
    else {
      memset(&v120, 0, sizeof(v120));
    }
    CMTime lhs = v121;
    CMTime rhs = v120;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 3.0)
    {
      [*(id *)(a1 + 32) stopSession];
      [*(id *)(a1 + 32) sendDidEndWithErrorDomain:@"Core Recognition Error Domain" code:1 userInfo:0];
    }
  }
  else
  {
LABEL_11:
    [*(id *)(a1 + 32) setFoundPoints:*(void *)(a1 + 40)];
    long long v122 = *(_OWORD *)(a1 + 72);
    uint64_t v123 = *(void *)(a1 + 88);
    [*(id *)(a1 + 32) setPointsFound:&v122];
  }
  CGFloat v19 = [*(id *)(a1 + 32) diagnosticHUDLayer];
  [v19 setBoxPoints:*(void *)(a1 + 48)];

  double v20 = [*(id *)(a1 + 32) boxLayer];
  [v20 positionForCodeBoxPoints:*(void *)(a1 + 48)];

  CGFloat v21 = [*(id *)(a1 + 32) boxLayer];
  [v21 setHidden:0];

  double v22 = *(void **)(a1 + 32);
  long long v118 = *(_OWORD *)(a1 + 72);
  uint64_t v119 = *(void *)(a1 + 88);
  [v22 primeBoxLayerHideTimerWithFrameTime:&v118];
  if (*(void *)(a1 + 56) && *(unsigned char *)(a1 + 96))
  {
    uint64_t v23 = 0;
    double v24 = (long long *)(a1 + 72);
    p_timescale = &time.timescale;
    do
    {
      size_t v26 = [*(id *)(a1 + 40) objectAtIndex:v23];
      [v26 CGPointValue];
      *((void *)p_timescale - 1) = v27;
      *(void *)p_timescale = v28;

      ++v23;
      p_timescale += 4;
    }
    while (v23 != 4);
    if (*(unsigned char *)(a1 + 97)) {
      double v29 = (*(double *)&time.epoch + v128) * 0.5;
    }
    else {
      double v29 = (*(double *)&time.value + v130) * 0.5;
    }
    if (*(unsigned char *)(a1 + 97)) {
      double v30 = (v127 + v129) * 0.5;
    }
    else {
      double v30 = (*(double *)&time.timescale + v131) * 0.5;
    }
    if (*(unsigned char *)(a1 + 97)) {
      double v31 = (*(double *)&time.value + v130) * 0.5;
    }
    else {
      double v31 = (*(double *)&time.epoch + v128) * 0.5;
    }
    if (*(unsigned char *)(a1 + 97)) {
      double v32 = (*(double *)&time.timescale + v131) * 0.5;
    }
    else {
      double v32 = (v127 + v129) * 0.5;
    }
    uint64_t v33 = [*(id *)(a1 + 32) sessionManager];
    BOOL v34 = [*(id *)(a1 + 32) sessionManager];
    uint64_t v35 = [v34 previewLayer];
    objc_msgSend(v33, "convertCameraPoint:toLayer:", v35, v29, v30);
    double v37 = v36;
    double v39 = v38;

    double v40 = [*(id *)(a1 + 32) sessionManager];
    double v41 = [*(id *)(a1 + 32) sessionManager];
    long long v42 = [v41 previewLayer];
    objc_msgSend(v40, "convertCameraPoint:toLayer:", v42, v31, v32);
    double v44 = v43;
    double v46 = v45;

    if (v44 == v37)
    {
      double v47 = dbl_2177A1920[v46 > v39];
    }
    else
    {
      BOOL v60 = [*(id *)(a1 + 32) sessionManager];
      int v61 = [v60 isPreviewVideoMirrored];
      double v62 = atan((v46 - v39) / (v44 - v37));

      if (v61) {
        BOOL v63 = v44 > v37;
      }
      else {
        BOOL v63 = v44 < v37;
      }
      if (v63) {
        double v47 = v62 + 3.14159265;
      }
      else {
        double v47 = v62;
      }
    }
    v64 = (id *)(a1 + 32);
    [*(id *)(a1 + 32) setFoundCode:*(void *)(a1 + 56)];
    BOOL v65 = v47 > 1.57079633 || v47 < -1.57079633;
    [*v64 setCodeInverted:v65];
    v66 = [*v64 boxLayer];
    char v67 = [*v64 isQRCode];
    if (v67)
    {
      CMTime v68 = &stru_26C7BF850;
    }
    else
    {
      CMTime v68 = [*(id *)(a1 + 32) foundCode];
    }
    int v69 = [*(id *)(a1 + 32) configPresentCentered];
    if (v69)
    {
      id v1 = [*(id *)(a1 + 32) sessionManager];
      uint64_t v70 = [v1 isPreviewVideoMirrored];
    }
    else
    {
      uint64_t v70 = 0;
    }
    if ([*(id *)(a1 + 32) configPresentCentered]) {
      uint64_t v71 = [*(id *)(a1 + 32) codeInverted];
    }
    else {
      uint64_t v71 = 0;
    }
    [v66 setString:v68 mirrored:v70 inverted:v71];
    if (v69) {

    }
    if ((v67 & 1) == 0) {
    id v72 = objc_alloc_init(CRCameraReaderOutput);
    }
    if (!*(unsigned char *)(a1 + 98)) {
      goto LABEL_80;
    }
    id v73 = (void *)MEMORY[0x263EFFA08];
    id v74 = [*(id *)(a1 + 32) outputObjectTypes];
    long long v75 = [v73 setWithArray:v74];
    if ([v75 containsObject:@"CROutputTypeQRCode"])
    {
      int v76 = [*(id *)(a1 + 32) isQRCode];

      if (v76)
      {
        char v77 = [(CRCameraReaderOutput *)v72 objectInternal];
        [v77 setType:@"CROutputTypeQRCode"];
        goto LABEL_79;
      }
    }
    else
    {
    }
    char v78 = (void *)MEMORY[0x263EFFA08];
    char v79 = [*(id *)(a1 + 32) outputObjectTypes];
    long long v80 = [v78 setWithArray:v79];
    int v81 = [v80 containsObject:@"CROutputTypeiTunesCode"];

    if (v81)
    {
      objc_msgSend(*(id *)(a1 + 32), "findCodeInSampleBuffer:", objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
      char v77 = [(CRCameraReaderOutput *)v72 objectInternal];
      [v77 setType:@"CROutputTypeiTunesCode"];
    }
    else
    {
      long long v82 = (void *)MEMORY[0x263EFFA08];
      long long v83 = [*(id *)(a1 + 32) outputObjectTypes];
      v84 = [v82 setWithArray:v83];
      int v85 = [v84 containsObject:@"CROutputTypeHomeKitCode"];

      if (v85)
      {
        objc_msgSend(*(id *)(a1 + 32), "findCodeInSampleBuffer:", objc_msgSend(*(id *)(a1 + 32), "lastBuffer"));
        char v77 = [(CRCameraReaderOutput *)v72 objectInternal];
        [v77 setType:@"CROutputTypeHomeKitCode"];
      }
      else
      {
        v86 = (void *)MEMORY[0x263EFFA08];
        v87 = [*(id *)(a1 + 32) outputObjectTypes];
        v88 = [v86 setWithArray:v87];
        int v89 = [v88 containsObject:@"CROutputTypeCreditCardNumber"];

        if (v89)
        {
          ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[*(id *)(a1 + 32) lastBuffer]);
          CGPoint v91 = *(void **)(a1 + 32);
          uint64_t v92 = *(void *)(a1 + 64);
          size_t Width = CVPixelBufferGetWidth(ImageBuffer);
          char v77 = [v91 cameraIntrinsicDataForSampleBuffer:v92 width:Width height:CVPixelBufferGetHeight(ImageBuffer)];
          v94 = *(void **)(a1 + 32);
          v95 = [v94 outputObjectTypes];
          long long v112 = *v24;
          uint64_t v113 = *(void *)(a1 + 88);
          [v94 findObjects:v95 inPixelBuffer:ImageBuffer cameraIntrinsicData:v77 frameTime:&v112];

          v96 = [(CRCameraReaderOutput *)v72 objectInternal];
          [v96 setType:@"CROutputTypeCreditCardNumber"];
        }
        else
        {
          v97 = (void *)MEMORY[0x263EFFA08];
          v98 = [*(id *)(a1 + 32) outputObjectTypes];
          v99 = [v97 setWithArray:v98];
          int v100 = [v99 containsObject:@"CROutputTypeCameraText"];

          if (!v100)
          {
LABEL_80:
            uint64_t v104 = *(void *)(a1 + 40);
            v105 = [(CRCameraReaderOutput *)v72 objectInternal];
            [v105 setVertices:v104];

            v106 = [*(id *)(a1 + 32) foundCode];
            v107 = [(CRCameraReaderOutput *)v72 objectInternal];
            [v107 setStringValue:v106];

            v108 = *(void **)(a1 + 32);
            v109 = [MEMORY[0x263EFF8C0] arrayWithObject:v72];
            [v108 sendDidEndWithInfo:v109];

            return;
          }
          CVImageBufferRef v101 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)[*(id *)(a1 + 32) lastBuffer]);
          v102 = (const void *)[*(id *)(a1 + 32) lastBuffer];
          char v77 = (void *)CMGetAttachment(v102, (CFStringRef)*MEMORY[0x263F2C510], 0);
          v103 = *(void **)(a1 + 32);
          v96 = [v103 outputObjectTypes];
          long long v110 = *v24;
          uint64_t v111 = *(void *)(a1 + 88);
          [v103 findOCRTextObjects:v96 inPixelBuffer:v101 attachments:v77 frameTime:&v110];
        }
      }
    }
LABEL_79:

    goto LABEL_80;
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v48 = *(id *)(a1 + 48);
  uint64_t v49 = [v48 countByEnumeratingWithState:&v114 objects:v132 count:16];
  if (v49)
  {
    int v50 = 0;
    uint64_t v51 = *(void *)v115;
    double v52 = 0.0;
    double v53 = 0.0;
    do
    {
      uint64_t v54 = 0;
      int v55 = v50 + 1;
      v50 += v49;
      do
      {
        if (*(void *)v115 != v51) {
          objc_enumerationMutation(v48);
        }
        [*(id *)(*((void *)&v114 + 1) + 8 * v54) CGPointValue];
        double v56 = 1.0 / (double)(v55 + (int)v54);
        double v53 = v53 * (1.0 - v56) + v57 * v56;
        double v52 = v52 * (1.0 - v56) + v58 * v56;
        ++v54;
      }
      while (v49 != v54);
      uint64_t v49 = [v48 countByEnumeratingWithState:&v114 objects:v132 count:16];
    }
    while (v49);
  }
  else
  {
    double v52 = 0.0;
    double v53 = 0.0;
  }

  int v59 = [*(id *)(a1 + 32) sessionManager];
  objc_msgSend(v59, "refocusOnPoint:", v53, v52);
}

uint64_t __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) pauseBoxLayerHideTimer];
  id v2 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 animatePresentCodeAtFrameTime:&v4];
}

void __41__CRCameraReader_findCodeInSampleBuffer___block_invoke_3(uint64_t a1)
{
  id v21 = [*(id *)(a1 + 32) sessionManager];
  int v2 = [v21 isFocusPointOfInterestSupported];

  double v3 = 0.0;
  double v4 = 0.0;
  if (v2)
  {
    id v22 = [*(id *)(a1 + 32) sessionManager];
    [v22 focusPointOfInterest];
    double v6 = v5;
    double v8 = v7;

    id v23 = [*(id *)(a1 + 32) sessionManager];
    [v23 cameraResolution];
    double v10 = v9;
    id v11 = [*(id *)(a1 + 32) sessionManager];
    [v11 cameraResolution];
    double v13 = v12;

    id v24 = [*(id *)(a1 + 32) sessionManager];
    double v14 = [*(id *)(a1 + 32) sessionManager];
    double v15 = [v14 previewLayer];
    objc_msgSend(v24, "convertCameraPoint:toLayer:", v15, v6 * v10, v8 * v13);
    double v3 = v16;
    double v4 = v17;
  }
  id v25 = [*(id *)(a1 + 32) diagnosticHUDLayer];
  double v18 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v19 = [v18 isAdjustingFocus];
  double v20 = [*(id *)(a1 + 32) sessionManager];
  objc_msgSend(v25, "setAdjustingFocus:pointOfInterestSupported:focusPoint:", v19, objc_msgSend(v20, "isFocusPointOfInterestSupported"), v3, v4);
}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 cameraIntrinsicData:(id)a6
{
  double v6 = [a1 extractCardImage:a3 fromPixelBuffer:a4 withCardBuffer:a5 withPoints:0 cameraIntrinsicData:a6];
  return v6;
}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7
{
  double v7 = [a1 extractCardImage:a3 fromPixelBuffer:a4 withCardBuffer:a5 withPoints:a6 cameraIntrinsicData:a7 padding:1 inputOrientation:0.0];
  return v7;
}

+ (id)extractCardImage:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 withCardBuffer:(__CVBuffer *)a5 withPoints:(id)a6 cameraIntrinsicData:(id)a7 padding:(float)a8 inputOrientation:(int)a9
{
  uint64_t v13 = *(void *)&a9;
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v136 = a3;
  id v18 = a6;
  id v19 = a7;
  uint64_t v133 = v19;
  double v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v21 = [v20 BOOLForKey:@"com.apple.CoreRecognition.enable_vn_2_rect_detector"];

  CFDictionaryRef v22 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, 1u);
  id v23 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:a4 options:v22];
  v140 = [v23 imageByApplyingOrientation:v13];

  if (v22) {
    CFRelease(v22);
  }
  if (!v18)
  {
    v132 = objc_opt_new();
    id v39 = objc_alloc_init(MEMORY[0x263F1EEB0]);
    LODWORD(v40) = 15.0;
    v134 = v39;
    [v39 setQuadratureTolerance:v40];
    LODWORD(v41) = 1045220557;
    [v39 setMinimumSize:v41];
    [v39 setMinimumConfidence:0.0];
    [v39 setMaximumObservations:1];
    if (v19)
    {
      [v132 setObject:v19 forKey:*MEMORY[0x263F1F258]];
      LODWORD(v43) = 1058724538;
      [v39 setMinimumAspectRatio:v43];
      LODWORD(v44) = 1059570110;
    }
    else
    {
      LODWORD(v42) = 1058407449;
      [v39 setMinimumAspectRatio:v42];
      LODWORD(v44) = 1059887199;
    }
    [v39 setMaximumAspectRatio:v44];
    double v130 = (void *)[objc_alloc(MEMORY[0x263F1EF40]) initWithCIImage:v140 options:v132];
    if ((v21 & 1) == 0) {
      [v39 setRequiredVersion:1];
    }
    long long v82 = [MEMORY[0x263EFF8C0] arrayWithObject:v39];
    id v148 = 0;
    [v130 performRequests:v82 error:&v148];
    id v128 = v148;

    double v129 = [v134 results];
    if ([v129 count])
    {
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      obuint64_t j = v129;
      uint64_t v83 = [obj countByEnumeratingWithState:&v144 objects:v156 count:16];
      if (v83)
      {
        int v135 = 0;
        uint64_t v138 = *(void *)v145;
        v139 = 0;
        do
        {
          for (uint64_t i = 0; i != v83; ++i)
          {
            if (*(void *)v145 != v138) {
              objc_enumerationMutation(obj);
            }
            int v85 = *(void **)(*((void *)&v144 + 1) + 8 * i);
            [v140 extent];
            double v87 = v86;
            [v140 extent];
            double v89 = v88;
            [v85 topLeft];
            v152.CGFloat x = v87 * v90;
            v152.double y = v89 * v91;
            [v85 topRight];
            v151.CGFloat x = v87 * v92;
            v151.double y = v89 * v93;
            [v85 bottomLeft];
            v150.CGFloat x = v87 * v94;
            v150.double y = v89 * v95;
            [v85 bottomRight];
            v149.CGFloat x = v87 * v96;
            v149.double y = v89 * v97;
            *(CGPoint *)&v154.a = v152;
            *(CGPoint *)&v154.c = v151;
            *(CGPoint *)&v154.tCGFloat x = v149;
            CGPoint v155 = v150;
            double v9 = rectFromPoints((uint64_t)&v154);
            double v10 = v98;
            double v11 = v99;
            double v12 = v100;
            CVImageBufferRef v101 = (void *)MEMORY[0x263EFF8C0];
            v102 = NSStringFromPoint(v152);
            v103 = NSStringFromPoint(v151);
            uint64_t v104 = NSStringFromPoint(v149);
            v105 = NSStringFromPoint(v150);
            uint64_t v106 = objc_msgSend(v101, "arrayWithObjects:", v102, v103, v104, v105, 0, v128);

            v139 = (void *)v106;
            if (a8 > 0.0)
            {
              calculatePointsWithPaddingInCorrectedSpace(&v152.x, &v151.x, &v149.x, &v150.x, v9, v10, v11, v12, a8, (double)(unint64_t)[v136 width], (double)(unint64_t)objc_msgSend(v136, "height"));
              v153[0] = v152;
              v153[1] = v151;
              v153[2] = v149;
              v153[3] = v150;
              double v9 = rectFromPoints((uint64_t)v153);
              double v10 = v107;
              double v11 = v108;
              double v12 = v109;
            }
            [v140 extent];
            if (CGRectContainsPoint(v160, v152))
            {
              [v140 extent];
              if (CGRectContainsPoint(v161, v151))
              {
                [v140 extent];
                if (CGRectContainsPoint(v162, v150))
                {
                  [v140 extent];
                  if (CGRectContainsPoint(v163, v149))
                  {
                    [v140 extent];
                    v166.origin.CGFloat x = v9;
                    v166.origin.double y = v10;
                    v166.size.double width = v11;
                    v166.size.double height = v12;
                    if (CGRectContainsRect(v164, v166)) {
                      int v110 = 1;
                    }
                    else {
                      int v110 = v135;
                    }
                    int v135 = v110;
                  }
                }
              }
            }
          }
          uint64_t v83 = [obj countByEnumeratingWithState:&v144 objects:v156 count:16];
        }
        while (v83);
      }
      else
      {
        v139 = 0;
        LOBYTE(v135) = 0;
      }
    }
    else
    {
      v139 = 0;
      LOBYTE(v135) = 0;
    }

    if (v135) {
      goto LABEL_10;
    }
LABEL_46:
    id v81 = 0;
    goto LABEL_51;
  }
  id v24 = [v18 objectAtIndex:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  size_t v26 = [v18 objectAtIndex:0];
  if (isKindOfClass)
  {
    NSPoint v27 = NSPointFromString(v26);
    double y = v27.y;
    v154.a = v27.x;
    v154.b = v27.y;

    double v29 = [v18 objectAtIndex:1];
    NSPoint v30 = NSPointFromString(v29);
    double v31 = v30.y;
    v154.c = v30.x;

    double v32 = [v18 objectAtIndex:2];
    NSPoint v33 = NSPointFromString(v32);
    double v34 = v33.y;
    v154.tCGFloat x = v33.x;

    uint64_t v35 = [v18 objectAtIndex:3];
    NSPoint v38 = NSPointFromString(v35);
    CGFloat v37 = v38.y;
    CGFloat x = v38.x;
  }
  else
  {
    [(NSString *)v26 CGPointValue];
    double y = v45;
    v154.a = v46;
    v154.b = v45;

    double v47 = [v18 objectAtIndex:1];
    [v47 CGPointValue];
    double v31 = v48;
    v154.c = v49;
    v154.d = v48;

    int v50 = [v18 objectAtIndex:2];
    [v50 CGPointValue];
    double v34 = v51;
    v154.tCGFloat x = v52;
    v154.tdouble y = v51;

    uint64_t v35 = [v18 objectAtIndex:3];
    [(NSString *)v35 CGPointValue];
  }
  double v53 = v37;
  v155.CGFloat x = x;

  [v140 extent];
  v154.b = v54 - y;
  [v140 extent];
  v154.d = v55 - v31;
  [v140 extent];
  v154.tdouble y = v56 - v34;
  [v140 extent];
  v155.double y = v57 - v53;
  CGPoint v151 = *(CGPoint *)&v154.c;
  CGPoint v152 = *(CGPoint *)&v154.a;
  CGPoint v149 = *(CGPoint *)&v154.tx;
  CGPoint v150 = v155;
  double v9 = rectFromPoints((uint64_t)&v154);
  double v10 = v58;
  double v11 = v59;
  double v12 = v60;
  [v140 extent];
  v165.origin.CGFloat x = v9;
  v165.origin.double y = v10;
  v165.size.double width = v11;
  v165.size.double height = v12;
  BOOL v61 = CGRectContainsRect(v159, v165);
  double v62 = (void *)MEMORY[0x263EFF8C0];
  BOOL v63 = NSStringFromPoint(v152);
  v64 = NSStringFromPoint(v151);
  BOOL v65 = NSStringFromPoint(v149);
  v66 = NSStringFromPoint(v150);
  v139 = objc_msgSend(v62, "arrayWithObjects:", v63, v64, v65, v66, 0);

  if (!v61) {
    goto LABEL_46;
  }
LABEL_10:
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CMTime v68 = objc_msgSend(v140, "imageByCroppingToRect:", v9, v10, v11, v12);
  int v69 = [MEMORY[0x263F00640] filterWithName:@"CIPerspectiveCorrection"];
  uint64_t v70 = [MEMORY[0x263F00680] vectorWithCGPoint:v152];
  [v69 setValue:v70 forKey:@"inputTopLeft"];

  uint64_t v71 = [MEMORY[0x263F00680] vectorWithCGPoint:v151];
  [v69 setValue:v71 forKey:@"inputTopRight"];

  id v72 = [MEMORY[0x263F00680] vectorWithCGPoint:v150];
  [v69 setValue:v72 forKey:@"inputBottomLeft"];

  id v73 = [MEMORY[0x263F00680] vectorWithCGPoint:v149];
  [v69 setValue:v73 forKey:@"inputBottomRight"];

  [v69 setValue:v68 forKey:*MEMORY[0x263F00968]];
  id v74 = [v69 valueForKey:*MEMORY[0x263F009D0]];
  [v74 extent];
  double v76 = v75;
  [v140 extent];
  if (v76 <= v77 && ([v74 extent], double v79 = v78, objc_msgSend(v140, "extent"), v79 <= v80))
  {
    [v74 extent];
    double v112 = v111;
    [v74 extent];
    if (v112 < v113)
    {
      uint64_t v114 = [v74 imageByApplyingOrientation:6];

      id v74 = (void *)v114;
    }
    unint64_t v115 = [v136 width];
    [v74 extent];
    double v117 = v116;
    unint64_t v118 = [v136 height];
    [v74 extent];
    memset(&v154, 0, sizeof(v154));
    CGAffineTransformMakeScale(&v154, (double)v115 / v117, (double)v118 / v119);
    CGAffineTransform v143 = v154;
    CMTime v120 = [v74 imageByApplyingTransform:&v143];
    CMTime v121 = [MEMORY[0x263F00628] contextWithOptions:0];
    objc_msgSend(v121, "render:toCVPixelBuffer:bounds:colorSpace:", v120, a5, DeviceRGB, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v136, "width"), (double)(unint64_t)objc_msgSend(v136, "height"));
    CGColorSpaceRelease(DeviceRGB);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a5, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a5, 0);
    if (WidthOfPlane && HeightOfPlane && !CVPixelBufferLockBaseAddress(a5, 0))
    {
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a5, 0);
      if (v136)
      {
        [v136 vImage];
        v125 = *(void **)&v153[0];
        [v136 vImage];
        [v136 vImage];
        size_t v126 = v141 * v142;
      }
      else
      {
        v125 = 0;
        size_t v126 = 0;
      }
      memcpy(v125, BaseAddressOfPlane, v126);
      CVPixelBufferUnlockBaseAddress(a5, 0);
    }
    id v81 = v139;
  }
  else
  {
    CFRelease(DeviceRGB);
    id v81 = 0;
  }

LABEL_51:
  return v81;
}

- (void)sendProvideOverlayObjects:(id)a3
{
  id v4 = a3;
  double v5 = [(CRCameraReader *)self delegateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CRCameraReader_sendProvideOverlayObjects___block_invoke;
  v7[3] = &unk_26429E680;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);
}

uint64_t __44__CRCameraReader_sendProvideOverlayObjects___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) callbackDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
          double v9 = objc_msgSend(*(id *)(a1 + 32), "callbackDelegate", (void)v12);
          double v10 = [v9 cameraReader:*(void *)(a1 + 32) provideOverlayTextForRecognizedObject:v8];
          [v8 setOverlayString:v10];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "showTextDetectorObjects:", *(void *)(a1 + 40), (void)v12);
}

- (void)findOCRTextObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 attachments:(id)a5 frameTime:(id *)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRetain(a4);
  id v8 = [(CRCameraReader *)self ocrImageReader];
  uint64_t v24 = *MEMORY[0x263F7EC70];
  v25[0] = MEMORY[0x263EFFA88];
  double v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  double v10 = [v8 resultsForPixelBuffer:a4 options:v9 error:0];

  double v11 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        uint64_t v17 = [CRCameraReaderOutputCameraText alloc];
        id v18 = -[CRCameraReaderOutput initWithImageReaderOutput:](v17, "initWithImageReaderOutput:", v16, (void)v19);
        [v11 addObject:v18];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(CRCameraReader *)self sendProvideOverlayObjects:v11];
  CVPixelBufferRelease(a4);
}

- (id)findObjects:(id)a3 inImage:(id)a4 properties:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v41 = a4;
  id v40 = a5;
  id v38 = [MEMORY[0x263EFF9A0] dictionary];
  double v42 = [MEMORY[0x263EFF9A0] dictionary];
  double v36 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [v41 pathExtension];
  uint64_t v8 = [v7 compare:@"JPG" options:1];

  if (v8) {
    CVPixelBufferRef Planar420PixelBufferFromImageFile = createPlanar420PixelBufferFromImageFile((const __CFURL *)v41);
  }
  else {
    CVPixelBufferRef Planar420PixelBufferFromImageFile = createPlanar420PixelBufferFromJPEGFile();
  }
  double v10 = Planar420PixelBufferFromImageFile;
  double v11 = (void *)[objc_alloc(MEMORY[0x263F7ECB0]) initWithWidth:768 height:480 colorSpace:0];
  CVPixelBufferRef pixelBufferOut = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  IOSurfacePropertiesDictionardouble y = fcssCreateIOSurfacePropertiesDictionary(768, 480, 875704422);
  if (IOSurfacePropertiesDictionary)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04130], IOSurfacePropertiesDictionary);
    CFRelease(IOSurfacePropertiesDictionary);
  }
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x300uLL, 0x1E0uLL, 0x34323066u, Mutable, &pixelBufferOut);
  clock_t v14 = clock();
  uint64_t v15 = objc_opt_class();
  CVPixelBufferRef v16 = pixelBufferOut;
  uint64_t v17 = [v40 objectForKey:@"CameraIntrinsicData"];
  id v18 = [v15 extractCardImage:v11 fromPixelBuffer:v10 withCardBuffer:v16 cameraIntrinsicData:v17];

  *(float *)&double v19 = (float)(uint64_t)(clock() - v14) / 1000000.0;
  long long v20 = [NSNumber numberWithFloat:v19];
  [v42 setObject:v20 forKey:@"cardExtractionTime"];

  if (v18)
  {
    long long v21 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v22 = v18;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v22);
          }
          size_t v26 = *(NSString **)(*((void *)&v43 + 1) + 8 * i);
          size_t Height = CVPixelBufferGetHeight(v10);
          NSPoint v28 = NSPointFromString(v26);
          v51.CGFloat x = v28.x;
          v51.double y = (double)Height - v28.y;
          double v29 = NSStringFromPoint(v51);
          [v21 addObject:v29];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v23);
    }

    [v42 setValue:v21 forKey:@"boxPoints"];
    NSPoint v30 = [(CRCameraReader *)self findObjectsEmbossed:v37 inImage:v11];
    [v42 addEntriesFromDictionary:v30];
    [v38 setObject:v42 forKey:@"freeformResults"];
  }
  uint64_t v31 = [v40 objectForKey:@"cardPoints"];

  double v32 = (void *)v31;
  if (v31)
  {
    id v33 = (id)[(id)objc_opt_class() extractCardImage:v11 fromPixelBuffer:v10 withCardBuffer:pixelBufferOut withPoints:v31 cameraIntrinsicData:0];
    double v34 = [(CRCameraReader *)self findObjectsEmbossed:v37 inImage:v11];
    [v36 addEntriesFromDictionary:v34];
    [v38 setObject:v36 forKey:@"annotatedCardPointResults"];
  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v10);

  return v38;
}

- (void)updatePinnedInfoFrameIndex
{
  char v3 = [(CRCameraReader *)self pinnedFoundInfo];
  id v7 = [v3 objectForKey:@"currentFrameIndex"];

  if (v7) {
    uint64_t v4 = [v7 unsignedIntegerValue] + 1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(CRCameraReader *)self pinnedFoundInfo];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
  [v5 setObject:v6 forKey:@"currentFrameIndex"];
}

- (void)setFirstTimeFrameIndexForPinnedField:(id)a3
{
  id v9 = [a3 stringByAppendingString:@"FirstPinningFrameIndex"];
  uint64_t v4 = [(CRCameraReader *)self pinnedFoundInfo];
  uint64_t v5 = [v4 objectForKey:v9];

  if (!v5)
  {
    uint64_t v6 = [(CRCameraReader *)self pinnedFoundInfo];
    id v7 = [v6 objectForKey:@"currentFrameIndex"];

    if (v7)
    {
      uint64_t v8 = [(CRCameraReader *)self pinnedFoundInfo];
      [v8 setObject:v7 forKey:v9];
    }
  }
}

- (unint64_t)getFirstTimeFrameIndexForPinnedField:(id)a3
{
  uint64_t v4 = [a3 stringByAppendingString:@"FirstPinningFrameIndex"];
  uint64_t v5 = [(CRCameraReader *)self pinnedFoundInfo];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = -1;
  }

  return v7;
}

- (id)getCorrectedIDImageFromAuxiliaryPoints:(id)a3 fromPixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = v8;
  if (v8 && [v8 count] == 4)
  {
    CFDictionaryRef v10 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, 1u);
    double v11 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:a4 options:v10];
    id v12 = [v11 imageByApplyingOrientation:v5];

    if (v10) {
      CFRelease(v10);
    }
    uint64_t v13 = [v9 objectAtIndexedSubscript:0];
    [v13 CGPointValue];
    double v62 = v14;
    double v63 = v15;

    CVPixelBufferRef v16 = [v9 objectAtIndexedSubscript:1];
    [v16 CGPointValue];
    double v64 = v17;
    double v65 = v18;

    double v19 = [v9 objectAtIndexedSubscript:2];
    [v19 CGPointValue];
    double v66 = v20;
    double v67 = v21;

    id v22 = [v9 objectAtIndexedSubscript:3];
    [v22 CGPointValue];
    double v68 = v23;
    double v69 = v24;

    double v25 = rectFromPoints((uint64_t)&v62);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [(CRCameraReader *)self borderPaddingIDCard];
    if (v32 > 0.0)
    {
      [(CRCameraReader *)self borderPaddingIDCard];
      calculatePointsWithPaddingInCorrectedSpace(&v62, &v64, &v66, &v68, v25, v27, v29, v31, v33, 1536.0, 960.0);
      double v25 = rectFromPoints((uint64_t)&v62);
      double v27 = v34;
      double v29 = v35;
      double v31 = v36;
    }
    [v12 extent];
    v73.origin.CGFloat x = v25;
    v73.origin.double y = v27;
    v73.size.double width = v29;
    v73.size.double height = v31;
    if (CGRectContainsRect(v72, v73))
    {
      id v37 = objc_msgSend(v12, "imageByCroppingToRect:", v25, v27, v29, v31);
      id v38 = [MEMORY[0x263F00640] filterWithName:@"CIPerspectiveCorrection"];
      id v39 = objc_msgSend(MEMORY[0x263F00680], "vectorWithCGPoint:", v62, v63);
      [v38 setValue:v39 forKey:@"inputTopLeft"];

      id v40 = objc_msgSend(MEMORY[0x263F00680], "vectorWithCGPoint:", v64, v65);
      [v38 setValue:v40 forKey:@"inputTopRight"];

      id v41 = objc_msgSend(MEMORY[0x263F00680], "vectorWithCGPoint:", v66, v67);
      [v38 setValue:v41 forKey:@"inputBottomRight"];

      double v42 = objc_msgSend(MEMORY[0x263F00680], "vectorWithCGPoint:", v68, v69);
      [v38 setValue:v42 forKey:@"inputBottomLeft"];

      [v38 setValue:v37 forKey:*MEMORY[0x263F00968]];
      id v43 = [v38 valueForKey:*MEMORY[0x263F009D0]];
      [v43 extent];
      double v45 = v44;
      [v12 extent];
      if (v45 <= v46 && ([v43 extent], double v48 = v47, objc_msgSend(v12, "extent"), v48 <= v49))
      {
        [v43 extent];
        double v52 = v51;
        [v43 extent];
        if (v52 < v53)
        {
          uint64_t v54 = [v43 imageByApplyingOrientation:6];

          id v43 = (id)v54;
        }
        [v43 extent];
        double v56 = v55;
        [v43 extent];
        memset(&v61, 0, sizeof(v61));
        CGAffineTransformMakeScale(&v61, 1536.0 / v56, 960.0 / v57);
        CGAffineTransform v60 = v61;
        double v58 = [v43 imageByApplyingTransform:&v60];

        id v43 = v58;
        int v50 = v43;
      }
      else
      {
        int v50 = 0;
      }
    }
    else
    {
      int v50 = 0;
    }
  }
  else
  {
    int v50 = 0;
  }

  return v50;
}

- (void)findIDObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6
{
  v244[7] = *MEMORY[0x263EF8340];
  id v228 = a5;
  v230 = [MEMORY[0x263EFFA08] setWithArray:a3];
  v226 = @"CRCameraReaderIDCardCapturePathAutomatic";
  CVPixelBufferGetWidth(a4);
  CVPixelBufferGetHeight(a4);
  v231 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF980] array];
  v229 = (void *)[objc_alloc(MEMORY[0x263F7ECB0]) initWithWidth:1536 height:960 colorSpace:0];
  CFDictionaryRef v10 = [(CRCameraReader *)self sessionManager];
  double v11 = [v10 previewLayer];
  id v12 = [v11 connection];
  uint64_t v13 = [v12 videoOrientation];

  switch(v13)
  {
    case 2:
      uint64_t v225 = 0;
      uint64_t v14 = 3;
      break;
    case 3:
      uint64_t v14 = 8;
      uint64_t v225 = 1;
      break;
    case 4:
      uint64_t v14 = 6;
      uint64_t v225 = 0x100000000;
      break;
    default:
      uint64_t v225 = 0;
      uint64_t v14 = 1;
      break;
  }
  double v15 = +[CRInsights sharedInsights];
  if (v15)
  {
    CVPixelBufferRef v16 = +[CRInsights sharedInsights];
    uint64_t rect_16 = [v16 allowOverrideWithKey:@"boxPoints" forValue:0];
  }
  else
  {
    uint64_t rect_16 = 0;
  }

  double v17 = [(CRCameraReader *)self callbackDelegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v19 = [(CRCameraReader *)self callbackDelegate];
    double v20 = [v19 cameraReader:self auxiliaryIDCornerDetection:a4];

    double v21 = [(CRCameraReader *)self getCorrectedIDImageFromAuxiliaryPoints:v20 fromPixelBuffer:a4 orientation:v14];
    if (!v21)
    {
LABEL_25:

      uint64_t v66 = rect_16;
      goto LABEL_26;
    }
    rect_8 = [MEMORY[0x263F00628] contextWithOptions:0];
    [v21 extent];
    id v22 = (CGImage *)objc_msgSend(rect_8, "createCGImage:fromRect:", v21);
    rect = [MEMORY[0x263F1C6B0] imageWithCGImage:v22];
    CGImageRelease(v22);
    for (uint64_t i = 0; i != 4; ++i)
    {
      double v24 = [v20 objectAtIndexedSubscript:i];
      [v24 CGPointValue];

      normalizedPointForSize();
      double v25 = NSStringFromPoint(v245);
      [v9 addObject:v25];
    }
    double v26 = [(CRCameraReader *)self sessionManager];
    double v27 = [(CRCameraReader *)self alignmentLayer];
    [v27 alignmentRect];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v36 = [(CRCameraReader *)self alignmentLayer];
    objc_msgSend(v26, "convertCameraRect:fromLayer:", v36, v29, v31, v33, v35);
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    v263.origin.double x = v38;
    v263.origin.double y = v40;
    v263.size.double width = v42;
    v263.size.double height = v44;
    CGRectIntegral(v263);
    normalizedRectForSize();
    double x = v246.x;
    double y = v246.y;
    double v48 = v47;
    double v50 = v49;
    double v51 = NSStringFromPoint(v246);
    [v231 addObject:v51];

    CGFloat v52 = x + v48;
    v247.double x = v52;
    v247.double y = y;
    double v53 = NSStringFromPoint(v247);
    [v231 addObject:v53];

    CGFloat v54 = y + v50;
    v248.double x = v52;
    v248.double y = v54;
    double v55 = NSStringFromPoint(v248);
    [v231 addObject:v55];

    v249.double x = x;
    v249.double y = v54;
    double v56 = NSStringFromPoint(v249);
    [v231 addObject:v56];

    double v57 = objc_alloc_init(CRCameraReaderOutputIDCard);
    double v58 = [(CRCameraReaderOutput *)v57 objectInternal];
    [v58 setImageValue:rect];

    double v59 = [(CRCameraReaderOutput *)v57 objectInternal];
    [v59 setVertices:v9];

    CGAffineTransform v60 = [(CRCameraReaderOutput *)v57 objectInternal];
    [v60 setTargetVertices:v231];

    CGAffineTransform v61 = [(CRCameraReaderOutput *)v57 objectInternal];
    [v61 setCapturePath:v226];

    if ([v230 containsObject:@"CROutputTypeIDCardFront"])
    {
      double v62 = [(CRCameraReaderOutput *)v57 objectInternal];
      uint64_t v63 = v14;
      [v62 setType:@"CROutputTypeIDCardFront"];
    }
    else
    {
      double v62 = [(CRCameraReaderOutput *)v57 objectInternal];
      uint64_t v63 = v14;
      [v62 setType:@"CROutputTypeIDCardBack"];
    }

    double v67 = [(CRCameraReader *)self callbackDelegate];
    if (objc_opt_respondsToSelector())
    {
      double v68 = [(CRCameraReader *)self callbackDelegate];
      int v69 = [v68 cameraReader:self shouldReturnIDImage:v57];

      if (!v69) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    AudioServicesPlaySystemSound(0xFFFu);
    [(CRCameraReader *)self stopSession];
    uint64_t v70 = [MEMORY[0x263EFF8C0] arrayWithObject:v57];
    [(CRCameraReader *)self sendDidEndWithInfo:v70];

    [(CRCameraReader *)self sendDidEndAnimation];
    uint64_t v71 = [(CRCameraReader *)self cardBlurValues];
    [v71 removeAllObjects];

LABEL_24:
    uint64_t v14 = v63;
    goto LABEL_25;
  }
  double v64 = objc_opt_class();
  double v65 = [(CRCameraReader *)self correctedCardBuffer];
  [(CRCameraReader *)self borderPaddingIDCard];
  objc_msgSend(v64, "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:padding:inputOrientation:", v229, a4, v65, rect_16, v228, v14);
  v66 = double v20 = (void *)rect_16;
LABEL_26:

  rect_16a = (void *)v66;
  if (v66)
  {
    CGRect v72 = [(CRCameraReader *)self sessionManager];
    CGRect v73 = [(CRCameraReader *)self alignmentLayer];
    [v73 alignmentRect];
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    long long v82 = [(CRCameraReader *)self alignmentLayer];
    objc_msgSend(v72, "convertCameraRect:fromLayer:", v82, v75, v77, v79, v81);
    CGFloat v84 = v83;
    CGFloat v86 = v85;
    CGFloat v88 = v87;
    CGFloat v90 = v89;

    v264.origin.double x = v84;
    v264.origin.double y = v86;
    v264.size.double width = v88;
    v264.size.double height = v90;
    CGRect v265 = CGRectIntegral(v264);
    CGFloat v91 = v265.origin.x;
    CGFloat v92 = v265.origin.y;
    double width = v265.size.width;
    double height = v265.size.height;
    normalizedRectForSize();
    double v95 = v250.x;
    double v96 = v250.y;
    double v98 = v97;
    double v100 = v99;
    CVImageBufferRef v101 = NSStringFromPoint(v250);
    [v231 addObject:v101];

    CGFloat v102 = v95 + v98;
    v251.double x = v102;
    v251.double y = v96;
    v103 = NSStringFromPoint(v251);
    [v231 addObject:v103];

    CGFloat v104 = v96 + v100;
    v252.double x = v102;
    v252.double y = v104;
    v105 = NSStringFromPoint(v252);
    [v231 addObject:v105];

    v253.double x = v95;
    v253.double y = v104;
    uint64_t v106 = NSStringFromPoint(v253);
    [v231 addObject:v106];

    v266.origin.double x = v91;
    v266.origin.double y = v92;
    v266.size.double width = width;
    v266.size.double height = height;
    CGRect v267 = CGRectInset(v266, width * 0.1, height * 0.1);
    double recta = v267.origin.y;
    CGFloat v107 = v267.origin.x;
    CGFloat v108 = v267.size.width;
    CGFloat v109 = v267.size.height;
    v267.origin.double x = v91;
    v267.origin.double y = v92;
    v267.size.double width = width;
    v267.size.double height = height;
    CGRect v268 = CGRectInset(v267, width * -0.1, height * -0.1);
    double rect_8a = v268.origin.y;
    CGFloat v110 = v268.size.height;
    if (v225)
    {
      CGFloat v111 = v109;
      double v112 = v268.size.width;
      double v113 = v268.origin.x;
      double v114 = v108;
      double v115 = v107;
    }
    else
    {
      double v112 = v268.size.height;
      CGFloat v110 = v268.size.width;
      double v114 = v109;
      CGFloat v111 = v108;
      double v115 = recta;
      double v113 = v268.origin.y;
      double recta = v107;
      double rect_8a = v268.origin.x;
    }
    if (HIDWORD(v225))
    {
      size_t v116 = CVPixelBufferGetHeight(a4);
      size_t v117 = CVPixelBufferGetHeight(a4);
      double v118 = (double)v116 - (v114 + v115);
      double v119 = v112 + v113;
      double v115 = recta;
      double v113 = rect_8a;
      CGFloat v120 = v110;
      double recta = v118;
      double rect_8a = (double)v117 - v119;
      double v121 = v111;
    }
    else
    {
      CGFloat v120 = v112;
      double v112 = v110;
      double v121 = v114;
      double v114 = v111;
    }
    unint64_t v122 = 0;
    BOOL v123 = 0;
    v124 = v244;
    do
    {
      v125 = [rect_16a objectAtIndexedSubscript:v122];
      NSPoint v126 = NSPointFromString(v125);
      *(NSPoint *)(v124 - 1) = v126;

      normalizedPointForSize();
      double v127 = NSStringFromPoint(v254);
      [v9 addObject:v127];

      v269.origin.double x = rect_8a;
      v269.origin.double y = v113;
      v269.size.double width = v112;
      v269.size.double height = v120;
      if (!CGRectContainsPoint(v269, v126)) {
        break;
      }
      v270.origin.double x = recta;
      v270.origin.double y = v115;
      v270.size.double width = v114;
      v270.size.double height = v121;
      if (CGRectContainsPoint(v270, v126)) {
        break;
      }
      BOOL v123 = v122 > 2;
      v124 += 2;
      ++v122;
    }
    while (v122 != 4);
    if (v123)
    {
      rectFromPoints((uint64_t)v243);
      if ((int)(v128 * v129) >= (int)(v121 * v114))
      {
        rect_8b = v226;
        goto LABEL_45;
      }
    }
  }
  if ([(CRCameraReader *)self enableAltIDCardScan])
  {
    rect_8b = @"CRCameraReaderIDCardCapturePathFallback";

    double v130 = [(CRCameraReader *)self sessionManager];
    double v131 = [(CRCameraReader *)self alignmentLayer];
    [v131 alignmentRect];
    double v133 = v132;
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    v140 = [(CRCameraReader *)self alignmentLayer];
    objc_msgSend(v130, "convertCameraRect:fromLayer:", v140, v133, v135, v137, v139);
    CGFloat v142 = v141;
    CGFloat v144 = v143;
    CGFloat v146 = v145;
    CGFloat v148 = v147;

    v271.origin.double x = v142;
    v271.origin.double y = v144;
    v271.size.double width = v146;
    v271.size.double height = v148;
    CGRect v272 = CGRectIntegral(v271);
    CGFloat v149 = v272.origin.x;
    double v150 = v272.origin.y;
    double v151 = v272.size.width;
    double v152 = v272.size.height;
    size_t v153 = CVPixelBufferGetHeight(a4);
    CVPixelBufferGetWidth([(CRCameraReader *)self correctedCardBuffer]);
    CVPixelBufferGetHeight([(CRCameraReader *)self correctedCardBuffer]);
    [(CRCameraReader *)self borderPaddingIDCard];
    float rectb = v154;
    [(CRCameraReader *)self borderPaddingIDCard];
    LODWORD(v146) = v155;
    size_t v156 = CVPixelBufferGetWidth(a4);
    size_t v157 = CVPixelBufferGetHeight(a4);
    double v158 = (double)v153 - (v152 + v150);
    double v227 = v149;
    normalizedRectForSize();
    double v159 = v255.x;
    double v160 = v255.y;
    double v162 = v161;
    double v164 = v163;
    CGRect v165 = NSStringFromPoint(v255);
    [v231 addObject:v165];

    CGFloat v166 = v159 + v162;
    v256.double x = v166;
    v256.double y = v160;
    v167 = NSStringFromPoint(v256);
    [v231 addObject:v167];

    CGFloat v168 = v160 + v164;
    v257.double x = v166;
    v257.double y = v168;
    v169 = NSStringFromPoint(v257);
    [v231 addObject:v169];

    v258.double x = v159;
    v258.double y = v168;
    v170 = NSStringFromPoint(v258);
    [v231 addObject:v170];
    *(float *)&CGFloat v168 = v152 * rectb;

    *(float *)&CGFloat v166 = v151 * *(float *)&v146;
    LODWORD(v171) = LODWORD(v166);
    LODWORD(v172) = LODWORD(v168);
    +[CRCameraReader uniformPadRect:widthPadding:heightPadding:width:height:](CRCameraReader, "uniformPadRect:widthPadding:heightPadding:width:height:", v227, v158, v151, v152, v171, v172, (float)v156, (float)v157);
    +[CRCameraReader aspectRatioPaddedRect:expectedWidth:height:orientation:](CRCameraReader, "aspectRatioPaddedRect:expectedWidth:height:orientation:", v14);
    double v174 = v173;
    double v176 = v175;
    double v178 = v177;
    double v180 = v179;
    normalizedRectForSize();
    double v181 = v259.x;
    double v182 = v259.y;
    double v184 = v183;
    double v186 = v185;
    v187 = NSStringFromPoint(v259);
    [v9 addObject:v187];

    CGFloat v188 = v181 + v184;
    v260.double x = v188;
    v260.double y = v182;
    v189 = NSStringFromPoint(v260);
    [v9 addObject:v189];

    CGFloat v190 = v182 + v186;
    v261.double x = v188;
    v261.double y = v190;
    v191 = NSStringFromPoint(v261);
    [v9 addObject:v191];

    v262.double x = v181;
    v262.double y = v190;
    v192 = NSStringFromPoint(v262);
    [v9 addObject:v192];

    v193 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a4];
    v194 = objc_msgSend(v193, "imageByCroppingToRect:", v174, v176, v178, v180);

    CGAffineTransformMakeTranslation(&v242, -v174, -v176);
    v195 = [v194 imageByApplyingTransform:&v242];

    v196 = [v195 imageByApplyingOrientation:v14];

    v197 = [v196 imageByApplyingOrientation:6];

    size_t v198 = CVPixelBufferGetWidth([(CRCameraReader *)self correctedCardBuffer]);
    [v197 extent];
    double v200 = v199;
    size_t v201 = CVPixelBufferGetHeight([(CRCameraReader *)self correctedCardBuffer]);
    [v197 extent];
    CGFloat v203 = fmin((double)v198 / v200, (double)v201 / v202);
    CGAffineTransformMakeScale(&v241, v203, v203);
    v204 = [v197 imageByApplyingTransform:&v241];

    v205 = [MEMORY[0x263F00628] contextWithOptions:0];
    v206 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F005B8], *MEMORY[0x263F005B0], MEMORY[0x263EFFA80], *MEMORY[0x263F005D0], MEMORY[0x263EFFA88], *MEMORY[0x263F005D8], 0);
    v240 = [MEMORY[0x263F00630] detectorOfType:*MEMORY[0x263F005F0] context:v205 options:v206];
    v207 = [v240 featuresInImage:v204 options:v206];
    v208 = [v204 imageByApplyingOrientation:5];
    v209 = [v240 featuresInImage:v208 options:v206];

    if ((unint64_t)[v207 count] <= 2 && (unint64_t)objc_msgSend(v209, "count") < 3)
    {

      goto LABEL_55;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v211 = [(CRCameraReader *)self correctedCardBuffer];
    size_t v212 = CVPixelBufferGetWidth([(CRCameraReader *)self correctedCardBuffer]);
    -[CRCameraReaderOutputIDCard render:toCVPixelBuffer:bounds:colorSpace:](v205, "render:toCVPixelBuffer:bounds:colorSpace:", v204, v211, DeviceRGB, 0.0, 0.0, (double)v212, (double)CVPixelBufferGetHeight([(CRCameraReader *)self correctedCardBuffer]));
    CGColorSpaceRelease(DeviceRGB);

LABEL_45:
    v204 = objc_msgSend(MEMORY[0x263F00650], "imageWithCVPixelBuffer:", -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
    v213 = [(CRCameraReader *)self cardBlurValues];
    BOOL v214 = isLeastBlurryFrame(v204, v213, 10);

    if (!v214)
    {
LABEL_57:

      goto LABEL_58;
    }
    v205 = objc_alloc_init(CRCameraReaderOutputIDCard);
    v206 = [MEMORY[0x263F00628] contextWithOptions:0];
    [v204 extent];
    v215 = (CGImage *)objc_msgSend(v206, "createCGImage:fromRect:", v204);
    v240 = [MEMORY[0x263F1C6B0] imageWithCGImage:v215];
    CGImageRelease(v215);
    v216 = [(CRCameraReaderOutput *)v205 objectInternal];
    [v216 setImageValue:v240];

    if ([v230 containsObject:@"CROutputTypeIDCardFront"])
    {
      v217 = [(CRCameraReaderOutput *)v205 objectInternal];
      [v217 setType:@"CROutputTypeIDCardFront"];
    }
    else
    {
      v217 = [(CRCameraReaderOutput *)v205 objectInternal];
      [v217 setType:@"CROutputTypeIDCardBack"];
    }

    v218 = [(CRCameraReaderOutput *)v205 objectInternal];
    [v218 setVertices:v9];

    v219 = [(CRCameraReaderOutput *)v205 objectInternal];
    [v219 setTargetVertices:v231];

    v220 = [(CRCameraReaderOutput *)v205 objectInternal];
    [v220 setCapturePath:rect_8b];

    v221 = [(CRCameraReader *)self callbackDelegate];
    if (objc_opt_respondsToSelector())
    {
      v222 = [(CRCameraReader *)self callbackDelegate];
      int v223 = [v222 cameraReader:self shouldReturnIDImage:v205];

      if (!v223) {
        goto LABEL_56;
      }
    }
    else
    {
    }
    AudioServicesPlaySystemSound(0xFFFu);
    [(CRCameraReader *)self stopSession];
    v224 = [MEMORY[0x263EFF8C0] arrayWithObject:v205];
    [(CRCameraReader *)self sendDidEndWithInfo:v224];

    [(CRCameraReader *)self sendDidEndAnimation];
    v207 = [(CRCameraReader *)self cardBlurValues];
    [v207 removeAllObjects];
LABEL_55:

LABEL_56:
    goto LABEL_57;
  }
  rect_8b = v226;
LABEL_58:
}

- (void)findObjects:(id)a3 inPixelBuffer:(__CVBuffer *)a4 cameraIntrinsicData:(id)a5 frameTime:(id *)a6
{
  uint64_t v437 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v330 = v10;
  id v331 = a5;
  CVPixelBufferRef pixelBuffer = a4;
  CVPixelBufferRetain(a4);
  double v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v12 = [v11 BOOLForKey:@"com.apple.CoreRecognition.disable_fixedbox"];

  uint64_t v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LODWORD(v361) = [v13 BOOLForKey:@"com.apple.CoreRecognition.disable_freeformbox"];

  v338 = [MEMORY[0x263EFF9A0] dictionary];
  v333 = [MEMORY[0x263EFFA08] setWithArray:v10];
  [(CRCameraReader *)self updatePinnedInfoFrameIndex];
  v332 = [MEMORY[0x263EFF980] arrayWithObject:@"CROutputTypeCreditCardNumber"];
  uint64_t v14 = [(CRCameraReader *)self pinnedFoundInfo];
  double v15 = objc_msgSend(v14, "objectForKey:");

  CVPixelBufferRef v16 = [(CRCameraReader *)self nameCutRects];
  int v355 = v12;
  if ([v16 count])
  {
    double v17 = [(CRCameraReader *)self nameCutRects];
    int v18 = [v17 count] == 8;
  }
  else
  {
    int v18 = 1;
  }

  double v19 = [(CRCameraReader *)self dateCutRects];
  if ([v19 count])
  {
    double v20 = [(CRCameraReader *)self dateCutRects];
    int v21 = [v20 count] == 8;
  }
  else
  {
    int v21 = 1;
  }

  id v22 = [(CRCameraReader *)self pinnedFoundInfo];
  double v23 = objc_msgSend(v22, "objectForKey:");

  double v24 = [(CRCameraReader *)self cardNumberCounts];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    double v26 = [(CRCameraReader *)self pinnedFoundInfo];
    double v27 = [v26 objectForKey:@"code"];

    if (v27)
    {
      if (!v15 && [v333 containsObject:@"CROutputTypeCreditCardName"])
      {
        if (!v23 && v18 != v21 && ((v21 ^ 1 | v18) & 1) != 0)
        {
LABEL_16:
          if ([v333 containsObject:@"CRCameraReaderCreditCardExpirationDate"]
            && (v15 || v18 == v21 || ((v18 ^ 1 | v21) & 1) == 0))
          {
            [v332 addObject:@"CRCameraReaderCreditCardExpirationDate"];
          }
          goto LABEL_22;
        }
        [v332 addObject:@"CROutputTypeCreditCardName"];
      }
      if (!v23) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    [v332 addObjectsFromArray:v10];
  }
LABEL_22:
  double v28 = (void *)[objc_alloc(MEMORY[0x263F7ECB0]) initWithWidth:768 height:480 colorSpace:0];
  double v29 = +[CRInsights sharedInsights];
  if (v29)
  {
    double v30 = +[CRInsights sharedInsights];
    id v31 = [v30 allowOverrideWithKey:@"boxPoints" forValue:0];
  }
  else
  {
    id v31 = 0;
  }

  uint64_t v32 = objc_msgSend((id)objc_opt_class(), "extractCardImage:fromPixelBuffer:withCardBuffer:withPoints:cameraIntrinsicData:", v28, pixelBuffer, -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"), v31, v331);

  double v33 = +[CRInsights sharedInsights];
  v337 = (void *)v32;
  if (v33)
  {
    id v34 = +[CRInsights sharedInsights];
    id v35 = [v34 allowOverrideWithKey:@"CRInsightsCardImageFreeformLandscape" forValue:v28];

    double v36 = v35;
  }
  else
  {
    id v34 = v28;
    double v36 = v34;
  }

  v334 = v36;
  double v37 = +[CRInsights sharedInsights];
  if (v37)
  {
    CGFloat v38 = +[CRInsights sharedInsights];
    double v39 = [v38 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_232];
  }
  else
  {
    double v39 = [NSNumber numberWithBool:0];
    CGFloat v38 = v39;
  }
  if ([v39 BOOLValue]) {
    [v36 ciImage];
  }
  else {
    objc_msgSend(MEMORY[0x263F00650], "imageWithCVPixelBuffer:", -[CRCameraReader correctedCardBuffer](self, "correctedCardBuffer"));
  }
  id v329 = (id)objc_claimAutoreleasedReturnValue();

  if (v37) {
  v364 = self;
  }

  CGFloat v40 = +[CRInsights sharedInsights];
  if (v40)
  {
    double v41 = +[CRInsights sharedInsights];
    v427[0] = MEMORY[0x263EF8330];
    v427[1] = 3221225472;
    v427[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_2;
    v427[3] = &unk_26429E740;
    char v429 = (char)v361;
    v349 = &v428;
    id v428 = v337;
    CGFloat v42 = [(__CFString *)v41 allowOverrideWithKey:@"kOverrideShouldRunFreeformPath" forResultFromBlock:v427];
  }
  else
  {
    [NSNumber numberWithBool:(v337 != 0) & ~v361];
    CGFloat v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v41 = v42;
  }
  double v43 = v42;
  int v44 = [(__CFString *)v42 BOOLValue];
  if (v40) {

  }
  if (v44)
  {
    double v45 = +[CRInsights sharedInsights];
    obuint64_t j = @"CRInsightsContextImagePath";
    objc_msgSend(v45, "setContextValue:forKey:", @"CRInsightsContextImagePathFreeform");

    double v46 = +[CRInsights sharedInsights];
    [v46 setContextValue:@"CRInsightsContextImageOrientationLandscape" forKey:@"CRInsightsContextImageOrientation"];

    long long v425 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(CRCameraReader *)self setPointsFound:&v425];
    [v338 setValue:v337 forKey:@"boxPoints"];
    double v47 = +[CRInsights sharedInsights];
    [v47 provideInsightValue:v337 forKey:@"boxPoints"];

    double v48 = +[CRInsights sharedInsights];
    [v48 provideInsightValue:v36 forKey:@"CRInsightsCardImageFreeformLandscape"];

    long long v423 = *(_OWORD *)&a6->var0;
    int64_t v424 = a6->var3;
    [(CRCameraReader *)self sendDidFindTarget:v337 frameTime:&v423];
    double v49 = +[CRInsights sharedInsights];
    if (v49)
    {
      double v50 = +[CRInsights sharedInsights];
      double v51 = [v50 allowOverrideWithKey:@"kCROverrideShouldRunEmbossedPath" forResultFromBlock:&__block_literal_global_234];
    }
    else
    {
      double v51 = [NSNumber numberWithBool:1];
      double v50 = v51;
    }
    int v52 = [v51 BOOLValue];
    if (v49) {

    }
    if (v52)
    {
      double v53 = [(CRCameraReader *)self findObjectsEmbossed:v332 inImage:v334];
      CGFloat v54 = +[CRInsights sharedInsights];
      [v54 provideInsightValue:v53 forKey:@"CRInsightsEmbossedResultsFreeformLandscape"];

      [(CRCameraReader *)self mergeInfo:v53 intoFindInfo:v338];
    }
    v352 = +[CRInsights sharedInsights];
    if (v352)
    {
      id v55 = +[CRInsights sharedInsights];
      v421[0] = MEMORY[0x263EF8330];
      v421[1] = 3221225472;
      v421[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_4;
      v421[3] = &unk_26429E768;
      v421[4] = self;
      id v422 = v329;
      v358 = [v55 allowOverrideWithKey:@"kCROverrideRegionsFreeformLandscape" forResultFromBlock:v421];

      v344 = &v422;
    }
    else
    {
      id v55 = [(id)objc_opt_class() targetRectsForImage:v329];
      v358 = (id *)v55;
    }

    double v56 = +[CRInsights sharedInsights];
    [v56 provideInsightValue:v358 forKey:@"CRInsightsTextDetectorRegionsFreeformLandscape"];

    if ([v358 count])
    {
      double v57 = [(CRCameraReader *)self findObjectsFlat:v330 inImage:v334 numberRects:v358 invert:0];
      double v58 = +[CRInsights sharedInsights];
      [v58 provideInsightValue:v57 forKey:@"CRInsightsTextDetectorResultsFreeformLandscape"];

      [(CRCameraReader *)self mergeInfo:v57 intoFindInfo:v338];
    }
    double v59 = +[CRInsights sharedInsights];
    if (v59)
    {
      CGAffineTransform v60 = +[CRInsights sharedInsights];
      v419[0] = MEMORY[0x263EF8330];
      v419[1] = 3221225472;
      v419[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_5;
      v419[3] = &unk_26429E790;
      v341 = &v420;
      id v420 = v338;
      CGAffineTransform v61 = [v60 allowOverrideWithKey:@"kCROverrideShouldRunPortraitFlatPrintedPath" forResultFromBlock:v419];
    }
    else
    {
      double v62 = NSNumber;
      CGAffineTransform v60 = [v338 objectForKey:@"code"];
      CGAffineTransform v61 = [v62 numberWithBool:v60 == 0];
    }
    int v63 = [v61 BOOLValue];

    if (v63)
    {
      double v64 = +[CRInsights sharedInsights];
      [v64 setContextValue:@"CRInsightsContextImageOrientationPortrait" forKey:@"CRInsightsContextImageOrientation"];

      double v65 = +[CRInsights sharedInsights];
      if (v65)
      {
        id v66 = +[CRInsights sharedInsights];
        double v67 = [v334 imageByRotating90CW];
        id v68 = [v66 allowOverrideWithKey:@"CRInsightsCardImageFreeformPortrait" forValue:v67];
      }
      else
      {
        id v66 = [v334 imageByRotating90CW];
        id v68 = v66;
      }

      int v69 = +[CRInsights sharedInsights];
      [v69 provideInsightValue:v68 forKey:@"CRInsightsCardImageFreeformPortrait"];

      uint64_t v70 = +[CRInsights sharedInsights];
      uint64_t v6 = self;
      if (v70)
      {
        uint64_t v71 = +[CRInsights sharedInsights];
        v417[0] = MEMORY[0x263EF8330];
        v417[1] = 3221225472;
        v417[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_6;
        v417[3] = &unk_26429E768;
        v417[4] = v364;
        id v418 = v68;
        CGRect v72 = [v71 allowOverrideWithKey:@"kCROverrideRegionsFreeformPortrait" forResultFromBlock:v417];
        v339 = &v418;
      }
      else
      {
        CGRect v73 = objc_opt_class();
        uint64_t v71 = [v68 ciImage];
        CGRect v72 = [v73 targetRectsForImage:v71];
      }
      id v74 = v72;

      double v75 = +[CRInsights sharedInsights];
      [v75 provideInsightValue:v74 forKey:@"CRInsightsTextDetectorRegionsFreeformPortrait"];

      if ([v74 count])
      {
        double v76 = [(CRCameraReader *)v364 findObjectsFlat:v330 inImage:v68 numberRects:v74 invert:0];
        [(CRCameraReader *)v364 mergeInfo:v76 intoFindInfo:v338];
        double v77 = +[CRInsights sharedInsights];
        [v77 provideInsightValue:v76 forKey:@"CRInsightsTextDetectorResultsFreeformPortrait"];

        double v78 = [v338 objectForKey:@"code"];
        LODWORD(v77) = v78 == 0;

        if (v77)
        {
          double v79 = +[CRInsights sharedInsights];
          [v79 setContextValue:@"CRInsightsContextImageOrientationPortraitInverted" forKey:@"CRInsightsContextImageOrientation"];

          uint64_t v6 = v364;
          double v80 = [(CRCameraReader *)v364 findObjectsFlat:v330 inImage:v68 numberRects:v74 invert:1];
          [(CRCameraReader *)v364 mergeInfo:v80 intoFindInfo:v338];
        }
      }

      if (v70) {
    }
      }
    if (v59) {

    }
    double v81 = +[CRInsights sharedInsights];
    [v81 setContextValue:0 forKey:@"CRInsightsContextImageOrientation"];

    double v41 = +[CRInsights sharedInsights];
    [(__CFString *)v41 setContextValue:0 forKey:@"CRInsightsContextImagePath"];

    if (v352) {
  }
    }
  if (v40) {

  }
  long long v82 = +[CRInsights sharedInsights];
  if (v82)
  {
    double v83 = +[CRInsights sharedInsights];
    double v41 = @"kOverrideShouldRunFixedCutPath";
    v414[0] = MEMORY[0x263EF8330];
    v414[1] = 3221225472;
    v414[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_7;
    v414[3] = &unk_26429E740;
    char v416 = v355;
    id v415 = v338;
    CGFloat v84 = [v83 allowOverrideWithKey:@"kOverrideShouldRunFixedCutPath" forResultFromBlock:v414];
    int v85 = 0;
    v358 = &v415;
  }
  else
  {
    CGFloat v86 = NSNumber;
    if (v355)
    {
      BOOL v87 = 0;
    }
    else
    {
      double v41 = [v338 objectForKey:@"code"];
      BOOL v87 = v41 == 0;
    }
    CGFloat v84 = [v86 numberWithBool:v87];
    int v85 = v355 ^ 1;
    double v83 = v84;
  }
  int v88 = [v84 BOOLValue];
  if (v82) {

  }
  if (v85) {
  if (v88)
  }
  {
    double v89 = +[CRInsights sharedInsights];
    [v89 setContextValue:@"CRInsightsContextImagePathFixedCut" forKey:@"CRInsightsContextImagePath"];

    CGFloat v90 = +[CRInsights sharedInsights];
    [v90 setContextValue:@"CRInsightsContextImageOrientationLandscape" forKey:@"CRInsightsContextImageOrientation"];

    CGFloat v91 = [(CRCameraReader *)v364 sessionManager];
    CGFloat v92 = [(CRCameraReader *)v364 alignmentLayer];
    [v92 alignmentRect];
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;
    CVImageBufferRef v101 = [(CRCameraReader *)v364 alignmentLayer];
    objc_msgSend(v91, "convertCameraRect:fromLayer:", v101, v94, v96, v98, v100);
    CGFloat v103 = v102;
    CGFloat v105 = v104;
    CGFloat v107 = v106;
    CGFloat v109 = v108;

    v438.origin.double x = v103;
    v438.origin.double y = v105;
    v438.size.double width = v107;
    v438.size.double height = v109;
    CGRect v439 = CGRectIntegral(v438);
    double x = v439.origin.x;
    double y = v439.origin.y;
    double width = v439.size.width;
    double height = v439.size.height;
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
    if (WidthOfPlane && HeightOfPlane && !CVPixelBufferLockBaseAddress(pixelBuffer, 0))
    {
      v350 = (void *)[objc_alloc(MEMORY[0x263F7ECB0]) initWithCVPixelBuffer:pixelBuffer toColorSpace:0];
      v356 = objc_msgSend(v350, "imageByCroppingRectangle:", x, y, width, height);
      if (height > width)
      {
        uint64_t v116 = [v356 imageByRotating90CW];

        v356 = (void *)v116;
      }
      size_t v117 = +[CRInsights sharedInsights];
      [v117 provideInsightValue:v356 forKey:@"CRInsightsCardImageFixedCutLandscape"];

      v353 = +[CRInsights sharedInsights];
      if (v353)
      {
        double v118 = +[CRInsights sharedInsights];
        v412[0] = MEMORY[0x263EF8330];
        v412[1] = 3221225472;
        v412[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_8;
        v412[3] = &unk_26429E768;
        v412[4] = v364;
        id v413 = v356;
        double v119 = [v118 allowOverrideWithKey:@"kCROverrideRegionsFixedCutLandscape" forResultFromBlock:v412];
        obuint64_t j = (__CFString *)&v413;
      }
      else
      {
        CGFloat v120 = objc_opt_class();
        double v118 = [v356 ciImage];
        double v119 = [v120 targetRectsForImage:v118];
      }
      id v121 = v119;

      unint64_t v122 = +[CRInsights sharedInsights];
      [v122 provideInsightValue:v121 forKey:@"CRInsightsTextDetectorRegionsFixedCutLandscape"];

      if ([v121 count])
      {
        BOOL v123 = [(CRCameraReader *)v364 findObjectsFlat:v330 inImage:v356 numberRects:v121 invert:0];
        v124 = +[CRInsights sharedInsights];
        [v124 provideInsightValue:v123 forKey:@"CRInsightsTextDetectorResultsFixedCutLandscape"];

        [(CRCameraReader *)v364 mergeInfo:v123 intoFindInfo:v338];
      }
      v125 = +[CRInsights sharedInsights];
      if (v125)
      {
        NSPoint v126 = +[CRInsights sharedInsights];
        v410[0] = MEMORY[0x263EF8330];
        v410[1] = 3221225472;
        v410[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_9;
        v410[3] = &unk_26429E790;
        uint64_t v6 = (CRCameraReader *)&v411;
        id v411 = v338;
        double v127 = [v126 allowOverrideWithKey:@"kCROverrideShouldRunEmbossedPath" forResultFromBlock:v410];
      }
      else
      {
        double v128 = NSNumber;
        NSPoint v126 = [v338 objectForKey:@"code"];
        double v127 = [v128 numberWithBool:v126 == 0];
      }
      int v129 = [v127 BOOLValue];

      if (v129)
      {
        double v130 = [(CRCameraReader *)v364 findObjectsEmbossed:v332 inImage:v356];
        double v131 = +[CRInsights sharedInsights];
        [v131 provideInsightValue:v130 forKey:@"CRInsightsEmbossedResultsFixedCutLandscape"];

        [(CRCameraReader *)v364 mergeInfo:v130 intoFindInfo:v338];
      }
      if (v125) {

      }
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      if (v353) {
    }
      }
    double v132 = +[CRInsights sharedInsights];
    [v132 setContextValue:0 forKey:@"CRInsightsContextImageOrientation"];

    double v133 = +[CRInsights sharedInsights];
    [v133 setContextValue:0 forKey:@"CRInsightsContextImagePath"];
  }
  if (v82) {

  }
  double v134 = +[CRInsights sharedInsights];
  if (v134)
  {
    double v135 = +[CRInsights sharedInsights];
    v406[0] = MEMORY[0x263EF8330];
    v406[1] = 3221225472;
    v406[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_10;
    v406[3] = &unk_26429E7B8;
    v358 = &v407;
    id v407 = v338;
    char v409 = (char)v361;
    v361 = &v408;
    id v408 = v337;
    double v136 = [v135 allowOverrideWithKey:@"kCROverrideShouldRunFreeformInvertedPath" forResultFromBlock:v406];
  }
  else
  {
    double v137 = NSNumber;
    double v135 = [v338 objectForKey:@"accepted"];
    if ([v135 BOOLValue]) {
      uint64_t v138 = 0;
    }
    else {
      uint64_t v138 = (v337 != 0) & ~v361;
    }
    double v136 = [v137 numberWithBool:v138];
  }
  int v139 = [v136 BOOLValue];

  if (v139)
  {
    v140 = +[CRInsights sharedInsights];
    [v140 setContextValue:@"CRInsightsContextImagePathFreeform" forKey:@"CRInsightsContextImagePath"];

    double v141 = +[CRInsights sharedInsights];
    [v141 setContextValue:@"CRInsightsContextImageOrientationLandscapeInverted" forKey:@"CRInsightsContextImageOrientation"];

    CGFloat v142 = [v334 imageByRotating180];
    double v143 = +[CRInsights sharedInsights];
    if (v143)
    {
      CGFloat v144 = +[CRInsights sharedInsights];
      double v145 = [v144 allowOverrideWithKey:@"kCROverrideShouldRunEmbossedPath" forResultFromBlock:&__block_literal_global_237];
    }
    else
    {
      double v145 = [NSNumber numberWithBool:1];
      CGFloat v144 = v145;
    }
    int v146 = [v145 BOOLValue];
    if (v143) {

    }
    if (v146)
    {
      double v147 = +[CRInsights sharedInsights];
      [v147 provideInsightValue:v142 forKey:@"CRInsightsCardImageFreeformLandscapeInverted"];

      CGFloat v148 = [(CRCameraReader *)v364 findObjectsEmbossed:v332 inImage:v142];
      uint64_t v149 = +[CRInsights sharedInsights];
      [(id)v149 provideInsightValue:v148 forKey:@"CRInsightsEmbossedResultsFreeformLandscapeInverted"];

      double v150 = [v148 objectForKey:@"code"];
      LOBYTE(v149) = v150 == 0;

      if ((v149 & 1) == 0)
      {
        [(CRCameraReader *)v364 mergeInfo:v148 intoFindInfo:v338];
        [v338 setValue:MEMORY[0x263EFFA88] forKey:@"inverted"];
      }
    }
    double v151 = [v338 objectForKey:@"code"];
    BOOL v152 = v151 == 0;

    if (v152)
    {
      size_t v153 = +[CRInsights sharedInsights];
      p_isa = (id *)&v364->super.super.super.isa;
      if (v153)
      {
        int v155 = +[CRInsights sharedInsights];
        v404[0] = MEMORY[0x263EF8330];
        v404[1] = 3221225472;
        v404[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_12;
        v404[3] = &unk_26429E768;
        v404[4] = v364;
        id v405 = v142;
        size_t v156 = [v155 allowOverrideWithKey:@"kCROverrideRegionsFreeformLandscapeInverted" forResultFromBlock:v404];
        p_isa = &v405;
      }
      else
      {
        size_t v157 = objc_opt_class();
        int v155 = [v142 ciImage];
        size_t v156 = [v157 targetRectsForImage:v155];
      }
      id v158 = v156;

      double v159 = +[CRInsights sharedInsights];
      [v159 provideInsightValue:v158 forKey:@"CRInsightsTextDetectorRegionsFreeformLandscapeInverted"];

      if ([v158 count])
      {
        double v160 = [(CRCameraReader *)v364 findObjectsFlat:v330 inImage:v142 numberRects:v158 invert:0];
        uint64_t v161 = +[CRInsights sharedInsights];
        [(id)v161 provideInsightValue:v160 forKey:@"CRInsightsTextDetectorResultsFreeformLandscapeInverted"];

        double v162 = [v160 objectForKey:@"code"];
        LOBYTE(v161) = v162 == 0;

        if ((v161 & 1) == 0)
        {
          [(CRCameraReader *)v364 mergeInfo:v160 intoFindInfo:v338];
          [v338 setValue:MEMORY[0x263EFFA88] forKey:@"inverted"];
        }
      }
      if (v153) {
    }
      }
    double v163 = +[CRInsights sharedInsights];
    [v163 setContextValue:0 forKey:@"CRInsightsContextImageOrientation"];

    double v164 = +[CRInsights sharedInsights];
    [v164 setContextValue:0 forKey:@"CRInsightsContextImagePath"];
  }
  if (v134)
  {
  }
  v336 = [v338 objectForKey:@"boxPoints"];
  v345 = [v338 objectForKey:@"code"];
  v327 = [v338 objectForKey:@"codeOrigin"];
  v328 = [v338 objectForKey:@"codeFragmentOrigins"];
  v340 = [v338 objectForKey:@"expirationDate"];
  CGRect v165 = [v338 objectForKey:@"accepted"];
  int v326 = [v165 BOOLValue];

  [v338 objectForKey:@"nameResults"];
  long long v402 = 0u;
  long long v403 = 0u;
  long long v400 = 0u;
  long long v401 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v354 = [obja countByEnumeratingWithState:&v400 objects:v436 count:16];
  if (!v354)
  {
    char v342 = 0;
    goto LABEL_196;
  }
  char v342 = 0;
  uint64_t v351 = *(void *)v401;
  do
  {
    uint64_t v357 = 0;
    do
    {
      if (*(void *)v401 != v351) {
        objc_enumerationMutation(obja);
      }
      v359 = *(void **)(*((void *)&v400 + 1) + 8 * v357);
      CGFloat v166 = [v359 objectForKey:@"isValidNameString"];
      int v167 = [v166 BOOLValue];

      if (v167)
      {
        v362 = [v359 objectForKey:@"nameResult"];
        CGFloat v168 = [v359 objectForKey:@"minMatchDistance"];
        int v169 = [v168 intValue];

        v170 = [v359 objectForKey:@"nameAccepted"];
        if ([v170 BOOLValue])
        {

          goto LABEL_150;
        }
        double v171 = [v359 objectForKey:@"closestNameDistance"];
        if (v171)
        {
          double v172 = [v359 objectForKey:@"closestNameDistance"];
          BOOL v173 = [v172 integerValue] > v169;

          if (!v173)
          {
LABEL_150:
            [v359 objectForKey:@"cardholderName"];
            v362 = v170 = v362;
            goto LABEL_151;
          }
        }
        else
        {
LABEL_151:
        }
        double v174 = [(CRCameraReader *)v364 cardholderCounts];
        double v175 = [v174 objectForKey:v362];
        BOOL v176 = v175 == 0;

        if (!v176)
        {
          double v177 = [(CRCameraReader *)v364 cardholderCounts];
          double v178 = [v177 objectForKey:v362];
          int v179 = [v178 intValue];

          long long v398 = 0u;
          long long v399 = 0u;
          long long v396 = 0u;
          long long v397 = 0u;
          double v180 = [(CRCameraReader *)v364 cardholderCounts];
          uint64_t v181 = [v180 countByEnumeratingWithState:&v396 objects:v435 count:16];
          uint64_t v182 = (v179 + 1);
          if (v181)
          {
            uint64_t v183 = *(void *)v397;
            while (2)
            {
              for (uint64_t i = 0; i != v181; ++i)
              {
                if (*(void *)v397 != v183) {
                  objc_enumerationMutation(v180);
                }
                double v185 = *(void **)(*((void *)&v396 + 1) + 8 * i);
                double v186 = [(CRCameraReader *)v364 cardholderCounts];
                v187 = [v186 objectForKey:v185];
                int v188 = [v187 intValue];

                BOOL v189 = v188 == 2 || v182 == 2;
                if (v189 && [v362 editDistanceFromString:v185] == 1)
                {
                  if (v188 == 2)
                  {
                    id v193 = v185;

                    uint64_t v182 = 3;
                    v362 = v193;
                  }
                  else
                  {
                    uint64_t v182 = 3;
                  }
                  goto LABEL_178;
                }
              }
              uint64_t v181 = [v180 countByEnumeratingWithState:&v396 objects:v435 count:16];
              if (v181) {
                continue;
              }
              break;
            }
          }
LABEL_178:

          double v200 = [(CRCameraReader *)v364 cardholderCounts];
          size_t v201 = [NSNumber numberWithInt:v182];
          [v200 setObject:v201 forKey:v362];
          goto LABEL_179;
        }
        CGFloat v190 = [v359 objectForKey:@"nameAccepted"];
        char v191 = [v190 BOOLValue];

        if (v191)
        {
          uint64_t v192 = 4;
          goto LABEL_175;
        }
        v194 = [v359 objectForKey:@"closestNameDistance"];
        if (v194
          && ([v359 objectForKey:@"closestNameDistance"],
              v195 = objc_claimAutoreleasedReturnValue(),
              BOOL v196 = [v195 integerValue] > v169,
              v195,
              v194,
              v197 = v364,
              !v196))
        {
          uint64_t v192 = 3;
        }
        else
        {
          size_t v198 = [v359 objectForKey:@"isNonNameString"];
          int v199 = [v198 BOOLValue];

          if (v199) {
            uint64_t v192 = 4294967294;
          }
          else {
            uint64_t v192 = 1;
          }
LABEL_175:
          v197 = v364;
        }
        double v200 = [(CRCameraReader *)v197 cardholderCounts];
        size_t v201 = [NSNumber numberWithInt:v192];
        [v200 setObject:v201 forKey:v362];
LABEL_179:

        double v202 = [(CRCameraReader *)v364 cardholderCounts];
        CGFloat v203 = [v202 objectForKey:v362];
        uint64_t v204 = [v203 intValue];

        v205 = [(CRCameraReader *)v364 cardholderCounts];
        v206 = [NSNumber numberWithInt:v204];
        [v205 setObject:v206 forKey:v362];

        v207 = [(CRCameraReader *)v364 pinnedFoundInfo];
        v208 = [v207 objectForKey:@"cardholderName"];

        if (v208)
        {
          v209 = [(CRCameraReader *)v364 cardholderCounts];
          v210 = [v209 objectForKey:v208];
          int v211 = [v210 intValue];
        }
        else
        {
          int v211 = 0;
        }
        if (v345 && (int)v204 >= 3 && (int)v204 > v211)
        {
          size_t v212 = [(CRCameraReader *)v364 pinnedFoundInfo];
          v213 = [v212 objectForKey:@"cardholderName"];
          char v214 = [v213 isEqualToString:v362];

          if ((v214 & 1) == 0)
          {
            long long v394 = *(_OWORD *)&a6->var0;
            int64_t v395 = a6->var3;
            [(CRCameraReader *)v364 setLastFieldFoundTime:&v394];
            char v342 = 1;
          }
          v215 = [(CRCameraReader *)v364 pinnedFoundInfo];
          [v215 setObject:v362 forKey:@"cardholderName"];

          [(CRCameraReader *)v364 setFirstTimeFrameIndexForPinnedField:@"cardholderName"];
          v216 = [(CRCameraReader *)v364 pinnedFoundInfo];
          v217 = [v216 objectForKey:@"nameOrigin"];
          BOOL v218 = v217 == 0;

          if (v218)
          {
            v219 = [(CRCameraReader *)v364 pinnedFoundInfo];
            v220 = [v359 objectForKey:@"nameOrigin"];
            [v219 setObject:v220 forKey:@"nameOrigin"];
          }
        }
      }
      ++v357;
    }
    while (v357 != v354);
    uint64_t v221 = [obja countByEnumeratingWithState:&v400 objects:v436 count:16];
    uint64_t v354 = v221;
  }
  while (v221);
LABEL_196:

  if (v345)
  {
    v222 = [(CRCameraReader *)v364 cardNumberCounts];
    int v223 = [v222 objectForKey:v345];
    int v224 = [v223 intValue];

    uint64_t v225 = [v345 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    unint64_t v363 = [v225 length];

    v226 = [(CRCameraReader *)v364 cardNumberCounts];
    int v360 = v224 + 1;
    double v227 = objc_msgSend(NSNumber, "numberWithInt:");
    [v226 setObject:v227 forKey:v345];

    if ((v363 & 0xFFFFFFFFFFFFFFFDLL) == 0x11)
    {
      long long v392 = 0u;
      long long v393 = 0u;
      long long v390 = 0u;
      long long v391 = 0u;
      id v228 = [(CRCameraReader *)v364 cardNumberCounts];
      v229 = [v228 allKeys];

      uint64_t v230 = [v229 countByEnumeratingWithState:&v390 objects:v434 count:16];
      if (v230)
      {
        uint64_t v231 = *(void *)v391;
        do
        {
          for (uint64_t j = 0; j != v230; ++j)
          {
            if (*(void *)v391 != v231) {
              objc_enumerationMutation(v229);
            }
            v233 = *(void **)(*((void *)&v390 + 1) + 8 * j);
            v234 = [v233 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
            uint64_t v235 = [v234 length];

            if (v235 <= 12)
            {
              v236 = [(CRCameraReader *)v364 cardNumberCounts];
              v237 = [NSNumber numberWithInt:0];
              [v236 setObject:v237 forKey:v233];
            }
          }
          uint64_t v230 = [v229 countByEnumeratingWithState:&v390 objects:v434 count:16];
        }
        while (v230);
      }
    }
  }
  else
  {
    int v360 = 0;
    unint64_t v363 = 0;
  }
  v238 = v364;
  if (v340)
  {
    v239 = [(CRCameraReader *)v364 expirationDateCounts];
    v240 = [v239 objectForKey:v340];
    int v241 = [v240 intValue];

    long long v388 = 0u;
    long long v389 = 0u;
    long long v386 = 0u;
    long long v387 = 0u;
    CGAffineTransform v242 = [(CRCameraReader *)v364 expirationDateCounts];
    uint64_t v243 = [v242 countByEnumeratingWithState:&v386 objects:v433 count:16];
    uint64_t v244 = (v241 + 1);
    if (v243)
    {
      uint64_t v245 = *(void *)v387;
      while (2)
      {
        for (uint64_t k = 0; k != v243; ++k)
        {
          if (*(void *)v387 != v245) {
            objc_enumerationMutation(v242);
          }
          NSPoint v247 = *(void **)(*((void *)&v386 + 1) + 8 * k);
          NSPoint v248 = [(CRCameraReader *)v364 expirationDateCounts];
          NSPoint v249 = [v248 objectForKey:v247];
          int v250 = [v249 intValue];

          BOOL v251 = v250 == 2 || v244 == 2;
          if (v251 && [v340 editDistanceFromString:v247] == 1)
          {
            if (v250 == 2)
            {
              id v252 = v247;

              uint64_t v244 = 3;
              v340 = v252;
            }
            else
            {
              uint64_t v244 = 3;
            }
            goto LABEL_227;
          }
        }
        uint64_t v243 = [v242 countByEnumeratingWithState:&v386 objects:v433 count:16];
        if (v243) {
          continue;
        }
        break;
      }
    }
LABEL_227:

    NSPoint v253 = [(CRCameraReader *)v364 expirationDateCounts];
    NSPoint v254 = [NSNumber numberWithInt:v244];
    [v253 setObject:v254 forKey:v340];

    v238 = v364;
  }
  else
  {
    v340 = 0;
    LODWORD(v244) = 0;
  }
  BOOL v255 = v360 > 1 && v363 > 0xF;
  if (!v255 && v360 < 5)
  {

    v345 = 0;
    goto LABEL_248;
  }
  NSPoint v256 = [(CRCameraReader *)v238 pinnedFoundInfo];
  NSPoint v257 = [v256 objectForKey:@"code"];

  if (v257)
  {
    NSPoint v258 = [(CRCameraReader *)v364 cardNumberCounts];
    NSPoint v259 = [v258 objectForKey:v257];
    int v260 = [v259 intValue];

    char v261 = [v257 isEqualToString:v345];
    if (v360 <= v260) {
      char v262 = 1;
    }
    else {
      char v262 = v261;
    }
    if ((v262 & 1) == 0)
    {
      long long v384 = *(_OWORD *)&a6->var0;
      int64_t v385 = a6->var3;
      [(CRCameraReader *)v364 setLastFieldFoundTime:&v384];
      CGRect v263 = [(CRCameraReader *)v364 pinnedFoundInfo];
      [v263 setObject:v345 forKey:@"code"];
      goto LABEL_243;
    }
  }
  else
  {
    long long v382 = *(_OWORD *)&a6->var0;
    int64_t v383 = a6->var3;
    [(CRCameraReader *)v364 setLastFieldFoundTime:&v382];
    CGRect v264 = [(CRCameraReader *)v364 pinnedFoundInfo];
    [v264 setObject:v345 forKey:@"code"];

    [(CRCameraReader *)v364 setFirstTimeFrameIndexForPinnedField:@"code"];
    CGRect v265 = [(CRCameraReader *)v364 pinnedFoundInfo];
    [v265 setObject:v327 forKey:@"codeOrigin"];

    if (v328)
    {
      CGRect v266 = [(CRCameraReader *)v364 pinnedFoundInfo];
      [v266 setObject:v328 forKey:@"codeFragmentOrigins"];
    }
    CGRect v267 = [v338 objectForKey:@"isPortrait"];
    uint64_t v268 = [v267 BOOLValue];

    CGRect v263 = [(CRCameraReader *)v364 pinnedFoundInfo];
    CGRect v269 = [NSNumber numberWithBool:v268];
    [v263 setObject:v269 forKey:@"isPortrait"];

LABEL_243:
    char v342 = 1;
  }

  if ((int)v244 < 2 || v345 == 0)
  {
LABEL_248:

    CGRect v271 = v364;
    goto LABEL_249;
  }
  v295 = [(CRCameraReader *)v364 pinnedFoundInfo];
  v296 = [v295 objectForKey:@"expirationDate"];
  char v297 = [v296 isEqualToString:v340];

  if ((v297 & 1) == 0)
  {
    long long v380 = *(_OWORD *)&a6->var0;
    int64_t v381 = a6->var3;
    [(CRCameraReader *)v364 setLastFieldFoundTime:&v380];
    char v342 = 1;
  }
  v298 = [(CRCameraReader *)v364 pinnedFoundInfo];
  [v298 setObject:v340 forKey:@"expirationDate"];

  [(CRCameraReader *)v364 setFirstTimeFrameIndexForPinnedField:@"expirationDate"];
  v299 = [(CRCameraReader *)v364 pinnedFoundInfo];
  v300 = [v299 objectForKey:@"dateOrigin"];
  BOOL v301 = v300 == 0;

  if (v301)
  {
    v302 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v303 = [v338 objectForKey:@"dateOrigin"];
    [v302 setObject:v303 forKey:@"dateOrigin"];
  }
  v304 = [v338 objectForKey:@"expirationYear"];
  BOOL v305 = v304 == 0;

  if (!v305)
  {
    v306 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v307 = [v338 objectForKey:@"expirationYear"];
    [v306 setObject:v307 forKey:@"expirationYear"];
  }
  v308 = [v338 objectForKey:@"expirationMonth"];
  BOOL v309 = v308 == 0;

  if (!v309)
  {
    v310 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v311 = [v338 objectForKey:@"expirationMonth"];
    [v310 setObject:v311 forKey:@"expirationMonth"];
  }
  v312 = [v338 objectForKey:@"expirationDay"];
  BOOL v313 = v312 == 0;

  if (!v313)
  {
    v314 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v315 = [v338 objectForKey:@"expirationDay"];
    [v314 setObject:v315 forKey:@"expirationDay"];
  }
  CGRect v271 = v364;
  if (!v340)
  {
LABEL_249:
    CGRect v272 = [(CRCameraReader *)v271 pinnedFoundInfo];
    v340 = [v272 objectForKey:@"expirationDate"];

    CGRect v271 = v364;
  }
  v273 = [(CRCameraReader *)v271 pinnedFoundInfo];
  v274 = [v273 objectForKey:@"cardholderName"];

  if (v274)
  {
    v275 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v276 = [v275 objectForKey:@"nameOrigin"];
    NSPoint v277 = NSPointFromString(v276);
    char valid = isValidNameLocationForCode(v345, v277.x, v277.y);

    if ((valid & 1) == 0)
    {

      v279 = [(CRCameraReader *)v364 pinnedFoundInfo];
      [v279 removeObjectForKey:@"cardholderName"];

      v280 = [(CRCameraReader *)v364 pinnedFoundInfo];
      [v280 removeObjectForKey:@"nameOrigin"];

      v274 = 0;
    }
  }
  char v281 = [v333 containsObject:@"CRCameraReaderCreditCardExpirationDate"];
  int v282 = [v333 containsObject:@"CROutputTypeCreditCardName"];
  v283 = v364;
  if (v340) {
    char v284 = 0;
  }
  else {
    char v284 = v281;
  }
  if (v274) {
    int v285 = 0;
  }
  else {
    int v285 = v282;
  }
  if (((v284 & 1) != 0 || v285)
    && (CMTime v379 = (CMTime)*a6,
        [(CRCameraReader *)v364 lastFieldFoundTime],
        CMTime lhs = v379,
        CMTime rhs = v378,
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) <= 1.0))
  {
    char v293 = 0;
    v294 = v345;
    BOOL v292 = v345 == 0;
  }
  else
  {
    v286 = [(CRCameraReader *)v364 pinnedFoundInfo];
    v287 = [v286 objectForKey:@"code"];
    BOOL v288 = v287 == 0;

    if (v288)
    {
      v283 = v364;
      v291 = v345;
    }
    else
    {
      v289 = [(CRCameraReader *)v364 pinnedFoundInfo];
      uint64_t v290 = [v289 objectForKey:@"code"];

      int v326 = 1;
      v291 = (void *)v290;
      v283 = v364;
    }
    BOOL v292 = v291 == 0;
    char v293 = 1;
    v346 = v291;
    if (v291 && v326)
    {
      AudioServicesPlaySystemSound(0xFFFu);
      [(CRCameraReader *)v283 stopSession];
      BOOL v292 = 0;
    }
    v294 = v346;
  }
  if (v336)
  {
    uint64_t v316 = MEMORY[0x263EF83A0];
    id v317 = MEMORY[0x263EF83A0];
    v374[0] = MEMORY[0x263EF8330];
    v374[1] = 3221225472;
    v374[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_13;
    v374[3] = &unk_26429E7E0;
    v374[4] = v283;
    id v375 = v336;
    long long v376 = *(_OWORD *)&a6->var0;
    int64_t v377 = a6->var3;
    cr_dispatch_async(v316, (uint64_t)v374);

    v283 = v364;
  }
  if (v342)
  {
    v318 = [(CRCameraReader *)v283 pinnedFoundInfo];
    [(CRCameraReader *)v283 sendDidRecognizeNewObjects:v318];

    v283 = v364;
  }
  if (v292)
  {
    CMTime v367 = (CMTime)*a6;
    [(CRCameraReader *)v283 pointsFound];
    CMTime lhs = v367;
    CMTime rhs = v366;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 0.3)
    {
      v319 = [(CRCameraReader *)v283 sessionManager];
      [v319 resetFocus];

      v283 = v364;
    }
    [(CRCameraReader *)v283 setFoundPoints:0];
  }
  else
  {
    uint64_t v320 = MEMORY[0x263EF83A0];
    id v321 = MEMORY[0x263EF83A0];
    v368[0] = MEMORY[0x263EF8330];
    v368[1] = 3221225472;
    v368[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_14;
    v368[3] = &unk_26429E830;
    v368[4] = v283;
    id v369 = v294;
    id v370 = v274;
    id v371 = v340;
    char v373 = v293;
    id v372 = v336;
    cr_dispatch_async(v320, (uint64_t)v368);

    v283 = v364;
  }
  v322 = [(CRCameraReader *)v283 diagnosticHUDLayer];
  BOOL v323 = v322 == 0;

  if (!v323)
  {
    uint64_t v324 = MEMORY[0x263EF83A0];
    id v325 = MEMORY[0x263EF83A0];
    v365[0] = MEMORY[0x263EF8330];
    v365[1] = 3221225472;
    v365[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_17;
    v365[3] = &unk_26429E598;
    v365[4] = v364;
    cr_dispatch_async(v324, (uint64_t)v365);
  }
  CVPixelBufferRelease(pixelBuffer);
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke()
{
  return [NSNumber numberWithBool:0];
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v1 = 0;
  }
  else {
    BOOL v1 = *(void *)(a1 + 32) != 0;
  }
  return [NSNumber numberWithBool:v1];
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_3()
{
  return [NSNumber numberWithBool:1];
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_4(uint64_t a1)
{
  int v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 targetRectsForImage:v3];
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_5(uint64_t a1)
{
  BOOL v1 = NSNumber;
  int v2 = [*(id *)(a1 + 32) objectForKey:@"code"];
  uint64_t v3 = [v1 numberWithBool:v2 == 0];

  return v3;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_6(uint64_t a1)
{
  int v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 40) ciImage];
  uint64_t v4 = [v2 targetRectsForImage:v3];

  return v4;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_7(uint64_t a1)
{
  int v2 = NSNumber;
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v1 = [*(id *)(a1 + 32) objectForKey:@"code"];
    BOOL v4 = v1 == 0;
  }
  uint64_t v5 = [v2 numberWithBool:v4];
  if (!v3) {

  }
  return v5;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_8(uint64_t a1)
{
  int v2 = objc_opt_class();
  int v3 = [*(id *)(a1 + 40) ciImage];
  BOOL v4 = [v2 targetRectsForImage:v3];

  return v4;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_9(uint64_t a1)
{
  BOOL v1 = NSNumber;
  int v2 = [*(id *)(a1 + 32) objectForKey:@"code"];
  int v3 = [v1 numberWithBool:v2 == 0];

  return v3;
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_10(uint64_t a1)
{
  int v2 = NSNumber;
  int v3 = [*(id *)(a1 + 32) objectForKey:@"accepted"];
  BOOL v4 = ([v3 BOOLValue] & 1) == 0 && !*(unsigned char *)(a1 + 48) && *(void *)(a1 + 40) != 0;
  uint64_t v5 = [v2 numberWithBool:v4];

  return v5;
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_11()
{
  return [NSNumber numberWithBool:1];
}

id __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_12(uint64_t a1)
{
  int v2 = objc_opt_class();
  int v3 = [*(id *)(a1 + 40) ciImage];
  BOOL v4 = [v2 targetRectsForImage:v3];

  return v4;
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_13(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) foundPoints];

  if (!v2) {
    goto LABEL_11;
  }
  unint64_t v3 = 0;
  do
  {
    BOOL v4 = [*(id *)(a1 + 32) foundPoints];
    uint64_t v5 = [v4 objectAtIndex:v3];
    NSPoint v6 = NSPointFromString(v5);

    unint64_t v7 = [*(id *)(a1 + 40) objectAtIndex:v3];
    NSPoint v8 = NSPointFromString(v7);

    double v9 = sqrt((v8.x - v6.x) * (v8.x - v6.x) + (v8.y - v6.y) * (v8.y - v6.y));
  }
  while (v9 <= 20.0 && v3++ < 3);
  if (v9 <= 20.0)
  {
    CMTime v55 = *(CMTime *)(a1 + 48);
    double v11 = *(void **)(a1 + 32);
    if (v11) {
      [v11 pointsFound];
    }
    else {
      memset(&v54, 0, sizeof(v54));
    }
    CMTime lhs = v55;
    CMTime rhs = v54;
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 3.0)
    {
      [*(id *)(a1 + 32) stopSession];
      [*(id *)(a1 + 32) sendDidEndWithErrorDomain:@"Core Recognition Error Domain" code:1 userInfo:0];
    }
  }
  else
  {
LABEL_11:
    [*(id *)(a1 + 32) setFoundPoints:*(void *)(a1 + 40)];
    long long v56 = *(_OWORD *)(a1 + 48);
    uint64_t v57 = *(void *)(a1 + 64);
    [*(id *)(a1 + 32) setPointsFound:&v56];
  }
  *(void *)&rect.origin.CGFloat y = [MEMORY[0x263EFF980] array];
  int v12 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v13 = [v12 previewLayer];
  [v13 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v64.origin.double x = v15;
  v64.origin.CGFloat y = v17;
  v64.size.double width = v19;
  v64.size.CGFloat height = v21;
  double Width = CGRectGetWidth(v64);
  v65.origin.double x = v15;
  v65.origin.CGFloat y = v17;
  v65.size.double width = v19;
  v65.size.CGFloat height = v21;
  CGFloat v23 = CGRectGetHeight(v65) / -10.0;
  v66.origin.double x = v15;
  v66.origin.CGFloat y = v17;
  v66.size.double width = v19;
  v66.size.CGFloat height = v21;
  CGRect v67 = CGRectInset(v66, Width / -10.0, v23);
  rect.origin.double x = v67.origin.x;
  CGFloat y = v67.origin.y;
  CGFloat v25 = v67.size.width;
  CGFloat height = v67.size.height;
  long long v52 = 0u;
  long long v53 = 0u;
  rect.size = 0u;
  long long v51 = 0u;
  id v27 = *(id *)(a1 + 40);
  uint64_t v28 = [v27 countByEnumeratingWithState:&rect.size objects:v61 count:16];
  if (v28)
  {
    int v29 = 0;
    uint64_t v30 = *(void *)v51;
    double v31 = 0.0;
    double v32 = 0.0;
    do
    {
      uint64_t v33 = 0;
      int v34 = v29 + 1;
      int v49 = v29 + v28;
      do
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        id v35 = *(NSString **)(*(void *)&rect.size.height + 8 * v33);
        double v36 = [*(id *)(a1 + 32) sessionManager];
        NSPoint v37 = NSPointFromString(v35);
        CGFloat v38 = [*(id *)(a1 + 32) sessionManager];
        double v39 = [v38 previewLayer];
        objc_msgSend(v36, "convertCameraPoint:toLayer:flipped:", v39, 1, v37.x, v37.y);
        double v41 = v40;
        double v43 = v42;

        int v44 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v41, v43);
        [*(id *)&rect.origin.y addObject:v44];

        v68.origin.double x = rect.origin.x;
        v68.origin.CGFloat y = y;
        v68.size.double width = v25;
        v68.size.CGFloat height = height;
        v63.double x = v41;
        v63.CGFloat y = v43;
        CGRectContainsPoint(v68, v63);
        double v45 = 1.0 / (double)(v34 + (int)v33);
        double v32 = v32 * (1.0 - v45) + v41 * v45;
        double v31 = v31 * (1.0 - v45) + v43 * v45;
        ++v33;
      }
      while (v28 != v33);
      uint64_t v28 = [v27 countByEnumeratingWithState:&rect.size objects:v61 count:16];
      int v29 = v49;
    }
    while (v28);
  }
  else
  {
    double v31 = 0.0;
    double v32 = 0.0;
  }

  if ([*(id *)&rect.origin.y count])
  {
    double v46 = [*(id *)(a1 + 32) diagnosticHUDLayer];
    [v46 setBoxPoints:*(void *)&rect.origin.y];

    double v47 = [*(id *)(a1 + 32) alignmentLayer];
    [v47 animateFoundCardRect:*(void *)&rect.origin.y];

    double v48 = [*(id *)(a1 + 32) sessionManager];
    objc_msgSend(v48, "refocusOnPoint:exposure:", 0, v32, v31);
  }
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_14(uint64_t a1)
{
  v78[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) pauseBoxLayerHideTimer];
  int v2 = [*(id *)(a1 + 32) pinnedFoundInfo];
  unint64_t v3 = [v2 objectForKey:@"codeFragmentOrigins"];

  if (!v3)
  {
    double v9 = [*(id *)(a1 + 32) pinnedFoundInfo];
    id v10 = [v9 objectForKey:@"codeOrigin"];
    v78[0] = v10;
    unint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:1];

    uint64_t v77 = *(void *)(a1 + 40);
    BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
    goto LABEL_10;
  }
  BOOL v4 = [*(id *)(a1 + 40) componentsSeparatedByString:@" "];
  unint64_t v5 = [v4 count];
  if (v5 >= [v3 count])
  {
    unint64_t v11 = [v4 count];
    if (v11 <= [v3 count]) {
      goto LABEL_10;
    }
    NSPoint v6 = objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v3, "count"));
  }
  else
  {
    NSPoint v6 = (void *)[v4 mutableCopy];
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v8 = [v3 count];
      if (i >= v8 - [v4 count]) {
        break;
      }
      [v6 addObject:&stru_26C7BF850];
    }
  }

  BOOL v4 = v6;
LABEL_10:
  int v12 = [*(id *)(a1 + 32) pinnedFoundInfo];
  uint64_t v13 = [v12 objectForKey:@"nameOrigin"];
  NSPoint v14 = NSPointFromString(v13);

  CGFloat v15 = [*(id *)(a1 + 32) pinnedFoundInfo];
  double v16 = [v15 objectForKey:@"dateOrigin"];
  NSPoint v17 = NSPointFromString(v16);

  uint64_t v18 = [*(id *)(a1 + 32) getFirstTimeFrameIndexForPinnedField:@"cardholderName"];
  uint64_t v19 = [*(id *)(a1 + 32) getFirstTimeFrameIndexForPinnedField:@"expirationDate"];
  uint64_t v20 = [*(id *)(a1 + 32) getFirstTimeFrameIndexForPinnedField:@"code"];
  CGFloat v21 = [*(id *)(a1 + 32) alignmentLayer];
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 56);
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_15;
  v75[3] = &unk_26429E808;
  char v76 = *(unsigned char *)(a1 + 72);
  v75[4] = *(void *)(a1 + 32);
  objc_msgSend(v21, "animateFoundCodeParts:codePartPositions:codeFrameIndex:cardHolder:cardholderPosition:cardholderFrameIndex:expDate:expdatePosition:expDateFrameIndex:completionBlock:", v4, v3, v20, v22, v18, v23, v14.x, v14.y, v17.x, v17.y, v19, v75);

  if (*(unsigned char *)(a1 + 72))
  {
    double v24 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    [*(id *)(a1 + 32) setFoundCode:v24];

    CGFloat v25 = objc_alloc_init(CRCameraReaderOutput);
    uint64_t v26 = *(void *)(a1 + 64);
    id v27 = [(CRCameraReaderOutput *)v25 objectInternal];
    [v27 setVertices:v26];

    uint64_t v28 = [(CRCameraReaderOutput *)v25 objectInternal];
    [v28 setType:@"CROutputTypeCreditCardNumber"];

    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = [(CRCameraReaderOutput *)v25 objectInternal];
    [v30 setFormattedStringValue:v29];

    double v31 = [*(id *)(a1 + 32) foundCode];
    double v32 = [(CRCameraReaderOutput *)v25 objectInternal];
    [v32 setStringValue:v31];

    id v74 = [MEMORY[0x263EFF980] arrayWithObject:v25];
    uint64_t v33 = (void *)MEMORY[0x263EFFA08];
    int v34 = [*(id *)(a1 + 32) outputObjectTypes];
    id v35 = [v33 setWithArray:v34];
    if ([v35 containsObject:@"CROutputTypeCreditCardName"])
    {
      BOOL v36 = *(void *)(a1 + 48) == 0;

      if (v36) {
        goto LABEL_16;
      }
      int v34 = objc_alloc_init(CRCameraReaderOutput);
      uint64_t v37 = *(void *)(a1 + 64);
      CGFloat v38 = [(CRCameraReaderOutput *)v34 objectInternal];
      [v38 setVertices:v37];

      double v39 = [(CRCameraReaderOutput *)v34 objectInternal];
      [v39 setType:@"CROutputTypeCreditCardName"];

      uint64_t v40 = *(void *)(a1 + 48);
      double v41 = [(CRCameraReaderOutput *)v34 objectInternal];
      [v41 setStringValue:v40];

      [v74 addObject:v34];
    }
    else
    {
    }
LABEL_16:
    double v42 = (void *)MEMORY[0x263EFFA08];
    double v43 = [*(id *)(a1 + 32) outputObjectTypes];
    int v44 = [v42 setWithArray:v43];
    if ([v44 containsObject:@"CRCameraReaderCreditCardExpirationDate"])
    {
      BOOL v45 = *(void *)(a1 + 56) == 0;

      if (v45)
      {
LABEL_27:
        [*(id *)(a1 + 32) sendDidEndWithInfo:v74];

        goto LABEL_28;
      }
      double v43 = objc_alloc_init(CRCameraReaderOutputExpirationDate);
      uint64_t v46 = *(void *)(a1 + 64);
      double v47 = [(CRCameraReaderOutput *)v43 objectInternal];
      [v47 setVertices:v46];

      double v48 = [(CRCameraReaderOutput *)v43 objectInternal];
      [v48 setType:@"CRCameraReaderCreditCardExpirationDate"];

      uint64_t v49 = *(void *)(a1 + 56);
      double v50 = [(CRCameraReaderOutput *)v43 objectInternal];
      [v50 setStringValue:v49];

      long long v51 = [*(id *)(a1 + 32) pinnedFoundInfo];
      long long v52 = [v51 objectForKey:@"expirationYear"];
      LOBYTE(v49) = v52 == 0;

      if ((v49 & 1) == 0)
      {
        long long v53 = NSNumber;
        CMTime v54 = [*(id *)(a1 + 32) pinnedFoundInfo];
        CMTime v55 = [v54 objectForKey:@"expirationYear"];
        long long v56 = objc_msgSend(v53, "numberWithInteger:", objc_msgSend(v55, "integerValue"));
        uint64_t v57 = [(CRCameraReaderOutput *)v43 objectInternal];
        [v57 setYearValue:v56];
      }
      double v58 = [*(id *)(a1 + 32) pinnedFoundInfo];
      double v59 = [v58 objectForKey:@"expirationMonth"];
      BOOL v60 = v59 == 0;

      if (!v60)
      {
        CGAffineTransform v61 = NSNumber;
        uint64_t v62 = [*(id *)(a1 + 32) pinnedFoundInfo];
        CGPoint v63 = [v62 objectForKey:@"expirationMonth"];
        CGRect v64 = objc_msgSend(v61, "numberWithInteger:", objc_msgSend(v63, "integerValue"));
        CGRect v65 = [(CRCameraReaderOutput *)v43 objectInternal];
        [v65 setMonthValue:v64];
      }
      CGRect v66 = [*(id *)(a1 + 32) pinnedFoundInfo];
      CGRect v67 = [v66 objectForKey:@"expirationDay"];
      BOOL v68 = v67 == 0;

      if (!v68)
      {
        int v69 = NSNumber;
        uint64_t v70 = [*(id *)(a1 + 32) pinnedFoundInfo];
        uint64_t v71 = [v70 objectForKey:@"expirationDay"];
        CGRect v72 = objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v71, "integerValue"));
        CGRect v73 = [(CRCameraReaderOutput *)v43 objectInternal];
        [v73 setDayValue:v72];
      }
      [v74 addObject:v43];
    }
    else
    {
    }
    goto LABEL_27;
  }
LABEL_28:
}

uint64_t __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_15(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) sendDidEndAnimation];
  }
  return result;
}

void __74__CRCameraReader_findObjects_inPixelBuffer_cameraIntrinsicData_frameTime___block_invoke_17(uint64_t a1)
{
  id v21 = [*(id *)(a1 + 32) sessionManager];
  int v2 = [v21 isFocusPointOfInterestSupported];

  double v3 = 0.0;
  double v4 = 0.0;
  if (v2)
  {
    id v22 = [*(id *)(a1 + 32) sessionManager];
    [v22 focusPointOfInterest];
    double v6 = v5;
    double v8 = v7;

    id v23 = [*(id *)(a1 + 32) sessionManager];
    [v23 cameraResolution];
    double v10 = v9;
    unint64_t v11 = [*(id *)(a1 + 32) sessionManager];
    [v11 cameraResolution];
    double v13 = v12;

    id v24 = [*(id *)(a1 + 32) sessionManager];
    NSPoint v14 = [*(id *)(a1 + 32) sessionManager];
    CGFloat v15 = [v14 previewLayer];
    objc_msgSend(v24, "convertCameraPoint:toLayer:", v15, v6 * v10, v8 * v13);
    double v3 = v16;
    double v4 = v17;
  }
  id v25 = [*(id *)(a1 + 32) diagnosticHUDLayer];
  uint64_t v18 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v19 = [v18 isAdjustingFocus];
  uint64_t v20 = [*(id *)(a1 + 32) sessionManager];
  objc_msgSend(v25, "setAdjustingFocus:pointOfInterestSupported:focusPoint:", v19, objc_msgSend(v20, "isFocusPointOfInterestSupported"), v3, v4);
}

- (id)findObjectsEmbossed:(id)a3 inImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CRCameraReader *)self nameCutRects];

  if (!v8)
  {
    double v9 = [MEMORY[0x263EFF980] array];
    [(CRCameraReader *)self setNameCutRects:v9];
  }
  double v10 = [(CRCameraReader *)self dateCutRects];

  if (!v10)
  {
    unint64_t v11 = [MEMORY[0x263EFF980] array];
    [(CRCameraReader *)self setDateCutRects:v11];
  }
  double v12 = [(CRCameraReader *)self dateCutRects];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    int v14 = 8;
    CGFloat y = 0.670120239;
    CGFloat x = 0.0475194012;
    CGFloat height = 0.0707215541;
    CGFloat width = 0.849705277;
    do
    {
      uint64_t v19 = [(CRCameraReader *)self dateCutRects];
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      uint64_t v20 = NSStringFromRect(v43);
      [v19 addObject:v20];

      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      CGRect v45 = CGRectOffset(v44, 0.0, 0.0353607771);
      CGFloat x = v45.origin.x;
      CGFloat y = v45.origin.y;
      CGFloat width = v45.size.width;
      CGFloat height = v45.size.height;
      --v14;
    }
    while (v14);
  }
  id v21 = [(CRCameraReader *)self nameCutRects];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
    int v23 = 8;
    CGFloat v24 = 0.929278433;
    CGFloat v25 = 0.0475194012;
    CGFloat v26 = 0.0707215541;
    CGFloat v27 = 0.849705277;
    do
    {
      uint64_t v28 = [(CRCameraReader *)self nameCutRects];
      v46.origin.CGFloat x = v25;
      v46.origin.CGFloat y = v24;
      v46.size.CGFloat width = v27;
      v46.size.CGFloat height = v26;
      uint64_t v29 = NSStringFromRect(v46);
      [v28 addObject:v29];

      v47.origin.CGFloat x = v25;
      v47.origin.CGFloat y = v24;
      v47.size.CGFloat width = v27;
      v47.size.CGFloat height = v26;
      CGRect v48 = CGRectOffset(v47, 0.0, -0.0353607771);
      CGFloat v25 = v48.origin.x;
      CGFloat v24 = v48.origin.y;
      CGFloat v27 = v48.size.width;
      CGFloat v26 = v48.size.height;
      --v23;
    }
    while (v23);
  }
  uint64_t v30 = (void *)MEMORY[0x263EFF980];
  v49.origin.CGFloat x = 0.0209955056;
  v49.origin.CGFloat y = 0.546364477;
  v49.size.CGFloat width = 0.960868335;
  v49.size.CGFloat height = 0.108566147;
  double v31 = NSStringFromRect(v49);
  double v32 = [v30 arrayWithObject:v31];

  uint64_t v33 = +[CRInsights sharedInsights];
  [v33 provideInsightValue:v32 forKey:@"CRInsightsEmbossedRegionsNumber"];

  int v34 = +[CRInsights sharedInsights];
  id v35 = [(CRCameraReader *)self nameCutRects];
  [v34 provideInsightValue:v35 forKey:@"CRInsightsEmbossedRegionsName"];

  BOOL v36 = +[CRInsights sharedInsights];
  uint64_t v37 = [(CRCameraReader *)self dateCutRects];
  [v36 provideInsightValue:v37 forKey:@"CRInsightsEmbossedRegionsExpirationDate"];

  CGFloat v38 = [(CRCameraReader *)self nameCutRects];
  double v39 = [(CRCameraReader *)self dateCutRects];
  uint64_t v40 = [(CRCameraReader *)self findCCObjectsEmbossed:v6 inImage:v7 numberRects:v32 nameRects:v38 dateRects:v39];

  return v40;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 outputObjectTypes:(id)a5
{
  double width = (double)a3->width;
  double height = (double)a3->height;
  long long v7 = *(_OWORD *)&a3->width;
  v10[0] = *(_OWORD *)&a3->data;
  v10[1] = v7;
  double v8 = +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v10, a4, a5, 0.0, 0.0, width, height);
  return v8;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4
{
  double width = (double)a3->width;
  double height = (double)a3->height;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObject:@"CROutputTypeiTunesCode"];
  long long v9 = *(_OWORD *)&a3->width;
  v12[0] = *(_OWORD *)&a3->data;
  v12[1] = v9;
  double v10 = +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v12, a4, v8, 0.0, 0.0, width, height);

  return v10;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObject:@"CROutputTypeiTunesCode"];
  long long v12 = *(_OWORD *)&a3->width;
  v15[0] = *(_OWORD *)&a3->data;
  v15[1] = v12;
  uint64_t v13 = +[CRCameraReader findCodeInImage:maxStage:roi:outputObjectTypes:](CRCameraReader, "findCodeInImage:maxStage:roi:outputObjectTypes:", v15, a4, v11, x, y, width, height);

  return v13;
}

+ (id)findCodeInImage:(vImage_Buffer *)a3 maxStage:(unint64_t)a4 roi:(CGRect)a5 outputObjectTypes:(id)a6
{
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v17[8] = *MEMORY[0x263EF8340];
  id v14 = a6;
  CGFloat v15 = [MEMORY[0x263EFF9A0] dictionary];
  [MEMORY[0x263EFF980] array];
  [v15 setObject:objc_claimAutoreleasedReturnValue() forKey:@"stageInfo"];
  CFAbsoluteTimeGetCurrent();
  long long v9 = [MEMORY[0x263EFFA08] setWithArray:v14];
  int v10 = [v9 containsObject:@"CROutputTypeHomeKitCode"];

  __n128 v12 = *(__n128 *)&a3->width;
  v16[0] = *(_OWORD *)&a3->data;
  v11.n128_u64[1] = *((void *)&v16[0] + 1);
  v16[1] = v12;
  v11.n128_f64[0] = x;
  v12.n128_f64[0] = y;
  _findCodeRectInImageWithModel(v11, v12, (uint64_t)v16, (uint64_t)v17, 95158272, v10);
}

+ (id)textFeatureWithVNTextObservation:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [v3 boundingBox];
  CGFloat v5 = v4;
  [v3 boundingBox];
  double v7 = v6;
  [v3 boundingBox];
  double v9 = v8;
  [v3 boundingBox];
  CGFloat v11 = v10;
  [v3 boundingBox];
  v37.origin.CGFloat y = 1.0 - v7 - v9;
  v37.origin.CGFloat x = v5;
  v37.size.double width = v11;
  __n128 v12 = NSStringFromRect(v37);
  uint64_t v13 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = objc_msgSend(v3, "characterBoxes", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v18 boundingBox];
        CGFloat v20 = v19;
        [v18 boundingBox];
        double v22 = v21;
        [v18 boundingBox];
        double v24 = v23;
        [v18 boundingBox];
        CGFloat v26 = v25;
        [v18 boundingBox];
        v38.origin.CGFloat y = 1.0 - v22 - v24;
        v38.origin.CGFloat x = v20;
        v38.size.double width = v26;
        CGFloat v27 = NSStringFromRect(v38);
        [v13 addObject:v27];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F7ECC8]) initWithFeatureRect:v12 subFeatureRects:v13];
  return v28;
}

+ (id)targetRectsForImage:(id)a3
{
  v203[1] = *MEMORY[0x263EF8340];
  id v157 = a3;
  id v190 = [MEMORY[0x263EFF980] array];
  id v159 = v157;
  id v3 = objc_alloc(MEMORY[0x263F1EF40]);
  double v160 = (void *)[v3 initWithCIImage:v159 options:MEMORY[0x263EFFA78]];
  double v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"com.apple.CoreRecognition.enable_vn_detector"];

  id v6 = objc_alloc_init(MEMORY[0x263F1EEB8]);
  double v7 = v6;
  if (v5) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v161 = v6;
  [v6 setAlgorithm:v8];
  [v7 setReportCharacterBoxes:1];
  [v7 setDetectDiacritics:0];
  v203[0] = v7;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v203 count:1];
  id v200 = 0;
  [v160 performRequests:v9 error:&v200];
  id v158 = v200;

  double v162 = [v161 results];
  if (v162 && [v162 count])
  {
    char v191 = [MEMORY[0x263EFF980] array];
    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v10 = v162;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v196 objects:v202 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v197;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v197 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = [(id)objc_opt_class() textFeatureWithVNTextObservation:*(void *)(*((void *)&v196 + 1) + 8 * i)];
          uint64_t v15 = [v14 subFeatures];
          double v9 = (char *)[v15 count];

          if ((unint64_t)(v9 - 4) <= 0x18)
          {
            if ((unint64_t)[v190 count] <= 0x13)
            {
              [v14 bounds];
              CGFloat v17 = v16;
              CGFloat v19 = v18;
              CGFloat v21 = v20;
              CGFloat v23 = v22;
              [v14 bounds];
              double v25 = v24;
              [v14 bounds];
              CGFloat v27 = v26 * -0.100000001;
              v205.origin.CGFloat x = v17;
              v205.origin.CGFloat y = v19;
              v205.size.CGFloat width = v21;
              v205.size.CGFloat height = v23;
              CGRect v206 = CGRectInset(v205, v25 * -0.0500000007, v27);
              CGFloat x = v206.origin.x;
              CGFloat y = v206.origin.y;
              CGFloat width = v206.size.width;
              CGFloat height = v206.size.height;
              [v14 setShouldExpandToFullWidth:1];
              long long v32 = NSDictionary;
              v207.origin.CGFloat x = x;
              v207.origin.CGFloat y = y;
              v207.size.CGFloat width = width;
              v207.size.CGFloat height = height;
              long long v33 = NSStringFromRect(v207);
              int v34 = objc_msgSend(v32, "dictionaryWithObjectsAndKeys:", v33, @"paddedRect", v14, @"textFeatures", 0);
              [v190 addObject:v34];
            }
            if (v9 == (char *)4) {
              [v191 addObject:v14];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v196 objects:v202 count:16];
      }
      while (v11);
    }

    if ((unint64_t)[v191 count] >= 4)
    {
      [v191 sortUsingComparator:&__block_literal_global_321];
      size_t v156 = objc_msgSend(v191, "subarrayWithRange:", 0, 4);
      unint64_t v35 = 0;
      float v36 = 3.4028e38;
      while ([v191 count] - 3 > v35)
      {
        double v177 = [v191 objectAtIndexedSubscript:v35];
        [v177 bounds];
        double v37 = CGRectGetWidth(v208);
        BOOL v176 = [v191 objectAtIndexedSubscript:v35];
        [v176 bounds];
        double v38 = CGRectGetHeight(v209);
        unint64_t v187 = v35 + 1;
        double v175 = objc_msgSend(v191, "objectAtIndexedSubscript:");
        [v175 bounds];
        double v39 = CGRectGetWidth(v210);
        double v174 = [v191 objectAtIndexedSubscript:v35 + 1];
        [v174 bounds];
        double v40 = v37 * v38 - v39 * CGRectGetHeight(v211);
        [v191 objectAtIndexedSubscript:v35];
        if (v40 < 0.0) {
          int v169 = {;
        }
          [v169 bounds];
          double v45 = CGRectGetWidth(v216);
          CGRect v165 = [v191 objectAtIndexedSubscript:v35];
          [v165 bounds];
          double v46 = CGRectGetHeight(v217);
          double v164 = [v191 objectAtIndexedSubscript:v187];
          [v164 bounds];
          double v47 = CGRectGetWidth(v218);
          double v163 = [v191 objectAtIndexedSubscript:v187];
          [v163 bounds];
          double v44 = -(v45 * v46 - v47 * CGRectGetHeight(v219));
        }
        else {
          CGFloat v168 = {;
        }
          [v168 bounds];
          double v41 = CGRectGetWidth(v212);
          int v167 = [v191 objectAtIndexedSubscript:v35];
          [v167 bounds];
          double v42 = CGRectGetHeight(v213);
          CGFloat v166 = [v191 objectAtIndexedSubscript:v187];
          [v166 bounds];
          double v43 = CGRectGetWidth(v214);
          double v9 = [v191 objectAtIndexedSubscript:v187];
          [v9 bounds];
          double v44 = v41 * v42 - v43 * CGRectGetHeight(v215);
        }
        double v184 = v9;
        CGRect v48 = [v191 objectAtIndexedSubscript:v187];
        [v48 bounds];
        double v49 = CGRectGetWidth(v220);
        BOOL v173 = [v191 objectAtIndexedSubscript:v187];
        [v173 bounds];
        double v50 = CGRectGetHeight(v221);
        unint64_t v51 = v35 + 2;
        double v172 = [v191 objectAtIndexedSubscript:v35 + 2];
        [v172 bounds];
        double v52 = CGRectGetWidth(v222);
        double v171 = [v191 objectAtIndexedSubscript:v35 + 2];
        [v171 bounds];
        if (v49 * v50 - v52 * CGRectGetHeight(v223) < 0.0)
        {
          aRect = [v191 objectAtIndexedSubscript:v187];
          [aRect bounds];
          double v58 = CGRectGetWidth(v228);
          int v179 = [v191 objectAtIndexedSubscript:v187];
          [v179 bounds];
          double v59 = CGRectGetHeight(v229);
          double v178 = [v191 objectAtIndexedSubscript:v35 + 2];
          [v178 bounds];
          double v60 = CGRectGetWidth(v230);
          long long v56 = [v191 objectAtIndexedSubscript:v35 + 2];
          [v56 bounds];
          double v57 = -(v58 * v59 - v60 * CGRectGetHeight(v231));
        }
        else
        {
          aRect = [v191 objectAtIndexedSubscript:v187];
          [aRect bounds];
          double v53 = CGRectGetWidth(v224);
          int v179 = [v191 objectAtIndexedSubscript:v187];
          [v179 bounds];
          double v54 = CGRectGetHeight(v225);
          double v178 = [v191 objectAtIndexedSubscript:v35 + 2];
          [v178 bounds];
          double v55 = CGRectGetWidth(v226);
          long long v56 = [v191 objectAtIndexedSubscript:v35 + 2];
          [v56 bounds];
          double v57 = v53 * v54 - v55 * CGRectGetHeight(v227);
        }
        v170 = [v191 objectAtIndexedSubscript:v35 + 2];
        [v170 bounds];
        double v61 = CGRectGetWidth(v232);
        uint64_t v62 = [v191 objectAtIndexedSubscript:v35 + 2];
        [v62 bounds];
        double v63 = CGRectGetHeight(v233);
        unint64_t v64 = v35 + 3;
        CGRect v65 = [v191 objectAtIndexedSubscript:v35 + 3];
        [v65 bounds];
        double v66 = CGRectGetWidth(v234);
        CGRect v67 = [v191 objectAtIndexedSubscript:v64];
        [v67 bounds];
        if (v61 * v63 - v66 * CGRectGetHeight(v235) >= 0.0)
        {
          BOOL v68 = [v191 objectAtIndexedSubscript:v51];
          [v68 bounds];
          double v77 = CGRectGetWidth(v240);
          uint64_t v70 = [v191 objectAtIndexedSubscript:v51];
          [v70 bounds];
          double v78 = CGRectGetHeight(v241);
          CGRect v72 = [v191 objectAtIndexedSubscript:v64];
          [v72 bounds];
          double v79 = CGRectGetWidth(v242);
          id v74 = [v191 objectAtIndexedSubscript:v64];
          [v74 bounds];
          double v75 = v48;
          double v76 = v77 * v78 - v79 * CGRectGetHeight(v243);
        }
        else
        {
          BOOL v68 = [v191 objectAtIndexedSubscript:v51];
          [v68 bounds];
          double v69 = CGRectGetWidth(v236);
          uint64_t v70 = [v191 objectAtIndexedSubscript:v51];
          [v70 bounds];
          double v71 = CGRectGetHeight(v237);
          CGRect v72 = [v191 objectAtIndexedSubscript:v64];
          [v72 bounds];
          double v73 = CGRectGetWidth(v238);
          id v74 = [v191 objectAtIndexedSubscript:v64];
          [v74 bounds];
          double v75 = v48;
          double v76 = -(v69 * v71 - v73 * CGRectGetHeight(v239));
        }

        double v80 = v184;
        long long v82 = v166;
        double v81 = v167;
        double v83 = v168;
        if (v40 < 0.0)
        {
          double v80 = (char *)v163;
          long long v82 = v164;
          double v81 = v165;
          double v83 = v169;
        }

        float v84 = v44 + v57 + v76;
        double v9 = v184;
        unint64_t v35 = v187;
        if (v36 > v84)
        {
          uint64_t v85 = objc_msgSend(v191, "subarrayWithRange:", v187 - 1, 4);

          size_t v156 = (void *)v85;
          float v36 = v84;
          double v9 = v184;
          unint64_t v35 = v187;
        }
      }
      CGFloat v86 = [v156 sortedArrayUsingComparator:&__block_literal_global_323];

      BOOL v87 = [v86 objectAtIndexedSubscript:0];
      [v87 bounds];
      double v89 = v88;
      double v91 = v90;
      CGFloat v92 = [v86 objectAtIndexedSubscript:1];
      double v185 = v91;
      double v188 = v89;
      [v92 bounds];
      double v180 = v94;
      double aRectb = v93;

      double v95 = [v86 objectAtIndexedSubscript:1];
      [v95 bounds];
      double v97 = v96;
      double v99 = v98;
      double v100 = [v86 objectAtIndexedSubscript:2];
      [v100 bounds];
      double v102 = v101;
      double v104 = v103;

      CGFloat v105 = [v86 objectAtIndexedSubscript:2];
      [v105 bounds];
      double v107 = v106;
      double v109 = v108;
      CGFloat v110 = [v86 objectAtIndexedSubscript:3];
      [v110 bounds];
      double v112 = v111;
      double v114 = v113;

      float v115 = (v185 - v180) * (v185 - v180) + (v188 - aRectb) * (v188 - aRectb);
      float v116 = sqrtf(v115);
      float v117 = (v99 - v104) * (v99 - v104) + (v97 - v102) * (v97 - v102);
      float v118 = sqrtf(v117);
      if (vabds_f32(v116, v118) < 0.01)
      {
        float v119 = (v109 - v114) * (v109 - v114) + (v107 - v112) * (v107 - v112);
        if (vabds_f32(v118, sqrtf(v119)) < 0.01)
        {
          CGFloat v120 = (void *)[objc_alloc(MEMORY[0x263F7ECD0]) initWithOrderedFeatures:v86];
          [v120 bounds];
          CGFloat v122 = v121;
          CGFloat v124 = v123;
          CGFloat v126 = v125;
          CGFloat v128 = v127;
          [v120 bounds];
          double v130 = v129;
          [v120 bounds];
          CGFloat v132 = v131 * -0.100000001;
          v244.origin.CGFloat x = v122;
          v244.origin.CGFloat y = v124;
          v244.size.CGFloat width = v126;
          v244.size.CGFloat height = v128;
          CGRect v245 = CGRectInset(v244, v130 * -0.0500000007, v132);
          CGFloat v186 = v245.origin.y;
          CGFloat v189 = v245.origin.x;
          CGFloat aRecta = v245.size.width;
          CGFloat v133 = v245.size.height;
          double v134 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v86, "count"));
          long long v194 = 0u;
          long long v195 = 0u;
          long long v192 = 0u;
          long long v193 = 0u;
          id v135 = v86;
          uint64_t v136 = [v135 countByEnumeratingWithState:&v192 objects:v201 count:16];
          if (v136)
          {
            uint64_t v137 = *(void *)v193;
            do
            {
              for (uint64_t j = 0; j != v136; ++j)
              {
                if (*(void *)v193 != v137) {
                  objc_enumerationMutation(v135);
                }
                [*(id *)(*((void *)&v192 + 1) + 8 * j) bounds];
                CGFloat v140 = v139;
                CGFloat v142 = v141;
                CGFloat v144 = v143;
                CGFloat v146 = v145;
                [v120 bounds];
                double v148 = v147;
                [v120 bounds];
                CGFloat v150 = v149 * -0.100000001;
                v246.origin.CGFloat x = v140;
                v246.origin.CGFloat y = v142;
                v246.size.CGFloat width = v144;
                v246.size.CGFloat height = v146;
                CGRect v247 = CGRectInset(v246, v148 * -0.0500000007, v150);
                double v151 = NSStringFromRect(v247);
                [v134 addObject:v151];
              }
              uint64_t v136 = [v135 countByEnumeratingWithState:&v192 objects:v201 count:16];
            }
            while (v136);
          }

          BOOL v152 = NSDictionary;
          v248.origin.CGFloat y = v186;
          v248.origin.CGFloat x = v189;
          v248.size.CGFloat width = aRecta;
          v248.size.CGFloat height = v133;
          size_t v153 = NSStringFromRect(v248);
          float v154 = objc_msgSend(v152, "dictionaryWithObjectsAndKeys:", v153, @"paddedRect", v134, @"paddedRects", v120, @"textFeatures", 0);
          [v190 addObject:v154];
        }
      }
    }
  }

  return v190;
}

uint64_t __38__CRCameraReader_targetRectsForImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 bounds];
  double Width = CGRectGetWidth(v11);
  [v4 bounds];
  double Height = CGRectGetHeight(v12);
  [v5 bounds];
  double v8 = CGRectGetWidth(v13);
  [v5 bounds];
  if (Width * Height < v8 * CGRectGetHeight(v14)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __38__CRCameraReader_targetRectsForImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 bounds];
  double v6 = v5;
  [v4 bounds];
  if (v6 >= v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

- (id)findCCObjectEmbossed:(id)a3 inImage:(id)a4 forRect:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  NSRect v29 = NSRectFromString((NSString *)a5);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  unint64_t v14 = [v9 height];
  unint64_t v15 = [v9 width];
  unint64_t v16 = [v9 height];
  float v17 = 28.0 / (height * (double)v14);
  double v18 = v17;
  v30.size.double width = v18 * (double)v15;
  v30.size.double height = v18 * (double)v16;
  v30.origin.double x = 0.0;
  v30.origin.double y = 0.0;
  CGRect v31 = CGRectIntegral(v30);
  CGFloat v19 = objc_msgSend(v9, "imageByScalingToWidth:height:", (unint64_t)v31.size.width, (unint64_t)v31.size.height, v31.origin.x, v31.origin.y);
  unint64_t v20 = [v19 width];
  unint64_t v21 = [v19 width];
  unint64_t v22 = [v19 height];
  unint64_t v23 = [v19 height];
  v32.origin.double x = x * (double)v20;
  v32.size.double width = width * (double)v21;
  v32.origin.double y = y * (double)v22;
  v32.size.double height = height * (double)v23;
  CGRect v33 = CGRectIntegral(v32);
  *(float *)&v33.size.double width = v33.size.width * 0.125;
  double v24 = objc_msgSend(v19, "imageByCroppingRectangle:", v33.origin.x, v33.origin.y, (float)((float)(ceilf(*(float *)&v33.size.width) * 8.0) + -5.0), 28.0);
  if ([v8 isEqualToString:@"CROutputTypeCreditCardName"])
  {
    uint64_t v25 = [(CRCameraReader *)self findCCNameInImageEmbossed:v24];
LABEL_5:
    double v26 = (void *)v25;
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"CRCameraReaderCreditCardExpirationDate"])
  {
    uint64_t v25 = [(CRCameraReader *)self findCCExpDateInImageEmbossed:v24];
    goto LABEL_5;
  }
  double v26 = 0;
LABEL_7:

  return v26;
}

- (id)findObjectsFlat:(id)a3 inImage:(id)a4 numberRects:(id)a5 invert:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v147 = *MEMORY[0x263EF8340];
  id v108 = a3;
  id v10 = a4;
  id v106 = a5;
  double v109 = [MEMORY[0x263EFF910] date];
  CGRect v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  CGRect v12 = [v11 objectForKey:@"com.apple.CoreRecognition.show_engine_name"];
  int v112 = [v12 BOOLValue];

  unint64_t v13 = [v10 height];
  BOOL v14 = v13 > [v10 width];
  double v107 = [MEMORY[0x263EFFA08] setWithArray:v108];
  id v125 = [MEMORY[0x263EFF9A0] dictionary];
  [v125 setObject:MEMORY[0x263EFFA88] forKey:@"isDetectedRect"];
  unint64_t v15 = [NSNumber numberWithBool:v14];
  [v125 setObject:v15 forKey:@"isPortrait"];

  unint64_t v16 = [NSNumber numberWithBool:v6];
  [v125 setObject:v16 forKey:@"inverted"];

  int v117 = [v107 containsObject:@"CROutputTypeCreditCardName"];
  int v113 = [v107 containsObject:@"CRCameraReaderCreditCardExpirationDate"];
  CGFloat v105 = [MEMORY[0x263EFF980] array];
  float v17 = +[CRInsights sharedInsights];
  double v18 = [v17 takeContextSnapshot];

  v138[0] = MEMORY[0x263EF8330];
  v138[1] = 3221225472;
  v138[2] = __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke;
  v138[3] = &unk_26429E878;
  BOOL v143 = v14;
  id v104 = v18;
  id v139 = v104;
  CGFloat v140 = self;
  id v103 = v10;
  id v141 = v103;
  BOOL v144 = v6;
  id v19 = v105;
  id v142 = v19;
  [v106 enumerateObjectsWithOptions:1 usingBlock:v138];
  double v111 = [MEMORY[0x263EFF980] array];
  CGFloat v110 = [MEMORY[0x263EFF980] array];
  unint64_t v20 = +[CRInsights sharedInsights];
  if (v20)
  {
    unint64_t v21 = +[CRInsights sharedInsights];
    unint64_t v22 = [v21 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_360];
  }
  else
  {
    unint64_t v22 = [NSNumber numberWithBool:0];
    unint64_t v21 = v22;
  }
  if ([v22 BOOLValue])
  {
    double v127 = [MEMORY[0x263EFF980] array];
    if (!v20) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  double v127 = 0;
  if (v20) {
LABEL_8:
  }

LABEL_9:
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  obuint64_t j = v19;
  uint64_t v119 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
  if (!v119) {
    goto LABEL_77;
  }
  uint64_t v118 = *(void *)v135;
  do
  {
    for (uint64_t i = 0; i != v119; ++i)
    {
      if (*(void *)v135 != v118) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(*((void *)&v134 + 1) + 8 * i);
      double v24 = [v23 objectForKey:@"Cardholder"];
      CGFloat v126 = (void *)[v24 mutableCopy];

      uint64_t v25 = [v23 objectForKey:@"Expiration"];
      CGFloat v124 = (void *)[v25 mutableCopy];

      double v26 = +[CRInsights sharedInsights];
      if (v26)
      {
        double v121 = +[CRInsights sharedInsights];
        CGFloat v27 = [v121 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_362];
        CGFloat v120 = v27;
      }
      else
      {
        CGFloat v27 = [NSNumber numberWithBool:0];
        CGFloat v122 = v27;
      }
      int v28 = [v27 BOOLValue];
      NSRect v29 = v122;
      if (v26)
      {

        NSRect v29 = v121;
      }

      if (v28)
      {
        CGRect v30 = [v23 objectForKey:@"cardnumberFragmented"];
        if (v30) {
          [v23 objectForKey:@"cardnumberFragmented"];
        }
        else {
        CGRect v31 = [v23 objectForKey:@"CardNumber"];
        }

        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v145 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v131;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v131 != v34) {
                objc_enumerationMutation(v32);
              }
              float v36 = (void *)[*(id *)(*((void *)&v130 + 1) + 8 * j) mutableCopy];
              double v37 = [v36 objectForKey:@"code"];
              BOOL v38 = v37 == 0;

              if (!v38)
              {
                double v39 = [v23 objectForKey:@"fieldCutRect"];
                [v36 setObject:v39 forKey:@"numberCutRect"];

                double v40 = [v23 objectForKey:@"codeOrigin"];
                [v36 setObject:v40 forKey:@"codeOrigin"];

                double v41 = [v23 objectForKey:@"codeFragmentOrigins"];
                if (v41) {
                  [v36 setObject:v41 forKey:@"codeFragmentOrigins"];
                }
                [v127 addObject:v36];
              }
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v130 objects:v145 count:16];
          }
          while (v33);
        }
      }
      double v42 = [v23 objectForKey:@"code"];
      BOOL v43 = v42 == 0;

      if (!v43)
      {
        double v44 = [v23 objectForKey:@"code"];
        [v125 setObject:v44 forKey:@"code"];

        double v45 = [v23 objectForKey:@"accepted"];
        [v125 setObject:v45 forKey:@"accepted"];

        double v46 = [v23 objectForKey:@"codeOrigin"];
        [v125 setObject:v46 forKey:@"codeOrigin"];

        double v47 = [v23 objectForKey:@"codeFragmentOrigins"];
        if (v47) {
          [v125 setObject:v47 forKey:@"codeFragmentOrigins"];
        }
        goto LABEL_38;
      }
      if (v124) {
        int v48 = v113;
      }
      else {
        int v48 = 0;
      }
      if (v48 == 1)
      {
        double v49 = [v23 objectForKey:@"fieldCutRect"];
        [v124 setObject:v49 forKey:@"expDateCutRect"];

        uint64_t v50 = [v23 objectForKey:@"dateOrigin"];
        [v124 setObject:v50 forKey:@"dateOrigin"];

        [v110 addObject:v124];
        unint64_t v51 = [v124 objectForKey:@"expDateAccepted"];
        LOBYTE(v50) = v51 == 0;

        if ((v50 & 1) == 0)
        {
          double v52 = [v124 objectForKey:@"expirationDate"];
          [v125 setObject:v52 forKey:@"expirationDate"];

          uint64_t v53 = +[CRInsights sharedInsights];
          [(id)v53 provideInsightValue:v124 forKey:@"expirationDate"];

          double v54 = [v124 objectForKey:@"expirationYear"];
          LOBYTE(v53) = v54 == 0;

          if ((v53 & 1) == 0)
          {
            double v55 = [v124 objectForKey:@"expirationYear"];
            [v125 setObject:v55 forKey:@"expirationYear"];
          }
          long long v56 = [v124 objectForKey:@"expirationMonth"];
          BOOL v57 = v56 == 0;

          if (!v57)
          {
            double v58 = [v124 objectForKey:@"expirationMonth"];
            [v125 setObject:v58 forKey:@"expirationMonth"];
          }
          double v59 = [v124 objectForKey:@"expirationDay"];
          BOOL v60 = v59 == 0;

          if (!v60)
          {
            double v61 = [v124 objectForKey:@"expirationDay"];
            [v125 setObject:v61 forKey:@"expirationDay"];
          }
          uint64_t v62 = [v124 objectForKey:@"dateOrigin"];
          BOOL v63 = v62 == 0;

          if (!v63)
          {
            double v47 = [v124 objectForKey:@"dateOrigin"];
            [v125 setObject:v47 forKey:@"dateOrigin"];
LABEL_38:
          }
        }
      }
      if (v126) {
        int v64 = v117;
      }
      else {
        int v64 = 0;
      }
      if (v64 == 1)
      {
        CGRect v65 = [v126 objectForKey:@"nameResult"];
        double v66 = [NSNumber numberWithBool:isValidNameString(v65)];
        [v126 setObject:v66 forKey:@"isValidNameString"];

        CGRect v67 = [NSNumber numberWithBool:isNonNameString(v65)];
        [v126 setObject:v67 forKey:@"isNonNameString"];

        BOOL v68 = [v23 objectForKey:@"fieldCutRect"];
        [v126 setObject:v68 forKey:@"nameCutRect"];

        double v69 = [v23 objectForKey:@"nameOrigin"];
        [v126 setObject:v69 forKey:@"nameOrigin"];

        uint64_t v70 = +[CRInsights sharedInsights];
        if (v70)
        {
          double v71 = +[CRInsights sharedInsights];
          v128[0] = MEMORY[0x263EF8330];
          v128[1] = 3221225472;
          v128[2] = __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_4;
          v128[3] = &unk_26429E790;
          id v129 = v126;
          CGRect v72 = [v71 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:v128];
          float v116 = v72;
        }
        else
        {
          double v73 = NSNumber;
          double v71 = [v126 objectForKey:@"isNonNameString"];
          CGRect v72 = objc_msgSend(v73, "numberWithBool:", objc_msgSend(v71, "BOOLValue") ^ 1);
          float v115 = v72;
        }
        int v74 = [v72 BOOLValue];
        double v75 = v115;
        if (v70) {
          double v75 = v116;
        }

        if (v74) {
          [v111 addObject:v126];
        }
        if (v70) {

        }
        double v76 = [v126 objectForKey:@"nameAccepted"];
        BOOL v77 = v76 == 0;

        if (!v77)
        {
          if (v112) {
            [v126 objectForKey:@"nameResult"];
          }
          else {
          double v78 = [v126 objectForKey:@"closestNameMatch"];
          }
          [v126 setObject:v78 forKey:@"cardholderName"];

          double v79 = [v126 objectForKey:@"cardholderName"];
          [v125 setObject:v79 forKey:@"cardholderName"];

          double v80 = [v23 objectForKey:@"fieldCutRect"];
          [v125 setObject:v80 forKey:@"nameCutRect"];

          double v81 = [v23 objectForKey:@"nameOrigin"];
          [v125 setObject:v81 forKey:@"nameOrigin"];
        }
      }
      long long v82 = [v125 objectForKey:@"cardholderName"];
      BOOL v83 = v82 == 0;

      if (v83)
      {
        float v84 = [v126 objectForKey:@"nameResult"];
        uint64_t v85 = [v126 objectForKey:@"isValidNameString"];
        int v86 = [v85 BOOLValue];

        if (v86)
        {
          [v125 setObject:v84 forKey:@"cardholderName"];
          BOOL v87 = +[CRInsights sharedInsights];
          [v87 provideInsightValue:v84 forKey:@"nameResults"];
        }
      }
    }
    uint64_t v119 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
  }
  while (v119);
LABEL_77:

  double v88 = NSNumber;
  [v109 timeIntervalSinceNow];
  double v90 = [v88 numberWithDouble:-v89];
  [v125 setObject:v90 forKey:@"recognitionTime"];

  double v91 = +[CRInsights sharedInsights];
  CGFloat v92 = NSNumber;
  [v109 timeIntervalSinceNow];
  double v94 = [v92 numberWithDouble:-v93];
  [v91 provideInsightValue:v94 forKey:@"recognitionTime"];

  [v125 setObject:v110 forKey:@"expDateResults"];
  [v125 setObject:v111 forKey:@"nameResults"];
  double v95 = +[CRInsights sharedInsights];
  if (v95)
  {
    double v96 = +[CRInsights sharedInsights];
    double v97 = [v96 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_382];
  }
  else
  {
    double v97 = [NSNumber numberWithBool:0];
    double v96 = v97;
  }
  int v98 = [v97 BOOLValue];
  if (v95) {

  }
  if (v98) {
    [v125 setObject:v127 forKey:@"numberResults"];
  }
  double v99 = +[CRInsights sharedInsights];
  [v99 provideInsightValue:v127 forKey:@"numberResults"];

  double v100 = +[CRInsights sharedInsights];
  [v100 provideInsightValue:v110 forKey:@"expDateResults"];

  double v101 = +[CRInsights sharedInsights];
  [v101 provideInsightValue:v111 forKey:@"nameResults"];

  return v125;
}

void __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke(uint64_t a1, void *a2)
{
  id v48 = a2;
  id v3 = +[CRInsights sharedInsights];
  [v3 attachContextCopyToCurrentThread:*(void *)(a1 + 32)];

  double v47 = [v48 objectForKey:@"paddedRect"];
  id v4 = [v48 objectForKey:@"textFeatures"];
  NSRect v55 = NSRectFromString(v47);
  double x = v55.origin.x;
  double y = v55.origin.y;
  CGFloat width = v55.size.width;
  double height = v55.size.height;
  if (*(unsigned char *)(a1 + 64)) {
    double v9 = 85.685;
  }
  else {
    double v9 = 54.05;
  }
  if (*(unsigned char *)(a1 + 64)) {
    double v10 = 54.05;
  }
  else {
    double v10 = 85.685;
  }
  CGRect v11 = [*(id *)(a1 + 40) findCCResultsInImageFlat:*(void *)(a1 + 48) usingTextFeatures:v4 invert:*(unsigned __int8 *)(a1 + 65)];
  double v46 = width;
  CGRect v12 = (void *)[v11 mutableCopy];
  double v13 = (1.0 - y - height) * v9;
  double v14 = height * v9;
  double v15 = x * v10;

  if (*(unsigned char *)(a1 + 65)) {
    double v16 = 54.05 - v13 - v14;
  }
  else {
    double v16 = v13;
  }
  v50.double x = v15;
  v50.double y = v16;
  float v17 = NSStringFromPoint(v50);
  [v12 setObject:v17 forKey:@"fieldOrigin"];

  v56.origin.double x = v15;
  v56.origin.double y = v13;
  v56.size.CGFloat width = v46 * v10;
  v56.size.double height = v14;
  double v18 = NSStringFromRect(v56);
  [v12 setObject:v18 forKey:@"fieldCutRect"];

  id v19 = [v12 objectForKey:@"Expiration"];
  unint64_t v20 = [v19 objectForKey:@"normalizedDateOffset"];
  [v20 floatValue];
  float v22 = v21;

  id v23 = [v12 objectForKey:@"Cardholder"];
  double v24 = [v23 objectForKey:@"normalizedNameOffset"];
  [v24 floatValue];
  float v26 = v25;

  v51.double x = v22 * 85.685;
  v51.double y = v16;
  CGFloat v27 = NSStringFromPoint(v51);
  [v12 setObject:v27 forKey:@"dateOrigin"];

  v52.double x = v26 * 85.685;
  v52.double y = v16;
  int v28 = NSStringFromPoint(v52);
  [v12 setObject:v28 forKey:@"nameOrigin"];

  v53.double x = v15;
  v53.double y = v16;
  NSRect v29 = NSStringFromPoint(v53);
  [v12 setObject:v29 forKey:@"codeOrigin"];

  CGRect v30 = [v48 objectForKey:@"paddedRects"];
  CGRect v31 = v30;
  if (v30)
  {
    id v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    uint64_t v33 = [v12 objectForKey:@"CardNumber"];
    for (unint64_t i = 0; i < [v31 count] && i < objc_msgSend(v33, "count"); ++i)
    {
      unint64_t v35 = [v31 objectAtIndex:i];
      NSRect v57 = NSRectFromString(v35);
      double v36 = v57.origin.x;
      double v37 = v57.origin.y;
      double v38 = v57.size.height;

      if (*(unsigned char *)(a1 + 65)) {
        double v39 = 54.05 - (1.0 - v37 - v38) * 54.05 - v38 * 54.05;
      }
      else {
        double v39 = (1.0 - v37 - v38) * 54.05;
      }
      double v40 = [v33 objectAtIndex:i];
      double v41 = [v40 objectForKey:@"normalizedCodeOffset"];
      [v41 floatValue];
      float v43 = v42;

      v54.double x = v36 * 85.685 + v43 * 85.685;
      v54.double y = v39;
      double v44 = NSStringFromPoint(v54);
      [v32 addObject:v44];
    }
    [v12 setObject:v32 forKey:@"codeFragmentOrigins"];
  }
  id v45 = *(id *)(a1 + 56);
  objc_sync_enter(v45);
  [*(id *)(a1 + 56) addObject:v12];
  objc_sync_exit(v45);
}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_2()
{
  return [NSNumber numberWithBool:0];
}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_3()
{
  return [NSNumber numberWithBool:0];
}

id __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_4(uint64_t a1)
{
  BOOL v1 = NSNumber;
  int v2 = [*(id *)(a1 + 32) objectForKey:@"isNonNameString"];
  id v3 = objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "BOOLValue") ^ 1);

  return v3;
}

uint64_t __61__CRCameraReader_findObjectsFlat_inImage_numberRects_invert___block_invoke_5()
{
  return [NSNumber numberWithBool:0];
}

- (id)findCCObjectsEmbossed:(id)a3 inImage:(id)a4 numberRects:(id)a5 nameRects:(id)a6 dateRects:(id)a7
{
  uint64_t v208 = *MEMORY[0x263EF8340];
  id v132 = a3;
  id v142 = a4;
  id v129 = a5;
  id v130 = a6;
  id v131 = a7;
  clock_t v126 = clock();
  CGRect v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v13 = [v12 objectForKey:@"com.apple.CoreRecognition.exaustive_search"];
  char v134 = [v13 BOOLValue];

  double v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v15 = [v14 objectForKey:@"com.apple.CoreRecognition.show_engine_name"];
  LODWORD(v123) = [v15 BOOLValue];

  unint64_t v146 = [v142 height];
  unint64_t v145 = [v142 width];
  long long v133 = [MEMORY[0x263EFFA08] setWithArray:v132];
  id v136 = [MEMORY[0x263EFF9A0] dictionary];
  int v127 = [v133 containsObject:@"CROutputTypeCreditCardName"];
  HIDWORD(v123) = [v133 containsObject:@"CRCameraReaderCreditCardExpirationDate"];
  v210.origin.CGFloat x = *(CGFloat *)MEMORY[0x263F00148];
  v210.origin.CGFloat y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v210.size.double width = 428.425;
  v210.size.double height = 270.25;
  CGRect v211 = CGRectIntegral(v210);
  double height = v211.size.height;
  CGFloat y = v211.origin.y;
  if (v146 <= v145)
  {
    double width = v211.size.height;
    double height = v211.size.width;
    CGFloat x = v211.origin.y;
    CGFloat y = v211.origin.x;
  }
  else
  {
    double width = v211.size.width;
    CGFloat x = v211.origin.x;
  }
  clock_t v128 = clock();
  id v141 = [MEMORY[0x263EFF9A0] dictionary];
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  obuint64_t j = v129;
  uint64_t v18 = [obj countByEnumeratingWithState:&v202 objects:v207 count:16];
  if (v18)
  {
    double v177 = 0;
    uint64_t v139 = *(void *)v203;
    double v19 = 54.05;
    if (v146 <= v145) {
      double v20 = 54.05;
    }
    else {
      double v20 = 85.685;
    }
    if (v146 <= v145) {
      double v19 = 85.685;
    }
    double v137 = v19;
    double v138 = v20;
    while (2)
    {
      uint64_t v175 = 0;
      uint64_t v140 = v18;
      do
      {
        if (*(void *)v203 != v139) {
          objc_enumerationMutation(obj);
        }
        CGFloat v150 = (NSString *)*(id *)(*((void *)&v202 + 1) + 8 * v175);
        NSRect v212 = NSRectFromString(v150);
        double v172 = v212.origin.x;
        double v21 = v212.origin.y;
        double v22 = v212.size.width;
        double v23 = v212.size.height;
        *(float *)&v212.origin.CGFloat x = 28.0 / (width * v212.size.height);
        v212.origin.CGFloat x = *(float *)&v212.origin.x;
        v212.size.double width = height * v212.origin.x;
        v212.size.double height = width * v212.origin.x;
        v212.origin.CGFloat x = y;
        v212.origin.CGFloat y = x;
        CGRect v213 = CGRectIntegral(v212);
        double v24 = v213.origin.x;
        double v25 = v213.origin.y;
        double v26 = v213.size.width;
        double v27 = v213.size.height;
        v213.origin.CGFloat x = *(CGFloat *)MEMORY[0x263F00148];
        v213.origin.CGFloat y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
        v213.size.double height = 405.375;
        v213.size.double width = 642.6375;
        CGRectIntegral(v213);
        double v160 = v21 + 0.035;
        double v155 = v21 + 0.035 + 0.01;
        v169.CGFloat x = v137 * v172;
        v169.CGFloat y = v138 * (1.0 - v21 - v23);
        double v147 = v137 * v22;
        double v148 = v138 * v23;
        if (v146 > v145) {
          double v28 = v26;
        }
        else {
          double v28 = v27;
        }
        if (v146 > v145) {
          double v29 = v27;
        }
        else {
          double v29 = v26;
        }
        if (v146 > v145) {
          double v30 = v24;
        }
        else {
          double v30 = v25;
        }
        double v152 = v30;
        if (v146 <= v145) {
          double v25 = v24;
        }
        double v163 = v7;
        double width = v28;
        double height = v29;
        CGRect v31 = objc_msgSend(v142, "imageByScalingToWidth:height:", (unint64_t)v29, (unint64_t)v28, v123);
        unint64_t v157 = [v31 width];
        double v32 = v23 * 0.65;
        unint64_t v153 = [v31 width];
        unint64_t v33 = [v31 height];
        unint64_t v34 = [v31 height];
        unint64_t v151 = [v31 width];
        unint64_t v35 = [v31 width];
        unint64_t v36 = [v31 height];
        unint64_t v37 = [v31 height];
        unint64_t v38 = [v31 width];
        unint64_t v39 = [v31 width];
        unint64_t v40 = [v31 height];
        unint64_t v41 = [v31 height];
        v214.origin.CGFloat x = v172 * (double)v157;
        v214.size.double width = v22 * (double)v153;
        v214.origin.CGFloat y = v21 * (double)v33;
        v214.size.double height = v23 * (double)v34;
        CGRect v215 = CGRectIntegral(v214);
        double v42 = v215.origin.x;
        double v43 = v215.origin.y;
        double v44 = v215.size.width;
        v215.origin.CGFloat x = (double)v151 * 0.85;
        v215.size.double width = (double)v35 * 0.06;
        v215.origin.CGFloat y = v160 * (double)v36;
        v215.size.double height = v32 * (double)v37;
        CGRect v216 = CGRectIntegral(v215);
        double v173 = v216.origin.x;
        double v161 = v216.origin.y;
        double v7 = v163;
        double v45 = v216.size.width;
        double v46 = v32;
        double v47 = v216.size.height;
        v216.origin.CGFloat x = (double)v38 * 0.85;
        v216.size.double width = (double)v39 * 0.06;
        v216.origin.CGFloat y = v155 * (double)v40;
        v216.size.double height = v46 * (double)v41;
        CGRect v217 = CGRectIntegral(v216);
        double v156 = v217.origin.y;
        double v158 = v217.origin.x;
        double v154 = v217.size.height;
        double v48 = v217.size.width;
        *(float *)&v217.origin.CGFloat x = v44 * 0.125;
        double v49 = (float)((float)(ceilf(*(float *)&v217.origin.x) * 8.0) + -5.0);
        NSPoint v50 = objc_msgSend(v31, "imageByCroppingRectangle:", v42, v43, v49, 28.0);
        CGFloat y = v25;
        [(CRCameraReader *)self findCCNumberInImageEmbossed:v50];
        NSPoint v51 = x = v152;

        NSPoint v52 = [v51 objectForKey:@"code"];
        LODWORD(v39) = v52 == 0;

        if (v39)
        {
          v218.size.double height = 28.0;
          v218.origin.CGFloat x = v42;
          v218.origin.CGFloat y = v43;
          v218.size.double width = v49;
          CGRect v219 = CGRectInset(v218, 60.0, 0.0);
          uint64_t v53 = objc_msgSend(v31, "imageByCroppingRectangle:", v219.origin.x, v219.origin.y, v219.size.width, v219.size.height);

          float v54 = v45 * 0.125;
          NSRect v55 = objc_msgSend(v31, "imageByCroppingRectangle:", v173, v161, (float)((float)(ceilf(v54) * 8.0) + -5.0), v47);
          double v177 = [(CRCameraReader *)self findCCNumberInImageEmbossed:v53 withFinalDigit:v55];

          NSRect v56 = [v177 objectForKey:@"code"];
          BOOL v57 = v56 == 0;

          if (v57)
          {
            float v58 = v48 * 0.125;
            double v59 = objc_msgSend(v31, "imageByCroppingRectangle:", v158, v156, (float)((float)(ceilf(v58) * 8.0) + -5.0), v154);
            uint64_t v60 = [(CRCameraReader *)self findCCNumberInImageEmbossed:v53 withFinalDigit:v59];

            double v177 = (void *)v60;
          }

          NSPoint v50 = (void *)v53;
        }
        else
        {
          double v177 = v51;
        }
        double v61 = +[CRInsights sharedInsights];
        if (v61)
        {
          double v7 = +[CRInsights sharedInsights];
          uint64_t v62 = [v7 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_387];
          BOOL v143 = v62;
        }
        else
        {
          uint64_t v62 = [NSNumber numberWithBool:0];
          BOOL v144 = v62;
        }
        int v63 = [v62 BOOLValue];
        int v64 = v144;
        if (v61)
        {

          int v64 = v7;
        }

        if (v63)
        {
          CGRect v65 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v177];
          v220.origin = v169;
          v220.size.double width = v147;
          v220.size.double height = v148;
          double v66 = NSStringFromRect(v220);
          [v65 setObject:v66 forKey:@"numberCutRect"];

          uint64_t v67 = NSStringFromPoint(v169);
          [v65 setObject:v67 forKey:@"codeOrigin"];

          BOOL v68 = [v177 objectForKey:@"accepted"];
          LOBYTE(v67) = v68 == 0;

          if ((v67 & 1) == 0)
          {
            [v141 addEntriesFromDictionary:v65];
            double v69 = NSStringFromPoint(v169);
            [v141 setObject:v69 forKey:@"codeOrigin"];

            uint64_t v70 = [NSNumber numberWithBool:v146 > v145];
            [v141 setObject:v70 forKey:@"isPortrait"];

            if ((v134 & 1) == 0) {
              goto LABEL_45;
            }
          }
        }
        else
        {
          [v136 addEntriesFromDictionary:v177];
          double v71 = [v177 objectForKey:@"accepted"];
          BOOL v72 = v71 == 0;

          if (!v72)
          {
            double v73 = NSStringFromPoint(v169);
            [v136 setObject:v73 forKey:@"codeOrigin"];

            int v74 = [NSNumber numberWithBool:v146 > v145];
            [v136 setObject:v74 forKey:@"isPortrait"];

            CGRect v65 = +[CRInsights sharedInsights];
            [v65 provideInsightValue:v177 forKey:@"CRInsightsRecognitionResultForNumberEmbossed"];
LABEL_45:

            goto LABEL_46;
          }
        }

        ++v175;
      }
      while (v140 != v175);
      uint64_t v18 = [obj countByEnumeratingWithState:&v202 objects:v207 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v177 = 0;
  }
LABEL_46:

  *(float *)&double v75 = (float)(clock() - v128) / 1000000.0;
  double v76 = [NSNumber numberWithFloat:v75];
  [v136 setObject:v76 forKey:@"codeRecognitionTime"];

  BOOL v77 = +[CRInsights sharedInsights];
  if (v77)
  {
    double v78 = +[CRInsights sharedInsights];
    double v79 = [v78 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_392];
  }
  else
  {
    double v79 = [NSNumber numberWithBool:0];
    double v78 = v79;
  }
  if (objc_msgSend(v79, "BOOLValue", v123))
  {
    int v80 = 1;
  }
  else
  {
    double v81 = [v177 objectForKey:@"accepted"];
    int v80 = [v81 BOOLValue];
  }
  if (v77) {

  }
  if (v80)
  {
    group = dispatch_group_create();
    BOOL v176 = [MEMORY[0x263EFF9A0] dictionary];
    double v174 = [MEMORY[0x263EFF9A0] dictionary];
    if (v127)
    {
      clock_t v82 = clock();
      CGFloat v166 = [MEMORY[0x263EFF980] array];
      clock_t v162 = v82;
      double v164 = [MEMORY[0x263EFF9C0] set];
      BOOL v83 = +[CRInsights sharedInsights];
      float v84 = [v83 takeContextSnapshot];

      v192[0] = MEMORY[0x263EF8330];
      v192[1] = 3221225472;
      v192[2] = __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_3;
      v192[3] = &unk_26429E8A0;
      id v159 = v84;
      id v193 = v159;
      long long v194 = self;
      id v195 = v142;
      BOOL v199 = v146 > v145;
      char v200 = 0;
      id v170 = v166;
      id v196 = v170;
      char v201 = v124;
      id v85 = v176;
      id v197 = v85;
      id v168 = v164;
      id v198 = v168;
      [v130 enumerateObjectsWithOptions:1 usingBlock:v192];
      int v86 = objc_msgSend(v85, "objectForKey:");
      LODWORD(v84) = v86 == 0;

      if (v84)
      {
        long long v191 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        long long v188 = 0u;
        id v87 = v170;
        uint64_t v88 = [v87 countByEnumeratingWithState:&v188 objects:v206 count:16];
        if (v88)
        {
          uint64_t v89 = *(void *)v189;
          while (2)
          {
            for (uint64_t i = 0; i != v88; ++i)
            {
              if (*(void *)v189 != v89) {
                objc_enumerationMutation(v87);
              }
              double v91 = *(void **)(*((void *)&v188 + 1) + 8 * i);
              CGFloat v92 = [v91 objectForKey:@"nameResult"];
              double v93 = [v91 objectForKey:@"isValidNameString"];
              int v94 = [v93 BOOLValue];

              if (v94)
              {
                [v85 setObject:v92 forKey:@"cardholderName"];

                goto LABEL_67;
              }
            }
            uint64_t v88 = [v87 countByEnumeratingWithState:&v188 objects:v206 count:16];
            if (v88) {
              continue;
            }
            break;
          }
        }
LABEL_67:
      }
      [v85 setObject:v170 forKey:@"nameResults"];
      [v130 removeAllObjects];
      double v95 = [v168 allObjects];
      [v130 addObjectsFromArray:v95];

      *(float *)&double v96 = (float)(clock() - v162) / 1000000.0;
      double v97 = [NSNumber numberWithFloat:v96];
      [v85 setObject:v97 forKey:@"nameRecognitionTime"];
    }
    if (v125)
    {
      clock_t v98 = clock();
      double v99 = [MEMORY[0x263EFF9C0] set];
      double v100 = [MEMORY[0x263EFF980] array];
      double v101 = +[CRInsights sharedInsights];
      double v102 = [v101 takeContextSnapshot];

      v178[0] = MEMORY[0x263EF8330];
      v178[1] = 3221225472;
      v178[2] = __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_4;
      v178[3] = &unk_26429E8A0;
      id v103 = v102;
      id v179 = v103;
      double v180 = self;
      id v181 = v142;
      BOOL v185 = v146 > v145;
      char v186 = 0;
      id v104 = v100;
      id v182 = v104;
      id v105 = v99;
      id v183 = v105;
      id v106 = v174;
      id v184 = v106;
      char v187 = v134;
      [v131 enumerateObjectsWithOptions:1 usingBlock:v178];
      [v106 setObject:v104 forKey:@"expDateResults"];
      *(float *)&double v107 = (float)(clock() - v98) / 1000000.0;
      id v108 = [NSNumber numberWithFloat:v107];
      [v106 setObject:v108 forKey:@"expDateRecognitionTime"];

      [v131 removeAllObjects];
      double v109 = [v105 allObjects];
      [v131 addObjectsFromArray:v109];
    }
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    *(float *)&double v110 = (float)(clock() - v126) / 1000000.0;
    double v111 = [NSNumber numberWithFloat:v110];
    [v136 setObject:v111 forKey:@"totalRecognitionTime"];

    [v136 addEntriesFromDictionary:v176];
    [v136 addEntriesFromDictionary:v174];
    int v112 = +[CRInsights sharedInsights];
    if (v112)
    {
      int v113 = +[CRInsights sharedInsights];
      double v114 = [v113 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_411];
    }
    else
    {
      double v114 = [NSNumber numberWithBool:0];
      int v113 = v114;
    }
    int v115 = [v114 BOOLValue];
    if (v112) {

    }
    if (v115) {
      [v136 addEntriesFromDictionary:v141];
    }
    float v116 = +[CRInsights sharedInsights];
    [v116 provideInsightValue:v176 forKey:@"CRInsightsRecognitionResultForNameEmbossed"];

    int v117 = +[CRInsights sharedInsights];
    [v117 provideInsightValue:v174 forKey:@"CRInsightsRecognitionResultForExpDateEmbossed"];

    uint64_t v118 = +[CRInsights sharedInsights];
    [v118 provideInsightValue:v141 forKey:@"CRInsightsRecognitionResultForNumberEmbossed"];

    uint64_t v119 = +[CRInsights sharedInsights];
    [v119 provideInsightValue:v141 forKey:@"numberResults"];

    CGFloat v120 = +[CRInsights sharedInsights];
    [v120 provideInsightValue:v176 forKey:@"nameResults"];

    double v121 = +[CRInsights sharedInsights];
    [v121 provideInsightValue:v174 forKey:@"expDateResults"];
  }
  return v136;
}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke()
{
  return [NSNumber numberWithBool:0];
}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_2()
{
  return [NSNumber numberWithBool:0];
}

void __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_3(uint64_t a1, void *a2)
{
  aString = a2;
  id v3 = +[CRInsights sharedInsights];
  [v3 attachContextCopyToCurrentThread:*(void *)(a1 + 32)];

  NSRect v50 = NSRectFromString(aString);
  double x = v50.origin.x;
  double y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  id v8 = [*(id *)(a1 + 40) findCCObjectEmbossed:@"CROutputTypeCreditCardName" inImage:*(void *)(a1 + 48) forRect:aString];
  double v9 = (void *)[v8 mutableCopy];

  if (*(unsigned char *)(a1 + 80)) {
    double v10 = 85.685;
  }
  else {
    double v10 = 54.05;
  }
  if (*(unsigned char *)(a1 + 80)) {
    double v11 = 54.05;
  }
  else {
    double v11 = 85.685;
  }
  CGRect v12 = [v9 objectForKey:@"nameResult"];
  double v13 = height;
  double v14 = (1.0 - y - height) * v10;
  double v45 = v13;
  CGFloat v46 = y;
  double v15 = v13 * v10;
  if (*(unsigned char *)(a1 + 81)) {
    double v16 = 54.05 - v14 - v13 * v10;
  }
  else {
    double v16 = v14;
  }
  float v17 = [v9 objectForKey:@"nameOffset"];
  [v17 floatValue];
  float v19 = v18;

  v51.origin.double x = x * v11;
  v51.origin.double y = v14;
  v51.size.double width = width * v11;
  v51.size.double height = v15;
  double v20 = NSStringFromRect(v51);
  [v9 setObject:v20 forKey:@"nameCutRect"];

  v49.double x = x * v11 + v19 / 7.5;
  v49.double y = v16;
  double v21 = NSStringFromPoint(v49);
  [v9 setObject:v21 forKey:@"nameOrigin"];

  double v22 = [NSNumber numberWithBool:isValidNameString(v12)];
  [v9 setObject:v22 forKey:@"isValidNameString"];

  double v23 = [NSNumber numberWithBool:isNonNameString(v12)];
  [v9 setObject:v23 forKey:@"isNonNameString"];

  id v24 = *(id *)(a1 + 56);
  objc_sync_enter(v24);
  [*(id *)(a1 + 56) addObject:v9];
  double v25 = [v9 objectForKey:@"nameAccepted"];

  if (v25)
  {
    if (*(unsigned char *)(a1 + 82)) {
      [v9 objectForKey:@"nameResult"];
    }
    else {
    double v26 = [v9 objectForKey:@"closestNameMatch"];
    }
    [v9 setObject:v26 forKey:@"cardholderName"];

    double v27 = *(void **)(a1 + 64);
    double v28 = [v9 objectForKey:@"cardholderName"];
    [v27 setObject:v28 forKey:@"cardholderName"];
  }
  double v29 = [v9 objectForKey:@"isValidNameString"];
  int v30 = [v29 BOOLValue];

  if (v30)
  {
    CGRect v31 = *(void **)(a1 + 72);
    v52.origin.double x = x;
    v52.origin.double y = v46;
    v52.size.double width = width;
    v52.size.double height = v45;
    double v32 = NSStringFromRect(v52);
    [v31 addObject:v32];

    v53.origin.double x = x;
    v53.origin.double y = v46;
    v53.size.double width = width;
    v53.size.double height = v45;
    CGRect v54 = CGRectOffset(v53, 0.0, v45 * 0.5);
    CGFloat v33 = v54.origin.x;
    double v34 = v54.origin.y;
    CGFloat v35 = v54.size.width;
    CGFloat v36 = v54.size.height;
    v54.origin.double x = x;
    v54.origin.double y = v46;
    v54.size.double width = width;
    v54.size.double height = v45;
    CGRect v55 = CGRectOffset(v54, 0.0, v45 * -0.5);
    CGFloat v37 = v55.origin.x;
    double v38 = v55.origin.y;
    CGFloat v39 = v55.size.width;
    CGFloat v40 = v55.size.height;
    if (v34 < 1.0)
    {
      unint64_t v41 = *(void **)(a1 + 72);
      v56.origin.double x = v33;
      v56.origin.double y = v34;
      v56.size.double width = v35;
      v56.size.double height = v36;
      double v42 = NSStringFromRect(v56);
      [v41 addObject:v42];
    }
    if (v38 > 0.670120259)
    {
      double v43 = *(void **)(a1 + 72);
      v57.origin.double x = v37;
      v57.origin.double y = v38;
      v57.size.double width = v39;
      v57.size.double height = v40;
      double v44 = NSStringFromRect(v57);
      [v43 addObject:v44];
    }
  }
  objc_sync_exit(v24);
}

void __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  aString = a2;
  BOOL v6 = +[CRInsights sharedInsights];
  [v6 attachContextCopyToCurrentThread:*(void *)(a1 + 32)];

  NSRect v62 = NSRectFromString(aString);
  double x = v62.origin.x;
  double y = v62.origin.y;
  CGFloat width = v62.size.width;
  double height = v62.size.height;
  double v11 = [*(id *)(a1 + 40) findCCObjectEmbossed:@"CRCameraReaderCreditCardExpirationDate" inImage:*(void *)(a1 + 48) forRect:aString];
  double v58 = width;
  CGFloat v12 = x;
  double v13 = (void *)[v11 mutableCopy];

  CGFloat v57 = y;
  double v14 = 1.0 - y - height;
  if (*(unsigned char *)(a1 + 80)) {
    double v15 = 85.685;
  }
  else {
    double v15 = 54.05;
  }
  if (*(unsigned char *)(a1 + 80)) {
    double v16 = 54.05;
  }
  else {
    double v16 = 85.685;
  }
  double v17 = v14 * v15;
  double v18 = height * v15;
  double v19 = 54.05 - v14 * v15 - height * v15;
  if (*(unsigned char *)(a1 + 81)) {
    CGFloat v20 = v19;
  }
  else {
    CGFloat v20 = v17;
  }
  double v21 = [v13 objectForKey:@"dateOffset"];
  [v21 floatValue];
  float v23 = v22;
  CGFloat v24 = x * v16;

  v63.origin.double x = v24;
  v63.origin.double y = v17;
  v63.size.CGFloat width = v58 * v16;
  v63.size.double height = v18;
  double v25 = NSStringFromRect(v63);
  [v13 setObject:v25 forKey:@"expDateCutRect"];

  v61.double x = v24 + v23 / 7.5;
  v61.double y = v20;
  double v26 = NSStringFromPoint(v61);
  [v13 setObject:v26 forKey:@"dateOrigin"];

  id v27 = *(id *)(a1 + 56);
  objc_sync_enter(v27);
  [*(id *)(a1 + 56) addObject:v13];
  double v28 = [v13 objectForKey:@"expDateAccepted"];

  if (v28)
  {
    double v29 = *(void **)(a1 + 64);
    v64.origin.double x = v12;
    v64.origin.double y = v57;
    v64.size.CGFloat width = v58;
    v64.size.double height = height;
    int v30 = NSStringFromRect(v64);
    [v29 addObject:v30];

    v65.origin.double x = v12;
    v65.origin.double y = v57;
    v65.size.CGFloat width = v58;
    v65.size.double height = height;
    CGRect v66 = CGRectOffset(v65, 0.0, height * 0.5);
    CGFloat v31 = v66.origin.x;
    double v32 = v66.origin.y;
    CGFloat v33 = v66.size.width;
    CGFloat v34 = v66.size.height;
    v66.origin.double x = v12;
    v66.origin.double y = v57;
    v66.size.CGFloat width = v58;
    v66.size.double height = height;
    CGRect v67 = CGRectOffset(v66, 0.0, height * -0.5);
    CGFloat v35 = v67.origin.x;
    double v36 = v67.origin.y;
    CGFloat v37 = v67.size.width;
    CGFloat v38 = v67.size.height;
    if (v32 < 1.0)
    {
      CGFloat v39 = *(void **)(a1 + 64);
      v68.origin.double x = v31;
      v68.origin.double y = v32;
      v68.size.CGFloat width = v33;
      v68.size.double height = v34;
      CGFloat v40 = NSStringFromRect(v68);
      [v39 addObject:v40];
    }
    if (v36 > 0.670120259)
    {
      unint64_t v41 = *(void **)(a1 + 64);
      v69.origin.double x = v35;
      v69.origin.double y = v36;
      v69.size.CGFloat width = v37;
      v69.size.double height = v38;
      double v42 = NSStringFromRect(v69);
      [v41 addObject:v42];
    }
    double v43 = *(void **)(a1 + 72);
    double v44 = [v13 objectForKey:@"expirationDate"];
    [v43 setObject:v44 forKey:@"expirationDate"];

    double v45 = [v13 objectForKey:@"expirationYear"];

    if (v45)
    {
      CGFloat v46 = *(void **)(a1 + 72);
      double v47 = [v13 objectForKey:@"expirationYear"];
      [v46 setObject:v47 forKey:@"expirationYear"];
    }
    double v48 = [v13 objectForKey:@"expirationMonth"];

    if (v48)
    {
      NSPoint v49 = *(void **)(a1 + 72);
      NSRect v50 = [v13 objectForKey:@"expirationMonth"];
      [v49 setObject:v50 forKey:@"expirationMonth"];
    }
    NSRect v51 = [v13 objectForKey:@"expirationDay"];

    if (v51)
    {
      NSRect v52 = *(void **)(a1 + 72);
      CGRect v53 = [v13 objectForKey:@"expirationDay"];
      [v52 setObject:v53 forKey:@"expirationDay"];
    }
    CGRect v54 = [v13 objectForKey:@"dateOrigin"];

    if (v54)
    {
      CGRect v55 = *(void **)(a1 + 72);
      NSRect v56 = [v13 objectForKey:@"dateOrigin"];
      [v55 setObject:v56 forKey:@"dateOrigin"];
    }
    if (!*(unsigned char *)(a1 + 82)) {
      *a4 = 1;
    }
  }
  objc_sync_exit(v27);
}

uint64_t __80__CRCameraReader_findCCObjectsEmbossed_inImage_numberRects_nameRects_dateRects___block_invoke_5()
{
  return [NSNumber numberWithBool:0];
}

- (id)findCCResultsInImageFlat:(id)a3 usingTextFeatures:(id)a4 invert:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v96 = a3;
  id v7 = a4;
  int v94 = v7;
  id v8 = +[CRInsights sharedInsights];
  objc_msgSend(v8, "setContextValue:forKey:", v7);

  double v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v10 = [v9 objectForKey:@"com.apple.CoreRecognition.disable_prefix_check"];
  char v11 = [v10 BOOLValue];

  id v97 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v90 = [MEMORY[0x263F089D8] string];
    CGFloat v12 = (void *)MEMORY[0x263EFF980];
    double v13 = [v7 subFeatures];
    double v99 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    double v14 = [v7 subFeatures];
    uint64_t v15 = 0;
    uint64_t v16 = [v14 countByEnumeratingWithState:&v112 objects:v117 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v113 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = [*(id *)(*((void *)&v112 + 1) + 8 * i) subFeatures];
          uint64_t v20 = [v19 count];

          v15 += v20;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v112 objects:v117 count:16];
      }
      while (v16);
    }

    double v21 = [v94 subFeatures];
    if (v5) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = 0;
    }
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke;
    v105[3] = &unk_26429E8C8;
    v105[4] = self;
    id v106 = v96;
    BOOL v110 = v5;
    id v93 = v90;
    id v107 = v93;
    char v111 = v11;
    id v95 = v99;
    id v108 = v95;
    uint64_t v109 = v15;
    [v21 enumerateObjectsWithOptions:v22 usingBlock:v105];

    clock_t v98 = extractCardCode(v93);
    if (v98)
    {
      [v94 bounds];
      if (isValidCodeLocation(v98, 0, v23, v24, v25, v26))
      {
        [v97 setObject:v98 forKey:@"code"];
        [v97 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
      }
    }
    id v27 = +[CRInsights sharedInsights];
    if (v27)
    {
      double v28 = +[CRInsights sharedInsights];
      double v29 = [v28 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_424];
    }
    else
    {
      double v29 = [NSNumber numberWithBool:0];
      double v28 = v29;
    }
    int v40 = [v29 BOOLValue];
    if (v27) {

    }
    if (v40)
    {
      unint64_t v41 = [MEMORY[0x263EFF9A0] dictionary];
      double v42 = v41;
      if (v98)
      {
        [v41 setObject:v98 forKey:@"code"];
        [v42 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
      }
      else
      {
        [v41 setObject:v93 forKey:@"code"];
      }
      double v43 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v42, 0);
      [v97 setObject:v43 forKey:@"cardnumberFragmented"];
    }
    [v97 setObject:v95 forKey:@"CardNumber"];
    double v44 = [NSDictionary dictionary];
    [v97 setObject:v44 forKey:@"Cardholder"];

    double v45 = [NSDictionary dictionary];
    [v97 setObject:v45 forKey:@"Expiration"];

    goto LABEL_65;
  }
  int v30 = +[CRInsights sharedInsights];
  [v30 setContextValue:v7 forKey:@"CRInsightsContextRecognitionTextFeature"];

  CGFloat v31 = [(CRCameraReader *)self flatPrintedModel];
  double v32 = [v31 creditcardResultsFromImage:v96 textFeatures:v7 invert:v5 tryPatternMatch:1];

  id v93 = v32;
  CGFloat v33 = +[CRInsights sharedInsights];
  [v33 provideInsightValue:v32 forKey:@"CRInsightsRecognitionResultsForRegion"];

  CGFloat v34 = +[CRInsights sharedInsights];
  [v34 setContextValue:0 forKey:@"CRInsightsContextRecognitionTextFeature"];

  id v95 = [v32 objectForKey:@"FastScanningCTCSegmentKey"];
  double v91 = [v32 objectForKey:@"FastScanningGeometricKey"];
  uint64_t v88 = [v32 objectForKey:@"FastScanningPatternSearchKey"];
  uint64_t v89 = [v91 objectForKey:@"CardNumber"];
  CGFloat v35 = [v89 objectAtIndex:0];
  uint64_t v36 = extractCardCode(v35);

  clock_t v98 = (void *)v36;
  if (!v36)
  {
    CGFloat v37 = [v95 objectForKey:@"CardNumber"];

    CGFloat v38 = [v37 objectAtIndex:0];
    uint64_t v39 = extractCardCode(v38);

    clock_t v98 = (void *)v39;
    if (v39)
    {
      uint64_t v89 = v37;
    }
    else
    {
      CGFloat v46 = [v88 objectForKey:@"CardNumber"];

      double v47 = [v46 objectAtIndex:0];
      uint64_t v48 = extractCardCode(v47);

      clock_t v98 = (void *)v48;
      if (!v48)
      {
        clock_t v98 = 0;
        uint64_t v89 = v46;
        goto LABEL_33;
      }
      uint64_t v89 = v46;
    }
  }
  [v7 bounds];
  if (isValidCodeLocation(v98, 0, v49, v50, v51, v52))
  {
    [v97 setObject:v98 forKey:@"code"];
    [v97 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
  }
LABEL_33:
  CGRect v53 = +[CRInsights sharedInsights];
  if (v53)
  {
    CGRect v54 = +[CRInsights sharedInsights];
    CGRect v55 = [v54 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_432];
  }
  else
  {
    CGRect v55 = [NSNumber numberWithBool:0];
    CGRect v54 = v55;
  }
  int v56 = [v55 BOOLValue];
  if (v53) {

  }
  if (v56)
  {
    double v100 = [MEMORY[0x263EFF980] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v57 = v32;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v101 objects:v116 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v102;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v102 != v59) {
            objc_enumerationMutation(v57);
          }
          NSPoint v61 = [v57 objectForKey:*(void *)(*((void *)&v101 + 1) + 8 * j)];
          NSRect v62 = [v61 objectForKey:@"CardNumber"];
          NSRect v63 = extractCardNumberResults(v62);

          NSRect v64 = [v63 objectForKey:@"code"];
          BOOL v65 = [v64 length] == 0;

          if (!v65) {
            [v100 addObject:v63];
          }
        }
        uint64_t v58 = [v57 countByEnumeratingWithState:&v101 objects:v116 count:16];
      }
      while (v58);
    }

    [v97 setObject:v100 forKey:@"CardNumber"];
  }
  CGRect v66 = [v91 objectForKey:@"Cardholder"];
  CGRect v67 = [(CRCameraReader *)self contactsCache];
  NSRect v68 = [(CRCameraReader *)self previousContactMatches];
  NSRect v69 = extractCardholderNameResults(v66, v67, v68);

  [v97 setObject:v69 forKey:@"Cardholder"];
  uint64_t v70 = +[CRInsights sharedInsights];
  if (v70)
  {
    double v71 = +[CRInsights sharedInsights];
    BOOL v72 = [v71 allowOverrideWithKey:@"referenceExpirationDate" forValue:0];
  }
  else
  {
    BOOL v72 = 0;
  }

  double v73 = computeReferenceDateFromString(v72);
  int v74 = [v91 objectForKey:@"Expiration"];
  double v75 = extractExpirationDateResults(v74, v73);

  double v76 = [v75 objectForKey:@"expDateAccepted"];
  LODWORD(v74) = v76 == 0;

  if (v74)
  {
    BOOL v77 = [v88 objectForKey:@"Expiration"];
    uint64_t v78 = extractExpirationDateResults(v77, v73);

    double v75 = (void *)v78;
  }
  double v79 = +[CRInsights sharedInsights];
  if (v79)
  {
    int v80 = +[CRInsights sharedInsights];
    double v81 = [v80 allowOverrideWithKey:@"kCROverrideShouldRunOffline" forResultFromBlock:&__block_literal_global_434];
  }
  else
  {
    double v81 = [NSNumber numberWithBool:0];
    int v80 = v81;
  }
  if ([v81 BOOLValue])
  {
    clock_t v82 = [v75 objectForKey:@"expDateAccepted"];
    BOOL v83 = v82 == 0;

    if (!v79) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
  BOOL v83 = 0;
  if (v79) {
LABEL_61:
  }

LABEL_62:
  if (v83)
  {
    float v84 = [v95 objectForKey:@"Expiration"];
    uint64_t v85 = extractExpirationDateResults(v84, v73);

    double v75 = (void *)v85;
  }
  [v97 setObject:v75 forKey:@"Expiration"];

LABEL_65:
  int v86 = +[CRInsights sharedInsights];
  [v86 setContextValue:0 forKey:@"CRInsightsContextRecognitionTextFeatureGroup"];

  return v97;
}

void __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v25 = a2;
  BOOL v6 = +[CRInsights sharedInsights];
  [v6 setContextValue:v25 forKey:@"CRInsightsContextRecognitionTextFeature"];

  id v7 = [*(id *)(a1 + 32) flatPrintedModel];
  id v8 = [v7 creditcardResultsFromImage:*(void *)(a1 + 40) textFeatures:v25 invert:*(unsigned __int8 *)(a1 + 72) tryPatternMatch:0];

  double v9 = +[CRInsights sharedInsights];
  [v9 provideInsightValue:v8 forKey:@"CRInsightsRecognitionResultsForRegion"];

  double v10 = +[CRInsights sharedInsights];
  [v10 setContextValue:0 forKey:@"CRInsightsContextRecognitionTextFeature"];

  char v11 = [v8 objectForKey:@"FastScanningGeometricKey"];
  CGFloat v12 = [v11 objectForKey:@"CardNumber"];
  double v13 = [v12 objectAtIndex:0];

  if (v13)
  {
    double v14 = *(void **)(a1 + 48);
    uint64_t v15 = [v12 objectAtIndex:0];
    [v14 appendString:v15];
  }
  uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
  if ((unint64_t)[v12 count] >= 2)
  {
    uint64_t v17 = [v12 objectAtIndex:1];
    [v16 setObject:v17 forKey:@"codeOffset"];

    if ((unint64_t)[v12 count] < 3)
    {
      float v19 = 300.0;
    }
    else
    {
      double v18 = [v12 objectAtIndex:2];
      float v19 = (float)[v18 integerValue];
    }
    uint64_t v20 = [v12 objectAtIndex:1];
    double v21 = [v20 objectAtIndex:0];
    float v22 = (float)[v21 integerValue] / v19;

    *(float *)&double v23 = v22;
    CGFloat v24 = [NSNumber numberWithFloat:v23];
    [v16 setObject:v24 forKey:@"normalizedCodeOffset"];
  }
  [*(id *)(a1 + 56) addObject:v16];
  if (!*(unsigned char *)(a1 + 73) && (checkPartialCodePrefix(*(void **)(a1 + 48), *(void *)(a1 + 64)) & 1) == 0) {
    *a4 = 1;
  }
}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_2()
{
  return [NSNumber numberWithBool:0];
}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_3()
{
  return [NSNumber numberWithBool:0];
}

uint64_t __68__CRCameraReader_findCCResultsInImageFlat_usingTextFeatures_invert___block_invoke_4()
{
  return [NSNumber numberWithBool:0];
}

- (id)findCCNumberInImageEmbossed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v6 = [v4 imageByApplyingHistogramCorrection];
  id v7 = +[CRInsights sharedInsights];
  [v7 provideInsightValue:v6 forKey:@"CRInsightsCardImageCutEmbossedBufferKey"];

  id v8 = [(CRCameraReader *)self embossedNumberModel];
  double v9 = [v8 creditcardResultsFromImage:v6];
  double v10 = [v9 objectForKey:@"arrayResult"];

  char v11 = 0;
  unint64_t v12 = 1;
  double v13 = (CGFloat *)MEMORY[0x263F001A0];
  while ([v10 count] > v12)
  {
    double v14 = [v10 objectAtIndex:v12];
    uint64_t v15 = extractCardCode(v14);

    if (v15 && isValidCodeLocation(v15, 1, *v13, v13[1], v13[2], v13[3]))
    {
      [v5 setObject:v15 forKey:@"code"];
      [v5 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
      char v11 = v15;
      break;
    }
    ++v12;
    char v11 = v15;
  }

  return v5;
}

- (id)findCCNumberInImageEmbossed:(id)a3 withFinalDigit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v9 = [v7 height];
  double v42 = objc_msgSend(v7, "imageByScalingToWidth:height:", (unint64_t)(28.0 / (double)v9 * (double)(unint64_t)objc_msgSend(v7, "width")), (unint64_t)(28.0 / (double)v9 * (double)(unint64_t)objc_msgSend(v7, "height")));
  double v10 = [v42 imageByApplyingHistogramCorrection];
  char v11 = [(CRCameraReader *)self embossedExpirationModel];
  unint64_t v12 = [v11 creditcardResultsFromImage:v10];
  uint64_t v13 = [v12 objectForKey:@"FastScanningCTCSegmentKey"];

  double v43 = (void *)v13;
  double v14 = [(CRCameraReader *)self extractFinalDigitStringFromNumbers:v13];
  if ([v14 length] != 1)
  {
    uint64_t v15 = [v10 imageByAdjustingBrightnessAlpha:1.3 beta:128.0];
    uint64_t v16 = [v15 imageByApplyingHistogramCorrection];

    uint64_t v17 = [(CRCameraReader *)self embossedExpirationModel];
    double v18 = [v17 creditcardResultsFromImage:v16];
    uint64_t v19 = [v18 objectForKey:@"FastScanningCTCSegmentKey"];

    uint64_t v20 = [(CRCameraReader *)self extractFinalDigitStringFromNumbers:v19];

    double v10 = (void *)v16;
    double v43 = (void *)v19;
    double v14 = (void *)v20;
  }
  if ([v14 length] == 1)
  {
    id v39 = v6;
    int v40 = v8;
    unint64_t v41 = [v6 imageByApplyingHistogramCorrection];
    double v21 = [(CRCameraReader *)self embossedNumberModel];
    float v22 = [v21 creditcardResultsFromImage:v41];
    double v23 = [v22 objectForKey:@"arrayResult"];

    CGFloat v24 = enrichedNumbersListHK(v23);

    unint64_t v25 = 1;
    while ([v24 count] > v25)
    {
      CGFloat v26 = [v24 objectAtIndex:v25];
      id v27 = [v26 stringByAppendingString:v14];
      double v28 = extractCardCodeHK(v27);

      ++v25;
      if (v28)
      {
        [v40 setObject:v28 forKey:@"code"];
        [v40 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
        goto LABEL_14;
      }
    }
    double v29 = [v41 imageByAdjustingBrightnessAlpha:2.0 beta:100.0];
    int v30 = [v29 imageByApplyingHistogramCorrection];

    CGFloat v31 = [(CRCameraReader *)self embossedNumberModel];
    double v32 = [v31 creditcardResultsFromImage:v30];
    CGFloat v33 = [v32 objectForKey:@"arrayResult"];

    CGFloat v24 = enrichedNumbersListHK(v33);

    unint64_t v34 = 1;
    while ([v24 count] > v34)
    {
      CGFloat v35 = [v24 objectAtIndex:v34];
      uint64_t v36 = [v35 stringByAppendingString:v14];
      CGFloat v37 = extractCardCodeHK(v36);

      ++v34;
      if (v37)
      {
        [v40 setObject:v37 forKey:@"code"];
        [v40 setObject:MEMORY[0x263EFFA88] forKey:@"accepted"];
        goto LABEL_13;
      }
    }
    CGFloat v37 = 0;
LABEL_13:

    double v28 = 0;
LABEL_14:

    id v6 = v39;
    id v8 = v40;
  }

  return v8;
}

- (id)findCCNameInImageEmbossed:(id)a3
{
  id v4 = [a3 imageByApplyingHistogramCorrection];
  BOOL v5 = [(CRCameraReader *)self embossedCardholderModel];
  id v6 = [v5 creditcardResultsFromImage:v4];
  id v7 = [v6 objectForKey:@"arrayResult"];

  id v8 = [(CRCameraReader *)self contactsCache];
  unint64_t v9 = [(CRCameraReader *)self previousContactMatches];
  double v10 = extractCardholderNameResults(v7, v8, v9);

  return v10;
}

- (id)findCCExpDateInImageEmbossed:(id)a3
{
  id v4 = [a3 imageByApplyingHistogramCorrection];
  BOOL v5 = [(CRCameraReader *)self embossedExpirationModel];
  id v6 = [v5 creditcardResultsFromImage:v4];

  id v7 = [v6 objectForKey:@"FastScanningCTCSegmentKey"];
  id v8 = +[CRInsights sharedInsights];
  if (v8)
  {
    unint64_t v9 = +[CRInsights sharedInsights];
    double v10 = [v9 allowOverrideWithKey:@"referenceExpirationDate" forValue:0];
  }
  else
  {
    double v10 = 0;
  }

  char v11 = computeReferenceDateFromString(v10);
  unint64_t v12 = extractExpirationDateResults(v7, v11);
  uint64_t v13 = [v12 objectForKey:@"expDateAccepted"];

  if (v13)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = [v6 objectForKey:@"FastScanningPatternSearchKey"];
    uint64_t v16 = extractExpirationDateResults(v15, v11);
    uint64_t v17 = [v16 objectForKey:@"expDateAccepted"];

    if (v17) {
      double v18 = v16;
    }
    else {
      double v18 = v12;
    }
    id v14 = v18;
  }
  return v14;
}

- (void)removeLayerTree
{
  id v4 = [(CRCameraReader *)self diagnosticHUDLayer];
  [v4 removeFromSuperlayer];

  id v5 = [(CRCameraReader *)self alignmentLayer];
  [v5 removeFromSuperlayer];

  id v6 = [(CRCameraReader *)self boxLayer];
  [v6 removeFromSuperlayer];

  id v7 = [(CRCameraReader *)self sessionManager];
  id v3 = [v7 previewLayer];
  [v3 removeFromSuperlayer];
}

- (void)primeBoxLayerHideTimerWithFrameTime:(id *)a3
{
  id v5 = [(CRCameraReader *)self boxLayerHideTimer];
  CMTime v8 = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&v8);
  [(CRCameraReader *)self configDemoSpeed];
  CMTimeMakeWithSeconds(&v9, Seconds + 0.5 / v7, a3->var1);
  [v5 setFireTime:&v9];
}

- (void)pauseBoxLayerHideTimer
{
  int v2 = [(CRCameraReader *)self boxLayerHideTimer];
  long long v3 = *MEMORY[0x263F010B8];
  uint64_t v4 = *(void *)(MEMORY[0x263F010B8] + 16);
  [v2 setFireTime:&v3];
}

- (void)hideBoxLayer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CRCameraReader_hideBoxLayer__block_invoke;
  block[3] = &unk_26429E598;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __30__CRCameraReader_hideBoxLayer__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) boxLayer];
  [v1 setHidden:1];
}

- (CGRect)boxLayerPresentationFrame
{
  long long v3 = [(CRCameraReader *)self view];
  uint64_t v4 = [v3 layer];
  [v4 bounds];
  double Width = CGRectGetWidth(v28);
  id v6 = [(CRCameraReader *)self view];
  double v7 = [v6 layer];
  [v7 bounds];
  if (Width <= CGRectGetHeight(v29))
  {
    CMTime v8 = [(CRCameraReader *)self view];
    CMTime v9 = [v8 layer];
    [v9 bounds];
    double v10 = CGRectGetWidth(v31);
    double v11 = 0.8;
  }
  else
  {
    CMTime v8 = [(CRCameraReader *)self view];
    CMTime v9 = [v8 layer];
    [v9 bounds];
    double v10 = CGRectGetWidth(v30);
    double v11 = 0.65;
  }
  double v12 = v10 * v11;

  uint64_t v13 = [(CRCameraReader *)self boxLayer];
  [v13 bounds];
  double Height = CGRectGetHeight(v32);
  uint64_t v15 = [(CRCameraReader *)self boxLayer];
  [v15 bounds];
  double v16 = CGRectGetWidth(v33);

  uint64_t v17 = [(CRCameraReader *)self view];
  double v18 = [v17 layer];
  [v18 bounds];
  double MidX = CGRectGetMidX(v34);
  uint64_t v20 = [(CRCameraReader *)self view];
  double v21 = [v20 layer];
  [v21 bounds];
  double v22 = v12 * Height / v16;
  CGFloat v23 = CGRectGetMidY(v35) - v22 * 0.5;

  double v24 = MidX - v12 * 0.5;
  double v25 = v23;
  double v26 = v12;
  double v27 = v22;
  result.size.double height = v27;
  result.size.CGFloat width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)animatePresentCodeAtFrameTime:(id *)a3
{
  v76[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(CRCameraReader *)self boxLayer];
  id v5 = [v4 animationKeys];
  char v6 = [v5 containsObject:@"CRBoxLayerAnimationReveal"];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CRCameraReader *)self boxLayer];
    [v7 removeAllAnimations];
  }
  NSRect v62 = [MEMORY[0x263F15750] animation];
  NSRect v63 = [MEMORY[0x263F15750] animation];
  CMTime v8 = [(CRCameraReader *)self boxLayer];
  [v8 position];
  double MidX = v9;
  double MidY = v11;

  memset(&v75, 0, sizeof(v75));
  uint64_t v13 = [(CRCameraReader *)self boxLayer];
  id v14 = v13;
  if (v13) {
    [v13 transform];
  }
  else {
    memset(&v75, 0, sizeof(v75));
  }

  if ([(CRCameraReader *)self configPresentCentered])
  {
    [(CRCameraReader *)self boxLayerPresentationFrame];
    CGFloat x = v77.origin.x;
    CGFloat y = v77.origin.y;
    CGFloat width = v77.size.width;
    CGFloat height = v77.size.height;
    double MidX = CGRectGetMidX(v77);
    v78.origin.CGFloat x = x;
    v78.origin.CGFloat y = y;
    v78.size.CGFloat width = width;
    v78.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v78);
    v79.origin.CGFloat x = x;
    v79.origin.CGFloat y = y;
    v79.size.CGFloat width = width;
    v79.size.CGFloat height = height;
    double v19 = CGRectGetWidth(v79);
    uint64_t v20 = [(CRCameraReader *)self boxLayer];
    [v20 bounds];
    double v21 = CGRectGetWidth(v80);

    CATransform3DMakeScale(&v74, v19 / v21, v19 / v21, 1.0);
    CATransform3D v75 = v74;
    if ([(CRCameraReader *)self codeInverted])
    {
      CATransform3D v73 = v75;
      CATransform3DRotate(&v74, &v73, 3.14159265, 0.0, 0.0, 1.0);
      CATransform3D v75 = v74;
    }
    double v22 = [(CRCameraReader *)self sessionManager];
    int v23 = [v22 isPreviewVideoMirrored];

    if (v23)
    {
      CATransform3D v72 = v75;
      CATransform3DRotate(&v74, &v72, 3.14159265, 0.0, 1.0, 0.0);
      CATransform3D v75 = v74;
    }
    double v24 = [MEMORY[0x263F157D8] animationWithKeyPath:@"position"];
    double v25 = [(CRCameraReader *)self boxLayer];
    [v25 position];
    double v27 = v26;
    CGRect v28 = [(CRCameraReader *)self boxLayer];
    [v28 position];
    double v30 = v29;

    CGRect v31 = (void *)MEMORY[0x263EFF8C0];
    CGRect v32 = (void *)MEMORY[0x263F08D40];
    CGRect v33 = [(CRCameraReader *)self boxLayer];
    [v33 position];
    CGRect v34 = objc_msgSend(v32, "valueWithCGPoint:");
    CGRect v35 = objc_msgSend(NSNumber, "valueWithCGPoint:", (MidX + v27) * 0.5, (MidY + v30) * 0.5);
    uint64_t v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", MidX, MidY);
    CGFloat v37 = objc_msgSend(v31, "arrayWithObjects:", v34, v35, v36, 0);
    [v24 setValues:v37];

    [v24 setKeyTimes:&unk_26C7C56E8];
    [v24 setCalculationMode:@"cubic"];
    CGFloat v38 = [MEMORY[0x263F157D8] animationWithKeyPath:@"zPosition"];
    v76[0] = &unk_26C7C57F0;
    v81.origin.CGFloat x = x;
    v81.origin.CGFloat y = y;
    v81.size.CGFloat width = width;
    v81.size.CGFloat height = height;
    id v39 = [NSNumber numberWithDouble:CGRectGetWidth(v81)];
    v76[1] = v39;
    v76[2] = &unk_26C7C57F0;
    int v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:3];
    [v38 setValues:v40];

    [v38 setKeyTimes:&unk_26C7C5700];
    [v38 setCalculationMode:@"cubic"];
    unint64_t v41 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    double v42 = (void *)MEMORY[0x263F08D40];
    double v43 = [(CRCameraReader *)self boxLayer];
    double v44 = v43;
    if (v43) {
      [v43 transform];
    }
    else {
      memset(v71, 0, sizeof(v71));
    }
    CGFloat v49 = [v42 valueWithCATransform3D:v71];
    [v41 setFromValue:v49];

    CATransform3D v70 = v75;
    CGFloat v50 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v70];
    [v41 setToValue:v50];

    CGFloat v51 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    CGFloat v52 = [NSNumber numberWithDouble:1.0];
    [v51 setFromValue:v52];

    CGRect v53 = [NSNumber numberWithDouble:0.4];
    [v51 setToValue:v53];

    [(CRCameraReader *)self configDemoSpeed];
    [v62 setDuration:0.5 / v54];
    CGRect v55 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v24, v38, v41, 0);
    [v62 setAnimations:v55];

    [(CRCameraReader *)self configDemoSpeed];
    [v63 setDuration:0.5 / v56];
    id v57 = [MEMORY[0x263EFF8C0] arrayWithObject:v51];
    [v63 setAnimations:v57];
  }
  else
  {
    double v24 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    double v45 = [NSNumber numberWithDouble:1.0];
    [v24 setFromValue:v45];

    CGFloat v46 = [NSNumber numberWithDouble:0.4];
    [v24 setToValue:v46];

    [(CRCameraReader *)self configDemoSpeed];
    [v62 setDuration:0.25 / v47];
    [(CRCameraReader *)self configDemoSpeed];
    [v63 setDuration:0.25 / v48];
    CGFloat v38 = [MEMORY[0x263EFF8C0] arrayWithObject:v24];
    [v63 setAnimations:v38];
  }

  objc_initWeak((id *)&v74, self);
  uint64_t v58 = [(CRCameraReader *)self boxLayer];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __48__CRCameraReader_animatePresentCodeAtFrameTime___block_invoke;
  v64[3] = &unk_26429E8F0;
  objc_copyWeak(v67, (id *)&v74);
  id v59 = v62;
  id v65 = v59;
  v67[1] = (id)a2;
  id v60 = v63;
  id v66 = v60;
  v67[2] = *(id *)&MidX;
  v67[3] = *(id *)&MidY;
  CATransform3D v68 = v75;
  uint64_t v69 = 0x3FD999999999999ALL;
  [v58 addCompletionBlock:v64];

  objc_destroyWeak(v67);
  objc_destroyWeak((id *)&v74);
}

void __48__CRCameraReader_animatePresentCodeAtFrameTime___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  int v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained boxLayer];
  [v4 removeAllAnimations];

  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  char v6 = [v5 sessionManager];
  double v7 = [v6 previewLayer];
  [v7 removeAllAnimations];

  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  double v9 = [v8 boxLayer];
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
  [v9 addAnimation:v10 forKey:v11];

  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = [v12 sessionManager];
  id v14 = [v13 previewLayer];
  uint64_t v15 = *(void *)(a1 + 40);
  double v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
  [v14 addAnimation:v15 forKey:v16];

  double v17 = *(double *)(a1 + 64);
  double v18 = *(double *)(a1 + 72);
  id v19 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v20 = [v19 boxLayer];
  objc_msgSend(v20, "setPosition:", v17, v18);

  long long v21 = *(_OWORD *)(a1 + 160);
  long long v39 = *(_OWORD *)(a1 + 144);
  long long v40 = v21;
  long long v22 = *(_OWORD *)(a1 + 192);
  long long v41 = *(_OWORD *)(a1 + 176);
  long long v42 = v22;
  long long v23 = *(_OWORD *)(a1 + 96);
  long long v35 = *(_OWORD *)(a1 + 80);
  long long v36 = v23;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v37 = *(_OWORD *)(a1 + 112);
  long long v38 = v24;
  id v25 = objc_loadWeakRetained((id *)(a1 + 48));
  double v26 = [v25 boxLayer];
  v34[4] = v39;
  v34[5] = v40;
  v34[6] = v41;
  v34[7] = v42;
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  v34[3] = v38;
  [v26 setTransform:v34];

  double v27 = *(double *)(a1 + 208);
  id v28 = objc_loadWeakRetained((id *)(a1 + 48));
  double v29 = [v28 sessionManager];
  double v30 = [v29 previewLayer];
  *(float *)&double v31 = v27;
  [v30 setOpacity:v31];

  [MEMORY[0x263F158F8] commit];
  CGRect v32 = [MEMORY[0x263EFF910] date];
  id v33 = objc_loadWeakRetained(v2);
  [v33 setCodePresented:v32];
}

- (void)showMessage:(id)a3 color:(id)a4 style:(int64_t)a5 duration:(double)a6
{
  id v10 = a3;
  id v78 = a4;
  double v11 = 0;
  id v12 = v10;
  id v13 = 0;
  switch(a5)
  {
    case 0:
      id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
      uint64_t v14 = [v12 localizedStringForKey:@"Note" value:&stru_26C7BF850 table:0];
      goto LABEL_5;
    case 1:
      goto LABEL_6;
    case 2:
      uint64_t v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
      double v11 = [v15 localizedStringForKey:@"Success" value:&stru_26C7BF850 table:0];

      id v13 = 0;
      id v12 = v10;
      goto LABEL_6;
    case 3:
      id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
      uint64_t v14 = [v12 localizedStringForKey:@"Error" value:&stru_26C7BF850 table:0];
LABEL_5:
      double v11 = (void *)v14;
      id v13 = v10;
LABEL_6:

      id v10 = v13;
      break;
    default:
      break;
  }
  double v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreRecognition"];
  double v17 = [v16 localizedStringForKey:@"OK" value:&stru_26C7BF850 table:0];

  double v18 = [(CRCameraReader *)self activityIndicator];

  if (!v18)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:0];
    [(CRCameraReader *)self setActivityIndicator:v19];

    uint64_t v20 = [(CRCameraReader *)self activityIndicator];
    [v20 setHidesWhenStopped:1];

    long long v21 = [(CRCameraReader *)self view];
    long long v22 = [(CRCameraReader *)self activityIndicator];
    [v21 addSubview:v22];

    if ([(CRCameraReader *)self configPresentCentered])
    {
      [(CRCameraReader *)self boxLayerPresentationFrame];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      double v31 = [(CRCameraReader *)self activityIndicator];
      v87.origin.CGFloat x = v24;
      v87.origin.CGFloat y = v26;
      v87.size.CGFloat width = v28;
      v87.size.CGFloat height = v30;
      double MidX = CGRectGetMidX(v87);
      id v33 = [(CRCameraReader *)self activityIndicator];
      [v33 bounds];
      double Width = CGRectGetWidth(v88);
      v89.origin.CGFloat x = v24;
      v89.origin.CGFloat y = v26;
      v89.size.CGFloat width = v28;
      v89.size.CGFloat height = v30;
      double MaxY = CGRectGetMaxY(v89);
      long long v36 = [(CRCameraReader *)self activityIndicator];
      [v36 bounds];
      double Height = CGRectGetHeight(v90);
      long long v38 = [(CRCameraReader *)self activityIndicator];
      [v38 bounds];
      double v39 = CGRectGetWidth(v91);
      long long v40 = [(CRCameraReader *)self activityIndicator];
      [v40 bounds];
      objc_msgSend(v31, "setFrame:", MidX + Width * -0.5, MaxY + Height * 0.5, v39, CGRectGetHeight(v92));

      long long v41 = [(CRCameraReader *)self activityIndicator];
      [v41 setAutoresizingMask:45];
LABEL_17:

      goto LABEL_18;
    }
    CGRect v77 = [(CRCameraReader *)self activityIndicator];
    double v76 = [(CRCameraReader *)self view];
    [v76 bounds];
    double v42 = CGRectGetMidX(v93);
    double v43 = [(CRCameraReader *)self activityIndicator];
    [v43 bounds];
    double v44 = CGRectGetWidth(v94);
    double v45 = [(CRCameraReader *)self view];
    [v45 bounds];
    double v46 = CGRectGetMaxY(v95);
    double v47 = [(CRCameraReader *)self activityIndicator];
    [v47 bounds];
    double v48 = CGRectGetHeight(v96);
    CGFloat v49 = [(CRCameraReader *)self activityIndicator];
    [v49 bounds];
    double v50 = CGRectGetWidth(v97);
    CGFloat v51 = [(CRCameraReader *)self activityIndicator];
    [v51 bounds];
    objc_msgSend(v77, "setFrame:", v42 + v44 * -0.5, v46 + v48 * -1.5 + -44.0, v50, CGRectGetHeight(v98));

    CGFloat v52 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v52 userInterfaceIdiom] == 1)
    {
      CGRect v53 = [(CRCameraReader *)self view];
      [v53 bounds];
      v105.size.CGFloat width = 1024.0;
      v105.size.CGFloat height = 748.0;
      v105.origin.CGFloat x = 0.0;
      v105.origin.CGFloat y = 0.0;
      if (CGRectEqualToRect(v99, v105))
      {
      }
      else
      {
        double v54 = [(CRCameraReader *)self view];
        [v54 bounds];
        v106.size.CGFloat width = 768.0;
        v106.size.CGFloat height = 1004.0;
        v106.origin.CGFloat x = 0.0;
        v106.origin.CGFloat y = 0.0;
        BOOL v55 = CGRectEqualToRect(v100, v106);

        if (!v55)
        {
LABEL_16:
          long long v41 = [(CRCameraReader *)self activityIndicator];
          [v41 setAutoresizingMask:13];
          goto LABEL_17;
        }
      }
      CGFloat v52 = [(CRCameraReader *)self activityIndicator];
      double v56 = [(CRCameraReader *)self activityIndicator];
      [v56 frame];
      double MinX = CGRectGetMinX(v101);
      uint64_t v58 = [(CRCameraReader *)self activityIndicator];
      [v58 frame];
      double MinY = CGRectGetMinY(v102);
      id v60 = [(CRCameraReader *)self activityIndicator];
      [v60 frame];
      double v61 = CGRectGetWidth(v103);
      NSRect v62 = [(CRCameraReader *)self activityIndicator];
      [v62 frame];
      objc_msgSend(v52, "setFrame:", MinX, MinY + -44.0, v61, CGRectGetHeight(v104));
    }
    goto LABEL_16;
  }
LABEL_18:
  NSRect v63 = [(CRCameraReader *)self activityIndicator];
  if (a5 == 1) {
    [v63 startAnimating];
  }
  else {
    [v63 stopAnimating];
  }

  objc_initWeak(location, self);
  BOOL v64 = [(CRCameraReader *)self configPresentCentered];
  [(CRCameraReader *)self configDemoSpeed];
  double v66 = v65;
  CGRect v67 = [(CRCameraReader *)self codePresented];
  [v67 timeIntervalSinceNow];
  double v69 = 0.25;
  if (v64) {
    double v69 = 0.5;
  }
  double v70 = v69 / v66 + v68;

  dispatch_time_t v71 = dispatch_time(0, (uint64_t)(fmax(v70, 0.0) * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke;
  block[3] = &unk_26429E990;
  id v80 = v78;
  CGRect v81 = self;
  id v82 = v10;
  v85[1] = *(id *)&a6;
  id v72 = v10;
  id v73 = v78;
  objc_copyWeak(v85, location);
  v85[2] = (id)a5;
  id v83 = v11;
  id v84 = v17;
  id v74 = v17;
  id v75 = v11;
  dispatch_after(v71, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v85);
  objc_destroyWeak(location);
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263EFF910] date];
  if (*(void *)(a1 + 32))
  {
    long long v3 = [*(id *)(a1 + 40) boxLayer];
    [v3 animatePulseColor:*(void *)(a1 + 32)];

    int64_t v4 = 200000000;
  }
  else
  {
    int64_t v4 = 0;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_2;
  void v9[3] = &unk_26429E990;
  char v6 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v7 = v6;
  v14[1] = *(id *)(a1 + 80);
  id v10 = v7;
  id v11 = v2;
  id v8 = v2;
  objc_copyWeak(v14, (id *)(a1 + 72));
  v14[2] = *(id *)(a1 + 88);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  dispatch_after(v5, MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(v14);
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_2(id *a1)
{
  int v2 = [a1[4] boxLayer];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_3;
  v3[3] = &unk_26429E968;
  id v4 = a1[5];
  v8[1] = a1[10];
  id v5 = a1[6];
  objc_copyWeak(v8, a1 + 9);
  v8[2] = a1[11];
  id v6 = a1[7];
  id v7 = a1[8];
  [v2 addCompletionBlock:v3];

  objc_destroyWeak(v8);
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:*(void *)(a1 + 48) message:v4 preferredStyle:1];
    id v6 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_5;
    long long v21 = &unk_26429E940;
    id v8 = (id *)(a1 + 64);
    objc_copyWeak(v22, (id *)(a1 + 64));
    v22[1] = *(id *)(a1 + 80);
    double v9 = [v6 actionWithTitle:v7 style:0 handler:&v18];
    objc_msgSend(v5, "addAction:", v9, v18, v19, v20, v21);
    id WeakRetained = objc_loadWeakRetained(v8);
    [WeakRetained presentViewController:v5 animated:1 completion:0];

    objc_destroyWeak(v22);
  }
  else
  {
    double v11 = *(double *)(a1 + 72);
    [*(id *)(a1 + 40) timeIntervalSinceNow];
    double v13 = v11 + v12;
    double v14 = v13 * 1000000000.0;
    BOOL v15 = v13 <= 0.0;
    double v16 = 0.0;
    if (!v15) {
      double v16 = v14;
    }
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)v16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__CRCameraReader_showMessage_color_style_duration___block_invoke_4;
    block[3] = &unk_26429E918;
    objc_copyWeak(v24, (id *)(a1 + 64));
    v24[1] = *(id *)(a1 + 80);
    dispatch_after(v17, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v24);
  }
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendDidDisplayMessageStyle:*(void *)(a1 + 40)];
}

void __51__CRCameraReader_showMessage_color_style_duration___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendDidDisplayMessageStyle:*(void *)(a1 + 40)];
}

- (void)sendDidCancel
{
  id v3 = [(CRCameraReader *)self delegateQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__CRCameraReader_sendDidCancel__block_invoke;
  v4[3] = &unk_26429E598;
  v4[4] = self;
  cr_dispatch_async((uint64_t)v3, (uint64_t)v4);
}

void __31__CRCameraReader_sendDidCancel__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) didSendEndOrCancel] & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidSendEndOrCancel:1];
    id v2 = [*(id *)(a1 + 32) callbackDelegate];
    [v2 cameraReaderDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)sendDidEndWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCameraReader *)self delegateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__CRCameraReader_sendDidEndWithInfo___block_invoke;
  v7[3] = &unk_26429E680;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);
}

uint64_t __37__CRCameraReader_sendDidEndWithInfo___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didSendEndOrCancel];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidSendEndOrCancel:1];
    id v3 = [*(id *)(a1 + 32) callbackDelegate];
    [v3 cameraReader:*(void *)(a1 + 32) didRecognizeObjects:*(void *)(a1 + 40)];

    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setPinnedFoundInfo:v4];

    [*(id *)(a1 + 32) setFoundCode:0];
    id v5 = *(void **)(a1 + 32);
    return [v5 setPreviousCode:0];
  }
  return result;
}

- (void)sendDidRecognizeNewObjects:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCameraReader *)self delegateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__CRCameraReader_sendDidRecognizeNewObjects___block_invoke;
  v7[3] = &unk_26429E680;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);
}

void __45__CRCameraReader_sendDidRecognizeNewObjects___block_invoke(uint64_t a1)
{
  id v34 = [*(id *)(a1 + 32) callbackDelegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v35 = [MEMORY[0x263EFF980] array];
    id v3 = [*(id *)(a1 + 40) objectForKey:@"code"];
    id v4 = [*(id *)(a1 + 40) objectForKey:@"cardholderName"];
    id v5 = [*(id *)(a1 + 40) objectForKey:@"expirationDate"];
    if (v3)
    {
      id v6 = objc_alloc_init(CRCameraReaderOutput);
      uint64_t v7 = [(CRCameraReaderOutput *)v6 objectInternal];
      [v7 setType:@"CROutputTypeCreditCardNumber"];

      id v8 = [(CRCameraReaderOutput *)v6 objectInternal];
      [v8 setStringValue:v3];

      [v35 addObject:v6];
    }
    if (v4)
    {
      double v9 = objc_alloc_init(CRCameraReaderOutput);
      id v10 = [(CRCameraReaderOutput *)v9 objectInternal];
      [v10 setType:@"CROutputTypeCreditCardName"];

      double v11 = [(CRCameraReaderOutput *)v9 objectInternal];
      [v11 setStringValue:v4];

      [v35 addObject:v9];
    }
    if (v5)
    {
      double v12 = objc_alloc_init(CRCameraReaderOutputExpirationDate);
      double v13 = [(CRCameraReaderOutput *)v12 objectInternal];
      [v13 setType:@"CRCameraReaderCreditCardExpirationDate"];

      double v14 = [(CRCameraReaderOutput *)v12 objectInternal];
      [v14 setStringValue:v5];

      BOOL v15 = [*(id *)(a1 + 40) objectForKey:@"expirationYear"];

      if (v15)
      {
        double v16 = NSNumber;
        dispatch_time_t v17 = [*(id *)(a1 + 32) pinnedFoundInfo];
        uint64_t v18 = [v17 objectForKey:@"expirationYear"];
        uint64_t v19 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
        uint64_t v20 = [(CRCameraReaderOutput *)v12 objectInternal];
        [v20 setYearValue:v19];
      }
      long long v21 = [*(id *)(a1 + 40) objectForKey:@"expirationMonth"];

      if (v21)
      {
        long long v22 = NSNumber;
        double v23 = [*(id *)(a1 + 32) pinnedFoundInfo];
        CGFloat v24 = [v23 objectForKey:@"expirationMonth"];
        double v25 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v24, "integerValue"));
        CGFloat v26 = [(CRCameraReaderOutput *)v12 objectInternal];
        [v26 setMonthValue:v25];
      }
      double v27 = [*(id *)(a1 + 40) objectForKey:@"expirationDay"];

      if (v27)
      {
        CGFloat v28 = NSNumber;
        double v29 = [*(id *)(a1 + 32) pinnedFoundInfo];
        CGFloat v30 = [v29 objectForKey:@"expirationDay"];
        double v31 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v30, "integerValue"));
        CGRect v32 = [(CRCameraReaderOutput *)v12 objectInternal];
        [v32 setDayValue:v31];
      }
      [v35 addObject:v12];
    }
    id v33 = [*(id *)(a1 + 32) callbackDelegate];
    [v33 cameraReader:*(void *)(a1 + 32) didRecognizedNewObjects:v35];
  }
}

- (void)sendDidEndAnimation
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  id v4 = [(CRCameraReader *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CRCameraReader_sendDidEndAnimation__block_invoke;
  block[3] = &unk_26429E598;
  void block[4] = self;
  dispatch_after(v3, v4, block);
}

void __37__CRCameraReader_sendDidEndAnimation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callbackDelegate];
  [v2 cameraReaderDidEnd:*(void *)(a1 + 32)];
}

- (void)sendDidEndWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCameraReader *)self delegateQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CRCameraReader_sendDidEndWithError___block_invoke;
  v7[3] = &unk_26429E680;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  cr_dispatch_async((uint64_t)v5, (uint64_t)v7);
}

uint64_t __38__CRCameraReader_sendDidEndWithError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didSendEndOrCancel];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidSendEndOrCancel:1];
    dispatch_time_t v3 = [*(id *)(a1 + 32) callbackDelegate];
    [v3 cameraReader:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];

    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(a1 + 32) setPinnedFoundInfo:v4];

    [*(id *)(a1 + 32) setFoundCode:0];
    id v5 = *(void **)(a1 + 32);
    return [v5 setPreviousCode:0];
  }
  return result;
}

- (id)attributedStringWithFrame:(CGSize)a3 withFont:(id)a4 withString:(id)a5 color:(CGColor *)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v35[3] = *MEMORY[0x263EF8340];
  name = (__CFString *)a4;
  id v31 = a5;
  id v33 = objc_opt_new();
  [v33 setAlignment:1];
  v38.origin.CGFloat x = 0.0;
  v38.origin.CGFloat y = 0.0;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v9 = CGPathCreateWithRect(v38, 0);
  CFAttributedStringRef v10 = 0;
  uint64_t v29 = *MEMORY[0x263F039A0];
  uint64_t v11 = *MEMORY[0x263F1C240];
  int v12 = 512;
  uint64_t v13 = *MEMORY[0x263F1C268];
  unsigned int v14 = 256;
  do
  {
    CTFontRef v15 = CTFontCreateWithName(name, (double)v12, 0);
    id v16 = objc_alloc(MEMORY[0x263F086A0]);
    v34[0] = v29;
    v34[1] = v11;
    v35[0] = v15;
    v35[1] = a6;
    v34[2] = v13;
    v35[2] = v33;
    dispatch_time_t v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    CFAttributedStringRef v18 = (const __CFAttributedString *)[v16 initWithString:v31 attributes:v17];

    uint64_t v19 = CTFramesetterCreateWithAttributedString(v18);
    v37.location = 0;
    v37.unint64_t length = 0;
    Frame = CTFramesetterCreateFrame(v19, v37, v9, 0);
    unint64_t length = CTFrameGetVisibleStringRange(Frame).length;
    unint64_t v22 = [(__CFAttributedString *)v18 length];
    int v23 = v14 >> 1;
    if (v14 >> 1 <= 1) {
      int v23 = 1;
    }
    BOOL v24 = v22 > length;
    BOOL v25 = v22 > length;
    if (v25) {
      int v26 = -v14;
    }
    else {
      int v26 = v14;
    }
    v12 += v26;
    if (v24)
    {
      unsigned int v14 = v23;
    }
    else
    {
      BOOL v27 = v14 >= 4;
      if (v14 < 4)
      {
        unsigned int v14 = v23;
      }
      else
      {
        BOOL v25 = 1;
        unsigned int v14 = 1;
      }
      if (v27) {
        v12 += 2 * v23;
      }
    }
    CFRelease(Frame);
    CFRelease(v19);
    CFRelease(v15);
    CFAttributedStringRef v10 = v18;
  }
  while (v25);
  CGPathRelease(v9);

  return v18;
}

- (id)createTextLayerForRecognizedObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 overlayString];

  if (v5)
  {
    [v4 boundingBox];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    unsigned int v14 = [(CRCameraReader *)self sessionManager];
    CTFontRef v15 = [(CRCameraReader *)self sessionManager];
    id v16 = [v15 previewLayer];
    double v17 = 1.0 - v7;
    objc_msgSend(v14, "convertCameraPointOCR:toLayer:flipped:", v16, 0, v9, 1.0 - v7);
    double v19 = v18;
    double v21 = v20;

    unint64_t v22 = [(CRCameraReader *)self sessionManager];
    int v23 = [(CRCameraReader *)self sessionManager];
    BOOL v24 = [v23 previewLayer];
    double v25 = v9 + v13;
    objc_msgSend(v22, "convertCameraPointOCR:toLayer:flipped:", v24, 0, v9 + v13, v17);
    double v27 = v26;

    CGFloat v28 = [(CRCameraReader *)self sessionManager];
    uint64_t v29 = [(CRCameraReader *)self sessionManager];
    CGFloat v30 = [v29 previewLayer];
    double v31 = v11 + v17;
    objc_msgSend(v28, "convertCameraPointOCR:toLayer:flipped:", v30, 0, v25, v31);

    CGRect v32 = [(CRCameraReader *)self sessionManager];
    id v33 = [(CRCameraReader *)self sessionManager];
    id v34 = [v33 previewLayer];
    objc_msgSend(v32, "convertCameraPointOCR:toLayer:flipped:", v34, 0, v9, v31);
    double v36 = v35;

    v52.size.double width = v36 - v19;
    v52.size.double height = v27 - v21;
    v52.origin.double x = v19;
    v52.origin.double y = v21;
    CGRect v53 = CGRectOffset(v52, -(v36 - v19), 0.0);
    double x = v53.origin.x;
    double y = v53.origin.y;
    double width = v53.size.width;
    double height = v53.size.height;
    id v5 = [MEMORY[0x263F158E8] layer];
    id v41 = +[CRColor whiteColor];
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v41, "CGColor"));

    [(CRCameraReader *)self ocrOverlayBackgroundOpacity];
    objc_msgSend(v5, "setOpacity:");
    id v42 = +[CRColor blackColor];
    objc_msgSend(v5, "setForegroundColor:", objc_msgSend(v42, "CGColor"));

    objc_msgSend(v5, "setFrame:", x, y, width, height);
    [v5 setAlignmentMode:*MEMORY[0x263F15928]];
    [v5 setFontSize:24.0];
    [v4 rotation];
    CATransform3DMakeRotation(&v50, (float)-v43, 0.0, 0.0, 1.0);
    CATransform3D v49 = v50;
    [v5 setTransform:&v49];
    [v5 setAllowsFontSubpixelQuantization:1];
    [v5 setMasksToBounds:1];
    [v5 setCornerRadius:10.0];
    double v44 = [(CRCameraReader *)self ocrOverlayFontName];
    double v45 = [v4 overlayString];
    double v46 = [v45 string];
    double v47 = -[CRCameraReader attributedStringWithFrame:withFont:withString:color:](self, "attributedStringWithFrame:withFont:withString:color:", v44, v46, [v5 foregroundColor], width, height);
    [v5 setString:v47];
  }
  return v5;
}

- (void)showTextDetectorObjects:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CRCameraReader_showTextDetectorObjects___block_invoke;
  v6[3] = &unk_26429E680;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __42__CRCameraReader_showTextDetectorObjects___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = [*(id *)(a1 + 32) textDetectorRTFeedback];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v5++) removeFromSuperlayer];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v3);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = objc_msgSend(*(id *)(a1 + 32), "createTextLayerForRecognizedObject:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
        double v11 = [*(id *)(a1 + 32) view];
        double v12 = [v11 layer];
        [v12 addSublayer:v10];

        double v13 = [*(id *)(a1 + 32) textDetectorRTFeedback];
        [v13 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)sendDidDisplayMessageStyle:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__CRCameraReader_sendDidDisplayMessageStyle___block_invoke;
  v3[3] = &unk_26429E6A8;
  void v3[4] = self;
  void v3[5] = a3;
  cr_dispatch_async(MEMORY[0x263EF83A0], (uint64_t)v3);
}

void __45__CRCameraReader_sendDidDisplayMessageStyle___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) != 1)
  {
    id v2 = [*(id *)(a1 + 32) activityIndicator];
    [v2 stopAnimating];

    if (*(void *)(a1 + 40) != 1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) callbackDelegate];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        uint64_t v5 = [*(id *)(a1 + 32) callbackDelegate];
        [v5 cameraReaderDidDisplayMessage:*(void *)(a1 + 32)];
      }
      if (*(void *)(a1 + 40) != 2)
      {
        id v6 = *(void **)(a1 + 32);
        [v6 startSession];
      }
    }
  }
}

- (void)sendDidFindTarget:(id)a3 frameTime:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CRCameraReader *)self delegateQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__CRCameraReader_sendDidFindTarget_frameTime___block_invoke;
  void v9[3] = &unk_26429E7E0;
  v9[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  id v8 = v6;
  id v10 = v8;
  cr_dispatch_async((uint64_t)v7, (uint64_t)v9);
}

void __46__CRCameraReader_sendDidFindTarget_frameTime___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) didSendFindBox] & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidSendFindBox:1];
    id v2 = [*(id *)(a1 + 32) callbackDelegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      char v4 = [*(id *)(a1 + 32) callbackDelegate];
      [v4 cameraReaderDidFindTarget:*(void *)(a1 + 32)];
    }
  }
  CMTime v12 = *(CMTime *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 lastSendFindBox];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CMTime lhs = v12;
  CMTime rhs = v11;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 1.0)
  {
    long long v9 = *(_OWORD *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    [*(id *)(a1 + 32) setLastSendFindBox:&v9];
    id v6 = [*(id *)(a1 + 32) callbackDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) callbackDelegate];
      [v8 cameraReaderDidFindTarget:*(void *)(a1 + 32) withCorners:*(void *)(a1 + 40)];
    }
  }
}

- (void)sendDidEndWithErrorDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:a3 code:a4 userInfo:a5];
  -[CRCameraReader sendDidEndWithError:](self, "sendDidEndWithError:");
}

- (NSArray)outputObjectTypes
{
  id v2 = (void *)[(NSArray *)self->_outputObjectTypes copy];
  return (NSArray *)v2;
}

- (void)setOutputObjectTypes:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSArray *)a3;
  if (self->_outputObjectTypes != v5)
  {
    objc_storeStrong((id *)&self->_outputObjectTypes, a3);
    [(CRCameraReader *)self releaseCorrectedCardBuffer];
    [(CRCameraReader *)self createCorrectedCardBuffer];
    if ([(NSArray *)self->_outputObjectTypes containsObject:@"CROutputTypeCameraText"])
    {
      uint64_t v6 = *MEMORY[0x263F7EC78];
      uint64_t v7 = *MEMORY[0x263F7EC80];
      v22[0] = *MEMORY[0x263F7EC78];
      v22[1] = v7;
      id v8 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v9 = *MEMORY[0x263F7EC88];
      v23[0] = @"en-US";
      v23[1] = v9;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      CMTime v11 = [v8 dictionaryWithDictionary:v10];

      CMTime v12 = [(CRCameraReader *)self optionsDictionary];
      LOBYTE(v10) = v12 == 0;

      if ((v10 & 1) == 0)
      {
        double v13 = [(CRCameraReader *)self optionsDictionary];
        [v11 addEntriesFromDictionary:v13];
      }
      long long v14 = [v11 objectForKey:v6];
      int v15 = [v14 isEqualToString:@"zh-Hans"];

      if (v15) {
        [v11 setObject:*MEMORY[0x263F7EC98] forKey:*MEMORY[0x263F7EC90]];
      }
      long long v16 = (void *)[objc_alloc(MEMORY[0x263F7ECB8]) initWithOptions:v11];
      [(CRCameraReader *)self setOcrImageReader:v16];

      long long v17 = [(CRCameraReader *)self ocrImageReader];
      uint64_t v21 = *MEMORY[0x263F7ECA0];
      long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      [v17 setOutputObjectTypes:v18];

      long long v19 = objc_opt_new();
      [(CRCameraReader *)self setTextDetectorRTFeedback:v19];

      LODWORD(v20) = 0.75;
      [(CRCameraReader *)self setOcrOverlayBackgroundOpacity:v20];
      [(CRCameraReader *)self setOcrOverlayFontName:@"Helvetica"];
    }
  }
}

- (BOOL)hidePlacementText
{
  return self->_hidePlacementText;
}

- (void)setHidePlacementText:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidePlacementText = a3;
  id v5 = [(CRCameraReader *)self alignmentLayer];
  char v4 = [v5 instructionLayer];
  [v4 setHidden:v3];
}

- (id)generateStringFromDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyyMMddHHmmssSSS"];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (void)updateContactsCache:(id)a3
{
  v23[6] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    uint64_t v5 = *MEMORY[0x263EFDFC8];
    v23[0] = *MEMORY[0x263EFDFB8];
    v23[1] = v5;
    uint64_t v6 = *MEMORY[0x263EFE088];
    v23[2] = *MEMORY[0x263EFE038];
    void v23[3] = v6;
    uint64_t v7 = *MEMORY[0x263EFE050];
    v23[4] = *MEMORY[0x263EFE080];
    v23[5] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFEA18]) initWithKeysToFetch:v8];
    id v10 = objc_alloc_init(MEMORY[0x263EFEA58]);
    CMTime v11 = [(CRCameraReader *)self previousContactMatches];
    [v11 removeAllObjects];

    id v22 = 0;
    CMTime v12 = [v10 _crossPlatformUnifiedMeContactWithKeysToFetch:v8 error:&v22];
    id v13 = v22;
    long long v14 = [v4 objectForKey:@"meContact"];
    if (v14) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v12 == 0;
    }
    int v16 = !v15;

    if (v16)
    {
      long long v17 = createCachedContact(v12);
      [v4 setObject:v17 forKey:@"meContact"];

      long long v18 = [NSDictionary dictionaryWithDictionary:v4];
      [(CRCameraReader *)self setContactsCache:v18];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __38__CRCameraReader_updateContactsCache___block_invoke;
    v20[3] = &unk_26429E9B8;
    id v21 = v4;
    [v10 enumerateContactsWithFetchRequest:v9 error:0 usingBlock:v20];
  }
  long long v19 = [NSDictionary dictionaryWithDictionary:v4];
  [(CRCameraReader *)self setContactsCache:v19];
}

void __38__CRCameraReader_updateContactsCache___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v12 = v5;
  uint64_t v7 = [v5 identifier];
  id v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = createCachedContact(v12);
    CMTime v11 = [v12 identifier];
    [v9 setObject:v10 forKey:v11];
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x1F4) {
    *a3 = 1;
  }
}

- (void)mergeInfo:(id)a3 intoFindInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CRCameraReader_mergeInfo_intoFindInfo___block_invoke;
  v7[3] = &unk_26429E9E0;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __41__CRCameraReader_mergeInfo_intoFindInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([*(id *)(a1 + 32) objectForKeyedSubscript:v9],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    id v8 = [v7 arrayByAddingObjectsFromArray:v5];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v9];
  }
}

- (id)extractFinalDigitStringFromNumbers:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndex:0];
    id v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789 "];
    id v6 = [v5 invertedSet];

    uint64_t v7 = [v4 componentsSeparatedByCharactersInSet:v6];
    id v8 = [v7 componentsJoinedByString:&stru_26C7BF850];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (CGRect)uniformPadRect:(CGRect)a3 widthPadding:(float)a4 heightPadding:(float)a5 width:(double)a6 height:(double)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v14 = fmin(a4, fmin(a3.origin.x, a6 - CGRectGetMaxX(a3)));
  v20.origin.CGFloat x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  double v15 = fmin(a5, fmin(y, a7 - CGRectGetMaxY(v20)));
  if (v15 <= 0.0 || v14 <= 0.0)
  {
    NSLog(&cfstr_Corerecognitio.isa, *(void *)&v14, *(void *)&v15);
  }
  else
  {
    double v16 = fmin(v14 / width, v15 / height);
    CGFloat v17 = -(height * v16);
    CGFloat v18 = -(width * v16);
    v21.origin.CGFloat x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    CGRect v22 = CGRectInset(v21, v17, v18);
    CGFloat x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
  }
  v26.origin.CGFloat x = 0.0;
  v26.origin.double y = 0.0;
  v23.origin.CGFloat x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  v26.size.double width = a6;
  v26.size.double height = a7;
  CGRect v24 = CGRectIntersection(v23, v26);
  return CGRectIntegral(v24);
}

+ (CGRect)aspectRatioPaddedRect:(CGRect)a3 expectedWidth:(double)a4 height:(double)a5 orientation:(unsigned int)a6
{
  double width = a3.size.width;
  double height = a3.size.height;
  double x = a3.origin.x;
  double y = a3.origin.y;
  double v11 = a4 / a5;
  if (a6 != 6)
  {
    double width = a3.size.width;
    double height = a3.size.height;
    double x = a3.origin.x;
    double y = a3.origin.y;
    if (a6 != 8)
    {
      double width = a3.size.height;
      double height = a3.size.width;
      double x = a3.origin.y;
      double y = a3.origin.x;
    }
  }
  if (width / height <= v11)
  {
    if (v11 <= width / height) {
      goto LABEL_21;
    }
    double v14 = (height * a4 / a5 - width) * 0.5;
    double v13 = 0.0;
    if (x - v14 >= 0.0) {
      double x = v14;
    }
    else {
      double v13 = (v14 - x) * a5 / a4;
    }
    if (a6 == 8 || a6 == 6)
    {
      double v15 = v13;
      double v13 = -x;
    }
    else
    {
      double v15 = -x;
    }
  }
  else
  {
    double v12 = (width * a5 / a4 - height) * 0.5;
    double v13 = 0.0;
    if (y - v12 >= 0.0) {
      double y = v12;
    }
    else {
      double v13 = (v12 - y) * a4 / a5;
    }
    if (a6 == 8 || a6 == 6)
    {
      double v15 = -y;
    }
    else
    {
      double v15 = v13;
      double v13 = -y;
    }
  }
  a3 = CGRectInset(a3, v13, v15);
LABEL_21:
  return CGRectIntegral(a3);
}

- (CRCameraReaderDelegate)callbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callbackDelegate);
  return (CRCameraReaderDelegate *)WeakRetained;
}

- (void)setCallbackDelegate:(id)a3
{
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (UIColor)maskOutlineColor
{
  return self->_maskOutlineColor;
}

- (UIColor)placementTextColor
{
  return self->_placementTextColor;
}

- (void)setPlacementTextColor:(id)a3
{
}

- (UIColor)capturedTextColor
{
  return self->_capturedTextColor;
}

- (BOOL)enableAltIDCardScan
{
  return self->_enableAltIDCardScan;
}

- (void)setEnableAltIDCardScan:(BOOL)a3
{
  self->_enableAltIDCardScan = a3;
}

- (float)borderPaddingIDCard
{
  return self->_borderPaddingIDCard;
}

- (void)setBorderPaddingIDCard:(float)a3
{
  self->_borderPaddingIDCard = a3;
}

- (__CVBuffer)correctedCardBuffer
{
  return self->_correctedCardBuffer;
}

- (void)setCorrectedCardBuffer:(__CVBuffer *)a3
{
  self->_correctedCardBuffer = a3;
}

- (BOOL)configPresentCentered
{
  return self->_configPresentCentered;
}

- (void)setConfigPresentCentered:(BOOL)a3
{
  self->_configPresentCentered = a3;
}

- (double)configDemoSpeed
{
  return self->_configDemoSpeed;
}

- (void)setConfigDemoSpeed:(double)a3
{
  self->_configDemoSpeed = a3;
}

- (CRBoxLayer)boxLayer
{
  return (CRBoxLayer *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setBoxLayer:(id)a3
{
}

- (DiagnosticHUDLayer)diagnosticHUDLayer
{
  return (DiagnosticHUDLayer *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setDiagnosticHUDLayer:(id)a3
{
}

- (NSArray)foundPoints
{
  return (NSArray *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setFoundPoints:(id)a3
{
}

- (NSString)foundCode
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setFoundCode:(id)a3
{
}

- (BOOL)isQRCode
{
  return self->_isQRCode;
}

- (void)setIsQRCode:(BOOL)a3
{
  self->_isQRCode = a3;
}

- (NSString)previousCode
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setPreviousCode:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sessionStarted
{
  objc_copyStruct(retstr, &self->_sessionStarted, 24, 1, 0);
  return result;
}

- (void)setSessionStarted:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pointsFound
{
  objc_copyStruct(retstr, &self->_pointsFound, 24, 1, 0);
  return result;
}

- (void)setPointsFound:(id *)a3
{
}

- (NSDate)codePresented
{
  return (NSDate *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setCodePresented:(id)a3
{
}

- (BOOL)codeInverted
{
  return self->_codeInverted;
}

- (void)setCodeInverted:(BOOL)a3
{
  self->_codeInverted = a3;
}

- (BOOL)didSendEndOrCancel
{
  return self->_didSendEndOrCancel;
}

- (void)setDidSendEndOrCancel:(BOOL)a3
{
  self->_didSendEndOrCancel = a3;
}

- (BOOL)didSendFindBox
{
  return self->_didSendFindBox;
}

- (void)setDidSendFindBox:(BOOL)a3
{
  self->_didSendFindBodouble x = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastSendFindBox
{
  objc_copyStruct(retstr, &self->_lastSendFindBox, 24, 1, 0);
  return result;
}

- (void)setLastSendFindBox:(id *)a3
{
}

- (unint64_t)imagesToCapture
{
  return self->_imagesToCapture;
}

- (void)setImagesToCapture:(unint64_t)a3
{
  self->_imagesToCapture = a3;
}

- (BOOL)configUseJPEGForColor
{
  return self->_configUseJPEGForColor;
}

- (void)setConfigUseJPEGForColor:(BOOL)a3
{
  self->_configUseJPEGForColor = a3;
}

- (NSPointerArray)captureBuffer
{
  return (NSPointerArray *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setCaptureBuffer:(id)a3
{
}

- (CRPollingTimer)boxLayerHideTimer
{
  return (CRPollingTimer *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setBoxLayerHideTimer:(id)a3
{
}

- (BOOL)configUseFastScanning
{
  return self->_configUseFastScanning;
}

- (void)setConfigUseFastScanning:(BOOL)a3
{
  self->_configUseFastScanning = a3;
}

- (opaqueCMSampleBuffer)lastBuffer
{
  return self->_lastBuffer;
}

- (void)setLastBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_lastBuffer = a3;
}

- (OS_dispatch_semaphore)processingImage
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setProcessingImage:(id)a3
{
}

- (NSMutableDictionary)cardNumberCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setCardNumberCounts:(id)a3
{
}

- (NSMutableDictionary)cardholderCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setCardholderCounts:(id)a3
{
}

- (NSMutableDictionary)expirationDateCounts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setExpirationDateCounts:(id)a3
{
}

- (NSMutableDictionary)pinnedFoundInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setPinnedFoundInfo:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFieldFoundTime
{
  objc_copyStruct(retstr, &self->_lastFieldFoundTime, 24, 1, 0);
  return result;
}

- (void)setLastFieldFoundTime:(id *)a3
{
}

- (CRAlignmentLayer)alignmentLayer
{
  return (CRAlignmentLayer *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setAlignmentLayer:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setActivityIndicator:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (BOOL)previousIdleState
{
  return self->_previousIdleState;
}

- (void)setPreviousIdleState:(BOOL)a3
{
  self->_previousIdleState = a3;
}

- (NSMutableArray)dateCutRects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setDateCutRects:(id)a3
{
}

- (NSMutableArray)nameCutRects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setNameCutRects:(id)a3
{
}

- (NSDictionary)contactsCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setContactsCache:(id)a3
{
}

- (NSCache)previousContactMatches
{
  return (NSCache *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setPreviousContactMatches:(id)a3
{
}

- (BOOL)sessionIsStopping
{
  return self->_sessionIsStopping;
}

- (void)setSessionIsStopping:(BOOL)a3
{
  self->_sessionIsStopping = a3;
}

- (CRMLCCModel)flatPrintedModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setFlatPrintedModel:(id)a3
{
}

- (CRMLCCModel)embossedNumberModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setEmbossedNumberModel:(id)a3
{
}

- (CRMLCCModel)embossedExpirationModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setEmbossedExpirationModel:(id)a3
{
}

- (CRMLCCModel)embossedCardholderModel
{
  return (CRMLCCModel *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setEmbossedCardholderModel:(id)a3
{
}

- (NSMutableArray)cardBlurValues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setCardBlurValues:(id)a3
{
}

- (NSMutableDictionary)optionsDictionary
{
  return self->_optionsDictionary;
}

- (void)setOptionsDictionary:(id)a3
{
}

- (CRImageReader)ocrImageReader
{
  return self->_ocrImageReader;
}

- (void)setOcrImageReader:(id)a3
{
}

- (CATextLayer)overlayTextLayer
{
  return self->_overlayTextLayer;
}

- (void)setOverlayTextLayer:(id)a3
{
}

- (NSMutableArray)textDetectorRTFeedback
{
  return self->_textDetectorRTFeedback;
}

- (void)setTextDetectorRTFeedback:(id)a3
{
}

- (NSString)ocrOverlayFontName
{
  return (NSString *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setOcrOverlayFontName:(id)a3
{
}

- (float)ocrOverlayBackgroundOpacity
{
  return self->_ocrOverlayBackgroundOpacity;
}

- (void)setOcrOverlayBackgroundOpacity:(float)a3
{
  self->_ocrOverlayBackgroundOpacitdouble y = a3;
}

- (BOOL)continousMode
{
  return self->_continousMode;
}

- (void)setContinousMode:(BOOL)a3
{
  self->_continousMode = a3;
}

- (BOOL)isCaptureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(BOOL)a3
{
  self->_captureMode = a3;
}

- (unint64_t)captureCount
{
  return self->_captureCount;
}

- (void)setCaptureCount:(unint64_t)a3
{
  self->_captureCount = a3;
}

- (double)sessionTimeout
{
  return self->_sessionTimeout;
}

- (void)setSessionTimeout:(double)a3
{
  self->_sessionTimeout = a3;
}

- (int64_t)whiteBalanceMode
{
  return self->_whiteBalanceMode;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  self->_whiteBalanceMode = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (void)setExposureMode:(int64_t)a3
{
  self->_exposureMode = a3;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
{
  self->_torchMode = a3;
}

- (NSString)cameraMode
{
  return (NSString *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setCameraMode:(id)a3
{
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (BOOL)showDiagnosticHUD
{
  return self->_showDiagnosticHUD;
}

- (void)setShowDiagnosticHUD:(BOOL)a3
{
  self->_showDiagnosticHUD = a3;
}

- (CRCaptureSessionManager)sessionManager
{
  return (CRCaptureSessionManager *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setSessionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_cameraMode, 0);
  objc_storeStrong((id *)&self->_ocrOverlayFontName, 0);
  objc_storeStrong((id *)&self->_textDetectorRTFeedback, 0);
  objc_storeStrong((id *)&self->_overlayTextLayer, 0);
  objc_storeStrong((id *)&self->_ocrImageReader, 0);
  objc_storeStrong((id *)&self->_optionsDictionary, 0);
  objc_storeStrong((id *)&self->_cardBlurValues, 0);
  objc_storeStrong((id *)&self->_embossedCardholderModel, 0);
  objc_storeStrong((id *)&self->_embossedExpirationModel, 0);
  objc_storeStrong((id *)&self->_embossedNumberModel, 0);
  objc_storeStrong((id *)&self->_flatPrintedModel, 0);
  objc_storeStrong((id *)&self->_previousContactMatches, 0);
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_nameCutRects, 0);
  objc_storeStrong((id *)&self->_dateCutRects, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_alignmentLayer, 0);
  objc_storeStrong((id *)&self->_pinnedFoundInfo, 0);
  objc_storeStrong((id *)&self->_expirationDateCounts, 0);
  objc_storeStrong((id *)&self->_cardholderCounts, 0);
  objc_storeStrong((id *)&self->_cardNumberCounts, 0);
  objc_storeStrong((id *)&self->_processingImage, 0);
  objc_storeStrong((id *)&self->_boxLayerHideTimer, 0);
  objc_storeStrong((id *)&self->_captureBuffer, 0);
  objc_storeStrong((id *)&self->_codePresented, 0);
  objc_storeStrong((id *)&self->_previousCode, 0);
  objc_storeStrong((id *)&self->_foundCode, 0);
  objc_storeStrong((id *)&self->_foundPoints, 0);
  objc_storeStrong((id *)&self->_diagnosticHUDLayer, 0);
  objc_storeStrong((id *)&self->_boxLayer, 0);
  objc_storeStrong((id *)&self->_capturedTextColor, 0);
  objc_storeStrong((id *)&self->_placementTextColor, 0);
  objc_storeStrong((id *)&self->_maskOutlineColor, 0);
  objc_storeStrong((id *)&self->_maskColor, 0);
  objc_destroyWeak((id *)&self->_callbackDelegate);
  objc_storeStrong((id *)&self->_outputObjectTypes, 0);
}

@end