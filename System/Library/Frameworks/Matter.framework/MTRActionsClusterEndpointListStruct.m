@interface MTRActionsClusterEndpointListStruct
- (MTRActionsClusterEndpointListStruct)init;
- (NSArray)endpoints;
- (NSNumber)endpointListID;
- (NSNumber)type;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpointListID:(NSNumber *)endpointListID;
- (void)setEndpoints:(NSArray *)endpoints;
- (void)setName:(NSString *)name;
- (void)setType:(NSNumber *)type;
@end

@implementation MTRActionsClusterEndpointListStruct

- (MTRActionsClusterEndpointListStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRActionsClusterEndpointListStruct;
  v2 = [(MTRActionsClusterEndpointListStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    endpointListID = v2->_endpointListID;
    v2->_endpointListID = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_26F9C8620;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8);
    endpoints = v3->_endpoints;
    v3->_endpoints = (NSArray *)v9;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRActionsClusterEndpointListStruct);
  v7 = objc_msgSend_endpointListID(self, v5, v6);
  objc_msgSend_setEndpointListID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_type(self, v13, v14);
  objc_msgSend_setType_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_endpoints(self, v17, v18);
  objc_msgSend_setEndpoints_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: endpointListID:%@; name:%@; type:%@; endpoints:%@; >",
    v5,
    self->_endpointListID,
    self->_name,
    self->_type,
  v7 = self->_endpoints);

  return v7;
}

- (NSNumber)endpointListID
{
  return self->_endpointListID;
}

- (void)setEndpointListID:(NSNumber *)endpointListID
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(NSArray *)endpoints
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_endpointListID, 0);
}

@end