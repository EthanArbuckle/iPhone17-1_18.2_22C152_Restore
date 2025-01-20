@interface MTRClusterPath
+ (BOOL)supportsSecureCoding;
+ (MTRClusterPath)clusterPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClusterPath:(id)a3;
- (MTRClusterPath)initWithCoder:(id)a3;
- (MTRClusterPath)initWithPath:(const ConcreteClusterPath *)a3;
- (NSNumber)cluster;
- (NSNumber)endpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTRClusterPath

- (MTRClusterPath)initWithPath:(const ConcreteClusterPath *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTRClusterPath;
  v5 = [(MTRClusterPath *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v4, a3->mEndpointId);
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSNumber *)v6;

    uint64_t v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, a3->mClusterId);
    cluster = v5->_cluster;
    v5->_cluster = (NSNumber *)v9;
  }
  return v5;
}

- (id)description
{
  v4 = NSString;
  unsigned int v5 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  uint64_t v8 = objc_msgSend_unsignedLongLongValue(self->_cluster, v6, v7);
  uint64_t v11 = objc_msgSend_unsignedLongLongValue(self->_cluster, v9, v10);
  uint64_t v14 = objc_msgSend_unsignedLongLongValue(self->_cluster, v12, v13);
  v16 = MTRClusterNameForID(v14, v15);
  v18 = objc_msgSend_stringWithFormat_(v4, v17, @"<MTRClusterPath endpoint %u cluster 0x%llx (%llu, %@)>", v5, v8, v11, v16);

  return v18;
}

+ (MTRClusterPath)clusterPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID
{
  unsigned int v5 = endpointID;
  uint64_t v6 = clusterID;
  v15[0] = objc_msgSend_unsignedShortValue(v5, v7, v8);
  int v16 = objc_msgSend_unsignedLongValue(v6, v9, v10);
  uint64_t v11 = [MTRClusterPath alloc];
  uint64_t v13 = objc_msgSend_initWithPath_(v11, v12, (uint64_t)v15);

  return (MTRClusterPath *)v13;
}

- (BOOL)isEqualToClusterPath:(id)a3
{
  id v4 = a3;
  endpoint = self->_endpoint;
  uint64_t v8 = objc_msgSend_endpoint(v4, v6, v7);
  if (sub_2446BE670(endpoint, v8))
  {
    cluster = self->_cluster;
    objc_super v12 = objc_msgSend_cluster(v4, v9, v10);
    char v13 = sub_2446BE670(cluster, v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToClusterPath = objc_msgSend_isEqualToClusterPath_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToClusterPath = 0;
  }

  return isEqualToClusterPath;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  return objc_msgSend_unsignedLongValue(self->_cluster, v5, v6) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRClusterPath)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTRClusterPath;
  uint64_t v5 = [(MTRClusterPath *)&v20 init];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"endpointKey");
  endpoint = v5->_endpoint;
  v5->_endpoint = (NSNumber *)v8;

  if (v5->_endpoint)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = v5->_endpoint;
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "MTRClusterPath decoded %@ for endpoint, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_15;
      }
LABEL_14:
      sub_244CC4DE0(0, 1);
LABEL_15:
      uint64_t v14 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"clusterKey");
  cluster = v5->_cluster;
  v5->_cluster = (NSNumber *)v12;

  if (v5->_cluster)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v5->_cluster;
        *(_DWORD *)buf = 138412290;
        v22 = v18;
        _os_log_impl(&dword_2446BD000, v17, OS_LOG_TYPE_ERROR, "MTRClusterPath decoded %@ for cluster, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  uint64_t v14 = v5;
LABEL_16:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend_encodeObject_forKey_(v6, v4, (uint64_t)self->_endpoint, @"endpointKey");
  objc_msgSend_encodeObject_forKey_(v6, v5, (uint64_t)self->_cluster, @"clusterKey");
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cluster, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end