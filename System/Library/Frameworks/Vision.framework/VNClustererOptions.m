@interface VNClustererOptions
- (NSData)state;
- (NSString)cachePath;
- (NSString)type;
- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6;
- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7;
- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7;
- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8;
- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9;
- (float)threshold;
- (float)torsoThreshold;
- (unint64_t)requestRevision;
- (unint64_t)torsoprintRequestRevision;
- (void)setCachePath:(id)a3;
- (void)setRequestRevision:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)setThreshold:(float)a3;
- (void)setTorsoThreshold:(float)a3;
- (void)setTorsoprintRequestRevision:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation VNClustererOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setTorsoprintRequestRevision:(unint64_t)a3
{
  self->_torsoprintRequestRevision = a3;
}

- (unint64_t)torsoprintRequestRevision
{
  return self->_torsoprintRequestRevision;
}

- (void)setRequestRevision:(unint64_t)a3
{
  self->_requestRevision = a3;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void)setTorsoThreshold:(float)a3
{
  self->_torsoThreshold = a3;
}

- (float)torsoThreshold
{
  return self->_torsoThreshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setState:(id)a3
{
}

- (NSData)state
{
  return self->_state;
}

- (void)setCachePath:(id)a3
{
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, 1, 1);
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, 1, 1);
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v23.receiver = self;
  v23.super_class = (Class)VNClustererOptions;
  v20 = [(VNClustererOptions *)&v23 init];
  if (!v20) {
    goto LABEL_6;
  }
  v21 = 0;
  if (v17 && v18)
  {
    if ([v17 isEqualToString:@"VNClusteringAlgorithm_GreedyWithTorso"])
    {
      objc_storeStrong((id *)&v20->_type, a3);
      objc_storeStrong((id *)&v20->_cachePath, a4);
      v20->_threshold = a6;
      objc_storeStrong((id *)&v20->_state, a5);
      v20->_torsoThreshold = a7;
      v20->_requestRevision = a8;
      v20->_torsoprintRequestRevision = a9;
      v21 = v20;
      goto LABEL_7;
    }
LABEL_6:
    v21 = 0;
  }
LABEL_7:

  return v21;
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VNClustererOptions;
  v16 = [(VNClustererOptions *)&v19 init];
  if (!v16) {
    goto LABEL_6;
  }
  id v17 = 0;
  if (v13 && v14)
  {
    if ([v13 isEqualToString:@"VNClusteringAlgorithm_Greedy"])
    {
      objc_storeStrong((id *)&v16->_type, a3);
      objc_storeStrong((id *)&v16->_cachePath, a4);
      v16->_threshold = a6;
      objc_storeStrong((id *)&v16->_state, a5);
      v16->_torsoThreshold = 0.0;
      v16->_requestRevision = a7;
      v16->_torsoprintRequestRevision = 1;
      id v17 = v16;
      goto LABEL_7;
    }
LABEL_6:
    id v17 = 0;
  }
LABEL_7:

  return v17;
}

- (VNClustererOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, a8, 1);
}

@end