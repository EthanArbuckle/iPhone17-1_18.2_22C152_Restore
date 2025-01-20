@interface BCCloudData
+ (id)localIdentifierFromRecord:(id)a3;
+ (id)propertyIDKey;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BOOL)hasValidSalt;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (CKRecord)systemFields;
- (id)configuredRecordFromAttributes;
- (id)identifier;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)incrementEditGeneration;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSystemFields:(id)a3;
@end

@implementation BCCloudData

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_privacyDelegate, obj);
  }
  v5 = [(BCCloudData *)self saltedHashedID];
  if (!v5)
  {
    v5 = [(BCCloudData *)self privacyDelegate];
    if ([v5 establishedSalt])
    {
      v6 = [(BCCloudData *)self identifier];

      if (!v6) {
        goto LABEL_8;
      }
      v5 = [(BCCloudData *)self privacyDelegate];
      v7 = [(BCCloudData *)self recordType];
      v8 = [(BCCloudData *)self identifier];
      v9 = [v5 recordNameFromRecordType:v7 identifier:v8];
      [(BCCloudData *)self setSaltedHashedID:v9];
    }
  }

LABEL_8:
}

- (CKRecord)systemFields
{
  v3 = [(BCCloudData *)self privacyDelegate];
  v4 = [(BCCloudData *)self ckSystemFields];

  if (v4)
  {
    v5 = [(BCCloudData *)self ckSystemFields];
    v4 = +[BCCloudKitDatabaseController decodeRecordFromSystemFields:v5];

    if ([v3 establishedSalt])
    {
      v6 = [(BCCloudData *)self recordType];
      v7 = [(BCCloudData *)self identifier];
      v8 = [v3 recordNameFromRecordType:v6 identifier:v7];

      v9 = [v4 recordID];
      v10 = [v9 recordName];
      unsigned __int8 v11 = [v10 isEqualToString:v8];

      if ((v11 & 1) == 0)
      {
        v12 = sub_1000083A0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1001E6C40(self);
        }

        [(BCCloudData *)self setSystemFields:0];
        v4 = 0;
      }
    }
  }
  v13 = [(BCCloudData *)self ckSystemFields];

  if (!v13)
  {
    if ([v3 establishedSalt])
    {
      v14 = [(BCCloudData *)self identifier];

      if (v14)
      {
        v15 = [(BCCloudData *)self recordType];
        v16 = [(BCCloudData *)self identifier];
        v17 = [v3 recordNameFromRecordType:v15 identifier:v16];

        if (v17)
        {
          v18 = [(BCCloudData *)self saltedHashedID];

          if (!v18) {
            [(BCCloudData *)self setSaltedHashedID:v17];
          }
          id v19 = objc_alloc((Class)CKRecordZoneID);
          v20 = [(BCCloudData *)self zoneName];
          v21 = [v19 initWithZoneName:v20 ownerName:CKCurrentUserDefaultName];

          id v22 = [objc_alloc((Class)CKRecordID) initWithRecordName:v17 zoneID:v21];
          id v23 = objc_alloc((Class)CKRecord);
          v24 = [(BCCloudData *)self recordType];
          id v25 = [v23 initWithRecordType:v24 recordID:v22];

          [(BCCloudData *)self setSystemFields:v25];
          [(BCCloudData *)self incrementEditGeneration];

          v4 = v25;
        }
        else
        {
          v21 = sub_1000083A0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1001E6BB0(self);
          }
        }
      }
    }
  }

  return (CKRecord *)v4;
}

- (void).cxx_destruct
{
}

- (id)mutableCopy
{
  v3 = [BCMutableCloudData alloc];
  return [(BCMutableCloudData *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v36 = a3;
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v36 deletedFlag]);
  [(BCCloudData *)self setDifferentNumber:v5 forKey:@"deletedFlag"];

  v6 = [v36 modificationDate];
  [(BCCloudData *)self setDifferentDate:v6 forKey:@"modificationDate"];

  v7 = [(BCCloudData *)self systemFields];
  if (!v7) {
    goto LABEL_12;
  }
  v8 = [v36 systemFields];
  v9 = [v8 recordChangeTag];
  if (v9)
  {
    v10 = [(BCCloudData *)self systemFields];
    unsigned __int8 v11 = [v10 recordChangeTag];
    v12 = [v36 systemFields];
    v13 = [v12 recordChangeTag];
    if (![v11 isEqualToString:v13])
    {

      goto LABEL_12;
    }
    v30 = v12;
    v31 = v11;
    v32 = v10;
    v35 = v8;
    objc_msgSend(v36, "systemFields", v13);
  }
  else
  {
    v35 = v8;
    objc_msgSend(v36, "systemFields", v28);
  v14 = };
  uint64_t v15 = [v14 recordID];
  if (!v15)
  {

    if (!v9)
    {
      v26 = v35;
      goto LABEL_17;
    }

    v26 = v35;
    v27 = v32;
LABEL_16:

LABEL_17:
    id v22 = v36;
    goto LABEL_18;
  }
  v16 = (void *)v15;
  v33 = [v36 systemFields];
  v17 = [v33 recordID];
  v18 = [v17 recordName];
  id v19 = [(BCCloudData *)self systemFields];
  v20 = [v19 recordID];
  v21 = [v20 recordName];
  unsigned __int8 v34 = [v18 isEqualToString:v21];

  if (v9)
  {
  }
  id v22 = v36;
  if ((v34 & 1) == 0)
  {
LABEL_12:
    id v23 = [v36 systemFields];
    [(BCCloudData *)self setSystemFields:v23];

    v24 = [(BCCloudData *)self privacyDelegate];
    unsigned int v25 = [v24 establishedSalt];

    id v22 = v36;
    if (!v25) {
      goto LABEL_18;
    }
    v7 = [(BCCloudData *)self privacyDelegate];
    v26 = [v36 recordType];
    v9 = [v36 identifier];
    v27 = [v7 recordNameFromRecordType:v26 identifier:v9];
    [(BCCloudData *)self setSaltedHashedID:v27];
    goto LABEL_16;
  }
LABEL_18:
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = [(BCCloudData *)self systemFields];
  if (!v8)
  {
    v4 = [v7 systemFields];
    if (!v4)
    {
      LODWORD(v9) = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  v9 = [(BCCloudData *)self systemFields];
  if (v9)
  {
    v10 = [v7 systemFields];
    uint64_t v11 = [v10 recordChangeTag];
    if (!v11)
    {

      LODWORD(v9) = 1;
      if (!v8) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    v12 = (void *)v11;
    [(BCCloudData *)self systemFields];
    v13 = BOOL v30 = v5;
    [v13 recordChangeTag];
    v14 = v29 = v4;
    uint64_t v15 = [v7 systemFields];
    v16 = [v15 recordChangeTag];
    unsigned int v28 = [v14 isEqualToString:v16];

    v4 = v29;
    BOOL v5 = v30;

    LODWORD(v9) = v28;
  }
  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:

  uint64_t v17 = [(BCCloudData *)self saltedHashedID];
  v18 = [v7 systemFields];
  id v19 = [v18 recordID];
  uint64_t v20 = [v19 recordName];

  if (v17 | v20 && (v17 ? (v21 = v20 == 0) : (v21 = 1), v21 ? (int v22 = 0) : (int v22 = 1), !v5 || v22)) {
    unsigned int v23 = [(id)v17 isEqualToString:v20];
  }
  else {
    unsigned int v23 = 1;
  }
  unsigned int v24 = [(BCCloudData *)self deletedFlag];
  unsigned int v25 = v23 & (v24 ^ [v7 deletedFlag] ^ 1);
  if (v9) {
    BOOL v26 = v25;
  }
  else {
    BOOL v26 = 0;
  }

  return v26;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v13 = a3;
  uint64_t v5 = [(BCCloudData *)self systemFields];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = (void *)v5;
  id v7 = [(BCCloudData *)self systemFields];
  v8 = [v7 recordChangeTag];
  v9 = [v13 recordChangeTag];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
LABEL_3:
    [(BCCloudData *)self setSystemFields:v13];
    uint64_t v11 = [v13 recordID];
    v12 = [v11 recordName];
    [(BCCloudData *)self setSaltedHashedID:v12];
  }
}

- (BOOL)hasValidSalt
{
  v3 = [(BCCloudData *)self privacyDelegate];
  uint64_t v4 = [(BCCloudData *)self ckSystemFields];
  if (v4 && (uint64_t v5 = (void *)v4, v6 = [v3 establishedSalt], v5, v6))
  {
    id v7 = [(BCCloudData *)self ckSystemFields];
    v8 = +[BCCloudKitDatabaseController decodeRecordFromSystemFields:v7];

    v9 = [(BCCloudData *)self recordType];
    unsigned __int8 v10 = [(BCCloudData *)self identifier];
    uint64_t v11 = [v3 recordNameFromRecordType:v9 identifier:v10];

    v12 = [v8 recordID];
    id v13 = [v12 recordName];
    unsigned int v14 = [v13 isEqualToString:v11];

    uint64_t v15 = +[BULogUtilities shared];
    LODWORD(v13) = [v15 verboseLoggingEnabled];

    if (v13)
    {
      v16 = sub_10000CD80();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v8 recordID];
        v18 = [v17 recordName];
        int v20 = 138543874;
        BOOL v21 = v18;
        __int16 v22 = 2114;
        unsigned int v23 = v11;
        __int16 v24 = 1024;
        unsigned int v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "\"\\\"Comparing %{public}@ record name %{public}@  hasValidSalt:%{BOOL}d\\\"\"", (uint8_t *)&v20, 0x1Cu);
      }
    }
  }
  else
  {
    v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001E6AE8(v3, self);
    }
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)setSystemFields:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    uint64_t v5 = +[BCCloudKitDatabaseController encodeRecordSystemFields:v4];
    [(BCCloudData *)self setCkSystemFields:v5];

    unsigned int v6 = [v8 recordID];
    id v7 = [v6 recordName];
    [(BCCloudData *)self setSaltedHashedID:v7];
  }
  else
  {
    [(BCCloudData *)self setCkSystemFields:0];
    [(BCCloudData *)self setSaltedHashedID:0];
  }
}

- (void)incrementEditGeneration
{
  [(BCCloudData *)self setEditGeneration:(char *)[(BCCloudData *)self editGeneration] + 1];
  v3 = +[BULogUtilities shared];
  unsigned int v4 = [v3 verboseLoggingEnabled];

  if (v4)
  {
    uint64_t v5 = sub_10000CD80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218242;
      id v7 = [(BCCloudData *)self editGeneration];
      __int16 v8 = 2112;
      v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\"\\\"Incrementing edit generation to: %lld for %@\\\"\"", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)configuredRecordFromAttributes
{
  v3 = [(BCCloudData *)self systemFields];
  unsigned int v4 = [(BCCloudData *)self identifier];
  uint64_t v5 = [v3 encryptedValuesByKey];
  [v5 setObject:v4 forKeyedSubscript:@"localRecordIDEncrypted"];

  return v3;
}

- (id)recordType
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6D0C();
  }

  return &stru_10026BED0;
}

- (id)identifier
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6D40();
  }

  return 0;
}

- (id)zoneName
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6D74();
  }

  return &stru_10026BED0;
}

+ (id)propertyIDKey
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6DA8();
  }

  return &stru_10026BED0;
}

+ (id)localIdentifierFromRecord:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 encryptedValuesByKey];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"localRecordIDEncrypted"];

  if (!v5)
  {
    objc_opt_class();
    int v6 = [v3 objectForKey:@"localRecordID"];
    uint64_t v5 = BUDynamicCast();
  }
  return v5;
}

@end