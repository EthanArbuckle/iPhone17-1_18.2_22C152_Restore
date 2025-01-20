@interface MTRAttributeRequestPath
+ (BOOL)supportsSecureCoding;
+ (MTRAttributeRequestPath)requestPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributeRequestPath:(id)a3;
- (MTRAttributeRequestPath)initWithCoder:(id)a3;
- (MTRAttributeRequestPath)initWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5;
- (NSNumber)attribute;
- (NSNumber)cluster;
- (NSNumber)endpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)convertToAttributePathParams:(AttributePathParams *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTRAttributeRequestPath

- (MTRAttributeRequestPath)initWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = (NSNumber *)objc_msgSend_copy(v8, v11, v12);
  endpoint = self->_endpoint;
  self->_endpoint = v13;

  v17 = (NSNumber *)objc_msgSend_copy(v9, v15, v16);
  cluster = self->_cluster;
  self->_cluster = v17;

  v21 = (NSNumber *)objc_msgSend_copy(v10, v19, v20);
  attribute = self->_attribute;
  self->_attribute = v21;

  return self;
}

- (id)description
{
  v3 = sub_2447DF050(self->_endpoint);
  v4 = sub_2447DF0E4(self->_cluster);
  v5 = sub_2447DF1BC(self->_cluster, self->_attribute, &unk_26F944C80);
  v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"<MTRAttributeRequestPath endpoint %@ cluster %@ attribute %@>", v3, v4, v5);

  return v7;
}

+ (MTRAttributeRequestPath)requestPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID
{
  v7 = endpointID;
  id v8 = clusterID;
  id v9 = attributeID;
  id v10 = [MTRAttributeRequestPath alloc];
  uint64_t v12 = objc_msgSend_initWithEndpointID_clusterID_attributeID_(v10, v11, (uint64_t)v7, v8, v9);

  return (MTRAttributeRequestPath *)v12;
}

- (BOOL)isEqualToAttributeRequestPath:(id)a3
{
  id v4 = a3;
  endpoint = self->_endpoint;
  id v8 = objc_msgSend_endpoint(v4, v6, v7);
  if (sub_2446BE670(endpoint, v8))
  {
    cluster = self->_cluster;
    uint64_t v12 = objc_msgSend_cluster(v4, v9, v10);
    if (sub_2446BE670(cluster, v12))
    {
      attribute = self->_attribute;
      uint64_t v16 = objc_msgSend_attribute(v4, v13, v14);
      char v17 = sub_2446BE670(attribute, v16);
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToAttributeRequestPath = objc_msgSend_isEqualToAttributeRequestPath_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToAttributeRequestPath = 0;
  }

  return isEqualToAttributeRequestPath;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  uint64_t v7 = objc_msgSend_unsignedLongValue(self->_cluster, v5, v6);
  return v7 ^ objc_msgSend_unsignedLongValue(self->_attribute, v8, v9) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)convertToAttributePathParams:(AttributePathParams *)a3
{
  endpoint = self->_endpoint;
  if (endpoint) {
    unsigned __int16 v6 = objc_msgSend_unsignedShortValue(endpoint, a2, (uint64_t)a3);
  }
  else {
    unsigned __int16 v6 = -1;
  }
  a3->var2 = v6;
  cluster = self->_cluster;
  if (cluster) {
    unsigned int v8 = objc_msgSend_unsignedLongValue(cluster, a2, (uint64_t)a3);
  }
  else {
    unsigned int v8 = -1;
  }
  a3->var0 = v8;
  attribute = self->_attribute;
  if (attribute)
  {
    unsigned int v10 = objc_msgSend_unsignedLongValue(attribute, a2, (uint64_t)a3);
  }
  else
  {
    a3->var3 = -1;
    unsigned int v10 = -1;
  }
  a3->var1 = v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRAttributeRequestPath)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MTRAttributeRequestPath;
  uint64_t v5 = [(MTRAttributeRequestPath *)&v27 init];
  unsigned __int16 v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"endpointIDKey");
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSNumber *)v9;

    if (v5->_endpoint && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v20 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        attribute = v5->_attribute;
        *(_DWORD *)buf = 138412290;
        v29 = attribute;
        _os_log_impl(&dword_2446BD000, v20, OS_LOG_TYPE_ERROR, "MTRAttributeRequestPath decoded %@ for endpoint, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"clusterIDKey");
      cluster = v5->_cluster;
      v5->_cluster = (NSNumber *)v13;

      if (v5->_cluster && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v22 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = v5->_attribute;
          *(_DWORD *)buf = 138412290;
          v29 = v23;
          _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRAttributeRequestPath decoded %@ for cluster, not NSNumber.", buf, 0xCu);
        }

        if (!sub_244CC4E58(1u)) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"attributeIDKey");
        p_attribute = &v5->_attribute;
        v18 = v5->_attribute;
        v5->_attribute = (NSNumber *)v17;

        if (!v5->_attribute || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v5 = v5;
          goto LABEL_22;
        }
        v24 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = *p_attribute;
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_ERROR, "MTRAttributeRequestPath decoded %@ for attribute, not NSNumber.", buf, 0xCu);
        }

        if (!sub_244CC4E58(1u))
        {
LABEL_21:
          uint64_t v5 = 0;
          goto LABEL_22;
        }
      }
    }
    sub_244CC4DE0(0, 1);
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  endpoint = self->_endpoint;
  if (endpoint) {
    objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)endpoint, @"endpointIDKey");
  }
  cluster = self->_cluster;
  if (cluster) {
    objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)cluster, @"clusterIDKey");
  }
  attribute = self->_attribute;
  if (attribute) {
    objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)attribute, @"attributeIDKey");
  }
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (NSNumber)attribute
{
  return self->_attribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_cluster, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end