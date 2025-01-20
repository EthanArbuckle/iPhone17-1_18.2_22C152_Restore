@interface BCMutableCloudData
+ (BOOL)supportsSecureCoding;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BCMutableCloudData)init;
- (BCMutableCloudData)initWithCloudData:(id)a3;
- (BCMutableCloudData)initWithCoder:(id)a3;
- (BCMutableCloudData)initWithRecord:(id)a3;
- (BOOL)deletedFlag;
- (BOOL)isEqual:(id)a3;
- (CKRecord)systemFields;
- (NSData)ckSystemFields;
- (NSDate)modificationDate;
- (NSString)localRecordID;
- (id)configuredRecordFromAttributes;
- (id)identifier;
- (id)recordType;
- (id)zoneName;
- (int64_t)editGeneration;
- (int64_t)syncGeneration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)incrementEditGeneration;
- (void)setDeletedFlag:(BOOL)a3;
- (void)setEditGeneration:(int64_t)a3;
- (void)setLocalRecordID:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSyncGeneration:(int64_t)a3;
- (void)setSystemFields:(id)a3;
@end

@implementation BCMutableCloudData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecordID, 0);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_systemFields, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (BCMutableCloudData)initWithCloudData:(id)a3
{
  id v4 = a3;
  v5 = [(BCMutableCloudData *)self init];
  if (v5)
  {
    v6 = [v4 privacyDelegate];

    if (!v6)
    {
      v7 = sub_1000083A0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001E6DDC();
      }
    }
    v8 = [v4 privacyDelegate];
    objc_storeWeak((id *)&v5->_privacyDelegate, v8);

    v5->_deletedFlag = [v4 deletedFlag];
    uint64_t v9 = [v4 modificationDate];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v9;

    v5->_editGeneration = (int64_t)[v4 editGeneration];
    v5->_syncGeneration = (int64_t)[v4 syncGeneration];
    uint64_t v11 = [v4 systemFields];
    systemFields = v5->_systemFields;
    v5->_systemFields = (CKRecord *)v11;
  }
  return v5;
}

- (BCMutableCloudData)init
{
  v5.receiver = self;
  v5.super_class = (Class)BCMutableCloudData;
  v2 = [(BCMutableCloudData *)&v5 init];
  if (v2 && BUIsRunningTests())
  {
    v3 = +[BCCloudDataNullPrivacyDelegate nullPrivacyDelegate];
    objc_storeWeak((id *)&v2->_privacyDelegate, v3);
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BCMutableCloudData *)self identifier];
  [v6 encodeObject:v4 forKey:@"localRecordID"];

  objc_msgSend(v6, "encodeBool:forKey:", -[BCMutableCloudData deletedFlag](self, "deletedFlag"), @"deletedFlag");
  objc_super v5 = [(BCMutableCloudData *)self modificationDate];
  [v6 encodeObject:v5 forKey:@"modificationDate"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudData editGeneration](self, "editGeneration"), @"editGeneration");
  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudData syncGeneration](self, "syncGeneration"), @"syncGeneration");
}

- (int64_t)syncGeneration
{
  return self->_syncGeneration;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (int64_t)editGeneration
{
  return self->_editGeneration;
}

- (BOOL)deletedFlag
{
  return self->_deletedFlag;
}

- (BCMutableCloudData)initWithRecord:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)BCMutableCloudData;
    id v6 = [(BCMutableCloudData *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_systemFields, a3);
      v7->_deletedFlag = 0;
      uint64_t v8 = [v5 modificationDate];
      modificationDate = v7->_modificationDate;
      v7->_modificationDate = (NSDate *)v8;

      v7->_editGeneration = 0;
      v7->_syncGeneration = 0;
    }
  }
  else
  {
    v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E6E10();
    }

    v7 = 0;
  }

  return v7;
}

- (NSData)ckSystemFields
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6E44();
  }

  v3 = +[NSData data];
  return (NSData *)v3;
}

- (id)recordType
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6E78();
  }

  return &stru_10026BED0;
}

- (id)identifier
{
  v2 = sub_1000083A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001E6EAC();
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

- (CKRecord)systemFields
{
  v3 = [(BCMutableCloudData *)self privacyDelegate];
  if ([v3 establishedSalt])
  {
    id v4 = [(BCMutableCloudData *)self identifier];

    if (v4)
    {
      id v5 = [(BCMutableCloudData *)self recordType];
      id v6 = [(BCMutableCloudData *)self identifier];
      v7 = [v3 recordNameFromRecordType:v5 identifier:v6];

      systemFields = self->_systemFields;
      if (!systemFields
        || ([(CKRecord *)systemFields recordID],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v9 recordName],
            v10 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v11 = [v10 isEqualToString:v7],
            v10,
            v9,
            (v11 & 1) == 0))
      {
        id v12 = objc_alloc((Class)CKRecordZoneID);
        v13 = [(BCMutableCloudData *)self zoneName];
        id v14 = [v12 initWithZoneName:v13 ownerName:CKCurrentUserDefaultName];

        id v15 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v14];
        id v16 = objc_alloc((Class)CKRecord);
        v17 = [(BCMutableCloudData *)self recordType];
        v18 = (CKRecord *)[v16 initWithRecordType:v17 recordID:v15];
        v19 = self->_systemFields;
        self->_systemFields = v18;

        [(BCMutableCloudData *)self incrementEditGeneration];
      }
    }
  }
  v20 = self->_systemFields;

  return v20;
}

- (void)incrementEditGeneration
{
  v3 = (char *)[(BCMutableCloudData *)self editGeneration] + 1;
  [(BCMutableCloudData *)self setEditGeneration:v3];
}

- (id)configuredRecordFromAttributes
{
  v3 = [(BCMutableCloudData *)self systemFields];
  id v4 = [(BCMutableCloudData *)self identifier];
  id v5 = [v3 encryptedValuesByKey];
  [v5 setObject:v4 forKeyedSubscript:@"localRecordIDEncrypted"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    id v6 = [(BCMutableCloudData *)self identifier];
    v7 = [v5 identifier];
    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(BCMutableCloudData *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BCMutableCloudData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BCMutableCloudData *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localRecordID"];
    localRecordID = v5->_localRecordID;
    v5->_localRecordID = (NSString *)v6;

    v5->_deletedFlag = [v4 decodeBoolForKey:@"deletedFlag"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v8;

    v5->_editGeneration = (int64_t)[v4 decodeInt64ForKey:@"editGeneration"];
    v5->_syncGeneration = (int64_t)[v4 decodeInt64ForKey:@"syncGeneration"];
  }

  return v5;
}

- (void)setDeletedFlag:(BOOL)a3
{
  self->_deletedFlag = a3;
}

- (void)setEditGeneration:(int64_t)a3
{
  self->_editGeneration = a3;
}

- (void)setSyncGeneration:(int64_t)a3
{
  self->_syncGeneration = a3;
}

- (void)setModificationDate:(id)a3
{
}

- (void)setSystemFields:(id)a3
{
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (NSString)localRecordID
{
  return self->_localRecordID;
}

- (void)setLocalRecordID:(id)a3
{
}

@end