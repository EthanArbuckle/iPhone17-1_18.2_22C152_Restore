@interface MLLinkedModel
+ (BOOL)areFeaturesIn:(id)a3 modelNamed:(id)a4 aSubsetOf:(id)a5 error:(id *)a6;
+ (id)findFile:(id)a3 inSearchPath:(id)a4 basePath:(id)a5;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLLinkedModel)initWithLinkedModel:(id)a3 modelFileName:(id)a4 modelSearchPath:(id)a5 configuration:(id)a6;
- (MLModel)linkedModel;
- (NSString)modelFileName;
- (NSString)modelSearchPath;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (void)setLinkedModel:(id)a3;
- (void)setModelFileName:(id)a3;
- (void)setModelSearchPath:(id)a3;
- (void)updateParameterDescriptionsByUnarchivingSpecification:(const void *)a3;
@end

@implementation MLLinkedModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelSearchPath, 0);
  objc_storeStrong((id *)&self->_modelFileName, 0);

  objc_storeStrong((id *)&self->_linkedModel, 0);
}

- (void)setModelSearchPath:(id)a3
{
}

- (NSString)modelSearchPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setModelFileName:(id)a3
{
}

- (NSString)modelFileName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLinkedModel:(id)a3
{
}

- (MLModel)linkedModel
{
  return (MLModel *)objc_getProperty(self, a2, 80, 1);
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasGlobalScope])
  {
    v7 = +[MLParameterKey linkedModelFileName];
    int v8 = [v6 hasSameNameAsKey:v7];

    if (v8)
    {
      uint64_t v9 = [(MLLinkedModel *)self modelFileName];
LABEL_6:
      v12 = (void *)v9;
      goto LABEL_10;
    }
    v10 = +[MLParameterKey linkedModelSearchPath];
    int v11 = [v6 hasSameNameAsKey:v10];

    if (v11)
    {
      uint64_t v9 = [(MLLinkedModel *)self modelSearchPath];
      goto LABEL_6;
    }
  }
  if (a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Linked Model does not have a parameter for requested key %@.", v6 format];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v9 parentSignpostID];
  kdebug_trace();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__MLLinkedModel_predictionsFromBatch_options_error___block_invoke;
  v16[3] = &__block_descriptor_48_e5_v8__0l;
  v16[4] = v10;
  v16[5] = v11;
  v12 = (void (**)(void))_Block_copy(v16);
  v13 = [(MLLinkedModel *)self linkedModel];
  v14 = [v13 predictionsFromBatch:v8 options:v9 error:a5];

  v12[2](v12);

  return v14;
}

uint64_t __52__MLLinkedModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v14, v10, 0, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  uint64_t v11 = [(MLLinkedModel *)self linkedModel];
  v12 = [v11 predictionFromFeatures:v8 options:v9 error:a5];

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v14);

  return v12;
}

- (MLLinkedModel)initWithLinkedModel:(id)a3 modelFileName:(id)a4 modelSearchPath:(id)a5 configuration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 modelDescription];
  v16 = (void *)[v15 copy];
  v19.receiver = self;
  v19.super_class = (Class)MLLinkedModel;
  v17 = [(MLModel *)&v19 initWithDescription:v16 configuration:v14];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_linkedModel, a3);
    objc_storeStrong((id *)&v17->_modelFileName, a4);
    objc_storeStrong((id *)&v17->_modelSearchPath, a5);
  }

  return v17;
}

- (void)updateParameterDescriptionsByUnarchivingSpecification:(const void *)a3
{
  id v12 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (a3 != &CoreML::Specification::_LinkedModelFile_default_instance_)
  {
    if (*((void *)a3 + 2))
    {
      v5 = +[MLParameterKey linkedModelFileName];
      if (*((void *)a3 + 2)) {
        id v6 = (uint64_t *)*((void *)a3 + 2);
      }
      else {
        id v6 = &CoreML::Specification::_StringParameter_default_instance_;
      }
      v7 = +[MLParameterDescription parameterDescriptionForKey:v5 stringParameterSpec:v6];
      [v12 addObject:v7];
    }
    if (*((void *)a3 + 3))
    {
      id v8 = +[MLParameterKey linkedModelSearchPath];
      if (*((void *)a3 + 3)) {
        id v9 = (uint64_t *)*((void *)a3 + 3);
      }
      else {
        id v9 = &CoreML::Specification::_StringParameter_default_instance_;
      }
      unint64_t v10 = +[MLParameterDescription parameterDescriptionForKey:v8 stringParameterSpec:v9];
      [v12 addObject:v10];
    }
  }
  id v11 = [(MLModel *)self modelDescription];
  +[MLParameterUtils appendParameterDescriptions:v12 toModelDescription:v11];
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 556)
  {
    inited = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    id v9 = inited;
    if (*(_DWORD *)(*(void *)a3 + 44) == 556)
    {
      unint64_t v10 = *(uint64_t **)(*(void *)a3 + 32);
    }
    else
    {
      inited = CoreML::Specification::protobuf_LinkedModel_2eproto::InitDefaults((CoreML::Specification::protobuf_LinkedModel_2eproto *)inited);
      unint64_t v10 = &CoreML::Specification::_LinkedModel_default_instance_;
    }
    if (*((_DWORD *)v10 + 7) == 1)
    {
      id v14 = (const CoreML::Specification::LinkedModelFile *)v10[2];
    }
    else
    {
      CoreML::Specification::protobuf_LinkedModel_2eproto::InitDefaults((CoreML::Specification::protobuf_LinkedModel_2eproto *)inited);
      id v14 = (const CoreML::Specification::LinkedModelFile *)&CoreML::Specification::_LinkedModelFile_default_instance_;
    }
    CoreML::Specification::LinkedModelFile::LinkedModelFile((CoreML::Specification::LinkedModelFile *)v50, v14);
    v15 = +[MLParameterKey linkedModelFileName];
    v16 = [v7 parameters];
    uint64_t v17 = +[MLParameterUtils stringForKey:v15 inDictionary:v16];

    v18 = +[MLParameterKey linkedModelSearchPath];
    objc_super v19 = [v7 parameters];
    v20 = +[MLParameterUtils stringForKey:v18 inDictionary:v19];

    if (v17)
    {
      if (v20) {
        goto LABEL_24;
      }
    }
    else
    {
      v21 = v51;
      if (!v51) {
        v21 = &CoreML::Specification::_StringParameter_default_instance_;
      }
      uint64_t v22 = v21[2];
      if (*(char *)(v22 + 23) < 0) {
        uint64_t v22 = *(void *)v22;
      }
      uint64_t v17 = [NSString stringWithUTF8String:v22];
      if (v20)
      {
LABEL_24:
        if (![(__CFString *)v20 length])
        {

          v20 = @".";
        }
        v45 = (void *)v17;
        v25 = [v7 rootModelURL];
        v26 = [v25 path];
        uint64_t v27 = [v26 stringByDeletingLastPathComponent];

        v44 = (void *)v27;
        v28 = [a1 findFile:v17 inSearchPath:v20 basePath:v27];
        if (!v28)
        {
          v40 = +[MLModelErrorUtils IOErrorWithFormat:@"Model linking could not find model (%@) in search path (%@) relative to (%@)", v45, v20, v27];
          id v12 = v40;
          if (a5)
          {
            id v12 = v40;
            id v13 = 0;
            *a5 = v12;
          }
          else
          {
            id v13 = 0;
          }
          goto LABEL_47;
        }
        v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28];
        id v49 = 0;
        v30 = +[MLModel modelWithContentsOfURL:v29 configuration:v7 error:&v49];
        id v12 = v49;

        if (!v30)
        {
          if (!a5)
          {
            id v13 = 0;
            goto LABEL_46;
          }
          v43 = 0;
          id v35 = v12;
          goto LABEL_41;
        }
        v42 = v9;
        v43 = v30;
        v31 = [v30 modelDescription];
        v32 = [v31 inputDescriptionsByName];
        v33 = [v9 inputDescriptionsByName];
        id v48 = v12;
        char v34 = [a1 areFeaturesIn:v32 modelNamed:@"Linked model" aSubsetOf:v33 error:&v48];
        id v35 = v48;

        if (v34)
        {
          v36 = [v42 outputDescriptionsByName];
          v37 = [v43 modelDescription];
          v38 = [v37 outputDescriptionsByName];
          id v47 = v35;
          char v39 = [a1 areFeaturesIn:v36 modelNamed:@"Root/Loaded model" aSubsetOf:v38 error:&v47];
          id v12 = v47;

          if (v39)
          {
            v30 = v43;
            id v13 = (void *)[objc_alloc((Class)a1) initWithLinkedModel:v43 modelFileName:v45 modelSearchPath:v20 configuration:v7];
            id v9 = v42;
            [v13 updateParameterDescriptionsByUnarchivingSpecification:v50];
LABEL_46:

LABEL_47:
            CoreML::Specification::LinkedModelFile::~LinkedModelFile((CoreML::Specification::LinkedModelFile *)v50);

            goto LABEL_48;
          }
          if (a5)
          {
            id v35 = v12;
            goto LABEL_40;
          }
          id v13 = 0;
        }
        else
        {
          if (a5)
          {
LABEL_40:
            id v9 = v42;
LABEL_41:
            id v12 = v35;
            id v13 = 0;
            *a5 = v12;
LABEL_45:
            v30 = v43;
            goto LABEL_46;
          }
          id v13 = 0;
          id v12 = v35;
        }
        id v9 = v42;
        goto LABEL_45;
      }
    }
    v23 = v52;
    if (!v52) {
      v23 = &CoreML::Specification::_StringParameter_default_instance_;
    }
    uint64_t v24 = v23[2];
    if (*(char *)(v24 + 23) < 0) {
      uint64_t v24 = *(void *)v24;
    }
    v20 = [NSString stringWithUTF8String:v24];
    goto LABEL_24;
  }
  id v11 = +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not linked model as expected"];
  id v12 = v11;
  if (a5)
  {
    id v12 = v11;
    id v13 = 0;
    *a5 = v12;
  }
  else
  {
    id v13 = 0;
  }
LABEL_48:

  return v13;
}

+ (BOOL)areFeaturesIn:(id)a3 modelNamed:(id)a4 aSubsetOf:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v13)
  {
    BOOL v19 = 1;
    goto LABEL_18;
  }
  uint64_t v14 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v25 != v14) {
        objc_enumerationMutation(v12);
      }
      uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
      uint64_t v17 = [v11 objectForKeyedSubscript:v16];
      if (!v17)
      {
        v20 = +[MLModelErrorUtils IOErrorWithFormat:@"%@ is missing feature '%@'", v10, v16];
        id v21 = v20;
        if (a6)
        {
          id v21 = v20;
          *a6 = v21;
        }
        goto LABEL_17;
      }
      v18 = [v12 objectForKeyedSubscript:v16];
      if (([v18 allowsValuesWithDescription:v17] & 1) == 0)
      {
        uint64_t v22 = +[MLModelErrorUtils IOErrorWithFormat:@"%@ feature '%@' is inconsistent with '%@'", v10, v18, v17];
        id v21 = v22;
        if (a6) {
          *a6 = v22;
        }

LABEL_17:
        BOOL v19 = 0;
        goto LABEL_18;
      }
    }
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    BOOL v19 = 1;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_18:

  return v19;
}

+ (id)findFile:(id)a3 inSearchPath:(id)a4 basePath:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a4;
  id v22 = a5;
  v20 = v7;
  id v21 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@":"];
  id v8 = objc_msgSend(v7, "componentsSeparatedByCharactersInSet:");
  v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
      if ([v12 isEqualToString:@"$BUNDLE_MAIN"])
      {
        uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v14 = [v13 pathForResource:v25 ofType:0];
        if (v14) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
      if ([v12 hasPrefix:@"$BUNDLE_IDENTIFIER"])
      {
        uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"$BUNDLE_IDENTIFIER" withString:&stru_1EF0E81D0];
        if ((unint64_t)[v13 length] < 3
          || [v13 characterAtIndex:0] != 40
          || objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) != 41)
        {
          goto LABEL_20;
        }
        uint64_t v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"()"];
        v15 = [v13 stringByTrimmingCharactersInSet:v14];
        uint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v15];
        uint64_t v17 = [v16 pathForResource:v25 ofType:0];

        if (v17)
        {

          uint64_t v14 = (void *)v17;
LABEL_23:

          uint64_t v13 = v14;
          goto LABEL_24;
        }
      }
      else
      {
        if ([v12 isAbsolutePath])
        {
          uint64_t v13 = [v12 stringByAppendingPathComponent:v25];
          if ([v23 fileExistsAtPath:v13]) {
            goto LABEL_24;
          }
          goto LABEL_20;
        }
        v18 = [v22 stringByAppendingPathComponent:v12];
        uint64_t v13 = [v18 stringByStandardizingPath];

        uint64_t v14 = [v13 stringByAppendingPathComponent:v25];
        if ([v23 fileExistsAtPath:v14]) {
          goto LABEL_23;
        }
      }

LABEL_20:
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_24:

  return v13;
}

@end