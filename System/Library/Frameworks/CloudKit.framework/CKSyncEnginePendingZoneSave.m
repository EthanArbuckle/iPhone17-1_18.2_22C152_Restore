@interface CKSyncEnginePendingZoneSave
+ (BOOL)supportsSecureCoding;
- (CKRecordZone)zone;
- (CKSyncEnginePendingZoneSave)initWithCoder:(id)a3;
- (CKSyncEnginePendingZoneSave)initWithZone:(CKRecordZone *)zone;
- (id)CKDescriptionClassName;
- (id)oppositeTypeChange;
- (id)zoneID;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKSyncEnginePendingZoneSave

- (id)zoneID
{
  v4 = objc_msgSend_zone(self, a2, v2, v3);
  v8 = objc_msgSend_zoneID(v4, v5, v6, v7);

  return v8;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (CKSyncEnginePendingZoneSave)initWithZone:(CKRecordZone *)zone
{
  v4 = zone;
  v8 = objc_msgSend_zoneID(v4, v5, v6, v7);
  v16.receiver = self;
  v16.super_class = (Class)CKSyncEnginePendingZoneSave;
  v9 = [(CKSyncEnginePendingDatabaseChange *)&v16 initWithZoneID:v8 type:0];

  if (v9)
  {
    uint64_t v13 = objc_msgSend_copy(v4, v10, v11, v12);
    v14 = v9->_zone;
    v9->_zone = (CKRecordZone *)v13;
  }
  return v9;
}

- (void).cxx_destruct
{
}

- (id)CKDescriptionClassName
{
  return @"PendingZoneSave";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKSyncEnginePendingZoneSave;
  id v4 = a3;
  [(CKSyncEnginePendingDatabaseChange *)&v8 encodeWithCoder:v4];
  zone = self->_zone;
  uint64_t v6 = NSStringFromSelector(sel_zone);
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)zone, (uint64_t)v6, v8.receiver, v8.super_class);
}

- (CKSyncEnginePendingZoneSave)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEnginePendingZoneSave;
  v5 = [(CKSyncEnginePendingDatabaseChange *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_zone);
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    zone = v5->_zone;
    v5->_zone = (CKRecordZone *)v9;
  }
  return v5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKSyncEnginePendingZoneSave;
  id v4 = a3;
  [(CKSyncEnginePendingDatabaseChange *)&v10 CKDescribePropertiesUsing:v4];
  objc_super v8 = objc_msgSend_zone(self, v5, v6, v7, v10.receiver, v10.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"zone", (uint64_t)v8, 0);
}

- (id)oppositeTypeChange
{
  uint64_t v3 = [CKSyncEnginePendingZoneDelete alloc];
  uint64_t v7 = objc_msgSend_zoneID(self, v4, v5, v6);
  objc_super v10 = objc_msgSend_initWithZoneID_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

@end