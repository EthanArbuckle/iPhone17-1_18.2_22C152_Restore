void _UIDocumentListControllerPresentOSAlert(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(void);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void v28[4];
  id v29;
  void v30[4];
  void (**v31)(void);
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v32 = 0;
  [a1 getPromisedItemResourceValue:&v32 forKey:*MEMORY[0x263EFF7E8] error:0];
  v10 = v32;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      v13 = [v11 code];

      if (v13 == 3328)
      {
        v27 = (void *)MEMORY[0x263F1C3F8];
        v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v15 = [v14 localizedStringForKey:@"A Newer Version of iOS is Needed to Edit this File" value:@"A Newer Version of iOS is Needed to Edit this File" table:@"Localizable"];
        v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v17 = [v16 localizedStringForKey:@"Changes made to this document will not be available on any other devices. Open this document anyway?" value:@"Changes made to this document will not be available on any other devices. Open this document anyway?" table:@"Localizable"];
        v18 = [v27 alertControllerWithTitle:v15 message:v17 preferredStyle:1];

        v19 = (void *)MEMORY[0x263F1C3F0];
        v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v21 = [v20 localizedStringForKey:@"Open" value:@"Open" table:@"Localizable"];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = ___UIDocumentListControllerPresentOSAlert_block_invoke;
        v30[3] = &unk_26492CD88;
        v31 = v8;
        v22 = [v19 actionWithTitle:v21 style:0 handler:v30];
        [v18 addAction:v22];

        v23 = (void *)MEMORY[0x263F1C3F0];
        v24 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v25 = [v24 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = ___UIDocumentListControllerPresentOSAlert_block_invoke_2;
        v28[3] = &unk_26492CD88;
        v29 = v9;
        v26 = [v23 actionWithTitle:v25 style:1 handler:v28];
        [v18 addAction:v26];

        [v7 presentViewController:v18 animated:1 completion:0];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_8:
}

id BRFormatPhoneNumber(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x263F33620] countryCodeForNumber:v1];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v3 = (uint64_t (*)(void, id, void *))getCFPhoneNumberCreateSymbolLoc_ptr;
  v15 = getCFPhoneNumberCreateSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateSymbolLoc_ptr)
  {
    v4 = (void *)PhoneNumbersLibrary();
    v13[3] = (uint64_t)dlsym(v4, "CFPhoneNumberCreate");
    getCFPhoneNumberCreateSymbolLoc_ptr = (_UNKNOWN *)v13[3];
    v3 = (uint64_t (*)(void, id, void *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
  {
    BRFormatPhoneNumber_cold_1();
    goto LABEL_14;
  }
  uint64_t v5 = v3(0, v1, v2);
  if (v5)
  {
    v6 = (const void *)v5;
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    v7 = (uint64_t (*)(void, const void *, uint64_t))getCFPhoneNumberCreateStringSymbolLoc_ptr;
    v15 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
    if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
    {
      v8 = (void *)PhoneNumbersLibrary();
      v13[3] = (uint64_t)dlsym(v8, "CFPhoneNumberCreateString");
      getCFPhoneNumberCreateStringSymbolLoc_ptr = (_UNKNOWN *)v13[3];
      v7 = (uint64_t (*)(void, const void *, uint64_t))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (v7)
    {
      id v9 = (id)v7(0, v6, 5);
      CFRelease(v6);
      goto LABEL_10;
    }
LABEL_14:
    v11 = (_Unwind_Exception *)BRFormatPhoneNumber_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  id v9 = v1;
LABEL_10:

  return v9;
}

void *__getCFPhoneNumberCreateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PhoneNumbersLibrary();
  result = dlsym(v2, "CFPhoneNumberCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PhoneNumbersLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26492CDD0;
    uint64_t v5 = 0;
    PhoneNumbersLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PhoneNumbersLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhoneNumbersLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCFPhoneNumberCreateStringSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PhoneNumbersLibrary();
  uint64_t result = dlsym(v2, "CFPhoneNumberCreateString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCFPhoneNumberCreateStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id BRFormatModifiedAgoWithDate(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  v3 = [v1 currentCalendar];
  long long v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [v3 components:124 fromDate:v2 toDate:v4 options:0];

  if ([v5 year])
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v8 = [v7 localizedStringForKey:@"modified %lu years ago" value:@"modified %lu years ago" table:@"Localizable"];
    uint64_t v9 = [v5 year];
LABEL_11:
    v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);

    goto LABEL_12;
  }
  if ([v5 month])
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v8 = [v7 localizedStringForKey:@"modified %lu months ago" value:@"modified %lu months ago" table:@"Localizable"];
    uint64_t v9 = [v5 month];
    goto LABEL_11;
  }
  if ([v5 day])
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v8 = [v7 localizedStringForKey:@"modified %lu days ago" value:@"modified %lu days ago" table:@"Localizable"];
    uint64_t v9 = [v5 day];
    goto LABEL_11;
  }
  if ([v5 hour])
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v8 = [v7 localizedStringForKey:@"modified %lu hours ago" value:@"modified %lu hours ago" table:@"Localizable"];
    uint64_t v9 = [v5 hour];
    goto LABEL_11;
  }
  if ([v5 minute])
  {
    uint64_t v6 = NSString;
    v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v8 = [v7 localizedStringForKey:@"modified %lu minutes ago" value:@"modified %lu minutes ago" table:@"Localizable"];
    uint64_t v9 = [v5 minute];
    goto LABEL_11;
  }
  v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v10 = [v7 localizedStringForKey:@"modified less than a minute ago" value:@"modified less than a minute ago" table:@"Localizable"];
LABEL_12:

  return v10;
}

id cdui_default_log()
{
  if (cdui_default_log_once != -1) {
    dispatch_once(&cdui_default_log_once, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)cdui_default_log_logger;

  return v0;
}

uint64_t __cdui_default_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CloudDocsUI", "default");
  uint64_t v1 = cdui_default_log_logger;
  cdui_default_log_logger = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id cdui_perf_log()
{
  if (cdui_perf_log_once != -1) {
    dispatch_once(&cdui_perf_log_once, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)cdui_perf_log_logger;

  return v0;
}

uint64_t __cdui_perf_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CloudDocsUI", "performance");
  uint64_t v1 = cdui_perf_log_logger;
  cdui_perf_log_logger = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id BRCompareImages(void *a1, void *a2, _DWORD *a3)
{
  id v4 = a1;
  id v5 = a2;
  uint64_t v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    id v8 = v4;
    uint64_t v9 = (CGImage *)[v8 CGImage];
    v10 = (CGImage *)[v6 CGImage];
    DataProvider = CGImageGetDataProvider(v9);
    CFDataRef v12 = CGDataProviderCopyData(DataProvider);
    v13 = CGImageGetDataProvider(v10);
    CFDataRef v14 = CGDataProviderCopyData(v13);
    size_t Width = CGImageGetWidth(v10);
    size_t height = CGImageGetHeight(v10);
    size_t v16 = height * Width;
    if (a3) {
      *a3 = v16;
    }
    v17 = [MEMORY[0x263EFF990] dataWithLength:4 * v16];
    CFDataRef v18 = v12;
    uint64_t v51 = [(__CFData *)v18 bytes];
    CFDataRef v38 = v14;
    uint64_t v50 = [(__CFData *)v38 bytes];
    id v19 = v17;
    uint64_t v49 = [v19 mutableBytes];
    size_t v42 = CGImageGetBytesPerRow(v9);
    size_t v41 = CGImageGetBytesPerRow(v10);
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3020000000;
    int v59 = 0;
    id v20 = v8;
    if (CGImageGetBitsPerComponent((CGImageRef)[v20 CGImage]) == 8
      && (size_t v21 = Width,
          size_t BitsPerPixel = CGImageGetBitsPerPixel(v9),
          size_t BitsPerComponent = CGImageGetBitsPerComponent(v9),
          size_t v24 = CGImageGetBitsPerPixel(v10),
          size_t v47 = BitsPerPixel / BitsPerComponent,
          BitsPerPixel / BitsPerComponent == v24 / CGImageGetBitsPerComponent(v10)))
    {
      CFDataRef v36 = v18;
      v37 = v6;
      CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v10);
      uint64_t bytesPerRow = 4 * v21;
      group = dispatch_group_create();
      queue = dispatch_queue_create("Image comparison queue", MEMORY[0x263EF83A8]);
      if (height)
      {
        for (uint64_t i = 0; i != height; ++i)
        {
          if (v21)
          {
            LODWORD(v25) = 0;
            uint64_t v26 = MEMORY[0x263EF8330];
            do
            {
              v52[0] = v26;
              if ((int)v21 - (int)v25 >= 128) {
                int v27 = 128;
              }
              else {
                int v27 = v21 - v25;
              }
              v52[1] = 3221225472;
              v52[2] = __BRCompareImages_block_invoke;
              v52[3] = &unk_26492CE28;
              int v53 = v25;
              int v54 = v27;
              v52[6] = i * v42;
              v52[7] = v47;
              v52[8] = v50;
              v52[9] = i * v41;
              v52[10] = v49;
              v52[11] = i * bytesPerRow;
              v52[12] = 4;
              CGBitmapInfo v55 = BitmapInfo;
              v52[4] = &v56;
              v52[5] = v51;
              v28 = (void *)MEMORY[0x230F72310](v52);
              size_t v29 = v21;
              v30 = (void *)[v28 copy];
              dispatch_group_async(group, queue, v30);

              unint64_t v25 = (v27 + v25);
              size_t v21 = v29;
            }
            while (v29 > v25);
          }
        }
      }
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      v31 = v57;
      if (a3) {
        *a3 = *((_DWORD *)v57 + 10);
      }
      uint64_t v6 = v37;
      CFDataRef v18 = v36;
      if (*((_DWORD *)v31 + 10))
      {
        v32 = CGDataProviderCreateWithCFData((CFDataRef)v19);
        ColorSpace = CGImageGetColorSpace((CGImageRef)[v20 CGImage]);
        CGImageRef v34 = CGImageCreate(v21, height, 8uLL, 0x20uLL, bytesPerRow, ColorSpace, 3u, v32, 0, 0, kCGRenderingIntentDefault);
        v7 = [MEMORY[0x263F1C6B0] imageWithCGImage:v34];
        CFRelease(v34);
        CFRelease(v32);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v56, 8);
  }

  return v7;
}

void sub_22CA52588(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __BRCompareImages_block_invoke(uint64_t result)
{
  unint64_t v1 = *(unsigned int *)(result + 104);
  if (*(int *)(result + 108) + v1 > v1)
  {
    for (unint64_t i = *(unsigned int *)(result + 104); i < *(int *)(result + 108) + v1; ++i)
    {
      unint64_t v3 = *(void *)(result + 56);
      id v4 = (unsigned __int8 *)(*(void *)(result + 40) + *(void *)(result + 48) + v3 * i);
      unint64_t v5 = *(void *)(result + 64) + *(void *)(result + 72) + v3 * i;
      unint64_t v6 = *(void *)(result + 80) + *(void *)(result + 88) + *(void *)(result + 96) * i;
      if (v3 == 4)
      {
        if ((*(unsigned char *)(result + 112) & 3) != 0) {
          uint64_t v7 = 3;
        }
        else {
          uint64_t v7 = 0;
        }
        LOBYTE(v8) = v4[v7];
        if (!(*(unsigned char *)(v5 + v7) | v8)) {
          goto LABEL_22;
        }
      }
      else if (!v3)
      {
        LOBYTE(v8) = -1;
        goto LABEL_22;
      }
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      LOBYTE(v11) = 1;
      do
      {
        int v11 = v11 & (v4[v9] == *(unsigned __int8 *)(v5 + v9));
        uint64_t v9 = v10;
      }
      while (v3 > v10++);
      if (v3 == 4)
      {
        if ((*(unsigned char *)(result + 112) & 3) != 0) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 0;
        }
        int v8 = v4[v13];
        if ((v11 & 1) == 0)
        {
LABEL_19:
          atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(result + 32) + 8) + 40), 1u, memory_order_relaxed);
          *(unsigned char *)unint64_t v6 = (*v4 >> 1) | 0x80;
          *(_WORD *)(v6 + 1) = 0;
          if (!v8) {
            LOBYTE(v8) = -1;
          }
          goto LABEL_23;
        }
      }
      else
      {
        int v8 = 255;
        if (!v11) {
          goto LABEL_19;
        }
      }
LABEL_22:
      unsigned int v14 = (((77 * *v4 + 150 * v4[1] + 28 * v4[2]) >> 8) + 256) >> 1;
      *(unsigned char *)unint64_t v6 = v14;
      *(unsigned char *)(v6 + 1) = v14;
      *(unsigned char *)(v6 + 2) = v14;
LABEL_23:
      *(unsigned char *)(v6 + 3) = v8;
    }
  }
  return result;
}

id BRSnapshotOfView(void *a1)
{
  id v1 = a1;
  [v1 bounds];
  v8.width = v2;
  v8.size_t height = v3;
  UIGraphicsBeginImageContextWithOptions(v8, 1, 0.0);
  id v4 = [v1 layer];

  [v4 renderInContext:UIGraphicsGetCurrentContext()];
  unint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v5;
}

id BRLayerSnapshot(void *a1)
{
  id v1 = [a1 layer];
  CGFloat v2 = (void *)CAEncodeLayerTree();

  return v2;
}

void appendDescription(void *a1, void *a2, unint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 length]) {
    [v6 appendString:@"\n"];
  }
  if (a3)
  {
    unint64_t v7 = 1;
    do
    {
      [v6 appendString:@"   | "];
      ++v7;
    }
    while (v7 <= a3);
  }
  CGSize v8 = [v5 description];
  [v6 appendString:v8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = objc_msgSend(v5, "subitems", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    unint64_t v13 = a3 + 1;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        appendDescription(*(void *)(*((void *)&v15 + 1) + 8 * v14++), v6, v13);
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

uint64_t appendComparison(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v9 length]) {
    [v9 appendString:@"\n"];
  }
  if (a4)
  {
    unint64_t v10 = 1;
    do
    {
      [v9 appendString:@"   | "];
      ++v10;
    }
    while (v10 <= a4);
  }
  uint64_t v11 = [v7 description];
  [v9 appendString:v11];

  uint64_t v12 = [v7 name];
  unint64_t v13 = [v8 name];
  char v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    long long v15 = [v7 name];
    long long v16 = [v8 name];
    [v9 appendFormat:@"\nName mismatch: %@ != %@\n", v15, v16];
  }
  [v7 absoluteFrame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double size = v23;
  [v8 absoluteFrame];
  CGFloat v26 = v25;
  CGFloat v27 = v24;
  double v29 = v28;
  double v31 = v30;
  if (vabdd_f64(v18, v25) >= 0.00001 || vabdd_f64(v20, v24) >= 0.00001)
  {
    v58.x = v18;
    v58.y = v20;
    v33 = NSStringFromCGPoint(v58);
    v59.x = v26;
    v59.y = v27;
    CGImageRef v34 = NSStringFromCGPoint(v59);
    [v9 appendFormat:@"\nOrigin mismatch: %@ != %@", v33, v34];

    char v32 = 1;
  }
  else
  {
    char v32 = v14 ^ 1;
  }
  double v35 = size;
  if (vabdd_f64(v22, v29) >= 0.00001 || vabdd_f64(size, v31) >= 0.00001)
  {
    double v36 = v22;
    v37 = NSStringFromCGSize(*(CGSize *)(&v35 - 1));
    v60.width = v29;
    v60.size_t height = v31;
    CFDataRef v38 = NSStringFromCGSize(v60);
    [v9 appendFormat:@"\nSize mismatch: %@ != %@", v37, v38];

    char v32 = 1;
  }
  v39 = [v7 subitems];
  uint64_t v40 = [v39 count];
  size_t v41 = [v8 subitems];
  uint64_t v42 = [v41 count];

  if (v40 != v42)
  {
    int v54 = [v7 subitems];
    CGBitmapInfo v55 = [v8 subitems];
    [v9 appendFormat:@"\nSubitems don't match: %@ != %@", v54, v55];

    goto LABEL_22;
  }
  if (v32)
  {
LABEL_22:
    LOBYTE(v45) = 1;
    goto LABEL_23;
  }
  v43 = [v7 subitems];
  uint64_t v44 = [v43 count];

  int v45 = 0;
  if (v44)
  {
    unint64_t v46 = 0;
    unint64_t v47 = a4 + 1;
    do
    {
      v48 = [v7 subitems];
      uint64_t v49 = [v48 objectAtIndex:v46];

      uint64_t v50 = [v8 subitems];
      uint64_t v51 = [v50 objectAtIndex:v46];

      v45 |= appendComparison(v49, v51, v9, v47);
      ++v46;
      v52 = [v7 subitems];
      unint64_t v53 = [v52 count];
    }
    while (v46 < v53);
  }
LABEL_23:

  return v45 & 1;
}

void sub_22CA55970(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CA55A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22CA55B98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
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

void sub_22CA5A7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22CA5CCB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_22CA5F198(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CA5F218(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22CA5F4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22CA5F6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22CA60094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22CA61D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22CA62AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
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

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26492D3C0;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    CGFloat v2 = (void *)v4[0];
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CGFloat v2 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void CDAddLocalizedSuffixForType(void *a1, void *a2)
{
  uint64_t v3 = CDAddLocalizedSuffixForType_onceToken;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&CDAddLocalizedSuffixForType_onceToken, &__block_literal_global_7);
  }
  id v6 = (id)objc_opt_new();
  [v6 setSuffix:v5];

  [v6 setType:v4];
  [(id)BRLocalizedStringSuffixesByType addObject:v6];
}

uint64_t __CDAddLocalizedSuffixForType_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = BRLocalizedStringSuffixesByType;
  BRLocalizedStringSuffixesByType = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id _CDAdaptLocalizedStringForItemType(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)BRLocalizedStringSuffixesByType;
  id v9 = (void *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 appliesToType:v7])
        {
          id v9 = [v12 suffix];
          goto LABEL_11;
        }
      }
      id v9 = (void *)[v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  unint64_t v13 = [NSString stringWithFormat:@"%@_%@", v5, v9, (void)v18];
  char v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  long long v15 = [v14 localizedStringForKey:v13 value:&stru_26E0221C0 table:@"Localizable"];

  if ([v15 isEqualToString:v13])
  {
    id v16 = v6;

    long long v15 = v16;
  }

  return v15;
}

void sub_22CA6510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_22CA654F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22CA6B8E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void _UIDocumentPickerDisplayModeChangedHandler(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGFloat v2 = +[_UIDocumentPickerContainerViewController userDefaults];
  [v2 synchronize];

  [v3 displayModeChanged];
}

void sub_22CA70938(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_22CA71C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22CA73D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22CA74340(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t BRFormatPhoneNumber_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[_UIDocumentPickerURLContainerModel _tagColorsDidChange](v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_UIDocumentPickerViewServiceViewController _setUploadURL:](v0);
}

uint64_t BRGetCloudEnabledStatusForAuditToken()
{
  return MEMORY[0x270F16B30]();
}

uint64_t BRPrimaryiCloudAccountCopyStatus()
{
  return MEMORY[0x270F16BA0]();
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x270EFB798]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x270EE60F0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.size_t height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x270F0CD58]();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x270EEBAA8]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x270EF2B10]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x270F05FF0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x270F06008]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x270F061F0]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F06208]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F06270]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x270EE5738]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x270EE5750]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x270EE5768]();
}

uint64_t _UIGraphicsDrawIntoImageContextWithOptions()
{
  return MEMORY[0x270F06350]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIImageCacheKeyWithSentinel()
{
  return MEMORY[0x270F063C8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}