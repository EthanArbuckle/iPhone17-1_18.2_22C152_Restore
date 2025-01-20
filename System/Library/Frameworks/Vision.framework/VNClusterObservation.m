@interface VNClusterObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)clusters;
- (NSArray)groupedClusteredFaceIdsForCluster;
- (NSArray)suggestionsForCluster;
- (NSData)clusterState;
- (NSDictionary)distancesById;
- (NSNumber)distance;
- (NSSet)clusteredFaceIds;
- (VNClusterObservation)initWithCoder:(id)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClusterState:(id)a3;
- (void)setClusteredFaceIds:(id)a3;
- (void)setClusters:(id)a3;
- (void)setDistance:(id)a3;
- (void)setDistancesById:(id)a3;
- (void)setGroupedClusteredFaceIdsForCluster:(id)a3;
- (void)setSuggestionsForCluster:(id)a3;
@end

@implementation VNClusterObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancesById, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_groupedClusteredFaceIdsForCluster, 0);
  objc_storeStrong((id *)&self->_clusteredFaceIds, 0);
  objc_storeStrong((id *)&self->_clusterState, 0);
  objc_storeStrong((id *)&self->_suggestionsForCluster, 0);

  objc_storeStrong((id *)&self->_clusters, 0);
}

- (void)setDistancesById:(id)a3
{
}

- (NSDictionary)distancesById
{
  return self->_distancesById;
}

- (void)setDistance:(id)a3
{
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setGroupedClusteredFaceIdsForCluster:(id)a3
{
}

- (NSArray)groupedClusteredFaceIdsForCluster
{
  return self->_groupedClusteredFaceIdsForCluster;
}

- (void)setClusteredFaceIds:(id)a3
{
}

- (NSSet)clusteredFaceIds
{
  return self->_clusteredFaceIds;
}

- (void)setClusterState:(id)a3
{
}

- (NSData)clusterState
{
  return self->_clusterState;
}

- (void)setSuggestionsForCluster:(id)a3
{
}

- (NSArray)suggestionsForCluster
{
  return self->_suggestionsForCluster;
}

- (void)setClusters:(id)a3
{
}

- (NSArray)clusters
{
  return self->_clusters;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNClusterObservation *)a3;
  if (self == v4)
  {
    char v26 = 1;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VNClusterObservation;
    if ([(VNObservation *)&v28 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = [(VNClusterObservation *)self clusters];
      v7 = [(VNClusterObservation *)v5 clusters];
      char v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) == 0) {
        goto LABEL_13;
      }
      v9 = [(VNClusterObservation *)self suggestionsForCluster];
      v10 = [(VNClusterObservation *)v5 suggestionsForCluster];
      char v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0) {
        goto LABEL_13;
      }
      v12 = [(VNClusterObservation *)self clusterState];
      v13 = [(VNClusterObservation *)v5 clusterState];
      char v14 = VisionCoreEqualOrNilObjects();

      if ((v14 & 1) == 0) {
        goto LABEL_13;
      }
      v15 = [(VNClusterObservation *)self clusteredFaceIds];
      v16 = [(VNClusterObservation *)v5 clusteredFaceIds];
      char v17 = VisionCoreEqualOrNilObjects();

      if ((v17 & 1) == 0) {
        goto LABEL_13;
      }
      v18 = [(VNClusterObservation *)self groupedClusteredFaceIdsForCluster];
      v19 = [(VNClusterObservation *)v5 groupedClusteredFaceIdsForCluster];
      char v20 = VisionCoreEqualOrNilObjects();

      if ((v20 & 1) == 0) {
        goto LABEL_13;
      }
      v21 = [(VNClusterObservation *)self distance];
      v22 = [(VNClusterObservation *)v5 distance];
      char v23 = VisionCoreEqualOrNilObjects();

      if (v23)
      {
        v24 = [(VNClusterObservation *)self distancesById];
        v25 = [(VNClusterObservation *)v5 distancesById];
        char v26 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_13:
        char v26 = 0;
      }
    }
    else
    {
      char v26 = 0;
    }
  }

  return v26;
}

- (id)vn_cloneObject
{
  v19.receiver = self;
  v19.super_class = (Class)VNClusterObservation;
  v3 = [(VNObservation *)&v19 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_clusters copy];
    v5 = (void *)v3[12];
    v3[12] = v4;

    uint64_t v6 = [(NSArray *)self->_suggestionsForCluster copy];
    v7 = (void *)v3[13];
    v3[13] = v6;

    uint64_t v8 = [(NSData *)self->_clusterState copy];
    v9 = (void *)v3[14];
    v3[14] = v8;

    uint64_t v10 = [(NSSet *)self->_clusteredFaceIds copy];
    char v11 = (void *)v3[15];
    v3[15] = v10;

    uint64_t v12 = [(NSArray *)self->_groupedClusteredFaceIdsForCluster copy];
    v13 = (void *)v3[16];
    v3[16] = v12;

    uint64_t v14 = [(NSNumber *)self->_distance copy];
    v15 = (void *)v3[17];
    v3[17] = v14;

    uint64_t v16 = [(NSDictionary *)self->_distancesById copy];
    char v17 = (void *)v3[18];
    v3[18] = v16;
  }

  return v3;
}

- (unint64_t)hash
{
  v19.receiver = self;
  v19.super_class = (Class)VNClusterObservation;
  id v3 = [(VNObservation *)&v19 hash];
  uint64_t v4 = [(VNClusterObservation *)self clusters];
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(VNClusterObservation *)self suggestionsForCluster];
  uint64_t v7 = [v6 hash];

  uint64_t v8 = [(VNClusterObservation *)self clusterState];
  uint64_t v9 = [v8 hash];

  uint64_t v10 = [(VNClusterObservation *)self clusteredFaceIds];
  uint64_t v11 = [v10 hash];

  uint64_t v12 = [(VNClusterObservation *)self groupedClusteredFaceIdsForCluster];
  uint64_t v13 = [v12 hash];

  uint64_t v14 = [(VNClusterObservation *)self distance];
  uint64_t v15 = [v14 hash];

  uint64_t v16 = [(VNClusterObservation *)self distancesById];
  unint64_t v17 = [v16 hash] ^ __ROR8__(v15 ^ __ROR8__(v13 ^ __ROR8__(v11 ^ __ROR8__(v9 ^ __ROR8__(v7 ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNClusterObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_clusters forKey:@"clusters"];
  [v4 encodeObject:self->_suggestionsForCluster forKey:@"suggestions"];
  [v4 encodeObject:self->_clusterState forKey:@"clusterState"];
  [v4 encodeObject:self->_clusteredFaceIds forKey:@"clusteredFaceIDs"];
  [v4 encodeObject:self->_groupedClusteredFaceIdsForCluster forKey:@"groupedClusteredFaceIDs"];
  [v4 encodeObject:self->_distance forKey:@"level0Distance"];
  [v4 encodeObject:self->_distancesById forKey:@"distancesByID"];
}

- (VNClusterObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNClusterObservation;
  objc_super v5 = [(VNObservation *)&v34 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"clusters"];
    clusters = v5->_clusters;
    v5->_clusters = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v8 forKey:@"suggestions"];
    suggestionsForCluster = v5->_suggestionsForCluster;
    v5->_suggestionsForCluster = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v8 forKey:@"groupedClusteredFaceIDs"];
    groupedClusteredFaceIdsForCluster = v5->_groupedClusteredFaceIdsForCluster;
    v5->_groupedClusteredFaceIdsForCluster = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusterState"];
    clusterState = v5->_clusterState;
    v5->_clusterState = (NSData *)v18;

    char v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"clusteredFaceIDs"];
    clusteredFaceIds = v5->_clusteredFaceIds;
    v5->_clusteredFaceIds = (NSSet *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"level0Distance"];
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v25;

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"distancesByID"];
    distancesById = v5->_distancesById;
    v5->_distancesById = (NSDictionary *)v30;

    v32 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end