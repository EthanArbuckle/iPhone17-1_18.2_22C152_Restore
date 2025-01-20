@interface SGModel
+ (Class)modelClassForObjective:(unint64_t)a3;
+ (id)featurize:(id)a3;
+ (id)newTransformerInstanceForLanguage:(id)a3;
+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4;
+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4 withObjective:(unint64_t)a5;
+ (id)transformerInstanceForLanguage:(id)a3;
+ (id)transformerInstanceForLanguage:(id)a3 withObjective:(unint64_t)a4;
- (NSString)locale;
- (PMLMultiLabelClassifierProtocol)model;
- (PMLTransformerProtocol)featurizer;
- (SGModel)initWithModel:(id)a3 locale:(id)a4 featurizer:(id)a5 modelSource:(id)a6;
- (SGModelSource)modelSource;
- (id)predictForInput:(id)a3;
- (id)trainingFeaturesOf:(id)a3;
@end

@implementation SGModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_modelSource, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (SGModelSource)modelSource
{
  return (SGModelSource *)objc_getProperty(self, a2, 24, 1);
}

- (PMLTransformerProtocol)featurizer
{
  return (PMLTransformerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (PMLMultiLabelClassifierProtocol)model
{
  return (PMLMultiLabelClassifierProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (id)trainingFeaturesOf:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    v6 = objc_opt_class();
    v7 = [(SGModel *)self locale];
    id v5 = [v6 trainingFeaturesOf:v4 inLanguage:v7];
  }
  return v5;
}

- (id)predictForInput:(id)a3
{
  id v5 = a3;
  v6 = [(PMLTransformerProtocol *)self->_featurizer transform:v5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGModels.m", 81, @"Invalid parameter not satisfying: %@", @"[vector isKindOfClass:PMLSparseVector.class]" object file lineNumber description];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F5DFB0]) initWithSource:self->_modelSource vector:v6];
  v8 = objc_opt_class();
  v9 = [v7 source];
  if ((objc_msgSend(v8, "isEqual:", objc_msgSend(v9, "modelClass")) & 1) == 0) {
    __assert_rtn("-[SGModel predictForInput:]", "SGModels.m", 83, "[[self class] isEqual:features.source.modelClass]");
  }

  model = self->_model;
  v11 = [v7 vector];
  v12 = [(PMLMultiLabelClassifierProtocol *)model predict:v11];

  if (v12)
  {
    id i = v12;
  }
  else
  {
    uint64_t v14 = [(PMLMultiLabelClassifierProtocol *)self->_model outputDimension];
    for (id i = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14]; v14; --v14)
      [i addObject:&unk_1F25355E0];
  }

  return i;
}

- (SGModel)initWithModel:(id)a3 locale:(id)a4 featurizer:(id)a5 modelSource:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGModels.m", 53, @"Invalid parameter not satisfying: %@", @"model" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_10:
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"SGModels.m", 55, @"Invalid parameter not satisfying: %@", @"featurizer" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGModels.m", 54, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_11:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGModels.m", 56, @"Invalid parameter not satisfying: %@", @"modelSource" object file lineNumber description];

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)SGModel;
  v16 = [(SGModel *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_model, a3);
    objc_storeStrong((id *)&v17->_locale, a4);
    objc_storeStrong((id *)&v17->_featurizer, a5);
    objc_storeStrong((id *)&v17->_modelSource, a6);
  }

  return v17;
}

+ (id)featurize:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"%PHONE%"];
  v7 = [[SGDataDetectorMatch alloc] initWithMatchType:0, 0, 0, 0, 0, &stru_1F24EEF20, v5, v6, @"%PHONE%" range labelRange labelString valueRange valueString];
  v17[0] = @"INPUT_TEXT";
  v17[1] = @"TARGET_MATCH";
  v18[0] = v4;
  v18[1] = v7;
  v17[2] = @"DD_MATCHES";
  v16 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v18[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  v10 = [a1 transformerInstanceForLanguage:@"en"];
  v11 = [v10 transformer];

  id v12 = [v11 transformers];
  id v13 = objc_msgSend(v11, "transform:stopAfterTransformerWithIndex:", v9, objc_msgSend(v12, "count") - 2);

  id v14 = objc_msgSend(v13, "_pas_componentsJoinedByString:", @" ");

  return v14;
}

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, a1, @"SGModels.m", 202, @"%@ must implement +newTransformerInstanceForLanguage:", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4 withObjective:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_msgSend((id)objc_msgSend(a1, "modelClassForObjective:", a5), "trainingFeaturesOf:inLanguage:", v9, v8);

  return v10;
}

+ (id)trainingFeaturesOf:(id)a3 inLanguage:(id)a4
{
  id v6 = a3;
  v7 = [a1 transformerInstanceForLanguage:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 trainingFeaturesOf:v6];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (Class)modelClassForObjective:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      v7 = objc_opt_class();
      break;
    default:
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGModels.m", 178, @"Undefined class for model objective %lu", a3);

      break;
  }
  return (Class)v7;
}

+ (id)transformerInstanceForLanguage:(id)a3 withObjective:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_msgSend((id)objc_msgSend(a1, "modelClassForObjective:", a4), "transformerInstanceForLanguage:", v6);

  return v7;
}

+ (id)transformerInstanceForLanguage:(id)a3
{
  id v4 = (__CFString *)a3;
  if (transformerInstanceForLanguage___pasOnceToken378 != -1) {
    dispatch_once(&transformerInstanceForLanguage___pasOnceToken378, &__block_literal_global_717);
  }
  id v5 = (id)transformerInstanceForLanguage___pasExprOnceResult;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  if (v4) {
    v7 = v4;
  }
  else {
    v7 = &stru_1F24EEF20;
  }
  id v8 = NSStringFromClass((Class)a1);
  id v9 = [(__CFString *)v7 stringByAppendingString:v8];

  uint64_t v22 = 0;
  objc_super v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __42__SGModel_transformerInstanceForLanguage___block_invoke_35;
  v17 = &unk_1E65B5418;
  v20 = &v22;
  id v10 = v9;
  id v18 = v10;
  id v21 = a1;
  v11 = v4;
  v19 = v11;
  [v5 runWithLockAcquired:&v14];
  id v12 = objc_msgSend((id)v23[5], "result", v14, v15, v16, v17);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __42__SGModel_transformerInstanceForLanguage___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F93B60]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __42__SGModel_transformerInstanceForLanguage___block_invoke_2_37;
    uint64_t v14 = &unk_1E65B53F0;
    uint64_t v16 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 initWithBlock:&v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(a1 + 32), v11, v12, v13, v14);
  }
}

id __42__SGModel_transformerInstanceForLanguage___block_invoke_2_37(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 40) newTransformerInstanceForLanguage:*(void *)(a1 + 32)];
  return v1;
}

void __42__SGModel_transformerInstanceForLanguage___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  id v3 = (void *)[v1 initWithGuardedData:v2];

  uint64_t v4 = (void *)MEMORY[0x1E4F5DFA8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SGModel_transformerInstanceForLanguage___block_invoke_2;
  v7[3] = &unk_1E65BEF88;
  id v5 = v3;
  id v8 = v5;
  [v4 registerOnUpdateBlock:v7];

  id v6 = (void *)transformerInstanceForLanguage___pasExprOnceResult;
  transformerInstanceForLanguage___pasExprOnceResult = (uint64_t)v5;
}

uint64_t __42__SGModel_transformerInstanceForLanguage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) runWithLockAcquired:&__block_literal_global_31];
}

uint64_t __42__SGModel_transformerInstanceForLanguage___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

@end