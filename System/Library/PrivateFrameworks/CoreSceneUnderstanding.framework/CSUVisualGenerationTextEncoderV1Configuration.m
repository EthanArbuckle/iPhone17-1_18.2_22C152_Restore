@interface CSUVisualGenerationTextEncoderV1Configuration
+ (id)VisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)inputIsLowerCase;
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)inputTextIDTensorName;
- (NSString)outputCLIPPooledLayer;
- (NSString)outputLastHiddenState;
- (NSString)textEncoderNetworkPath;
- (NSString)tokenEmbeddingNetworkPath;
- (NSString)vocabularyModelPath;
- (id)initVisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (unint64_t)batchSize;
- (unint64_t)maximumSequenceLength;
- (unint64_t)tokenEmbeddingLength;
- (void)setComputeDevice:(id)a3;
@end

@implementation CSUVisualGenerationTextEncoderV1Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5
{
  v71[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x263F086E0];
  v62 = v7;
  v63 = v8;
  uint64_t v11 = objc_opt_class();
  v64 = objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  v18 = objc_msgSend_stringByAppendingPathComponent_(v9, v15, (uint64_t)v7, v16, v17);
  v65 = objc_msgSend_stringByAppendingPathExtension_(v18, v19, (uint64_t)v8, v20, v21);

  v23 = objc_msgSend_pathForResource_ofType_inDirectory_(v64, v22, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
  v27 = v23;
  if (v23)
  {
    id v28 = v23;
  }
  else
  {
    v29 = objc_msgSend_stringByAppendingPathComponent_(@"/Library/Application Support/com.apple.CoreSceneUnderstanding", v24, (uint64_t)v65, v25, v26, v7, v8);
    v71[0] = v29;
    v30 = NSHomeDirectory();
    v34 = objc_msgSend_stringByAppendingPathComponent_(@"Library/Application Support/com.apple.CoreSceneUnderstanding", v31, (uint64_t)v65, v32, v33);
    v38 = objc_msgSend_stringByAppendingPathComponent_(v30, v35, (uint64_t)v34, v36, v37);
    v71[1] = v38;
    v42 = objc_msgSend_stringByAppendingPathComponent_(@"/var/mobile/Library/Application Support/com.apple.CoreSceneUnderstanding", v39, (uint64_t)v65, v40, v41);
    v71[2] = v42;
    v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v71, 3, v44);

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v46 = v45;
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v66, (uint64_t)v70, 16);
    if (v48)
    {
      uint64_t v49 = *(void *)v67;
LABEL_5:
      uint64_t v50 = 0;
      while (1)
      {
        if (*(void *)v67 != v49) {
          objc_enumerationMutation(v46);
        }
        id v28 = *(id *)(*((void *)&v66 + 1) + 8 * v50);
        v55 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v51, v52, v53, v54);
        char v59 = objc_msgSend_fileExistsAtPath_(v55, v56, (uint64_t)v28, v57, v58);

        if (v59) {
          break;
        }

        if (v48 == ++v50)
        {
          uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v60, (uint64_t)&v66, (uint64_t)v70, 16);
          if (v48) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      id v28 = 0;
    }
  }
  return v28;
}

+ (id)VisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  id v7 = (void *)MEMORY[0x263F086E0];
  uint64_t v8 = objc_opt_class();
  v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    v19 = objc_msgSend_pathForResource_ofType_inDirectory_(a1, v16, @"spiece", @"model", @"models/VisualGeneration/v1.0/");
    uint64_t v21 = objc_msgSend_pathForResource_ofType_inDirectory_(a1, v20, @"dreamotorch_2kbcv9xagr_100_clip_embedder", @"espresso.net", @"models/VisualGeneration/v1.0/");
    id v22 = objc_alloc((Class)a1);
    inited = objc_msgSend_initVisualGenerationTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_(v22, v23, 1, (uint64_t)v19, 0, v21);
LABEL_5:

    goto LABEL_6;
  }
  if (a4)
  {
    uint64_t v25 = NSString;
    v19 = objc_msgSend_numberWithInteger_(NSNumber, v16, a3, v17, v18);
    uint64_t v21 = objc_msgSend_stringWithFormat_(v25, v26, @"Unsupported VisualGenerationTextEncoderV1 revision %@", v27, v28, v19);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v29, (uint64_t)v21, v30, v31);
    inited = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  inited = 0;
LABEL_6:

  return inited;
}

- (id)initVisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v30.receiver = self;
  v30.super_class = (Class)CSUVisualGenerationTextEncoderV1Configuration;
  uint64_t v11 = [(CSUVisualGenerationTextEncoderV1Configuration *)&v30 init];
  uint64_t v16 = v11;
  if (v11)
  {
    v11->_revision = a3;
    uint64_t v17 = objc_msgSend_copy(v9, v12, v13, v14, v15);
    vocabularyModelPath = v16->_vocabularyModelPath;
    v16->_vocabularyModelPath = (NSString *)v17;

    v16->_maximumSequenceLength = 77;
    v16->_inputIsLowerCase = 1;
    inputTextIDTensorName = v16->_inputTextIDTensorName;
    v16->_inputTextIDTensorName = (NSString *)@"ids";

    uint64_t v24 = objc_msgSend_copy(v10, v20, v21, v22, v23);
    textEncoderNetworkPath = v16->_textEncoderNetworkPath;
    v16->_textEncoderNetworkPath = (NSString *)v24;

    outputLastHiddenState = v16->_outputLastHiddenState;
    v16->_outputLastHiddenState = (NSString *)@"last_hidden_state";

    outputCLIPPooledLayer = v16->_outputCLIPPooledLayer;
    v16->_outputCLIPPooledLayer = (NSString *)@"pooled_embedding";

    uint64_t v28 = v16;
  }

  return v16;
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
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_msgSend_supportedComputeDevices(self, a2, v2, v3, v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LODWORD(v8) = sub_24C689C00(v11);
            goto LABEL_11;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v8);
  }
LABEL_11:

  return v8;
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

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (NSString)outputLastHiddenState
{
  return self->_outputLastHiddenState;
}

- (NSString)outputCLIPPooledLayer
{
  return self->_outputCLIPPooledLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputCLIPPooledLayer, 0);
  objc_storeStrong((id *)&self->_outputLastHiddenState, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end