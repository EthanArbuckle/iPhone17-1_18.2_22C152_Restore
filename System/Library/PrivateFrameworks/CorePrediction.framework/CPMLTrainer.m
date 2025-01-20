@interface CPMLTrainer
- (id)fileProtectionClassRequest:(id)a3;
- (id)getSolution;
- (id)init:(id)a3 withModelDBPath:(id)a4 withPropertyList:(id)a5;
- (void)buildTrainingMachineLearningAlgorithm:(id)a3;
- (void)dealloc;
- (void)train:(BOOL)a3;
@end

@implementation CPMLTrainer

- (id)getSolution
{
  (*((void (**)(CPMLAlgorithm *, SEL))self->cpMLAlgo->var0 + 4))(self->cpMLAlgo, a2);
  NSLog(&cfstr_GettingSolutio.isa);
  __p = 0;
  v9 = 0;
  (*((void (**)(CPMLAlgorithm *, void **))self->cpMLAlgo->var0 + 12))(self->cpMLAlgo, &__p);
  v3 = [MEMORY[0x263EFF980] array];
  v4 = (double *)__p;
  if (v9 != __p)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [NSNumber numberWithDouble:v4[v5]];
      [v3 addObject:v6];

      ++v5;
      v4 = (double *)__p;
    }
    while (v5 < (v9 - (unsigned char *)__p) >> 3);
  }
  if (__p)
  {
    if (v9 != __p) {
      v9 += ((unsigned char *)__p - v9 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    operator delete(__p);
  }

  return v3;
}

- (id)init:(id)a3 withModelDBPath:(id)a4 withPropertyList:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v24 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CPMLTrainer;
  v10 = [(CPMLTrainer *)&v25 init];
  if (v10)
  {
    v11 = [v9 objectForKey:@"loggingMode"];
    v12 = v11;
    if (v11
      || (v13 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cpml"],
          [v13 objectForKey:@"loggingMode"],
          v12 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12))
    {
      CPMLLog = CPMLLog::getCPMLLog(v11);
      CPMLLog[10] = [v12 longLongValue];
    }
    v10->shouldFail = 0;
    objc_storeStrong((id *)&v10->cpmlDB, a3);
    uint64_t v15 = [(CPMLDB *)v10->cpmlDB getDelegate];
    theDelegate = v10->_theDelegate;
    v10->_theDelegate = (CPMLAlgorithmProtocol *)v15;

    [(CPMLDB *)v10->cpmlDB flushDB];
    if (v24)
    {
      id v22 = v24;
      if (!sqlite3_open((const char *)[v22 UTF8String], &v10->modelDB))
      {
        if (v9)
        {
          objc_storeStrong((id *)&v10->modelPlist, a5);
          v18 = [[CPMLSchema alloc] initWithPlist:v9];
          cpmlSchema = v10->cpmlSchema;
          v10->cpmlSchema = v18;

          operator new();
        }
        v10->mapFunction = [0 objectForKey:@"mapFunction"];
        v21 = [0 objectForKey:@"serializeFunction"];
        if ([v21 isEqualToString:@"PMML"])
        {
          NSLog(&cfstr_PmmlNotImpleme.isa);
        }
        else
        {
          if (![v21 isEqualToString:@"MMAP"]) {
            operator new();
          }
          NSLog(&cfstr_MmapNotImpleme.isa);
        }
        operator new();
      }
      NSLog(&cfstr_CannotOpen.isa, v22);
      sqlite3_close(v10->modelDB);
    }
    else
    {
      NSLog(&cfstr_ModelNameAndPa.isa);
    }

    id v17 = 0;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  cpRemapper = (CPMLRemapper *)self->cpRemapper;
  if (cpRemapper)
  {
    CPMLRemapper::~CPMLRemapper(cpRemapper);
    MEMORY[0x21669DB80]();
  }
  cpCDB = self->cpCDB;
  if (cpCDB)
  {
    CPMLCDB::~CPMLCDB(cpCDB);
    MEMORY[0x21669DB80]();
  }
  trainerCPSerializer = self->trainerCPSerializer;
  if (trainerCPSerializer) {
    (*((void (**)(CPMLSerialization *, SEL))trainerCPSerializer->var0 + 1))(trainerCPSerializer, a2);
  }
  cpMLAlgo = self->cpMLAlgo;
  if (cpMLAlgo) {
    (*((void (**)(CPMLAlgorithm *, SEL))cpMLAlgo->var0 + 1))(cpMLAlgo, a2);
  }
  cpTuneableData = self->cpTuneableData;
  if (cpTuneableData) {
    MEMORY[0x21669DB80](cpTuneableData, 0x1080C40C4643742);
  }
  trainerCPStatistics = (CPMLStatistics *)self->trainerCPStatistics;
  if (trainerCPStatistics)
  {
    CPMLStatistics::~CPMLStatistics(trainerCPStatistics);
    MEMORY[0x21669DB80]();
  }
  v9.receiver = self;
  v9.super_class = (Class)CPMLTrainer;
  [(CPMLTrainer *)&v9 dealloc];
}

- (id)fileProtectionClassRequest:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NSFileProtectionCompleteUntilFirstUserAuthentication"])
  {
    v4 = (id *)MEMORY[0x263F08098];
LABEL_9:
    id v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"NSFileProtectionCompleteUnlessOpen"])
  {
    v4 = (id *)MEMORY[0x263F08088];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"NSFileProtectionComplete"])
  {
    v4 = (id *)MEMORY[0x263F08080];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"NSFileProtectionNone"])
  {
    v4 = (id *)MEMORY[0x263F080B0];
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (void)train:(BOOL)a3
{
  id v5 = [(CPMLDB *)self->cpmlDB getDispatchQueue];
  v6 = v5;
  if (*((int *)self->trainerCPStatistics + 31) <= 0)
  {
    NSLog(&cfstr_TrainColumnSta.isa);
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __21__CPMLTrainer_train___block_invoke;
    v9[3] = &unk_2642020D8;
    v9[4] = self;
    BOOL v10 = a3;
    dispatch_sync(v5, v9);
    cpmlDB = self->cpmlDB;
    v8 = [(NSDictionary *)self->modelPlist objectForKey:@"clearTrainingValueTrainingPhase"];
    [v8 doubleValue];
    -[CPMLDB removeTrainingRowData:](cpmlDB, "removeTrainingRowData:");
  }
}

uint64_t __21__CPMLTrainer_train___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 80) + 232))(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 80));
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 48) + 40))(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 48));
  if (*(unsigned char *)(a1 + 40))
  {
    CPModelClose(*(void **)(*(void *)(a1 + 32) + 40));
    (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                           + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(a1 + 32) + 72) + 120, "cptrainRows", 1, 0);
    (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                           + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(a1 + 32) + 72) + 124, "cptrainColumns", 1, 0);
    (*(void (**)(void, uint64_t, const char *, uint64_t, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                           + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(a1 + 32) + 72) + 128, "cptrainyCol", 1, 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 72), "cpContinousData", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 96), "cpValRemap", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 48))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 144), "cptrainCard", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 48))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 168), "cptrainMean", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 48))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 192), "cpSTDev", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 48))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 216), "cpMin", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void, void, const char *, void, void))(**(void **)(*(void *)(a1 + 32) + 80)
                                                                         + 48))(*(void *)(*(void *)(a1 + 32) + 80), *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 240), "cpMax", *(int *)(*(void *)(*(void *)(a1 + 32) + 72) + 124), 0);
    (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 48) + 32))(*(void *)(*(void *)(a1 + 32) + 48));
  }
  v2 = *(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 80) + 240);

  return v2();
}

- (void)buildTrainingMachineLearningAlgorithm:(id)a3
{
  id v8 = a3;
  if ([v8 isEqualToString:@"SVM"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"LIBSVM"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"LINEARSVM"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"NB"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"NB_BASE"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"NAIVE_BAYES"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"NAIVE_BAYESV2"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"NAIVEBAYES"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"KMEANS"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"KNN"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"LOGISTIC_REGRESSION"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"REGRESSION_FOREST"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"GAUSSIAN_MIXTURE_MODEL"]) {
    operator new();
  }
  if ([v8 isEqualToString:@"LINEAR_REGRESSION"]) {
    operator new();
  }
  NSLog(&cfstr_SNoMlAlgoSelec.isa, "-[CPMLTrainer buildTrainingMachineLearningAlgorithm:]");
  self->shouldFail = 1;
  self->cpMLAlgo = 0;
  if (self->_theDelegate)
  {
    cpMLAlgo = self->cpMLAlgo;
    if (cpMLAlgo) {
      (*((void (**)(CPMLAlgorithm *))cpMLAlgo->var0 + 1))(cpMLAlgo);
    }
    storageManager = self->_storageManager;
    if (!storageManager)
    {
      v6 = objc_alloc_init(CPMLStorageManager);
      v7 = self->_storageManager;
      self->_storageManager = v6;

      storageManager = self->_storageManager;
    }
    [(CPMLAlgorithmProtocol *)self->_theDelegate initCPMLAlgorithm:storageManager];
    operator new();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theDelegate, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->cpmlSchema, 0);
  objc_storeStrong((id *)&self->cpmlDB, 0);

  objc_storeStrong((id *)&self->modelPlist, 0);
}

@end