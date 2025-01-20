@interface CKSyncEnginePendingZoneDelete
+ (BOOL)supportsSecureCoding;
- (CKSyncEnginePendingZoneDelete)initWithZoneID:(CKRecordZoneID *)zoneID;
- (id)CKDescriptionClassName;
- (id)oppositeTypeChange;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEnginePendingZoneDelete

- (id)CKDescriptionClassName
{
  return @"PendingZoneDelete";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSyncEnginePendingZoneDelete)initWithZoneID:(CKRecordZoneID *)zoneID
{
  v4.receiver = self;
  v4.super_class = (Class)CKSyncEnginePendingZoneDelete;
  return [(CKSyncEnginePendingDatabaseChange *)&v4 initWithZoneID:zoneID type:1];
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKSyncEnginePendingZoneDelete;
  id v4 = a3;
  [(CKSyncEnginePendingDatabaseChange *)&v10 CKDescribePropertiesUsing:v4];
  v8 = objc_msgSend_zoneID(self, v5, v6, v7, v10.receiver, v10.super_class);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"zoneID", (uint64_t)v8, 0);
}

- (id)oppositeTypeChange
{
  v3 = [CKSyncEnginePendingZoneSave alloc];
  id v4 = [CKRecordZone alloc];
  v8 = objc_msgSend_zoneID(self, v5, v6, v7);
  v11 = objc_msgSend_initWithZoneID_(v4, v9, (uint64_t)v8, v10);
  v14 = objc_msgSend_initWithZone_(v3, v12, (uint64_t)v11, v13);

  return v14;
}

@end