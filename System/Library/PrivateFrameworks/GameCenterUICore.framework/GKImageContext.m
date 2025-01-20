@interface GKImageContext
+ (id)contextDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6;
+ (id)imageDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6;
+ (id)imageFromRawPixelsAtURL:(id)a3;
- (BOOL)writeRawPixelsToURL:(id)a3 error:(id *)a4;
- (CGContext)CGContext;
- (CGSize)size;
- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5;
- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 data:(void *)a6;
- (UIImage)image;
- (double)scale;
- (void)dealloc;
- (void)setSize:(CGSize)a3;
@end

@implementation GKImageContext

+ (id)contextDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  double height = a3.height;
  double width = a3.width;
  v10 = (void (**)(id, void *))a6;
  v11 = -[GKImageContext initWithSize:scale:options:data:]([GKImageContext alloc], "initWithSize:scale:options:data:", v6, 0, width, height, a4);
  v12 = v11;
  if ((v6 & 4) != 0)
  {
    UIGraphicsPushContext([(GKImageContext *)v11 CGContext]);
    v10[2](v10, v12);
    UIGraphicsPopContext();
  }
  else
  {
    v10[2](v10, v11);
  }

  return v12;
}

+ (id)imageDrawnWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6 = objc_msgSend(a1, "contextDrawnWithSize:scale:options:usingBlock:", *(void *)&a5, a6, a3.width, a3.height, a4);
  v7 = [v6 image];

  return v7;
}

- (void)dealloc
{
  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)GKImageContext;
  [(GKImageContext *)&v3 dealloc];
}

- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5 data:(void *)a6
{
  char v9 = a5;
  double height = a3.height;
  double width = a3.width;
  v30.receiver = self;
  v30.super_class = (Class)GKImageContext;
  v13 = [(GKImageContext *)&v30 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_24;
  }
  v13->_size.double width = width;
  v13->_size.double height = height;
  if (a4 == 0.0)
  {
    uint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    a4 = v15;
  }
  v14->_scale = a4;
  float v16 = width * a4;
  LODWORD(v7) = vcvtps_s32_f32(v16);
  float v17 = height * a4;
  LODWORD(v6) = vcvtps_s32_f32(v17);
  if ((int)v7 >= 1 && (int)v6 >= 1)
  {
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    if ((v9 & 2) != 0)
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      uint32_t v21 = 0;
    }
    else
    {
      if (v9) {
        uint32_t v21 = 8198;
      }
      else {
        uint32_t v21 = 8194;
      }
      DeviceGray = CGColorSpaceCreateDeviceRGB();
    }
    v23 = CGBitmapContextCreate(a6, v7, (size_t)v6, 8uLL, AlignedBytesPerRow, DeviceGray, v21);
    CGColorSpaceRelease(DeviceGray);
    if (!v23) {
      goto LABEL_23;
    }
    if (a6)
    {
      if ((v9 & 8) == 0)
      {
LABEL_19:
        CGContextTranslateCTM(v23, 0.0, (double)(int)v6);
        CGContextScaleCTM(v23, a4, -a4);
        v24 = (CGAffineTransform *)&v29;
        double v25 = a4;
        double v26 = -a4;
LABEL_22:
        CGAffineTransformMakeScale(v24, v25, v26);
        CGContextSetBaseCTM();
LABEL_23:
        v14->_CGContext = v23;
LABEL_24:
        v19 = v14;
        goto LABEL_25;
      }
    }
    else
    {
      v31.size.double width = (double)(int)v7;
      v31.size.double height = (double)(int)v6;
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      CGContextClearRect(v23, v31);
      if ((v9 & 8) == 0) {
        goto LABEL_19;
      }
    }
    CGContextScaleCTM(v23, a4, a4);
    v24 = (CGAffineTransform *)&v28;
    double v25 = a4;
    double v26 = a4;
    goto LABEL_22;
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (GKImageContext)initWithSize:(CGSize)a3 scale:(double)a4 options:(unsigned int)a5
{
  return -[GKImageContext initWithSize:scale:options:data:](self, "initWithSize:scale:options:data:", *(void *)&a5, 0, a3.width, a3.height, a4);
}

- (UIImage)image
{
  CGImageRef Image = CGBitmapContextCreateImage(self->_CGContext);
  if (Image)
  {
    v4 = Image;
    v5 = (void *)MEMORY[0x263F1C6B0];
    [(GKImageContext *)self scale];
    uint64_t v6 = objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v4, 0);
    CGImageRelease(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (UIImage *)v6;
}

- (BOOL)writeRawPixelsToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CGContext = self->_CGContext;
  uint64_t v16 = 64181;
  int BytesPerRow = CGBitmapContextGetBytesPerRow(CGContext);
  unsigned int height = self->_size.height;
  unsigned int width = self->_size.width;
  unsigned int v18 = height;
  LODWORD(self) = self->_scale;
  int v19 = BytesPerRow;
  int v20 = (int)self;
  CGBitmapInfo BitmapInfo = CGBitmapContextGetBitmapInfo(CGContext);
  uint64_t v10 = height * self * BytesPerRow;
  v11 = [MEMORY[0x263EFF990] dataWithCapacity:v10 + 28];
  [v11 appendBytes:&v16 length:28];
  [v11 appendBytes:CGBitmapContextGetData(CGContext) length:v10];
  id v15 = 0;
  LOBYTE(v10) = [v11 writeToURL:v6 options:1 error:&v15];
  id v12 = v15;
  if ((v10 & 1) == 0)
  {
    if (!*MEMORY[0x263F40328]) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR))
    {
      -[GKImageContext writeRawPixelsToURL:error:]();
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (a4) {
LABEL_6:
  }
    *a4 = v12;
LABEL_7:

  return v12 == 0;
}

+ (id)imageFromRawPixelsAtURL:(id)a3
{
  id v3 = a3;
  id v31 = 0;
  v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:&v31];
  id v5 = v31;
  if (!v4)
  {
    char v9 = (os_log_t *)MEMORY[0x263F40308];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40308], OS_LOG_TYPE_DEBUG))
    {
      id v30 = 0;
      int v10 = [v3 checkResourceIsReachableAndReturnError:&v30];
      id v11 = v30;
      if (v10)
      {
        if (!*MEMORY[0x263F40328]) {
          id v12 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG)) {
          +[GKImageContext imageFromRawPixelsAtURL:]();
        }
      }
    }
    else
    {
      id v11 = 0;
    }

    goto LABEL_25;
  }
  if ((unint64_t)[v4 length] <= 0x23)
  {
    id v6 = (NSObject **)MEMORY[0x263F40328];
    size_t v7 = *MEMORY[0x263F40328];
    if (!*MEMORY[0x263F40328])
    {
      id v8 = (id)GKOSLoggers();
      size_t v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[GKImageContext imageFromRawPixelsAtURL:](v7, v4);
    }
LABEL_25:
    uint32_t v21 = 0;
    goto LABEL_26;
  }
  id v13 = v4;
  v14 = (_DWORD *)[v13 bytes];
  id v15 = v14;
  if (*v14 != 64181)
  {
    if (!*MEMORY[0x263F40328]) {
      id v19 = (id)GKOSLoggers();
    }
    int v20 = *MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      +[GKImageContext imageFromRawPixelsAtURL:v20];
    }
    goto LABEL_25;
  }
  uint64_t v16 = v14 + 1;
  if (v14[1])
  {
    if (!*MEMORY[0x263F40328]) {
      id v17 = (id)GKOSLoggers();
    }
    unsigned int v18 = *MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      +[GKImageContext imageFromRawPixelsAtURL:v18];
    }
    goto LABEL_25;
  }
  if ([v13 length] < (unint64_t)(v14[5] * v14[3] * v14[4]) + 28)
  {
    if (!*MEMORY[0x263F40328]) {
      id v23 = (id)GKOSLoggers();
    }
    v24 = (void *)*MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      +[GKImageContext imageFromRawPixelsAtURL:](v24, v13);
    }
    goto LABEL_25;
  }
  double v25 = (void *)MEMORY[0x263F1C6B0];
  double v26 = objc_msgSend(v13, "subdataWithRange:", 28, objc_msgSend(v13, "length") - 28);
  LODWORD(v27) = v15[2];
  LODWORD(v28) = v15[3];
  LODWORD(v29) = v15[5];
  uint32_t v21 = objc_msgSend(v25, "_gkImageWithRawData:size:scale:rowBytes:bitmapInfo:", v26, v15[4], v15[6], (double)v27, (double)v28, (double)v29);

LABEL_26:
  return v21;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (void)writeRawPixelsToURL:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_22600C000, v0, v1, "cannot write raw pixels:%@ to URL:%@");
}

+ (void)imageFromRawPixelsAtURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_22600C000, v0, OS_LOG_TYPE_DEBUG, "cannot read raw pixels:%@ for image at URL:%@", v1, 0x16u);
}

+ (void)imageFromRawPixelsAtURL:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_22600C000, v3, OS_LOG_TYPE_DEBUG, "image header size way too small:%lu from image at URL:%@", v4, 0x16u);
}

+ (void)imageFromRawPixelsAtURL:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_22600C000, v3, OS_LOG_TYPE_ERROR, "image header size can't contain full image:%lu for image at URL:%@", v4, 0x16u);
}

+ (void)imageFromRawPixelsAtURL:(os_log_t)log .cold.4(int *a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22600C000, log, OS_LOG_TYPE_ERROR, "unknown image version:%d for image at URL:%@", (uint8_t *)v4, 0x12u);
}

+ (void)imageFromRawPixelsAtURL:(NSObject *)a3 .cold.5(unsigned int *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_22600C000, a2, a3, "unknown magic value:%lXfor image at URL:%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end