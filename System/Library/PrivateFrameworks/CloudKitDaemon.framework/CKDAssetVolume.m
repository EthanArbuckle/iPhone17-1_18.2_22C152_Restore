@interface CKDAssetVolume
+ (id)CKSQLiteClassName;
- (NSNumber)volumeIndex;
- (NSUUID)volumeUUID;
- (id)CKPropertiesDescription;
- (id)description;
- (void)setVolumeIndex:(id)a3;
- (void)setVolumeUUID:(id)a3;
@end

@implementation CKDAssetVolume

+ (id)CKSQLiteClassName
{
  return @"CKAssetVolume";
}

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 2);
  v4 = NSString;
  v7 = objc_msgSend_volumeIndex(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"volumeIndex=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v13 = objc_msgSend_volumeUUID(self, v11, v12);

  if (v13)
  {
    v16 = NSString;
    v17 = objc_msgSend_volumeUUID(self, v14, v15);
    v20 = objc_msgSend_UUIDString(v17, v18, v19);
    v22 = objc_msgSend_stringWithFormat_(v16, v21, @"volumeUUID=%@", v20);
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);
  }
  v24 = objc_msgSend_componentsJoinedByString_(v3, v14, @", ");

  return v24;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetVolume *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSNumber)volumeIndex
{
  return self->_volumeIndex;
}

- (void)setVolumeIndex:(id)a3
{
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (void)setVolumeUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeIndex, 0);
}

@end