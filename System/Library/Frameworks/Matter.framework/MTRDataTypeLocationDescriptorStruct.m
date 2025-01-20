@interface MTRDataTypeLocationDescriptorStruct
- (MTRDataTypeLocationDescriptorStruct)init;
- (NSNumber)areaType;
- (NSNumber)floorNumber;
- (NSString)locationName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAreaType:(id)a3;
- (void)setFloorNumber:(id)a3;
- (void)setLocationName:(id)a3;
@end

@implementation MTRDataTypeLocationDescriptorStruct

- (MTRDataTypeLocationDescriptorStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDataTypeLocationDescriptorStruct;
  v2 = [(MTRDataTypeLocationDescriptorStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    locationName = v2->_locationName;
    v2->_locationName = (NSString *)&stru_26F969DC8;

    floorNumber = v3->_floorNumber;
    v3->_floorNumber = 0;

    areaType = v3->_areaType;
    v3->_areaType = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDataTypeLocationDescriptorStruct);
  v7 = objc_msgSend_locationName(self, v5, v6);
  objc_msgSend_setLocationName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_floorNumber(self, v9, v10);
  objc_msgSend_setFloorNumber_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_areaType(self, v13, v14);
  objc_msgSend_setAreaType_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: locationName:%@; floorNumber:%@; areaType:%@; >",
    v5,
    self->_locationName,
    self->_floorNumber,
  v7 = self->_areaType);

  return v7;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
}

- (NSNumber)floorNumber
{
  return self->_floorNumber;
}

- (void)setFloorNumber:(id)a3
{
}

- (NSNumber)areaType
{
  return self->_areaType;
}

- (void)setAreaType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areaType, 0);
  objc_storeStrong((id *)&self->_floorNumber, 0);

  objc_storeStrong((id *)&self->_locationName, 0);
}

@end