@interface CICircularWrap
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CICircularWrap

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_circularWrap];
}

- (id)outputImage
{
  v85[5] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  if (fabsf(v3) >= 0.001 && self->inputCenter)
  {
    [(CIImage *)self->inputImage extent];
    double v8 = v7;
    id result = 0;
    if (v7 <= 20000.0)
    {
      double v10 = v6;
      if (v6 <= 20000.0)
      {
        uint64_t v76 = v5;
        uint64_t v77 = v4;
        [(NSNumber *)self->inputRadius floatValue];
        if (v11 >= 0.01) {
          float v12 = v11;
        }
        else {
          float v12 = 0.01;
        }
        double v74 = v10;
        float v13 = v10 + v12 + -1.0;
        float v81 = -v12;
        [(NSNumber *)self->inputAngle floatValue];
        double v75 = v8;
        double v15 = (v8 + -1.0) / v12;
        float v16 = v14 - v15;
        if (v14 >= v16) {
          float v17 = v14;
        }
        else {
          float v17 = v14 - v15;
        }
        float v83 = v17;
        if (v14 >= v16) {
          float v18 = v16;
        }
        else {
          float v18 = v14;
        }
        float v19 = v14 - v18;
        float v20 = (v8 + -1.0) / (float)((float)(v16 - v18) - v19);
        float v79 = v20;
        float v80 = -(float)(v19 * v20);
        [(CIVector *)self->inputCenter X];
        float v22 = v21;
        [(CIVector *)self->inputCenter Y];
        float v24 = v23;
        __float2 v25 = __sincosf_stret(v18);
        float v26 = v22 + (float)(v12 * v25.__cosval);
        float v27 = v24 + (float)(v12 * v25.__sinval);
        float v78 = v13;
        float v28 = v22 + (float)(v13 * v25.__cosval);
        float v29 = v24 + (float)(v13 * v25.__sinval);
        if (v28 > v26) {
          float v30 = v22 + (float)(v13 * v25.__cosval);
        }
        else {
          float v30 = v22 + (float)(v12 * v25.__cosval);
        }
        if (v28 >= v26) {
          float v31 = v30;
        }
        else {
          float v31 = v22 + (float)(v12 * v25.__cosval);
        }
        if (v28 >= v26) {
          float v32 = v22 + (float)(v12 * v25.__cosval);
        }
        else {
          float v32 = v28;
        }
        if (v29 > v27) {
          float v33 = v29;
        }
        else {
          float v33 = v24 + (float)(v12 * v25.__sinval);
        }
        if (v29 >= v27) {
          float v34 = v33;
        }
        else {
          float v34 = v24 + (float)(v12 * v25.__sinval);
        }
        if (v29 >= v27) {
          float v35 = v24 + (float)(v12 * v25.__sinval);
        }
        else {
          float v35 = v29;
        }
        __float2 v36 = __sincosf_stret(v83);
        float v37 = v22 + (float)(v12 * v36.__cosval);
        float v38 = v24 + (float)(v12 * v36.__sinval);
        if (v37 > v31) {
          float v39 = v22 + (float)(v12 * v36.__cosval);
        }
        else {
          float v39 = v31;
        }
        if (v37 >= v32) {
          float v40 = v39;
        }
        else {
          float v40 = v31;
        }
        if (v37 >= v32) {
          float v37 = v32;
        }
        if (v38 > v34) {
          float v41 = v24 + (float)(v12 * v36.__sinval);
        }
        else {
          float v41 = v34;
        }
        if (v38 >= v35) {
          float v42 = v41;
        }
        else {
          float v42 = v34;
        }
        if (v38 >= v35) {
          float v38 = v35;
        }
        float v43 = v22 + (float)(v78 * v36.__cosval);
        float v44 = v24 + (float)(v78 * v36.__sinval);
        if (v43 > v40) {
          float v45 = v22 + (float)(v78 * v36.__cosval);
        }
        else {
          float v45 = v40;
        }
        if (v43 >= v37)
        {
          float v46 = v37;
        }
        else
        {
          float v45 = v40;
          float v46 = v22 + (float)(v78 * v36.__cosval);
        }
        if (v44 > v42) {
          float v47 = v24 + (float)(v78 * v36.__sinval);
        }
        else {
          float v47 = v42;
        }
        if (v44 < v38) {
          float v47 = v42;
        }
        float v82 = v18;
        int v48 = vcvtpd_s64_f64(v18 / 1.57079633);
        if (v44 < v38) {
          float v38 = v24 + (float)(v78 * v36.__sinval);
        }
        signed int v49 = vcvtpd_s64_f64(v83 / 1.57079633);
        if (v48 >= v49)
        {
          uint64_t v59 = v76;
          uint64_t v58 = v77;
          double v61 = v74;
          double v60 = v75;
        }
        else
        {
          double v50 = v43;
          double v51 = v44;
          if (v12 <= v78) {
            float v52 = v78;
          }
          else {
            float v52 = v12;
          }
          double v53 = (float)(v24 - v52);
          double v54 = (float)(v22 - v52);
          double v55 = v24;
          double v56 = (float)(v52 + v24);
          double v57 = (float)(v52 + v22);
          uint64_t v59 = v76;
          uint64_t v58 = v77;
          double v61 = v74;
          double v60 = v75;
          do
          {
            if (v48 <= 0) {
              int v62 = -(-v48 & 3);
            }
            else {
              int v62 = v48 & 3;
            }
            if (v62 >= 0) {
              int v63 = v62;
            }
            else {
              int v63 = v62 + 4;
            }
            switch(v63)
            {
              case 0:
                double v51 = v55;
                double v50 = v57;
                break;
              case 1:
                double v51 = v56;
                goto LABEL_77;
              case 2:
                double v51 = v55;
                double v50 = v54;
                break;
              case 3:
                double v51 = v53;
LABEL_77:
                double v50 = v22;
                break;
              default:
                break;
            }
            if (v50 > v45) {
              float v64 = v50;
            }
            else {
              float v64 = v45;
            }
            if (v50 < v46) {
              float v46 = v50;
            }
            else {
              float v45 = v64;
            }
            if (v51 >= v38)
            {
              if (v51 > v47) {
                float v47 = v51;
              }
            }
            else
            {
              float v38 = v51;
            }
            ++v48;
          }
          while (v49 != v48);
        }
        double v66 = v46;
        double v67 = v38;
        double v68 = (float)(v45 - v46);
        double v69 = (float)(v47 - v38);
        id v70 = [(CICircularWrap *)self _kernel];
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __29__CICircularWrap_outputImage__block_invoke;
        v84[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v84[4] = v58;
        v84[5] = v59;
        *(double *)&v84[6] = v60;
        *(double *)&v84[7] = v61;
        inputImage = self->inputImage;
        v85[0] = self->inputCenter;
        v85[1] = [NSNumber numberWithDouble:v81 + 0.5];
        *(float *)&double v72 = v79;
        v85[2] = [NSNumber numberWithFloat:v72];
        v85[3] = [NSNumber numberWithDouble:v80 + 0.5];
        *(float *)&double v73 = v82;
        v85[4] = [NSNumber numberWithFloat:v73];
        return (id)objc_msgSend(v70, "applyWithExtent:roiCallback:inputImage:arguments:", v84, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v85, 5), v66, v67, v68, v69);
      }
    }
  }
  else
  {
    v65 = self->inputImage;
    return v65;
  }
  return result;
}

double __29__CICircularWrap_outputImage__block_invoke(CGRect *a1)
{
  *(void *)&double result = (unint64_t)CGRectInset(a1[1], -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryDistortionEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.5";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A7FA0;
  v4[2] = &unk_1EE4A7FA0;
  v4[3] = &unk_1EE4A7FB0;
  v3[4] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A7FC0;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

@end