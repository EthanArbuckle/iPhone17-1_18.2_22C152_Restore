@interface MTROTASoftwareUpdateRequestorClusterProviderLocation
- (MTROTASoftwareUpdateRequestorClusterProviderLocation)init;
- (NSNumber)endpoint;
- (NSNumber)fabricIndex;
- (NSNumber)providerNodeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpoint:(NSNumber *)endpoint;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setProviderNodeID:(NSNumber *)providerNodeID;
@end

@implementation MTROTASoftwareUpdateRequestorClusterProviderLocation

- (MTROTASoftwareUpdateRequestorClusterProviderLocation)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTROTASoftwareUpdateRequestorClusterProviderLocation;
  v2 = [(MTROTASoftwareUpdateRequestorClusterProviderLocation *)&v8 init];
  v3 = v2;
  if (v2)
  {
    providerNodeID = v2->_providerNodeID;
    v2->_providerNodeID = (NSNumber *)&unk_26F9C8620;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterProviderLocation);
  v7 = objc_msgSend_providerNodeID(self, v5, v6);
  objc_msgSend_setProviderNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endpoint(self, v9, v10);
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_fabricIndex(self, v13, v14);
  objc_msgSend_setFabricIndex_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: providerNodeID:%@; endpoint:%@; fabricIndex:%@; >",
    v5,
    self->_providerNodeID,
    self->_endpoint,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)providerNodeID
{
  return self->_providerNodeID;
}

- (void)setProviderNodeID:(NSNumber *)providerNodeID
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_providerNodeID, 0);
}

@end