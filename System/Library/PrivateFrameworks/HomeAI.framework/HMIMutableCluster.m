@interface HMIMutableCluster
- (HMIFaceRecognition)faceRecognition;
- (HMIMutableCluster)initWithFaceprint:(id)a3;
- (HMIMutableCluster)initWithTorsoprint:(id)a3;
- (HMIMutableFloatArray)faceCentroid;
- (HMIMutableFloatArray)torsoCentroid;
- (NSMutableArray)faceprintUUIDs;
- (NSMutableArray)torsoprintUUIDs;
- (NSMutableArray)torsoprints;
- (NSMutableSet)linkedEntityUUIDs;
- (unint64_t)faceCount;
- (unint64_t)torsoCount;
- (void)addFaceprints:(id)a3;
- (void)addLinkedEntityUUIDs:(id)a3;
- (void)addTorsoprints:(id)a3;
- (void)flushTorsoprints;
- (void)setFaceRecognition:(id)a3;
- (void)setFaceprintUUIDs:(id)a3;
- (void)setLinkedEntityUUIDs:(id)a3;
- (void)setTorsoprintUUIDs:(id)a3;
- (void)setTorsoprints:(id)a3;
@end

@implementation HMIMutableCluster

- (HMIMutableCluster)initWithFaceprint:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMIMutableCluster;
  v5 = [(HMIMutableCluster *)&v25 init];
  if (v5)
  {
    v6 = [HMIMutableFloatArray alloc];
    v7 = [v4 data];
    uint64_t v8 = [(HMIMutableFloatArray *)v6 initWithData:v7];
    faceCentroid = v5->_faceCentroid;
    v5->_faceCentroid = (HMIMutableFloatArray *)v8;

    v10 = [HMIMutableFloatArray alloc];
    v11 = [(HMIMutableCluster *)v5 faceCentroid];
    uint64_t v12 = -[HMIMutableFloatArray initWithValue:count:](v10, "initWithValue:count:", [v11 count], 0.0);
    torsoCentroid = v5->_torsoCentroid;
    v5->_torsoCentroid = (HMIMutableFloatArray *)v12;

    v14 = (void *)MEMORY[0x263EFF980];
    v15 = [v4 UUID];
    uint64_t v16 = [v14 arrayWithObject:v15];
    faceprintUUIDs = v5->_faceprintUUIDs;
    v5->_faceprintUUIDs = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x263EFF980] array];
    torsoprintUUIDs = v5->_torsoprintUUIDs;
    v5->_torsoprintUUIDs = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    linkedEntityUUIDs = v5->_linkedEntityUUIDs;
    v5->_linkedEntityUUIDs = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF980] array];
    torsoprints = v5->_torsoprints;
    v5->_torsoprints = (NSMutableArray *)v22;
  }
  return v5;
}

- (HMIMutableCluster)initWithTorsoprint:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMIMutableCluster;
  v5 = [(HMIMutableCluster *)&v25 init];
  if (v5)
  {
    v6 = [HMIMutableFloatArray alloc];
    v7 = [v4 data];
    uint64_t v8 = [(HMIMutableFloatArray *)v6 initWithData:v7];
    torsoCentroid = v5->_torsoCentroid;
    v5->_torsoCentroid = (HMIMutableFloatArray *)v8;

    v10 = [HMIMutableFloatArray alloc];
    v11 = [(HMIMutableCluster *)v5 torsoCentroid];
    uint64_t v12 = -[HMIMutableFloatArray initWithValue:count:](v10, "initWithValue:count:", [v11 count], 0.0);
    faceCentroid = v5->_faceCentroid;
    v5->_faceCentroid = (HMIMutableFloatArray *)v12;

    uint64_t v14 = [MEMORY[0x263EFF980] array];
    faceprintUUIDs = v5->_faceprintUUIDs;
    v5->_faceprintUUIDs = (NSMutableArray *)v14;

    uint64_t v16 = (void *)MEMORY[0x263EFF980];
    v17 = [v4 UUID];
    uint64_t v18 = [v16 arrayWithObject:v17];
    torsoprintUUIDs = v5->_torsoprintUUIDs;
    v5->_torsoprintUUIDs = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    linkedEntityUUIDs = v5->_linkedEntityUUIDs;
    v5->_linkedEntityUUIDs = (NSMutableSet *)v20;

    if ([v4 lowQuality] & 1) != 0 || (objc_msgSend(v4, "unrecognizable"))
    {
      uint64_t v22 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      uint64_t v22 = [MEMORY[0x263EFF980] arrayWithObject:v4];
    }
    torsoprints = v5->_torsoprints;
    v5->_torsoprints = (NSMutableArray *)v22;
  }
  return v5;
}

- (unint64_t)faceCount
{
  return [(NSMutableArray *)self->_faceprintUUIDs count];
}

- (unint64_t)torsoCount
{
  return [(NSMutableArray *)self->_torsoprintUUIDs count];
}

- (NSMutableArray)faceprintUUIDs
{
  v2 = (void *)[(NSMutableArray *)self->_faceprintUUIDs copy];
  return (NSMutableArray *)v2;
}

- (NSMutableArray)torsoprintUUIDs
{
  v2 = (void *)[(NSMutableArray *)self->_torsoprintUUIDs copy];
  return (NSMutableArray *)v2;
}

- (void)addLinkedEntityUUIDs:(id)a3
{
}

- (NSMutableSet)linkedEntityUUIDs
{
  v2 = (void *)[(NSMutableSet *)self->_linkedEntityUUIDs copy];
  return (NSMutableSet *)v2;
}

- (void)addFaceprints:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[(HMIMutableFloatArray *)self->_faceCentroid copy];
  *(float *)&double v6 = (float)[(HMIMutableCluster *)self faceCount];
  [v5 scale:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [HMIMutableFloatArray alloc];
        v13 = [v11 data];
        uint64_t v14 = [(HMIMutableFloatArray *)v12 initWithData:v13];

        [v5 add:v14];
        faceprintUUIDs = self->_faceprintUUIDs;
        uint64_t v16 = [v11 UUID];
        [(NSMutableArray *)faceprintUUIDs addObject:v16];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  *(float *)&double v17 = 1.0 / (float)[(HMIMutableCluster *)self faceCount];
  uint64_t v18 = [v5 floatArrayByScaling:v17];
  faceCentroid = self->_faceCentroid;
  self->_faceCentroid = v18;
}

- (void)addTorsoprints:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[(HMIMutableFloatArray *)self->_torsoCentroid copy];
  *(float *)&double v6 = (float)[(HMIMutableCluster *)self torsoCount];
  [v5 scale:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = [HMIMutableFloatArray alloc];
        v13 = [v11 data];
        uint64_t v14 = [(HMIMutableFloatArray *)v12 initWithData:v13];

        [v5 add:v14];
        torsoprintUUIDs = self->_torsoprintUUIDs;
        uint64_t v16 = [v11 UUID];
        [(NSMutableArray *)torsoprintUUIDs addObject:v16];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  *(float *)&double v17 = 1.0 / (float)[(HMIMutableCluster *)self torsoCount];
  uint64_t v18 = [v5 floatArrayByScaling:v17];
  torsoCentroid = self->_torsoCentroid;
  self->_torsoCentroid = v18;

  uint64_t v20 = objc_msgSend(obj, "na_filter:", &__block_literal_global_0);
  [(NSMutableArray *)self->_torsoprints addObjectsFromArray:v20];
  if ((unint64_t)[(NSMutableArray *)self->_torsoprints count] >= 0x15) {
    -[NSMutableArray removeObjectsInRange:](self->_torsoprints, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_torsoprints count] - 20);
  }
}

uint64_t __36__HMIMutableCluster_addTorsoprints___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 lowQuality]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 unrecognizable] ^ 1;
  }

  return v3;
}

- (void)flushTorsoprints
{
  self->_torsoprints = [MEMORY[0x263EFF980] array];
  MEMORY[0x270F9A758]();
}

- (HMIMutableFloatArray)faceCentroid
{
  return (HMIMutableFloatArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMIMutableFloatArray)torsoCentroid
{
  return (HMIMutableFloatArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFaceprintUUIDs:(id)a3
{
}

- (void)setTorsoprintUUIDs:(id)a3
{
}

- (void)setLinkedEntityUUIDs:(id)a3
{
}

- (HMIFaceRecognition)faceRecognition
{
  return (HMIFaceRecognition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFaceRecognition:(id)a3
{
}

- (NSMutableArray)torsoprints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTorsoprints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceRecognition, 0);
  objc_storeStrong((id *)&self->_linkedEntityUUIDs, 0);
  objc_storeStrong((id *)&self->_torsoprintUUIDs, 0);
  objc_storeStrong((id *)&self->_faceprintUUIDs, 0);
  objc_storeStrong((id *)&self->_torsoCentroid, 0);
  objc_storeStrong((id *)&self->_faceCentroid, 0);
}

@end