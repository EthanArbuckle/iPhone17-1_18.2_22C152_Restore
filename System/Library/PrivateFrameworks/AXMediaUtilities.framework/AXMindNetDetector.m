@interface AXMindNetDetector
+ (AXMindNetDetector)detectorWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5;
- (AXMindNetDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5;
- (NSArray)filterThreshold;
- (float)nmsThreshold;
- (float)overlap_threshold;
- (float)threshold;
- (id)detect:(id)a3;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5;
- (void)setFilterThreshold:(id)a3;
- (void)setNmsThreshold:(float)a3;
- (void)setOverlap_threshold:(float)a3;
- (void)setThreshold:(float)a3;
@end

@implementation AXMindNetDetector

+ (AXMindNetDetector)detectorWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8 = a4;
  v9 = +[AXMindNetNetwork networkWithModelPath:a3 configuration:v8 modelType:a5];
  id v10 = objc_alloc((Class)a1);
  v11 = [v8 nmsThreshold];
  [v11 floatValue];
  int v13 = v12;
  v14 = [v8 filterThresholds];
  LODWORD(v15) = v13;
  v16 = (void *)[v10 initWithNetwork:v9 nmsThreshold:v14 filterThreshold:v15];

  return (AXMindNetDetector *)v16;
}

- (AXMindNetDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXMindNetDetector;
  v11 = [(AXMindNetDetector *)&v14 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_network, a3);
    v12->_nmsThreshold = a4;
    objc_storeStrong((id *)&v12->_filterThreshold, a5);
  }

  return v12;
}

- (float)threshold
{
  [(AXMindNetNetwork *)self->_network threshold];
  return result;
}

- (void)setThreshold:(float)a3
{
}

- (id)detect:(id)a3
{
  v3 = [(AXMindNetNetwork *)self->_network processCIImage:a3];

  return v3;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  id v5 = a3;

  return v5;
}

- (float)overlap_threshold
{
  return self->_overlap_threshold;
}

- (void)setOverlap_threshold:(float)a3
{
  self->_overlap_threshold = a3;
}

- (NSArray)filterThreshold
{
  return self->_filterThreshold;
}

- (void)setFilterThreshold:(id)a3
{
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterThreshold, 0);

  objc_storeStrong((id *)&self->_network, 0);
}

@end