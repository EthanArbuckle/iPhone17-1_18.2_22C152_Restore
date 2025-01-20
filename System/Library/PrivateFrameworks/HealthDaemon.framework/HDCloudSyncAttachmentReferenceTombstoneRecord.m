@interface HDCloudSyncAttachmentReferenceTombstoneRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isAttachmentReferenceTombstoneRecord:(id)a3;
+ (BOOL)isAttachmentReferenceTombstoneRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDForOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5;
+ (id)recordType;
- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5;
- (NSArray)attachmentReferenceTombstones;
- (NSString)ownerIdentifier;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (int64_t)attachmentReferenceTombstoneCount;
- (int64_t)recordIndex;
- (void)addAttachmentReferenceTombstone:(id)a3;
@end

@implementation HDCloudSyncAttachmentReferenceTombstoneRecord

- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() recordIDForOwnerIdentifier:v9 recordIndex:a4 zoneID:v8];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncReferenceTombstoneRecord" recordID:v10];
  v12 = [(HDCloudSyncAttachmentReferenceTombstoneRecord *)self initWithCKRecord:v11 schemaVersion:1];

  return v12;
}

- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentReferenceTombstoneRecord;
  v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentReferenceTombstones);
    underlyingReferenceTombstones = v5->_underlyingReferenceTombstones;
    v5->_underlyingReferenceTombstones = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableAttachmentReferenceTombstones alloc] initWithData:v6];
  id v8 = v5->_underlyingReferenceTombstones;
  v5->_underlyingReferenceTombstones = v7;

  if (v5->_underlyingReferenceTombstones)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying attachment message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5
{
  v7 = NSString;
  id v8 = a5;
  id v9 = [v7 stringWithFormat:@"%@%@%@%@%lld", @"CloudSyncReferenceTombstone", @"/", a3, @"/", a4];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v9 zoneID:v8];

  return v10;
}

+ (BOOL)isAttachmentReferenceTombstoneRecordID:(id)a3
{
  v3 = [a3 recordName];
  v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 3)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isEqualToString:@"CloudSyncReferenceTombstone"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentReferenceTombstoneRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncReferenceTombstoneRecord"];

  return v4;
}

- (NSString)ownerIdentifier
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 recordID];
  char v4 = [v3 recordName];
  v5 = [v4 componentsSeparatedByString:@"/"];

  char v6 = [v5 objectAtIndexedSubscript:1];

  return (NSString *)v6;
}

- (int64_t)recordIndex
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 recordID];
  char v4 = [v3 recordName];
  v5 = [v4 componentsSeparatedByString:@"/"];

  char v6 = [v5 objectAtIndexedSubscript:2];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)attachmentReferenceTombstoneCount
{
  v2 = [(HDCloudSyncCodableAttachmentReferenceTombstones *)self->_underlyingReferenceTombstones attachmentReferenceTombstones];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSArray)attachmentReferenceTombstones
{
  v2 = [(HDCloudSyncCodableAttachmentReferenceTombstones *)self->_underlyingReferenceTombstones attachmentReferenceTombstones];
  int64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_159);

  return (NSArray *)v3;
}

HDAttachmentReference *__78__HDCloudSyncAttachmentReferenceTombstoneRecord_attachmentReferenceTombstones__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [HDAttachmentReference alloc];
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  v5 = [v2 referenceIdentifier];
  char v6 = (void *)[v4 initWithUUIDString:v5];
  int64_t v7 = +[HDAttachmentReferenceSchemaIdentifier tombstoneSchemaIdentifier];
  [v2 creationDate];

  id v8 = HDDecodeDateForValue();
  id v9 = [(HDAttachmentReference *)v3 initWithIdentifier:v6 schemaIdentifier:v7 creationDate:v8 options:0 metadata:0 type:1 cloudStatus:1];

  return v9;
}

- (void)addAttachmentReferenceTombstone:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init(HDCloudSyncCodableAttachmentReferenceTombstone);
  v5 = [v4 identifier];
  char v6 = [v5 UUIDString];
  [(HDCloudSyncCodableAttachmentReferenceTombstone *)v9 setReferenceIdentifier:v6];

  int64_t v7 = [v4 schemaIdentifier];
  [(HDCloudSyncCodableAttachmentReferenceTombstone *)v9 setSchemaIdentifier:v7];

  id v8 = [v4 creationDate];

  [v8 timeIntervalSinceReferenceDate];
  -[HDCloudSyncCodableAttachmentReferenceTombstone setCreationDate:](v9, "setCreationDate:");

  [(HDCloudSyncCodableAttachmentReferenceTombstones *)self->_underlyingReferenceTombstones addAttachmentReferenceTombstone:v9];
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncReferenceTombstoneRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  int64_t v3 = [a3 objectForKeyedSubscript:@"Version"];
  id v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableAttachmentReferenceTombstones *)self->_underlyingReferenceTombstones data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(HDCloudSyncAttachmentReferenceTombstoneRecord *)self attachmentReferenceTombstones];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v9 = NSString;
        v10 = [v8 identifier];
        v11 = [v10 UUIDString];
        v12 = [v8 schemaIdentifier];
        v13 = [v8 creationDate];
        v14 = [v9 stringWithFormat:@"| Reference Identifier: %@| Schema Identifier: %@| Creation Date: %@", v11, v12, v13];

        [v3 appendString:v14];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  objc_super v15 = [NSString stringWithFormat:@"+ Tombstones: %@\n+--------------------------------------------------", v3];

  return v15;
}

- (void).cxx_destruct
{
}

@end