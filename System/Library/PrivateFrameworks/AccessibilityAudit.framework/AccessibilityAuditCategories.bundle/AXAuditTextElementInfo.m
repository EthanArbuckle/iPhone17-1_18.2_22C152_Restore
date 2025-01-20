@interface AXAuditTextElementInfo
- (AXAuditTextElementInfo)init;
- (AXMIconVisionEngine)_engine;
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (CGRect)_convertAccessibilityFrameToScreenCoordinates:(CGRect)a3 forElement:(id)a4;
- (NSTimer)_mlAuditTimer;
- (id)_applicationElementForElement:(id)a3;
- (id)_elementsForElement:(id)a3 attribute:(int64_t)a4 withParameter:(id)a5;
- (id)_elementsFromElement:(id)a3 direction:(int64_t)a4 withCount:(unint64_t)a5;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (id)navigationElementForElement:(id)a3 inDirection:(int64_t)a4;
- (id)nextElementForElement:(id)a3;
- (id)previousElementForElement:(id)a3;
- (id)swipeOrderForElement:(id)a3 inDirection:(int64_t)a4 includeElement:(BOOL)a5;
- (int64_t)_remainingElementsToAnalyze;
- (void)_auditCheckElementForMissingLabel:(id)a3 withSelectorName:(id)a4 imageNameAuditIssue:(id)a5 caseResult:(id)a6;
- (void)_auditCheckHumanReadableDescription:(id)a3;
- (void)_elementFinishedAnalyzingForAudit:(id)a3 caseResult:(id)a4;
- (void)_generateDescriptionForElement:(id)a3 withCompletion:(id)a4;
- (void)_getAuditIssuesForElement:(id)a3;
- (void)_mlAuditTimedOut;
- (void)auditCheckApplicationsAuditIssues;
- (void)auditCheckElementForRedundentText;
- (void)auditCheckElementsForMissingLabelAndUsingImageName;
- (void)auditCheckHitTest;
- (void)auditCheckHumanReadable;
- (void)purgeCache;
- (void)set_engine:(id)a3;
- (void)set_mlAuditTimer:(id)a3;
- (void)set_remainingElementsToAnalyze:(int64_t)a3;
@end

@implementation AXAuditTextElementInfo

- (AXAuditTextElementInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditTextElementInfo;
  v2 = [(AXAuditTextElementInfo *)&v7 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)AXMIconVisionEngine) initWithIdentifier:@"AXMVisionEngineTestForInspector"];
    [(AXAuditTextElementInfo *)v2 set_engine:v3];

    v4 = [(AXAuditTextElementInfo *)v2 _engine];
    [v4 setMaximumQueueSize:10];

    v5 = [(AXAuditTextElementInfo *)v2 _engine];
    [v5 prewarmEngine];
  }
  return v2;
}

- (id)caseSelectorsForAuditing
{
  if (qword_14DB0 != -1) {
    dispatch_once(&qword_14DB0, &stru_10610);
  }
  v2 = (void *)qword_14DA8;

  return v2;
}

- (id)allSupportedAuditTypes
{
  if (qword_14DC0 != -1) {
    dispatch_once(&qword_14DC0, &stru_10630);
  }
  v2 = (void *)qword_14DB8;

  return v2;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return (a3 & 5) != 0;
}

- (void)_getAuditIssuesForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeDynamicText];
  id v6 = [(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeTextClipped];
  id v7 = [(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeTrait];
  id v8 = v7;
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || v7)
  {
    v100 = self;
    v9 = +[AXAuditPreferenceController sharedController];
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 spinRunloop]);

    uint64_t v124 = AXAuditDynamicTextSupportTest;
    uint64_t v11 = AXAuditShouldRunTestOption;
    v122[0] = AXAuditShouldRunTestOption;
    v12 = +[NSNumber numberWithBool:v5];
    v122[1] = AXAuditSpinRunLoopOption;
    v123[0] = v12;
    v123[1] = v10;
    v13 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
    v125 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];

    uint64_t v120 = AXAuditClippingTest;
    uint64_t v118 = v11;
    v15 = +[NSNumber numberWithBool:v6];
    v119 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
    v121 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];

    uint64_t v116 = AXAuditMissingTraitNotEnabledTest;
    uint64_t v114 = v11;
    v18 = +[NSNumber numberWithBool:v8];
    v115 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
    v117 = v19;
    v20 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];

    v21 = +[NSMutableDictionary dictionary];
    [v21 addEntriesFromDictionary:v14];
    [v21 addEntriesFromDictionary:v17];
    [v21 addEntriesFromDictionary:v20];
    v22 = [v4 auditIssuesForOptions:v21];
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v94 = v21;
        v95 = v20;
        v96 = v17;
        v97 = v14;
        v98 = v10;
        id v99 = v4;
        long long v103 = 0u;
        long long v104 = 0u;
        memset(&aRect[1], 0, 32);
        v93 = v22;
        id obj = v22;
        id v23 = [obj countByEnumeratingWithState:&aRect[1] objects:v113 count:16];
        v24 = self;
        if (!v23) {
          goto LABEL_28;
        }
        id v25 = v23;
        uint64_t v26 = *(void *)aRect[3];
        while (1)
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)aRect[3] != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(aRect[2] + 8 * i);
            if (objc_msgSend(v28, "count", v92))
            {
              v29 = AuditIssueFromServerAppDict(v28);
              [v29 elementRect];
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              CGFloat v35 = v34;
              CGFloat v37 = v36;
              [(AXAuditCategoryEmbedded *)v24 orientedScreenBounds];
              CGFloat v39 = v38;
              CGFloat v41 = v40;
              CGFloat v43 = v42;
              CGFloat v45 = v44;
              v126.origin.x = v31;
              v126.origin.y = v33;
              v126.size.width = v35;
              v126.size.height = v37;
              if (CGRectIsEmpty(v126)
                || (v127.origin.x = v39,
                    v127.origin.y = v41,
                    v127.size.width = v43,
                    v127.size.height = v45,
                    CGRectIsEmpty(v127))
                || (uint64_t v92 = 0x3FE6666666666666, (AXMIsContainedBy() & 1) != 0))
              {
                v46 = objc_msgSend(v29, "auditElement", v92);
                v47 = [v46 axElement];
                v48 = [v47 uiElement];
                [v48 rectWithAXAttribute:2003];
                aRect[0] = v49;
                CGFloat v51 = v50;
                double v53 = v52;
                double v55 = v54;

                v56 = [v29 auditElement];
                v57 = [v56 axElement];
                v58 = [v57 uiElement];
                [v58 rectWithAXAttribute:2057];
                CGFloat v60 = v59;
                CGFloat v62 = v61;
                double v64 = v63;
                double v66 = v65;

                if (v64 * v66 / (v53 * v55) <= 0.5)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                  {
                    v84 = [v29 auditElement];
                    v85 = [v84 axElement];
                    *(void *)&v128.origin.x = aRect[0];
                    v128.origin.y = v51;
                    v128.size.width = v53;
                    v128.size.height = v55;
                    v86 = NSStringFromRect(v128);
                    v129.origin.x = v60;
                    v129.origin.y = v62;
                    v129.size.width = v64;
                    v129.size.height = v66;
                    v87 = NSStringFromRect(v129);
                    *(_DWORD *)buf = 136315906;
                    v106 = "-[AXAuditTextElementInfo _getAuditIssuesForElement:]";
                    __int16 v107 = 2112;
                    v108 = v85;
                    __int16 v109 = 2112;
                    v110 = v86;
                    __int16 v111 = 2112;
                    v112 = v87;
                    _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: skipping because AXElement %@ with frame %@ has a visible frame %@ that is less than 50 percent visible", buf, 0x2Au);
                  }
                }
                else
                {
                  if ([v29 issueClassification] != "work/FrontBoardServices") {
                    goto LABEL_19;
                  }
                  v67 = fontSizesToIgnore();
                  v68 = [v29 longDescExtraInfo];
                  v69 = +[NSMutableSet setWithArray:v68];

                  [v69 minusSet:v67];
                  if ([v69 count])
                  {
                    v70 = [v69 allObjects];
                    [v29 setLongDescExtraInfo:v70];

LABEL_19:
                    v71 = [v29 auditElement];
                    v67 = [v71 axElement];

                    v69 = [(AXAuditCategoryEmbedded *)v24 elementDescriptionForElement:v67];
                    id v72 = [v29 issueClassification];
                    v73 = [v29 auditElement];
                    [v29 elementRect];
                    double v75 = v74;
                    double v77 = v76;
                    double v79 = v78;
                    double v81 = v80;
                    v82 = [v29 longDescExtraInfo];
                    v83 = [v29 elementText];
                    -[AXAuditTextElementInfo addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:](v100, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", v72, v73, v69, 0, v82, v83, v75, v77, v79, v81);

                    v24 = v100;
                  }
                }
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                v88 = objc_msgSend(v29, "auditElement", 0x3FE6666666666666);
                v89 = [v88 axElement];
                v130.origin.x = v31;
                v130.origin.y = v33;
                v130.size.width = v35;
                v130.size.height = v37;
                v90 = NSStringFromRect(v130);
                v131.origin.x = v39;
                v131.origin.y = v41;
                v131.size.width = v43;
                v131.size.height = v45;
                v91 = NSStringFromRect(v131);
                *(_DWORD *)buf = 136315906;
                v106 = "-[AXAuditTextElementInfo _getAuditIssuesForElement:]";
                __int16 v107 = 2112;
                v108 = v89;
                __int16 v109 = 2112;
                v110 = v90;
                __int16 v111 = 2112;
                v112 = v91;
                _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: skipping because AXElement %@ with frame %@ is less than 70 percent contained by screen bounds %@", buf, 0x2Au);
              }
              continue;
            }
          }
          id v25 = [obj countByEnumeratingWithState:&aRect[1] objects:v113 count:16];
          if (!v25)
          {
LABEL_28:

            v10 = v98;
            id v4 = v99;
            v17 = v96;
            v14 = v97;
            v21 = v94;
            v20 = v95;
            v22 = v93;
            break;
          }
        }
      }
    }
  }
}

- (void)auditCheckApplicationsAuditIssues
{
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(AXAuditTextElementInfo *)self caseStartedForSelectorName:v5];
  id v4 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
  [(AXAuditTextElementInfo *)self _getAuditIssuesForElement:v4];
  [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v5 result:v3];
}

- (void)_auditCheckElementForMissingLabel:(id)a3 withSelectorName:(id)a4 imageNameAuditIssue:(id)a5 caseResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeSufficientElementDescription])
  {
    v14 = [v10 label];
    if ([v14 length])
    {
      BOOL v15 = 0;
    }
    else
    {
      v16 = [v10 value];
      BOOL v15 = [v16 length] == 0;
    }
    if (v12 || v15)
    {
      unint64_t v17 = (unint64_t)[v10 traits];
      if ((kAXBackButtonTrait & ~v17) != 0)
      {
        v28 = [(AXAuditCategoryEmbedded *)self elementDescriptionForElement:v10];
        v18 = [v10 uiElement];
        v19 = [v18 objectWithAXAttribute:5019];

        [(AXAuditTextElementInfo *)self set_remainingElementsToAnalyze:(char *)[(AXAuditTextElementInfo *)self _remainingElementsToAnalyze] + 1];
        uint64_t v20 = [(AXAuditTextElementInfo *)self _mlAuditTimer];
        if (!v20
          || (v21 = (void *)v20,
              [(AXAuditTextElementInfo *)self _mlAuditTimer],
              v22 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v23 = [v22 isValid],
              v22,
              v21,
              (v23 & 1) == 0))
        {
          v37[0] = @"selectorName";
          v37[1] = @"caseResult";
          v38[0] = v11;
          v38[1] = v13;
          v24 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
          id v25 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_mlAuditTimedOut" selector:v24 userInfo:0 repeats:10.0];
          [(AXAuditTextElementInfo *)self set_mlAuditTimer:v25];
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_4B1C;
        v29[3] = &unk_10658;
        v29[4] = self;
        id v30 = v10;
        id v31 = v19;
        id v32 = v28;
        BOOL v36 = v12 != 0;
        id v33 = v12;
        id v34 = v11;
        id v35 = v13;
        id v26 = v28;
        id v27 = v19;
        [(AXAuditTextElementInfo *)self _generateDescriptionForElement:v30 withCompletion:v29];
      }
    }
  }
}

- (void)_elementFinishedAnalyzingForAudit:(id)a3 caseResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXAuditTextElementInfo *)self _remainingElementsToAnalyze] <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      id v10 = "-[AXAuditTextElementInfo _elementFinishedAnalyzingForAudit:caseResult:]";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: no more remaining elements! ending case for selector: %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [(AXAuditTextElementInfo *)self _mlAuditTimer];
    [v8 invalidate];

    [(AXAuditTextElementInfo *)self set_mlAuditTimer:0];
    [(AXAuditTextElementInfo *)self set_remainingElementsToAnalyze:0];
    [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v6 result:v7];
  }
}

- (void)auditCheckElementsForMissingLabelAndUsingImageName
{
  id v3 = NSStringFromSelector(a2);
  id v4 = [(AXAuditTextElementInfo *)self caseStartedForSelectorName:v3];
  if ([(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeSufficientElementDescription])
  {
    [(AXAuditTextElementInfo *)self set_remainingElementsToAnalyze:0];
    uint64_t v18 = AXAuditElementLabelUsesImageNameTest;
    uint64_t v16 = AXAuditShouldRunTestOption;
    unint64_t v17 = &__kCFBooleanTrue;
    id v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    id v7 = +[NSMutableDictionary dictionary];
    [v7 addEntriesFromDictionary:v6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_5004;
    v11[3] = &unk_10680;
    id v12 = v7;
    id v13 = self;
    id v8 = v3;
    id v14 = v8;
    id v9 = v4;
    id v15 = v9;
    id v10 = v7;
    [(AXAuditCategoryEmbedded *)self testOnAllVisibleElements:v11];
    [(AXAuditTextElementInfo *)self _elementFinishedAnalyzingForAudit:v8 caseResult:v9];
  }
  else
  {
    [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v3 result:v4];
  }
}

- (void)auditCheckElementForRedundentText
{
  id v3 = NSStringFromSelector(a2);
  id v4 = [(AXAuditTextElementInfo *)self caseStartedForSelectorName:v3];
  if ([(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeTrait])
  {
    uint64_t v20 = v4;
    v21 = v3;
    id v5 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_5450;
    v28[3] = &unk_106A8;
    v19 = self;
    v28[4] = self;
    id v6 = objc_retainBlock(v28);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = v5;
    id obj = [v5 visibleElements];
    id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v23 = *(void *)v25;
      uint64_t v9 = kAXButtonTrait;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v23) {
            objc_enumerationMutation(obj);
          }
          __int16 v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v12 = [v11 label];
          id v13 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          id v14 = [v12 stringByTrimmingCharactersInSet:v13];

          id v15 = [v11 value];
          uint64_t v16 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          unint64_t v17 = [v15 stringByTrimmingCharactersInSet:v16];

          ((void (*)(void *, void *, void *, void *, id, uint64_t, const __CFString *, const __CFString *))v6[2])(v6, v11, v14, v17, [v11 traits], v9, @"UIAccessibilityTraitButton", @"trait.button");
        }
        id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    id v4 = v20;
    id v3 = v21;
    [(AXAuditTextElementInfo *)v19 caseEndedForSelectorName:v21 result:v20];
  }
  else
  {
    [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v3 result:v4];
  }
}

- (void)_auditCheckHumanReadableDescription:(id)a3
{
  id v11 = a3;
  id v4 = [v11 label];
  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  id v7 = [v11 uiElement];
  id v8 = [v7 objectWithAXAttribute:5019];

  if ([v6 length] && (objc_msgSend(v6, "axAuditStringIsHumanReadable") & 1) == 0)
  {
    uint64_t v9 = [(AXAuditCategoryEmbedded *)self elementDescriptionForElement:v11];
    id v10 = +[AXAuditElement auditElementWithElement:v11 identifier:v8];
    [(AXAuditCategoryEmbedded *)self orientedFrameForElement:v11];
    -[AXAuditTextElementInfo addIssueWithClassification:auditElement:elementRect:elementDescription:](self, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1002, v10, v9);
  }
}

- (void)auditCheckHumanReadable
{
  id v3 = NSStringFromSelector(a2);
  id v4 = [(AXAuditTextElementInfo *)self caseStartedForSelectorName:v3];
  if ([(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeSufficientElementDescription])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_5874;
    v5[3] = &unk_106D0;
    v5[4] = self;
    [(AXAuditCategoryEmbedded *)self testOnAllVisibleElements:v5];
  }
  [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v3 result:v4];
}

- (void)auditCheckHitTest
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(AXAuditTextElementInfo *)self caseStartedForSelectorName:v4];
  [(AXAuditTextElementInfo *)self shouldRunAuditTestType:AXAuditTestTypeSwipeOrder];
  [(AXAuditTextElementInfo *)self caseEndedForSelectorName:v4 result:v3];
}

- (id)_elementsFromElement:(id)a3 direction:(int64_t)a4 withCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [v7 uiElement];
  uint64_t v9 = v8;
  if (a4 == 1) {
    [v8 nextElementsWithCount:a5];
  }
  else {
  id v10 = [v8 previousElementsWithCount:a5];
  }

  id v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
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
        unint64_t v17 = +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)_elementsForElement:(id)a3 attribute:(int64_t)a4 withParameter:(id)a5
{
  id v7 = a5;
  id v8 = [a3 uiElement];
  uint64_t v9 = [v8 uiElementsWithAttribute:a4 parameter:v7];

  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        if (a3) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)navigationElementForElement:(id)a3 inDirection:(int64_t)a4
{
  id v4 = [(AXAuditTextElementInfo *)self _elementsFromElement:a3 direction:a4 withCount:1];
  id v5 = [v4 lastObject];

  return v5;
}

- (id)nextElementForElement:(id)a3
{
  return [(AXAuditTextElementInfo *)self navigationElementForElement:a3 inDirection:1];
}

- (id)previousElementForElement:(id)a3
{
  return [(AXAuditTextElementInfo *)self navigationElementForElement:a3 inDirection:2];
}

- (id)swipeOrderForElement:(id)a3 inDirection:(int64_t)a4 includeElement:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[NSMutableArray array];
  id v10 = v9;
  if (v8 && v5)
  {
    [v9 addObject:v8];
    id v11 = v8;
  }
  else if (!v8)
  {
    goto LABEL_9;
  }
  uint64_t v12 = [(AXAuditTextElementInfo *)self navigationElementForElement:v8 inDirection:a4];
  id v13 = v8;
  if (v12)
  {
    uint64_t v14 = v8;
    do
    {
      id v13 = (void *)v12;
      [v10 addObject:v12];

      uint64_t v12 = [(AXAuditTextElementInfo *)self navigationElementForElement:v13 inDirection:a4];
      uint64_t v14 = v13;
    }
    while (v12);
  }

LABEL_9:

  return v10;
}

- (void)_mlAuditTimedOut
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AXAuditTextElementInfo: ML-generated description timed out!", v10, 2u);
  }
  id v3 = [(AXAuditTextElementInfo *)self _mlAuditTimer];
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:@"selectorName"];

  id v6 = [(AXAuditTextElementInfo *)self _mlAuditTimer];
  id v7 = [v6 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"caseResult"];

  uint64_t v9 = [(AXAuditTextElementInfo *)self _mlAuditTimer];
  [v9 invalidate];

  [(AXAuditTextElementInfo *)self set_mlAuditTimer:0];
  [(AXAuditTextElementInfo *)self set_remainingElementsToAnalyze:0];
  if ([v5 length]) {
    [(AXAuditTextElementInfo *)self _elementFinishedAnalyzingForAudit:v5 caseResult:v8];
  }
}

- (id)_applicationElementForElement:(id)a3
{
  return [a3 elementForAttribute:2017];
}

- (CGRect)_convertAccessibilityFrameToScreenCoordinates:(CGRect)a3 forElement:(id)a4
{
  CGRect valuePtr = a3;
  id v4 = a4;
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
  id v6 = +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", +[AXUIElement systemWideAXUIElement]);
  id v7 = [v4 uiElement];

  id v8 = [v7 numberWithAXAttribute:2021];
  uint64_t v9 = (const __AXValue *)objc_msgSend(v6, "objectWithAXAttribute:parameter:", 91505, +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v8, 0));

  if (v5) {
    CFRelease(v5);
  }
  if (v9) {
    AXValueGetValue(v9, kAXValueTypeCGRect, &valuePtr);
  }
  CGFloat width = valuePtr.size.width;
  CGFloat height = valuePtr.size.height;
  CGFloat x = valuePtr.origin.x;
  CGFloat y = valuePtr.origin.y;

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_generateDescriptionForElement:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSDate timeIntervalSinceReferenceDate];
  if (v6
    && (uint64_t v9 = v8,
        +[AXAuditScreenshotManager sharedManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 lastTimestamp],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    [v6 visibleFrame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v38 = [(AXAuditTextElementInfo *)self _applicationElementForElement:v6];
    -[AXAuditTextElementInfo _convertAccessibilityFrameToScreenCoordinates:forElement:](self, "_convertAccessibilityFrameToScreenCoordinates:forElement:", v13, v15, v17, v19);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = +[AXAuditScreenshotManager sharedManager];
    CGFloat v37 = [v28 lastTimestamp];
    objc_msgSend(v28, "screenshotImageForTimestamp:inRect:", v21, v23, v25, v27);
    v29 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v30 = UIImagePNGRepresentation(v29);
    id v31 = [objc_alloc((Class)CIImage) initWithData:v30];
    id v32 = objc_alloc_init((Class)AXMVisionAnalysisOptions);
    [v32 setDetectIconClass:1];
    id v33 = [(AXAuditTextElementInfo *)self _engine];
    id v34 = [v33 imageNode];
    [v34 setShouldProcessRemotely:0];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CGFloat v43 = v30;
      __int16 v44 = 2112;
      id v45 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AXAuditTextElementInfo: analyzing image data: %@, element: %@", buf, 0x16u);
    }
    id v35 = [(AXAuditTextElementInfo *)self _engine];
    BOOL v36 = [v35 imageNode];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_62F4;
    v39[3] = &unk_106F8;
    uint64_t v41 = v9;
    id v40 = v7;
    [v36 triggerWithImage:v31 options:v32 cacheKey:v30 resultHandler:v39];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)purgeCache
{
  id v3 = [(AXAuditTextElementInfo *)self _engine];
  v2 = [v3 cache];
  [v2 purgeCache];
}

- (int64_t)_remainingElementsToAnalyze
{
  return self->__remainingElementsToAnalyze;
}

- (void)set_remainingElementsToAnalyze:(int64_t)a3
{
  self->__remainingElementsToAnalyze = a3;
}

- (AXMIconVisionEngine)_engine
{
  return self->__engine;
}

- (void)set_engine:(id)a3
{
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
  objc_storeStrong((id *)&self->__mlAuditTimer, 0);

  objc_storeStrong((id *)&self->__engine, 0);
}

@end