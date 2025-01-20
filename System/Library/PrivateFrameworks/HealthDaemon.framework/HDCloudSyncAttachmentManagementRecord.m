@interface HDCloudSyncAttachmentManagementRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isAttachmentManagementRecord:(id)a3;
+ (BOOL)isAttachmentManagementRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (id)recordIDForZoneID:(id)a3;
+ (id)recordType;
- (HDCloudSyncAttachmentManagementRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSUUID)UUID;
- (id)initInZoneID:(id)a3;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
@end

@implementation HDCloudSyncAttachmentManagementRecord

- (id)initInZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() recordIDForZoneID:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"AttachmentManagementRecord" recordID:v5];
  v7 = [(HDCloudSyncAttachmentManagementRecord *)self initWithCKRecord:v6 schemaVersion:1];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    [(HDCloudSyncCodableAttachmentManagementRecord *)v7->_underlyingAttachmentManagementRecord setUuid:v9];
  }
  return v7;
}

- (HDCloudSyncAttachmentManagementRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentManagementRecord;
  id v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentManagementRecord);
    underlyingAttachmentManagementRecord = v5->_underlyingAttachmentManagementRecord;
    v5->_underlyingAttachmentManagementRecord = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableAttachmentManagementRecord alloc] initWithData:v6];
  v8 = v5->_underlyingAttachmentManagementRecord;
  v5->_underlyingAttachmentManagementRecord = v7;

  if (v5->_underlyingAttachmentManagementRecord)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying attachment management message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForZoneID:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v3 stringWithFormat:@"%@", @"AttachmentManagement"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5 zoneID:v4];

  return v6;
}

+ (BOOL)isAttachmentManagementRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 isEqualToString:@"AttachmentManagement"];

  return v4;
}

+ (BOOL)isAttachmentManagementRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"AttachmentManagementRecord"];

  return v4;
}

- (NSUUID)UUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HDCloudSyncCodableAttachmentManagementRecord *)self->_underlyingAttachmentManagementRecord uuid];
  v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"AttachmentManagementRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Version"];
  char v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableAttachmentManagementRecord *)self->_underlyingAttachmentManagementRecord data];
}

- (id)printDescription
{
  v2 = NSString;
  id v3 = [(HDCloudSyncAttachmentManagementRecord *)self UUID];
  char v4 = [v2 stringWithFormat:@"+ UUID: %@\n+--------------------------------------------------", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end