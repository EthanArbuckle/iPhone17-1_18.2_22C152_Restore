@interface VNBlurSignature
+ (id)computeBlurSignatureForGrayscaleImage:(__CVBuffer *)a3 error:(id *)a4;
- (VNBlurSignature)initWithSignatureData:(void *)a3;
- (void)dealloc;
- (void)getSignatureData;
- (void)setSignatureData:(void *)a3;
@end

@implementation VNBlurSignature

- (void)getSignatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(void *)a3
{
  self->_signatureData = a3;
}

- (VNBlurSignature)initWithSignatureData:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNBlurSignature;
  result = [(VNBlurSignature *)&v5 init];
  if (result) {
    result->_signatureData = a3;
  }
  return result;
}

- (void)dealloc
{
  signatureData = (void **)self->_signatureData;
  if (signatureData)
  {
    free(signatureData[2]);
    free(signatureData);
  }
  v4.receiver = self;
  v4.super_class = (Class)VNBlurSignature;
  [(VNBlurSignature *)&v4 dealloc];
}

+ (id)computeBlurSignatureForGrayscaleImage:(__CVBuffer *)a3 error:(id *)a4
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v17.data = CVPixelBufferGetBaseAddress(a3);
  v17.height = Height;
  v17.width = Width;
  v17.rowBytes = BytesPerRow;
  uint64_t v16 = 0;
  int v15 = 0;
  unint64_t v10 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurScoreForPlanar8Image((vision::mod::image_quality::BlurMeasure *)&v17, (vImage_Buffer *)&v15, 0, 0.0, 0, (int *)&v16, v9);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v10 == 2688)
  {
    v11 = [VNBlurSignature alloc];
    v12 = [(VNBlurSignature *)v11 initWithSignatureData:v16];
  }
  else
  {
    if (a4)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error while computing blur score: %s", CVML_getStatusDescription(v10));
      *a4 = +[VNError errorWithCode:3 message:v13];
    }
    v12 = 0;
  }

  return v12;
}

@end