@interface HMEEventMetadata
- (HMEEventMetadata)initWithSource:(id)a3 cachePolicy:(unint64_t)a4 combineType:(unint64_t)a5 timestamp:(double)a6;
- (NSString)source;
- (double)intervalSinceReferenceDate;
- (id)_initWithSource:(id)a3 rawCachePolicy:(unint64_t)a4 rawCombineType:(unint64_t)a5 rawQos:(unint64_t)a6 timestamp:(double)a7;
- (id)initDefaultMetadata;
- (unint64_t)cachePolicy;
- (unint64_t)combineType;
- (unint64_t)rawCachePolicy;
- (unint64_t)rawCombineType;
- (unint64_t)rawQOS;
@end

@implementation HMEEventMetadata

- (void).cxx_destruct
{
}

- (unint64_t)rawQOS
{
  return self->_rawQOS;
}

- (unint64_t)rawCachePolicy
{
  return self->_rawCachePolicy;
}

- (unint64_t)rawCombineType
{
  return self->_rawCombineType;
}

- (double)intervalSinceReferenceDate
{
  return self->_intervalSinceReferenceDate;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)combineType
{
  unint64_t result = [(HMEEventMetadata *)self rawCombineType];
  if (result >= 3) {
    return 0;
  }
  return result;
}

- (unint64_t)cachePolicy
{
  unint64_t result = [(HMEEventMetadata *)self rawCachePolicy];
  if (result >= 3) {
    return 0;
  }
  return result;
}

- (id)_initWithSource:(id)a3 rawCachePolicy:(unint64_t)a4 rawCombineType:(unint64_t)a5 rawQos:(unint64_t)a6 timestamp:(double)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMEEventMetadata;
  v14 = [(HMEEventMetadata *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a3);
    v15->_rawCombineType = a5;
    v15->_rawCachePolicy = a4;
    v15->_rawQOS = a6;
    v15->_intervalSinceReferenceDate = a7;
  }

  return v15;
}

- (HMEEventMetadata)initWithSource:(id)a3 cachePolicy:(unint64_t)a4 combineType:(unint64_t)a5 timestamp:(double)a6
{
  return (HMEEventMetadata *)[(HMEEventMetadata *)self _initWithSource:a3 rawCachePolicy:a4 rawCombineType:a5 rawQos:0 timestamp:a6];
}

- (id)initDefaultMetadata
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return -[HMEEventMetadata initWithSource:cachePolicy:combineType:timestamp:](self, "initWithSource:cachePolicy:combineType:timestamp:", @"unknown", 1, 1);
}

@end