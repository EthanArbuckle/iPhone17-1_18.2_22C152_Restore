@interface MTREcosystemInformationClusterEcosystemDeviceStruct
- (MTREcosystemInformationClusterEcosystemDeviceStruct)init;
- (NSArray)deviceTypes;
- (NSArray)uniqueLocationIDs;
- (NSNumber)bridgedEndpoint;
- (NSNumber)deviceNameLastEdit;
- (NSNumber)fabricIndex;
- (NSNumber)originalEndpoint;
- (NSNumber)uniqueLocationIDsLastEdit;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBridgedEndpoint:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceNameLastEdit:(id)a3;
- (void)setDeviceTypes:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setOriginalEndpoint:(id)a3;
- (void)setUniqueLocationIDs:(id)a3;
- (void)setUniqueLocationIDsLastEdit:(id)a3;
@end

@implementation MTREcosystemInformationClusterEcosystemDeviceStruct

- (MTREcosystemInformationClusterEcosystemDeviceStruct)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTREcosystemInformationClusterEcosystemDeviceStruct;
  v2 = [(MTREcosystemInformationClusterEcosystemDeviceStruct *)&v19 init];
  v3 = v2;
  if (v2)
  {
    deviceName = v2->_deviceName;
    v2->_deviceName = 0;

    deviceNameLastEdit = v3->_deviceNameLastEdit;
    v3->_deviceNameLastEdit = 0;

    bridgedEndpoint = v3->_bridgedEndpoint;
    v3->_bridgedEndpoint = (NSNumber *)&unk_26F9C8620;

    originalEndpoint = v3->_originalEndpoint;
    v3->_originalEndpoint = (NSNumber *)&unk_26F9C8620;

    uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    deviceTypes = v3->_deviceTypes;
    v3->_deviceTypes = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF8C0], v12, v13);
    uniqueLocationIDs = v3->_uniqueLocationIDs;
    v3->_uniqueLocationIDs = (NSArray *)v14;

    uniqueLocationIDsLastEdit = v3->_uniqueLocationIDsLastEdit;
    v3->_uniqueLocationIDsLastEdit = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREcosystemInformationClusterEcosystemDeviceStruct);
  v7 = objc_msgSend_deviceName(self, v5, v6);
  objc_msgSend_setDeviceName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_deviceNameLastEdit(self, v9, v10);
  objc_msgSend_setDeviceNameLastEdit_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_bridgedEndpoint(self, v13, v14);
  objc_msgSend_setBridgedEndpoint_(v4, v16, (uint64_t)v15);

  objc_super v19 = objc_msgSend_originalEndpoint(self, v17, v18);
  objc_msgSend_setOriginalEndpoint_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_deviceTypes(self, v21, v22);
  objc_msgSend_setDeviceTypes_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_uniqueLocationIDs(self, v25, v26);
  objc_msgSend_setUniqueLocationIDs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_uniqueLocationIDsLastEdit(self, v29, v30);
  objc_msgSend_setUniqueLocationIDsLastEdit_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_fabricIndex(self, v33, v34);
  objc_msgSend_setFabricIndex_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: deviceName:%@; deviceNameLastEdit:%@; bridgedEndpoint:%@; originalEndpoint:%@; deviceTypes:%@; uniqueLocationIDs:%@; uniqueLocationIDsLastEdit:%@; fabricIndex:%@; >",
    v5,
    self->_deviceName,
    self->_deviceNameLastEdit,
    self->_bridgedEndpoint,
    self->_originalEndpoint,
    self->_deviceTypes,
    self->_uniqueLocationIDs,
    self->_uniqueLocationIDsLastEdit,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSNumber)deviceNameLastEdit
{
  return self->_deviceNameLastEdit;
}

- (void)setDeviceNameLastEdit:(id)a3
{
}

- (NSNumber)bridgedEndpoint
{
  return self->_bridgedEndpoint;
}

- (void)setBridgedEndpoint:(id)a3
{
}

- (NSNumber)originalEndpoint
{
  return self->_originalEndpoint;
}

- (void)setOriginalEndpoint:(id)a3
{
}

- (NSArray)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setDeviceTypes:(id)a3
{
}

- (NSArray)uniqueLocationIDs
{
  return self->_uniqueLocationIDs;
}

- (void)setUniqueLocationIDs:(id)a3
{
}

- (NSNumber)uniqueLocationIDsLastEdit
{
  return self->_uniqueLocationIDsLastEdit;
}

- (void)setUniqueLocationIDsLastEdit:(id)a3
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
  objc_storeStrong((id *)&self->_uniqueLocationIDsLastEdit, 0);
  objc_storeStrong((id *)&self->_uniqueLocationIDs, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_originalEndpoint, 0);
  objc_storeStrong((id *)&self->_bridgedEndpoint, 0);
  objc_storeStrong((id *)&self->_deviceNameLastEdit, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end