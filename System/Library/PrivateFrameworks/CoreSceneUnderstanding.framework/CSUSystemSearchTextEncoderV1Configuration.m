@interface CSUSystemSearchTextEncoderV1Configuration
+ (id)SystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)inputIsLowerCase;
- (MLComputeDeviceProtocol)computeDevice;
- (NSArray)additionalLayerNames;
- (NSString)inputTextIDTensorName;
- (NSString)inputTokenEmbeddingIDTensorName;
- (NSString)inputTokenEmbeddingMaskTensorName;
- (NSString)outputLastHiddenStateTensorName;
- (NSString)outputTextEmbeddingTensorName;
- (NSString)outputTokenEmbeddingIDTensorName;
- (NSString)textEncoderNetworkPath;
- (NSString)tokenEmbeddingNetworkPath;
- (NSString)vocabularyModelPath;
- (id)initSystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (unint64_t)maximumSequenceLength;
- (unint64_t)tokenEmbeddingLength;
- (void)setAdditionalLayerNames:(id)a3;
- (void)setComputeDevice:(id)a3;
- (void)setEspressoExecutionEngine:(int)a3;
- (void)setInputIsLowerCase:(BOOL)a3;
- (void)setInputTextIDTensorName:(id)a3;
- (void)setInputTokenEmbeddingIDTensorName:(id)a3;
- (void)setInputTokenEmbeddingMaskTensorName:(id)a3;
- (void)setMaximumSequenceLength:(unint64_t)a3;
- (void)setOutputLastHiddenStateTensorName:(id)a3;
- (void)setOutputTextEmbeddingTensorName:(id)a3;
- (void)setOutputTokenEmbeddingIDTensorName:(id)a3;
- (void)setTextEncoderNetworkPath:(id)a3;
- (void)setTokenEmbeddingLength:(unint64_t)a3;
- (void)setTokenEmbeddingNetworkPath:(id)a3;
- (void)setVocabularyModelPath:(id)a3;
@end

@implementation CSUSystemSearchTextEncoderV1Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)SystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  objc_msgSend__resolvedRevision_(a1, a2, a3, (uint64_t)a4, v4);
  if (a4)
  {
    v10 = NSString;
    v11 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3, v8, v9);
    v15 = objc_msgSend_stringWithFormat_(v10, v12, @"Unsupported SystemSearchTextEncoderV1 revision %@", v13, v14, v11);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v16, (uint64_t)v15, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)initSystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v63.receiver = self;
  v63.super_class = (Class)CSUSystemSearchTextEncoderV1Configuration;
  v16 = [(CSUSystemSearchTextEncoderV1Configuration *)&v63 init];
  v21 = v16;
  if (v16)
  {
    v16->_revision = a3;
    uint64_t v22 = objc_msgSend_copy(v12, v17, v18, v19, v20);
    vocabularyModelPath = v21->_vocabularyModelPath;
    v21->_vocabularyModelPath = (NSString *)v22;

    v27 = objc_msgSend_objectForKeyedSubscript_(v15, v24, @"maxSeqLen", v25, v26);
    v21->_maximumSequenceLength = objc_msgSend_unsignedLongValue(v27, v28, v29, v30, v31);

    v21->_inputIsLowerCase = 1;
    inputTextIDTensorName = v21->_inputTextIDTensorName;
    v21->_inputTextIDTensorName = (NSString *)@"text_ids";

    uint64_t v37 = objc_msgSend_copy(v13, v33, v34, v35, v36);
    tokenEmbeddingNetworkPath = v21->_tokenEmbeddingNetworkPath;
    v21->_tokenEmbeddingNetworkPath = (NSString *)v37;

    outputTokenEmbeddingIDTensorName = v21->_outputTokenEmbeddingIDTensorName;
    v21->_outputTokenEmbeddingIDTensorName = (NSString *)@"token_embed";

    v43 = objc_msgSend_objectForKeyedSubscript_(v15, v40, @"tokenEmbedLen", v41, v42);
    v21->_tokenEmbeddingLength = objc_msgSend_unsignedLongValue(v43, v44, v45, v46, v47);

    id v50 = (id)objc_msgSend_CSUAssert_log_(CSUError, v48, v21->_maximumSequenceLength != v21->_tokenEmbeddingLength, @"Implementation of checkIfSrcBufferisContiguousForCopyToDestBuffer might fail", v49);
    uint64_t v55 = objc_msgSend_copy(v14, v51, v52, v53, v54);
    textEncoderNetworkPath = v21->_textEncoderNetworkPath;
    v21->_textEncoderNetworkPath = (NSString *)v55;

    inputTokenEmbeddingIDTensorName = v21->_inputTokenEmbeddingIDTensorName;
    v21->_inputTokenEmbeddingIDTensorName = (NSString *)@"token_embed";

    inputTokenEmbeddingMaskTensorName = v21->_inputTokenEmbeddingMaskTensorName;
    v21->_inputTokenEmbeddingMaskTensorName = (NSString *)@"indices";

    outputTextEmbeddingTensorName = v21->_outputTextEmbeddingTensorName;
    v21->_outputTextEmbeddingTensorName = (NSString *)@"text_embed";

    outputLastHiddenStateTensorName = v21->_outputLastHiddenStateTensorName;
    v21->_outputLastHiddenStateTensorName = (NSString *)@"input_tranpose";

    v61 = v21;
  }

  return v21;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 2, v4, v5);
  v10 = objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

- (int)espressoExecutionEngine
{
  v6 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, v2, v3, v4);
  char v10 = objc_msgSend_BOOLForKey_(v6, v7, @"CSU_UseEspressoCPUEngine", v8, v9);

  if (v10) {
    return 0;
  }
  v16 = objc_msgSend_computeDevice(self, v11, v12, v13, v14);
  int v17 = sub_24C689C00(v16);

  return v17;
}

- (void)setEspressoExecutionEngine:(int)a3
{
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (void)setAdditionalLayerNames:(id)a3
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

- (void)setVocabularyModelPath:(id)a3
{
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (void)setTokenEmbeddingNetworkPath:(id)a3
{
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (void)setTextEncoderNetworkPath:(id)a3
{
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (void)setMaximumSequenceLength:(unint64_t)a3
{
  self->_maximumSequenceLength = a3;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (void)setTokenEmbeddingLength:(unint64_t)a3
{
  self->_tokenEmbeddingLength = a3;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (void)setInputIsLowerCase:(BOOL)a3
{
  self->_inputIsLowerCase = a3;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (void)setInputTextIDTensorName:(id)a3
{
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (void)setOutputTokenEmbeddingIDTensorName:(id)a3
{
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (void)setInputTokenEmbeddingIDTensorName:(id)a3
{
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (void)setInputTokenEmbeddingMaskTensorName:(id)a3
{
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void)setOutputTextEmbeddingTensorName:(id)a3
{
}

- (NSString)outputLastHiddenStateTensorName
{
  return self->_outputLastHiddenStateTensorName;
}

- (void)setOutputLastHiddenStateTensorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLastHiddenStateTensorName, 0);
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end