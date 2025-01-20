@interface HKCloudSyncZoneDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncRecordZoneIDDescription)zoneIDDescription;
- (HKCloudSyncShareParticipantDescription)ownerParticipantDescription;
- (HKCloudSyncZoneDescription)initWithCoder:(id)a3;
- (HKCloudSyncZoneDescription)initWithZoneIDDescription:(id)a3 type:(id)a4 ownerParticipantDescription:(id)a5 otherParticipantsDescription:(id)a6 recordDescriptions:(id)a7;
- (NSArray)otherParticipantsDescription;
- (NSArray)recordDescriptions;
- (NSString)type;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncZoneDescription

- (HKCloudSyncZoneDescription)initWithZoneIDDescription:(id)a3 type:(id)a4 ownerParticipantDescription:(id)a5 otherParticipantsDescription:(id)a6 recordDescriptions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKCloudSyncZoneDescription;
  v17 = [(HKCloudSyncZoneDescription *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    zoneIDDescription = v17->_zoneIDDescription;
    v17->_zoneIDDescription = (HKCloudSyncRecordZoneIDDescription *)v18;

    uint64_t v20 = [v13 copy];
    type = v17->_type;
    v17->_type = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    ownerParticipantDescription = v17->_ownerParticipantDescription;
    v17->_ownerParticipantDescription = (HKCloudSyncShareParticipantDescription *)v22;

    uint64_t v24 = [v15 copy];
    otherParticipantsDescription = v17->_otherParticipantsDescription;
    v17->_otherParticipantsDescription = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    recordDescriptions = v17->_recordDescriptions;
    v17->_recordDescriptions = (NSArray *)v26;
  }
  return v17;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"Zone ID: %@,Type: %@,Owner Participant: %@ \nOther Participants: %@ \nRecord Descriptions: %@", self->_zoneIDDescription, self->_type, self->_ownerParticipantDescription, self->_otherParticipantsDescription, self->_recordDescriptions];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  zoneIDDescription = self->_zoneIDDescription;
  id v5 = a3;
  [v5 encodeObject:zoneIDDescription forKey:@"ZoneIDDescription"];
  [v5 encodeObject:self->_type forKey:@"Type"];
  [v5 encodeObject:self->_ownerParticipantDescription forKey:@"OwnerParticipantDescription"];
  [v5 encodeObject:self->_otherParticipantsDescription forKey:@"OtherParticipantsDescription"];
  [v5 encodeObject:self->_recordDescriptions forKey:@"RecordDescriptions"];
}

- (HKCloudSyncZoneDescription)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ZoneIDDescription"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OwnerParticipantDescription"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"OtherParticipantsDescription"];

  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [v12 setWithArray:v13];
  id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"RecordDescriptions"];

  id v16 = [(HKCloudSyncZoneDescription *)self initWithZoneIDDescription:v5 type:v6 ownerParticipantDescription:v7 otherParticipantsDescription:v11 recordDescriptions:v15];
  return v16;
}

- (HKCloudSyncRecordZoneIDDescription)zoneIDDescription
{
  return self->_zoneIDDescription;
}

- (NSString)type
{
  return self->_type;
}

- (HKCloudSyncShareParticipantDescription)ownerParticipantDescription
{
  return self->_ownerParticipantDescription;
}

- (NSArray)otherParticipantsDescription
{
  return self->_otherParticipantsDescription;
}

- (NSArray)recordDescriptions
{
  return self->_recordDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDescriptions, 0);
  objc_storeStrong((id *)&self->_otherParticipantsDescription, 0);
  objc_storeStrong((id *)&self->_ownerParticipantDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_zoneIDDescription, 0);
}

@end