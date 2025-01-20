@interface MTRBindingClusterTargetStruct
- (MTRBindingClusterTargetStruct)init;
- (NSNumber)cluster;
- (NSNumber)endpoint;
- (NSNumber)fabricIndex;
- (NSNumber)group;
- (NSNumber)node;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCluster:(NSNumber *)cluster;
- (void)setEndpoint:(NSNumber *)endpoint;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setGroup:(NSNumber *)group;
- (void)setNode:(NSNumber *)node;
@end

@implementation MTRBindingClusterTargetStruct

- (MTRBindingClusterTargetStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRBindingClusterTargetStruct;
  v2 = [(MTRBindingClusterTargetStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    node = v2->_node;
    v2->_node = 0;

    group = v3->_group;
    v3->_group = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    cluster = v3->_cluster;
    v3->_cluster = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBindingClusterTargetStruct);
  v7 = objc_msgSend_node(self, v5, v6);
  objc_msgSend_setNode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_group(self, v9, v10);
  objc_msgSend_setGroup_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_endpoint(self, v13, v14);
  objc_msgSend_setEndpoint_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_cluster(self, v17, v18);
  objc_msgSend_setCluster_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_fabricIndex(self, v21, v22);
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: node:%@; group:%@; endpoint:%@; cluster:%@; fabricIndex:%@; >",
    v5,
    self->_node,
    self->_group,
    self->_endpoint,
    self->_cluster,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)node
{
  return self->_node;
}

- (void)setNode:(NSNumber *)node
{
}

- (NSNumber)group
{
  return self->_group;
}

- (void)setGroup:(NSNumber *)group
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(NSNumber *)endpoint
{
}

- (NSNumber)cluster
{
  return self->_cluster;
}

- (void)setCluster:(NSNumber *)cluster
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
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_node, 0);
}

@end