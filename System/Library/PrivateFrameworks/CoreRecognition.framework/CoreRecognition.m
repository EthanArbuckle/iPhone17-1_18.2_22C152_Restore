void *getJPHepburn()
{
  id v0;

  v0 = &unk_26C7C54F0;
  return &unk_26C7C54F0;
}

void *getZhHansFN()
{
  id v0 = &unk_26C7C5518;
  return &unk_26C7C5518;
}

void *getZhHansLN()
{
  id v0 = &unk_26C7C5540;
  return &unk_26C7C5540;
}

id CROSLogForCategory(int a1)
{
  if (CROSLogForCategory_onceToken != -1) {
    dispatch_once(&CROSLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)CROSLogForCategory_logObjects[a1];
  return v2;
}

void __CROSLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TextRecognition", "General");
  v1 = (void *)CROSLogForCategory_logObjects;
  CROSLogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.TextRecognition", "Tracking");
  v3 = (void *)qword_267B9C498;
  qword_267B9C498 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.TextRecognition", "Detection");
  v5 = (void *)qword_267B9C4A0;
  qword_267B9C4A0 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.TextRecognition", "Recognition");
  v7 = (void *)qword_267B9C4A8;
  qword_267B9C4A8 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.TextRecognition", "Layout");
  v9 = (void *)qword_267B9C4B0;
  qword_267B9C4B0 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.TextRecognition", "TSR");
  v11 = (void *)qword_267B9C4B8;
  qword_267B9C4B8 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.TextRecognition", "Form");
  v13 = (void *)qword_267B9C4C0;
  qword_267B9C4C0 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.TextRecognition", "DD");
  v15 = (void *)qword_267B9C4C8;
  qword_267B9C4C8 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.TextRecognition", "CameraReader");
  v17 = (void *)qword_267B9C4D0;
  qword_267B9C4D0 = (uint64_t)v16;
}

__CFDictionary *fcssCreateIOSurfacePropertiesDictionary(int a1, int a2, int a3)
{
  int v6 = hasVXD();
  int v7 = hasVXD();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v9 = Mutable;
  if (v6)
  {
    if (v7) {
      setIntValue(Mutable, (const __CFString *)*MEMORY[0x263F0ED58], 1280);
    }
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE20], @"PurpleGfxMem");
  }
  unsigned int v10 = (a1 + 15) & 0xFFFFFFF0;
  if (a3 == 1111970369) {
    char v11 = 2;
  }
  else {
    char v11 = 1;
  }
  int v12 = (v10 << v11) * ((a2 + 15) & 0xFFFFFFF0);
  setIntValue(v9, (const __CFString *)*MEMORY[0x263F0ED50], v10 << v11);
  setIntValue(v9, (const __CFString *)*MEMORY[0x263F0EF50], a1);
  setIntValue(v9, (const __CFString *)*MEMORY[0x263F0EDF8], a2);
  setIntValue(v9, (const __CFString *)*MEMORY[0x263F0EE48], a3);
  setIntValue(v9, (const __CFString *)*MEMORY[0x263F0ED30], v12);
  return v9;
}

uint64_t hasVXD(void)
{
  if (byte_267B9C4E1 == 1) {
    return _MergedGlobals_4;
  }
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceMatching("AppleVXD375");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  CFDictionaryRef v4 = IOServiceMatching("AppleVXD390");
  uint64_t result = (MatchingService | IOServiceGetMatchingService(v1, v4)) != 0;
  _MergedGlobals_4 = result;
  byte_267B9C4E1 = 1;
  return result;
}

void setIntValue(__CFDictionary *a1, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

CVPixelBufferRef createPlanar420PixelBufferFromJPEGFile()
{
  CFURLRef v0 = (const __CFURL *)MEMORY[0x270FA5388]();
  uint64_t v13 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  if (CFURLGetFileSystemRepresentation(v0, 1u, buffer, 4096))
  {
    mach_port_t v1 = fopen((const char *)buffer, "rb");
    IOSurfaceRef surface = 0;
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      fseek(v1, 0, 2);
      uint64_t v3 = MEMORY[0x21D44B6C0](v2);
      fseek(v2, 0, 0);
      CFDictionaryRef v4 = (UInt8 *)malloc_type_malloc(v3, 0x95957028uLL);
      if (v4)
      {
        CFNumberRef v5 = v4;
        fread(v4, v3, 1uLL, v2);
        fclose(v2);
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFDataRef v7 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v3, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
        if (v7)
        {
          CFDataRef v8 = v7;
          MEMORY[0x21D44B000](v7, 0, &surface);
          CVPixelBufferCreateWithIOSurface(v6, surface, 0, &pixelBufferOut);
          CFRelease(surface);
          CFRelease(v8);
          return pixelBufferOut;
        }
        fwrite("Couldn't create input data\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      }
      else
      {
        fclose(v2);
      }
    }
  }
  return 0;
}

CVPixelBufferRef createPlanar420PixelBufferFromImageFile(const __CFURL *a1)
{
  mach_port_t v1 = CGImageSourceCreateWithURL(a1, 0);
  CVPixelBufferRef pixelBufferOut = 0;
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v1, 0, 0);
    DataProvider = CGImageGetDataProvider(ImageAtIndex);
    CFDataRef v5 = CGDataProviderCopyData(DataProvider);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
    CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
    size_t Width = CGImageGetWidth(ImageAtIndex);
    size_t Height = CGImageGetHeight(ImageAtIndex);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    IOSurfacePropertiesDictionary = fcssCreateIOSurfacePropertiesDictionary(Width, Height, 875704422);
    if (IOSurfacePropertiesDictionary)
    {
      int v12 = IOSurfacePropertiesDictionary;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04130], IOSurfacePropertiesDictionary);
      CFRelease(v12);
    }
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x34323066u, Mutable, &pixelBufferOut))
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      CFDataRef v76 = v5;
      BytePtr = CFDataGetBytePtr(v5);
      int BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
      CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
      os_log_t v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
      unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL);
      uint64_t v20 = (BitsPerPixel >> 3);
      uint64_t v21 = (BytesPerRow - v20 * Width);
      unsigned int v22 = Height >> 1;
      if (AlphaInfo == kCGImageAlphaFirst) {
        v23 = BytePtr + 1;
      }
      else {
        v23 = BytePtr;
      }
      uint64_t v24 = BytesPerRowOfPlane;
      uint64_t v25 = 2 * v20;
      uint64_t v26 = v21 + 2;
      uint64_t v27 = v21 + (BitsPerPixel >> 3);
      do
      {
        uint64_t v28 = 0;
        v29 = &v23[v25];
        unsigned int v30 = Width >> 1;
        do
        {
          v31 = &BaseAddressOfPlane[v28];
          LOBYTE(v18) = *v23;
          LOBYTE(v19) = v23[1];
          *(float *)&unsigned int v32 = (float)LODWORD(v19) * 0.5872;
          float v33 = *(float *)&v32 + (float)((float)LODWORD(v18) * 0.2988);
          LOBYTE(v32) = v23[2];
          float v34 = (float)(v33 + (float)((float)v32 * 0.114)) + 0.5;
          unsigned int v35 = 1132396544;
          if (v34 >= 0.0) {
            float v36 = v34;
          }
          else {
            float v36 = 0.0;
          }
          if (v34 <= 255.0) {
            float v37 = v36;
          }
          else {
            float v37 = 255.0;
          }
          v38 = &v16[v28];
          char *v31 = (int)v37;
          LOBYTE(v37) = *v23;
          LOBYTE(v36) = v23[1];
          *(float *)&unsigned int v39 = (float)LODWORD(v36) * -0.3391;
          float v40 = *(float *)&v39 + (float)((float)LODWORD(v37) * -0.1726);
          LOBYTE(v39) = v23[2];
          float v41 = (float)(v40 + (float)((float)v39 * 0.5117)) + 128.5;
          if (v41 >= 0.0) {
            float v42 = v41;
          }
          else {
            float v42 = 0.0;
          }
          if (v41 <= 255.0) {
            float v43 = v42;
          }
          else {
            float v43 = 255.0;
          }
          char *v38 = (int)v43;
          LOBYTE(v43) = *v23;
          LOBYTE(v42) = v23[1];
          *(float *)&unsigned int v44 = (float)LODWORD(v42) * -0.4282;
          float v45 = *(float *)&v44 + (float)((float)LODWORD(v43) * 0.5115);
          LOBYTE(v44) = v23[2];
          float v46 = (float)(v45 + (float)((float)v44 * -0.083)) + 128.5;
          if (v46 >= 0.0) {
            float v47 = v46;
          }
          else {
            float v47 = 0.0;
          }
          if (v46 <= 255.0) {
            float v48 = v47;
          }
          else {
            float v48 = 255.0;
          }
          v38[1] = (int)v48;
          v49 = &v23[v20];
          v50 = &v23[v20 + 1];
          LOBYTE(v48) = *v49;
          LOBYTE(v47) = *v50;
          *(float *)&unsigned int v51 = (float)LODWORD(v47) * 0.5872;
          float v52 = *(float *)&v51 + (float)((float)LODWORD(v48) * 0.2988);
          LOBYTE(v51) = v50[1];
          float v53 = (float)(v52 + (float)((float)v51 * 0.114)) + 0.5;
          if (v53 >= 0.0) {
            float v54 = v53;
          }
          else {
            float v54 = 0.0;
          }
          if (v53 <= 255.0) {
            float v55 = v54;
          }
          else {
            float v55 = 255.0;
          }
          v56 = v29;
          v31[1] = (int)v55;
          LOBYTE(v55) = *v38;
          LOBYTE(v35) = *(v50 - 1);
          *(float *)&unsigned int v57 = (float)v35;
          float v58 = (float)LODWORD(v55) + (float)(*(float *)&v57 * -0.1726);
          LOBYTE(v57) = *v50;
          *(float *)&unsigned int v59 = (float)v57;
          float v60 = v58 + (float)(*(float *)&v59 * -0.3391);
          LOBYTE(v59) = v50[1];
          float v61 = (float)((float)(v60 + (float)((float)v59 * 0.5117)) + 128.5) * 0.5;
          float v62 = 255.0;
          if (v61 <= 255.0)
          {
            float v62 = 0.0;
            if (v61 >= 0.0) {
              float v62 = v61;
            }
          }
          char *v38 = (int)v62;
          LOBYTE(v61) = v38[1];
          LOBYTE(v62) = *(v50 - 1);
          *(float *)&unsigned int v63 = (float)LODWORD(v62);
          float v64 = (float)LODWORD(v61) + (float)(*(float *)&v63 * 0.5115);
          LOBYTE(v63) = *v50;
          *(float *)&unsigned int v65 = (float)v63;
          float v66 = v64 + (float)(*(float *)&v65 * -0.4282);
          LOBYTE(v65) = v50[1];
          float v18 = (float)((float)(v66 + (float)((float)v65 * -0.083)) + 128.5) * 0.5;
          float v19 = 255.0;
          if (v18 <= 255.0)
          {
            float v19 = 0.0;
            if (v18 >= 0.0) {
              float v19 = v18;
            }
          }
          v38[1] = (int)v19;
          v23 = &v49[v20];
          v28 += 2;
          v29 += v25;
          --v30;
        }
        while (v30);
        v67 = &BaseAddressOfPlane[v28];
        unsigned int v68 = Width >> 1;
        do
        {
          LOBYTE(v18) = v56[v26 - 2];
          LOBYTE(v19) = v56[v26 - 1];
          *(float *)&unsigned int v69 = (float)LODWORD(v19) * 0.5872;
          float v70 = *(float *)&v69 + (float)((float)LODWORD(v18) * 0.2988);
          LOBYTE(v69) = v56[v26];
          *(float *)&unsigned int v71 = (float)v69;
          *(float *)&unsigned int v72 = (float)(v70 + (float)(*(float *)&v71 * 0.114)) + 0.5;
          char *v67 = (int)*(float *)&v72;
          LOBYTE(v72) = v56[v27];
          LOBYTE(v71) = v56[v27 + 1];
          *(float *)&unsigned int v73 = (float)v71 * 0.5872;
          float v74 = *(float *)&v73 + (float)((float)v72 * 0.2988);
          LOBYTE(v73) = v56[v27 + 2];
          float v19 = (float)v73;
          float v18 = (float)(v74 + (float)(v19 * 0.114)) + 0.5;
          BaseAddressOfPlane = v67 + 2;
          v67[1] = (int)v18;
          v56 += v25;
          v67 += 2;
          --v68;
        }
        while (v68);
        v23 = &v56[2 * (BytesPerRow - v20 * Width)];
        v16 += v24;
        --v22;
      }
      while (v22);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      CFDataRef v5 = v76;
    }
    CGImageRelease(ImageAtIndex);
    CFRelease(v2);
    if (v5) {
      CFRelease(v5);
    }
  }
  return pixelBufferOut;
}

double ccCardRect()
{
  return 0.0;
}

double ccArea1RectScaleIndependent()
{
  return 0.101067865;
}

double ccArea1Rect(float a1)
{
  double v1 = a1;
  v3.size.width = a1 * 68.61;
  v3.size.height = a1 * 4.89;
  v3.origin.x = a1 * 8.66;
  v3.origin.y = v1 * 54.05 + v1 * -19.14 - v3.size.height;
  *(void *)&double result = (unint64_t)CGRectInset(v3, -8.0, -2.0);
  return result;
}

double ccArea2RectScaleIndependent()
{
  return 0.0715411099;
}

double ccArea2Rect(float a1)
{
  double v1 = a1;
  v3.size.width = a1 * 69.34;
  v3.size.height = a1 * 15.29;
  v3.origin.x = a1 * 6.13;
  v3.origin.y = v1 * 54.05 + v1 * -2.54 - v3.size.height;
  *(void *)&double result = (unint64_t)CGRectInset(v3, -8.0, -2.0);
  return result;
}

double ccUnitRectToMMRect(double a1)
{
  return a1 * 85.685;
}

double ccMMRectToUnitRect(double a1)
{
  return a1 / 85.685;
}

double ccUnitRectToMMRectIsPortrait(int a1, double a2)
{
  double v2 = 54.05;
  if (!a1) {
    double v2 = 85.685;
  }
  return a2 * v2;
}

double ccMMRectToUnitRectIsPortait(int a1, double a2)
{
  double v2 = 54.05;
  if (!a1) {
    double v2 = 85.685;
  }
  return a2 / v2;
}

void *allocatePixel8Buffer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  a3[1] = a2;
  a3[2] = a1;
  a3[3] = a1;
  double result = malloc_type_malloc(a2 * a1, 0xECB503B9uLL);
  *a3 = result;
  return result;
}

void rotateBuffer180(vImage_Buffer *a1)
{
  vImagePixelCount width = a1->width;
  v3.height = a1->height;
  v3.vImagePixelCount width = width;
  v3.rowBytes = width;
  v3.data = malloc_type_malloc(v3.height * width, 0xECB503B9uLL);
  vImageRotate90_Planar8(a1, &v3, 2u, 0, 0);
  free(a1->data);
  a1->data = v3.data;
}

float calculateImageBlur(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263F1EF40]);
  vImage_Buffer v3 = (void *)[v2 initWithCIImage:v1 options:MEMORY[0x263EFFA78]];
  id v4 = objc_alloc_init(MEMORY[0x263F1EF30]);
  CFDataRef v5 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
  id v13 = 0;
  [v3 performRequests:v5 error:&v13];
  id v6 = v13;

  CFDataRef v7 = [v4 results];
  CFDataRef v8 = [v7 firstObject];
  v9 = [v8 blurScore];
  [v9 floatValue];
  float v11 = v10;

  return v11;
}

void sub_2177534D4(_Unwind_Exception *a1)
{
  CFDataRef v8 = v5;

  _Unwind_Resume(a1);
}

BOOL isLeastBlurryFrame(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  float v7 = calculateImageBlur(v5);
  if ([v6 count] >= (unint64_t)a3)
  {
    float v11 = [v6 valueForKeyPath:@"@min.self"];
    [v11 floatValue];
    float v13 = v12;

    [v6 removeObjectAtIndex:0];
    *(float *)&double v14 = v7;
    v15 = [NSNumber numberWithFloat:v14];
    [v6 addObject:v15];

    BOOL v10 = v7 < v13;
  }
  else
  {
    *(float *)&double v8 = v7;
    v9 = [NSNumber numberWithFloat:v8];
    [v6 addObject:v9];

    BOOL v10 = 0;
  }

  return v10;
}

void sub_217753638(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2177575A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217757758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177578A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217757A00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t cr_dispatch_async(uint64_t a1, uint64_t a2)
{
  return +[CRInsights dispatchAsyncOnQueue:a1 block:a2];
}

CGImageSource *createCGImageFromFile(uint64_t a1)
{
  double result = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:a1], 0);
  if (result)
  {
    id v2 = result;
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(result, 0, 0);
    CFRelease(v2);
    return ImageAtIndex;
  }
  return result;
}

void _findCodeRectInImage(_OWORD *a1, uint64_t a2, __n128 a3, __n128 a4)
{
  long long v4 = a1[1];
  v5[0] = *a1;
  v5[1] = v4;
  _findCodeRectInImageWithModel(a3, a4, (uint64_t)v5, a2, 95158272, 0);
}

void _findCodeRectInImageWithModel(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v7 = a6;
  __n128 v6 = a2;
  __n128 v8 = a1;
  uint64_t v9 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_2177585C4(_Unwind_Exception *exception_object)
{
}

uint64_t findTopLeftIndex(CGPoint *a1)
{
  double x = a1[1].x;
  double y = a1[1].y;
  unsigned int v3 = (int)(a1->x - x) * (int)(a1->x - x) + (int)(a1->y - y) * (int)(a1->y - y);
  unsigned int v4 = (int)(x - a1[2].x) * (int)(x - a1[2].x) + (int)(y - a1[2].y) * (int)(y - a1[2].y);
  BOOL v5 = v3 > v4;
  BOOL v6 = v3 <= v4;
  if (v5) {
    unsigned int v7 = 2;
  }
  else {
    unsigned int v7 = 3;
  }
  if ((int)(a1[v6].y * a1[v6].y + a1[v6].x * a1[v6].x) >= (int)(a1[v7].y * a1[v7].y + a1[v7].x * a1[v7].x)) {
    return v6;
  }
  else {
    return v7;
  }
}

BOOL _segmentHomeKitCodeImages(_OWORD *a1, CGPoint *a2, CFArrayRef *a3)
{
  double x = a2->x;
  double y = a2->y;
  long long v6 = a1[1];
  v10[0] = *a1;
  v10[1] = v6;
  _perspectiveCorrectImageWithTargetRect(x, y, 170.0, 64.0, (uint64_t)v10, a2, v11);
  v9[0] = v11[0];
  v9[1] = v11[1];
  BOOL DigitCodeImages = extractDigitCodeImages(v9, a3, 10);
  free(*(void **)&v11[0]);
  return DigitCodeImages;
}

uint64_t _segmentCodeImages(_OWORD *a1, CGPoint *a2, CFArrayRef *a3)
{
  double x = a2->x;
  double y = a2->y;
  long long v8 = a1[1];
  v16[0] = *a1;
  v16[1] = v8;
  _perspectiveCorrectImageWithTargetRect(x, y, 272.0, 64.0, (uint64_t)v16, a2, &v17);
  v15[0] = v17;
  v15[1] = v18;
  BOOL DigitCodeImages = extractDigitCodeImages(v15, a3, 16);
  free((void *)v17);
  if (DigitCodeImages) {
    return 1;
  }
  long long v11 = a1[1];
  v14[0] = *a1;
  v14[1] = v11;
  _perspectiveCorrectImageWithTargetRect(x, y, 204.0, 64.0, (uint64_t)v14, a2, &v17);
  v13[0] = v17;
  v13[1] = v18;
  BOOL v10 = extractDigitCodeImages(v13, a3, 12);
  free((void *)v17);
  return v10;
}

uint64_t _recognizeCodeImages(const __CFArray *a1, char *a2, int *a3, float a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  CFIndex Count = CFArrayGetCount(a1);
  CFIndex v9 = Count;
  if ((int)Count >= 1)
  {
    CFIndex v10 = 0;
    uint64_t v11 = Count;
    uint64_t v53 = 0;
    float v12 = 1.0;
    float v13 = 0.0;
    while (1)
    {
      ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"height");
      CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"width");
      CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"rowBytes");
      CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"data");
      char valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
      char v55 = 0;
      CFNumberGetValue(v16, kCFNumberSInt8Type, &v55);
      char v54 = 0;
      CFNumberGetValue(v17, kCFNumberSInt8Type, &v54);
      float v19 = (UInt8 *)malloc_type_calloc(valuePtr * (uint64_t)v55, 1uLL, 0x100004077774924uLL);
      v67.length = CFDataGetLength(v18);
      v67.location = 0;
      CFDataGetBytes(v18, v67, v19);
      long long v64 = xmmword_2177A1750;
      if (!v55 || !valuePtr)
      {
        a2[v10] = 45;
        goto LABEL_30;
      }
      uint64_t v20 = (char *)malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      int8x16_t v23 = vld1q_dup_s8((const char *)v19);
      *(int8x16_t *)uint64_t v20 = v23;
      *((int8x16_t *)v20 + 1) = v23;
      *((int8x16_t *)v20 + 2) = v23;
      *((int8x16_t *)v20 + 3) = v23;
      *((int8x16_t *)v20 + 4) = v23;
      *((int8x16_t *)v20 + 5) = v23;
      *((int8x16_t *)v20 + 6) = v23;
      *((int8x16_t *)v20 + 7) = v23;
      *((int8x16_t *)v20 + 8) = v23;
      *((int8x16_t *)v20 + 9) = v23;
      *((int8x16_t *)v20 + 10) = v23;
      *((int8x16_t *)v20 + 11) = v23;
      *((int8x16_t *)v20 + 12) = v23;
      *((int8x16_t *)v20 + 13) = v23;
      *((int8x16_t *)v20 + 14) = v23;
      *((int8x16_t *)v20 + 15) = v23;
      *((int8x16_t *)v20 + 16) = v23;
      *((int8x16_t *)v20 + 17) = v23;
      *((int8x16_t *)v20 + 18) = v23;
      *((int8x16_t *)v20 + 19) = v23;
      *((int8x16_t *)v20 + 20) = v23;
      *((int8x16_t *)v20 + 21) = v23;
      *((int8x16_t *)v20 + 22) = v23;
      *((int8x16_t *)v20 + 23) = v23;
      uint64_t v24 = v20 + 2;
      uint64_t v25 = v19;
      *((int8x16_t *)v20 + 24) = v23;
      do
      {
        for (uint64_t i = 0; i != 16; ++i)
          v24[i] = v25[i];
        ++v22;
        v24 += 20;
        v25 += 16;
      }
      while (v22 != 20);
      if (v9 != 10) {
        break;
      }
      if (v10 != 6 && v10 != 3)
      {
        uint64_t v27 = CNNQueue(void)::CNNQueue;
        if (!CNNQueue(void)::CNNQueue)
        {
          uint64_t v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
          CNNQueue(void)::CNNQueue = (uint64_t)v27;
        }
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v58 = 3221225472;
        uint64_t v28 = __codeImage2char10_block_invoke;
        goto LABEL_24;
      }
      LOBYTE(v29) = 45;
      int v65 = 45;
      LODWORD(v64) = 1065353216;
      free(v20);
      float v30 = 1.0;
LABEL_29:
      a2[v10] = v29;
      *(float *)&a3[v10] = v30;
      float v12 = v12 * v30;
LABEL_30:
      free(v19);
      if (v12 < a4) {
        return 0;
      }
      if (++v10 == v11) {
        goto LABEL_35;
      }
    }
    if (v9 == 12)
    {
      uint64_t v27 = CNNQueue(void)::CNNQueue;
      if (!CNNQueue(void)::CNNQueue)
      {
        uint64_t v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
        CNNQueue(void)::CNNQueue = (uint64_t)v27;
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v58 = 3221225472;
      uint64_t v28 = __codeImage2char12_block_invoke;
    }
    else
    {
      uint64_t v27 = CNNQueue(void)::CNNQueue;
      if (!CNNQueue(void)::CNNQueue)
      {
        uint64_t v27 = dispatch_queue_create("com.apple.CoreRecognition.CNNQueue", 0);
        CNNQueue(void)::CNNQueue = (uint64_t)v27;
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v58 = 3221225472;
      uint64_t v28 = __codeImage2char_block_invoke;
    }
LABEL_24:
    unsigned int v59 = v28;
    float v60 = &__block_descriptor_56_e5_v8__0l;
    float v61 = v21;
    float v62 = &v65;
    unsigned int v63 = &v64;
    dispatch_sync(v27, &block);
    unsigned int v29 = v65;
    free(v21);
    float v30 = *(float *)&v64;
    if (v29 >= 0x5B)
    {
      int v31 = v29 - 111 > 0x26
         || ((1 << (v29 - 111)) & 0x5806854059) == 0;
      float v13 = v13 + *(float *)&v64;
      LODWORD(v53) = v53 + 1;
      HIDWORD(v53) += v31;
    }
    goto LABEL_29;
  }
  uint64_t v53 = 0;
  float v13 = 0.0;
LABEL_35:
  if ((int)v9 >= 0) {
    int v32 = v9;
  }
  else {
    int v32 = v9 + 1;
  }
  if ((int)v53 > v32 >> 1 || v13 > 4.0 || SHIDWORD(v53) > 0)
  {
    if ((int)v9 > 1)
    {
      uint64_t v35 = (v32 >> 1);
      uint64_t v36 = (v9 << 32) - 0x100000000;
      float v37 = a2;
      v38 = a3;
      do
      {
        char v39 = *v37;
        *v37++ = a2[v36 >> 32];
        a2[v36 >> 32] = v39;
        int v40 = *v38;
        *v38++ = *(int *)((char *)a3 + (v36 >> 30));
        *(int *)((char *)a3 + (v36 >> 30)) = v40;
        v36 -= 0x100000000;
        --v35;
      }
      while (v35);
    }
    if ((int)v9 < 1) {
      return 2;
    }
    uint64_t v41 = v9;
    float v42 = a2;
    while (1)
    {
      unsigned int v43 = *v42;
      if (v43 <= 0x55)
      {
        char v44 = 74;
        switch(*v42)
        {
          case 'A':
            char v44 = 86;
            goto LABEL_71;
          case 'B':
          case 'D':
          case 'F':
          case 'G':
          case 'H':
          case 'I':
          case 'K':
            goto LABEL_62;
          case 'C':
            goto LABEL_71;
          case 'E':
            char v44 = 51;
            goto LABEL_71;
          case 'J':
            char v44 = 67;
            goto LABEL_71;
          case 'L':
            char v44 = 55;
            goto LABEL_71;
          case 'M':
            char v44 = 87;
            goto LABEL_71;
          default:
            switch(*v42)
            {
              case '3':
                char v44 = 69;
                goto LABEL_71;
              case '4':
              case '5':
              case '8':
                goto LABEL_62;
              case '6':
                char v44 = 57;
                goto LABEL_71;
              case '7':
                char v44 = 76;
                goto LABEL_71;
              case '9':
                char v44 = 54;
                goto LABEL_71;
              default:
                if (v43 != 45) {
                  goto LABEL_62;
                }
                char v44 = 45;
                break;
            }
            goto LABEL_71;
        }
      }
      if (v43 == 86) {
        break;
      }
      if (v43 == 87)
      {
        char v44 = 77;
        goto LABEL_71;
      }
      if (v43 == 89) {
        break;
      }
LABEL_62:
      if (v43 >= 0x5B)
      {
        char v44 = v43 - 60;
        goto LABEL_71;
      }
LABEL_72:
      ++v42;
      if (!--v41)
      {
        uint64_t result = 2;
        goto LABEL_99;
      }
    }
    char v44 = 65;
LABEL_71:
    *float v42 = v44;
    goto LABEL_72;
  }
  if ((int)v9 < 1) {
    return 1;
  }
  uint64_t v46 = v9;
  float v47 = a2;
  do
  {
    unsigned int v48 = *v47;
    if (v48 < 0x5B) {
      goto LABEL_97;
    }
    if (*v47 <= 0x91u)
    {
      char v49 = 74;
      switch(*v47)
      {
        case 125:
          char v49 = 86;
          break;
        case 126:
        case -128:
        case -126:
        case -125:
        case -124:
        case -123:
        case -121:
          goto LABEL_88;
        case 127:
          goto LABEL_96;
        case -127:
          char v49 = 51;
          break;
        case -122:
          char v49 = 67;
          break;
        case -120:
          char v49 = 55;
          break;
        case -119:
          char v49 = 87;
          break;
        default:
          switch(*v47)
          {
            case 'o':
              char v49 = 69;
              break;
            case 'r':
              char v49 = 57;
              break;
            case 's':
              char v49 = 76;
              break;
            case 'u':
              char v49 = 54;
              break;
            default:
              goto LABEL_88;
          }
          break;
      }
      goto LABEL_96;
    }
    if (v48 != 146)
    {
      if (v48 == 147)
      {
        char v49 = 77;
        goto LABEL_96;
      }
      if (v48 != 149)
      {
LABEL_88:
        char v49 = v48 - 60;
        goto LABEL_96;
      }
    }
    char v49 = 65;
LABEL_96:
    *float v47 = v49;
LABEL_97:
    ++v47;
    --v46;
  }
  while (v46);
  uint64_t result = 1;
LABEL_99:
  if (v9 == 10)
  {
    uint64_t v50 = 0;
    while (1)
    {
      unsigned int v51 = a2[v50];
      if (v51 > 0x50) {
        break;
      }
      if (v51 != 45)
      {
        if (v51 != 68) {
          goto LABEL_104;
        }
        goto LABEL_108;
      }
LABEL_111:
      if (++v50 == 10) {
        return result;
      }
    }
    if (v51 == 84)
    {
      char v52 = 49;
    }
    else
    {
      if (v51 != 81)
      {
LABEL_104:
        if (v51 - 58 < 0xFFFFFFF6) {
          return 0;
        }
        goto LABEL_111;
      }
LABEL_108:
      char v52 = 48;
    }
    a2[v50] = v52;
    goto LABEL_111;
  }
  return result;
}

void _perspectiveCorrectImageWithTargetRect(double a1, double a2, double a3, double a4, uint64_t a5, CGPoint *a6, void *a7)
{
  float v12 = malloc_type_calloc((unint64_t)a4 * (unint64_t)a3, 1uLL, 0x100004077774924uLL);
  findTopLeftIndex(a6);
  find_homography();
  applyHomograpyMatrix();
  uint64_t v11 = malloc_type_calloc((unint64_t)a4 * (unint64_t)a3, 1uLL, 0x100004077774924uLL);
  correctHistogram();
  free(v12);
  *a7 = v11;
  a7[1] = (unint64_t)a4;
  a7[2] = (unint64_t)a3;
  a7[3] = (unint64_t)a3;
}

BOOL extractDigitCodeImages(long long *a1, CFArrayRef *a2, uint64_t a3)
{
  v184 = a2;
  v215[5] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  uint64_t v191 = v6;
  v192 = (char *)(&v183 - 4 * v6);
  bzero(v192, 32 * v5);
  size_t v7 = *((void *)a1 + 1);
  size_t v8 = *((void *)a1 + 2);
  v204 = malloc_type_calloc(v7 * v8, 1uLL, 0x100004077774924uLL);
  size_t v205 = v7;
  size_t v206 = v8;
  size_t v207 = v8;
  long long v9 = a1[1];
  long long v202 = *a1;
  long long v203 = v9;
  adaptiveThresholdIntegralImage();
  CFIndex v10 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  uint64_t v11 = (char *)malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
  float v12 = v11;
  *(void *)&long long v189 = v7;
  unint64_t v13 = v7 - 15;
  if (v7 - 15 >= 0x10)
  {
    uint64_t v14 = 15;
    do
    {
      if (v8 - 15 >= 0x10)
      {
        uint64_t v15 = *(void *)&v11[8 * v14];
        uint64_t v16 = *(void *)a1 + 15;
        size_t v17 = v8 - 30;
        do
        {
          v15 += ~*(unsigned char *)(v16 + v14 * *((void *)a1 + 3));
          *(void *)&v11[8 * v14] = v15;
          ++v16;
          --v17;
        }
        while (v17);
      }
      ++v14;
    }
    while (v14 != v13);
  }
  uint64_t v185 = a3;
  CFIndex v18 = (int)a3;
  int v19 = (int)((double)(v7 >> 1) + -10.0);
  unint64_t v20 = v19;
  uint64_t v21 = v19 + 20;
  unint64_t v22 = *(void *)&v11[8 * v19];
  unint64_t v23 = v21 - v19;
  if (v23 >= 2)
  {
    unint64_t v29 = (v23 & 0xFFFFFFFFFFFFFFFELL) + v19;
    int64x2_t v30 = vdupq_n_s64(v22);
    int v31 = (int64x2_t *)&v11[8 * v19 + 16];
    int64x2_t v32 = 0uLL;
    unint64_t v33 = v23 & 0xFFFFFFFFFFFFFFFELL;
    int64x2_t v34 = 0uLL;
    int64x2_t v35 = 0uLL;
    int64x2_t v36 = 0uLL;
    int64x2_t v37 = 0uLL;
    do
    {
      int8x16_t v38 = (int8x16_t)v30;
      int64x2_t v32 = vaddq_s64(v31[-2], v32);
      int64x2_t v34 = vaddq_s64(*(int64x2_t *)((char *)v31 - 24), v34);
      int64x2_t v30 = *(int64x2_t *)((char *)v31 - 8);
      int64x2_t v35 = vaddq_s64(v35, (int64x2_t)vextq_s8(v38, (int8x16_t)v30, 8uLL));
      int64x2_t v36 = vaddq_s64(v30, v36);
      int64x2_t v39 = *v31++;
      int64x2_t v37 = vaddq_s64(v39, v37);
      v33 -= 2;
    }
    while (v33);
    uint64_t v28 = vaddvq_s64(v37);
    uint64_t v27 = vaddvq_s64(v36);
    uint64_t v26 = vaddvq_s64(v35);
    uint64_t v25 = vaddvq_s64(v34);
    uint64_t v24 = vaddvq_s64(v32);
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_15;
    }
    unint64_t v22 = v30.u64[1];
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    unint64_t v29 = v20;
  }
  int v40 = &v11[8 * v29 + 16];
  uint64_t v41 = v21 - v29;
  do
  {
    v24 += *((void *)v40 - 4);
    v25 += *((void *)v40 - 3);
    v26 += v22;
    unint64_t v22 = *((void *)v40 - 1);
    v27 += v22;
    v28 += *(void *)v40;
    v40 += 8;
    --v41;
  }
  while (v41);
LABEL_15:
  uint64_t v42 = 0;
  v215[0] = v24;
  v215[1] = v25;
  v215[2] = v26;
  v215[3] = v27;
  int v43 = 2;
  v215[4] = v28;
  do
  {
    if (v215[v42] > v215[v43]) {
      int v43 = v42;
    }
    ++v42;
  }
  while (v42 != 5);
  int v44 = v20 + v43 - 2;
  if (v8)
  {
    uint64_t v45 = 0;
    uint64_t v46 = *(void *)a1;
    do
    {
      uint64_t v47 = 0;
      uint64_t v48 = v10[v45];
      do
      {
        v48 += ~*(unsigned char *)(v46 + v45 + *((void *)a1 + 3) * (v44 + v47));
        v10[v45] = v48;
        ++v47;
      }
      while (v47 != 20);
      ++v45;
    }
    while (v45 != v8);
  }
  CFIndex v188 = v18;
  int v49 = (int)((double)(v8 >> 1) - (double)((unint64_t)(*((void *)a1 + 2) - 40) >> 1));
  uint64_t v186 = (v20 + v43 - 2);
  double v50 = (double)v44;
  unsigned int v51 = (uint64_t *)malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  char v52 = v51;
  if (v8)
  {
    uint64_t v53 = 0;
    double v54 = v50 + 20.0;
    char v55 = v204;
    uint64_t v56 = (int)v186;
    do
    {
      if (v54 > v50)
      {
        uint64_t v57 = v51[v53];
        int v58 = v20 + v43 - 1;
        uint64_t v59 = v56;
        do
        {
          if (!v55[v53 + v207 * v59]) {
            ++v57;
          }
          v51[v53] = v57;
          ++v59;
          double v60 = (double)v58++;
        }
        while (v54 > v60);
      }
      ++v53;
    }
    while (v53 != v8);
  }
  double v61 = (double)v49;
  if (v49 >= 11)
  {
    do
    {
      if (v51[(int)v61] < 1) {
        break;
      }
      double v61 = v61 + -1.0;
    }
    while (v61 > 10.0);
  }
  unint64_t v62 = *((void *)a1 + 2);
  for (i = (double)v62; v61 < i; double v61 = v61 + 1.0)
  {
    if (v51[(int)v61]) {
      break;
    }
  }
  double v64 = v61 + -1.0;
  int v65 = v185;
  MEMORY[0x270FA5388]();
  CFRange v67 = (int *)((char *)&v183 - v66);
  bzero((char *)&v183 - v66, (4 * v68) | 1);
  int v69 = (int)v64;
  int *v67 = (int)v64;
  uint64_t v70 = v191;
  if (v65 >= 2)
  {
    uint64_t v71 = 1;
    do
    {
      v69 += 16;
      if (v8 <= v69) {
        int v69 = v8 - 1;
      }
      LODWORD(v72) = v69 - 3;
      if (v8 > v69 - 3)
      {
        size_t v72 = (int)v72;
        int64_t v73 = v69 + 2;
        do
        {
          if (v10[v72] < v10[v69]) {
            int v69 = v72;
          }
          if ((uint64_t)v72 >= v73) {
            break;
          }
          ++v72;
        }
        while (v8 > v72);
      }
      v67[v71++] = v69;
    }
    while (v71 != v70);
  }
  double v74 = (double)v67[v188 - 1] - v64 + 8.0;
  for (j = (double)(v62 - 20); v74 < j; double v74 = v74 + 1.0)
  {
    if (v64 + v74 >= i) {
      break;
    }
    if (v52[(int)(v64 + v74)] < 1) {
      break;
    }
  }
  v67[v188] = (int)(v64 + v74);
  if ((int)v185 < 1)
  {
LABEL_63:
    LOBYTE(v79) = 1;
  }
  else
  {
    uint64_t v76 = 0;
    int v77 = *v67;
    do
    {
      int v78 = v67[++v76];
      LOBYTE(v79) = v77 + 1 >= v78;
      if (v77 + 1 >= v78) {
        break;
      }
      uint64_t v80 = v77;
      uint64_t v81 = SLODWORD(v52[v77]);
      while (1)
      {
        int v82 = v80 + 1;
        if (v62 > v80 + 1 && v52[v80 + 1] > v81) {
          break;
        }
        ++v80;
        if (v78 - 1 == v82) {
          goto LABEL_63;
        }
      }
      int v77 = v67[v76];
    }
    while (v76 != v70);
  }
  *(void *)&long long v190 = v67;
  free(v10);
  free(v52);
  free(v12);
  free(v204);
  v83 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if ((int)v185 <= 0)
  {
    CFAllocatorRef v96 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v188, MEMORY[0x263EFFF70]);
  }
  else
  {
    uint64_t v84 = v190;
    v85 = (int *)(v190 + 4);
    int v86 = *(_DWORD *)v190;
    uint64_t v87 = v191;
    v88 = v192 + 16;
    uint64_t v89 = v191;
    int v90 = *(_DWORD *)v190;
    do
    {
      *((void *)v88 + 1) = 0x4034000000000000;
      *((double *)v88 - 2) = (double)v90;
      *((double *)v88 - 1) = v50;
      int v91 = *v85++;
      *(double *)v88 = (double)(v91 - v90);
      v88 += 32;
      int v90 = v91;
      --v89;
    }
    while (v89);
    v92 = (int *)(v84 + 4);
    uint64_t v93 = v87;
    int v94 = v86;
    do
    {
      int v95 = *v92++;
      LOBYTE(v79) = ((v95 - v94 - 19) < 0xFFFFFFF5) | v79;
      int v94 = v95;
      --v93;
    }
    while (v93);
    CFAllocatorRef v96 = *v83;
    v97 = CFArrayCreateMutable(*v83, v188, MEMORY[0x263EFFF70]);
    CFArrayRef Mutable = v97;
    if (v79)
    {
      LOBYTE(v79) = 1;
    }
    else
    {
      uint64_t v99 = 0;
      int v79 = 0;
      uint64_t v187 = (int)v186;
      CFIndex v188 = (CFIndex)v97;
      uint64_t v186 = 8 * (int)v186;
      CGFloat v100 = 0.0;
      CGFloat v101 = 0.0;
      CGFloat v102 = 0.0;
      CGFloat v103 = 0.0;
      do
      {
        double v104 = (double)v86;
        uint64_t v105 = v99 + 1;
        int v106 = *(_DWORD *)(v190 + 4 * (v99 + 1));
        double v107 = (double)(v106 - v86);
        v108 = malloc_type_calloc(v189, 8uLL, 0x100004000313F17uLL);
        if (v13 >= 0x10)
        {
          double v109 = v104 + v107;
          for (uint64_t k = 15; k != v13; ++k)
          {
            if (v109 > v104)
            {
              uint64_t v111 = v108[k];
              uint64_t v112 = *(void *)a1 + v86;
              int v113 = v86 + 1;
              do
              {
                v111 += ~*(unsigned char *)(v112 + k * *((void *)a1 + 3));
                v108[k] = v111;
                double v114 = (double)v113++;
                ++v112;
              }
              while (v109 > v114);
            }
          }
        }
        v115 = (const double *)&v108[v187];
        int8x16_t v116 = (int8x16_t)vld1q_dup_f64(v115);
        int64x2_t v117 = 0uLL;
        int64x2_t v118 = 0uLL;
        v119 = (char *)v108 + v186;
        int64x2_t v120 = 0uLL;
        uint64_t v121 = 40;
        int64x2_t v122 = 0uLL;
        int64x2_t v123 = 0uLL;
        int64x2_t v124 = 0uLL;
        int64x2_t v125 = 0uLL;
        int64x2_t v126 = 0uLL;
        int64x2_t v127 = 0uLL;
        int64x2_t v128 = 0uLL;
        int64x2_t v129 = 0uLL;
        do
        {
          int64x2_t v117 = vaddq_s64(*(int64x2_t *)&v119[v121 - 80], v117);
          int64x2_t v118 = vaddq_s64(*(int64x2_t *)&v119[v121 - 72], v118);
          int64x2_t v120 = vaddq_s64(*(int64x2_t *)&v119[v121 - 64], v120);
          int64x2_t v122 = vaddq_s64(*(int64x2_t *)&v119[v121 - 56], v122);
          int64x2_t v130 = *(int64x2_t *)&v119[v121 - 32];
          int64x2_t v123 = vaddq_s64(*(int64x2_t *)&v119[v121 - 48], v123);
          int64x2_t v124 = vaddq_s64(v124, (int64x2_t)vextq_s8(v116, (int8x16_t)v130, 8uLL));
          int64x2_t v125 = vaddq_s64(v130, v125);
          int64x2_t v126 = vaddq_s64(*(int64x2_t *)&v119[v121 - 24], v126);
          int64x2_t v127 = vaddq_s64(*(int64x2_t *)&v119[v121 - 16], v127);
          int64x2_t v128 = vaddq_s64(*(int64x2_t *)&v119[v121 - 8], v128);
          int64x2_t v129 = vaddq_s64(*(int64x2_t *)&v119[v121], v129);
          v121 += 16;
          int8x16_t v116 = (int8x16_t)v130;
        }
        while (v121 != 200);
        uint64_t v131 = 0;
        *(void *)&long long v132 = vaddvq_s64(v127);
        *(void *)&long long v133 = vaddvq_s64(v125);
        *(void *)&long long v134 = vaddvq_s64(v123);
        *(void *)&long long v135 = vaddvq_s64(v120);
        *(void *)&long long v136 = vaddvq_s64(v117);
        *((void *)&v136 + 1) = vaddvq_s64(v118);
        *((void *)&v135 + 1) = vaddvq_s64(v122);
        *(_OWORD *)&v210.data = v136;
        *(_OWORD *)&v210.vImagePixelCount width = v135;
        *((void *)&v134 + 1) = vaddvq_s64(v124);
        *((void *)&v133 + 1) = vaddvq_s64(v126);
        long long v211 = v134;
        long long v212 = v133;
        *((void *)&v132 + 1) = vaddvq_s64(v128);
        long long v213 = v132;
        uint64_t v214 = vaddvq_s64(v129);
        int v137 = 5;
        do
        {
          if (*((void *)&v210.data + v131) > *((void *)&v210.data + v137)) {
            int v137 = v131;
          }
          ++v131;
        }
        while (v131 != 11);
        CGFloat v138 = v50 + (double)(v137 - 5);
        free(v108);
        v216.size.height = 20.0;
        v216.origin.double x = (double)v86;
        v216.origin.double y = v138;
        v216.size.vImagePixelCount width = (double)(v106 - v86);
        v217.origin.double x = v103;
        v217.origin.double y = v102;
        v217.size.vImagePixelCount width = v101;
        v217.size.height = v100;
        v79 |= CGRectEqualToRect(v216, v217);
        v139 = (CGFloat *)&v192[32 * v99];
        CGFloat *v139 = v104;
        v139[1] = v138;
        v139[2] = v107;
        v139[3] = 20.0;
        int v86 = v106;
        ++v99;
        CGFloat v100 = 20.0;
        CGFloat v101 = v107;
        CGFloat v102 = v138;
        CGFloat v103 = v104;
      }
      while (v105 != v191);
      uint64_t v140 = v191;
      v141 = (double *)(v192 + 8);
      float v142 = 0.0;
      uint64_t v143 = v191;
      do
      {
        double v144 = *v141;
        v141 += 4;
        float v142 = v144 + v142;
        --v143;
      }
      while (v143);
      float v145 = v142 / (float)(int)v185;
      v146 = (double *)(v192 + 8);
      float v147 = 0.0;
      uint64_t v148 = v191;
      do
      {
        double v149 = *v146;
        v146 += 4;
        float v147 = v147 + (v145 - v149) * (v145 - v149);
        --v148;
      }
      while (v148);
      unint64_t v150 = 0;
      float v151 = sqrtf(v147 / (float)(int)v185);
      float v152 = v145 + v151;
      double v153 = (float)(v145 - v151);
      v154 = (double *)(v192 + 40);
      v155 = v192;
      do
      {
        double v156 = *(v154 - 4);
        if (v156 < v153 || v156 > v152)
        {
          float v158 = v145;
          if (!v150 || (float v158 = *(double *)&v155[32 * (v150 - 1) + 8], v159 = v145, v150 <= 0xA)) {
            double v159 = *v154;
          }
          float v160 = v159;
          *(v154 - 4) = (float)((float)(v158 + v160) * 0.5);
        }
        ++v150;
        v154 += 4;
      }
      while (v140 != v150);
      CFIndex v161 = 0;
      long long v189 = *(_OWORD *)off_26429E380;
      long long v190 = xmmword_26429E370;
      do
      {
        v162 = (double *)&v192[32 * v161];
        double v163 = v162[2];
        double v164 = v162[3];
        v165 = malloc_type_calloc((unint64_t)v164 * (unint64_t)v163, 1uLL, 0x100004077774924uLL);
        v166 = v165;
        uint64_t v167 = (int)v164;
        if ((int)v167 >= 1)
        {
          uint64_t v168 = 0;
          uint64_t v169 = *((void *)a1 + 2);
          v170 = (char *)(*(void *)a1 + v169 * (int)v162[1] + (int)*v162);
          v171 = v165;
          do
          {
            v172 = v170;
            v173 = v171;
            uint64_t v174 = (int)v163;
            if ((int)v163 >= 1)
            {
              do
              {
                char v175 = *v172++;
                *v173++ = v175;
                --v174;
              }
              while (v174);
            }
            ++v168;
            v171 += (int)v163;
            v170 += v169;
          }
          while (v168 != v167);
        }
        v210.data = malloc_type_calloc((unint64_t)v164 * (unint64_t)v163, 1uLL, 0x100004077774924uLL);
        v210.height = (unint64_t)v164;
        v210.vImagePixelCount width = (unint64_t)v163;
        v210.rowBytes = (unint64_t)v163;
        v198 = v166;
        unint64_t v199 = (unint64_t)v164;
        unint64_t v200 = (unint64_t)v163;
        unint64_t v201 = (unint64_t)v163;
        vImage_Buffer v197 = v210;
        correctHistogram();
        free(v166);
        char v196 = 20;
        char v195 = 16;
        char v194 = 16;
        v193.data = malloc_type_calloc(0x140uLL, 1uLL, 0x100004077774924uLL);
        v193.height = v196;
        v193.vImagePixelCount width = v195;
        v193.rowBytes = v194;
        vImageScale_Planar8(&v210, &v193, 0, 0x10u);
        CFDataRef v176 = CFDataCreate(v96, (const UInt8 *)v193.data, v195 * (uint64_t)v196);
        CFNumberRef v177 = CFNumberCreate(v96, kCFNumberSInt8Type, &v195);
        CFNumberRef v178 = CFNumberCreate(v96, kCFNumberSInt8Type, &v196);
        CFNumberRef v179 = CFNumberCreate(v96, kCFNumberSInt8Type, &v194);
        v209[0] = v190;
        v209[1] = v189;
        v208[0] = v176;
        v208[1] = v178;
        v208[2] = v177;
        v208[3] = v179;
        CFDictionaryRef v180 = CFDictionaryCreate(v96, (const void **)v209, v208, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFArraySetValueAtIndex((CFMutableArrayRef)v188, v161, v180);
        free(v210.data);
        free(v193.data);
        CFRelease(v177);
        CFRelease(v178);
        CFRelease(v179);
        CFRelease(v176);
        CFRelease(v180);
        ++v161;
      }
      while (v161 != v191);
      CFArrayRef Mutable = (const __CFArray *)v188;
    }
  }
  Copdouble y = CFArrayCreateCopy(v96, Mutable);
  CFArrayRef *v184 = Copy;
  CFRelease(Mutable);
  return (v79 & 1) == 0;
}

double rectFromPoints(uint64_t a1)
{
  uint64_t v1 = 0;
  int v2 = 0;
  int v3 = 0;
  int v4 = 0x7FFFFFFF;
  int v5 = 0x7FFFFFFF;
  do
  {
    double v6 = (double)v5;
    double v7 = *(double *)(a1 + v1);
    double v8 = *(double *)(a1 + v1 + 8);
    if (v7 <= (double)v5) {
      double v6 = *(double *)(a1 + v1);
    }
    int v5 = (int)v6;
    double v9 = (double)v3;
    if (v7 >= (double)v3) {
      double v9 = *(double *)(a1 + v1);
    }
    int v3 = (int)v9;
    double v10 = (double)v4;
    if (v8 <= (double)v4) {
      double v10 = *(double *)(a1 + v1 + 8);
    }
    int v4 = (int)v10;
    double v11 = (double)v2;
    if (v8 >= (double)v2) {
      double v11 = *(double *)(a1 + v1 + 8);
    }
    int v2 = (int)v11;
    v1 += 16;
  }
  while (v1 != 64);
  return (double)v5;
}

void calculatePointsWithPaddingInCorrectedSpace(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7, double a8, float a9, double a10, double a11)
{
  *(double *)&v66[16] = a7;
  *(double *)&v66[24] = a8;
  *(double *)uint64_t v66 = a5;
  *(double *)&v66[8] = a6;
  uint64_t v92 = *MEMORY[0x263EF8340];
  double v15 = *a1;
  double v16 = a1[1];
  double v17 = *a2;
  double v18 = a2[1];
  double v19 = *a3;
  double v20 = a3[1];
  double v22 = *a4;
  double v21 = a4[1];
  float v23 = *a4 - *a3;
  float v24 = v21 - v20;
  float v62 = hypotf(v23, v24);
  float v25 = v17 - v15;
  float v26 = v18 - v16;
  float v61 = hypotf(v25, v26);
  float v27 = v22 - v15;
  float v28 = v21 - v16;
  float v29 = hypotf(v27, v28);
  float v30 = v17 - v19;
  float v31 = v18 - v20;
  float v32 = hypotf(v30, v31);
  float v33 = v62 / v61;
  float v34 = v29 / v32;
  if ((float)(v62 / v61) <= 1.0) {
    float v33 = 1.0 / (float)(v62 / v61);
  }
  if (v34 <= 1.0) {
    float v34 = 1.0 / v34;
  }
  if (v34 <= v33) {
    float v35 = v33;
  }
  else {
    float v35 = v34;
  }
  if (v35 > 2.0)
  {
    double v36 = 2.0 / v35;
    float v34 = v36 * v34;
    float v33 = v36 * v33;
  }
  float v37 = fmaxf(v29, v32);
  float v38 = fmaxf(v62, v61) * v34;
  uint64_t v75 = *(void *)v66;
  uint64_t v76 = *(void *)&v66[8];
  float v39 = v37 * v33;
  double v40 = v38;
  double v77 = *(double *)v66 + *(double *)&v66[16];
  uint64_t v78 = *(void *)&v66[8];
  double v41 = (float)(v37 * v33);
  double v79 = *(double *)v66 + *(double *)&v66[16];
  double v80 = *(double *)&v66[8] + *(double *)&v66[24];
  uint64_t v81 = *(void *)v66;
  double v82 = *(double *)&v66[8] + *(double *)&v66[24];
  long long v42 = *(_OWORD *)a3;
  long long v71 = *(_OWORD *)a4;
  long long v72 = v42;
  long long v43 = *(_OWORD *)a1;
  long long v73 = *(_OWORD *)a2;
  long long v74 = v43;
  find_homography();
  double v44 = a9;
  double v45 = a11;
  if (v38 <= v39) {
    double v46 = a11;
  }
  else {
    double v46 = a10;
  }
  if (v38 <= v39) {
    double v45 = a10;
  }
  float v47 = v46 / v40 * v44;
  float v48 = v45 / v41 * v44;
  CGRect v95 = CGRectInset(*(CGRect *)v66, -(v40 * v47), -(v41 * v48));
  uint64_t v49 = 0;
  *(CGFloat *)&long long v67 = v95.origin.x;
  *((void *)&v67 + 1) = *(void *)&v95.origin.y;
  *(double *)&long long v68 = v95.origin.x + v95.size.width;
  *((void *)&v68 + 1) = *(void *)&v95.origin.y;
  *(double *)&long long v69 = v95.origin.x + v95.size.width;
  *((double *)&v69 + 1) = v95.origin.y + v95.size.height;
  *(CGFloat *)&long long v70 = v95.origin.x;
  *((double *)&v70 + 1) = v95.origin.y + v95.size.height;
  double v50 = v87;
  double v51 = v90;
  double v52 = v84;
  float64x2_t v53 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v83), 0);
  float64x2_t v54 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v85), 0);
  float64x2_t v55 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v89), 0);
  float64x2_t v56 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v91), 0);
  float64x2_t v57 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v86), 0);
  float64x2_t v58 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v88), 0);
  do
  {
    uint64_t v59 = (double *)((char *)&v67 + v49);
    float64x2x2_t v93 = vld2q_f64(v59);
    float64x2_t v60 = vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v51), v55, v93.val[0]), v56);
    v94.val[0] = vdivq_f64(vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v52), v53, v93.val[0]), v54), v60);
    v94.val[1] = vdivq_f64(vaddq_f64(vmlaq_f64(vmulq_n_f64(v93.val[1], v50), v57, v93.val[0]), v58), v60);
    vst2q_f64(v59, v94);
    v49 += 32;
  }
  while (v49 != 64);
  *(_OWORD *)a4 = v67;
  *(_OWORD *)a3 = v68;
  *(_OWORD *)a2 = v69;
  *(_OWORD *)a1 = v70;
}

void __codeImage2char12_block_invoke(uint64_t a1)
{
  std::vector<unsigned char>::vector(&v6, 0x190uLL);
  for (uint64_t i = 0; i != 400; ++i)
    *((unsigned char *)v6 + i) = *(unsigned char *)(*(void *)(a1 + 32) + i);
  int v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreRecognition"), "resourcePath"), "stringByAppendingPathComponent:", @"model12.bin"), "UTF8String");
  uint64_t v4 = sCNN12;
  if (!sCNN12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    uint64_t v4 = CNN::CNNFromModel((const char *)__p);
    sCNN12 = v4;
    if (v9 < 0)
    {
      operator delete(__p[0]);
      uint64_t v4 = sCNN12;
    }
  }
  memset(v5, 0, sizeof(v5));
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v5, v6, v7, v7 - (void)v6);
  CNN::ClassifyOne(v4, (uint64_t *)v5);
}

void sub_21775A3B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void __codeImage2char10_block_invoke(uint64_t a1)
{
  std::vector<unsigned char>::vector(&v6, 0x190uLL);
  for (uint64_t i = 0; i != 400; ++i)
    *((unsigned char *)v6 + i) = *(unsigned char *)(*(void *)(a1 + 32) + i);
  int v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreRecognition"), "resourcePath"), "stringByAppendingPathComponent:", @"modelHK.bin"), "UTF8String");
  uint64_t v4 = sCNN10;
  if (!sCNN10)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    uint64_t v4 = CNN::CNNFromModel((const char *)__p);
    sCNN10 = v4;
    if (v9 < 0)
    {
      operator delete(__p[0]);
      uint64_t v4 = sCNN10;
    }
  }
  memset(v5, 0, sizeof(v5));
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v5, v6, v7, v7 - (void)v6);
  CNN::ClassifyOne(v4, (uint64_t *)v5);
}

void sub_21775A508(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void __codeImage2char_block_invoke(uint64_t a1)
{
  std::vector<unsigned char>::vector(&v6, 0x190uLL);
  for (uint64_t i = 0; i != 400; ++i)
    *((unsigned char *)v6 + i) = *(unsigned char *)(*(void *)(a1 + 32) + i);
  int v3 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreRecognition"), "resourcePath"), "stringByAppendingPathComponent:", @"model.bin"), "UTF8String");
  uint64_t v4 = sCNN;
  if (!sCNN)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, v3);
    uint64_t v4 = CNN::CNNFromModel((const char *)__p);
    sCNN = v4;
    if (v9 < 0)
    {
      operator delete(__p[0]);
      uint64_t v4 = sCNN;
    }
  }
  memset(v5, 0, sizeof(v5));
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v5, v6, v7, v7 - (void)v6);
  CNN::ClassifyOne(v4, (uint64_t *)v5);
}

void sub_21775A65C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    double v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    double v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26429DEF0, MEMORY[0x263F8C060]);
}

void sub_21775A7BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    size_t v4 = (char *)a1[1];
    size_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_21775A85C(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    double v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21775A934(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void __clang_call_terminate(void *a1)
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    size_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21775AA5C(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  size_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    size_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      size_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    double v15 = &v14[8 * v11];
    double v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    double v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

id _creditCardImage2stringCTCSegment(void *a1, const int *a2, uint64_t a3, uint64_t **a4)
{
  id v6 = a1;
  uint64_t v7 = [MEMORY[0x263F089D8] string];
  size_t v8 = [MEMORY[0x263F089D8] string];
  uint64_t v9 = [MEMORY[0x263F089D8] string];
  MEMORY[0x21D44B1A0](v45);
  CTCLayer::setCodeMap((CTCLayer *)v45, a2);
  memset(v44, 0, sizeof(v44));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v44, *a4, a4[1], 0xAAAAAAAAAAAAAAABLL * (a4[1] - *a4));
  CTCLayer::setActivations();
  long long v42 = v44;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
  CTCLayer::pathDecodingCTCSegment();
  CTCLayer::pathDecodingCTCSegment();
  CTCLayer::pathDecodingCTCSegment();
  unint64_t v10 = (char *)v42;
  uint64_t v11 = v43;
  while (v10 != v11)
  {
    uint64_t v12 = unicodeToNSString();
    [v7 appendString:v12];

    v10 += 4;
  }
  for (uint64_t i = (char *)v40; i != v41; i += 4)
  {
    uint64_t v14 = unicodeToNSString();
    [v8 appendString:v14];
  }
  for (double j = (char *)__p; j != v39; j += 4)
  {
    double v16 = unicodeToNSString();
    [v9 appendString:v16];
  }
  double v17 = [MEMORY[0x263EFF980] array];
  float v34 = v6;
  float v35 = 0;
  double v36 = 0;
  uint64_t v37 = 0;
  std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v35, v47, v48, (v48 - v47) >> 3);
  uint64_t v18 = v35;
  double v19 = v36;
  if (v35 != v36)
  {
    double v20 = v35;
    do
    {
      double v21 = [NSNumber numberWithInteger:(int)v20[1]];
      [v17 addObject:v21];

      v20 += 2;
    }
    while (v20 != v19);
  }
  if (v18) {
    operator delete(v18);
  }
  double v22 = NSDictionary;
  float v23 = (void *)MEMORY[0x263EFF8C0];
  float v33 = [NSNumber numberWithInt:v46];
  float v32 = objc_msgSend(v23, "arrayWithObjects:", v7, v17, v33, 0);
  float v24 = (void *)MEMORY[0x263EFF8C0];
  float v25 = [NSNumber numberWithInt:v46];
  float v26 = objc_msgSend(v24, "arrayWithObjects:", v8, v17, v25, 0);
  float v27 = (void *)MEMORY[0x263EFF8C0];
  float v28 = [NSNumber numberWithInt:v46];
  float v29 = objc_msgSend(v27, "arrayWithObjects:", v9, v17, v28, 0);
  float v30 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v32, @"CardNumber", v26, @"Cardholder", v29, @"Expiration", 0);

  if (__p)
  {
    float v39 = (char *)__p;
    operator delete(__p);
  }
  if (v40)
  {
    double v41 = (char *)v40;
    operator delete(v40);
  }
  if (v42)
  {
    long long v43 = (char *)v42;
    operator delete(v42);
  }
  MEMORY[0x21D44B1B0](v45);

  return v30;
}

void sub_21775AFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a24) {
    operator delete(a24);
  }
  if (a27) {
    operator delete(a27);
  }
  MEMORY[0x21D44B1B0](&a33);

  _Unwind_Resume(a1);
}

id decodeCreditCardNumberActivations(uint64_t **a1, const int *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a1[1] != *a1)
  {
    MEMORY[0x21D44B1A0](v73);
    CTCLayer::setCodeMap((CTCLayer *)v73, a2);
    memset(v72, 0, sizeof(v72));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v72, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    long long v70 = v72;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
    CTCLayer::getMaxActivations((CTCLayer *)v73);
    CTCLayer::setCummulativeScores((CTCLayer *)v73);
    CTCLayer::bestPathDecoding((uint64_t *)&v70, (CTCLayer *)v73);
    if (v71 != v70)
    {
      __p = 0;
      long long v68 = 0;
      uint64_t v69 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v70, (uint64_t)v71, (v71 - (unsigned char *)v70) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        long long v68 = __p;
        operator delete(__p);
      }
    }
    double v44 = v4;
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v6 = (char *)v70;
    uint64_t v7 = v71;
    while (v6 != v7)
    {
      size_t v8 = unicodeToNSString();
      [v5 appendString:v8];

      v6 += 4;
    }
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    CTCLayer::pathDecodingFixedLengthInjectSpaces((CTCLayer *)v73);
    id v48 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v47 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v46 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
    double v45 = v5;
    id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v14 = objc_alloc_init(MEMORY[0x263F089D8]);
    for (uint64_t i = v65; i != v66; i += 4)
    {
      double v16 = unicodeToNSString();
      [v48 appendString:v16];
    }
    for (double j = v63; j != v64; j += 4)
    {
      uint64_t v18 = unicodeToNSString();
      [v47 appendString:v18];
    }
    for (uint64_t k = v61; k != v62; k += 4)
    {
      double v20 = unicodeToNSString();
      [v46 appendString:v20];
    }
    for (m = v59; m != v60; m += 4)
    {
      double v22 = unicodeToNSString();
      [v9 appendString:v22];
    }
    for (n = v57; n != v58; n += 4)
    {
      float v24 = unicodeToNSString();
      [v10 appendString:v24];
    }
    for (iuint64_t i = v55; ii != v56; ii += 4)
    {
      float v26 = unicodeToNSString();
      [v11 appendString:v26];
    }
    for (jdouble j = v53; jj != v54; jj += 4)
    {
      float v28 = unicodeToNSString();
      [v12 appendString:v28];
    }
    for (kuint64_t k = v51; kk != v52; kk += 4)
    {
      float v30 = unicodeToNSString();
      [v13 appendString:v30];
    }
    for (mm = v49; mm != v50; mm += 4)
    {
      float v32 = unicodeToNSString();
      [v14 appendString:v32];
    }
    id v4 = v44;
    float v33 = (void *)[NSString _newZStringWithString:v45];
    [v44 addObject:v33];

    float v34 = (void *)[NSString _newZStringWithString:v48];
    [v44 addObject:v34];

    float v35 = (void *)[NSString _newZStringWithString:v47];
    [v44 addObject:v35];

    double v36 = (void *)[NSString _newZStringWithString:v46];
    [v44 addObject:v36];

    uint64_t v37 = (void *)[NSString _newZStringWithString:v10];
    [v44 addObject:v37];

    float v38 = (void *)[NSString _newZStringWithString:v9];
    [v44 addObject:v38];

    float v39 = (void *)[NSString _newZStringWithString:v11];
    [v44 addObject:v39];

    double v40 = (void *)[NSString _newZStringWithString:v12];
    [v44 addObject:v40];

    double v41 = (void *)[NSString _newZStringWithString:v13];
    [v44 addObject:v41];

    long long v42 = (void *)[NSString _newZStringWithString:v14];
    [v44 addObject:v42];

    if (v49) {
      operator delete(v49);
    }
    if (v51) {
      operator delete(v51);
    }
    if (v53) {
      operator delete(v53);
    }
    if (v55) {
      operator delete(v55);
    }
    if (v57) {
      operator delete(v57);
    }
    if (v59) {
      operator delete(v59);
    }
    if (v61) {
      operator delete(v61);
    }
    if (v63) {
      operator delete(v63);
    }
    if (v65) {
      operator delete(v65);
    }

    if (v70)
    {
      long long v71 = (char *)v70;
      operator delete(v70);
    }
    MEMORY[0x21D44B1B0](v73);
  }
  return v4;
}

void sub_21775B868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  if (__p) {
    operator delete(__p);
  }
  if (a45) {
    operator delete(a45);
  }
  MEMORY[0x21D44B1B0](&a51);

  _Unwind_Resume(a1);
}

void sub_21775BB04()
{
  JUMPOUT(0x21775BB14);
}

id decodeCreditCardExpirationActivations(uint64_t **a1, const int *a2)
{
  v34[3] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (a1[1] != *a1)
  {
    MEMORY[0x21D44B1A0](v30);
    CTCLayer::setCodeMap((CTCLayer *)v30, a2);
    memset(v29, 0, sizeof(v29));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v29, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    v27[0] = v29;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v27);
    CTCLayer::getMaxActivations((CTCLayer *)v30);
    CTCLayer::setCummulativeScores((CTCLayer *)v30);
    CTCLayer::bestPathDecoding((uint64_t *)v27, (CTCLayer *)v30);
    if (v27[1] != v27[0])
    {
      __p = 0;
      float v25 = 0;
      uint64_t v26 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v27[0], (uint64_t)v27[1], ((char *)v27[1] - (char *)v27[0]) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        float v25 = __p;
        operator delete(__p);
      }
    }
    double v20 = 0;
    uint64_t v21 = 0;
    double v19 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v19, v27[0], (uint64_t)v27[1], ((char *)v27[1] - (char *)v27[0]) >> 2);
    CTCLayer::injectSpaces();
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    *(_OWORD *)float v27 = v22;
    uint64_t v28 = v23;
    uint64_t v23 = 0;
    long long v22 = 0uLL;
    if (v19)
    {
      double v20 = v19;
      operator delete(v19);
    }
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v6 = (char *)v27[0];
    uint64_t v7 = (char *)v27[1];
    while (v6 != v7)
    {
      size_t v8 = unicodeToNSString();
      [v5 appendString:v8];

      v6 += 4;
    }
    id v9 = [MEMORY[0x263EFF980] array];
    long long v22 = 0uLL;
    uint64_t v23 = 0;
    std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v22, v32, v33, (v33 - v32) >> 3);
    long long v10 = v22;
    if ((void)v22 != *((void *)&v22 + 1))
    {
      uint64_t v11 = v22;
      do
      {
        id v12 = [NSNumber numberWithInteger:2 * (int)*(float *)(v11 + 4)];
        [v9 addObject:v12];

        v11 += 8;
      }
      while (v11 != *((void *)&v10 + 1));
    }
    if ((void)v10) {
      operator delete((void *)v10);
    }
    v34[0] = v5;
    v34[1] = v9;
    id v13 = [NSNumber numberWithInt:(2 * v31)];
    v34[2] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
    [v4 setObject:v14 forKey:@"FastScanningCTCSegmentKey"];

    double v15 = +[ActivationMapTools textFromActivationMap:a1 codeMap:a2 invert:0];
    double v16 = v15;
    if (v15)
    {
      double v17 = [v15 objectForKey:@"Expiration"];
      if (v17) {
        [v4 setObject:v17 forKey:@"FastScanningPatternSearchKey"];
      }
    }
    if (v27[0])
    {
      v27[1] = v27[0];
      operator delete(v27[0]);
    }
    MEMORY[0x21D44B1B0](v30);
  }
  return v4;
}

void sub_21775BEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (__p) {
    operator delete(__p);
  }
  MEMORY[0x21D44B1B0](&a25);

  _Unwind_Resume(a1);
}

id decodeCreditCardholderActivations(uint64_t **a1, const int *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a1[1] != *a1)
  {
    MEMORY[0x21D44B1A0](v31);
    CTCLayer::setCodeMap((CTCLayer *)v31, a2);
    memset(v30, 0, sizeof(v30));
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v30, *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
    CTCLayer::setActivations();
    v28[0] = v30;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v28);
    CTCLayer::getMaxActivations((CTCLayer *)v31);
    CTCLayer::setCummulativeScores((CTCLayer *)v31);
    CTCLayer::bestPathDecoding((uint64_t *)v28, (CTCLayer *)v31);
    if (v28[1] != v28[0])
    {
      __p = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
      CTCLayer::computeScore();
      if (__p)
      {
        uint64_t v26 = __p;
        operator delete(__p);
      }
    }
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    double v20 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v20, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
    CTCLayer::removeNoise();
    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    *(_OWORD *)uint64_t v28 = v23;
    uint64_t v29 = v24;
    uint64_t v24 = 0;
    long long v23 = 0uLL;
    if (v20)
    {
      uint64_t v21 = v20;
      operator delete(v20);
    }
    id v5 = [MEMORY[0x263EFF980] array];
    int64_t v6 = v33;
    long long v23 = 0uLL;
    uint64_t v24 = 0;
    std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(&v23, v34, v35, (v35 - v34) >> 3);
    long long v7 = v23;
    if ((void)v23 != *((void *)&v23 + 1))
    {
      unint64_t v8 = 0;
      uint64_t v9 = v23;
      do
      {
        if ((uint64_t)v8 >= v6 && v6 + (((char *)v28[1] - (char *)v28[0]) >> 2) > v8)
        {
          long long v10 = [NSNumber numberWithInteger:2 * (int)*(float *)(v9 + 4)];
          [v5 addObject:v10];
        }
        ++v8;
        v9 += 8;
      }
      while (v9 != *((void *)&v7 + 1));
    }
    if ((void)v7) {
      operator delete((void *)v7);
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    double v17 = 0;
    std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v17, v28[0], (uint64_t)v28[1], ((char *)v28[1] - (char *)v28[0]) >> 2);
    CTCLayer::injectSpaces();
    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    *(_OWORD *)uint64_t v28 = v23;
    uint64_t v29 = v24;
    uint64_t v24 = 0;
    long long v23 = 0uLL;
    if (v17)
    {
      uint64_t v18 = v17;
      operator delete(v17);
    }
    id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v12 = (char *)v28[0];
    id v13 = (char *)v28[1];
    while (v12 != v13)
    {
      id v14 = unicodeToNSString();
      [v11 appendString:v14];

      v12 += 4;
    }
    [v4 addObject:v11];
    [v4 addObject:v5];
    double v15 = [NSNumber numberWithInt:(2 * v32)];
    [v4 addObject:v15];

    if (v28[0])
    {
      v28[1] = v28[0];
      operator delete(v28[0]);
    }
    MEMORY[0x21D44B1B0](v31);
  }
  return v4;
}

void sub_21775C314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21) {
    operator delete(a21);
  }
  MEMORY[0x21D44B1B0](&a27);

  _Unwind_Resume(a1);
}

void *std::vector<std::pair<float,float>>::__init_with_size[abi:ne180100]<std::pair<float,float>*,std::pair<float,float>*>(void *result, unsigned char *a2, unsigned char *a3, unint64_t a4)
{
  if (a4)
  {
    id v5 = result;
    if (a4 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t result = operator new(8 * a4);
    unint64_t v8 = result;
    void *v5 = result;
    v5[1] = result;
    _OWORD v5[2] = &result[a4];
    if (a2 != a3)
    {
      size_t v9 = ((a3 - a2 - 8) & 0xFFFFFFFFFFFFFFF8) + 8;
      uint64_t result = memcpy(result, a2, v9);
      unint64_t v8 = (void *)((char *)v8 + v9);
    }
    v5[1] = v8;
  }
  return result;
}

void sub_21775C498(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(void *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    int64_t v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_21775C51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  id v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    int64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3));
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21775C684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int64_t v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_21775C700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  id v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2);
      uint64_t v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21775C7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21775C834(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      id v5 = *(void **)(v3 - 24);
      v3 -= 24;
      uint64_t v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      id v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void ****)(a1 + 16);
  uint64_t v2 = **(void ****)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 3;
    uint64_t v3 = v1;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
}

void std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21775CB58(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CNN::convertByteToFloatVector(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, float a7)
{
  unint64_t v7 = a3 - a2;
  if (a3 != a2)
  {
    uint64_t v8 = *(void *)(result + 8);
    unsigned int v9 = *(_DWORD *)(v8 + 76);
    if (v9 > 3) {
      exit(1);
    }
    for (unint64_t i = 0; v7 > i; ++i)
    {
      if (v9)
      {
        if (v9 == 2)
        {
          double v12 = *(double *)(v8 + 88);
          float v11 = *(double *)(v8 + 80);
          goto LABEL_9;
        }
        if (v9 == 1)
        {
          float v11 = *(double *)(*(void *)(v8 + 96) + 8 * i);
          double v12 = *(double *)(*(void *)(v8 + 120) + 8 * i);
LABEL_9:
          float v13 = v12;
          goto LABEL_12;
        }
        float v11 = 15.0;
        float v13 = 256.0;
      }
      else
      {
        float v13 = 1.0;
        float v11 = 0.0;
      }
LABEL_12:
      LOBYTE(a7) = *(unsigned char *)(a2 + i);
      a7 = (float)LODWORD(a7);
      if (v7 - 1 > i || (float v14 = 1.0, !*(unsigned char *)(v8 + 40))) {
        float v14 = (float)(a7 - v11) / v13;
      }
      *(float *)(a4 + 4 * i) = v14;
    }
  }
  return result;
}

uint64_t CNN::feedForward(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t))(***(void ***)(a1 + 112) + 16))(**(void **)(a1 + 112), **(void **)a3, a2);
  if (*(_DWORD *)(a1 + 104))
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = *(void (****)(void, void, void))(*(void *)(a1 + 112) + 8 * v6);
      (**v7)(v7, *(void *)(*(void *)a3 + 8 * v6), *(void *)(*(void *)(a3 + 152) + 8 * v6));
      uint64_t v8 = *(void *)(*(void *)(a1 + 112) + 8 * v6);
      (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v8 + 48))(v8, a3, v6);
      uint64_t v9 = *(void *)(*(void *)(a1 + 112) + 8 * v6);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(*(void *)v9 + 40))(v9, *(void *)(*(void *)(a3 + 200) + 8 * v6), *(void *)(*(void *)(a3 + 24) + 8 * v6));
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 104));
  }
  return result;
}

void *matrix<float>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C40;
  uint64_t v2 = a1[3];
  if (v2) {
    MEMORY[0x21D44B3E0](v2, 0x1000C8052888210);
  }
  return a1;
}

void CNN::CNN(CNN *this, Corpus *a2, NetworkParameters *a3)
{
  *((void *)this + 3) = 0xBFF0000000000000;
  *((void *)this + 4) = 0;
  unint64_t v6 = (char *)this + 32;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *(void *)this = &unk_26C7B1B38;
  *((void *)this + 1) = 0;
  *((void *)this + 8) = 0;
  double v44 = (CNNSignals ***)((char *)this + 64);
  *((void *)this + 14) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  unsigned int v7 = *((_DWORD *)a3 + 3);
  *((void *)this + 17) = &unk_26C7B18E8;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 38) = 1;
  *((_WORD *)this + 78) = 0;
  ThreadPoolAuto::setupCommon((uint64_t)this + 136, 0, v7, 0, 0x78u);
  *((void *)this + 1) = a2;
  *((void *)this + 20) = a3;
  MEMORY[0x21D44B210](v6, "convolutional-neural-net");
  uint64_t v8 = *((void *)this + 20);
  *((_DWORD *)this + 4) = *(_DWORD *)(v8 + 184);
  *((double *)this + 12) = *(float *)(v8 + 172);
  unsigned int v43 = *(_DWORD *)(v8 + 112);
  if (*(_DWORD *)(*((void *)this + 1) + 32) != v43 * v43) {
    exit(3456);
  }
  unsigned int v9 = *((_DWORD *)this + 38);
  int v10 = *(_DWORD *)(v8 + 16) * v9;
  *((_DWORD *)this + 14) = v10;
  *((_DWORD *)this + 15) = v9;
  if (v9 == 1)
  {
    *((_DWORD *)this + 15) = v10;
    unsigned int v9 = v10;
  }
  uint64_t v11 = v9;
  float v13 = (char *)*((void *)this + 8);
  double v12 = (char *)*((void *)this + 9);
  unint64_t v14 = (v12 - v13) >> 3;
  if (v9 <= v14)
  {
    if (v9 >= v14) {
      goto LABEL_21;
    }
    uint64_t v24 = &v13[8 * v9];
  }
  else
  {
    unint64_t v15 = v9 - v14;
    uint64_t v16 = *((void *)this + 10);
    if (v15 > (v16 - (uint64_t)v12) >> 3)
    {
      uint64_t v17 = v16 - (void)v13;
      if (v17 >> 2 > (unint64_t)v9) {
        uint64_t v11 = v17 >> 2;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v11;
      }
      if (v18 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v19 = (char *)operator new(8 * v18);
      double v20 = &v19[8 * v14];
      uint64_t v21 = &v19[8 * v18];
      bzero(v20, 8 * v15);
      uint64_t v22 = &v20[8 * v15];
      if (v12 != v13)
      {
        do
        {
          uint64_t v23 = *((void *)v12 - 1);
          v12 -= 8;
          *((void *)v20 - 1) = v23;
          v20 -= 8;
        }
        while (v12 != v13);
        double v12 = v13;
      }
      *((void *)this + 8) = v20;
      *((void *)this + 9) = v22;
      *((void *)this + 10) = v21;
      if (v12)
      {
        operator delete(v12);
        unsigned int v9 = *((_DWORD *)this + 15);
      }
LABEL_21:
      if (v9) {
        operator new();
      }
      int v25 = 0;
      uint64_t v26 = *(void *)(*((void *)this + 20) + 200);
      if (*(void *)(*((void *)this + 20) + 208) == v26)
      {
LABEL_54:
        if (v25) {
          CNNSignals::prepareLayer(**v44, 0, 0);
        }
        operator new();
      }
      uint64_t v27 = 0;
      unsigned int v28 = 0;
      while (1)
      {
        uint64_t v29 = *(const void **)(v26 + 8 * v27);
        if (v29)
        {
          if (v30)
          {
            (**v30)(v30);
            uint64_t v32 = *(void *)(*(void *)(*((void *)this + 20) + 200) + 8 * (v28 + 1));
            (*(void (**)(uint64_t))(*(void *)v32 + 40))(v32);
            int v33 = *((_DWORD *)this + 15);
            if (v28)
            {
              if (v33) {
                CNNSignals::prepareLayer(**v44, 0, 0);
              }
              operator new();
            }
            if (v33) {
              CNNSignals::prepareLayer(**v44, 0, 1);
            }
            operator new();
          }
          if (v31)
          {
            if (!(v43 % (**v31)(v31)))
            {
              uint64_t v34 = *(void *)(*(void *)(*((void *)this + 20) + 200) + 8 * (v28 + 1));
              (*(void (**)(uint64_t))(*(void *)v34 + 40))(v34);
              if (*((_DWORD *)this + 15)) {
                CNNSignals::prepareLayer(**v44, 0, 0);
              }
              operator new();
            }
            exit(12345);
          }
          if (v42) {
            break;
          }
        }
        uint64_t v26 = *(void *)(*((void *)this + 20) + 200);
        uint64_t v27 = ++v28;
        if (v28 >= (unint64_t)((*(void *)(*((void *)this + 20) + 208) - v26) >> 3))
        {
          int v25 = *((_DWORD *)this + 15);
          goto LABEL_54;
        }
      }
      if (!(*(unsigned int (**)(void))(**(void **)(*((void *)this + 15) - 8) + 120))(*(void *)(*((void *)this + 15) - 8))) {
        exit(1234);
      }
      uint64_t v35 = **(void **)(*((void *)this + 20) + 200);
      char v36 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 40))(v35);
      char v37 = v36;
      if (*((_DWORD *)this + 15))
      {
        unint64_t v38 = 0;
        do
        {
          uint64_t v39 = *(void *)(*((void *)this + 8) + 8 * v38);
          bzero(*(void **)(v39 + 464), 4 * *(void *)(v39 + 448) * *(void *)(v39 + 456));
          uint64_t v40 = *(void *)(*((void *)this + 8) + 8 * v38);
          bzero(*(void **)(v40 + 496), 4 * *(void *)(v40 + 480) * *(void *)(v40 + 488));
          ++v38;
          unint64_t v41 = *((unsigned int *)this + 15);
        }
        while (v38 < v41);
        if (v37)
        {
          if (v41) {
            CNNSignals::prepareLayer(**v44, 0, 0);
          }
          goto LABEL_51;
        }
      }
      else
      {
        if (v36) {
          goto LABEL_51;
        }
        LODWORD(v41) = 0;
      }
      if (v41) {
        CNNSignals::prepareLayer(**v44, 0, 0);
      }
LABEL_51:
      operator new();
    }
    bzero(*((void **)this + 9), 8 * v15);
    uint64_t v24 = &v12[8 * v15];
  }
  *((void *)this + 9) = v24;
  goto LABEL_21;
}

void sub_21775DF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int **a15, void **a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void **a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void **a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  ThreadPoolAuto::~ThreadPoolAuto(a15);
  unint64_t v41 = *a21;
  if (*a21)
  {
    *(void *)(v39 + 120) = v41;
    operator delete(v41);
  }
  long long v42 = *a27;
  if (*a27)
  {
    *(void *)(v39 + 72) = v42;
    operator delete(v42);
  }
  *(void *)uint64_t v39 = a17;
  if (*(char *)(v39 + 55) < 0) {
    operator delete(*a16);
  }
  _Unwind_Resume(a1);
}

void matrix<float>::resize()
{
}

void CNN::~CNN(CNN *this)
{
  *(void *)this = &unk_26C7B1B38;
  unint64_t v2 = *((unsigned int *)this + 26);
  if (v2)
  {
    for (unint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*((void *)this + 14) + 8 * i);
      if (v4)
      {
        uint64_t v5 = Layer<float,float,float>::~Layer(v4);
        MEMORY[0x21D44B400](v5, 0x1093C406C775FE4);
        unint64_t v2 = *((unsigned int *)this + 26);
      }
    }
  }
  ThreadPoolAuto::~ThreadPoolAuto((unsigned int **)this + 17);
  unint64_t v6 = (void *)*((void *)this + 14);
  if (v6)
  {
    *((void *)this + 15) = v6;
    operator delete(v6);
  }
  unsigned int v7 = (void *)*((void *)this + 8);
  if (v7)
  {
    *((void *)this + 9) = v7;
    operator delete(v7);
  }
  *(void *)this = &unk_26C7B1818;
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

{
  uint64_t vars8;

  CNN::~CNN(this);
  JUMPOUT(0x21D44B400);
}

uint64_t CNN::scoreOneVector(int a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3 = *(void *)(a2 + 8 * (a1 - 1));
  unint64_t v4 = *(void *)(v3 + 16) - 1;
  if (*(void *)(v3 + 16) == 1) {
    return 0;
  }
  LODWORD(v6) = 0;
  LODWORD(result) = 0;
  uint64_t v7 = *(void *)(v3 + 24);
  int v8 = a3[1];
  uint64_t v9 = *((void *)a3 + 2);
  uint64_t v11 = *((unsigned int *)a3 + 1);
  LODWORD(v10) = *((_DWORD *)a3 + 2);
  int v12 = *a3;
  float v13 = (double *)(v9 + 16 * v11);
  unsigned int v14 = v11 - 1;
  unint64_t v15 = (double *)(v9 + 16 * (v11 - 1));
  double v16 = -1000.0;
  do
  {
    double v17 = *(float *)(v7 + 4 * (int)v6);
    if (v16 >= v17) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v6;
    }
    if (v16 < v17) {
      double v16 = *(float *)(v7 + 4 * (int)v6);
    }
    if (v8)
    {
      uint64_t v18 = (v10 + 1);
      if (v18 >= 2)
      {
        uint64_t v19 = (double *)(v9 + 24);
        uint64_t v20 = 1;
        while (*(v19 - 1) != v17 || *(_DWORD *)v19 != v6)
        {
          ++v20;
          v19 += 2;
          if (v18 == v20) {
            goto LABEL_15;
          }
        }
        if ((int)v20 > 0) {
          goto LABEL_39;
        }
      }
    }
LABEL_15:
    if (v10 == v11)
    {
      if (v12)
      {
        if (*v13 <= v17)
        {
          LODWORD(v10) = v11;
          if (*v15 <= v17) {
            goto LABEL_39;
          }
          int v21 = 1;
          LODWORD(v10) = v11;
          uint64_t v23 = (v11 - 1);
          uint64_t v22 = v9 + 16 * v14;
          unsigned int v24 = v11 - 1;
          goto LABEL_28;
        }
        int v21 = 1;
      }
      else
      {
        if (*v13 >= v17)
        {
          LODWORD(v10) = v11;
          uint64_t v23 = (v11 - 1);
          int v21 = 0;
          uint64_t v22 = v9 + 16 * v14;
          unsigned int v24 = v11 - 1;
          if (*v15 >= v17) {
            goto LABEL_39;
          }
          goto LABEL_28;
        }
        int v21 = 0;
      }
      LODWORD(v10) = v11;
      uint64_t v23 = v11;
      uint64_t v22 = v9 + 16 * v11;
      unsigned int v24 = v11;
    }
    else
    {
      uint64_t v10 = (v10 + 1);
      *((_DWORD *)a3 + 2) = v10;
      uint64_t v22 = v9 + 16 * v10;
      uint64_t v23 = v10;
      int v21 = v12;
      unsigned int v24 = v10;
    }
LABEL_28:
    *(double *)uint64_t v22 = v17;
    *(_DWORD *)(v22 + 8) = v6;
    uint64_t v25 = v9 + 16 * v23;
    double v26 = *(double *)v25;
    int v27 = *(_DWORD *)(v25 + 8);
    if (v21) {
      int v28 = 0x80000000;
    }
    else {
      int v28 = 0x7FFFFFFF;
    }
    *(double *)uint64_t v9 = (double)v28;
    *(_DWORD *)(v9 + 8) = v28;
    while (1)
    {
      unsigned int v29 = v24;
      v24 >>= 1;
      uint64_t v30 = v9 + 16 * v24;
      if (!v21) {
        break;
      }
      if (v26 < *(double *)v30) {
        goto LABEL_38;
      }
LABEL_36:
      if (v29 != v24)
      {
        uint64_t v31 = v9 + 16 * v29;
        *(void *)uint64_t v31 = *(void *)v30;
        *(_DWORD *)(v31 + 8) = *(_DWORD *)(v30 + 8);
      }
    }
    if (v26 >= *(double *)v30) {
      goto LABEL_36;
    }
LABEL_38:
    uint64_t v32 = v9 + 16 * v29;
    *(double *)uint64_t v32 = v26;
    *(_DWORD *)(v32 + 8) = v27;
LABEL_39:
    unint64_t v6 = (v6 + 1);
  }
  while (v4 > v6);
  return result;
}

uint64_t CNN::scoreOneOutputEncodedVector(CNN *this, uint64_t a2, CNNSignals *a3)
{
  __p = 0;
  uint64_t v35 = 0;
  char v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v4 = **(void **)(*(void *)(*((void *)this + 20) + 160) + 48);
  int v5 = *(_DWORD *)(v4 + 16);
  int v6 = *(_DWORD *)(v4 + 8);
  std::vector<float>::resize(&v35, *(unsigned int *)(*((void *)this + 1) + 192));
  unint64_t v7 = *(unsigned int *)(*((void *)this + 1) + 192);
  if (v7)
  {
    int v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v34, v7);
    uint64_t v10 = &v8[4 * v9];
    bzero(v8, 4 * v7);
    __p = v8;
    uint64_t v34 = v10;
  }
  unsigned int v11 = v5 - v6;
  uint64_t v12 = *(void *)(*(void *)(*((void *)this + 20) + 160) + 56);
  float v13 = (float *)v35;
  uint64_t v31 = *(void *)(*(void *)(*((void *)this + 20) + 160) + 48);
  if (v12 != v31)
  {
    unint64_t v14 = 0;
    unint64_t v15 = (v12 - v31) >> 3;
    do
    {
      if (v11)
      {
        uint64_t v16 = 0;
        double v17 = *(unsigned int **)(v31 + 8 * v14);
        uint64_t v18 = *v17;
        uint64_t v19 = *(void *)(a2 + 200);
        uint64_t v20 = *((void *)v17 + 1);
        float v21 = v13[v18];
        do
        {
          float v22 = *(float *)(*(void *)(*(void *)(v19 + 8 * (*((_DWORD *)this + 26) - 1)) + 24)
                         + 4 * (int)v16);
          float v23 = 0.0;
          if (v22 >= 0.0) {
            float v23 = logf(v22 + 1.0);
          }
          if (*(unsigned char *)(v20 + v16)) {
            float v24 = 1.0;
          }
          else {
            float v24 = 0.0;
          }
          float v21 = v21 + (float)((float)(v23 - v24) * (float)(v23 - v24));
          v13[v18] = v21;
          if (*(unsigned char *)(v20 + v16)) {
            ++__p[v18];
          }
          ++v16;
        }
        while (v11 != v16);
      }
      unint64_t v14 = (v14 + 1);
    }
    while (v15 > v14);
  }
  if (v36 == v13)
  {
    uint64_t v26 = 0;
    uint64_t v29 = 0;
    if (!__p) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v25 = 0;
    LODWORD(v26) = 0;
    float v27 = 3.4028e38;
    do
    {
      if ((int)__p[v25] < 1) {
        float v28 = 3.4028e38;
      }
      else {
        float v28 = v13[v25] / (float)v11;
      }
      if (v28 >= v27)
      {
        uint64_t v26 = v26;
      }
      else
      {
        float v27 = v28;
        uint64_t v26 = v25;
      }
      ++v25;
    }
    while (v36 - v13 > (unint64_t)v25);
  }
  operator delete(__p);
  float v13 = (float *)v35;
  uint64_t v29 = v26;
LABEL_28:
  if (v13)
  {
    char v36 = v13;
    operator delete(v13);
  }
  return v29;
}

void sub_21775E784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(void *a1, unint64_t a2)
{
  uint64_t v3 = (char *)*a1;
  uint64_t v4 = (char *)a1[1];
  unint64_t v5 = (uint64_t)&v4[-*a1] >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    uint64_t v20 = &v3[4 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2];
  if (a2 - v5 <= (v8 - (uint64_t)v4) >> 2)
  {
    bzero(v4, 4 * v6);
    uint64_t v20 = &v4[4 * v6];
LABEL_15:
    a1[1] = v20;
    return;
  }
  if (a2 >> 62) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = v8 - (void)v3;
  uint64_t v10 = v9 >> 1;
  if (v9 >> 1 <= a2) {
    uint64_t v10 = a2;
  }
  if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v11 = v10;
  }
  uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7, v11);
  float v13 = (char *)*a1;
  unint64_t v14 = (char *)a1[1];
  unint64_t v15 = &v12[4 * v5];
  double v17 = &v12[4 * v16];
  bzero(v15, 4 * v6);
  uint64_t v18 = &v15[4 * v6];
  while (v14 != v13)
  {
    int v19 = *((_DWORD *)v14 - 1);
    v14 -= 4;
    *((_DWORD *)v15 - 1) = v19;
    v15 -= 4;
  }
  *a1 = v15;
  a1[1] = v18;
  a1[2] = v17;
  if (v13)
  {
    operator delete(v13);
  }
}

void CNN::Recognize(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = a2;
  std::string::basic_string[abi:ne180100]<0>(v41, "");
  if (v42 < 0) {
    operator delete(*(void **)v41);
  }
  int v3 = *(_DWORD *)(a1 + 152);
  uint64_t v4 = operator new(0x28uLL);
  v40[0] = 0;
  v40[1] = 0;
  v39[1] = 0;
  v39[2] = v40;
  v38[2] = v39;
  v39[0] = 0;
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v37 = v38;
  *uint64_t v4 = 0u;
  v4[1] = 0u;
  *((void *)v4 + 4) = 0;
  unint64_t v5 = *(char **)(*(void *)(a1 + 8) + 48);
  unint64_t v6 = *(char **)(*(void *)(a1 + 8) + 56);
  uint64_t v30 = v4;
  if (v3 == 1)
  {
    if (v6 != v5)
    {
      uint64_t v7 = *(void *)v5;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v34 = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v34, *(const void **)(v7 + 8), *(void *)(v7 + 16), *(void *)(v7 + 16) - *(void *)(v7 + 8));
      std::vector<float>::vector(&__p, v35 - (void)v34);
      CNN::convertByteToFloatVector(a1, (uint64_t)v34, v35, (uint64_t)__p, v8, v9, v10);
      CNN::feedForward(a1, (uint64_t)&__p, **(void **)(a1 + 64));
      operator new[]();
    }
    *(_WORD *)unint64_t v41 = 0;
    *(void *)&v41[4] = 10;
    operator new[]();
  }
  unsigned int v11 = 0;
  unsigned int v12 = 0;
  unint64_t v13 = (unint64_t)(v6 - v5) >> 3;
  do
  {
    unsigned int v32 = v11;
    unsigned int v14 = *(_DWORD *)(a1 + 60);
    int v31 = v13;
    if (v14 >= v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v14;
    }
    if (v15)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      unsigned int v18 = v11;
      do
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 144) + 8) + v16;
        *(_DWORD *)(v19 + 136) = 0;
        *(void *)(v19 + 152) = FFThread;
        uint64_t v20 = *(void *)(v19 + 144);
        *(void *)uint64_t v20 = a1;
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 8) + 48) + 8 * (v18 + v17));
        std::vector<float>::resize((void *)(v20 + 88), *(void *)(v21 + 16) - *(void *)(v21 + 8));
        CNN::convertByteToFloatVector(a1, *(void *)(v21 + 8), *(void *)(v21 + 16), *(void *)(v20 + 88), v22, v23, v24);
        *(void *)(v20 + 24) = *(void *)(*(void *)(a1 + 64) + 8 * v17);
        *(_DWORD *)(v20 + 32) = v18 + v17++;
        v16 += 176;
      }
      while (v15 != v17);
    }
    if (ThreadPoolAuto::runThreads((ThreadPoolAuto *)(a1 + 136), v15)) {
      break;
    }
    if (v15)
    {
      uint64_t v25 = (uint64_t *)(*(void *)(*(void *)(a1 + 144) + 8) + 144);
      unsigned int v26 = v32;
      unsigned int v27 = v32;
      uint64_t v28 = v15;
      do
      {
        uint64_t v29 = *v25;
        v25 += 22;
        if (*(_DWORD *)(v29 + 112) == **(_DWORD **)(*(void *)(*(void *)(a1 + 8) + 48) + 8 * v27)) {
          ++v12;
        }
        ++v27;
        --v28;
      }
      while (v28);
    }
    else
    {
      unsigned int v26 = v32;
    }
    unsigned int v11 = v15 + v26;
    LODWORD(v13) = v31 - v15;
  }
  while (v31 != v15);
  *(double *)(a1 + 24) = (double)v12
                       / (double)(unint64_t)((uint64_t)(*(void *)(*(void *)(a1 + 8) + 56)
                                                            - *(void *)(*(void *)(a1 + 8) + 48)) >> 3);
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v38[0]);
  std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(v39[0]);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v40[0]);
  operator delete(v30);
}

void sub_21775F89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45,char a46,void *a47,uint64_t a48,char a49)
{
  if (v49) {
    MEMORY[0x21D44B3E0](v49 - 16, 0x1000C8000313F17);
  }
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(a41);
  std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(a44);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a47);
  operator delete(a24);
  _Unwind_Resume(a1);
}

unsigned __int8 *FixedHeap<unsigned int,unsigned int>::insert(unsigned __int8 *result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = *((unsigned int *)result + 2);
  uint64_t v4 = (v3 + 1);
  if (result[1]) {
    BOOL v5 = v4 >= 2;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    unint64_t v6 = (_DWORD *)(*((void *)result + 2) + 12);
    uint64_t v7 = 1;
    while (*(v6 - 1) != a2 || *v6 != a3)
    {
      ++v7;
      v6 += 2;
      if (v4 == v7) {
        goto LABEL_10;
      }
    }
    if ((int)v7 > 0) {
      return result;
    }
  }
LABEL_10:
  if (v3 != *((_DWORD *)result + 1))
  {
    double v9 = (unsigned int *)*((void *)result + 2);
    uint64_t v3 = (v3 + 1);
    *((_DWORD *)result + 2) = v3;
    float v10 = &v9[2 * v3];
    int v8 = *result;
    goto LABEL_15;
  }
  int v8 = *result;
  double v9 = (unsigned int *)*((void *)result + 2);
  float v10 = &v9[2 * v3];
  unsigned int v11 = *v10;
  if (!*result)
  {
    if (v11 < a2)
    {
      int v8 = 0;
      goto LABEL_15;
    }
    uint64_t v3 = (v3 - 1);
    if (v9[2 * v3] >= a2) {
      return result;
    }
LABEL_35:
    LODWORD(v12) = v3;
    float v10 = &v9[2 * v3];
LABEL_16:
    *float v10 = a2;
    v10[1] = a3;
    uint64_t v13 = *(void *)&v9[2 * v3];
    if (v8) {
      unsigned int v14 = 0x80000000;
    }
    else {
      unsigned int v14 = 0x7FFFFFFF;
    }
    unsigned int *v9 = v14;
    uint64_t v15 = v9;
LABEL_20:
    v15[1] = v14;
    while (1)
    {
      int v16 = v12;
      uint64_t v12 = v12 >> 1;
      unsigned int v17 = v9[2 * v12];
      if (v8)
      {
        if (v13 > v17) {
          goto LABEL_27;
        }
      }
      else if (v13 < v17)
      {
LABEL_27:
        *(void *)&v9[2 * v16] = v13;
        return result;
      }
      if (v16 != v12)
      {
        uint64_t v15 = &v9[2 * v16];
        unsigned int *v15 = v17;
        unsigned int v14 = v9[2 * v12 + 1];
        goto LABEL_20;
      }
    }
  }
  if (v11 > a2)
  {
    int v8 = 1;
LABEL_15:
    LODWORD(v12) = v3;
    goto LABEL_16;
  }
  uint64_t v3 = (v3 - 1);
  if (v9[2 * v3] > a2) {
    goto LABEL_35;
  }
  return result;
}

uint64_t FFThread(uint64_t a1)
{
  CNN::feedForward(*(void *)a1, a1 + 88, *(void *)(a1 + 24));
  uint64_t v3 = *(CNN **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 160);
  if (*(char *)(v4 + 159) < 0) {
    uint64_t v5 = *(void *)(v4 + 144);
  }
  else {
    uint64_t v5 = *(unsigned __int8 *)(v4 + 159);
  }
  uint64_t v6 = *(void *)(a1 + 24);
  if (v5)
  {
    unsigned int v7 = CNN::scoreOneOutputEncodedVector(v3, v6, v2);
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(v6 + 200) + 8 * (*((_DWORD *)v3 + 26) - 1));
    unsigned int v7 = 0;
    unint64_t v9 = *(void *)(v8 + 16) - 1;
    if (*(void *)(v8 + 16) != 1)
    {
      uint64_t v10 = *(void *)(v8 + 24);
      unsigned int v11 = 1;
      double v12 = -1000.0;
      do
      {
        if (v12 < *(float *)(v10 + 4 * (int)(v11 - 1)))
        {
          unsigned int v7 = v11 - 1;
          double v12 = *(float *)(v10 + 4 * (int)(v11 - 1));
        }
      }
      while (v9 > v11++);
    }
  }
  *(_DWORD *)(a1 + 112) = v7;
  return 0;
}

double CNN::importClassifierBinary(CNN *this, __sFILE *__stream)
{
  uint64_t __ptr = 0;
  fread((char *)&__ptr + 4, 4uLL, 1uLL, __stream);
  fread(&__ptr, 4uLL, 1uLL, __stream);
  double result = *((float *)&__ptr + 1);
  uint64_t v5 = *((void *)this + 1);
  double v6 = *(float *)&__ptr;
  *(double *)(v5 + 80) = *((float *)&__ptr + 1);
  *(double *)(v5 + 88) = v6;
  if (*((_DWORD *)this + 26)) {
    matrix<float>::resize();
  }
  return result;
}

void sub_21775FE00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CNN::exportClassifier(uint64_t a1)
{
  v52[19] = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  v52[0] = MEMORY[0x263F8C310] + 64;
  uint64_t v3 = (uint64_t *)MEMORY[0x263F8C2B0];
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v50 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)&v51[*(void *)(v50 - 24) - 8] = v4;
  uint64_t v5 = (std::ios_base *)&v51[*(void *)(v50 - 24) - 8];
  std::ios_base::init(v5, v51);
  uint64_t v6 = MEMORY[0x263F8C310] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  uint64_t v50 = v6;
  v52[0] = v2;
  MEMORY[0x21D44B260](v51);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)&v51[*(void *)(v50 - 24) - 8], *(_DWORD *)&v51[*(void *)(v50 - 24) + 24] | 4);
  }
  *(void *)&v51[*(void *)(v50 - 24) + 8] = 8;
  unsigned int v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"<classifier name= ", 18);
  int v8 = *(char *)(a1 + 55);
  if (v8 >= 0) {
    uint64_t v9 = a1 + 32;
  }
  else {
    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(a1 + 55);
  }
  else {
    uint64_t v10 = *(void *)(a1 + 40);
  }
  unsigned int v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, v9, v10);
  double v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" >", 2);
  std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  uint64_t v13 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
  std::locale::~locale(&v49);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"  <dimension> ", 14);
  unsigned int v14 = (void *)std::ostream::operator<<();
  uint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" </dimension>", 13);
  std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(void *)(*v15 - 24)));
  int v16 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
  std::locale::~locale(&v49);
  std::ostream::put();
  std::ostream::flush();
  if (*(_DWORD *)(a1 + 104))
  {
    unint64_t v17 = 0;
    unsigned int v18 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 112) + 8 * v17);
      int v20 = *(char *)(v19 + 47);
      if (v20 >= 0) {
        uint64_t v21 = v19 + 24;
      }
      else {
        uint64_t v21 = *(void *)(v19 + 24);
      }
      if (v20 >= 0) {
        uint64_t v22 = *(unsigned __int8 *)(v19 + 47);
      }
      else {
        uint64_t v22 = *(void *)(v19 + 32);
      }
      double v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, v21, v22);
      std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
      float v24 = std::locale::use_facet(&v49, v18);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"<weights>", 9);
      std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(*v25 - 24)));
      unsigned int v26 = std::locale::use_facet(&v49, v18);
      ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      unsigned int v27 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v27 + *(void *)(*v27 - 24)));
      uint64_t v28 = std::locale::use_facet(&v49, v18);
      ((void (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"</weights>", 10);
      std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(void *)(*v29 - 24)));
      uint64_t v30 = std::locale::use_facet(&v49, v18);
      ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      ++v17;
    }
    while (v17 < *(unsigned int *)(a1 + 104));
  }
  int v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"<labels>", 8);
  std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(void *)(*v31 - 24)));
  unsigned int v32 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
  std::locale::~locale(&v49);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v33 = *(void *)(a1 + 8);
  uint64_t v34 = *(void **)(v33 + 144);
  uint64_t v35 = (void *)(v33 + 152);
  if (v34 != (void *)(v33 + 152))
  {
    uint64_t v36 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      int v37 = *((char *)v34 + 55);
      if (v37 >= 0) {
        uint64_t v38 = (uint64_t)(v34 + 4);
      }
      else {
        uint64_t v38 = v34[4];
      }
      if (v37 >= 0) {
        uint64_t v39 = *((unsigned __int8 *)v34 + 55);
      }
      else {
        uint64_t v39 = v34[5];
      }
      uint64_t v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, v38, v39);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)" ", 1);
      unint64_t v41 = (void *)std::ostream::operator<<();
      std::ios_base::getloc((const std::ios_base *)((char *)v41 + *(void *)(*v41 - 24)));
      char v42 = std::locale::use_facet(&v49, v36);
      ((void (*)(const std::locale::facet *, uint64_t))v42->__vftable[2].~facet_0)(v42, 10);
      std::locale::~locale(&v49);
      std::ostream::put();
      std::ostream::flush();
      unsigned int v43 = (void *)v34[1];
      if (v43)
      {
        do
        {
          double v44 = v43;
          unsigned int v43 = (void *)*v43;
        }
        while (v43);
      }
      else
      {
        do
        {
          double v44 = (void *)v34[2];
          BOOL v45 = *v44 == (void)v34;
          uint64_t v34 = v44;
        }
        while (!v45);
      }
      uint64_t v34 = v44;
    }
    while (v44 != v35);
  }
  id v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v50, (uint64_t)"</labels>", 9);
  std::ios_base::getloc((const std::ios_base *)((char *)v46 + *(void *)(*v46 - 24)));
  id v47 = std::locale::use_facet(&v49, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
  std::locale::~locale(&v49);
  std::ostream::put();
  std::ostream::flush();
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v51[*(void *)(v50 - 24) - 8], *(_DWORD *)&v51[*(void *)(v50 - 24) + 24] | 4);
  }
  uint64_t v50 = *v3;
  *(void *)&v51[*(void *)(v50 - 24) - 8] = v3[3];
  MEMORY[0x21D44B270](v51);
  std::ostream::~ostream();
  return MEMORY[0x21D44B3C0](v52);
}

void sub_21776070C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, char a12)
{
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21D44B270](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x21D44B3C0](a1 + 52);
  return a1;
}

uint64_t CNN::importClassifier(uint64_t a1)
{
  v18[19] = *MEMORY[0x263EF8340];
  std::ifstream::basic_ifstream(v16);
  memset(&__str, 0, sizeof(__str));
  int v10 = 0;
  uint64_t v9 = 0;
  if (*(_DWORD *)&v17[*(void *)(v16[0] - 24) + 16])
  {
    int v8 = 3;
    goto LABEL_32;
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::string::operator=((std::string *)(a1 + 32), &__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  MEMORY[0x21D44B2B0](v16, &v10);
  if (*(_DWORD *)(*(void *)(a1 + 8) + 32) != v10)
  {
    int v8 = 4;
LABEL_32:
    exit(v8);
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  MEMORY[0x21D44B2A0](v16, &v9);
  *(void *)(*(void *)(a1 + 8) + 80) = v9;
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  MEMORY[0x21D44B2A0](v16, &v9);
  *(void *)(*(void *)(a1 + 8) + 88) = v9;
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  if (*(_DWORD *)(a1 + 104))
  {
    std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
    memset(v14, 0, sizeof(v14));
    v12.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26C7B1C40;
    uint64_t v13 = 0;
    *(_OWORD *)&v12.__r_.__value_.__r.__words[1] = 0uLL;
    std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)v14);
    matrix<float>::resize();
  }
  std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&__str);
  uint64_t v2 = *(void *)(a1 + 8);
  memset(&v12, 0, sizeof(v12));
  memset(&__p, 0, sizeof(__p));
  LODWORD(v14[0]) = 0;
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(v2 + 168, *(char **)(v2 + 176));
  *(void *)(v2 + 168) = v2 + 176;
  *(void *)(v2 + 184) = 0;
  *(void *)(v2 + 176) = 0;
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(v2 + 144, *(char **)(v2 + 152));
  *(void *)(v2 + 144) = v2 + 152;
  *(void *)(v2 + 160) = 0;
  *(void *)(v2 + 152) = 0;
  for (*(_DWORD *)(v2 + 192) = 0; ; ++*(_DWORD *)(v2 + 192))
  {
    std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v16, (uint64_t)&v12);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      break;
    }
    if (HIBYTE(v12.__r_.__value_.__r.__words[2]) == 9)
    {
      uint64_t v3 = &v12;
      goto LABEL_15;
    }
    if (!*((unsigned char *)&v12.__r_.__value_.__s + 23)) {
      goto LABEL_29;
    }
LABEL_19:
    std::string::operator=(&__p, &v12);
    MEMORY[0x21D44B2B0](v16, v14);
    TagMap::storeLabel((uint64_t **)(v2 + 144), &__p, v14[0]);
  }
  if (v12.__r_.__value_.__l.__size_ != 9)
  {
    if (!v12.__r_.__value_.__l.__size_) {
LABEL_29:
    }
      exit(3);
    goto LABEL_19;
  }
  uint64_t v3 = (std::string *)v12.__r_.__value_.__r.__words[0];
LABEL_15:
  std::string::size_type v4 = v3->__r_.__value_.__r.__words[0];
  int v5 = v3->__r_.__value_.__s.__data_[8];
  if (v4 != 0x736C6562616C2F3CLL || v5 != 62) {
    goto LABEL_19;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((unsigned char *)&v12.__r_.__value_.__s + 23) & 0x80) != 0) {
      goto LABEL_28;
    }
  }
  else
  {
    if ((*((unsigned char *)&v12.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_22;
    }
LABEL_28:
    operator delete(v12.__r_.__value_.__l.__data_);
  }
LABEL_22:
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)v16 + *(void *)(v16[0] - 24)), *(_DWORD *)&v17[*(void *)(v16[0] - 24) + 16] | 4);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  v16[0] = *MEMORY[0x263F8C2A8];
  *(uint64_t *)((char *)v16 + *(void *)(v16[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
  MEMORY[0x21D44B270](v17);
  std::istream::~istream();
  return MEMORY[0x21D44B3C0](v18);
}

void sub_217760EF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,char a43)
{
}

uint64_t *std::ifstream::basic_ifstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C308] + 64;
  a1[53] = MEMORY[0x263F8C308] + 64;
  uint64_t v3 = a1 + 2;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - 24)) = v4;
  a1[1] = 0;
  uint64_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 2);
  uint64_t v7 = MEMORY[0x263F8C308] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[53] = v2;
  MEMORY[0x21D44B260](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_217761158(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x21D44B3C0](v1);
  _Unwind_Resume(a1);
}

uint64_t *std::operator>>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(uint64_t *a1, uint64_t a2)
{
  MEMORY[0x21D44B280](&v20, a1, 0);
  if (!v20) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  uint64_t v7 = std::locale::use_facet(&v19, MEMORY[0x263F8C108]);
  std::locale::~locale(&v19);
  uint64_t v8 = 0;
  uint64_t v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7;
  }
  while (1)
  {
    unsigned int v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    std::string v12 = (unsigned char *)v11[3];
    if (v12 == (unsigned char *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    unsigned int v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v8 = 1;
      goto LABEL_23;
    }
  }
  int v13 = (*(uint64_t (**)(void *))(*v11 + 72))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0;
  if (!v8) {
    v16 |= 4u;
  }
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_2177613B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x21776136CLL);
  }
  __cxa_rethrow();
}

void sub_21776144C(_Unwind_Exception *a1)
{
}

void *matrix<double>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C20;
  uint64_t v2 = a1[3];
  if (v2) {
    MEMORY[0x21D44B3E0](v2, 0x1000C8000313F17);
  }
  return a1;
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21D44B270](a1 + 2);
  std::istream::~istream();
  MEMORY[0x21D44B3C0](a1 + 53);
  return a1;
}

void CNN::ClassifyOne(uint64_t a1, uint64_t *a2)
{
  std::vector<float>::vector(&v9, a2[1] - *a2);
  CNN::convertByteToFloatVector(a1, *a2, a2[1], (uint64_t)v9, v4, v5, v6);
  CNN::feedForward(a1, (uint64_t)&v9, **(void **)(a1 + 64));
  __int16 v7 = 0;
  uint64_t v8 = 4;
  operator new[]();
}

void sub_217761718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TagMap::getLabel(std::string *this, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = a3;
  __int16 v7 = &v6;
  double v4 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)(a2 + 24), &v6, (uint64_t)&std::piecewise_construct, &v7);
  if (*((char *)v4 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(this, (const std::string::value_type *)v4[5], (std::string::size_type)v4[6]);
  }
  else
  {
    long long v5 = *(_OWORD *)(v4 + 5);
    this->__r_.__value_.__r.__words[2] = (std::string::size_type)v4[7];
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
}

uint64_t CNN::CNNFromModel(const char *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t v1 = fopen(a1, "r");
  fread(__ptr, 4uLL, 3uLL, v1);
  if (__ptr[0] <= 1u && __ptr[1] == 0)
  {
    fread(v4, 1uLL, 3uLL, v1);
    operator new();
  }
  return 0;
}

void sub_217761990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x21D44B400](v3, 0x10B3C40EE8EEB88);
  TagMap::~TagMap((char **)va);
  _Unwind_Resume(a1);
}

void TagMap::importTagMapBinary(uint64_t **this, __sFILE *__stream)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int __ptr = 0;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  for (int i = __ptr; i; --i)
  {
    unsigned int v6 = 0;
    int v7 = 0;
    fread(&v7, 4uLL, 1uLL, __stream);
    fread(&v6, 4uLL, 1uLL, __stream);
    snprintf(__str, 0x100uLL, "0x%x", v7);
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    TagMap::storeLabel(this, &__p, v6);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    ++*((_DWORD *)this + 12);
  }
}

void sub_217761B14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TagMap::~TagMap(char **this)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  long long v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_217761E2C(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x21D44B3C0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D44B3C0](a1 + 128);
  return a1;
}

std::string *TagMap::storeLabel(uint64_t **a1, std::string *a2, unsigned int a3)
{
  unsigned int v8 = a3;
  if (std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__count_unique<std::string>((uint64_t)a1, (const void **)&a2->__r_.__value_.__l.__data_))
  {
    exit(1);
  }
  uint64_t v9 = (unsigned int *)a2;
  *((_DWORD *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (const void **)&a2->__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v9)+ 14) = a3;
  uint64_t v9 = &v8;
  uint64_t v6 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(a1 + 3, &v8, (uint64_t)&std::piecewise_construct, &v9);
  return std::string::operator=((std::string *)(v6 + 5), a2);
}

void std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__count_unique<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = a1 + 16;
    uint64_t v5 = 1;
    do
    {
      if (!std::less<std::string>::operator()[abi:ne180100](v4, a2, v2 + 4))
      {
        if (!std::less<std::string>::operator()[abi:ne180100](v4, v2 + 4, a2)) {
          return v5;
        }
        ++v2;
      }
      uint64_t v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    unsigned int v8 = a3;
  }
  else {
    unsigned int v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  double result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        unsigned int v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    unsigned int v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  unsigned int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_2177623A4(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              _OWORD v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            long long v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            unsigned int *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 5) = 0;
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void NetworkParameters::NetworkParameters(NetworkParameters *this)
{
  *(void *)this = &unk_26C7B19F8;
  *((void *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 1;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 3, "");
  *((void *)this + 6) = 0x100000002;
  *((unsigned char *)this + 56) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 8, "");
  std::string::basic_string[abi:ne180100]<0>((void *)this + 11, "");
  *((_OWORD *)this + 7) = xmmword_2177A17F0;
  *((_DWORD *)this + 32) = 100000;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 17, "");
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0x3F8000003E4CCCCDLL;
  *((void *)this + 22) = 0x7D000000000;
  *((_DWORD *)this + 46) = 7200000;
  *((void *)this + 24) = 0x3F1A36E2EB1C432DLL;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 27) = 0;
  *((unsigned char *)this + 224) = 0;
}

void sub_2177627F0(_Unwind_Exception *exception_object)
{
  if (v1[111] < 0) {
    operator delete(*v4);
  }
  if (v1[87] < 0) {
    operator delete(*v3);
  }
  if (v1[47] < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void NetworkParameters::~NetworkParameters(NetworkParameters *this)
{
  NetworkParameters::~NetworkParameters(this);
  JUMPOUT(0x21D44B400);
}

{
  void *v2;

  *(void *)this = &unk_26C7B19F8;
  uint64_t v2 = (void *)*((void *)this + 25);
  if (v2)
  {
    *((void *)this + 26) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 159) < 0) {
    operator delete(*((void **)this + 17));
  }
  if (*((char *)this + 111) < 0) {
    operator delete(*((void **)this + 11));
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unsigned int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21D44B2E0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unsigned int v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D44B2F0](v13);
  return a1;
}

void sub_217762AE4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D44B2F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x217762AC4);
}

void sub_217762B38(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_217762CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void matrix<float>::matrix(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *a1 = &unk_26C7B1C40;
  a1[1] = v2;
  a1[2] = v3;
  operator new[]();
}

void matrix<float>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C40;
  uint64_t v1 = a1[3];
  if (v1) {
    MEMORY[0x21D44B3E0](v1, 0x1000C8052888210);
  }
  JUMPOUT(0x21D44B400);
}

void ConvolutionLayer<float,float,float>::ConvolutionLayer(uint64_t a1, const std::string *a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10, char a11)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 64) = &unk_26C7B1C40;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = &unk_26C7B1C40;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = &unk_26C7B1C40;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)a1 = &unk_26C7B1968;
  *(_DWORD *)(a1 + 164) = a3;
  *(_DWORD *)(a1 + 168) = a4;
  *(_DWORD *)(a1 + 172) = a5;
  *(_DWORD *)(a1 + 176) = a6;
  *(_DWORD *)(a1 + 180) = a7;
  *(_DWORD *)(a1 + 184) = a8;
  *(_OWORD *)(a1 + 188) = a9;
  *(_OWORD *)(a1 + 204) = a10;
  *(unsigned char *)(a1 + 240) = a11;
  std::string::operator=((std::string *)(a1 + 24), a2);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 168) * *(_DWORD *)(a1 + 164);
  unsigned int v12 = *(_DWORD *)(a1 + 196);
  unsigned int v13 = *(_DWORD *)(a1 + 212);
  unsigned int v14 = *(_DWORD *)(a1 + 216);
  float v15 = (float)((float)v12 - (float)v13) / ((float)v14 + 1.0) + 1.0;
  unsigned int v16 = (v12 - v13) / (v14 + 1) + 1;
  *(_DWORD *)(a1 + 220) = v16;
  if (vabds_f32(v15, (float)v16) <= 2.2204e-16)
  {
    *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 192) * *(_DWORD *)(a1 + 188);
    matrix<float>::resize();
  }
  exit(12345);
}

void sub_217763170(_Unwind_Exception *a1)
{
  Layer<float,float,float>::~Layer(v1);
  _Unwind_Resume(a1);
}

uint64_t Layer<float,float,float>::~Layer(uint64_t a1)
{
  *(void *)a1 = &unk_26C7B1B78;
  *(void *)(a1 + 128) = &unk_26C7B1C40;
  uint64_t v2 = *(void *)(a1 + 152);
  if (v2) {
    MEMORY[0x21D44B3E0](v2, 0x1000C8052888210);
  }
  *(void *)(a1 + 96) = &unk_26C7B1C40;
  uint64_t v3 = *(void *)(a1 + 120);
  if (v3) {
    MEMORY[0x21D44B3E0](v3, 0x1000C8052888210);
  }
  *(void *)(a1 + 64) = &unk_26C7B1C40;
  uint64_t v4 = *(void *)(a1 + 88);
  if (v4) {
    MEMORY[0x21D44B3E0](v4, 0x1000C8052888210);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  return a1;
}

_DWORD *ConvolutionLayer<float,float,float>::replicateOrgXToX(_DWORD *result, uint64_t a2, void *a3)
{
  uint64_t v4 = a3[1];
  uint64_t v3 = a3[2];
  int v5 = v3 - 1;
  if (v3 != 1)
  {
    int v6 = 0;
    uint64_t v7 = a3[3];
    do
      *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
    while (v5 != v6);
  }
  if (v4)
  {
    int v8 = 0;
    uint64_t v9 = a3[3];
    do
      *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
    while (v4 != v8);
  }
  int v10 = result[50];
  if (v10)
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = result[53];
    int v14 = result[55];
    do
    {
      if (v14)
      {
        int v15 = 0;
        char v16 = result[54] != 0;
        do
        {
          for (int i = 0; i != v14; ++i)
          {
            if (v13)
            {
              int v18 = 0;
              int v19 = result[49];
              uint64_t v21 = *(void *)(a2 + 16);
              uint64_t v20 = *(void *)(a2 + 24);
              uint64_t v22 = a3[3];
              int v23 = (i << v16) + (v15 << v16) * v19;
              int v24 = v11;
              do
              {
                for (int j = 0; j != v13; ++j)
                  *(_DWORD *)(v22 + 4 * (v3 * (i + v15 * v14) + v24 + j)) = *(_DWORD *)(v20 + 4
                                                                                            * (v12 + v21 * (v23 + j)));
                ++v18;
                v23 += v19;
                v24 += v13;
              }
              while (v18 != v13);
            }
          }
          ++v15;
        }
        while (v15 != v14);
      }
      ++v12;
      v11 += v13 * v13;
    }
    while (v12 != v10);
  }
  return result;
}

void ConvolutionLayer<float,float,float>::unfoldDXtoOrgDX(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  bzero(*(void **)(a3 + 24), 4 * *(void *)(a3 + 8) * *(void *)(a3 + 16));
  int v6 = a1[50];
  if (v6)
  {
    int v7 = 0;
    int v8 = 0;
    unsigned int v9 = a1[53];
    int v10 = v9 * v9;
    unsigned int v11 = a1[55];
    int v12 = v11 * v11;
    do
    {
      if (v12)
      {
        unsigned int v13 = 0;
        int v14 = a1[54];
        do
        {
          int v15 = v13 / v11;
          int v16 = v13 % v11;
          if (v14)
          {
            v15 *= 2;
            v16 *= 2;
          }
          if (v10)
          {
            unsigned int v17 = 0;
            int v18 = a1[49];
            uint64_t v19 = *(void *)(a2 + 24);
            uint64_t v20 = *(void *)(a2 + 16) * (int)v13;
            uint64_t v22 = *(void *)(a3 + 16);
            uint64_t v21 = *(void *)(a3 + 24);
            do
            {
              uint64_t v23 = v8 + v22 * (int)(v17 % v9 + v16 + (v17 / v9 + v15) * v18);
              *(float *)(v21 + 4 * v23) = *(float *)(v19 + 4 * (v20 + (int)(v7 + v17++))) + *(float *)(v21 + 4 * v23);
            }
            while (v10 != v17);
          }
          ++v13;
        }
        while (v13 != v12);
      }
      ++v8;
      v7 += v10;
    }
    while (v8 != v6);
  }
}

float ConvolutionLayer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 8) - 1) * v4) = 1065353216;
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  uint64_t v7 = v6 - *a3;
  if (v6 != *a3)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v7 >> 2;
    do
    {
      float result = *(float *)(v5 + 4 * v8);
      *(float *)(v3 + 4 * v4 * (int)v8++) = result;
    }
    while (v9 > v8);
  }
  return result;
}

void ConvolutionLayer<float,float,float>::overrideBiasWithOne(uint64_t a1, void *a2, int a3)
{
  uint64_t v4 = a2[1];
  uint64_t v3 = a2[2];
  if (a3)
  {
    int v5 = v3 - 1;
    if (v3 != 1)
    {
      int v6 = 0;
      uint64_t v7 = a2[3];
      do
        *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
      while (v5 != v6);
    }
    if (v4)
    {
      int v8 = 0;
      uint64_t v9 = a2[3];
      do
        *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
      while (v4 != v8);
    }
  }
  else
  {
    uint64_t v10 = a2[3];
    int v11 = v4 - 1;
    if (v11)
    {
      for (int i = 0; i != v11; ++i)
        *(_DWORD *)(v10 + 4 * ((int)v3 - 1 + v3 * i)) = 0;
    }
    uint64_t v13 = v3 * v11;
    int v14 = v3 - 1;
    if (v14)
    {
      for (int j = 0; j != v14; ++j)
        *(_DWORD *)(v10 + 4 * (v13 + j)) = 0;
    }
    *(_DWORD *)(v10 + 4 * (v13 + v14)) = 1065353216;
  }
}

uint64_t ConvolutionLayer<float,float,float>::flattenOutput(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 240))
  {
    int v3 = *(_DWORD *)(a2 + 8) - 1;
    if (*(_DWORD *)(a2 + 8) != 1)
    {
      int v4 = 0;
      int v5 = 0;
      uint64_t v6 = *(void *)(a2 + 16);
      int v7 = v6 - 1;
      do
      {
        if (v6 != 1)
        {
          int v8 = 0;
          uint64_t v9 = *(void *)(a2 + 24);
          uint64_t v10 = *(void *)(a3 + 24);
          do
          {
            *(_DWORD *)(v10 + 4 * (v4 + v8)) = *(_DWORD *)(v9 + 4 * (v6 * v5 + v8));
            ++v8;
          }
          while (v7 != v8);
        }
        ++v5;
        v4 += v7;
      }
      while (v5 != v3);
    }
    *(_DWORD *)(*(void *)(a3 + 24) + (((*(void *)(a3 + 16) << 32) - 0x100000000) >> 30)) = 1065353216;
  }
  return result;
}

void Layer<float,float,float>::feedForward(uint64_t a1, uint64_t a2, int a3)
{
  matrix<float>::operator*(v3, *(void *)(*(void *)(a2 + 152) + 8 * a3), a1 + 64);
}

void sub_217763824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void Layer<float,float,float>::backprop(uint64_t a1)
{
  matrix<float>::transposed(v1, a1 + 64);
}

void sub_217763978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16) {
    MEMORY[0x21D44B3E0](a16, 0x1000C8052888210);
  }
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

unint64_t Layer<float,float,float>::computeDeltaY(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v5 = a4[1];
  unint64_t v4 = a4[2];
  if (v5)
  {
    LODWORD(v6) = 0;
    do
    {
      if (v4)
      {
        uint64_t v7 = *(void *)(a3 + 24);
        uint64_t v8 = *(void *)(a3 + 16) * (int)v6;
        uint64_t v9 = *(void *)(a2 + 24);
        uint64_t v10 = *(void *)(a2 + 16) * (int)v6;
        uint64_t v11 = a4[3];
        unsigned int v12 = 1;
        do
        {
          float v13 = *(float *)(v7 + 4 * (v8 + (int)(v12 - 1)));
          unint64_t result = v4 * (int)v6 + (int)(v12 - 1);
          *(float *)(v11 + 4 * result) = *(float *)(v9 + 4 * (v10 + (int)(v12 - 1))) * (float)(v13 * (float)(1.0 - v13));
        }
        while (v4 > v12++);
      }
      unint64_t v6 = (v6 + 1);
    }
    while (v5 > v6);
  }
  *(_DWORD *)(a4[3] + 4 * (((int)v5 - 1) * v4 + (int)v4 - 1)) = 0;
  return result;
}

void Layer<float,float,float>::computeDeltaW(uint64_t a1, uint64_t a2)
{
  matrix<float>::transposed(v2, a2);
}

void sub_217763B60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  if (a16) {
    MEMORY[0x21D44B3E0](a16, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void Layer<float,float,float>::updateUnrolledW(uint64_t a1, uint64_t a2)
{
  matrix<float>::transposed(v2, a2);
}

void sub_217763D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16) {
    MEMORY[0x21D44B3E0](a16, 0x1000C8052888210);
  }
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void Layer<float,float,float>::updateWfromAggregateOrSignal(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  if (a3 >= 2)
  {
    LODWORD(v6) = 1065353216;
    matrix<float>::operator*(v7, a2);
  }
  matrix<float>::transposed(v5, *(void *)(*(void *)(a4 + 152) + 8 * a5));
}

void sub_217763FD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v21 - 88) = &unk_26C7B1C40;
  uint64_t v23 = *(void *)(v21 - 64);
  if (v23) {
    MEMORY[0x21D44B3E0](v23, 0x1000C8052888210);
  }
  if (a21) {
    MEMORY[0x21D44B3E0](a21, 0x1000C8052888210);
  }
  if (a17) {
    MEMORY[0x21D44B3E0](a17, 0x1000C8052888210);
  }
  if (a13) {
    MEMORY[0x21D44B3E0](a13, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Layer<float,float,float>::aggregateThreadDW(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a4 >= 2) {
    matrix<float>::transposed(v4, *(void *)(*(void *)(a2 + 152) + 8 * a3));
  }
  *(_DWORD *)(*(void *)(result + 88)
            + 4 * ((*(_DWORD *)(result + 72) - 1) * *(void *)(result + 80) + (int)(*(void *)(result + 80) - 1))) = 1065353216;
  return result;
}

void sub_21776429C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v21 - 88) = &unk_26C7B1C40;
  uint64_t v23 = *(void *)(v21 - 64);
  if (v23) {
    MEMORY[0x21D44B3E0](v23, 0x1000C8052888210);
  }
  if (a21) {
    MEMORY[0x21D44B3E0](a21, 0x1000C8052888210);
  }
  if (a17) {
    MEMORY[0x21D44B3E0](a17, 0x1000C8052888210);
  }
  if (a13) {
    MEMORY[0x21D44B3E0](a13, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void Layer<float,float,float>::compute_dW(uint64_t a1, uint64_t a2)
{
  matrix<float>::transposed(v2, a2);
}

void sub_217764474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16) {
    MEMORY[0x21D44B3E0](a16, 0x1000C8052888210);
  }
  if (a12) {
    MEMORY[0x21D44B3E0](a12, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void Layer<float,float,float>::adjustWeights(uint64_t a1, float a2)
{
  float v3 = a2;
  matrix<float>::operator*(v2, a1 + 96);
}

uint64_t ConvolutionLayer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 192) - 1) * (*(_DWORD *)(a1 + 188) - 1) + 1);
}

float Layer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (int)(*(void *)(a2 + 16) - 1) * *(void *)(a2 + 16)) = 1065353216;
  uint64_t v4 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v6 = v5 - *a3;
  if (v5 != *a3)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v6 >> 2;
    do
    {
      float result = *(float *)(v4 + 4 * v7);
      *(float *)(v3 + 4 * (int)v7++) = result;
    }
    while (v8 > v7);
  }
  return result;
}

void Layer<float,float,float>::overrideBiasWithOne(uint64_t a1, uint64_t a2, int a3)
{
  float v3 = 0.0;
  if (a3) {
    float v3 = 1.0;
  }
  *(float *)(*(void *)(a2 + 24) + (((*(void *)(a2 + 16) << 32) - 0x100000000) >> 30)) = v3;
}

uint64_t Layer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

void matrix<float>::operator*(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  *a1 = &unk_26C7B1C40;
  a1[1] = v3;
  a1[2] = v4;
  operator new[]();
}

void sub_2177646F4(_Unwind_Exception *exception_object)
{
  void *v1 = v2;
  uint64_t v4 = v1[3];
  if (v4) {
    MEMORY[0x21D44B3E0](v4, 0x1000C8052888210);
  }
  _Unwind_Resume(exception_object);
}

void matrix<float>::operator=(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[3];
  if (v4) {
    MEMORY[0x21D44B3E0](v4, 0x1000C8052888210);
  }
  uint64_t v5 = *(void *)(a2 + 16);
  a1[1] = *(void *)(a2 + 8);
  a1[2] = v5;
  operator new[]();
}

void matrix<float>::transposed(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *a1 = &unk_26C7B1C40;
  a1[1] = v2;
  a1[2] = v3;
  operator new[]();
}

void *matrix<float>::operator+=(void *result, float *a2)
{
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = result[2];
    uint64_t v6 = 4 * v5;
    do
    {
      if (v5)
      {
        uint64_t v7 = (float *)(result[3] + v3);
        unint64_t v8 = a2;
        uint64_t v9 = v5;
        do
        {
          float v10 = *v8++;
          float *v7 = v10 + *v7;
          ++v7;
          --v9;
        }
        while (v9);
      }
      ++v4;
      v3 += v6;
      a2 = (float *)((char *)a2 + v6);
    }
    while (v4 != v2);
  }
  return result;
}

void matrix<float>::operator*(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *a1 = &unk_26C7B1C40;
  a1[1] = v2;
  a1[2] = v3;
  operator new[]();
}

void matrix<float>::operator+(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  *a1 = &unk_26C7B1C40;
  a1[1] = v2;
  a1[2] = v3;
  operator new[]();
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Layer<float,float,float> *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void PoolingLayer<float,float,float>::replicateOrgXToX(uint64_t a1, uint64_t a2, void *a3)
{
  matrix<float>::operator=(a3, a2);
}

void PoolingLayer<float,float,float>::unfoldDXtoOrgDX(uint64_t a1, uint64_t a2, void *a3)
{
  matrix<float>::operator=(a3, a2);
}

float PoolingLayer<float,float,float>::intializeInputPattern(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  *(_DWORD *)(v3 + 4 * (*(_DWORD *)(a2 + 8) - 1) * v4) = 1065353216;
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  uint64_t v7 = v6 - *a3;
  if (v6 != *a3)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v7 >> 2;
    do
    {
      float result = *(float *)(v5 + 4 * v8);
      *(float *)(v3 + 4 * v4 * (int)v8++) = result;
    }
    while (v9 > v8);
  }
  return result;
}

void PoolingLayer<float,float,float>::overrideBiasWithOne(uint64_t a1, void *a2, int a3)
{
  uint64_t v4 = a2[1];
  uint64_t v3 = a2[2];
  if (a3)
  {
    int v5 = v3 - 1;
    if (v3 != 1)
    {
      int v6 = 0;
      uint64_t v7 = a2[3];
      do
        *(_DWORD *)(v7 + 4 * (((int)v4 - 1) * v3 + v6++)) = 0;
      while (v5 != v6);
    }
    if (v4)
    {
      int v8 = 0;
      uint64_t v9 = a2[3];
      do
        *(_DWORD *)(v9 + 4 * (v5 + v3 * v8++)) = 1065353216;
      while (v4 != v8);
    }
  }
  else
  {
    uint64_t v10 = a2[3];
    int v11 = v4 - 1;
    if (v11)
    {
      for (int i = 0; i != v11; ++i)
        *(_DWORD *)(v10 + 4 * ((int)v3 - 1 + v3 * i)) = 0;
    }
    uint64_t v13 = v3 * v11;
    int v14 = v3 - 1;
    if (v14)
    {
      for (int j = 0; j != v14; ++j)
        *(_DWORD *)(v10 + 4 * (v13 + j)) = 0;
    }
    *(_DWORD *)(v10 + 4 * (v13 + v14)) = 1065353216;
  }
}

uint64_t PoolingLayer<float,float,float>::flattenOutput(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 208))
  {
    int v3 = *(_DWORD *)(a2 + 8) - 1;
    if (*(_DWORD *)(a2 + 8) != 1)
    {
      int v4 = 0;
      int v5 = 0;
      uint64_t v6 = *(void *)(a2 + 16);
      int v7 = v6 - 1;
      do
      {
        if (v6 != 1)
        {
          int v8 = 0;
          uint64_t v9 = *(void *)(a2 + 24);
          uint64_t v10 = *(void *)(a3 + 24);
          do
          {
            *(_DWORD *)(v10 + 4 * (v4 + v8)) = *(_DWORD *)(v9 + 4 * (v6 * v5 + v8));
            ++v8;
          }
          while (v7 != v8);
        }
        ++v5;
        v4 += v7;
      }
      while (v5 != v3);
    }
    *(_DWORD *)(*(void *)(a3 + 24) + (((*(void *)(a3 + 16) << 32) - 0x100000000) >> 30)) = 1065353216;
  }
  return result;
}

uint64_t PoolingLayer<float,float,float>::feedForward(_DWORD *a1, void *a2, int a3)
{
  uint64_t v5 = *(void *)(a2[25] + 8 * a3);
  unsigned int v6 = a1[48];
  if (v6)
  {
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)(a2[19] + 8 * a3);
    uint64_t v9 = a2[31] + 32 * a3;
    uint64_t v10 = (void *)(v9 + 24);
    int v11 = (void *)(v9 + 16);
    uint64_t v12 = *(_DWORD *)(v8 + 8) - 1;
    uint64_t v15 = v8 + 16;
    uint64_t v14 = *(void *)(v8 + 16);
    uint64_t v13 = *(void *)(v15 + 8);
    uint64_t v16 = v14 * v12;
    uint64_t v18 = *(void *)(v5 + 16);
    uint64_t v17 = *(void *)(v5 + 24);
    uint64_t v19 = v18 * (*(_DWORD *)(v5 + 8) - 1);
    unsigned int v20 = a1[51];
    unsigned int v21 = v20;
    do
    {
      if (v21)
      {
        unsigned int v22 = 0;
        unsigned int v23 = a1[50];
        unsigned int v24 = v23;
        do
        {
          if (v20)
          {
            unsigned int v25 = 0;
            int v26 = v22 * v21;
            int v27 = v24 * a1[47] * v22;
            do
            {
              LODWORD(v28) = v25 + v26;
              if (v24)
              {
                unsigned int v29 = 0;
                uint64_t v28 = (int)v28;
                int v30 = v27 + v23 * v25;
                float v31 = -1000000.0;
                do
                {
                  if (v23)
                  {
                    unsigned int v32 = 0;
                    int v33 = v30 + a1[47] * v29;
                    do
                    {
                      float v34 = *(float *)(v13 + 4 * ((int)v7 + v14 * (int)(v33 + v32)));
                      if (v34 > v31)
                      {
                        *(_DWORD *)(*v10 + 4 * ((int)v7 + *v11 * (int)v28)) = v33 + v32;
                        unsigned int v23 = a1[50];
                        float v31 = v34;
                      }
                      ++v32;
                    }
                    while (v32 < v23);
                  }
                  ++v29;
                }
                while (v29 < v23);
                unsigned int v20 = a1[51];
                unsigned int v24 = v23;
              }
              else
              {
                uint64_t v28 = (int)v28;
                float v31 = -1000000.0;
              }
              *(float *)(v17 + 4 * ((int)v7 + v28 * v18)) = v31;
              ++v25;
            }
            while (v25 < v20);
          }
          ++v22;
          unsigned int v21 = v20;
        }
        while (v22 < v20);
        unsigned int v6 = a1[48];
        unsigned int v21 = v20;
      }
      *(_DWORD *)(v17 + 4 * (v19 + (int)v7)) = *(_DWORD *)(v13 + 4 * (v16 + (int)v7));
      ++v7;
    }
    while (v7 < v6);
  }
  uint64_t v35 = *(uint64_t (**)(void))(*(void *)a1 + 32);
  return v35();
}

float PoolingLayer<float,float,float>::backprop(_DWORD *a1, void *a2, int a3, float result)
{
  int v4 = a1[48];
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)(a2[28] + 8 * a3);
    uint64_t v7 = *(void *)(a2[22] + 8 * a3);
    int v8 = a1[51];
    uint64_t v9 = a2[31] + 32 * a3;
    uint64_t v10 = (void *)(v9 + 24);
    int v11 = (void *)(v9 + 16);
    uint64_t v12 = *(_DWORD *)(v7 + 8) - 1;
    uint64_t v15 = v7 + 16;
    uint64_t v14 = *(void *)(v7 + 16);
    uint64_t v13 = *(void *)(v15 + 8);
    uint64_t v16 = v12 * v14;
    uint64_t v17 = *(_DWORD *)(v6 + 8) - 1;
    uint64_t v20 = v6 + 16;
    uint64_t v19 = *(void *)(v6 + 16);
    uint64_t v18 = *(void *)(v20 + 8);
    uint64_t v21 = v19 * v17;
    do
    {
      if (v8)
      {
        int v22 = 0;
        int v23 = 0;
        int v24 = a1[50];
        int v25 = a1[47];
        uint64_t v26 = v5;
        do
        {
          int v27 = 0;
          int v28 = v22;
          do
          {
            if (v24)
            {
              int v29 = 0;
              uint64_t v30 = v27 + v23 * v8;
              int v31 = *(_DWORD *)(v13 + 4 * (v5 + v14 * v30));
              uint64_t v32 = *(int *)(*v10 + 4 * (v5 + *v11 * v30));
              uint64_t v33 = v5 + v19 * v32;
              int v34 = -(int)v32;
              int v35 = v28;
              do
              {
                for (int i = 0; i != v24; ++i)
                {
                  if (v34 + v35 + i) {
                    *(_DWORD *)(v18 + 4 * (v5 + v19 * (v35 + i))) = 0;
                  }
                  else {
                    *(_DWORD *)(v18 + 4 * v33) = v31;
                  }
                }
                ++v29;
                v35 += v25;
              }
              while (v29 != v24);
            }
            ++v27;
            v28 += v24;
          }
          while (v27 != v8);
          ++v23;
          v22 += v24 * v25;
        }
        while (v23 != v8);
      }
      else
      {
        uint64_t v26 = v5;
      }
      float result = *(float *)(v13 + 4 * (v26 + v16));
      *(float *)(v18 + 4 * (v26 + v21)) = result;
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

uint64_t PoolingLayer<float,float,float>::getOutputFieldsForHidden(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 184) - 1) * (*(_DWORD *)(a1 + 180) - 1) + 1);
}

void Layer<float,float,float>::Layer(uint64_t a1, long long *a2, int a3, int a4)
{
  *(void *)a1 = &unk_26C7B1B78;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 24), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    *(void *)(a1 + 40) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 24) = v7;
  }
  *(_DWORD *)(a1 + 48) = a3;
  *(_DWORD *)(a1 + 52) = a4;
  *(_DWORD *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = &unk_26C7B1C40;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = &unk_26C7B1C40;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = &unk_26C7B1C40;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(unsigned char *)(a1 + 160) = 0;
  matrix<float>::resize();
}

void sub_217765288(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 128) = v5;
  uint64_t v7 = *(void *)(v1 + 152);
  if (v7) {
    MEMORY[0x21D44B3E0](v7, 0x1000C8052888210);
  }
  *(void *)(v1 + 96) = v4;
  uint64_t v8 = *(void *)(v1 + 120);
  if (v8) {
    MEMORY[0x21D44B3E0](v8, 0x1000C8052888210);
  }
  *(void *)(v1 + 64) = v3;
  uint64_t v9 = *(void *)(v1 + 88);
  if (v9) {
    MEMORY[0x21D44B3E0](v9, 0x1000C8052888210);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::destroy(a1[1]);
    uint64_t v2 = a1[7];
    if (v2) {
      MEMORY[0x21D44B3E0](v2 - 16, 0x1000C8000313F17);
    }
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(a1[1]);
    uint64_t v2 = (void *)a1[5];
    if (v2)
    {
      a1[6] = v2;
      operator delete(v2);
    }
    operator delete(a1);
  }
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_217765478(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,FixedHeap<unsigned int,unsigned int>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (!v4)
  {
LABEL_7:
    uint64_t v7 = (char *)operator new(0x40uLL);
    *((_DWORD *)v7 + 8) = *a3;
    *((_WORD *)v7 + 20) = 0;
    *(void *)(v7 + 44) = 10;
    operator new[]();
  }
  while (1)
  {
    while (1)
    {
      uint64_t v5 = (uint64_t *)v4;
      unsigned int v6 = *(_DWORD *)(v4 + 32);
      if (v6 <= a2) {
        break;
      }
      uint64_t v4 = *v5;
      if (!*v5) {
        goto LABEL_7;
      }
    }
    if (v6 >= a2) {
      return v5;
    }
    uint64_t v4 = v5[1];
    if (!v4) {
      goto LABEL_7;
    }
  }
}

void sub_2177655B0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t **a1, unint64_t a2, uint64_t **a3)
{
  unsigned int v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        uint64_t v5 = *v7;
        unsigned int v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v5 = v7[1];
      if (!v5)
      {
        unsigned int v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 1;
LABEL_9:
    uint64_t v9 = (uint64_t *)v7;
    uint64_t v7 = (uint64_t **)operator new(0x40uLL);
    v7[4] = *a3;
    v7[5] = 0;
    v7[6] = 0;
    v7[7] = 0;
    char *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *unsigned int v6 = (uint64_t *)v7;
    uint64_t v10 = (uint64_t *)**a1;
    int v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      int v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

BOOL myKeySorter<double,unsigned int>(double *a1, double *a2)
{
  return *a2 < *a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  uint64_t v11 = result;
  while (2)
  {
    uint64_t v12 = a2 - 2;
    long long v70 = a2;
    long long v72 = a2 - 4;
    uint64_t v69 = a2 - 6;
    unint64_t v13 = v11;
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v13;
        uint64_t v14 = (uint64_t)a2 - v13;
        unint64_t v15 = (uint64_t)((uint64_t)a2 - v13) >> 4;
        if (v6 || !v5)
        {
          switch(v15)
          {
            case 0uLL:
            case 1uLL:
              return result;
            case 2uLL:
              float result = (*a3)(v12, (uint64_t *)v11);
              if (result)
              {
                uint64_t v32 = *(void *)v11;
                int v33 = *(_DWORD *)(v11 + 8);
                if ((uint64_t *)v11 != v12)
                {
                  *(void *)uint64_t v11 = *(a2 - 2);
                  *(_DWORD *)(v11 + 8) = *((_DWORD *)a2 - 2);
                }
                *(a2 - 2) = v32;
                *((_DWORD *)a2 - 2) = v33;
              }
              break;
            case 3uLL:
              float result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)v11, (uint64_t *)(v11 + 16), v12, a3);
              break;
            case 4uLL:
              float result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v11, v11 + 16, v11 + 32, (uint64_t)v12, a3);
              break;
            case 5uLL:
              float result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v11, v11 + 16, v11 + 32, v11 + 48, (uint64_t)v12, a3);
              break;
            default:
              JUMPOUT(0);
          }
          return result;
        }
        if (v14 <= 383)
        {
          if (a5)
          {
            if ((uint64_t *)v11 != a2)
            {
              int v34 = (_OWORD *)(v11 + 16);
              if ((uint64_t *)(v11 + 16) != a2)
              {
                uint64_t v35 = 0;
                uint64_t v36 = (_OWORD *)v11;
                do
                {
                  int v37 = (uint64_t *)v36;
                  uint64_t v36 = v34;
                  float result = (*a3)((uint64_t *)v34, v37);
                  if (result)
                  {
                    long long v74 = *v36;
                    uint64_t v38 = v35;
                    while (1)
                    {
                      uint64_t v39 = v11 + v38;
                      *(void *)(v39 + 16) = *(void *)(v11 + v38);
                      *(_DWORD *)(v39 + 24) = *(_DWORD *)(v11 + v38 + 8);
                      if (!v38) {
                        break;
                      }
                      v38 -= 16;
                      float result = (*a3)((uint64_t *)&v74, (uint64_t *)(v38 + v11));
                      if ((result & 1) == 0)
                      {
                        uint64_t v40 = v11 + v38 + 16;
                        goto LABEL_80;
                      }
                    }
                    uint64_t v40 = v11;
LABEL_80:
                    a2 = v70;
                    if ((long long *)v40 != &v74)
                    {
                      *(void *)uint64_t v40 = v74;
                      *(_DWORD *)(v40 + 8) = DWORD2(v74);
                    }
                  }
                  int v34 = v36 + 1;
                  v35 += 16;
                }
                while (v36 + 1 != (_OWORD *)a2);
              }
            }
          }
          else if ((uint64_t *)v11 != a2)
          {
            int v65 = (uint64_t *)(v11 + 16);
            if ((uint64_t *)(v11 + 16) != a2)
            {
              uint64_t v66 = v11 - 16;
              do
              {
                long long v67 = (uint64_t *)v11;
                uint64_t v11 = (uint64_t)v65;
                float result = (*a3)(v65, v67);
                if (result)
                {
                  long long v74 = *(_OWORD *)v11;
                  uint64_t v68 = v66;
                  do
                  {
                    *(void *)(v68 + 32) = *(void *)(v68 + 16);
                    *(_DWORD *)(v68 + 40) = *(_DWORD *)(v68 + 24);
                    float result = (*a3)((uint64_t *)&v74, (uint64_t *)v68);
                    v68 -= 16;
                  }
                  while ((result & 1) != 0);
                  if ((long long *)(v68 + 32) != &v74)
                  {
                    *(void *)(v68 + 32) = v74;
                    *(_DWORD *)(v68 + 40) = DWORD2(v74);
                  }
                }
                int v65 = (uint64_t *)(v11 + 16);
                v66 += 16;
              }
              while ((uint64_t *)(v11 + 16) != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if ((uint64_t *)v11 != a2)
          {
            int64_t v41 = (v15 - 2) >> 1;
            int64_t v73 = v41;
            do
            {
              int64_t v42 = v41;
              if (v73 >= v41)
              {
                uint64_t v43 = (2 * v41) | 1;
                uint64_t v44 = v11 + 16 * v43;
                if (2 * v41 + 2 < (uint64_t)v15
                  && (*a3)((uint64_t *)(v11 + 16 * v43), (uint64_t *)(v44 + 16)))
                {
                  v44 += 16;
                  uint64_t v43 = 2 * v42 + 2;
                }
                uint64_t v45 = v11 + 16 * v42;
                float result = (*a3)((uint64_t *)v44, (uint64_t *)v45);
                a2 = v70;
                if ((result & 1) == 0)
                {
                  long long v74 = *(_OWORD *)v45;
                  do
                  {
                    uint64_t v46 = v44;
                    if (v45 != v44)
                    {
                      *(void *)uint64_t v45 = *(void *)v44;
                      *(_DWORD *)(v45 + 8) = *(_DWORD *)(v44 + 8);
                    }
                    if (v73 < v43) {
                      break;
                    }
                    uint64_t v47 = (2 * v43) | 1;
                    uint64_t v44 = v11 + 16 * v47;
                    uint64_t v48 = 2 * v43 + 2;
                    if (v48 < (uint64_t)v15 && (*a3)((uint64_t *)(v11 + 16 * v47), (uint64_t *)(v44 + 16)))
                    {
                      v44 += 16;
                      uint64_t v47 = v48;
                    }
                    float result = (*a3)((uint64_t *)v44, (uint64_t *)&v74);
                    uint64_t v45 = v46;
                    uint64_t v43 = v47;
                  }
                  while (!result);
                  if ((long long *)v46 != &v74)
                  {
                    *(void *)uint64_t v46 = v74;
                    *(_DWORD *)(v46 + 8) = DWORD2(v74);
                  }
                  a2 = v70;
                }
              }
              int64_t v41 = v42 - 1;
            }
            while (v42);
            uint64_t v49 = (unint64_t)v14 >> 4;
            do
            {
              uint64_t v50 = a2;
              uint64_t v51 = 0;
              uint64_t v52 = *(void *)v11;
              int v71 = *(_DWORD *)(v11 + 8);
              uint64_t v53 = v49 - 2;
              if (v49 < 2) {
                uint64_t v53 = v49 - 1;
              }
              uint64_t v54 = v53 >> 1;
              uint64_t v55 = v11;
              do
              {
                uint64_t v56 = v55 + 16 * v51 + 16;
                uint64_t v57 = 2 * v51;
                uint64_t v51 = (2 * v51) | 1;
                uint64_t v58 = v57 + 2;
                if (v57 + 2 < v49)
                {
                  float result = (*a3)((uint64_t *)v56, (uint64_t *)(v56 + 16));
                  if (result)
                  {
                    v56 += 16;
                    uint64_t v51 = v58;
                  }
                }
                if (v55 != v56)
                {
                  *(void *)uint64_t v55 = *(void *)v56;
                  *(_DWORD *)(v55 + 8) = *(_DWORD *)(v56 + 8);
                }
                uint64_t v55 = v56;
              }
              while (v51 <= v54);
              if ((uint64_t *)v56 == v50 - 2)
              {
                *(void *)uint64_t v56 = v52;
                *(_DWORD *)(v56 + 8) = v71;
                uint64_t v60 = v49 - 1;
              }
              else
              {
                *(void *)uint64_t v56 = *(v50 - 2);
                *(_DWORD *)(v56 + 8) = *((_DWORD *)v50 - 2);
                *(v50 - 2) = v52;
                *((_DWORD *)v50 - 2) = v71;
                uint64_t v59 = v56 - v11 + 16;
                uint64_t v60 = v49 - 1;
                if (v59 >= 17)
                {
                  unint64_t v61 = (((unint64_t)v59 >> 4) - 2) >> 1;
                  unint64_t v62 = v11 + 16 * v61;
                  float result = (*a3)((uint64_t *)v62, (uint64_t *)v56);
                  if (result)
                  {
                    long long v74 = *(_OWORD *)v56;
                    do
                    {
                      uint64_t v63 = v62;
                      if (v56 != v62)
                      {
                        *(void *)uint64_t v56 = *(void *)v62;
                        *(_DWORD *)(v56 + 8) = *(_DWORD *)(v62 + 8);
                      }
                      if (!v61) {
                        break;
                      }
                      unint64_t v61 = (v61 - 1) >> 1;
                      unint64_t v62 = v11 + 16 * v61;
                      float result = (*a3)((uint64_t *)v62, (uint64_t *)&v74);
                      uint64_t v56 = v63;
                    }
                    while ((result & 1) != 0);
                    if ((long long *)v63 != &v74)
                    {
                      *(void *)uint64_t v63 = v74;
                      *(_DWORD *)(v63 + 8) = DWORD2(v74);
                    }
                  }
                }
              }
              a2 = v50 - 2;
              BOOL v64 = v49 <= 2;
              uint64_t v49 = v60;
            }
            while (!v64);
          }
          return result;
        }
        unint64_t v16 = v15 >> 1;
        unint64_t v17 = v11 + 16 * (v15 >> 1);
        if ((unint64_t)v14 >= 0x801)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)v11, (uint64_t *)(v11 + 16 * (v15 >> 1)), v12, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v11 + 16), (uint64_t *)(v17 - 16), v72, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v11 + 32), (uint64_t *)(v11 + 16 + 16 * v16), v69, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v17 - 16), (uint64_t *)v17, (uint64_t *)(v11 + 16 + 16 * v16), a3);
          uint64_t v18 = *(void *)v11;
          int v19 = *(_DWORD *)(v11 + 8);
          *(void *)uint64_t v11 = *(void *)v17;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v17 + 8);
          *(void *)unint64_t v17 = v18;
          *(_DWORD *)(v17 + 8) = v19;
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)(v11 + 16 * (v15 >> 1)), (uint64_t *)v11, v12, a3);
        }
        --a4;
        a2 = v70;
        if (a5 & 1) != 0 || ((*a3)((uint64_t *)(v11 - 16), (uint64_t *)v11)) {
          break;
        }
        long long v74 = *(_OWORD *)v11;
        float result = (*a3)((uint64_t *)&v74, v12);
        if (result)
        {
          unint64_t v13 = v11;
          do
          {
            v13 += 16;
            float result = (*a3)((uint64_t *)&v74, (uint64_t *)v13);
          }
          while ((result & 1) == 0);
        }
        else
        {
          int v27 = (uint64_t *)(v11 + 16);
          do
          {
            unint64_t v13 = (unint64_t)v27;
            if (v27 >= v70) {
              break;
            }
            float result = (*a3)((uint64_t *)&v74, v27);
            int v27 = (uint64_t *)(v13 + 16);
          }
          while (!result);
        }
        int v28 = v70;
        if (v13 < (unint64_t)v70)
        {
          int v28 = v70;
          do
          {
            v28 -= 2;
            float result = (*a3)((uint64_t *)&v74, v28);
          }
          while ((result & 1) != 0);
        }
        while (v13 < (unint64_t)v28)
        {
          uint64_t v29 = *(void *)v13;
          int v30 = *(_DWORD *)(v13 + 8);
          *(void *)unint64_t v13 = *v28;
          *(_DWORD *)(v13 + 8) = *((_DWORD *)v28 + 2);
          *int v28 = v29;
          *((_DWORD *)v28 + 2) = v30;
          do
            v13 += 16;
          while (!(*a3)((uint64_t *)&v74, (uint64_t *)v13));
          do
          {
            v28 -= 2;
            float result = (*a3)((uint64_t *)&v74, v28);
          }
          while ((result & 1) != 0);
        }
        int v31 = (long long *)(v13 - 16);
        if (v13 - 16 != v11)
        {
          *(void *)uint64_t v11 = *(void *)(v13 - 16);
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 - 8);
        }
        BOOL v5 = v31 >= &v74;
        BOOL v6 = v31 == &v74;
        if (v31 != &v74)
        {
          *(void *)(v13 - 16) = v74;
          *(_DWORD *)(v13 - 8) = DWORD2(v74);
        }
LABEL_34:
        a5 = 0;
      }
      uint64_t v20 = 0;
      long long v74 = *(_OWORD *)v11;
      do
        v20 += 16;
      while (((*a3)((uint64_t *)(v20 + v11), (uint64_t *)&v74) & 1) != 0);
      unint64_t v21 = v11 + v20;
      int v22 = v70;
      if (v20 == 16)
      {
        int v22 = v70;
        do
        {
          if (v21 >= (unint64_t)v22) {
            break;
          }
          v22 -= 2;
        }
        while (((*a3)(v22, (uint64_t *)&v74) & 1) == 0);
      }
      else
      {
        do
          v22 -= 2;
        while (!(*a3)(v22, (uint64_t *)&v74));
      }
      unint64_t v13 = v11 + v20;
      if (v21 < (unint64_t)v22)
      {
        unint64_t v23 = (unint64_t)v22;
        do
        {
          uint64_t v24 = *(void *)v13;
          int v25 = *(_DWORD *)(v13 + 8);
          *(void *)unint64_t v13 = *(void *)v23;
          *(_DWORD *)(v13 + 8) = *(_DWORD *)(v23 + 8);
          *(void *)unint64_t v23 = v24;
          *(_DWORD *)(v23 + 8) = v25;
          do
            v13 += 16;
          while (((*a3)((uint64_t *)v13, (uint64_t *)&v74) & 1) != 0);
          do
            v23 -= 16;
          while (!(*a3)((uint64_t *)v23, (uint64_t *)&v74));
        }
        while (v13 < v23);
      }
      if (v13 - 16 != v11)
      {
        *(void *)uint64_t v11 = *(void *)(v13 - 16);
        *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 - 8);
      }
      if ((long long *)(v13 - 16) != &v74)
      {
        *(void *)(v13 - 16) = v74;
        *(_DWORD *)(v13 - 8) = DWORD2(v74);
      }
      if (v21 < (unint64_t)v22)
      {
LABEL_33:
        float result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*,false>(v11, v13 - 16, a3, a4, a5 & 1);
        goto LABEL_34;
      }
      BOOL v26 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v11, (uint64_t *)(v13 - 16), a3);
      float result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(v13, v70, a3);
      if (result) {
        break;
      }
      if (!v26) {
        goto LABEL_33;
      }
    }
    a2 = (uint64_t *)(v13 - 16);
    if (!v26) {
      continue;
    }
    return result;
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if (v8)
  {
    uint64_t v10 = *a1;
    int v11 = *((_DWORD *)a1 + 2);
    if (result)
    {
      if (a1 != a3)
      {
        *a1 = *a3;
        *((_DWORD *)a1 + 2) = *((_DWORD *)a3 + 2);
      }
LABEL_17:
      *a3 = v10;
      *((_DWORD *)a3 + 2) = v11;
      return result;
    }
    if (a1 != a2)
    {
      *a1 = *a2;
      *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
    }
    *a2 = v10;
    *((_DWORD *)a2 + 2) = v11;
    uint64_t result = (*a4)(a3, a2);
    if (result)
    {
      uint64_t v10 = *a2;
      int v11 = *((_DWORD *)a2 + 2);
      if (a2 != a3)
      {
        *a2 = *a3;
        *((_DWORD *)a2 + 2) = *((_DWORD *)a3 + 2);
      }
      goto LABEL_17;
    }
  }
  else if (result)
  {
    uint64_t v12 = *a2;
    int v13 = *((_DWORD *)a2 + 2);
    if (a2 != a3)
    {
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = *((_DWORD *)a3 + 2);
    }
    *a3 = v12;
    *((_DWORD *)a3 + 2) = v13;
    uint64_t result = (*a4)(a2, a1);
    if (result)
    {
      uint64_t v14 = *a1;
      int v15 = *((_DWORD *)a1 + 2);
      if (a1 != a2)
      {
        *a1 = *a2;
        *((_DWORD *)a1 + 2) = *((_DWORD *)a2 + 2);
      }
      *a2 = v14;
      *((_DWORD *)a2 + 2) = v15;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6 = ((uint64_t)a2 - a1) >> 4;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      char v8 = a2 - 2;
      if ((*a3)(a2 - 2, (uint64_t *)a1))
      {
        uint64_t v9 = *(void *)a1;
        int v10 = *(_DWORD *)(a1 + 8);
        if (v8 != (uint64_t *)a1)
        {
          *(void *)a1 = *(a2 - 2);
          *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 - 2);
        }
        *(a2 - 2) = v9;
        *((_DWORD *)a2 - 2) = v10;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)(a1 + 16), a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a1 + 16, a1 + 32, (uint64_t)(a2 - 2), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a1 + 16, a1 + 32, a1 + 48, (uint64_t)(a2 - 2), a3);
      return 1;
    default:
      int v11 = (uint64_t *)(a1 + 32);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)(a1 + 16), (uint64_t *)(a1 + 32), a3);
      uint64_t v12 = (uint64_t *)(a1 + 48);
      if ((uint64_t *)(a1 + 48) == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v12, v11))
    {
      long long v18 = *(_OWORD *)v12;
      uint64_t v15 = v13;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(void *)(v16 + 48) = *(void *)(a1 + v15 + 32);
        *(_DWORD *)(v16 + 56) = *(_DWORD *)(a1 + v15 + 40);
        if (v15 == -32) {
          break;
        }
        v15 -= 16;
        if (((*a3)((uint64_t *)&v18, (uint64_t *)(v16 + 16)) & 1) == 0)
        {
          uint64_t v17 = a1 + v15 + 48;
          goto LABEL_14;
        }
      }
      uint64_t v17 = a1;
LABEL_14:
      if ((long long *)v17 != &v18)
      {
        *(void *)uint64_t v17 = v18;
        *(_DWORD *)(v17 + 8) = DWORD2(v18);
      }
      if (++v14 == 8) {
        return v12 + 2 == a2;
      }
    }
    int v11 = v12;
    v13 += 16;
    v12 += 2;
    if (v12 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>((uint64_t *)a1, (uint64_t *)a2, (uint64_t *)a3, a5);
  uint64_t result = (*a5)((uint64_t *)a4, (uint64_t *)a3);
  if (result)
  {
    uint64_t v11 = *(void *)a3;
    int v12 = *(_DWORD *)(a3 + 8);
    if (a3 != a4)
    {
      *(void *)a3 = *(void *)a4;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a4 + 8);
    }
    *(void *)a4 = v11;
    *(_DWORD *)(a4 + 8) = v12;
    uint64_t result = (*a5)((uint64_t *)a3, (uint64_t *)a2);
    if (result)
    {
      uint64_t v13 = *(void *)a2;
      int v14 = *(_DWORD *)(a2 + 8);
      if (a2 != a3)
      {
        *(void *)a2 = *(void *)a3;
        *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
      }
      *(void *)a3 = v13;
      *(_DWORD *)(a3 + 8) = v14;
      uint64_t result = (*a5)((uint64_t *)a2, (uint64_t *)a1);
      if (result)
      {
        uint64_t v15 = *(void *)a1;
        int v16 = *(_DWORD *)(a1 + 8);
        if (a1 != a2)
        {
          *(void *)a1 = *(void *)a2;
          *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
        }
        *(void *)a2 = v15;
        *(_DWORD *)(a2 + 8) = v16;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<double,unsigned int> const&,HeapPair<double,unsigned int> const&),HeapPair<double,unsigned int>*>(a1, a2, a3, a4, a6);
  uint64_t result = (*a6)((uint64_t *)a5, (uint64_t *)a4);
  if (result)
  {
    uint64_t v13 = *(void *)a4;
    int v14 = *(_DWORD *)(a4 + 8);
    if (a4 != a5)
    {
      *(void *)a4 = *(void *)a5;
      *(_DWORD *)(a4 + 8) = *(_DWORD *)(a5 + 8);
    }
    *(void *)a5 = v13;
    *(_DWORD *)(a5 + 8) = v14;
    uint64_t result = (*a6)((uint64_t *)a4, (uint64_t *)a3);
    if (result)
    {
      uint64_t v15 = *(void *)a3;
      int v16 = *(_DWORD *)(a3 + 8);
      if (a3 != a4)
      {
        *(void *)a3 = *(void *)a4;
        *(_DWORD *)(a3 + 8) = *(_DWORD *)(a4 + 8);
      }
      *(void *)a4 = v15;
      *(_DWORD *)(a4 + 8) = v16;
      uint64_t result = (*a6)((uint64_t *)a3, (uint64_t *)a2);
      if (result)
      {
        uint64_t v17 = *(void *)a2;
        int v18 = *(_DWORD *)(a2 + 8);
        if (a2 != a3)
        {
          *(void *)a2 = *(void *)a3;
          *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
        }
        *(void *)a3 = v17;
        *(_DWORD *)(a3 + 8) = v18;
        uint64_t result = (*a6)((uint64_t *)a2, (uint64_t *)a1);
        if (result)
        {
          uint64_t v19 = *(void *)a1;
          int v20 = *(_DWORD *)(a1 + 8);
          if (a1 != a2)
          {
            *(void *)a1 = *(void *)a2;
            *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
          }
          *(void *)a2 = v19;
          *(_DWORD *)(a2 + 8) = v20;
        }
      }
    }
  }
  return result;
}

BOOL myKeySorter<unsigned int,unsigned int>(_DWORD *a1, _DWORD *a2)
{
  return *a2 < *a1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  uint64_t v11 = (uint64_t *)result;
  while (2)
  {
    int v12 = a2 - 1;
    uint64_t v66 = a2 - 3;
    long long v67 = a2 - 2;
    uint64_t v13 = v11;
    uint64_t v69 = a2;
    while (1)
    {
      while (1)
      {
        uint64_t v11 = v13;
        uint64_t v14 = (char *)a2 - (char *)v13;
        unint64_t v15 = a2 - v13;
        if (v6 || !v5)
        {
          switch(v15)
          {
            case 0uLL:
            case 1uLL:
              return result;
            case 2uLL:
              uint64_t result = (*a3)(v12, v11);
              if (result)
              {
                uint64_t v30 = *v11;
                if (v11 != v12) {
                  uint64_t *v11 = *v12;
                }
                *(a2 - 1) = v30;
              }
              break;
            case 3uLL:
              uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, v11 + 1, v12, a3);
              break;
            case 4uLL:
              uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, v11 + 1, v11 + 2, v12, a3);
              break;
            case 5uLL:
              uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, v11 + 1, v11 + 2, v11 + 3, v12, a3);
              break;
            default:
              JUMPOUT(0);
          }
          return result;
        }
        if (v14 <= 191)
        {
          int v31 = v11 + 1;
          BOOL v33 = v11 == a2 || v31 == a2;
          if (a5)
          {
            if (!v33)
            {
              uint64_t v34 = 0;
              uint64_t v35 = v11;
              do
              {
                uint64_t v36 = v35;
                uint64_t v35 = v31;
                uint64_t result = (*a3)(v31, v36);
                if (result)
                {
                  uint64_t v71 = *v35;
                  uint64_t v37 = v34;
                  while (1)
                  {
                    *(uint64_t *)((char *)v11 + v37 + 8) = *(uint64_t *)((char *)v11 + v37);
                    if (!v37) {
                      break;
                    }
                    v37 -= 8;
                    uint64_t result = (*a3)(&v71, (uint64_t *)((char *)v11 + v37));
                    if ((result & 1) == 0)
                    {
                      uint64_t v38 = (uint64_t *)((char *)v11 + v37 + 8);
                      goto LABEL_87;
                    }
                  }
                  uint64_t v38 = v11;
LABEL_87:
                  a2 = v69;
                  if (v38 != &v71) {
                    uint64_t *v38 = v71;
                  }
                }
                int v31 = v35 + 1;
                v34 += 8;
              }
              while (v35 + 1 != a2);
            }
          }
          else if (!v33)
          {
            do
            {
              unint64_t v62 = v11;
              uint64_t v11 = v31;
              uint64_t result = (*a3)(v31, v62);
              if (result)
              {
                uint64_t v71 = *v11;
                uint64_t v63 = v11;
                do
                {
                  BOOL v64 = v63;
                  uint64_t v65 = *--v63;
                  *BOOL v64 = v65;
                  uint64_t result = (*a3)(&v71, v64 - 2);
                }
                while ((result & 1) != 0);
                if (v63 != &v71) {
                  *uint64_t v63 = v71;
                }
              }
              int v31 = v11 + 1;
            }
            while (v11 + 1 != a2);
          }
          return result;
        }
        if (!a4)
        {
          if (v11 != a2)
          {
            int64_t v39 = (v15 - 2) >> 1;
            int64_t v68 = v39;
            do
            {
              int64_t v40 = v39;
              if (v68 >= v39)
              {
                uint64_t v41 = (2 * v39) | 1;
                int64_t v42 = &v11[v41];
                if (2 * v39 + 2 < (uint64_t)v15 && (*a3)(&v11[v41], v42 + 1))
                {
                  ++v42;
                  uint64_t v41 = 2 * v40 + 2;
                }
                uint64_t v43 = &v11[v40];
                uint64_t result = (*a3)(v42, v43);
                a2 = v69;
                if ((result & 1) == 0)
                {
                  uint64_t v71 = *v43;
                  do
                  {
                    uint64_t v44 = v42;
                    if (v43 != v42) {
                      *uint64_t v43 = *v42;
                    }
                    if (v68 < v41) {
                      break;
                    }
                    uint64_t v45 = (2 * v41) | 1;
                    int64_t v42 = &v11[v45];
                    uint64_t v46 = 2 * v41 + 2;
                    if (v46 < (uint64_t)v15 && (*a3)(&v11[v45], v42 + 1))
                    {
                      ++v42;
                      uint64_t v45 = v46;
                    }
                    uint64_t result = (*a3)(v42, &v71);
                    uint64_t v43 = v44;
                    uint64_t v41 = v45;
                  }
                  while (!result);
                  if (v44 != &v71) {
                    *uint64_t v44 = v71;
                  }
                  a2 = v69;
                }
              }
              int64_t v39 = v40 - 1;
            }
            while (v40);
            uint64_t v47 = (unint64_t)v14 >> 3;
            do
            {
              long long v70 = a2;
              uint64_t v48 = 0;
              uint64_t v49 = *v11;
              uint64_t v50 = v47 - 2;
              if (v47 < 2) {
                uint64_t v50 = v47 - 1;
              }
              uint64_t v51 = v50 >> 1;
              uint64_t v52 = v11;
              do
              {
                uint64_t v53 = &v52[v48 + 1];
                uint64_t v54 = 2 * v48;
                uint64_t v48 = (2 * v48) | 1;
                uint64_t v55 = v54 + 2;
                if (v54 + 2 < v47)
                {
                  uint64_t result = (*a3)(v53, v53 + 1);
                  if (result)
                  {
                    ++v53;
                    uint64_t v48 = v55;
                  }
                }
                if (v52 != v53) {
                  *uint64_t v52 = *v53;
                }
                uint64_t v52 = v53;
              }
              while (v48 <= v51);
              if (v53 == v70 - 1)
              {
                *uint64_t v53 = v49;
                uint64_t v57 = v47 - 1;
              }
              else
              {
                *uint64_t v53 = *(v70 - 1);
                *(v70 - 1) = v49;
                uint64_t v56 = (char *)v53 - (char *)v11 + 8;
                uint64_t v57 = v47 - 1;
                if (v56 >= 9)
                {
                  unint64_t v58 = (((unint64_t)v56 >> 3) - 2) >> 1;
                  uint64_t v59 = &v11[v58];
                  uint64_t result = (*a3)(v59, v53);
                  if (result)
                  {
                    uint64_t v71 = *v53;
                    do
                    {
                      uint64_t v60 = v59;
                      if (v53 != v59) {
                        *uint64_t v53 = *v59;
                      }
                      if (!v58) {
                        break;
                      }
                      unint64_t v58 = (v58 - 1) >> 1;
                      uint64_t v59 = &v11[v58];
                      uint64_t result = (*a3)(v59, &v71);
                      uint64_t v53 = v60;
                    }
                    while ((result & 1) != 0);
                    if (v60 != &v71) {
                      *uint64_t v60 = v71;
                    }
                  }
                }
              }
              a2 = v70 - 1;
              BOOL v61 = v47 <= 2;
              uint64_t v47 = v57;
            }
            while (!v61);
          }
          return result;
        }
        unint64_t v16 = v15 >> 1;
        uint64_t v17 = &v11[v15 >> 1];
        if ((unint64_t)v14 >= 0x401)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, &v11[v15 >> 1], v12, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11 + 1, v17 - 1, v67, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11 + 2, &v11[v16 + 1], v66, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v17 - 1, v17, &v11[v16 + 1], a3);
          uint64_t v18 = *v11;
          uint64_t *v11 = *v17;
          uint64_t *v17 = v18;
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(&v11[v15 >> 1], v11, v12, a3);
        }
        --a4;
        if (a5 & 1) != 0 || ((*a3)(v11 - 1, v11)) {
          break;
        }
        uint64_t v71 = *v11;
        uint64_t result = (*a3)(&v71, v12);
        if (result)
        {
          uint64_t v13 = v11;
          a2 = v69;
          do
            uint64_t result = (*a3)(&v71, ++v13);
          while ((result & 1) == 0);
        }
        else
        {
          BOOL v26 = v11 + 1;
          a2 = v69;
          do
          {
            uint64_t v13 = v26;
            if (v26 >= v69) {
              break;
            }
            uint64_t result = (*a3)(&v71, v26);
            BOOL v26 = v13 + 1;
          }
          while (!result);
        }
        int v27 = a2;
        if (v13 < a2)
        {
          int v27 = a2;
          do
            uint64_t result = (*a3)(&v71, --v27);
          while ((result & 1) != 0);
        }
        while (v13 < v27)
        {
          uint64_t v28 = *v13;
          uint64_t *v13 = *v27;
          *int v27 = v28;
          do
            ++v13;
          while (!(*a3)(&v71, v13));
          do
            uint64_t result = (*a3)(&v71, --v27);
          while ((result & 1) != 0);
        }
        uint64_t v29 = v13 - 1;
        if (v13 - 1 != v11) {
          uint64_t *v11 = *v29;
        }
        BOOL v5 = v29 >= &v71;
        BOOL v6 = v29 == &v71;
        if (v29 != &v71) {
          uint64_t *v29 = v71;
        }
LABEL_36:
        a5 = 0;
      }
      uint64_t v19 = 0;
      uint64_t v71 = *v11;
      do
        ++v19;
      while (((*a3)(&v11[v19], &v71) & 1) != 0);
      int v20 = &v11[v19];
      unint64_t v21 = v69;
      if (v19 == 1)
      {
        unint64_t v21 = v69;
        do
        {
          if (v20 >= v21) {
            break;
          }
          --v21;
        }
        while (((*a3)(v21, &v71) & 1) == 0);
      }
      else
      {
        do
          --v21;
        while (!(*a3)(v21, &v71));
      }
      uint64_t v13 = &v11[v19];
      if (v20 >= v21)
      {
        a2 = v69;
      }
      else
      {
        int v22 = v21;
        a2 = v69;
        do
        {
          uint64_t v23 = *v13;
          uint64_t *v13 = *v22;
          *int v22 = v23;
          do
            ++v13;
          while (((*a3)(v13, &v71) & 1) != 0);
          do
            --v22;
          while (!(*a3)(v22, &v71));
        }
        while (v13 < v22);
      }
      uint64_t v24 = v13 - 1;
      if (v13 - 1 != v11) {
        uint64_t *v11 = *v24;
      }
      if (v24 != &v71) {
        *uint64_t v24 = v71;
      }
      if (v20 < v21)
      {
LABEL_35:
        uint64_t result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*,false>(v11, v13 - 1, a3, a4, a5 & 1);
        goto LABEL_36;
      }
      BOOL v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v11, v13 - 1, a3);
      uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(v13, a2, a3);
      if (result) {
        break;
      }
      if (!v25) {
        goto LABEL_35;
      }
    }
    a2 = v13 - 1;
    if (!v25) {
      continue;
    }
    return result;
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  BOOL v6 = a2;
  uint64_t v7 = a1;
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, v6);
  if (v8)
  {
    uint64_t v10 = *v7;
    if (result)
    {
      BOOL v6 = a3;
      if (v7 == a3)
      {
LABEL_5:
        *BOOL v6 = v10;
        return result;
      }
LABEL_4:
      uint64_t *v7 = *a3;
      BOOL v6 = a3;
      goto LABEL_5;
    }
    if (v7 != v6) {
      uint64_t *v7 = *v6;
    }
    *BOOL v6 = v10;
    uint64_t result = (*a4)(a3, v6);
    if (result)
    {
      uint64_t v10 = *v6;
      uint64_t v7 = v6;
      if (v6 == a3) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (result)
  {
    uint64_t v11 = *v6;
    if (v6 != a3) {
      *BOOL v6 = *a3;
    }
    *a3 = v11;
    uint64_t result = (*a4)(v6, v7);
    if (result)
    {
      uint64_t v10 = *v7;
      a3 = v6;
      if (v7 == v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      char v8 = a2 - 1;
      if ((*a3)(a2 - 1, a1))
      {
        uint64_t v9 = *a1;
        if (v8 != a1) {
          *a1 = *v8;
        }
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a1 + 1, a1 + 2, a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(v11, v10))
    {
      uint64_t v17 = *v11;
      uint64_t v14 = v12;
      while (1)
      {
        unint64_t v15 = (uint64_t *)((char *)a1 + v14);
        *(uint64_t *)((char *)a1 + v14 + 24) = *(uint64_t *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8;
        if (((*a3)(&v17, v15 + 1) & 1) == 0)
        {
          unint64_t v16 = (uint64_t *)((char *)a1 + v14 + 24);
          goto LABEL_14;
        }
      }
      unint64_t v16 = a1;
LABEL_14:
      if (v16 != &v17) {
        *unint64_t v16 = v17;
      }
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a2, a3, a5);
  uint64_t result = (*a5)(a4, a3);
  if (result)
  {
    uint64_t v11 = *a3;
    if (a3 != a4) {
      *a3 = *a4;
    }
    *a4 = v11;
    uint64_t result = (*a5)(a3, a2);
    if (result)
    {
      uint64_t v12 = *a2;
      if (a2 != a3) {
        *a2 = *a3;
      }
      *a3 = v12;
      uint64_t result = (*a5)(a2, a1);
      if (result)
      {
        uint64_t v13 = *a1;
        if (a1 != a2) {
          *a1 = *a2;
        }
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(HeapPair<unsigned int,unsigned int> const&,HeapPair<unsigned int,unsigned int> const&),HeapPair<unsigned int,unsigned int>*>(a1, a2, a3, a4, a6);
  uint64_t result = (*a6)(a5, a4);
  if (result)
  {
    uint64_t v13 = *a4;
    if (a4 != a5) {
      *a4 = *a5;
    }
    *a5 = v13;
    uint64_t result = (*a6)(a4, a3);
    if (result)
    {
      uint64_t v14 = *a3;
      if (a3 != a4) {
        *a3 = *a4;
      }
      *a4 = v14;
      uint64_t result = (*a6)(a3, a2);
      if (result)
      {
        uint64_t v15 = *a2;
        if (a2 != a3) {
          *a2 = *a3;
        }
        *a3 = v15;
        uint64_t result = (*a6)(a2, a1);
        if (result)
        {
          uint64_t v16 = *a1;
          if (a1 != a2) {
            *a1 = *a2;
          }
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

void matrix<double>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C20;
  uint64_t v1 = a1[3];
  if (v1) {
    MEMORY[0x21D44B3E0](v1, 0x1000C8000313F17);
  }
  JUMPOUT(0x21D44B400);
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x21D44B280](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    char v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_2177674B0(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x217767470);
  }
  __cxa_rethrow();
}

void sub_21776752C(_Unwind_Exception *a1)
{
}

void sub_217767F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217768AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217768D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217768DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217768EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217769008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217769D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21776A214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21776A5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{
  _Unwind_Resume(a1);
}

void sub_21776A8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21776AEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21776B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,void *__p,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(a49);
  if (__p) {
    operator delete(__p);
  }
  if (a54) {
    operator delete(a54);
  }
  if (a66) {
    operator delete(a66);
  }

  _Unwind_Resume(a1);
}

void sub_21776BD98(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21776C780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_21776CB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21776D4C0(_Unwind_Exception *a1)
{
  for (uint64_t i = 7; i != -2; i -= 3)
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v1[i + 43]);

  _Unwind_Resume(a1);
}

void fieldDecoding(uint64_t *a1, unsigned int a2, int a3, void *a4, int a5, void *a6, void *a7, int a8)
{
  id v35 = a7;
  uint64_t v16 = (a3 - (a2 >> 1)) & ~((int)(a3 - (a2 >> 1)) >> 31);
  int v17 = a3 + (a2 >> 1);
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v19 = v18 - 1;
  int v20 = v18 - 1;
  if (v19 < v17) {
    int v17 = v20;
  }
  if ((int)v16 > v17) {
    goto LABEL_32;
  }
  uint64_t v21 = (v17 + 1);
  do
  {
    uint64_t v22 = *a1;
    uint64_t v23 = *(void *)(*a1 + 24 * v16);
    uint64_t v24 = *(void *)(*a1 + 24 * v16 + 8);
    uint64_t v25 = v24 - v23;
    if (v24 == v23) {
      goto LABEL_29;
    }
    uint64_t v26 = 0;
    unint64_t v27 = v25 >> 2;
    if (v27 <= 1) {
      unint64_t v27 = 1;
    }
    LODWORD(v15) = -8388608;
    uint64_t v28 = 0xFFFFFFFFLL;
    do
    {
      if (a5 == 3)
      {
        int v29 = *(_DWORD *)(*a4 + 4 * v26);
        if (v29 == 103 || (v29 - 91) > 0xFFFFFFE5) {
          goto LABEL_26;
        }
      }
      else if (a5 == 2)
      {
        int v31 = *(_DWORD *)(*a4 + 4 * v26);
        if (v31 == 103 || (v31 - 58) > 0xFFFFFFF5) {
          goto LABEL_26;
        }
      }
      else if (a5 != 1 || (*(_DWORD *)(*a4 + 4 * v26) - 48) > 9)
      {
        goto LABEL_26;
      }
      if (*(float *)(v23 + 4 * v26) > *(float *)&v15)
      {
        uint64_t v28 = v26;
        LODWORD(v15) = *(_DWORD *)(v23 + 4 * v26);
      }
LABEL_26:
      ++v26;
    }
    while (v27 != v26);
    if ((v28 & 0x80000000) == 0)
    {
      double v15 = *(double *)(*a6 + 8 * v28) + *(float *)&v15;
      *(double *)(*a6 + 8 * v28) = v15;
    }
LABEL_29:
    int v33 = v16;
    if (a8) {
      int v33 = ~v16 - 1431655765 * ((a1[1] - v22) >> 3);
    }
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", v33, v15);
    [v35 addObject:v34];

    ++v16;
  }
  while (v16 != v21);
LABEL_32:
}

void sub_21776D78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21776D8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_21776E730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (__p)
  {
    a57 = (uint64_t)__p;
    operator delete(__p);
  }

  std::string __p = &a67;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void std::vector<std::vector<float>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<float>>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      uint64_t v8 = a1[1];
      do
      {
        uint64_t v10 = *(void **)(v8 - 24);
        v8 -= 24;
        int v9 = v10;
        if (v10)
        {
          *(void *)(v3 - 16) = v9;
          operator delete(v9);
        }
        uint64_t v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void sub_21776EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_21776F6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,char *__p,char *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  if (__p)
  {
    a33 = __p;
    operator delete(__p);
  }

  std::string __p = &a44;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(*a1);
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(a1[1]);

    operator delete(a1);
  }
}

void std::vector<std::vector<float>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>>(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    double v15 = v12;
    uint64_t v16 = &v12[24 * v8];
    unint64_t v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    int v17 = &v16[v14];
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_21776FAA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  _OWORD v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    long long v13 = (char *)v7[1];
    char v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  char v12 = (void **)(result + 8);
  long long v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *char v12 = &v9[v17];
  return result;
}

uint64_t *std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    for (uint64_t i = a2 - 3; result < i; i -= 3)
    {
      uint64_t v3 = *result;
      *uint64_t result = *i;
      *uint64_t i = v3;
      uint64_t v4 = result[1];
      result[1] = i[1];
      i[1] = v4;
      uint64_t v5 = result[2];
      result[2] = i[2];
      i[2] = v5;
      result += 3;
    }
  }
  return result;
}

void *std::vector<double>::vector(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21776FEB4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_21776FF2C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2177701B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217770220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t closestNameInContacts(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0x7FFFFFFFLL;
  uint64_t v39 = 0;
  int64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  int64_t v42 = __Block_byref_object_copy_;
  uint64_t v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v10 = [v7 uppercaseString];

  unint64_t v11 = [v8 objectForKey:@"meContact"];
  if (v11)
  {
    char v12 = (id *)(v40 + 5);
    obint j = (id)v40[5];
    uint64_t matched = matchAgainstContact(v10, v11, &obj);
    objc_storeStrong(v12, obj);
    v46[3] = matched;
  }
  else
  {
    uint64_t matched = v46[3];
  }
  if (matched >= 2)
  {
    long long v14 = [v9 objectForKey:v10];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v15 = (id *)(v40 + 5);
        id v31 = (id)v40[5];
        uint64_t v16 = matchAgainstContact(v10, v14, &v31);
        objc_storeStrong(v15, v31);
        v46[3] = v16;
      }
    }
    else
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __closestNameInContacts_block_invoke;
      uint64_t v26 = &unk_26429E400;
      id v17 = v10;
      id v27 = v17;
      uint64_t v28 = &v45;
      int v29 = &v39;
      uint64_t v30 = &v33;
      [v8 enumerateKeysAndObjectsUsingBlock:&v23];
      unint64_t v18 = (__CFString *)v34[5];
      uint64_t v19 = objc_msgSend(NSString, "_newZStringWithString:", v17, v23, v24, v25, v26);
      if (v18) {
        int v20 = v18;
      }
      else {
        int v20 = @"NO_MATCH";
      }
      [v9 setObject:v20 forKey:v19];
    }
  }
  *a2 = (id) v40[5];
  uint64_t v21 = v46[3];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v21;
}

void sub_2177706A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
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

uint64_t matchAgainstContact(void *a1, void *a2, void *a3)
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if (!objc_opt_class())
  {
    uint64_t v10 = 0x7FFFFFFFLL;
    goto LABEL_105;
  }
  id v7 = [v6 objectForKey:*MEMORY[0x263EFDFC8]];
  float v142 = [v6 objectForKey:*MEMORY[0x263EFE050]];
  double v149 = [v6 objectForKey:*MEMORY[0x263EFDFB8]];
  unint64_t v150 = [v6 objectForKey:*MEMORY[0x263EFE038]];
  float v147 = [v6 objectForKey:*MEMORY[0x263EFE088]];
  v146 = [v6 objectForKey:*MEMORY[0x263EFE080]];
  id v8 = [v6 objectForKey:@"pinyinName"];
  int v137 = [v6 objectForKey:@"romanjiName"];
  id v143 = v8;
  id v9 = [v8 componentsSeparatedByString:@" "];
  if ([v9 count])
  {
    uint64_t v140 = [v9 lastObject];
  }
  else
  {
    uint64_t v140 = 0;
  }
  if ((unint64_t)[v9 count] < 2)
  {
    v141 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
    v141 = [v11 componentsJoinedByString:@" "];
  }
  if ([v9 count])
  {
    v139 = [v9 firstObject];
  }
  else
  {
    v139 = 0;
  }
  int64x2_t v125 = v9;
  int64x2_t v122 = a3;
  if ((unint64_t)[v9 count] < 2)
  {
    CGFloat v138 = 0;
  }
  else
  {
    char v12 = objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    CGFloat v138 = [v12 componentsJoinedByString:@" "];
  }
  unint64_t v13 = [v7 length] - 1;
  unint64_t v14 = [v149 length] - 1;
  uint64_t v15 = [v150 length];
  uint64_t v16 = [v150 length];
  uint64_t v17 = [v147 length];
  uint64_t v18 = [v146 length];
  uint64_t v19 = [v143 length];
  id v129 = (id)[v137 count];
  uint64_t v148 = v7;
  BOOL v20 = v13 <= 0x1C && stringContainsApproximateSubstring(v5, v7);
  id v126 = v6;
  unint64_t v21 = v15 - 1;
  BOOL v22 = v14 <= 0x1C && stringContainsApproximateSubstring(v5, v149);
  unint64_t v23 = v18 - 1;
  BOOL v24 = v21 <= 0x1C && stringContainsApproximateSubstring(v5, v150);
  unint64_t v25 = v17 - 1;
  BOOL v132 = v23 <= 0x1C && stringContainsApproximateSubstring(v5, v146);
  BOOL v127 = v25 <= 0x1C && stringContainsApproximateSubstring(v5, v147);
  if ((unint64_t)(v16 - 1) > 0x1C)
  {
    int v28 = 0;
  }
  else
  {
    uint64_t v26 = [v150 substringToIndex:1];
    id v27 = [@" " stringByAppendingString:v26];
    int v28 = [v5 containsString:v27];
  }
  if ((unint64_t)(v19 - 1) > 0x1C) {
    BOOL v29 = 0;
  }
  else {
    BOOL v29 = stringContainsApproximateSubstring(v5, v141) || stringContainsApproximateSubstring(v5, v140);
  }
  if (v20 && v22)
  {
    uint64_t v131 = [NSString stringWithFormat:@"%@ %@", v7, v149];
    uint64_t v30 = [v131 editDistanceFromString:v5 threshold:4];
  }
  else
  {
    uint64_t v131 = 0;
    uint64_t v30 = 0x7FFFFFFFLL;
  }
  id v31 = v143;
  uint64_t v123 = v30;
  if (v24)
  {
    uint64_t v32 = [NSString stringWithFormat:@"%@ %@ %@", v7, v150, v149];
    uint64_t v33 = [v32 editDistanceFromString:v5 threshold:4];
    id v134 = v32;
    uint64_t v135 = [v32 editDistanceFromStringIgnoringSpaces:v5 threshold:5];
    if (!v28) {
      goto LABEL_43;
    }
LABEL_47:
    id v38 = NSString;
    uint64_t v39 = [v150 substringToIndex:1];
    int64_t v40 = [v38 stringWithFormat:@"%@ %@ %@", v7, v39, v149];

    uint64_t v41 = [v40 editDistanceFromString:v5 threshold:4];
    if (v41 >= v33 && [v40 editDistanceFromStringIgnoringSpaces:v5 threshold:3] >= v33)
    {
      uint64_t v43 = v134;
    }
    else
    {
      id v42 = v40;

      uint64_t v33 = v41;
      uint64_t v43 = v42;
    }
    uint64_t v51 = NSString;
    uint64_t v52 = [v150 substringToIndex:1];
    uint64_t v53 = [v51 stringWithFormat:@"%@ %@. %@", v7, v52, v149];

    uint64_t v54 = [v53 editDistanceFromString:v5 threshold:4];
    if (v54 < v33 || [v53 editDistanceFromStringIgnoringSpaces:v5 threshold:4] < v33)
    {
      id v55 = v53;

      uint64_t v33 = v54;
      uint64_t v43 = v55;
    }
    id v134 = v43;

    if (v29) {
      goto LABEL_44;
    }
    goto LABEL_61;
  }
  id v134 = 0;
  uint64_t v135 = 0x7FFFFFFFLL;
  uint64_t v33 = 0x7FFFFFFFLL;
  if (v28) {
    goto LABEL_47;
  }
LABEL_43:
  if (v29)
  {
LABEL_44:
    uint64_t v34 = [v143 editDistanceFromString:v5 threshold:4];
    uint64_t v35 = [v143 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    uint64_t v36 = [v143 length];
    if (v34 <= (unint64_t)(v36 - [v35 length])) {
      uint64_t v37 = [v35 editDistanceFromString:v5 threshold:4];
    }
    else {
      uint64_t v37 = 0x7FFFFFFFLL;
    }
    if (v34 >= 2 && v37 >= 2)
    {
      id v44 = v35;
      uint64_t v45 = v37;
      uint64_t v46 = [NSString stringWithFormat:@"%@ %@", v140, v141];
      unint64_t v47 = [v46 editDistanceFromString:v5 threshold:4];
      uint64_t v48 = [v46 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      if ((uint64_t)v47 >= v34)
      {
        unint64_t v47 = v34;
        id v49 = v143;
      }
      else
      {
        id v49 = v46;

        uint64_t v50 = [v49 length];
        if (v47 <= v50 - [v48 length]) {
          uint64_t v45 = [v48 editDistanceFromString:v5 threshold:4];
        }
      }

      uint64_t v34 = v47;
      id v31 = v49;
      uint64_t v37 = v45;
      uint64_t v35 = v44;
    }
    if (v34 >= 2 && v37 >= 2)
    {
      id v144 = v35;
      uint64_t v56 = v37;
      uint64_t v57 = [NSString stringWithFormat:@"%@ %@", v138, v139];
      unint64_t v58 = [v31 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      uint64_t v59 = [v57 editDistanceFromString:v5 threshold:4];
      if (v59 >= v34)
      {
        unint64_t v60 = v34;
        id v61 = v31;
      }
      else
      {
        unint64_t v60 = v59;
        id v61 = v57;

        uint64_t v62 = [v61 length];
        if (v60 <= v62 - [v58 length]) {
          uint64_t v56 = [v58 editDistanceFromString:v5 threshold:4];
        }
      }

      uint64_t v34 = v60;
      id v31 = v61;
      uint64_t v37 = v56;
      uint64_t v35 = v144;
    }
    uint64_t v120 = v37;
    if (v34 >= 2 && v37 >= 2)
    {
      uint64_t v63 = v35;
      BOOL v64 = [NSString stringWithFormat:@"%@ %@", v139, v138];
      unint64_t v65 = [v64 editDistanceFromString:v5 threshold:4];
      uint64_t v66 = [v64 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      if ((uint64_t)v65 >= v34)
      {
        unint64_t v65 = v34;
        id v67 = v31;
      }
      else
      {
        id v67 = v64;

        uint64_t v68 = [v67 length];
        if (v65 <= v68 - [v66 length]) {
          uint64_t v120 = [v66 editDistanceFromString:v5 threshold:4];
        }
      }

      uint64_t v34 = v65;
      id v31 = v67;
      uint64_t v35 = v63;
    }

    goto LABEL_80;
  }
LABEL_61:
  uint64_t v120 = 0x7FFFFFFFLL;
  uint64_t v34 = 0x7FFFFFFFLL;
LABEL_80:
  id v145 = v31;
  if (v129)
  {
    id v155 = 0;
    uint64_t v69 = bestMatchInStringCandidates(v137, v5, &v155, 1);
    id v70 = v155;
    uint64_t v71 = [v70 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    id v130 = v70;
    uint64_t v72 = [v70 length];
    if (v69 <= (unint64_t)(v72 - [v71 length])) {
      uint64_t v73 = [v71 editDistanceFromString:v5 threshold:4];
    }
    else {
      uint64_t v73 = 0x7FFFFFFFLL;
    }
  }
  else
  {
    id v130 = 0;
    uint64_t v73 = 0x7FFFFFFFLL;
    uint64_t v69 = 0x7FFFFFFFLL;
  }
  if (v127 && v132)
  {
    long long v74 = [NSString stringWithFormat:@"%@ %@", v147, v146];
    unint64_t v75 = [v74 editDistanceFromString:v5 threshold:4];
    uint64_t v76 = [v74 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    id v128 = v74;
    uint64_t v77 = [v74 length];
    if (v75 <= v77 - [v76 length]) {
      uint64_t v78 = [v76 editDistanceFromString:v5 threshold:4];
    }
    else {
      uint64_t v78 = 0x7FFFFFFFLL;
    }

    BOOL v79 = v75 == 0;
  }
  else
  {
    id v128 = 0;
    BOOL v79 = 0;
    uint64_t v78 = 0x7FFFFFFFLL;
  }
  if (!v123 || !v33 || !v34 || v79 || !v69)
  {
    *int64x2_t v122 = v5;
    uint64_t v10 = -1;
LABEL_103:
    id v6 = v126;
    uint64_t v81 = v148;
    goto LABEL_104;
  }
  if (v123 == 1)
  {
    double v80 = v131;
LABEL_102:
    *int64x2_t v122 = v80;
    uint64_t v10 = 1;
    goto LABEL_103;
  }
  if (v33 == 1)
  {
    double v80 = v134;
    goto LABEL_102;
  }
  uint64_t v10 = v135;
  if (v135 <= 1)
  {
    float v83 = v134;
LABEL_112:
    *int64x2_t v122 = v83;
    goto LABEL_103;
  }
  if (v34 <= 1)
  {
    *int64x2_t v122 = v145;
    uint64_t v10 = v34;
    goto LABEL_103;
  }
  uint64_t v10 = v120;
  if (v120 <= 1)
  {
    float v83 = v145;
    goto LABEL_112;
  }
  uint64_t v81 = v148;
  if (v69 <= 1)
  {
    *int64x2_t v122 = v130;
    uint64_t v10 = v69;
LABEL_117:
    id v6 = v126;
    goto LABEL_104;
  }
  if (v73 <= 1)
  {
    *int64x2_t v122 = v130;
    uint64_t v10 = v73;
    goto LABEL_117;
  }
  id v6 = v126;
  if (v78 <= 1)
  {
    *int64x2_t v122 = v128;
    uint64_t v10 = 1;
    goto LABEL_104;
  }
  float v84 = [v5 uppercaseString];
  float v85 = [v84 componentsSeparatedByString:@" "];

  uint64_t v121 = [MEMORY[0x263F089D8] string];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v86 = v85;
  uint64_t v124 = [v86 countByEnumeratingWithState:&v151 objects:v156 count:16];
  if (!v124)
  {

    int v113 = v86;
    goto LABEL_189;
  }
  obint j = v86;
  int v117 = 0;
  int v115 = 0;
  uint64_t v10 = 0;
  id v118 = v5;
  uint64_t v119 = *(void *)v152;
  do
  {
    uint64_t v87 = 0;
    do
    {
      uint64_t v136 = v10;
      if (*(void *)v152 != v119) {
        objc_enumerationMutation(obj);
      }
      uint64_t v133 = v87;
      float v88 = *(void **)(*((void *)&v151 + 1) + 8 * v87);
      uint64_t v89 = [v88 editDistanceFromString:v81 threshold:4];
      uint64_t v90 = [v88 editDistanceFromString:v142 threshold:4];
      uint64_t v91 = [v88 editDistanceFromString:v150 threshold:4];
      uint64_t v92 = [v88 editDistanceFromString:v149 threshold:4];
      uint64_t v93 = [v88 editDistanceFromString:v147 threshold:4];
      uint64_t v94 = [v88 editDistanceFromString:v146 threshold:4];
      uint64_t v95 = [v88 editDistanceFromString:v140 threshold:4];
      uint64_t v96 = [v88 editDistanceFromString:v141 threshold:4];
      uint64_t v97 = [v88 editDistanceFromString:v139 threshold:4];
      uint64_t v98 = [v88 editDistanceFromString:v138 threshold:4];
      if (v89 >= v90) {
        uint64_t v99 = v90;
      }
      else {
        uint64_t v99 = v89;
      }
      if (v99 >= v91) {
        uint64_t v99 = v91;
      }
      if (v99 >= v92) {
        uint64_t v99 = v92;
      }
      if (v99 >= v93) {
        uint64_t v99 = v93;
      }
      if (v99 >= v94) {
        uint64_t v99 = v94;
      }
      if (v99 >= v95) {
        uint64_t v99 = v95;
      }
      if (v99 >= v96) {
        uint64_t v99 = v96;
      }
      if (v99 >= v97) {
        uint64_t v99 = v97;
      }
      if (v99 >= v98) {
        uint64_t v100 = v98;
      }
      else {
        uint64_t v100 = v99;
      }
      if (v148 && v89 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        uint64_t v81 = v148;
        [v121 appendString:v148];
        int v117 = 1;
        id v5 = v118;
LABEL_156:
        uint64_t v104 = v136;
        uint64_t v105 = v133;
        goto LABEL_157;
      }
      if (v142 && v90 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        CGFloat v102 = v121;
        CGFloat v103 = v142;
        goto LABEL_154;
      }
      if (v150 && v91 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        CGFloat v102 = v121;
        CGFloat v103 = v150;
LABEL_154:
        [v102 appendString:v103];
        int v117 = 1;
        id v5 = v118;
LABEL_155:
        uint64_t v81 = v148;
        goto LABEL_156;
      }
      id v5 = v118;
      if (v140 && v95 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        [v121 appendString:v140];
        int v117 = 1;
        goto LABEL_155;
      }
      uint64_t v81 = v148;
      if (v139 && v97 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        int v106 = v121;
        double v107 = v139;
LABEL_168:
        [v106 appendString:v107];
        int v117 = 1;
        goto LABEL_156;
      }
      if (v147 && v93 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        int v106 = v121;
        double v107 = v147;
        goto LABEL_168;
      }
      if (v141 && v96 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        v108 = v121;
        double v109 = v141;
LABEL_175:
        [v108 appendString:v109];
        int v115 = 1;
        goto LABEL_156;
      }
      if (v138 && v98 <= 1)
      {
        uint64_t v101 = v100;
        [v121 appendString:@" "];
        v108 = v121;
        double v109 = v138;
        goto LABEL_175;
      }
      uint64_t v101 = v100;
      uint64_t v105 = v133;
      if (v146 && v94 <= 1)
      {
        [v121 appendString:@" "];
        v110 = v121;
        uint64_t v111 = v146;
      }
      else
      {
        [v121 appendString:@" "];
        if (!v149 || v92 > 1)
        {
          [v121 appendString:v88];
          goto LABEL_184;
        }
        v110 = v121;
        uint64_t v111 = v149;
      }
      [v110 appendString:v111];
      int v115 = 1;
LABEL_184:
      uint64_t v104 = v136;
LABEL_157:
      uint64_t v10 = v101 + v104;
      uint64_t v87 = v105 + 1;
    }
    while (v124 != v87);
    uint64_t v112 = [obj countByEnumeratingWithState:&v151 objects:v156 count:16];
    uint64_t v124 = v112;
  }
  while (v112);
  int v113 = obj;

  id v6 = v126;
  if (v117 & v115)
  {
    objc_msgSend(v121, "deleteCharactersInRange:", 0, 1);
    id v114 = v121;
    *int64x2_t v122 = v114;

    goto LABEL_104;
  }
LABEL_189:

  uint64_t v10 = 0x7FFFFFFFLL;
LABEL_104:

LABEL_105:
  return v10;
}

void __closestNameInContacts_block_invoke(void *a1, void *a2, void *a3, BOOL *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x21D44B7E0]();
  id v9 = (void *)a1[4];
  id v15 = 0;
  uint64_t matched = matchAgainstContact(v9, v7, &v15);
  id v11 = v15;
  id v12 = v15;
  uint64_t v13 = *(void *)(*(void *)(a1[5] + 8) + 24);
  if (matched < v13)
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v11);
    *(void *)(*(void *)(a1[5] + 8) + 24) = matched;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    uint64_t v13 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  *a4 = v13 < 1;
}

BOOL isValidNameString(void *a1)
{
  id v1 = a1;
  if ([v1 rangeOfString:@"(([\\.\\-\\'\\,\\/])([\\.\\-\\'\\,\\/]))|(\\/)|(\\ \\.)" options:1024] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    BOOL v3 = (unint64_t)[v2 length] > 5;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t isNonNameString(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 componentsSeparatedByString:@" "];
  unint64_t v3 = [v2 count];

  if (v3 >= 2
    && ([v1 componentsSeparatedByString:@"-"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 count],
        v4,
        v5 <= 2))
  {
    id v7 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [&unk_26C7C5568 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(&unk_26C7C5568);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ([v1 rangeOfString:v12] != 0x7FFFFFFFFFFFFFFFLL
            || [v7 rangeOfString:v12] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v6 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [&unk_26C7C5568 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v6 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
LABEL_16:
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

id extractBestDateString(void *a1, char a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v30 = v5;
  id v7 = [v6 components:28 fromDate:v5];

  uint64_t v33 = [v7 year];
  uint64_t v32 = [v7 month];
  BOOL v29 = v7;
  uint64_t v8 = [v7 year];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obint j = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v31 = v8 + 15;
    uint64_t v12 = -2147483647;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v16 = [v15 objectForKey:@"Year"];
        uint64_t v17 = [v16 integerValue];

        if (v17 <= 99)
        {
          uint64_t v18 = [v15 objectForKey:@"Year"];
          uint64_t v19 = [v18 integerValue];

          BOOL v20 = [v15 objectForKey:@"Year"];
          if (v19 <= 80) {
            unint64_t v21 = @"20";
          }
          else {
            unint64_t v21 = @"19";
          }
          BOOL v22 = [(__CFString *)v21 stringByAppendingString:v20];
          uint64_t v17 = [v22 integerValue];
        }
        unint64_t v23 = [v15 objectForKey:@"Month"];
        uint64_t v24 = [v23 integerValue];

        if (a2) {
          goto LABEL_20;
        }
        BOOL v25 = v33 == v17;
        if (v24 >= v32) {
          BOOL v25 = 0;
        }
        BOOL v26 = v33 <= v17 && v17 <= v31;
        if (v26 && !v25)
        {
LABEL_20:
          if (v17 > v12)
          {
            id v27 = v15;

            id v11 = v27;
            uint64_t v12 = v17;
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

id extractValidDateStrings(void *a1)
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  id v128 = 0;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(0[1-9]|[12][0-9]|3[01])([\\-\\/\\.])(0[1-9]|1[012])\\2(\\d\\d)" options:0 error:&v128];
  id v5 = v128;
  [v3 addObject:v4];

  id v127 = v5;
  uint64_t v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(0[1-9]|1[012])([\\-\\/\\.])(0[1-9]|[12][0-9]|3[01])\\2(\\d\\d)" options:0 error:&v127];
  id v7 = v127;

  [v3 addObject:v6];
  id v126 = v7;
  uint64_t v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(0[1-9]|1[012])([\\-\\/\\.])((?:20)?\\d\\d)" options:0 error:&v126];
  id v9 = v126;

  [v3 addObject:v8];
  id v125 = v9;
  uint64_t v10 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(0[1-9]|[12][0-9]|3[01])?(JAN|FEB|MAR|APR|MAY|JUN|JLY|AUG|SEP|OCT|NOV|DEC)(\\d\\d)" options:0 error:&v125];
  id v11 = v125;

  [v3 addObject:v10];
  id v124 = v11;
  uint64_t v12 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?<![\\/])(20\\d\\d)([\\-\\/\\.])(0[1-9]|1[012])(?![\\/])" options:0 error:&v124];
  id v13 = v124;

  [v3 addObject:v12];
  id v123 = v13;
  long long v14 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(0[1-9]|1[012])([\\-\\/\\.])(\\d)(\\d\\d)" options:0 error:&v123];
  id v95 = v123;

  [v3 addObject:v14];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obint j = v3;
  uint64_t v99 = [obj countByEnumeratingWithState:&v119 objects:v132 count:16];
  if (v99)
  {
    int v15 = 0;
    uint64_t v98 = *(void *)v120;
    uint64_t v101 = v1;
    CGFloat v102 = v2;
    do
    {
      uint64_t v16 = 0;
      int v96 = v15;
      int v107 = v15;
      do
      {
        if (*(void *)v120 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v100 = v16;
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v119 + 1) + 8 * v16), "matchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v106 = v17;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v116;
          uint64_t v104 = *(void *)v116;
          do
          {
            uint64_t v21 = 0;
            uint64_t v105 = v19;
            do
            {
              if (*(void *)v116 != v20) {
                objc_enumerationMutation(v106);
              }
              BOOL v22 = *(void **)(*((void *)&v115 + 1) + 8 * v21);
              if ([v22 range] != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v110 = v21;
                uint64_t v23 = [v22 rangeAtIndex:0];
                uint64_t v25 = objc_msgSend(v1, "substringWithRange:", v23, v24);
                BOOL v26 = [MEMORY[0x263EFF9A0] dictionary];
                id v27 = (void *)MEMORY[0x263F08D40];
                v108 = v22;
                uint64_t v28 = [v22 rangeAtIndex:0];
                uint64_t v30 = objc_msgSend(v27, "valueWithRange:", v28, v29);
                double v109 = (void *)v25;
                switch(v107)
                {
                  case 0:
                    [v26 setObject:v25 forKey:@"Result"];
                    uint64_t v31 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v31, v32);
                    [v26 setObject:v33 forKey:@"Year"];
                    uint64_t v34 = [v22 rangeAtIndex:3];
                    long long v36 = objc_msgSend(v1, "substringWithRange:", v34, v35);
                    [v26 setObject:v36 forKey:@"Month"];
                    uint64_t v37 = [v22 rangeAtIndex:1];
                    long long v39 = objc_msgSend(v1, "substringWithRange:", v37, v38);
                    int64_t v40 = v26;
                    uint64_t v41 = v39;
                    id v42 = @"Day";
                    goto LABEL_37;
                  case 1:
                    [v26 setObject:v25 forKey:@"Result"];
                    uint64_t v70 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v70, v71);
                    [v26 setObject:v33 forKey:@"Year"];
                    uint64_t v72 = [v22 rangeAtIndex:3];
                    long long v36 = objc_msgSend(v1, "substringWithRange:", v72, v73);
                    [v26 setObject:v36 forKey:@"Day"];
                    uint64_t v74 = [v22 rangeAtIndex:1];
                    long long v39 = objc_msgSend(v1, "substringWithRange:", v74, v75);
                    int64_t v40 = v26;
                    uint64_t v41 = v39;
                    id v42 = @"Month";
LABEL_37:
                    [v40 setObject:v41 forKey:v42];
                    [v26 setObject:v30 forKey:@"substringRange"];

                    goto LABEL_42;
                  case 2:
                    CGFloat v103 = v26;
                    long long v113 = 0u;
                    long long v114 = 0u;
                    long long v111 = 0u;
                    long long v112 = 0u;
                    id v47 = v2;
                    uint64_t v48 = [v47 countByEnumeratingWithState:&v111 objects:v130 count:16];
                    if (v48)
                    {
                      uint64_t v49 = v48;
                      char v50 = 0;
                      uint64_t v51 = *(void *)v112;
                      do
                      {
                        for (uint64_t i = 0; i != v49; ++i)
                        {
                          if (*(void *)v112 != v51) {
                            objc_enumerationMutation(v47);
                          }
                          uint64_t v53 = [*(id *)(*((void *)&v111 + 1) + 8 * i) objectForKey:@"substringRange"];
                          uint64_t v54 = v53;
                          if (v53)
                          {
                            NSUInteger v55 = [v53 rangeValue];
                            NSUInteger v57 = v56;
                            v137.location = [v30 rangeValue];
                            v137.length = v58;
                            v135.location = v55;
                            v135.length = v57;
                            v50 |= NSIntersectionRange(v135, v137).length != 0;
                          }
                        }
                        uint64_t v49 = [v47 countByEnumeratingWithState:&v111 objects:v130 count:16];
                      }
                      while (v49);

                      id v1 = v101;
                      uint64_t v2 = v102;
                      uint64_t v20 = v104;
                      uint64_t v19 = v105;
                      uint64_t v59 = v103;
                      if (v50) {
                        goto LABEL_45;
                      }
                    }
                    else
                    {

                      uint64_t v59 = v26;
                    }
                    NSUInteger v80 = [v108 rangeAtIndex:1];
                    NSUInteger v82 = v81;
                    v138.location = [v108 rangeAtIndex:2];
                    v138.length = v83;
                    v136.location = v80;
                    v136.length = v82;
                    NSRange v84 = NSUnionRange(v136, v138);
                    v139.location = [v108 rangeAtIndex:3];
                    v139.length = v85;
                    NSRange v86 = NSUnionRange(v84, v139);
                    uint64_t v87 = objc_msgSend(v1, "substringWithRange:", v86.location, v86.length);
                    [v59 setObject:v87 forKey:@"Result"];

                    uint64_t v88 = objc_msgSend(v108, "rangeAtIndex:", objc_msgSend(v108, "numberOfRanges") - 1);
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v88, v89);
                    [v59 setObject:v33 forKey:@"Year"];
                    uint64_t v90 = [v108 rangeAtIndex:1];
                    long long v36 = objc_msgSend(v1, "substringWithRange:", v90, v91);
                    [v59 setObject:v36 forKey:@"Month"];
                    BOOL v26 = v59;
LABEL_42:

                    uint64_t v20 = v104;
                    uint64_t v19 = v105;
LABEL_43:
                    uint64_t v92 = [v26 objectForKey:@"Result"];

                    uint64_t v59 = v26;
                    if (v92) {
                      [v2 addObject:v26];
                    }
LABEL_45:

                    uint64_t v21 = v110;
                    break;
                  case 3:
                    [v26 setObject:v25 forKey:@"Result"];
                    uint64_t v60 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 1);
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v60, v61);
                    [v26 setObject:v33 forKey:@"Year"];
                    uint64_t v62 = objc_msgSend(v22, "rangeAtIndex:", objc_msgSend(v22, "numberOfRanges") - 2);
                    long long v36 = objc_msgSend(v1, "substringWithRange:", v62, v63);
                    uint64_t v64 = 0;
                    v129[2] = xmmword_26429E440;
                    v129[3] = *(_OWORD *)&off_26429E450;
                    v129[4] = xmmword_26429E460;
                    v129[5] = *(_OWORD *)off_26429E470;
                    v129[0] = xmmword_26429E420;
                    v129[1] = *(_OWORD *)&off_26429E430;
                    do
                    {
                      if ([v36 isEqualToString:*((void *)v129 + v64)])
                      {
                        unint64_t v65 = objc_msgSend(NSString, "stringWithFormat:", @"%02i", ++v64);
                        [v26 setObject:v65 forKey:@"Month"];
                      }
                      else
                      {
                        ++v64;
                      }
                    }
                    while (v64 != 12);
                    uint64_t v66 = [v108 rangeAtIndex:1];
                    id v1 = v101;
                    if (v66 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v68 = objc_msgSend(v101, "substringWithRange:", v66, v67);
                      [v26 setObject:v68 forKey:@"Day"];
                    }
                    uint64_t v69 = 88;
                    uint64_t v2 = v102;
                    do
                    {

                      v69 -= 8;
                    }
                    while (v69 != -8);
                    goto LABEL_42;
                  case 4:
                    [v26 setObject:v25 forKey:@"Result"];
                    uint64_t v43 = [v22 rangeAtIndex:1];
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v43, v44);
                    [v26 setObject:v33 forKey:@"Year"];
                    uint64_t v45 = v22;
                    uint64_t v46 = 3;
                    goto LABEL_39;
                  case 5:
                    [v26 setObject:v25 forKey:@"Result"];
                    uint64_t v76 = [v22 rangeAtIndex:4];
                    uint64_t v33 = objc_msgSend(v1, "substringWithRange:", v76, v77);
                    [v26 setObject:v33 forKey:@"Year"];
                    uint64_t v45 = v22;
                    uint64_t v46 = 1;
LABEL_39:
                    uint64_t v78 = [v45 rangeAtIndex:v46];
                    long long v36 = objc_msgSend(v1, "substringWithRange:", v78, v79);
                    [v26 setObject:v36 forKey:@"Month"];
                    goto LABEL_42;
                  default:
                    goto LABEL_43;
                }
              }
              ++v21;
            }
            while (v21 != v19);
            uint64_t v19 = [v106 countByEnumeratingWithState:&v115 objects:v131 count:16];
          }
          while (v19);
        }
        ++v107;

        uint64_t v16 = v100 + 1;
      }
      while (v100 + 1 != v99);
      uint64_t v93 = [obj countByEnumeratingWithState:&v119 objects:v132 count:16];
      int v15 = v96 + v99;
      uint64_t v99 = v93;
    }
    while (v93);
  }

  return v2;
}

id computeReferenceDateFromString(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 length])
  {
    uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];

    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = [&unk_26C7C5580 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(&unk_26C7C5580);
        }
        [v4 setDateFormat:*(void *)(*((void *)&v19 + 1) + 8 * v8)];
        uint64_t v9 = [v4 dateFromString:v3];
        if (v9) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [&unk_26C7C5580 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v6) {
            goto LABEL_5;
          }
          goto LABEL_15;
        }
      }
      id v11 = (void *)v9;
      uint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v13 = [v12 components:28 fromDate:v11];
      if ([v13 year] >= 1981)
      {
      }
      else
      {
        objc_msgSend(v13, "setYear:", objc_msgSend(v13, "year") + 100);
        uint64_t v14 = [v12 dateFromComponents:v13];

        id v11 = (void *)v14;
        if (!v14) {
          goto LABEL_15;
        }
      }
      int v15 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v16 = [v15 components:12 fromDate:v11];
      objc_msgSend(v16, "setYear:", objc_msgSend(v16, "year") - 7);
      uint64_t v17 = [v15 dateFromComponents:v16];

      id v10 = v17;
    }
    else
    {
LABEL_15:
      fwrite("\nCould not extract date from ground truth. Using current date", 0x3DuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      id v10 = [MEMORY[0x263EFF910] date];
    }

    uint64_t v2 = (void *)v3;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF910] date];
  }

  return v10;
}

uint64_t checkPartialCodePrefix(void *a1, uint64_t a2)
{
  v18[6] = *MEMORY[0x263EF8340];
  id v3 = a1;
  v17[0] = &unk_26C7C5760;
  v17[1] = &unk_26C7C5778;
  v18[0] = &unk_26C7C5598;
  v18[1] = &unk_26C7C55B0;
  v17[2] = &unk_26C7C5790;
  v17[3] = &unk_26C7C57A8;
  v18[2] = &unk_26C7C55C8;
  v18[3] = &unk_26C7C55E0;
  v17[4] = &unk_26C7C57C0;
  v17[5] = &unk_26C7C57D8;
  v18[4] = &unk_26C7C55F8;
  v18[5] = &unk_26C7C5610;
  id v4 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKey:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v3, "hasPrefix:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

uint64_t checkCodePrefix(void *a1)
{
  id v1 = a1;
  uint64_t v2 = checkPartialCodePrefix(v1, [v1 length]);

  return v2;
}

id extractExpirationDateResults(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"com.apple.CoreRecognition.disable_year_check"];
  char v7 = [v6 BOOLValue];

  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  if (v3 && [v3 count])
  {
    uint64_t v9 = [v3 objectAtIndex:0];
    id v10 = extractValidDateStrings(v9);

    if (!v10 || ![v10 count])
    {
      id v11 = [v3 objectAtIndex:0];
      long long v12 = [v11 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      uint64_t v13 = extractValidDateStrings(v12);

      id v10 = (void *)v13;
    }
    long long v14 = [v3 objectAtIndex:0];
    [v8 setObject:v14 forKey:@"expfull"];

    long long v15 = extractBestDateString(v10, v7, v4);
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 objectForKey:@"Result"];
      if ([v17 length] == 6)
      {
        uint64_t v18 = objc_msgSend(v17, "stringByReplacingCharactersInRange:withString:", 3, 1, &stru_26C7BF850);

        uint64_t v17 = (void *)v18;
      }
      [v8 setObject:v17 forKey:@"expirationDate"];
      long long v19 = [v16 objectForKey:@"Year"];
      [v8 setObject:v19 forKey:@"expirationYear"];

      long long v20 = [v16 objectForKey:@"Month"];

      if (v20)
      {
        long long v21 = [v16 objectForKey:@"Month"];
        [v8 setObject:v21 forKey:@"expirationMonth"];
      }
      long long v22 = [v16 objectForKey:@"Day"];

      if (v22)
      {
        uint64_t v23 = [v16 objectForKey:@"Day"];
        [v8 setObject:v23 forKey:@"expirationDay"];
      }
      [v8 setObject:MEMORY[0x263EFFA88] forKey:@"expDateAccepted"];
      uint64_t v24 = [v3 objectAtIndex:0];
      uint64_t v25 = [v24 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      BOOL v26 = [v16 objectForKey:@"Result"];
      uint64_t v27 = [v25 rangeOfString:v26];

      if ((unint64_t)[v3 count] >= 2)
      {
        uint64_t v28 = [v3 objectAtIndex:1];
        uint64_t v29 = [v28 objectAtIndex:v27];
        [v8 setObject:v29 forKey:@"dateOffset"];

        if ((unint64_t)[v3 count] < 3)
        {
          float v31 = 300.0;
        }
        else
        {
          uint64_t v30 = [v3 objectAtIndex:2];
          float v31 = (float)[v30 integerValue];
        }
        uint64_t v32 = [v3 objectAtIndex:1];
        uint64_t v33 = [v32 objectAtIndex:v27];
        float v34 = (float)[v33 integerValue] / v31;

        *(float *)&double v35 = v34;
        long long v36 = [NSNumber numberWithFloat:v35];
        [v8 setObject:v36 forKey:@"normalizedDateOffset"];
      }
    }
  }
  return v8;
}

id extractCardholderNameResults(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v5 count])
  {
    uint64_t v9 = [v5 objectAtIndex:0];
    id v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v11 = [v9 stringByTrimmingCharactersInSet:v10];

    if ([v11 length])
    {
      id v39 = 0;
      uint64_t v12 = closestNameInContacts(v11, &v39, v6, v7);
      id v13 = v39;
      long long v14 = (void *)[NSString _newZStringWithString:v11];
      [v8 setObject:v14 forKey:@"nameResult"];

      if ((unint64_t)[v5 count] >= 2)
      {
        long long v15 = [v5 objectAtIndex:1];
        uint64_t v16 = [v15 objectAtIndex:0];
        [v8 setObject:v16 forKey:@"nameOffset"];

        if ((unint64_t)[v5 count] < 3)
        {
          float v18 = 300.0;
        }
        else
        {
          uint64_t v17 = [v5 objectAtIndex:2];
          float v18 = (float)[v17 integerValue];
        }
        long long v19 = [v5 objectAtIndex:1];
        long long v20 = [v19 objectAtIndex:0];
        float v21 = (float)[v20 integerValue] / v18;

        *(float *)&double v22 = v21;
        uint64_t v23 = [NSNumber numberWithFloat:v22];
        [v8 setObject:v23 forKey:@"normalizedNameOffset"];
      }
      if (v13)
      {
        int v24 = (int)[v13 length] / 3;
        uint64_t v25 = (void *)[NSString _newZStringWithString:v13];
        [v8 setObject:v25 forKey:@"closestNameMatch"];

        BOOL v26 = [NSNumber numberWithInteger:v12];
        [v8 setObject:v26 forKey:@"closestNameDistance"];

        uint64_t v27 = [NSNumber numberWithInteger:v24];
        [v8 setObject:v27 forKey:@"minMatchDistance"];

        if (v12 <= v24)
        {
          if (v12 < 0) {
            [v8 setObject:MEMORY[0x263EFFA88] forKey:@"nameAccepted"];
          }
          uint64_t v28 = (void *)[NSString _newZStringWithString:v13];
          [v8 setObject:v28 forKey:@"cardholderName"];

          if ((unint64_t)[v5 count] >= 2)
          {
            uint64_t v29 = [v5 objectAtIndex:1];
            uint64_t v30 = [v29 objectAtIndex:0];
            [v8 setObject:v30 forKey:@"nameOffset"];

            if ((unint64_t)[v5 count] < 3)
            {
              float v32 = 300.0;
            }
            else
            {
              float v31 = [v5 objectAtIndex:2];
              float v32 = (float)[v31 integerValue];
            }
            uint64_t v33 = [v5 objectAtIndex:1];
            float v34 = [v33 objectAtIndex:0];
            float v35 = (float)[v34 integerValue] / v32;

            *(float *)&double v36 = v35;
            uint64_t v37 = [NSNumber numberWithFloat:v36];
            [v8 setObject:v37 forKey:@"normalizedNameOffset"];
          }
        }
      }
    }
  }

  return v8;
}

id extractCardNumberResults(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  if (v1 && [v1 count])
  {
    id v3 = [v1 objectAtIndex:0];
    id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];

    id v6 = extractCardCode(v5);
    id v7 = @"code";
    if (v6)
    {
      [v2 setObject:v6 forKey:@"code"];
      uint64_t v8 = (void *)MEMORY[0x263EFFA88];
      id v7 = @"accepted";
      uint64_t v9 = v2;
    }
    else
    {
      uint64_t v9 = v2;
      uint64_t v8 = v5;
    }
    [v9 setObject:v8 forKey:v7];
  }
  return v2;
}

id extractCardCode(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 objectForKey:@"com.apple.CoreRecognition.disable_prefix_check"];
  char v4 = [v3 BOOLValue];

  id v5 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
  if ([v5 length]
    && [v5 length] == 16
    && checkCardCode(v5)
    && ((v4 & 1) != 0 || checkCodePrefix(v5)))
  {
    id v6 = (void *)[v5 mutableCopy];
    [v6 insertString:@" " atIndex:12];
    [v6 insertString:@" " atIndex:8];
    [v6 insertString:@" " atIndex:4];
    id v7 = (void *)[NSString _newZStringWithString:v6];
    goto LABEL_56;
  }
  id v6 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
  if ([v6 length]
    && [v6 length] == 15
    && checkCardCode(v6)
    && ((v4 & 1) != 0 || checkCodePrefix(v6)))
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C7C5658];
    id v10 = [v8 substringToIndex:2];
    int v11 = [v9 containsObject:v10];

    if (v11) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = 10;
    }
    if (v11) {
      uint64_t v13 = 11;
    }
    else {
      uint64_t v13 = 4;
    }
    [v8 insertString:@" " atIndex:v12];
    [v8 insertString:@" " atIndex:v13];
    long long v14 = NSString;
    long long v15 = v8;
  }
  else
  {
    uint64_t v8 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
    if ((unint64_t)[v8 length] < 0x11
      || (unint64_t)[v8 length] > 0x13
      || !checkCardCode(v8)
      || (v4 & 1) == 0 && !checkCodePrefix(v8))
    {
      uint64_t v9 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
      if ([v9 length] != 12 && objc_msgSend(v9, "length") != 11) {
        goto LABEL_40;
      }
      if ([v9 length] == 12
        && objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 3) != 32
        || [v9 length] == 11
        && objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 2) != 32)
      {
        id v7 = 0;
        goto LABEL_55;
      }
      if (([v9 length] != 11 || objc_msgSend(v9, "characterAtIndex:", 10) == 49)
        && (objc_msgSend(v9, "substringWithRange:", 0, 10),
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            BOOL v17 = checkCardCode(v16),
            v16,
            v17))
      {
        float v18 = (void *)[v9 mutableCopy];
        if ([v9 length] == 12)
        {
          [v18 insertString:@" " atIndex:10];
          [v18 insertString:@" " atIndex:7];
          [v18 insertString:@" " atIndex:3];
        }
        if ([v9 length] == 11)
        {
          [v18 insertString:@" " atIndex:10];
          [v18 insertString:@" " atIndex:9];
          [v18 insertString:@" " atIndex:6];
          [v18 insertString:@" " atIndex:3];
        }
        id v7 = (void *)[NSString _newZStringWithString:v18];
      }
      else
      {
LABEL_40:
        float v18 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
        if ([v18 length] == 14
          && checkCardCode(v18)
          && ((v4 & 1) != 0 || checkCodePrefix(v18)))
        {
          long long v19 = (void *)[v18 mutableCopy];
          [v19 insertString:@" " atIndex:10];
          [v19 insertString:@" " atIndex:4];
          id v7 = (void *)[NSString _newZStringWithString:v19];
        }
        else
        {
          long long v19 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
          if ([v19 length] == 13 && objc_msgSend(v1, "rangeOfString:", @" ") == 4)
          {
            long long v20 = [@"589297" stringByAppendingString:v19];

            if (checkCardCode(v20))
            {
              float v21 = (void *)[v20 mutableCopy];
              [v21 insertString:@" " atIndex:16];
              [v21 insertString:@" " atIndex:13];
              [v21 insertString:@" " atIndex:10];
              [v21 insertString:@" " atIndex:6];
              id v7 = (void *)[NSString _newZStringWithString:v21];
            }
            else
            {
              id v7 = 0;
            }
            long long v19 = v20;
          }
          else
          {
            id v7 = 0;
          }
        }
      }
      goto LABEL_55;
    }
    uint64_t v9 = (void *)[v8 mutableCopy];
    long long v14 = NSString;
    long long v15 = v9;
  }
  id v7 = (void *)[v14 _newZStringWithString:v15];
LABEL_55:

LABEL_56:
  return v7;
}

BOOL isValidCodeLocation(void *a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  int v11 = [a1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
  uint64_t v12 = [v11 length];

  if (v12 != 12) {
    return 1;
  }
  if (a2) {
    return 0;
  }
  v14.origin.double y = 0.2;
  v14.size.height = 0.6;
  v14.origin.double x = 0.0;
  v14.size.vImagePixelCount width = 1.0;
  v15.origin.double x = a3;
  v15.origin.double y = a4;
  v15.size.vImagePixelCount width = a5;
  v15.size.height = a6;
  return CGRectContainsRect(v14, v15);
}

uint64_t isValidNameLocationForCode(void *a1, double a2, double a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(&unk_26C7C5628, "arrayByAddingObjectsFromArray:", &unk_26C7C5640, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= [v4 hasPrefix:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);

    char v11 = v8 ^ 1 | (a3 < 14.53);
  }
  else
  {

    char v11 = 1;
  }

  return v11 & 1;
}

BOOL checkCardCode(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] >= 0xA && (unint64_t)objc_msgSend(v1, "length") <= 0x13)
  {
    id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26C7C56A0];
    if (([v3 containsObject:v1] & 1) != 0
      || (id v4 = v1, v5 = [v4 UTF8String], !objc_msgSend(v4, "length")))
    {
LABEL_9:
      BOOL v2 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      while (*(unsigned char *)(v5 + v6) == 48)
      {
        if ([v4 length] <= (unint64_t)++v6) {
          goto LABEL_9;
        }
      }
      int v8 = [v4 length];
      int v9 = [v4 length];
      if (v9 < 1)
      {
        BOOL v2 = 1;
      }
      else
      {
        int v10 = 0;
        unint64_t v11 = v9 + 1;
        do
        {
          LOBYTE(v12) = *(unsigned char *)(v5 + (v11 - 2)) - 48;
          if ((((v11 - 2) ^ v8) & 1) == 0)
          {
            signed int v12 = (char)(2 * v12);
            if (v12 >= 10) {
              signed int v12 = v12 - 10 * (v12 / 0xAu) + v12 / 0xAu;
            }
          }
          v10 += (char)v12;
          --v11;
        }
        while (v11 > 1);
        HIDWORD(v13) = -858993459 * v10 + 429496728;
        LODWORD(v13) = HIDWORD(v13);
        BOOL v2 = (v13 >> 1) < 0x19999999;
      }
    }
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

id extractCardCodeHK(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v1 = a1;
  BOOL v2 = [v1 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
  if ([v2 length] == 13 && objc_msgSend(v1, "characterAtIndex:", 3) == 32)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v3 = [&unk_26C7C5670 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(&unk_26C7C5670);
          }
          uint64_t v7 = [*(id *)(*((void *)&v21 + 1) + 8 * i) stringByAppendingString:v2];
          if (checkCardCode(v7))
          {
            unint64_t v13 = (void *)[v7 mutableCopy];
            [v13 insertString:@" " atIndex:18];
            long long v14 = v13;
            uint64_t v15 = 15;
            goto LABEL_26;
          }
        }
        uint64_t v4 = [&unk_26C7C5670 countByEnumeratingWithState:&v21 objects:v26 count:16];
        int v8 = 0;
        if (v4) {
          continue;
        }
        goto LABEL_27;
      }
    }
LABEL_23:
    int v8 = 0;
    goto LABEL_27;
  }
  if ([v2 length] != 11) {
    goto LABEL_23;
  }
  if ([v1 characterAtIndex:3] != 32) {
    goto LABEL_23;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [&unk_26C7C5688 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (!v9) {
    goto LABEL_23;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v18;
  while (2)
  {
    for (uint64_t j = 0; j != v10; ++j)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(&unk_26C7C5688);
      }
      uint64_t v7 = [*(id *)(*((void *)&v17 + 1) + 8 * j) stringByAppendingString:v2];
      if (checkCardCode(v7))
      {
        unint64_t v13 = (void *)[v7 mutableCopy];
        [v13 insertString:@" " atIndex:16];
        long long v14 = v13;
        uint64_t v15 = 10;
LABEL_26:
        [v14 insertString:@" " atIndex:v15];
        [v13 insertString:@" " atIndex:9];
        [v13 insertString:@" " atIndex:6];
        int v8 = (void *)[NSString _newZStringWithString:v13];

        goto LABEL_27;
      }
    }
    uint64_t v10 = [&unk_26C7C5688 countByEnumeratingWithState:&v17 objects:v25 count:16];
    int v8 = 0;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  return v8;
}

id enrichedNumbersListHK(void *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v37 = (id)[v1 mutableCopy];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v41;
    id v38 = v2;
    uint64_t v39 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
        if ((unint64_t)[v7 length] >= 0xC && (unint64_t)objc_msgSend(v8, "length") >= 0xA)
        {
          uint64_t v9 = [v7 length];
          if ([v7 length]) {
            BOOL v10 = v9 == 0;
          }
          else {
            BOOL v10 = 1;
          }
          if (!v10)
          {
            unint64_t v11 = 0;
            while (1)
            {
              unint64_t v12 = objc_msgSend(v7, "rangeOfString:options:range:", @" ", 0, v11, v9);
              if (v12 > 0xA || ((1 << v12) & 0x428) == 0) {
                break;
              }
              unint64_t v11 = v12 + 1;
              uint64_t v9 = [v7 length] + ~v12;
              if (v11 >= [v7 length] || v9 == 0) {
                goto LABEL_24;
              }
            }
            if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v37 removeObject:v7];
              uint64_t v5 = v39;
              goto LABEL_58;
            }
          }
LABEL_24:
          uint64_t v15 = (void *)[v7 copy];
          unsigned int v16 = [v7 characterAtIndex:3];
          if (v16 > 0x37) {
            goto LABEL_57;
          }
          unsigned int v17 = v16;
          if (((1 << v16) & 0x81000100000000) == 0) {
            goto LABEL_57;
          }
          if ((unint64_t)[v15 length] >= 0xC
            && [v15 rangeOfString:@" "] == 5)
          {
            if ((unint64_t)[v15 length] >= 0xD)
            {
              uint64_t v18 = [v15 substringToIndex:12];

              uint64_t v15 = (void *)v18;
            }
            long long v19 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
            unint64_t v20 = [v19 length];

            BOOL v21 = v20 >= 0xA;
            goto LABEL_49;
          }
          if ((unint64_t)[v15 length] <= 0xD)
          {
            unsigned int v22 = [v15 characterAtIndex:5];
            if (v22 <= 0x39 && ((1 << v22) & 0x228000000000000) != 0)
            {
              uint64_t v23 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 5, 1, @" ");

              uint64_t v15 = (void *)v23;
            }
            long long v24 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
            unint64_t v25 = [v24 length];

            BOOL v26 = v25 > 9;
            id v2 = v38;
            if (!v26) {
              goto LABEL_57;
            }
LABEL_51:
            if (v17 == 55 || v17 == 48)
            {
              uint64_t v32 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 3, 1, @" ");

              uint64_t v15 = (void *)v32;
            }
            uint64_t v33 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
            unint64_t v34 = [v33 length];

            if (v34 >= 0xA && ([v37 containsObject:v15] & 1) == 0)
            {
              float v35 = (void *)[NSString _newZStringWithString:v15];
              [v37 addObject:v35];
            }
LABEL_57:

            uint64_t v5 = v39;
            goto LABEL_58;
          }
          if ((unint64_t)[v15 length] < 0xE) {
            goto LABEL_57;
          }
          int v27 = [v15 characterAtIndex:10];
          if (v27 <= 50)
          {
            if (v27 != 32)
            {
              if (v27 != 48) {
                goto LABEL_57;
              }
LABEL_45:
              uint64_t v28 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 10, 1, @" ");

              uint64_t v15 = (void *)v28;
            }
            if ((unint64_t)[v15 length] >= 0xF)
            {
              uint64_t v29 = [v15 substringToIndex:14];

              uint64_t v15 = (void *)v29;
            }
            uint64_t v30 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C7BF850];
            unint64_t v31 = [v30 length];

            BOOL v21 = v31 >= 0xC;
LABEL_49:
            id v2 = v38;
            if (v21) {
              goto LABEL_51;
            }
            goto LABEL_57;
          }
          if (v27 != 55 && v27 != 51) {
            goto LABEL_57;
          }
          goto LABEL_45;
        }
LABEL_58:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v4);
  }

  return v37;
}

void sortOverlappingCALayers(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v172 = a1;
  id v171 = a2;
  id v9 = 0;
  BOOL v10 = 0;
  uint64_t v11 = 2 * [v172 count];
  double v12 = a4 + a6;
  do
  {
    uint64_t v177 = v11;
    unint64_t v13 = v10;
    long long v14 = v9;
    *(void *)&v181.size.height = v9;
    v182 = v10;
    sortLayersWithYCoordinate(v172, v171, &v182, (void **)&v181.size.height);
    BOOL v10 = v182;

    id v9 = *(id *)&v181.size.height;
    uint64_t v15 = [v10 lastObject];
    [v15 frame];
    double v17 = v16;
    [v15 frame];
    double v19 = v12 - (v17 + v18);
    if (v19 < 0.0)
    {
      [v15 position];
      double v21 = v20;
      [v15 position];
      objc_msgSend(v15, "setPosition:", v21, v19 + v22);
    }
    CFNumberRef v179 = v15;
    int v23 = [v10 count];
    if (v23 < 2)
    {
LABEL_20:

      break;
    }
    uint64_t v24 = v23;
    while (1)
    {
      unint64_t v25 = [v10 objectAtIndex:v24 - 2];
      BOOL v26 = [v10 objectAtIndex:v24 - 1];
      int v27 = [v9 objectAtIndex:v24 - 2];
      unint64_t v28 = [v27 unsignedIntegerValue];

      uint64_t v29 = [v9 objectAtIndex:v24 - 1];
      unint64_t v30 = [v29 unsignedIntegerValue];

      *(void *)&v181.origin.double x = v25;
      [v25 frame];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      [v26 frame];
      v190.origin.double x = v39;
      v190.origin.double y = v40;
      v190.size.vImagePixelCount width = v41;
      v190.size.height = v42;
      v184.origin.double x = v32;
      v184.origin.double y = v34;
      v184.size.vImagePixelCount width = v36;
      v184.size.height = v38;
      CGRect v185 = CGRectIntersection(v184, v190);
      *(float *)&v185.origin.double x = v185.size.height;
      int v43 = vcvtps_s32_f32(*(float *)&v185.origin.x);
      if (v43 >= 1) {
        break;
      }
LABEL_15:

      BOOL v54 = v24-- <= 2;
      if (v54) {
        goto LABEL_20;
      }
    }
    if (v28 < v30)
    {
      if ([v10 count] > (unint64_t)(v24 - 1))
      {
        double v44 = (double)v43;
        unint64_t v45 = v24;
        while (1)
        {
          uint64_t v46 = [v10 objectAtIndex:v45 - 1];
          id v47 = [v9 objectAtIndex:v45 - 1];
          unint64_t v48 = [v47 unsignedIntegerValue];

          if ([v10 count] > v45)
          {
            uint64_t v49 = [v9 objectAtIndex:v45];
            unint64_t v50 = [v49 unsignedIntegerValue];

            if (v50 < v48) {
              break;
            }
          }
          [v46 position];
          double v52 = v51;
          [v46 position];
          objc_msgSend(v46, "setPosition:", v52, v53 + v44);

          BOOL v54 = [v10 count] > v45++;
          if (!v54) {
            goto LABEL_15;
          }
        }
      }
      goto LABEL_15;
    }
    [*(id *)&v181.origin.x position];
    double v56 = v55;
    [*(id *)&v181.origin.x position];
    objc_msgSend(*(id *)&v181.origin.x, "setPosition:", v56, v57 - (double)v43);

    uint64_t v11 = v177 - 1;
  }
  while (v177 != 1);
  NSUInteger v58 = [v10 firstObject];
  [v58 frame];
  float v60 = a4 - v59;
  int v61 = vcvtps_s32_f32(v60);
  if (v61 >= 1)
  {
    [v58 position];
    double v63 = v62;
    [v58 position];
    objc_msgSend(v58, "setPosition:", v63, v64 + (double)v61);
  }
  if ((unint64_t)[v10 count] >= 2)
  {
    for (unint64_t i = 1; [v10 count] > i; ++i)
    {
      uint64_t v66 = [v10 objectAtIndex:i - 1];
      uint64_t v67 = [v10 objectAtIndex:i];
      uint64_t v68 = [v9 objectAtIndex:i - 1];
      unint64_t v69 = [v68 unsignedIntegerValue];

      uint64_t v70 = [v9 objectAtIndex:i];
      unint64_t v71 = [v70 unsignedIntegerValue];

      [v66 frame];
      CGFloat v73 = v72;
      CGFloat v75 = v74;
      CGFloat v77 = v76;
      CGFloat v79 = v78;
      [v67 frame];
      v191.origin.double x = v80;
      v191.origin.double y = v81;
      v191.size.vImagePixelCount width = v82;
      v191.size.height = v83;
      v186.origin.double x = v73;
      v186.origin.double y = v75;
      v186.size.vImagePixelCount width = v77;
      v186.size.height = v79;
      CGRect v187 = CGRectIntersection(v186, v191);
      *(float *)&v187.origin.double x = v187.size.height;
      int v84 = vcvtps_s32_f32(*(float *)&v187.origin.x);
      if (v84 >= 1)
      {
        if (v71 < v69)
        {

          break;
        }
        [v67 position];
        double v86 = v85;
        [v67 position];
        objc_msgSend(v67, "setPosition:", v86, v87 + (double)v84);
      }
    }
  }
  *(void *)&v181.origin.double y = v9;
  *(void *)&v181.size.vImagePixelCount width = v10;
  sortLayersWithYCoordinate(v172, v171, (void **)&v181.size, (void **)&v181.origin.y);
  id v88 = *(id *)&v181.size.width;

  id v89 = *(id *)&v181.origin.y;
  CFNumberRef v178 = [MEMORY[0x263EFF9A0] dictionary];
  CFDictionaryRef v180 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v174 = v89;
  if ([v88 count])
  {
    unint64_t v90 = 0;
    double v173 = a6 + 1.79769313e308 - a4;
    do
    {
      CGFloat v91 = -1.79769313e308;
      CGFloat v92 = INFINITY;
      CGFloat v93 = -1.79769313e308;
      double v94 = 1.79769313e308 - a4;
      if (v90)
      {
        id v95 = [v88 objectAtIndex:(v90 - 1)];
        [v95 frame];
        CGFloat v93 = v96;
        CGFloat v91 = v97;
        CGFloat v92 = v98;
        double v94 = v99;
      }
      uint64_t v100 = [v88 objectAtIndex:v90];
      if ([v88 count] - 1 <= v90)
      {
        v181.origin.double x = -1.79769313e308;
        CGFloat rect2 = INFINITY;
        CGFloat v107 = v173;
        CGFloat v104 = v12;
        if (v90)
        {
LABEL_37:
          v108 = [v89 objectAtIndex:(v90 - 1)];
          unint64_t v109 = [v108 unsignedIntegerValue];

          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v101 = [v88 objectAtIndex:v90 + 1];
        [v101 frame];
        v181.origin.double x = v102;
        CGFloat v104 = v103;
        CGFloat rect2 = v105;
        CGFloat v107 = v106;

        if (v90) {
          goto LABEL_37;
        }
      }
      unint64_t v109 = -1;
LABEL_40:
      uint64_t v110 = [v89 objectAtIndex:v90];
      unint64_t v111 = [v110 unsignedIntegerValue];

      if ([v89 count] - 1 <= v90)
      {
        unint64_t v113 = -1;
      }
      else
      {
        long long v112 = [v89 objectAtIndex:v90 + 1];
        unint64_t v113 = [v112 unsignedIntegerValue];
      }
      if (v109 == -1 || v111 > v109)
      {
        [v100 frame];
        v192.origin.double x = v93;
        v192.origin.double y = v91;
        v192.size.vImagePixelCount width = v92;
        v192.size.height = v94;
        if (CGRectIntersectsRect(v188, v192)) {
          goto LABEL_49;
        }
      }
      if (v113 == -1 || v111 >= v113)
      {
        [v100 frame];
        v193.origin.double x = v181.origin.x;
        v193.origin.double y = v104;
        v193.size.vImagePixelCount width = rect2;
        v193.size.height = v107;
        if (CGRectIntersectsRect(v189, v193))
        {
LABEL_49:
          long long v114 = [NSNumber numberWithUnsignedInteger:v111];
          long long v115 = [v178 objectForKey:v114];

          if (!v115)
          {
            long long v115 = [MEMORY[0x263EFF980] array];
            long long v116 = [NSNumber numberWithUnsignedInteger:v111];
            [v178 setObject:v115 forKey:v116];
          }
          [v115 addObject:v100];
        }
      }
      long long v117 = [NSNumber numberWithUnsignedInteger:v111];
      long long v118 = [v180 objectForKey:v117];

      if (!v118)
      {
        long long v118 = [MEMORY[0x263EFF980] array];
        long long v119 = [NSNumber numberWithUnsignedInteger:v111];
        [v180 setObject:v118 forKey:v119];
      }
      [v118 addObject:v100];

      ++v90;
      id v89 = v174;
    }
    while ([v88 count] > v90);
  }
  long long v120 = [v178 allKeys];
  long long v121 = [v120 sortedArrayUsingComparator:&__block_literal_global_1];

  long long v122 = [v180 allKeys];
  id v123 = [v122 sortedArrayUsingComparator:&__block_literal_global_504];

  id v124 = [MEMORY[0x263EFF980] array];
  uint64_t v169 = v88;
  v170 = v58;
  if ([v121 count])
  {
    CGFloat v125 = 0.0;
    LODWORD(v126) = 0;
    id v127 = v180;
    rect2a = v121;
    do
    {
      v181.origin.double x = v125;
      id v128 = objc_msgSend(v121, "objectAtIndex:", *(void *)&v125, v169, v170);
      unint64_t v129 = [v128 unsignedIntegerValue];

      if ([v123 count] > (unint64_t)(int)v126)
      {
        unint64_t v126 = (int)v126;
        while (1)
        {
          id v130 = [v123 objectAtIndex:v126];
          unint64_t v131 = [v130 unsignedIntegerValue];

          if (v129 < v131) {
            break;
          }
          BOOL v132 = [v123 objectAtIndex:v126];
          uint64_t v133 = [v127 objectForKey:v132];
          uint64_t v134 = [v124 arrayByAddingObjectsFromArray:v133];

          ++v126;
          id v124 = (void *)v134;
          if ([v123 count] <= v126) {
            goto LABEL_63;
          }
        }
        uint64_t v134 = (uint64_t)v124;
LABEL_63:
        id v124 = (void *)v134;
        long long v121 = rect2a;
      }
      NSRange v135 = [v121 objectAtIndex:*(void *)&v181.origin.x];
      NSRange v136 = [v178 objectForKey:v135];

      if ([v136 count])
      {
        unint64_t v137 = 0;
        do
        {
          NSRange v138 = [v124 sortedArrayUsingComparator:&__block_literal_global_507];
          NSRange v139 = [v136 objectAtIndex:v137];
          double v140 = a4;
          if ([v138 count])
          {
            uint64_t v141 = 0;
            double v140 = a4;
            while (1)
            {
              float v142 = [v138 objectAtIndex:v141];
              [v142 frame];
              double v144 = v143;
              double v145 = v143 - v140;
              [v139 frame];
              if (v145 >= v146) {
                break;
              }
              [v142 frame];
              double v140 = v140 + v147;

              if ([v138 count] <= (unint64_t)++v141) {
                goto LABEL_70;
              }
            }
            [v139 frame];
            double v161 = vabdd_f64(v160, v140);
            [v139 frame];
            double v163 = vabdd_f64(v162, v144);
            [v139 frame];
            double v165 = v164;
            [v139 frame];
            if (v161 >= v163)
            {
              double v140 = v144 - v167;
              [v139 frame];
            }
            double v168 = v166;
            [v139 frame];
            objc_msgSend(v139, "setFrame:", v165, v140, v168);
          }
          else
          {
LABEL_70:
            [v139 frame];
            if (v12 - v140 >= v148)
            {
              [v139 frame];
              double v150 = v149;
              [v139 frame];
              double v152 = vabdd_f64(v150 + v151, v140);
              [v139 frame];
              double v154 = vabdd_f64(v153, v12);
              [v139 frame];
              double v156 = v155;
              [v139 frame];
              if (v152 >= v154)
              {
                double v140 = v12 - v158;
                [v139 frame];
              }
              double v159 = v157;
              [v139 frame];
              objc_msgSend(v139, "setFrame:", v156, v140, v159);
            }
          }

          ++v137;
        }
        while ([v136 count] > v137);
      }

      *(void *)&CGFloat v125 = *(void *)&v181.origin.x + 1;
      long long v121 = rect2a;
      id v127 = v180;
    }
    while ([rect2a count] > (unint64_t)(*(void *)&v181.origin.x + 1));
  }
  else
  {
    id v127 = v180;
  }
}

void sortLayersWithYCoordinate(void *a1, void *a2, void **a3, void **a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  if ([v7 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10];
      [v9 addObject:v11];

      ++v10;
    }
    while (v10 < [v7 count]);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __sortLayersWithYCoordinate_block_invoke;
  v21[3] = &unk_26429E4C8;
  id v12 = v7;
  id v22 = v12;
  unint64_t v13 = [v9 sortedArrayUsingComparator:v21];
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v13 count])
  {
    unint64_t v14 = 0;
    do
    {
      uint64_t v15 = *a3;
      double v16 = [v13 objectAtIndexedSubscript:v14];
      double v17 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
      [v15 addObject:v17];

      double v18 = *a4;
      double v19 = [v13 objectAtIndexedSubscript:v14];
      double v20 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v19, "unsignedIntegerValue"));
      [v18 addObject:v20];

      ++v14;
    }
    while (v14 < [v13 count]);
  }
}

uint64_t __sortOverlappingCALayers_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __sortOverlappingCALayers_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __sortOverlappingCALayers_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 frame];
  double v7 = v6;
  [v5 frame];
  if (v7 >= v8)
  {
    [v4 frame];
    double v11 = v10;
    [v5 frame];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void keepAllLayersWithinHorizontalBounds(void *a1, double a2, double a3, double a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    double v10 = a2 + a4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v12 frame];
        if (v14 < a4)
        {
          [v12 frame];
          double v16 = v15;
          [v12 frame];
          double v18 = v17;
          [v12 frame];
          BOOL v20 = v16 < a2;
          double v21 = a2;
          if (!v20)
          {
            double v13 = v18 + v19;
            if (v18 + v19 <= v10) {
              continue;
            }
            objc_msgSend(v12, "frame", v13);
            double v21 = v10 - v22;
          }
          [v12 position];
          [v12 setPosition:v21];
        }
      }
      uint64_t v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v13);
    }
    while (v8);
  }
}

Float64 secondsBetweenTimestamps(CMTime *a1, CMTime *a2)
{
  CMTime lhs = *a1;
  CMTime v3 = *a2;
  CMTimeSubtract(&time, &lhs, &v3);
  return CMTimeGetSeconds(&time);
}

id stringByTransliteratingNameToPinyin(void *a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v3 = qword_267B9C538;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&qword_267B9C538, &__block_literal_global_510);
  }
  id v6 = [v5 uppercaseString];

  uint64_t v7 = [v4 uppercaseString];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = (id)qword_267B9C520;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        if ([(__CFString *)v7 containsString:v13])
        {
          double v14 = [(id)_MergedGlobals_6 objectForKeyedSubscript:v13];
          double v15 = [v14 lowercaseString];
          uint64_t v16 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:v13 withString:v15];

          uint64_t v7 = (__CFString *)v16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v10);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v17 = (id)qword_267B9C530;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        if (-[__CFString containsString:](v6, "containsString:", v22, (void)v49))
        {
          long long v23 = [(id)qword_267B9C528 objectForKeyedSubscript:v22];
          long long v24 = [v23 lowercaseString];
          uint64_t v25 = [(__CFString *)v6 stringByReplacingOccurrencesOfString:v22 withString:v24];

          id v6 = (__CFString *)v25;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v19);
  }

  long long v26 = [MEMORY[0x263F089D8] string];
  CFLocaleRef v27 = CFLocaleCreate(0, @"zh-Hans");
  v61.location = 0;
  v61.length = 0;
  uint64_t v28 = CFStringTokenizerCreate(0, &stru_26C7BF850, v61, 0, v27);
  CFRelease(v27);
  v62.length = [(__CFString *)v7 length];
  v62.location = 0;
  CFStringTokenizerSetString(v28, v7, v62);
  while (CFStringTokenizerAdvanceToNextToken(v28))
  {
    CFStringRef v29 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v28, 0x10000uLL);
    if (v29)
    {
      CFStringRef v30 = v29;
      if (CFStringGetLength(v29) >= 1)
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v28);
        if (CurrentTokenRange.location != -1)
        {
          CGFloat v32 = -[__CFString substringWithRange:](v7, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
          CFIndex v33 = CurrentTokenRange.location - 1;
          BOOL v34 = CurrentTokenRange.location >= 1 && [(__CFString *)v7 characterAtIndex:v33] == 32;
          if (objc_msgSend(v32, "isCaseApplicable", v33, (void)v49)) {
            char v35 = [v32 isLowercase];
          }
          else {
            char v35 = 0;
          }
          int v36 = 0;
          if (![v32 caseInsensitiveCompare:v30] && (v35 & 1) == 0) {
            int v36 = [v32 isCaseApplicable];
          }
          if ((v34 | v36) == 1
            && [(__CFString *)v26 length]
            && [(__CFString *)v26 characterAtIndex:[(__CFString *)v26 length] - 1] != 32)
          {
            CFStringAppend(v26, @" ");
          }
          CFStringAppend(v26, v30);
          if (v36) {
            CFStringAppend(v26, @" ");
          }
        }
      }
      CFRelease(v30);
    }
  }
  if ([(__CFString *)v26 length]
    && [(__CFString *)v26 characterAtIndex:[(__CFString *)v26 length] - 1] != 32)
  {
    CFStringAppend(v26, @" ");
  }
  v63.length = [(__CFString *)v6 length];
  v63.location = 0;
  CFStringTokenizerSetString(v28, v6, v63);
  while (CFStringTokenizerAdvanceToNextToken(v28))
  {
    CFStringRef v37 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v28, 0x10000uLL);
    if (v37)
    {
      CFStringRef v38 = v37;
      if (CFStringGetLength(v37) >= 1)
      {
        CFRange v39 = CFStringTokenizerGetCurrentTokenRange(v28);
        if (v39.location != -1)
        {
          CGFloat v40 = -[__CFString substringWithRange:](v6, "substringWithRange:", v39.location, v39.length);
          CFIndex v41 = v39.location - 1;
          BOOL v42 = v39.location >= 1 && [(__CFString *)v6 characterAtIndex:v41] == 32;
          if (objc_msgSend(v40, "isCaseApplicable", v41)) {
            char v43 = [v40 isLowercase];
          }
          else {
            char v43 = 0;
          }
          int v44 = 0;
          if (![v40 caseInsensitiveCompare:v38] && (v43 & 1) == 0) {
            int v44 = [v40 isCaseApplicable];
          }
          if ((v42 | v44) == 1
            && [(__CFString *)v26 length]
            && [(__CFString *)v26 characterAtIndex:[(__CFString *)v26 length] - 1] != 32)
          {
            CFStringAppend(v26, @" ");
          }
          CFStringAppend(v26, v38);
          if (v44) {
            CFStringAppend(v26, @" ");
          }
        }
      }
      CFRelease(v38);
    }
  }
  CFStringTransform(v26, 0, (CFStringRef)*MEMORY[0x263EFFF48], 0);
  CFRelease(v28);
  unint64_t v45 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v46 = [(__CFString *)v26 stringByTrimmingCharactersInSet:v45];
  id v47 = [v46 lowercaseString];

  return v47;
}

void __stringByTransliteratingNameToPinyin_block_invoke()
{
  uint64_t v0 = getZhHansLN();
  id v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;

  uint64_t v2 = getZhHansFN();
  uint64_t v3 = (void *)qword_267B9C528;
  qword_267B9C528 = v2;

  id v4 = [(id)_MergedGlobals_6 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_513];
  id v6 = (void *)qword_267B9C520;
  qword_267B9C520 = v5;

  id v9 = [(id)qword_267B9C528 allKeys];
  uint64_t v7 = [v9 sortedArrayUsingComparator:&__block_literal_global_515];
  id v8 = (void *)qword_267B9C530;
  qword_267B9C530 = v7;
}

uint64_t __stringByTransliteratingNameToPinyin_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "length"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 length];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v9 compare:v6];

  return v10;
}

uint64_t __stringByTransliteratingNameToPinyin_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "length"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 length];

  id v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v9 compare:v6];

  return v10;
}

uint64_t bestMatchInStringCandidates(void *a1, void *a2, void *a3, int a4)
{
  CGFloat v32 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a1;
  id v7 = a2;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v8)
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0x7FFFFFFFLL;
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_13;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v41;
  uint64_t v12 = 0x7FFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v6);
      }
      double v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      uint64_t v15 = objc_msgSend(v14, "editDistanceFromString:threshold:", v7, 4, v32);
      if (v15 < v12)
      {
        uint64_t v16 = v15;
        id v17 = v14;

        uint64_t v10 = v17;
        uint64_t v12 = v16;
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v9);
  if (a4)
  {
LABEL_13:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v6;
    uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      uint64_t v33 = *(void *)v37;
      do
      {
        uint64_t v21 = 0;
        uint64_t v34 = v19;
        do
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v21), "componentsSeparatedByString:", @" ", v32);
          if ((unint64_t)[v22 count] >= 2)
          {
            id v23 = v6;
            long long v24 = objc_msgSend(v22, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);
            uint64_t v25 = [v22 firstObject];
            long long v26 = [v24 arrayByAddingObject:v25];

            CFLocaleRef v27 = [v26 componentsJoinedByString:@" "];
            uint64_t v28 = [v27 editDistanceFromString:v7 threshold:4];
            if (v28 < v12)
            {
              uint64_t v29 = v28;
              id v30 = v27;

              uint64_t v10 = v30;
              uint64_t v12 = v29;
            }
            uint64_t v19 = v34;

            id v6 = v23;
            uint64_t v20 = v33;
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v19);
    }
  }
LABEL_25:
  if (v32) {
    *CGFloat v32 = v10;
  }

  return v12;
}

id stringCandidatesByTransliteratingNameToRomaji(void *a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1 uppercaseString];
  id v5 = [v3 uppercaseString];

  id v6 = [MEMORY[0x263F089D8] string];
  CFLocaleRef v7 = CFLocaleCreate(0, @"ja");
  v105.locatiouint64_t n = 0;
  v105.length = 0;
  uint64_t v8 = CFStringTokenizerCreate(0, 0, v105, 0, v7);
  CFRelease(v7);
  v106.length = [(__CFString *)v5 length];
  v106.locatiouint64_t n = 0;
  CFStringTokenizerSetString(v8, v5, v106);
  while (CFStringTokenizerAdvanceToNextToken(v8))
  {
    CFStringRef v9 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v8, 0x1000000uLL);
    if (v9)
    {
      CFStringRef v10 = v9;
      if (CFStringGetLength(v9) >= 1) {
        CFStringAppend(v6, v10);
      }
      CFRelease(v10);
    }
  }
  if ([(__CFString *)v6 length]
    && [(__CFString *)v6 characterAtIndex:[(__CFString *)v6 length] - 1] != 32)
  {
    CFStringAppend(v6, @" ");
  }
  v107.length = [(__CFString *)v4 length];
  v107.locatiouint64_t n = 0;
  CFStringTokenizerSetString(v8, v4, v107);
  while (CFStringTokenizerAdvanceToNextToken(v8))
  {
    CFStringRef v11 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v8, 0x1000000uLL);
    if (v11)
    {
      CFStringRef v12 = v11;
      if (CFStringGetLength(v11) >= 1) {
        CFStringAppend(v6, v12);
      }
      CFRelease(v12);
    }
  }
  CFRelease(v8);
  uint64_t v13 = v6;
  uint64_t v70 = v5;
  unint64_t v71 = v4;
  if (qword_267B9C560 != -1) {
    dispatch_once(&qword_267B9C560, &__block_literal_global_542);
  }
  unint64_t v69 = v13;
  double v14 = (void *)[(__CFString *)v13 mutableCopy];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v15 = (id)qword_267B9C558;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v93 objects:v102 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v94 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v21 = [(id)qword_267B9C550 objectForKey:v20];
        objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, objc_msgSend(v14, "length"));
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v93 objects:v102 count:16];
    }
    while (v17);
  }

  uint64_t v22 = (void *)MEMORY[0x263EFF9C0];
  id v23 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  long long v24 = [v14 stringByTrimmingCharactersInSet:v23];
  uint64_t v25 = [v22 setWithObject:v24];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v26 = [v25 allObjects];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v89 objects:v101 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v90 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        CGFloat v32 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"っ(.)" options:1 error:0];
        uint64_t v33 = objc_msgSend(v32, "stringByReplacingMatchesInString:options:range:withTemplate:", v31, 0, 0, objc_msgSend(v31, "length"), @"$1$1");
        [v25 addObject:v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v89 objects:v101 count:16];
    }
    while (v28);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v34 = [v25 allObjects];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v85 objects:v100 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v86 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = *(void **)(*((void *)&v85 + 1) + 8 * k);
        long long v40 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"っ$" options:1 error:0];
        long long v41 = objc_msgSend(v40, "stringByReplacingMatchesInString:options:range:withTemplate:", v39, 0, 0, objc_msgSend(v39, "length"), &stru_26C7BF850);
        [v25 addObject:v41];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v85 objects:v100 count:16];
    }
    while (v36);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v42 = [v25 allObjects];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v81 objects:v99 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v82;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v82 != v45) {
          objc_enumerationMutation(v42);
        }
        id v47 = *(void **)(*((void *)&v81 + 1) + 8 * m);
        unint64_t v48 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"n(b|p)([aiueo])" options:1 error:0];
        long long v49 = objc_msgSend(v48, "stringByReplacingMatchesInString:options:range:withTemplate:", v47, 0, 0, objc_msgSend(v47, "length"), @"m$1$2");
        [v25 addObject:v49];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v81 objects:v99 count:16];
    }
    while (v44);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v50 = [v25 allObjects];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v98 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v78;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v78 != v53) {
          objc_enumerationMutation(v50);
        }
        long long v55 = *(void **)(*((void *)&v77 + 1) + 8 * n);
        long long v56 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([aiue])\\1" options:1 error:0];
        double v57 = objc_msgSend(v56, "stringByReplacingMatchesInString:options:range:withTemplate:", v55, 0, 0, objc_msgSend(v55, "length"), @"$1");
        [v25 addObject:v57];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v77 objects:v98 count:16];
    }
    while (v52);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = [v25 allObjects];
  uint64_t v58 = [obj countByEnumeratingWithState:&v73 objects:v97 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v74;
    do
    {
      for (iuint64_t i = 0; ii != v59; ++ii)
      {
        if (*(void *)v74 != v60) {
          objc_enumerationMutation(obj);
        }
        CFRange v62 = *(void **)(*((void *)&v73 + 1) + 8 * ii);
        CFRange v63 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(o)(o|u)" options:1 error:0];
        double v64 = objc_msgSend(v63, "stringByReplacingMatchesInString:options:range:withTemplate:", v62, 0, 0, objc_msgSend(v62, "length"), @"$1");
        [v25 addObject:v64];
        unint64_t v65 = objc_msgSend(v63, "stringByReplacingMatchesInString:options:range:withTemplate:", v62, 0, 0, objc_msgSend(v62, "length"), @"$1h");
        [v25 addObject:v65];
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v73 objects:v97 count:16];
    }
    while (v59);
  }

  uint64_t v66 = [v25 valueForKey:@"uppercaseString"];
  uint64_t v67 = [v66 allObjects];

  return v67;
}

BOOL stringContainsApproximateSubstring(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = a1;
  unint64_t v6 = [v3 editDistance:v5 string:v4] - 4;
  uint64_t v7 = [v5 length];

  uint64_t v8 = [v4 length];
  return v6 < v7 - v8;
}

id createCachedContact(void *a1)
{
  id v1 = a1;
  if (objc_opt_class())
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v3 = [MEMORY[0x263F08708] controlCharacterSet];
    id v4 = [v1 givenName];
    id v5 = [v4 uppercaseString];
    uint64_t v6 = [v5 stringByTrimmingCharactersInSet:v3];

    if (v6) {
      [v2 setObject:v6 forKey:*MEMORY[0x263EFDFC8]];
    }
    uint64_t v7 = [v1 nickname];
    uint64_t v8 = [v7 uppercaseString];
    uint64_t v9 = [v8 stringByTrimmingCharactersInSet:v3];

    if (v9) {
      [v2 setObject:v9 forKey:*MEMORY[0x263EFE050]];
    }
    CFStringRef v10 = [v1 familyName];
    CFStringRef v11 = [v10 uppercaseString];
    uint64_t v12 = [v11 stringByTrimmingCharactersInSet:v3];

    if (v12) {
      [v2 setObject:v12 forKey:*MEMORY[0x263EFDFB8]];
    }
    uint64_t v13 = [v1 middleName];
    double v14 = [v13 uppercaseString];
    uint64_t v15 = [v14 stringByTrimmingCharactersInSet:v3];

    if (v15) {
      [v2 setObject:v15 forKey:*MEMORY[0x263EFE038]];
    }
    uint64_t v16 = [v1 phoneticGivenName];
    uint64_t v17 = [v16 uppercaseString];
    uint64_t v18 = [v17 stringByTrimmingCharactersInSet:v3];

    if (v18) {
      [v2 setObject:v18 forKey:*MEMORY[0x263EFE088]];
    }
    CFRange v61 = (void *)v18;
    CFRange v62 = (void *)v15;
    CFRange v63 = (void *)v12;
    double v64 = (void *)v9;
    unint64_t v65 = (void *)v6;
    uint64_t v19 = [v1 phoneticFamilyName];
    uint64_t v20 = [v19 uppercaseString];
    uint64_t v66 = (void *)v3;
    uint64_t v21 = [v20 stringByTrimmingCharactersInSet:v3];

    if (v21) {
      [v2 setObject:v21 forKey:*MEMORY[0x263EFE080]];
    }
    uint64_t v60 = (void *)v21;
    uint64_t v22 = (void *)MEMORY[0x263F08708];
    id v23 = v1;
    long long v24 = [v22 controlCharacterSet];
    uint64_t v25 = [v23 givenName];
    long long v26 = [v25 uppercaseString];

    uint64_t v27 = [v23 familyName];

    uint64_t v28 = [v27 uppercaseString];

    uint64_t v29 = [v26 stringByTrimmingCharactersInSet:v24];

    id v30 = [v28 stringByTrimmingCharactersInSet:v24];

    double v31 = [v29 stringByAppendingString:v30];
    CGFloat v32 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[^ -~]" options:1 error:0];
    if (objc_msgSend(v32, "numberOfMatchesInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length")))
    {
      uint64_t v33 = stringByTransliteratingNameToPinyin(v29, v30);
      uint64_t v34 = [v33 uppercaseString];

      uint64_t v35 = (void *)v34;
    }
    else
    {
      uint64_t v35 = 0;
    }

    if (v35) {
      [v2 setObject:v35 forKey:@"pinyinName"];
    }
    uint64_t v59 = v35;
    uint64_t v67 = v2;
    uint64_t v37 = (void *)MEMORY[0x263F08708];
    id v38 = v23;
    long long v39 = [v37 controlCharacterSet];
    long long v40 = [v38 givenName];
    long long v41 = [v40 uppercaseString];

    long long v42 = [v38 familyName];
    uint64_t v43 = [v42 uppercaseString];

    uint64_t v44 = [v38 phoneticGivenName];
    uint64_t v45 = [v44 uppercaseString];

    uint64_t v46 = [v38 phoneticFamilyName];

    id v47 = [v46 uppercaseString];

    unint64_t v48 = [v41 stringByTrimmingCharactersInSet:v39];

    long long v49 = [v43 stringByTrimmingCharactersInSet:v39];

    long long v50 = [v45 stringByTrimmingCharactersInSet:v39];

    uint64_t v51 = [v47 stringByTrimmingCharactersInSet:v39];

    uint64_t v52 = [v48 stringByAppendingString:@" "];
    uint64_t v53 = [v52 stringByAppendingString:v49];

    long long v54 = [v50 stringByAppendingString:@" "];
    long long v55 = [v54 stringByAppendingString:v51];

    long long v56 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[^ -~]" options:1 error:0];
    if (!v55
      || ![v55 length]
      || !objc_msgSend(v56, "numberOfMatchesInString:options:range:", v55, 0, 0, objc_msgSend(v55, "length"))
      || (stringCandidatesByTransliteratingNameToRomaji(v50, v51),
          (double v57 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (objc_msgSend(v56, "numberOfMatchesInString:options:range:", v53, 0, 0, objc_msgSend(v53, "length", v1, v59, v60)))
      {
        double v57 = stringCandidatesByTransliteratingNameToRomaji(v48, v49);
      }
      else
      {
        double v57 = 0;
      }
    }

    uint64_t v36 = v67;
    if (v57) {
      [v67 setObject:v57 forKey:@"romanjiName"];
    }
  }
  else
  {
    uint64_t v36 = 0;
  }

  return v36;
}

id deviceModel()
{
  if (qword_267B9C540 != -1) {
    dispatch_once(&qword_267B9C540, &__block_literal_global_540);
  }
  uint64_t v0 = (void *)qword_267B9C548;
  return v0;
}

void __deviceModel_block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  memset(&v2, 0, 512);
  uname(&v2);
  uint64_t v0 = [NSString stringWithCString:v2.machine encoding:4];
  id v1 = (void *)qword_267B9C548;
  qword_267B9C548 = v0;
}

uint64_t __sortLayersWithYCoordinate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  [v7 frame];
  double v9 = v8;

  CFStringRef v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v6 unsignedIntegerValue];

  uint64_t v12 = [v10 objectAtIndexedSubscript:v11];
  [v12 frame];
  double v14 = v13;

  if (v9 < v14) {
    return -1;
  }
  else {
    return v9 > v14;
  }
}

void __romajiFromKana_block_invoke()
{
  uint64_t v0 = getJPHepburn();
  id v1 = (void *)qword_267B9C550;
  qword_267B9C550 = v0;

  id v4 = [(id)qword_267B9C550 allKeys];
  uint64_t v2 = [v4 sortedArrayUsingComparator:&__block_literal_global_545];
  uint64_t v3 = (void *)qword_267B9C558;
  qword_267B9C558 = v2;
}

uint64_t __romajiFromKana_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    unint64_t v8 = [v4 length];
    uint64_t v7 = v8 < [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

size_t NetworkParameters::initializeFromBinaryFile(NetworkParameters *this, __sFILE *__stream)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  fread((char *)this + 116, 4uLL, 1uLL, __stream);
  fread((char *)this + 112, 4uLL, 1uLL, __stream);
  int __ptr = 0;
  size_t result = fread(&__ptr, 4uLL, 1uLL, __stream);
  if (__ptr >= 1)
  {
    int v6 = 0;
    fread(&v6, 4uLL, 1uLL, __stream);
    size_t v5 = v6;
    fread(__s1, 1uLL, v6 + 1, __stream);
    if (strncmp(__s1, "conv", v5))
    {
      if (strncmp(__s1, "pool", v5))
      {
        if (!strncmp(__s1, "hidden", v5)) {
          operator new();
        }
        exit(1);
      }
      operator new();
    }
    operator new();
  }
  return result;
}

void sub_217778414(_Unwind_Exception *a1)
{
  MEMORY[0x21D44B400](v1, 0x1093C40DBFFDDC9);
  _Unwind_Resume(a1);
}

void LayerParameters::LayerParameters(LayerParameters *this)
{
  *(void *)this = &unk_26C7B1908;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 4, "Layer");
  *((_DWORD *)this + 14) = 1045220557;
  *((unsigned char *)this + 60) = 0;
}

void sub_2177784C4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CNNLayerParameters::getKernelSize(CNNLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t CNNLayerParameters::putKernelSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t CNNLayerParameters::getNumOutputs(CNNLayerParameters *this)
{
  return 0;
}

uint64_t CNNLayerParameters::getFirstHiddenLayerFlag(CNNLayerParameters *this)
{
  return 0;
}

size_t CNNLayerParameters::writeBinaryLayerParameters(CNNLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  fwrite((char *)this + 64, 4uLL, 1uLL, a2);
  fwrite((char *)this + 68, 4uLL, 1uLL, a2);
  return fwrite((char *)this + 72, 4uLL, 1uLL, a2);
}

size_t CNNLayerParameters::readBinaryLayerParamenters(CNNLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  fread((char *)this + 64, 4uLL, 1uLL, a2);
  fread((char *)this + 68, 4uLL, 1uLL, a2);
  return fread((char *)this + 72, 4uLL, 1uLL, a2);
}

void CNNLayerParameters::~CNNLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x21D44B400);
}

size_t LayerParameters::writeBinaryLayerParameters(LayerParameters *this, __sFILE *__stream)
{
  if (*((char *)this + 31) < 0) {
    uint64_t v4 = *((void *)this + 2);
  }
  else {
    LODWORD(v4) = *((unsigned __int8 *)this + 31);
  }
  size_t v5 = (void *)((char *)this + 8);
  int __ptr = v4;
  fwrite(&__ptr, 4uLL, 1uLL, __stream);
  if (*((char *)this + 31) < 0) {
    size_t v5 = (void *)*v5;
  }
  fwrite(v5, 1uLL, __ptr + 1, __stream);
  if (*((char *)this + 55) < 0) {
    uint64_t v6 = *((void *)this + 5);
  }
  else {
    LODWORD(v6) = *((unsigned __int8 *)this + 55);
  }
  uint64_t v7 = (void *)((char *)this + 32);
  int __ptr = v6;
  fwrite(&__ptr, 4uLL, 1uLL, __stream);
  if (*((char *)this + 55) < 0) {
    uint64_t v7 = (void *)*v7;
  }
  fwrite(v7, 1uLL, __ptr + 1, __stream);
  return fwrite((char *)this + 60, 1uLL, 1uLL, __stream);
}

size_t LayerParameters::readBinaryLayerParamenters(LayerParameters *this, __sFILE *__stream)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int __ptr = 0;
  fread(&__ptr, 4uLL, 1uLL, __stream);
  fread(v6, 1uLL, __ptr + 1, __stream);
  MEMORY[0x21D44B210]((char *)this + 32, v6);
  return fread((char *)this + 60, 1uLL, 1uLL, __stream);
}

void LayerParameters::~LayerParameters(void **this)
{
  *this = &unk_26C7B1908;
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

uint64_t PoolingLayerParameters::getKernelSize(PoolingLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t PoolingLayerParameters::putKernelSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t PoolingLayerParameters::getNumOutputs(PoolingLayerParameters *this)
{
  return 0;
}

uint64_t PoolingLayerParameters::getFirstHiddenLayerFlag(PoolingLayerParameters *this)
{
  return 0;
}

size_t PoolingLayerParameters::writeBinaryLayerParameters(PoolingLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  return fwrite((char *)this + 64, 4uLL, 1uLL, a2);
}

size_t PoolingLayerParameters::readBinaryLayerParamenters(PoolingLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  return fread((char *)this + 64, 4uLL, 1uLL, a2);
}

void PoolingLayerParameters::~PoolingLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x21D44B400);
}

uint64_t HiddenLayerParameters::getKernelSize(HiddenLayerParameters *this)
{
  return 0;
}

uint64_t HiddenLayerParameters::getNumOutputs(HiddenLayerParameters *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t HiddenLayerParameters::putNumOutputs(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t HiddenLayerParameters::setFirstHiddenLayerFlag(uint64_t this)
{
  *(unsigned char *)(this + 60) = 1;
  return this;
}

uint64_t HiddenLayerParameters::getFirstHiddenLayerFlag(HiddenLayerParameters *this)
{
  return *((unsigned __int8 *)this + 60);
}

size_t HiddenLayerParameters::writeBinaryLayerParameters(HiddenLayerParameters *this, __sFILE *a2)
{
  LayerParameters::writeBinaryLayerParameters(this, a2);
  return fwrite((char *)this + 64, 4uLL, 1uLL, a2);
}

size_t HiddenLayerParameters::readBinaryLayerParamenters(HiddenLayerParameters *this, __sFILE *a2)
{
  LayerParameters::readBinaryLayerParamenters(this, a2);
  return fread((char *)this + 64, 4uLL, 1uLL, a2);
}

void HiddenLayerParameters::~HiddenLayerParameters(void **this)
{
  LayerParameters::~LayerParameters(this);
  JUMPOUT(0x21D44B400);
}

uint64_t Corpus::Corpus(uint64_t a1, double a2, double a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, void *a10, uint64_t a11)
{
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = &unk_26C7B1C08;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 152) = 0;
  uint64_t v15 = (void *)(a1 + 152);
  *(void *)(a1 + 144) = a1 + 152;
  uint64_t v16 = (uint64_t *)(a1 + 144);
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 176) = 0;
  uint64_t v17 = (uint64_t **)(a1 + 176);
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 168) = a1 + 176;
  uint64_t v18 = (uint64_t *)(a1 + 168);
  *(void *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 40) = a8;
  unint64_t v19 = (a8 + a5);
  *(void *)(a1 + 32) = v19;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 76) = a9;
  std::vector<double>::resize(a1 + 96, v19);
  std::vector<double>::resize(a1 + 120, *(unsigned int *)(a1 + 32));
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  if (a11)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "Corpus: mean");
    if (SHIBYTE(v89) < 0) {
      operator delete(__p);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, "Corpus: stddev");
    if (SHIBYTE(v89) < 0) {
      operator delete(__p);
    }
    *(double *)(a1 + 80) = a2;
    *(double *)(a1 + 88) = a3;
  }
  long long v88 = 0;
  uint64_t v89 = 0;
  std::string __p = &v88;
  if (a10)
  {
    long long v84 = v15;
    long long v85 = a10;
    uint64_t v22 = (const void **)*a10;
    uint64_t v20 = (const void ***)(a10 + 1);
    uint64_t v21 = v22;
    if (v22 != (const void **)v20)
    {
      while (1)
      {
        id v23 = v88;
        if (__p == &v88) {
          break;
        }
        long long v24 = &v88;
        if (v88)
        {
          do
          {
            uint64_t v25 = (uint64_t **)v23;
            id v23 = (uint64_t *)v23[1];
          }
          while (v23);
        }
        else
        {
          do
          {
            uint64_t v25 = (uint64_t **)v24[2];
            BOOL v26 = *v25 == (uint64_t *)v24;
            long long v24 = v25;
          }
          while (v26);
        }
        if (std::less<std::string>::operator()[abi:ne180100]((uint64_t)&v89, (const void **)v25 + 4, v21 + 4))
        {
          if (!v88) {
            goto LABEL_16;
          }
LABEL_18:
          long long v94 = v25;
          uint64_t v27 = v25 + 1;
          goto LABEL_20;
        }
        uint64_t v27 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_equal<std::string>((uint64_t)&__p, &v94, v21 + 4);
LABEL_20:
        if (!*v27) {
          goto LABEL_21;
        }
LABEL_24:
        id v30 = (const void **)v21[1];
        if (v30)
        {
          do
          {
            double v31 = (const void ***)v30;
            id v30 = (const void **)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            double v31 = (const void ***)v21[2];
            BOOL v26 = *v31 == v21;
            uint64_t v21 = (const void **)v31;
          }
          while (!v26);
        }
        uint64_t v21 = (const void **)v31;
        if (v31 == v20) {
          goto LABEL_30;
        }
      }
      uint64_t v25 = &v88;
      if (!v88)
      {
LABEL_16:
        long long v94 = &v88;
        uint64_t v27 = &v88;
LABEL_21:
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>((uint64_t)&v95, (uint64_t)&__p, (uint64_t)(v21 + 4));
        uint64_t v29 = (uint64_t)v94;
        uint64_t v28 = (uint64_t *)v95;
        *long long v95 = 0;
        v28[1] = 0;
        v28[2] = v29;
        *uint64_t v27 = v28;
        if (*(void *)__p)
        {
          std::string __p = *(void **)__p;
          uint64_t v28 = *v27;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v88, v28);
        ++v89;
        goto LABEL_24;
      }
      goto LABEL_18;
    }
LABEL_30:
    long long v91 = 0;
    uint64_t v92 = 0;
    long long v90 = &v91;
    CGFloat v32 = (void *)v85[3];
    if (v32 != v85 + 4)
    {
      uint64_t v33 = 0;
      uint64_t v34 = &v91;
      while (1)
      {
        unsigned int v35 = *((_DWORD *)v32 + 8);
        uint64_t v36 = &v91;
        if (v34 == &v91) {
          break;
        }
        uint64_t v37 = v33;
        id v38 = &v91;
        if (v33)
        {
          do
          {
            uint64_t v36 = (uint64_t **)v37;
            uint64_t v37 = (uint64_t *)v37[1];
          }
          while (v37);
        }
        else
        {
          do
          {
            uint64_t v36 = (uint64_t **)v38[2];
            BOOL v26 = *v36 == (uint64_t *)v38;
            id v38 = v36;
          }
          while (v26);
        }
        if (*((_DWORD *)v36 + 8) < v35) {
          break;
        }
        long long v40 = &v91;
        long long v39 = &v91;
        if (!v33) {
          goto LABEL_53;
        }
        while (1)
        {
          while (1)
          {
            long long v39 = (uint64_t **)v33;
            unsigned int v41 = *((_DWORD *)v33 + 8);
            if (v41 <= v35) {
              break;
            }
            uint64_t v33 = *v39;
            long long v40 = v39;
            if (!*v39) {
              goto LABEL_53;
            }
          }
          if (v41 >= v35) {
            break;
          }
          uint64_t v33 = v39[1];
          if (!v33)
          {
            long long v40 = v39 + 1;
            goto LABEL_53;
          }
        }
LABEL_56:
        uint64_t v43 = (void *)v32[1];
        if (v43)
        {
          do
          {
            uint64_t v44 = v43;
            uint64_t v43 = (void *)*v43;
          }
          while (v43);
        }
        else
        {
          do
          {
            uint64_t v44 = (void *)v32[2];
            BOOL v26 = *v44 == (void)v32;
            CGFloat v32 = v44;
          }
          while (!v26);
        }
        if (v44 == v85 + 4) {
          goto LABEL_63;
        }
        uint64_t v34 = v90;
        uint64_t v33 = v91;
        CGFloat v32 = v44;
      }
      if (v33) {
        long long v39 = v36;
      }
      else {
        long long v39 = &v91;
      }
      if (v33) {
        long long v40 = v36 + 1;
      }
      else {
        long long v40 = &v91;
      }
      if (*v40) {
        goto LABEL_56;
      }
LABEL_53:
      std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>((uint64_t)&v95, (uint64_t)&v90, (uint64_t)(v32 + 4));
      long long v42 = (uint64_t *)v95;
      *long long v95 = 0;
      v42[1] = 0;
      v42[2] = (uint64_t)v39;
      *long long v40 = v42;
      if (*v90)
      {
        long long v90 = (uint64_t **)*v90;
        long long v42 = *v40;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v91, v42);
      ++v92;
      goto LABEL_56;
    }
LABEL_63:
    uint64_t v15 = v84;
    int v93 = *((_DWORD *)v85 + 12);
  }
  else
  {
    long long v91 = 0;
    uint64_t v92 = 0;
    long long v90 = &v91;
    int v93 = 0;
  }
  if (v16 != (uint64_t *)&__p)
  {
    uint64_t v45 = (uint64_t *)__p;
    if (*(void *)(a1 + 160))
    {
      uint64_t v46 = *v16;
      *uint64_t v16 = (uint64_t)v15;
      *(void *)(*v15 + 16) = 0;
      void *v15 = 0;
      v15[1] = 0;
      if (*(void *)(v46 + 8)) {
        id v47 = *(uint64_t **)(v46 + 8);
      }
      else {
        id v47 = (uint64_t *)v46;
      }
      long long v95 = (const void **)v16;
      long long v96 = v47;
      double v97 = (const void **)v47;
      if (v47)
      {
        long long v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v47);
        unint64_t v48 = &v88;
        if (v45 != (uint64_t *)&v88)
        {
          do
          {
            std::string::operator=((std::string *)(v47 + 4), (const std::string *)(v45 + 4));
            *((_DWORD *)v47 + 14) = *((_DWORD *)v45 + 14);
            long long v49 = (uint64_t *)v97;
            leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high((uint64_t)v16, &v94, v97 + 4);
            std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v16, (uint64_t)v94, leaf_high, v49);
            id v47 = v96;
            double v97 = (const void **)v96;
            if (v96) {
              long long v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v96);
            }
            uint64_t v51 = (uint64_t *)v45[1];
            if (v51)
            {
              do
              {
                unint64_t v48 = (uint64_t **)v51;
                uint64_t v51 = (uint64_t *)*v51;
              }
              while (v51);
            }
            else
            {
              do
              {
                unint64_t v48 = (uint64_t **)v45[2];
                BOOL v26 = *v48 == v45;
                uint64_t v45 = (uint64_t *)v48;
              }
              while (!v26);
            }
            if (!v47) {
              break;
            }
            uint64_t v45 = (uint64_t *)v48;
          }
          while (v48 != &v88);
        }
      }
      else
      {
        unint64_t v48 = (uint64_t **)v45;
      }
      std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v95);
      uint64_t v45 = (uint64_t *)v48;
    }
    if (v45 != (uint64_t *)&v88)
    {
      do
      {
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>((uint64_t)&v95, (uint64_t)v16, (uint64_t)(v45 + 4));
        uint64_t v52 = (uint64_t **)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high((uint64_t)v16, &v94, v95 + 4);
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v16, (uint64_t)v94, v52, (uint64_t *)v95);
        uint64_t v53 = (uint64_t *)v45[1];
        if (v53)
        {
          do
          {
            long long v54 = (uint64_t **)v53;
            uint64_t v53 = (uint64_t *)*v53;
          }
          while (v53);
        }
        else
        {
          do
          {
            long long v54 = (uint64_t **)v45[2];
            BOOL v26 = *v54 == v45;
            uint64_t v45 = (uint64_t *)v54;
          }
          while (!v26);
        }
        uint64_t v45 = (uint64_t *)v54;
      }
      while (v54 != &v88);
    }
    long long v55 = v90;
    if (*(void *)(a1 + 184))
    {
      uint64_t v56 = *v18;
      *uint64_t v18 = (uint64_t)v17;
      (*v17)[2] = 0;
      void *v17 = 0;
      v17[1] = 0;
      if (*(void *)(v56 + 8)) {
        double v57 = *(uint64_t **)(v56 + 8);
      }
      else {
        double v57 = (uint64_t *)v56;
      }
      long long v95 = (const void **)v18;
      long long v96 = v57;
      double v97 = (const void **)v57;
      if (v57)
      {
        long long v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v57);
        if (v55 == &v91)
        {
          CFRange v62 = &v91;
        }
        else
        {
          do
          {
            *((_DWORD *)v57 + 8) = *((_DWORD *)v55 + 8);
            std::string::operator=((std::string *)(v57 + 5), (const std::string *)(v55 + 5));
            uint64_t v58 = *v17;
            uint64_t v59 = v17;
            uint64_t v60 = v17;
            if (*v17)
            {
              do
              {
                while (1)
                {
                  uint64_t v59 = (uint64_t **)v58;
                  if (*((_DWORD *)v97 + 8) >= *((_DWORD *)v58 + 8)) {
                    break;
                  }
                  uint64_t v58 = (uint64_t *)*v58;
                  uint64_t v60 = v59;
                  if (!*v59) {
                    goto LABEL_103;
                  }
                }
                uint64_t v58 = (uint64_t *)v58[1];
              }
              while (v58);
              uint64_t v60 = v59 + 1;
            }
LABEL_103:
            std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v18, (uint64_t)v59, v60, (uint64_t *)v97);
            double v57 = v96;
            double v97 = (const void **)v96;
            if (v96) {
              long long v96 = std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next((uint64_t)v96);
            }
            CFRange v61 = v55[1];
            if (v61)
            {
              do
              {
                CFRange v62 = (uint64_t **)v61;
                CFRange v61 = (uint64_t *)*v61;
              }
              while (v61);
            }
            else
            {
              do
              {
                CFRange v62 = (uint64_t **)v55[2];
                BOOL v26 = *v62 == (uint64_t *)v55;
                long long v55 = v62;
              }
              while (!v26);
            }
            if (!v57) {
              break;
            }
            long long v55 = v62;
          }
          while (v62 != &v91);
        }
      }
      else
      {
        CFRange v62 = v55;
      }
      std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v95);
      long long v55 = v62;
    }
    if (v55 != &v91)
    {
      do
      {
        std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>((uint64_t)&v95, (uint64_t)v18, (uint64_t)(v55 + 4));
        CFRange v63 = *v17;
        double v64 = v17;
        unint64_t v65 = v17;
        if (*v17)
        {
          do
          {
            while (1)
            {
              double v64 = (uint64_t **)v63;
              if (*((_DWORD *)v95 + 8) >= *((_DWORD *)v63 + 8)) {
                break;
              }
              CFRange v63 = (uint64_t *)*v63;
              unint64_t v65 = v64;
              if (!*v64) {
                goto LABEL_123;
              }
            }
            CFRange v63 = (uint64_t *)v63[1];
          }
          while (v63);
          unint64_t v65 = v64 + 1;
        }
LABEL_123:
        std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at((uint64_t **)v18, (uint64_t)v64, v65, (uint64_t *)v95);
        uint64_t v66 = v55[1];
        if (v66)
        {
          do
          {
            uint64_t v67 = (uint64_t **)v66;
            uint64_t v66 = (uint64_t *)*v66;
          }
          while (v66);
        }
        else
        {
          do
          {
            uint64_t v67 = (uint64_t **)v55[2];
            BOOL v26 = *v67 == (uint64_t *)v55;
            long long v55 = v67;
          }
          while (!v26);
        }
        long long v55 = v67;
      }
      while (v67 != &v91);
    }
  }
  *(_DWORD *)(a1 + 192) = v93;
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy((uint64_t)&v90, (char *)v91);
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&__p, (char *)v88);
  uint64_t v68 = *(void **)(a1 + 144);
  if (v68 == v15) {
    goto LABEL_156;
  }
  unsigned int v69 = 0;
  while (1)
  {
    LODWORD(v95) = *((_DWORD *)v68 + 14);
    std::string __p = &v95;
    uint64_t v70 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)v18, (unsigned int *)&v95, (uint64_t)&std::piecewise_construct, (_DWORD **)&__p);
    uint64_t v71 = *((unsigned __int8 *)v68 + 55);
    if ((v71 & 0x80u) == 0) {
      double v72 = (uint64_t *)*((unsigned __int8 *)v68 + 55);
    }
    else {
      double v72 = (uint64_t *)v68[5];
    }
    long long v73 = (uint64_t *)*((unsigned __int8 *)v70 + 63);
    int v74 = (char)v73;
    if ((char)v73 < 0) {
      long long v73 = v70[6];
    }
    if (v72 != v73)
    {
      if (v69 >= 0x65) {
        goto LABEL_156;
      }
LABEL_160:
      exit(1);
    }
    long long v75 = (const void **)(v68 + 4);
    long long v78 = v70[5];
    long long v76 = v70 + 5;
    long long v77 = v78;
    long long v79 = v74 >= 0 ? v76 : (uint64_t **)v77;
    if ((v71 & 0x80) == 0) {
      break;
    }
    BOOL v80 = memcmp(*v75, v79, v68[5]) == 0;
LABEL_146:
    if (v69 == 101) {
      goto LABEL_156;
    }
    if (!v80) {
      goto LABEL_160;
    }
    long long v81 = (void *)v68[1];
    if (v81)
    {
      do
      {
        long long v82 = v81;
        long long v81 = (void *)*v81;
      }
      while (v81);
    }
    else
    {
      do
      {
        long long v82 = (void *)v68[2];
        BOOL v26 = *v82 == (void)v68;
        uint64_t v68 = v82;
      }
      while (!v26);
    }
    ++v69;
    uint64_t v68 = v82;
    if (v82 == v15) {
      goto LABEL_156;
    }
  }
  if (!*((unsigned char *)v68 + 55))
  {
LABEL_144:
    BOOL v80 = 1;
    goto LABEL_146;
  }
  while (*(unsigned __int8 *)v75 == *(unsigned __int8 *)v79)
  {
    long long v75 = (const void **)((char *)v75 + 1);
    long long v79 = (uint64_t **)((char *)v79 + 1);
    if (!--v71) {
      goto LABEL_144;
    }
  }
  if (v69 <= 0x64) {
    goto LABEL_160;
  }
LABEL_156:
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (SHIBYTE(v89) < 0) {
    operator delete(__p);
  }
  return a1;
}

void sub_2177792CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, void **a11, void **a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  TagMap::~TagMap(v25);
  uint64_t v27 = *a11;
  if (*a11)
  {
    *(void *)(a16 + 128) = v27;
    operator delete(v27);
  }
  uint64_t v28 = *a12;
  if (*a12)
  {
    *(void *)(a16 + 104) = v28;
    operator delete(v28);
  }
  uint64_t v29 = *a13;
  if (*a13)
  {
    *(void *)(a16 + 56) = v29;
    operator delete(v29);
  }
  if (*(char *)(a16 + 31) < 0) {
    operator delete(*a10);
  }
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__find_leaf_high(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        size_t v5 = (void *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v5;
        size_t result = v5;
        if (!*v5) {
          goto LABEL_9;
        }
      }
      uint64_t v4 = v5[1];
    }
    while (v4);
    size_t result = v5 + 1;
  }
  else
  {
    size_t result = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

void *std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  size_t result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *size_t result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          size_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          size_t result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(*(void *)a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(*(void *)a1, (char *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__construct_node<std::pair<std::string const,unsigned int> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v6 + 6) = *(void *)(a3 + 16);
  }
  *((_DWORD *)v6 + 14) = *(_DWORD *)(a3 + 24);
  *(unsigned char *)(a1 + 16) = 1;
}

void sub_217779564(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(*(void *)a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::destroy(*(void *)a1, (char *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__construct_node<std::pair<unsigned int const,std::string> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a3;
  uint64_t v7 = (std::string *)(v6 + 40);
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a3 + 8), *(void *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v7->__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
  }
  *(unsigned char *)(a1 + 16) = 1;
}

void sub_217779658(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](0, v2);
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void sub_2177799E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217779BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21777A030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Unwind_Resume(a1);
}

void sub_21777A6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, void **a18)
{
  uint64_t v25 = v21;

  a18 = (void **)&a15;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

void sub_21777ABE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (__p) {
    operator delete(__p);
  }
  long long v24 = *(void **)(v22 - 104);
  if (v24)
  {
    *(void *)(v22 - 96) = v24;
    operator delete(v24);
  }

  _Unwind_Resume(a1);
}

void sub_21777C2FC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 96) = v2;

  uint64_t v4 = *(void **)(v1 + 128);
  if (v4)
  {
    *(void *)(v1 + 136) = v4;
    operator delete(v4);
  }
  *(void *)(v1 + 128) = v1 + 280;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));
  *(void *)(v1 + 128) = v1 + 304;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));

  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(*(void **)(v1 + 336));
  uint64_t v5 = *(void **)(v1 + 96);
  uint64_t v6 = *(void **)(v1 + 352);
  if (v6)
  {
    *(void *)(v1 + 360) = v6;
    operator delete(v6);
  }
  *(void *)(v1 + 128) = v1 + 376;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 + 128));
  uint64_t v7 = *(void **)(v1 + 400);
  if (v7)
  {
    *(void *)(v1 + 408) = v7;
    operator delete(v7);
  }

  _Unwind_Resume(a1);
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21777C668(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>(uint64_t *result, int a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t **)result;
  uint64_t v6 = (uint64_t **)(result + 1);
  uint64_t v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        int v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2) {
          break;
        }
        uint64_t v5 = *v7;
        uint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v5 = v7[1];
      if (!v5)
      {
        uint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = (uint64_t **)(result + 1);
LABEL_9:
    uint64_t v9 = (char *)operator new(0x40uLL);
    *((_DWORD *)v9 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)(a3 + 8);
    *((void *)v9 + 7) = *(void *)(a3 + 24);
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    return std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::__insert_node_at(v4, (uint64_t)v7, v6, (uint64_t *)v9);
  }
  return result;
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        int v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

void sub_21777C8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void sub_21777CE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  *(void *)(v19 - 176) = v19 - 144;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v19 - 176));

  _Unwind_Resume(a1);
}

void sub_21777CFB4()
{
}

void sub_21777D0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777D1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::vector<float>>>::__vdeallocate(void ***a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        uint64_t v5 = v3;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_21777D3B8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21777D4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777D974(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21777DA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777DB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777DC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777DCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777E50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777E714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21777E964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777ECDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777EDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777EE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777EF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777F078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777F164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777F300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777F4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777F62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  CFStringRef v10 = v9;

  a9.super_class = (Class)CRCameraReader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21777F8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777FA30(_Unwind_Exception *exception_object)
{
}

void sub_21777FAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777FB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777FBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777FC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777FC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21777FD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21777FE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217780184(_Unwind_Exception *exception_object)
{
}

void sub_21778034C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177805A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217780708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217780ABC(_Unwind_Exception *exception_object)
{
}

void sub_217780B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217780EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217781314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_2177815B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_2177817C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217781A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_217781B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177822D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_217782DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177831C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217783E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_2177841E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_217784370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217784580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217784A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_217784C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_217784D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217784DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217785284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778650C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,void *a23,void *a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_217789700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *a27,void *a28,uint64_t a29,uint64_t a30,void *a31,id *a32)
{
  if (a29) {
  if (v34)
  }

  _Unwind_Resume(a1);
}

void sub_21778A52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778A5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778A63C(_Unwind_Exception *exception_object)
{
  if (!v2) {

  }
  _Unwind_Resume(exception_object);
}

void sub_21778A6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778A734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778A7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778A860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778AD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21778B5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21778BA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21778BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778BFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778C09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778C7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778CBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778D9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,void *a52)
{
  _Unwind_Resume(a1);
}

void sub_21778DFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778E01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778E218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21778F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Unwind_Resume(a1);
}

void sub_21778FB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_21778FCD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217790F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,void *a48,void *a49,uint64_t a50,uint64_t a51,void *a52,void *a53,void *a54,void *a55)
{
  _Unwind_Resume(a1);
}

void sub_217791830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_217791D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_217792A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_217793050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177932C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21779377C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2177939C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217793BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217793C24()
{
}

void sub_217793C2C()
{
}

void sub_217793C34()
{
  JUMPOUT(0x217793C18);
}

void sub_217793C40()
{
}

void sub_217793CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_217793DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217793E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217793EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177940E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177949D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_217794E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217795654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  _Unwind_Resume(a1);
}

void sub_217795934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217795A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  objc_destroyWeak(v18);
  _Unwind_Resume(a1);
}

void sub_217795C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217795D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217795D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217795E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217795EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217795F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21779603C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217796108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_217796520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177966EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177967B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_217796884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217796ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_217796F30(_Unwind_Exception *a1)
{
  uint64_t v7 = v2;

  _Unwind_Resume(a1);
}

void sub_217797254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177973FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177974E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21779766C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2177976E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2177979A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217797A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217797B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217797DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217797F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217798018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_217798114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217798214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t tpThreadInit(unsigned int *a1, unsigned int a2, int a3, unsigned int a4, int a5)
{
  *a1 = a2;
  a1[1] = 0;
  *((void *)a1 + 1) = 0;
  if (!a2) {
    return 0;
  }
  a1[1] = a3 + a2;
  size_t v8 = 176 * (a3 + a2);
  uint64_t v9 = malloc_type_malloc(v8, 0xACD0F4C6uLL);
  *((void *)a1 + 1) = v9;
  if (v9)
  {
    bzero(v9, v8);
    if (a1[1])
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      size_t v12 = a4;
      double v13 = "***tpThreadInit: Error initializing mutex";
      while (1)
      {
        uint64_t v14 = *((void *)a1 + 1);
        uint64_t v15 = (_DWORD *)(v14 + v10);
        uint64_t v16 = malloc_type_malloc(v12, 0x75453uLL);
        *(void *)(v14 + v10 + 144) = v16;
        if (!v16) {
          goto LABEL_12;
        }
        bzero(v16, v12);
        _DWORD *v15 = 0;
        v15[32] = v11;
        if (v11 < *a1)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v14 + v10 + 8), 0)) {
            goto LABEL_15;
          }
          if (pthread_cond_init((pthread_cond_t *)(v14 + v10 + 72), 0))
          {
            double v13 = "***tpThreadInit: Error initializing pthreadCond";
LABEL_15:
            puts(v13);
            free(*((void **)a1 + 1));
            *((void *)a1 + 1) = 0;
            return 2;
          }
          if (pthread_create((pthread_t *)(v14 + v10 + 120), 0, (void *(__cdecl *)(void *))tpThread, (void *)(v14 + v10)))
          {
            double v13 = "***tpThreadInit: Error starting up server thread";
            goto LABEL_15;
          }
        }
        *(_DWORD *)(v14 + v10 + 168) = a5;
        ++v11;
        v10 += 176;
        if (v11 >= a1[1]) {
          return 0;
        }
      }
    }
    return 0;
  }
LABEL_12:
  puts("***tpThreadInit: malloc failure");
  return 1;
}

uint64_t tpThread(char *a1)
{
  kern_return_t v3;
  int v4;
  const char *v5;
  integer_t policy_info;

  if (a1[168])
  {
    policy_info = *((_DWORD *)a1 + 32) + 1;
    thread_act_t v2 = MEMORY[0x21D44B710]();
    uint64_t v3 = thread_policy_set(v2, 4u, &policy_info, 1u);
    if (v3) {
      printf("setThreadAffinity: thread_policy_set returned %d\n", v3);
    }
  }
  while (1)
  {
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
    {
      uint64_t v5 = "***tpThread: Error acquiring lock; aborting.";
      goto LABEL_18;
    }
    while (!*(_DWORD *)a1)
    {
      uint64_t v4 = pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
      if (v4)
      {
        printf("***tpThread: Error waiting on condition; error %d; aborting.\n", v4);
        goto LABEL_14;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    if (*((_DWORD *)a1 + 34) == 1) {
      return 0;
    }
    *((_DWORD *)a1 + 40) = (*((uint64_t (**)(void))a1 + 19))(*((void *)a1 + 18));
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
    {
      uint64_t v5 = "***Error acquiring lock; aborting.";
      goto LABEL_18;
    }
    *(_DWORD *)a1 = 0;
    if (pthread_cond_broadcast((pthread_cond_t *)(a1 + 72)))
    {
      uint64_t v5 = "***Error waking main thread; aborting.";
      goto LABEL_18;
    }
    if (pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8)))
    {
      uint64_t v5 = "***Error acquiring server lock; aborting.";
LABEL_18:
      puts(v5);
LABEL_14:
      pthread_exit(0);
    }
  }
}

void tpThreadShutdown(unsigned int *a1)
{
  if (*a1)
  {
    if (!a1[1]) {
      goto LABEL_8;
    }
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *((void *)a1 + 1);
      if (v3 < *a1)
      {
        uint64_t v5 = (_DWORD *)(v4 + v2);
        pthread_mutex_lock((pthread_mutex_t *)(v4 + v2 + 8));
        v5[34] = 1;
        _DWORD *v5 = 1;
        pthread_cond_broadcast((pthread_cond_t *)(v4 + v2 + 72));
        pthread_mutex_unlock((pthread_mutex_t *)(v4 + v2 + 8));
      }
      free(*(void **)(v4 + v2 + 144));
      *(void *)(v4 + v2 + 144) = 0;
      ++v3;
      v2 += 176;
    }
    while (v3 < a1[1]);
    if (*a1)
    {
LABEL_8:
      unint64_t v6 = 0;
      uint64_t v7 = 120;
      do
      {
        uint64_t v8 = *((void *)a1 + 1);
        double v13 = 0;
        pthread_join(*(pthread_t *)(v8 + v7), &v13);
        ++v6;
        unint64_t v9 = *a1;
        v7 += 176;
      }
      while (v6 < v9);
      if (v9)
      {
        unint64_t v10 = 0;
        uint64_t v11 = 72;
        do
        {
          size_t v12 = (pthread_cond_t *)(*((void *)a1 + 1) + v11);
          pthread_mutex_destroy((pthread_mutex_t *)&v12[-2].__opaque[24]);
          pthread_cond_destroy(v12);
          ++v10;
          v11 += 176;
        }
        while (v10 < *a1);
      }
    }
    free(*((void **)a1 + 1));
    *((void *)a1 + 1) = 0;
  }
}

uint64_t tpThreadDispatch(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = a2;
  while (1)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    *(_DWORD *)(v6 + v3 + 160) = 2;
    if (pthread_mutex_lock((pthread_mutex_t *)(v6 + v3 + 8)))
    {
      uint64_t v8 = "tpThreadDispatch: mutex error";
      goto LABEL_12;
    }
    if (*(_DWORD *)(v6 + v3))
    {
      printf("tpThreadDispatch: thread %u not idle\n", v4);
      return 2;
    }
    *(_DWORD *)(v6 + v3) = 1;
    if (pthread_cond_broadcast((pthread_cond_t *)(v6 + v3 + 72))) {
      break;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + v3 + 8));
    ++v4;
    v3 += 176;
    if (v5 == v4) {
      return 0;
    }
  }
  uint64_t v8 = "tpThreadDispatch: cond_broadcast error";
LABEL_12:
  puts(v8);
  return 2;
}

uint64_t tpThreadFinish(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = 0;
  LODWORD(v4) = 0;
  uint64_t v5 = a2;
  uint64_t v6 = "***tpThreadFinish: Error acquiring lock";
  while (1)
  {
    uint64_t v7 = *(void *)(a1 + 8);
    uint64_t v8 = v7 + 176 * v3;
    if (pthread_mutex_lock((pthread_mutex_t *)(v8 + 8))) {
      break;
    }
    while (*(_DWORD *)v8 == 1)
    {
      if (pthread_cond_wait((pthread_cond_t *)(v7 + 176 * v3 + 72), (pthread_mutex_t *)(v8 + 8)))
      {
        uint64_t v6 = "***tpThreadFinish: Error waiting on condition";
        goto LABEL_15;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
    unsigned int v9 = *(_DWORD *)(v7 + 176 * v3 + 160);
    if (v4) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9 == 0;
    }
    if (v10) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = v9;
    }
    if (++v3 == v5) {
      return v4;
    }
  }
LABEL_15:
  puts(v6);
  return 2;
}

uint64_t ThreadPoolAuto::setupCommon(uint64_t result, unsigned int *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = result;
  if (a2)
  {
    unsigned int v6 = *a2;
    *(_DWORD *)(result + 16) = *a2;
    if (v6)
    {
      if (a4)
      {
        if (v6 > a4) {
          *(_DWORD *)(result + 16) = a4;
        }
      }
      return result;
    }
LABEL_25:
    *(_DWORD *)(v5 + 16) = 1;
    return result;
  }
  if (a3 == 1 || a4 == 1) {
    goto LABEL_25;
  }
  if (a4)
  {
    if (a3 >= a4) {
      unsigned int v8 = a4;
    }
    else {
      unsigned int v8 = a3;
    }
    if (!a3) {
      unsigned int v8 = a4;
    }
    *(_DWORD *)(result + 16) = v8;
    goto LABEL_21;
  }
  *(_DWORD *)(result + 16) = a3;
  if (a3) {
    goto LABEL_21;
  }
  int v14 = 0;
  size_t v13 = 4;
  size_t result = sysctlbyname("hw.physicalcpu", &v14, &v13, 0, 0);
  if (result)
  {
    perror("sysctlbyname(hw.physicalcpu)");
    size_t result = puts("***Error executing sysctlbyname(hw.physicalcpu)");
    goto LABEL_25;
  }
  int v9 = v14;
  int v10 = v14 <= 1 ? 1 : v14;
  *(_DWORD *)(v5 + 16) = v10;
  if (v9 >= 2)
  {
LABEL_21:
    uint64_t v11 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
    *(void *)(v5 + 8) = v11;
    if (v11)
    {
      void *v11 = 0;
      v11[1] = 0;
      size_t result = tpThreadInit(*(unsigned int **)(v5 + 8), *(_DWORD *)(v5 + 16), 0, a5, 1);
      if (!result)
      {
        *(unsigned char *)(v5 + 20) = 1;
        return result;
      }
      fwrite("***ThreadPoolAuto: tpThreadInit error\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x21D44B1F0](exception, "tpThreadInit error");
    }
    else
    {
      fwrite("***malloc failure\n", 0x12uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x21D44B1F0](exception, "malloc failure");
    }
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_2177997D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ThreadPoolAuto::~ThreadPoolAuto(unsigned int **this)
{
  *this = (unsigned int *)&unk_26C7B18E8;
  if (*((unsigned char *)this + 20))
  {
    if (!*((unsigned char *)this + 21)) {
      tpThreadShutdown(this[1]);
    }
    free(this[1]);
  }
}

{
  uint64_t vars8;

  ThreadPoolAuto::~ThreadPoolAuto(this);
  JUMPOUT(0x21D44B400);
}

uint64_t ThreadPoolAuto::runThreads(ThreadPoolAuto *this, unsigned int a2)
{
  unsigned int v2 = a2;
  if (!a2) {
    unsigned int v2 = *((_DWORD *)this + 4);
  }
  uint64_t v4 = tpThreadDispatch(*((void *)this + 1), v2);
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v6 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v7 = "***ThreadPoolAuto::runThreads: tpThreadDispatch error\n";
    size_t v8 = 54;
LABEL_7:
    fwrite(v7, v8, 1uLL, v6);
    *((unsigned char *)this + 21) = 1;
    return v5;
  }
  uint64_t v5 = tpThreadFinish(*((void *)this + 1), v2);
  if (v5)
  {
    unsigned int v6 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v7 = "***ThreadPoolAuto::runThreads: tpThreadFinish error\n";
    size_t v8 = 52;
    goto LABEL_7;
  }
  return v5;
}

void CNNSignals::CNNSignals(CNNSignals *this, unsigned int a2)
{
  *((_OWORD *)this + 3) = 0u;
  uint64_t v3 = (char **)((char *)this + 48);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  uint64_t v4 = (char **)((char *)this + 24);
  *(_OWORD *)this = 0u;
  *((void *)this + 12) = &unk_26C7B1C40;
  *(_OWORD *)((char *)this + 152) = 0u;
  double v31 = (char **)((char *)this + 152);
  *(_OWORD *)((char *)this + 200) = 0u;
  uint64_t v29 = (char **)((char *)this + 176);
  id v30 = (char **)((char *)this + 200);
  uint64_t v27 = (char **)((char *)this + 72);
  uint64_t v28 = (char **)((char *)this + 224);
  *(_OWORD *)((char *)this + 248) = 0u;
  BOOL v26 = (void *)((char *)this + 272);
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  unsigned int v35 = (void *)((char *)this + 320);
  uint64_t v36 = (void *)((char *)this + 368);
  *(_OWORD *)((char *)this + 168) = 0u;
  uint64_t v33 = (void *)((char *)this + 344);
  uint64_t v34 = (void *)((char *)this + 392);
  CGFloat v32 = (void *)((char *)this + 416);
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *((void *)this + 55) = &unk_26C7B1C40;
  *((void *)this + 56) = 0;
  *((void *)this + 57) = 0;
  *((void *)this + 58) = 0;
  *((void *)this + 59) = &unk_26C7B1C40;
  *((void *)this + 60) = 0;
  unint64_t v5 = a2;
  *((void *)this + 61) = 0;
  *((void *)this + 62) = 0;
  std::vector<matrix<float>>::resize((void *)this + 37, a2);
  std::vector<matrix<float>>::resize(v36, v5);
  std::vector<matrix<float>>::resize(v35, v5);
  std::vector<matrix<float>>::resize(v34, v5);
  std::vector<matrix<float>>::resize(v33, v5);
  std::vector<matrix<float>>::resize(v32, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize((char **)this, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v31, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v30, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v4, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v29, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v3, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v28, v5);
  std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(v27, v5);
  std::vector<matrix<float>>::resize(v26, v5);
  uint64_t v6 = *((void *)this + 31);
  unint64_t v7 = *((void *)this + 32);
  unint64_t v8 = (uint64_t)(v7 - v6) >> 5;
  if (v5 <= v8)
  {
    if (v5 < v8)
    {
      uint64_t v17 = (void (***)(void))(v6 + 32 * v5);
      if ((void (***)(void))v7 != v17)
      {
        unint64_t v18 = v7 - 32;
        uint64_t v19 = (void (***)(void))(v7 - 32);
        uint64_t v20 = (void (***)(void))(v7 - 32);
        do
        {
          uint64_t v21 = *v20;
          v20 -= 4;
          (*v21)(v19);
          v18 -= 32;
          BOOL v22 = v19 == v17;
          uint64_t v19 = v20;
        }
        while (!v22);
      }
      *((void *)this + 32) = v17;
    }
  }
  else
  {
    int v9 = (char *)*((void *)this + 33);
    if (v5 - v8 <= (uint64_t)&v9[-v7] >> 5)
    {
      id v23 = (void *)(v7 + 32 * (v5 - v8));
      long long v24 = (void *)*((void *)this + 32);
      do
      {
        *long long v24 = &unk_26C7B1C60;
        v24[1] = 0;
        v24[2] = 0;
        v24[3] = 0;
        v7 += 32;
        v24 += 4;
      }
      while (v24 != v23);
      *((void *)this + 32) = v23;
    }
    else
    {
      unint64_t v10 = (uint64_t)&v9[-v6] >> 4;
      if (v10 <= v5) {
        unint64_t v10 = v5;
      }
      if ((unint64_t)&v9[-v6] >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      long long v40 = (char *)this + 264;
      if (v11 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      size_t v12 = (char *)operator new(32 * v11);
      size_t v13 = &v12[32 * v8];
      uint64_t v37 = v12;
      v38.i64[0] = (uint64_t)v13;
      long long v39 = &v12[32 * v11];
      int v14 = &v12[32 * v5];
      uint64_t v15 = v13;
      uint64_t v16 = v13;
      do
      {
        *(void *)uint64_t v16 = &unk_26C7B1C60;
        *((void *)v16 + 1) = 0;
        *((void *)v16 + 2) = 0;
        *((void *)v16 + 3) = 0;
        v15 += 32;
        v16 += 32;
      }
      while (v16 != v14);
      v38.i64[1] = (uint64_t)&v12[32 * v5];
      if (v7 != v6)
      {
        *((void *)v13 - 4) = &unk_26C7B1C60;
        *((void *)v13 - 3) = *(void *)(v7 - 24);
        *((void *)v13 - 2) = *(void *)(v7 - 16);
        operator new[]();
      }
      int64x2_t v25 = vdupq_n_s64(v7);
      *((void *)this + 31) = v13;
      *((void *)this + 32) = v14;
      int64x2_t v38 = v25;
      *((void *)this + 33) = &v12[32 * v11];
      long long v39 = v9;
      uint64_t v37 = (char *)v25.i64[0];
      std::__split_buffer<matrix<unsigned int>>::~__split_buffer((uint64_t)&v37);
    }
  }
}

void sub_217799DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, void **a19, void **a20,void **a21,void **a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  for (; v29; v29 += 32)
    (**(void (***)(uint64_t))(v28 + v29))(v28 + v29);
  std::__split_buffer<matrix<unsigned int>>::~__split_buffer(v30 - 128);
  *(void *)(v27 + 472) = a12;
  uint64_t v32 = *(void *)(v27 + 496);
  if (v32) {
    MEMORY[0x21D44B3E0](v32, 0x1000C8052888210);
  }
  *(void *)(v27 + 440) = a13;
  uint64_t v33 = *(void *)(v27 + 464);
  if (v33) {
    MEMORY[0x21D44B3E0](v33, 0x1000C8052888210);
  }
  *(void *)(v30 - 136) = a23;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a25;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a27;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a24;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a26;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a14;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a17;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v30 - 136) = a16;
  std::vector<matrix<unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  uint64_t v34 = *a19;
  if (*a19)
  {
    *(void *)(v27 + 232) = v34;
    operator delete(v34);
  }
  unsigned int v35 = *a21;
  if (*a21)
  {
    *(void *)(v27 + 208) = v35;
    operator delete(v35);
  }
  uint64_t v36 = *a20;
  if (*a20)
  {
    *(void *)(v27 + 184) = v36;
    operator delete(v36);
  }
  uint64_t v37 = *a22;
  if (*a22)
  {
    *(void *)(v27 + 160) = v37;
    operator delete(v37);
  }
  *(void *)(v30 - 136) = v27 + 128;
  std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 136));
  *(void *)(v27 + 96) = a15;
  uint64_t v38 = *(void *)(v27 + 120);
  if (v38) {
    MEMORY[0x21D44B3E0](v38, 0x1000C8052888210);
  }
  long long v39 = *a18;
  if (*a18)
  {
    *(void *)(v27 + 80) = v39;
    operator delete(v39);
  }
  long long v40 = *a10;
  if (*a10)
  {
    *(void *)(v27 + 56) = v40;
    operator delete(v40);
  }
  unsigned int v41 = *a9;
  if (*a9)
  {
    *(void *)(v27 + 32) = v41;
    operator delete(v41);
  }
  long long v42 = *(void **)v27;
  if (*(void *)v27)
  {
    *(void *)(v27 + 8) = v42;
    operator delete(v42);
  }
  _Unwind_Resume(a1);
}

void *std::vector<matrix<float>>::resize(void *result, unint64_t a2)
{
  uint64_t v3 = (char **)result;
  unint64_t v5 = (char *)*result;
  uint64_t v4 = (char *)result[1];
  unint64_t v6 = (uint64_t)&v4[-*result] >> 5;
  if (a2 <= v6)
  {
    if (a2 < v6)
    {
      uint64_t v15 = &v5[32 * a2];
      if (v4 != v15)
      {
        uint64_t v16 = v4 - 32;
        uint64_t v17 = v16;
        unint64_t v18 = v16;
        do
        {
          uint64_t v19 = *(uint64_t (***)(char *))v18;
          v18 -= 32;
          size_t result = (void *)(*v19)(v17);
          v16 -= 32;
          BOOL v20 = v17 == v15;
          uint64_t v17 = v18;
        }
        while (!v20);
      }
      v3[1] = v15;
    }
  }
  else
  {
    uint64_t v7 = result[2];
    if (a2 - v6 <= (v7 - (uint64_t)v4) >> 5)
    {
      uint64_t v21 = &v4[32 * (a2 - v6)];
      BOOL v22 = (char *)result[1];
      do
      {
        *(void *)BOOL v22 = &unk_26C7B1C40;
        *((void *)v22 + 1) = 0;
        *((void *)v22 + 2) = 0;
        *((void *)v22 + 3) = 0;
        v4 += 32;
        v22 += 32;
      }
      while (v22 != v21);
      result[1] = v21;
    }
    else
    {
      if (a2 >> 59) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v8 = v7 - (void)v5;
      uint64_t v9 = v8 >> 4;
      if (v8 >> 4 <= a2) {
        uint64_t v9 = a2;
      }
      if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v10 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v10 = v9;
      }
      uint64_t v28 = result + 2;
      if (v10 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v11 = (char *)operator new(32 * v10);
      size_t v12 = &v11[32 * v6];
      BOOL v26 = v11;
      *(void *)uint64_t v27 = v12;
      *(void *)&v27[16] = &v11[32 * v10];
      size_t v13 = v12;
      int v14 = v12;
      do
      {
        *(void *)int v14 = &unk_26C7B1C40;
        *((void *)v14 + 1) = 0;
        *((void *)v14 + 2) = 0;
        *((void *)v14 + 3) = 0;
        v13 += 32;
        v14 += 32;
      }
      while (v14 != &v11[32 * a2]);
      *(void *)&v27[8] = &v11[32 * a2];
      if (v4 != v5) {
        matrix<float>::matrix((void *)v12 - 4, (uint64_t)(v4 - 32));
      }
      id v23 = v3[2];
      long long v24 = *(_OWORD *)&v27[8];
      long long v25 = *(_OWORD *)v3;
      void *v3 = v12;
      *(_OWORD *)uint64_t v27 = v25;
      *(_OWORD *)(v3 + 1) = v24;
      *(void *)&v27[16] = v23;
      BOOL v26 = (char *)v25;
      return (void *)std::__split_buffer<matrix<float>>::~__split_buffer((uint64_t)&v26);
    }
  }
  return result;
}

void std::vector<matrix<float> *,std::allocator<matrix<float> *>>::resize(char **a1, unint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v5 = (v3 - *a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    uint64_t v16 = &v4[8 * a2];
    goto LABEL_20;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v3) >> 3)
  {
    bzero(a1[1], 8 * v6);
    uint64_t v16 = &v3[8 * v6];
LABEL_20:
    a1[1] = v16;
    return;
  }
  if (a2 >> 61) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = v7 - v4;
  uint64_t v9 = v8 >> 2;
  if (v8 >> 2 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v11 = (char *)operator new(8 * v10);
  size_t v12 = &v11[8 * v5];
  size_t v13 = &v11[8 * v10];
  bzero(v12, 8 * v6);
  int v14 = &v12[8 * v6];
  if (v3 != v4)
  {
    do
    {
      uint64_t v15 = *((void *)v3 - 1);
      v3 -= 8;
      *((void *)v12 - 1) = v15;
      v12 -= 8;
    }
    while (v3 != v4);
    uint64_t v3 = v4;
  }
  *a1 = v12;
  a1[1] = v14;
  a1[2] = v13;
  if (v3)
  {
    operator delete(v3);
  }
}

void CNNSignals::prepareLayer(CNNSignals *this, unsigned int a2, char a3)
{
  if (a3) {
    matrix<float>::resize();
  }
  matrix<float>::resize();
}

void CNNSignals::initLayer(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(a1[19] + 8 * a2) = a4;
  *(void *)(a1[25] + 8 * a2) = a5;
  *(void *)(a1[28] + 8 * a2) = a6;
  *(void *)(a1[22] + 8 * a2) = a7;
  if (!*(void *)(*(void *)(a1[25] + 8 * a2) + 8)) {
    matrix<float>::resize();
  }
  matrix<float>::resize();
}

void CNNSignals::initConvLayer(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(*a1 + 8 * a2) = a6;
  *(void *)(a1[9] + 8 * a2) = a9;
  *(void *)(a1[19] + 8 * a2) = a7;
  *(void *)(a1[25] + 8 * a2) = a8;
  *(void *)(a1[28] + 8 * a2) = a10;
  *(void *)(a1[22] + 8 * a2) = a11;
  *(void *)(a1[3] + 8 * a2) = a12;
  *(void *)(a1[6] + 8 * a2) = a13;
  if (a5) {
    matrix<float>::resize();
  }
  matrix<float>::resize();
}

void CNNSignals::initPoolLayer(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)(*a1 + 8 * a2) = a6;
  *(void *)(a1[9] + 8 * a2) = a9;
  *(void *)(a1[19] + 8 * a2) = a7;
  *(void *)(a1[25] + 8 * a2) = a8;
  *(void *)(a1[28] + 8 * a2) = a10;
  *(void *)(a1[22] + 8 * a2) = a11;
  *(void *)(a1[3] + 8 * a2) = a12;
  *(void *)(a1[6] + 8 * a2) = a13;
  if (a5) {
    matrix<float>::resize();
  }
  matrix<float>::resize();
}

void std::vector<matrix<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      unint64_t v6 = v4 - 32;
      uint64_t v7 = v4 - 32;
      uint64_t v8 = v4 - 32;
      do
      {
        uint64_t v9 = *(void (***)(char *))v8;
        v8 -= 32;
        (*v9)(v7);
        v6 -= 32;
        BOOL v10 = v7 == v2;
        uint64_t v7 = v8;
      }
      while (!v10);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<matrix<unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      unint64_t v6 = v4 - 32;
      uint64_t v7 = v4 - 32;
      uint64_t v8 = v4 - 32;
      do
      {
        uint64_t v9 = *(void (***)(char *))v8;
        v8 -= 32;
        (*v9)(v7);
        v6 -= 32;
        BOOL v10 = v7 == v2;
        uint64_t v7 = v8;
      }
      while (!v10);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<matrix<float>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 32);
    *(void *)(a1 + 16) = i - 32;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *matrix<unsigned int>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C60;
  uint64_t v2 = a1[3];
  if (v2) {
    MEMORY[0x21D44B3E0](v2, 0x1000C8052888210);
  }
  return a1;
}

void matrix<unsigned int>::~matrix(void *a1)
{
  *a1 = &unk_26C7B1C60;
  uint64_t v1 = a1[3];
  if (v1) {
    MEMORY[0x21D44B3E0](v1, 0x1000C8052888210);
  }
  JUMPOUT(0x21D44B400);
}

uint64_t std::__split_buffer<matrix<unsigned int>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 32);
    *(void *)(a1 + 16) = i - 32;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_21779ACD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21779AE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21779B024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_21779B0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21779B178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21779B224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21779E52C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x270EE5288](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.locatiouint64_t n = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
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

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7058](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.vImagePixelCount width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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
  result.size.height = v6;
  result.size.vImagePixelCount width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.vImagePixelCount width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.vImagePixelCount width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.vImagePixelCount width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.vImagePixelCount width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE7AC8](allocator, target, *(void *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return MEMORY[0x270EE9CD8](fontURL, *(void *)&scope, error);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x270EE9D30](frame);
  result.length = v2;
  result.locatiouint64_t n = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x270F06600]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x270F15BD0]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x270F06610]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.locatiouint64_t n = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSPoint NSPointFromString(NSString *aString)
{
  MEMORY[0x270EF2B80](aString);
  result.double y = v2;
  result.double x = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x270EF2BB0](aString);
  result.size.height = v4;
  result.size.vImagePixelCount width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.locatiouint64_t n = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t RectangleFinder::findCodeRectPoints(RectangleFinder *this, vImage_Buffer *a2)
{
  return MEMORY[0x270F7D2C0](this, a2);
}

void RectangleFinder::RectangleFinder(RectangleFinder *this)
{
}

uint64_t CTCLayer::setCodeMap(CTCLayer *this, const int *a2)
{
  return MEMORY[0x270F7D2D0](this, a2);
}

uint64_t CTCLayer::removeNoise()
{
  return MEMORY[0x270F7D2D8]();
}

uint64_t CTCLayer::computeScore()
{
  return MEMORY[0x270F7D2E0]();
}

uint64_t CTCLayer::injectSpaces()
{
  return MEMORY[0x270F7D2E8]();
}

uint64_t CTCLayer::setActivations()
{
  return MEMORY[0x270F7D2F0]();
}

uint64_t CTCLayer::bestPathDecoding(CTCLayer *this)
{
  return MEMORY[0x270F7D2F8](this);
}

uint64_t CTCLayer::getMaxActivations(CTCLayer *this)
{
  return MEMORY[0x270F7D300](this);
}

uint64_t CTCLayer::setCummulativeScores(CTCLayer *this)
{
  return MEMORY[0x270F7D308](this);
}

uint64_t CTCLayer::pathDecodingCTCSegment()
{
  return MEMORY[0x270F7D310]();
}

uint64_t CTCLayer::pathDecodingFixedLengthInjectSpaces(CTCLayer *this)
{
  return MEMORY[0x270F7D318](this);
}

void CTCLayer::CTCLayer(CTCLayer *this)
{
}

void CTCLayer::~CTCLayer(CTCLayer *this)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986E0]();
}

{
  return MEMORY[0x270F986F8]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F987B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x270F98BD8]();
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x270F98BE0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t adaptiveThresholdIntegralImage()
{
  return MEMORY[0x270F7D330]();
}

uint64_t applyHomograpyMatrix()
{
  return MEMORY[0x270F7D338]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

clock_t clock(void)
{
  return MEMORY[0x270ED8EE8]();
}

uint64_t correctHistogram()
{
  return MEMORY[0x270F7D340]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

uint64_t find_homography()
{
  return MEMORY[0x270F7D350]();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x270EDA278]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t normalizedPointForSize()
{
  return MEMORY[0x270F7D358]();
}

uint64_t normalizedRectForSize()
{
  return MEMORY[0x270F7D360]();
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

uint64_t unicodeToNSString()
{
  return MEMORY[0x270F7D368]();
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2E8](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}

uint64_t writeBuffer()
{
  return MEMORY[0x270F7D370]();
}

uint64_t writeBufferWithFullColor()
{
  return MEMORY[0x270F7D378]();
}