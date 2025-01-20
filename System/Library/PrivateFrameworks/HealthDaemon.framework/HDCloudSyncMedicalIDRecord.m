@interface HDCloudSyncMedicalIDRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isMedicalIDRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (id)recordIDWithZoneID:(id)a3;
+ (id)recordType;
- (HDCloudSyncMedicalIDRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDCodableMedicalIDData)medicalIDData;
- (NSArray)medicalIDLogs;
- (id)initInSyncCircle:(id)a3;
- (id)initInZone:(id)a3;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (void)addMedicalIDEvent:(id)a3;
- (void)setMedicalIDData:(id)a3;
@end

@implementation HDCloudSyncMedicalIDRecord

- (id)initInSyncCircle:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_msgSend(MEMORY[0x1E4F1A320], "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v4);

  v7 = [v5 recordIDWithZoneID:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncMedicalIDRecord" recordID:v7];
  v9 = [(HDCloudSyncMedicalIDRecord *)self initWithCKRecord:v8 schemaVersion:1];

  return v9;
}

- (id)initInZone:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() recordIDWithZoneID:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncMedicalIDRecord" recordID:v5];
  v7 = [(HDCloudSyncMedicalIDRecord *)self initWithCKRecord:v6 schemaVersion:1];

  return v7;
}

- (HDCloudSyncMedicalIDRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncMedicalIDRecord;
  id v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableMedicalID);
    underlyingCodableMedicalIDMessage = v5->_underlyingCodableMedicalIDMessage;
    v5->_underlyingCodableMedicalIDMessage = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableMedicalID alloc] initWithData:v6];
  v8 = v5->_underlyingCodableMedicalIDMessage;
  v5->_underlyingCodableMedicalIDMessage = v7;

  if (v5->_underlyingCodableMedicalIDMessage)
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
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying Medical ID message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDWithZoneID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithRecordName:@"CloudSyncMedicalID" zoneID:v4];

  return v5;
}

+ (BOOL)isMedicalIDRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncMedicalIDRecord"];

  return v4;
}

- (void)setMedicalIDData:(id)a3
{
  id v4 = (id)[a3 copy];
  [(HDCloudSyncCodableMedicalID *)self->_underlyingCodableMedicalIDMessage setMedicalIDData:v4];
}

- (HDCodableMedicalIDData)medicalIDData
{
  return [(HDCloudSyncCodableMedicalID *)self->_underlyingCodableMedicalIDMessage medicalIDData];
}

- (NSArray)medicalIDLogs
{
  v2 = [(HDCloudSyncCodableMedicalID *)self->_underlyingCodableMedicalIDMessage medicalIDLogs];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addMedicalIDEvent:(id)a3
{
  underlyingCodableMedicalIDMessage = self->_underlyingCodableMedicalIDMessage;
  id v5 = a3;
  id v11 = [(HDCloudSyncCodableMedicalID *)underlyingCodableMedicalIDMessage medicalIDLogs];
  v6 = objc_alloc_init(HDCloudSyncCodableLog);
  v7 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSinceReferenceDate];
  -[HDCloudSyncCodableLog setTimeStamp:](v6, "setTimeStamp:");

  v8 = (void *)[v5 copy];
  [(HDCloudSyncCodableLog *)v6 setEvent:v8];

  if (v11)
  {
    if ((unint64_t)[v11 count] >= 5) {
      [v11 removeObjectAtIndex:0];
    }
    id v9 = v11;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v12 = v9;
  [v9 addObject:v6];
  v10 = (void *)[v12 mutableCopy];
  [(HDCloudSyncCodableMedicalID *)self->_underlyingCodableMedicalIDMessage setMedicalIDLogs:v10];
}

- (id)printDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = [(HDCloudSyncMedicalIDRecord *)self medicalIDData];
  [v4 dateSaved];
  if (v5 == 0.0)
  {
    v21 = [v3 stringWithFormat:@"| MedicalID Data Modified Date: %@", 0];
  }
  else
  {
    v6 = [(HDCloudSyncMedicalIDRecord *)self medicalIDData];
    [v6 dateSaved];
    v7 = HDDecodeDateForValue();
    v21 = [v3 stringWithFormat:@"| MedicalID Data Modified Date: %@", v7];
  }
  v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n | MedicalID Log:\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(HDCloudSyncMedicalIDRecord *)self medicalIDLogs];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_super v15 = NSString;
        v16 = [v14 event];
        [v14 timeStamp];
        v17 = HDDecodeDateForValue();
        v18 = [v15 stringWithFormat:@"| Event: %@ | TimeStamp: %@", v16, v17];

        [v8 appendString:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v19 = [NSString stringWithFormat:@"+%@%@\n+--------------------------------------------------", v21, v8];

  return v19;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncMedicalIDRecord";
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
  return (id)[(HDCloudSyncCodableMedicalID *)self->_underlyingCodableMedicalIDMessage data];
}

- (void).cxx_destruct
{
}

@end