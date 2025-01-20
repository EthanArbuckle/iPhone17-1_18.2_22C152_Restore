@interface AVVideoCompositionRenderContext
+ (id)renderContextPropertiesFromFigCompositor:(OpaqueFigVideoCompositor *)a3;
- (AVEdgeWidths)edgeWidths;
- (AVPixelAspectRatio)pixelAspectRatio;
- (AVVideoComposition)videoComposition;
- (AVVideoCompositionRenderContext)initWithFigVideoCompositor:(OpaqueFigVideoCompositor *)a3 clientRequiredPixelBufferAttributes:(id)a4 videoComposition:(id)a5 pixelBufferPool:(__CVPixelBufferPool *)a6;
- (BOOL)hasEqualPropertiesToFigVideoCompositor:(OpaqueFigVideoCompositor *)a3;
- (BOOL)highQualityRendering;
- (BOOL)isBufferYCbCr:(__CVBuffer *)a3;
- (CGAffineTransform)renderTransform;
- (CGSize)size;
- (CVPixelBufferRef)newPixelBuffer;
- (__CVPixelBufferPool)pixelBufferPool;
- (float)renderScale;
- (void)_willDeallocOrFinalize;
- (void)dealloc;
@end

@implementation AVVideoCompositionRenderContext

- (void)_willDeallocOrFinalize
{
  internal = self->_internal;
  if (internal) {
    CFRelease(internal);
  }
}

- (void)dealloc
{
  [(AVVideoCompositionRenderContext *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVVideoCompositionRenderContext;
  [(AVVideoCompositionRenderContext *)&v3 dealloc];
}

- (CGSize)size
{
  internal = self->_internal;
  double width = internal->_size.width;
  double height = internal->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)renderTransform
{
  CGFloat b = self->b;
  long long v4 = *(_OWORD *)(*(void *)&b + 48);
  *(_OWORD *)&retstr->a = *(_OWORD *)(*(void *)&b + 32);
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(*(void *)&b + 64);
  return self;
}

- (float)renderScale
{
  return self->_internal->_renderScale;
}

- (AVPixelAspectRatio)pixelAspectRatio
{
  internal = self->_internal;
  NSInteger horizontalSpacing = internal->_pixelAspectRatio.horizontalSpacing;
  NSInteger verticalSpacing = internal->_pixelAspectRatio.verticalSpacing;
  result.NSInteger verticalSpacing = verticalSpacing;
  result.NSInteger horizontalSpacing = horizontalSpacing;
  return result;
}

- (AVEdgeWidths)edgeWidths
{
  internal = self->_internal;
  double left = internal->_edgeWidths.left;
  double top = internal->_edgeWidths.top;
  double right = internal->_edgeWidths.right;
  double bottom = internal->_edgeWidths.bottom;
  result.double bottom = bottom;
  result.double right = right;
  result.double top = top;
  result.double left = left;
  return result;
}

- (BOOL)highQualityRendering
{
  return self->_internal->_highQualityRendering;
}

- (AVVideoComposition)videoComposition
{
  return self->_internal->_videoComposition;
}

- (CVPixelBufferRef)newPixelBuffer
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  pixelBufferPoolQ = self->_internal->_pixelBufferPoolQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVVideoCompositionRenderContext_newPixelBuffer__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(pixelBufferPoolQ, v5);
  objc_super v3 = (__CVBuffer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __49__AVVideoCompositionRenderContext_newPixelBuffer__block_invoke(uint64_t a1)
{
  v2 = (__CVPixelBufferPool *)[*(id *)(a1 + 32) pixelBufferPool];
  if (v2
    && !CVPixelBufferPoolCreatePixelBufferWithAuxAttributes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0, (CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
  {
    objc_super v3 = *(void **)(a1 + 32);
    long long v4 = (void *)v3[1];
    v5 = (const void *)v4[26];
    if (v5)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24A78], v5, kCVAttachmentMode_ShouldPropagate);
      objc_super v3 = *(void **)(a1 + 32);
      long long v4 = (void *)v3[1];
    }
    uint64_t v6 = (const void *)v4[25];
    if (v6)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24B98], v6, kCVAttachmentMode_ShouldPropagate);
      objc_super v3 = *(void **)(a1 + 32);
      long long v4 = (void *)v3[1];
    }
    if (v4[20])
    {
      int v7 = [v3 isBufferYCbCr:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      objc_super v3 = *(void **)(a1 + 32);
      if (v7)
      {
        CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24C18], *(CFTypeRef *)(v3[1] + 160), kCVAttachmentMode_ShouldPropagate);
        objc_super v3 = *(void **)(a1 + 32);
      }
    }
    uint64_t v8 = v3[1];
    uint64_t v9 = *(const void **)(v8 + 168);
    if (v9)
    {
      CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24A90], v9, kCVAttachmentMode_ShouldPropagate);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    v10 = *(const void **)(v8 + 176);
    if (v10)
    {
      v11 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F24BC8];
      CVBufferSetAttachment(v11, v12, v10, kCVAttachmentMode_ShouldPropagate);
    }
  }
}

+ (id)renderContextPropertiesFromFigCompositor:(OpaqueFigVideoCompositor *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (renderContextPropertiesFromFigCompositor__keysOnce != -1) {
    dispatch_once(&renderContextPropertiesFromFigCompositor__keysOnce, &__block_literal_global_76);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v4 = (void *)renderContextPropertiesFromFigCompositor__keys;
  uint64_t v5 = [(id)renderContextPropertiesFromFigCompositor__keys countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        uint64_t FigBaseObject = FigVideoCompositorGetFigBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        v14 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(v13 + 48);
        if (v14) {
          v14(FigBaseObject, v10, v8, &v16);
        }
        if (v16) {
          [v3 setObject:v16 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  return v3;
}

id __86__AVVideoCompositionRenderContext_Internal__renderContextPropertiesFromFigCompositor___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34BA8], *MEMORY[0x1E4F34BC0], *MEMORY[0x1E4F34BB8], *MEMORY[0x1E4F34BB0], *MEMORY[0x1E4F34BA0], *MEMORY[0x1E4F34B70], *MEMORY[0x1E4F34B80], *MEMORY[0x1E4F34B98], *MEMORY[0x1E4F34B88], *MEMORY[0x1E4F34B90], 0);
  renderContextPropertiesFromFigCompositor__keys = (uint64_t)result;
  return result;
}

- (AVVideoCompositionRenderContext)initWithFigVideoCompositor:(OpaqueFigVideoCompositor *)a3 clientRequiredPixelBufferAttributes:(id)a4 videoComposition:(id)a5 pixelBufferPool:(__CVPixelBufferPool *)a6
{
  v48.receiver = self;
  v48.super_class = (Class)AVVideoCompositionRenderContext;
  uint64_t v10 = [(AVVideoCompositionRenderContext *)&v48 init];
  if (!v10) {
    return v10;
  }
  v11 = objc_alloc_init(AVVideoCompositionRenderContextInternal);
  v10->_internal = v11;
  CFRetain(v11);
  v10->_internal->_pixelBufferPool = a6;
  CVPixelBufferPoolRetain(v10->_internal->_pixelBufferPool);
  v10->_internal->_videoComposition = (AVVideoComposition *)[a5 copy];
  v10->_internal->_clientRequiredPixelBufferAttributes = (NSDictionary *)[a4 copy];
  v10->_internal->_basisProperties = (NSDictionary *)+[AVVideoCompositionRenderContext renderContextPropertiesFromFigCompositor:a3];
  v10->_internal->_bufferPoollInitMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_internal->_pixelBufferPoolQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avvideocompositionrendercontext.pixelbufferpoolq", v12);
  internal = v10->_internal;
  if (!internal->_pixelBufferPoolQ) {
    goto LABEL_26;
  }
  CFDictionaryRef v14 = [(NSDictionary *)internal->_basisProperties objectForKey:*MEMORY[0x1E4F34BA8]];
  if (!v14) {
    goto LABEL_26;
  }
  if (!CGSizeMakeWithDictionaryRepresentation(v14, &v10->_internal->_size)) {
    goto LABEL_26;
  }
  v10->_internal->_CGFloat renderScale = 1.0;
  id v15 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34BC0]];
  if (!v15) {
    goto LABEL_26;
  }
  [v15 floatValue];
  v10->_internal->_CGFloat renderScale = v16;
  v10->_internal->_pixelAspectRatioDict = (__CFDictionary *)[(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34BB8]];
  long long v17 = v10->_internal;
  pixelAspectRatioDict = v17->_pixelAspectRatioDict;
  if (pixelAspectRatioDict)
  {
    uint64_t v19 = objc_msgSend((id)-[__CFDictionary objectForKey:](pixelAspectRatioDict, "objectForKey:", *MEMORY[0x1E4F24B90]), "integerValue");
    uint64_t v20 = objc_msgSend((id)-[__CFDictionary objectForKey:](v10->_internal->_pixelAspectRatioDict, "objectForKey:", *MEMORY[0x1E4F24BA0]), "integerValue");
    long long v17 = v10->_internal;
  }
  else
  {
    uint64_t v19 = 1;
    uint64_t v20 = 1;
  }
  v17->_pixelAspectRatio.NSInteger horizontalSpacing = v19;
  v17->_pixelAspectRatio.NSInteger verticalSpacing = v20;
  id v21 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34BB0]];
  uint64_t v22 = v21;
  if (v21)
  {
    if ([v21 count] == 4)
    {
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 0), "floatValue");
      double v24 = v23;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 1), "floatValue");
      double v26 = v25;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 2), "floatValue");
      double v28 = v27;
      objc_msgSend((id)objc_msgSend(v22, "objectAtIndex:", 3), "floatValue");
      v29 = (double *)v10->_internal;
      v29[13] = v24;
      v29[14] = v26;
      v29[15] = v28;
      v29[16] = v30;
      goto LABEL_12;
    }
LABEL_26:

    return 0;
  }
LABEL_12:
  id v31 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34BA0]];
  if (v31) {
    v10->_internal->_highQualityRendering = [v31 BOOLValue];
  }
  memset(&v47, 0, sizeof(v47));
  uint64_t v45 = 0;
  v46 = 0;
  uint64_t v44 = 0;
  if (FigVideoCompositorUtilityCopyRenderPixelBufferDimensionsAndCleanAperture()) {
    goto LABEL_26;
  }
  v32 = v10->_internal;
  CGFloat renderScale = v32->_renderScale;
  CGAffineTransform v42 = v47;
  CGAffineTransformScale(&v43, &v42, renderScale, renderScale);
  long long v34 = *(_OWORD *)&v43.tx;
  long long v35 = *(_OWORD *)&v43.c;
  *(_OWORD *)&v32->_renderTransform.a = *(_OWORD *)&v43.a;
  *(_OWORD *)&v32->_renderTransform.c = v35;
  *(_OWORD *)&v32->_renderTransform.tx = v34;
  v10->_internal->_cleanApertureDict = v46;
  v10->_internal->_destinationPixelBufferDimensions.double width = v45;
  v10->_internal->_destinationPixelBufferDimensions.double height = v44;
  id v36 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34B80]];
  if (v36) {
    v10->_internal->_destinationDesiredPixelBufferAttributes = (NSDictionary *)v36;
  }
  id v37 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34B98]];
  if (v37) {
    v10->_internal->_destinationDesiredPixelBufferYCbCrMatrix = (NSString *)v37;
  }
  id v38 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34B88]];
  if (v38) {
    v10->_internal->_destinationDesiredPixelBufferColorPrimaries = (NSString *)v38;
  }
  id v39 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34B90]];
  if (v39) {
    v10->_internal->_destinationDesiredPixelBufferTransferFunction = (NSString *)v39;
  }
  id v40 = [(NSDictionary *)v10->_internal->_basisProperties objectForKey:*MEMORY[0x1E4F34B70]];
  if (v40) {
    v10->_internal->_blendingTransferFunction = (NSString *)v40;
  }
  return v10;
}

- (BOOL)hasEqualPropertiesToFigVideoCompositor:(OpaqueFigVideoCompositor *)a3
{
  id v4 = +[AVVideoCompositionRenderContext renderContextPropertiesFromFigCompositor:a3];
  if (v4)
  {
    id v5 = v4;
    basisProperties = self->_internal->_basisProperties;
    LOBYTE(v4) = [(NSDictionary *)basisProperties isEqual:v5];
  }
  return (char)v4;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  MEMORY[0x199715030](self->_internal->_bufferPoollInitMutex, a2);
  internal = self->_internal;
  if (internal->_pixelBufferPool) {
    goto LABEL_26;
  }
  BOOL v4 = [(NSString *)internal->_destinationDesiredPixelBufferTransferFunction isEqualToString:@"ITU_R_2100_HLG"];
  id v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v4
    || [(NSString *)self->_internal->_destinationDesiredPixelBufferTransferFunction isEqualToString:@"SMPTE_ST_2084_PQ"]|| [(NSString *)self->_internal->_destinationDesiredPixelBufferTransferFunction isEqualToString:@"Linear"])
  {
    clientRequiredPixelBufferAttributes = self->_internal->_clientRequiredPixelBufferAttributes;
    if (clientRequiredPixelBufferAttributes)
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)clientRequiredPixelBufferAttributes, (const void *)*MEMORY[0x1E4F24D70]);
      if (Value)
      {
        CFArrayRef v8 = Value;
        CFTypeID v9 = CFGetTypeID(Value);
        if (v9 == CFArrayGetTypeID() && CFArrayGetCount(v8) >= 1)
        {
          CFAllocatorRef v10 = *v5;
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(*v5, 0, (CFDictionaryRef)clientRequiredPixelBufferAttributes);
          if (MutableCopy)
          {
            CFMutableDictionaryRef v12 = MutableCopy;
            CFMutableArrayRef Mutable = CFArrayCreateMutable(v10, 0, MEMORY[0x1E4F1D510]);
            if (Mutable)
            {
              CFMutableArrayRef v14 = Mutable;
              if (CFArrayGetCount(v8) >= 1)
              {
                CFIndex v15 = 0;
                do
                {
                  FigCFArrayGetInt32AtIndex();
                  if ((int)GetBitDepthFromPixelFormatType(0) >= 10) {
                    FigCFArrayAppendInt32();
                  }
                  ++v15;
                }
                while (v15 < CFArrayGetCount(v8));
              }
              if (CFArrayGetCount(v8) >= 1)
              {
                CFIndex v16 = 0;
                do
                {
                  FigCFArrayGetInt32AtIndex();
                  if ((int)GetBitDepthFromPixelFormatType(0) <= 9) {
                    FigCFArrayAppendInt32();
                  }
                  ++v16;
                }
                while (v16 < CFArrayGetCount(v8));
              }
              FigCFDictionarySetValue();
              CFTypeRef v17 = CFRetain(v12);
              CFRelease(v12);
              CFRelease(v14);
              goto LABEL_24;
            }
            CFRelease(v12);
          }
          goto LABEL_28;
        }
      }
      long long v18 = clientRequiredPixelBufferAttributes;
LABEL_23:
      CFTypeRef v17 = CFRetain(v18);
      goto LABEL_24;
    }
  }
  else
  {
    long long v18 = self->_internal->_clientRequiredPixelBufferAttributes;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_28:
  CFTypeRef v17 = 0;
LABEL_24:
  VTBuildPixelBufferPools();
  if (v17) {
    CFRelease(v17);
  }
LABEL_26:
  MEMORY[0x199715040](self->_internal->_bufferPoollInitMutex);
  return self->_internal->_pixelBufferPool;
}

- (BOOL)isBufferYCbCr:(__CVBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  if (!self->_internal->pixelFormatFamily)
  {
    CVPixelBufferGetPixelFormatType(a3);
    CFDictionaryRef DescriptionWithPixelFormatType = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
    if (CFDictionaryGetValue(DescriptionWithPixelFormatType, (const void *)*MEMORY[0x1E4F24EB8]) == (const void *)*MEMORY[0x1E4F1CFD0]) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
    self->_internal->pixelFormatFamily = v5;
  }
  return self->_internal->pixelFormatFamily == 1;
}

@end