@interface CUINamedLayerStack
+ (CGImage)createRadiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4;
+ (vImage_Buffer)_doRadiosityBlurOnPixelBuffer:(SEL)a3 bytesPerRow:(void *)a4 bitsPerPixel:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 scaleFactor:(unint64_t)a8 usesGaussianBlur:(unint64_t)a9 adjustedSize:(BOOL *)a10;
+ (void)radiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4 completionHandler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGImage)flattenedImage;
- (CGImage)radiosityImage;
- (CGSize)size;
- (CUINamedLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6;
- (NSArray)layers;
- (id)layerImageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setLayers:(id)a3;
@end

@implementation CUINamedLayerStack

- (CUINamedLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6
{
  id v7 = a3;
  v68.receiver = self;
  v68.super_class = (Class)CUINamedLayerStack;
  v8 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v68, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v9 = [(CUINamedLookup *)v8 _rendition];
  if ((id)[(CUIThemeRendition *)v9 type] == (id)1002)
  {
    if (!v7)
    {
      [(CUINamedLookup *)v8 setName:[(CUIThemeRendition *)v9 name]];
      id v7 = [(CUIThemeRendition *)v9 name];
    }
    v60 = v8;
    v62 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = [(CUIThemeRendition *)v9 layerReferences];
    id v16 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v65;
      while (2)
      {
        id v20 = v7;
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v23 = (*((uint64_t (**)(id, id))a6 + 2))(a6, [v22 referenceKey]);
          if (!v23)
          {
            [v22 referenceKey];
            id v7 = v20;
            _CUILog(4, (uint64_t)"CoreUI: Unable to resolve layer reference for '%@' name '%@' layerRef referenceKey '%@'", v28, v29, v30, v31, v32, v33, (uint64_t)v22);
            goto LABEL_23;
          }
          v24 = [[CUINamedLayerImage alloc] initWithName:+[NSString stringWithFormat:@"%@[%ld]", v20, (char *)i + v18 + 1] usingRenditionKey:v23 fromTheme:a5];
          if ([(CUINamedLookup *)v24 _rendition])
          {
            [v22 frame];
            -[CUINamedLayerImage setFrame:](v24, "setFrame:");
            [v22 opacity];
            if (v25 < 1.0)
            {
              [(CUINamedLayerImage *)v24 opacity];
              if (v26 == 1.0)
              {
                [v22 opacity];
                -[CUINamedLayerImage setOpacity:](v24, "setOpacity:");
              }
            }
            if ((int)[v22 blendMode] >= 1 && !-[CUINamedLayerImage blendMode](v24, "blendMode")) {
              -[CUINamedLayerImage setBlendMode:](v24, "setBlendMode:", [v22 blendMode]);
            }
            -[CUINamedLayerImage setFixedFrame:](v24, "setFixedFrame:", [v22 fixedFrame]);
            [(NSArray *)v62 addObject:v24];
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
        v18 += (uint64_t)i;
        id v7 = v20;
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_23:
    v27 = v60;
    v60->_layers = v62;
    v34 = objc_alloc_init(CUIRenditionKey);
    [(CUIRenditionKey *)v34 setThemeElement:[(CUIRenditionKey *)[(CUINamedLookup *)v60 key] themeElement]];
    [(CUIRenditionKey *)v34 setThemePart:208];
    [(CUIRenditionKey *)v34 setThemeIdentifier:[(CUIRenditionKey *)[(CUINamedLookup *)v60 key] themeIdentifier]];
    uint64_t v35 = (*((uint64_t (**)(id, CUIRenditionKey *))a6 + 2))(a6, v34);
    if (v35)
    {
      v42 = (void *)v35;
      unint64_t v43 = [(CUINamedLookup *)v60 storageRef];
      v45 = (void *)_LookupStructuredThemeProvider(v43, v44);
      id v46 = objc_msgSend(v45, "copyLookupKeySignatureForKey:", objc_msgSend(v42, "keyList"));
      v60->_flattenedImageRendition = (CUIThemeRendition *)objc_msgSend(v45, "renditionWithKey:usingKeySignature:", objc_msgSend(v42, "keyList"), v46);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve flattened image for layer stack %@", v36, v37, v38, v39, v40, v41, (uint64_t)v60);
    }

    v8 = objc_alloc_init(CUIRenditionKey);
    [(CUINamedLayerStack *)v8 setThemeElement:[(CUIRenditionKey *)[(CUINamedLookup *)v60 key] themeElement]];
    [(CUINamedLayerStack *)v8 setThemePart:209];
    [(CUINamedLayerStack *)v8 setThemeIdentifier:[(CUIRenditionKey *)[(CUINamedLookup *)v60 key] themeIdentifier]];
    uint64_t v47 = (*((uint64_t (**)(id, CUINamedLayerStack *))a6 + 2))(a6, v8);
    if (v47)
    {
      v54 = (void *)v47;
      unint64_t v55 = [(CUINamedLookup *)v60 storageRef];
      v57 = (void *)_LookupStructuredThemeProvider(v55, v56);
      id v58 = objc_msgSend(v57, "copyLookupKeySignatureForKey:", objc_msgSend(v54, "keyList"));
      v60->_radiosityImageRendition = (CUIThemeRendition *)objc_msgSend(v57, "renditionWithKey:usingKeySignature:", objc_msgSend(v54, "keyList"), v58);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve radiosity image for layer stack %@", v48, v49, v50, v51, v52, v53, (uint64_t)v7);
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: Attempting to create named layer stack '%@' from inappropriate rendition type: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    v27 = 0;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CUINamedLayerStack;
  if (!-[CUINamedLookup isEqual:](&v8, sel_isEqual_)) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  unsigned int v5 = -[NSArray isEqual:](-[CUINamedLayerStack layers](self, "layers"), "isEqual:", [a3 layers]);
  if (v5)
  {
    id v6 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] type];
    if (v6 == objc_msgSend(objc_msgSend(a3, "_rendition"), "type"))
    {
      LOBYTE(v5) = 1;
      return v5;
    }
LABEL_6:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)CUINamedLayerStack;
  unint64_t v3 = [(CUINamedLookup *)&v14 hash];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CUINamedLayerStack *)self layers];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 *= 2654435769 * (void)[*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) hash];
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (vImage_Buffer)_doRadiosityBlurOnPixelBuffer:(SEL)a3 bytesPerRow:(void *)a4 bitsPerPixel:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 scaleFactor:(unint64_t)a8 usesGaussianBlur:(unint64_t)a9 adjustedSize:(BOOL *)a10
{
  uint64_t v18 = getenv("CoreUI_RADIOSITY_BLUR_METHOD");
  if (v18) {
    BOOL v19 = strncasecmp(v18, "downscale", 9uLL) != 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (a10) {
    *a10 = v19;
  }
  if (v19)
  {
    size_t v65 = a5;
    long long v66 = (char *)a4;
    if (a11)
    {
      a11->width = (double)a7;
      a11->height = (double)a8;
    }
    unint64_t v64 = a9;
    vImagePixelCount v20 = 40 * a9;
    double v21 = (double)(40 * a9) * 0.5;
    uint64_t v22 = 0;
    double v23 = 1.0 / (v21 * 2.50662827);
    double v24 = v21 * (v21 + v21);
    double v25 = (double *)malloc_type_malloc((320 * a9) | 8, 0xABE799DCuLL);
    uint64x2_t v26 = (uint64x2_t)xmmword_1A139EEE0;
    uint64x2_t v67 = (uint64x2_t)vdupq_n_s64(40 * a9);
    do
    {
      *(uint64x2_t *)kernel = v26;
      int32x2_t v71 = vmovn_s64((int64x2_t)vcgeq_u64(v67, v26));
      double v69 = exp(-(double)(unint64_t)(v22 * v22) / v24);
      long double v27 = exp(-(double)(unint64_t)((v22 + 1) * (v22 + 1)) / v24);
      v28.f64[0] = v69;
      v28.f64[1] = v27;
      if (v71.i8[0]) {
        v25[v22] = v23 * v69;
      }
      if (v71.i8[4]) {
        v25[v22 + 1] = vmuld_lane_f64(v23, v28, 1);
      }
      v22 += 2;
      uint64x2_t v26 = (uint64x2_t)vaddq_s64(*(int64x2_t *)kernel, vdupq_n_s64(2uLL));
    }
    while (((40 * a9) | 2) != v22);
    double v29 = *v25;
    if (v20)
    {
      uint64_t v30 = v25 + 1;
      unint64_t v31 = 40 * a9;
      uint64_t v32 = (char *)a4;
      do
      {
        double v33 = *v30++;
        double v29 = v29 + v33 * 2.0;
        --v31;
      }
      while (v31);
    }
    else
    {
      uint64_t v32 = (char *)a4;
    }
    unint64_t v49 = a6 >> 3;
    uint64_t v50 = 80 * v64;
    double v51 = 16384.0 / v29;
    uint64_t v52 = (int16_t *)malloc_type_malloc((160 * v64) | 2, 0x952EE1DBuLL);
    v52[v20] = (int)(v51 * *v25);
    if (v20)
    {
      uint64_t v53 = &v52[40 * v64 + 1];
      v54 = v25 + 1;
      vImagePixelCount v55 = v20;
      do
      {
        double v56 = *v54++;
        int v57 = (int)(v51 * v56);
        *v53++ = v57;
        v52[--v55] = v57;
      }
      while (v55);
    }
    kernelb = v52;
    v72 = v25;
    vImagePixelCount v58 = v50 + a7;
    size_t v59 = (v50 + a7) * v49;
    v60 = (char *)malloc_type_malloc(v59, 0x76F7D70uLL);
    size_t v61 = v49 * a7;
    src.data = v60;
    src.height = 1;
    src.width = v58;
    src.rowBytes = v59;
    v70 = malloc_type_malloc(v49 * a7 * a8, 0x730010ADuLL);
    dest.data = v70;
    dest.height = 1;
    dest.width = a7;
    dest.rowBytes = v49 * a7;
    bzero(v60, v20 * v49);
    bzero(&v60[(v20 + a7) * v49], v20 * v49);
    if (a8)
    {
      v62 = &v60[v20 * v49];
      unint64_t v68 = a8;
      uint32_t v63 = (2 * v20) | 1;
      do
      {
        memcpy(v62, v32, v61);
        vImageConvolve_ARGB8888(&src, &dest, 0, v20, 0, kernelb, 1u, (2 * v20) | 1, 0x4000, 0, 0x14u);
        dest.data = (char *)dest.data + v61;
        v32 += v65;
        --a8;
      }
      while (a8);
      uint64_t v32 = v66;
      a8 = v68;
    }
    else
    {
      uint32_t v63 = (2 * v20) | 1;
    }
    src.data = v70;
    src.height = a8;
    src.width = a7;
    src.rowBytes = v61;
    dest.data = v32;
    dest.height = a8;
    dest.width = a7;
    dest.rowBytes = v65;
    vImageConvolve_ARGB8888(&src, &dest, 0, 0, 0, kernelb, v63, 1u, 0x4000, 0, 0x14u);
    free(v70);
    free(v60);
    free(kernelb);
    free(v72);
    *(_OWORD *)&retstr->data = 0u;
    *(_OWORD *)&retstr->width = 0u;
  }
  else
  {
    retstr->data = 0;
    src.width = a7;
    src.rowBytes = a5;
    int v34 = 3;
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)kernela = _Q0;
    src.data = a4;
    src.height = a8;
    do
    {
      uint64x2_t v40 = vcvtq_u64_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(*(uint64x2_t *)&src.height), *(float64x2_t *)kernela)))));
      *(uint64x2_t *)&retstr->height = v40;
      retstr->rowBytes = 4 * v40.i64[1];
      retstr->data = malloc_type_malloc(4 * v40.i64[1] * v40.i64[0], 0x85203C46uLL);
      result = (vImage_Buffer *)vImageScale_ARGB8888(&src, retstr, 0, 0);
      if (result) {
        _CUILog(4, (uint64_t)"CoreUI -- radiosity downscale vImage error: %ld", v42, v43, v44, v45, v46, v47, (uint64_t)result);
      }
      *(_OWORD *)&src.height = *(_OWORD *)&retstr->height;
      src.rowBytes = retstr->rowBytes;
      if (v34 != 3) {
        free(src.data);
      }
      src.data = retstr->data;
      --v34;
    }
    while (v34);
    if (a11)
    {
      int8x16_t v48 = (int8x16_t)vcvtq_f64_u64(*(uint64x2_t *)&retstr->height);
      *(int8x16_t *)a11 = vextq_s8(v48, v48, 8uLL);
    }
  }
  return result;
}

- (CGSize)size
{
  id v2 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] metrics];
  [v2 imageSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)layerImageAtIndex:(unint64_t)a3
{
  double v4 = [(CUINamedLayerStack *)self layers];
  return [(NSArray *)v4 objectAtIndexedSubscript:a3];
}

- (CGImage)flattenedImage
{
  return [(CUIThemeRendition *)self->_flattenedImageRendition unslicedImage];
}

- (CGImage)radiosityImage
{
  return [(CUIThemeRendition *)self->_radiosityImageRendition unslicedImage];
}

+ (CGImage)createRadiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4
{
  double v7 = (double)a4 * 40.0;
  double Width = (double)CGImageGetWidth(a3);
  double Height = (double)CGImageGetHeight(a3);
  double v10 = Width + v7 * 2.0;
  double v11 = Height + v7 * 2.0;
  long long v12 = [[CSIBitmapWrapper alloc] initWithPixelWidth:v10 pixelHeight:v11];
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceIsWideGamutRGB(ColorSpace)) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 1;
  }
  [(CSIBitmapWrapper *)v12 setColorSpaceID:v14];
  [(CSIBitmapWrapper *)v12 setPixelFormat:1095911234];
  [(CSIBitmapWrapper *)v12 setSourceAlphaInfo:2];
  uint64_t v15 = [(CSIBitmapWrapper *)v12 bitmapContext];
  v32.origin.x = v7;
  v32.origin.y = v7;
  v32.size.width = Width;
  v32.size.height = Height;
  CGContextDrawImage(v15, v32, a3);
  Data = CGBitmapContextGetData(v15);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v15);
  size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(v15);
  char v31 = 1;
  CGSize v30 = CGSizeZero;
  memset(v29, 0, sizeof(v29));
  if (a1
    && (int v19 = BitsPerPixel,
        [a1 _doRadiosityBlurOnPixelBuffer:Data bytesPerRow:BytesPerRow bitsPerPixel:BitsPerPixel width:(unint64_t)v10 height:(unint64_t)v11 scaleFactor:a4 usesGaussianBlur:&v31 adjustedSize:&v30], !v31))
  {
    int v28 = 0;
    v23[0] = 8;
    v23[1] = v19;
    CGColorSpaceRef v24 = CGImageGetColorSpace(a3);
    int v25 = 8194;
    uint64_t v27 = 0;
    uint64_t v26 = 0;
    CGImageRef Image = (CGImageRef)MEMORY[0x1A6231B60](v29, v23, 0, 0, 512, 0);
  }
  else
  {
    CGImageRef Image = CGBitmapContextCreateImage(v15);
  }
  double v21 = Image;

  return v21;
}

+ (void)radiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4 completionHandler:(id)a5
{
  if (__onceToken_0 == -1)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    dispatch_once(&__onceToken_0, &__block_literal_global_14);
    if (!a3) {
      return;
    }
  }
  CGImageRetain(a3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5A58BA8;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = a1;
  v9[5] = a5;
  dispatch_async((dispatch_queue_t)__dispatchQueue, v9);
}

dispatch_queue_t __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CoreUI.NamedLayerStackQueue", 0);
  __dispatchQueue = (uint64_t)result;
  return result;
}

void __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) createRadiosityImageWithImage:*(void *)(a1 + 48) displayScale:*(void *)(a1 + 56)];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_3;
  block[3] = &unk_1E5A58B80;
  uint64_t v3 = *(void *)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  block[5] = v2;
  block[6] = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 40));
  id v2 = *(CGImage **)(a1 + 48);
  CGImageRelease(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUINamedLayerStack;
  [(CUINamedLookup *)&v3 dealloc];
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

@end