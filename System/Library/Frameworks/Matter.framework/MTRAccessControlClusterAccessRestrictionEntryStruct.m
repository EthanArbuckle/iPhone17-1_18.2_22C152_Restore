@interface MTRAccessControlClusterAccessRestrictionEntryStruct
- (MTRAccessControlClusterAccessRestrictionEntryStruct)init;
- (NSArray)restrictions;
- (NSNumber)cluster;
- (NSNumber)endpoint;
- (NSNumber)fabricIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCluster:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setRestrictions:(id)a3;
@end

@implementation MTRAccessControlClusterAccessRestrictionEntryStruct

- (MTRAccessControlClusterAccessRestrictionEntryStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRAccessControlClusterAccessRestrictionEntryStruct;
  v2 = [(MTRAccessControlClusterAccessRestrictionEntryStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    endpoint = v2->_endpoint;
    v2->_endpoint = (NSNumber *)&unk_26F9C8620;

    cluster = v3->_cluster;
    v3->_cluster = (NSNumber *)&unk_26F9C8620;

    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7);
    restrictions = v3->_restrictions;
    v3->_restrictions = (NSArray *)v8;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessRestrictionEntryStruct);
  uint64_t v7 = objc_msgSend_endpoint(self, v5, v6);
  objc_msgSend_setEndpoint_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_cluster(self, v9, v10);
  objc_msgSend_setCluster_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_restrictions(self, v13, v14);
  objc_msgSend_setRestrictions_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: endpoint:%@; cluster:%@; restrictions:%@; fabricIndex:%@; >",
    v5,
    self->_endpoint,
    self->_cluster,
    self->_restrictions,
  uint64_t v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void)setCluster:(id)a3
{
}

- (NSArray)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_cluster, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end