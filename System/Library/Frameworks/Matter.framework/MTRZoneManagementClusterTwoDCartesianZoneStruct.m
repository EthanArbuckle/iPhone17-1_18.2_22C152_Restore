@interface MTRZoneManagementClusterTwoDCartesianZoneStruct
- (MTRZoneManagementClusterTwoDCartesianZoneStruct)init;
- (NSArray)vertices;
- (NSNumber)use;
- (NSString)color;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setColor:(id)a3;
- (void)setName:(id)a3;
- (void)setUse:(id)a3;
- (void)setVertices:(id)a3;
@end

@implementation MTRZoneManagementClusterTwoDCartesianZoneStruct

- (MTRZoneManagementClusterTwoDCartesianZoneStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRZoneManagementClusterTwoDCartesianZoneStruct;
  v2 = [(MTRZoneManagementClusterTwoDCartesianZoneStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26F969DC8;

    use = v3->_use;
    v3->_use = (NSNumber *)&unk_26F9C8620;

    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7);
    vertices = v3->_vertices;
    v3->_vertices = (NSArray *)v8;

    color = v3->_color;
    v3->_color = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterTwoDCartesianZoneStruct);
  uint64_t v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_use(self, v9, v10);
  objc_msgSend_setUse_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_vertices(self, v13, v14);
  objc_msgSend_setVertices_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_color(self, v17, v18);
  objc_msgSend_setColor_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: name:%@; use:%@; vertices:%@; color:%@; >",
    v5,
    self->_name,
    self->_use,
    self->_vertices,
  uint64_t v7 = self->_color);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)use
{
  return self->_use;
}

- (void)setUse:(id)a3
{
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_use, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end