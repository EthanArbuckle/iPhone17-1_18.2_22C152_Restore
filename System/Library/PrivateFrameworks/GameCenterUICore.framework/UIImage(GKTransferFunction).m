@interface UIImage(GKTransferFunction)
+ (id)_gkImageWithRawData:()GKTransferFunction size:scale:rowBytes:bitmapInfo:;
- (void)_gkReadAtSize:()GKTransferFunction ARGBHostEndianBytes:;
@end

@implementation UIImage(GKTransferFunction)

+ (id)_gkImageWithRawData:()GKTransferFunction size:scale:rowBytes:bitmapInfo:
{
  id v13 = a6;
  CGDataProviderRef v14 = CGDataProviderCreateWithData(v13, (const void *)[v13 bytes], objc_msgSend(v13, "length"), (CGDataProviderReleaseDataCallback)GKImageContextCGDataProviderReleaseDataCallback);
  if (v14)
  {
    v15 = v14;
    CFRetain(v13);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CGImageRef v17 = CGImageCreate((unint64_t)(a1 * a3), (unint64_t)(a2 * a3), 8uLL, 0x20uLL, a7, DeviceRGB, a8, v15, 0, 1, kCGRenderingIntentDefault);
    v18 = [MEMORY[0x263F1C6B0] imageWithCGImage:v17 scale:0 orientation:a3];
    CFRelease(DeviceRGB);
    CFRelease(v17);
    CFRelease(v15);
  }
  else
  {
    if (!*MEMORY[0x263F40328]) {
      id v19 = (id)GKOSLoggers();
    }
    v20 = *MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      +[UIImage(GKTransferFunction) _gkImageWithRawData:size:scale:rowBytes:bitmapInfo:](v20);
    }
    v18 = 0;
  }

  return v18;
}

- (void)_gkReadAtSize:()GKTransferFunction ARGBHostEndianBytes:
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__UIImage_GKTransferFunction___gkReadAtSize_ARGBHostEndianBytes___block_invoke;
  v11[3] = &unk_26478A3D8;
  double v13 = a2;
  double v14 = a3;
  v11[4] = a1;
  id v12 = v8;
  id v9 = v8;
  id v10 = +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 0, v11, a2, a3, 1.0);
}

+ (void)_gkImageWithRawData:()GKTransferFunction size:scale:rowBytes:bitmapInfo:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22600C000, log, OS_LOG_TYPE_ERROR, "can't allocate data provider", v1, 2u);
}

@end