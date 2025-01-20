@interface VNClustererBuilder
+ (id)clustererBuilderWithOptions:(id)a3 error:(id *)a4;
+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5;
+ (id)nonGroupedGroupID;
+ (id)representativenessForFaces:(id)a3 error:(id *)a4;
- (BOOL)resetModelState:(id)a3 error:(id *)a4;
- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9;
- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10;
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
- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 canceller:(id)a5 error:(id *)a6;
- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7;
- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5;
@end

@implementation VNClustererBuilder

- (void).cxx_destruct
{
}

- (id)maximumFaceIdInModelAndReturnError:(id *)a3
{
  return (id)[(VNClustererModelQuerying *)self->_context maximumFaceIdInModelAndReturnError:a3];
}

- (id)suggestionsForClustersWithFaceIds:(id)a3 affinityThreshold:(float)a4 canceller:(id)a5 error:(id *)a6
{
  v6 = -[VNClustererModelQuerying suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:](self->_context, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", a3, a5, a6);

  return v6;
}

- (id)distanceBetweenLevel1Clusters:(id)a3 error:(id *)a4
{
  v4 = [(VNClustererModelQuerying *)self->_context distanceBetweenLevel1Clusters:a3 error:a4];

  return v4;
}

- (id)distanceBetweenClustersWithFaceId:(id)a3 andFaceId:(id)a4 error:(id *)a5
{
  v5 = [(VNClustererModelQuerying *)self->_context distanceBetweenClustersWithFaceId:a3 andFaceId:a4 error:a5];

  return v5;
}

- (id)getDistances:(id)a3 to:(id)a4 error:(id *)a5
{
  v5 = [(VNClustererModelQuerying *)self->_context getDistances:a3 to:a4 error:a5];

  return v5;
}

- (id)l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:(id)a3 error:(id *)a4
{
  v4 = [(VNClustererModelQuerying *)self->_context l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:a3 error:a4];

  return v4;
}

- (id)getAllClustersAndReturnError:(id *)a3
{
  return (id)[(VNClustererModelQuerying *)self->_context getAllClustersAndReturnError:a3];
}

- (id)clusteredFaceIdsForClusterContainingFaceId:(id)a3 error:(id *)a4
{
  v4 = [(VNClustererModelQuerying *)self->_context clusteredFaceIdsForClusterContainingFaceId:a3 error:a4];

  return v4;
}

- (id)allClusteredFaceIdsAndReturnError:(id *)a3
{
  return (id)[(VNClustererModelQuerying *)self->_context allClusteredFaceIdsAndReturnError:a3];
}

- (id)updateModelByAddingPersons:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingPersons:(id)a5 canceller:(id)a6 error:(id *)a7
{
  v7 = [(VNClustererModelQuerying *)self->_context updateModelByAddingPersons:a3 withGroupingIdentifiers:a4 andRemovingPersons:a5 canceller:a6 error:a7];

  return v7;
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 andRemovingFaces:(id)a5 canceller:(id)a6 error:(id *)a7
{
  v7 = [(VNClustererModelQuerying *)self->_context updateModelByAddingFaces:a3 withGroupingIdentifiers:a4 andRemovingFaces:a5 canceller:a6 error:a7];

  return v7;
}

- (id)updateModelByAddingFaces:(id)a3 andRemovingFaces:(id)a4 canceller:(id)a5 error:(id *)a6
{
  v6 = [(VNClustererBuilder *)self updateModelByAddingFaces:a3 withGroupingIdentifiers:0 andRemovingFaces:a4 canceller:a5 error:a6];

  return v6;
}

- (id)updateModelByRemovingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  v5 = [(VNClustererBuilder *)self updateModelByAddingFaces:0 withGroupingIdentifiers:0 andRemovingFaces:a3 canceller:a4 error:a5];

  return v5;
}

- (id)updateModelByAddingFaces:(id)a3 withGroupingIdentifiers:(id)a4 canceller:(id)a5 error:(id *)a6
{
  v6 = [(VNClustererBuilder *)self updateModelByAddingFaces:a3 withGroupingIdentifiers:a4 andRemovingFaces:0 canceller:a5 error:a6];

  return v6;
}

- (id)updateModelByAddingFaces:(id)a3 canceller:(id)a4 error:(id *)a5
{
  v5 = [(VNClustererBuilder *)self updateModelByAddingFaces:a3 withGroupingIdentifiers:0 andRemovingFaces:0 canceller:a4 error:a5];

  return v5;
}

- (id)saveAndReturnCurrentModelState:(id *)a3
{
  return (id)[(VNClustererModelQuerying *)self->_context saveAndReturnCurrentModelState:a3];
}

- (BOOL)resetModelState:(id)a3 error:(id *)a4
{
  return [(VNClustererModelQuerying *)self->_context resetModelState:a3 error:a4];
}

- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VNClustererBuilder;
  v21 = [(VNClustererBuilder *)&v29 init];
  if (v21
    && [v18 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"]
    && (v22 = [VNClustererReadWriteContext alloc],
        *(float *)&double v23 = a6,
        *(float *)&double v24 = a7,
        uint64_t v25 = [(VNClustererReadWriteContext *)v22 initWithType:v18 cachePath:v19 state:v20 threshold:a8 torsoThreshold:a9 requestRevision:a10 torsoprintRequestRevision:v23 error:v24], context = v21->_context, v21->_context = (VNClustererModelQuerying *)v25, context, v21->_context))
  {
    v27 = v21;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (VNClustererBuilder)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 torsoprintRequestRevision:(unint64_t)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VNClustererBuilder;
  id v19 = [(VNClustererBuilder *)&v27 init];
  if (!v19)
  {
    if (!a9) {
      goto LABEL_10;
    }
    uint64_t v25 = +[VNError errorForMemoryAllocationFailure];
LABEL_9:
    double v24 = 0;
    *a9 = v25;
    goto LABEL_11;
  }
  if (([v16 isEqualToString:@"VNClusteringAlgorithm_Greedy"] & 1) == 0)
  {
    if (!a9) {
      goto LABEL_10;
    }
    uint64_t v25 = +[VNError errorForInvalidOption:v16 named:@"type" localizedDescription:@"unsupported cluster algorithm type"];
    goto LABEL_9;
  }
  id v20 = [VNClustererReadWriteContext alloc];
  *(float *)&double v21 = a6;
  uint64_t v22 = [(VNClustererReadWriteContext *)v20 initWithType:v16 cachePath:v17 state:v18 threshold:a7 requestRevision:a8 torsoprintRequestRevision:a9 error:v21];
  context = v19->_context;
  v19->_context = (VNClustererModelQuerying *)v22;

  if (!v19->_context)
  {
LABEL_10:
    double v24 = 0;
    goto LABEL_11;
  }
  double v24 = v19;
LABEL_11:

  return v24;
}

+ (id)nonGroupedGroupID
{
  return +[VNClustererQuery nonGroupedGroupID];
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  v5 = +[VNClustererReadWriteContext clustererModelFileNamesFromState:a3 storedInPath:a4 error:a5];

  return v5;
}

+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 faceprint];
  v10 = [v8 faceprint];
  v11 = [a1 distanceBetweenFacesWithFaceprint:v9 andFaceprint:v10 error:a5];

  return v11;
}

+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5
{
  v5 = +[VNClustererReadOnlyContext distanceBetweenFacesWithFaceprint:a3 andFaceprint:a4 error:a5];

  return v5;
}

+ (id)representativenessForFaces:(id)a3 error:(id *)a4
{
  v4 = +[VNClustererReadOnlyContext representativenessForFaces:a3 error:a4];

  return v4;
}

+ (id)clustererBuilderWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 type];
    int v8 = [v7 isEqualToString:@"VNClusteringAlgorithm_Greedy"];

    if (v8)
    {
      v9 = [VNClustererBuilder alloc];
      v10 = [v6 type];
      v11 = [v6 cachePath];
      v12 = [v6 state];
      [v6 threshold];
      int v14 = v13;
      uint64_t v15 = [v6 requestRevision];
      uint64_t v16 = [v6 torsoprintRequestRevision];
      LODWORD(v17) = v14;
      uint64_t v18 = [(VNClustererBuilder *)v9 initWithType:v10 cachePath:v11 state:v12 threshold:v15 requestRevision:v16 torsoprintRequestRevision:a4 error:v17];
LABEL_8:
      id v19 = (void *)v18;

      goto LABEL_10;
    }
    id v20 = [v6 type];
    int v21 = [v20 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"];

    if (v21)
    {
      uint64_t v22 = [VNClustererBuilder alloc];
      v10 = [v6 type];
      v11 = [v6 cachePath];
      v12 = [v6 state];
      [v6 threshold];
      int v24 = v23;
      [v6 torsoThreshold];
      int v26 = v25;
      uint64_t v27 = [v6 requestRevision];
      uint64_t v28 = [v6 torsoprintRequestRevision];
      LODWORD(v29) = v24;
      LODWORD(v30) = v26;
      uint64_t v18 = [(VNClustererBuilder *)v22 initWithType:v10 cachePath:v11 state:v12 threshold:v27 torsoThreshold:v28 requestRevision:a4 torsoprintRequestRevision:v29 error:v30];
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"options parameter cannot be nil"];
    id v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v19 = 0;
LABEL_10:

  return v19;
}

@end