@interface MTROperationalCredentialsClusterFabricDescriptorStruct
- (MTROperationalCredentialsClusterFabricDescriptorStruct)init;
- (NSData)rootPublicKey;
- (NSNumber)fabricID;
- (NSNumber)fabricIndex;
- (NSNumber)nodeID;
- (NSNumber)vendorID;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricID:(NSNumber *)fabricID;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setLabel:(NSString *)label;
- (void)setNodeID:(NSNumber *)nodeID;
- (void)setRootPublicKey:(NSData *)rootPublicKey;
- (void)setVendorID:(NSNumber *)vendorID;
@end

@implementation MTROperationalCredentialsClusterFabricDescriptorStruct

- (MTROperationalCredentialsClusterFabricDescriptorStruct)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTROperationalCredentialsClusterFabricDescriptorStruct;
  v4 = [(MTROperationalCredentialsClusterFabricDescriptorStruct *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    rootPublicKey = v4->_rootPublicKey;
    v4->_rootPublicKey = (NSData *)v5;

    vendorID = v4->_vendorID;
    v4->_vendorID = (NSNumber *)&unk_26F9C8620;

    fabricID = v4->_fabricID;
    v4->_fabricID = (NSNumber *)&unk_26F9C8620;

    nodeID = v4->_nodeID;
    v4->_nodeID = (NSNumber *)&unk_26F9C8620;

    label = v4->_label;
    v4->_label = (NSString *)&stru_26F969DC8;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterFabricDescriptorStruct);
  v7 = objc_msgSend_rootPublicKey(self, v5, v6);
  objc_msgSend_setRootPublicKey_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_vendorID(self, v9, v10);
  objc_msgSend_setVendorID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_fabricID(self, v13, v14);
  objc_msgSend_setFabricID_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_nodeID(self, v17, v18);
  objc_msgSend_setNodeID_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_label(self, v21, v22);
  objc_msgSend_setLabel_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_fabricIndex(self, v25, v26);
  objc_msgSend_setFabricIndex_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_rootPublicKey, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: rootPublicKey:%@; vendorID:%@; fabricID:%@; nodeID:%@; label:%@; fabricIndex:%@; >",
    v5,
    v7,
    self->_vendorID,
    self->_fabricID,
    self->_nodeID,
    self->_label,
  v9 = self->_fabricIndex);

  return v9;
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (void)setRootPublicKey:(NSData *)rootPublicKey
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (void)setFabricID:(NSNumber *)fabricID
{
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(NSNumber *)nodeID
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

@end