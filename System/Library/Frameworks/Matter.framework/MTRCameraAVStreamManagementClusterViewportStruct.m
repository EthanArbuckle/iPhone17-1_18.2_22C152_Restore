@interface MTRCameraAVStreamManagementClusterViewportStruct
- (MTRCameraAVStreamManagementClusterViewportStruct)init;
- (NSNumber)x1;
- (NSNumber)x2;
- (NSNumber)y1;
- (NSNumber)y2;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setX1:(id)a3;
- (void)setX2:(id)a3;
- (void)setY1:(id)a3;
- (void)setY2:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterViewportStruct

- (MTRCameraAVStreamManagementClusterViewportStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRCameraAVStreamManagementClusterViewportStruct;
  v2 = [(MTRCameraAVStreamManagementClusterViewportStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    x1 = v2->_x1;
    v2->_x1 = (NSNumber *)&unk_26F9C8620;

    y1 = v3->_y1;
    v3->_y1 = (NSNumber *)&unk_26F9C8620;

    x2 = v3->_x2;
    v3->_x2 = (NSNumber *)&unk_26F9C8620;

    y2 = v3->_y2;
    v3->_y2 = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterViewportStruct);
  v7 = objc_msgSend_x1(self, v5, v6);
  objc_msgSend_setX1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_y1(self, v9, v10);
  objc_msgSend_setY1_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_x2(self, v13, v14);
  objc_msgSend_setX2_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_y2(self, v17, v18);
  objc_msgSend_setY2_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: x1:%@; y1:%@; x2:%@; y2:%@; >",
    v5,
    self->_x1,
    self->_y1,
    self->_x2,
  v7 = self->_y2);

  return v7;
}

- (NSNumber)x1
{
  return self->_x1;
}

- (void)setX1:(id)a3
{
}

- (NSNumber)y1
{
  return self->_y1;
}

- (void)setY1:(id)a3
{
}

- (NSNumber)x2
{
  return self->_x2;
}

- (void)setX2:(id)a3
{
}

- (NSNumber)y2
{
  return self->_y2;
}

- (void)setY2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_y2, 0);
  objc_storeStrong((id *)&self->_x2, 0);
  objc_storeStrong((id *)&self->_y1, 0);

  objc_storeStrong((id *)&self->_x1, 0);
}

@end