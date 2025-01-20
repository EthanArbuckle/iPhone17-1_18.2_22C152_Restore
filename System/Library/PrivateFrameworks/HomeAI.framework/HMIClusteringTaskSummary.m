@interface HMIClusteringTaskSummary
- (HMIClusteringTaskSummary)init;
- (NSError)error;
- (double)clusteringDuration;
- (double)faceprintingDuration;
- (double)totalDuration;
- (id)attributeDescriptions;
- (int64_t)numberOfClusters;
- (int64_t)numberOfFaceprintsClustered;
- (int64_t)numberOfPersonsCreated;
- (int64_t)numberOfUnknownFaceprintsAssociated;
- (void)setClusteringDuration:(double)a3;
- (void)setError:(id)a3;
- (void)setFaceprintingDuration:(double)a3;
- (void)setNumberOfClusters:(int64_t)a3;
- (void)setNumberOfFaceprintsClustered:(int64_t)a3;
- (void)setNumberOfPersonsCreated:(int64_t)a3;
- (void)setNumberOfUnknownFaceprintsAssociated:(int64_t)a3;
- (void)setTotalDuration:(double)a3;
@end

@implementation HMIClusteringTaskSummary

- (HMIClusteringTaskSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIClusteringTaskSummary;
  v2 = [(HMIClusteringTaskSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfFaceprintsClustered = 0;
    v2->_numberOfClusters = 0;
    v2->_numberOfPersonsCreated = 0;
    v2->_numberOfUnknownFaceprintsAssociated = 0;
    v2->_faceprintingDuration = 0.0;
    v2->_clusteringDuration = 0.0;
    v2->_totalDuration = 0.0;
    error = v2->_error;
    v2->_error = 0;
  }
  return v3;
}

- (id)attributeDescriptions
{
  v32[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIClusteringTaskSummary numberOfFaceprintsClustered](self, "numberOfFaceprintsClustered"));
  v30 = (void *)[v3 initWithName:@"Faceprints" value:v31];
  v32[0] = v30;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIClusteringTaskSummary numberOfClusters](self, "numberOfClusters"));
  v28 = (void *)[v4 initWithName:@"Clusters" value:v29];
  v32[1] = v28;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIClusteringTaskSummary numberOfPersonsCreated](self, "numberOfPersonsCreated"));
  v26 = (void *)[v5 initWithName:@"Persons" value:v27];
  v32[2] = v26;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMIClusteringTaskSummary numberOfUnknownFaceprintsAssociated](self, "numberOfUnknownFaceprintsAssociated"));
  v7 = (void *)[v6 initWithName:@"Associated" value:v25];
  v32[3] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = NSNumber;
  [(HMIClusteringTaskSummary *)self faceprintingDuration];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)[v8 initWithName:@"Faceprinting Duration" value:v10];
  v32[4] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = NSNumber;
  [(HMIClusteringTaskSummary *)self clusteringDuration];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)[v12 initWithName:@"Clustering Duration" value:v14];
  v32[5] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  v17 = NSNumber;
  [(HMIClusteringTaskSummary *)self totalDuration];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)[v16 initWithName:@"Total Duration" value:v18];
  v32[6] = v19;
  id v20 = objc_alloc(MEMORY[0x263F424F8]);
  v21 = [(HMIClusteringTaskSummary *)self error];
  v22 = (void *)[v20 initWithName:@"Error" value:v21];
  v32[7] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:8];

  return v23;
}

- (int64_t)numberOfFaceprintsClustered
{
  return self->_numberOfFaceprintsClustered;
}

- (void)setNumberOfFaceprintsClustered:(int64_t)a3
{
  self->_numberOfFaceprintsClustered = a3;
}

- (int64_t)numberOfClusters
{
  return self->_numberOfClusters;
}

- (void)setNumberOfClusters:(int64_t)a3
{
  self->_numberOfClusters = a3;
}

- (int64_t)numberOfPersonsCreated
{
  return self->_numberOfPersonsCreated;
}

- (void)setNumberOfPersonsCreated:(int64_t)a3
{
  self->_numberOfPersonsCreated = a3;
}

- (int64_t)numberOfUnknownFaceprintsAssociated
{
  return self->_numberOfUnknownFaceprintsAssociated;
}

- (void)setNumberOfUnknownFaceprintsAssociated:(int64_t)a3
{
  self->_numberOfUnknownFaceprintsAssociated = a3;
}

- (double)faceprintingDuration
{
  return self->_faceprintingDuration;
}

- (void)setFaceprintingDuration:(double)a3
{
  self->_faceprintingDuration = a3;
}

- (double)clusteringDuration
{
  return self->_clusteringDuration;
}

- (void)setClusteringDuration:(double)a3
{
  self->_clusteringDuration = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end