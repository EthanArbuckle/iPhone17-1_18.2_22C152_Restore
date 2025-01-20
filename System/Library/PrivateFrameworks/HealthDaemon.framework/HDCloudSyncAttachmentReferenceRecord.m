@interface HDCloudSyncAttachmentReferenceRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isAttachmentReferenceRecord:(id)a3;
+ (BOOL)isAttachmentReferenceRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDForReferenceIdentifier:(id)a3 zoneID:(id)a4;
+ (id)recordType;
- (HDAttachmentReference)attachmentReference;
- (HDCloudSyncAttachmentReferenceRecord)initWithAttachmentReference:(id)a3 zoneID:(id)a4;
- (HDCloudSyncAttachmentReferenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSString)attachmentIdentifier;
- (NSString)referenceIdentifier;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
@end

@implementation HDCloudSyncAttachmentReferenceRecord

- (HDCloudSyncAttachmentReferenceRecord)initWithAttachmentReference:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v9 = [v6 identifier];
  v10 = [v9 UUIDString];
  v11 = [v8 recordIDForReferenceIdentifier:v10 zoneID:v7];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncAttachmentReferenceRecord" recordID:v11];
  v13 = [(HDCloudSyncAttachmentReferenceRecord *)self initWithCKRecord:v12 schemaVersion:1];
  if (v13)
  {
    v14 = [v6 objectIdentifier];
    [(HDCloudSyncCodableAttachmentReference *)v13->_underlyingReference setObjectIdentifier:v14];

    v15 = [v6 schemaIdentifier];
    [(HDCloudSyncCodableAttachmentReference *)v13->_underlyingReference setSchemaIdentifier:v15];

    -[HDCloudSyncCodableAttachmentReference setSchemaVersion:](v13->_underlyingReference, "setSchemaVersion:", [v6 schemaVersion]);
    v16 = [v6 attachmentIdentifier];
    v17 = [v16 UUIDString];
    [(HDCloudSyncCodableAttachmentReference *)v13->_underlyingReference setAttachmentIdentifier:v17];

    -[HDCloudSyncCodableAttachmentReference setType:](v13->_underlyingReference, "setType:", [v6 type]);
    v18 = [v6 creationDate];
    [v18 timeIntervalSinceReferenceDate];
    -[HDCloudSyncCodableAttachmentReference setCreationDate:](v13->_underlyingReference, "setCreationDate:");

    -[HDCloudSyncCodableAttachmentReference setOptions:](v13->_underlyingReference, "setOptions:", [v6 options]);
    v19 = [v6 metadata];
    v20 = objc_msgSend(v19, "hk_codableMetadata");
    v21 = [v20 data];
    [(HDCloudSyncCodableAttachmentReference *)v13->_underlyingReference setMetadata:v21];
  }
  return v13;
}

- (HDCloudSyncAttachmentReferenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentReferenceRecord;
  v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentReference);
    underlyingReference = v5->_underlyingReference;
    v5->_underlyingReference = v11;

    goto LABEL_8;
  }
  id v7 = [[HDCloudSyncCodableAttachmentReference alloc] initWithData:v6];
  v8 = v5->_underlyingReference;
  v5->_underlyingReference = v7;

  if (v5->_underlyingReference)
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
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying reference message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForReferenceIdentifier:(id)a3 zoneID:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = [v5 stringWithFormat:@"%@%@%@", @"CloudSyncAttachmentReference", @"/", a3];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v7 zoneID:v6];

  return v8;
}

+ (BOOL)isAttachmentReferenceRecordID:(id)a3
{
  v3 = [a3 recordName];
  v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isEqualToString:@"CloudSyncAttachmentReference"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentReferenceRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncAttachmentReferenceRecord"];

  return v4;
}

- (HDAttachmentReference)attachmentReference
{
  uint64_t v3 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference schemaVersion];
  int64_t v4 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference type];
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  if (!v4) {
    uint64_t v3 = v5;
  }
  char v6 = [HDAttachmentReferenceSchemaIdentifier alloc];
  id v7 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference schemaIdentifier];
  v8 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference objectIdentifier];
  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  v10 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference attachmentIdentifier];
  v11 = (void *)[v9 initWithUUIDString:v10];
  v12 = [(HDAttachmentReferenceSchemaIdentifier *)v6 initWithSchemaIdentifier:v7 schemaVersion:v3 objectIdentifier:v8 attachmentIdentifier:v11];

  v13 = [HDAttachmentReference alloc];
  id v14 = objc_alloc(MEMORY[0x1E4F29128]);
  objc_super v15 = [(HDCloudSyncAttachmentReferenceRecord *)self referenceIdentifier];
  v16 = (void *)[v14 initWithUUIDString:v15];
  [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference creationDate];
  v17 = HDDecodeDateForValue();
  int64_t v18 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference options];
  v19 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference metadata];
  v20 = +[HDCodableMetadataDictionary decodeMetadataFromData:v19];
  v21 = [(HDAttachmentReference *)v13 initWithIdentifier:v16 schemaIdentifier:v12 creationDate:v17 options:v18 metadata:v20 type:[(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference type] cloudStatus:1];

  return v21;
}

- (NSString)referenceIdentifier
{
  v2 = [(HDCloudSyncRecord *)self record];
  uint64_t v3 = [v2 recordID];
  int64_t v4 = [v3 recordName];
  uint64_t v5 = [v4 componentsSeparatedByString:@"/"];

  char v6 = [v5 objectAtIndexedSubscript:1];

  return (NSString *)v6;
}

- (NSString)attachmentIdentifier
{
  return [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference attachmentIdentifier];
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncAttachmentReferenceRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"Version"];
  int64_t v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  uint64_t v3 = NSString;
  int64_t v4 = [(HDCloudSyncAttachmentReferenceRecord *)self referenceIdentifier];
  BOOL v5 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference objectIdentifier];
  char v6 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference schemaIdentifier];
  int64_t v7 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference schemaVersion];
  v8 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference attachmentIdentifier];
  int64_t v9 = [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference type];
  [(HDCloudSyncCodableAttachmentReference *)self->_underlyingReference creationDate];
  v10 = HDDecodeDateForValue();
  v11 = [v3 stringWithFormat:@"+ Identifier: %@\n+ Object Identifier: %@\n+ Schema Identifier: %@\n+ Schema Version: %lld\n+ Attachment Identifier: %@\n+ Type: %lld\n+ Creation date: %@\n+--------------------------------------------------", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (void).cxx_destruct
{
}

@end