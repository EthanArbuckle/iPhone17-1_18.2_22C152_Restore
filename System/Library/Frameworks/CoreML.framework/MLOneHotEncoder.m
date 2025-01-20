@interface MLOneHotEncoder
+ (id)featureEncoderFrom:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10;
+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 orderedInputFeatureNames:(id)a5;
+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)handleUnknown;
- (BOOL)ouputSparse;
- (MLOneHotEncoder)initWith:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10 configuration:(id)a11;
- (NSOrderedSet)featureEncoding;
- (id)encodeFeatureValue:(id)a3;
- (id)encodeFeatureValueIntString:(unint64_t)a3;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)unknownDenseVector;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLOneHotEncoder

- (void).cxx_destruct
{
}

- (BOOL)handleUnknown
{
  return self->_handleUnknown;
}

- (BOOL)ouputSparse
{
  return self->_ouputSparse;
}

- (NSOrderedSet)featureEncoding
{
  return self->_featureEncoding;
}

- (id)encodeFeatureValueIntString:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(MLOneHotEncoder *)self handleUnknown])
    {
      if (self->_ouputSparse)
      {
        v4 = (void *)MEMORY[0x1E4F1CC08];
      }
      else
      {
        v4 = [(MLOneHotEncoder *)self unknownDenseVector];
      }
    }
    else
    {
      v4 = 0;
    }
  }
  else if (self->_ouputSparse)
  {
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    v11 = v6;
    v12[0] = &unk_1EF11A808;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    v7 = objc_opt_new();
    NSUInteger v8 = [(NSOrderedSet *)self->_featureEncoding count];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
        [v7 setObject:&unk_1EF11A7F0 atIndexedSubscript:i];
    }
    [v7 replaceObjectAtIndex:a3 withObject:&unk_1EF11A808];
    v4 = +[MLMultiArray doubleVectorWithValues:v7];
  }

  return v4;
}

- (id)unknownDenseVector
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (NSUInteger i = [(NSOrderedSet *)self->_featureEncoding count]; i; --i)
    [v3 addObject:&unk_1EF11A7F0];
  v5 = +[MLMultiArray doubleVectorWithValues:v3];

  return v5;
}

- (id)encodeFeatureValue:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 1)
  {
    featureEncoding = self->_featureEncoding;
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "int64Value"));
    uint64_t v7 = [(NSOrderedSet *)featureEncoding indexOfObject:v6];

    NSUInteger v8 = [(MLOneHotEncoder *)self encodeFeatureValueIntString:v7];
  }
  else if ([v4 type] == 3)
  {
    v9 = [v4 stringValue];
    if (v9)
    {
      NSUInteger v8 = [(MLOneHotEncoder *)self encodeFeatureValueIntString:[(NSOrderedSet *)self->_featureEncoding indexOfObject:v9]];
    }
    else
    {
      NSUInteger v8 = 0;
    }
  }
  else
  {
    NSUInteger v8 = 0;
  }

  return v8;
}

- (unint64_t)predictionTypeForKTrace
{
  return 12;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(MLOneHotEncoder *)self predictionTypeForKTrace];
  unint64_t v11 = [(MLModelEngine *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MLOneHotEncoder_predictionFromFeatures_options_error___block_invoke;
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

  v20 = [v8 featureValueForName:v16];
  v21 = [(MLOneHotEncoder *)self encodeFeatureValue:v20];

  if (v21)
  {
    v22 = [MLDictionaryFeatureProvider alloc];
    v27 = v19;
    v28[0] = v21;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v24 = [(MLDictionaryFeatureProvider *)v22 initWithDictionary:v23 error:a5];
LABEL_5:

    goto LABEL_6;
  }
  if (a5)
  {
    v23 = [v8 featureValueForName:v16];
    +[MLModelErrorUtils genericErrorWithFormat:@"MLOneHotEncoder: unknown category %@, expected one of %@", v23, self->_featureEncoding];
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v24 = 0;
LABEL_6:

  v13[2](v13);

  return v24;
}

uint64_t __56__MLOneHotEncoder_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLOneHotEncoder)initWith:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10 configuration:(id)a11
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v20 = v17;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v51.receiver = self;
  v51.super_class = (Class)MLOneHotEncoder;
  v45 = v22;
  v46 = v18;
  id v24 = v18;
  v25 = v19;
  v44 = v21;
  id v26 = v22;
  id v27 = v23;
  v28 = [(MLModelEngine *)&v51 initWithName:v20 inputDescription:v24 outputDescription:v19 orderedInputFeatureNames:v21 orderedOutputFeatureNames:v26 configuration:v23];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_featureEncoding, a3);
    v29->_ouputSparse = a5;
    v29->_handleUnknown = a6;
    v30 = [v46 allValues];
    BOOL v31 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v30 hasAnyFeatureTypeIn:&unk_1EF11AAC0 minimalCount:1 maximumCount:1 debugLabel:@"MLOneHotEncoder Inputs" error:0];

    if (!v31
      || ([v25 allValues],
          v32 = objc_claimAutoreleasedReturnValue(),
          BOOL v33 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v32 hasAnyFeatureTypeIn:&unk_1EF11AAD8 minimalCount:1 maximumCount:1 debugLabel:@"MLOneHotEncoder Outputs" error:0], v32, !v33))
    {
LABEL_22:
      v40 = 0;
      goto LABEL_23;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v34 = [v25 allKeys];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(v34);
          }
          v38 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          unint64_t v39 = [v38 type];
          if (v39 <= 8)
          {
            if (v39 == 5)
            {
              if (v29->_ouputSparse) {
                goto LABEL_21;
              }
            }
            else if (v39 == 6)
            {
              if (!v29->_ouputSparse) {
                goto LABEL_21;
              }
            }
            else if (((1 << v39) & 0x195) != 0)
            {
LABEL_21:
              NSLog(&cfstr_OutputDescript.isa, v20);

              goto LABEL_22;
            }
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
  }
  v40 = v29;
LABEL_23:

  return v40;
}

+ (id)featureEncoderFrom:(id)a3 dataTransformerName:(id)a4 ouputSparse:(BOOL)a5 handleUnknown:(BOOL)a6 inputDescription:(id)a7 outputDescription:(id)a8 orderedInputFeatureNames:(id)a9 orderedOutputFeatureNames:(id)a10
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = [MLOneHotEncoder alloc];
  id v22 = objc_alloc_init(MLModelConfiguration);
  id v23 = [(MLOneHotEncoder *)v21 initWith:v15 dataTransformerName:v16 ouputSparse:v13 handleUnknown:v12 inputDescription:v17 outputDescription:v18 orderedInputFeatureNames:v19 orderedOutputFeatureNames:v20 configuration:v22];

  return v23;
}

+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MLOneHotEncoder alloc];
  id v17 = objc_alloc_init(MLModelConfiguration);
  id v18 = [(MLOneHotEncoder *)v16 initWith:v11 dataTransformerName:@"MLOneHotEncoder" ouputSparse:0 handleUnknown:1 inputDescription:v12 outputDescription:v13 orderedInputFeatureNames:v14 orderedOutputFeatureNames:v15 configuration:v17];

  return v18;
}

+ (id)featureEncoderFrom:(id)a3 inputDescription:(id)a4 orderedInputFeatureNames:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [v8 allKeys];
  unint64_t v10 = 0;
  id v11 = v7;
  while (v10 < [v9 count])
  {
    id v12 = [v9 objectAtIndexedSubscript:v10];
    id v13 = v8;
    id v14 = [v8 objectForKeyedSubscript:v12];
    id v15 = objc_opt_new();
    id v16 = [v14 multiArrayConstraint];

    if (v16)
    {
      id v17 = [v14 multiArrayConstraint];
      [v15 addObject:v17];
    }
    id v18 = [v14 name];
    id v19 = +[MLFeatureDescription featureDescriptionWithName:type:optional:constraints:](MLFeatureDescription, "featureDescriptionWithName:type:optional:constraints:", v18, 5, [v14 isOptional], v15);

    id v20 = [v19 name];
    [v29 setObject:v19 forKey:v20];

    ++v10;
    id v7 = v11;
    id v8 = v13;
  }
  id v21 = [MLOneHotEncoder alloc];
  id v22 = (void *)MEMORY[0x1E4F1CAA0];
  id v23 = [v29 allKeys];
  id v24 = [v22 orderedSetWithArray:v23];
  v25 = objc_alloc_init(MLModelConfiguration);
  id v26 = [(MLOneHotEncoder *)v21 initWith:v7 dataTransformerName:@"MLOneHotEncoder" ouputSparse:0 handleUnknown:1 inputDescription:v8 outputDescription:v29 orderedInputFeatureNames:v28 orderedOutputFeatureNames:v24 configuration:v25];

  return v26;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v6 = (CoreML::Specification::protobuf_OneHotEncoder_2eproto *)a4;
  id v43 = v6;
  if (*(_DWORD *)(*(void *)a3 + 44) == 600)
  {
    id v7 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults(v6);
    id v7 = &CoreML::Specification::_OneHotEncoder_default_instance_;
  }
  inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)objc_opt_new();
  id v9 = inited;
  int v10 = *((_DWORD *)v7 + 9);
  if (v10 == 2)
  {
    for (uint64_t i = 0; ; ++i)
    {
      if (v10 == 2)
      {
        id v18 = (uint64_t *)v7[3];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v18 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      if (i >= *((int *)v18 + 4)) {
        break;
      }
      id v19 = NSNumber;
      if (*((_DWORD *)v7 + 9) == 2)
      {
        id v20 = (uint64_t *)v7[3];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v20 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      id v21 = [v19 numberWithLongLong:*(void *)(v20[3] + 8 * i + 8)];
      [(CoreML::Specification::protobuf_DataStructures_2eproto *)v9 addObject:v21];

      int v10 = *((_DWORD *)v7 + 9);
    }
  }
  else if (v10 == 1)
  {
    for (uint64_t j = 0; ; ++j)
    {
      if (v10 == 1)
      {
        id v12 = (uint64_t *)v7[3];
      }
      else
      {
        inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v12 = &CoreML::Specification::_StringVector_default_instance_;
      }
      if (j >= *((int *)v12 + 6)) {
        break;
      }
      id v13 = NSString;
      if (*((_DWORD *)v7 + 9) == 1)
      {
        id v14 = (uint64_t *)v7[3];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v14 = &CoreML::Specification::_StringVector_default_instance_;
      }
      id v15 = *(uint64_t **)(v14[4] + 8 * j + 8);
      if (*((char *)v15 + 23) < 0) {
        id v15 = (uint64_t *)*v15;
      }
      id v16 = [v13 stringWithUTF8String:v15];
      [(CoreML::Specification::protobuf_DataStructures_2eproto *)v9 addObject:v16];

      int v10 = *((_DWORD *)v7 + 9);
    }
  }
  id v22 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  unint64_t v39 = [MLOneHotEncoder alloc];
  id v23 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
  v42 = v23;
  if (*(_DWORD *)(*(void *)a3 + 44) == 600)
  {
    id v24 = *(uint64_t **)(*(void *)a3 + 32);
    int v25 = *((unsigned __int8 *)v24 + 16);
  }
  else
  {
    id v26 = CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults(v23);
    int v25 = byte_1EB4DE810;
    if (*(_DWORD *)(*(void *)a3 + 44) == 600)
    {
      id v24 = *(uint64_t **)(*(void *)a3 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_OneHotEncoder_2eproto::InitDefaults((CoreML::Specification::protobuf_OneHotEncoder_2eproto *)v26);
      id v24 = &CoreML::Specification::_OneHotEncoder_default_instance_;
    }
  }
  int v27 = *((_DWORD *)v24 + 5);
  v41 = [v22 inputDescriptionsByName];
  uint64_t v28 = [v22 outputDescriptionsByName];
  v29 = (void *)MEMORY[0x1E4F1CAA0];
  v40 = (void *)v28;
  v38 = [v22 inputDescriptionsByName];
  v37 = [v38 allKeys];
  v30 = [v29 orderedSetWithArray:v37];
  BOOL v31 = (void *)MEMORY[0x1E4F1CAA0];
  v32 = [v22 outputDescriptionsByName];
  BOOL v33 = [v32 allKeys];
  v34 = [v31 orderedSetWithArray:v33];
  uint64_t v35 = [(MLOneHotEncoder *)v39 initWith:v42 dataTransformerName:@"one hot encoder" ouputSparse:v25 != 0 handleUnknown:v27 != 0 inputDescription:v41 outputDescription:v40 orderedInputFeatureNames:v30 orderedOutputFeatureNames:v34 configuration:v43];

  return v35;
}

@end