@interface MTREventPath
+ (BOOL)supportsSecureCoding;
+ (MTREventPath)eventPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID;
+ (MTREventPath)eventPathWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId eventId:(NSNumber *)eventId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventPath:(id)a3;
- (ConcreteEventPath)_asConcretePath;
- (MTREventPath)initWithCoder:(id)a3;
- (MTREventPath)initWithPath:(const ConcreteEventPath *)a3;
- (NSNumber)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTREventPath

- (MTREventPath)initWithPath:(const ConcreteEventPath *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTREventPath;
  v5 = -[MTRClusterPath initWithPath:](&v9, sel_initWithPath_);
  if (v5)
  {
    uint64_t v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v4, a3->var3);
    event = v5->_event;
    v5->_event = (NSNumber *)v6;
  }
  return v5;
}

- (id)description
{
  v4 = NSString;
  v48 = objc_msgSend_endpoint(self, a2, v2);
  uint64_t v7 = objc_msgSend_unsignedShortValue(v48, v5, v6);
  v47 = objc_msgSend_cluster(self, v8, v9);
  uint64_t v12 = objc_msgSend_unsignedLongLongValue(v47, v10, v11);
  v46 = objc_msgSend_cluster(self, v13, v14);
  uint64_t v17 = objc_msgSend_unsignedLongLongValue(v46, v15, v16);
  objc_msgSend_cluster(self, v18, v19);
  v45 = uint64_t v44 = v7;
  uint64_t v22 = objc_msgSend_unsignedLongLongValue(v45, v20, v21);
  v24 = MTRClusterNameForID(v22, v23);
  uint64_t v27 = objc_msgSend_unsignedLongLongValue(self->_event, v25, v26);
  uint64_t v30 = objc_msgSend_unsignedLongLongValue(self->_event, v28, v29);
  v33 = objc_msgSend_cluster(self, v31, v32);
  uint64_t v36 = objc_msgSend_unsignedLongLongValue(v33, v34, v35);
  v39 = (const char *)objc_msgSend_unsignedLongLongValue(self->_event, v37, v38);
  v40 = MTREventNameForID(v36, v39);
  v42 = objc_msgSend_stringWithFormat_(v4, v41, @"<MTREventPath endpoint %u cluster 0x%llx (%llu, %@) event 0x%llx (%llu, %@)>", v44, v12, v17, v24, v27, v30, v40);

  return v42;
}

+ (MTREventPath)eventPathWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID eventID:(NSNumber *)eventID
{
  uint64_t v7 = endpointID;
  v8 = clusterID;
  uint64_t v9 = eventID;
  __int16 v20 = objc_msgSend_unsignedShortValue(v7, v10, v11);
  int v21 = objc_msgSend_unsignedLongValue(v8, v12, v13);
  int v22 = objc_msgSend_unsignedLongValue(v9, v14, v15);
  uint64_t v16 = [MTREventPath alloc];
  v18 = objc_msgSend_initWithPath_(v16, v17, (uint64_t)&v20);

  return (MTREventPath *)v18;
}

- (BOOL)isEqualToEventPath:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToClusterPath_(self, v5, (uint64_t)v4))
  {
    event = self->_event;
    uint64_t v9 = objc_msgSend_event(v4, v6, v7);
    char v10 = sub_2446BE670(event, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToEventPath = objc_msgSend_isEqualToEventPath_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToEventPath = 0;
  }

  return isEqualToEventPath;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_endpoint(self, a2, v2);
  unsigned int v7 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  char v10 = objc_msgSend_cluster(self, v8, v9);
  uint64_t v13 = objc_msgSend_unsignedLongValue(v10, v11, v12);
  unint64_t v16 = v13 ^ v7 ^ objc_msgSend_unsignedLongValue(self->_event, v14, v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend_endpoint(self, a2, (uint64_t)a3);
  unsigned int v7 = objc_msgSend_cluster(self, v5, v6);
  uint64_t v9 = objc_msgSend_eventPathWithEndpointID_clusterID_eventID_(MTREventPath, v8, (uint64_t)v4, v7, self->_event);

  return v9;
}

- (ConcreteEventPath)_asConcretePath
{
  id v4 = objc_msgSend_endpoint(self, a2, v2);
  unsigned int v7 = objc_msgSend_unsignedShortValue(v4, v5, v6);
  char v10 = objc_msgSend_cluster(self, v8, v9);
  uint64_t v13 = objc_msgSend_unsignedLongValue(v10, v11, v12);
  unint64_t v16 = objc_msgSend_event(self, v14, v15);
  unsigned int v19 = objc_msgSend_unsignedLongValue(v16, v17, v18);

  unint64_t v20 = v7 | (unint64_t)(v13 << 32);
  unsigned int v21 = v19;
  result.var0 = v20;
  result.var1 = BYTE2(v20);
  result.var2 = HIDWORD(v20);
  result.var3 = v21;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTREventPath)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTREventPath;
  uint64_t v5 = [(MTRClusterPath *)&v14 initWithCoder:v4];
  if (!v5)
  {
LABEL_9:
    char v10 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"eventKey");
  event = v5->_event;
  v5->_event = (NSNumber *)v8;

  if (v5->_event)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v5->_event;
        *(_DWORD *)buf = 138412290;
        unint64_t v16 = v12;
        _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "MTREventPath decoded %@ for event, not NSNumber.", buf, 0xCu);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      goto LABEL_9;
    }
  }
  char v10 = v5;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTREventPath;
  [(MTRClusterPath *)&v6 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_event, @"eventKey");
}

- (NSNumber)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

+ (MTREventPath)eventPathWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId eventId:(NSNumber *)eventId
{
  uint64_t v5 = objc_msgSend_eventPathWithEndpointID_clusterID_eventID_(a1, a2, (uint64_t)endpointId, clusterId, eventId);

  return (MTREventPath *)v5;
}

@end