@interface HDCloudSyncAttachmentRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isAttachmentRecord:(id)a3;
+ (BOOL)isAttachmentRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)attachmentIdentifierForRecordID:(id)a3;
+ (id)recordIDForAttachmentIdentifier:(id)a3 zoneID:(id)a4;
+ (id)recordType;
+ (id)recordWithAttachment:(id)a3 fileHandle:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)hasAssetData;
- (HDAttachment)attachment;
- (HDCloudSyncAttachmentRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSData)assetData;
- (NSString)attachmentIdentifier;
- (NSURL)assetURL;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (int64_t)fileSize;
- (void)unitTest_setFileURL:(id)a3;
@end

@implementation HDCloudSyncAttachmentRecord

+ (id)recordWithAttachment:(id)a3 fileHandle:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [HDCloudSyncAttachmentRecord alloc];
  id v13 = v11;
  id v14 = v10;
  if (v12)
  {
    id v15 = v9;
    v16 = objc_opt_class();
    v17 = [v13 identifier];
    v18 = [v17 UUIDString];
    v19 = [v16 recordIDForAttachmentIdentifier:v18 zoneID:v15];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncAttachmentRecord" recordID:v19];
    v21 = [v13 encryptionKey];

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E4F28DB0];
      v23 = [v13 encryptionKey];
      v21 = [v22 archivedDataWithRootObject:v23 requiringSecureCoding:1 error:a6];
    }
    v24 = [(HDCloudSyncAttachmentRecord *)v12 initWithCKRecord:v20 schemaVersion:1];
    if (v24)
    {
      v39 = a6;
      v25 = [v13 name];
      [v24[3] setFileName:v25];

      objc_msgSend(v24[3], "setFileSize:", objc_msgSend(v13, "size"));
      v26 = [v13 type];
      [v24[3] setMimeType:v26];

      v27 = [v13 fileHash];
      [v24[3] setFileHash:v27];

      v28 = [v13 creationDate];
      [v28 timeIntervalSinceReferenceDate];
      objc_msgSend(v24[3], "setCreationDate:");

      v29 = [v13 metadata];
      v30 = objc_msgSend(v29, "hk_codableMetadata");
      v31 = [v30 data];
      [v24[3] setMetadata:v31];

      [v24[3] setEncryptionKey:v21];
      if ((unint64_t)[v13 size] > 0x61A8)
      {
        v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F19E50]), "initWithFileDescriptor:", objc_msgSend(v14, "fileDescriptor"));
        [v20 setObject:v36 forKeyedSubscript:@"CloudSyncAttachmentAsset"];
      }
      else
      {
        id v40 = 0;
        v32 = [v14 readDataToEndOfFileAndReturnError:&v40];
        id v33 = v40;
        v34 = v33;
        if (!v32 && v33)
        {
          _HKInitializeLogging();
          v35 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v24;
            __int16 v43 = 2114;
            v44 = v34;
            _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read data from file handle to set asset data, %{public}@", buf, 0x16u);
          }
          if (v39) {
            id *v39 = v34;
          }
          else {
            _HKLogDroppedError();
          }

          v37 = 0;
          goto LABEL_15;
        }
        [v24[3] setAssetData:v32];
      }
    }
    v37 = v24;
LABEL_15:

    goto LABEL_16;
  }
  v37 = 0;
LABEL_16:

  return v37;
}

- (HDCloudSyncAttachmentRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentRecord;
  v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    id v11 = objc_alloc_init(HDCloudSyncCodableAttachment);
    underlyingAttachment = v5->_underlyingAttachment;
    v5->_underlyingAttachment = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableAttachment alloc] initWithData:v6];
  v8 = v5->_underlyingAttachment;
  v5->_underlyingAttachment = v7;

  if (v5->_underlyingAttachment)
  {
LABEL_8:

LABEL_9:
    id v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying attachment message.", (uint8_t *)v14, 2u);
  }

  id v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForAttachmentIdentifier:(id)a3 zoneID:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  v7 = [v5 stringWithFormat:@"%@%@%@", @"CloudSyncAttachment", @"/", a3];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v7 zoneID:v6];

  return v8;
}

+ (BOOL)isAttachmentRecordID:(id)a3
{
  v3 = [a3 recordName];
  v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isEqualToString:@"CloudSyncAttachment"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncAttachmentRecord"];

  return v4;
}

+ (id)attachmentIdentifierForRecordID:(id)a3
{
  id v4 = a3;
  if ([a1 isAttachmentRecordID:v4])
  {
    v5 = [v4 recordName];
    char v6 = [v5 componentsSeparatedByString:@"/"];

    v7 = [v6 objectAtIndexedSubscript:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)attachmentIdentifier
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 recordID];
  id v4 = [v3 recordName];
  v5 = [v4 componentsSeparatedByString:@"/"];

  char v6 = [v5 objectAtIndexedSubscript:1];

  return (NSString *)v6;
}

- (HDAttachment)attachment
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment encryptionKey];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    char v6 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment encryptionKey];
    id v24 = 0;
    uint64_t v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v24];
    id v8 = v24;

    if (!v7)
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2114;
        id v28 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Unable to decode encryption key: %{public}@", buf, 0x16u);
      }
    }

    v23 = (void *)v7;
  }
  else
  {
    v23 = 0;
  }
  v21 = [HDAttachment alloc];
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v22 = [(HDCloudSyncAttachmentRecord *)self attachmentIdentifier];
  id v11 = (void *)[v10 initWithUUIDString:v22];
  v12 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileName];
  id v13 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment mimeType];
  id v14 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileHash];
  int64_t v15 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileSize];
  [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment creationDate];
  v16 = HDDecodeDateForValue();
  v17 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment metadata];
  v18 = +[HDCodableMetadataDictionary decodeMetadataFromData:v17];
  v19 = [(HDAttachment *)v21 initWithIdentifier:v11 name:v12 type:v13 hash:v14 size:v15 creationDate:v16 metadata:v18 encryptionKey:v23];

  return v19;
}

- (BOOL)hasAssetData
{
  return [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment hasAssetData];
}

- (NSData)assetData
{
  return [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment assetData];
}

- (NSURL)assetURL
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"CloudSyncAttachmentAsset"];

  id v4 = [v3 fileURL];

  return (NSURL *)v4;
}

- (int64_t)fileSize
{
  return [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileSize];
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncAttachmentRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  id v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableAttachment *)self->_underlyingAttachment data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  v3 = NSString;
  id v4 = [(HDCloudSyncAttachmentRecord *)self attachmentIdentifier];
  BOOL v5 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileName];
  int64_t v6 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileSize];
  uint64_t v7 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment mimeType];
  id v8 = [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment fileHash];
  [(HDCloudSyncCodableAttachment *)self->_underlyingAttachment creationDate];
  id v9 = HDDecodeDateForValue();
  id v10 = [v3 stringWithFormat:@"+ Identifier: %@\n+ File name: %@\n+ File size: %lld\n+ Mime type: %@\n+ File hash: %@\n+ Creation date: %@\n+--------------------------------------------------", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (void)unitTest_setFileURL:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F19E50];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithFileURL:v5];

  int64_t v6 = [(HDCloudSyncRecord *)self record];
  [v6 setObject:v7 forKeyedSubscript:@"CloudSyncAttachmentAsset"];
}

- (void).cxx_destruct
{
}

@end