@interface VNClustererBuilderOptions
- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6;
- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7;
- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8;
@end

@implementation VNClustererBuilderOptions

- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, a8, 1);
}

- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:](self, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", a3, a4, a5, 1, 1);
}

- (VNClustererBuilderOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6
{
  return -[VNClustererOptions initWithType:cachePath:state:threshold:requestRevision:](self, "initWithType:cachePath:state:threshold:requestRevision:", a3, a4, a5, 1);
}

@end