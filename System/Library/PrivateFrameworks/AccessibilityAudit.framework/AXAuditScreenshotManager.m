@interface AXAuditScreenshotManager
+ (id)imageFromRemoteImageData:(id)a3 rotation:(double)a4;
+ (id)imageProcessingQueue;
+ (id)sharedManager;
- (AXAuditScreenshotManager)init;
- (BOOL)screenshotShouldFlipOutlineForTimestamp:(id)a3;
- (CGRect)_boundsForRect:(CGRect)a3 containerImageSize:(CGSize)a4 timestamp:(id)a5;
- (CGRect)_elementBoundsForIssue:(id)a3 containerImageSize:(CGSize)a4;
- (CGRect)elementBoundsInScreenShotForIssue:(id)a3;
- (CGRect)screenshotBorderFrameForTimestamp:(id)a3;
- (CGRect)screenshotDisplayBoundsForTimestamp:(id)a3;
- (NSMutableDictionary)_borderFrame;
- (NSMutableDictionary)_displayBounds;
- (NSMutableDictionary)_image;
- (NSMutableDictionary)_rotation;
- (NSMutableDictionary)_scaleFactor;
- (NSMutableDictionary)_shouldFlipOutline;
- (NSString)lastTimestamp;
- (double)screenshotRotationForTimestamp:(id)a3;
- (double)screenshotScaleFactorForTimestamp:(id)a3;
- (id)screenshotForIssue:(id)a3 elementRect:(CGRect *)a4;
- (id)screenshotHighlightingIssue:(id)a3;
- (id)screenshotImageForTimestamp:(id)a3;
- (id)screenshotImageForTimestamp:(id)a3 inRect:(CGRect)a4;
- (id)thumbnailImageOfIssue:(id)a3;
- (void)addScreenshot:(id)a3 forTimestamp:(id)a4;
- (void)addScreenshotWithInfo:(id)a3 timestamp:(id)a4 completion:(id)a5;
- (void)clear;
- (void)setLastTimestamp:(id)a3;
- (void)setScreenshotBorderFrame:(CGRect)a3 forTimestamp:(id)a4;
- (void)setScreenshotDisplayBounds:(CGRect)a3 forTimestamp:(id)a4;
- (void)setScreenshotRotation:(double)a3 forTimestamp:(id)a4;
- (void)setScreenshotScaleFactor:(double)a3 forTimestamp:(id)a4;
- (void)setScreenshotShouldFlipOutline:(BOOL)a3 forTimestamp:(id)a4;
- (void)set_borderFrame:(id)a3;
- (void)set_displayBounds:(id)a3;
- (void)set_image:(id)a3;
- (void)set_rotation:(id)a3;
- (void)set_scaleFactor:(id)a3;
- (void)set_shouldFlipOutline:(id)a3;
@end

@implementation AXAuditScreenshotManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AXAuditScreenshotManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, block);
  }
  v2 = (void *)sharedManager_instance_1;

  return v2;
}

uint64_t __41__AXAuditScreenshotManager_sharedManager__block_invoke()
{
  sharedManager_instance_1 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXAuditScreenshotManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXAuditScreenshotManager;
  v2 = [(AXAuditScreenshotManager *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_image:v3];

    v4 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_rotation:v4];

    v5 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_displayBounds:v5];

    v6 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_borderFrame:v6];

    v7 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_scaleFactor:v7];

    v8 = objc_opt_new();
    [(AXAuditScreenshotManager *)v2 set_shouldFlipOutline:v8];
  }
  return v2;
}

- (void)clear
{
  v3 = objc_opt_new();
  [(AXAuditScreenshotManager *)self set_image:v3];

  v4 = objc_opt_new();
  [(AXAuditScreenshotManager *)self set_rotation:v4];

  v5 = objc_opt_new();
  [(AXAuditScreenshotManager *)self set_displayBounds:v5];

  v6 = objc_opt_new();
  [(AXAuditScreenshotManager *)self set_borderFrame:v6];

  v7 = objc_opt_new();
  [(AXAuditScreenshotManager *)self set_scaleFactor:v7];

  id v8 = (id)objc_opt_new();
  [(AXAuditScreenshotManager *)self set_shouldFlipOutline:v8];
}

- (void)addScreenshot:(id)a3 forTimestamp:(id)a4
{
  if (a3 && a4)
  {
    id v8 = a4;
    id v6 = a3;
    v7 = [(AXAuditScreenshotManager *)self _image];
    [v7 setObject:v6 forKeyedSubscript:v8];

    [(AXAuditScreenshotManager *)self setLastTimestamp:v8];
  }
}

- (void)setScreenshotRotation:(double)a3 forTimestamp:(id)a4
{
  if (a4)
  {
    v5 = NSNumber;
    float v6 = a3;
    id v7 = a4;
    *(float *)&double v8 = v6;
    id v10 = [v5 numberWithFloat:v8];
    v9 = [(AXAuditScreenshotManager *)self _rotation];
    [v9 setObject:v10 forKeyedSubscript:v7];
  }
}

- (void)setScreenshotDisplayBounds:(CGRect)a3 forTimestamp:(id)a4
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v9 = (void *)MEMORY[0x263F08D40];
    id v10 = a4;
    objc_msgSend(v9, "valueWithRect:", x, y, width, height);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(AXAuditScreenshotManager *)self _displayBounds];
    [v11 setObject:v12 forKeyedSubscript:v10];
  }
}

- (void)setScreenshotBorderFrame:(CGRect)a3 forTimestamp:(id)a4
{
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    v9 = (void *)MEMORY[0x263F08D40];
    id v10 = a4;
    objc_msgSend(v9, "valueWithRect:", x, y, width, height);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(AXAuditScreenshotManager *)self _borderFrame];
    [v11 setObject:v12 forKeyedSubscript:v10];
  }
}

- (void)setScreenshotScaleFactor:(double)a3 forTimestamp:(id)a4
{
  if (a4)
  {
    v5 = NSNumber;
    float v6 = a3;
    id v7 = a4;
    *(float *)&double v8 = v6;
    id v10 = [v5 numberWithFloat:v8];
    v9 = [(AXAuditScreenshotManager *)self _scaleFactor];
    [v9 setObject:v10 forKeyedSubscript:v7];
  }
}

- (void)setScreenshotShouldFlipOutline:(BOOL)a3 forTimestamp:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    float v6 = NSNumber;
    id v7 = a4;
    id v9 = [v6 numberWithBool:v4];
    double v8 = [(AXAuditScreenshotManager *)self _shouldFlipOutline];
    [v8 setObject:v9 forKeyedSubscript:v7];
  }
}

- (id)screenshotImageForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _image];
  float v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (double)screenshotRotationForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _rotation];
  float v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

- (CGRect)screenshotDisplayBoundsForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _displayBounds];
  float v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x263F08670];
    double v10 = *(double *)(MEMORY[0x263F08670] + 8);
    double v12 = *(double *)(MEMORY[0x263F08670] + 16);
    double v14 = *(double *)(MEMORY[0x263F08670] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)screenshotBorderFrameForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _borderFrame];
  float v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x263F08670];
    double v10 = *(double *)(MEMORY[0x263F08670] + 8);
    double v12 = *(double *)(MEMORY[0x263F08670] + 16);
    double v14 = *(double *)(MEMORY[0x263F08670] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (double)screenshotScaleFactorForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _scaleFactor];
  float v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

- (BOOL)screenshotShouldFlipOutlineForTimestamp:(id)a3
{
  id v4 = a3;
  v5 = [(AXAuditScreenshotManager *)self _shouldFlipOutline];
  float v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (CGRect)_elementBoundsForIssue:(id)a3 containerImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 elementRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 timeStamp];

  -[AXAuditScreenshotManager _boundsForRect:containerImageSize:timestamp:](self, "_boundsForRect:containerImageSize:timestamp:", v16, v9, v11, v13, v15, width, height);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)_boundsForRect:(CGRect)a3 containerImageSize:(CGSize)a4 timestamp:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  CGFloat x = a3.origin.x;
  CGFloat v46 = a3.size.height;
  double v7 = a3.size.width;
  CGFloat y = a3.origin.y;
  id v9 = a5;
  [(AXAuditScreenshotManager *)self screenshotBorderFrameForTimestamp:v9];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [(AXAuditScreenshotManager *)self screenshotRotationForTimestamp:v9];
  double v19 = v18 * 57.2957795;
  if (v19 > 360.0 || v19 < -360.0) {
    double v19 = v19 - (double)(360 * ((int)v19 / 360));
  }
  if (v19 >= 0.0) {
    double v20 = v19;
  }
  else {
    double v20 = v19 + 360.0;
  }
  v47.origin.CGFloat x = v11;
  v47.origin.CGFloat y = v13;
  v47.size.double width = v15;
  v47.size.double height = v17;
  BOOL v21 = NSIsEmptyRect(v47);
  [(AXAuditScreenshotManager *)self screenshotDisplayBoundsForTimestamp:v9];
  double v22 = v48.size.width;
  CGFloat v23 = v48.size.height;
  if (NSIsEmptyRect(v48))
  {
    [(AXAuditScreenshotManager *)self screenshotScaleFactorForTimestamp:v9];
    double v25 = v24;
    double v26 = x;
    double v27 = v46;
    double v28 = y;
  }
  else
  {
    double v26 = x;
    double v27 = v46;
    double v28 = y;
    if ((v20 < 45.0 || v20 >= 135.0) && (v20 < 225.0 || v20 >= 315.0))
    {
      double v29 = v22;
      double v22 = v23;
    }
    else
    {
      double v29 = v23;
    }
    double v24 = width / v29;
    double v25 = height / v22;
  }
  double v30 = 0.0;
  if (v21) {
    double v31 = 0.0;
  }
  else {
    double v31 = v13;
  }
  double v32 = v28 - v31;
  if (!v21) {
    double v30 = v11;
  }
  double v33 = v26 - v30;
  if (width <= height) {
    double v34 = height;
  }
  else {
    double v34 = width;
  }
  v49.size.double height = v27 * v25;
  v49.size.double width = v7 * v24;
  v49.origin.CGFloat y = v32 * v25;
  v49.origin.CGFloat x = v33 * v24;
  NSRect v50 = NSInsetRect(v49, v34 / -330.0, v34 / -330.0);
  CGFloat v35 = v50.origin.x;
  double v36 = v50.origin.y;
  CGFloat v37 = v50.size.width;
  double v38 = v50.size.height;
  if ([(AXAuditScreenshotManager *)self screenshotShouldFlipOutlineForTimestamp:v9])
  {
    double v39 = height - v36 - v38;
  }
  else
  {
    double v39 = v36;
  }

  double v40 = v35;
  double v41 = v39;
  double v42 = v37;
  double v43 = v38;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (void)addScreenshotWithInfo:(id)a3 timestamp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(void))a5;
  CGFloat v11 = v10;
  if (v8 && v9)
  {
    double v12 = [v8 objectForKeyedSubscript:@"imageData"];
    CGFloat v13 = [v8 objectForKeyedSubscript:@"rotationRadians"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      double v14 = 1.0;
      if (objc_opt_isKindOfClass())
      {
        [v13 floatValue];
        double v14 = v15;
      }
      double v16 = +[AXAuditScreenshotManager imageProcessingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke;
      block[3] = &unk_26520D550;
      double v24 = v14;
      id v18 = v12;
      double v19 = self;
      id v20 = v9;
      id v21 = v13;
      id v22 = v8;
      CGFloat v23 = v11;
      dispatch_async(v16, block);
    }
    else
    {
      v11[2](v11);
    }
  }
  else
  {
    v10[2](v10);
  }
}

void __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke(uint64_t a1)
{
  v2 = +[AXAuditScreenshotManager imageFromRemoteImageData:*(void *)(a1 + 32) rotation:*(double *)(a1 + 80)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke_2;
  block[3] = &unk_26520D550;
  v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v8 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 80);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__AXAuditScreenshotManager_addScreenshotWithInfo_timestamp_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addScreenshot:*(void *)(a1 + 40) forTimestamp:*(void *)(a1 + 48)];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) setScreenshotRotation:*(void *)(a1 + 48) forTimestamp:*(double *)(a1 + 80)];
  }
  id v9 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"shouldFlipOutline"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(*(id *)(a1 + 32), "setScreenshotShouldFlipOutline:forTimestamp:", objc_msgSend(v9, "BOOLValue"), *(void *)(a1 + 48));
  }
  v2 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"displayNativeScale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(a1 + 32);
    [v2 floatValue];
    [v3 setScreenshotScaleFactor:*(void *)(a1 + 48) forTimestamp:v4];
  }
  v5 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"borderFrame"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 32);
    [v5 rectValue];
    objc_msgSend(v6, "setScreenshotBorderFrame:forTimestamp:", *(void *)(a1 + 48));
  }
  id v7 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"displayBounds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = *(void **)(a1 + 32);
    [v7 rectValue];
    objc_msgSend(v8, "setScreenshotDisplayBounds:forTimestamp:", *(void *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (CGRect)elementBoundsInScreenShotForIssue:(id)a3
{
  id v4 = a3;
  v5 = [v4 timeStamp];
  id v6 = [(AXAuditScreenshotManager *)self screenshotImageForTimestamp:v5];

  if (v6)
  {
    [v6 size];
  }
  else
  {
    double v7 = *MEMORY[0x263F08678];
    double v8 = *(double *)(MEMORY[0x263F08678] + 8);
  }
  double v9 = *MEMORY[0x263F08670];
  double v10 = *(double *)(MEMORY[0x263F08670] + 8);
  double v11 = *(double *)(MEMORY[0x263F08670] + 16);
  double v12 = *(double *)(MEMORY[0x263F08670] + 24);
  if (v7 > 0.0 && v8 > 0.0)
  {
    -[AXAuditScreenshotManager _elementBoundsForIssue:containerImageSize:](self, "_elementBoundsForIssue:containerImageSize:", v4);
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)screenshotForIssue:(id)a3 elementRect:(CGRect *)a4
{
  id v6 = a3;
  double v7 = [v6 timeStamp];
  double v8 = [(AXAuditScreenshotManager *)self screenshotImageForTimestamp:v7];

  if (v8)
  {
    [v8 size];
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    double v9 = *MEMORY[0x263F08678];
    double v10 = *(double *)(MEMORY[0x263F08678] + 8);
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (v9 > 0.0 && v10 > 0.0)
  {
    -[AXAuditScreenshotManager _elementBoundsForIssue:containerImageSize:](self, "_elementBoundsForIssue:containerImageSize:", v6);
    a4->origin.CGFloat x = v11;
    a4->origin.CGFloat y = v12;
    a4->size.double width = v13;
    a4->size.double height = v14;
  }
LABEL_8:

  return v8;
}

- (id)screenshotHighlightingIssue:(id)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v13.origin = (CGPoint)*MEMORY[0x263F001A8];
  v13.size = v3;
  id v4 = [(AXAuditScreenshotManager *)self screenshotForIssue:a3 elementRect:&v13];
  v5 = v4;
  if (v4)
  {
    [v4 size];
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v9 = 0;
  if (v6 > 0.0 && v8 > 0.0)
  {
    if (v6 <= v8) {
      double v6 = v8;
    }
    CGFloat v10 = v6 / 330.0;
    [v5 size];
    UIGraphicsBeginImageContext(v15);
    objc_msgSend(v5, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    CurrentContext = UIGraphicsGetCurrentContext();
    v13.origin.CGFloat y = v8 - v13.size.height - v13.origin.y;
    CGContextSetRGBStrokeColor(CurrentContext, 0.0, 0.0, 1.0, 1.0);
    CGContextStrokeRectWithWidth(CurrentContext, v13, v10);
    CGContextSaveGState(CurrentContext);
    double v9 = UIGraphicsGetImageFromCurrentImageContext();
  }

  return v9;
}

- (id)thumbnailImageOfIssue:(id)a3
{
  id v4 = a3;
  v5 = [v4 timeStamp];
  [v4 elementRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGFloat v14 = -[AXAuditScreenshotManager screenshotImageForTimestamp:inRect:](self, "screenshotImageForTimestamp:inRect:", v5, v7, v9, v11, v13);

  return v14;
}

- (id)screenshotImageForTimestamp:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (v9)
  {
    double v10 = [(AXAuditScreenshotManager *)self screenshotImageForTimestamp:v9];
    double v11 = v10;
    if (v10)
    {
      [v10 size];
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      double v13 = *MEMORY[0x263F08678];
      double v15 = *(double *)(MEMORY[0x263F08678] + 8);
    }
    double v17 = 0;
    if (v13 > 0.0 && v15 > 0.0)
    {
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      if (CGRectIsEmpty(v31)) {
        goto LABEL_11;
      }
      -[AXAuditScreenshotManager _boundsForRect:containerImageSize:timestamp:](self, "_boundsForRect:containerImageSize:timestamp:", v9, x, y, width, height, v13, v15);
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v15 - v22 - v24;
      double v26 = (CGImage *)[v11 CGImage];
      v32.origin.double x = v19;
      v32.origin.double y = v25;
      v32.size.double width = v21;
      v32.size.double height = v23;
      CGImageRef v27 = CGImageCreateWithImageInRect(v26, v32);
      if (!v27)
      {
LABEL_11:
        double v17 = 0;
      }
      else
      {
        CGImageRef v28 = v27;
        double v17 = [MEMORY[0x263F1C6B0] imageWithCGImage:v27];
        CFRelease(v28);
      }
    }
    id v16 = v17;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)imageProcessingQueue
{
  if (imageProcessingQueue_onceToken != -1) {
    dispatch_once(&imageProcessingQueue_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)imageProcessingQueue_imageProcessingQueue;

  return v2;
}

uint64_t __48__AXAuditScreenshotManager_imageProcessingQueue__block_invoke()
{
  imageProcessingQueue_imageProcessingQueue = (uint64_t)dispatch_queue_create("com.apple.axAudit.images", 0);

  return MEMORY[0x270F9A758]();
}

+ (id)imageFromRemoteImageData:(id)a3 rotation:(double)a4
{
  CGFloat v4 = -a4;
  v5 = (objc_class *)MEMORY[0x263F1C6B0];
  id v6 = a3;
  double v7 = (void *)[[v5 alloc] initWithData:v6];

  [v7 size];
  double v9 = v8;
  double v11 = v10;
  double v12 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", 0.0, 0.0, v8, v10);
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeRotation(&v23, v4);
  CGAffineTransform transform = v23;
  [v12 applyTransform:&transform];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  v25.double width = v13;
  v25.double height = v15;
  UIGraphicsBeginImageContext(v25);
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v23.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v23.c = v18;
  *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v21.a = *(_OWORD *)&v23.a;
  *(_OWORD *)&v21.c = v18;
  *(_OWORD *)&v21.tdouble x = *(_OWORD *)&v23.tx;
  CGAffineTransformTranslate(&transform, &v21, v14 * 0.5, v16 * 0.5);
  CGAffineTransform v23 = transform;
  CGAffineTransform v21 = transform;
  CGAffineTransformRotate(&transform, &v21, v4);
  CGAffineTransform v23 = transform;
  CGAffineTransform v21 = transform;
  CGAffineTransformTranslate(&transform, &v21, -(v14 * 0.5), -(v16 * 0.5));
  CGAffineTransform v23 = transform;
  CGContextConcatCTM(CurrentContext, &transform);
  objc_msgSend(v7, "drawInRect:", v14 * 0.5 + 0.0 - v9 * 0.5, v16 * 0.5 + 0.0 - v11 * 0.5, v9, v11);
  CGFloat v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (NSString)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(id)a3
{
}

- (NSMutableDictionary)_image
{
  return self->__image;
}

- (void)set_image:(id)a3
{
}

- (NSMutableDictionary)_rotation
{
  return self->__rotation;
}

- (void)set_rotation:(id)a3
{
}

- (NSMutableDictionary)_displayBounds
{
  return self->__displayBounds;
}

- (void)set_displayBounds:(id)a3
{
}

- (NSMutableDictionary)_borderFrame
{
  return self->__borderFrame;
}

- (void)set_borderFrame:(id)a3
{
}

- (NSMutableDictionary)_scaleFactor
{
  return self->__scaleFactor;
}

- (void)set_scaleFactor:(id)a3
{
}

- (NSMutableDictionary)_shouldFlipOutline
{
  return self->__shouldFlipOutline;
}

- (void)set_shouldFlipOutline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shouldFlipOutline, 0);
  objc_storeStrong((id *)&self->__scaleFactor, 0);
  objc_storeStrong((id *)&self->__borderFrame, 0);
  objc_storeStrong((id *)&self->__displayBounds, 0);
  objc_storeStrong((id *)&self->__rotation, 0);
  objc_storeStrong((id *)&self->__image, 0);

  objc_storeStrong((id *)&self->_lastTimestamp, 0);
}

@end