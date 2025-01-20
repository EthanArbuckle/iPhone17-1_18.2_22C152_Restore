@interface MLCategoricalMapping
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLCategoricalMapping)initWithMapping:(id)a3 valueOnUnknown:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10;
- (MLFeatureValue)valueOnUnknown;
- (NSDictionary)mapping;
- (id)mapFeature:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLCategoricalMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOnUnknown, 0);

  objc_storeStrong((id *)&self->_mapping, 0);
}

- (MLFeatureValue)valueOnUnknown
{
  return self->_valueOnUnknown;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (unint64_t)predictionTypeForKTrace
{
  return 15;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v41 = a4;
  unint64_t v8 = [(MLCategoricalMapping *)self predictionTypeForKTrace];
  unint64_t v9 = [(MLModelEngine *)self signpostID];
  uint64_t v10 = [v41 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLCategoricalMapping_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[6] = v10;
  v37 = (void (**)(void))_Block_copy(aBlock);
  v11 = [(MLModelEngine *)self modelDescription];
  v12 = [v11 inputFeatureNames];
  v39 = [v12 objectAtIndexedSubscript:0];

  v13 = [(MLModelEngine *)self modelDescription];
  v14 = [v13 outputFeatureNames];
  v38 = [v14 objectAtIndexedSubscript:0];

  v15 = [v40 featureValueForName:v39];
  if ([v15 type] == 7)
  {
    v16 = [v15 sequenceValue];
    v36 = [v16 featureValues];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v18 = v36;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = -[MLCategoricalMapping mapFeature:error:](self, "mapFeature:error:", *(void *)(*((void *)&v42 + 1) + 8 * i), a5, v36);
          v23 = v22;
          if (!v22)
          {

            v34 = 0;
            goto LABEL_14;
          }
          v24 = [v22 objectValue];
          [v17 addObject:v24];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v25 = [(MLModelEngine *)self modelDescription];
    v26 = [v25 outputDescriptionsByName];
    v27 = [v26 objectForKeyedSubscript:v38];
    v28 = [v27 sequenceConstraint];
    v29 = [v28 valueDescription];
    uint64_t v30 = [v29 type];

    v31 = [[MLSequence alloc] initWithArray:v17 type:v30];
    uint64_t v32 = +[MLFeatureValue featureValueWithSequence:v31];

    id v18 = (id)v32;
  }
  else
  {
    id v18 = [(MLCategoricalMapping *)self mapFeature:v15 error:a5];
    if (!v18)
    {
      v34 = 0;
      goto LABEL_15;
    }
  }
  v33 = [MLDictionaryFeatureProvider alloc];
  v47 = v38;
  id v48 = v18;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v34 = [(MLDictionaryFeatureProvider *)v33 initWithDictionary:v17 error:a5];
LABEL_14:

LABEL_15:
  v37[2](v37);

  return v34;
}

uint64_t __61__MLCategoricalMapping_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)mapFeature:(id)a3 error:(id *)a4
{
  v6 = [(NSDictionary *)self->_mapping objectForKeyedSubscript:a3];
  if (!v6)
  {
    valueOnUnknown = self->_valueOnUnknown;
    if (valueOnUnknown)
    {
      v6 = valueOnUnknown;
    }
    else if (a4)
    {
      id v8 = +[MLModelErrorUtils genericErrorWithFormat:@"MLCategoricalMapping: Unknown input value."];
      v6 = 0;
      *a4 = v8;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (MLCategoricalMapping)initWithMapping:(id)a3 valueOnUnknown:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  id v32 = a3;
  id v31 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v34.receiver = self;
  v34.super_class = (Class)MLCategoricalMapping;
  v33 = v17;
  v23 = [(MLModelEngine *)&v34 initWithName:v17 inputDescription:v18 outputDescription:v19 orderedInputFeatureNames:v20 orderedOutputFeatureNames:v21 configuration:v22];
  p_isa = (id *)&v23->super.super.isa;
  if (!v23) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v23->_mapping, a3);
  objc_storeStrong(p_isa + 5, a4);
  v25 = [v18 allValues];
  BOOL v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v25 hasAnyFeatureTypeIn:&unk_1EF11AA90 minimalCount:1 maximumCount:1 debugLabel:@"MLCategoricalMapping Inputs" error:0];

  if (!v26) {
    goto LABEL_5;
  }
  v27 = [v19 allValues];
  BOOL v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v27 hasAnyFeatureTypeIn:&unk_1EF11AAA8 minimalCount:1 maximumCount:1 debugLabel:@"MLCategoricalMapping Outputs" error:0];

  if (v28) {
LABEL_4:
  }
    v29 = p_isa;
  else {
LABEL_5:
  }
    v29 = 0;

  return v29;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v6 = (CoreML::Specification::protobuf_CategoricalMapping_2eproto *)a4;
  v7 = v6;
  if (*(_DWORD *)(*(void *)a3 + 44) == 606)
  {
    id v8 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_CategoricalMapping_2eproto::InitDefaults(v6);
    id v8 = &CoreML::Specification::_CategoricalMapping_default_instance_;
  }
  unint64_t v9 = objc_opt_new();
  int v10 = *((_DWORD *)v8 + 9);
  if (v10 == 1)
  {
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v32, *(void **)(v8[2] + 40));
    while (v32[0])
    {
      uint64_t v16 = v32[0][3];
      id v17 = +[MLFeatureValue featureValueWithInt64:*(void *)(v16 + 24)];
      if (*(char *)(v16 + 23) < 0) {
        uint64_t v16 = *(void *)v16;
      }
      id v18 = [NSString stringWithUTF8String:v16];
      id v19 = +[MLFeatureValue featureValueWithString:v18];
      [v9 setObject:v17 forKey:v19];

      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++((unsigned __int8 **)v32);
    }
  }
  else if (v10 == 2)
  {
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v32, *(void **)(v8[2] + 40));
    while (v32[0])
    {
      uint64_t v11 = v32[0][1];
      v12 = (void *)(v11 + 8);
      if (*(char *)(v11 + 31) < 0) {
        v12 = (void *)*v12;
      }
      v13 = [NSString stringWithUTF8String:v12];
      v14 = +[MLFeatureValue featureValueWithString:v13];
      v15 = +[MLFeatureValue featureValueWithInt64:*(void *)v11];
      [v9 setObject:v14 forKey:v15];

      google::protobuf::Map<long long,double>::InnerMap::iterator_base<google::protobuf::Map<long long,double>::KeyValuePair const>::operator++(v32);
    }
  }
  int v20 = *((_DWORD *)v8 + 10);
  if (v20 == 102)
  {
    v23 = +[MLFeatureValue featureValueWithInt64:v8[3]];
  }
  else if (v20 == 101)
  {
    uint64_t v21 = v8[3];
    if (*(char *)(v21 + 23) < 0) {
      uint64_t v21 = *(void *)v21;
    }
    id v22 = [NSString stringWithUTF8String:v21];
    v23 = +[MLFeatureValue featureValueWithString:v22];
  }
  else
  {
    v23 = 0;
  }
  id v24 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  v25 = [MLCategoricalMapping alloc];
  BOOL v26 = [v24 inputDescriptionsByName];
  v27 = [v24 outputDescriptionsByName];
  BOOL v28 = [v24 inputFeatureNames];
  v29 = [v24 outputFeatureNames];
  uint64_t v30 = [(MLCategoricalMapping *)v25 initWithMapping:v9 valueOnUnknown:v23 dataTransformerName:@"categorical mapping" inputDescription:v26 outputDescription:v27 orderedInputFeatureNames:v28 orderedOutputFeatureNames:v29 configuration:v7];

  return v30;
}

@end