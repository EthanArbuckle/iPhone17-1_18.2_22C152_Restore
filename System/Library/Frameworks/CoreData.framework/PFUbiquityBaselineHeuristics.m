@interface PFUbiquityBaselineHeuristics
- (PFUbiquityBaselineHeuristics)init;
- (PFUbiquityBaselineHeuristics)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6;
- (id)copy;
- (id)description;
- (uint64_t)canRollBaseline:(uint64_t *)a1;
- (void)dealloc;
- (void)updateHeuristics;
@end

@implementation PFUbiquityBaselineHeuristics

- (PFUbiquityBaselineHeuristics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineHeuristics;
  result = [(PFUbiquityBaselineHeuristics *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    *(_OWORD *)&result->_localPeerID = 0u;
    result->_numRequiredTransactions = 100;
    result->_storeSize = 0;
    result->_logSize = 0;
    *(void *)result->_logToStoreSizeRatio = 0x3FE0000000000000;
    result->_currentBaselineKV = 0;
    result->_currentKV = 0;
    result->_minLogBytes = 1000000;
  }
  return result;
}

- (PFUbiquityBaselineHeuristics)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6
{
  v10 = [(PFUbiquityBaselineHeuristics *)self init];
  if (v10)
  {
    v10->_localPeerID = (NSString *)a3;
    v10->_storeName = (NSString *)a4;
    v10->_ubiquityRootLocation = (PFUbiquityLocation *)a6;
    v10->_modelVersionHash = (NSString *)a5;
    v10->_numRequiredTransactions = 100;
    *(void *)v10->_logToStoreSizeRatio = 0x3FE0000000000000;
    v10->_minLogBytes = 1000000;
  }
  return v10;
}

- (void)dealloc
{
  self->_storeName = 0;
  self->_localPeerID = 0;

  self->_ubiquityRootLocation = 0;
  self->_modelVersionHash = 0;
  objc_setProperty_nonatomic(self, v3, 0, 80);
  objc_setProperty_nonatomic(self, v4, 0, 88);
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaselineHeuristics;
  [(PFUbiquityBaselineHeuristics *)&v5 dealloc];
}

- (id)copy
{
  SEL v3 = [[PFUbiquityBaselineHeuristics alloc] initWithLocalPeerID:self->_localPeerID storeName:self->_storeName modelVersionHash:self->_modelVersionHash andUbiquityRootLocation:self->_ubiquityRootLocation];
  objc_super v5 = v3;
  if (v3)
  {
    *(_OWORD *)&v3->_numRequiredTransactions = *(_OWORD *)&self->_numRequiredTransactions;
    v3->_logSize = self->_logSize;
    *(void *)v3->_logToStoreSizeRatio = *(void *)self->_logToStoreSizeRatio;
    v3->_minLogBytes = self->_minLogBytes;
    objc_setProperty_nonatomic(v3, v4, self->_currentBaselineKV, 80);
    objc_setProperty_nonatomic(v5, v6, self->_currentBaselineKV, 88);
  }
  return v5;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaselineHeuristics;
  SEL v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[PFUbiquityBaselineHeuristics description](&v5, sel_description));
  [v3 appendFormat:@"%@:%@\n", self->_localPeerID, self->_storeName];
  [v3 appendFormat:@"\t_ubiquityRootLocation: %@\n", self->_ubiquityRootLocation];
  objc_msgSend(v3, "appendFormat:", @"\ttransactions: %ld\n", self->_numRequiredTransactions);
  objc_msgSend(v3, "appendFormat:", @"\tsize: %ld:%ld\n", self->_storeSize, self->_logSize);
  objc_msgSend(v3, "appendFormat:", @"\treqs: %Lf:%ld\n", *(void *)self->_logToStoreSizeRatio, self->_minLogBytes);
  [v3 appendFormat:@"\tkv: %@:%@", self->_currentBaselineKV, self->_currentKV];
  return v3;
}

- (void)updateHeuristics
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    self;
    v2 = (os_unfair_lock_s **)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, a1[2], a1[1]);
    SEL v3 = v2;
    if (!v2)
    {
      id v8 = 0;
      v9 = 0;
LABEL_29:

      return;
    }
    SEL v4 = v2[11];
    if (v4) {
      objc_super v5 = *(void **)&v4[16]._os_unfair_lock_opaque;
    }
    else {
      objc_super v5 = 0;
    }
    SEL v6 = objc_msgSend((id)objc_msgSend(v5, "URL"), "path");
    memset(&v22, 0, sizeof(v22));
    if (!stat((const char *)[v6 fileSystemRepresentation], &v22))
    {
      off_t st_size = v22.st_size;
      goto LABEL_14;
    }
    if (*__error() == 2)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Tried to stat missing file: %@", "-[PFUbiquityBaselineHeuristics bytesForFileAtPath:]", 165, v6);
        off_t st_size = 0;
        goto LABEL_14;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
    {
      v10 = __error();
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting the size of a file (%d): %@", "-[PFUbiquityBaselineHeuristics bytesForFileAtPath:]", 167, *v10, v6);
      off_t st_size = 0;
      goto LABEL_14;
    }
    off_t st_size = 0;
LABEL_14:
    a1[6] = st_size;
    a1[7] = 0;
    v9 = -[PFUbiquityFilePresenter copyStatusDictionary](v3[6]);
    id v8 = (id)[(os_unfair_lock_s *)v9 allKeys];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          if (v14
            && *(_DWORD *)(v14 + 24) == 22
            && [*(id *)(v14 + 48) isEqualToString:a1[4]])
          {
            v15 = (id)[(os_unfair_lock_s *)v9 objectForKey:v14];
            if (v15) {
              uint64_t v16 = v15[6];
            }
            else {
              uint64_t v16 = 0;
            }
            a1[7] += v16;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v17 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        uint64_t v11 = v17;
      }
      while (v17);
    }
    goto LABEL_29;
  }
}

- (uint64_t)canRollBaseline:(uint64_t *)a1
{
  v48[2] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v33 = 0;
    return v33 & 1;
  }
  uint64_t v41 = 0;
  uint64_t v3 = a1[3];
  if (!v3 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v3, 0, 0))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      v37 = 0;
      char v8 = 0;
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Asked if rolling the baseline is possible, but the root location does not appear to exist: %@", "-[PFUbiquityBaselineHeuristics canRollBaseline:]", 280, a1[3]);
      goto LABEL_11;
    }
    v37 = 0;
    goto LABEL_49;
  }
  SEL v4 = -[PFUbiquityLocation createFullPath](a1[3]);
  v37 = v4;
  if (v4)
  {
    objc_super v5 = (const char *)[v4 fileSystemRepresentation];
    if (v5)
    {
      memset(&v47, 0, sizeof(v47));
      if (!stat(v5, &v47))
      {
        v35 = (void *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v47.st_mtimespec.tv_sec- *MEMORY[0x1E4F1CF78]+ (double)v47.st_mtimespec.tv_nsec * 0.000000001];
        if (v35)
        {
          if (objc_msgSend(v35, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -259200.0)) == 1)
          {
            int v9 = 0;
            char v8 = 0;
            char v42 = 0;
            goto LABEL_51;
          }
        }
      }
    }
  }
  SEL v6 = (void *)a1[10];
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = objc_alloc_init(PFUbiquityKnowledgeVector);
  }
  p_isa = (id *)&v7->super.isa;
  uint64_t v11 = (void *)a1[11];
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = objc_alloc_init(PFUbiquityKnowledgeVector);
  }
  uint64_t v13 = (id *)&v12->super.isa;
  v48[0] = p_isa;
  v48[1] = v12;
  id v14 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:&v47 count:16];
  v38 = a1;
  id obj = v14;
  if (!v15)
  {
    uint64_t v40 = 0;
    goto LABEL_41;
  }
  uint64_t v40 = 0;
  uint64_t v16 = *(void *)v44;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * v17);
      if (p_isa)
      {
        long long v19 = (void *)[p_isa[1] objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * v17)];
        if (!v13) {
          goto LABEL_37;
        }
      }
      else
      {
        long long v19 = 0;
        if (!v13)
        {
LABEL_37:
          long long v20 = 0;
          goto LABEL_25;
        }
      }
      long long v20 = (void *)[v13[1] objectForKey:v18];
LABEL_25:
      uint64_t v21 = [v19 integerValue];
      uint64_t v22 = [v20 integerValue];
      uint64_t v23 = v22;
      if (v21 < 0 || v22 <= v21)
      {
        if (v22 >= v21)
        {
          if (!v20
            && +[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nThis is confusing, baseline has a transaction for %@(%@) but the current kv doesn't: %@\n%@", "-[PFUbiquityBaselineHeuristics haveEnoughTransactionsToRoll]", 197, v38, v18, v19, p_isa, v13);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nThis is confusing, baseline > current for peer: %@(%lu:%lu)", "-[PFUbiquityBaselineHeuristics haveEnoughTransactionsToRoll]", 195, v38, v18, v23, v21);
        }
      }
      else
      {
        uint64_t v24 = [v20 integerValue];
        uint64_t v40 = v24 + v40 - [v19 integerValue];
      }
      ++v17;
    }
    while (v15 != v17);
    uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:&v47 count:16];
    uint64_t v15 = v25;
  }
  while (v25);
LABEL_41:
  BOOL v26 = v40 >= v38[5];

  if (v26) {
    goto LABEL_42;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Enough transactions have passed to roll baseline: %@", "-[PFUbiquityBaselineHeuristics canRollBaseline:]", 270, v38);
  }
  uint64_t v27 = v38[7];
  if (v27 < 1) {
    goto LABEL_49;
  }
  uint64_t v28 = v38[6];
  double v29 = *((double *)v38 + 8);
  BOOL v30 = +[PFUbiquityLogging canLogMessageAtLevel:3];
  if (v27 >= (uint64_t)(v29 * (double)v28))
  {
    if (v30) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Asked to roll baseline, enough disk space has been consumed by logs.", "-[PFUbiquityBaselineHeuristics logsConsumeEnoughDiskSpace]", 219);
    }
LABEL_42:
    char v8 = 1;
    +[PFUbiquityBaseline checkPeerReceiptsUnderRootLocation:forAgreementWithLocalPeerID:storeName:modelVersionHash:error:]((uint64_t)PFUbiquityBaseline, v38[3], v38[1], v38[2], v38[4], &v41);
    goto LABEL_50;
  }
  if (!v30)
  {
LABEL_49:
    char v8 = 0;
LABEL_50:
    int v9 = 1;
    goto LABEL_51;
  }
  uint64_t v31 = [NSNumber numberWithLongLong:v38[6]];
  char v8 = 0;
  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Asked to roll baseline but not enough space has been consumed yet by the transaction logs.\n\tStore Bytes: %@\n\tLog Bytes: %@", "-[PFUbiquityBaselineHeuristics logsConsumeEnoughDiskSpace]", 223, v31, [NSNumber numberWithLongLong:v38[7]]);
LABEL_11:
  int v9 = 1;
LABEL_51:

  if (v41) {
    char v32 = v8;
  }
  else {
    char v32 = 1;
  }
  if (a2 && (v32 & 1) == 0) {
    *a2 = v41;
  }
  char v33 = v42;
  if (v9) {
    char v33 = v8;
  }
  return v33 & 1;
}

@end