@interface CIPortraitFaceMask
- (CIImage)inputImage;
- (NSDictionary)inputFaceLandmarks;
- (id)outputImage;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPortraitFaceMask

- (id)outputImage
{
  inputImage = self->_inputImage;
  inputFaceLandmarks = self->_inputFaceLandmarks;
  if (inputFaceLandmarks) {
    BOOL v5 = inputImage == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  id result = [(NSDictionary *)inputFaceLandmarks count];
  if (!result) {
    return result;
  }
  if ([(NSDictionary *)self->_inputFaceLandmarks sanityCheckStatus] != 1) {
    return 0;
  }
  unsigned int v7 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_inputFaceLandmarks, "objectForKeyedSubscript:", @"orientation"), "intValue");
  [(CIImage *)self->_inputImage extent];
  CGFloat width = v82.size.width;
  CGFloat height = v82.size.height;
  if (CGRectIsInfinite(v82))
  {
    long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v44.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v44.c = v10;
    *(_OWORD *)&v44.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    v48.a = 1.0;
    v48.b = 0.0;
    v48.c = 0.0;
    v48.d = 1.0;
    v48.tdouble x = 0.0;
    v48.tdouble y = 0.0;
    unint64_t v49 = 0xBFF0000000000000;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0x3FF0000000000000;
    CGFloat v53 = width;
    long long v54 = xmmword_55F30;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    unint64_t v57 = 0xBFF0000000000000;
    CGFloat v58 = width;
    CGFloat v59 = height;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    uint64_t v60 = 0x3FF0000000000000;
    long long v63 = xmmword_55F40;
    CGFloat v64 = height;
    long long v65 = xmmword_55F30;
    long long v66 = xmmword_55F40;
    CGFloat v67 = height;
    CGFloat v68 = width;
    long long v69 = xmmword_55F30;
    uint64_t v72 = 0;
    uint64_t v70 = 0x3FF0000000000000;
    uint64_t v71 = 0;
    CGFloat v73 = width;
    long long v74 = xmmword_55F50;
    long long v77 = 0u;
    long long v76 = 0u;
    uint64_t v75 = 0x3FF0000000000000;
    uint64_t v78 = 0x3FF0000000000000;
    long long v79 = xmmword_55F40;
    CGFloat v80 = height;
    uint64_t v81 = 0;
    if (v7 - 9 >= 0xFFFFFFF8) {
      signed int v11 = v7 - 1;
    }
    else {
      signed int v11 = 0;
    }
    v12 = &v48 + v11;
    long long v13 = *(_OWORD *)&v12->tx;
    long long v14 = *(_OWORD *)&v12->a;
    *(_OWORD *)&v44.c = *(_OWORD *)&v12->c;
    *(_OWORD *)&v44.tdouble x = v13;
    *(_OWORD *)&v44.a = v14;
  }
  memset(&v48, 0, sizeof(v48));
  CGAffineTransform v43 = v44;
  CGAffineTransformInvert(&v48, &v43);
  if (v7 != 1)
  {
    CGAffineTransform v42 = v44;
    inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v42];
  }
  [(CIImage *)inputImage extent];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(NSDictionary *)self->_inputFaceLandmarks coreImageROIrect];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [(NSDictionary *)self->_inputFaceLandmarks imageWidthScale];
  float v32 = v20 / v31;
  CGAffineTransformMakeScale(&v41, v32, v32);
  v83.origin.double x = v24;
  v83.origin.double y = v26;
  v83.size.CGFloat width = v28;
  v83.size.CGFloat height = v30;
  CGRect v84 = CGRectApplyAffineTransform(v83, &v41);
  CGRect v85 = CGRectInset(v84, -1.0, -1.0);
  NSRect v86 = NSIntegralRectWithOptions(v85, 0xF00uLL);
  double x = v86.origin.x;
  double y = v86.origin.y;
  double v35 = v86.size.width;
  double v36 = v86.size.height;
  id v37 = sub_3E1EC((uint64_t)self->_inputFaceLandmarks);
  v46[0] = @"faceROI";
  v47[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, v35, v36);
  v47[1] = v37;
  v46[1] = @"faceLandmarks";
  v46[2] = @"inputImageExtent";
  v47[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v16, v18, v20, v22);
  v38 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
  uint64_t v40 = 0;
  v45 = inputImage;
  id result = +[CIPortraitFaceMaskProcessorKernel applyWithExtent:inputs:arguments:error:](CIPortraitFaceMaskProcessorKernel, "applyWithExtent:inputs:arguments:error:", +[NSArray arrayWithObjects:&v45 count:1], v38, &v40, x, y, v35, v36);
  if (v7 != 1)
  {
    CGAffineTransform v39 = v48;
    return [result imageByApplyingTransform:&v39];
  }
  return result;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)inputFaceLandmarks
{
  return self->_inputFaceLandmarks;
}

- (void)setInputFaceLandmarks:(id)a3
{
}

@end