@interface MTRScenesManagementClusterExtensionFieldSet
- (MTRScenesManagementClusterExtensionFieldSet)init;
- (NSArray)attributeValueList;
- (NSNumber)clusterID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeValueList:(id)a3;
- (void)setClusterID:(id)a3;
@end

@implementation MTRScenesManagementClusterExtensionFieldSet

- (MTRScenesManagementClusterExtensionFieldSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRScenesManagementClusterExtensionFieldSet;
  v2 = [(MTRScenesManagementClusterExtensionFieldSet *)&v10 init];
  v3 = v2;
  if (v2)
  {
    clusterID = v2->_clusterID;
    v2->_clusterID = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    attributeValueList = v3->_attributeValueList;
    v3->_attributeValueList = (NSArray *)v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterExtensionFieldSet);
  uint64_t v7 = objc_msgSend_clusterID(self, v5, v6);
  objc_msgSend_setClusterID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_attributeValueList(self, v9, v10);
  objc_msgSend_setAttributeValueList_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: clusterID:%@; attributeValueList:%@; >",
    v5,
    self->_clusterID,
  uint64_t v7 = self->_attributeValueList);

  return v7;
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
}

- (NSArray)attributeValueList
{
  return self->_attributeValueList;
}

- (void)setAttributeValueList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValueList, 0);

  objc_storeStrong((id *)&self->_clusterID, 0);
}

@end