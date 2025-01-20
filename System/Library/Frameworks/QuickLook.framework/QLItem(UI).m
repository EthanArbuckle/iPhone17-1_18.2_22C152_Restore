@interface QLItem(UI)
+ (uint64_t)openInTypeForItem:()UI appIsContentManaged:;
+ (uint64_t)shouldUseRemoteCollection:()UI;
- (BOOL)canBePrintedWithCustomPrinter;
- (__CFString)previewItemViewControllerClassNameForType:()UI;
- (double)imageRawSizeOfContents:()UI withPreviewItemType:imageIsAnimated:;
- (double)preferredContentSizeForOrbPlatterWithURL:()UI;
- (double)previewSizeForItemViewControllerSize:()UI;
- (id)previewItemPrintingViewControllerClassName;
- (id)transformerClass;
- (uint64_t)defaultWhitePointAdaptivityStyle;
- (uint64_t)previewItemViewControllerClassName;
- (uint64_t)shouldUseRemoteViewController;
@end

@implementation QLItem(UI)

- (id)transformerClass
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([a1 generatedPreviewItemType]) {
    uint64_t v2 = [a1 generatedPreviewItemType];
  }
  else {
    uint64_t v2 = [a1 previewItemType];
  }
  switch(v2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v5 = objc_opt_class();
      break;
    default:
      v3 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        v7 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        v3 = *v7;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = v3;
        int v8 = 134217984;
        uint64_t v9 = [a1 previewItemType];
        _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Unhandled item type %lu #PreviewItem", (uint8_t *)&v8, 0xCu);
      }
      v5 = 0;
      break;
  }

  return v5;
}

- (id)previewItemPrintingViewControllerClassName
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 previewItemType];
  if (v2 != 6 && v2 != 4)
  {
    v3 = (NSObject **)MEMORY[0x263F62940];
    v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = a1;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Unknown preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem", (uint8_t *)&v8, 0xCu);
    }
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);

  return v6;
}

- (uint64_t)previewItemViewControllerClassName
{
  if ([a1 generatedPreviewItemType]) {
    uint64_t v2 = [a1 generatedPreviewItemType];
  }
  else {
    uint64_t v2 = [a1 previewItemType];
  }

  return [a1 previewItemViewControllerClassNameForType:v2];
}

- (__CFString)previewItemViewControllerClassNameForType:()UI
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = @"QLPDFItemViewController";
  switch(a3)
  {
    case 1:
      v7 = [a1 UTIAnalyzer];
      [v7 isAudioOnly];

      goto LABEL_20;
    case 2:
      if (([a1 canBeEdited] & 1) == 0 && !objc_msgSend(a1, "editingMode")) {
        goto LABEL_20;
      }
      v4 = @"QLImageItemAggregatedViewController";
      goto LABEL_21;
    case 3:
    case 4:
    case 5:
    case 7:
    case 12:
    case 13:
    case 14:
      goto LABEL_20;
    case 6:
      v4 = @"QLWebItemAggregatedViewController";
      goto LABEL_21;
    case 8:
      v4 = @"QLVCFItemViewController";
      goto LABEL_21;
    case 9:
      v4 = @"QLICSItemViewController";
      goto LABEL_21;
    case 10:
      v4 = @"QLZipItemViewController";
      goto LABEL_21;
    case 11:
      goto LABEL_21;
    case 15:
      v5 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        v11 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        v5 = *v11;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v12 = 138412290;
      v13 = a1;
      v6 = "Unsupported preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem";
      goto LABEL_15;
    default:
      v5 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        uint64_t v10 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        v5 = *v10;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      int v12 = 138412290;
      v13 = a1;
      v6 = "Unknown preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem";
LABEL_15:
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v12, 0xCu);
LABEL_20:
      int v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:
      return v4;
  }
}

- (double)imageRawSizeOfContents:()UI withPreviewItemType:imageIsAnimated:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a1 previewItemType] == 3)
      {
        gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v9);
        v11 = (void *)[objc_alloc(*(Class *)(v10 + 4016)) initWithBundleAtURL:v7];
        int v12 = [v11 imagePath];

        if (v12)
        {
          v13 = NSURL;
          uint64_t v14 = [v11 imagePath];
          CFURLRef v15 = [v13 fileURLWithPath:v14];
        }
        else
        {
          v22 = (NSObject **)MEMORY[0x263F62940];
          v23 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            v23 = *v22;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)valuePtr = 138412290;
            *(void *)&valuePtr[4] = v7;
            _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_INFO, "Could not generate a PFVideoComplement from the given url: %@ #PreviewItem", valuePtr, 0xCu);
          }
          CFURLRef v15 = 0;
        }

        if (!v15) {
          goto LABEL_28;
        }
      }
      else
      {
        CFURLRef v15 = (const __CFURL *)v7;
        if (!v15)
        {
LABEL_28:
          v24 = (NSObject **)MEMORY[0x263F62940];
          v25 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            v25 = *v24;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)valuePtr = 0;
            _os_log_impl(&dword_217F61000, v25, OS_LOG_TYPE_INFO, "Returning a CGSizeZero size for imageRawSizeOfContents:withPreviewItemType: because no URL could be used to determine the size of the preview item. #PreviewItem", valuePtr, 2u);
          }
          goto LABEL_32;
        }
      }
      int v8 = CGImageSourceCreateWithURL(v15, 0);

      if (v8) {
        goto LABEL_10;
      }
    }
LABEL_32:
    double v21 = *MEMORY[0x263F001B0];
    goto LABEL_33;
  }
  int v8 = CGImageSourceCreateWithData((CFDataRef)v7, 0);
  if (!v8) {
    goto LABEL_32;
  }
LABEL_10:
  if (a5) {
    *a5 = CGImageSourceGetCount(v8) > 1;
  }
  uint64_t v28 = 0;
  *(void *)valuePtr = 0;
  CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
  CFRelease(v8);
  if (v16)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x263F0F4F8]);
    if (Value) {
      CFNumberGetValue(Value, kCFNumberCGFloatType, valuePtr);
    }
    CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x263F0F4F0]);
    if (v18) {
      CFNumberGetValue(v18, kCFNumberCGFloatType, &v28);
    }
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x263F0F4C8]);
    if (v19)
    {
      int v27 = 0;
      CFNumberGetValue(v19, kCFNumberIntType, &v27);
      if (v27 >= 5)
      {
        uint64_t v20 = v28;
        uint64_t v28 = *(void *)valuePtr;
        *(void *)valuePtr = v20;
      }
    }
    CFRelease(v16);
    double v21 = *(double *)valuePtr;
  }
  else
  {
    double v21 = 0.0;
  }
LABEL_33:

  return v21;
}

- (double)previewSizeForItemViewControllerSize:()UI
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v6 = [a1 fetcher];
  id v7 = [v6 fetchedContent];

  if (!v7) {
    goto LABEL_35;
  }
  if ([a1 previewItemType] != 2 && objc_msgSend(a1, "previewItemType") != 3)
  {
    if ([a1 previewItemType] == 1)
    {
      CFNumberRef v18 = [a1 UTIAnalyzer];
      if ([v18 isAudioOnly])
      {
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v27 = objc_alloc(MEMORY[0x263EFA8D0]);
          uint64_t v34 = *MEMORY[0x263EFA2A8];
          v35 = &unk_26C913120;
          uint64_t v28 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          v29 = (void *)[v27 initWithURL:v7 options:v28];

          objc_msgSend(v29, "ql_imageSizeOfFirstVideoTrack");
          QLAdaptSizeToRect();
          double v10 = v30;

          goto LABEL_36;
        }
      }
    }
LABEL_35:
    double v10 = *MEMORY[0x263F001B0];
    goto LABEL_36;
  }
  char v33 = 0;
  objc_msgSend(a1, "imageRawSizeOfContents:withPreviewItemType:imageIsAnimated:", v7, objc_msgSend(a1, "previewItemType"), &v33);
  double v10 = *MEMORY[0x263F001B0];
  if (v8 == *MEMORY[0x263F001B0] && v9 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v17 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      v32 = (NSObject **)MEMORY[0x263F62940];
      QLSInitLogging();
      v17 = *v32;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = a1;
      __int16 v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_217F61000, v17, OS_LOG_TYPE_INFO, "Could not determine preview size of contents %@ %@ #PreviewItem", buf, 0x16u);
    }
  }
  else
  {
    double v12 = v8;
    double v13 = v9;
    uint64_t v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    double v16 = v15;

    if (QLImageWithSizeShouldNotBeScaled())
    {
      double v10 = v12 / v16;
    }
    else
    {
      if (v33) {
        QLGetScaleForAnimatedImageWithSize();
      }
      else {
        double v19 = 1.0;
      }
      double v10 = v12 / v19;
      double v20 = v13 / v19;
      if (v12 / v19 > a2 || v20 > a3)
      {
        QLAdaptSizeToRect();
        double v10 = v22;
        double v20 = v23;
      }
      if ((![a1 canBeEdited] || v33) && v10 < a2 * 0.75 && v20 < a3 * 0.75)
      {
        QLAdaptSizeToRect();
        double v10 = v25;
      }
    }
  }
LABEL_36:

  return v10;
}

- (uint64_t)shouldUseRemoteViewController
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 previewItemContentType];
  uint64_t v3 = 0;
  switch([a1 previewItemType])
  {
    case 1:
    case 5:
      uint64_t v3 = [MEMORY[0x263F62998] shouldBeRemoteForMediaContentType:v2];
      break;
    case 2:
      if ([a1 canBeEdited]) {
        goto LABEL_2;
      }
      uint64_t v3 = [a1 editingMode] != 0;
      break;
    case 3:
    case 7:
    case 12:
    case 14:
      break;
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
LABEL_2:
      uint64_t v3 = 1;
      break;
    default:
      v4 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        id v7 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        v4 = *v7;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        int v8 = 134218242;
        uint64_t v9 = [a1 previewItemType];
        __int16 v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Unhandled item type %lu: contentType is: %@ #PreviewItem", (uint8_t *)&v8, 0x16u);
      }
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

+ (uint64_t)shouldUseRemoteCollection:()UI
{
  id v3 = a3;
  if ([v3 numberOfItems])
  {
    unint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v9 = 0;
      __int16 v10 = &v9;
      uint64_t v11 = 0x3032000000;
      uint64_t v12 = __Block_byref_object_copy__5;
      double v13 = __Block_byref_object_dispose__5;
      id v14 = 0;
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __40__QLItem_UI__shouldUseRemoteCollection___block_invoke;
      v8[3] = &unk_2642F5520;
      v8[4] = &v9;
      [v3 previewItemAtIndex:v4 withCompletionHandler:v8];
      uint64_t v6 = [(id)v10[5] shouldUseRemoteViewController];
      _Block_object_dispose(&v9, 8);

      if (v6) {
        break;
      }
      ++v4;
    }
    while ([v3 numberOfItems] > v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)canBePrintedWithCustomPrinter
{
  return ([a1 previewItemType] & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

+ (uint64_t)openInTypeForItem:()UI appIsContentManaged:
{
  id v3 = a3;
  unint64_t v4 = _QLGetOpenInAppClaimBindingForItem(v3);
  if (v4)
  {
    uint64_t v5 = [v3 editedCopy];

    if (v5) {
      goto LABEL_3;
    }
    id v7 = [v3 fpItem];

    if (v7
      || ([v3 previewItemURL], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
      && ([v3 previewItemURL],
          __int16 v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 _QLNeedsCoordination],
          v10,
          v11))
    {
      uint64_t v6 = 1;
    }
    else
    {
LABEL_3:
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)defaultWhitePointAdaptivityStyle
{
  uint64_t v2 = [a1 previewItemType];
  if ((unint64_t)(v2 - 2) < 2) {
    return 2;
  }
  if (v2 == 4) {
    return 1;
  }
  if (v2 != 1) {
    return 0;
  }
  id v3 = [a1 UTIAnalyzer];
  if ([v3 isAudioOnly]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3;
  }

  return v4;
}

- (double)preferredContentSizeForOrbPlatterWithURL:()UI
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 previewItemType] == 2 || objc_msgSend(a1, "previewItemType") == 3)
  {
    objc_msgSend(a1, "imageRawSizeOfContents:withPreviewItemType:imageIsAnimated:", v4, objc_msgSend(a1, "previewItemType"), 0);
    double v6 = v5;
  }
  else if ([a1 previewItemType] == 1 {
         && ([a1 UTIAnalyzer],
  }
             id v7 = objc_claimAutoreleasedReturnValue(),
             char v8 = [v7 isAudioOnly],
             v7,
             (v8 & 1) == 0))
  {
    id v9 = objc_alloc(MEMORY[0x263EFA8D0]);
    uint64_t v14 = *MEMORY[0x263EFA2A8];
    v15[0] = &unk_26C913120;
    __int16 v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    int v11 = (void *)[v9 initWithURL:v4 options:v10];

    objc_msgSend(v11, "ql_imageSizeOfFirstVideoTrack");
    double v6 = v12;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
  }

  return v6;
}

@end