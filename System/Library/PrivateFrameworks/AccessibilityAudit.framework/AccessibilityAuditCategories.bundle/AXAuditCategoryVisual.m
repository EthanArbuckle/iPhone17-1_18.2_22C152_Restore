@interface AXAuditCategoryVisual
- (BOOL)_doesContainsTextForTraits:(unint64_t)a3;
- (BOOL)_isFailureContrastIssueType:(int64_t)a3;
- (BOOL)_mayContainTextForTraits:(unint64_t)a3;
- (BOOL)hasTextInRegionOfAuditIssue:(id)a3;
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (CGRect)_scaleRect:(CGRect)a3 scale:(double)a4;
- (NSTimer)_mlAuditTimer;
- (id)_auditGetScreenshotImageDataForFrame:(CGRect)a3;
- (id)_processVisionResult:(id)a3 options:(id)a4 coagulator:(id)a5;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (int64_t)_interfaceOrientationForElement:(id)a3;
- (void)_auditRunContrastDetectionForAuditIssue:(id)a3;
- (void)_mlAuditTimedOut;
- (void)auditInaccessibleElement;
- (void)auditTextContrast;
- (void)set_mlAuditTimer:(id)a3;
@end

@implementation AXAuditCategoryVisual

- (id)caseSelectorsForAuditing
{
  if (qword_14E00 != -1) {
    dispatch_once(&qword_14E00, &stru_10778);
  }
  v2 = (void *)qword_14DF8;

  return v2;
}

- (id)allSupportedAuditTypes
{
  if (qword_14E10 != -1) {
    dispatch_once(&qword_14E10, &stru_10798);
  }
  v2 = (void *)qword_14E08;

  return v2;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return (a3 & 6) != 0;
}

- (void)auditInaccessibleElement
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AXAuditCategoryVisual auditInaccessibleElement]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: started", (uint8_t *)&buf, 0xCu);
  }
  v4 = NSStringFromSelector(a2);
  v78 = [(AXAuditCategoryVisual *)self caseStartedForSelectorName:v4];
  uint64_t v5 = AXAuditTestTypeElementDetection;
  if (([(AXAuditCategoryVisual *)self shouldRunAuditTestType:AXAuditTestTypeElementDetection] & 1) == 0)goto LABEL_33; {
  v6 = +[AXAuditScreenshotManager sharedManager];
  }
  v7 = [v6 lastTimestamp];
  if (!v7)
  {

    goto LABEL_33;
  }
  unsigned __int8 v8 = [(AXAuditCategoryVisual *)self shouldRunAuditTestType:v5];

  if ((v8 & 1) == 0)
  {
LABEL_33:
    [(AXAuditCategoryVisual *)self caseEndedForSelectorName:v4 result:v78];
    goto LABEL_34;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v109 = 0x3032000000;
  v110 = sub_7DD0;
  v111 = sub_7DE0;
  id v112 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
  v77 = [*(id *)(*((void *)&buf + 1) + 40) uiElement];
  v9 = +[NSMutableArray array];
  v10 = [*(id *)(*((void *)&buf + 1) + 40) elementsForAttribute:2095];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_7DE8;
  v102[3] = &unk_107C0;
  id v71 = v9;
  id v103 = v71;
  [v10 enumerateObjectsUsingBlock:v102];

  if (qword_14E28 != -1) {
    dispatch_once(&qword_14E28, &stru_107E0);
  }
  v11 = [(id)qword_14E18 coreAnimationMainDisplay];
  [v11 scale];
  double v13 = v12;

  v14 = [(id)qword_14E20 imageNode];
  [v14 setShouldProcessRemotely:0];

  v15 = +[AXMVisionScreenRecognitionOptions defaultOptions];
  [v15 setDetectAXElements:1];
  [v15 setDetectText:0];
  objc_msgSend(v15, "setIsRTL:", objc_msgSend(v77, "BOOLWithAXAttribute:", 3026));
  objc_msgSend(v15, "setOrientation:", -[AXAuditCategoryVisual _interfaceOrientationForElement:](self, "_interfaceOrientationForElement:", v77));
  memset(v101, 0, sizeof(v101));
  [(AXAuditCategoryEmbedded *)self windowContextInformation];
  objc_msgSend(v15, "setFullRect:", *(double *)&v101[8], *(_OWORD *)&v101[16], *(double *)&v101[32]);
  [v15 setIncludedLayerContextIDs:*(void *)v101];
  [v15 setPreserveInputImageSize:1];
  v16 = +[AXMLElementCoagulation sharedInstance];
  [v15 fullRect];
  objc_msgSend(v16, "setAppFrame:");
  objc_msgSend(v16, "setAppOrientation:", objc_msgSend(v15, "orientation"));
  [v16 setScreenScale:v13];
  objc_msgSend(v16, "setIsRTL:", objc_msgSend(v15, "isRTL"));
  v69 = v16;
  v17 = +[AXAuditScreenshotManager sharedManager];
  [v17 lastTimestamp];
  v68 = v66 = v17;
  v76 = [v17 screenshotImageForTimestamp:v68];
  v67 = v15;
  id v74 = [objc_alloc((Class)CIImage) initWithImage:v76];
  v18 = +[AXElement systemWideElement];
  v19 = [v18 springBoardApplication];
  v75 = [v19 uiElement];

  [v75 arrayWithAXAttribute:3054];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [v20 countByEnumeratingWithState:&v97 objects:v107 count:16];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  if (v21)
  {
    uint64_t v26 = *(void *)v98;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v98 != v26) {
          objc_enumerationMutation(v20);
        }
        v28 = +[AXUIElement uiElementWithAXElement:*(void *)(*((void *)&v97 + 1) + 8 * (void)v27)];
        [v28 rectWithAXAttribute:2057];
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        unsigned int v37 = [v28 BOOLWithAXAttribute:2025];
        unsigned int v38 = [v28 BOOLWithAXAttribute:2016];
        v113.origin.double x = v30;
        v113.origin.double y = v32;
        v113.size.double width = v34;
        v113.size.double height = v36;
        if (!CGRectIsEmpty(v113) && v37 && v38 != 0)
        {
          double v40 = x;
          double v41 = y;
          double v42 = width;
          double v43 = height;
          if (CGRectIsEmpty(*(CGRect *)&v40))
          {
            double height = v36;
            double width = v34;
            double y = v32;
            double x = v30;
          }
          else
          {
            v114.origin.double x = x;
            v114.origin.double y = y;
            v114.size.double width = width;
            v114.size.double height = height;
            v117.origin.double x = v30;
            v117.origin.double y = v32;
            v117.size.double width = v34;
            v117.size.double height = v36;
            CGRect v115 = CGRectUnion(v114, v117);
            double x = v115.origin.x;
            double y = v115.origin.y;
            double width = v115.size.width;
            double height = v115.size.height;
          }
        }

        v27 = (char *)v27 + 1;
      }
      while (v21 != v27);
      id v44 = [v20 countByEnumeratingWithState:&v97 objects:v107 count:16];
      id v21 = v44;
    }
    while (v44);
  }

  -[AXAuditCategoryEmbedded orientedFrameForRect:](self, "orientedFrameForRect:", x, y, width, height);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  id v53 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v116.origin.double x = v46;
    v116.origin.double y = v48;
    v116.size.double width = v50;
    v116.size.double height = v52;
    v54 = NSStringFromRect(v116);
    sub_AECC(v54, v106);
  }

  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3032000000;
  v95[3] = sub_7DD0;
  v95[4] = sub_7DE0;
  id v96 = 0;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3254779904;
  v79[2] = sub_7F48;
  v79[3] = &unk_10830;
  v86 = v95;
  v79[4] = self;
  id v80 = v67;
  id v70 = v69;
  id v81 = v70;
  id v73 = v68;
  id v82 = v73;
  id v55 = *(id *)v101;
  id v56 = v80;
  long long v89 = *(_OWORD *)&v101[8];
  long long v90 = *(_OWORD *)&v101[24];
  CGFloat v91 = v46;
  CGFloat v92 = v48;
  CGFloat v93 = v50;
  CGFloat v94 = v52;
  p_long long buf = &buf;
  id v88 = v55;
  id v72 = v71;
  id v83 = v72;
  id v57 = v4;
  id v84 = v57;
  id v58 = v78;
  id v85 = v58;
  v59 = objc_retainBlock(v79);
  v60 = [(AXAuditCategoryVisual *)self _mlAuditTimer];
  if (!v60
    || ([(AXAuditCategoryVisual *)self _mlAuditTimer],
        v61 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v62 = [v61 isValid],
        v61,
        v60,
        (v62 & 1) == 0))
  {
    v104[0] = @"selectorName";
    v104[1] = @"caseResult";
    v105[0] = v57;
    v105[1] = v58;
    v63 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
    v64 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_mlAuditTimedOut" selector:v63 userInfo:0 repeats:10.0];
    [(AXAuditCategoryVisual *)self set_mlAuditTimer:v64];
  }
  v65 = [(id)qword_14E20 imageNode];
  [v65 triggerWithImage:v74 options:v56 cacheKey:0 resultHandler:v59];

  _Block_object_dispose(v95, 8);
  _Block_object_dispose(&buf, 8);

LABEL_34:
}

- (void)_mlAuditTimedOut
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[AXAuditCategoryVisual _mlAuditTimedOut]";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: ML-generated description timed out!", (uint8_t *)&v10, 0xCu);
  }
  v3 = [(AXAuditCategoryVisual *)self _mlAuditTimer];
  v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"selectorName"];

  v6 = [(AXAuditCategoryVisual *)self _mlAuditTimer];
  v7 = [v6 userInfo];
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"caseResult"];

  v9 = [(AXAuditCategoryVisual *)self _mlAuditTimer];
  [v9 invalidate];

  [(AXAuditCategoryVisual *)self set_mlAuditTimer:0];
  if ([v5 length])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[AXAuditCategoryVisual _mlAuditTimedOut]";
      __int16 v12 = 2112;
      double v13 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Ending case for selector: %@", (uint8_t *)&v10, 0x16u);
    }
    [(AXAuditCategoryVisual *)self caseEndedForSelectorName:v5 result:v8];
  }
}

- (CGRect)_scaleRect:(CGRect)a3 scale:(double)a4
{
  double v4 = a3.origin.x * a4;
  double v5 = a3.origin.y * a4;
  double v6 = a3.size.width * a4;
  double v7 = a3.size.height * a4;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)_processVisionResult:(id)a3 options:(id)a4 coagulator:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v24 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v26 = v7;
  unsigned __int8 v8 = [v7 features];
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v12);
          *(_DWORD *)long long buf = 136315394;
          unsigned int v37 = "-[AXAuditCategoryVisual _processVisionResult:options:coagulator:]";
          __int16 v38 = 2112;
          uint64_t v39 = v13;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Feature results: %@", buf, 0x16u);
        }
        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v10);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_B108();
  }
  if ([v25 disableCoagulator])
  {
    v14 = [v26 features];
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v16 = [v26 features];
    v14 = [v24 coagulateElements:v16];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_B060(Current);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      id v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v21);
          *(_DWORD *)long long buf = 136315394;
          unsigned int v37 = "-[AXAuditCategoryVisual _processVisionResult:options:coagulator:]";
          __int16 v38 = 2112;
          uint64_t v39 = v22;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Sorted results: %@", buf, 0x16u);
        }
        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  if (![v17 count] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_AFD8();
  }

  return v17;
}

- (int64_t)_interfaceOrientationForElement:(id)a3
{
  int64_t result = (int64_t)objc_msgSend((id)objc_opt_class(), "axDeviceOrientationForInterfaceOrientation:", -[AXAuditCategoryEmbedded interfaceOrientation](self, "interfaceOrientation"));
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (void)auditTextContrast
{
  v3 = NSStringFromSelector(a2);
  double v4 = [(AXAuditCategoryVisual *)self caseStartedForSelectorName:v3];
  if ((-[AXAuditCategoryVisual shouldRunAuditTestType:](self, "shouldRunAuditTestType:", AXAuditTestTypeContrast) & 1) != 0&& (+[AXAuditScreenshotManager sharedManager](AXAuditScreenshotManager, "sharedManager"), double v5 = objc_claimAutoreleasedReturnValue(), [v5 lastTimestamp], v6 = objc_claimAutoreleasedReturnValue(), v6, v5, v6))
  {
    uint64_t v26 = AXAuditContrastDetectionTest;
    uint64_t v24 = AXAuditShouldRunTestOption;
    id v25 = &__kCFBooleanTrue;
    id v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    long long v27 = v7;
    unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    id v9 = +[NSMutableArray array];
    id v10 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
    uint64_t v11 = [v10 auditIssuesForOptions:v8];
    [v9 addObjectsFromArray:v11];

    if ([v9 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v17, "count", (void)v19))
            {
              id v18 = AuditIssueFromServerAppDict(v17);
              if ([v18 issueClassification] == "undation.framework/CoreFoundation") {
                [(AXAuditCategoryVisual *)self _auditRunContrastDetectionForAuditIssue:v18];
              }
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
    -[AXAuditCategoryVisual caseEndedForSelectorName:result:](self, "caseEndedForSelectorName:result:", v3, v4, (void)v19);
  }
  else
  {
    [(AXAuditCategoryVisual *)self caseEndedForSelectorName:v3 result:v4];
  }
}

- (BOOL)hasTextInRegionOfAuditIssue:(id)a3
{
  id v4 = a3;
  double v5 = [v4 auditElement];
  double v6 = [v5 axElement];

  if (-[AXAuditCategoryVisual _doesContainsTextForTraits:](self, "_doesContainsTextForTraits:", [v6 traits]))
  {
    char v7 = 1;
  }
  else
  {
    [v4 elementRect];
    unsigned __int8 v8 = -[AXAuditCategoryVisual _auditGetScreenshotImageDataForFrame:](self, "_auditGetScreenshotImageDataForFrame:");
    id v9 = +[AXAuditImageDetectionManager sharedManager];
    id v10 = [v9 detectionResultsFromImageData:v8];

    char v7 = [v10 count] != 0;
  }

  return v7;
}

- (id)_auditGetScreenshotImageDataForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v7 = +[AXAuditScreenshotManager sharedManager];
  unsigned __int8 v8 = [v7 lastTimestamp];
  objc_msgSend(v7, "screenshotImageForTimestamp:inRect:", v8, x, y, width, height);
  id v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  id v10 = UIImagePNGRepresentation(v9);

  return v10;
}

- (void)_auditRunContrastDetectionForAuditIssue:(id)a3
{
  id v4 = a3;
  double v5 = +[AXAuditContrastDetectionManager sharedManager];
  id v6 = objc_alloc_init((Class)AXAuditContrastInput);
  char v7 = [v4 auditElement];
  unsigned __int8 v8 = [v7 axElement];

  [v4 elementRect];
  id v9 = -[AXAuditCategoryVisual _auditGetScreenshotImageDataForFrame:](self, "_auditGetScreenshotImageDataForFrame:");
  [v6 setImageData:v9];
  [v6 setEnhanced:0];
  id v10 = [v4 foregroundColor];
  if (v10) {
    [v6 setForegroundHexColorValue:v10];
  }
  uint64_t v11 = [v4 backgroundColor];
  if (v11) {
    [v6 setBackgroundHexColorValue:v11];
  }
  [v4 fontSize];
  if (v12 > 0.0) {
    objc_msgSend(v6, "setFontSize:");
  }
  id v13 = [v4 elementDescription];
  [v6 setIdentifier:v13];

  id v14 = [v5 contrastResultForInput:v6];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = [v14 classification];
    if ([(AXAuditCategoryVisual *)self _isFailureContrastIssueType:v16])
    {
      long long v29 = v9;
      long long v30 = v8;
      id v17 = [(AXAuditCategoryEmbedded *)self elementDescriptionForElement:v8];
      id v18 = +[AXAuditIssue auditIssueForClassification:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = v5;
        long long v19 = [v4 auditElement];
        [v18 setAuditElement:v19];

        long long v27 = v17;
        [v18 setElementDescription:v17];
        [v4 elementRect];
        objc_msgSend(v18, "setElementRect:");
        long long v20 = [v15 summary];
        long long v31 = v20;
        long long v21 = +[NSArray arrayWithObjects:&v31 count:1];
        [v18 setLongDescExtraInfo:v21];

        [v15 fontSize];
        objc_msgSend(v18, "setFontSize:");
        long long v22 = [v15 compareColors];
        if ([v22 count] == (char *)&dword_0 + 2)
        {
          v23 = [v22 objectAtIndexedSubscript:0];
          [v18 setForegroundColor:v23];

          uint64_t v24 = [v22 objectAtIndexedSubscript:1];
          [v18 setBackgroundColor:v24];
        }
        id v25 = [(AXAuditCategoryVisual *)self currentCaseResult];
        [v25 addAuditIssue:v18];
        uint64_t v26 = [(AXAuditCategoryVisual *)self delegate];
        [v26 auditCategory:self didEncounterIssue:v18];

        id v17 = v27;
        double v5 = v28;
      }

      id v9 = v29;
      unsigned __int8 v8 = v30;
    }
  }
}

- (BOOL)_doesContainsTextForTraits:(unint64_t)a3
{
  return (kAXStaticTextTrait & ~a3) == 0
      || (kAXKeyboardKeyTrait & ~a3) == 0
      || (kAXTextEntryTrait & ~a3) == 0
      || (kAXHeaderTrait & ~a3) == 0
      || (kAXFooterTrait & ~a3) == 0
      || (kAXTextAreaTrait & ~a3) == 0
      || (kAXBookContentTrait & ~a3) == 0
      || (kAXMenuItemTrait & ~a3) == 0
      || (kAXAutoCorrectCandidateTrait & ~a3) == 0
      || (kAXMathEquationTrait & ~a3) == 0;
}

- (BOOL)_mayContainTextForTraits:(unint64_t)a3
{
  return (kAXButtonTrait & ~a3) == 0
      || (kAXImageTrait & ~a3) == 0
      || (kAXLinkTrait & ~a3) == 0
      || (kAXLaunchIconTrait & ~a3) == 0
      || (kAXFolderIconTrait & ~a3) == 0
      || (kAXStatusBarElementTrait & ~a3) == 0
      || (kAXPopupButtonTrait & ~a3) == 0
      || (kAXTabButtonTrait & ~a3) == 0;
}

- (BOOL)_isFailureContrastIssueType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x1B000u >> a3);
}

- (NSTimer)_mlAuditTimer
{
  return self->__mlAuditTimer;
}

- (void)set_mlAuditTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end