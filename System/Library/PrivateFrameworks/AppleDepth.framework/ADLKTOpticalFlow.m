@interface ADLKTOpticalFlow
+ ($9F5C386A951B3C504AD39AFD20B040BC)defaultConfig;
+ (CGSize)getNextPyramidLevelSize:(CGSize)a3;
+ (unsigned)MaxScales;
- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 config:(id *)a5;
- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 scales:(unint64_t)a5;
- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 inOutPyramidsArray:(id)a4 error:(id *)a5;
- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_BGRATex:(id)a4 outPyramidsArray:(id)a5 error:(id *)a6;
- (BOOL)_setupBufferAndReturnErrorWithDevice:(id)a3 error:(id *)a4;
- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_doSolverWithCommandBuffer:(id)a3 currentFeatures:(id)a4 currentDerivitive:(id)a5 previousFeatures:(id)a6 previousDerivitive:(id)a7 scale:(int)a8 coeff:(id)a9 in_uv_tex:(id)a10 out_uv_tex:(id)a11 out_w_tex:;
- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:;
- (int64_t)encodeOpticalFlowSolverToCommandBuffer:(id)a3 currentFeaturesArray:(id)a4 currentDerivitiveArray:(id)a5 previousFeaturesArray:(id)a6 previousDerivitiveArray:(id)a7 currentPyramidsArray:(id)a8 outShiftMap:(id)a9;
- (int64_t)encodePyramidFeaturesToCommandBuffer:(id)a3 colorTexture:(id)a4 outPyramidsArray:(id)a5 outFeaturesArray:(id)a6 outDerivitiveArray:(id)a7;
- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7;
- (void)_setupPipelines;
- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (void)dealloc;
- (void)setPyramidSizes;
@end

@implementation ADLKTOpticalFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_w_tex[9], 0);
  objc_storeStrong((id *)&self->_w_tex[8], 0);
  objc_storeStrong((id *)&self->_w_tex[7], 0);
  objc_storeStrong((id *)&self->_w_tex[6], 0);
  objc_storeStrong((id *)&self->_w_tex[5], 0);
  objc_storeStrong((id *)&self->_w_tex[4], 0);
  objc_storeStrong((id *)&self->_w_tex[3], 0);
  objc_storeStrong((id *)&self->_w_tex[2], 0);
  objc_storeStrong((id *)&self->_w_tex[1], 0);
  objc_storeStrong((id *)self->_w_tex, 0);
  objc_storeStrong((id *)&self->_Ixy_buf[1], 0);
  objc_storeStrong((id *)self->_Ixy_buf, 0);
  objc_storeStrong((id *)&self->_Adiagb_buf[1], 0);
  objc_storeStrong((id *)self->_Adiagb_buf, 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][9], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][8], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][7], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][6], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][5], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][4], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][3], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][2], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][1], 0);
  objc_storeStrong((id *)self->_uv_u32_alias_tex[1], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][9], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][8], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][7], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][6], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][5], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][4], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][3], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][2], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][1], 0);
  objc_storeStrong((id *)self->_uv_u32_alias_tex[0], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][9], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][8], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][7], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][6], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][5], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][4], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][3], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][2], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][1], 0);
  objc_storeStrong((id *)self->_uv_tex[1], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][9], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][8], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][7], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][6], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][5], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][4], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][3], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][2], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][1], 0);
  objc_storeStrong((id *)self->_uv_tex[0], 0);
  objc_storeStrong((id *)&self->_computePipelines[8], 0);
  objc_storeStrong((id *)&self->_computePipelines[7], 0);
  objc_storeStrong((id *)&self->_computePipelines[6], 0);
  objc_storeStrong((id *)&self->_computePipelines[5], 0);
  objc_storeStrong((id *)&self->_computePipelines[4], 0);
  objc_storeStrong((id *)&self->_computePipelines[3], 0);
  objc_storeStrong((id *)&self->_computePipelines[2], 0);
  objc_storeStrong((id *)&self->_computePipelines[1], 0);
  objc_storeStrong((id *)self->_computePipelines, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (int64_t)encodeOpticalFlowSolverToCommandBuffer:(id)a3 currentFeaturesArray:(id)a4 currentDerivitiveArray:(id)a5 previousFeaturesArray:(id)a6 previousDerivitiveArray:(id)a7 currentPyramidsArray:(id)a8 outShiftMap:(id)a9
{
  id v15 = a3;
  id v59 = a4;
  id v58 = a5;
  id v57 = a6;
  id v56 = a7;
  id v52 = a8;
  v55 = (MTLTexture *)a9;
  kdebug_trace();
  uv_tex = self->_uv_tex;
  id v60 = v15;
  [(ADLKTOpticalFlow *)self _zeroFlowWithCommandBuffer:v15 uv_tex:self->_uv_pxbuf[self->_nscales + 1]];
  unint64_t nscales = self->_nscales;
  if ((int)nscales >= 1)
  {
    uint64_t v17 = 0;
    v61 = 0;
    nwarpings = self->_nwarpings;
    unint64_t v53 = nscales - 1;
    w_tex = self->_w_tex;
    uint64_t v18 = self->_nscales;
    __asm { FMOV            V8.2S, #1.0 }
    while (1)
    {
      uint64_t v24 = v18 - 1;
      unint64_t v25 = (v18 - 1);
      double v26 = _D8;
      if (v18 != LODWORD(self->_nscales)) {
        double v26 = COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64((float64x2_t)self->_pyramid_size[v25]), vcvt_f32_f64((float64x2_t)self->_pyramid_size[v18])));
      }
      unsigned int v27 = nwarpings[v25];
      if (v27)
      {
        _ZF = v27 == 1 && v18 == 1;
        if (!_ZF || (v29 = v55, self->_useNonLocalRegularization)) {
          v29 = uv_tex[v17 ^ 1][v25];
        }
        v30 = v29;
        if (self->_useNonLocalRegularization && nwarpings[v25] == 1)
        {
          v31 = w_tex[v25];

          v61 = v31;
        }
        v32 = [v59 objectAtIndexedSubscript:(v18 - 1)];
        v33 = [v58 objectAtIndexedSubscript:(v18 - 1)];
        v34 = [v57 objectAtIndexedSubscript:(v18 - 1)];
        v35 = [v56 objectAtIndexedSubscript:(v18 - 1)];
        [(ADLKTOpticalFlow *)self _doSolverWithCommandBuffer:v60 currentFeatures:v32 currentDerivitive:v33 previousFeatures:v34 previousDerivitive:v35 scale:v18 - 1 coeff:v26 in_uv_tex:uv_tex[v17][v53] out_uv_tex:v30 out_w_tex:v61];

        v17 ^= 1uLL;
        unsigned int v36 = nwarpings[v25];
        if (v36 >= 2)
        {
          uint64_t v51 = v18;
          for (unsigned int i = 2; i <= v36; ++i)
          {
            if (i != v36 || v24 || (v38 = v55, self->_useNonLocalRegularization)) {
              v38 = uv_tex[v17 ^ 1][v25];
            }
            v39 = v38;
            if (self->_useNonLocalRegularization && i == nwarpings[v25])
            {
              v40 = w_tex[v25];

              v61 = v40;
            }
            v41 = [v59 objectAtIndexedSubscript:v25];
            v42 = [v58 objectAtIndexedSubscript:v25];
            v43 = [v57 objectAtIndexedSubscript:v25];
            v44 = [v56 objectAtIndexedSubscript:v25];
            [(ADLKTOpticalFlow *)self _doSolverWithCommandBuffer:v60 currentFeatures:v41 currentDerivitive:v42 previousFeatures:v43 previousDerivitive:v44 scale:v24 coeff:_D8 in_uv_tex:uv_tex[v17][v25] out_uv_tex:v39 out_w_tex:v61];

            v17 ^= 1uLL;
            unsigned int v36 = nwarpings[v25];
          }
          unint64_t v53 = v25;
          id v15 = v60;
          uint64_t v18 = v51;
          if (!self->_useNonLocalRegularization) {
            goto LABEL_3;
          }
LABEL_31:
          v45 = uv_tex[v17 ^ 1][v25];
          if (!v24)
          {
            v46 = v55;

            v45 = v46;
          }
          v47 = (void *)[(MTLTexture *)uv_tex[v17][v25] newTextureViewWithPixelFormat:53];
          v48 = [v52 objectAtIndexedSubscript:v25];
          v49 = (void *)[v48 newTextureViewWithPixelFormat:53];

          [(ADLKTOpticalFlow *)self _doNLRegularizationWithCommandBuffer:v60 in_uv_tex:v47 join_tex:v49 w_tex:v61 out_uv_tex:v45];
          v17 ^= 1uLL;
          id v15 = v60;
          goto LABEL_3;
        }
        unint64_t v53 = (v18 - 1);
        id v15 = v60;
      }
      if (self->_useNonLocalRegularization) {
        goto LABEL_31;
      }
LABEL_3:
      BOOL v23 = v18 <= 1;
      uint64_t v18 = v24;
      if (v23)
      {

        break;
      }
    }
  }
  kdebug_trace();

  return 0;
}

- (int64_t)encodePyramidFeaturesToCommandBuffer:(id)a3 colorTexture:(id)a4 outPyramidsArray:(id)a5 outFeaturesArray:(id)a6 outDerivitiveArray:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  kdebug_trace();
  if ([v13 pixelFormat] == 80)
  {
    [(ADLKTOpticalFlow *)self _createImagePyramidWithCommandBuffer:v12 in_BGRATex:v13 outPyramidsArray:v14 error:0];
    if ((int)self->_nscales >= 1)
    {
      unint64_t v17 = self->_nscales + 1;
      do
      {
        uint64_t v18 = [v14 objectAtIndexedSubscript:(v17 - 2)];
        v19 = [v15 objectAtIndexedSubscript:(v17 - 2)];
        [(ADLKTOpticalFlow *)self _computeFeaturesWithCommandBuffer:v12 in_tex:v18 out_tex:v19];

        v20 = [v15 objectAtIndexedSubscript:(v17 - 2)];
        v21 = [v16 objectAtIndexedSubscript:(v17 - 2)];
        [(ADLKTOpticalFlow *)self _computeFeaturesDerivativesWithCommandBuffer:v12 in_tex:v20 out_tex:v21];

        --v17;
      }
      while (v17 > 1);
    }
    int64_t v22 = 0;
  }
  else
  {
    uint64_t v23 = [v13 pixelFormat];
    BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v23 == 53)
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "MTLPixelFormatR32Uint support is temporarily disabled", buf, 2u);
      }
      int64_t v22 = -22952;
    }
    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = [v13 pixelFormat];
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Not supported pixel format: %lu", buf, 0xCu);
      }
      int64_t v22 = -22951;
    }
  }
  kdebug_trace();

  return v22;
}

- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 config:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ADLKTOpticalFlow;
  v11 = [(ADLKTOpticalFlow *)&v20 init];
  id v12 = v11;
  id v13 = v11;
  if (!v11) {
    goto LABEL_6;
  }
  v11->_resX = (int)width;
  v11->_resY = (int)height;
  unint64_t var0 = a5->var0;
  v11->_unint64_t nscales = a5->var0;
  if (var0)
  {
    unint64_t v15 = 0;
    unsigned int v16 = 1;
    do
    {
      unint64_t v17 = [a5->var1 objectAtIndexedSubscript:v15];
      v12->_nwarpings[v15] = [v17 unsignedIntValue];

      unint64_t v15 = v16++;
    }
    while (v13->_nscales > v15);
  }
  v13->_useNonLocalRegularization = a5->var2;
  v13->_nlreg_radius = a5->var3;
  v13->_nlreg_padding = a5->var4;
  v13->_nlreg_sigma_l = a5->var5;
  v13->_nlreg_sigma_c = a5->var6;
  v13->_nlreg_sigma_w = a5->var7;
  objc_storeStrong((id *)&v12->_device, a3);
  [(ADLKTOpticalFlow *)v13 _setupPipelines];
  [(ADLKTOpticalFlow *)v13 setPyramidSizes];
  if (![(ADLKTOpticalFlow *)v13 _setupBufferAndReturnErrorWithDevice:v13->_device error:0])uint64_t v18 = 0; {
  else
  }
LABEL_6:
    uint64_t v18 = v13;

  return v18;
}

- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 scales:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  +[ADLKTOpticalFlow defaultConfig];
  unint64_t v15 = a5;
  v12[0] = a5;
  id v10 = v16;
  v12[1] = v10;
  long long v13 = v17;
  uint64_t v14 = v18;
  if (self) {
    self = -[ADLKTOpticalFlow initWithDevice:inputSize:config:](self, "initWithDevice:inputSize:config:", v9, v12, width, height);
  }
  else {

  }
  return self;
}

- (BOOL)_setupBufferAndReturnErrorWithDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  if (maxThreadExecutionWidth)
  {
    size_t resX = self->_resX;
    size_t resY = self->_resY;
    CVPixelBufferRef pixelBufferOut = 0;
    CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CVReturn v12 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], resX, resY, 0x4C303068u, BufferAttributes, &pixelBufferOut);
    long long v13 = pixelBufferOut;
    if (v12) {
      long long v13 = 0;
    }
    self->_w_pxbuf = v13;
    if (v13)
    {
      uint64_t v14 = ((int)maxThreadExecutionWidth + (int)resX - 1) / (int)maxThreadExecutionWidth * (int)maxThreadExecutionWidth;
      uint64_t v15 = 8 * v14;
      id v16 = (MTLBuffer *)[v6 newBufferWithLength:8 * v14 * self->_resY options:0];
      long long v17 = self->_Adiagb_buf[0];
      self->_Adiagb_buf[0] = v16;

      if (self->_Adiagb_buf[0])
      {
        uint64_t v18 = 2 * v14;
        v19 = (MTLBuffer *)[v6 newBufferWithLength:2 * v14 * self->_resY options:0];
        objc_super v20 = self->_Ixy_buf[0];
        self->_Ixy_buf[0] = v19;

        if (self->_Ixy_buf[0])
        {
          size_t v21 = self->_resX;
          size_t v22 = self->_resY;
          CVPixelBufferRef pixelBufferOut = 0;
          CFDictionaryRef v23 = (const __CFDictionary *)getBufferAttributes();
          CVReturn v24 = CVPixelBufferCreate(v11, v21, v22, 0x32433068u, v23, &pixelBufferOut);
          unint64_t v25 = pixelBufferOut;
          if (v24) {
            unint64_t v25 = 0;
          }
          self->_uv_pxbuf[0] = v25;
          if (v25)
          {
            double v26 = (MTLBuffer *)[v6 newBufferWithLength:v15 * self->_resY options:0];
            uint64_t v27 = self->_Adiagb_buf[1];
            self->_Adiagb_buf[1] = v26;

            if (self->_Adiagb_buf[1])
            {
              uint64_t v28 = (MTLBuffer *)[v6 newBufferWithLength:v18 * self->_resY options:0];
              v29 = self->_Ixy_buf[1];
              self->_Ixy_buf[1] = v28;

              if (self->_Ixy_buf[1])
              {
                size_t v30 = self->_resX;
                size_t v31 = self->_resY;
                CVPixelBufferRef pixelBufferOut = 0;
                CFDictionaryRef v32 = (const __CFDictionary *)getBufferAttributes();
                CVReturn v33 = CVPixelBufferCreate(v11, v30, v31, 0x32433068u, v32, &pixelBufferOut);
                v34 = pixelBufferOut;
                if (v33) {
                  v34 = 0;
                }
                self->_uv_pxbuf[1] = v34;
                if (v34)
                {
                  if (!self->_nscales)
                  {
                    BOOL v59 = 1;
                    goto LABEL_23;
                  }
                  unint64_t v35 = 0;
                  double v36 = (double)self->_resX;
                  pyramid_size = self->_pyramid_size;
                  w_tex = self->_w_tex;
                  uv_tex = self->_uv_tex;
                  double v39 = (double)self->_resY;
                  uv_u32_alias_tex = self->_uv_u32_alias_tex;
                  unsigned int v41 = 1;
                  while (1)
                  {
                    p_double width = &pyramid_size[v35].width;
                    *p_double width = v36;
                    p_width[1] = v39;
                    uint64_t v43 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_w_pxbuf, 25, 0, self->_device, a4, v36, v39, pyramid_size);
                    v44 = w_tex[v35];
                    w_tex[v35] = (MTLTexture *)v43;

                    if (!w_tex[v35]) {
                      break;
                    }
                    uint64_t v45 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_uv_pxbuf[0], 65, 0, self->_device, a4, v36, v39);
                    v46 = (*uv_tex)[v35];
                    (*uv_tex)[v35] = (MTLTexture *)v45;

                    v47 = (*uv_tex)[v35];
                    if (!v47) {
                      break;
                    }
                    uint64_t v48 = [(MTLTexture *)v47 newTextureViewWithPixelFormat:53];
                    v49 = (*uv_u32_alias_tex)[v35];
                    (*uv_u32_alias_tex)[v35] = (MTLTexture *)v48;

                    uint64_t v50 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_uv_pxbuf[1], 65, 0, self->_device, a4, v36, v39);
                    uint64_t v51 = &(*uv_tex)[v35];
                    id v52 = v51[10];
                    v51[10] = (MTLTexture *)v50;

                    unint64_t v53 = v51[10];
                    if (!v53) {
                      break;
                    }
                    uint64_t v54 = [(MTLTexture *)v53 newTextureViewWithPixelFormat:53];
                    v55 = &(*uv_u32_alias_tex)[v35];
                    id v56 = v55[10];
                    v55[10] = (MTLTexture *)v54;

                    +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v36, v39);
                    double v36 = v57;
                    double v39 = v58;
                    unint64_t v35 = v41++;
                    BOOL v59 = 1;
                    if (self->_nscales <= v35) {
                      goto LABEL_23;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v59 = 0;
LABEL_23:

  return v59;
}

- (void)dealloc
{
  w_pxbuf = self->_w_pxbuf;
  if (w_pxbuf) {
    CVPixelBufferRelease(w_pxbuf);
  }
  v4 = self->_uv_pxbuf[0];
  if (v4) {
    CVPixelBufferRelease(v4);
  }
  v5 = self->_uv_pxbuf[1];
  if (v5) {
    CVPixelBufferRelease(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)ADLKTOpticalFlow;
  [(ADLKTOpticalFlow *)&v6 dealloc];
}

- (void)setPyramidSizes
{
  self->_pyramid_size[0].double width = (double)self->_resX;
  pyramid_size = self->_pyramid_size;
  self->_pyramid_size[0].double height = (double)self->_resY;
  if (self->_nscales >= 2)
  {
    unsigned int v4 = 2;
    unint64_t v5 = 1;
    do
    {
      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:");
      p_double width = (void *)&pyramid_size[v5].width;
      *p_double width = v7;
      p_width[1] = v8;
      unint64_t v5 = v4++;
    }
    while (self->_nscales > v5);
  }
}

- (void)_setupPipelines
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 URLForResource:@"default" withExtension:@"metallib" subdirectory:0];

  device = self->_device;
  id v15 = 0;
  objc_super v6 = (void *)[(MTLDevice *)device newLibraryWithURL:v4 error:&v15];
  id v14 = v15;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  do
  {
    id v9 = (void *)[[NSString alloc] initWithUTF8String:(&kKernelNames)[v7]];
    id v10 = (void *)[v6 newFunctionWithName:v9];

    CFAllocatorRef v11 = (void *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v10 error:0];
    objc_storeStrong((id *)&self->_computePipelines[v7], v11);
    unint64_t v12 = [v11 threadExecutionWidth];
    unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v12 > maxThreadExecutionWidth) {
      unint64_t maxThreadExecutionWidth = objc_msgSend(v11, "threadExecutionWidth", v14);
    }
    self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v7;
    uint64_t v8 = v10;
  }
  while (v7 != 9);
}

- (int)_doSolverWithCommandBuffer:(id)a3 currentFeatures:(id)a4 currentDerivitive:(id)a5 previousFeatures:(id)a6 previousDerivitive:(id)a7 scale:(int)a8 coeff:(id)a9 in_uv_tex:(id)a10 out_uv_tex:(id)a11 out_w_tex:
{
  uint64_t v12 = v11;
  id v18 = a3;
  id v38 = a4;
  id v41 = a5;
  id v42 = a6;
  id v40 = a7;
  id v19 = a9;
  id v20 = a10;
  id v39 = a11;
  uint64_t v21 = [v20 width];
  uint64_t v22 = [v20 height];
  unsigned int maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  uint64_t v24 = [v20 width];
  uint64_t v25 = [v19 width];
  uint64_t v26 = [v20 height];
  uint64_t v27 = [v19 height];
  v28.f32[0] = (float)(unint64_t)(v24 - 1) / (float)(unint64_t)(v25 - 1);
  v28.f32[1] = (float)(unint64_t)(v26 - 1) / (float)(unint64_t)(v27 - 1);
  v43[0] = v21;
  v43[1] = v22;
  uint64_t v44 = (v21 + maxThreadExecutionWidth - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth;
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v45 = vdiv_f32(_D1, v28);
  uint64_t v46 = v12;
  v34 = [v18 computeCommandEncoder];
  [v34 setComputePipelineState:self->_computePipelines[5]];
  [v34 setTexture:v19 atIndex:0];
  [v34 setTexture:v38 atIndex:1];
  [v34 setTexture:v42 atIndex:2];
  [v34 setTexture:v41 atIndex:3];
  [v34 setTexture:v40 atIndex:4];
  [v34 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v34 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v34 setBytes:v43 length:32 atIndex:2];
  +[ADMetalUtils dispatchCommandEncoder:v34 pipeline:self->_computePipelines[5] width:v21 height:v22];
  [v34 endEncoding];

  unint64_t v35 = [v18 computeCommandEncoder];
  [v35 setComputePipelineState:self->_computePipelines[6]];
  [v35 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v35 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v35 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:2];
  [v35 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:3];
  [v35 setBytes:v43 length:32 atIndex:4];
  +[ADMetalUtils dispatchCommandEncoder:v35 pipeline:self->_computePipelines[6] width:v21 height:v22];
  [v35 endEncoding];

  double v36 = [v18 computeCommandEncoder];
  [v36 setComputePipelineState:self->_computePipelines[7]];
  [v36 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:0];
  [v36 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:1];
  [v36 setTexture:v19 atIndex:0];
  [v36 setTexture:v20 atIndex:1];
  [v36 setTexture:v39 atIndex:2];
  [v36 setBytes:v43 length:32 atIndex:2];
  +[ADMetalUtils dispatchCommandEncoder:v36 pipeline:self->_computePipelines[7] width:v21 height:v22];
  [v36 endEncoding];

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[4]];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v10, self->_computePipelines[4], [v8 width], objc_msgSend(v8, "height"));
  [v10 endEncoding];

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[3]];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v10, self->_computePipelines[3], [v8 width], objc_msgSend(v8, "height"));
  [v10 endEncoding];

  return 0;
}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_BGRATex:(id)a4 outPyramidsArray:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [v10 computeCommandEncoder];
  [v13 setComputePipelineState:self->_computePipelines[0]];
  [v13 setTexture:v11 atIndex:0];
  id v14 = [v12 objectAtIndexedSubscript:0];
  [v13 setTexture:v14 atIndex:1];

  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v13, self->_computePipelines[0], [v11 width], objc_msgSend(v11, "height"));
  [v13 endEncoding];
  [(ADLKTOpticalFlow *)self _createImagePyramidWithCommandBuffer:v10 inOutPyramidsArray:v12 error:a6];

  return 1;
}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 inOutPyramidsArray:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self->_nscales >= 2)
  {
    unsigned int v9 = 2;
    unint64_t v10 = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    float64x2_t v19 = _Q0;
    do
    {
      id v16 = objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 2, *(_OWORD *)&v19);
      long long v17 = [v8 objectAtIndexedSubscript:v10];
      [(ADLKTOpticalFlow *)self _downscale2XWithCommandBuffer:v7 in_tex:v16 out_tex:v17 scaling_factor:COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)self->_pyramid_size[v10], v19)), vcvt_f32_f64(vaddq_f64(*(float64x2_t *)&self->_nwarpings[4 * v9 + 10], v19))))];

      unint64_t v10 = v9++;
    }
    while (self->_nscales > v10);
  }

  return 1;
}

- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v30[1] = 0;
  v30[0] = *(void *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v21 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  LODWORD(v22) = v21.i32[1];
  *((float *)&v22 + 1) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  CFDictionaryRef v23 = objc_msgSend(a3, "computeCommandEncoder", v30[0], 0, *(void *)&v21, v22);
  [v23 setComputePipelineState:self->_computePipelines[8]];
  [v23 setTexture:v12 atIndex:0];
  [v23 setTexture:v13 atIndex:1];
  [v23 setTexture:v14 atIndex:2];
  [v23 setTexture:v15 atIndex:3];
  [v23 setBytes:v30 length:32 atIndex:0];
  uint64_t v24 = self->_computePipelines[8];
  int v25 = [v12 width];
  int v26 = [v12 height];
  if (v25 >= 0) {
    int v27 = v25;
  }
  else {
    int v27 = v25 + 1;
  }
  uint64_t v28 = (v27 >> 1);
  if (v26 >= 0) {
    int v29 = v26;
  }
  else {
    int v29 = v26 + 1;
  }
  +[ADMetalUtils dispatchCommandEncoder:v23 pipeline:v24 width:v28 height:(v29 >> 1)];
  [v23 endEncoding];
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  id v11 = a5;
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v19 = vdiv_f32(_D0, v6);
  long long v17 = [a3 computeCommandEncoder];
  [v17 setComputePipelineState:self->_computePipelines[2]];
  [v17 setTexture:v10 atIndex:0];
  [v17 setTexture:v11 atIndex:1];
  [v17 setBytes:&v19 length:8 atIndex:0];
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v17, self->_computePipelines[2], [v11 width], objc_msgSend(v11, "height"));
  [v17 endEncoding];

  return 0;
}

- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v7 = a4;
  float32x2_t v6 = [a3 computeCommandEncoder];
  [v6 setComputePipelineState:self->_computePipelines[1]];
  [v6 setTexture:v7 atIndex:0];
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v6, self->_computePipelines[1], [v7 width], objc_msgSend(v7, "height"));
  [v6 endEncoding];
}

+ ($9F5C386A951B3C504AD39AFD20B040BC)defaultConfig
{
  uint64_t v4 = +[ADLKTOpticalFlow defaultConfig]::defaultConfig;
  if (!+[ADLKTOpticalFlow defaultConfig]::defaultConfig) {
    operator new();
  }
  float32x2_t v5 = *(void **)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8);
  retstr->unint64_t var0 = *(void *)+[ADLKTOpticalFlow defaultConfig]::defaultConfig;
  result = v5;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)(v4 + 16);
  *(void *)&retstr->var6 = *(void *)(v4 + 32);
  return result;
}

+ (unsigned)MaxScales
{
  return 10;
}

+ (CGSize)getNextPyramidLevelSize:(CGSize)a3
{
  int height = (int)a3.height;
  int v4 = (int)a3.width & 1;
  if ((int)a3.width < 0) {
    int v4 = -v4;
  }
  int v5 = (int)a3.height & 1;
  if (height < 0) {
    int v5 = -v5;
  }
  int v6 = v4 + (int)a3.width;
  if (v6 >= 0) {
    int v7 = v4 + (int)a3.width;
  }
  else {
    int v7 = v6 + 1;
  }
  int v8 = v7 >> 1;
  if (v8 >= 0) {
    int v9 = v8 & 1;
  }
  else {
    int v9 = -(v8 & 1);
  }
  int v10 = v5 + height;
  if (v10 >= 0) {
    int v11 = v10;
  }
  else {
    int v11 = v10 + 1;
  }
  int v12 = v11 >> 1;
  if (v12 >= 0) {
    int v13 = v12 & 1;
  }
  else {
    int v13 = -(v12 & 1);
  }
  int v14 = v6 + 2 * v9;
  if (v14 + 1 >= 0) {
    int v15 = v14 + 1;
  }
  else {
    int v15 = v14 + 2;
  }
  int v16 = v15 >> 1;
  int v17 = v10 + 2 * v13;
  if (v17 + 1 >= 0) {
    int v18 = v17 + 1;
  }
  else {
    int v18 = v17 + 2;
  }
  double v19 = (double)v16;
  double v20 = (double)(v18 >> 1);
  result.int height = v20;
  result.double width = v19;
  return result;
}

@end