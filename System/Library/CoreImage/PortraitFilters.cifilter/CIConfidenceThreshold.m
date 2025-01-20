@interface CIConfidenceThreshold
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputFocusRect;
- (NSNumber)inputScale;
- (id)outputImage;
- (id)thresholdKernel;
- (id)transitionDepthsKernel;
- (void)setInputFocusRect:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIConfidenceThreshold

- (id)thresholdKernel
{
  if (qword_8C8E0 != -1) {
    dispatch_once(&qword_8C8E0, &stru_74980);
  }
  return (id)qword_8C8D8;
}

+ (id)customAttributes
{
  v8[0] = kCIAttributeFilterCategories;
  v7[0] = kCICategoryColorAdjustment;
  v7[1] = kCICategoryStillImage;
  v7[2] = kCICategoryBuiltIn;
  v7[3] = kCICategoryApplePrivate;
  v9[0] = +[NSArray arrayWithObjects:v7 count:4];
  v9[1] = @"11";
  v8[1] = kCIAttributeFilterAvailable_iOS;
  v8[2] = kCIAttributeFilterAvailable_Mac;
  v9[2] = @"10.13";
  v8[3] = @"inputNeedsGammaCorrection";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &__kCFBooleanTrue;
  v6[1] = kCIAttributeTypeBoolean;
  v9[3] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[4] = @"inputScale";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_799C0;
  v4[1] = kCIAttributeTypeScalar;
  v9[4] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)transitionDepthsKernel
{
  if (qword_8C8F0 != -1) {
    dispatch_once(&qword_8C8F0, &stru_749A0);
  }
  return (id)qword_8C8E8;
}

- (id)outputImage
{
  if (self->inputImage)
  {
    [(NSNumber *)self->inputScale floatValue];
    inputImage = self->inputImage;
    CGAffineTransformMakeScale(&v46, v4, v4);
    v5 = [(CIImage *)inputImage imageByApplyingTransform:&v46];
    [(CIImage *)v5 extent];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v51 = kCIKernelOutputFormat;
    v52 = +[NSNumber numberWithInt:kCIFormatRh];
    v14 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    v15 = -[CIImage imageByClampingToExtent](-[CIImage imageByCroppingToRect:]([[(CIImage *)v5 imageByClampingToExtent] imageByApplyingFilter:@"PFSobelHV"], "imageByCroppingToRect:", v7, v9, v11, v13), "imageByClampingToExtent");
    v49 = kCIInputRadiusKey;
    v50 = &off_799D0;
    v16 = -[CIImage imageByCroppingToRect:]([(CIImage *)v15 imageByApplyingFilter:@"CIMorphologyMaximum" withInputParameters:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1)], "imageByCroppingToRect:", v7, v9, v11, v13);
    id v17 = [(CIConfidenceThreshold *)self transitionDepthsKernel];
    v48[0] = v16;
    v48[1] = v5;
    id v18 = objc_msgSend(v17, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2), v14, v7, v9, v11, v13);
    uint64_t v40 = 0;
    v41 = (double *)&v40;
    uint64_t v42 = 0x4010000000;
    v43 = "";
    long long v44 = 0u;
    long long v45 = 0u;
    [v18 extent];
    *(void *)&long long v44 = v19;
    *((void *)&v44 + 1) = v20;
    *(void *)&long long v45 = v21;
    *((void *)&v45 + 1) = v22;
    [(CIVector *)self->inputFocusRect CGRectValue];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGAffineTransformMakeScale(&v39, v11, v13);
    v54.origin.double x = v24;
    v54.origin.double y = v26;
    v54.size.double width = v28;
    v54.size.double height = v30;
    CGRect v55 = CGRectApplyAffineTransform(v54, &v39);
    double x = v55.origin.x;
    double y = v55.origin.y;
    double width = v55.size.width;
    double height = v55.size.height;
    id v35 = [(CIConfidenceThreshold *)self thresholdKernel];
    v47[0] = v18;
    v47[1] = v5;
    v47[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", x, y, width, height, _NSConcreteStackBlock, 3221225472, sub_52EC, &unk_749C8, &v40);
    v47[3] = +[CIVector vectorWithX:v41[6] Y:v41[7]];
    id v36 = objc_msgSend(objc_msgSend(v35, "applyWithExtent:roiCallback:arguments:options:", &v38, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4), v14, 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
    _Block_object_dispose(&v40, 8);
    return v36;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end