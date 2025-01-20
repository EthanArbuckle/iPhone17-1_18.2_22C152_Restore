@interface CPMLModelEvaluate
- (BOOL)updateModel:(id)a3;
- (CPMLModelEvaluate)initWithModel:(id)a3 withPropertyList:(id)a4;
- (id).cxx_construct;
- (id)doEvaluate:(void *)a3 withBoundedList:(void *)a4;
- (id)evalArray:(id)a3;
- (id)evalCTypesV:(char *)a3;
- (id)evalDict:(id)a3;
- (id)evalNSObjectV:(id)a3;
- (id)evalString:(id)a3;
- (id)fileProtectionClassRequest:(id)a3;
- (int)getAttributeType:(id)a3;
- (void)boundResult:(id)a3;
- (void)buildEvaluateMachineLearningAlgorithm;
- (void)constructVector:(void *)a3 withColumnPosition:(unint64_t)a4 maxColNumber:(unint64_t)a5 withValue:(id)a6;
- (void)dealloc;
- (void)doRemapToFeatureVector:(void *)a3 withPositionID:(unint64_t)a4 withMaxCol:(unint64_t)a5 withValue:(id)a6;
- (void)getModelData;
- (void)setCPMLAlgorithm:(id)a3;
- (void)setCPMLAlgorithmEngine:(id)a3;
@end

@implementation CPMLModelEvaluate

- (CPMLModelEvaluate)initWithModel:(id)a3 withPropertyList:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)CPMLModelEvaluate;
  v8 = [(CPMLModelEvaluate *)&v45 init];
  v9 = v8;
  if (v8)
  {
    v8->shouldFail = 0;
    storageManager = v8->_storageManager;
    v8->_storageManager = 0;

    v9->_delegateEngine = 0;
    v9->_cpmlDelegate = 0;
    delegateAlgorithm = v9->_delegateAlgorithm;
    v9->_delegateAlgorithm = 0;

    if (v7)
    {
      v12 = [v7 objectForKey:@"loggingMode"];
      v13 = v12;
      if (v12
        || (v14 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cpml"],
            [v14 objectForKey:@"loggingMode"],
            v13 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13))
      {
        CPMLLog = CPMLLog::getCPMLLog(v12);
        CPMLLog[10] = [v13 longLongValue];
      }
      v16 = [MEMORY[0x263F08850] defaultManager];
      char v39 = [v16 fileExistsAtPath:v6];

      uint64_t v17 = [v7 objectForKey:@"machineLearningAlgorithm"];
      machineLearningAlgo = v9->machineLearningAlgo;
      v9->machineLearningAlgo = (NSString *)v17;

      if ((v39 & 1) != 0
        || [(NSString *)v9->machineLearningAlgo isEqualToString:@"NB"]
        || [(NSString *)v9->machineLearningAlgo isEqualToString:@"NB_BASE"]
        || [(NSString *)v9->machineLearningAlgo isEqualToString:@"KNN"])
      {
        v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        modelSchema = v9->modelSchema;
        v9->modelSchema = v19;

        [v7 objectForKey:@"schema"];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v42 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = [*(id *)(*((void *)&v41 + 1) + 8 * i) objectForKey:@"HeaderDef"];
              [(NSMutableArray *)v9->modelSchema addObject:v25];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v47 count:16];
          }
          while (v22);
        }

        v9->mapFunction = [v7 objectForKey:@"mapFunction"];
        v26 = [v7 objectForKey:@"keepInMemory"];
        if (v26) {
          v9->keepInMemory = [v26 BOOLValue];
        }
        else {
          v9->keepInMemory = 1;
        }
        v27 = [v7 objectForKey:@"cacheString"];
        if (v27) {
          char v28 = [v27 BOOLValue];
        }
        else {
          char v28 = 0;
        }
        v9->enableCacheString = v28;
        v29 = [[CPMLSchema alloc] initWithPlist:v7];
        cpmlSchema = v9->cpmlSchema;
        v9->cpmlSchema = v29;

        operator new();
      }
      NSLog(&cfstr_DoesNotSupport.isa, v9->machineLearningAlgo);
    }
    else
    {
      NSLog(&cfstr_NoDefaultPlist.isa);
      if (v6)
      {
        id v31 = v6;
        p_db = &v9->db;
        if (!sqlite3_open((const char *)[v31 UTF8String], &v9->db))
        {
          v9->countRows = CPMLsql_getRowCountForTable(*p_db, "sqlite_master WHERE type=\"table\" AND name=\"INDEX0\";");
          uint64_t v33 = [0 objectForKey:@"serializeFunction"];
          serializeFunction = v9->serializeFunction;
          v9->serializeFunction = (NSString *)v33;

          if ([(NSString *)v9->serializeFunction isEqualToString:@"PMML"])
          {
            NSLog(&cfstr_PmmlNotImpleme.isa);
          }
          else
          {
            if (![(NSString *)v9->serializeFunction isEqualToString:@"MMAP"]) {
              operator new();
            }
            NSLog(&cfstr_MmapNotImpleme.isa);
          }
          uint64_t v40 = 0;
          if (v9->countRows)
          {
            (*((void (**)(CPMLSerialization *, char *, const char *, uint64_t, void))v9->trainerCPDeSerializer->var0
             + 8))(v9->trainerCPDeSerializer, (char *)&v40 + 4, "cptrainRows", 1, 0);
            (*((void (**)(CPMLSerialization *, uint64_t *, const char *, uint64_t, void))v9->trainerCPDeSerializer->var0
             + 8))(v9->trainerCPDeSerializer, &v40, "cptrainColumns", 1, 0);
            operator new();
          }
          CPMLsql_createTable(*p_db, "cptrainRows", "cptrainRows INTEGER", 0);
          CPMLsql_createTable(*p_db, "cptrainColumns", "cptrainColumns INTEGER", 0);
          CPMLsql_createTable(*p_db, "cptrainyCol", "cptrainyCol INTEGER", 0);
          CPMLsql_createTable(*p_db, "cpContinousData", "cpContinousData INTEGER", 0);
          CPMLsql_createTable(*p_db, "cpValRemap", "cpValRemap INTEGER", 0);
          CPMLsql_createTable(*p_db, "cptrainCard", "cptrainCard REAL", 0);
          CPMLsql_createTable(*p_db, "cptrainMean", "cptrainMean REAL", 0);
          CPMLsql_createTable(*p_db, "cpSTDev", "cpSTDev REAL", 0);
          CPMLsql_createTable(*p_db, "cpMin", "cpMin REAL", 0);
          CPMLsql_createTable(*p_db, "cpMax", "cpMax REAL", 0);
          CPMLsql_createTable(*p_db, "cacheString", "keyValue TEXT, indexValue INTEGER", 0);
          LODWORD(v40) = [(CPMLSchema *)v9->cpmlSchema getTotalAttributes];
          sprintf(v46, "%d", v40);
          CPMLsql_insertIntoTable(*p_db, "cptrainColumns", "cptrainColumns", v46);
          if ((int)v40 >= 1)
          {
            int v35 = 0;
            int v36 = -10;
            do
            {
              sprintf(v46, "\"EMPTY\",%d", v36);
              CPMLsql_insertIntoTable(*p_db, "cacheString", "keyValue, indexValue", v46);
              ++v35;
              --v36;
            }
            while (v35 < (int)v40);
          }
          operator new();
        }
        NSLog(&cfstr_CannotOpen.isa, v31);
        sqlite3_close(*p_db);
      }
      else
      {
        NSLog(&cfstr_ErrorNoModelPa.isa);
      }
    }
    v37 = 0;
  }
  else
  {
    v37 = (CPMLModelEvaluate *)0;
  }

  return v37;
}

- (void)dealloc
{
  trainerCPDeSerializer = self->trainerCPDeSerializer;
  if (trainerCPDeSerializer) {
    (*((void (**)(CPMLSerialization *, SEL))trainerCPDeSerializer->var0 + 1))(trainerCPDeSerializer, a2);
  }
  cpMLAlgo = self->cpMLAlgo;
  if (cpMLAlgo) {
    (*((void (**)(CPMLAlgorithm *, SEL))cpMLAlgo->var0 + 1))(cpMLAlgo, a2);
  }
  trainerCPStatistics = (CPMLStatistics *)self->trainerCPStatistics;
  if (trainerCPStatistics)
  {
    CPMLStatistics::~CPMLStatistics(trainerCPStatistics);
    MEMORY[0x21669DB80]();
  }
  cpRemapper = (CPMLRemapper *)self->cpRemapper;
  if (cpRemapper)
  {
    CPMLRemapper::~CPMLRemapper(cpRemapper);
    MEMORY[0x21669DB80]();
  }
  cpTuneableData = self->cpTuneableData;
  if (cpTuneableData) {
    MEMORY[0x21669DB80](cpTuneableData, 0x1080C40C4643742);
  }
  v8.receiver = self;
  v8.super_class = (Class)CPMLModelEvaluate;
  [(CPMLModelEvaluate *)&v8 dealloc];
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

- (int)getAttributeType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"BOOLEAN"] & 1) != 0
    || ([v3 isEqualToString:@"INTEGER"] & 1) != 0
    || ([v3 isEqualToString:@"REAL"] & 1) != 0)
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BLOB"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)constructVector:(void *)a3 withColumnPosition:(unint64_t)a4 maxColNumber:(unint64_t)a5 withValue:(id)a6
{
  id v8 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v8;
  }
  else
  {
    objc_msgSend(v8, "componentsSeparatedByString:", @",", a3);
    objc_claimAutoreleasedReturnValue();
  }
  operator new();
}

- (id)evalCTypesV:(char *)a3
{
  return 0;
}

- (id)evalString:(id)a3
{
  int v4 = [a3 componentsSeparatedByString:@" "];
  id v5 = [(CPMLModelEvaluate *)self evalArray:v4];

  return v5;
}

- (id)evalNSObjectV:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = (id *)&v15;
  id v6 = v4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    do
    {
      [v5 addObject:v8];
      v9 = v13++;
      id v10 = *v9;

      id v8 = v10;
    }
    while (v10);
  }
  v11 = [(CPMLModelEvaluate *)self evalArray:v5];

  return v11;
}

- (id)evalArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 <= [(NSMutableArray *)self->modelSchema count]) {
    operator new();
  }
  NSLog(&cfstr_SInputCountGre.isa, "-[CPMLModelEvaluate evalArray:]");

  return 0;
}

- (id)evalDict:(id)a3
{
  id v3 = a3;
  operator new();
}

void __30__CPMLModelEvaluate_evalDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "doRemapToFeatureVector:withPositionID:withMaxCol:withValue:", *(void *)(a1 + 48), (int)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "getColumnPosition:", v6), objc_msgSend(*(id *)(a1 + 40), "count"), v5);
}

- (void)doRemapToFeatureVector:(void *)a3 withPositionID:(unint64_t)a4 withMaxCol:(unint64_t)a5 withValue:(id)a6
{
  id v10 = a6;
  int v11 = *(_DWORD *)(*((void *)self->trainerCPStatistics + 9) + 4 * a4);
  v12 = [(NSMutableArray *)self->modelSchema objectAtIndex:a4];
  if ([(CPMLModelEvaluate *)self getAttributeType:v12])
  {
    if ([(CPMLModelEvaluate *)self getAttributeType:v12] == 1)
    {
      int v13 = ![(CPMLSchema *)self->cpmlSchema matchSubstituteValue:a4 theValue:v10];
      if (!v10) {
        LOBYTE(v13) = 0;
      }
      id v31 = v10;
      if ((v13 & 1) == 0)
      {
        v14 = [(CPMLSchema *)self->cpmlSchema getSubstituteValue:a4];
        id v15 = objc_alloc(NSNumber);
        if (v14) {
          [v14 doubleValue];
        }
        else {
          double v16 = *(double *)(*((void *)self->trainerCPStatistics + 21) + 8 * a4);
        }
        id v31 = (id)[v15 initWithDouble:v16];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v31;
        id v21 = v10;
        id v31 = v22;
        if (v11) {
          goto LABEL_27;
        }
      }
      else
      {
        id v25 = objc_alloc_init(MEMORY[0x263F08A30]);
        [v25 setNumberStyle:1];
        id v22 = [v25 numberFromString:v10];

        id v21 = v10;
        if (v11) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      if ([(CPMLModelEvaluate *)self getAttributeType:v12] == 2)
      {
        vectorPositions = self->vectorPositions;
        v24 = (void *)[objc_alloc(NSNumber) initWithInt:a4];
        [(NSMutableArray *)vectorPositions addObject:v24];

        id v22 = 0;
        id v31 = v10;
        [(CPMLModelEvaluate *)self constructVector:a3 withColumnPosition:a4 maxColNumber:a5 withValue:v10];
        goto LABEL_31;
      }
      id v22 = 0;
      id v31 = v10;
      NSLog(&cfstr_ErrorEvalarray.isa);
      id v21 = v10;
      if (v11) {
        goto LABEL_27;
      }
    }
  }
  else
  {
    BOOL v17 = [(CPMLSchema *)self->cpmlSchema matchSubstituteValue:a4 theValue:v10];
    if (v10) {
      char v18 = v17;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) != 0 || (v19 = v10, [v10 isEqualToString:&stru_26C5111B8]))
    {
      v19 = [(CPMLSchema *)self->cpmlSchema getSubstituteValue:a4];
    }
    cpRemapper = (CPMLRemapper *)self->cpRemapper;
    id v21 = v19;
    id v22 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", (double)(int)CPMLRemapper::remap(cpRemapper, (char *)objc_msgSend(v21, "UTF8String"), a4));
    id v31 = v10;
    if (v11) {
      goto LABEL_27;
    }
  }
  if (!(*((unsigned int (**)(CPMLAlgorithm *))self->cpMLAlgo->var0 + 7))(self->cpMLAlgo))
  {
    id v10 = v21;
    CPMLFeatureVector::insertIntVClass((CPMLFeatureVector *)a3, [v22 intValue]);
    goto LABEL_31;
  }
LABEL_27:
  double v26 = 1.0;
  double v27 = 0.0;
  if (self->mapFunction == 1)
  {
    trainerCPStatistics = self->trainerCPStatistics;
    double v27 = *(double *)(trainerCPStatistics[21] + 8 * a4);
    uint64_t v29 = trainerCPStatistics[24];
    if (*(double *)(v29 + 8 * a4) > 0.0) {
      double v26 = *(double *)(v29 + 8 * a4);
    }
  }
  [v22 doubleValue];
  CPMLFeatureVector::insertRealVClass((CPMLFeatureVector *)a3, (v30 - v27) / v26);
  id v10 = v21;
LABEL_31:
}

- (id)doEvaluate:(void *)a3 withBoundedList:(void *)a4
{
  id v7 = (id)objc_opt_new();
  id v8 = objc_opt_new();
  if (((*((uint64_t (**)(CPMLAlgorithm *, void *, void *))self->cpMLAlgo->var0 + 3))(self->cpMLAlgo, a3, a4) & 0x80000000) != 0)
  {
    v20 = 0;
    goto LABEL_31;
  }
  v9 = [(NSMutableArray *)self->modelSchema objectAtIndex:*((int *)self->trainerCPStatistics + 32)];
  if ([(CPMLModelEvaluate *)self getAttributeType:v9] != 2)
  {
    if ([(CPMLModelEvaluate *)self getAttributeType:v9])
    {
      uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"%f", CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3));
      id v22 = [NSNumber numberWithDouble:CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3)];
      [v8 setObject:v22 forKey:v21];
      [v7 addObject:v8];
    }
    else
    {
      double YHat = CPMLFeatureVector::getYHat((CPMLFeatureVector *)a3);
      id v25 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, llround(YHat), *((_DWORD *)self->trainerCPStatistics + 32));
      double v26 = (void *)[[NSString alloc] initWithCString:v25 encoding:4];
      if (v25) {
        free(v25);
      }
      double v27 = objc_opt_new();
      uint64_t v28 = *((void *)a3 + 10);
      if (*((void *)a3 + 11) == v28)
      {
        if (([v26 isEqual:@"error"] & 1) == 0)
        {
          [v8 setObject:&unk_26C512DD0 forKey:v26];
          [v7 addObject:v8];
        }
        id v7 = v7;

        goto LABEL_30;
      }
      uint64_t v47 = (uint64_t)v26;
      v49 = v9;
      id v51 = v7;
      uint64_t v29 = 0;
      unint64_t v30 = 0;
      do
      {
        uint64_t v31 = v28 + v29;
        int v32 = *(_DWORD *)(v31 + 8);
        uint64_t v33 = [NSNumber numberWithDouble:*(double *)v31];
        v34 = objc_opt_new();

        int v35 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, v32, *((_DWORD *)self->trainerCPStatistics + 32));
        int v36 = (void *)[[NSString alloc] initWithCString:v35 encoding:4];
        [v34 setObject:v33 forKey:v36];

        [v27 addObject:v34];
        if (v35) {
          free(v35);
        }

        ++v30;
        uint64_t v28 = *((void *)a3 + 10);
        v29 += 16;
        id v8 = v34;
      }
      while (v30 < (*((void *)a3 + 11) - v28) >> 4);
      v9 = v49;
      id v22 = v51;
      id v8 = v34;
      id v7 = v27;
      uint64_t v21 = v47;
    }
    id v10 = v7;

    id v7 = (id)v21;
    goto LABEL_28;
  }
  if (*((void *)a3 + 11) != *((void *)a3 + 10))
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v11 = [(CPMLSchema *)self->cpmlSchema getVectorContent:[(CPMLSchema *)self->cpmlSchema getYColumnPosition]];
    uint64_t v12 = *((void *)a3 + 10);
    uint64_t v13 = *((void *)a3 + 11);
    if (v11 == 4)
    {
      if (v13 != v12)
      {
        uint64_t v48 = v9;
        id v50 = v7;
        uint64_t v14 = 0;
        unint64_t v15 = 0;
        double v16 = v8;
        do
        {
          double v17 = *(double *)(v12 + v14);
          id v8 = objc_opt_new();

          char v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lf", *(void *)&v17);
          v19 = [NSNumber numberWithDouble:v17];
          [v8 setObject:v19 forKey:v18];

          [v10 addObject:v8];
          ++v15;
          uint64_t v12 = *((void *)a3 + 10);
          v14 += 16;
          double v16 = v8;
        }
        while (v15 < (*((void *)a3 + 11) - v12) >> 4);
LABEL_27:
        v9 = v48;
        id v7 = v50;
      }
    }
    else if (v13 != v12)
    {
      uint64_t v48 = v9;
      id v50 = v7;
      uint64_t v37 = 0;
      unint64_t v38 = 0;
      char v39 = v8;
      do
      {
        uint64_t v40 = v12 + v37;
        double v41 = *(double *)v40;
        int v42 = *(_DWORD *)(v40 + 8);
        id v8 = objc_opt_new();

        long long v43 = CPMLRemapper::unmap((CPMLRemapper *)self->cpRemapper, v42, [(CPMLSchema *)self->cpmlSchema getYColumnPosition]);
        long long v44 = (void *)[[NSString alloc] initWithCString:v43 encoding:4];
        objc_super v45 = [NSNumber numberWithDouble:v41];
        [v8 setObject:v45 forKey:v44];

        [v10 addObject:v8];
        if (v43) {
          free(v43);
        }

        ++v38;
        uint64_t v12 = *((void *)a3 + 10);
        v37 += 16;
        char v39 = v8;
      }
      while (v38 < (*((void *)a3 + 11) - v12) >> 4);
      goto LABEL_27;
    }
LABEL_28:

    id v23 = v10;
    goto LABEL_29;
  }
  id v23 = v7;
LABEL_29:
  id v7 = v23;
LABEL_30:

  v20 = v7;
LABEL_31:

  return v20;
}

- (void)buildEvaluateMachineLearningAlgorithm
{
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"SVM"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"LIBSVM"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"LINEARSVM"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NB"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NB_BASE"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NAIVE_BAYES"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NAIVE_BAYESV2"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NAIVEBAYES"])
  {
    id v3 = objc_alloc_init(CPMLNaiveBayesStorageManager);
    storageManager = self->_storageManager;
    self->_storageManager = &v3->super;

    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"KMEANS"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"KNN"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"LOGISTIC_REGRESSION"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"REGRESSION_FOREST"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"GAUSSIAN_MIXTURE_MODEL"]) {
    operator new();
  }
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"LINEAR_REGRESSION"]) {
    operator new();
  }
  NSLog(&cfstr_SNoMlAlgoSelec.isa, "-[CPMLModelEvaluate buildEvaluateMachineLearningAlgorithm]");
  self->shouldFail = 1;
}

- (void)boundResult:(id)a3
{
  id v22 = a3;
  unint64_t v4 = 0;
  p_boundedRemappedValues = &self->boundedRemappedValues;
  self->boundedRemappedValues.__end_ = self->boundedRemappedValues.__begin_;
  while (v4 < [v22 count])
  {
    id v6 = [v22 objectAtIndexedSubscript:v4];
    cpRemapper = (CPMLRemapper *)self->cpRemapper;
    id v8 = v6;
    int v9 = CPMLRemapper::remap(cpRemapper, (char *)[v8 UTF8String], *((_DWORD *)self->trainerCPStatistics + 32));
    int v10 = v9;
    end = self->boundedRemappedValues.__end_;
    value = self->boundedRemappedValues.__end_cap_.__value_;
    if (end >= value)
    {
      begin = p_boundedRemappedValues->__begin_;
      uint64_t v15 = end - p_boundedRemappedValues->__begin_;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 62) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = (char *)value - (char *)begin;
      if (v17 >> 1 > v16) {
        unint64_t v16 = v17 >> 1;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&self->boundedRemappedValues.__end_cap_, v18);
        begin = self->boundedRemappedValues.__begin_;
        end = self->boundedRemappedValues.__end_;
      }
      else
      {
        v19 = 0;
      }
      v20 = (int *)&v19[4 * v15];
      int *v20 = v10;
      uint64_t v13 = v20 + 1;
      while (end != begin)
      {
        int v21 = *--end;
        *--v20 = v21;
      }
      self->boundedRemappedValues.__begin_ = v20;
      self->boundedRemappedValues.__end_ = v13;
      self->boundedRemappedValues.__end_cap_.__value_ = (int *)&v19[4 * v18];
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      int *end = v9;
      uint64_t v13 = end + 1;
    }
    self->boundedRemappedValues.__end_ = v13;

    ++v4;
  }
}

- (BOOL)updateModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 getDispatchQueue];
  [v4 flushDB];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CPMLModelEvaluate_updateModel___block_invoke;
  block[3] = &unk_264202248;
  block[6] = v8;
  block[4] = v4;
  block[5] = self;
  dispatch_sync(v5, block);
  operator new();
}

void __33__CPMLModelEvaluate_updateModel___block_invoke()
{
}

void __33__CPMLModelEvaluate_updateModel___block_invoke_2(void *a1)
{
  **(void **)(*(void *)(a1[5] + 8) + 24) = a1[7];
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 72))
  {
    **(unsigned char **)(v2 + 88) = 1;
    (*(void (**)(void, void, void, void))(**(void **)(a1[4] + 72) + 16))(*(void *)(a1[4] + 72), *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(a1[4] + 80), *(void *)(a1[4] + 120));
    uint64_t v3 = a1[4];
    id v4 = *(CPMLStatistics **)(v3 + 104);
    if (v4)
    {
      CPMLStatistics::~CPMLStatistics(v4);
      MEMORY[0x21669DB80]();
      uint64_t v3 = a1[4];
    }
    *(void *)(v3 + 104) = a1[7];
    *(void *)(*(void *)(a1[4] + 88) + 16) = a1[7];
    (*(void (**)(void, void, const char *, const char *, void))(**(void **)(a1[4] + 80) + 160))(*(void *)(a1[4] + 80), *(unsigned int *)(*(void *)(a1[4] + 104) + 120), "cptrainRows", "cptrainRows", 0);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(v5 + 104);
    if (*(int *)(v6 + 124) >= 1)
    {
      uint64_t v7 = 0;
      do
      {
        (*(void (**)(void, const char *, const char *, uint64_t, double))(**(void **)(v5 + 80) + 176))(*(void *)(v5 + 80), "cptrainCard", "cptrainCard", v7, *(double *)(*(void *)(v6 + 144) + 8 * v7));
        (*(void (**)(void, const char *, const char *, uint64_t, double))(**(void **)(a1[4] + 80) + 176))(*(void *)(a1[4] + 80), "cptrainMean", "cptrainMean", v7, *(double *)(*(void *)(*(void *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(void, const char *, const char *, uint64_t, double))(**(void **)(a1[4] + 80) + 176))(*(void *)(a1[4] + 80), "cpSTDev", "cpSTDev", v7, *(double *)(*(void *)(*(void *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(void, const char *, const char *, uint64_t, double))(**(void **)(a1[4] + 80) + 176))(*(void *)(a1[4] + 80), "cpMin", "cpMin", v7, *(double *)(*(void *)(*(void *)(a1[4] + 104) + 144) + 8 * v7));
        (*(void (**)(void, const char *, const char *, uint64_t, double))(**(void **)(a1[4] + 80) + 176))(*(void *)(a1[4] + 80), "cpMax", "cpMax", v7, *(double *)(*(void *)(*(void *)(a1[4] + 104) + 144) + 8 * v7));
        ++v7;
        uint64_t v5 = a1[4];
        uint64_t v6 = *(void *)(v5 + 104);
      }
      while (v7 < *(int *)(v6 + 124));
    }
    **(unsigned char **)(v5 + 88) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    NSLog(&cfstr_SCanTUpdateEmp.isa, "-[CPMLModelEvaluate updateModel:]_block_invoke_2");
  }
}

- (void)setCPMLAlgorithm:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)&self->_delegateAlgorithm, a3);
    if (objc_opt_respondsToSelector())
    {
      storageManager = self->_storageManager;
      if (!storageManager)
      {
        uint64_t v6 = objc_alloc_init(CPMLStorageManager);
        uint64_t v7 = self->_storageManager;
        self->_storageManager = v6;

        storageManager = self->_storageManager;
      }
      [(CPMLAlgorithmProtocol *)self->_delegateAlgorithm initCPMLAlgorithm:storageManager];
      operator new();
    }
  }
}

- (void)setCPMLAlgorithmEngine:(id)a3
{
  id v6 = a3;
  if ([(NSString *)self->machineLearningAlgo isEqualToString:@"NAIVEBAYES"])
  {
    if (!self->_storageManager)
    {
      id v4 = objc_alloc_init(CPMLStorageManager);
      storageManager = self->_storageManager;
      self->_storageManager = v4;
    }
    operator new();
  }
}

- (void)getModelData
{
  return (void *)(*((uint64_t (**)(void))self->cpMLAlgo->var0 + 11))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateAlgorithm, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  begin = self->boundedRemappedValues.__begin_;
  if (begin)
  {
    self->boundedRemappedValues.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->cpmlSchema, 0);
  objc_storeStrong((id *)&self->machineLearningAlgo, 0);
  objc_storeStrong((id *)&self->serializeFunction, 0);
  objc_storeStrong((id *)&self->maxRemoveTrainingRow, 0);
  objc_storeStrong((id *)&self->vectorPositions, 0);

  objc_storeStrong((id *)&self->modelSchema, 0);
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end