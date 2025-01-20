@interface VNClustererQuery
+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5;
+ (id)clustererQueryWithOptions:(id)a3 error:(id *)a4;
+ (id)distanceBetweenFacesWithFaceObservation:(id)a3 andFaceObservation:(id)a4 error:(id *)a5;
+ (id)distanceBetweenFacesWithFaceprint:(id)a3 andFaceprint:(id)a4 error:(id *)a5;
+ (id)nonGroupedGroupID;
+ (id)representativenessForFaces:(id)a3 error:(id *)a4;
- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8;
- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10;
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

@implementation VNClustererQuery

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

- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v29.receiver = self;
  v29.super_class = (Class)VNClustererQuery;
  v21 = [(VNClustererQuery *)&v29 init];
  if (v21
    && [v18 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"]
    && (v22 = [VNClustererReadOnlyContext alloc],
        *(float *)&double v23 = a6,
        *(float *)&double v24 = a7,
        uint64_t v25 = [(VNClustererReadOnlyContext *)v22 initWithType:v18 cachePath:v19 state:v20 threshold:a8 torsoThreshold:a9 requestRevision:a10 torsoprintRequestRevision:v23 error:v24], context = v21->_context, v21->_context = (VNClustererModelQuerying *)v25, context, v21->_context))
  {
    v27 = v21;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (VNClustererQuery)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VNClustererQuery;
  v17 = [(VNClustererQuery *)&v24 init];
  if (v17
    && [v14 isEqualToString:@"VNClusteringAlgorithm_Greedy"]
    && (id v18 = [VNClustererReadOnlyContext alloc],
        *(float *)&double v19 = a6,
        uint64_t v20 = [(VNClustererReadOnlyContext *)v18 initWithType:v14 cachePath:v15 state:v16 threshold:a7 requestRevision:a8 error:v19], context = v17->_context, v17->_context = (VNClustererModelQuerying *)v20, context, v17->_context))
  {
    v22 = v17;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)nonGroupedGroupID
{
  return +[VNClustererReadOnlyContext nonGroupedGroupID];
}

+ (id)clustererModelFileNamesFromState:(id)a3 storedInPath:(id)a4 error:(id *)a5
{
  v5 = +[VNClustererReadOnlyContext clustererModelFileNamesFromState:a3 storedInPath:a4 error:a5];

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

+ (id)clustererQueryWithOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 type];
    int v8 = [v7 isEqualToString:@"VNClusteringAlgorithm_Greedy"];

    if (v8)
    {
      v9 = [VNClustererQuery alloc];
      v10 = [v6 type];
      v11 = [v6 cachePath];
      v12 = [v6 state];
      [v6 threshold];
      int v14 = v13;
      uint64_t v15 = [v6 requestRevision];
      LODWORD(v16) = v14;
      uint64_t v17 = [(VNClustererQuery *)v9 initWithType:v10 cachePath:v11 state:v12 threshold:v15 requestRevision:a4 error:v16];
LABEL_8:
      id v18 = (void *)v17;

      goto LABEL_10;
    }
    double v19 = [v6 type];
    int v20 = [v19 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"];

    if (v20)
    {
      v21 = [VNClustererQuery alloc];
      v10 = [v6 type];
      v11 = [v6 cachePath];
      v12 = [v6 state];
      [v6 threshold];
      int v23 = v22;
      [v6 torsoThreshold];
      int v25 = v24;
      uint64_t v26 = [v6 requestRevision];
      uint64_t v27 = [v6 torsoprintRequestRevision];
      LODWORD(v28) = v23;
      LODWORD(v29) = v25;
      uint64_t v17 = [(VNClustererQuery *)v21 initWithType:v10 cachePath:v11 state:v12 threshold:v26 torsoThreshold:v27 requestRevision:a4 torsoprintRequestRevision:v28 error:v29];
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"options parameter cannot be nil"];
    id v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v18 = 0;
LABEL_10:

  return v18;
}

@end