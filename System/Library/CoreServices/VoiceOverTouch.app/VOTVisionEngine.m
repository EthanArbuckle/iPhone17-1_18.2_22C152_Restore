@interface VOTVisionEngine
+ (BOOL)_shouldAnalyzeElement:(id)a3 deferToMediaAnalysisElementIfNeeded:(BOOL)a4;
+ (BOOL)elementNeedsAdditionalDescription:(id)a3;
+ (BOOL)shouldAnalyzeElement:(id)a3;
- (AXMVoiceOverVisionEngine)engine;
- (BOOL)_processEmojiFor2DBrailleDisplay:(id)a3;
- (BOOL)processElementFor2DBrailleDisplay:(id)a3;
- (BOOL)processStringFor2DBrailleDisplay:(id)a3;
- (BOOL)wasCachePurged;
- (VOTVisionEngine)init;
- (VOTVisionEngineResultUpdateDelegate)resultUpdateDelegate;
- (id)_renderStringToImage:(id)a3;
- (id)_visionAnalysisOptionsForElement:(id)a3 visionOptions:(id)a4;
- (id)analysisOptionsFor2DBraille;
- (id)preferredMediaAnalysisLocale;
- (id)resultsForElement:(id)a3;
- (int64_t)_interfaceOrientationForElement:(id)a3;
- (void)analyzeElement:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)produceCaptionForElement:(id)a3 completion:(id)a4;
- (void)purgeCache;
- (void)setEngine:(id)a3;
- (void)setResultUpdateDelegate:(id)a3;
- (void)setWasCachePurged:(BOOL)a3;
@end

@implementation VOTVisionEngine

+ (BOOL)_shouldAnalyzeElement:(id)a3 deferToMediaAnalysisElementIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (AXDeviceIsAudioAccessory()) {
    goto LABEL_10;
  }
  unsigned int v7 = [v6 mediaAnalysisOptions];
  if ([v6 doesHaveTraits:kAXBackButtonTrait | kAXStaticTextTrait | kAXTextEntryTrait | kAXKeyboardKeyTrait | kAXAllowsDirectInteractionTrait | kAXMathEquationTrait | kAXAutoCorrectCandidateTrait | kAXTextAreaTrait | kAXMapTrait | kAXSecureTextFieldTrait | kAXWebInteractiveVideoTrait] & 1) != 0|| (objc_msgSend(v6, "isTouchContainer") & 1) != 0|| (objc_msgSend(v6, "isAccessibleGroup"))
  {
    goto LABEL_10;
  }
  if ([v6 doesHaveTraits:kAXImageTrait])
  {
LABEL_9:
    unsigned __int8 v8 = 1;
    goto LABEL_11;
  }
  if (![v6 supportsMediaAnalysis])
  {
LABEL_10:
    unsigned __int8 v8 = 0;
    goto LABEL_11;
  }
  if (v7 & 0x30000) != 0 || ([a1 elementNeedsAdditionalDescription:v6]) {
    goto LABEL_9;
  }
  unsigned __int8 v8 = 0;
  if (v7 && v4)
  {
    v10 = [v6 mediaAnalysisElement];
    v11 = v10;
    if (v10 && ([v10 isEqual:v6] & 1) == 0) {
      unsigned __int8 v8 = [a1 _shouldAnalyzeElement:v11 deferToMediaAnalysisElementIfNeeded:0];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
LABEL_11:

  return v8;
}

+ (BOOL)shouldAnalyzeElement:(id)a3
{
  return [a1 _shouldAnalyzeElement:a3 deferToMediaAnalysisElementIfNeeded:1];
}

+ (BOOL)elementNeedsAdditionalDescription:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 label];
  v5 = +[NSCharacterSet whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  BOOL v9 = [v6 length] == (id)1
    && ([v3 value],
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        !v8)
    && ([v6 characterAtIndex:0] - 19968) >> 9 > 0x28
    || [v6 isAXAttributedString]
    && ([v6 hasAttribute:UIAccessibilityTokenIsImageResourceName] & 1) != 0;

  return v9;
}

- (VOTVisionEngine)init
{
  v20.receiver = self;
  v20.super_class = (Class)VOTVisionEngine;
  v2 = [(VOTVisionEngine *)&v20 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXMVoiceOverVisionEngine);
    [(VOTVisionEngine *)v2 setEngine:v3];

    objc_initWeak(&location, v2);
    BOOL v4 = +[AXSettings sharedInstance];
    id v5 = [v4 imageCaptionGenderStrategy];
    id v6 = [(VOTVisionEngine *)v2 engine];
    [v6 setGenderStrategy:v5];

    unsigned int v7 = +[AXSettings sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000FDB6C;
    v17[3] = &unk_1001B35A8;
    objc_copyWeak(&v18, &location);
    id v8 = objc_loadWeakRetained(&location);
    [v7 registerUpdateBlock:v17 forRetrieveSelector:"imageCaptionGenderStrategy" withListener:v8];

    objc_destroyWeak(&v18);
    BOOL v9 = +[NSNotificationCenter defaultCenter];
    v10 = off_1001EA740;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FDBF4;
    v15[3] = &unk_1001B6D28;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v15];
    id languageConfigurationObserver = v2->_languageConfigurationObserver;
    v2->_id languageConfigurationObserver = (id)v11;

    v13 = [(VOTVisionEngine *)v2 engine];
    [v13 prewarmEngine];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  if (self->_languageConfigurationObserver)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_languageConfigurationObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)VOTVisionEngine;
  [(VOTVisionEngine *)&v4 dealloc];
}

- (int64_t)_interfaceOrientationForElement:(id)a3
{
  id v3 = [a3 application];
  unsigned int v4 = [v3 applicationInterfaceOrientation];
  if (v4 - 1 >= 4)
  {
    id v5 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      unsigned int v7 = +[AXSubsystemVoiceOver identifier];
      id v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = AXColorizeFormatLog();
        uint64_t v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          int v23 = 138543362;
          v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v23, 0xCu);
        }
      }
    }
    v12 = +[VOTElement systemAppApplication];
    switch((unint64_t)[v12 applicationOrientation])
    {
      case 0uLL:
      case 5uLL:
      case 6uLL:
        v13 = +[AXSubsystemVoiceOver sharedInstance];
        unsigned __int8 v14 = [v13 ignoreLogging];

        if ((v14 & 1) == 0)
        {
          v15 = +[AXSubsystemVoiceOver identifier];
          id v16 = AXLoggerForFacility();

          os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v16, v17))
          {
            id v18 = AXColorizeFormatLog();
            v19 = _AXStringForArgs();
            if (os_log_type_enabled(v16, v17))
            {
              int v23 = 138543362;
              v24 = v19;
              _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&v23, 0xCu);
            }
          }
        }
        goto LABEL_15;
      case 1uLL:
LABEL_15:
        unsigned int v4 = 1;
        break;
      case 2uLL:
        unsigned int v4 = 2;
        break;
      case 3uLL:
        unsigned int v4 = 4;
        break;
      case 4uLL:
        unsigned int v4 = 3;
        break;
      default:
        break;
    }
  }
  uint64_t v20 = v4 - 1;
  if (v20 < 4) {
    int64_t v21 = v20 + 1;
  }
  else {
    int64_t v21 = 0;
  }

  return v21;
}

- (id)preferredMediaAnalysisLocale
{
  v2 = +[VOTWorkspace sharedWorkspace];
  id v3 = [v2 selectedLanguage];

  if (![v3 length]
    || (+[AXMLocSupport sharedInstance],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        [v4 localeForLanguageCode:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    unsigned __int8 v6 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    if ([v6 length])
    {
      unsigned int v7 = +[AXMLocSupport sharedInstance];
      id v5 = [v7 localeForLanguageCode:v6];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_visionAnalysisOptionsForElement:(id)a3 visionOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mediaAnalysisOptions];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000FE374;
  v31[3] = &unk_1001B6D50;
  id v9 = v7;
  id v32 = v9;
  id v10 = v6;
  id v33 = v10;
  int v34 = (int)v8;
  uint64_t v11 = objc_retainBlock(v31);
  v12 = [(VOTVisionEngine *)self preferredMediaAnalysisLocale];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000FE3D4;
  v28[3] = &unk_1001B6DB8;
  id v13 = v10;
  id v29 = v13;
  id v14 = v12;
  id v30 = v14;
  v15 = objc_retainBlock(v28);
  id v16 = [(VOTVisionEngine *)self engine];
  if ([v9 includeFullImageDescriptionsForValidElements]) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = (uint64_t)[v9 includeFullImageDescriptionsForAllElements];
  }
  id v18 = [v16 configuredOptionsDisableAllDetectors:v11 elementOptions:v8 textRecognitionLevel:&stru_1001B6D90 textDetectionLocales:v15 preferringFullCaptions:v17];

  if (v8)
  {
    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      objc_msgSend(v18, "setDetectMADScenes:", objc_msgSend(v9, "includeSceneDetection"));
      v19 = v18;
      id v20 = 0;
    }
    else
    {
      [v18 setDetectMADScenes:0];
      id v20 = [v9 includeSceneDetection];
      v19 = v18;
    }
    [v19 setDetectScenes:v20];
  }
  else
  {
    [v18 setDetectScenes:0];
    if (AXRuntimeCheck_MediaAnalysisSupport()) {
      [v18 setDetectMADScenes:0];
    }
  }
  char v27 = 0;
  int64_t v21 = [v13 url];
  BOOL v25 = 1;
  if ([v21 isFileURL])
  {
    v22 = +[NSFileManager defaultManager];
    int v23 = [v21 path];
    unsigned int v24 = [v22 fileExistsAtPath:v23 isDirectory:&v27];

    if (v24)
    {
      if (!v27) {
        BOOL v25 = 0;
      }
    }
  }
  [v18 setIncludeImageInResult:v25];
  [v18 setPreferredOutputLocale:v14];

  return v18;
}

- (id)_renderStringToImage:(id)a3
{
  id v3 = a3;
  v17.width = 300.0;
  v17.height = 200.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 1.0);
  unsigned int v4 = +[UIColor whiteColor];
  [v4 setFill];

  CurrentContext = UIGraphicsGetCurrentContext();
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = 300.0;
  v18.size.height = 200.0;
  CGContextFillRect(CurrentContext, v18);
  v14[0] = NSFontAttributeName;
  id v6 = +[UIFont systemFontOfSize:220.0];
  v15[0] = v6;
  v14[1] = NSForegroundColorAttributeName;
  id v7 = +[UIColor blackColor];
  v15[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  [v3 sizeWithAttributes:v8];
  objc_msgSend(v3, "drawInRect:withAttributes:", v8, v9 * -0.5 + 150.0, -28.0, 300.0, 256.0);

  id v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v11 = v10;
  v12 = +[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", [v11 CGImage]);

  return v12;
}

- (id)analysisOptionsFor2DBraille
{
  id v2 = objc_alloc_init((Class)AXMVisionAnalysisOptions);
  [v2 setDetectBrailleEdges:1];
  id v3 = _AXSVoiceOverTouchActive2DBrailleDisplays();
  unsigned int v4 = [v3 lastObject];
  NSSize v5 = NSSizeFromString(v4);

  id v6 = [objc_alloc((Class)AXMBrailleCanvasDescription) initWithHeight:(unint64_t)v5.height width:(unint64_t)v5.width numberOfDiscretePinHeights:2];
  id v7 = [objc_alloc((Class)AXMBrailleEdgeDetectorOptions) initWithCanvasDescription:v6];
  [v2 setBrailleEdgeOptions:v7];

  id v8 = +[VOTPlanarBrailleManager manager];
  [v8 imageZoom];
  double v10 = v9;
  id v11 = [v2 brailleEdgeOptions];
  [v11 setZoomLevel:v10];

  v12 = +[VOTPlanarBrailleManager manager];
  id v13 = [v12 imageInvert];
  id v14 = [v2 brailleEdgeOptions];
  [v14 setInvert:v13];

  v15 = +[VOTPlanarBrailleManager manager];
  [v15 imageOrigin];
  double v17 = v16;
  double v19 = v18;
  id v20 = [v2 brailleEdgeOptions];
  objc_msgSend(v20, "setOrigin:", v17, v19);

  int64_t v21 = +[VOTPlanarBrailleManager manager];
  [v21 imageIntensity];
  double v23 = v22;
  unsigned int v24 = [v2 brailleEdgeOptions];
  [v24 setEdgeStrength:v23];

  return v2;
}

- (BOOL)processStringFor2DBrailleDisplay:(id)a3
{
  id v4 = a3;
  if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay])
  {
    NSSize v5 = [(VOTVisionEngine *)self _renderStringToImage:v4];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      id v7 = [(VOTVisionEngine *)self engine];
      id v8 = [v7 imageNode];
      [v8 setShouldProcessRemotely:1];

      double v9 = [(VOTVisionEngine *)self engine];
      double v10 = [v9 imageNode];
      id v11 = [(VOTVisionEngine *)self analysisOptionsFor2DBraille];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000FE974;
      v13[3] = &unk_1001B6DE0;
      id v14 = v4;
      [v10 triggerWithImage:v5 options:v11 cacheKey:v14 resultHandler:v13];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_processEmojiFor2DBrailleDisplay:(id)a3
{
  id v4 = a3;
  if (([v4 mediaAnalysisOptions] & 0x80000) != 0)
  {
    BOOL v6 = [v4 label];
    BOOL v5 = [(VOTVisionEngine *)self processStringFor2DBrailleDisplay:v6];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)processElementFor2DBrailleDisplay:(id)a3
{
  id v4 = a3;
  if (![(VOTVisionEngine *)self _processEmojiFor2DBrailleDisplay:v4])
  {
    BOOL v6 = [v4 brailleMap];
    if (v6)
    {
      id v5 = +[VOTBrailleManager manager];
      [v5 setBrailleMap:v6];
    }
    else
    {
      id v5 = [v4 braille2DCanvasElement];
      if (!v5)
      {
        if (![v4 hasImage])
        {
          LOBYTE(v5) = 0;
          goto LABEL_17;
        }
        id v5 = v4;
        if (!v5) {
          goto LABEL_17;
        }
      }
      id v7 = [v5 application];
      int64_t v8 = [(VOTVisionEngine *)self _interfaceOrientationForElement:v5];
      [v5 braille2DRenderRegion];
      double x = v43.origin.x;
      double y = v43.origin.y;
      double width = v43.size.width;
      double height = v43.size.height;
      if (CGRectIsEmpty(v43))
      {
        [v5 mediaAnalysisFrame];
        double v13 = v44.origin.x;
        double v14 = v44.origin.y;
        double v15 = v44.size.width;
        double v16 = v44.size.height;
        v46.origin.double x = CGRectZero.origin.x;
        v46.origin.double y = CGRectZero.origin.y;
        v46.size.double width = CGRectZero.size.width;
        v46.size.double height = CGRectZero.size.height;
        if (CGRectEqualToRect(v44, v46)
          || (v45.origin.double x = v13, v45.origin.y = v14, v45.size.width = v15, v45.size.height = v16, CGRectIsInfinite(v45)))
        {
          [v5 visibleFrame];
          double v13 = v17;
          double v14 = v18;
          double v15 = v19;
          double v16 = v20;
        }
        objc_msgSend(v7, "convertAccessibilityFrameToScreenCoordinates:", v13, v14, v15, v16);
        objc_msgSend(v7, "convertAccessibilityFrameToScreenCoordinates:");
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
      }
      else
      {
        id v29 = +[VOTElement systemWideElement];
        objc_msgSend(v29, "convertRect:fromContextId:", objc_msgSend(v5, "windowContextId"), x, y, width, height);
        double v22 = v30;
        double v24 = v31;
        double v26 = v32;
        double v28 = v33;
      }
      int v34 = +[VOTElement systemWideElement];
      v35 = [v34 elementForAttribute:1005];

      v36 = [v35 windowContextIDs];
      v37 = [(VOTVisionEngine *)self analysisOptionsFor2DBraille];
      [v37 setIgnoredLayerContextIDs:v36];
      v38 = [(VOTVisionEngine *)self engine];
      v39 = [v38 captureNode];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000FEDE8;
      v41[3] = &unk_1001B6DE0;
      id v42 = v4;
      objc_msgSend(v39, "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:", v8, v37, v42, v41, v22, v24, v26, v28);
    }
    LOBYTE(v5) = 1;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v5) = 1;
LABEL_18:

  return (char)v5;
}

- (void)analyzeElement:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 mediaAnalysisElement];
    if (!v8) {
      id v8 = v6;
    }
    double v9 = [(VOTVisionEngine *)self _visionAnalysisOptionsForElement:v8 visionOptions:v7];
    if ([(id)VOTSharedWorkspace buttonIconDetectionEnabled]
      && ([v6 doesHaveTraits:kAXTextAreaTrait | kAXStaticTextTrait] & 1) == 0
      && ([v6 frame], v10 <= 100.0))
    {
      [v6 frame];
      BOOL v11 = v60 <= 100.0;
    }
    else
    {
      BOOL v11 = 0;
    }
    [v9 setDetectIconClass:v11];
    if ([(id)VOTSharedWorkspace hasActive2DBrailleDisplay]
      && ([v6 brailleMap], v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      char v13 = 1;
      [v9 setDetectBrailleEdges:1];
      v58 = [(VOTVisionEngine *)self analysisOptionsFor2DBraille];
      v59 = [v58 brailleEdgeOptions];
      [v9 setBrailleEdgeOptions:v59];
    }
    else
    {
      char v13 = 0;
    }
    double v14 = [v8 url];
    int64_t v64 = [(VOTVisionEngine *)self _interfaceOrientationForElement:v8];
    [v8 mediaAnalysisFrame];
    CGFloat x = v89.origin.x;
    CGFloat y = v89.origin.y;
    CGFloat width = v89.size.width;
    CGFloat height = v89.size.height;
    v94.origin.CGFloat x = CGRectZero.origin.x;
    v94.origin.CGFloat y = CGRectZero.origin.y;
    v94.size.CGFloat width = CGRectZero.size.width;
    v94.size.CGFloat height = CGRectZero.size.height;
    if (CGRectEqualToRect(v89, v94)) {
      goto LABEL_13;
    }
    v90.origin.CGFloat x = x;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat width = width;
    v90.size.CGFloat height = height;
    double v19 = x;
    double v20 = y;
    double v21 = width;
    double v22 = height;
    if (CGRectIsInfinite(v90))
    {
LABEL_13:
      [v8 visibleFrame];
      double v19 = v23;
      double v20 = v24;
      double v21 = v25;
      double v22 = v26;
    }
    v72 = [v8 application];
    objc_msgSend(v72, "convertAccessibilityFrameToScreenCoordinates:", v19, v20, v21, v22);
    double v67 = v28;
    double v68 = v27;
    double v65 = v30;
    double v66 = v29;
    double v31 = VOTLogCommon();
    v74 = v14;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v91.origin.CGFloat x = x;
      v91.origin.CGFloat y = y;
      v91.size.CGFloat width = width;
      v91.size.CGFloat height = height;
      NSStringFromCGRect(v91);
      v61 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue();
      v92.origin.CGFloat x = v19;
      v92.origin.CGFloat y = v20;
      v92.size.CGFloat width = v21;
      v92.size.CGFloat height = v22;
      NSStringFromCGRect(v92);
      v62 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue();
      v93.origin.CGFloat y = v67;
      v93.origin.CGFloat x = v68;
      v93.size.CGFloat height = v65;
      v93.size.CGFloat width = v66;
      NSStringFromCGRect(v93);
      v63 = (VOTVisionEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v82 = self;
      __int16 v83 = 2112;
      v84 = v61;
      __int16 v85 = 2112;
      v86 = v62;
      __int16 v87 = 2112;
      v88 = v63;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Vision analysis frame for element %@: visionAnalysis:%@ captureRegion:%@ convertedFrame:%@", buf, 0x2Au);

      double v14 = v74;
    }

    double v32 = +[VOTElement systemWideElement];
    double v33 = [v32 elementForAttribute:1005];

    v71 = v33;
    [v33 windowContextIDs];
    v70 = v69 = v9;
    objc_msgSend(v9, "setIgnoredLayerContextIDs:");
    +[NSDate timeIntervalSinceReferenceDate];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000FF6A8;
    v76[3] = &unk_1001B6E08;
    uint64_t v79 = v34;
    v76[4] = self;
    v35 = (VOTVisionEngine *)v6;
    v77 = v35;
    id v73 = v7;
    id v78 = v7;
    char v80 = v13;
    v36 = objc_retainBlock(v76);
    char v75 = 0;
    unsigned int v37 = 0;
    if ([(VOTVisionEngine *)v14 isFileURL])
    {
      v38 = +[NSFileManager defaultManager];
      v39 = [(VOTVisionEngine *)v74 path];
      unsigned int v37 = [v38 fileExistsAtPath:v39 isDirectory:&v75];
    }
    unsigned int v40 = [v8 isPHAssetLocallyAvailable];
    v41 = [v8 imageAssetLocalIdentifier];
    id v42 = [v8 photoLibraryURL];
    if (v40 && v41)
    {
      CGRect v43 = AXMediaLogService();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v82 = v41;
        __int16 v83 = 2112;
        v84 = v42;
        __int16 v85 = 2112;
        v86 = v35;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "AnalyzeElement[AssetLocalIdentifier]: %@, photoLibraryURL:%@, element: %@", buf, 0x20u);
      }

      CGRect v44 = [(VOTVisionEngine *)self engine];
      CGRect v45 = [v44 imageNode];
      [v45 setShouldProcessRemotely:1];

      int v46 = AXRuntimeCheck_MediaAnalysisSupport();
      v47 = [(VOTVisionEngine *)self engine];
      v48 = [v47 imageNode];
      v49 = v48;
      if (!v46)
      {
        v50 = v69;
        [v48 triggerWithImageAssetLocalIdentifier:v41 photoLibraryURL:v42 options:v69 cacheKey:v35 resultHandler:v36];
LABEL_40:

        self->_wasCachePurged = 0;
        id v7 = v73;
        goto LABEL_41;
      }
    }
    else
    {
      if (v75) {
        unsigned int v51 = 0;
      }
      else {
        unsigned int v51 = v37;
      }
      if (v51 != 1)
      {
        v57 = AXMediaLogService();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v35;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "AnalyzeElement[ScreenCap] for element: %@", buf, 0xCu);
        }

        v47 = [(VOTVisionEngine *)self engine];
        v49 = [v47 captureNode];
        v50 = v69;
        objc_msgSend(v49, "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:", v64, v69, v35, v36, v68, v67, v66, v65);
        goto LABEL_40;
      }
      v52 = [(VOTVisionEngine *)self engine];
      v53 = [v52 imageNode];
      [v53 setShouldProcessRemotely:1];

      v54 = AXMediaLogService();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v82 = v74;
        __int16 v83 = 2112;
        v84 = v41;
        __int16 v85 = 2112;
        v86 = v42;
        __int16 v87 = 2112;
        v88 = v35;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "AnalyzeElement[URL]: %@, localIdentifier: %@, photoLibraryURL: %@, element: %@", buf, 0x2Au);
      }

      if (!v41)
      {
        v47 = [(VOTVisionEngine *)self engine];
        v49 = [v47 imageNode];
        v50 = v69;
        [v49 triggerWithImageURL:v74 options:v69 cacheKey:v35 resultHandler:v36];
        goto LABEL_40;
      }
      int v55 = AXRuntimeCheck_MediaAnalysisSupport();
      v47 = [(VOTVisionEngine *)self engine];
      v56 = [v47 imageNode];
      v49 = v56;
      if (!v55)
      {
        v50 = v69;
        [v56 triggerWithImageURL:v74 assetLocalIdentifier:v41 photoLibraryURL:v42 options:v69 cacheKey:v35 resultHandler:v36];
        goto LABEL_40;
      }
    }
    v50 = v69;
    [v49 triggerWithImageAssetLocalIdentifier:v41 photoLibraryURL:v42 usePHAsset:1 options:v69 cacheKey:v35 resultHandler:v36];
    goto LABEL_40;
  }
LABEL_41:
}

- (id)resultsForElement:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(VOTVisionEngine *)self engine];
  id v7 = [v6 cache];
  id v8 = [v7 resultForKey:v4];

  if (v8) {
    [v5 addObject:v8];
  }

  return v5;
}

- (void)purgeCache
{
  id v3 = [(VOTVisionEngine *)self engine];
  id v4 = [v3 cache];
  [v4 purgeCache];

  self->_wasCachePurged = 1;
}

- (void)produceCaptionForElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init((Class)AXMVisionAnalysisOptions);
    [v8 setDetectCaptions:1];
    [v8 setClientID:1];
    double v9 = [v6 application];
    int64_t v10 = [(VOTVisionEngine *)self _interfaceOrientationForElement:v6];
    [v6 visibleFrame];
    objc_msgSend(v9, "convertAccessibilityFrameToScreenCoordinates:");
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = +[VOTElement systemWideElement];
    double v20 = [v19 elementForAttribute:1005];

    double v21 = [v20 windowContextIDs];
    [v8 setIgnoredLayerContextIDs:v21];
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v23 = v22;
    double v24 = AXMediaLogService();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "ProduceCaption[ScreenCap] for element: %@", buf, 0xCu);
    }

    double v25 = [(VOTVisionEngine *)self engine];
    double v26 = [v25 captureNode];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000FFCAC;
    v28[3] = &unk_1001B6E58;
    uint64_t v30 = v23;
    id v29 = v7;
    objc_msgSend(v26, "triggerWithScreenCaptureRegion:interfaceOrientation:options:cacheKey:resultHandler:", v10, v8, 0, v28, v12, v14, v16, v18);
  }
  else
  {
    double v27 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FFC20;
    block[3] = &unk_1001B6E30;
    id v32 = v7;
    dispatch_async(v27, block);

    id v8 = v32;
  }
}

- (BOOL)wasCachePurged
{
  return self->_wasCachePurged;
}

- (void)setWasCachePurged:(BOOL)a3
{
  self->_wasCachePurged = a3;
}

- (VOTVisionEngineResultUpdateDelegate)resultUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultUpdateDelegate);

  return (VOTVisionEngineResultUpdateDelegate *)WeakRetained;
}

- (void)setResultUpdateDelegate:(id)a3
{
}

- (AXMVoiceOverVisionEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_destroyWeak((id *)&self->_resultUpdateDelegate);

  objc_storeStrong(&self->_languageConfigurationObserver, 0);
}

@end