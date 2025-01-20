@interface ETTaskClassifier
- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5;
- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6;
- (NSArray)class_names;
- (void)setClass_names:(id)a3;
@end

@implementation ETTaskClassifier

- (void)setClass_names:(id)a3
{
  self->_class_names = (NSArray *)a3;
}

- (NSArray)class_names
{
  return self->_class_names;
}

- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5 needWeightsInitialization:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[ETLossConfig softmaxCrossEntropyLoss];
  objc_msgSend(v13, "setLabel_name:", @"label");
  objc_msgSend(v13, "setLoss_name:", @"cross_entropy");
  if (v10)
  {
    [v10 network];
    uint64_t v14 = *(void *)(v29 + 256);
    if (v30) {
      nitro::nitro_function::nitro_function(v30);
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x100];
  }
  v15 = (void *)(v14 + 32);
  if (*(char *)(v14 + 55) < 0) {
    v15 = (void *)*v15;
  }
  v16 = [NSString stringWithUTF8String:v15];
  objc_msgSend(v13, "setOutput_name:", v16);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = [v10 variables];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v26;
    if (v6) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 2;
    }
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) setInitializationMode:v20];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v18);
  }

  v24.receiver = self;
  v24.super_class = (Class)ETTaskClassifier;
  v22 = [(ETTask *)&v24 initWithModelDef:v10 optimizerDef:v11 lossConfig:v13 extractor:v12];

  return v22;
}

- (ETTaskClassifier)initWithModelDef:(id)a3 optimizerDef:(id)a4 extractor:(id)a5
{
  return [(ETTaskClassifier *)self initWithModelDef:a3 optimizerDef:a4 extractor:a5 needWeightsInitialization:1];
}

@end