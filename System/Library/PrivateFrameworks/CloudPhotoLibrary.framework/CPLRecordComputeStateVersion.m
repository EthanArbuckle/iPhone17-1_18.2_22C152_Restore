@interface CPLRecordComputeStateVersion
- (BOOL)isEqual:(id)a3;
- (CPLRecordComputeStateVersion)initWithMajorVersion:(unint64_t)a3 stage:(unint64_t)a4;
- (CPLRecordComputeStateVersion)initWithString:(id)a3;
- (id)asString;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)majorVersion;
- (unint64_t)stage;
@end

@implementation CPLRecordComputeStateVersion

- (unint64_t)stage
{
  return self->_stage;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (id)asString
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithUnsignedInteger:self->_majorVersion];
  v5 = [NSNumber numberWithUnsignedInteger:self->_stage];
  v6 = (void *)[v3 initWithFormat:@"%@.%@", v4, v5];

  return v6;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  unint64_t majorVersion = self->_majorVersion;
  unint64_t v6 = v4[1];
  if (majorVersion <= v6)
  {
    if (majorVersion == v6)
    {
      unint64_t stage = self->_stage;
      unint64_t v9 = v4[2];
      BOOL v10 = stage > v9;
      if (stage == v9) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = -1;
      }
      if (v10) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = v11;
      }
    }
    else
    {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_majorVersion;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLRecordComputeStateVersion *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_majorVersion == v4->_majorVersion && self->_stage == v4->_stage;
  }

  return v5;
}

- (CPLRecordComputeStateVersion)initWithMajorVersion:(unint64_t)a3 stage:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPLRecordComputeStateVersion;
  result = [(CPLRecordComputeStateVersion *)&v7 init];
  if (result)
  {
    result->_unint64_t majorVersion = a3;
    result->_unint64_t stage = a4;
  }
  return result;
}

- (CPLRecordComputeStateVersion)initWithString:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  BOOL v5 = [v4 firstObject];
  uint64_t v6 = [v5 integerValue];

  if ([v4 count] == 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = [v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v8 integerValue];
  }
  unint64_t v9 = [(CPLRecordComputeStateVersion *)self initWithMajorVersion:v6 stage:v7];

  return v9;
}

@end