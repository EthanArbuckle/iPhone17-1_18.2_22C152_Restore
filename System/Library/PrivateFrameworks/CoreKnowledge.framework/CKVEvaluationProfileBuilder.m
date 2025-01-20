@interface CKVEvaluationProfileBuilder
- (BOOL)addCompanionRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7;
- (BOOL)setPrimaryRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5;
- (CKVEvaluationProfileBuilder)init;
- (CKVEvaluationProfileBuilder)initWithOmittedItemTypes:(id)a3;
- (id)buildWithError:(id *)a3;
@end

@implementation CKVEvaluationProfileBuilder

- (void).cxx_destruct
{
}

- (id)buildWithError:(id *)a3
{
  return (id)[(CESRRawSpeechProfileConverter *)self->_converter convertToKVProfileWithError:a3];
}

- (BOOL)addCompanionRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7
{
  return [(CESRRawSpeechProfileConverter *)self->_converter addCompanionRawSpeechProfile:a3 deviceId:a5 userId:a6 error:a7];
}

- (BOOL)setPrimaryRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5
{
  return [(CESRRawSpeechProfileConverter *)self->_converter setPrimaryRawSpeechProfile:a3 error:a5];
}

- (CKVEvaluationProfileBuilder)initWithOmittedItemTypes:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKVEvaluationProfileBuilder;
  v5 = [(CKVEvaluationProfileBuilder *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getCESRRawSpeechProfileConverterClass_softClass;
    uint64_t v16 = getCESRRawSpeechProfileConverterClass_softClass;
    if (!getCESRRawSpeechProfileConverterClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getCESRRawSpeechProfileConverterClass_block_invoke;
      v12[3] = &unk_1E5CF9F10;
      v12[4] = &v13;
      __getCESRRawSpeechProfileConverterClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [[v7 alloc] initWithOmittedItemTypes:v4];
    converter = v5->_converter;
    v5->_converter = (CESRRawSpeechProfileConverter *)v8;
  }
  return v5;
}

- (CKVEvaluationProfileBuilder)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

@end