@interface CNNMLScalerEspresso
- (CNNMLScalerEspresso)initWithConfig:(id)a3 modelIndex:(int64_t)a4 scalingFactor:(int)a5;
- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4;
- (int)outputHeight;
- (int)outputWidth;
- (void)dealloc;
@end

@implementation CNNMLScalerEspresso

- (void)dealloc
{
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_ctx) {
    espresso_context_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)CNNMLScalerEspresso;
  [(CNNMLScalerEspresso *)&v3 dealloc];
}

- (CNNMLScalerEspresso)initWithConfig:(id)a3 modelIndex:(int64_t)a4 scalingFactor:(int)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CNNMLScalerEspresso;
  v9 = [(CNNMLScalerEspresso *)&v25 init];
  if (!v9) {
    goto LABEL_28;
  }
  v10 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v11 = [v10 resourceURL];

  if (a4 == 1)
  {
    if (a5 == 4 || a5 == 2)
    {
      v13 = objc_alloc_init(_MADObjCModelCatalogModel);
      uint64_t v14 = [(_MADObjCModelCatalogModel *)v13 getModelURL:0];

      if (v14)
      {
        if (a5 == 2) {
          v15 = @"cnn_gp_mlscaler.espresso.net";
        }
        else {
          v15 = @"cnn_gp_mlscaler4x.espresso.net";
        }
        v12 = [MEMORY[0x1E4F1CB10] URLWithString:v15 relativeToURL:v14];

        v11 = (void *)v14;
        goto LABEL_22;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Cannot find MLScaler model from ModelCatalog", v24, 2u);
        }
      }
      v11 = 0;
      goto LABEL_18;
    }
  }
  else if (!a4)
  {
    v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_emoji_mlscaler.espresso.net" relativeToURL:v11];
LABEL_22:
    v9->_uint64_t plan = 0;
    v9->_ctx = 0;
    v9->_ctx = (void *)espresso_create_context();
    uint64_t plan = espresso_create_plan();
    v9->_uint64_t plan = (void *)plan;
    if (!plan) {
      goto LABEL_25;
    }
    id v18 = [v12 path];
    [v18 UTF8String];
    int v19 = espresso_plan_add_network();

    if (v19) {
      goto LABEL_25;
    }
    [v8 UTF8String];
    if (espresso_network_select_configuration()) {
      goto LABEL_25;
    }
    int v21 = espresso_plan_build();

    if (v21) {
      goto LABEL_26;
    }
LABEL_28:
    v20 = v9;
    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    VCPLogInstance();
    v13 = (_MADObjCModelCatalogModel *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1BBEDA000, &v13->super, OS_LOG_TYPE_ERROR, "CNNMLScalerEspresso model not supported!", v24, 2u);
    }
LABEL_18:
  }
  v12 = 0;
LABEL_25:

LABEL_26:
  v20 = 0;
LABEL_29:
  v22 = v20;

  return v22;
}

- (int)inferenceWithPixelBuffer:(__CVBuffer *)a3 toDestinationPixelBuffer:(__CVBuffer *)a4
{
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = VCPSignPostLog();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMADMLScalingInference", "", buf, 2u);
  }

  int result = espresso_network_bind_direct_cvpixelbuffer();
  if (!result)
  {
    int result = espresso_network_bind_direct_cvpixelbuffer();
    if (!result)
    {
      int result = espresso_plan_execute_sync();
      if (!result)
      {
        v9 = VCPSignPostLog();
        v10 = v9;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)v11 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v5, "VCPMADMLScalingInference", "", v11, 2u);
        }

        return 0;
      }
    }
  }
  return result;
}

- (int)outputHeight
{
  return self->_outputHeight;
}

- (int)outputWidth
{
  return self->_outputWidth;
}

@end