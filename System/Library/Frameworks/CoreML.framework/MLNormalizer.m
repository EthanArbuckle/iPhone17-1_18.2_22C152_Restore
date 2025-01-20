@interface MLNormalizer
+ (id)inputDescriptionFrom:(id)a3 outputDescription:(id)a4 orderedInputFeatureNames:(id)a5 orderedOutputFeatureNames:(id)a6;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)normFrom:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8;
+ (id)normFrom:(int)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7;
- (MLNormalizer)initWith:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (int)norm;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLNormalizer

- (int)norm
{
  return self->_norm;
}

- (unint64_t)predictionTypeForKTrace
{
  return 18;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(MLNormalizer *)self predictionTypeForKTrace];
  unint64_t v11 = [(MLModelEngine *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__MLNormalizer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  aBlock[6] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = [(MLModelEngine *)self modelDescription];
  v15 = [v14 inputFeatureNames];
  v16 = [v15 objectAtIndexedSubscript:0];

  v17 = [(MLModelEngine *)self modelDescription];
  v18 = [v17 outputFeatureNames];
  v19 = [v18 objectAtIndexedSubscript:0];

  v38[0] = v16;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v21 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v8 featureNames:v20 error:a5];

  id v22 = v21;
  uint64_t v23 = [v22 mutableBytes];
  uint64_t v24 = 0;
  double v25 = 0.0;
  while (v24 < [v22 count])
  {
    if (!self) {
      goto LABEL_12;
    }
    double v26 = *(double *)(v23 + 8 * v24);
    int norm = self->_norm;
    if (norm)
    {
      if (norm == 2)
      {
        double v26 = v25 + v26 * v26;
      }
      else
      {
        if (norm != 1) {
          goto LABEL_12;
        }
        double v26 = v25 + fabs(v26);
      }
LABEL_11:
      double v25 = v26;
      goto LABEL_12;
    }
    if (v25 < v26) {
      goto LABEL_11;
    }
LABEL_12:
    ++v24;
  }
  uint64_t v28 = 0;
  double v29 = sqrt(v25);
  if (self->_norm != 2) {
    double v29 = v25;
  }
  if (v29 == 0.0) {
    double v30 = 1.0;
  }
  else {
    double v30 = v29;
  }
  while (v28 < [v22 count])
  {
    *(double *)(v23 + 8 * v28) = *(double *)(v23 + 8 * v28) / v30;
    ++v28;
  }
  v31 = [MLDictionaryFeatureProvider alloc];
  v36 = v19;
  id v37 = v22;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v33 = [(MLDictionaryFeatureProvider *)v31 initWithDictionary:v32 error:a5];

  v13[2](v13);

  return v33;
}

uint64_t __53__MLNormalizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLNormalizer)initWith:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MLNormalizer;
  v21 = [(MLModelEngine *)&v29 initWithName:v15 inputDescription:v16 outputDescription:v17 orderedInputFeatureNames:v18 orderedOutputFeatureNames:v19 configuration:v20];
  id v22 = v21;
  if (!v21) {
    goto LABEL_4;
  }
  v21->_int norm = a3;
  uint64_t v23 = [v16 allValues];
  BOOL v24 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v23 hasAnyFeatureTypeIn:&unk_1EF11AA60 minimalCount:1 maximumCount:1 debugLabel:@"MLNormalizer Input" error:0];

  if (!v24) {
    goto LABEL_5;
  }
  double v25 = [v17 allValues];
  BOOL v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v25 hasAnyFeatureTypeIn:&unk_1EF11AA78 minimalCount:1 maximumCount:1 debugLabel:@"MLNormalizer Output" error:0];

  if (v26) {
LABEL_4:
  }
    v27 = v22;
  else {
LABEL_5:
  }
    v27 = 0;

  return v27;
}

+ (id)normFrom:(int)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [MLNormalizer alloc];
  id v19 = objc_alloc_init(MLModelConfiguration);
  id v20 = [(MLNormalizer *)v18 initWith:v12 dataTransformerName:v13 inputDescription:v14 outputDescription:v15 orderedInputFeatureNames:v16 orderedOutputFeatureNames:v17 configuration:v19];

  return v20;
}

+ (id)normFrom:(int)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MLNormalizer alloc];
  id v16 = objc_alloc_init(MLModelConfiguration);
  id v17 = [(MLNormalizer *)v15 initWith:v10 dataTransformerName:@"MLNormalizer" inputDescription:v11 outputDescription:v12 orderedInputFeatureNames:v13 orderedOutputFeatureNames:v14 configuration:v16];

  return v17;
}

+ (id)inputDescriptionFrom:(id)a3 outputDescription:(id)a4 orderedInputFeatureNames:(id)a5 orderedOutputFeatureNames:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MLNormalizer alloc];
  id v14 = objc_alloc_init(MLModelConfiguration);
  id v15 = [(MLNormalizer *)v13 initWith:2 dataTransformerName:@"MLNormalizer" inputDescription:v9 outputDescription:v10 orderedInputFeatureNames:v11 orderedOutputFeatureNames:v12 configuration:v14];

  return v15;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v24 = a4;
  id v6 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  v7 = [MLNormalizer alloc];
  id v8 = v7;
  if (*(_DWORD *)(*(void *)a3 + 44) == 607)
  {
    id v9 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_Normalizer_2eproto::InitDefaults((CoreML::Specification::protobuf_Normalizer_2eproto *)v7);
    id v9 = &CoreML::Specification::_Normalizer_default_instance_;
  }
  uint64_t v10 = *((unsigned int *)v9 + 4);
  uint64_t v23 = [v6 inputDescriptionsByName];
  uint64_t v11 = [v6 outputDescriptionsByName];
  id v12 = (void *)MEMORY[0x1E4F1CAA0];
  id v22 = (void *)v11;
  v21 = [v6 inputDescriptionsByName];
  id v13 = [v21 allKeys];
  id v14 = [v12 orderedSetWithArray:v13];
  id v15 = (void *)MEMORY[0x1E4F1CAA0];
  id v16 = [v6 outputDescriptionsByName];
  id v17 = [v16 allKeys];
  id v18 = [v15 orderedSetWithArray:v17];
  id v19 = [(MLNormalizer *)v8 initWith:v10 dataTransformerName:@"normalizer" inputDescription:v23 outputDescription:v22 orderedInputFeatureNames:v14 orderedOutputFeatureNames:v18 configuration:v24];

  return v19;
}

@end