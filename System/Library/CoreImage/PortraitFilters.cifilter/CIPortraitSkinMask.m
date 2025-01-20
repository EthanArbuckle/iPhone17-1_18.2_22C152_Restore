@interface CIPortraitSkinMask
- (CIImage)inputImage;
- (NSDictionary)inputFaceLandmarks;
- (id)outputImage;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPortraitSkinMask

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
  if (result)
  {
    [(CIImage *)self->_inputImage extent];
    if (v7 != 0.0 || (double v11 = v8, v8 != 0.0)) {
      sub_4CAC4();
    }
    double v12 = v7;
    CGFloat v13 = v9;
    double v14 = v10;
    id v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_inputFaceLandmarks, "objectForKeyedSubscript:", @"orientation"), "intValue");
    memset(&v65, 0, sizeof(v65));
    v16 = self->_inputImage;
    if (v16) {
      [(CIImage *)v16 imageTransformForOrientation:v15];
    }
    CGAffineTransform v63 = v65;
    memset(&v64, 0, sizeof(v64));
    CGAffineTransformInvert(&v64, &v63);
    CGAffineTransform v62 = v65;
    v71.origin.double x = v12;
    v71.origin.double y = v11;
    double v51 = v13;
    v71.size.double width = v13;
    v71.size.double height = v14;
    CGRect v72 = CGRectApplyAffineTransform(v71, &v62);
    double x = v72.origin.x;
    double y = v72.origin.y;
    double height = v72.size.height;
    double width = v72.size.width;
    sub_294F0([(NSDictionary *)self->_inputFaceLandmarks objectForKeyedSubscript:@"faceBoundingBox"], &v59);
    v19.f64[0] = width;
    double v59 = x + v59 * width;
    double v60 = y + v60 * height;
    v19.f64[1] = height;
    float64x2_t v61 = vmulq_f64(v19, v61);
    id v20 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_inputFaceLandmarks, "objectForKeyedSubscript:", @"noseCrest"), "objectAtIndex:", 0);
    sub_295D4(v20, v58.f64, v59, v60, v61.f64[0], v61.f64[1]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    float64x2_t v58 = vaddq_f64(*(float64x2_t *)&v64.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v64.c, v58.f64[1]), *(float64x2_t *)&v64.a, v58.f64[0]));
    id v21 = [(NSDictionary *)self->_inputFaceLandmarks objectForKeyedSubscript:@"faceContour"];
    id v22 = [v21 countByEnumeratingWithState:&v54 objects:v70 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v55;
      double v25 = 3.40282347e38;
      double v26 = 1.17549435e-38;
      double v27 = 1.17549435e-38;
      double v28 = 3.40282347e38;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v21);
          }
          sub_295D4(*(void **)(*((void *)&v54 + 1) + 8 * i), &v52, v59, v60, v61.f64[0], v61.f64[1]);
          double v30 = v64.tx + v53 * v64.c + v64.a * v52;
          double v31 = v64.ty + v53 * v64.d + v64.b * v52;
          double v32 = -(v30 - v58.f64[0] * 2.0);
          double v33 = -(v31 - v58.f64[1] * 2.0);
          double v28 = fmin(fmin(v28, v30), v32);
          double v25 = fmin(fmin(v25, v31), v33);
          double v27 = fmax(fmax(v27, v30), v32);
          double v26 = fmax(fmax(v26, v31), v33);
        }
        id v23 = [v21 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v23);
    }
    else
    {
      double v25 = 3.40282347e38;
      double v26 = 1.17549435e-38;
      double v27 = 1.17549435e-38;
      double v28 = 3.40282347e38;
    }
    double v34 = v27 - v28;
    float v35 = (v27 - v28) * 0.200000003;
    double v36 = v26 - v25;
    float v37 = (v26 - v25) * 0.200000003;
    double v38 = v35;
    double v39 = floor(v28 + v38 * -0.5);
    double v40 = v37;
    double v41 = floor(v25 + v40 * -0.5);
    double v42 = ceil(v34 + 1.0 + v38);
    double v43 = ceil(v36 + 1.0 + v40);
    id v44 = sub_3E1EC((uint64_t)self->_inputFaceLandmarks);
    v68[0] = @"faceROI";
    v69[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v39, v41, v42, v43);
    v69[1] = v44;
    v68[1] = @"faceLandmarks";
    v68[2] = @"inputImageExtent";
    v69[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v12, v11, v51, v14);
    v68[3] = @"inputImageTransformN1";
    v69[3] = +[NSData dataWithBytes:&v65 length:48];
    v68[4] = @"inputImageTransform1N";
    v45 = +[NSData dataWithBytes:&v64 length:48];
    v68[5] = @"useMetal";
    v69[4] = v45;
    v69[5] = &__kCFBooleanTrue;
    v46 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:6];
    v47 = +[NSMutableDictionary dictionaryWithDictionary:v46];
    [(NSMutableDictionary *)v47 setObject:&__kCFBooleanFalse forKeyedSubscript:@"useMetal"];
    double v52 = 0.0;
    v67 = inputImage;
    id v48 = +[CIPortraitSkinMaskProcessor applyWithExtent:inputs:arguments:error:](CIPortraitSkinMaskProcessor, "applyWithExtent:inputs:arguments:error:", +[NSArray arrayWithObjects:&v67 count:1], v46, &v52, v39, v41, v42, v43);
    v66 = inputImage;
    return +[CIImage imageForRenderingWithMetal:orNonMetal:](CIImage, "imageForRenderingWithMetal:orNonMetal:", v48, +[CIPortraitSkinMaskProcessor applyWithExtent:inputs:arguments:error:](CIPortraitSkinMaskProcessor, "applyWithExtent:inputs:arguments:error:", +[NSArray arrayWithObjects:&v66 count:1], v47, &v52, v39, v41, v42, v43));
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