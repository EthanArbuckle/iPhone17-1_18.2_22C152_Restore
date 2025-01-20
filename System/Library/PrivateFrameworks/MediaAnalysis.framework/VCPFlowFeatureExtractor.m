@interface VCPFlowFeatureExtractor
- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5;
- (int)bindWithBuffers:(__CVBuffer *)a3 imgFeature:(id *)a4;
- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4 callback:(id)a5;
- (int)setFeatureShape:(id *)a3 height:(int)a4 width:(int)a5 level:(int)a6;
@end

@implementation VCPFlowFeatureExtractor

- (id)initModule:(int)a3 config:(id)a4 cancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v9 && ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VCPFlowFeatureExtractor;
    v12 = [(VCPEspressoModel *)&v18 initModelWithName:@"feature_extraction" andConfig:v8];
    v11 = v12;
    if (v12)
    {
      v12->_numLevels = a3;
      inputBlobName = v12->_inputBlobName;
      v12->_inputBlobName = (NSString *)@"t_0";

      featureBlobNames = v11->_featureBlobNames;
      v11->_featureBlobNames = (NSArray *)&unk_1F15EE220;

      featureChannels = v11->_featureChannels;
      v11->_featureChannels = (NSArray *)&unk_1F15EE238;

      self = v11;
    }
    else
    {
      self = 0;
    }
  }
  v16 = v11;

  return v16;
}

- (int)bindWithBuffers:(__CVBuffer *)a3 imgFeature:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSString *)self->_inputBlobName UTF8String];
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v6 = 0;
      goto LABEL_13;
    }
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind input", (uint8_t *)v12, 2u);
    }
    id v6 = 0;
LABEL_6:

LABEL_13:
    int v10 = -108;
    goto LABEL_16;
  }
  if (self->_numLevels >= 2u)
  {
    uint64_t v7 = 0;
    id v6 = 0;
    while (1)
    {
      id v8 = [(NSArray *)self->_featureBlobNames objectAtIndexedSubscript:v7];

      id v6 = v8;
      [v6 UTF8String];
      if (espresso_network_bind_direct_cvpixelbuffer()) {
        break;
      }
      unint64_t v9 = v7 + 2;
      ++v7;
      if (v9 >= self->_numLevels) {
        goto LABEL_15;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_13;
    }
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v7 + 1;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind output at level %d", (uint8_t *)v12, 8u);
    }
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_15:
  int v10 = 0;
LABEL_16:

  return v10;
}

- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4 callback:(id)a5
{
  id v8 = (void (**)(void))a5;
  int v9 = [(VCPFlowFeatureExtractor *)self bindWithBuffers:a3 imgFeature:a4];
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Feature extractor: fail to bind buffers", buf, 2u);
      }
    }
    v8[2](v8);
  }
  else
  {
    uint64_t v13 = v8;
    if (espresso_plan_submit())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Feature extractor: fail to execute", buf, 2u);
        }
      }
      int v9 = -18;
    }
    else
    {
      int v9 = 0;
    }
  }
  return v9;
}

uint64_t __70__VCPFlowFeatureExtractor_extractFeatureFromImage_toFeature_callback___block_invoke(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "Feature extractor: executing callback", v4, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)setFeatureShape:(id *)a3 height:(int)a4 width:(int)a5 level:(int)a6
{
  char v6 = a6;
  int v10 = [(NSArray *)self->_featureChannels objectAtIndexedSubscript:a6];
  a3->var0 = [v10 intValue];

  int v11 = 1 << (v6 - 1);
  a3->var1 = (v11 + a4) >> v6;
  a3->var2 = (v11 + a5) >> v6;
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureChannels, 0);
  objc_storeStrong((id *)&self->_featureBlobNames, 0);
  objc_storeStrong((id *)&self->_inputBlobName, 0);
}

@end