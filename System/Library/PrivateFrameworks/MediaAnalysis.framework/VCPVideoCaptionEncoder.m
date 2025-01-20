@interface VCPVideoCaptionEncoder
+ (id)sharedModel:(id)a3 properties:(id)a4;
- (VCPVideoCaptionEncoder)initWithModelPath:(id)a3;
- (float)videoEmbedding;
- (int)embeddingChannels;
- (int)embeddingHeight;
- (int)embeddingSequenceLength;
- (int)embeddingWidth;
- (int)inference:(float *)a3;
@end

@implementation VCPVideoCaptionEncoder

- (VCPVideoCaptionEncoder)initWithModelPath:(id)a3
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VCPVideoCaptionEncoder;
  v5 = [(VCPVideoCaptionEncoder *)&v37 init];
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v4;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[VideoCaption] VCPVideoCaptionEncoder: start loading model at: %@", buf, 0xCu);
      }
    }
    if (v4)
    {
      v5->_forceNNGraph = !DeviceGeqD5x();
      v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"model_info.json" relativeToURL:v4];
      v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
      v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:0];
      v10 = v9;
      if (v5->_forceNNGraph)
      {
        v11 = [v9 objectForKeyedSubscript:@"net_file"];
        [v11 objectForKeyedSubscript:@"d4x"];
      }
      else
      {
        v11 = [v9 objectForKeyedSubscript:@"net_file"];
        [v11 objectForKeyedSubscript:@"d5x"];
      v13 = };

      v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13 relativeToURL:v4];
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v14;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: model to load %@", buf, 0xCu);
        }
      }
      v57[0] = @"forceNNGraph";
      v16 = [NSNumber numberWithBool:v5->_forceNNGraph];
      v58[0] = v16;
      v57[1] = @"sharedContext";
      v17 = [NSNumber numberWithBool:!v5->_forceNNGraph];
      v58[1] = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

      uint64_t v19 = [(id)objc_opt_class() sharedModel:v14 properties:v18];
      modelEspresso = v5->_modelEspresso;
      v5->_modelEspresso = (VCPCNNModelEspresso *)v19;

      v21 = v5->_modelEspresso;
      if (!v21 || [(VCPCNNModelEspresso *)v21 prepareModelWithConfig:&stru_1F15A0D70])
      {
        v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
      if ((int)MediaAnalysisLogLevel() < 5)
      {
LABEL_33:
        v12 = v5;
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: successfully loaded model", buf, 2u);
          }

          v12 = v5;
        }
        goto LABEL_18;
      }
      v24 = VCPLogInstance();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:

        goto LABEL_33;
      }
      v25 = v5->_modelEspresso;
      if (v25)
      {
        [(VCPCNNModelEspresso *)v25 inputBlob];
        int v33 = v45;
        v26 = v5->_modelEspresso;
        if (v26)
        {
          [(VCPCNNModelEspresso *)v26 inputBlob];
          int v32 = v36;
          v27 = v5->_modelEspresso;
          if (v27)
          {
            [(VCPCNNModelEspresso *)v27 inputBlob];
            int v31 = v35;
            v28 = v5->_modelEspresso;
            if (v28)
            {
              [(VCPCNNModelEspresso *)v28 inputBlob];
              int v29 = v34;
LABEL_31:
              *(_DWORD *)v49 = 67109888;
              int v50 = v33;
              __int16 v51 = 1024;
              int v52 = v32;
              __int16 v53 = 1024;
              int v54 = v31;
              __int16 v55 = 1024;
              int v56 = v29;
              _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "[VideoCaption] VCPVideoCaptionEncoder: inputBlob.nframes = %d, inputBlob.height = %d, inputBlob.width = %d, inputBlob.channels = %d", v49, 0x1Au);
              goto LABEL_32;
            }
LABEL_30:
            int v29 = 0;
            goto LABEL_31;
          }
LABEL_29:
          int v31 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        int v33 = 0;
        uint64_t v48 = 0;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        *(_OWORD *)buf = 0u;
        long long v39 = 0u;
      }
      int v32 = 0;
      goto LABEL_29;
    }
  }
  v12 = 0;
LABEL_19:
  v22 = v12;

  return v22;
}

+ (id)sharedModel:(id)a3 properties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[VCPSharedInstanceManager sharedManager];
  v8 = NSString;
  v9 = [v5 absoluteString];
  v10 = [v8 stringWithFormat:@"%@_%@", @"VCPVideoCaptionEncoder", v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__VCPVideoCaptionEncoder_sharedModel_properties___block_invoke;
  v15[3] = &unk_1E6298008;
  id v11 = v5;
  id v16 = v11;
  id v12 = v6;
  id v17 = v12;
  v13 = [v7 sharedInstanceWithIdentifier:v10 andCreationBlock:v15];

  return v13;
}

VCPCNNModelEspresso *__49__VCPVideoCaptionEncoder_sharedModel_properties___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:*(void *)(a1 + 40)];
  return v1;
}

- (int)inference:(float *)a3
{
  int v4 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:a3];
  if (!v4)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlob];
      id v6 = self->_modelEspresso;
      self->_embeddingHeight = v14;
      if (v6)
      {
        [(VCPCNNModelEspresso *)v6 outputBlob];
        v7 = self->_modelEspresso;
        self->_embeddingWidth = v13;
        if (v7)
        {
          [(VCPCNNModelEspresso *)v7 outputBlob];
          v8 = self->_modelEspresso;
          self->_embeddingChannels = v15;
          if (v8)
          {
            [(VCPCNNModelEspresso *)v8 outputBlob];
            v9 = self->_modelEspresso;
            self->_embeddingSequenceLength = v16;
            if (v9)
            {
              [(VCPCNNModelEspresso *)v9 outputBlob];
              v10 = v12;
            }
            else
            {
              v10 = 0;
            }
            goto LABEL_12;
          }
LABEL_11:
          v10 = 0;
          self->_embeddingSequenceLength = 0;
LABEL_12:
          self->_videoEmbedding = v10;
          return v4;
        }
LABEL_10:
        self->_embeddingChannels = 0;
        goto LABEL_11;
      }
    }
    else
    {
      self->_embeddingHeight = 0;
    }
    self->_embeddingWidth = 0;
    goto LABEL_10;
  }
  return v4;
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

- (float)videoEmbedding
{
  return self->_videoEmbedding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end