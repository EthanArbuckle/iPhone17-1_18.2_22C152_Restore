@interface MTREventRequestPath
+ (BOOL)supportsSecureCoding;
+ (MTREventRequestPath)requestPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventRequestPath:(id)a3;
- (MTREventRequestPath)initWithCoder:(id)a3;
- (MTREventRequestPath)initWithEndpointID:(id)a3 clusterID:(id)a4 eventID:(id)a5;
- (NSNumber)cluster;
- (NSNumber)endpoint;
- (NSNumber)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)convertToEventPathParams:(EventPathParams *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTREventRequestPath

- (MTREventRequestPath)initWithEndpointID:(id)a3 clusterID:(id)a4 eventID:(id)a5
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
  event = self->_event;
  self->_event = v21;

  return self;
}

- (id)description
{
  v3 = sub_2447DF050(self->_endpoint);
  v4 = sub_2447DF0E4(self->_cluster);
  v5 = sub_2447DF1BC(self->_cluster, self->_event, &unk_26F944CA0);
  v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"<MTREventRequestPath endpoint %@ cluster %@ event %@>", v3, v4, v5);

  return v7;
}

+ (MTREventRequestPath)requestPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID
{
  v7 = endpointID;
  id v8 = clusterID;
  id v9 = eventID;
  id v10 = [MTREventRequestPath alloc];
  uint64_t v12 = objc_msgSend_initWithEndpointID_clusterID_eventID_(v10, v11, (uint64_t)v7, v8, v9);

  return (MTREventRequestPath *)v12;
}

- (BOOL)isEqualToEventRequestPath:(id)a3
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
      event = self->_event;
      uint64_t v16 = objc_msgSend_event(v4, v13, v14);
      char v17 = sub_2446BE670(event, v16);
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
    char isEqualToEventRequestPath = objc_msgSend_isEqualToEventRequestPath_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToEventRequestPath = 0;
  }

  return isEqualToEventRequestPath;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_unsignedShortValue(self->_endpoint, a2, v2);
  uint64_t v7 = objc_msgSend_unsignedLongValue(self->_cluster, v5, v6);
  return v7 ^ objc_msgSend_unsignedLongValue(self->_event, v8, v9) ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)convertToEventPathParams:(EventPathParams *)a3
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
  event = self->_event;
  if (event) {
    unsigned int v10 = objc_msgSend_unsignedLongValue(event, a2, (uint64_t)a3);
  }
  else {
    unsigned int v10 = -1;
  }
  a3->var1 = v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTREventRequestPath)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTREventRequestPath;
  uint64_t v5 = [(MTREventRequestPath *)&v26 init];
  if (!v5) {
    goto LABEL_21;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"endpointIDKey");
  endpoint = v5->_endpoint;
  v5->_endpoint = (NSNumber *)v8;

  if (v5->_endpoint)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v5->_endpoint;
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_ERROR, "MTREventRequestPath decoded %@ for endpoint, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_21;
      }
LABEL_20:
      sub_244CC4DE0(0, 1);
LABEL_21:
      v18 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"clusterIDKey");
  cluster = v5->_cluster;
  v5->_cluster = (NSNumber *)v12;

  if (v5->_cluster)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v5->_cluster;
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "MTREventRequestPath decoded %@ for cluster, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"attributeIDKey");
  event = v5->_event;
  v5->_event = (NSNumber *)v16;

  if (v5->_event)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v5->_event;
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_2446BD000, v23, OS_LOG_TYPE_ERROR, "MTREventRequestPath decoded %@ for event, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  v18 = v5;
LABEL_22:

  return v18;
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
  event = self->_event;
  if (event) {
    objc_msgSend_encodeObject_forKey_(v8, v4, (uint64_t)event, @"attributeIDKey");
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

- (NSNumber)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_cluster, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end