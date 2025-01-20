@interface ZhangHeFilter
+ (id)zhangHeFilter:(id)a3;
@end

@implementation ZhangHeFilter

+ (id)zhangHeFilter:(id)a3
{
  v3 = (CGImage *)objc_msgSend(a3, "dc_CGImage");
  unint64_t Width = CGImageGetWidth(v3);
  size_t Height = CGImageGetHeight(v3);
  size_t BytesPerRow = CGImageGetBytesPerRow(v3);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v8 = CGBitmapContextCreate(0, Width, Height, 8uLL, BytesPerRow, DeviceGray, 0);
  int v9 = CGBitmapContextGetBytesPerRow(v8);
  Data = CGBitmapContextGetData(v8);
  if (Height)
  {
    int v11 = 0;
    LODWORD(v12) = 0;
    do
    {
      if (Width)
      {
        int v13 = 0;
        unsigned int v14 = 0;
        unsigned int v15 = 1;
        do
        {
          if (v12 % 0x96) {
            BOOL v16 = v13 + 150 * (v14 / 0x96) == 0;
          }
          else {
            BOOL v16 = 1;
          }
          int v17 = !v16;
          Data[v11 + v15 - 1] = v17 << 31 >> 31;
          ++v14;
          --v13;
        }
        while (Width > v15++);
      }
      size_t v12 = (v12 + 1);
      v11 += v9;
    }
    while (Height > v12);
  }
  Image = CGBitmapContextCreateImage(v8);
  v20 = objc_msgSend(MEMORY[0x263F1C6B0], "dc_imageWithCGImage:", Image);
  CGContextRelease(v8);
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceGray);

  return v20;
}

@end