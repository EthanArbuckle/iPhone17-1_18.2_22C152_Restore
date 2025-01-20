@interface MCLImageView
+ (id)bitmapImage:(id)a3;
- (void)backgroundDecompressImage;
- (void)didMoveToWindow;
- (void)setImage:(id)a3;
- (void)setImageDelayed:(id)a3;
@end

@implementation MCLImageView

- (void)didMoveToWindow
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)MCLImageView;
  [(MCLImageView *)&v4 didMoveToWindow];
  id v2 = (id)[(MCLImageView *)v6 window];
  BOOL v3 = 0;
  if (v2) {
    BOOL v3 = v6->_image != 0;
  }

  if (v3) {
    [(MCLImageView *)v6 setImageDelayed:v6->_image];
  }
}

- (void)setImageDelayed:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = dispatch_get_global_queue(-2, 0);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __32__MCLImageView_setImageDelayed___block_invoke;
  v8 = &unk_26485AC20;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0);
}

void __32__MCLImageView_setImageDelayed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained backgroundDecompressImage];
}

- (void)backgroundDecompressImage
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = self->_image;
  if (v12[0])
  {
    CGSizeMake();
    CGSize v10 = v14;
    UIGraphicsBeginImageContext(v14);
    objc_msgSend(v12[0], "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    UIGraphicsEndImageContext();
    queue = MEMORY[0x263EF83A0];
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = __41__MCLImageView_backgroundDecompressImage__block_invoke;
    v7 = &unk_26485AA40;
    id v8 = v12[0];
    id v9 = v13;
    dispatch_async(queue, &v3);

    objc_storeStrong((id *)&v9, 0);
    objc_storeStrong(&v8, 0);
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }
  objc_storeStrong(v12, 0);
}

uint64_t __41__MCLImageView_backgroundDecompressImage__block_invoke(uint64_t result)
{
  uint64_t v2 = result;
  uint64_t v5 = result;
  uint64_t v4 = result;
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 504))
  {
    objc_storeStrong((id *)(*(void *)(result + 40) + 504), 0);
    objc_msgSend(*(id *)(v2 + 40), "willChangeValueForKey:");
    uint64_t v1 = *(void *)(v2 + 32);
    v3.receiver = *(id *)(v2 + 40);
    v3.super_class = (Class)MCLImageView;
    objc_msgSendSuper2(&v3, sel_setImage_, v1);
    [*(id *)(v2 + 40) didChangeValueForKey:@"image"];
    return [*(id *)(v2 + 40) setNeedsLayout];
  }
  return result;
}

- (void)setImage:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_image, location[0]);
  if (location[0])
  {
    id v3 = (id)[(MCLImageView *)v7 window];
    BOOL v4 = v3 == 0;

    if (!v4) {
      [(MCLImageView *)v7 setImageDelayed:location[0]];
    }
  }
  else
  {
    v5.receiver = v7;
    v5.super_class = (Class)MCLImageView;
    [(MCLImageView *)&v5 setImage:0];
  }
  objc_storeStrong(location, 0);
}

+ (id)bitmapImage:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = (dispatch_once_t *)&bitmapImage__onceToken;
  id v18 = 0;
  objc_storeStrong(&v18, &__block_literal_global_4);
  if (*v19 != -1) {
    dispatch_once(v19, v18);
  }
  objc_storeStrong(&v18, 0);
  CGImageRef v16 = (CGImageRef)[location[0] CGImage];
  CGBitmapInfo v15 = CGImageGetBitmapInfo(v16) & 0x1F;
  BOOL v14 = 0;
  BOOL v6 = 1;
  if (v15 != 4)
  {
    BOOL v6 = 1;
    if (v15 != 3)
    {
      BOOL v6 = 1;
      if (v15 != 2) {
        BOOL v6 = v15 == 1;
      }
    }
  }
  BOOL v14 = v6;
  size_t Width = CGImageGetWidth(v16);
  size_t Height = CGImageGetHeight(v16);
  uint64_t v11 = 8;
  CGContextRef v10 = 0;
  if (v6) {
    int v3 = 2;
  }
  else {
    int v3 = 6;
  }
  CGContextRef v10 = CGBitmapContextCreate(0, Width, Height, 8uLL, 0, (CGColorSpaceRef)bitmapImage__rgbColorSpaceRef, v3 | 0x2000u);
  CGRectMake();
  CGRect rect = v21;
  CGContextDrawImage(v10, v21, v16);
  CGImageRef image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  id v7 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:image];
  CGImageRelease(image);
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

CGColorSpaceRef __28__MCLImageView_bitmapImage___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  bitmapImage__rgbColorSpaceRef = (uint64_t)result;
  return result;
}

- (void).cxx_destruct
{
}

@end