@interface MTRAccessControlClusterAccessControlTargetStruct
- (MTRAccessControlClusterAccessControlTargetStruct)init;
- (NSNumber)cluster;
- (NSNumber)deviceType;
- (NSNumber)endpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCluster:(NSNumber *)cluster;
- (void)setDeviceType:(NSNumber *)deviceType;
- (void)setEndpoint:(NSNumber *)endpoint;
@end

@implementation MTRAccessControlClusterAccessControlTargetStruct

- (MTRAccessControlClusterAccessControlTargetStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRAccessControlClusterAccessControlTargetStruct;
  v2 = [(MTRAccessControlClusterAccessControlTargetStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    cluster = v2->_cluster;
    v2->_cluster = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    deviceType = v3->_deviceType;
    v3->_deviceType = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlTargetStruct);
  v7 = objc_msgSend_cluster(self, v5, v6);
  objc_msgSend_setCluster_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endpoint(self, v9, v10);
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_deviceType(self, v13, v14);
  objc_msgSend_setDeviceType_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: cluster:%@; endpoint:%@; deviceType:%@; >",
    v5,
    self->_cluster,
    self->_endpoint,
  v7 = self->_deviceType);

  return v7;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void)setCluster:(NSNumber *)cluster
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(NSNumber *)deviceType
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_cluster, 0);
}

@end