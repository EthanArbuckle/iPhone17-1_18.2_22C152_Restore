@interface PKImageRenderer
+ (CGImage)createJPEGCopyFrom:(CGImage *)a3 compressionQuality:(double)a4;
+ (void)_fuzzTestUnzippedData:(id)a3;
- (BOOL)invertColors;
- (BOOL)sixChannelBlending;
- (BOOL)synchronous;
- (CGSize)size;
- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4;
- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5;
- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6;
- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5;
- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5 renderQueue:(id)a6;
- (PKMetalRendererController)rendererController;
- (double)scale;
- (id)initSyncWithSize:(CGSize)a3 scale:(double)a4;
- (int64_t)cancelCount;
- (void)_renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6;
- (void)buildStrokeRenderCacheForDrawing:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6;
- (void)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6;
- (void)renderDrawing:(id)a3 completion:(id)a4;
- (void)renderStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6;
- (void)resume;
- (void)setCancelCount:(int64_t)a3;
- (void)setInvertColors:(BOOL)a3;
- (void)setRendererController:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setupWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6 synchronous:(BOOL)a7;
- (void)sixChannelCGRenderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6;
- (void)sixChannelPDFRenderDrawing:(id)a3 context:(CGContext *)a4 clippedToStrokeSpaceRect:(CGRect)a5 scale:(double)a6 completion:(id)a7;
@end

@implementation PKImageRenderer

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5 renderQueue:(id)a6
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", a6, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:](self, "initWithSize:scale:renderQueue:sixChannelBlending:", a5, 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKImageRenderer;
  v12 = [(PKImageRenderer *)&v15 init];
  v13 = v12;
  if (v12) {
    -[PKImageRenderer setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:](v12, "setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:", v11, v6, 0, width, height, a4);
  }

  return v13;
}

- (id)initSyncWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PKImageRenderer;
  v7 = [(PKImageRenderer *)&v10 init];
  v8 = v7;
  if (v7) {
    -[PKImageRenderer setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:](v7, "setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:", 0, 0, 1, width, height, a4);
  }
  return v8;
}

- (void)dealloc
{
  BOOL v3 = [(PKImageRenderer *)self synchronous];
  rendererController = self->_rendererController;
  if (v3)
  {
    if (rendererController) {
      rendererController->_isTorndown = 1;
    }
  }
  else
  {
    -[PKMetalRendererController teardown]((uint64_t)rendererController);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKImageRenderer;
  [(PKImageRenderer *)&v5 dealloc];
}

- (void)setupWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6 synchronous:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double v9 = a4;
  double height = a3.height;
  double width = a3.width;
  self->_size = a3;
  double v13 = fmax(round(a3.width * a4), 1.0);
  double v14 = fmax(round(a3.height * a4), 1.0);
  +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", a5, v13, v14);
  double v17 = v15;
  double v18 = v16;
  if (v13 != v15 || v14 != v16) {
    double v9 = v15 / v13 * v9;
  }
  self->_scale = v9;
  self->_synchronous = v7;
  if (+[PKMetalUtility isMetalAvailable])
  {
    v26 = objc_alloc_init(PKMetalConfig);
    v20 = [PKMetalRendererController alloc];
    if (v8) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 0;
    }
    v22 = (PKMetalRendererController *)-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlendingMode:metalConfig:](v20, 80, v21, v26, v17, v18, width, height);
    rendererController = self->_rendererController;
    self->_rendererController = v22;

    v24 = self->_rendererController;
    if (v7)
    {
      v25 = v26;
      if (v24)
      {
        v24->_synchronous = 1;
        atomic_load((unsigned int *)&v24->_cancelAllRendering);
      }
    }
    else
    {
      -[PKMetalRendererController setup]((uint64_t)v24);
      v25 = v26;
    }
  }
}

- (void)renderDrawing:(id)a3 completion:(id)a4
{
}

- (void)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a6;
  double v13 = [a3 strokes];
  double v14 = (void *)[v13 copy];
  -[PKImageRenderer renderStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v15, x, y, width, height, a5);
}

- (void)renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PKImageRenderer_renderCGStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke;
  v15[3] = &unk_1E64C8D20;
  id v16 = v13;
  id v14 = v13;
  -[PKImageRenderer _renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "_renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", a3, v15, x, y, width, height, a5);
}

uint64_t __77__PKImageRenderer_renderCGStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke(uint64_t a1, CGImageRef image)
{
  CGImageRetain(image);
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = (void (**)(void, void, void))v14;
  if (self->_rendererController)
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v73.c = v16;
    *(_OWORD *)&v73.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGFloat v17 = x;
    *(CGFloat *)&long long v16 = y;
    double v18 = width;
    double v19 = height;
    if (CGRectIsNull(*(CGRect *)((char *)&v16 - 8)))
    {
      CGAffineTransform t1 = v73;
      CGAffineTransformMakeScale(&t2, a5, a5);
      CGAffineTransformConcat(&v72, &t1, &t2);
      CGAffineTransform v73 = v72;
      CGFloat v52 = height;
      CGFloat v53 = width;
    }
    else
    {
      [(PKImageRenderer *)self size];
      double v21 = v20;
      [(PKImageRenderer *)self size];
      double v22 = v21 / width;
      double v24 = v23 / height;
      if (v21 / width >= v24) {
        double v22 = v24;
      }
      if (v22 > a5) {
        double v22 = a5;
      }
      double scale = self->_scale;
      memset(&v72, 0, sizeof(v72));
      CGAffineTransformMakeScale(&v72, v22 * scale, v22 * scale);
      CGAffineTransform v71 = v72;
      v76.origin.CGFloat x = x;
      v76.origin.CGFloat y = y;
      v76.size.double width = width;
      v76.size.double height = height;
      CGRect v77 = CGRectApplyAffineTransform(v76, &v71);
      CGRect v78 = CGRectIntegral(v77);
      double v51 = v78.origin.x;
      double v26 = v78.origin.y;
      double v27 = v78.size.width;
      double v28 = v78.size.height;
      [(PKImageRenderer *)self size];
      double v30 = v29;
      [(PKImageRenderer *)self scale];
      double v32 = v30 * v31;
      if (v27 >= v32) {
        double v33 = v32;
      }
      else {
        double v33 = v27;
      }
      [(PKImageRenderer *)self size];
      double v35 = v34;
      [(PKImageRenderer *)self scale];
      double v37 = v35 * v36;
      if (v28 < v37) {
        double v37 = v28;
      }
      CGFloat v52 = v37;
      CGFloat v53 = v33;
      CGAffineTransform v70 = v73;
      CGAffineTransform v69 = v72;
      CGAffineTransformConcat(&v73, &v70, &v69);
      CGAffineTransform v67 = v73;
      CGAffineTransformMakeTranslation(&v66, -v51, -v26);
      CGAffineTransformConcat(&v68, &v67, &v66);
      CGAffineTransform v73 = v68;
      CGAffineTransform v65 = v68;
      CGAffineTransformMakeScale(&v64, 1.0 / self->_scale, 1.0 / self->_scale);
      CGAffineTransformConcat(&v68, &v65, &v64);
      CGAffineTransform v73 = v68;
    }
    -[PKMetalRendererController setContentZoomScale:]((uint64_t)self->_rendererController, sqrt(v73.b * v73.b + v73.a * v73.a));
    CGAffineTransform v61 = v73;
    CGAffineTransformMakeScale(&v60, self->_scale, self->_scale);
    CGAffineTransformConcat(&v72, &v61, &v60);
    CGAffineTransform v73 = v72;
    CGFloat v38 = *MEMORY[0x1E4F1DB20];
    CGFloat v39 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v40 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v41 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v79.origin.CGFloat x = x;
    v79.origin.CGFloat y = y;
    v79.size.double width = width;
    v79.size.double height = height;
    if (CGRectIsNull(v79))
    {
      CGFloat v52 = v41;
      CGFloat v53 = v40;
    }
    else
    {
      CGFloat v38 = *MEMORY[0x1E4F1DAD8];
      CGFloat v39 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v43 = v13;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v74 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v43);
            }
            v47 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            [v47 _bounds];
            v81.origin.CGFloat x = x;
            v81.origin.CGFloat y = y;
            v81.size.double width = width;
            v81.size.double height = height;
            if (CGRectIntersectsRect(v80, v81)) {
              [v42 addObject:v47];
            }
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v56 objects:v74 count:16];
        }
        while (v44);
      }

      id v13 = v42;
    }
    if ([(PKImageRenderer *)self synchronous])
    {
      v48 = [(PKImageRenderer *)self rendererController];
      CGAffineTransform v55 = v73;
      v49 = -[PKMetalRendererController renderStrokesSync:clippedToStrokeSpaceRect:strokeTransform:imageClipRect:]((uint64_t)v48, v13, &v55, x, y, width, height, v38, v39, v53, v52);

      ((void (**)(void, CGImage *, void))v15)[2](v15, v49, 0);
      CGImageRelease(v49);
    }
    else
    {
      v50 = [(PKImageRenderer *)self rendererController];
      CGAffineTransform v54 = v73;
      -[PKMetalRendererController renderStrokes:clippedToStrokeSpaceRect:strokeTransform:imageClipRect:completion:]((uint64_t)v50, v13, (long long *)&v54, v15, x, y, width, height, v38, v39, v53, v52);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }
}

- (void)renderStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  double v19 = __75__PKImageRenderer_renderStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke;
  double v20 = &unk_1E64C8D48;
  double v21 = self;
  id v22 = v13;
  id v14 = v13;
  id v15 = a3;
  long long v16 = _Block_copy(&v17);
  -[PKImageRenderer renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v15, v16, x, y, width, height, a5, v17, v18, v19, v20, v21);
}

void __75__PKImageRenderer_renderStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke(uint64_t a1, CGImage *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E4FB1818];
    [*(id *)(a1 + 32) scale];
    objc_super v5 = objc_msgSend(v4, "imageWithCGImage:scale:orientation:", a2, 0);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

    CGImageRelease(a2);
  }
  else
  {
    BOOL v6 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v7 = *(void *)(a1 + 40);
    v6(v7);
  }
}

- (void)sixChannelCGRenderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a6;
  id v13 = [a3 strokes];
  id v14 = (void *)[v13 copy];
  -[PKImageRenderer _renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "_renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v15, x, y, width, height, a5);
}

+ (CGImage)createJPEGCopyFrom:(CGImage *)a3 compressionQuality:(double)a4
{
  ImageAtIndedouble x = a3;
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  double v20 = a4;
  if (!a3) {
    return ImageAtIndex;
  }
  CFStringRef UTType = CGImageGetUTType(a3);
  if (UTType && CFEqual(UTType, @"public.jpeg")) {
    return 0;
  }
  if (CGImageHasAlpha())
  {
    MaskFromAlpha = (CGImage *)CGImageCreateMaskFromAlpha();
  }
  else
  {
    Mask = (CGImage *)CGImageGetMask();
    MaskFromAlpha = Mask;
    if (Mask) {
      CGImageRetain(Mask);
    }
  }
  Mutable = CFDataCreateMutable(0, 0);
  CGImageDestinationRef v10 = CGImageDestinationCreateWithData(Mutable, @"public.jpeg", 1uLL, 0);
  if (!v10)
  {
    CGImageRelease(MaskFromAlpha);
    CFRelease(Mutable);
    return 0;
  }
  id v11 = v10;
  CFDictionaryRef v12 = 0;
  if (a4 >= 0.0 && a4 <= 1.0)
  {
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &v20);
    if (v14)
    {
      CFNumberRef v15 = v14;
      long long v16 = (void *)*MEMORY[0x1E4F2F430];
      values = v14;
      keys[0] = v16;
      CFDictionaryRef v12 = CFDictionaryCreate(v13, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFRelease(v15);
    }
    else
    {
      CFDictionaryRef v12 = 0;
    }
  }
  CGImageDestinationAddImage(v11, ImageAtIndex, v12);
  CGImageDestinationFinalize(v11);
  CFRelease(v11);
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v17 = CGImageSourceCreateWithData(Mutable, 0);
  CFRelease(Mutable);
  if (v17)
  {
    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v17, 0, 0);
    CFRelease(v17);
    if (ImageAtIndex && MaskFromAlpha)
    {
      CGImageRef v18 = CGImageCreateWithMask(ImageAtIndex, MaskFromAlpha);
      CGImageRelease(ImageAtIndex);
      ImageAtIndedouble x = v18;
LABEL_24:
      CGImageRelease(MaskFromAlpha);
      return ImageAtIndex;
    }
  }
  else
  {
    ImageAtIndedouble x = 0;
  }
  if (MaskFromAlpha) {
    goto LABEL_24;
  }
  return ImageAtIndex;
}

- (void)sixChannelPDFRenderDrawing:(id)a3 context:(CGContext *)a4 clippedToStrokeSpaceRect:(CGRect)a5 scale:(double)a6 completion:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a3;
  id v15 = a7;
  long long v16 = v15;
  if (self->_rendererController)
  {
    double v41 = v15;
    uint64_t v17 = [v14 strokes];
    CGImageRef v18 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v19 = [v17 count];
    if (v19 >= 1)
    {
      uint64_t v20 = 0;
      do
      {
        double v21 = [v17 objectAtIndexedSubscript:v20];
        [v21 renderBounds];
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        BOOL v30 = __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(v21);
        [v18 addObject:v21];
        if (++v20 < v19)
        {
          while (1)
          {
            double v31 = [v17 objectAtIndexedSubscript:v20];
            if (v30 != __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(v31)) {
              break;
            }
            [v18 addObject:v31];
            [v31 renderBounds];
            v49.origin.double x = v32;
            v49.origin.double y = v33;
            v49.size.double width = v34;
            v49.size.double height = v35;
            v45.origin.double x = v23;
            v45.origin.double y = v25;
            v45.size.double width = v27;
            v45.size.double height = v29;
            CGRect v46 = CGRectUnion(v45, v49);
            CGFloat v23 = v46.origin.x;
            CGFloat v25 = v46.origin.y;
            CGFloat v27 = v46.size.width;
            CGFloat v29 = v46.size.height;

            if (v19 == ++v20)
            {
              uint64_t v20 = v19;
              goto LABEL_9;
            }
          }
        }
LABEL_9:
        v47.origin.double x = v23;
        v47.origin.double y = v25;
        v47.size.double width = v27;
        v47.size.double height = v29;
        v50.origin.double x = x;
        v50.origin.double y = y;
        v50.size.double width = width;
        v50.size.double height = height;
        CGRect v48 = CGRectIntersection(v47, v50);
        CGFloat v36 = v48.origin.x;
        CGFloat v37 = v48.origin.y;
        CGFloat v38 = v48.size.width;
        CGFloat v39 = v48.size.height;
        if (!CGRectIsEmpty(v48))
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke_2;
          v43[3] = &__block_descriptor_105_e18_v16__0__CGImage__8l;
          *(CGFloat *)&v43[4] = v36;
          *(CGFloat *)&v43[5] = v37;
          *(CGFloat *)&v43[6] = v38;
          *(CGFloat *)&v43[7] = v39;
          *(double *)&v43[8] = x;
          *(double *)&v43[9] = y;
          *(double *)&v43[10] = width;
          *(double *)&v43[11] = height;
          v43[12] = a4;
          BOOL v44 = v30;
          -[PKImageRenderer renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v18, v43, x, y, width, height, a6);
        }
        [v18 removeAllObjects];
      }
      while (v20 < v19);
    }
    double v40 = [(PKImageRenderer *)self rendererController];
    -[PKMetalRendererController callBlockOnRenderQueue:]((uint64_t)v40, v41);

    long long v16 = v41;
  }
  else
  {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

BOOL __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(void *a1)
{
  v1 = [a1 ink];
  uint64_t v2 = [v1 behavior];
  BOOL v3 = [v2 renderingDescriptor];
  uint64_t v4 = [v3 blendMode];

  return (v4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

void __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke_2(uint64_t a1, const void *a2)
{
  if (a2)
  {
    uint64_t v4 = +[PKImageRenderer createJPEGCopyFrom:a2 compressionQuality:0.9];
    CFRelease(a2);
    if (v4)
    {
      double Width = (double)CGImageGetWidth(v4);
      double Height = (double)CGImageGetHeight(v4);
      DKDNormalizedSubrectInRect(*(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
      DKDRectFromNormalizedSubrect(0.0, 0.0, Width, Height, v7, v8, v9, v10);
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat v13 = v28.size.width;
      CGFloat v14 = v28.size.height;
      if (!CGRectIsEmpty(v28))
      {
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.double width = v13;
        v29.size.double height = v14;
        CGImageRef v15 = CGImageCreateWithImageInRect(v4, v29);
        if (v15)
        {
          long long v16 = v15;
          CGContextSetBlendMode(*(CGContextRef *)(a1 + 96), (CGBlendMode)*(unsigned __int8 *)(a1 + 104));
          uint64_t v17 = *(CGContext **)(a1 + 96);
          CGFloat v18 = *(double *)(a1 + 32);
          double v19 = *(double *)(a1 + 40);
          CGFloat v20 = *(double *)(a1 + 48);
          CGFloat v21 = *(double *)(a1 + 56);
          CGFloat v22 = *(double *)(a1 + 72);
          CGFloat rect = *(double *)(a1 + 64);
          CGFloat v23 = *(double *)(a1 + 80);
          CGFloat v24 = *(double *)(a1 + 88);
          v30.origin.CGFloat x = v18;
          v30.origin.CGFloat y = v19;
          v30.size.double width = v20;
          v30.size.double height = v21;
          double MidY = CGRectGetMidY(v30);
          v31.origin.CGFloat x = rect;
          v31.origin.CGFloat y = v22;
          v31.size.double width = v23;
          v31.size.double height = v24;
          v32.origin.CGFloat y = v19 + (MidY - CGRectGetMidY(v31)) * -2.0;
          v32.origin.CGFloat x = v18;
          v32.size.double width = v20;
          v32.size.double height = v21;
          CGContextDrawImage(v17, v32, v16);
          CGImageRelease(v16);
        }
      }
      CGImageRelease(v4);
    }
  }
}

- (void)cancel
{
  id v2 = [(PKImageRenderer *)self rendererController];
  -[PKMetalRendererController cancelLongRunningRenders]((uint64_t)v2);
}

- (void)resume
{
  id v2 = [(PKImageRenderer *)self rendererController];
  -[PKMetalRendererController resumeLongRunningRendersAfterAllWorkIsDone]((uint64_t)v2);
}

+ (void)_fuzzTestUnzippedData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(PKVersionedDocument *)[PKDrawingVersionedDocument alloc] initWithUnzippedData:v3];
  objc_super v5 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", 240.0, 320.0, 1.0);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  CGFloat v7 = [(PKDrawingVersionedDocument *)v4 drawing];
  double v8 = *MEMORY[0x1E4F1DB20];
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__PKImageRenderer__fuzzTestUnzippedData___block_invoke;
  v13[3] = &unk_1E64C8D90;
  CFDictionaryRef v12 = v6;
  CGFloat v14 = v12;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v5, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v7, v13, v8, v9, v10, v11, 0.3125);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __41__PKImageRenderer__fuzzTestUnzippedData___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)buildStrokeRenderCacheForDrawing:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    rendererController = self->_rendererController;
    objc_super v5 = [v6 strokes];
    -[PKMetalRendererController buildRenderCacheForStrokes:]((uint64_t)rendererController, v5);
  }
}

- (BOOL)invertColors
{
  rendererController = self->_rendererController;
  return rendererController && rendererController->_invertColors;
}

- (void)setInvertColors:(BOOL)a3
{
}

- (BOOL)sixChannelBlending
{
  rendererController = self->_rendererController;
  return rendererController && rendererController->_sixChannelBlendingMode != 0;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (PKMetalRendererController)rendererController
{
  return self->_rendererController;
}

- (void)setRendererController:(id)a3
{
}

- (int64_t)cancelCount
{
  return self->_cancelCount;
}

- (void)setCancelCount:(int64_t)a3
{
  self->_cancelCount = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
}

@end