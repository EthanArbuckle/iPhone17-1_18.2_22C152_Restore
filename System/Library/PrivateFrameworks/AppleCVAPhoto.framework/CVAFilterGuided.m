@interface CVAFilterGuided
- (CVAFilterGuided)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 textureSize:(id *)a7 alphaSize:(id *)a8 kernelSize:(int)a9 infConvolutionDownsampling:(int)a10 laplacianLimitingDownsampling:(int)a11 laplacianLimitingBlurSize:(int)a12 error:(id *)a13;
- (NSString)label;
- (void)encodeFilterApplyToBuffer:(id)a3 coeff:(id)a4 source:(id)a5 destination:(id)a6;
- (void)encodeHybridUpSamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodePostProcessAlphaToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 alphaMaxLaplacian:(float)a6 infConvOrientation:(float)a7 infConvMajorRadius:(float)a8 infConvMinorRadius:(float)a9 gammaExponent:(float)a10 enableInfConvolution:(BOOL)a11;
- (void)encodeReconstructToCommandBuffer:(id)a3 inGuidancePixelBuffer:(__CVBuffer *)a4 inCoeffTexture:(id)a5 outFilteredTexture:(id)a6;
- (void)encodeRegressionToCommandBuffer:(id)a3 inSourceTexture:(id)a4 inGuidanceTexture:(id)a5 inWeightTexture:(id)a6 outCoeffTexture:(id)a7 epsilon:(float)a8;
- (void)initSourceTexture:(__CVBuffer *)a3;
@end

@implementation CVAFilterGuided

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_mpsBox, 0);
  objc_storeStrong((id *)&self->_infConvolution, 0);
  objc_storeStrong((id *)&self->_postProcessAlphaKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterRegressionKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterSecondOrderProductsKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterPremultiplyKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterEmbedGuideKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterMultiplyKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterInvertKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterApplyRGBAKernel, 0);
  objc_storeStrong((id *)&self->_lowResGammaMatte, 0);
  objc_storeStrong((id *)&self->_srcTexture, 0);
  objc_storeStrong((id *)&self->_hybridUpscalingIntermediateR32Texture, 0);
  objc_storeStrong((id *)&self->_hybridUpscalingIntermediateTexture, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_gammaMatteTexture, 0);
  objc_storeStrong((id *)&self->_inputAlphaBlurredSampler, 0);
  objc_storeStrong((id *)&self->_inputAlphaBlurred, 0);
  objc_storeStrong((id *)&self->_inputAlphaDownsampled, 0);
  objc_storeStrong((id *)&self->_upscaledCoeff, 0);
  objc_storeStrong((id *)&self->_convolutedCoeff, 0);
  objc_storeStrong((id *)&self->_gfMeanNormalizationFactor, 0);
  objc_storeStrong((id *)&self->_gfMeanWeight, 0);
  objc_storeStrong((id *)&self->_gfTmp2, 0);
  objc_storeStrong((id *)&self->_gfTmp, 0);
  objc_storeStrong((id *)&self->_gfMeanGGGBBB, 0);
  objc_storeStrong((id *)&self->_gfMeanRRRGRB, 0);
  objc_storeStrong((id *)&self->_gfGGGBBB, 0);
  objc_storeStrong((id *)&self->_gfRRRGRB, 0);
  objc_storeStrong((id *)&self->_gfMeanSrcGuide, 0);
  objc_storeStrong((id *)&self->_gfSrcGuide, 0);
  objc_storeStrong((id *)&self->_gfMeanSrcWithGuide, 0);
  objc_storeStrong((id *)&self->_gfSrcWithGuide, 0);
  objc_storeStrong((id *)&self->_hybridResampler, 0);
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)encodeHybridUpSamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  SEL v18 = a2;
  v19 = self;
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(v8, "pixelFormat", &v19, &v18) == 55 || objc_msgSend(v8, "pixelFormat") == 25)
  {
    v10 = v19;
    uint64_t v11 = 208;
    hybridUpscalingIntermediateR32Texture = v19->_hybridUpscalingIntermediateR32Texture;
    if (!hybridUpscalingIntermediateR32Texture)
    {
      uint64_t v13 = sub_1BA838930(&v17, 55, (unint64_t)[v9 width] >> 1, (unint64_t)objc_msgSend(v9, "height") >> 1);
LABEL_7:
      v14 = *(Class *)((char *)&v19->super.super.isa + v11);
      *(Class *)((char *)&v19->super.super.isa + v11) = (Class)v13;

      v10 = v19;
      hybridUpscalingIntermediateR32Texture = *(Class *)((char *)&v19->super.super.isa + v11);
    }
  }
  else
  {
    v10 = v19;
    uint64_t v11 = 200;
    hybridUpscalingIntermediateR32Texture = v19->_hybridUpscalingIntermediateTexture;
    if (!hybridUpscalingIntermediateR32Texture)
    {
      uint64_t v13 = sub_1BA838930(&v17, 115, (unint64_t)[v9 width] >> 1, (unint64_t)objc_msgSend(v9, "height") >> 1);
      goto LABEL_7;
    }
  }
  v15 = hybridUpscalingIntermediateR32Texture;
  v16 = [(CVAFilterHybridResampling *)v10->_hybridResampler scaler];
  [v16 encodeToCommandBuffer:v7 sourceTexture:v8 destinationTexture:v15];

  [(CVAFilterHybridResampling *)v19->_hybridResampler encodeBilinearScalingToCommandBuffer:v7 source:v15 destination:v9 mode:0];
}

- (void)encodePostProcessAlphaToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 alphaMaxLaplacian:(float)a6 infConvOrientation:(float)a7 infConvMajorRadius:(float)a8 infConvMinorRadius:(float)a9 gammaExponent:(float)a10 enableInfConvolution:(BOOL)a11
{
  BOOL v11 = a11;
  id v20 = a3;
  id v21 = a4;
  id v39 = a5;
  *(float *)v46 = a10;
  *(float *)&v46[1] = a6;
  BOOL v22 = v11;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76690, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76690))
  {
    v37 = +[CVAPreferenceManager defaults];
    char v38 = [v37 BOOLForKey:@"CVAPhotoDebugStyle"];

    byte_1E9F769AE = v38;
    __cxa_guard_release(&qword_1E9F76690);
  }
  [(CVAFilterHybridResampling *)self->_hybridResampler encodeHybridDownsamplingToCommandBuffer:v20 source:v21 destination:self->_inputAlphaDownsampled];
  if (byte_1E9F769AE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"AP.laplacianLimDownsampling = %lu", objc_msgSend(v21, "width") / (unint64_t)-[MTLTexture width](self->_inputAlphaDownsampled, "width"));
  }
  if (self->_inputAlphaBlurred)
  {
    -[MPSImageBox encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_mpsBox, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v20, self->_inputAlphaDownsampled);
    if (byte_1E9F769AE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"AP.laplacianLimBlurSize = %lu", -[MPSImageBox kernelWidth](self->_mpsBox, "kernelWidth"));
    }
  }
  v23 = v39;
  v24 = [v20 computeCommandEncoder];
  [v24 setLabel:@"_postProcessAlphaKernel"];
  [v24 setComputePipelineState:self->_postProcessAlphaKernel];
  [v24 setTexture:v21 atIndex:0];
  gammaMatteTexture = (MTLTexture *)v39;
  if (v22) {
    gammaMatteTexture = self->_gammaMatteTexture;
  }
  [v24 setTexture:gammaMatteTexture atIndex:1];
  inputAlphaBlurred = self->_inputAlphaBlurred;
  if (!inputAlphaBlurred) {
    inputAlphaBlurred = self->_inputAlphaDownsampled;
  }
  [v24 setTexture:inputAlphaBlurred atIndex:2];
  [v24 setSamplerState:self->_inputAlphaBlurredSampler atIndex:0];
  [v24 setBytes:v46 length:8 atIndex:0];
  uint64_t v27 = [v21 width];
  uint64_t v28 = [v21 height];
  v29.i64[0] = v27;
  v29.i64[1] = v28;
  uint64x2_t v44 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v29, 1uLL), 4uLL);
  uint64_t v45 = 1;
  uint64_t v43 = 1;
  long long v42 = xmmword_1BA86C930;
  [v24 dispatchThreadgroups:&v44 threadsPerThreadgroup:&v42];
  [v24 endEncoding];
  if (byte_1E9F769AE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"AP.InfimumConvolution = %d", v22);
  }
  if (v22)
  {
    if (byte_1E9F769AE)
    {
      [NSString stringWithFormat:@"AP.infConvMinorRadius = %.2f", a9];

      [NSString stringWithFormat:@"AP.infConvMajorRadius = %.2f", a8];
    }
    [(CVAFilterHybridResampling *)self->_hybridResampler encodeHybridDownsamplingToCommandBuffer:v20 source:self->_gammaMatteTexture destination:self->_lowResGammaMatte];
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F769B8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F769B8))
    {
      qword_1E9F769B0 = [NSNumber numberWithInt:5];
      __cxa_guard_release(&qword_1E9F769B8);
      v23 = v39;
    }
    if ((byte_1E9F769C0 & 1) == 0)
    {
      char v41 = 12;
      strcpy((char *)__p, "infConvIters");
      sub_1BA81CE64((uint64_t)&qword_1E9F769B0, (uint64_t)__p);
      if (v41 < 0) {
        operator delete(__p[0]);
      }
      byte_1E9F769C0 = 1;
    }
    infConvolution = self->_infConvolution;
    v31 = self->_gammaMatteTexture;
    lowResGammaMatte = self->_lowResGammaMatte;
    uint64_t v33 = [(id)qword_1E9F769B0 intValue];
    *(float *)&double v34 = a7;
    *(float *)&double v35 = a8;
    *(float *)&double v36 = a9;
    [(CVAFilterInfimumConvolution *)infConvolution encodeToCommandBuffer:v20 sourceTexture:v31 smallSourceTexture:lowResGammaMatte destinationTexture:v23 orientation:v33 majorRadius:v34 minorRadius:v35 iterations:v36];
  }
}

- (void)encodeFilterApplyToBuffer:(id)a3 coeff:(id)a4 source:(id)a5 destination:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [a3 computeCommandEncoder];
  [v13 setLabel:@"_guidedFilterApplyRGBAKernel"];
  [v13 setComputePipelineState:self->_guidedFilterApplyRGBAKernel];
  [v13 setTexture:v10 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v12 atIndex:2];
  uint64_t v14 = [v12 width];
  uint64_t v15 = [v12 height];
  v16.i64[0] = v14;
  v16.i64[1] = v15;
  uint64x2_t v19 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v16, 1uLL), 4uLL);
  uint64_t v20 = 1;
  int64x2_t v17 = vdupq_n_s64(0x10uLL);
  uint64_t v18 = 1;
  [v13 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];
}

- (void)initSourceTexture:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v13 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  id v8 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  int v9 = [v13 containsObject:v8];

  if (v9) {
    uint64_t v10 = 500;
  }
  else {
    uint64_t v10 = 70;
  }
  id v14 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v10 width:Width height:Height mipmapped:0];
  [v14 setStorageMode:0];
  id v11 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v14 iosurface:CVPixelBufferGetIOSurface(a3) plane:0];
  srcTexture = self->_srcTexture;
  self->_srcTexture = v11;
}

- (void)encodeReconstructToCommandBuffer:(id)a3 inGuidancePixelBuffer:(__CVBuffer *)a4 inCoeffTexture:(id)a5 outFilteredTexture:(id)a6
{
  id v12 = a3;
  id v10 = a5;
  id v11 = a6;
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v12 inTexture:v10 outTexture:self->_convolutedCoeff radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:2];
  [(CVAFilterGuided *)self encodeHybridUpSamplingToCommandBuffer:v12 source:self->_convolutedCoeff destination:self->_upscaledCoeff];
  [(CVAFilterGuided *)self initSourceTexture:a4];
  [(CVAFilterGuided *)self encodeFilterApplyToBuffer:v12 coeff:self->_upscaledCoeff source:self->_srcTexture destination:v11];
}

- (void)encodeRegressionToCommandBuffer:(id)a3 inSourceTexture:(id)a4 inGuidanceTexture:(id)a5 inWeightTexture:(id)a6 outCoeffTexture:(id)a7 epsilon:(float)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v36 = a7;
  id v38 = v16;
  id v37 = v15;
  id v39 = v17;
  uint64_t v18 = [v17 width];
  uint64_t v19 = [v17 height];
  double v35 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v18 height:v19 mipmapped:0];
  [v35 setUsage:1];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v14 inTexture:v17 outTexture:self->_gfMeanWeight radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:0];
  uint64_t v20 = [v14 computeCommandEncoder];
  [v20 setLabel:@"_guidedFilterInvertKernel"];
  [v20 setComputePipelineState:self->_guidedFilterInvertKernel];
  [v20 setTexture:self->_gfMeanWeight atIndex:0];
  [v20 setTexture:self->_gfMeanNormalizationFactor atIndex:1];
  unint64_t v21 = (unint64_t)(v18 + 15) >> 4;
  unint64_t v22 = (unint64_t)(v19 + 15) >> 4;
  v79[0] = v21;
  v79[1] = v22;
  v79[2] = 1;
  int64x2_t v77 = vdupq_n_s64(0x10uLL);
  uint64_t v78 = 1;
  [v20 dispatchThreadgroups:v79 threadsPerThreadgroup:&v77];
  [v20 endEncoding];
  v23 = [v14 computeCommandEncoder];

  [v23 setLabel:@"_guidedFilterEmbedGuideKernel"];
  [v23 setComputePipelineState:self->_guidedFilterEmbedGuideKernel];
  [v23 setTexture:v38 atIndex:0];
  [v23 setTexture:v37 atIndex:1];
  [v23 setTexture:self->_gfSrcWithGuide atIndex:2];
  v76[0] = v21;
  v76[1] = v22;
  v76[2] = 1;
  int64x2_t v74 = vdupq_n_s64(0x10uLL);
  uint64_t v75 = 1;
  [v23 dispatchThreadgroups:v76 threadsPerThreadgroup:&v74];
  [v23 endEncoding];
  v24 = [v14 computeCommandEncoder];

  [v24 setLabel:@"_guidedFilterMultiplyKernel"];
  [v24 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v24 setTexture:self->_gfSrcWithGuide atIndex:0];
  [v24 setTexture:v39 atIndex:1];
  [v24 setTexture:self->_gfTmp atIndex:2];
  v73[0] = v21;
  v73[1] = v22;
  v73[2] = 1;
  int64x2_t v71 = vdupq_n_s64(0x10uLL);
  uint64_t v72 = 1;
  [v24 dispatchThreadgroups:v73 threadsPerThreadgroup:&v71];
  [v24 endEncoding];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v14 inTexture:self->_gfTmp outTexture:self->_gfTmp2 radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:0];
  v25 = [v14 computeCommandEncoder];

  [v25 setLabel:@"_guidedFilterMultiplyKernel"];
  [v25 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v25 setTexture:self->_gfTmp2 atIndex:0];
  [v25 setTexture:self->_gfMeanNormalizationFactor atIndex:1];
  [v25 setTexture:self->_gfMeanSrcWithGuide atIndex:2];
  v70[0] = v21;
  v70[1] = v22;
  v70[2] = 1;
  int64x2_t v68 = vdupq_n_s64(0x10uLL);
  uint64_t v69 = 1;
  [v25 dispatchThreadgroups:v70 threadsPerThreadgroup:&v68];
  [v25 endEncoding];
  v26 = [v14 computeCommandEncoder];

  [v26 setLabel:@"_guidedFilterPremultiplyKernel"];
  [v26 setComputePipelineState:self->_guidedFilterPremultiplyKernel];
  [v26 setTexture:self->_gfSrcWithGuide atIndex:0];
  [v26 setTexture:self->_gfSrcGuide atIndex:1];
  v67[0] = v21;
  v67[1] = v22;
  v67[2] = 1;
  int64x2_t v65 = vdupq_n_s64(0x10uLL);
  uint64_t v66 = 1;
  [v26 dispatchThreadgroups:v67 threadsPerThreadgroup:&v65];
  [v26 endEncoding];
  uint64_t v27 = [v14 computeCommandEncoder];

  [v27 setLabel:@"_guidedFilterMultiplyKernel"];
  [v27 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v27 setTexture:self->_gfSrcGuide atIndex:0];
  [v27 setTexture:v39 atIndex:1];
  [v27 setTexture:self->_gfTmp atIndex:2];
  v64[0] = v21;
  v64[1] = v22;
  v64[2] = 1;
  int64x2_t v62 = vdupq_n_s64(0x10uLL);
  uint64_t v63 = 1;
  [v27 dispatchThreadgroups:v64 threadsPerThreadgroup:&v62];
  [v27 endEncoding];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v14 inTexture:self->_gfTmp outTexture:self->_gfTmp2 radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:0];
  uint64_t v28 = [v14 computeCommandEncoder];

  [v28 setLabel:@"_guidedFilterMultiplyKernel"];
  [v28 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v28 setTexture:self->_gfTmp2 atIndex:0];
  [v28 setTexture:self->_gfMeanNormalizationFactor atIndex:1];
  [v28 setTexture:self->_gfMeanSrcGuide atIndex:2];
  v61[0] = v21;
  v61[1] = v22;
  v61[2] = 1;
  int64x2_t v59 = vdupq_n_s64(0x10uLL);
  uint64_t v60 = 1;
  [v28 dispatchThreadgroups:v61 threadsPerThreadgroup:&v59];
  [v28 endEncoding];
  uint64x2_t v29 = [v14 computeCommandEncoder];

  [v29 setLabel:@"_guidedFilterSecondOrderProductsKernel"];
  [v29 setComputePipelineState:self->_guidedFilterSecondOrderProductsKernel];
  [v29 setTexture:self->_gfSrcWithGuide atIndex:0];
  [v29 setTexture:self->_gfRRRGRB atIndex:1];
  [v29 setTexture:self->_gfGGGBBB atIndex:2];
  v58[0] = v21;
  v58[1] = v22;
  v58[2] = 1;
  int64x2_t v56 = vdupq_n_s64(0x10uLL);
  uint64_t v57 = 1;
  [v29 dispatchThreadgroups:v58 threadsPerThreadgroup:&v56];
  [v29 endEncoding];
  v30 = [v14 computeCommandEncoder];

  [v30 setLabel:@"_guidedFilterMultiplyKernel"];
  [v30 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v30 setTexture:self->_gfRRRGRB atIndex:0];
  [v30 setTexture:v39 atIndex:1];
  [v30 setTexture:self->_gfTmp atIndex:2];
  v55[0] = v21;
  v55[1] = v22;
  v55[2] = 1;
  int64x2_t v53 = vdupq_n_s64(0x10uLL);
  uint64_t v54 = 1;
  [v30 dispatchThreadgroups:v55 threadsPerThreadgroup:&v53];
  [v30 endEncoding];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v14 inTexture:self->_gfTmp outTexture:self->_gfTmp2 radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:0];
  v31 = [v14 computeCommandEncoder];

  [v31 setLabel:@"_guidedFilterMultiplyKernel"];
  [v31 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v31 setTexture:self->_gfTmp2 atIndex:0];
  [v31 setTexture:self->_gfMeanNormalizationFactor atIndex:1];
  [v31 setTexture:self->_gfMeanRRRGRB atIndex:2];
  v52[0] = v21;
  v52[1] = v22;
  v52[2] = 1;
  int64x2_t v50 = vdupq_n_s64(0x10uLL);
  uint64_t v51 = 1;
  [v31 dispatchThreadgroups:v52 threadsPerThreadgroup:&v50];
  [v31 endEncoding];
  v32 = [v14 computeCommandEncoder];

  [v32 setLabel:@"_guidedFilterMultiplyKernel"];
  [v32 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v32 setTexture:self->_gfGGGBBB atIndex:0];
  [v32 setTexture:v39 atIndex:1];
  [v32 setTexture:self->_gfTmp atIndex:2];
  v49[0] = v21;
  v49[1] = v22;
  v49[2] = 1;
  int64x2_t v47 = vdupq_n_s64(0x10uLL);
  uint64_t v48 = 1;
  [v32 dispatchThreadgroups:v49 threadsPerThreadgroup:&v47];
  [v32 endEncoding];
  [(CVAFilterBox *)self->_boxFilter encodeToCommandBuffer:v14 inTexture:self->_gfTmp outTexture:self->_gfTmp2 radius:(uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1 normalize:0];
  uint64_t v33 = [v14 computeCommandEncoder];

  [v33 setLabel:@"_guidedFilterMultiplyKernel"];
  [v33 setComputePipelineState:self->_guidedFilterMultiplyKernel];
  [v33 setTexture:self->_gfTmp2 atIndex:0];
  [v33 setTexture:self->_gfMeanNormalizationFactor atIndex:1];
  [v33 setTexture:self->_gfMeanGGGBBB atIndex:2];
  v46[0] = v21;
  v46[1] = v22;
  v46[2] = 1;
  int64x2_t v44 = vdupq_n_s64(0x10uLL);
  uint64_t v45 = 1;
  [v33 dispatchThreadgroups:v46 threadsPerThreadgroup:&v44];
  [v33 endEncoding];
  float v43 = a8;
  double v34 = [v14 computeCommandEncoder];

  [v34 setLabel:@"_guidedFilterRegressionKernel"];
  [v34 setComputePipelineState:self->_guidedFilterRegressionKernel];
  [v34 setTexture:self->_gfMeanSrcWithGuide atIndex:0];
  [v34 setTexture:self->_gfMeanSrcGuide atIndex:1];
  [v34 setTexture:self->_gfMeanRRRGRB atIndex:2];
  [v34 setTexture:self->_gfMeanGGGBBB atIndex:3];
  [v34 setTexture:v36 atIndex:4];
  [v34 setBytes:&v43 length:4 atIndex:0];
  v42[0] = v21;
  v42[1] = v22;
  v42[2] = 1;
  int64x2_t v40 = vdupq_n_s64(0x10uLL);
  uint64_t v41 = 1;
  [v34 dispatchThreadgroups:v42 threadsPerThreadgroup:&v40];
  [v34 endEncoding];
}

- (CVAFilterGuided)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 textureSize:(id *)a7 alphaSize:(id *)a8 kernelSize:(int)a9 infConvolutionDownsampling:(int)a10 laplacianLimitingDownsampling:(int)a11 laplacianLimitingBlurSize:(int)a12 error:(id *)a13
{
  id v20 = a3;
  id v95 = a4;
  id v94 = a5;
  id v96 = a6;
  v121.receiver = self;
  v121.super_class = (Class)CVAFilterGuided;
  unint64_t v21 = [(ImageSaverRegistrator *)&v121 init];
  if (v21)
  {
    unint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    id v93 = v20;
    label = v21->_label;
    v21->_label = (NSString *)v23;

    objc_storeStrong((id *)&v21->_device, a3);
    p_library = (void **)&v21->_library;
    objc_storeStrong((id *)&v21->_library, a4);
    p_pipelineLibrary = (void **)&v21->_pipelineLibrary;
    objc_storeStrong((id *)&v21->_pipelineLibrary, a5);
    v21->_smallGuidedFilterKernelSize = a9;
    unint64_t var0 = a7->var0;
    unint64_t var1 = a7->var1;
    v88 = a7;
    unint64_t v27 = a8->var0;
    unint64_t v28 = a8->var1;
    v90 = a8;
    uint64x2_t v29 = (char *)operator new(0x2A8uLL);
    *(void *)uint64x2_t v29 = &v21->_gfSrcWithGuide;
    *((void *)v29 + 1) = 115;
    *((void *)v29 + 2) = var0;
    *((void *)v29 + 3) = var1;
    *((_DWORD *)v29 + 8) = 0;
    *((void *)v29 + 5) = &v21->_gfMeanSrcWithGuide;
    *((void *)v29 + 6) = 115;
    *((void *)v29 + 7) = var0;
    *((void *)v29 + 8) = var1;
    *((_DWORD *)v29 + 18) = 0;
    *((void *)v29 + 10) = &v21->_gfSrcGuide;
    *((void *)v29 + 11) = 115;
    *((void *)v29 + 12) = var0;
    *((void *)v29 + 13) = var1;
    *((void *)v29 + 15) = &v21->_gfMeanSrcGuide;
    *((_DWORD *)v29 + 28) = 0;
    *((void *)v29 + 16) = 115;
    *((void *)v29 + 17) = var0;
    *((void *)v29 + 18) = var1;
    *((_DWORD *)v29 + 38) = 0;
    *((void *)v29 + 20) = &v21->_gfRRRGRB;
    *((void *)v29 + 21) = 115;
    *((void *)v29 + 22) = var0;
    *((void *)v29 + 23) = var1;
    *((_DWORD *)v29 + 48) = 0;
    *((void *)v29 + 25) = &v21->_gfGGGBBB;
    *((void *)v29 + 26) = 115;
    *((void *)v29 + 27) = var0;
    *((void *)v29 + 28) = var1;
    *((_DWORD *)v29 + 58) = 0;
    *((void *)v29 + 30) = &v21->_gfMeanRRRGRB;
    *((void *)v29 + 31) = 115;
    *((void *)v29 + 32) = var0;
    *((void *)v29 + 33) = var1;
    *((_DWORD *)v29 + 68) = 0;
    *((void *)v29 + 35) = &v21->_gfMeanGGGBBB;
    *((void *)v29 + 36) = 115;
    *((void *)v29 + 37) = var0;
    *((void *)v29 + 38) = var1;
    *((_DWORD *)v29 + 78) = 0;
    *((void *)v29 + 40) = &v21->_gfTmp;
    *((void *)v29 + 41) = 115;
    *((void *)v29 + 42) = var0;
    *((void *)v29 + 43) = var1;
    *((_DWORD *)v29 + 88) = 0;
    *((void *)v29 + 45) = &v21->_gfTmp2;
    *((void *)v29 + 46) = 115;
    *((void *)v29 + 47) = var0;
    *((void *)v29 + 48) = var1;
    *((_DWORD *)v29 + 98) = 0;
    *((void *)v29 + 50) = &v21->_gfMeanWeight;
    *((void *)v29 + 51) = 25;
    *((void *)v29 + 52) = var0;
    *((void *)v29 + 53) = var1;
    *((_DWORD *)v29 + 108) = 0;
    *((void *)v29 + 55) = &v21->_gfMeanNormalizationFactor;
    *((void *)v29 + 56) = 25;
    *((void *)v29 + 57) = var0;
    *((void *)v29 + 58) = var1;
    *((_DWORD *)v29 + 118) = 0;
    *((void *)v29 + 60) = &v21->_convolutedCoeff;
    *((void *)v29 + 61) = 115;
    *((void *)v29 + 62) = var0;
    *((void *)v29 + 63) = var1;
    *((_DWORD *)v29 + 128) = 0;
    *((void *)v29 + 65) = &v21->_upscaledCoeff;
    *((void *)v29 + 66) = 115;
    *((void *)v29 + 67) = v27 >> 1;
    *((void *)v29 + 68) = v28 >> 1;
    *((_DWORD *)v29 + 138) = 0;
    *((void *)v29 + 70) = &v21->_lowResGammaMatte;
    *((void *)v29 + 71) = 10;
    *((void *)v29 + 72) = v27 / a10;
    *((void *)v29 + 73) = v28 / a10;
    *((_DWORD *)v29 + 148) = 1;
    *((void *)v29 + 75) = &v21->_inputAlphaDownsampled;
    *((void *)v29 + 76) = 10;
    *((void *)v29 + 77) = v27 / a11;
    *((void *)v29 + 78) = v28 / a11;
    *((_DWORD *)v29 + 158) = 1;
    *((void *)v29 + 80) = &v21->_gammaMatteTexture;
    *((void *)v29 + 81) = 10;
    *((void *)v29 + 82) = v27;
    *((void *)v29 + 83) = v28;
    *((_DWORD *)v29 + 168) = 1;
    v30 = objc_opt_new();
    v31 = v30;
    [v30 setMinFilter:0];
    p_device = (id *)&v21->_device;
    if (a12) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = 2;
    }
    objc_msgSend(v30, "setMagFilter:", v33, v88);
    [v30 setSAddressMode:0];
    [v30 setTAddressMode:0];
    [v30 setNormalizedCoordinates:1];
    uint64_t v34 = [*p_device newSamplerStateWithDescriptor:v30];
    inputAlphaBlurredSampler = v21->_inputAlphaBlurredSampler;
    v21->_inputAlphaBlurredSampler = (MTLSamplerState *)v34;

    if (v21->_inputAlphaBlurredSampler)
    {
      id v36 = v29 + 680;
      if (a12 && !sub_1BA84F794(@"harvesting.enabled", @"com.apple.coremedia", 0))
      {
        uint64_t v37 = [objc_alloc(MEMORY[0x1E4F35550]) initWithDevice:*p_device kernelWidth:a12 kernelHeight:a12];
        mpsBox = v21->_mpsBox;
        v21->_mpsBox = (MPSImageBox *)v37;

        [(MPSImageBox *)v21->_mpsBox setEdgeMode:1];
        id v39 = [v96 commandBuffer];
        [v39 setLabel:@"MPSImageBox"];
        sub_1BA862D9C(v21->_mpsBox, *p_device, v39, 10);
        [v39 commit];

        unint64_t v40 = v90->var0;
        unint64_t v41 = v90->var1;
        long long v42 = (char *)operator new(0x550uLL);
        *((void *)v42 + 85) = &v21->_inputAlphaBlurred;
        *((void *)v42 + 86) = 10;
        *((void *)v42 + 87) = v40 / a11;
        *((void *)v42 + 88) = v41 / a11;
        *((_DWORD *)v42 + 178) = 0;
        long long v43 = *((_OWORD *)v29 + 41);
        *((_OWORD *)v42 + 40) = *((_OWORD *)v29 + 40);
        *((_OWORD *)v42 + 41) = v43;
        *((_DWORD *)v42 + 168) = *((_DWORD *)v29 + 168);
        long long v44 = *(_OWORD *)(v29 + 616);
        *(_OWORD *)(v42 + 600) = *(_OWORD *)(v29 + 600);
        *(_OWORD *)(v42 + 616) = v44;
        *((_DWORD *)v42 + 158) = *((_DWORD *)v29 + 158);
        long long v45 = *((_OWORD *)v29 + 35);
        long long v46 = *((_OWORD *)v29 + 36);
        *((_DWORD *)v42 + 148) = *((_DWORD *)v29 + 148);
        *((_OWORD *)v42 + 35) = v45;
        *((_OWORD *)v42 + 36) = v46;
        *((_DWORD *)v42 + 138) = *((_DWORD *)v29 + 138);
        long long v47 = *(_OWORD *)(v29 + 536);
        *(_OWORD *)(v42 + 520) = *(_OWORD *)(v29 + 520);
        *(_OWORD *)(v42 + 536) = v47;
        *((_DWORD *)v42 + 128) = *((_DWORD *)v29 + 128);
        long long v48 = *((_OWORD *)v29 + 31);
        *((_OWORD *)v42 + 30) = *((_OWORD *)v29 + 30);
        *((_OWORD *)v42 + 31) = v48;
        long long v49 = *(_OWORD *)(v29 + 440);
        long long v50 = *(_OWORD *)(v29 + 456);
        *((_DWORD *)v42 + 118) = *((_DWORD *)v29 + 118);
        *(_OWORD *)(v42 + 440) = v49;
        *(_OWORD *)(v42 + 456) = v50;
        long long v51 = *((_OWORD *)v29 + 25);
        long long v52 = *((_OWORD *)v29 + 26);
        *((_DWORD *)v42 + 108) = *((_DWORD *)v29 + 108);
        *((_OWORD *)v42 + 25) = v51;
        *((_OWORD *)v42 + 26) = v52;
        long long v53 = *(_OWORD *)(v29 + 360);
        long long v54 = *(_OWORD *)(v29 + 376);
        *((_DWORD *)v42 + 98) = *((_DWORD *)v29 + 98);
        *(_OWORD *)(v42 + 360) = v53;
        *(_OWORD *)(v42 + 376) = v54;
        long long v55 = *((_OWORD *)v29 + 20);
        long long v56 = *((_OWORD *)v29 + 21);
        *((_DWORD *)v42 + 88) = *((_DWORD *)v29 + 88);
        *((_OWORD *)v42 + 20) = v55;
        *((_OWORD *)v42 + 21) = v56;
        long long v57 = *(_OWORD *)(v29 + 280);
        long long v58 = *(_OWORD *)(v29 + 296);
        *((_DWORD *)v42 + 78) = *((_DWORD *)v29 + 78);
        *(_OWORD *)(v42 + 280) = v57;
        *(_OWORD *)(v42 + 296) = v58;
        long long v59 = *((_OWORD *)v29 + 15);
        long long v60 = *((_OWORD *)v29 + 16);
        *((_DWORD *)v42 + 68) = *((_DWORD *)v29 + 68);
        *((_OWORD *)v42 + 15) = v59;
        *((_OWORD *)v42 + 16) = v60;
        long long v61 = *(_OWORD *)(v29 + 200);
        long long v62 = *(_OWORD *)(v29 + 216);
        *((_DWORD *)v42 + 58) = *((_DWORD *)v29 + 58);
        *(_OWORD *)(v42 + 216) = v62;
        *(_OWORD *)(v42 + 200) = v61;
        long long v63 = *((_OWORD *)v29 + 10);
        long long v64 = *((_OWORD *)v29 + 11);
        *((_DWORD *)v42 + 48) = *((_DWORD *)v29 + 48);
        *((_OWORD *)v42 + 10) = v63;
        *((_OWORD *)v42 + 11) = v64;
        long long v65 = *(_OWORD *)(v29 + 120);
        long long v66 = *(_OWORD *)(v29 + 136);
        *((_DWORD *)v42 + 38) = *((_DWORD *)v29 + 38);
        *(_OWORD *)(v42 + 136) = v66;
        *(_OWORD *)(v42 + 120) = v65;
        long long v67 = *((_OWORD *)v29 + 5);
        long long v68 = *((_OWORD *)v29 + 6);
        *((_DWORD *)v42 + 28) = *((_DWORD *)v29 + 28);
        *((_OWORD *)v42 + 5) = v67;
        *((_OWORD *)v42 + 6) = v68;
        long long v69 = *(_OWORD *)(v29 + 40);
        long long v70 = *(_OWORD *)(v29 + 56);
        *((_DWORD *)v42 + 18) = *((_DWORD *)v29 + 18);
        *(_OWORD *)(v42 + 56) = v70;
        *(_OWORD *)(v42 + 40) = v69;
        long long v71 = *(_OWORD *)v29;
        long long v72 = *((_OWORD *)v29 + 1);
        *((_DWORD *)v42 + 8) = *((_DWORD *)v29 + 8);
        id v36 = v42 + 720;
        *(_OWORD *)long long v42 = v71;
        *((_OWORD *)v42 + 1) = v72;
        operator delete(v29);
        uint64x2_t v29 = v42;
        id v20 = v93;
      }
      v73 = v29;
      do
      {
        uint64_t v74 = sub_1BA8627D0(*p_device, *((void *)v73 + 1), *((void *)v73 + 2), *((void *)v73 + 3), a13);
        uint64_t v75 = **(void ***)v73;
        **(void **)v73 = v74;

        if (!*(void *)v73) {
          goto LABEL_25;
        }
        v73 += 40;
      }
      while (v73 != v36);
      v76 = v31;
      if (!v21->_gammaMatteTexture)
      {
        v86 = 0;
        goto LABEL_31;
      }
      v99[0] = &v21->_guidedFilterApplyRGBAKernel;
      v99[1] = @"guidedFilterApplyRGBA";
      v99[2] = 0;
      p_guidedFilterInvertKernel = (void **)&v21->_guidedFilterInvertKernel;
      v101 = @"invert";
      v102 = 0;
      p_guidedFilterMultiplyKernel = (void **)&v21->_guidedFilterMultiplyKernel;
      v104 = @"multiply";
      v105 = 0;
      p_guidedFilterEmbedGuideKernel = (void **)&v21->_guidedFilterEmbedGuideKernel;
      v107 = @"embedGuide";
      v108 = 0;
      p_guidedFilterPremultiplyKernel = (void **)&v21->_guidedFilterPremultiplyKernel;
      v110 = @"premultiply";
      v111 = 0;
      p_guidedFilterSecondOrderProductsKernel = (void **)&v21->_guidedFilterSecondOrderProductsKernel;
      v113 = @"secondOrderProducts";
      v114 = 0;
      p_guidedFilterRegressionKernel = (void **)&v21->_guidedFilterRegressionKernel;
      v116 = @"getRegressionCoeffs";
      v117 = 0;
      p_postProcessAlphaKernel = (void **)&v21->_postProcessAlphaKernel;
      v119 = @"postProcessAlpha";
      v120 = 0;
      sub_1BA8328CC((void **)&v21->_guidedFilterApplyRGBAKernel, *p_library, *p_pipelineLibrary, *p_device, @"guidedFilterApplyRGBA", a13, 0);
      if (v21 != (CVAFilterGuided *)-232)
      {
        sub_1BA8328CC(p_guidedFilterInvertKernel, *p_library, *p_pipelineLibrary, *p_device, v101, a13, v102);
        if (p_guidedFilterInvertKernel)
        {
          sub_1BA8328CC(p_guidedFilterMultiplyKernel, *p_library, *p_pipelineLibrary, *p_device, v104, a13, v105);
          if (p_guidedFilterMultiplyKernel)
          {
            sub_1BA8328CC(p_guidedFilterEmbedGuideKernel, *p_library, *p_pipelineLibrary, *p_device, v107, a13, v108);
            if (p_guidedFilterEmbedGuideKernel)
            {
              sub_1BA8328CC(p_guidedFilterPremultiplyKernel, *p_library, *p_pipelineLibrary, *p_device, v110, a13, v111);
              if (p_guidedFilterPremultiplyKernel)
              {
                sub_1BA8328CC(p_guidedFilterSecondOrderProductsKernel, *p_library, *p_pipelineLibrary, *p_device, v113, a13, v114);
                if (p_guidedFilterSecondOrderProductsKernel)
                {
                  sub_1BA8328CC(p_guidedFilterRegressionKernel, *p_library, *p_pipelineLibrary, *p_device, v116, a13, v117);
                  if (p_guidedFilterRegressionKernel)
                  {
                    sub_1BA8328CC(p_postProcessAlphaKernel, *p_library, *p_pipelineLibrary, *p_device, v119, a13, v120);
                    if (p_postProcessAlphaKernel)
                    {
                      int64x2_t v77 = [CVAFilterBox alloc];
                      id v78 = *p_device;
                      v79 = *p_pipelineLibrary;
                      long long v97 = *v89;
                      uint64_t v98 = *((void *)v89 + 2);
                      uint64_t v80 = [(CVAFilterBox *)v77 initWithDevice:v78 library:v95 pipelineLibrary:v79 textureSize:&v97 error:a13];
                      boxFilter = v21->_boxFilter;
                      v21->_boxFilter = (CVAFilterBox *)v80;

                      if (v21->_boxFilter)
                      {
                        v82 = [[CVAFilterHybridResampling alloc] initWithDevice:*p_device library:v95 pipelineLibrary:*p_pipelineLibrary commandQueue:v96 error:a13];
                        hybridResampler = v21->_hybridResampler;
                        v21->_hybridResampler = v82;

                        if (!v21->_hybridResampler)
                        {
                          v86 = 0;
                          v76 = v31;
                          goto LABEL_30;
                        }
                        v84 = [[CVAFilterInfimumConvolution alloc] initWithDevice:*p_device library:*p_library pipelineLibrary:*p_pipelineLibrary bufferWidth:[(MTLTexture *)v21->_lowResGammaMatte width] bufferHeight:[(MTLTexture *)v21->_lowResGammaMatte height] error:a13];
                        infConvolution = v21->_infConvolution;
                        v21->_infConvolution = v84;

                        v76 = v31;
                        if (v21->_infConvolution)
                        {
                          v86 = v21;
LABEL_30:
                          sub_1BA832B78(v99);
                          goto LABEL_31;
                        }
                      }
                      else
                      {
                        v76 = v31;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v86 = 0;
      goto LABEL_30;
    }
LABEL_25:
    v86 = 0;
    v76 = v31;
LABEL_31:

    operator delete(v29);
  }
  else
  {
    v86 = 0;
  }

  return v86;
}

@end