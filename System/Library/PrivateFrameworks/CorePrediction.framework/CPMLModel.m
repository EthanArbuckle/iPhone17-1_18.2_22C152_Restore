@interface CPMLModel
+ (id)initCPModelPath:(id)a3 withConfiguration:(id)a4;
- (BOOL)reset;
- (BOOL)updateModelWithCPDB:(id)a3;
- (BOOL)updateModelWithDB:(id)a3;
- (CPMLModel)initWithModelPath:(id)a3 withConfiguration:(id)a4;
- (CPMLModel)initWithModelPath:(id)a3 withPropertyListPath:(id)a4;
- (CPMLModelEvaluate)cpModelEvaluate;
- (id)evalArray:(id)a3;
- (id)evalDict:(id)a3;
- (id)evalNSObjectV:(id)a3;
- (id)evalString:(id)a3;
- (id)getPropertyList;
- (void)boundResult:(id)a3;
- (void)initializeModel:(id)a3 withConfiguration:(id)a4;
- (void)setCPMLAlgorithm:(id)a3;
- (void)setCPMLAlgorithmEngine:(id)a3;
- (void)setCpModelEvaluate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CPMLModel

+ (id)initCPModelPath:(id)a3 withConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKey:@"machineLearningAlgorithm"];
  if ([v7 isEqualToString:@"KMEANS"]) {
    v8 = (CPMLModel *)objc_opt_new();
  }
  else {
    v8 = objc_alloc_init(CPMLModel);
  }
  v9 = v8;
  [(CPMLModel *)v8 initializeModel:v5 withConfiguration:v6];

  return v9;
}

- (CPMLModel)initWithModelPath:(id)a3 withPropertyListPath:(id)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_savedPlistPath, a4);
  v7 = [(CPMLModel *)self getPropertyList];
  if (v7) {
    self = [(CPMLModel *)self initWithModelPath:v6 withConfiguration:v7];
  }

  return self;
}

- (CPMLModel)initWithModelPath:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPMLModel;
  v8 = [(CPMLModel *)&v11 init];
  v9 = v8;
  if (v8) {
    [(CPMLModel *)v8 initializeModel:v6 withConfiguration:v7];
  }

  return v9;
}

- (void)initializeModel:(id)a3 withConfiguration:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_modelPath, a3);
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreprediction.mdb", 0);
  dispatch_queue = self->_dispatch_queue;
  self->_dispatch_queue = v8;

  v10 = [[CPMLModelEvaluate alloc] initWithModel:v15 withPropertyList:v7];
  cpModelEvaluate = self->cpModelEvaluate;
  self->cpModelEvaluate = v10;

  v12 = [(CPMLModelEvaluate *)self->cpModelEvaluate getModelData];
  self->_mData = v12;
  if (v12)
  {
    unint64_t v13 = *v12;
    self->_realBase = (double *)&v12[*v12];
    unint64_t v14 = (unint64_t)*(double *)&v12[v13];
    self->_totalBytesIntSection = v13;
    self->_totalBytesRealSection = v14;
  }
}

- (id)getPropertyList
{
  v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:self->_savedPlistPath];
  if (v2)
  {
    id v7 = 0;
    uint64_t v8 = 100;
    v3 = [MEMORY[0x263F08AC0] propertyListWithData:v2 options:0 format:&v8 error:&v7];
    id v4 = v7;
    if (v4)
    {
      NSLog(&cfstr_SPlistInvalid.isa, "-[CPMLModel getPropertyList]");
      id v5 = 0;
    }
    else
    {
      id v5 = v3;
    }
  }
  else
  {
    NSLog(&cfstr_SPlistIncorrec.isa, "-[CPMLModel getPropertyList]");
    id v5 = 0;
  }

  return v5;
}

- (id)evalString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__CPMLModel_evalString___block_invoke;
  block[3] = &unk_264202248;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __24__CPMLModel_evalString___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) evalString:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)evalNSObjectV:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__CPMLModel_evalNSObjectV___block_invoke;
  block[3] = &unk_264202248;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __27__CPMLModel_evalNSObjectV___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) evalNSObjectV:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)evalArray:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CPMLModel_evalArray___block_invoke;
  block[3] = &unk_264202248;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __23__CPMLModel_evalArray___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) evalArray:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (id)evalDict:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__CPMLModel_evalDict___block_invoke;
  block[3] = &unk_264202248;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __22__CPMLModel_evalDict___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) evalDict:a1[5]];

  return MEMORY[0x270F9A758]();
}

- (void)boundResult:(id)a3
{
  id v4 = a3;
  dispatch_queue = self->_dispatch_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__CPMLModel_boundResult___block_invoke;
  v7[3] = &unk_264202270;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatch_queue, v7);
}

uint64_t __25__CPMLModel_boundResult___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) boundResult:*(void *)(a1 + 40)];
}

- (BOOL)updateModelWithDB:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__CPMLModel_updateModelWithDB___block_invoke;
  block[3] = &unk_264202298;
  id v9 = v4;
  id v10 = self;
  objc_super v11 = &v12;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  LOBYTE(dispatch_queue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)dispatch_queue;
}

void __31__CPMLModel_updateModelWithDB___block_invoke(void *a1)
{
  v2 = [[CPMLDB alloc] initWithDBName:a1[4] withPlistPath:*(void *)(a1[5] + 8) withWriteOptions:1];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[5] + 64), "updateModel:");
}

- (BOOL)updateModelWithCPDB:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CPMLModel_updateModelWithCPDB___block_invoke;
  block[3] = &unk_264202248;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatch_queue, block);
  LOBYTE(dispatch_queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dispatch_queue;
}

uint64_t __33__CPMLModel_updateModelWithCPDB___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 64) updateModel:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)reset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue = self->_dispatch_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __18__CPMLModel_reset__block_invoke;
  v5[3] = &unk_2642022C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatch_queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __18__CPMLModel_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  id v12 = 0;
  char v6 = [v4 removeItemAtPath:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) getPropertyList];
    if (v8)
    {
      char v9 = [[CPMLModelEvaluate alloc] initWithModel:*(void *)(*(void *)(a1 + 32) + 16) withPropertyList:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 64);
      *(void *)(v10 + 64) = v9;
    }
    if (*(void *)(*(void *)(a1 + 32) + 64)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    NSLog(&cfstr_SCannotRemoveM.isa, "-[CPMLModel reset]_block_invoke");
  }
}

- (void)setCPMLAlgorithm:(id)a3
{
}

- (void)setCPMLAlgorithmEngine:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (CPMLModelEvaluate)cpModelEvaluate
{
  return (CPMLModelEvaluate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCpModelEvaluate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cpModelEvaluate, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);

  objc_storeStrong((id *)&self->_savedPlistPath, 0);
}

@end