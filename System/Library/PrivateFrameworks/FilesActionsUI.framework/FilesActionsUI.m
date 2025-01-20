void FAUIInitLogging()
{
  if (FAUIInitLogging_once != -1) {
    dispatch_once(&FAUIInitLogging_once, &__block_literal_global);
  }
}

uint64_t __FAUIInitLogging_block_invoke()
{
  fauiLogHandle = (uint64_t)os_log_create("com.apple.FilesActionsUI", "FilesActionsUI");
  return MEMORY[0x270F9A758]();
}

id FAUICreateTempFileURLInTemporaryDirectory(void *a1)
{
  v1 = NSString;
  v2 = (void *)MEMORY[0x263F08C38];
  id v3 = a1;
  v4 = [v2 UUID];
  v5 = [v4 UUIDString];
  v6 = [v1 stringWithFormat:@"temp_%@", v5];
  v7 = [v3 URLByAppendingPathComponent:v6];

  return v7;
}

id FAUICreateTemporaryFolderURLAppropriateForURL(void *a1)
{
  v1 = (void *)MEMORY[0x263F08850];
  id v2 = a1;
  id v3 = [v1 defaultManager];
  id v8 = 0;
  v4 = [v3 URLForDirectory:99 inDomain:1 appropriateForURL:v2 create:1 error:&v8];

  id v5 = v8;
  if (!v4)
  {
    v6 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      if (FAUIInitLogging_once != -1) {
        dispatch_once(&FAUIInitLogging_once, &__block_literal_global);
      }
      v6 = fauiLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      FAUICreateTemporaryFolderURLAppropriateForURL_cold_1((uint64_t)v5, v6);
    }
  }

  return v4;
}

void FAUICreatePDFFromDocumentURLs(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

  v7 = dispatch_queue_create("com.apple.FilesActionsUI.queue.CreatePDF", v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __FAUICreatePDFFromDocumentURLs_block_invoke;
  v10[3] = &unk_264E98278;
  id v11 = v3;
  id v12 = v4;
  id v8 = v4;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __FAUICreatePDFFromDocumentURLs_block_invoke(uint64_t a1)
{
}

void _FAUICreatePDFFromDocumentURLs(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (![v3 count]) {
    goto LABEL_28;
  }
  v24 = v4;
  id v5 = objc_alloc_init((Class)getPDFDocumentClass());
  id v6 = objc_alloc_init(MEMORY[0x263F08830]);
  v7 = [MEMORY[0x263EFF980] array];
  id v25 = v3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)[v3 sortedArrayUsingComparator:&__block_literal_global_0];
  uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * v11);
        id v39 = 0;
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = ___FAUICreatePDFFromDocumentURLs_block_invoke;
        v34[3] = &unk_264E982A0;
        id v35 = 0;
        uint64_t v36 = v12;
        id v37 = v5;
        id v38 = v7;
        [v6 coordinateReadingItemAtURL:v12 options:0 error:&v39 byAccessor:v34];
        id v13 = v39;

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v9);
  }
  v14 = _NewDocumentFileName(obj);
  v15 = _CreateTemporaryPDFFileURL(v14);

  if (![v5 pageCount])
  {
    v17 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v17 = fauiLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      _FAUICreatePDFFromDocumentURLs_cold_1(v17);
    }
    goto LABEL_19;
  }
  if (([v5 writeToURL:v15] & 1) == 0)
  {
    v16 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v16 = fauiLogHandle;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      _FAUICreatePDFFromDocumentURLs_cold_2();
    }
LABEL_19:

    v15 = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        _CleanupTemporaryImage(*(void **)(*((void *)&v30 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v20);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___FAUICreatePDFFromDocumentURLs_block_invoke_4;
  block[3] = &unk_264E982C8;
  id v4 = v24;
  id v28 = v15;
  id v29 = v24;
  id v23 = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);

  id v3 = v25;
LABEL_28:
}

id getPDFDocumentClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getPDFDocumentClass_softClass;
  uint64_t v7 = getPDFDocumentClass_softClass;
  if (!getPDFDocumentClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPDFDocumentClass_block_invoke;
    v3[3] = &unk_264E98310;
    v3[4] = &v4;
    __getPDFDocumentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_23D38CE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SortedFileURLsUsingStandardSort(void *a1, const char *a2)
{
  return [a1 sortedArrayUsingComparator:&__block_literal_global_0];
}

CFURLRef _AppendImageToDocument(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = 612.0;
  v20.size.height = 792.0;
  CGRect v21 = CGRectInset(v20, 30.0, 30.0);
  _DownsampleImage(v3, v21.size.width, v21.size.height);
  CFURLRef v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v6 = v5;
  if (v5)
  {
    CGImageSourceRef v7 = CGImageSourceCreateWithURL(v5, 0);
    if (v7)
    {
      CGImageSourceRef v8 = v7;
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2050000000;
      uint64_t v9 = (void *)getPDFPageClass_softClass;
      uint64_t v18 = getPDFPageClass_softClass;
      if (!getPDFPageClass_softClass)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __getPDFPageClass_block_invoke;
        v14[3] = &unk_264E98310;
        v14[4] = &v15;
        __getPDFPageClass_block_invoke((uint64_t)v14);
        uint64_t v9 = (void *)v16[3];
      }
      uint64_t v10 = v9;
      _Block_object_dispose(&v15, 8);
      uint64_t v11 = (void *)[[v10 alloc] initWithImageSource:v8];
      uint64_t v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setBounds:forBox:", 0, 0.0, 0.0, 612.0, 792.0);
        objc_msgSend(v12, "setBounds:forBox:", 1, 0.0, 0.0, 612.0, 792.0);
        objc_msgSend(v4, "insertPage:atIndex:", v12, objc_msgSend(v4, "pageCount"));
      }
      CFRelease(v8);
    }
    if ([(__CFURL *)v6 isEqual:v3])
    {

      CFURLRef v6 = 0;
    }
  }

  return v6;
}

void sub_23D38D24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _AppendDocumentToDocument(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  uint64_t v4 = [v8 pageCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      CGImageSourceRef v7 = [v8 pageAtIndex:i];
      objc_msgSend(v3, "insertPage:atIndex:", v7, objc_msgSend(v3, "pageCount"));
    }
  }
}

id _CreateTemporaryPDFFileURL(void *a1)
{
  id v1 = a1;
  id v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:v1];

  uint64_t v4 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v3];
  return v4;
}

id _NewDocumentFileName(void *a1)
{
  id v1 = (id)[a1 sortedArrayUsingComparator:&__block_literal_global_0];
  uint64_t v2 = [v1 count];
  id v3 = [v1 firstObject];

  uint64_t v4 = [v3 lastPathComponent];
  uint64_t v5 = [v4 stringByDeletingPathExtension];

  if (v2 == 1)
  {
    CFURLRef v6 = [NSString stringWithFormat:@"%@.pdf", v5];
  }
  else
  {
    CGImageSourceRef v7 = [MEMORY[0x263EFF910] date];
    id v8 = _FormattedDate(v7);

    CFURLRef v6 = [NSString stringWithFormat:@"%@ %@.pdf", v5, v8];
  }
  return v6;
}

void _CleanupTemporaryImage(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08850];
  id v2 = a1;
  id v3 = [v1 defaultManager];
  id v6 = 0;
  [v3 removeItemAtURL:v2 error:&v6];

  id v4 = v6;
  if (v4)
  {
    uint64_t v5 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      uint64_t v5 = fauiLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      _CleanupTemporaryImage_cold_1();
    }
  }
}

id _DownsampleImage(void *a1, double a2, double a3)
{
  v36[4] = *MEMORY[0x263EF8340];
  CFURLRef v5 = a1;
  id v6 = _CreateTemporaryImageFileURL();
  if (v6)
  {
    CGImageSourceRef v7 = CGImageSourceCreateWithURL(v5, 0);
    if (v7)
    {
      id v8 = v7;
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      uint64_t v10 = [(__CFDictionary *)v9 valueForKey:*MEMORY[0x263F0F4F8]];
      uint64_t v11 = [(__CFDictionary *)v9 valueForKey:*MEMORY[0x263F0F4F0]];
      [v10 floatValue];
      float v13 = v12;
      double v14 = v12;
      [v11 floatValue];
      float v16 = v15;
      double v17 = v15;
      double v18 = a2 / v14;
      if (a2 >= v14) {
        double v18 = 1.0;
      }
      if (v18 * v17 > a3) {
        double v18 = a3 / v17;
      }
      if (v18 == 1.0)
      {
        long long v30 = fauiLogHandle;
        if (!fauiLogHandle)
        {
          FAUIInitLogging();
          long long v30 = fauiLogHandle;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          _DownsampleImage_cold_5();
        }
        CFURLRef v31 = v5;

        id v6 = v31;
      }
      else
      {
        CFStringRef Type = CGImageSourceGetType(v8);
        if (Type)
        {
          uint64_t v20 = (uint64_t)Type;
          CGImageDestinationRef v21 = CGImageDestinationCreateWithURL((CFURLRef)v6, Type, 1uLL, 0);
          if (v21)
          {
            uint64_t v22 = v21;
            v35[0] = *MEMORY[0x263F0EFE0];
            if (v13 >= v16) {
              double v23 = v14;
            }
            else {
              double v23 = v17;
            }
            v24 = [NSNumber numberWithDouble:v23];
            uint64_t v25 = *MEMORY[0x263F0F600];
            v36[0] = v24;
            v36[1] = MEMORY[0x263EFFA80];
            uint64_t v26 = *MEMORY[0x263F0F5B8];
            v35[1] = v25;
            v35[2] = v26;
            v35[3] = *MEMORY[0x263F0F650];
            v36[2] = MEMORY[0x263EFFA88];
            v36[3] = MEMORY[0x263EFFA88];
            CFDictionaryRef v27 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];

            CGImageDestinationAddImageFromSource(v22, v8, 0, v27);
            if (!CGImageDestinationFinalize(v22))
            {

              id v28 = fauiLogHandle;
              if (!fauiLogHandle)
              {
                FAUIInitLogging();
                id v28 = fauiLogHandle;
              }
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                _DownsampleImage_cold_4(v20, v28);
              }
              id v6 = 0;
            }
            CFRelease(v22);
          }
          else
          {
            long long v33 = fauiLogHandle;
            if (!fauiLogHandle)
            {
              FAUIInitLogging();
              long long v33 = fauiLogHandle;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              _DownsampleImage_cold_3();
            }
          }
        }
        else
        {
          long long v32 = fauiLogHandle;
          if (!fauiLogHandle)
          {
            FAUIInitLogging();
            long long v32 = fauiLogHandle;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            _DownsampleImage_cold_2();
          }
        }
      }
      CFRelease(v8);
    }
    else
    {
      id v29 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        id v29 = fauiLogHandle;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        _DownsampleImage_cold_1();
      }
    }
  }

  return v6;
}

id _CreateTemporaryImageFileURL()
{
  v0 = NSTemporaryDirectory();
  id v1 = [MEMORY[0x263F08C38] UUID];
  id v2 = [v1 UUIDString];
  id v3 = [v0 stringByAppendingPathComponent:v2];

  id v4 = [v3 stringByAppendingPathExtension:@"jpeg"];

  CFURLRef v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v4];
  return v5;
}

id _FormattedDate(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v1 = [MEMORY[0x263EFF910] date];
  }
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyy-MM-dd' at 'h.mm.ss a"];
  id v4 = [v2 stringFromDate:v1];

  return v4;
}

Class __getPDFDocumentClass_block_invoke(uint64_t a1)
{
  PDFKitLibrary();
  Class result = objc_getClass("PDFDocument");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPDFDocumentClass_block_invoke_cold_1();
  }
  getPDFDocumentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PDFKitLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!PDFKitLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __PDFKitLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_264E98330;
    uint64_t v2 = 0;
    PDFKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PDFKitLibraryCore_frameworkLibrary) {
    PDFKitLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __PDFKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PDFKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPDFPageClass_block_invoke(uint64_t a1)
{
  PDFKitLibrary();
  Class result = objc_getClass("PDFPage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPDFPageClass_block_invoke_cold_1();
  }
  getPDFPageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void FAUIRotateMovies(void *a1, uint64_t a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v20 = a3;
  double v23 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v5 setQualityOfService:25];
  v24 = v5;
  [v5 setName:@"RotateReaderWriterQueue"];
  id v6 = dispatch_group_create();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        dispatch_group_enter(v6);
        id v12 = objc_alloc_init(MEMORY[0x263F08830]);
        float v13 = [MEMORY[0x263F08820] readingIntentWithURL:v11 options:0];
        char v14 = [v11 startAccessingSecurityScopedResource];
        long long v40 = v13;
        float v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __FAUIRotateMovies_block_invoke;
        v28[3] = &unk_264E983C0;
        id v29 = v23;
        long long v30 = v11;
        char v35 = v14;
        CFURLRef v31 = v6;
        id v32 = v13;
        id v33 = v12;
        uint64_t v34 = a2;
        id v16 = v12;
        id v17 = v13;
        [v16 coordinateAccessWithIntents:v15 queue:v24 byAccessor:v28];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __FAUIRotateMovies_block_invoke_12;
  block[3] = &unk_264E982C8;
  id v26 = v23;
  id v27 = v20;
  id v18 = v23;
  id v19 = v20;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);
}

void __FAUIRotateMovies_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      id v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __FAUIRotateMovies_block_invoke_cold_1((uint64_t)v3, v4);
    }
    [*(id *)(a1 + 32) setObject:v3 forKey:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 40) stopAccessingSecurityScopedResource];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    id v5 = [*(id *)(a1 + 56) URL];
    id v6 = FAUICreateTemporaryFolderURLAppropriateForURL(v5);

    uint64_t v7 = FAUICreateTempFileURLInTemporaryDirectory(v6);
    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = [*(id *)(a1 + 56) URL];
    id v30 = 0;
    [v8 copyItemAtURL:v9 toURL:v7 error:&v30];
    id v10 = v30;

    if (v10)
    {
      uint64_t v11 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        uint64_t v11 = fauiLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v18 = *(void **)(a1 + 56);
        id v19 = v11;
        id v20 = [v18 URL];
        *(_DWORD *)buf = 138412802;
        id v32 = v20;
        __int16 v33 = 2112;
        uint64_t v34 = v7;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_error_impl(&dword_23D38B000, v19, OS_LOG_TYPE_ERROR, "Failed to copy %@ to temp file %@ error: %@", buf, 0x20u);
      }
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __FAUIRotateMovies_block_invoke_6;
    v21[3] = &unk_264E98398;
    uint64_t v12 = *(void *)(a1 + 72);
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 56);
    id v24 = v7;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    float v15 = *(void **)(a1 + 48);
    id v25 = v13;
    uint64_t v26 = v14;
    id v27 = v6;
    char v29 = *(unsigned char *)(a1 + 80);
    id v28 = v15;
    id v16 = v6;
    id v17 = v7;
    _FAUIRotateMovie(v17, v17, v12, v21);
  }
}

void _FAUIRotateMovie(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  uint64_t v8 = a4;
  id v9 = a2;
  int v10 = [v7 startAccessingSecurityScopedResource];
  uint64_t v11 = [MEMORY[0x263EFA798] movieWithURL:v7 options:0];
  uint64_t v12 = [v11 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  id v13 = [v12 firstObject];

  double v14 = 4.71238898;
  if (a3 != 1) {
    double v14 = 0.0;
  }
  if (a3) {
    double v15 = v14;
  }
  else {
    double v15 = 1.57079633;
  }
  if (v13) {
    objc_msgSend(v13, "preferredTransform", v14);
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransformMakeRotation(&t2, v15);
  CGAffineTransformConcat(&v25, &t1, &t2);
  [v13 setPreferredTransform:&v25];
  uint64_t v16 = *MEMORY[0x263EF9898];
  id v22 = 0;
  uint64_t v17 = [v11 writeMovieHeaderToURL:v9 fileType:v16 options:0 error:&v22];

  id v18 = v22;
  if (v18)
  {
    id v19 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      id v19 = fauiLogHandle;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      _FAUIRotateMovie_cold_1((uint64_t)v18, v19);
    }
    id v20 = v18;
LABEL_19:
    CGImageDestinationRef v21 = v20;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ((v17 & 1) == 0)
  {
    id v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11800 userInfo:0];
    goto LABEL_19;
  }
  CGImageDestinationRef v21 = 0;
  if (v10) {
LABEL_20:
  }
    [v7 stopAccessingSecurityScopedResource];
LABEL_21:
  if (v8) {
    v8[2](v8, v17, v21);
  }
}

void __FAUIRotateMovies_block_invoke_6(uint64_t a1, int a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy_;
    char v29 = __Block_byref_object_dispose_;
    id v30 = 0;
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) URL];
    id v9 = (id *)(v26 + 5);
    id obj = (id)v26[5];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __FAUIRotateMovies_block_invoke_7;
    v21[3] = &unk_264E98370;
    id v22 = *(id *)(a1 + 48);
    id v23 = &v25;
    [v7 coordinateWritingItemAtURL:v8 options:0 error:&obj byAccessor:v21];
    objc_storeStrong(v9, obj);

    if (v26[5])
    {
      int v10 = (void *)fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        int v10 = (void *)fauiLogHandle;
      }
      uint64_t v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v18 = [*(id *)(a1 + 40) URL];
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        id v32 = v18;
        __int16 v33 = 2112;
        uint64_t v34 = v19;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_error_impl(&dword_23D38B000, v11, OS_LOG_TYPE_ERROR, "Failed to replace %@ with temp file %@ error: %@", buf, 0x20u);
      }
      uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
      [v12 removeItemAtURL:*(void *)(a1 + 48) error:0];

      [*(id *)(a1 + 56) setObject:v26[5] forKey:*(void *)(a1 + 64)];
    }
    id v13 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v14 = *(void *)(a1 + 72);
    id v20 = 0;
    [v13 removeItemAtURL:v14 error:&v20];
    id v15 = v20;

    if (v15)
    {
      uint64_t v16 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        uint64_t v16 = fauiLogHandle;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __FAUIRotateMovies_block_invoke_6_cold_1((uint64_t *)(a1 + 72), (uint64_t)v15, v16);
      }
    }

    _Block_object_dispose(&v25, 8);
  }
  else if (v5)
  {
    [*(id *)(a1 + 56) setObject:v5 forKey:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EF98B0] code:-11800 userInfo:0];
    [*(id *)(a1 + 56) setObject:v17 forKey:*(void *)(a1 + 64)];
  }
  if (*(unsigned char *)(a1 + 88)) {
    [*(id *)(a1 + 64) stopAccessingSecurityScopedResource];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

void sub_23D38E8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __FAUIRotateMovies_block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  [v5 replaceItemAtURL:v4 withItemAtURL:v6 backupItemName:0 options:0 resultingItemURL:0 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
}

void __FAUIRotateMovies_block_invoke_12(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v3 = [*(id *)(a1 + 32) allKeys];
    (*(void (**)(uint64_t, BOOL, void))(v1 + 16))(v1, [v3 count] == 0, *(void *)(a1 + 32));
  }
}

double _FAUIRotationDirectionToRadians(uint64_t a1)
{
  double result = 4.71238898;
  if (a1 != 1) {
    double result = 0.0;
  }
  if (!a1) {
    return 1.57079633;
  }
  return result;
}

BOOL FAUIRotateImage(void *a1, void *a2, uint64_t a3)
{
  v36[2] = *MEMORY[0x263EF8340];
  CFURLRef v5 = a1;
  CFURLRef v6 = a2;
  uint64_t v7 = CGDataProviderCreateWithURL(v5);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = CGImageSourceCreateWithDataProvider(v7, 0);
    if (!v9)
    {
      id v28 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        id v28 = fauiLogHandle;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        FAUIRotateImage_cold_2();
      }
      BOOL v24 = 0;
      goto LABEL_40;
    }
    int v10 = v9;
    CFStringRef Type = CGImageSourceGetType(v9);
    if (Type)
    {
      CGImageDestinationRef v12 = CGImageDestinationCreateWithURL(v6, Type, 1uLL, 0);
      if (v12)
      {
        id v13 = v12;
        CGImageMetadataRef v14 = CGImageSourceCopyMetadataAtIndex(v10, 0, 0);
        if (v14)
        {
          CGImageMetadataRef v15 = v14;
          CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
          uint64_t v17 = [(__CFDictionary *)v16 valueForKey:*MEMORY[0x263F0F4C8]];
          if (!v17) {
            uint64_t v17 = &unk_26F113E18;
          }
          __int16 v33 = v17;
          int v18 = [v17 intValue];
          if ((v18 - 9) <= 0xFFFFFFF7) {
            FAUIRotateImage_cold_5();
          }
          uint64_t v19 = (unsigned int *)&_FAUICounterClockwiseTranslations;
          if (!a3) {
            uint64_t v19 = (unsigned int *)&_FAUIClockwiseTranslations;
          }
          uint64_t v20 = v19[v18];
          uint64_t v21 = *MEMORY[0x263F0F010];
          v35[0] = *MEMORY[0x263F0EFF8];
          v35[1] = v21;
          v36[0] = MEMORY[0x263EFFA88];
          id v22 = [NSNumber numberWithInt:v20];
          v36[1] = v22;
          CFDictionaryRef v23 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

          CFErrorRef err = 0;
          BOOL v24 = CGImageDestinationCopyImageSource(v13, v10, v23, &err);
          if (err)
          {
            CFDictionaryRef v32 = v16;
            uint64_t v25 = (__CFString *)CFErrorCopyDescription(err);
            uint64_t v26 = fauiLogHandle;
            if (!fauiLogHandle)
            {
              FAUIInitLogging();
              uint64_t v26 = fauiLogHandle;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              FAUIRotateImage_cold_6();
            }

            CFDictionaryRef v16 = v32;
          }
          CFRelease(v15);
        }
        else
        {
          BOOL v24 = 0;
        }
        CFRelease(v13);
        goto LABEL_39;
      }
      id v30 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        id v30 = fauiLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        FAUIRotateImage_cold_4();
      }
    }
    else
    {
      char v29 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        char v29 = fauiLogHandle;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        FAUIRotateImage_cold_3();
      }
    }
    BOOL v24 = 0;
LABEL_39:
    CFRelease(v10);
LABEL_40:
    CFRelease(v8);
    goto LABEL_41;
  }
  uint64_t v27 = fauiLogHandle;
  if (!fauiLogHandle)
  {
    FAUIInitLogging();
    uint64_t v27 = fauiLogHandle;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    FAUIRotateImage_cold_1();
  }
  BOOL v24 = 0;
LABEL_41:

  return v24;
}

void FAUIRotateImages(void *a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v19 = a3;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  id v5 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v5 setQualityOfService:25];
  [v5 setName:@"RotateReaderWriterQueue"];
  CFURLRef v6 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v10 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:0];
        uint64_t v11 = [MEMORY[0x263F08820] readingIntentWithURL:v9 options:0];
        char v12 = [v9 startAccessingSecurityScopedResource];
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x3032000000;
        v38[3] = __Block_byref_object_copy__0;
        v38[4] = __Block_byref_object_dispose__0;
        id v39 = 0;
        dispatch_group_enter(v6);
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __FAUIRotateImages_block_invoke;
        v34[3] = &unk_264E983E8;
        char v37 = v12;
        id v36 = v38;
        void v34[4] = v9;
        __int16 v35 = v6;
        id v13 = (void *)MEMORY[0x23ECFF180](v34);
        v45 = v11;
        CGImageMetadataRef v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __FAUIRotateImages_block_invoke_6;
        v26[3] = &unk_264E98438;
        CFURLRef v31 = v44;
        id v15 = v13;
        id v30 = v15;
        CFDictionaryRef v32 = v38;
        id v16 = v11;
        id v27 = v16;
        uint64_t v33 = a2;
        id v17 = v10;
        id v28 = v17;
        id v29 = v5;
        [v17 coordinateAccessWithIntents:v14 queue:v29 byAccessor:v26];

        _Block_object_dispose(v38, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __FAUIRotateImages_block_invoke_9;
  block[3] = &unk_264E98460;
  id v24 = v19;
  uint64_t v25 = v44;
  id v18 = v19;
  dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v44, 8);
}

void sub_23D38F1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __FAUIRotateImages_block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v7 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    CFURLRef v6 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      CFURLRef v6 = fauiLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __FAUIRotateImages_block_invoke_cold_1(a1 + 48, (uint64_t)v5, v6);
    }
  }
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __FAUIRotateImages_block_invoke_6(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    char v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      char v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __FAUIRotateImages_block_invoke_6_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) URL];
    uint64_t v6 = FAUICreateTemporaryFolderURLAppropriateForURL(v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = FAUICreateTempFileURLInTemporaryDirectory(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    int v10 = [*(id *)(a1 + 32) URL];
    BOOL v11 = FAUIRotateImage(v10, v9, *(void *)(a1 + 80));

    if (v11)
    {
      char v12 = (void *)MEMORY[0x263F08820];
      id v13 = [*(id *)(a1 + 32) URL];
      CGImageMetadataRef v14 = [v12 writingIntentWithURL:v13 options:0];

      id v15 = *(void **)(a1 + 40);
      v26[0] = v14;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
      uint64_t v17 = *(void *)(a1 + 48);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __FAUIRotateImages_block_invoke_7;
      v21[3] = &unk_264E98410;
      id v22 = v14;
      id v23 = v9;
      id v24 = *(id *)(a1 + 32);
      long long v20 = *(_OWORD *)(a1 + 56);
      id v18 = (id)v20;
      long long v25 = v20;
      id v19 = v14;
      [v15 coordinateAccessWithIntents:v16 queue:v17 byAccessor:v21];
    }
    else
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __FAUIRotateImages_block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    char v4 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      char v4 = fauiLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __FAUIRotateImages_block_invoke_7_cold_2();
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v6 = [*(id *)(a1 + 32) URL];
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = 0;
    char v8 = [v5 replaceItemAtURL:v6 withItemAtURL:v7 backupItemName:0 options:0 resultingItemURL:0 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      int v10 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        int v10 = fauiLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __FAUIRotateImages_block_invoke_7_cold_1(a1, v10);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __FAUIRotateImages_block_invoke_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0);
  }
  return result;
}

void FAUICreateTemporaryFolderURLAppropriateForURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D38B000, a2, OS_LOG_TYPE_ERROR, "Failed to create temp directory: %@", (uint8_t *)&v2, 0xCu);
}

void _FAUICreatePDFFromDocumentURLs_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23D38B000, log, OS_LOG_TYPE_ERROR, "Error: failed to create PDF", v1, 2u);
}

void _FAUICreatePDFFromDocumentURLs_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error: failed to write PDF to URL: %@", v2, v3, v4, v5, v6);
}

void _CleanupTemporaryImage_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error cleaning up temporary file: %@", v2, v3, v4, v5, v6);
}

void _DownsampleImage_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Failed to create image source from file URL: %@", v2, v3, v4, v5, v6);
}

void _DownsampleImage_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Failed to get type identifier of file URL: %@", v2, v3, v4, v5, v6);
}

void _DownsampleImage_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Failed create image destination at file URL: %@", v2, v3, v4, v5, v6);
}

void _DownsampleImage_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_23D38B000, a2, OS_LOG_TYPE_ERROR, "Downsample image: failed to finalize image destination of type: %@ at file URL: %@", (uint8_t *)&v2, 0x16u);
}

void _DownsampleImage_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "No need to downsample image at file URL: %@", v2, v3, v4, v5, v6);
}

void __getPDFDocumentClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPDFDocumentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FAUICombinePDFAction.m", 24, @"Unable to find class %s", "PDFDocument");

  __break(1u);
}

void PDFKitLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PDFKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FAUICombinePDFAction.m", 22, @"%s", *a1);

  __break(1u);
}

void __getPDFPageClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPDFPageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FAUICombinePDFAction.m", 23, @"Unable to find class %s", "PDFPage");

  __break(1u);
}

void __FAUIRotateMovies_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D38B000, a2, OS_LOG_TYPE_ERROR, "Failed to take a coordinated read: %@", (uint8_t *)&v2, 0xCu);
}

void _FAUIRotateMovie_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D38B000, a2, OS_LOG_TYPE_ERROR, "Failed to rotate video file: %@", (uint8_t *)&v2, 0xCu);
}

void __FAUIRotateMovies_block_invoke_6_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23D38B000, log, OS_LOG_TYPE_ERROR, "Failed to delete temp directory %@ error: %@", (uint8_t *)&v4, 0x16u);
}

void FAUIRotateImage_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error: could not create data provider with URL %@", v2, v3, v4, v5, v6);
}

void FAUIRotateImage_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error: could not create image source for URL %@", v2, v3, v4, v5, v6);
}

void FAUIRotateImage_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error: could not determine UTI for URL %@", v2, v3, v4, v5, v6);
}

void FAUIRotateImage_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error: could create image destination for URL %@", v2, v3, v4, v5, v6);
}

void FAUIRotateImage_cold_5()
{
}

void FAUIRotateImage_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Error, could not use fast-path image rotation due to: %@", v2, v3, v4, v5, v6);
}

void __FAUIRotateImages_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23D38B000, log, OS_LOG_TYPE_ERROR, "Failed to remove temporary folder %@: %@", (uint8_t *)&v4, 0x16u);
}

void __FAUIRotateImages_block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Failed to take a coordinated read: %@", v2, v3, v4, v5, v6);
}

void __FAUIRotateImages_block_invoke_7_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 URL];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  _os_log_error_impl(&dword_23D38B000, v3, OS_LOG_TYPE_ERROR, "Failed to replace %@ with temp file %@ error: %@", v6, 0x20u);
}

void __FAUIRotateImages_block_invoke_7_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D38B000, v0, v1, "Failed to take a coordinated write: %@", v2, v3, v4, v5, v6);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x270EF4F10](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}