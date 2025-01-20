@interface ETMessageVideoCompositor
- (CGAffineTransform)videoTransform;
- (CGImage)introImage;
- (CGRect)videoRect;
- (ETMessageFrameRenderer)sketchMessageRenderer;
- (ETMessageVideoCompositor)init;
- (NSArray)sceneMessageRenderers;
- (NSDictionary)requiredPixelBufferAttributesForRenderContext;
- (NSDictionary)sourcePixelBufferAttributes;
- (int)videoTrackID;
- (void)dealloc;
- (void)setIntroImage:(CGImage *)a3;
- (void)setSceneMessageRenderers:(id)a3;
- (void)setSketchMessageRenderer:(id)a3;
- (void)setVideoRect:(CGRect)a3;
- (void)setVideoTrackID:(int)a3;
- (void)setVideoTransform:(CGAffineTransform *)a3;
- (void)startVideoCompositionRequest:(id)a3;
@end

@implementation ETMessageVideoCompositor

- (ETMessageVideoCompositor)init
{
  v11.receiver = self;
  v11.super_class = (Class)ETMessageVideoCompositor;
  v2 = [(ETMessageVideoCompositor *)&v11 init];
  if (v2)
  {
    v3 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    v2->_colorspace = v3;
    v2->_colorProfileData = CGColorSpaceCopyICCData(v3);
    CFStringRef v4 = kCVPixelBufferPixelFormatTypeKey;
    CFStringRef v14 = kCVPixelBufferPixelFormatTypeKey;
    v15 = &off_25620;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    inputPixelBufferAttributes = v2->_inputPixelBufferAttributes;
    v2->_inputPixelBufferAttributes = (NSDictionary *)v5;

    v12[0] = v4;
    v12[1] = kCVPixelBufferCGBitmapContextCompatibilityKey;
    v13[0] = &off_25620;
    v13[1] = &__kCFBooleanTrue;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    outputPixelBufferAttributes = v2->_outputPixelBufferAttributes;
    v2->_outputPixelBufferAttributes = (NSDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorspace);
  colorProfileData = self->_colorProfileData;
  if (colorProfileData) {
    CFRelease(colorProfileData);
  }
  v4.receiver = self;
  v4.super_class = (Class)ETMessageVideoCompositor;
  [(ETMessageVideoCompositor *)&v4 dealloc];
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return self->_inputPixelBufferAttributes;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  return self->_outputPixelBufferAttributes;
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sourceFrameByTrackID:self->_videoTrackID];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = [v4 renderContext];
    v8 = (__CVBuffer *)[v7 newPixelBuffer];

    if (v8)
    {
      CVBufferSetAttachment(v8, kCVImageBufferICCProfileKey, self->_colorProfileData, kCVAttachmentMode_ShouldPropagate);
      if (!CVPixelBufferLockBaseAddress(v8, 0))
      {
        if (v4) {
          [v4 compositionTime];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        double Seconds = CMTimeGetSeconds(&time);
        unint64_t Width = CVPixelBufferGetWidth(v8);
        unint64_t Height = CVPixelBufferGetHeight(v8);
        double v12 = (double)Width;
        double v13 = (double)Height;
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v8);
        BaseAddress = CVPixelBufferGetBaseAddress(v8);
        v16 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, self->_colorspace, 0x2002u);
        v17 = +[CIContext contextWithCGContext:v16 options:0];
        v18 = +[CIImage imageWithCVPixelBuffer:v6];
        long long v19 = *(_OWORD *)&self->_videoTransform.c;
        v40[0] = *(_OWORD *)&self->_videoTransform.a;
        v40[1] = v19;
        v40[2] = *(_OWORD *)&self->_videoTransform.tx;
        v20 = [v18 imageByApplyingTransform:v40];

        [v20 extent];
        objc_msgSend(v17, "drawImage:inRect:fromRect:", v20, 0.0, 0.0, v12, v13, v21, v22, v23, v24);
        introImage = self->_introImage;
        if (introImage)
        {
          v43.origin.x = 0.0;
          v43.origin.y = 0.0;
          v43.size.width = v12;
          v43.size.height = v13;
          CGContextDrawImage(v16, v43, introImage);
        }
        sketchMessageRenderer = self->_sketchMessageRenderer;
        if (sketchMessageRenderer)
        {
          v27 = [(ETMessageFrameRenderer *)sketchMessageRenderer createImageForTime:Seconds];
          if (v27)
          {
            v28 = v27;
            v44.origin.x = 0.0;
            v44.origin.y = 0.0;
            v44.size.width = v12;
            v44.size.height = v13;
            CGContextDrawImage(v16, v44, v27);
            CFRelease(v28);
          }
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v29 = self->_sceneMessageRenderers;
        id v30 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v37;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v37 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = (CGImage *)objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "createImageForTime:", Seconds, (void)v36);
              if (v34)
              {
                v35 = v34;
                v45.origin.x = 0.0;
                v45.origin.y = 0.0;
                v45.size.width = v12;
                v45.size.height = v13;
                CGContextDrawImage(v16, v45, v34);
                CFRelease(v35);
              }
            }
            id v31 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v42 count:16];
          }
          while (v31);
        }

        CVPixelBufferUnlockBaseAddress(v8, 0);
        CGContextRelease(v16);
      }
      objc_msgSend(v4, "finishWithComposedVideoFrame:", v8, (void)v36);
      CFRelease(v8);
    }
  }
}

- (int)videoTrackID
{
  return self->_videoTrackID;
}

- (void)setVideoTrackID:(int)a3
{
  self->_videoTrackID = a3;
}

- (CGAffineTransform)videoTransform
{
  objc_copyStruct(retstr, &self->_videoTransform, 48, 1, 0);
  return result;
}

- (void)setVideoTransform:(CGAffineTransform *)a3
{
}

- (CGRect)videoRect
{
  objc_copyStruct(v6, &self->_videoRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVideoRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_videoRect, &v3, 32, 1, 0);
}

- (CGImage)introImage
{
  return self->_introImage;
}

- (void)setIntroImage:(CGImage *)a3
{
  self->_introImage = a3;
}

- (ETMessageFrameRenderer)sketchMessageRenderer
{
  return (ETMessageFrameRenderer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSketchMessageRenderer:(id)a3
{
}

- (NSArray)sceneMessageRenderers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSceneMessageRenderers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneMessageRenderers, 0);
  objc_storeStrong((id *)&self->_sketchMessageRenderer, 0);
  objc_storeStrong((id *)&self->_outputPixelBufferAttributes, 0);

  objc_storeStrong((id *)&self->_inputPixelBufferAttributes, 0);
}

@end