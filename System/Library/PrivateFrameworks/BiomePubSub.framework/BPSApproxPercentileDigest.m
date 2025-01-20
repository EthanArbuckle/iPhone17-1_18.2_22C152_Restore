@interface BPSApproxPercentileDigest
+ (BOOL)supportsSecureCoding;
- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3;
- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3 bufferMultiplier:(unint64_t)a4;
- (BPSApproxPercentileDigest)initWithCoder:(id)a3;
- (BPSApproxPercentileDigest)initWithProto:(id)a3;
- (BPSApproxPercentileDigest)initWithProtoData:(id)a3;
- (NSMutableArray)mergedCentroids;
- (NSMutableArray)unmergedCentroids;
- (double)quantileLimitForClusterIndex:(unint64_t)a3 maxCentroidCount:(unint64_t)a4;
- (double)valueAtQuantile:(double)a3;
- (float)max;
- (float)min;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)maxCentroidCount;
- (unint64_t)totalWeight;
- (unint64_t)unmergedBufferSize;
- (void)addDigest:(id)a3;
- (void)addValue:(float)a3;
- (void)addValue:(float)a3 weight:(unsigned int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)mergeCentroids;
- (void)setMax:(float)a3;
- (void)setMaxCentroidCount:(unint64_t)a3;
- (void)setMergedCentroids:(id)a3;
- (void)setMin:(float)a3;
- (void)setTotalWeight:(unint64_t)a3;
- (void)setUnmergedBufferSize:(unint64_t)a3;
- (void)setUnmergedCentroids:(id)a3;
@end

@implementation BPSApproxPercentileDigest

- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3
{
  return [(BPSApproxPercentileDigest *)self initWithCapacity:a3 bufferMultiplier:10];
}

- (BPSApproxPercentileDigest)initWithCapacity:(unint64_t)a3 bufferMultiplier:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BPSApproxPercentileDigest;
  v6 = [(BPSApproxPercentileDigest *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_maxCentroidCount = a3;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    mergedCentroids = v7->_mergedCentroids;
    v7->_mergedCentroids = (NSMutableArray *)v8;

    v7->_unmergedBufferSize = a4 * a3;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    unmergedCentroids = v7->_unmergedCentroids;
    v7->_unmergedCentroids = (NSMutableArray *)v10;

    v7->_totalWeight = 0;
  }
  return v7;
}

- (void)addValue:(float)a3 weight:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(BPSApproxPercentileDigest *)self totalWeight])
  {
    *(float *)&double v7 = a3;
    [(BPSApproxPercentileDigest *)self setMin:v7];
    *(float *)&double v8 = a3;
    [(BPSApproxPercentileDigest *)self setMax:v8];
  }
  v9 = [(BPSApproxPercentileDigest *)self unmergedCentroids];
  uint64_t v10 = [BPSApproxPercentileDigestCentroid alloc];
  *(float *)&double v11 = a3;
  v12 = [(BPSApproxPercentileDigestCentroid *)v10 initWithMeanAndWeight:v4 weight:v11];
  [v9 addObject:v12];

  [(BPSApproxPercentileDigest *)self setTotalWeight:[(BPSApproxPercentileDigest *)self totalWeight] + v4];
  objc_super v13 = [(BPSApproxPercentileDigest *)self unmergedCentroids];
  unint64_t v14 = [v13 count];
  unint64_t v15 = [(BPSApproxPercentileDigest *)self unmergedBufferSize];

  if (v14 >= v15)
  {
    [(BPSApproxPercentileDigest *)self mergeCentroids];
  }
}

- (void)addValue:(float)a3
{
}

- (double)quantileLimitForClusterIndex:(unint64_t)a3 maxCentroidCount:(unint64_t)a4
{
  double v4 = (double)a3 / (double)a4;
  if (v4 >= 0.5) {
    return (1.0 - v4) * -2.0 * (1.0 - v4) + 1.0;
  }
  else {
    return v4 * (v4 + v4);
  }
}

- (double)valueAtQuantile:(double)a3
{
  [(BPSApproxPercentileDigest *)self mergeCentroids];
  v5 = [(BPSApproxPercentileDigest *)self mergedCentroids];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [(BPSApproxPercentileDigest *)self mergedCentroids];
    uint64_t v8 = [v7 count];

    if (v8 == 2)
    {
      v9 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      uint64_t v10 = [v9 firstObject];
      [v10 mean];
      double v12 = v11;
LABEL_48:

      goto LABEL_49;
    }
    double v13 = (double)[(BPSApproxPercentileDigest *)self totalWeight] * a3;
    unint64_t v14 = [(BPSApproxPercentileDigest *)self mergedCentroids];
    v9 = [v14 firstObject];

    if ([v9 weight] >= 2 && v13 < (double)objc_msgSend(v9, "weight") * 0.5)
    {
      [(BPSApproxPercentileDigest *)self min];
      double v16 = v15;
      double v17 = (v13 + -1.0) / ((double)[v9 weight] * 0.5 + -1.0);
      [v9 mean];
      float v19 = v18;
      [(BPSApproxPercentileDigest *)self min];
      double v12 = v16 + v17 * (float)(v19 - v20);
LABEL_49:

      return v12;
    }
    if (v13 >= (double)([(BPSApproxPercentileDigest *)self totalWeight] - 1))
    {
      [(BPSApproxPercentileDigest *)self max];
      double v12 = v31;
      goto LABEL_49;
    }
    v21 = [(BPSApproxPercentileDigest *)self mergedCentroids];
    uint64_t v10 = [v21 lastObject];

    [v10 mean];
    if (v22 > 1.0)
    {
      double v23 = (double)[(BPSApproxPercentileDigest *)self totalWeight] - v13;
      if (v23 < (double)[v10 weight] * 0.5)
      {
        [(BPSApproxPercentileDigest *)self max];
        double v25 = v24;
        double v26 = (double)[(BPSApproxPercentileDigest *)self totalWeight] - v13 + -1.0;
        double v27 = v26 / ((double)[v10 weight] * 0.5 + -1.0);
        [(BPSApproxPercentileDigest *)self max];
        float v29 = v28;
        [v10 mean];
        double v12 = v25 + v27 * (float)(v29 - v30);
        goto LABEL_48;
      }
    }
    v32 = [(BPSApproxPercentileDigest *)self mergedCentroids];
    v33 = [v32 firstObject];
    unsigned int v34 = [v33 weight];

    v35 = [(BPSApproxPercentileDigest *)self mergedCentroids];
    uint64_t v36 = [v35 count];

    if (v36 == 1)
    {
LABEL_17:
      v46 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      v40 = [v46 lastObject];

      double v47 = v13 - (double)[(BPSApproxPercentileDigest *)self totalWeight];
      double v48 = v47 - (double)[v40 weight] * 0.5;
      [v40 mean];
      double v50 = v49 * 0.5 - v48;
      [v40 mean];
      float v52 = v51;
      double v53 = v51;
      [(BPSApproxPercentileDigest *)self max];
      double v55 = v54;
      double v56 = (v48 * v53 + v54 * v50) / (v48 + v50);
      if (v56 >= v53) {
        double v56 = v53;
      }
      if (v56 <= v55) {
        double v56 = v54;
      }
      if ((v50 * v55 + v53 * v48) / (v48 + v50) < v55) {
        double v55 = (v50 * v55 + v53 * v48) / (v48 + v50);
      }
      if (v55 <= v53) {
        double v55 = v53;
      }
      if (v52 <= v54) {
        double v12 = v55;
      }
      else {
        double v12 = v56;
      }
      goto LABEL_47;
    }
    unint64_t v37 = 0;
    double v38 = (double)v34 * 0.5;
    while (1)
    {
      v39 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      v40 = [v39 objectAtIndex:v37];

      v41 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      v42 = [v41 objectAtIndex:++v37];

      LODWORD(v41) = [v40 weight];
      double v43 = v38 + (double)([v42 weight] + v41) * 0.5;
      if (v43 > v13) {
        break;
      }

      v44 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      unint64_t v45 = [v44 count] - 1;

      double v38 = v43;
      if (v37 >= v45) {
        goto LABEL_17;
      }
    }
    double v57 = 0.0;
    double v58 = v13 - v38;
    double v59 = 0.0;
    if ([v40 weight] == 1 && (double v59 = 0.5, v58 < 0.5))
    {
      v60 = v40;
    }
    else
    {
      int v61 = [v42 weight];
      double v62 = v43 - v13;
      if (v61 != 1 || (double v57 = 0.5, v62 > 0.5))
      {
        double v63 = v58 - v59;
        double v64 = v62 - v57;
        [v40 mean];
        float v66 = v65;
        double v67 = v65;
        [v42 mean];
        double v69 = v68;
        double v70 = v63 + v64;
        if (v66 <= v68)
        {
          double v72 = (v63 * v69 + v67 * v64) / v70;
          if (v72 >= v69) {
            double v72 = v69;
          }
          if (v72 <= v67) {
            double v12 = v67;
          }
          else {
            double v12 = v72;
          }
        }
        else
        {
          double v71 = (v64 * v67 + v69 * v63) / v70;
          if (v71 >= v67) {
            double v71 = v67;
          }
          if (v71 <= v69) {
            double v12 = v69;
          }
          else {
            double v12 = v71;
          }
        }
        goto LABEL_46;
      }
      v60 = v42;
    }
    [v60 mean];
    double v12 = v73;
LABEL_46:

LABEL_47:
    goto LABEL_48;
  }
  return 0.0;
}

- (void)mergeCentroids
{
  v49[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_unmergedCentroids count])
  {
    [(NSMutableArray *)self->_unmergedCentroids addObjectsFromArray:self->_mergedCentroids];
    unmergedCentroids = self->_unmergedCentroids;
    double v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mean" ascending:1];
    v49[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    [(NSMutableArray *)unmergedCentroids sortUsingDescriptors:v5];

    uint64_t v6 = [(NSMutableArray *)self->_unmergedCentroids firstObject];
    double v7 = v6;
    if (v6 && [v6 weight] == 1)
    {
      [v7 mean];
      if (min >= self->_min) {
        float min = self->_min;
      }
      self->_float min = min;
    }
    v9 = [(NSMutableArray *)self->_unmergedCentroids lastObject];
    uint64_t v10 = v9;
    if (v9 && [v9 weight] == 1)
    {
      [v10 mean];
      if (max < self->_max) {
        float max = self->_max;
      }
      self->_float max = max;
    }
    [(NSMutableArray *)self->_mergedCentroids removeAllObjects];
    unint64_t totalWeight = self->_totalWeight;
    [(BPSApproxPercentileDigest *)self quantileLimitForClusterIndex:1 maxCentroidCount:[(BPSApproxPercentileDigest *)self maxCentroidCount]];
    double v14 = v13;
    [v7 mean];
    double v16 = v15;
    uint64_t v17 = [v7 weight];
    [(NSMutableArray *)self->_unmergedCentroids removeObjectAtIndex:0];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    float v18 = self->_unmergedCentroids;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      v41 = v10;
      v42 = v7;
      uint64_t v43 = 24;
      uint64_t v21 = 0;
      id v22 = 0;
      double v23 = v14 * (double)totalWeight;
      uint64_t v24 = *(void *)v45;
      uint64_t v25 = 1;
      do
      {
        uint64_t v26 = 0;
        double v27 = v22;
        do
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(id *)(*((void *)&v44 + 1) + 8 * v26);

          uint64_t v28 = v21 + v17;
          if (v23 >= (double)(v28 + (unint64_t)[v22 weight]))
          {
            uint64_t v17 = [v22 weight] + v17;
            [v22 mean];
            double v16 = v16 + (float)(v36 * (float)[v22 weight]);
          }
          else
          {
            float v29 = [(BPSApproxPercentileDigest *)self mergedCentroids];
            float v30 = [BPSApproxPercentileDigestCentroid alloc];
            *(float *)&double v31 = v16 / (double)v17;
            v32 = [(BPSApproxPercentileDigestCentroid *)v30 initWithMeanAndWeight:v17 weight:v31];
            [v29 addObject:v32];

            uint64_t v17 = [v22 weight];
            [v22 mean];
            double v16 = (float)(v33 * (float)[v22 weight]);
            ++v25;
            double v34 = (double)self->_totalWeight;
            [(BPSApproxPercentileDigest *)self quantileLimitForClusterIndex:v25 maxCentroidCount:[(BPSApproxPercentileDigest *)self maxCentroidCount]];
            double v23 = v35 * v34;
            uint64_t v21 = v28;
          }
          ++v26;
          double v27 = v22;
        }
        while (v20 != v26);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v20);

      double v7 = v42;
      uint64_t v10 = v41;
    }

    if (v17)
    {
      unint64_t v37 = [(BPSApproxPercentileDigest *)self mergedCentroids];
      double v38 = [BPSApproxPercentileDigestCentroid alloc];
      *(float *)&double v39 = v16 / (double)v17;
      v40 = [(BPSApproxPercentileDigestCentroid *)v38 initWithMeanAndWeight:v17 weight:v39];
      [v37 addObject:v40];
    }
    [(NSMutableArray *)self->_unmergedCentroids removeAllObjects];
  }
}

- (void)addDigest:(id)a3
{
  id v4 = a3;
  [v4 mergeCentroids];
  -[BPSApproxPercentileDigest setTotalWeight:](self, "setTotalWeight:", -[BPSApproxPercentileDigest totalWeight](self, "totalWeight") + [v4 totalWeight]);
  v5 = [(BPSApproxPercentileDigest *)self unmergedCentroids];
  uint64_t v6 = [v4 mergedCentroids];

  [v5 addObjectsFromArray:v6];
  [(BPSApproxPercentileDigest *)self mergeCentroids];
}

- (id)encodeAsProto
{
  v2 = [(BPSApproxPercentileDigest *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BPSApproxPercentileDigest)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    float v11 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BPSApproxPercentileDigest initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  int v6 = [v5 hasBufferMultiplier];
  double v7 = [BPSApproxPercentileDigest alloc];
  uint64_t v8 = [v5 centroidCount];
  if (v6) {
    uint64_t v9 = -[BPSApproxPercentileDigest initWithCapacity:bufferMultiplier:](v7, "initWithCapacity:bufferMultiplier:", v8, [v5 bufferMultiplier]);
  }
  else {
    uint64_t v9 = [(BPSApproxPercentileDigest *)v7 initWithCapacity:v8];
  }
  float v11 = (BPSApproxPercentileDigest *)v9;
  [v5 min];
  -[BPSApproxPercentileDigest setMin:](v11, "setMin:");
  [v5 max];
  -[BPSApproxPercentileDigest setMax:](v11, "setMax:");
  if ([v5 centroidWeightsCount])
  {
    unint64_t v12 = 0;
    do
    {
      [v5 centroidMeansAtIndex:v12];
      int v14 = v13;
      uint64_t v15 = [v5 centroidWeightsAtIndex:v12];
      double v16 = [(BPSApproxPercentileDigest *)v11 mergedCentroids];
      uint64_t v17 = [BPSApproxPercentileDigestCentroid alloc];
      LODWORD(v18) = v14;
      uint64_t v19 = [(BPSApproxPercentileDigestCentroid *)v17 initWithMeanAndWeight:v15 weight:v18];
      [v16 addObject:v19];

      [(BPSApproxPercentileDigest *)v11 setTotalWeight:[(BPSApproxPercentileDigest *)v11 totalWeight] + v15];
      ++v12;
    }
    while ([v5 centroidWeightsCount] > v12);
  }

LABEL_14:
  return v11;
}

- (BPSApproxPercentileDigest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BPSPBApproxPercentileDigest alloc] initWithData:v4];

    self = [(BPSApproxPercentileDigest *)self initWithProto:v5];
    int v6 = self;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(BPSApproxPercentileDigest *)self mergeCentroids];
  v3 = objc_opt_new();
  [(BPSApproxPercentileDigest *)self min];
  objc_msgSend(v3, "setMin:");
  [(BPSApproxPercentileDigest *)self max];
  objc_msgSend(v3, "setMax:");
  id v4 = [(BPSApproxPercentileDigest *)self mergedCentroids];
  objc_msgSend(v3, "setCentroidCount:", objc_msgSend(v4, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BPSApproxPercentileDigest *)self mergedCentroids];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 mean];
        objc_msgSend(v3, "addCentroidMeans:");
        objc_msgSend(v3, "addCentroidWeights:", objc_msgSend(v10, "weight"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BPSApproxPercentileDigest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (BPSApproxPercentileDigest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  if (v5)
  {
    self = [(BPSApproxPercentileDigest *)self initWithProtoData:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSMutableArray)mergedCentroids
{
  return self->_mergedCentroids;
}

- (void)setMergedCentroids:(id)a3
{
}

- (NSMutableArray)unmergedCentroids
{
  return self->_unmergedCentroids;
}

- (void)setUnmergedCentroids:(id)a3
{
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)a3
{
  self->_float min = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)a3
{
  self->_float max = a3;
}

- (unint64_t)maxCentroidCount
{
  return self->_maxCentroidCount;
}

- (void)setMaxCentroidCount:(unint64_t)a3
{
  self->_maxCentroidCount = a3;
}

- (unint64_t)totalWeight
{
  return self->_totalWeight;
}

- (void)setTotalWeight:(unint64_t)a3
{
  self->_unint64_t totalWeight = a3;
}

- (unint64_t)unmergedBufferSize
{
  return self->_unmergedBufferSize;
}

- (void)setUnmergedBufferSize:(unint64_t)a3
{
  self->_unmergedBufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmergedCentroids, 0);
  objc_storeStrong((id *)&self->_mergedCentroids, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_fault_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BPSPBTDigest proto", (uint8_t *)&v3, 0xCu);
}

@end