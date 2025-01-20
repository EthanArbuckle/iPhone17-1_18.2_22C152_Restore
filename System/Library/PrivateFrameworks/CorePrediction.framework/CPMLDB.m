@interface CPMLDB
+ (id)getConfigurationFromPlist:(id)a3;
- (BOOL)isColumnContinousData:(unsigned int)a3;
- (BOOL)loadStatisticTable;
- (BOOL)logBatchNSArray:(id)a3;
- (BOOL)logBatchNSDictionary:(id)a3;
- (BOOL)logCTypesV:(void *)a3;
- (BOOL)logNSArray:(id)a3;
- (BOOL)logNSDataDouble:(id)a3;
- (BOOL)logNSDataFloat:(id)a3;
- (BOOL)logNSDictionary:(id)a3;
- (BOOL)logNSObjectV:(id)a3;
- (BOOL)reset;
- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6;
- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withPlistPath:(id)a5 withWriteOptions:(int)a6;
- (CPMLDB)initWithDBName:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5;
- (CPMLDB)initWithDBName:(id)a3 withPlistPath:(id)a4 withWriteOptions:(int)a5;
- (CPMLSchema)cpSchema;
- (NSString)dbFileName;
- (double)columnQueryFor:(unsigned int)a3 withQuery:(id)a4;
- (double)getMaxFor:(unsigned int)a3;
- (double)getMeanFor:(unsigned int)a3;
- (double)getMinFor:(unsigned int)a3;
- (double)getStdDevFor:(unsigned int)a3;
- (double)updateStatisticsString:(id)a3 colPosition:(unint64_t)a4;
- (id)addValues:(int)a3;
- (id)extractRow:(id)a3;
- (id)fileProtectionClassRequest:(id)a3;
- (id)getColumnName:(unint64_t)a3;
- (id)getDelegate;
- (id)getDispatchQueue;
- (id)getRemapTable;
- (id)prepInsertStatementForMainTable;
- (int)getSchemaType:(unint64_t)a3;
- (int)getVectorContent:(unint64_t)a3;
- (int)getYColumnPosition;
- (sqlite3)db;
- (unint64_t)getCardinality:(unsigned int)a3;
- (unint64_t)getColumnCount;
- (unint64_t)getCombinedRemapTableCardinality:(unsigned int)a3;
- (unint64_t)getRowCount;
- (void)addColumnToTable:(id)a3 withNewColumn:(id)a4;
- (void)createTable:(id)a3 withSchema:(id)a4 withExistingTable:(BOOL)a5;
- (void)dealloc;
- (void)deleteAllRows:(id)a3;
- (void)deleteRow:(id)a3 whereMatch:(id)a4;
- (void)doInitCommon:(id)a3 withDict:(id)a4 withFileExists:(BOOL *)a5 withWriteOptions:(int)a6;
- (void)doInitialize:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5;
- (void)doInitializeWithDataFile:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6;
- (void)dropCommands:(id)a3;
- (void)execSQLCommand:(id)a3;
- (void)flushDB;
- (void)indexTable:(id)a3 withColumn:(id)a4;
- (void)initMaxSizeStatistics:(unint64_t)a3;
- (void)initStatisticsTable;
- (void)insertIntoTable:(id)a3 withTuple:(id)a4;
- (void)loadTables;
- (void)printFormat:(id)a3;
- (void)queryDatabase:(id)a3 whereMatch:(id)a4;
- (void)removeTrainingRow:(id)a3;
- (void)removeTrainingRowData:(double)a3;
- (void)restart;
- (void)setCPMLAlgorithm:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)updateStatistics;
- (void)updateStatisticsReal:(double)a3 colPosition:(unint64_t)a4;
- (void)updateTable:(id)a3 withAttribute:(id)a4 whereMatch:(id)a5;
@end

@implementation CPMLDB

- (void)initMaxSizeStatistics:(unint64_t)a3
{
  self->maxFieldCount = a3;
  self->rowCount = 0;
  self->repFields = (unint64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->cardinality = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->min = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->max = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->mean = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sumOfX = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sumOfXX = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  self->sigma = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
}

+ (id)getConfigurationFromPlist:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    if (v4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 100;
      v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:&v8 error:&v7];

      goto LABEL_6;
    }
    NSLog(&cfstr_SCannotOpenFil.isa, "+[CPMLDB getConfigurationFromPlist:]");
  }
  v5 = 0;
LABEL_6:

  return v5;
}

- (CPMLDB)initWithDBName:(id)a3 withPlistPath:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPMLDB;
  v11 = [(CPMLDB *)&v17 init];
  if (v11)
  {
    v12 = +[CPMLDB getConfigurationFromPlist:v10];
    if (!v12)
    {
      v15 = 0;
      goto LABEL_6;
    }
    cInfo = v11->_cInfo;
    v11->_cInfo = v12;
    v14 = v12;

    v11->_openCPMLDBOptions = v5;
    objc_storeStrong((id *)&v11->_trainingModelFileAndPath, a3);
    [(CPMLDB *)v11 doInitialize:v9 withConfiguration:v14 withWriteOptions:v5];
  }
  v15 = v11;
LABEL_6:

  return v15;
}

- (CPMLDB)initWithDBName:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPMLDB;
  v11 = [(CPMLDB *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cInfo, a4);
    v12->_openCPMLDBOptions = v5;
    objc_storeStrong((id *)&v12->_trainingModelFileAndPath, a3);
    [(CPMLDB *)v12 doInitialize:v9 withConfiguration:v10 withWriteOptions:v5];
  }

  return v12;
}

- (void)doInitCommon:(id)a3 withDict:(id)a4 withFileExists:(BOOL *)a5 withWriteOptions:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!self->_dispatch_queue)
  {
    v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreprediction.tdb", 0);
    dispatch_queue = self->_dispatch_queue;
    self->_dispatch_queue = v13;
  }
  *(void *)&self->commitCountMax = 1000;
  objc_storeStrong((id *)&self->_dbFileName, a3);
  v15 = [v12 objectForKey:@"loggingMode"];
  v16 = v15;
  if (v15
    || (objc_super v17 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cpml"],
        [v17 objectForKey:@"loggingMode"],
        v16 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16))
  {
    CPMLLog = CPMLLog::getCPMLLog(v15);
    CPMLLog[10] = [v16 longLongValue];
  }
  v19 = [v12 objectForKey:@"commitCountMax"];
  v20 = v19;
  if (v19) {
    unsigned int v21 = [v19 intValue];
  }
  else {
    unsigned int v21 = 100;
  }
  self->commitCountMax = v21;
  v22 = [v12 objectForKey:@"minTimeToLogIndex"];
  v23 = v22;
  if (v22) {
    [v22 doubleValue];
  }
  else {
    double v24 = 86400.0;
  }
  self->minTimeToLogIndex = v24;
  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  vectorListCardinality = self->vectorListCardinality;
  self->vectorListCardinality = v25;

  v27 = (NSMutableString *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"MAIN_TABLE"];
  dbTableName = self->dbTableName;
  self->dbTableName = v27;

  v29 = [[CPMLSchema alloc] initWithPlist:v12];
  cpSchema = self->cpSchema;
  self->cpSchema = v29;

  id v37 = v11;
  if (sqlite3_open((const char *)[v37 UTF8String], &self->db))
  {
    NSLog(&cfstr_CannotOpen.isa, v37);
    sqlite3_close(self->db);
  }
  else
  {
    v31 = [MEMORY[0x263F08850] defaultManager];
    *a5 = [v31 fileExistsAtPath:v37];

    if (!*a5)
    {
      [(CPMLDB *)self createTable:@"version" withSchema:@"version TEXT" withExistingTable:0];
      [(CPMLDB *)self insertIntoTable:@"version" withTuple:@"(version) values(\"1.0.0\");"];
    }
    [(CPMLDB *)self initMaxSizeStatistics:[(CPMLSchema *)self->cpSchema getTotalAttributes]];
    if ((a6 & 0xFFFFFFFD) == 1)
    {
      if (![(CPMLDB *)self loadStatisticTable]) {
        [(CPMLDB *)self initStatisticsTable];
      }
      [(CPMLDB *)self createTable:@"DATEINDEX" withSchema:@"pkeyIndex INTEGER, date REAL" withExistingTable:1];
      v32 = self->dbTableName;
      v33 = [(CPMLSchema *)self->cpSchema schemaHeaderWithType];
      [(CPMLDB *)self createTable:v32 withSchema:v33 withExistingTable:1];
    }
    else
    {
      [(CPMLDB *)self createTable:@"DATEINDEX" withSchema:@"pkeyIndex INTEGER, date REAL" withExistingTable:0];
      v34 = self->dbTableName;
      v33 = [(CPMLSchema *)self->cpSchema schemaHeaderWithType];
      [(CPMLDB *)self createTable:v34 withSchema:v33 withExistingTable:0];
    }

    v35 = self->dbTableName;
    v36 = [(CPMLSchema *)self->cpSchema indexColumnList];
    [(CPMLDB *)self indexTable:v35 withColumn:v36];

    [(CPMLDB *)self loadTables];
  }
}

- (void)doInitialize:(id)a3 withConfiguration:(id)a4 withWriteOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  char v24 = 0;
  [(CPMLDB *)self doInitCommon:v8 withDict:v9 withFileExists:&v24 withWriteOptions:v5];
  id v10 = [v9 objectForKey:@"FileProtection"];
  id v11 = [MEMORY[0x263F08850] defaultManager];
  id v23 = 0;
  id v12 = [v11 attributesOfItemAtPath:v8 error:&v23];
  id v13 = v23;

  uint64_t v14 = *MEMORY[0x263F080A8];
  v15 = [v12 objectForKey:*MEMORY[0x263F080A8]];
  v16 = [(CPMLDB *)self fileProtectionClassRequest:v10];
  if ([v15 isEqualToString:v16] && v24 || !v16)
  {
    id v20 = v13;
  }
  else
  {
    unsigned int v21 = v10;
    objc_super v17 = [NSDictionary dictionaryWithObject:v16 forKey:v14];
    v18 = [MEMORY[0x263F08850] defaultManager];
    id v22 = v13;
    char v19 = [v18 setAttributes:v17 ofItemAtPath:v8 error:&v22];
    id v20 = v22;

    if ((v19 & 1) == 0) {
      NSLog(&cfstr_SCouldNotSetFi.isa, "-[CPMLDB doInitialize:withConfiguration:withWriteOptions:]");
    }

    id v10 = v21;
  }
}

- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withPlistPath:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CPMLDB;
  uint64_t v14 = [(CPMLDB *)&v20 init];
  if (v14)
  {
    v15 = +[CPMLDB getConfigurationFromPlist:v13];
    if (!v15)
    {
      v18 = 0;
      goto LABEL_6;
    }
    cInfo = v14->_cInfo;
    v14->_cInfo = v15;
    objc_super v17 = v15;

    objc_storeStrong((id *)&v14->_trainingFile, a4);
    v14->_openCPMLDBOptions = v6;
    objc_storeStrong((id *)&v14->_trainingModelFileAndPath, a3);
    [(CPMLDB *)v14 doInitializeWithDataFile:v11 dataFromFile:v12 withConfiguration:v17 withWriteOptions:v6];
  }
  v18 = v14;
LABEL_6:

  return v18;
}

- (CPMLDB)initWithDBName:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CPMLDB;
  uint64_t v14 = [(CPMLDB *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cInfo, a5);
    objc_storeStrong((id *)&v15->_trainingFile, a4);
    v15->_openCPMLDBOptions = v6;
    objc_storeStrong((id *)&v15->_trainingModelFileAndPath, a3);
    [(CPMLDB *)v15 doInitializeWithDataFile:v11 dataFromFile:v12 withConfiguration:v13 withWriteOptions:v6];
  }

  return v15;
}

- (void)doInitializeWithDataFile:(id)a3 dataFromFile:(id)a4 withConfiguration:(id)a5 withWriteOptions:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v53 = a4;
  id v11 = a5;
  v67[0] = 0;
  v52 = v10;
  [(CPMLDB *)self doInitCommon:v10 withDict:v11 withFileExists:v67 withWriteOptions:v6];
  v55 = [v11 objectForKey:@"csvType"];
  id v12 = [NSString stringWithContentsOfFile:v53 encoding:4 error:0];
  id v13 = [v12 stringByReplacingOccurrencesOfString:@"\r" withString:@"\n"];

  v51 = v13;
  v56 = [v13 componentsSeparatedByString:@"\n"];
  id v54 = [(CPMLDB *)self prepInsertStatementForMainTable];
  unint64_t v14 = 0;
  id v58 = v11;
  v60 = self;
  while ([v56 count] - 1 > v14)
  {
    unint64_t v57 = v14;
    ppStmt = 0;
    db = self->db;
    id v16 = v54;
    uint64_t v17 = sqlite3_prepare_v2(db, (const char *)[v16 UTF8String], objc_msgSend(v16, "length"), &ppStmt, 0);
    if (v17) {
      NSLog(&cfstr_SPrepareFailRe.isa, "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", v17);
    }
    if ([v55 isEqualToString:@"TAB"])
    {
      v18 = [v56 objectAtIndex:v57];
      uint64_t v19 = [v18 componentsSeparatedByString:@"\t"];
LABEL_9:
      objc_super v20 = (void *)v19;

      goto LABEL_11;
    }
    if ([v55 isEqualToString:@"COMMA"])
    {
      v18 = [v56 objectAtIndex:v57];
      uint64_t v19 = [v18 componentsSeparatedByString:@","];
      goto LABEL_9;
    }
    objc_super v20 = 0;
LABEL_11:
    uint64_t v21 = [v20 count];
    if (v21 != [(CPMLSchema *)v60->cpSchema getTotalAttributes])
    {
      NSLog(&cfstr_SIncorrectAttr.isa, "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", -[CPMLSchema getTotalAttributes](v60->cpSchema, "getTotalAttributes"), [v20 count]);

      goto LABEL_47;
    }
    for (unint64_t i = 0; ; ++i)
    {
      self = v60;
      if (i >= [v20 count]) {
        break;
      }
      id v23 = [v20 objectAtIndex:i];
      char v24 = [(CPMLSchema *)v60->cpSchema matchSubstituteValue:i theValue:v23];
      if (v23) {
        char v25 = v24;
      }
      else {
        char v25 = 1;
      }
      if ((v25 & 1) != 0 || [v23 isEqualToString:&stru_26C5111B8])
      {
        v26 = [(CPMLSchema *)v60->cpSchema getSubstituteValue:i];
      }
      else
      {
        v26 = v23;
      }
      if ([(CPMLSchema *)v60->cpSchema isStringType:i])
      {
        sqlite3_bind_text(ppStmt, i + 1, (const char *)[v26 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else if ([(CPMLSchema *)v60->cpSchema isVectorType:i])
      {
        char v65 = 83;
        id v27 = objc_alloc_init(MEMORY[0x263EFF990]);
        v59 = objc_msgSend([NSString alloc], "initWithFormat:", @"key%d", i);
        id v28 = [(NSMutableDictionary *)v60->vectorListCardinality objectForKey:v59];
        [v27 appendBytes:&v65 length:1];
        if (!v28)
        {
          id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          -[NSMutableDictionary setObject:forKey:](v60->vectorListCardinality, "setObject:forKey:");
        }
        v29 = [v26 componentsSeparatedByString:@","];
        uint64_t v64 = 0;
        uint64_t v64 = [v29 count];
        [v27 appendBytes:&v64 length:8];
        for (unint64_t j = 0; j < [v29 count]; ++j)
        {
          v31 = [v29 objectAtIndex:j];
          v32 = [v28 objectForKey:v31];
          if (!v32)
          {
            v33 = (void *)[objc_alloc(NSNumber) initWithBool:1];
            [v28 setObject:v33 forKey:v31];
          }
          uint64_t v63 = 0;
          uint64_t v63 = [v31 length] + 1;
          [v27 appendBytes:&v63 length:8];
          id v34 = v31;
          uint64_t v35 = [v34 UTF8String];
          [v27 appendBytes:v35 length:v63];
        }
        id v37 = ppStmt;
        id v38 = v27;
        sqlite3_bind_blob(v37, i + 1, (const void *)[v38 mutableBytes], objc_msgSend(v38, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

        id v11 = v58;
      }
      else
      {
        [(CPMLDB *)v60 updateStatisticsString:v26 colPosition:i];
        sqlite3_bind_double(ppStmt, i + 1, v36);
      }
    }
    uint64_t v39 = sqlite3_step(ppStmt);
    if (v39 == 101) {
      ++v60->rowCount;
    }
    else {
      NSLog(&cfstr_SErrorIteratin.isa, "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]", v39);
    }
    sqlite3_finalize(ppStmt);

    unint64_t v14 = v57 + 1;
  }
  [(CPMLDB *)self initStatisticsTable];
  [(CPMLDB *)self updateStatistics];
  v40 = [v11 objectForKey:@"FileProtection"];
  v41 = [MEMORY[0x263F08850] defaultManager];
  id v62 = 0;
  v42 = [v41 attributesOfItemAtPath:v52 error:&v62];
  id v43 = v62;

  uint64_t v44 = *MEMORY[0x263F080A8];
  v45 = [v42 objectForKey:*MEMORY[0x263F080A8]];
  v46 = [(CPMLDB *)v60 fileProtectionClassRequest:v40];
  if ([v45 isEqualToString:v46] && v67[0] || !v46)
  {
    id v50 = v43;
  }
  else
  {
    v47 = [NSDictionary dictionaryWithObject:v46 forKey:v44];
    v48 = [MEMORY[0x263F08850] defaultManager];
    id v61 = v43;
    char v49 = [v48 setAttributes:v47 ofItemAtPath:v52 error:&v61];
    id v50 = v61;

    if ((v49 & 1) == 0) {
      NSLog(&cfstr_SCouldNotSetFi.isa, "-[CPMLDB doInitializeWithDataFile:dataFromFile:withConfiguration:withWriteOptions:]");
    }
  }
LABEL_47:
}

- (void)loadTables
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"select date from %@ ORDER BY pkey DESC LIMIT 1;",
                 @"DATEINDEX");
  ppStmt = 0;
  db = self->db;
  id v5 = v3;
  if (sqlite3_prepare_v2(db, (const char *)[v5 UTF8String], objc_msgSend(v5, "length"), &ppStmt, 0)) {
    NSLog(&cfstr_SPrepareFail.isa, "-[CPMLDB loadTables]");
  }
  uint64_t v6 = sqlite3_step(ppStmt);
  if (v6 != 101)
  {
    if (v6 == 100) {
      self->currentTimeInterval = sqlite3_column_double(ppStmt, 0);
    }
    else {
      NSLog(&cfstr_Columnqueryfor.isa, v6);
    }
  }
  sqlite3_finalize(ppStmt);
}

- (void)dealloc
{
  [(CPMLDB *)self restart];
  v3.receiver = self;
  v3.super_class = (Class)CPMLDB;
  [(CPMLDB *)&v3 dealloc];
}

- (void)restart
{
  db = self->db;
  if (db) {
    sqlite3_close(db);
  }
  repFields = self->repFields;
  if (repFields) {
    free(repFields);
  }
  cardinality = self->cardinality;
  if (cardinality) {
    free(cardinality);
  }
  min = self->min;
  if (min) {
    free(min);
  }
  max = self->max;
  if (max) {
    free(max);
  }
  mean = self->mean;
  if (mean) {
    free(mean);
  }
  sumOfX = self->sumOfX;
  if (sumOfX) {
    free(sumOfX);
  }
  sumOfXX = self->sumOfXX;
  if (sumOfXX) {
    free(sumOfXX);
  }
  sigma = self->sigma;
  if (sigma) {
    free(sigma);
  }
  self->maxFieldCount = 0;
  *(void *)&self->commitCountMax = 0;
  self->rowCount = 0;
  cpSchema = self->cpSchema;
  self->cpSchema = 0;

  indexer = self->indexer;
  self->indexer = 0;

  vectorListCardinality = self->vectorListCardinality;
  self->vectorListCardinality = 0;

  dbTableName = self->dbTableName;
  self->dbTableName = 0;

  self->currentTimeInterval = 0.0;
  self->minTimeToLogIndex = 0.0;
}

- (void)flushDB
{
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__CPMLDB_flushDB__block_invoke;
  block[3] = &unk_2642022E8;
  block[4] = self;
  dispatch_sync(dispatch_queue, block);
}

void __17__CPMLDB_flushDB__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 28))
  {
    errmsg = 0;
    objc_super v3 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v1 + 192), "END TRANSACTION;",
                      (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                      0,
                      &errmsg);
    if (v3)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v3);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB flushDB]_block_invoke", "SQL End TransactionError %s.", errmsg);
      sqlite3_free(errmsg);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 28) = 0;
  }
}

- (id)prepInsertStatementForMainTable
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"INSERT INTO MAIN_TABLE VALUES(");
  uint64_t v4 = [(CPMLSchema *)self->cpSchema getTotalAttributes];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if (v4 <= ++v5) {
        uint64_t v6 = @"?";
      }
      else {
        uint64_t v6 = @"?,";
      }
      [v3 appendString:v6];
    }
    while (v4 != v5);
  }
  [v3 appendString:@", $pKey;"]);

  return v3;
}

- (BOOL)logCTypesV:(void *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v15 = (int **)&v16;
  uint64_t v6 = 0;
  if (a3)
  {
    uint64_t v7 = (int *)a3;
    do
    {
      if ((unint64_t)a3 >= 2)
      {
        id v8 = [(CPMLSchema *)self->cpSchema getColumnName:v6];
        int v9 = [(CPMLSchema *)self->cpSchema getSchemaType:v6];
        switch(v9)
        {
          case 3:
            uint64_t v10 = [objc_alloc(NSNumber) initWithInteger:*v7];
            break;
          case 4:
            uint64_t v10 = [objc_alloc(NSNumber) initWithDouble:*(double *)v7];
            break;
          case 5:
            uint64_t v10 = [[NSString alloc] initWithCString:v7 encoding:4];
            break;
          default:
            NSLog(&cfstr_SNoSupport.isa, "-[CPMLDB logCTypesV:]");

LABEL_15:
            BOOL v13 = 0;
            goto LABEL_16;
        }
        id v11 = (void *)v10;
        [v5 setObject:v10 forKey:v8];
        ++v6;
      }
      id v12 = v15++;
      uint64_t v7 = *v12;
    }
    while (*v12);
  }
  if (v6 != [(CPMLSchema *)self->cpSchema getTotalAttributes])
  {
    NSLog(&cfstr_SColumnCountDo.isa, "-[CPMLDB logCTypesV:]");
    goto LABEL_15;
  }
  BOOL v13 = [(CPMLDB *)self logNSDictionary:v5];
LABEL_16:

  return v13;
}

- (BOOL)logNSObjectV:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v15 = (id *)&v16;
  id v6 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  if (v6)
  {
    int v9 = v6;
    do
    {
      uint64_t v10 = [(CPMLSchema *)self->cpSchema getColumnName:v8];
      [v5 setObject:v9 forKey:v10];
      ++v8;

      id v11 = v15++;
      id v12 = *v11;

      int v9 = v12;
    }
    while (v12);
  }
  if ([(CPMLSchema *)self->cpSchema getTotalAttributes] != v8 + 1)
  {
    NSLog(&cfstr_SInsufficientP.isa, "-[CPMLDB logNSObjectV:]");
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  if (v8 != [(CPMLSchema *)self->cpSchema getTotalAttributes])
  {
    NSLog(&cfstr_SColumnCountDo.isa, "-[CPMLDB logNSObjectV:]");
    goto LABEL_9;
  }
  BOOL v13 = [(CPMLDB *)self logNSDictionary:v5];
LABEL_10:

  return v13;
}

- (BOOL)logNSArray:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 <= [(CPMLSchema *)self->cpSchema getTotalAttributes])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v9 = [v4 count];
      cpSchema = self->cpSchema;
      if (i >= v9) {
        break;
      }
      id v11 = [(CPMLSchema *)cpSchema getColumnName:i];
      id v12 = [v4 objectAtIndex:i];
      [v7 setObject:v12 forKey:v11];
    }
    uint64_t v13 = [(CPMLSchema *)cpSchema getTotalAttributes];
    if (v13 == [v4 count])
    {
      BOOL v6 = [(CPMLDB *)self logNSDictionary:v7];
    }
    else
    {
      NSLog(&cfstr_SInsufficientP.isa, "-[CPMLDB logNSArray:]");
      BOOL v6 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_SErrorCannotLo.isa, "-[CPMLDB logNSArray:]");
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)logBatchNSArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (![(CPMLDB *)self logNSArray:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          NSLog(&cfstr_SFailedToBatch.isa, "-[CPMLDB logBatchNSArray:]");
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)logNSDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  dispatch_queue = self->_dispatch_queue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __26__CPMLDB_logNSDictionary___block_invoke;
  uint64_t v16 = &unk_264202298;
  uint64_t v17 = self;
  id v6 = v4;
  id v18 = v6;
  uint64_t v19 = &v20;
  dispatch_sync(dispatch_queue, &block);
  [(CPMLDB *)self initStatisticsTable];
  [(CPMLDB *)self updateStatistics];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v8 = v7;
  if (v7 > self->currentTimeInterval + self->minTimeToLogIndex)
  {
    self->currentTimeInterval = v7;
    id v9 = [NSString alloc];
    long long v10 = objc_msgSend(v9, "initWithFormat:", @"(%@) VALUES(%d,%f);",
                    @"pKeyIndex, date",
                    self->rowCount,
                    *(void *)&v8,
                    block,
                    v14,
                    v15,
                    v16,
                    v17);
    [(CPMLDB *)self insertIntoTable:@"DATEINDEX" withTuple:v10];
  }
  char v11 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __26__CPMLDB_logNSDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 28))
  {
    ppStmt = 0;
    double v7 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v2 + 192), "BEGIN TRANSACTION;",
                      (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                      0,
                      (char **)&ppStmt);
    if (v7)
    {
      CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v7);
      CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB logNSDictionary:]_block_invoke", "SQL Begin TransactionError %s.", (const char *)ppStmt);
      sqlite3_free(ppStmt);
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = [*(id *)(v2 + 96) getTotalAttributes];
  if (v3 != [*(id *)(a1 + 40) count])
  {
    NSLog(&cfstr_SInsufficientP.isa, "-[CPMLDB logNSDictionary:]_block_invoke");
    return;
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 32);
  id v4 = [*(id *)(a1 + 32) prepInsertStatementForMainTable];
  ppStmt = 0;
  uint64_t v5 = *(sqlite3 **)(*(void *)(a1 + 32) + 192);
  id v6 = v4;
  if (!sqlite3_prepare_v2(v5, (const char *)[v6 UTF8String], objc_msgSend(v6, "length"), &ppStmt, 0))
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __26__CPMLDB_logNSDictionary___block_invoke_2;
    v15[3] = &unk_264202310;
    id v9 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    v15[5] = ppStmt;
    [v9 enumerateKeysAndObjectsUsingBlock:v15];
    uint64_t v10 = sqlite3_step(ppStmt);
    if (v10 != 101)
    {
      --*(_DWORD *)(*(void *)(a1 + 32) + 32);
      NSLog(&cfstr_SErrorIteratin.isa, "-[CPMLDB logNSDictionary:]_block_invoke", v10);
      goto LABEL_16;
    }
    sqlite3_finalize(ppStmt);
    ++*(_DWORD *)(*(void *)(a1 + 32) + 28);
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v11 + 28) == *(_DWORD *)(v11 + 24))
    {
      errmsg = 0;
      long long v12 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(v11 + 192), "END TRANSACTION;",
                         (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse,
                         0,
                         &errmsg);
      if (v12)
      {
        long long v13 = (pthread_mutex_t *)CPMLLog::getCPMLLog(v12);
        CPMLLog::log(v13, CPML_LOG_ERR, "-[CPMLDB logNSDictionary:]_block_invoke", "SQL End TransactionError %s.", errmsg);
        sqlite3_free(errmsg);
        goto LABEL_16;
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 28) = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_16;
  }
  NSLog(&cfstr_SPrepareFail.isa, "-[CPMLDB logNSDictionary:]_block_invoke");
LABEL_16:
}

void __26__CPMLDB_logNSDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 96) getColumnPosition:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [*(id *)(*(void *)(a1 + 32) + 96) matchSubstituteValue:(int)v7 theValue:v6];
    if (v6) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if ((v9 & 1) != 0 || [v6 isEqualToString:&stru_26C5111B8])
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 96) getSubstituteValue:(int)v7];

      id v6 = (id)v10;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 96) isStringType:(int)v7])
    {
      uint64_t v11 = *(sqlite3_stmt **)(a1 + 40);
      id v6 = v6;
      sqlite3_bind_text(v11, v7 + 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      NSLog(&cfstr_SStringIncorre.isa, "-[CPMLDB logNSDictionary:]_block_invoke_2");
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [*(id *)(*(void *)(a1 + 32) + 96) matchSubstituteValue:(int)v7 theValue:v6] ^ 1;
      if (!v6) {
        LOBYTE(v12) = 0;
      }
      if ((v12 & 1) == 0)
      {
        long long v13 = [*(id *)(*(void *)(a1 + 32) + 96) getSubstituteValue:(int)v7];
        id v14 = objc_alloc(NSNumber);
        if (v13) {
          [v13 doubleValue];
        }
        else {
          double v15 = *(double *)(*(void *)(*(void *)(a1 + 32) + 64) + 8 * (int)v7);
        }
        uint64_t v24 = [v14 initWithDouble:v15];

        id v6 = (id)v24;
      }
      char v25 = *(void **)(a1 + 32);
      [v6 doubleValue];
      objc_msgSend(v25, "updateStatisticsReal:colPosition:", (int)v7);
      if ([*(id *)(*(void *)(a1 + 32) + 96) isRealType:(int)v7])
      {
        v26 = *(sqlite3_stmt **)(a1 + 40);
        [v6 doubleValue];
        sqlite3_bind_double(v26, v7 + 1, v27);
      }
      else if ([*(id *)(*(void *)(a1 + 32) + 96) isIntType:(int)v7])
      {
        sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), v7 + 1, [v6 unsignedIntValue]);
      }
      else
      {
        NSLog(&cfstr_SNsnumberIncor.isa, "-[CPMLDB logNSDictionary:]_block_invoke_2");
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([*(id *)(*(void *)(a1 + 32) + 96) isVectorType:(int)v7])
        {
          if ([*(id *)(*(void *)(a1 + 32) + 96) getVectorContent:(int)v7] == 5)
          {
            char v33 = 83;
            id v16 = objc_alloc_init(MEMORY[0x263EFF990]);
            v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"key%d", v7);
            id v17 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKey:v30];
            [v16 appendBytes:&v33 length:1];
            if (!v17)
            {
              id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "setObject:forKey:");
            }
            uint64_t v32 = [v6 count];
            [v16 appendBytes:&v32 length:8];
            for (unint64_t i = 0; i < [v6 count]; ++i)
            {
              uint64_t v19 = [v6 objectAtIndex:i];
              uint64_t v20 = [v17 objectForKey:v19];
              if (!v20)
              {
                uint64_t v21 = (void *)[objc_alloc(NSNumber) initWithBool:1];
                [v17 setObject:v21 forKey:v19];
              }
              uint64_t v31 = 0;
              uint64_t v31 = [v19 length] + 1;
              [v16 appendBytes:&v31 length:8];
              id v22 = v19;
              uint64_t v23 = [v22 UTF8String];
              [v16 appendBytes:v23 length:v31];
            }
            id v28 = *(sqlite3_stmt **)(a1 + 40);
            id v29 = v16;
            sqlite3_bind_blob(v28, v7 + 1, (const void *)[v29 mutableBytes], objc_msgSend(v29, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            NSLog(&cfstr_SVtypeNotSuppo.isa, "-[CPMLDB logNSDictionary:]_block_invoke_2");
          }
        }
        else
        {
          NSLog(&cfstr_SVectorIncorre.isa, "-[CPMLDB logNSDictionary:]_block_invoke_2");
        }
      }
      else
      {
        NSLog(&cfstr_SUnknownClass.isa, "-[CPMLDB logNSDictionary:]_block_invoke_2");
      }
    }
  }
}

- (BOOL)logBatchNSDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (![(CPMLDB *)self logNSDictionary:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          NSLog(&cfstr_SFailedToBatch.isa, "-[CPMLDB logBatchNSDictionary:]");
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)logNSDataFloat:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPMLSchema *)self->cpSchema getTotalAttributes];
  if (v5 == (unint64_t)[v4 length] >> 2 && objc_msgSend(v4, "length"))
  {
    uint64_t v6 = objc_opt_new();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __25__CPMLDB_logNSDataFloat___block_invoke;
    v10[3] = &unk_264202338;
    id v7 = v6;
    id v11 = v7;
    [v4 enumerateByteRangesUsingBlock:v10];
    BOOL v8 = [(CPMLDB *)self logNSArray:v7];
  }
  else
  {
    NSLog(&cfstr_SNumberOfAttri.isa, "-[CPMLDB logNSDataFloat:]", -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"), (unint64_t)[v4 length] >> 2);
    BOOL v8 = 0;
  }

  return v8;
}

void __25__CPMLDB_logNSDataFloat___block_invoke(uint64_t a1, _DWORD *a2, double a3, uint64_t a4, char a5)
{
  if ((a5 & 3) == 0)
  {
    unint64_t v5 = *(void **)(a1 + 32);
    LODWORD(a3) = *a2;
    id v6 = [NSNumber numberWithFloat:a3];
    objc_msgSend(v5, "addObject:");
  }
}

- (BOOL)logNSDataDouble:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPMLSchema *)self->cpSchema getTotalAttributes];
  if (v5 == (unint64_t)[v4 length] >> 3 && objc_msgSend(v4, "length"))
  {
    id v6 = objc_opt_new();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __26__CPMLDB_logNSDataDouble___block_invoke;
    v10[3] = &unk_264202338;
    id v7 = v6;
    id v11 = v7;
    [v4 enumerateByteRangesUsingBlock:v10];
    BOOL v8 = [(CPMLDB *)self logNSArray:v7];
  }
  else
  {
    NSLog(&cfstr_SNumberOfAttri.isa, "-[CPMLDB logNSDataDouble:]", -[CPMLSchema getTotalAttributes](self->cpSchema, "getTotalAttributes"), (unint64_t)[v4 length] >> 3);
    BOOL v8 = 0;
  }

  return v8;
}

void __26__CPMLDB_logNSDataDouble___block_invoke(uint64_t a1, double *a2, uint64_t a3, char a4)
{
  if ((a4 & 7) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithDouble:*a2];
    objc_msgSend(v4, "addObject:");
  }
}

- (void)execSQLCommand:(id)a3
{
  id v4 = a3;
  dispatch_queue = self->_dispatch_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__CPMLDB_execSQLCommand___block_invoke;
  v7[3] = &unk_264202270;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatch_queue, v7);
}

void __25__CPMLDB_execSQLCommand___block_invoke(uint64_t a1)
{
  errmsg = 0;
  uint64_t v1 = (CPMLLog *)sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 32) + 192), (const char *)[*(id *)(a1 + 40) UTF8String], (int (__cdecl *)(void *, int, char **, char **))callbackDBResponse, *(void **)(a1 + 32), &errmsg);
  if (v1)
  {
    CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v1);
    CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB execSQLCommand:]_block_invoke", "SQL error: %s \n", errmsg);
    sqlite3_free(errmsg);
  }
}

- (void)createTable:(id)a3 withSchema:(id)a4 withExistingTable:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if (v5) {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"CREATE TABLE IF NOT EXISTS %@ (%@, pKey INTEGER PRIMARY KEY);",
  }
           v11,
           v8);
  else {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"DROP TABLE IF EXISTS %@; CREATE TABLE %@ (%@, pKey INTEGER PRIMARY KEY);",
  }
           v11,
           v11,
           v8);
  long long v10 = (void *)v9;
  [(CPMLDB *)self execSQLCommand:v9];
}

- (void)addColumnToTable:(id)a3 withNewColumn:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@", v8, v6];
  [(CPMLDB *)self execSQLCommand:v7];
}

- (void)insertIntoTable:(id)a3 withTuple:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"INSERT INTO %@ %@ ;", v8, v6];
  [(CPMLDB *)self execSQLCommand:v7];
}

- (void)queryDatabase:(id)a3 whereMatch:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"SELECT * from %@ WHERE %@", v8, v6];
  [(CPMLDB *)self execSQLCommand:v7];
}

- (void)updateTable:(id)a3 withAttribute:(id)a4 whereMatch:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"UPDATE %@ set %@ %@", v11, v8, v9];
  [(CPMLDB *)self execSQLCommand:v10];
}

- (void)deleteRow:(id)a3 whereMatch:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"DELETE from %@ where %@", v8, v6];
  [(CPMLDB *)self execSQLCommand:v7];
}

- (void)deleteAllRows:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[[NSString alloc] initWithFormat:@"DELETE from %@", v5];
  [(CPMLDB *)self execSQLCommand:v4];
}

- (void)dropCommands:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@" DROP TABLE IF EXISTS %@ ;", v5];
  [(CPMLDB *)self execSQLCommand:v4];
}

- (unint64_t)getCombinedRemapTableCardinality:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = [(CPMLSchema *)self->cpSchema nsRemapTable];
  unint64_t v6 = [v5 count];
  uint64_t v7 = v3;

  if (v6 >= v3)
  {
    unint64_t v8 = 0;
  }
  else
  {
    NSLog(&cfstr_SAttributePosG.isa, "-[CPMLDB getCombinedRemapTableCardinality:]");
    unint64_t v8 = [(CPMLDB *)self getCardinality:v3];
  }
  id v9 = objc_opt_new();
  long long v10 = [(CPMLSchema *)self->cpSchema nsRemapTable];
  id v11 = [v10 objectAtIndexedSubscript:v7];

  for (unint64_t i = 0; ; ++i)
  {
    long long v13 = [(CPMLSchema *)self->cpSchema nsRemapTable];
    unint64_t v14 = [v13 count];

    if (v14 <= i) {
      break;
    }
    uint64_t v15 = [(CPMLSchema *)self->cpSchema nsRemapTable];
    id v16 = [v15 objectAtIndexedSubscript:i];

    LODWORD(v15) = [v11 intValue];
    if (v15 == [v16 intValue])
    {
      id v17 = (void *)[objc_alloc(NSNumber) initWithInt:i];
      [v9 addObject:v17];
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        v8 += -[CPMLDB getCardinality:](self, "getCardinality:", [*(id *)(*((void *)&v23 + 1) + 8 * v21++) intValue]);
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  return v8;
}

- (unint64_t)getCardinality:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  dispatch_queue = self->_dispatch_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__CPMLDB_getCardinality___block_invoke;
  block[3] = &unk_264202360;
  block[4] = self;
  void block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(dispatch_queue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __25__CPMLDB_getCardinality___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 96) getUserDefinedCategoricalDataCount:*(unsigned int *)(a1 + 48)];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 96) isVectorType:*(unsigned int *)(a1 + 48)])
  {
    id v10 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"key%d", *(unsigned int *)(a1 + 48));
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "objectForKey:");
    uint64_t v3 = v2;
    if (v2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];

      return;
    }
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"select cardinality from STATISTICS where rowid=%u;",
           (*(_DWORD *)(a1 + 48) + 1));
  }
  else
  {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 96) attribute];
    id v10 = [v4 objectAtIndex:*(unsigned int *)(a1 + 48)];

    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"select count (DISTINCT %@) from MAIN_TABLE;",
           v10);
  }
  unint64_t v6 = (void *)v5;

  ppStmt = 0;
  unsigned int v7 = *(sqlite3 **)(*(void *)(a1 + 32) + 192);
  id v8 = v6;
  if (sqlite3_prepare_v2(v7, (const char *)[v8 UTF8String], objc_msgSend(v8, "length"), &ppStmt, 0)) {
    NSLog(&cfstr_SGetcardinalit.isa, "-[CPMLDB getCardinality:]_block_invoke", [v8 UTF8String]);
  }
  uint64_t v9 = sqlite3_step(ppStmt);
  if (v9 != 101)
  {
    if (v9 == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
    }
    else {
      NSLog(&cfstr_Getcardinality.isa, v9);
    }
  }
  sqlite3_finalize(ppStmt);
}

- (unint64_t)getColumnCount
{
  return [(CPMLSchema *)self->cpSchema getTotalAttributes];
}

- (unint64_t)getRowCount
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatch_queue = self->_dispatch_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__CPMLDB_getRowCount__block_invoke;
  v5[3] = &unk_2642022C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatch_queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__CPMLDB_getRowCount__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 192), "SELECT COUNT (*) FROM MAIN_TABLE;",
         33,
         &ppStmt,
         0))
  {
    NSLog(&cfstr_GetrowcountPre.isa);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  if (v2 != 101)
  {
    if (v2 == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
    }
    else {
      NSLog(&cfstr_Getindexvaluew.isa, v2);
    }
  }
  return sqlite3_finalize(ppStmt);
}

- (double)getMeanFor:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CPMLSchema *)self->cpSchema attribute];
  uint64_t v6 = [v5 objectAtIndex:v3];

  unsigned int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT AVG (%@) FROM MAIN_TABLE;",
                 v6);
  [(CPMLDB *)self columnQueryFor:v3 withQuery:v7];
  double v9 = v8;

  return v9;
}

- (double)getStdDevFor:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CPMLSchema *)self->cpSchema attribute];
  uint64_t v6 = [v5 objectAtIndex:v3];

  unsigned int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT AVG((MAIN_TABLE.%@-sub.a)*(MAIN_TABLE.%@-sub.a)) as var from MAIN_TABLE, (SELECT AVG(%@) AS a FROM MAIN_TABLE) AS sub;",
                 v6,
                 v6,
                 v6);
  [(CPMLDB *)self columnQueryFor:v3 withQuery:v7];
  double v9 = sqrt(v8);

  return v9;
}

- (double)getMinFor:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CPMLSchema *)self->cpSchema attribute];
  uint64_t v6 = [v5 objectAtIndex:v3];

  unsigned int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT MIN(%@) from MAIN_TABLE;",
                 v6);
  [(CPMLDB *)self columnQueryFor:v3 withQuery:v7];
  double v9 = v8;

  return v9;
}

- (double)getMaxFor:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CPMLSchema *)self->cpSchema attribute];
  uint64_t v6 = [v5 objectAtIndex:v3];

  unsigned int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT MAX(%@) from MAIN_TABLE;",
                 v6);
  [(CPMLDB *)self columnQueryFor:v3 withQuery:v7];
  double v9 = v8;

  return v9;
}

- (double)columnQueryFor:(unsigned int)a3 withQuery:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CPMLSchema *)self->cpSchema attribute];
  unint64_t v8 = [v7 count];

  if (v8 >= a3)
  {
    uint64_t v15 = 0;
    id v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    dispatch_queue = self->_dispatch_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__CPMLDB_columnQueryFor_withQuery___block_invoke;
    block[3] = &unk_264202298;
    block[4] = self;
    id v13 = v6;
    unint64_t v14 = &v15;
    dispatch_sync(dispatch_queue, block);
    double v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    NSLog(&cfstr_Columnqueryfor_0.isa);
    double v9 = 1.79769313e308;
  }

  return v9;
}

uint64_t __35__CPMLDB_columnQueryFor_withQuery___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 192), (const char *)[*(id *)(a1 + 40) UTF8String], objc_msgSend(*(id *)(a1 + 40), "length"), &ppStmt, 0))
  {
    NSLog(&cfstr_Columnqueryfor_1.isa);
  }
  uint64_t v2 = sqlite3_step(ppStmt);
  if (v2 != 101)
  {
    if (v2 == 100) {
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_double(ppStmt, 0);
    }
    else {
      NSLog(&cfstr_Columnqueryfor.isa, v2);
    }
  }
  return sqlite3_finalize(ppStmt);
}

- (BOOL)isColumnContinousData:(unsigned int)a3
{
  return [(CPMLSchema *)self->cpSchema isColumnContinous:*(void *)&a3];
}

- (void)updateStatisticsReal:(double)a3 colPosition:(unint64_t)a4
{
  mean = self->mean;
  sumOfX = self->sumOfX;
  sumOfX[a4] = sumOfX[a4] + a3;
  sumOfXX = self->sumOfXX;
  double v9 = sumOfXX[a4];
  sumOfXX[a4] = v9 + a3 * a3;
  LODWORD(v9) = self->rowCount;
  double v10 = (double)*(unint64_t *)&v9 + 1.0;
  double v11 = sumOfX[a4] / v10;
  mean[a4] = v11;
  double v12 = sumOfXX[a4] / v10 - v11 * v11;
  if (v12 < 0.0)
  {
    NSLog(&cfstr_SVeSigma2.isa, a2, "-[CPMLDB updateStatisticsReal:colPosition:]");
    double v12 = 1.0;
  }
  self->sigma[a4] = sqrt(v12);
}

- (double)updateStatisticsString:(id)a3 colPosition:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v7 setNumberStyle:1];
    unint64_t v8 = [v7 numberFromString:v6];
  }
  else
  {
    unint64_t v8 = (void *)[objc_alloc(NSNumber) initWithDouble:self->mean[a4]];
  }
  [v8 doubleValue];
  -[CPMLDB updateStatisticsReal:colPosition:](self, "updateStatisticsReal:colPosition:", a4);
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (void)initStatisticsTable
{
  [(CPMLDB *)self dropCommands:@"STATISTICS"];

  [(CPMLDB *)self createTable:@"STATISTICS" withSchema:@"cardinality REAL, mean REAL, sumofX REAL, sumofXX REAL, sigma REAL, min REAL, max REAL" withExistingTable:0];
}

- (BOOL)loadStatisticTable
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatch_queue = self->_dispatch_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__CPMLDB_loadStatisticTable__block_invoke;
  v6[3] = &unk_2642022C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatch_queue, v6);
  if (*((unsigned char *)v8 + 24))
  {
    self->rowCount = [(CPMLDB *)self getRowCount];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
    self->rowCount = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __28__CPMLDB_loadStatisticTable__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 192), (const char *)[@"select * from STATISTICS;" UTF8String],
         [@"select * from STATISTICS;" length],
         &ppStmt,
         0);
  if (v2 == 1)
  {
    sqlite3_finalize(ppStmt);
  }
  else if (v2)
  {
    NSLog(&cfstr_SPrepareFailD.isa, "-[CPMLDB loadStatisticTable]_block_invoke", v2);
  }
  else
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 96) getTotalAttributes];
    BOOL v4 = ppStmt;
    if (v3)
    {
      for (unint64_t i = 0; i < v6; ++i)
      {
        if (sqlite3_step(v4) == 100)
        {
          *(double *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * i) = sqlite3_column_double(ppStmt, 0);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 64) + 8 * i) = sqlite3_column_double(ppStmt, 1);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 72) + 8 * i) = sqlite3_column_double(ppStmt, 2);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 80) + 8 * i) = sqlite3_column_double(ppStmt, 3);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 88) + 8 * i) = sqlite3_column_double(ppStmt, 4);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 48) + 8 * i) = sqlite3_column_double(ppStmt, 5);
          *(double *)(*(void *)(*(void *)(a1 + 32) + 56) + 8 * i) = sqlite3_column_double(ppStmt, 6);
        }
        unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 96) getTotalAttributes];
        BOOL v4 = ppStmt;
      }
    }
    sqlite3_finalize(v4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)updateStatistics
{
  if ([(CPMLSchema *)self->cpSchema getTotalAttributes])
  {
    unint64_t v3 = 0;
    do
    {
      [(CPMLDB *)self getMinFor:v3];
      self->min[v3] = v4;
      [(CPMLDB *)self getMaxFor:v3];
      self->max[v3] = v5;
      if ([(CPMLSchema *)self->cpSchema isVectorType:v3])
      {
        unint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"key%d", v3);
        uint64_t v7 = [(NSMutableDictionary *)self->vectorListCardinality objectForKey:v6];
        self->cardinality[v3] = (double)(unint64_t)[v7 count];
      }
      else
      {
        self->cardinality[v3] = (double)[(CPMLDB *)self getCardinality:v3];
      }
      unint64_t v8 = (void *)[[NSString alloc] initWithFormat:@" (cardinality, mean, sumofX, sumofXX, sigma, min, max) VALUES (%lf, %lf, %lf, %lf, %lf, %lf, %lf) ", *(void *)&self->cardinality[v3], *(void *)&self->mean[v3], *(void *)&self->sumOfX[v3], *(void *)&self->sumOfXX[v3], *(void *)&self->sigma[v3], *(void *)&self->min[v3], *(void *)&self->max[v3]];
      [(CPMLDB *)self insertIntoTable:@"STATISTICS" withTuple:v8];

      ++v3;
    }
    while (v3 < [(CPMLSchema *)self->cpSchema getTotalAttributes]);
  }
}

- (void)indexTable:(id)a3 withColumn:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  for (unint64_t i = 0; i < [v6 count]; ++i)
  {
    id v8 = [NSString alloc];
    uint64_t v9 = [v6 objectAtIndex:i];
    char v10 = (void *)[v8 initWithFormat:@"%@ID%d", v9, i];

    id v11 = objc_alloc(MEMORY[0x263F089D8]);
    double v12 = [v6 objectAtIndex:i];
    id v13 = objc_msgSend(v11, "initWithFormat:", @"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@);",
                    v10,
                    v14,
                    v12);

    [(CPMLDB *)self execSQLCommand:v13];
  }
}

- (id)getColumnName:(unint64_t)a3
{
  return [(CPMLSchema *)self->cpSchema getColumnName:a3];
}

- (int)getSchemaType:(unint64_t)a3
{
  return [(CPMLSchema *)self->cpSchema getSchemaType:a3];
}

- (int)getVectorContent:(unint64_t)a3
{
  return [(CPMLSchema *)self->cpSchema getVectorContent:a3];
}

- (int)getYColumnPosition
{
  return [(CPMLSchema *)self->cpSchema getYColumnPosition];
}

- (id)getRemapTable
{
  return [(CPMLSchema *)self->cpSchema nsRemapTable];
}

- (void)printFormat:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x263F089D8] string];
  char v10 = (id *)&v11;
  id v5 = v3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    do
    {
      [v4 appendString:v7];
      NSLog(&stru_26C511838.isa, v7);
      id v8 = v10++;
      id v9 = *v8;

      uint64_t v7 = v9;
    }
    while (v9);
  }
  NSLog(&stru_26C511858.isa, v4);
}

- (id)addValues:(int)a3
{
  uint64_t v11 = (id *)&v13;
  if (a3 < 1)
  {
    id v4 = 0;
    double v5 = 0.0;
  }
  else
  {
    int v3 = a3;
    id v4 = 0;
    double v5 = 0.0;
    do
    {
      id v6 = v4;
      uint64_t v7 = v11++;
      id v4 = *v7;

      [v4 doubleValue];
      double v5 = v5 + v8;
      --v3;
    }
    while (v3);
  }
  id v9 = [NSNumber numberWithDouble:v5];

  return v9;
}

- (id)fileProtectionClassRequest:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NSFileProtectionCompleteUntilFirstUserAuthentication"])
  {
    id v4 = (id *)MEMORY[0x263F08098];
LABEL_9:
    id v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"NSFileProtectionCompleteUnlessOpen"])
  {
    id v4 = (id *)MEMORY[0x263F08088];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"NSFileProtectionComplete"])
  {
    id v4 = (id *)MEMORY[0x263F08080];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"NSFileProtectionNone"])
  {
    id v4 = (id *)MEMORY[0x263F080B0];
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)extractRow:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = (id)objc_opt_new();
  if (!v4)
  {
    if (![(CPMLDB *)self getRowCount]) {
      goto LABEL_6;
    }
LABEL_5:
    dispatch_queue = self->_dispatch_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __21__CPMLDB_extractRow___block_invoke;
    block[3] = &unk_264202298;
    id v10 = v4;
    uint64_t v11 = self;
    double v12 = &v13;
    dispatch_sync(dispatch_queue, block);
    id v7 = (id)v14[5];

    goto LABEL_7;
  }
  int v5 = [v4 intValue];
  if ([(CPMLDB *)self getRowCount] >= v5) {
    goto LABEL_5;
  }
  NSLog(&cfstr_SRowidDGreater.isa, "-[CPMLDB extractRow:]", [v4 intValue]);
LABEL_6:
  id v7 = (id)v14[5];
LABEL_7:
  _Block_object_dispose(&v13, 8);

  return v7;
}

sqlite3_stmt *__21__CPMLDB_extractRow___block_invoke(void *a1)
{
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    id v3 = sqlite3_mprintf("SELECT * FROM MAIN_TABLE where pKey = %d; ", [v2 intValue]);
  }
  else {
    id v3 = sqlite3_mprintf("SELECT * FROM MAIN_TABLE ORDER BY pKey DESC LIMIT 1;");
  }
  id v4 = v3;
  ppStmt[0] = 0;
  int v5 = *(sqlite3 **)(a1[5] + 192);
  int v6 = strlen(v3);
  v30 = v4;
  sqlite3_prepare_v2(v5, v4, v6, ppStmt, 0);
  int v7 = sqlite3_step(ppStmt[0]);
  if ((v7 - 100) >= 2 && v7 != 0)
  {
    NSLog(&cfstr_SCannotQueryDb.isa, "-[CPMLDB extractRow:]_block_invoke");
    goto LABEL_28;
  }
  if ([*(id *)(a1[5] + 96) getTotalAttributes])
  {
    for (unint64_t i = 0; [*(id *)(a1[5] + 96) getTotalAttributes] > i; ++i)
    {
      id v10 = [*(id *)(a1[5] + 96) getColumnName:i];
      if ([*(id *)(a1[5] + 96) isStringType:i])
      {
        uint64_t v11 = sqlite3_column_text(ppStmt[0], i);
        double v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
        uint64_t v13 = (void *)[[NSString alloc] initWithCString:v11 encoding:4];
        [v12 setObject:v13 forKey:v10];
      }
      else if ([*(id *)(a1[5] + 96) isIntType:i])
      {
        uint64_t v14 = sqlite3_column_int(ppStmt[0], i);
        uint64_t v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
        uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithInt:v14];
        [v15 setObject:v13 forKey:v10];
      }
      else if ([*(id *)(a1[5] + 96) isRealType:i])
      {
        double v16 = sqlite3_column_double(ppStmt[0], i);
        uint64_t v17 = *(void **)(*(void *)(a1[6] + 8) + 40);
        uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithDouble:v16];
        [v17 setObject:v13 forKey:v10];
      }
      else
      {
        if (![*(id *)(a1[5] + 96) isVectorType:i])
        {
          NSLog(&cfstr_SUnknownType.isa, "-[CPMLDB extractRow:]_block_invoke");

          break;
        }
        uint64_t v13 = objc_opt_new();
        id v18 = (unsigned __int8 *)sqlite3_column_blob(ppStmt[0], i);
        uint64_t v19 = (CPMLLog *)sqlite3_column_bytes(ppStmt[0], i);
        uint64_t v20 = (char *)&v29 - ((v19 + 15) & 0x1FFFFFFF0);
        int v21 = *v18;
        if (v21 == 83)
        {
          uint64_t v22 = *(void *)(v18 + 1);
          if (v22)
          {
            long long v23 = (size_t *)(v18 + 9);
            do
            {
              size_t v25 = *v23;
              long long v24 = (const char *)(v23 + 1);
              strlcpy(v20, v24, v25);
              long long v26 = (void *)[[NSString alloc] initWithCString:v20 encoding:4];
              [v13 addObject:v26];

              long long v23 = (size_t *)&v24[v25];
              --v22;
            }
            while (v22);
          }
        }
        else if (v21 == 78)
        {
          [v13 addObject:&stru_26C5111B8];
        }
        else
        {
          CPMLLog = (pthread_mutex_t *)CPMLLog::getCPMLLog(v19);
          CPMLLog::log(CPMLLog, CPML_LOG_ERR, "-[CPMLDB extractRow:]_block_invoke", "Encoding unsupported");
        }
        [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v13 forKey:v10];
      }
    }
  }
LABEL_28:
  if (v30) {
    sqlite3_free(v30);
  }
  result = ppStmt[0];
  if (ppStmt[0]) {
    return (sqlite3_stmt *)sqlite3_finalize(ppStmt[0]);
  }
  return result;
}

- (void)removeTrainingRow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [v4 intValue];
      if (v5)
      {
        dispatch_queue = self->_dispatch_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __28__CPMLDB_removeTrainingRow___block_invoke;
        block[3] = &unk_264202388;
        int v8 = v5;
        void block[4] = self;
        dispatch_async(dispatch_queue, block);
      }
    }
    else
    {
      NSLog(&cfstr_SNotANumber.isa, "-[CPMLDB removeTrainingRow:]");
    }
  }
}

sqlite3_stmt *__28__CPMLDB_removeTrainingRow___block_invoke(uint64_t a1)
{
  int v7 = *(_DWORD *)(a1 + 40);
  ppStmt = 0;
  uint64_t v2 = sqlite3_mprintf("delete from MAIN_TABLE where pkey in(select pkey from MAIN_TABLE LIMIT %d);", v7);
  int v3 = strlen(v2);
  sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 192), v2, v3, &ppStmt, 0);
  int v4 = sqlite3_step(ppStmt);
  if ((v4 - 100) < 2 || v4 == 0)
  {
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(&cfstr_SCannotQueryDb.isa, "-[CPMLDB removeTrainingRow:]_block_invoke");
    if (!v2) {
      goto LABEL_8;
    }
  }
  sqlite3_free(v2);
LABEL_8:
  result = ppStmt;
  if (ppStmt) {
    return (sqlite3_stmt *)sqlite3_finalize(ppStmt);
  }
  return result;
}

- (void)removeTrainingRowData:(double)a3
{
  dispatch_queue = self->_dispatch_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__CPMLDB_removeTrainingRowData___block_invoke;
  v4[3] = &unk_2642023B0;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_sync(dispatch_queue, v4);
}

sqlite3_stmt *__32__CPMLDB_removeTrainingRowData___block_invoke(sqlite3_stmt *result)
{
  ppStmt = 0;
  if (*((double *)result + 5) > 0.0)
  {
    uint64_t v1 = result;
    uint64_t v2 = sqlite3_mprintf("select * from DateIndex where date <= %lf;", *((double *)result + 5));
    int v3 = strlen(v2);
    sqlite3_prepare_v2(*(sqlite3 **)(*((void *)v1 + 4) + 192), v2, v3, &ppStmt, 0);
    if (v2) {
      sqlite3_free(v2);
    }
    uint64_t v4 = 0;
    while (1)
    {
      int v5 = sqlite3_step(ppStmt);
      if ((v5 - 100) >= 2 && v5 != 0) {
        break;
      }
      int v7 = v5;
      int v8 = sqlite3_column_int(ppStmt, 0);
      if (v8 <= (int)v4) {
        uint64_t v4 = v4;
      }
      else {
        uint64_t v4 = v8;
      }
      if (v7 == 101) {
        goto LABEL_14;
      }
    }
    NSLog(&cfstr_SCannotQueryDb.isa, "-[CPMLDB removeTrainingRowData:]_block_invoke");
LABEL_14:
    if (ppStmt)
    {
      sqlite3_finalize(ppStmt);
      ppStmt = 0;
    }
    id v9 = (void *)*((void *)v1 + 4);
    id v10 = (void *)[objc_alloc(NSNumber) initWithInt:v4];
    [v9 removeTrainingRow:v10];

    uint64_t v11 = sqlite3_mprintf("delete from DateIndex where date <= %lf;", *((double *)v1 + 5));
    int v12 = strlen(v11);
    sqlite3_prepare_v2(*(sqlite3 **)(*((void *)v1 + 4) + 192), v11, v12, &ppStmt, 0);
    if (v11) {
      sqlite3_free(v11);
    }
    int v13 = sqlite3_step(ppStmt);
    if ((v13 - 100) >= 2 && v13) {
      NSLog(&cfstr_SCannotDeleteD.isa, "-[CPMLDB removeTrainingRowData:]_block_invoke");
    }
    result = ppStmt;
    if (ppStmt) {
      return (sqlite3_stmt *)sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

- (BOOL)reset
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  [(CPMLDB *)self flushDB];
  dispatch_queue = self->_dispatch_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __15__CPMLDB_reset__block_invoke;
  v8[3] = &unk_2642022C0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(dispatch_queue, v8);
  trainingModelFileAndPath = self->_trainingModelFileAndPath;
  trainingFile = self->_trainingFile;
  if (trainingFile) {
    [(CPMLDB *)self doInitializeWithDataFile:trainingModelFileAndPath dataFromFile:trainingFile withConfiguration:self->_cInfo withWriteOptions:self->_openCPMLDBOptions];
  }
  else {
    [(CPMLDB *)self doInitialize:trainingModelFileAndPath withConfiguration:self->_cInfo withWriteOptions:self->_openCPMLDBOptions];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __15__CPMLDB_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) restart];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 160);
  id v6 = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&v6];
  id v5 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    NSLog(&cfstr_SCannotRemoveM.isa, "-[CPMLDB reset]_block_invoke");
  }
}

- (void)setCPMLAlgorithm:(id)a3
{
}

- (id)getDelegate
{
  return self->_thedelegate;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)getDispatchQueue
{
  return self->_dispatch_queue;
}

- (CPMLSchema)cpSchema
{
  return (CPMLSchema *)objc_getProperty(self, a2, 96, 1);
}

- (sqlite3)db
{
  return self->db;
}

- (NSString)dbFileName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFileName, 0);
  objc_storeStrong((id *)&self->_dispatch_queue, 0);
  objc_storeStrong((id *)&self->_thedelegate, 0);
  objc_storeStrong((id *)&self->_trainingFile, 0);
  objc_storeStrong((id *)&self->_trainingModelFileAndPath, 0);
  objc_storeStrong((id *)&self->_cInfo, 0);
  objc_storeStrong((id *)&self->dbTableName, 0);
  objc_storeStrong((id *)&self->vectorListCardinality, 0);
  objc_storeStrong((id *)&self->indexer, 0);

  objc_storeStrong((id *)&self->cpSchema, 0);
}

@end