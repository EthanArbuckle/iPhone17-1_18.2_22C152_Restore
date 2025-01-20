@interface HKCloudSyncRecordDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncRecordDescription)initWithCoder:(id)a3;
- (HKCloudSyncRecordDescription)initWithRecordIDDescription:(id)a3 recordType:(id)a4 schemaVersion:(id)a5 modificationDate:(id)a6 detailedDescription:(id)a7 childRecordDescriptions:(id)a8;
- (HKCloudSyncRecordIDDescription)recordIDDescription;
- (NSArray)childRecordDescriptions;
- (NSDate)modificationDate;
- (NSNumber)schemaVersion;
- (NSString)detailedDescription;
- (NSString)recordType;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncRecordDescription

- (HKCloudSyncRecordDescription)initWithRecordIDDescription:(id)a3 recordType:(id)a4 schemaVersion:(id)a5 modificationDate:(id)a6 detailedDescription:(id)a7 childRecordDescriptions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HKCloudSyncRecordDescription;
  v20 = [(HKCloudSyncRecordDescription *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    recordIDDescription = v20->_recordIDDescription;
    v20->_recordIDDescription = (HKCloudSyncRecordIDDescription *)v21;

    uint64_t v23 = [v15 copy];
    recordType = v20->_recordType;
    v20->_recordType = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    schemaVersion = v20->_schemaVersion;
    v20->_schemaVersion = (NSNumber *)v25;

    uint64_t v27 = [v17 copy];
    modificationDate = v20->_modificationDate;
    v20->_modificationDate = (NSDate *)v27;

    uint64_t v29 = [v18 copy];
    detailedDescription = v20->_detailedDescription;
    v20->_detailedDescription = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    childRecordDescriptions = v20->_childRecordDescriptions;
    v20->_childRecordDescriptions = (NSArray *)v31;
  }
  return v20;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"Record ID: %@,Record Type: %@Schema Version: %@Modification Date: %@Detailed Description: %@Child Descriptions: %@", self->_recordIDDescription, self->_recordType, self->_schemaVersion, self->_modificationDate, self->_detailedDescription, self->_childRecordDescriptions];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recordIDDescription = self->_recordIDDescription;
  id v5 = a3;
  [v5 encodeObject:recordIDDescription forKey:@"RecordIDDescription"];
  [v5 encodeObject:self->_recordType forKey:@"RecordType"];
  [v5 encodeObject:self->_schemaVersion forKey:@"SchemaVersion"];
  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
  [v5 encodeObject:self->_detailedDescription forKey:@"DetailedDescription"];
  [v5 encodeObject:self->_childRecordDescriptions forKey:@"ChildRecordDescriptions"];
}

- (HKCloudSyncRecordDescription)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordIDDescription"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SchemaVersion"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DetailedDescription"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ChildRecordDescriptions"];

  id v14 = [(HKCloudSyncRecordDescription *)self initWithRecordIDDescription:v5 recordType:v6 schemaVersion:v7 modificationDate:v8 detailedDescription:v9 childRecordDescriptions:v13];
  return v14;
}

- (HKCloudSyncRecordIDDescription)recordIDDescription
{
  return self->_recordIDDescription;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSArray)childRecordDescriptions
{
  return self->_childRecordDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childRecordDescriptions, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_storeStrong((id *)&self->_recordIDDescription, 0);
}

@end