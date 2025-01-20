@interface VNHomeAppFaceAnalyzerMultiDetectorBase
- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6;
- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
@end

@implementation VNHomeAppFaceAnalyzerMultiDetectorBase

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v6 = (vImage_Buffer *)malloc_type_calloc(0x20uLL, 1uLL, 0xE34159ABuLL);
  if (v6)
  {
    v6->data = CVPixelBufferGetBaseAddress(a3);
    v6->height = CVPixelBufferGetHeight(a3);
    v6->width = CVPixelBufferGetWidth(a3);
    v6->rowBytes = CVPixelBufferGetBytesPerRow(a3);
  }
  else if (a4)
  {
    *a4 = +[VNError errorForMemoryAllocationFailure];
  }
  return v6;
}

- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = [v10 width];
  unint64_t v12 = [v10 height];
  if (v11 == [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth]
    && v12 == -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight")&& ([v9 unalignedBoundingBox], v27.origin.x = 0.0, v27.origin.y = 0.0, v27.size.width = 1.0, v27.size.height = 1.0, CGRectEqualToRect(v25, v27)))
  {
    [v9 unalignedBoundingBox];
    double v14 = v13 * (double)v11;
    double v16 = v15 * (double)v11;
    double v18 = v17 * (double)v12;
    double v20 = v19 * (double)v12;
  }
  else
  {
    if (a6)
    {
      *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: input specifications are invalid for executing this request"];
    }
    double v14 = *MEMORY[0x1E4F1DB20];
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v21 = v14;
  double v22 = v18;
  double v23 = v16;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

@end