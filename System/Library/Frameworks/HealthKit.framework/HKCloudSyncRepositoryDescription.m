@interface HKCloudSyncRepositoryDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncContainerDescription)primaryContainerDescription;
- (HKCloudSyncRepositoryDescription)initWithCoder:(id)a3;
- (HKCloudSyncRepositoryDescription)initWithIdentifier:(id)a3 primaryContainerDescription:(id)a4 secondaryContainerDescriptions:(id)a5;
- (NSArray)secondaryContainerDescriptions;
- (NSString)fullDescription;
- (NSString)identifier;
- (id)_descriptionForContainer:(id)a3;
- (id)_descriptionForDatabase:(id)a3 indentCount:(unint64_t)a4;
- (id)_descriptionForRecord:(id)a3 indentCount:(unint64_t)a4;
- (id)_descriptionForZone:(id)a3 indentCount:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncRepositoryDescription

- (HKCloudSyncRepositoryDescription)initWithIdentifier:(id)a3 primaryContainerDescription:(id)a4 secondaryContainerDescriptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCloudSyncRepositoryDescription;
  v11 = [(HKCloudSyncRepositoryDescription *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    primaryContainerDescription = v11->_primaryContainerDescription;
    v11->_primaryContainerDescription = (HKCloudSyncContainerDescription *)v14;

    uint64_t v16 = [v10 copy];
    secondaryContainerDescriptions = v11->_secondaryContainerDescriptions;
    v11->_secondaryContainerDescriptions = (NSArray *)v16;
  }
  return v11;
}

- (NSString)fullDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_primaryContainerDescription)
  {
    -[HKCloudSyncRepositoryDescription _descriptionForContainer:](self, "_descriptionForContainer:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EEC60288;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_secondaryContainerDescriptions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [(HKCloudSyncRepositoryDescription *)self _descriptionForContainer:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        v3 = [NSString stringWithFormat:@"%@ \n %@", v9, v10, (void)v12];

        ++v8;
        id v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (id)_descriptionForContainer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = NSString;
  uint64_t v6 = [v4 containerIdentifier];
  uint64_t v7 = [v4 deviceIdentifier];
  uint64_t v8 = [v5 stringWithFormat:@"Container ID: %@, Device ID: %@", v6, v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v17 = v4;
  id v9 = [v4 databaseDescriptions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v8;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = [(HKCloudSyncRepositoryDescription *)self _descriptionForDatabase:*(void *)(*((void *)&v18 + 1) + 8 * v13) indentCount:1];
        uint64_t v8 = [NSString stringWithFormat:@"%@ \n %@", v14, v15];

        ++v13;
        long long v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_descriptionForDatabase:(id)a3 indentCount:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = NSString;
  uint64_t v8 = [v6 scope];
  id v9 = [v7 stringWithFormat:@"Scope: %@ ", v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = v6;
  uint64_t v10 = [v6 zoneDescriptions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  unint64_t v20 = a4;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    unint64_t v14 = a4 + 1;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = v9;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = [(HKCloudSyncRepositoryDescription *)self _descriptionForZone:*(void *)(*((void *)&v22 + 1) + 8 * v15) indentCount:v14];
        id v9 = [NSString stringWithFormat:@"%@ \n %@", v16, v17];

        ++v15;
        uint64_t v16 = v9;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  long long v18 = objc_msgSend(v9, "hk_stringIndentedBy:", v20);

  return v18;
}

- (id)_descriptionForZone:(id)a3 indentCount:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = NSString;
  uint64_t v8 = [v6 zoneIDDescription];
  id v9 = [v8 description];
  uint64_t v10 = [v6 type];
  uint64_t v11 = [v6 ownerParticipantDescription];
  uint64_t v12 = [v6 otherParticipantsDescription];
  uint64_t v13 = [v7 stringWithFormat:@"%@, Type: %@ \nOwner Participant: %@ \nOther Participants: %@ \n", v9, v10, v11, v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v26 = v6;
  unint64_t v14 = [v6 recordDescriptions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  unint64_t v25 = a4;
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = a4;
    uint64_t v18 = *(void *)v28;
    unint64_t v19 = v17 + 1;
    do
    {
      uint64_t v20 = 0;
      long long v21 = v13;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v22 = [(HKCloudSyncRepositoryDescription *)self _descriptionForRecord:*(void *)(*((void *)&v27 + 1) + 8 * v20) indentCount:v19];
        uint64_t v13 = [NSString stringWithFormat:@"%@ \n %@", v21, v22];

        ++v20;
        long long v21 = v13;
      }
      while (v16 != v20);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  long long v23 = objc_msgSend(v13, "hk_stringIndentedBy:", v25);

  return v23;
}

- (id)_descriptionForRecord:(id)a3 indentCount:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = NSString;
  uint64_t v8 = [v6 recordIDDescription];
  id v9 = [v6 schemaVersion];
  uint64_t v10 = [v6 modificationDate];
  uint64_t v11 = [v6 detailedDescription];
  uint64_t v12 = objc_msgSend(v11, "hk_stringIndentedBy:", a4 + 3);
  uint64_t v13 = [v7 stringWithFormat:@"%@, Schema: %@, Mod Date: %@ \n%@", v8, v9, v10, v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v26 = v6;
  unint64_t v14 = [v6 childRecordDescriptions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  unint64_t v25 = a4;
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = a4;
    uint64_t v18 = *(void *)v28;
    unint64_t v19 = v17 + 1;
    do
    {
      uint64_t v20 = 0;
      long long v21 = v13;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v22 = [(HKCloudSyncRepositoryDescription *)self _descriptionForRecord:*(void *)(*((void *)&v27 + 1) + 8 * v20) indentCount:v19];
        uint64_t v13 = [NSString stringWithFormat:@"%@ \n %@", v21, v22];

        ++v20;
        long long v21 = v13;
      }
      while (v16 != v20);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  long long v23 = objc_msgSend(v13, "hk_stringIndentedBy:", v25);

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_primaryContainerDescription forKey:@"PrimaryContainerDescription"];
  [v5 encodeObject:self->_secondaryContainerDescriptions forKey:@"SecondaryContainerDescriptions"];
}

- (HKCloudSyncRepositoryDescription)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryContainerDescription"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v9 = [v7 setWithArray:v8];
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SecondaryContainerDescriptions"];

  uint64_t v11 = [(HKCloudSyncRepositoryDescription *)self initWithIdentifier:v5 primaryContainerDescription:v6 secondaryContainerDescriptions:v10];
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HKCloudSyncContainerDescription)primaryContainerDescription
{
  return self->_primaryContainerDescription;
}

- (NSArray)secondaryContainerDescriptions
{
  return self->_secondaryContainerDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryContainerDescriptions, 0);
  objc_storeStrong((id *)&self->_primaryContainerDescription, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end