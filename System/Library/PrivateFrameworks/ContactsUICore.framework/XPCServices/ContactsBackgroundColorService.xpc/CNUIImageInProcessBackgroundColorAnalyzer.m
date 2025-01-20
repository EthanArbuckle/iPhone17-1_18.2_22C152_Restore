@interface CNUIImageInProcessBackgroundColorAnalyzer
- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 withReply:(id)a5;
@end

@implementation CNUIImageInProcessBackgroundColorAnalyzer

- (void)getBackgroundColorOnImageData:(id)a3 bitmapFormat:(id)a4 withReply:(id)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  if (v8)
  {
    v10 = CGDataProviderCreateWithCFData(v7);
    id v11 = [v8 width];
    id v12 = [v8 height];
    id v13 = [v8 bitsPerComponent];
    id v14 = [v8 bitsPerPixel];
    id v15 = [v8 bytesPerRow];
    v16 = (CGColorSpace *)[v8 colorSpace];
    if (!v16) {
      v16 = CGColorSpaceCreateDeviceRGB();
    }
    CGImageRef v17 = CGImageCreate((size_t)v11, (size_t)v12, (size_t)v13, (size_t)v14, (size_t)v15, v16, (CGBitmapInfo)[v8 bitmapInfo], v10, 0, 1, kCGRenderingIntentDefault);
    id v18 = [objc_alloc((Class)UIImage) initWithCGImage:v17];
    if (v10) {
      CFRelease(v10);
    }
    if (v17) {
      CFRelease(v17);
    }
    if (v18) {
      goto LABEL_9;
    }
LABEL_11:
    v9[2](v9, 0);
    goto LABEL_12;
  }
  id v18 = [objc_alloc((Class)UIImage) initWithData:v7];
  if (!v18) {
    goto LABEL_11;
  }
LABEL_9:
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005744;
  v19[3] = &unk_1000083B8;
  v20 = v9;
  +[CNUICoreImageDerivedColorGenerator fetchColorsForImage:v18 ciContext:0 withCompletionHandler:v19];

LABEL_12:
}

@end