@interface CICameraCalibrationLensCorrection
+ (id)customAttributes;
- (AVCameraCalibrationData)inputAVCameraCalibrationData;
- (CGPoint)ReferenceensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6;
- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5;
- (CIImage)inputImage;
- (NSNumber)inputUseInverseLookUpTable;
- (id)outputImage;
- (void)setInputAVCameraCalibrationData:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputUseInverseLookUpTable:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CICameraCalibrationLensCorrection

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryDistortionEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"12";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.14";
  v6[3] = @"inputUseInverseLookUpTable";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeBoolean";
  v4[1] = MEMORY[0x1E4F1CC28];
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  int v7 = [a4 isEqualToString:@"inputImage"];
  if (a3)
  {
    if (v7)
    {
      v8 = (void *)[a3 depthData];
      if (AVFDepthCameraCalibrationData(v8, v9))
      {
        if (!self->inputAVCameraCalibrationData)
        {
          v10 = (void *)[a3 depthData];
          [(CICameraCalibrationLensCorrection *)self setValue:AVFDepthCameraCalibrationData(v10, v11) forKey:@"inputAVCameraCalibrationData"];
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CICameraCalibrationLensCorrection;
  [(CICameraCalibrationLensCorrection *)&v12 setValue:a3 forKey:a4];
}

- (CGPoint)ReferenceensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a6.width - a5.x;
  if (x > v9) {
    double v9 = x;
  }
  float v10 = v9;
  double v11 = a6.height - a5.y;
  if (y > v11) {
    double v11 = y;
  }
  float v12 = v11;
  float v13 = sqrtf((float)(v12 * v12) + (float)(v10 * v10));
  float v14 = a3.x - x;
  float v15 = a3.y - y;
  float v16 = sqrtf((float)(v15 * v15) + (float)(v14 * v14));
  uint64_t v17 = [a4 bytes];
  unint64_t v18 = ((unint64_t)[a4 length] >> 2) - 1;
  if (v16 >= v13)
  {
    float v20 = *(float *)(v17 + 4 * v18);
  }
  else
  {
    float v19 = (float)(v16 * (float)v18) / v13;
    float v20 = (float)((float)(v19 - (float)(int)v19) * *(float *)(v17 + 4 * (int)v19 + 4))
        + (float)((float)(1.0 - (float)(v19 - (float)(int)v19)) * *(float *)(v17 + 4 * (int)v19));
  }
  float v21 = v15 + (float)(v20 * v15);
  double v22 = x + (float)(v14 + (float)(v20 * v14));
  double v23 = y + v21;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a3 < 1)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    float v13 = (void *)[a5 valueForKey:@"inputExtent"];
    [v13 X];
    [v13 Y];
    [v13 Z];
    double v63 = v14;
    [v13 W];
    double v68 = v15;
    uint64_t v16 = [a5 valueForKey:@"lookUpTable"];
    uint64_t v17 = (void *)[a5 valueForKey:@"opticalCenter"];
    [v17 X];
    double v67 = v18;
    [v17 Y];
    double v66 = v19;
    double v8 = *MEMORY[0x1E4F1DB20];
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v20 = 2.0;
    if (width >= 2.0) {
      double v21 = width;
    }
    else {
      double v21 = 2.0;
    }
    float v22 = v21;
    if (height >= 2.0) {
      double v20 = height;
    }
    float v23 = v20;
    float v52 = v23;
    float v53 = v22;
    double v49 = y + v23;
    double v50 = v23;
    double v51 = v22;
    double v48 = x + v22;
    float v24 = 0.0;
    double v25 = 0.0;
    do
    {
      float v65 = v24;
      CGFloat v26 = x + (float)(v24 * v53);
      CGFloat v27 = v7;
      CGFloat v28 = v8;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, v26, y, v67, v66, v63, v68);
      v81.origin.double x = v29;
      v81.origin.double y = v30;
      v69.size.double width = 0.0;
      v69.size.double height = 0.0;
      v81.size.double width = 0.0;
      v81.size.double height = 0.0;
      v69.origin.double x = v26;
      v69.origin.double y = y;
      CGRect v82 = CGRectUnion(v69, v81);
      v70.origin.double x = v28;
      v70.origin.double y = v9;
      v70.size.double width = v6;
      v70.size.double height = v27;
      CGRect v71 = CGRectUnion(v70, v82);
      CGFloat v59 = v71.origin.y;
      CGFloat v61 = v71.origin.x;
      CGFloat v55 = v71.size.height;
      CGFloat v57 = v71.size.width;
      double v31 = 1.0 - v25;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, x + v51 * v31, v49, v67, v66, v63, v68);
      v83.origin.double x = v32;
      v83.origin.double y = v33;
      v72.size.double width = 0.0;
      v72.size.double height = 0.0;
      v83.size.double width = 0.0;
      v83.size.double height = 0.0;
      v72.origin.double x = x + v51 * v31;
      v72.origin.double y = v49;
      CGRect v84 = CGRectUnion(v72, v83);
      v73.origin.double y = v59;
      v73.origin.double x = v61;
      v73.size.double height = v55;
      v73.size.double width = v57;
      CGRect v74 = CGRectUnion(v73, v84);
      CGFloat v60 = v74.origin.y;
      CGFloat v62 = v74.origin.x;
      CGFloat v56 = v74.size.height;
      CGFloat v58 = v74.size.width;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, x, y + v50 * v31, v67, v66, v63, v68);
      v85.origin.double x = v34;
      v85.origin.double y = v35;
      v75.size.double width = 0.0;
      v75.size.double height = 0.0;
      v85.size.double width = 0.0;
      v85.size.double height = 0.0;
      v75.origin.double x = x;
      v75.origin.double y = y + v50 * v31;
      CGRect v86 = CGRectUnion(v75, v85);
      v76.origin.double y = v60;
      v76.origin.double x = v62;
      v76.size.double height = v56;
      v76.size.double width = v58;
      CGRect v77 = CGRectUnion(v76, v86);
      CGFloat v36 = v77.origin.x;
      CGFloat v37 = v77.origin.y;
      CGFloat v38 = v77.size.width;
      CGFloat v39 = v77.size.height;
      -[CICameraCalibrationLensCorrection ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:](self, "ReferenceensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v16, v48, y + (float)(v65 * v52), v67, v66, v63, v68);
      v87.origin.double x = v40;
      v87.origin.double y = v41;
      v78.size.double width = 0.0;
      v78.size.double height = 0.0;
      v87.size.double width = 0.0;
      v87.size.double height = 0.0;
      v78.origin.double x = v48;
      v78.origin.double y = y + (float)(v65 * v52);
      CGRect v88 = CGRectUnion(v78, v87);
      v79.origin.double x = v36;
      v79.origin.double y = v37;
      v79.size.double width = v38;
      v79.size.double height = v39;
      *(CGRect *)(&v7 - 3) = CGRectUnion(v79, v88);
      double v8 = v42;
      CGFloat v9 = v43;
      double v6 = v44;
      float v24 = v65 + 0.125;
      double v25 = (float)(v65 + 0.125);
    }
    while (v25 < 0.99999);
  }
  else
  {
    double v6 = (double)(int)objc_msgSend((id)objc_msgSend(a5, "valueForKey:", @"lookUpTableLength", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "intValue");
    double v7 = 1.0;
    double v8 = 0.0;
    CGFloat v9 = 0.0;
  }
  double v45 = v8;
  double v46 = v9;
  double v47 = v6;
  result.size.double height = v7;
  result.size.double width = v47;
  result.origin.double y = v46;
  result.origin.double x = v45;
  return result;
}

- (id)outputImage
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id result = self->inputImage;
  if (result)
  {
    if (!self->inputAVCameraCalibrationData) {
      return 0;
    }
    [result extent];
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
    if (CGRectIsInfinite(v38)) {
      return 0;
    }
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    if (CGRectIsNull(v39))
    {
      return 0;
    }
    else
    {
      BOOL v9 = [(NSNumber *)self->inputUseInverseLookUpTable BOOLValue];
      inputAVCameraCalibrationData = self->inputAVCameraCalibrationData;
      if (v9) {
        double v11 = AVCameraCalibrationDataInverseLensDistortionLookupTable(inputAVCameraCalibrationData, v8);
      }
      else {
        double v11 = AVCameraCalibrationDataLensDistortionLookupTable(inputAVCameraCalibrationData, v8);
      }
      float v12 = v11;
      unint64_t v13 = [v11 length];
      unint64_t v14 = v13 >> 2;
      double v15 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(self->inputAVCameraCalibrationData);
      double v17 = v16;
      [(CIImage *)self->inputImage extent];
      double v20 = v19;
      double v21 = v18;
      if (v15 > v19 || v17 > v18)
      {
        double v23 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(self->inputAVCameraCalibrationData);
        if (v20 <= v21) {
          double v25 = v21;
        }
        else {
          double v25 = v20;
        }
        if (v23 <= v24) {
          double v23 = v24;
        }
        float v26 = v25 / v23;
        double v27 = v26;
        double v15 = v15 * v27;
        double v17 = v17 * v27;
      }
      double v28 = v20 - v15;
      if (v15 > v20 - v15) {
        double v28 = v15;
      }
      float v29 = v28;
      double v30 = v21 - v17;
      if (v17 > v21 - v17) {
        double v30 = v17;
      }
      float v31 = v30;
      float v32 = sqrtf((float)(v31 * v31) + (float)(v29 * v29));
      CGFloat v33 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v12, v13 & 0xFFFFFFFFFFFFFFFCLL, 2307, 0, (double)v14, 1.0);
      CGFloat v34 = +[CIKernel kernelWithInternalRepresentation:&CI::_radialLensDistortion];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __48__CICameraCalibrationLensCorrection_outputImage__block_invoke;
      v36[3] = &unk_1E5771130;
      *(double *)&v36[6] = x;
      *(double *)&v36[7] = y;
      *(double *)&v36[8] = width;
      *(double *)&v36[9] = height;
      v36[4] = self;
      v36[5] = v12;
      v36[10] = v14;
      inputImage = self->inputImage;
      *(double *)&v36[11] = v15;
      *(double *)&v36[12] = v17;
      v37[0] = inputImage;
      v37[1] = v33;
      v37[2] = +[CIVector vectorWithX:v15 Y:v17 Z:v32 W:(double)v14];
      return -[CIKernel applyWithExtent:roiCallback:arguments:options:](v34, "applyWithExtent:roiCallback:arguments:options:", v36, [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3], 0, x, y, width, height);
    }
  }
  return result;
}

uint64_t __48__CICameraCalibrationLensCorrection_outputImage__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  float v12 = *(void **)(a1 + 32);
  v16[0] = @"inputExtent";
  unint64_t v13 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v14 = *(void *)(a1 + 40);
  v17[0] = v13;
  v17[1] = v14;
  v16[1] = @"lookUpTable";
  v16[2] = @"lookUpTableLength";
  v17[2] = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 80)];
  v16[3] = @"opticalCenter";
  v17[3] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(v12, "regionOf:destRect:userInfo:", a2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, v16, 4), a3, a4, a5, a6);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (AVCameraCalibrationData)inputAVCameraCalibrationData
{
  return self->inputAVCameraCalibrationData;
}

- (void)setInputAVCameraCalibrationData:(id)a3
{
}

- (NSNumber)inputUseInverseLookUpTable
{
  return self->inputUseInverseLookUpTable;
}

- (void)setInputUseInverseLookUpTable:(id)a3
{
}

@end