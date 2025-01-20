@interface CIPortraitToothMask
- (CIImage)inputImage;
- (NSDictionary)inputFaceLandmarks;
- (id)outputImage;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIPortraitToothMask

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
      sub_4C1A8();
    }
    double v12 = v7;
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    id v15 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_inputFaceLandmarks, "objectForKeyedSubscript:", @"orientation"), "intValue");
    memset(&v53, 0, sizeof(v53));
    v16 = self->_inputImage;
    if (v16) {
      [(CIImage *)v16 imageTransformForOrientation:v15];
    }
    CGAffineTransform v51 = v53;
    memset(&v52, 0, sizeof(v52));
    CGAffineTransformInvert(&v52, &v51);
    CGAffineTransform v51 = v53;
    v59.origin.double x = v12;
    v59.origin.double y = v11;
    double v43 = v14;
    double v44 = v13;
    v59.size.double width = v13;
    v59.size.double height = v14;
    CGRect v60 = CGRectApplyAffineTransform(v59, &v51);
    double x = v60.origin.x;
    double y = v60.origin.y;
    double height = v60.size.height;
    double width = v60.size.width;
    memset(&v51, 0, 32);
    sub_294F0([(NSDictionary *)self->_inputFaceLandmarks objectForKeyedSubscript:@"faceBoundingBox"], &v51);
    v19.f64[0] = width;
    v51.a = x + v51.a * width;
    v51.b = y + v51.b * height;
    v19.f64[1] = height;
    *(float64x2_t *)&v51.c = vmulq_f64(v19, *(float64x2_t *)&v51.c);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v20 = [(NSDictionary *)self->_inputFaceLandmarks objectForKeyedSubscript:@"outerLips"];
    id v21 = [v20 countByEnumeratingWithState:&v47 objects:v58 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v48;
      double v24 = 1.17549435e-38;
      double v25 = 3.40282347e38;
      double v26 = 3.40282347e38;
      double v27 = 1.17549435e-38;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v20);
          }
          v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          double v45 = 0.0;
          double v46 = 0.0;
          sub_295D4(v29, &v45, v51.a, v51.b, v51.c, v51.d);
          double v30 = v52.tx + v46 * v52.c + v52.a * v45;
          double v31 = v52.ty + v46 * v52.d + v52.b * v45;
          double v25 = fmin(v25, v30);
          double v26 = fmin(v26, v31);
          double v24 = fmax(v24, v30);
          double v27 = fmax(v27, v31);
        }
        id v22 = [v20 countByEnumeratingWithState:&v47 objects:v58 count:16];
      }
      while (v22);
    }
    else
    {
      double v24 = 1.17549435e-38;
      double v25 = 3.40282347e38;
      double v26 = 3.40282347e38;
      double v27 = 1.17549435e-38;
    }
    double v32 = floor(v25);
    double v33 = floor(v26);
    double v34 = ceil(v24 - v25 + 1.0);
    double v35 = ceil(v27 - v26 + 1.0);
    id v36 = sub_3E1EC((uint64_t)self->_inputFaceLandmarks);
    v56[0] = @"teethROI";
    v57[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v32, v33, v34, v35);
    v57[1] = v36;
    v56[1] = @"faceLandmarks";
    v56[2] = @"inputImageExtent";
    v57[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v12, v11, v44, v43);
    v56[3] = @"inputImageTransformN1";
    v57[3] = +[NSData dataWithBytes:&v53 length:48];
    v56[4] = @"inputImageTransform1N";
    v37 = +[NSData dataWithBytes:&v52 length:48];
    v56[5] = @"useMetal";
    v57[4] = v37;
    v57[5] = &__kCFBooleanTrue;
    v38 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:6];
    v39 = +[NSMutableDictionary dictionaryWithDictionary:v38];
    [(NSMutableDictionary *)v39 setObject:&__kCFBooleanFalse forKeyedSubscript:@"useMetal"];
    double v45 = 0.0;
    v55 = inputImage;
    id v40 = +[CIPortraitToothMaskProcessor applyWithExtent:inputs:arguments:error:](CIPortraitToothMaskProcessor, "applyWithExtent:inputs:arguments:error:", +[NSArray arrayWithObjects:&v55 count:1], v38, &v45, v32, v33, v34, v35);
    v54 = inputImage;
    return +[CIImage imageForRenderingWithMetal:orNonMetal:](CIImage, "imageForRenderingWithMetal:orNonMetal:", v40, +[CIPortraitToothMaskProcessor applyWithExtent:inputs:arguments:error:](CIPortraitToothMaskProcessor, "applyWithExtent:inputs:arguments:error:", +[NSArray arrayWithObjects:&v54 count:1], v39, &v45, v32, v33, v34, v35));
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