@interface MTRServiceAreaClusterAreaInfoStruct
- (MTRDataTypeLocationDescriptorStruct)locationInfo;
- (MTRServiceAreaClusterAreaInfoStruct)init;
- (MTRServiceAreaClusterLandmarkInfoStruct)landmarkInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLandmarkInfo:(id)a3;
- (void)setLocationInfo:(id)a3;
@end

@implementation MTRServiceAreaClusterAreaInfoStruct

- (MTRServiceAreaClusterAreaInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRServiceAreaClusterAreaInfoStruct;
  v2 = [(MTRServiceAreaClusterAreaInfoStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    locationInfo = v2->_locationInfo;
    v2->_locationInfo = 0;

    landmarkInfo = v3->_landmarkInfo;
    v3->_landmarkInfo = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRServiceAreaClusterAreaInfoStruct);
  objc_super v7 = objc_msgSend_locationInfo(self, v5, v6);
  objc_msgSend_setLocationInfo_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_landmarkInfo(self, v9, v10);
  objc_msgSend_setLandmarkInfo_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: locationInfo:%@; landmarkInfo:%@; >",
    v5,
    self->_locationInfo,
  objc_super v7 = self->_landmarkInfo);

  return v7;
}

- (MTRDataTypeLocationDescriptorStruct)locationInfo
{
  return self->_locationInfo;
}

- (void)setLocationInfo:(id)a3
{
}

- (MTRServiceAreaClusterLandmarkInfoStruct)landmarkInfo
{
  return self->_landmarkInfo;
}

- (void)setLandmarkInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarkInfo, 0);

  objc_storeStrong((id *)&self->_locationInfo, 0);
}

@end