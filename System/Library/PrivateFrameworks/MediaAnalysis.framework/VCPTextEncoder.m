@interface VCPTextEncoder
+ (BOOL)useCSULanguageEncoder;
+ (id)applyL2Norm:(id)a3 isFP16:(BOOL)a4;
+ (id)convertFloat16ToFloat32:(id)a3;
+ (id)convertFloat32ToFloat16:(id)a3;
+ (id)convertToCSEmbedding:(id)a3 isFP16:(BOOL)a4;
+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7;
- (VCPTextEncoder)init;
- (id)textEmbeddingForQuery:(id)a3 useFP16:(BOOL)a4;
- (void)dealloc;
@end

@implementation VCPTextEncoder

+ (BOOL)useCSULanguageEncoder
{
  return 1;
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
  v23[2] = __77__VCPTextEncoder_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
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

VCPCNNModelEspressoV2 *__77__VCPTextEncoder_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspressoV2 alloc] initWithParameters:a1[4] outputNames:a1[5] inputNames:a1[6] functionName:a1[7]];
  return v1;
}

- (VCPTextEncoder)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)VCPTextEncoder;
  v2 = [(VCPTextEncoder *)&v39 init];
  if (!v2) {
    goto LABEL_33;
  }
  if ([(id)objc_opt_class() useCSULanguageEncoder])
  {
    if (+[VCPVideoTransformerBackbone revision] == 5) {
      uint64_t v3 = 9;
    }
    else {
      uint64_t v3 = 8;
    }
    id v38 = 0;
    v4 = [MEMORY[0x1E4F5D0C8] createForRevision:v3 error:&v38];
    id v5 = v38;
    if (v4)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F5D0C0]) initWithConfiguration:v4];
      csuTextEncoder = v2->_csuTextEncoder;
      v2->_csuTextEncoder = (CSUTextEncoder *)v6;

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "Use CSUSystemSearchTextEncoderV1 as text encoder", buf, 2u);
        }
LABEL_24:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v32 = [v5 description];
        *(_DWORD *)buf = 138412290;
        v41 = v32;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "Failed to create encoder config (%@)", buf, 0xCu);
      }
      goto LABEL_24;
    }

    int v31 = 0;
LABEL_30:
    v2->_embeddingDim = 512;
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.mediaanalysisd.textencoder", 0);
    embeddingGenerationQueue = v2->_embeddingGenerationQueue;
    v2->_embeddingGenerationQueue = (OS_dispatch_queue *)v33;

    goto LABEL_31;
  }
  int64_t v9 = +[VCPVideoTransformerBackbone revision];
  if (v9 == 5) {
    v10 = @"md5_token_embed.bundle";
  }
  else {
    v10 = @"md4_token_embed.bundle";
  }
  id v11 = NSString;
  if (v9 == 5) {
    id v12 = @"md5_text_model.bundle";
  }
  else {
    id v12 = @"md4_text_model.bundle";
  }
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
  id v14 = [v13 stringValue];
  id v15 = [v11 stringWithFormat:@"%@_%@", @"token_model", v14];

  v16 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  id v17 = [v16 resourceURL];

  id v18 = [MEMORY[0x1E4F1CB10] URLWithString:v10 relativeToURL:v17];
  uint64_t v19 = [(id)objc_opt_class() sharedModel:v18 identifier:v15 outputNames:&unk_1F15EDF20 inputNames:&unk_1F15EDF38 functionName:@"main"];
  tokenModel = v2->_tokenModel;
  v2->_tokenModel = (VCPCNNModelEspressoV2 *)v19;

  if (v2->_tokenModel)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:v12 relativeToURL:v17];

    v22 = NSString;
    v23 = objc_msgSend(NSNumber, "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
    id v24 = [v23 stringValue];
    uint64_t v25 = [v22 stringWithFormat:@"%@_%@", @"text_model", v24];

    uint64_t v26 = [(id)objc_opt_class() sharedModel:v21 identifier:v25 outputNames:&unk_1F15EDF50 inputNames:&unk_1F15EDF68 functionName:@"main"];
    textModel = v2->_textModel;
    v2->_textModel = (VCPCNNModelEspressoV2 *)v26;

    if (v2->_textModel)
    {
      v28 = objc_alloc_init(VCPTextTokenizerT5);
      textTokenizer = v2->_textTokenizer;
      v2->_textTokenizer = &v28->super;

      BOOL v30 = v2->_textTokenizer != 0;
      if (v2->_textTokenizer) {
        int v31 = 0;
      }
      else {
        int v31 = -108;
      }
    }
    else
    {
      BOOL v30 = 0;
      int v31 = -18;
    }
    id v15 = (void *)v25;
    id v18 = (void *)v21;
  }
  else
  {
    BOOL v30 = 0;
    int v31 = -108;
  }

  if (v30) {
    goto LABEL_30;
  }
LABEL_31:
  if (!v31)
  {
LABEL_33:
    v35 = v2;
    goto LABEL_34;
  }
  v35 = 0;
LABEL_34:
  v36 = v35;

  return v36;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VCPTextEncoder;
  [(VCPTextEncoder *)&v2 dealloc];
}

+ (id)convertToCSEmbedding:(id)a3 isFP16:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    if ([v5 length] == 1024)
    {
      int v7 = _os_feature_enabled_impl();
      id v8 = objc_alloc(MEMORY[0x1E4F238A0]);
      v18[0] = v6;
      int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      if (v7) {
        uint64_t v10 = 5;
      }
      else {
        uint64_t v10 = 4;
      }
      uint64_t v11 = [v8 initWithFormat:1 dimension:1 version:v10 vectors:v9];
      goto LABEL_9;
    }
    if ([v6 length] == 1536)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F238A0]);
      id v17 = v6;
      int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      uint64_t v11 = [v12 initWithFormat:1 dimension:2 version:2 vectors:v9];
LABEL_9:
      id v13 = (void *)v11;
LABEL_14:

      goto LABEL_16;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    int64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      uint64_t v16 = [v6 length];
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "Unexpected embedding size %lu", (uint8_t *)&v15, 0xCu);
    }
    id v13 = 0;
    goto LABEL_14;
  }
  id v13 = 0;
LABEL_16:

  return v13;
}

+ (id)convertFloat16ToFloat32:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * (v4 >> 1)];
  id v6 = v3;
  int v7 = (__int16 *)[v6 bytes];
  id v8 = v5;
  int64_t v9 = (_DWORD *)[v8 mutableBytes];
  if (v4 >= 2)
  {
    if (v4 >> 1 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v4 >> 1;
    }
    do
    {
      __int16 v11 = *v7++;
      _H0 = v11;
      __asm { FCVT            S0, H0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

+ (id)convertFloat32ToFloat16:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = [MEMORY[0x1E4F1CA58] dataWithLength:2 * (v4 >> 2)];
  id v6 = v3;
  int v7 = (int *)[v6 bytes];
  id v8 = v5;
  int64_t v9 = (_WORD *)[v8 mutableBytes];
  if (v4 >= 4)
  {
    if (v4 >> 2 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v4 >> 2;
    }
    do
    {
      int v11 = *v7++;
      _S0 = v11;
      __asm { FCVT            H0, S0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

+ (id)applyL2Norm:(id)a3 isFP16:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 length])
  {
    if (v4)
    {
      unint64_t v6 = [v5 length];
      int v7 = (__int16 *)[v5 bytes];
      id v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v6 & 0xFFFFFFFFFFFFFFFELL];
      int64_t v9 = (_WORD *)[v8 mutableBytes];
      if (v6 >= 2)
      {
        uint64_t v10 = v6 >> 1;
        if (v6 >> 1 <= 1) {
          uint64_t v10 = 1;
        }
        float v11 = 0.0;
        id v12 = v7;
        uint64_t v13 = v10;
        do
        {
          __int16 v14 = *v12++;
          _H1 = v14;
          __asm { FCVT            S1, H1 }
          float v11 = v11 + (float)(_S1 * _S1);
          --v13;
        }
        while (v13);
        float v20 = sqrtf(v11);
        if (v20 > 0.0 && v6 >= 2)
        {
          do
          {
            __int16 v22 = *v7++;
            _H1 = v22;
            __asm { FCVT            S1, H1 }
            _S1 = _S1 / v20;
            __asm { FCVT            H1, S1 }
            *v9++ = LOWORD(_S1);
            --v10;
          }
          while (v10);
        }
      }
    }
    else
    {
      unint64_t v26 = [v5 length];
      id v27 = (float *)[v5 bytes];
      id v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v26 & 0xFFFFFFFFFFFFFFFCLL];
      v28 = (float *)[v8 mutableBytes];
      if (v26 >= 4)
      {
        uint64_t v29 = v26 >> 2;
        if (v26 >> 2 <= 1) {
          uint64_t v29 = 1;
        }
        float v30 = 0.0;
        int v31 = v27;
        uint64_t v32 = v29;
        do
        {
          float v33 = *v31++;
          float v30 = v30 + (float)(v33 * v33);
          --v32;
        }
        while (v32);
        float v34 = sqrtf(v30);
        if (v34 > 0.0 && v26 >= 4)
        {
          do
          {
            float v36 = *v27++;
            *v28++ = v36 / v34;
            --v29;
          }
          while (v29);
        }
      }
    }
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (id)textEmbeddingForQuery:(id)a3 useFP16:(BOOL)a4
{
  BOOL v66 = a4;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = v5;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__6;
  v84 = __Block_byref_object_dispose__6;
  id v85 = 0;
  if (self->_csuTextEncoder)
  {
    v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__6;
    v78 = __Block_byref_object_dispose__6;
    id v79 = 0;
    embeddingGenerationQueue = self->_embeddingGenerationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke;
    block[3] = &unk_1E6298070;
    block[4] = self;
    id v72 = v5;
    v73 = &v74;
    dispatch_sync(embeddingGenerationQueue, block);
    if (v75[5])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v10 = -18;
        int v11 = 6;
        goto LABEL_39;
      }
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int64_t v9 = [v75[5] description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Text encoding failed (%@)", buf, 0xCu);
      }
      int v10 = -18;
      int v11 = 6;
      goto LABEL_38;
    }
    id v24 = [(CSUTextEncoder *)self->_csuTextEncoder inferenceOutputs];
    uint64_t v25 = [v24 CSUTextEmbedding];
    if ([v25 dataType] == 65552)
    {
      unint64_t v26 = [(CSUTextEncoder *)self->_csuTextEncoder inferenceOutputs];
      id v27 = [v26 CSUTextEmbedding];
      BOOL v28 = [v27 count] == self->_embeddingDim;

      if (v28)
      {
        uint64_t v29 = [(CSUTextEncoder *)self->_csuTextEncoder inferenceOutputs];
        float v30 = [v29 CSUTextEmbedding];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke_261;
        v70[3] = &unk_1E6298098;
        v70[4] = &v80;
        [v30 getBytesWithHandler:v70];

        if (v66)
        {
          int v11 = 0;
          int v10 = 0;
          goto LABEL_39;
        }
        uint64_t v52 = [(id)objc_opt_class() convertFloat16ToFloat32:v81[5]];
        int v11 = 0;
        int v10 = 0;
        id v8 = v81[5];
        v81[5] = v52;
        goto LABEL_38;
      }
    }
    else
    {
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v11 = 0;
      int v10 = -18;
      goto LABEL_39;
    }
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      float v34 = [(CSUTextEncoder *)self->_csuTextEncoder inferenceOutputs];
      v35 = [v34 CSUTextEmbedding];
      int v36 = [v35 dataType];
      v37 = [(CSUTextEncoder *)self->_csuTextEncoder inferenceOutputs];
      id v38 = [v37 CSUTextEmbedding];
      int v39 = [v38 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v39;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "CSU unexpected output embedding with type %d, size %d", buf, 0xEu);
    }
    int v11 = 0;
    int v10 = -18;
LABEL_38:

LABEL_39:
    _Block_object_dispose(&v74, 8);

    if (v11) {
      goto LABEL_51;
    }
LABEL_50:
    uint64_t v56 = [(id)objc_opt_class() applyL2Norm:v81[5] isFP16:v66];
    v57 = (void *)v81[5];
    v81[5] = v56;

    goto LABEL_51;
  }
  v63 = [(VCPTextTokenizer *)self->_textTokenizer encode:v5];
  id v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v63];
  v64 = v12;
  unint64_t v13 = [v63 count];
  if (v13 >= 0x100) {
    uint64_t v14 = 256;
  }
  else {
    uint64_t v14 = v13;
  }
  v65 = objc_msgSend(v12, "subarrayWithRange:", 0, v14);
  v74 = 0;
  v75 = 0;
  uint64_t v76 = 0;
  int v15 = [(VCPCNNModelEspressoV2 *)self->_tokenModel inputsSize];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];
  unsigned int v17 = [v16 unsignedIntValue];

  id v18 = [(VCPCNNModelEspressoV2 *)self->_tokenModel inputsType];
  uint64_t v19 = [v18 objectAtIndexedSubscript:0];
  unsigned int v20 = [v19 unsignedIntValue];

  uint64_t v21 = [[VCPEspressoV2Data alloc] initWithTensorType:v20 size:v17];
  __int16 v22 = v21;
  if (!v21)
  {
    id v31 = 0;
    uint64_t v32 = 0;
    float v33 = 0;
    int v10 = -108;
LABEL_46:
    int v55 = 6;
    goto LABEL_47;
  }
  [(VCPEspressoV2Data *)v21 setData:v65 padding:&unk_1F15EB4C0];
  if ([v65 count]) {
    float v23 = (float)(unint64_t)([v65 count] - 1);
  }
  else {
    float v23 = 0.0;
  }
  int v10 = [(VCPCNNModelEspressoV2 *)self->_tokenModel espressoForward:[(VCPEspressoV2Data *)v22 getData:v20]];
  if (v10)
  {
    id v31 = 0;
    uint64_t v32 = 0;
    float v33 = 0;
    goto LABEL_46;
  }
  std::vector<void *>::resize((uint64_t)&v74, 2uLL);
  uint64_t v32 = [(VCPCNNModelEspressoV2 *)self->_textModel inputsType];
  v40 = [v32 objectAtIndexedSubscript:0];
  int v41 = [v40 intValue];

  [(VCPCNNModelEspressoV2 *)self->_tokenModel outputs];
  uint64_t v42 = [**(id **)buf getData:v41];
  *(void *)v74 = v42;
  v86 = (void **)buf;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v86);
  v43 = [v32 objectAtIndexedSubscript:1];
  unsigned int v44 = [v43 unsignedIntValue];

  float v33 = [[VCPEspressoV2Data alloc] initWithTensorType:v44 size:1];
  *(float *)&double v45 = v23;
  [(VCPEspressoV2Data *)v33 setValueFP:0 atIndex:v45];
  uint64_t v46 = [(VCPEspressoV2Data *)v33 getData:v44];
  v47 = v74;
  *((void *)v74 + 1) = v46;
  textModel = self->_textModel;
  __p = 0;
  v68 = 0;
  uint64_t v69 = 0;
  std::vector<void *>::__init_with_size[abi:ne180100]<void **,void **>(&__p, v47, (uint64_t)v75, ((char *)v75 - (unsigned char *)v47) >> 3);
  int v10 = [(VCPCNNModelEspressoV2 *)textModel espressoForwardInputs:&__p];
  if (__p)
  {
    v68 = __p;
    operator delete(__p);
  }
  if (v10)
  {
    id v31 = 0;
    goto LABEL_46;
  }
  [(VCPCNNModelEspressoV2 *)self->_textModel outputs];
  id v31 = *(id *)(*(void *)buf + 16);
  v86 = (void **)buf;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v86);
  if (!v31) {
    goto LABEL_45;
  }
  if ([v31 tensorSize] != self->_embeddingDim)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v53 = VCPLogInstance();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        int embeddingDim = self->_embeddingDim;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = embeddingDim;
        _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_ERROR, "MA text encoder output size does not match expected %d", buf, 8u);
      }
      int v10 = -18;
      int v55 = 6;
      goto LABEL_62;
    }
LABEL_45:
    int v10 = -18;
    goto LABEL_46;
  }
  if ([v31 tensorType] != 2)
  {
    if ([v31 tensorType] == 1)
    {
      uint64_t v61 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v31, "getData:", 1), 2 * objc_msgSend(v31, "tensorSize"));
      v62 = (void *)v81[5];
      v81[5] = v61;

      if (!v66)
      {
        uint64_t v51 = [(id)objc_opt_class() convertFloat16ToFloat32:v81[5]];
        goto LABEL_61;
      }
    }
LABEL_59:
    int v55 = 0;
    int v10 = 0;
    goto LABEL_47;
  }
  uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v31, "getData:", 2), 4 * objc_msgSend(v31, "tensorSize"));
  v50 = (void *)v81[5];
  v81[5] = v49;

  if (!v66) {
    goto LABEL_59;
  }
  uint64_t v51 = [(id)objc_opt_class() convertFloat32ToFloat16:v81[5]];
LABEL_61:
  int v55 = 0;
  int v10 = 0;
  v53 = v81[5];
  v81[5] = v51;
LABEL_62:

LABEL_47:
  if (v74)
  {
    v75 = (id *)v74;
    operator delete(v74);
  }

  if (!v55) {
    goto LABEL_50;
  }
LABEL_51:
  if (v10) {
    v58 = 0;
  }
  else {
    v58 = (void *)v81[5];
  }
  id v59 = v58;
  _Block_object_dispose(&v80, 8);

  return v59;
}

void __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke(void *a1)
{
  objc_super v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  BOOL v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CSUTextEncoder_runOnInputText", "", buf, 2u);
  }

  uint64_t v6 = a1[5];
  int v7 = *(void **)(a1[4] + 24);
  uint64_t v8 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v8 + 40);
  [v7 runOnInputText:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  int64_t v9 = VCPSignPostLog();
  int v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)int v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_END, v3, "CSUTextEncoder_runOnInputText", "", v11, 2u);
  }
}

void __48__VCPTextEncoder_textEmbeddingForQuery_useFP16___block_invoke_261(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingGenerationQueue, 0);
  objc_storeStrong((id *)&self->_tokenModel, 0);
  objc_storeStrong((id *)&self->_csuTextEncoder, 0);
  objc_storeStrong((id *)&self->_textTokenizer, 0);
  objc_storeStrong((id *)&self->_textModel, 0);
}

@end