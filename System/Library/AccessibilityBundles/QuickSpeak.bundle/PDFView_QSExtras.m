@interface PDFView_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilitySpeakTextSelectionViews;
- (void)_accessibilityQuickSpeakTextRectsWithRange:(_NSRange)a3 string:(id)a4 highlightRects:(id)a5 sentenceRects:(id)a6 singleTextRect:(CGRect *)a7;
- (void)_axConvertRange:(_NSRange)a3 toRects:(id)a4 operatingPage:(id)a5;
@end

@implementation PDFView_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"PDFView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFView", @"currentSelection", "@", 0);
  [v3 validateClass:@"PDFPageLayerSelectionEffect"];
  [v3 validateClass:@"PDFView" hasInstanceVariable:@"_private" withType:"PDFViewPrivate"];
  [v3 validateClass:@"PDFViewPrivate" hasInstanceVariable:@"scrollView" withType:"PDFScrollView"];
  [v3 validateClass:@"PDFScrollView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PDFScrollView", @"pdfDocumentView", "@", 0);
}

- (id)_accessibilitySpeakTextSelectionViews
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [(PDFView_QSExtras *)self safeValueForKey:@"_private"];
  id v3 = [v2 safeValueForKey:@"scrollView"];

  objc_opt_class();
  v4 = [v3 safeValueForKey:@"pdfDocumentView"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [MEMORY[0x263EFF980] array];
  v7 = [v5 layer];
  v8 = [v7 sublayers];
  [v6 axSafelyAddObjectsFromArray:v8];

  if ([v6 count])
  {
    while (1)
    {
      v9 = [v6 objectAtIndex:0];
      NSClassFromString(&cfstr_Pdfpagelayerse.isa);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      v10 = [v9 sublayers];
      [v6 axSafelyAddObjectsFromArray:v10];

      [v6 removeObjectAtIndex:0];
      if (![v6 count]) {
        goto LABEL_4;
      }
    }
    v13[0] = v9;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
LABEL_4:
    v11 = 0;
  }

  return v11;
}

- (void)_axConvertRange:(_NSRange)a3 toRects:(id)a4 operatingPage:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v10, "selectionForRange:", location, length);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = [v11 selectionsByLine];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v15) boundsForPage:v10];
        -[PDFView_QSExtras convertRect:fromPage:](self, "convertRect:fromPage:", v10);
        v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:");
        [v9 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)_accessibilityQuickSpeakTextRectsWithRange:(_NSRange)a3 string:(id)a4 highlightRects:(id)a5 sentenceRects:(id)a6 singleTextRect:(CGRect *)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [MEMORY[0x263F213D8] sharedInstance];
  char v16 = [v15 ignoreLogging];

  if ((v16 & 1) == 0)
  {
    long long v17 = [MEMORY[0x263F213D8] identifier];
    long long v18 = AXLoggerForFacility();

    os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = v12;
      v21 = AXColorizeFormatLog();
      NSUInteger v49 = location;
      NSUInteger v51 = length;
      uint64_t v22 = _AXStringForArgs();
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138543362;
        v55 = v22;
        _os_log_impl(&dword_240270000, v18, v19, "%{public}@", buf, 0xCu);
      }

      id v12 = v20;
    }
  }
  buf[0] = 0;
  v23 = [(PDFView_QSExtras *)self safeValueForKey:@"currentSelection", v49, v51];
  v24 = __UIAccessibilitySafeClass();

  if (buf[0]) {
    abort();
  }
  v25 = [v24 string];
  if (location + length <= [v25 length])
  {
    v52 = [v24 pages];
    v26 = [v52 firstObject];
    uint64_t v27 = [v24 indexOfFirstCharacterOnPage:v26];
    id v28 = v13;
    uint64_t v29 = v27;
    NSUInteger v30 = v27 + location;
    NSUInteger v31 = length;
    v32 = v28;
    -[PDFView_QSExtras _axConvertRange:toRects:operatingPage:](self, "_axConvertRange:toRects:operatingPage:", v27 + location, v31);
    id v53 = v12;
    uint64_t v33 = objc_msgSend(v12, "ax_sentenceFromPosition:inDirection:", location, v30 != 0);
    -[PDFView_QSExtras _axConvertRange:toRects:operatingPage:](self, "_axConvertRange:toRects:operatingPage:", v33 + v29, v34, v14, v26);
    v35 = [MEMORY[0x263F213D8] sharedInstance];
    char v36 = [v35 ignoreLogging];

    if ((v36 & 1) == 0)
    {
      v37 = [MEMORY[0x263F213D8] identifier];
      v38 = AXLoggerForFacility();

      os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = AXColorizeFormatLog();
        v50 = v32;
        v41 = _AXStringForArgs();
        if (os_log_type_enabled(v38, v39))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v41;
          _os_log_impl(&dword_240270000, v38, v39, "%{public}@", buf, 0xCu);
        }
      }
    }
    v42 = objc_msgSend(MEMORY[0x263F213D8], "sharedInstance", v50);
    char v43 = [v42 ignoreLogging];

    id v13 = v32;
    if ((v43 & 1) == 0)
    {
      v44 = [MEMORY[0x263F213D8] identifier];
      v45 = AXLoggerForFacility();

      os_log_type_t v46 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = AXColorizeFormatLog();
        v48 = _AXStringForArgs();
        if (os_log_type_enabled(v45, v46))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v48;
          _os_log_impl(&dword_240270000, v45, v46, "%{public}@", buf, 0xCu);
        }
      }
    }

    id v12 = v53;
  }
}

- (id)_accessibilityQuickSpeakContent
{
  v2 = [(PDFView_QSExtras *)self safeValueForKey:@"currentSelection"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 string];

  return v4;
}

@end