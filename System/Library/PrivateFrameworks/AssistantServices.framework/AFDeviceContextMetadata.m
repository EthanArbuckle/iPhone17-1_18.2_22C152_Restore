@interface AFDeviceContextMetadata
+ (BOOL)supportsSecureCoding;
- (AFDeviceContextHistoryConfiguration)historyConfiguration;
- (AFDeviceContextMetadata)initWithBackingStore:(id)a3;
- (AFDeviceContextMetadata)initWithCoder:(id)a3;
- (AFDeviceContextMetadata)initWithType:(id)a3 deliveryDate:(id)a4 expirationDate:(id)a5 redactedKeyPaths:(id)a6 historyConfiguration:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpiredByDate:(id)a3;
- (NSArray)redactedKeyPaths;
- (NSDate)deliveryDate;
- (NSDate)expirationDate;
- (NSString)type;
- (id)backingStore;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeviceContextMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyConfiguration, 0);
  objc_storeStrong((id *)&self->_redactedKeyPaths, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deliveryDate, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (AFDeviceContextHistoryConfiguration)historyConfiguration
{
  return self->_historyConfiguration;
}

- (NSArray)redactedKeyPaths
{
  return self->_redactedKeyPaths;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (NSString)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AFDeviceContextMetadata *)self backingStore];
  [v4 encodeObject:v5 forKey:@"serializedBackingStore"];
}

- (AFDeviceContextMetadata)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"serializedBackingStore"];

  v9 = [(AFDeviceContextMetadata *)self initWithBackingStore:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDeviceContextMetadata *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AFDeviceContextMetadata *)self backingStore];
      v6 = [(AFDeviceContextMetadata *)v4 backingStore];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AFDeviceContextMetadata *)self backingStore];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceContextMetadata;
  id v4 = [(AFDeviceContextMetadata *)&v10 description];
  id v5 = [(AFDeviceContextMetadata *)self type];
  v6 = [(AFDeviceContextMetadata *)self deliveryDate];
  char v7 = [(AFDeviceContextMetadata *)self expirationDate];
  v8 = [v3 stringWithFormat:@"%@ (%@, %@, expires %@)", v4, v5, v6, v7];

  return v8;
}

- (BOOL)isExpiredByDate:(id)a3
{
  id v4 = a3;
  id v5 = [(AFDeviceContextMetadata *)self expirationDate];
  uint64_t v6 = [v4 compare:v5];

  return v6 == 1;
}

- (id)backingStore
{
  backingStore = self->_backingStore;
  if (!backingStore)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_backingStore;
    self->_backingStore = v4;

    backingStore = self->_backingStore;
  }
  type = self->_type;
  if (type)
  {
    [(NSMutableDictionary *)backingStore setObject:type forKey:@"metadata_type"];
    backingStore = self->_backingStore;
  }
  deliveryDate = self->_deliveryDate;
  if (deliveryDate) {
    [(NSMutableDictionary *)backingStore setObject:deliveryDate forKey:@"metadata_timestamp"];
  }
  else {
    [(NSMutableDictionary *)backingStore removeObjectForKey:@"metadata_timestamp"];
  }
  expirationDate = self->_expirationDate;
  v9 = self->_backingStore;
  if (expirationDate) {
    [(NSMutableDictionary *)v9 setObject:expirationDate forKey:@"metadata_expirationDate"];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:@"metadata_expirationDate"];
  }
  redactedKeyPaths = self->_redactedKeyPaths;
  uint64_t v11 = self->_backingStore;
  if (redactedKeyPaths) {
    [(NSMutableDictionary *)v11 setObject:redactedKeyPaths forKey:@"metadata_redactedKeyPaths"];
  }
  else {
    [(NSMutableDictionary *)v11 removeObjectForKey:@"metadata_redactedKeyPaths"];
  }
  historyConfiguration = self->_historyConfiguration;
  uint64_t v13 = self->_backingStore;
  if (historyConfiguration)
  {
    uint64_t v14 = [(AFDeviceContextHistoryConfiguration *)historyConfiguration buildDictionaryRepresentation];
    [(NSMutableDictionary *)v13 setObject:v14 forKey:@"metadata_historyConfiguration"];
  }
  else
  {
    [(NSMutableDictionary *)self->_backingStore removeObjectForKey:@"metadata_historyConfiguration"];
  }
  v15 = self->_backingStore;
  return v15;
}

- (AFDeviceContextMetadata)initWithBackingStore:(id)a3
{
  id v4 = a3;
  id v5 = [AFDeviceContextHistoryConfiguration alloc];
  uint64_t v6 = [v4 objectForKey:@"metadata_historyConfiguration"];
  char v7 = [(AFDeviceContextHistoryConfiguration *)v5 initWithDictionaryRepresentation:v6];

  v8 = [v4 objectForKey:@"metadata_type"];
  v9 = [v4 objectForKey:@"metadata_timestamp"];
  objc_super v10 = [v4 objectForKey:@"metadata_expirationDate"];
  uint64_t v11 = [v4 objectForKey:@"metadata_redactedKeyPaths"];
  uint64_t v12 = [(AFDeviceContextMetadata *)self initWithType:v8 deliveryDate:v9 expirationDate:v10 redactedKeyPaths:v11 historyConfiguration:v7];

  if (v12)
  {
    uint64_t v13 = [v4 mutableCopy];
    backingStore = v12->_backingStore;
    v12->_backingStore = (NSMutableDictionary *)v13;
  }
  return v12;
}

- (AFDeviceContextMetadata)initWithType:(id)a3 deliveryDate:(id)a4 expirationDate:(id)a5 redactedKeyPaths:(id)a6 historyConfiguration:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)AFDeviceContextMetadata;
  v18 = [(AFDeviceContextMetadata *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_type, a3);
    uint64_t v20 = [v14 copy];
    deliveryDate = v19->_deliveryDate;
    v19->_deliveryDate = (NSDate *)v20;

    uint64_t v22 = [v15 copy];
    expirationDate = v19->_expirationDate;
    v19->_expirationDate = (NSDate *)v22;

    uint64_t v24 = [v16 copy];
    redactedKeyPaths = v19->_redactedKeyPaths;
    v19->_redactedKeyPaths = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    historyConfiguration = v19->_historyConfiguration;
    v19->_historyConfiguration = (AFDeviceContextHistoryConfiguration *)v26;
  }
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end