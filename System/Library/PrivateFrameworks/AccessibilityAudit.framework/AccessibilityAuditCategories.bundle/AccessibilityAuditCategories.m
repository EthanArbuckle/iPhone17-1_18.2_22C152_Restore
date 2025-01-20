void sub_3D14(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void v7[4];

  v1 = NSStringFromSelector("auditCheckApplicationsAuditIssues");
  v7[0] = v1;
  v2 = NSStringFromSelector("auditCheckElementsForMissingLabelAndUsingImageName");
  v7[1] = v2;
  v3 = NSStringFromSelector("auditCheckElementForRedundentText");
  v7[2] = v3;
  v4 = NSStringFromSelector("auditCheckHumanReadable");
  v7[3] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:4];
  v6 = (void *)qword_14DA8;
  qword_14DA8 = v5;
}

void sub_3E58(id a1)
{
  v4[0] = AXAuditTestTypeSufficientElementDescription;
  v4[1] = AXAuditTestTypeTrait;
  v4[2] = AXAuditTestTypeDynamicText;
  v4[3] = AXAuditTestTypeTextClipped;
  v1 = +[NSArray arrayWithObjects:v4 count:4];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_14DB8;
  qword_14DB8 = v2;
}

void sub_4B1C(uint64_t a1, void *a2)
{
  id v18 = a2;
  if ((uint64_t)[*(id *)(a1 + 32) _remainingElementsToAnalyze] >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_remainingElementsToAnalyze:", (char *)objc_msgSend(*(id *)(a1 + 32), "_remainingElementsToAnalyze") - 1);
    if ([v18 length])
    {
      v3 = +[AXAuditElement auditElementWithElement:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];
      v4 = *(void **)(a1 + 32);
      [v4 orientedFrameForElement:*(void *)(a1 + 40)];
      objc_msgSend(v4, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:", 5000, v3, *(void *)(a1 + 56), v18);
    }
    else
    {
      v5 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 88))
      {
        id v6 = [*(id *)(a1 + 64) issueClassification];
        v3 = [*(id *)(a1 + 64) auditElement];
        [*(id *)(a1 + 64) elementRect];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        uint64_t v15 = *(void *)(a1 + 56);
        v16 = [*(id *)(a1 + 64) longDescExtraInfo];
        v17 = [*(id *)(a1 + 64) elementText];
        objc_msgSend(v5, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", v6, v3, v15, 0, v16, v17, v8, v10, v12, v14);
      }
      else
      {
        v3 = +[AXAuditElement auditElementWithElement:*(void *)(a1 + 40) identifier:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) orientedFrameForElement:*(void *)(a1 + 40)];
        objc_msgSend(v5, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1000, v3, *(void *)(a1 + 56));
      }
    }

    [*(id *)(a1 + 32) _elementFinishedAnalyzingForAudit:*(void *)(a1 + 72) caseResult:*(void *)(a1 + 80)];
  }
}

void sub_5004(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 auditIssuesForOptions:*(void *)(a1 + 32)];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      double v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "count", (void)v13))
          {
            uint64_t v12 = AuditIssueFromServerAppDict(v11);

            double v8 = (void *)v12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_auditCheckElementForMissingLabel:withSelectorName:imageNameAuditIssue:caseResult:", v3, *(void *)(a1 + 48), v8, *(void *)(a1 + 56), (void)v13);
}

void sub_5450(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14 = a2;
  if ((a6 & ~a5) == 0)
  {
    id v32 = v14;
    id v15 = a8;
    id v16 = a4;
    id v17 = a3;
    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:v15 value:&stru_10BC0 table:@"Localizable"];

    v20 = [v19 length];
    v21 = [*(id *)(a1 + 32) elementDescriptionForElement:v32];
    v22 = [v32 uiElement];
    v23 = [v22 objectWithAXAttribute:5019];

    id v24 = [v17 rangeOfString:v19 options:1];
    v25 = [v17 length];

    if (v24 == (id)(v25 - v20))
    {
      v26 = *(void **)(a1 + 32);
      v27 = +[AXAuditElement auditElementWithElement:v32 identifier:v23];
      [*(id *)(a1 + 32) orientedFrameForElement:v32];
      objc_msgSend(v26, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1004, v27, v21);
    }
    id v28 = [v16 rangeOfString:v19 options:1];
    v29 = [v16 length];

    if (v28 == (id)(v29 - v20))
    {
      v30 = *(void **)(a1 + 32);
      v31 = +[AXAuditElement auditElementWithElement:v32 identifier:v23];
      [*(id *)(a1 + 32) orientedFrameForElement:v32];
      objc_msgSend(v30, "addIssueWithClassification:auditElement:elementRect:elementDescription:", 1005, v31, v21);
    }
    id v14 = v32;
  }
}

id sub_5874(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _auditCheckHumanReadableDescription:a2];
}

void sub_62F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v6 = v5 - *(double *)(a1 + 40);
    int v8 = 134217984;
    double v9 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AXAuditTextElementInfo: Image Node request took %.3fs to complete", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [v3 detectedFeatureDescriptionWithOptions:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6560(id a1)
{
  v1 = NSStringFromSelector("auditHitUISize");
  double v4 = v1;
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];
  id v3 = (void *)qword_14DC8;
  qword_14DC8 = v2;
}

void sub_6648(id a1)
{
  uint64_t v4 = AXAuditTestTypeHitRegion;
  v1 = +[NSArray arrayWithObjects:&v4 count:1];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_14DD8;
  qword_14DD8 = v2;
}

void sub_67D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isScannerElement])
  {
    [*(id *)(a1 + 32) orientedFrameForElement:v3];
    double v8 = v7;
    if (v5 < 20.0 || v6 < 20.0)
    {
      double v10 = v4;
      double v11 = v5;
      double v12 = v6;
      long long v13 = [v3 uiElement];
      id v14 = [v13 objectWithAXAttribute:5019];

      id v15 = [*(id *)(a1 + 32) elementDescriptionForElement:v3];
      id v16 = +[AXAuditElement auditElementWithElement:v3 identifier:v14];
      id v17 = +[NSBundle bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"currentsize.formatter" value:&stru_10BC0 table:@"Localizable"];
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, *(void *)&v11, *(void *)&v12);

      v20 = *(void **)(a1 + 32);
      v22 = v19;
      v21 = +[NSArray arrayWithObjects:&v22 count:1];
      objc_msgSend(v20, "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", 100, v16, v15, 0, v21, 0, v8, v10, v11, v12);
    }
  }
}

id AuditIssueFromServerAppDict(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKey:kAXAuditIssueTypeKey];
  id v3 = [v1 objectForKey:kAXAuditIssueElementDescKey];
  double v4 = [v1 objectForKey:kAXAuditIssueElementKey];
  double v5 = [v1 objectForKey:kAXAuditIssueAdditionalInfoKey];
  double v6 = [v1 objectForKey:kAXAuditIssueIdentifierKey];
  uint64_t v38 = [v1 objectForKey:kAXAuditIssueForegroundColorKey];
  double v7 = [v1 objectForKey:kAXAuditIssueBackgroundColorKey];
  v40 = [v1 objectForKey:kAXAuditIssueFontSizeKey];
  uint64_t v39 = [v1 objectForKey:kAXAuditIssueTextKey];
  cf = [v1 objectForKey:kAXAuditIssueElementRectKey];
  double v8 = +[AXAuditIssue auditIssueForClassification:](AXAuditIssue, "auditIssueForClassification:", [v2 integerValue]);
  v37 = v7;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v6;
      v35 = v5;
      double v9 = +[AXElement elementWithUIElement:v4];
      double v10 = [v4 objectWithAXAttribute:5019];
      double v11 = +[AXAuditElement auditElementWithElement:v9 identifier:v10];
      [v8 setAuditElement:v11];
      [v4 rectWithAXAttribute:2003];
      objc_msgSend(v8, "setElementRect:");
    }
    else
    {
      CFTypeID v12 = CFGetTypeID(v4);
      if (v12 != AXUIElementGetTypeID()) {
        goto LABEL_7;
      }
      v33 = v6;
      v35 = v5;
      double v9 = +[AXUIElement uiElementWithAXElement:v4];
      double v10 = [v9 objectWithAXAttribute:5019];
      double v11 = +[AXElement elementWithUIElement:v9];
      long long v13 = +[AXAuditElement auditElementWithElement:v11 identifier:v10];
      [v8 setAuditElement:v13];
      [v9 rectWithAXAttribute:2003];
      objc_msgSend(v8, "setElementRect:");
    }
    double v6 = v33;
    double v5 = v35;
    double v7 = v37;
  }
LABEL_7:
  [v8 setElementDescription:v3];
  id v14 = (void *)v39;
  id v15 = cf;
  if (v5)
  {
    id v16 = [v5 objectForKey:kAXAuditIssueUnsupportedFontSizesKey];
    if (v16)
    {
      v34 = v6;
      v36 = v5;
      v30 = v4;
      v31 = v3;
      id v32 = v2;
      id v17 = +[NSMutableArray array];
      id v18 = fontSizeSymbolMapping();
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v19 = v16;
      id v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v45;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = [v18 objectForKey:*(void *)(*((void *)&v44 + 1) + 8 * i)];
            [v17 addObject:v24];
          }
          id v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v21);
      }

      [v8 setLongDescExtraInfo:v17];
      id v3 = v31;
      uint64_t v2 = v32;
      double v4 = v30;
      double v6 = v34;
      double v5 = v36;
      id v14 = (void *)v39;
      id v15 = cf;
    }

    double v7 = v37;
  }
  if (v15)
  {
    CFTypeID v25 = CFGetTypeID(v15);
    if (v25 == AXValueGetTypeID())
    {
      long long valuePtr = 0u;
      long long v43 = 0u;
      AXValueGetValue(cf, kAXValueTypeCGRect, &valuePtr);
      objc_msgSend(v8, "setElementRect:", valuePtr, v43);
    }
  }
  v26 = (void *)v38;
  if ([v2 integerValue] == "undation.framework/CoreFoundation"
    || [v2 integerValue] == &stru_3D8.segname[7])
  {
    if ([v6 length])
    {
      v27 = [v8 elementDescription];
      if ([v27 length])
      {
        id v28 = [v27 stringByAppendingFormat:@" %@", v6];
        [v8 setElementDescription:v28];

        v26 = (void *)v38;
      }
      else
      {
        [v8 setElementDescription:v6];
      }

      id v14 = (void *)v39;
    }
    if ([v26 length]) {
      [v8 setForegroundColor:v26];
    }
    if ([v7 length]) {
      [v8 setBackgroundColor:v7];
    }
    if (v40)
    {
      [v40 doubleValue];
      objc_msgSend(v8, "setFontSize:");
    }
  }
  if ([v14 length]) {
    [v8 setElementText:v14];
  }

  return v8;
}

id fontSizeSymbolMapping()
{
  v3[0] = UIContentSizeCategoryExtraSmall;
  v3[1] = UIContentSizeCategorySmall;
  v4[0] = @"UIContentSizeCategoryExtraSmall";
  v4[1] = @"UIContentSizeCategorySmall";
  v3[2] = UIContentSizeCategoryMedium;
  v3[3] = UIContentSizeCategoryLarge;
  v4[2] = @"UIContentSizeCategoryMedium";
  v4[3] = @"UIContentSizeCategoryLarge";
  v3[4] = UIContentSizeCategoryExtraLarge;
  v3[5] = UIContentSizeCategoryExtraExtraLarge;
  void v4[4] = @"UIContentSizeCategoryExtraLarge";
  v4[5] = @"UIContentSizeCategoryExtraExtraLarge";
  v3[6] = UIContentSizeCategoryExtraExtraExtraLarge;
  v3[7] = UIContentSizeCategoryAccessibilityMedium;
  v4[6] = @"UIContentSizeCategoryExtraExtraExtraLarge";
  v4[7] = @"UIContentSizeCategoryAccessibilityMedium";
  v3[8] = UIContentSizeCategoryAccessibilityLarge;
  v3[9] = UIContentSizeCategoryAccessibilityExtraLarge;
  v4[8] = @"UIContentSizeCategoryAccessibilityLarge";
  v4[9] = @"UIContentSizeCategoryAccessibilityExtraLarge";
  v3[10] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v3[11] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  v4[10] = @"UIContentSizeCategoryAccessibilityExtraExtraLarge";
  v4[11] = @"UIContentSizeCategoryAccessibilityExtraExtraExtraLarge";
  v0 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
  id v1 = +[NSMutableDictionary dictionaryWithDictionary:v0];

  return v1;
}

BOOL AuditDoesAllowDeveloperAttributes(int pid)
{
  mach_port_name_t v2 = 0;
  return task_for_pid(mach_task_self_, pid, &v2) == 0;
}

id fontSizesToIgnore()
{
  if (qword_14DE8 != -1) {
    dispatch_once(&qword_14DE8, &stru_10758);
  }
  v0 = (void *)qword_14DF0;

  return v0;
}

void sub_718C(id a1)
{
  qword_14DF0 = +[NSSet setWithObjects:@"UIContentSizeCategoryExtraSmall", @"UIContentSizeCategorySmall", @"UIContentSizeCategoryMedium", 0];

  _objc_release_x1();
}

void sub_7248(id a1)
{
  id v1 = NSStringFromSelector("auditTextContrast");
  v5[0] = v1;
  mach_port_name_t v2 = NSStringFromSelector("auditInaccessibleElement");
  v5[1] = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:2];
  double v4 = (void *)qword_14DF8;
  qword_14DF8 = v3;
}

void sub_734C(id a1)
{
  v4[0] = AXAuditTestTypeContrast;
  v4[1] = AXAuditTestTypeElementDetection;
  id v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_14E08;
  qword_14E08 = v2;
}

void sub_7D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  _Block_object_dispose((const void *)(v57 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7DD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7DE0(uint64_t a1)
{
}

void sub_7DE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 visibleFrame];
  if (!CGRectIsEmpty(v5)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_7E44(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
  id v2 = objc_alloc((Class)AXMDisplayManager);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7F40;
  v9[3] = &unk_10808;
  dispatch_semaphore_t v10 = v1;
  id v3 = v1;
  id v4 = [v2 initWithCompletion:v9];
  CGRect v5 = (void *)qword_14E18;
  qword_14E18 = (uint64_t)v4;

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v3, v6);
  id v7 = [objc_alloc((Class)AXMAXElementVisionEngine) initWithIdentifier:@"axauditd-AXElementVision"];
  double v8 = (void *)qword_14E20;
  qword_14E20 = (uint64_t)v7;
}

intptr_t sub_7F40(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7F48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_AF3C((uint64_t)v5, (uint64_t)v6);
  }
  v64 = v6;
  v65 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) _processVisionResult:v5 options:*(void *)(a1 + 40) coagulator:*(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_t v10 = +[AXAuditScreenshotManager sharedManager];
  [v10 screenshotScaleFactorForTimestamp:*(void *)(a1 + 56)];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v11 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        id v16 = *(void **)(a1 + 32);
        objc_msgSend(v15, "frame", v63);
        objc_msgSend(v16, "_scaleRect:scale:");
        double v18 = v17;
        double v20 = v19;
        double v22 = *(double *)(a1 + 112) + v21;
        double v24 = v23 + *(double *)(a1 + 120);
        if (!CGRectIsEmpty(*(CGRect *)(a1 + 144)))
        {
          uint64_t v63 = 0x3FE0000000000000;
          if (AXMIsContainedBy())
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              continue;
            }
            v95.origin.x = v22;
            v95.origin.y = v24;
            v95.size.width = v18;
            v95.size.height = v20;
            NSStringFromRect(v95);
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v83 = "-[AXAuditCategoryVisual auditInaccessibleElement]_block_invoke";
            __int16 v84 = 2112;
            v85 = v15;
            __int16 v86 = 2112;
            id v87 = v25;
            _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: skipping because ML Element %@ with frame %@ overlaps with status bar", buf, 0x20u);
            goto LABEL_28;
          }
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "visibleFrame", v63);
        uint64_t v63 = 0x3FECCCCCCCCCCCCDLL;
        if ((AXMIsContainedBy() & 1) == 0)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            continue;
          }
          v98.origin.x = v22;
          v98.origin.y = v24;
          v98.size.width = v18;
          v98.size.height = v20;
          NSStringFromRect(v98);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          long long v45 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          objc_msgSend(v45, "visibleFrame", 0x3FECCCCCCCCCCCCDLL);
          long long v46 = NSStringFromRect(v99);
          *(_DWORD *)buf = 136316162;
          v83 = "-[AXAuditCategoryVisual auditInaccessibleElement]_block_invoke";
          __int16 v84 = 2112;
          v85 = v15;
          __int16 v86 = 2112;
          id v87 = v25;
          __int16 v88 = 2112;
          v89 = v45;
          __int16 v90 = 2112;
          v91 = v46;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: skipping because ML Element %@ with frame %@ is outside the frontmost app %@ with visible frame %@", buf, 0x34u);

          goto LABEL_28;
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v25 = *(id *)(a1 + 64);
        id v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v72, v81, 16, 0x3FECCCCCCCCCCCCDLL);
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v73;
LABEL_15:
          uint64_t v29 = 0;
          while (1)
          {
            if (*(void *)v73 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(a1 + 32) orientedFrameForElement:*(void *)(*((void *)&v72 + 1) + 8 * v29)];
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            CGFloat v37 = v36;
            AXMRectCenter();
            v93.x = v38;
            v93.y = v39;
            v96.origin.x = v31;
            v96.origin.y = v33;
            v96.size.width = v35;
            v96.size.height = v37;
            BOOL v40 = CGRectContainsPoint(v96, v93);
            AXMRectCenter();
            v94.x = v41;
            v94.y = v42;
            v97.origin.x = v22;
            v97.origin.y = v24;
            v97.size.width = v18;
            v97.size.height = v20;
            BOOL v43 = CGRectContainsPoint(v97, v94);
            if (v40 || v43) {
              break;
            }
            if (v27 == (id)++v29)
            {
              id v27 = [v25 countByEnumeratingWithState:&v72 objects:v81 count:16];
              if (v27) {
                goto LABEL_15;
              }
              goto LABEL_22;
            }
          }
LABEL_28:

          continue;
        }
LABEL_22:

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v100.origin.x = v22;
          v100.origin.y = v24;
          v100.size.width = v18;
          v100.size.height = v20;
          v58 = NSStringFromCGRect(v100);
          [v15 confidence];
          *(_DWORD *)buf = 136315906;
          v83 = "-[AXAuditCategoryVisual auditInaccessibleElement]_block_invoke";
          __int16 v84 = 2112;
          v85 = v15;
          __int16 v86 = 2112;
          id v87 = v58;
          __int16 v88 = 2048;
          v89 = v59;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Reporting the following feature as inaccessible: %@/frame:%@/Confidence:%f", buf, 0x2Au);
        }
        if ([v15 uiClass] == (char *)&dword_8 + 3)
        {
          long long v44 = [v15 value];
          BOOL v66 = v44 != 0;
        }
        else
        {
          BOOL v66 = 0;
        }
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v47 = [v15 subfeatures];
        id v48 = [v47 countByEnumeratingWithState:&v68 objects:v80 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v69;
          while (2)
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v69 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
              if ([v52 uiClass] == (char *)&dword_8 + 3)
              {
                uint64_t v53 = [v52 value];
                if (v53)
                {
                  v54 = (void *)v53;
                  [v52 confidence];
                  double v56 = v55;

                  if (v56 > 0.5)
                  {

                    goto LABEL_44;
                  }
                }
              }
            }
            id v49 = [v47 countByEnumeratingWithState:&v68 objects:v80 count:16];
            if (v49) {
              continue;
            }
            break;
          }
        }

        if (v66) {
LABEL_44:
        }
          uint64_t v57 = 1007;
        else {
          uint64_t v57 = 1006;
        }
        objc_msgSend(*(id *)(a1 + 32), "addIssueWithClassification:auditElement:elementRect:elementDescription:mlGeneratedDescription:longDescExtraInfo:elementText:", v57, 0, 0, 0, 0, 0, v22, v24, v18, v20);
      }
      id v12 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v12);
  }

  v60 = [*(id *)(a1 + 32) _mlAuditTimer];
  unsigned int v61 = [v60 isValid];

  if (v61) {
    [*(id *)(a1 + 32) caseEndedForSelectorName:*(void *)(a1 + 72) result:*(void *)(a1 + 80)];
  }
  v62 = objc_msgSend(*(id *)(a1 + 32), "_mlAuditTimer", v63);
  [v62 invalidate];

  objc_msgSend(*(id *)(a1 + 32), "set_mlAuditTimer:", 0);
}

__n128 sub_8680(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 104) = *(id *)(a2 + 104);
  __n128 result = *(__n128 *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(__n128 *)(a1 + 128) = result;
  return result;
}

void sub_86B8(uint64_t a1)
{
}

BOOL sub_A0FC(id a1, NSObject *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v4 = objc_opt_isKindOfClass();
  if (v2)
  {
    CFTypeID v5 = CFGetTypeID(v2);
    BOOL v6 = v5 == AXUIElementGetTypeID();
  }
  else
  {
    BOOL v6 = 0;
  }
  char v7 = v4 | v6;
  if (isKindOfClass) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }

  return v8 & 1;
}

AXAuditElement *__cdecl sub_A19C(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    BOOL v5 = v4 == AXUIElementGetTypeID();
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  id v7 = v2;
  if (v5)
  {
LABEL_7:
    if (!v7) {
      goto LABEL_13;
    }
LABEL_8:
    Data = (void *)_AXUIElementCreateData();
    if (Data && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = (id)objc_opt_new();
      [v7 setPlatformElementToken:Data];
    }
    else
    {
      id v7 = 0;
    }

    goto LABEL_13;
  }
  if (isKindOfClass)
  {
    id v7 = [v2 axElement];
    goto LABEL_7;
  }
  if ((v6 & 1) == 0)
  {
    id v7 = 0;
    goto LABEL_13;
  }
  dispatch_semaphore_t v10 = [v2 uiElement];
  id v7 = [v10 axElement];

  if (v7) {
    goto LABEL_8;
  }
LABEL_13:

  return (AXAuditElement *)v7;
}

BOOL sub_A38C(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 4);
}

BOOL isAXValueWithType(void *a1, int a2)
{
  id v3 = a1;
  CFTypeID v4 = v3;
  BOOL v6 = v3 && (v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == a2;

  return v6;
}

AXAuditRange *__cdecl sub_A404(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 4) && (v5 = 0, uint64_t v6 = 0, AXValueGetValue((AXValueRef)v2, kAXValueTypeCFRange, &v5)))
  {
    id v3 = +[AXAuditRange createWithRange:](AXAuditRange, "createWithRange:", v5, v6);
  }
  else
  {
    id v3 = 0;
  }

  return (AXAuditRange *)v3;
}

id sub_A48C(id a1, AXAuditRange *a2)
{
  v5[0] = [(AXAuditRange *)a2 range];
  v5[1] = v2;
  AXValueRef v3 = AXValueCreate(kAXValueTypeCFRange, v5);

  return v3;
}

BOOL sub_A588(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 2);
}

AXAuditSize *__cdecl sub_A594(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 2) && (v5 = 0.0, double v6 = 0.0, AXValueGetValue((AXValueRef)v2, kAXValueTypeCGSize, &v5)))
  {
    AXValueRef v3 = +[AXAuditSize createWithSize:](AXAuditSize, "createWithSize:", v5, v6);
  }
  else
  {
    AXValueRef v3 = 0;
  }

  return (AXAuditSize *)v3;
}

id sub_A61C(id a1, AXAuditSize *a2)
{
  [(AXAuditSize *)a2 size];
  v6[0] = v2;
  v6[1] = v3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGSize, v6);

  return v4;
}

BOOL sub_A718(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 1);
}

AXAuditPoint *__cdecl sub_A724(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 1) && (v5 = 0.0, double v6 = 0.0, AXValueGetValue((AXValueRef)v2, kAXValueTypeCGPoint, &v5)))
  {
    uint64_t v3 = +[AXAuditPoint createWithPoint:](AXAuditPoint, "createWithPoint:", v5, v6);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (AXAuditPoint *)v3;
}

id sub_A7AC(id a1, AXAuditPoint *a2)
{
  [(AXAuditPoint *)a2 point];
  v6[0] = v2;
  v6[1] = v3;
  AXValueRef v4 = AXValueCreate(kAXValueTypeCGPoint, v6);

  return v4;
}

BOOL sub_A8A8(id a1, NSObject *a2)
{
  return isAXValueWithType(a2, 3);
}

AXAuditRect *__cdecl sub_A8B4(id a1, id a2)
{
  id v2 = a2;
  if (isAXValueWithType(v2, 3) && (v5 = 0u, long long v6 = 0u, AXValueGetValue((AXValueRef)v2, kAXValueTypeCGRect, &v5)))
  {
    uint64_t v3 = +[AXAuditRect createWithRect:](AXAuditRect, "createWithRect:", v5, v6);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (AXAuditRect *)v3;
}

id sub_A944(id a1, AXAuditRect *a2)
{
  [(AXAuditRect *)a2 rect];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGRect, v8);

  return v6;
}

void sub_AECC(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[AXAuditCategoryVisual auditInaccessibleElement]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: using statusBarFrame %@", buf, 0x16u);
}

void sub_AF3C(uint64_t a1, uint64_t a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[AXAuditCategoryVisual auditInaccessibleElement]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Receieved remote handler reply %@/%@", (uint8_t *)&v2, 0x20u);
}

void sub_AFD8()
{
  int v0 = 136315138;
  dispatch_semaphore_t v1 = "-[AXAuditCategoryVisual _processVisionResult:options:coagulator:]";
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: No sorted features", (uint8_t *)&v0, 0xCu);
}

void sub_B060(double a1)
{
  int v1 = 136315394;
  int v2 = "-[AXAuditCategoryVisual _processVisionResult:options:coagulator:]";
  __int16 v3 = 2048;
  double v4 = CFAbsoluteTimeGetCurrent() - a1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: Time to Coagulate: %f", (uint8_t *)&v1, 0x16u);
}

void sub_B108()
{
  int v0 = 136315138;
  int v1 = "-[AXAuditCategoryVisual _processVisionResult:options:coagulator:]";
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: AXM_COAGULATION_ENABLED", (uint8_t *)&v0, 0xCu);
}

uint64_t AXAuditCurrentApplications()
{
  return _AXAuditCurrentApplications();
}

uint64_t AXAuditPidForElement()
{
  return _AXAuditPidForElement();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return _AXDeviceGetMainScreenBounds();
}

uint64_t AXMIsContainedBy()
{
  return _AXMIsContainedBy();
}

uint64_t AXMRectCenter()
{
  return _AXMRectCenter();
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  return _AXUIElementCopyAttributeValue(element, attribute, value);
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return _AXUIElementGetPid(element, pid);
}

CFTypeID AXUIElementGetTypeID(void)
{
  return _AXUIElementGetTypeID();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return _AXValueCreate(theType, valuePtr);
}

AXValueType AXValueGetType(AXValueRef value)
{
  return _AXValueGetType(value);
}

CFTypeID AXValueGetTypeID(void)
{
  return _AXValueGetTypeID();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return _AXValueGetValue(value, theType, valuePtr);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t _AXUIElementCreateData()
{
  return __AXUIElementCreateData();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UICreateScreenUIImageWithRotation()
{
  return __UICreateScreenUIImageWithRotation();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t iOSFrontmostApp()
{
  return _iOSFrontmostApp();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return _task_for_pid(target_tport, pid, t);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__engine(void *a1, const char *a2, ...)
{
  return [a1 _engine];
}

id objc_msgSend__mlAuditTimer(void *a1, const char *a2, ...)
{
  return [a1 _mlAuditTimer];
}

id objc_msgSend__registerAuditElementTransportInfo(void *a1, const char *a2, ...)
{
  return [a1 _registerAuditElementTransportInfo];
}

id objc_msgSend__registerPointTransportInfo(void *a1, const char *a2, ...)
{
  return [a1 _registerPointTransportInfo];
}

id objc_msgSend__registerRangeTransportInfo(void *a1, const char *a2, ...)
{
  return [a1 _registerRangeTransportInfo];
}

id objc_msgSend__registerRectTransportInfo(void *a1, const char *a2, ...)
{
  return [a1 _registerRectTransportInfo];
}

id objc_msgSend__registerSizeTransportInfo(void *a1, const char *a2, ...)
{
  return [a1 _registerSizeTransportInfo];
}

id objc_msgSend__remainingElementsToAnalyze(void *a1, const char *a2, ...)
{
  return [a1 _remainingElementsToAnalyze];
}

id objc_msgSend__topLevelAppElement(void *a1, const char *a2, ...)
{
  return [a1 _topLevelAppElement];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditElement(void *a1, const char *a2, ...)
{
  return [a1 auditElement];
}

id objc_msgSend_axAuditStringIsHumanReadable(void *a1, const char *a2, ...)
{
  return [a1 axAuditStringIsHumanReadable];
}

id objc_msgSend_axElement(void *a1, const char *a2, ...)
{
  return [a1 axElement];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_classification(void *a1, const char *a2, ...)
{
  return [a1 classification];
}

id objc_msgSend_compareColors(void *a1, const char *a2, ...)
{
  return [a1 compareColors];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_coreAnimationMainDisplay(void *a1, const char *a2, ...)
{
  return [a1 coreAnimationMainDisplay];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCaseResult(void *a1, const char *a2, ...)
{
  return [a1 currentCaseResult];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultOptions];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceDisplayBounds(void *a1, const char *a2, ...)
{
  return [a1 deviceDisplayBounds];
}

id objc_msgSend_deviceNativeDisplayScale(void *a1, const char *a2, ...)
{
  return [a1 deviceNativeDisplayScale];
}

id objc_msgSend_deviceRotatianInRadians(void *a1, const char *a2, ...)
{
  return [a1 deviceRotatianInRadians];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableCoagulator(void *a1, const char *a2, ...)
{
  return [a1 disableCoagulator];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elementDescription(void *a1, const char *a2, ...)
{
  return [a1 elementDescription];
}

id objc_msgSend_elementRect(void *a1, const char *a2, ...)
{
  return [a1 elementRect];
}

id objc_msgSend_elementRef(void *a1, const char *a2, ...)
{
  return [a1 elementRef];
}

id objc_msgSend_elementText(void *a1, const char *a2, ...)
{
  return [a1 elementText];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fontSize(void *a1, const char *a2, ...)
{
  return [a1 fontSize];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullRect(void *a1, const char *a2, ...)
{
  return [a1 fullRect];
}

id objc_msgSend_getScreenshotData(void *a1, const char *a2, ...)
{
  return [a1 getScreenshotData];
}

id objc_msgSend_iOSFrontmostAppForTargetPid(void *a1, const char *a2, ...)
{
  return [a1 iOSFrontmostAppForTargetPid];
}

id objc_msgSend_imageNode(void *a1, const char *a2, ...)
{
  return [a1 imageNode];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isRTL(void *a1, const char *a2, ...)
{
  return [a1 isRTL];
}

id objc_msgSend_isScannerElement(void *a1, const char *a2, ...)
{
  return [a1 isScannerElement];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_issueClassification(void *a1, const char *a2, ...)
{
  return [a1 issueClassification];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastTimestamp];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longDescExtraInfo(void *a1, const char *a2, ...)
{
  return [a1 longDescExtraInfo];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_nativeBounds(void *a1, const char *a2, ...)
{
  return [a1 nativeBounds];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_orientedScreenBounds(void *a1, const char *a2, ...)
{
  return [a1 orientedScreenBounds];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_prewarmEngine(void *a1, const char *a2, ...)
{
  return [a1 prewarmEngine];
}

id objc_msgSend_purgeCache(void *a1, const char *a2, ...)
{
  return [a1 purgeCache];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return [a1 rect];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_spinRunloop(void *a1, const char *a2, ...)
{
  return [a1 spinRunloop];
}

id objc_msgSend_springBoardApplication(void *a1, const char *a2, ...)
{
  return [a1 springBoardApplication];
}

id objc_msgSend_subfeatures(void *a1, const char *a2, ...)
{
  return [a1 subfeatures];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_systemWideAXUIElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideAXUIElement];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_targetPid(void *a1, const char *a2, ...)
{
  return [a1 targetPid];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_uiClass(void *a1, const char *a2, ...)
{
  return [a1 uiClass];
}

id objc_msgSend_uiElement(void *a1, const char *a2, ...)
{
  return [a1 uiElement];
}

id objc_msgSend_uiSystemWideApplication(void *a1, const char *a2, ...)
{
  return [a1 uiSystemWideApplication];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_visibleElements(void *a1, const char *a2, ...)
{
  return [a1 visibleElements];
}

id objc_msgSend_visibleFrame(void *a1, const char *a2, ...)
{
  return [a1 visibleFrame];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_windowContextInformation(void *a1, const char *a2, ...)
{
  return [a1 windowContextInformation];
}