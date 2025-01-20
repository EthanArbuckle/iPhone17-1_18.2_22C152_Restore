@interface VCPVideoTransformerBackbone
+ (id)getNSDataFromOuput:(id)a3 isFP16:(BOOL)a4;
+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7;
+ (int)idealInputHeightWithRevision:(int64_t)a3;
+ (int)idealInputWidthWithRevision:(int64_t)a3;
+ (int64_t)revision;
+ (unint64_t)embeddingVersion;
+ (unint64_t)embeddingVersionForRevision:(int64_t)a3;
- (BOOL)isFP16;
- (NSData)embedding;
- (NSData)hiddenEmbedding;
- (NSData)spatialEmbedding;
- (VCPVideoTransformerBackbone)initWithConfig:(id)a3;
- (int)embeddingChannels;
- (int)embeddingHeight;
- (int)embeddingSequenceLength;
- (int)embeddingWidth;
- (int)inference:(id)a3;
- (unint64_t)inputTensorSize;
- (unint64_t)inputTensorType;
@end

@implementation VCPVideoTransformerBackbone

+ (int64_t)revision
{
  return 5;
}

+ (unint64_t)embeddingVersionForRevision:(int64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 2) >= 4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "Backbone revision %d is not supported", (uint8_t *)v6, 8u);
      }
    }
    return 0;
  }
  return v3;
}

+ (unint64_t)embeddingVersion
{
  v2 = objc_opt_class();
  uint64_t v3 = [(id)objc_opt_class() revision];
  return [v2 embeddingVersionForRevision:v3];
}

+ (id)getNSDataFromOuput:(id)a3 isFP16:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 tensorType] == 2)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v5, "getData:", 2), 4 * objc_msgSend(v5, "tensorSize"));
    if (!v4) {
      goto LABEL_9;
    }
    uint64_t v7 = +[VCPTextEncoder convertFloat32ToFloat16:v6];
LABEL_7:
    v8 = (void *)v7;

    v6 = v8;
    goto LABEL_9;
  }
  if ([v5 tensorType] == 1)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v5, "getData:", 1), 2 * objc_msgSend(v5, "tensorSize"));
    if (v4) {
      goto LABEL_9;
    }
    uint64_t v7 = +[VCPTextEncoder convertFloat16ToFloat32:v6];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

+ (int)idealInputWidthWithRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) >= 3) {
    return 224;
  }
  else {
    return 352;
  }
}

+ (int)idealInputHeightWithRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) >= 3) {
    return 224;
  }
  else {
    return 352;
  }
}

+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = +[VCPSharedInstanceManager sharedManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__VCPVideoTransformerBackbone_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
  v23[3] = &unk_1E6298048;
  id v17 = v11;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  v21 = [v16 sharedInstanceWithIdentifier:v12 andCreationBlock:v23];

  return v21;
}

VCPCNNModelEspressoV2 *__90__VCPVideoTransformerBackbone_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspressoV2 alloc] initWithParameters:a1[4] outputNames:a1[5] inputNames:a1[6] functionName:a1[7]];
  return v1;
}

- (VCPVideoTransformerBackbone)initWithConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  self->_isFP16 = 0;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle", a3);
  id v5 = [v4 resourceURL];

  v21.receiver = self;
  v21.super_class = (Class)VCPVideoTransformerBackbone;
  v6 = [(VCPVideoTransformerBackbone *)&v21 init];
  if (!v6) {
    goto LABEL_10;
  }
  if (+[VCPVideoTransformerBackbone revision] == 5) {
    uint64_t v7 = @"mubb_md5";
  }
  else {
    uint64_t v7 = @"mubb_md4";
  }
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7 relativeToURL:v5];
  v9 = NSString;
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
  id v11 = [v10 stringValue];
  id v12 = [v9 stringWithFormat:@"%@_%@", @"video_backbone", v11];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = +[VCPVideoTransformerBackbone revision];
      *(_DWORD *)buf = 67109120;
      int v23 = v14;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "VCPVideoTransformerBackbone use revision %d", buf, 8u);
    }
  }
  uint64_t v15 = [(id)objc_opt_class() sharedModel:v8 identifier:v12 outputNames:&unk_1F15EE778 inputNames:&unk_1F15EE790 functionName:@"main_video"];
  modelEspressoV2 = v6->_modelEspressoV2;
  v6->_modelEspressoV2 = (VCPCNNModelEspressoV2 *)v15;

  BOOL v17 = v6->_modelEspressoV2 == 0;
  if (v17) {
    id v18 = 0;
  }
  else {
LABEL_10:
  }
    id v18 = v6;
  id v19 = v18;

  return v19;
}

- (unint64_t)inputTensorType
{
  v2 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 inputsType];
  uint64_t v3 = [v2 objectAtIndexedSubscript:0];
  unint64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)inputTensorSize
{
  v2 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 inputsSize];
  uint64_t v3 = [v2 objectAtIndexedSubscript:0];
  unint64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (int)inference:(id)a3
{
  id v4 = a3;
  int v5 = -[VCPCNNModelEspressoV2 espressoForward:](self->_modelEspressoV2, "espressoForward:", objc_msgSend(v4, "getData:", -[VCPVideoTransformerBackbone inputTensorType](self, "inputTensorType")));
  if (!v5)
  {
    v6 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputsSize];
    if ([v6 count])
    {
      modelEspressoV2 = self->_modelEspressoV2;
      if (modelEspressoV2)
      {
        [(VCPCNNModelEspressoV2 *)modelEspressoV2 outputs];
        uint64_t v9 = v22;
        uint64_t v8 = v23;
        id v25 = (void **)&v22;
        std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
        if (v8 != v9)
        {
          [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
          id v10 = *(id *)v22;
          id v25 = (void **)&v22;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
          id v11 = [(id)objc_opt_class() getNSDataFromOuput:v10 isFP16:0];
          embedding = self->_embedding;
          self->_embedding = v11;

          if (+[VCPVideoTransformerBackbone revision] != 4
            && +[VCPVideoTransformerBackbone revision] != 5)
          {
            goto LABEL_11;
          }
          if ((unint64_t)[v6 count] >= 3)
          {
            id v13 = self->_modelEspressoV2;
            if (v13)
            {
              [(VCPCNNModelEspressoV2 *)v13 outputs];
              unint64_t v14 = v23 - v22;
              id v25 = (void **)&v22;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
              if (v14 >= 0x18)
              {
                uint64_t v15 = objc_opt_class();
                [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
                v16 = [v15 getNSDataFromOuput:*(void *)(v22 + 8) isFP16:0];
                spatialEmbedding = self->_spatialEmbedding;
                self->_spatialEmbedding = v16;

                id v25 = (void **)&v22;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
                id v18 = objc_opt_class();
                [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
                id v19 = [v18 getNSDataFromOuput:*(void *)(v22 + 16) isFP16:0];
                hiddenEmbedding = self->_hiddenEmbedding;
                self->_hiddenEmbedding = v19;

                id v25 = (void **)&v22;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
LABEL_11:
                int v5 = 0;
LABEL_16:

                goto LABEL_17;
              }
            }
            else
            {
              uint64_t v22 = 0;
              uint64_t v23 = 0;
              uint64_t v24 = 0;
              id v25 = (void **)&v22;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
            }
          }
          int v5 = 1;
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        id v25 = (void **)&v22;
        std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v25);
      }
    }
    int v5 = 1;
LABEL_17:
  }
  return v5;
}

- (int)embeddingHeight
{
  return self->_embeddingHeight;
}

- (int)embeddingWidth
{
  return self->_embeddingWidth;
}

- (int)embeddingChannels
{
  return self->_embeddingChannels;
}

- (int)embeddingSequenceLength
{
  return self->_embeddingSequenceLength;
}

- (BOOL)isFP16
{
  return self->_isFP16;
}

- (NSData)embedding
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)spatialEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)hiddenEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenEmbedding, 0);
  objc_storeStrong((id *)&self->_spatialEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_modelEspressoV2, 0);
}

@end