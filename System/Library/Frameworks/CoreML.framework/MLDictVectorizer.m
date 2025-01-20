@interface MLDictVectorizer
+ (id)categoryName:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9;
+ (id)categoryName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 error:(id *)a8;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLDictVectorizer)initWith:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9 error:(id *)a10;
- (NSOrderedSet)categoryName;
- (id)constructDictionary:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLDictVectorizer

- (void).cxx_destruct
{
}

- (NSOrderedSet)categoryName
{
  return self->_categoryName;
}

- (id)constructDictionary:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = [a3 dictionaryValue];
  v17 = v6;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count", v6));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v8 objectForKeyedSubscript:v12];
          NSUInteger v14 = [(NSOrderedSet *)self->_categoryName indexOfObject:v12];
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = [NSNumber numberWithUnsignedInteger:v14];
            [v18 setObject:v13 forKey:v15];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Type of input not dictionary as expected.", 0];
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (unint64_t)predictionTypeForKTrace
{
  return 16;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  unint64_t v9 = [(MLDictVectorizer *)self predictionTypeForKTrace];
  unint64_t v10 = [(MLModelEngine *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MLDictVectorizer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  aBlock[6] = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = [(MLModelEngine *)self modelDescription];
  NSUInteger v14 = [v13 inputFeatureNames];
  v15 = [v14 objectAtIndexedSubscript:0];

  v16 = [(MLModelEngine *)self modelDescription];
  v17 = [v16 outputFeatureNames];
  id v18 = [v17 objectAtIndexedSubscript:0];

  long long v19 = [v26 featureValueForName:v15];
  if (v19)
  {
    long long v20 = [(MLDictVectorizer *)self constructDictionary:v19 error:a5];
    if (v20)
    {
      long long v21 = +[MLFeatureValue featureValueWithDictionary:v20 error:a5];
      long long v22 = [MLDictionaryFeatureProvider alloc];
      v28 = v18;
      v29[0] = v21;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v24 = [(MLDictionaryFeatureProvider *)v22 initWithDictionary:v23 error:a5];
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Expected input column '%@ not present.", v15];
    uint64_t v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = 0;
  }

  v12[2](v12);

  return v24;
}

uint64_t __57__MLDictVectorizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLDictVectorizer)initWith:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 configuration:(id)a9 error:(id *)a10
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)MLDictVectorizer;
  v31 = v16;
  long long v22 = [(MLModelEngine *)&v33 initWithName:v16 inputDescription:v17 outputDescription:v18 orderedInputFeatureNames:v19 orderedOutputFeatureNames:v20 configuration:v21];
  if (!v22) {
    goto LABEL_4;
  }
  uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v32];
  categoryName = v22->_categoryName;
  v22->_categoryName = (NSOrderedSet *)v23;

  v25 = [v17 allValues];
  BOOL v26 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v25 hasAnyFeatureTypeIn:&unk_1EF11AA30 minimalCount:1 maximumCount:-1 debugLabel:@"MLDictVectorizer Inputs" error:a10];

  if (!v26) {
    goto LABEL_5;
  }
  v27 = [v18 allValues];
  BOOL v28 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v27 hasAnyFeatureTypeIn:&unk_1EF11AA48 minimalCount:1 maximumCount:1 debugLabel:@"MLDictVectorizer Outputs" error:a10];

  if (v28) {
LABEL_4:
  }
    v29 = v22;
  else {
LABEL_5:
  }
    v29 = 0;

  return v29;
}

+ (id)categoryName:(id)a3 dataTransformerName:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [MLDictVectorizer alloc];
  id v21 = objc_alloc_init(MLModelConfiguration);
  long long v22 = [(MLDictVectorizer *)v20 initWith:v14 dataTransformerName:v15 inputDescription:v16 outputDescription:v17 orderedInputFeatureNames:v18 orderedOutputFeatureNames:v19 configuration:v21 error:a9];

  return v22;
}

+ (id)categoryName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [MLDictVectorizer alloc];
  id v19 = objc_alloc_init(MLModelConfiguration);
  id v20 = [(MLDictVectorizer *)v18 initWith:v13 dataTransformerName:@"MLDictVectorizer" inputDescription:v14 outputDescription:v15 orderedInputFeatureNames:v16 orderedOutputFeatureNames:v17 configuration:v19 error:a8];

  return v20;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)objc_opt_new();
  unint64_t v9 = inited;
  if (*(_DWORD *)(*(void *)a3 + 44) == 603)
  {
    unint64_t v10 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DictVectorizer_2eproto::InitDefaults(inited);
    unint64_t v10 = &CoreML::Specification::_DictVectorizer_default_instance_;
  }
  int v11 = *((_DWORD *)v10 + 7);
  if (v11 == 2)
  {
    for (uint64_t i = 0; ; ++i)
    {
      if (v11 == 2)
      {
        id v19 = (uint64_t *)v10[2];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v19 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      if (i >= *((int *)v19 + 4)) {
        break;
      }
      id v20 = NSNumber;
      if (*((_DWORD *)v10 + 7) == 2)
      {
        id v21 = (uint64_t *)v10[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v21 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      long long v22 = [v20 numberWithLongLong:*(void *)(v21[3] + 8 * i + 8)];
      [(CoreML::Specification::protobuf_DictVectorizer_2eproto *)v9 addObject:v22];

      int v11 = *((_DWORD *)v10 + 7);
    }
  }
  else if (v11 == 1)
  {
    for (uint64_t j = 0; ; ++j)
    {
      if (v11 == 1)
      {
        id v13 = (uint64_t *)v10[2];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DictVectorizer_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v13 = &CoreML::Specification::_StringVector_default_instance_;
      }
      if (j >= *((int *)v13 + 6)) {
        break;
      }
      id v14 = NSString;
      if (*((_DWORD *)v10 + 7) == 1)
      {
        id v15 = (uint64_t *)v10[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v15 = &CoreML::Specification::_StringVector_default_instance_;
      }
      id v16 = *(uint64_t **)(v15[4] + 8 * j + 8);
      if (*((char *)v16 + 23) < 0) {
        id v16 = (uint64_t *)*v16;
      }
      id v17 = [v14 stringWithUTF8String:v16];
      [(CoreML::Specification::protobuf_DictVectorizer_2eproto *)v9 addObject:v17];

      int v11 = *((_DWORD *)v10 + 7);
    }
  }
  id v23 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  uint64_t v24 = [MLDictVectorizer alloc];
  v25 = [v23 inputDescriptionsByName];
  BOOL v26 = [v23 outputDescriptionsByName];
  v27 = [v23 inputFeatureNames];
  BOOL v28 = [v23 outputFeatureNames];
  v29 = [(MLDictVectorizer *)v24 initWith:v9 dataTransformerName:@"dict vectorizer" inputDescription:v25 outputDescription:v26 orderedInputFeatureNames:v27 orderedOutputFeatureNames:v28 configuration:v7 error:a5];

  return v29;
}

@end