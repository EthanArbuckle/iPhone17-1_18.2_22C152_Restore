@interface JFXMatting
+ (BOOL)_defaultMatteGeneratorPrefersDepth;
+ (BOOL)canMatteWithANE;
+ (BOOL)defaultMatteGeneratorPrefersDepth;
+ (BOOL)isCVASegMattingSPIWorking;
+ (CGSize)mattingDepthInputSize;
+ (Class)defaultMatteGeneratorClass;
+ (id)defaultMatteGenerator:(id)a3;
+ (id)depthDataForCVPixelBuffer:(__CVBuffer *)a3;
+ (void)postNotification:(unint64_t)a3;
- (BOOL)isValidForCameraFrameSet:(id)a3;
- (BOOL)ready;
- (id)initForFrameSet:(id)a3;
- (void)setReady:(BOOL)a3;
@end

@implementation JFXMatting

+ (void)postNotification:(unint64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__JFXMatting_postNotification___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __31__JFXMatting_postNotification___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"kMattingStatusWarning";
  v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"kMattingStatusWarning" object:0 userInfo:v2];
}

+ (id)depthDataForCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v16 = 0;
    goto LABEL_14;
  }
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v8 = PixelFormatType;
  if (PixelFormatType == 1717855600 || PixelFormatType == 1751410032)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    v10 = [NSNumber numberWithUnsignedLong:Width];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0F590]];

    v11 = [NSNumber numberWithUnsignedLong:Height];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F0F460]];

    v12 = [NSNumber numberWithUnsignedLong:BytesPerRow];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F0F098]];

    v13 = [NSNumber numberWithUnsignedInt:v8];
    [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x263F0F4E8]];

    CVPixelBufferLockBaseAddress(a3, 1uLL);
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    v15 = [MEMORY[0x263EFF8F8] dataWithBytes:CVPixelBufferGetBaseAddress(a3) length:BytesPerRow * Height];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F0EF88]];

    [v14 setObject:v9 forKeyedSubscript:*MEMORY[0x263F0EF90]];
    id v20 = 0;
    v16 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v14 error:&v20];
    id v17 = v20;
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    if (!v17)
    {

      goto LABEL_13;
    }
    v18 = JFXLog_matting();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v22 = v17;
      _os_log_impl(&dword_234C41000, v18, OS_LOG_TYPE_DEFAULT, "Error: failed to create depthdata. %@", buf, 0xCu);
    }

    v9 = v16;
  }
  else
  {
    v9 = JFXLog_matting();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v22 = BYTE3(v8);
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = WORD1(v8);
      __int16 v23 = 1024;
      unsigned int v24 = v8 >> 8;
      __int16 v25 = 1024;
      int v26 = v8;
      _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "Error: unexpected depth format: %c%c%c%c", buf, 0x1Au);
    }
  }
  v16 = 0;
LABEL_13:

LABEL_14:
  return v16;
}

+ (BOOL)isCVASegMattingSPIWorking
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__JFXMatting_isCVASegMattingSPIWorking__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isCVASegMattingSPIWorking_onceToken != -1) {
    dispatch_once(&isCVASegMattingSPIWorking_onceToken, block);
  }
  return isCVASegMattingSPIWorking_working;
}

void __39__JFXMatting_isCVASegMattingSPIWorking__block_invoke()
{
  +[JFXRGBDMatte mattingDepthInputSize];
  int v1 = (int)v0;
  int v3 = (int)v2;
  CVPixelBufferRef pixelBufferOut = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CVPixelBufferRef v12 = 0;
  memset(&v10, 0, sizeof(v10));
  CMTimeMake(&v10.duration, 1, 30);
  v10.presentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  v10.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x500uLL, 0x2D0uLL, 0x34323076u, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(v4, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateReadyWithImageBuffer(v4, pixelBufferOut, formatDescriptionOut, &v10, &sampleBufferOut);
  CVPixelBufferCreate(v4, v1, v3, 0x66646570u, 0, &v12);
  v5 = [(id)objc_opt_class() depthDataForCVPixelBuffer:v12];
  CVPixelBufferRelease(v12);
  CVPixelBufferRelease(pixelBufferOut);
  id v6 = objc_alloc(MEMORY[0x263F61228]);
  v7 = (void *)[v6 initWithSampleBuffer:sampleBufferOut];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F61258]) initWithColorBuffer:v7 depthData:v5 metadata:0];
  if (v8)
  {
    id v9 = [[JFXCVASegMatting alloc] initForFrameSet:v8];
    isCVASegMattingSPIWorking_working = [v9 ready];
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
}

+ (Class)defaultMatteGeneratorClass
{
  double v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 objectForKey:@"JFXMattingClassAutoSelectionPref"];

  if (v3)
  {
    CFAllocatorRef v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 integerForKey:@"JFXMattingClassAutoSelectionPref"];
  }
  v5 = objc_opt_class();
  return (Class)v5;
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = +[JFXMatting defaultMatteGeneratorClass];
  [(objc_class *)v2 mattingDepthInputSize];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)canMatteWithANE
{
  if (canMatteWithANE_onceToken != -1) {
    dispatch_once(&canMatteWithANE_onceToken, &__block_literal_global_61);
  }
  return canMatteWithANE_hasAppleNeuralEngine;
}

uint64_t __29__JFXMatting_canMatteWithANE__block_invoke()
{
  int v6 = 0;
  size_t v5 = 4;
  uint64_t result = sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  char v1 = 0;
  if (v6 <= 747742333)
  {
    BOOL v2 = v6 == -1829029944;
    int v3 = -400654602;
  }
  else
  {
    BOOL v2 = v6 == 747742334 || v6 == 933271106;
    int v3 = 1741614739;
  }
  if (!v2 && v6 != v3) {
    char v1 = 1;
  }
  canMatteWithANE_hasAppleNeuralEngine = v1;
  return result;
}

+ (BOOL)defaultMatteGeneratorPrefersDepth
{
  BOOL v2 = (void *)[a1 defaultMatteGeneratorClass];
  return [v2 _defaultMatteGeneratorPrefersDepth];
}

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

+ (id)defaultMatteGenerator:(id)a3
{
  id v4 = a3;
  size_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "defaultMatteGeneratorClass")), "initForFrameSet:", v4);

  return v5;
}

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXMatting;
  size_t v5 = [(JFXMatting *)&v11 init];
  if (v5)
  {
    int v6 = [v4 colorImageBuffer];
    [v6 size];
    v5->_colorBufferSize.width = v7;
    v5->_colorBufferSize.height = v8;

    id v9 = [v4 metadataObjectForKey:*MEMORY[0x263F61650]];
    v5->_cameraLocation = [v9 cameraPosition];
  }
  return v5;
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() defaultMatteGeneratorClass];
  if (objc_opt_isKindOfClass())
  {
    int64_t cameraLocation = self->_cameraLocation;
    int v6 = [v4 metadataObjectForKey:*MEMORY[0x263F61650]];
    if (cameraLocation == [v6 cameraPosition])
    {
      CGFloat v7 = [v4 colorImageBuffer];
      [v7 size];
      BOOL v10 = self->_colorBufferSize.height == v9 && self->_colorBufferSize.width == v8;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

@end