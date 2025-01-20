@interface HKSharedSummaryTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSharedSummaryTransaction)initWithCoder:(id)a3;
- (HKSharedSummaryTransaction)initWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSString)sourceDeviceIdentifier;
- (NSUUID)UUID;
- (id)description;
- (unint64_t)hash;
- (void)_setCreationDate:(id)a3;
- (void)_setSourceDeviceIdentifier:(id)a3;
- (void)addMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSharedSummaryTransaction

- (HKSharedSummaryTransaction)initWithUUID:(id)a3 sourceDeviceIdentifier:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSharedSummaryTransaction;
  v12 = [(HKSharedSummaryTransaction *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    uint64_t v14 = [v10 copy];
    sourceDeviceIdentifier = v13->_sourceDeviceIdentifier;
    v13->_sourceDeviceIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)v16;
  }
  return v13;
}

- (void)addMetadata:(id)a3
{
  metadata = self->_metadata;
  id v5 = a3;
  v6 = (NSDictionary *)[(NSDictionary *)metadata mutableCopy];
  [(NSDictionary *)v6 addEntriesFromDictionary:v5];

  v7 = self->_metadata;
  self->_metadata = v6;
}

- (void)_setSourceDeviceIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  sourceDeviceIdentifier = self->_sourceDeviceIdentifier;
  self->_sourceDeviceIdentifier = v4;

  MEMORY[0x1F41817F8](v4, sourceDeviceIdentifier);
}

- (void)_setCreationDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  creationDate = self->_creationDate;
  self->_creationDate = v4;

  MEMORY[0x1F41817F8](v4, creationDate);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@:%p UUID=%@, source device=%@", v5, self, self->_UUID, self->_sourceDeviceIdentifier];

  if (self->_creationDate)
  {
    if (description_onceToken != -1) {
      dispatch_once(&description_onceToken, &__block_literal_global_112);
    }
    v7 = NSString;
    v8 = [(id)description_formatter stringFromDate:self->_creationDate];
    id v9 = [v7 stringWithFormat:@" creation date=%@", v8];

    id v10 = [NSString stringWithFormat:@"<%@%@>", v6, v9];
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"<%@>", v6];
  }

  return v10;
}

uint64_t __41__HKSharedSummaryTransaction_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  v2 = (void *)description_formatter;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSharedSummaryTransaction *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      UUID = self->_UUID;
      v6 = [(HKSharedSummaryTransaction *)v4 UUID];
      char v7 = [(NSUUID *)UUID isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_sourceDeviceIdentifier forKey:@"SourceDeviceIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKSharedSummaryTransaction)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceDeviceIdentifier"];
  char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:5];
  id v10 = objc_msgSend(v8, "setWithArray:", v9, v15, v16, v17, v18);

  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Metadata"];

  v12 = [(HKSharedSummaryTransaction *)self initWithUUID:v5 sourceDeviceIdentifier:v6 metadata:v11];
  v13 = v12;
  if (v12 && v7) {
    [(HKSharedSummaryTransaction *)v12 _setCreationDate:v7];
  }

  return v13;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)sourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sourceDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end