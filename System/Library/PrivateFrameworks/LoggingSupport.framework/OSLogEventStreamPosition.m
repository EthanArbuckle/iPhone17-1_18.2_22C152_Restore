@interface OSLogEventStreamPosition
+ (BOOL)supportsSecureCoding;
- (OSLogEventStreamPosition)initWithCoder:(id)a3;
- (OSLogEventStreamPosition)initWithSource:(const char *)a3 bootUUID:(const char *)a4 time:(unint64_t)a5;
- (const)UUID;
- (const)sourceUUID;
- (unint64_t)continuousTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEventStreamPosition

- (OSLogEventStreamPosition)initWithSource:(const char *)a3 bootUUID:(const char *)a4 time:(unint64_t)a5
{
  result = [(OSLogEventStreamPosition *)self init];
  if (result)
  {
    *(_OWORD *)result->_source = *(_OWORD *)a3;
    *(_OWORD *)result->_uuid = *(_OWORD *)a4;
    result->_ct = a5;
  }
  return result;
}

- (unint64_t)continuousTime
{
  return self->_ct;
}

- (const)UUID
{
  return (const char *)self->_uuid;
}

- (const)sourceUUID
{
  return (const char *)self->_source;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithUUIDBytes:self->_source];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_uuid];
  [v5 encodeObject:v7 forKey:@"Source"];
  [v5 encodeObject:v6 forKey:@"UUID"];
  [v5 encodeInt64:self->_ct forKey:@"Time"];
}

- (OSLogEventStreamPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(OSLogEventStreamPosition *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Source"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    [v6 getUUIDBytes:v5->_source];
    [v7 getUUIDBytes:v5->_uuid];
    v5->_ct = [v4 decodeInt64ForKey:@"Time"];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end