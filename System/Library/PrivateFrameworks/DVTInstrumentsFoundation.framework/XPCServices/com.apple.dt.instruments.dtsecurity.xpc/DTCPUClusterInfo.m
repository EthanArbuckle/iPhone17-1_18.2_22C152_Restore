@interface DTCPUClusterInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEfficiencyCore;
- (BOOL)isPerformanceCore;
- (DTCPUClusterInfo)initWithClusterID:(unint64_t)a3 flags:(unint64_t)a4;
- (DTCPUClusterInfo)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)clusterFlags;
- (unint64_t)clusterID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DTCPUClusterInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"DTCPUClusterInfo.m", 17, @"Invalid parameter not satisfying: %@", @"coder.allowsKeyedCoding" object file lineNumber description];
  }
  [v6 encodeInteger:self->_clusterID forKey:@"_clusterID"];
  [v6 encodeInteger:self->_clusterFlags forKey:@"_clusterFlags"];
}

- (DTCPUClusterInfo)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DTCPUClusterInfo.m", 23, @"Invalid parameter not satisfying: %@", @"coder.allowsKeyedCoding" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)DTCPUClusterInfo;
  id v6 = [(DTCPUClusterInfo *)&v9 init];
  if (v6)
  {
    v6->_clusterID = (unint64_t)[v5 decodeIntegerForKey:@"_clusterID"];
    v6->_clusterFlags = (unint64_t)[v5 decodeIntegerForKey:@"_clusterFlags"];
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@: %p> cluster id: %lu, flags: 0x%lx", v4, self, self->_clusterID, self->_clusterFlags];

  return v5;
}

- (DTCPUClusterInfo)initWithClusterID:(unint64_t)a3 flags:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DTCPUClusterInfo;
  result = [(DTCPUClusterInfo *)&v7 init];
  if (result)
  {
    result->_clusterID = a3;
    result->_clusterFlags = a4;
  }
  return result;
}

- (BOOL)isEfficiencyCore
{
  return self->_clusterFlags & 1;
}

- (BOOL)isPerformanceCore
{
  return (LOBYTE(self->_clusterFlags) >> 1) & 1;
}

- (unint64_t)clusterID
{
  return self->_clusterID;
}

- (unint64_t)clusterFlags
{
  return self->_clusterFlags;
}

@end