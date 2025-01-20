@interface CIAreaMinMax
+ (id)customAttributes;
- (id)outputImage;
- (id)outputImageMPS:(id)a3;
- (id)outputImageNonMPS;
@end

@implementation CIAreaMinMax

- (id)outputImageMPS:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  [a3 extent];
  double v8 = v7;
  double v10 = v9;
  *(float *)&double v7 = v5;
  *(float *)&double v9 = v6;
  if (fmaxf(*(float *)&v7, *(float *)&v9) > 4096.0) {
    return 0;
  }
  double v12 = v5;
  double v13 = v6;
  v20[0] = @"kCIImageProcessorSynchronizeInputs";
  v20[1] = @"kCIImageProcessorAllowPartialOutputRegion";
  v21[0] = MEMORY[0x1E4F1CC28];
  v21[1] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke;
  v18[3] = &__block_descriptor_64_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  *(double *)&v18[4] = v8;
  *(double *)&v18[5] = v10;
  *(double *)&v18[6] = v12;
  *(double *)&v18[7] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke_2;
  v17[3] = &__block_descriptor_64_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(double *)&v17[4] = v8;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v12;
  *(double *)&v17[7] = v13;
  XXH64_reset(v16, 0);
  double __src = v8;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  double __src = v10;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  double __src = v12;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  double __src = v13;
  XXH64_update((uint64_t)v16, (char *)&__src, 8uLL);
  uint64_t v15 = [NSString stringWithFormat:@"CIAreaMinMax %@", self->super.inputExtent];
  return (id)objc_msgSend(a3, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v15, XXH64_digest((uint64_t)v16), kCIFormatAllowSRGB, kCIFormatAllowSRGB, v14, v17, 0.0, 0.0, 2.0, 1.0, v18);
}

void __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke(double *a1, void *a2, void *a3)
{
  CGFloat v5 = a1[4];
  CGFloat v6 = a1[5];
  CGFloat v7 = a1[6];
  CGFloat v8 = a1[7];
  double v9 = (void *)[a3 metalCommandBuffer];
  if (v9)
  {
    double v10 = v9;
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F355E8]), "initWithDevice:", objc_msgSend(v9, "device"));
    if (v11)
    {
      double v12 = (void *)v11;
      [a2 region];
      CGFloat x = v35.origin.x;
      CGFloat y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
      if (CGRectIsNull(v35))
      {
        LODWORD(v17) = 0;
        int v18 = 0x7FFFFFFF;
        int v19 = 0x7FFFFFFF;
      }
      else
      {
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        if (CGRectIsInfinite(v36))
        {
          int v18 = -2147483647;
          LODWORD(v17) = -1;
          int v19 = -2147483647;
        }
        else
        {
          v37.origin.CGFloat x = x;
          v37.origin.CGFloat y = y;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = height;
          CGRect v38 = CGRectInset(v37, 0.000001, 0.000001);
          CGRect v39 = CGRectIntegral(v38);
          int v19 = (int)v39.origin.x;
          int v18 = (int)v39.origin.y;
          unint64_t v17 = (unint64_t)v39.size.height;
        }
      }
      v40.origin.CGFloat x = v5;
      v40.origin.CGFloat y = v6;
      v40.size.CGFloat width = v7;
      v40.size.CGFloat height = v8;
      if (CGRectIsNull(v40))
      {
        unint64_t v20 = 0;
        unint64_t v21 = 0;
        int v22 = 0x7FFFFFFF;
        int v23 = 0x7FFFFFFF;
      }
      else
      {
        v41.origin.CGFloat x = v5;
        v41.origin.CGFloat y = v6;
        v41.size.CGFloat width = v7;
        v41.size.CGFloat height = v8;
        if (CGRectIsInfinite(v41))
        {
          int v22 = -2147483647;
          unint64_t v20 = 0xFFFFFFFFLL;
          unint64_t v21 = 0xFFFFFFFFLL;
          int v23 = -2147483647;
        }
        else
        {
          v42.origin.CGFloat x = v5;
          v42.origin.CGFloat y = v6;
          v42.size.CGFloat width = v7;
          v42.size.CGFloat height = v8;
          CGRect v43 = CGRectInset(v42, 0.000001, 0.000001);
          CGRect v44 = CGRectIntegral(v43);
          int v23 = (int)v44.origin.x;
          int v22 = (int)v44.origin.y;
          unint64_t v21 = (unint64_t)v44.size.width;
          unint64_t v20 = (unint64_t)v44.size.height;
        }
      }
      v34[0] = v19 - v23;
      v34[1] = (int)v20 - v18 - (int)v17 + v22;
      v34[2] = 0;
      v34[3] = v21;
      v34[4] = v20;
      v34[5] = 1;
      [v12 setClipRectSource:v34];
      [v12 setOptions:2];
      [v12 setEdgeMode:1];
      [a3 region];
      CGFloat v24 = v45.origin.x;
      CGFloat v25 = v45.origin.y;
      CGFloat v26 = v45.size.width;
      CGFloat v27 = v45.size.height;
      if (CGRectIsNull(v45))
      {
        LODWORD(v28) = 0;
        int v29 = 2147483646;
        int v30 = 0x7FFFFFFF;
      }
      else
      {
        v46.origin.CGFloat x = v24;
        v46.origin.CGFloat y = v25;
        v46.size.CGFloat width = v26;
        v46.size.CGFloat height = v27;
        if (CGRectIsInfinite(v46))
        {
          LODWORD(v28) = -1;
          int v29 = 0x80000000;
          int v30 = -2147483647;
        }
        else
        {
          v47.origin.CGFloat x = v24;
          v47.origin.CGFloat y = v25;
          v47.size.CGFloat width = v26;
          v47.size.CGFloat height = v27;
          CGRect v48 = CGRectInset(v47, 0.000001, 0.000001);
          CGRect v49 = CGRectIntegral(v48);
          int v30 = (int)v49.origin.x;
          unint64_t v28 = (unint64_t)v49.size.height;
          int v29 = (int)v49.origin.y - 1;
        }
      }
      v31[0] = -v30;
      v31[1] = (int)v28 + v29;
      long long v32 = xmmword_193955DB0;
      int64x2_t v33 = vdupq_n_s64(1uLL);
      [v12 setClipRect:v31];
      objc_msgSend(v12, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v10, objc_msgSend(a2, "metalTexture"), objc_msgSend(a3, "metalTexture"));
    }
  }
}

double __36__CIAreaMinMax_MPS__outputImageMPS___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImageNonMPS
{
  v3 = +[CIFilter filterWithName:@"CIAreaMaximum"];
  [(CIFilter *)v3 setInputImage:self->super.inputImage];
  [(CIFilter *)v3 setInputExtent:self->super.inputExtent];
  v4 = -[CIImage imageByCroppingToRect:]([(CIImage *)[(CIFilter *)v3 outputImage] imageByClampingToExtent], "imageByCroppingToRect:", 1.0, 0.0, 1.0, 1.0);
  CGFloat v5 = +[CIFilter filterWithName:@"CIAreaMinimum"];
  [(CIFilter *)v5 setInputImage:self->super.inputImage];
  [(CIFilter *)v5 setInputExtent:self->super.inputExtent];
  uint64_t v6 = -[CIImage imageByCroppingToRect:]([(CIImage *)[(CIFilter *)v5 outputImage] imageByClampingToExtent], "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);

  return [(CIImage *)v4 imageByCompositingOverImage:v6];
}

- (id)outputImage
{
  id v3 = [(CIReductionFilter *)self offsetAndCrop];
  if (v3 && (id v4 = v3, [v3 extent], !CGRectIsEmpty(v10)))
  {
    id v6 = [(CIAreaMinMax *)self outputImageNonMPS];
    if (CI_ENABLE_MPS()
      && (id v7 = [(CIAreaMinMax *)self outputImageMPS:v4]) != 0
      && (id v8 = v7, [v7 extent], !CGRectIsEmpty(v11)))
    {
      return +[CIImage imageForRenderingWithMPS:v8 orNonMPS:v6];
    }
    else
    {
      return v6;
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

@end