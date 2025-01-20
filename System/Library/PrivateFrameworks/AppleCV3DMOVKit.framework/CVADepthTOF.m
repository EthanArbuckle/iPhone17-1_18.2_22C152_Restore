@interface CVADepthTOF
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (ADJasperPointCloud)pointCloud;
- (CVADepthTOF)initWithADJasperPointCloud:(id)a3 timestamp:(double)a4;
- (CVADepthTOF)initWithAVPointCloudData:(id)a3 timestamp:(double)a4;
- (CVADepthTOF)initWithCVDataBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 projectorMode:(int64_t)a5;
- (CVADepthTOF)initWithCoder:(id)a3;
- (CVADepthTOF)initWithJasperDepth:(id)a3 timestamp:(double)a4 projectorMode:(int64_t)a5;
- (NSDictionary)data;
- (NSDictionary)metadata;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (int64_t)projectorMode;
- (unint64_t)frameId;
- (unint64_t)syncTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setData:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setPointCloud:(id)a3;
- (void)setProjectorMode:(int64_t)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CVADepthTOF

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58BB8 == -1)
  {
    v2 = (void *)qword_267C58BB0;
  }
  else
  {
    dispatch_once(&qword_267C58BB8, &unk_26CB5E358);
    v2 = (void *)qword_267C58BB0;
  }
  return v2;
}

- (CVADepthTOF)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CVADepthTOF *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    if ([v4 containsValueForKey:@"p"]) {
      uint64_t v8 = [v4 decodeIntegerForKey:@"p"];
    }
    else {
      uint64_t v8 = 0;
    }
    v5->_projectorMode = v8;
    uint64_t v9 = [v4 decodeObjectForKey:@"m"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v9;

    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
    v11 = [v4 decodeObjectForKey:@"d"];
    if (v11)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263F26C00]) initWithDictionaryRepresentation:v11];
      pointCloud = v5->_pointCloud;
      v5->_pointCloud = (ADJasperPointCloud *)v12;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_data forKey:@"d"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInteger:self->_projectorMode forKey:@"p"];
  [v5 encodeObject:self->_metadata forKey:@"m"];
  [v5 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v5 encodeInt64:self->_frameId forKey:@"fi"];
}

- (void)reset
{
}

- (CVADepthTOF)initWithADJasperPointCloud:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVADepthTOF;
  uint64_t v8 = [(CVADepthTOF *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_timestamp = a4;
    objc_storeStrong((id *)&v8->_pointCloud, a3);
    v9->_projectorMode = 0;
    uint64_t v10 = [(ADJasperPointCloud *)v9->_pointCloud dictionaryRepresentation];
    data = v9->_data;
    v9->_data = (NSDictionary *)v10;
  }
  return v9;
}

- (CVADepthTOF)initWithAVPointCloudData:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F26C00];
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "makeWithDataBuffer:", objc_msgSend(v8, "pointCloudDataBuffer"));
  uint64_t v10 = [(CVADepthTOF *)self initWithADJasperPointCloud:v9 timestamp:a4];
  SEL v11 = NSSelectorFromString(&cfstr_Projectormode.isa);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F088D8]) initWithTarget:v8 selector:v11 object:0];
    [v12 start];
    int64_t v15 = 0;
    objc_super v13 = [v12 result];
    [v13 getValue:&v15];

    v10->_projectorMode = v15;
  }

  return v10;
}

- (CVADepthTOF)initWithCVDataBufferRef:(__CVBuffer *)a3 timestamp:(double)a4 projectorMode:(int64_t)a5
{
  id v8 = [MEMORY[0x263F26C00] makeWithDataBuffer:a3];
  uint64_t v9 = [(CVADepthTOF *)self initWithADJasperPointCloud:v8 timestamp:a4];
  v9->_projectorMode = a5;

  return v9;
}

- (CVADepthTOF)initWithJasperDepth:(id)a3 timestamp:(double)a4 projectorMode:(int64_t)a5
{
  id v8 = [a3 dictionaryRepresentation];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F26C00]) initWithDictionaryRepresentation:v8];
  uint64_t v10 = [(CVADepthTOF *)self initWithADJasperPointCloud:v9 timestamp:a4];
  v10->_projectorMode = a5;

  return v10;
}

- (id)dictionary
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"t";
  v3 = [NSNumber numberWithDouble:self->_timestamp];
  v11[0] = v3;
  v10[1] = @"pc";
  id v4 = [(ADJasperPointCloud *)self->_pointCloud dictionaryRepresentation];
  v11[1] = v4;
  v10[2] = @"p";
  id v5 = [NSNumber numberWithInteger:self->_projectorMode];
  v11[2] = v5;
  v10[3] = @"st";
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v11[3] = v6;
  v10[4] = @"fi";
  id v7 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v11[4] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVADepthTOF *)self dictionary];
  id v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)projectorMode
{
  return self->_projectorMode;
}

- (void)setProjectorMode:(int64_t)a3
{
  self->_projectorMode = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (ADJasperPointCloud)pointCloud
{
  return self->_pointCloud;
}

- (void)setPointCloud:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_pointCloud, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end