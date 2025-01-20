@interface VNClustererQueryOptions
- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6;
- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7;
- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7;
- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8;
- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9;
@end

@implementation VNClustererQueryOptions

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (v18)
  {
    v23.receiver = self;
    v23.super_class = (Class)VNClustererQueryOptions;
    *(float *)&double v19 = a6;
    *(float *)&double v20 = a7;
    self = [(VNClustererOptions *)&v23 initWithType:v16 cachePath:v17 state:v18 threshold:a8 torsoThreshold:a9 requestRevision:v19 torsoprintRequestRevision:v20];
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 requestRevision:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)VNClustererQueryOptions;
    *(float *)&double v15 = a6;
    self = [(VNClustererOptions *)&v18 initWithType:v12 cachePath:v13 state:v14 threshold:a7 requestRevision:v15];
    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7 requestRevision:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (v16)
  {
    *(float *)&double v17 = a6;
    *(float *)&double v18 = a7;
    self = [(VNClustererQueryOptions *)self initWithType:v14 cachePath:v15 state:v16 threshold:a8 torsoThreshold:1 requestRevision:v17 torsoprintRequestRevision:v18];
    double v19 = self;
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6 torsoThreshold:(float)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v14)
  {
    *(float *)&double v15 = a6;
    *(float *)&double v16 = a7;
    self = [(VNClustererQueryOptions *)self initWithType:v12 cachePath:v13 state:v14 threshold:1 torsoThreshold:1 requestRevision:v15 torsoprintRequestRevision:v16];
    double v17 = self;
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (VNClustererQueryOptions)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 threshold:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    *(float *)&double v13 = a6;
    self = [(VNClustererQueryOptions *)self initWithType:v10 cachePath:v11 state:v12 threshold:1 torsoThreshold:1 requestRevision:v13 torsoprintRequestRevision:0.0];
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end