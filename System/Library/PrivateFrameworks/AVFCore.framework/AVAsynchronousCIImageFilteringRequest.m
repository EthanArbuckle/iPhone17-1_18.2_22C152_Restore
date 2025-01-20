@interface AVAsynchronousCIImageFilteringRequest
- (CGSize)renderSize;
- (CIImage)sourceImage;
- (CMTime)compositionTime;
- (id)initUsingCompositingRequest:(id)a3 sourceFrame:(__CVBuffer *)a4 cancellationTest:(id)a5 defaultCIContextProvider:(id)a6 completionHandler:(id)a7;
- (void)_willDeallocOrFinalize;
- (void)dealloc;
- (void)finishWithError:(NSError *)error;
- (void)finishWithImage:(CIImage *)filteredImage context:(CIContext *)context;
@end

@implementation AVAsynchronousCIImageFilteringRequest

- (id)initUsingCompositingRequest:(id)a3 sourceFrame:(__CVBuffer *)a4 cancellationTest:(id)a5 defaultCIContextProvider:(id)a6 completionHandler:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVAsynchronousCIImageFilteringRequest;
  v12 = [(AVAsynchronousCIImageFilteringRequest *)&v15 init];
  if (v12)
  {
    v13 = objc_alloc_init(AVAsynchronousCIImageFilteringRequestInternal);
    v12->_internal = v13;
    CFRetain(v13);
    [(AVAsynchronousCIImageFilteringRequestInternal *)v12->_internal setCompositingRequest:a3];
    [(AVAsynchronousCIImageFilteringRequestInternal *)v12->_internal setCancellationTest:a5];
    [(AVAsynchronousCIImageFilteringRequestInternal *)v12->_internal setDefaultCIContextProvider:a6];
    [(AVAsynchronousCIImageFilteringRequestInternal *)v12->_internal setCompletionHandler:a7];
    [(AVAsynchronousCIImageFilteringRequestInternal *)v12->_internal setSourcePBuf:a4];
  }
  return v12;
}

- (void)_willDeallocOrFinalize
{
  internal = self->_internal;
  if (internal) {
    CFRelease(internal);
  }
}

- (void)dealloc
{
  [(AVAsynchronousCIImageFilteringRequest *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousCIImageFilteringRequest;
  [(AVAsynchronousCIImageFilteringRequest *)&v3 dealloc];
}

- (CGSize)renderSize
{
  v2 = [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] renderContext];
  [(AVVideoCompositionRenderContext *)v2 size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CIImage)sourceImage
{
  if (![(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal sourceCIImage])
  {
    id v3 = [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] videoCompositionInstruction];
    if ([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal sourcePBuf])
    {
      double v4 = [(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal sourcePBuf];
      uint64_t v5 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v4];
    }
    else
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithColor:", objc_msgSend(MEMORY[0x1E4F1E008], "colorWithRed:green:blue:", 0.0, 0.0, 0.0));
    }
    v6 = (void *)v5;
    memset(&v29, 0, sizeof(v29));
    if (v3) {
      [v3 sourceTrackPreferredTransform];
    }
    CGAffineTransform v28 = v29;
    if (!CGAffineTransformIsIdentity(&v28))
    {
      __int16 v27 = 0;
      CGAffineTransform v28 = v29;
      int RotationAngleAndFlipsFromCGAffineTransform = FigGetRotationAngleAndFlipsFromCGAffineTransform();
      [v6 extent];
      double v9 = v8;
      double v11 = v10;
      CGAffineTransformMakeTranslation(&v28, v8 * -0.5, v10 * -0.5);
      CGAffineTransform v29 = v28;
      CGAffineTransformMakeRotation(&t2, (double)-RotationAngleAndFlipsFromCGAffineTransform * 3.14159265 / 180.0);
      CGAffineTransform t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &t2);
      CGAffineTransform v29 = v28;
      double v12 = -1.0;
      if ((_BYTE)v27) {
        double v13 = -1.0;
      }
      else {
        double v13 = 1.0;
      }
      if (!HIBYTE(v27)) {
        double v12 = 1.0;
      }
      CGAffineTransformMakeScale(&v24, v13, v12);
      CGAffineTransform t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &v24);
      CGAffineTransform v29 = v28;
      if (RotationAngleAndFlipsFromCGAffineTransform == 270 || RotationAngleAndFlipsFromCGAffineTransform == 90)
      {
        float v14 = v9;
        double v15 = v14;
      }
      else
      {
        double v15 = v11;
        double v11 = v9;
      }
      CGAffineTransformMakeTranslation(&v23, v11 * 0.5, v15 * 0.5);
      CGAffineTransform t1 = v29;
      CGAffineTransformConcat(&v28, &t1, &v23);
      CGAffineTransform v29 = v28;
      v6 = (void *)[v6 imageByApplyingTransform:&v28];
    }
    v16 = [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] renderContext];
    if (v16) {
      [(AVVideoCompositionRenderContext *)v16 renderTransform];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    if (!CGAffineTransformIsIdentity(&v22))
    {
      v17 = [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] renderContext];
      if (v17)
      {
        [(AVVideoCompositionRenderContext *)v17 renderTransform];
      }
      else
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v19 = 0u;
      }
      v6 = (void *)[v6 imageByApplyingTransform:&v19];
    }
    -[AVAsynchronousCIImageFilteringRequestInternal setSourceCIImage:](self->_internal, "setSourceCIImage:", v6, v19, v20, v21, *(void *)&v22.a, *(void *)&v22.b, *(void *)&v22.c, *(void *)&v22.d, *(void *)&v22.tx, *(void *)&v22.ty);
  }
  return [(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal sourceCIImage];
}

- (CMTime)compositionTime
{
  CGSize result = [(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest];
  if (result)
  {
    return (CMTime *)[(CMTime *)result compositionTime];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (void)finishWithImage:(CIImage *)filteredImage context:(CIContext *)context
{
  if (!filteredImage)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)context, v4, v5, v6, v7, (uint64_t)"filteredImage != nil"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  double v9 = context;
  if ((*(uint64_t (**)(void))([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal cancellationTest]+ 16))())
  {
    [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] finishCancelledRequest];
    double v11 = *(void (**)(void))([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal completionHandler]+ 16);
    v11();
    return;
  }
  if (!v9)
  {
    float v14 = [(CIImage *)filteredImage pixelBuffer];
    if (v14)
    {
      double v13 = v14;
      CFRetain(v14);
      CFDictionaryRef v15 = CVBufferCopyAttachments(v13, kCVAttachmentMode_ShouldPropagate);
      if (v15) {
        CFRelease(v15);
      }
      goto LABEL_11;
    }
  }
  double v12 = [(AVVideoCompositionRenderContext *)[(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] renderContext] newPixelBuffer];
  if (v12)
  {
    double v13 = v12;
    if (v9
      || (double v9 = (CIContext *)(*(uint64_t (**)(void))([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal defaultCIContextProvider]+ 16))()) != 0)
    {
      [(CIContext *)v9 render:filteredImage toCVPixelBuffer:v13];
    }
    else
    {
      AVLocalizedError(@"AVFoundationErrorDomain", -11801, 0);
    }
LABEL_11:
    [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] finishWithComposedVideoFrame:v13];
    (*(void (**)(void))([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal completionHandler]+ 16))();
    CFRelease(v13);
    return;
  }
  uint64_t v16 = AVLocalizedError(@"AVFoundationErrorDomain", -11801, 0);
  [(AVAsynchronousCIImageFilteringRequest *)self finishWithError:v16];
}

- (void)finishWithError:(NSError *)error
{
  [(AVAsynchronousVideoCompositionRequest *)[(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal compositingRequest] finishWithError:error];
  uint64_t v4 = *(void (**)(void))([(AVAsynchronousCIImageFilteringRequestInternal *)self->_internal completionHandler]+ 16);
  v4();
}

@end