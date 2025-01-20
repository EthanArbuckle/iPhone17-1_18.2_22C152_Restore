@interface CSUCLIPTextEncoderV3Configuration
+ (id)CLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)inputIsLowerCase;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)inputTextIDMaskTensorName;
- (NSString)inputTextIDTensorName;
- (NSString)inputTokenEmbeddingIDTensorName;
- (NSString)inputTokenEmbeddingMaskTensorName;
- (NSString)outputTextEmbeddingTensorName;
- (NSString)outputTokenEmbeddingIDTensorName;
- (NSString)outputTokenEmbeddingMaskTensorName;
- (NSString)textEncoderNetworkPath;
- (NSString)tokenEmbeddingNetworkPath;
- (NSString)vocabularyModelPath;
- (id)initCLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (unint64_t)maximumSequenceLength;
- (void)setComputeDevice:(id)a3;
@end

@implementation CSUCLIPTextEncoderV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (id)CLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, @"vocab", @"model", @"clip/v3.1/");
    v21 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v20, @"text_encoder_lookup_unilm_quantized", @"espresso.net", @"clip/v3.1/");
    v23 = objc_msgSend_pathForResource_ofType_inDirectory_(v12, v22, @"text_encoder_main", @"espresso.net", @"clip/v3.1/");
    id v24 = objc_alloc((Class)a1);
    inited = objc_msgSend_initCLIPTextEncoderV3ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_(v24, v25, 1, (uint64_t)v19, (uint64_t)v21, v23);

LABEL_5:
    goto LABEL_6;
  }
  if (a4)
  {
    v27 = NSString;
    v19 = objc_msgSend_numberWithInteger_(NSNumber, v16, a3, v17, v18);
    v21 = objc_msgSend_stringWithFormat_(v27, v28, @"Unsupported CLIPTextEncoderV3 revision %@", v29, v30, v19);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v31, (uint64_t)v21, v32, v33);
    inited = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  inited = 0;
LABEL_6:

  return inited;
}

- (id)initCLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)CSUCLIPTextEncoderV3Configuration;
  v13 = [(CSUCLIPTextEncoderV3Configuration *)&v42 init];
  uint64_t v18 = v13;
  if (v13)
  {
    v13->_revision = a3;
    uint64_t v19 = objc_msgSend_copy(v10, v14, v15, v16, v17);
    vocabularyModelPath = v18->_vocabularyModelPath;
    v18->_vocabularyModelPath = (NSString *)v19;

    v18->_maximumSequenceLength = 60;
    v18->_inputIsLowerCase = 1;
    uint64_t v25 = objc_msgSend_copy(v11, v21, v22, v23, v24);
    tokenEmbeddingNetworkPath = v18->_tokenEmbeddingNetworkPath;
    v18->_tokenEmbeddingNetworkPath = (NSString *)v25;

    inputTextIDTensorName = v18->_inputTextIDTensorName;
    v18->_inputTextIDTensorName = (NSString *)@"text_ids";

    inputTextIDMaskTensorName = v18->_inputTextIDMaskTensorName;
    v18->_inputTextIDMaskTensorName = (NSString *)@"text_ids_mask";

    outputTokenEmbeddingIDTensorName = v18->_outputTokenEmbeddingIDTensorName;
    v18->_outputTokenEmbeddingIDTensorName = (NSString *)@"t1_1_cast";

    outputTokenEmbeddingMaskTensorName = v18->_outputTokenEmbeddingMaskTensorName;
    v18->_outputTokenEmbeddingMaskTensorName = (NSString *)@"k_mask_1_cast";

    uint64_t v35 = objc_msgSend_copy(v12, v31, v32, v33, v34);
    textEncoderNetworkPath = v18->_textEncoderNetworkPath;
    v18->_textEncoderNetworkPath = (NSString *)v35;

    inputTokenEmbeddingIDTensorName = v18->_inputTokenEmbeddingIDTensorName;
    v18->_inputTokenEmbeddingIDTensorName = (NSString *)@"t1_1_cast";

    inputTokenEmbeddingMaskTensorName = v18->_inputTokenEmbeddingMaskTensorName;
    v18->_inputTokenEmbeddingMaskTensorName = (NSString *)@"k_mask_1_cast";

    outputTextEmbeddingTensorName = v18->_outputTextEmbeddingTensorName;
    v18->_outputTextEmbeddingTensorName = (NSString *)@"text_embed_normalize";

    v40 = v18;
  }

  return v18;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  id v10 = objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

- (int)espressoExecutionEngine
{
  uint64_t v5 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  int v6 = sub_24C689C00(v5);

  return v6;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (NSString)inputTextIDMaskTensorName
{
  return self->_inputTextIDMaskTensorName;
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (NSString)outputTokenEmbeddingMaskTensorName
{
  return self->_outputTokenEmbeddingMaskTensorName;
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end