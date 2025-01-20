@interface MTREcosystemInformationClusterEcosystemLocationStruct
- (MTRDataTypeLocationDescriptorStruct)locationDescriptor;
- (MTREcosystemInformationClusterEcosystemLocationStruct)init;
- (NSNumber)fabricIndex;
- (NSNumber)locationDescriptorLastEdit;
- (NSString)uniqueLocationID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricIndex:(id)a3;
- (void)setLocationDescriptor:(id)a3;
- (void)setLocationDescriptorLastEdit:(id)a3;
- (void)setUniqueLocationID:(id)a3;
@end

@implementation MTREcosystemInformationClusterEcosystemLocationStruct

- (MTREcosystemInformationClusterEcosystemLocationStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTREcosystemInformationClusterEcosystemLocationStruct;
  v2 = [(MTREcosystemInformationClusterEcosystemLocationStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    uniqueLocationID = v2->_uniqueLocationID;
    v2->_uniqueLocationID = (NSString *)&stru_26F969DC8;

    uint64_t v5 = objc_opt_new();
    locationDescriptor = v3->_locationDescriptor;
    v3->_locationDescriptor = (MTRDataTypeLocationDescriptorStruct *)v5;

    locationDescriptorLastEdit = v3->_locationDescriptorLastEdit;
    v3->_locationDescriptorLastEdit = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREcosystemInformationClusterEcosystemLocationStruct);
  v7 = objc_msgSend_uniqueLocationID(self, v5, v6);
  objc_msgSend_setUniqueLocationID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_locationDescriptor(self, v9, v10);
  objc_msgSend_setLocationDescriptor_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_locationDescriptorLastEdit(self, v13, v14);
  objc_msgSend_setLocationDescriptorLastEdit_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: uniqueLocationID:%@; locationDescriptor:%@; locationDescriptorLastEdit:%@; fabricIndex:%@; >",
    v5,
    self->_uniqueLocationID,
    self->_locationDescriptor,
    self->_locationDescriptorLastEdit,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSString)uniqueLocationID
{
  return self->_uniqueLocationID;
}

- (void)setUniqueLocationID:(id)a3
{
}

- (MTRDataTypeLocationDescriptorStruct)locationDescriptor
{
  return self->_locationDescriptor;
}

- (void)setLocationDescriptor:(id)a3
{
}

- (NSNumber)locationDescriptorLastEdit
{
  return self->_locationDescriptorLastEdit;
}

- (void)setLocationDescriptorLastEdit:(id)a3
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
  objc_storeStrong((id *)&self->_locationDescriptorLastEdit, 0);
  objc_storeStrong((id *)&self->_locationDescriptor, 0);

  objc_storeStrong((id *)&self->_uniqueLocationID, 0);
}

@end