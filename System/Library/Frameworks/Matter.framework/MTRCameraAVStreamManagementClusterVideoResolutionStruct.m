@interface MTRCameraAVStreamManagementClusterVideoResolutionStruct
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)init;
- (NSNumber)height;
- (NSNumber)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHeight:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterVideoResolutionStruct

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRCameraAVStreamManagementClusterVideoResolutionStruct;
  v2 = [(MTRCameraAVStreamManagementClusterVideoResolutionStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    width = v2->_width;
    v2->_width = (NSNumber *)&unk_26F9C8620;

    height = v3->_height;
    v3->_height = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoResolutionStruct);
  objc_super v7 = objc_msgSend_width(self, v5, v6);
  objc_msgSend_setWidth_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_height(self, v9, v10);
  objc_msgSend_setHeight_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: width:%@ height:%@; >", v5, self->_width, self->_height);;

  return v7;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);

  objc_storeStrong((id *)&self->_width, 0);
}

@end