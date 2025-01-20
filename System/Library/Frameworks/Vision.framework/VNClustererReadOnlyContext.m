@interface VNClustererReadOnlyContext
+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5;
+ (id)nonGroupedGroupID;
+ (id)representativenessForFaces:(id)a3 error:(id *)a4;
- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8;
- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10;
- (id)allClusteredFaceIdsAndReturnError:(id *)a3;
- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4;
- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5;
- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4;
- (id)getAllClustersAndReturnError:(id *)a3;
- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5;
- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4;
- (id)maximumFaceIdInModelAndReturnError:(id *)a3;
- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6;
@end

@implementation VNClustererReadOnlyContext

- (void).cxx_destruct
{
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  return (id)[(VNClusteringReadOnly *)self->_clusterer maximumFaceIdInModelAndReturnError:a3];
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  v5 = [(VNClusteringReadOnly *)self->_clusterer getDistances:a3 to:a4 error:a5];

  return v5;
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
  v18[2] = __98__VNClustererReadOnlyContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke;
  v18[3] = &unk_1E5B1ACE0;
  v20 = &v29;
  v18[4] = self;
  id v12 = v10;
  float v22 = a4;
  id v19 = v12;
  v21 = &v23;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__VNClustererReadOnlyContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2;
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

void __98__VNClustererReadOnlyContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke(uint64_t a1, double a2)
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

uint64_t __98__VNClustererReadOnlyContext_suggestionsForClustersWithFaceIds_affinityThreshold_canceller_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) cancelClustering:0];
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

- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VNClustererReadOnlyContext;
  *(float *)&double v21 = a6;
  *(float *)&double v22 = a7;
  uint64_t v23 = [(VNClustererContextBase *)&v28 initWithType:v18 cachePath:v19 state:v20 readOnly:1 threshold:a8 torsoThreshold:a9 requestRevision:v21 torsoprintRequestRevision:v22 error:a10];
  if (v23
    && ([(VNClustererContextBase *)v23 _createGreedyClusterer:objc_opt_class() state:v20 error:a10], uint64_t v24 = objc_claimAutoreleasedReturnValue(), clusterer = v23->_clusterer, v23->_clusterer = (VNClusteringReadOnly *)v24, clusterer, v23->_clusterer))
  {
    v26 = v23;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9
{
  return -[VNClustererReadOnlyContext initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a8, 1, a9);
}

- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VNClustererReadOnlyContext;
  *(float *)&double v19 = a6;
  id v20 = [(VNClustererContextBase *)&v25 initWithType:v16 cachePath:v17 state:v18 readOnly:1 threshold:a7 requestRevision:a8 torsoprintRequestRevision:v19 error:a9];
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

- (VNClustererReadOnlyContext)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8
{
  return -[VNClustererReadOnlyContext initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:threshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a7, 1, a8);
}

+ (id)nonGroupedGroupID
{
  return +[VNGreedyClusteringReadOnly nonGroupedGroupID];
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  uint64_t v5 = +[VNGreedyClusteringReadOnly clustererModelFileNamesFromState:a3 storedInPath:a4 error:a5];

  return v5;
}

+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [a3 faceprint];
  v9 = [v7 faceprint];
  id v10 = +[VNClustererReadOnlyContext distanceBetweenFacesWithFaceprint:v8 andFaceprint:v9 error:a5];

  return v10;
}

+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5
{
  uint64_t v6 = objc_msgSend(a3, "computeDistance:withDistanceFunction:error:", a4, 0);
  id v7 = v6;
  if (!v6 || a5 && *a5) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }

  return v8;
}

+ (id)representativenessForFaces:(id)a3 error:(id *)a4
{
  v4 = +[VNGreedyClusteringReadOnly getRepresentativenessForFaces:a3 error:a4];

  return v4;
}

@end