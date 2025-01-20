@interface MLArrayFeatureExtractor
+ (id)extractArrayElement:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9;
+ (id)extractArrayElement:(id)a3 indices:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLArrayFeatureExtractor)initWith:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10;
- (NSArray)extractIndices;
- (NSString)arrayColumnName;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (int64_t)outputType;
@end

@implementation MLArrayFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractIndices, 0);

  objc_storeStrong((id *)&self->_arrayColumnName, 0);
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (NSArray)extractIndices
{
  return self->_extractIndices;
}

- (NSString)arrayColumnName
{
  return self->_arrayColumnName;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v7 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v8 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v41, v8, 14, -[MLModel signpostID](self, "signpostID"), [v7 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v9 = [(MLModel *)self signpostID];
  uint64_t v10 = [v7 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__MLArrayFeatureExtractor_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v11 = (void (**)(void))_Block_copy(aBlock);
  v12 = [v39 featureValueForName:self->_arrayColumnName];
  v13 = [v12 multiArrayValue];

  if (v13)
  {
    int64_t outputType = self->_outputType;
    switch(outputType)
    {
      case 1:
        v20 = [(NSArray *)self->_extractIndices objectAtIndexedSubscript:0];
        v21 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v20, "intValue"));
        [v21 doubleValue];
        double v23 = v22;

        if (v23 != (double)(uint64_t)v23)
        {
          if (a5)
          {
            id v19 = +[MLModelErrorUtils genericErrorWithFormat:@"Lossy cast to integer by ArrayFeatureExtractor; use double as output type."];
            goto LABEL_20;
          }
          goto LABEL_21;
        }
        uint64_t v24 = +[MLFeatureValue featureValueWithInt64:(uint64_t)v23];
        break;
      case 2:
        v25 = [(NSArray *)self->_extractIndices objectAtIndexedSubscript:0];
        v26 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
        [v26 doubleValue];
        double v28 = v27;

        uint64_t v24 = +[MLFeatureValue featureValueWithDouble:v28];
        break;
      case 5:
        v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_extractIndices, "count"));
        for (unint64_t i = 0; i < [(NSArray *)self->_extractIndices count]; ++i)
        {
          v17 = [(NSArray *)self->_extractIndices objectAtIndexedSubscript:i];
          v18 = objc_msgSend(v13, "objectAtIndexedSubscript:", (int)objc_msgSend(v17, "intValue"));

          [v15 addObject:v18];
        }
        v30 = +[MLMultiArray doubleVectorWithValues:v15];
        v29 = +[MLFeatureValue featureValueWithMultiArray:v30];

        goto LABEL_17;
      default:
        if (a5)
        {
          id v19 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid output type of ArrayFeatureExtractor."];
          goto LABEL_20;
        }
        goto LABEL_21;
    }
    v29 = (void *)v24;
LABEL_17:
    v31 = [MLDictionaryFeatureProvider alloc];
    v32 = [(MLModel *)self modelDescription];
    v33 = [v32 outputFeatureNames];
    v34 = [v33 objectAtIndexedSubscript:0];
    v42 = v34;
    v43[0] = v29;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v36 = [(MLDictionaryFeatureProvider *)v31 initWithDictionary:v35 error:a5];

    goto LABEL_22;
  }
  if (a5)
  {
    id v19 = +[MLModelErrorUtils genericErrorWithFormat:@"got nil array input to MLArrayFeatureExtractor predict:error:"];
LABEL_20:
    v36 = 0;
    *a5 = v19;
    goto LABEL_22;
  }
LABEL_21:
  v36 = 0;
LABEL_22:

  v11[2](v11);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v41);

  return v36;
}

uint64_t __64__MLArrayFeatureExtractor_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLArrayFeatureExtractor)initWith:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  id v36 = a3;
  id v35 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v37.receiver = self;
  v37.super_class = (Class)MLArrayFeatureExtractor;
  v34 = v17;
  double v23 = [(MLModel *)&v37 initWithName:v17 inputDescription:v18 outputDescription:v19 orderedInputFeatureNames:v20 orderedOutputFeatureNames:v21 configuration:v22];
  uint64_t v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_arrayColumnName, a3);
    objc_storeStrong((id *)&v24->_extractIndices, a4);
    v25 = [v18 allValues];
    BOOL v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v25 hasAnyFeatureTypeIn:&unk_1EF11AB08 minimalCount:1 maximumCount:-1 debugLabel:@"MLArrayFeatureExtractor Inputs" error:0];

    if (!v26
      || ([v19 allValues],
          double v27 = objc_claimAutoreleasedReturnValue(),
          BOOL v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v27 hasAnyFeatureTypeIn:&unk_1EF11AB20 minimalCount:1 maximumCount:1 debugLabel:@"MLArrayFeatureExtractor Outputs" error:0], v27, !v28))
    {
      v32 = 0;
      goto LABEL_7;
    }
    v29 = [v19 allKeys];
    v30 = [v29 objectAtIndexedSubscript:0];
    v31 = [v19 objectForKeyedSubscript:v30];
    v24->_int64_t outputType = [v31 type];
  }
  v32 = v24;
LABEL_7:

  return v32;
}

+ (id)extractArrayElement:(id)a3 indices:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = [MLArrayFeatureExtractor alloc];
  id v22 = objc_alloc_init(MLModelConfiguration);
  double v23 = [(MLArrayFeatureExtractor *)v21 initWith:v14 indices:v15 dataTransformerName:v16 inputDescription:v17 outputDescription:v18 orderedInputFeatureNames:v19 orderedOutputFeatureNames:v20 configuration:v22];

  return v23;
}

+ (id)extractArrayElement:(id)a3 indices:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [MLArrayFeatureExtractor alloc];
  id v20 = objc_alloc_init(MLModelConfiguration);
  id v21 = [(MLArrayFeatureExtractor *)v19 initWith:v13 indices:v14 dataTransformerName:@"arrayFeatureExtractor" inputDescription:v15 outputDescription:v16 orderedInputFeatureNames:v17 orderedOutputFeatureNames:v18 configuration:v20];

  return v21;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = (CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto *)a4;
  v31 = v7;
  if (*(_DWORD *)(*(void *)a3 + 44) == 609)
  {
    v8 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_ArrayFeatureExtractor_2eproto::InitDefaults(v7);
    v8 = &CoreML::Specification::_ArrayFeatureExtractor_default_instance_;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v32 = &unk_1EF0D4890;
  unint64_t v33 = 0;
  int v9 = *((_DWORD *)v8 + 4);
  if (v9)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v34, v9);
    memcpy((void *)(v35 + 8), (const void *)(v8[3] + 8), 8 * *((int *)v8 + 4));
    int v10 = *((_DWORD *)v8 + 4);
    LODWORD(v34) = v10;
  }
  else
  {
    int v10 = 0;
  }
  int v36 = 0;
  uint64_t v11 = v8[1];
  if (v11)
  {
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v33, v11 & 0xFFFFFFFFFFFFFFFELL);
    int v10 = v34;
  }
  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
  if ((int)v34 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      id v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(v35 + 8 * v13 + 8)];
      [v12 addObject:v14];

      ++v13;
    }
    while (v13 < (int)v34);
  }
  id v15 = [NSString alloc];
  id v16 = *(uint64_t **)(*(void *)a3 + 16);
  if (!v16) {
    id v16 = &CoreML::Specification::_ModelDescription_default_instance_;
  }
  id v17 = *(uint64_t **)(*(void *)(v16[4] + 8) + 16);
  if (*((char *)v17 + 23) < 0) {
    id v17 = (uint64_t *)*v17;
  }
  v30 = (void *)[v15 initWithUTF8String:v17];
  id v29 = [[MLModel alloc] initDescriptionOnlyWithSpecification:a3 configuration:v31 error:a5];
  id v18 = [MLArrayFeatureExtractor alloc];
  BOOL v28 = [v29 modelDescription];
  double v27 = [v28 inputDescriptionsByName];
  BOOL v26 = [v29 modelDescription];
  v25 = [v26 outputDescriptionsByName];
  id v19 = [v29 modelDescription];
  id v20 = [v19 inputFeatureNames];
  id v21 = [v29 modelDescription];
  id v22 = [v21 outputFeatureNames];
  double v23 = [(MLArrayFeatureExtractor *)v18 initWith:v30 indices:v12 dataTransformerName:@"array feature extractor" inputDescription:v27 outputDescription:v25 orderedInputFeatureNames:v20 orderedOutputFeatureNames:v22 configuration:v31];

  CoreML::Specification::ArrayFeatureExtractor::~ArrayFeatureExtractor((CoreML::Specification::ArrayFeatureExtractor *)&v32);

  return v23;
}

@end