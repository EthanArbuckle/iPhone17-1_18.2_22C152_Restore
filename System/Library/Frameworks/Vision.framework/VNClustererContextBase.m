@interface VNClustererContextBase
- (BOOL)_checkInitInputs:(id)a3 cachePath:(id)a4 checkType:(id)a5 requestRevision:(unint64_t)a6 error:(id *)a7;
- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10;
- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 error:(id *)a10;
- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 torsoprintRequestRevision:(unint64_t)a10 error:(id *)a11;
- (id)_createGreedyClusterer:(Class)a3 state:(id)a4 error:(id *)a5;
- (void)_initializeGreedyClustererOptions:(id)a3;
@end

@implementation VNClustererContextBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_torsoThreshold, 0);
  objc_storeStrong((id *)&self->_threshold, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)_initializeGreedyClustererOptions:(id)a3
{
  id v7 = a3;
  [v7 setObject:self->_type forKeyedSubscript:@"VNClusterOptionClusteringAlgorithm"];
  [v7 setObject:self->_cacheDirectoryPath forKeyedSubscript:@"VNClusterOptionCacheFolderPath"];
  [v7 setObject:self->_threshold forKeyedSubscript:@"VNClusterOptionInputThreshold"];
  [v7 setObject:self->_torsoThreshold forKeyedSubscript:@"VNClusterOptionInputTorsoThreshold"];
  v4 = [NSNumber numberWithBool:self->_readOnly];
  [v7 setObject:v4 forKeyedSubscript:@"VNClusterOptionVectorMapReadOnlyFlag"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_faceprintRequestRevision];
  [v7 setObject:v5 forKeyedSubscript:@"VNClusterOptionFaceprintRevision"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_torsoprintRequestRevision];
  [v7 setObject:v6 forKeyedSubscript:@"VNClusterOptionTorsoprintRevision"];
}

- (id)_createGreedyClusterer:(Class)a3 state:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(VNClustererContextBase *)self _initializeGreedyClustererOptions:v9];
  if (v8) {
    [v9 setObject:v8 forKey:@"VNClusterOptionRestoreClusteringState"];
  }
  v10 = (void *)[[a3 alloc] initWithOptions:v9 error:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    if (a5)
    {
      a5 = [*a5 localizedDescription];
    }
    [NSString stringWithFormat:@"Failed to create clusterer; Error = %@", a5];
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 UTF8String];
    VNValidatedLog(4, @"%s", v15, v16, v17, v18, v19, v20, v14);
  }

  return v11;
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 torsoprintRequestRevision:(unint64_t)a10 error:(id *)a11
{
  id v19 = a3;
  id v20 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VNClustererContextBase;
  v21 = [(VNClustererContextBase *)&v31 init];
  v22 = v21;
  if (!v21)
  {
    if (a11)
    {
      +[VNError errorForMemoryAllocationFailure];
      v29 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v29 = 0;
    goto LABEL_7;
  }
  if (![(VNClustererContextBase *)v21 _checkInitInputs:v19 cachePath:v20 checkType:@"VNClusteringAlgorithm_GreedyWithTorso" requestRevision:a9 error:a11])goto LABEL_6; {
  objc_storeStrong((id *)&v22->_type, a3);
  }
  *(float *)&double v23 = a7;
  uint64_t v24 = [NSNumber numberWithFloat:v23];
  threshold = v22->_threshold;
  v22->_threshold = (NSNumber *)v24;

  *(float *)&double v26 = a8;
  uint64_t v27 = [NSNumber numberWithFloat:v26];
  torsoThreshold = v22->_torsoThreshold;
  v22->_torsoThreshold = (NSNumber *)v27;

  objc_storeStrong((id *)&v22->_cacheDirectoryPath, a4);
  v22->_readOnly = a6;
  v22->_faceprintRequestRevision = a9;
  v22->_torsoprintRequestRevision = a10;
  v29 = v22;
LABEL_7:

  return v29;
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 error:(id *)a10
{
  return -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:readOnly:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a6, a9, 1, a10);
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v17 = a3;
  id v18 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VNClustererContextBase;
  id v19 = [(VNClustererContextBase *)&v27 init];
  id v20 = v19;
  if (!v19)
  {
    if (a10)
    {
      +[VNError errorForMemoryAllocationFailure];
      v25 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  if (![(VNClustererContextBase *)v19 _checkInitInputs:v17 cachePath:v18 checkType:@"VNClusteringAlgorithm_Greedy" requestRevision:a8 error:a10])goto LABEL_6; {
  objc_storeStrong((id *)&v20->_type, a3);
  }
  *(float *)&double v21 = a7;
  uint64_t v22 = [NSNumber numberWithFloat:v21];
  threshold = v20->_threshold;
  v20->_threshold = (NSNumber *)v22;

  torsoThreshold = v20->_torsoThreshold;
  v20->_torsoThreshold = (NSNumber *)&unk_1EF7A6C98;

  objc_storeStrong((id *)&v20->_cacheDirectoryPath, a4);
  v20->_readOnly = a6;
  v20->_faceprintRequestRevision = a8;
  v20->_torsoprintRequestRevision = a9;
  v25 = v20;
LABEL_7:

  return v25;
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9
{
  return -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:readOnly:threshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a6, a8, 1, a9);
}

- (BOOL)_checkInitInputs:(id)a3 cachePath:(id)a4 checkType:(id)a5 requestRevision:(unint64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v28 = 0;
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v14 fileExistsAtPath:v12 isDirectory:&v28];

  if (v28) {
    char v16 = v15;
  }
  else {
    char v16 = 0;
  }
  if ((v16 & 1) == 0)
  {
    id v18 = [NSString stringWithFormat:@"Invalid Clusterer cache directory: %@", v12];
    if (a7)
    {
      *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
    }
    goto LABEL_16;
  }
  if (([v11 isEqualToString:v13] & 1) == 0)
  {
    id v18 = [NSString stringWithFormat:@"Invalid Clusterer type: %@", v11];
    if (a7)
    {
      *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
    }
    goto LABEL_16;
  }
  if (!+[VNRequest supportsAnyRevision:a6])
  {
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid Faceprint revision: %lu", a6);
    if (a7)
    {
      *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
    }
LABEL_16:
    id v19 = v18;
    uint64_t v20 = [v19 UTF8String];
    VNValidatedLog(4, @"%s", v21, v22, v23, v24, v25, v26, v20);

    BOOL v17 = 0;
    goto LABEL_17;
  }
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

@end