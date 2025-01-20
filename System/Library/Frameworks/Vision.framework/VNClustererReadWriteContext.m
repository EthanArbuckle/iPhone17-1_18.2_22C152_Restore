@interface VNClustererReadWriteContext
+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5;
+ (id)nonGroupedGroupID;
+ (id)representativenessForFaces:(id)a3 error:(id *)a4;
- (BOOL)cancelClustering:(id *)a3;
- (BOOL)resetModelState:(id)a3 error:(id *)a4;
- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8;
- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10;
- (id)_updateClustererWithOptions:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)allClusteredFaceIdsAndReturnError:(id *)a3;
- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4;
- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5;
- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4;
- (id)getAllClustersAndReturnError:(id *)a3;
- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5;
- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4;
- (id)maximumFaceIdInModelAndReturnError:(id *)a3;
- (id)saveAndReturnCurrentModelState:(id *)a3;
- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6;
- (id)updateModelByAddingFaces:(id)a3 andRemovingFaces:(id)a4 canceller:(id)a5 error:(id *)a6;
- (id)updateModelByAddingFaces:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingFaces:(id)a5 canceller:(id)a6 error:(id *)a7;
- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7;
- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5;
@end

@implementation VNClustererReadWriteContext

- (void).cxx_destruct
{
}

- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = (VNCanceller *)a5;
  if (!v11) {
    v11 = objc_alloc_init(VNCanceller);
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__421;
  v33 = __Block_byref_object_dispose__422;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__421;
  v27 = __Block_byref_object_dispose__422;
  id v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke;
  v18[3] = &unk_1E5B1ACE0;
  v20 = &v29;
  v18[4] = self;
  id v12 = v10;
  float v22 = a4;
  id v19 = v12;
  v21 = &v23;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2;
  v17[3] = &unk_1E5B1D628;
  v17[4] = self;
  if ([(VNCanceller *)v11 tryToPerformBlock:v18 usingSignallingBlock:v17])
  {
    v13 = (void *)v30[5];
    if (v13)
    {
      id v14 = v13;
      goto LABEL_12;
    }
    if (a6)
    {
      id v15 = (id) v24[5];
      goto LABEL_10;
    }
  }
  else if (a6)
  {
    id v15 = +[VNError errorWithCode:1 message:@"Suggestions request has been cancelled"];
LABEL_10:
    id v14 = 0;
    *a6 = v15;
    goto LABEL_12;
  }
  id v14 = 0;
LABEL_12:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(*(void *)(a1 + 32) + 64);
  LODWORD(a2) = *(_DWORD *)(a1 + 64);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 suggestionsForClusterIdsWithFlags:v3 affinityThreshold:&obj error:a2];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __99__VNClustererReadWriteContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) cancelClustering:0];
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  return (id)[(VNClusteringReadOnly *)self->_clusterer maximumFaceIdInModelAndReturnError:a3];
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(VNClusteringReadOnly *)self->_clusterer getDistances:a3 to:a4 error:a5];

  return v5;
}

- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  v4 = [(VNClusteringReadOnly *)self->_clusterer getDistanceBetweenLevel1Clusters:a3 error:a4];

  return v4;
}

- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(VNClusteringReadOnly *)self->_clusterer getDistanceBetweenLevel0ClustersWithFaceId:a3 andFaceId:a4 error:a5];

  return v5;
}

- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4
{
  v4 = [(VNClusteringReadOnly *)self->_clusterer getClustersForClusterIds:a3 options:0 error:a4];

  return v4;
}

- (id)getAllClustersAndReturnError:(id *)a3
{
  return (id)[(VNClusteringReadOnly *)self->_clusterer getAllClustersFromStateAndReturnError:a3];
}

- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4
{
  v4 = [(VNClusteringReadOnly *)self->_clusterer getLevel1ClusteredIdsGroupedByLevel0ClustersForFaceId:a3 error:a4];

  return v4;
}

- (id)allClusteredFaceIdsAndReturnError:(id *)a3
{
  return (id)[(VNClusteringReadOnly *)self->_clusterer getClusteredIds:a3];
}

- (BOOL)cancelClustering:(id *)a3
{
  return 0;
}

- (id)updateModelByAddingFaces:(id)a3 andRemovingFaces:(id)a4 canceller:(id)a5 error:(id *)a6
{
  uint64_t v6 = [(VNClustererReadWriteContext *)self updateModelByAddingFaces:a3 withGroupingIdentifiers:0 andRemovingFaces:a4 canceller:a5 error:a6];

  return v6;
}

- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(VNClustererReadWriteContext *)self updateModelByAddingFaces:0 withGroupingIdentifiers:0 andRemovingFaces:a3 canceller:a4 error:a5];

  return v5;
}

- (id)updateModelByAddingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  uint64_t v5 = [(VNClustererReadWriteContext *)self updateModelByAddingFaces:a3 withGroupingIdentifiers:0 andRemovingFaces:0 canceller:a4 error:a5];

  return v5;
}

- (id)_updateClustererWithOptions:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (VNCanceller *)a4;
  if (!v9) {
    v9 = objc_alloc_init(VNCanceller);
  }
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__421;
  v37 = __Block_byref_object_dispose__422;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__421;
  uint64_t v31 = __Block_byref_object_dispose__422;
  id v32 = 0;
  uint64_t v21 = 0;
  float v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__421;
  uint64_t v25 = __Block_byref_object_dispose__422;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke;
  v17[3] = &unk_1E5B1AD08;
  id v19 = &v33;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  v20 = &v27;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke_2;
  v16[3] = &unk_1E5B1C658;
  v16[4] = self;
  v16[5] = &v21;
  if (![(VNCanceller *)v9 tryToPerformBlock:v17 usingSignallingBlock:v16])
  {
    if (a5)
    {
      id v13 = +[VNError errorWithCode:1 message:@"Clustering request has been cancelled"];
LABEL_13:
      id v14 = 0;
      *a5 = v13;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v11 = (void *)v34[5];
  if (!v11)
  {
    if (a5)
    {
      id v12 = (void *)v28[5];
LABEL_12:
      id v13 = v12;
      goto LABEL_13;
    }
LABEL_14:
    id v14 = 0;
    goto LABEL_16;
  }
  id v12 = (void *)v22[5];
  if (v12)
  {
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v14 = v11;
LABEL_16:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);

  return v14;
}

void __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 64);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 getClustersWithOptions:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __75__VNClustererReadWriteContext__updateClustererWithOptions_canceller_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = *(void *)(v1 + 8);
  id obj = *(id *)(v3 + 40);
  [v2 cancelClustering:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17 = v16;
  if (v12) {
    [v16 setObject:v12 forKey:@"VNClusterOptionAddObjectsToClustering"];
  }
  if (v14) {
    [v17 setObject:v14 forKey:@"VNClusterOptionRemoveObjectsFromClustering"];
  }
  if (v13) {
    [v17 setObject:v13 forKey:@"VNClusterOptionAddObjectGroupIdsToClustering"];
  }
  id v18 = [(VNClustererReadWriteContext *)self _updateClustererWithOptions:v17 canceller:v15 error:a7];

  return v18;
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingFaces:(id)a5 canceller:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (VNCanceller *)a6;
  if (!v15) {
    id v15 = objc_alloc_init(VNCanceller);
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17 = v16;
  if (v12) {
    [v16 setObject:v12 forKey:@"VNClusterOptionAddObjectsToClustering"];
  }
  if (v14) {
    [v17 setObject:v14 forKey:@"VNClusterOptionRemoveObjectsFromClustering"];
  }
  if (v13) {
    [v17 setObject:v13 forKey:@"VNClusterOptionAddObjectGroupIdsToClustering"];
  }
  id v18 = [(VNClustererReadWriteContext *)self _updateClustererWithOptions:v17 canceller:v15 error:a7];

  return v18;
}

- (id)saveAndReturnCurrentModelState:(id *)a3
{
  return (id)[(VNClusteringReadOnly *)self->_clusterer getClusterState:a3];
}

- (BOOL)resetModelState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(VNClustererContextBase *)self _createGreedyClusterer:objc_opt_class() state:v6 error:a4];
  LOBYTE(a4) = v7 != 0;

  return (char)a4;
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VNClustererReadWriteContext;
  *(float *)&double v21 = a6;
  *(float *)&double v22 = a7;
  uint64_t v23 = [(VNClustererContextBase *)&v28 initWithType:v18 cachePath:v19 state:v20 readOnly:0 threshold:a8 torsoThreshold:a9 requestRevision:v21 torsoprintRequestRevision:v22 error:a10];
  if (v23
    && ([(VNClustererContextBase *)v23 _createGreedyClusterer:objc_opt_class() state:v20 error:a10], uint64_t v24 = objc_claimAutoreleasedReturnValue(), clusterer = v23->_clusterer, v23->_clusterer = (VNClusteringReadOnly *)v24, clusterer, v23->_clusterer))
  {
    id v26 = v23;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9
{
  return -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a8, 1, a9);
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VNClustererReadWriteContext;
  *(float *)&double v19 = a6;
  id v20 = [(VNClustererContextBase *)&v25 initWithType:v16 cachePath:v17 state:v18 readOnly:0 threshold:a7 requestRevision:a8 torsoprintRequestRevision:v19 error:a9];
  if (v20
    && ([(VNClustererContextBase *)v20 _createGreedyClusterer:objc_opt_class() state:v18 error:a9], uint64_t v21 = objc_claimAutoreleasedReturnValue(), clusterer = v20->_clusterer, v20->_clusterer = (VNClusteringReadOnly *)v21, clusterer, v20->_clusterer))
  {
    uint64_t v23 = v20;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (VNClustererReadWriteContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8
{
  return -[VNClustererReadWriteContext initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a7, 1, a8);
}

+ (id)nonGroupedGroupID
{
  return +[VNClustererReadOnlyContext nonGroupedGroupID];
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  uint64_t v5 = +[VNClustererReadOnlyContext clustererModelFileNamesFromState:a3 storedInPath:a4 error:a5];

  return v5;
}

+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5
{
  uint64_t v5 = +[VNClustererReadOnlyContext distanceBetweenFacesWithFaceprint:a3 andFaceprint:a4 error:a5];

  return v5;
}

+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [a3 faceprint];
  v9 = [v7 faceprint];
  id v10 = +[VNClustererReadWriteContext distanceBetweenFacesWithFaceprint:v8 andFaceprint:v9 error:a5];

  return v10;
}

+ (id)representativenessForFaces:(id)a3 error:(id *)a4
{
  uint64_t v4 = +[VNClustererReadOnlyContext representativenessForFaces:a3 error:a4];

  return v4;
}

@end