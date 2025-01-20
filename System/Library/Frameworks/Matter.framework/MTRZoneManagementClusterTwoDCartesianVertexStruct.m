@interface MTRZoneManagementClusterTwoDCartesianVertexStruct
- (MTRZoneManagementClusterTwoDCartesianVertexStruct)init;
- (NSNumber)x;
- (NSNumber)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setX:(id)a3;
- (void)setY:(id)a3;
@end

@implementation MTRZoneManagementClusterTwoDCartesianVertexStruct

- (MTRZoneManagementClusterTwoDCartesianVertexStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRZoneManagementClusterTwoDCartesianVertexStruct;
  v2 = [(MTRZoneManagementClusterTwoDCartesianVertexStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    x = v2->_x;
    v2->_x = (NSNumber *)&unk_26F9C8620;

    y = v3->_y;
    v3->_y = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterTwoDCartesianVertexStruct);
  objc_super v7 = objc_msgSend_x(self, v5, v6);
  objc_msgSend_setX_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_y(self, v9, v10);
  objc_msgSend_setY_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: x:%@ y:%@; >", v5, self->_x, self->_y);;

  return v7;
}

- (NSNumber)x
{
  return self->_x;
}

- (void)setX:(id)a3
{
}

- (NSNumber)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y, 0);

  objc_storeStrong((id *)&self->_x, 0);
}

@end