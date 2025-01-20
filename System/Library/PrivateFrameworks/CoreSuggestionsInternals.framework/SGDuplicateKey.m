@interface SGDuplicateKey
+ (BOOL)serializationPassesBasicScrutiny:(id)a3;
+ (id)duplicateKeyForCuratedEventWithExternalID:(id)a3;
+ (id)duplicateKeyForDeliveryWithProviderString:(id)a3 trackingNumber:(id)a4 parentKey:(id)a5;
+ (id)duplicateKeyForEmailWithSource:(id)a3 messageId:(id)a4;
+ (id)duplicateKeyForInteraction:(id)a3 fromBundleIdentifier:(id)a4;
+ (id)duplicateKeyForInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4;
+ (id)duplicateKeyForInteractionWithBundleId:(id)a3 personHandle:(id)a4;
+ (id)duplicateKeyForMessage:(id)a3 fromSource:(id)a4;
+ (id)duplicateKeyForNaturalLanguageEventWithStartDate:(id)a3 endDate:(id)a4 title:(id)a5 participants:(id)a6 parentKey:(id)a7;
+ (id)duplicateKeyForPseudoContactWithIdentity:(id)a3 parentKey:(id)a4;
+ (id)duplicateKeyForPseudoEventWithGroupId:(id)a3 parentKey:(id)a4;
+ (id)duplicateKeyForPseudoReminderWithGroupId:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 parentKey:(id)a5;
+ (id)duplicateKeyForSchemaOrg;
+ (id)duplicateKeyForSearchableItem:(id)a3;
+ (id)duplicateKeyForTextMessageWithSource:(id)a3 uniqueIdentifier:(id)a4;
+ (id)duplicateKeyForWalletOrderIdentifier:(id)a3 parentKey:(id)a4;
+ (id)duplicateKeyForWalletPassIdentifier:(id)a3 parentKey:(id)a4;
+ (id)duplicateKeyForWebPageFromSource:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDuplicateKey:(id)a3;
- (NSData)compositeHash;
- (SGDuplicateKey)initWithEntityKey:(id)a3 entityType:(int64_t)a4 parentKey:(id)a5;
- (SGDuplicateKey)initWithMessageIdHeaderValues:(id)a3 accountIdentifier:(id)a4;
- (SGDuplicateKey)initWithSearchableItem:(id)a3;
- (SGDuplicateKey)initWithSerialized:(id)a3;
- (SGDuplicateKey)initWithSerializedEntityKey:(id)a3 entityType:(int64_t)a4 serializedParentKey:(id)a5;
- (SGDuplicateKey)parentKey;
- (SGEntityKey)entityKey;
- (id)bundleId;
- (id)contactDetailKey;
- (id)curatedEventKey;
- (id)deliveryKey;
- (id)description;
- (id)emailKey;
- (id)identityKey;
- (id)interactionKey;
- (id)messageKey;
- (id)pseudoContactKey;
- (id)pseudoEventKey;
- (id)pseudoReminderKey;
- (id)serialize;
- (id)textMessageKey;
- (id)walletOrderKey;
- (id)walletPassKey;
- (id)webPageKey;
- (int64_t)entityType;
- (unint64_t)hash;
@end

@implementation SGDuplicateKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentKey, 0);
  objc_storeStrong((id *)&self->_entityKey, 0);
}

- (SGDuplicateKey)parentKey
{
  return self->_parentKey;
}

- (SGEntityKey)entityKey
{
  return self->_entityKey;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (id)bundleId
{
  v2 = 0;
  int64_t entityType = self->_entityType;
  if (entityType <= 15)
  {
    if (entityType == 5)
    {
      v4 = (id *)MEMORY[0x1E4F5DC28];
    }
    else
    {
      if (entityType != 13) {
        goto LABEL_11;
      }
      v4 = (id *)MEMORY[0x1E4F5DC38];
    }
LABEL_9:
    id v5 = *v4;
LABEL_10:
    v2 = v5;
    goto LABEL_11;
  }
  if (entityType != 16)
  {
    if (entityType != 18) {
      goto LABEL_11;
    }
    v4 = (id *)MEMORY[0x1E4F5DC60];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SGEntityKey *)self->_entityKey bundleId];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [SGInteractionKey alloc];
    v9 = [(SGEntityKey *)self->_entityKey serialize];
    v10 = [(SGMessageKey *)v8 initWithSerialized:v9];

    v2 = [(SGInteractionKey *)v10 bundleId];
  }
  else
  {
    v2 = 0;
  }
LABEL_11:
  return v2;
}

- (NSData)compositeHash
{
  v2 = [(SGDuplicateKey *)self serialize];
  v3 = SGSha256BytesForString(v2, 0);

  return (NSData *)v3;
}

- (id)walletPassKey
{
  if (!+[SGWalletPassKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 431, @"Invalid parameter not satisfying: %@", @"[SGWalletPassKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGWalletPassKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGWalletPassKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)walletOrderKey
{
  if (!+[SGWalletOrderKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 425, @"Invalid parameter not satisfying: %@", @"[SGWalletOrderKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGWalletOrderKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGWalletOrderKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)deliveryKey
{
  if (!+[SGDeliveryKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 419, @"Invalid parameter not satisfying: %@", @"[SGDeliveryKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGDeliveryKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGDeliveryKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)pseudoReminderKey
{
  if (!+[SGPseudoReminderKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 413, @"Invalid parameter not satisfying: %@", @"[SGPseudoReminderKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGPseudoReminderKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGPseudoReminderKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)pseudoEventKey
{
  if (!+[SGPseudoEventKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 407, @"Invalid parameter not satisfying: %@", @"[SGPseudoEventKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGPseudoEventKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGPseudoEventKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)interactionKey
{
  if (!+[SGInteractionKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 401, @"Invalid parameter not satisfying: %@", @"[SGInteractionKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGInteractionKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGMessageKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)webPageKey
{
  if (!+[SGWebPageKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 395, @"Invalid parameter not satisfying: %@", @"[SGWebPageKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGWebPageKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGMessageKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)textMessageKey
{
  if (!+[SGTextMessageKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 389, @"Invalid parameter not satisfying: %@", @"[SGTextMessageKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGTextMessageKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGMessageKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)emailKey
{
  if (!+[SGEmailKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 383, @"Invalid parameter not satisfying: %@", @"[SGEmailKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGEmailKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGMessageKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)messageKey
{
  v3 = 0;
  int64_t entityType = self->_entityType;
  if (entityType > 15)
  {
    if (entityType == 16)
    {
      v3 = [(SGDuplicateKey *)self interactionKey];
    }
    else if (entityType == 18)
    {
      v3 = [(SGDuplicateKey *)self webPageKey];
    }
  }
  else if (entityType == 5)
  {
    v3 = [(SGDuplicateKey *)self emailKey];
  }
  else if (entityType == 13)
  {
    v3 = [(SGDuplicateKey *)self textMessageKey];
  }
  return v3;
}

- (id)identityKey
{
  if ((SGEntityTypeIsContact() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 362, @"Invalid parameter not satisfying: %@", @"SGEntityTypeIsContact(_entityType)" object file lineNumber description];
  }
  v4 = [(SGDuplicateKey *)self pseudoContactKey];
  id v5 = [v4 identityKey];

  return v5;
}

- (id)pseudoContactKey
{
  if (!+[SGPseudoContactKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 356, @"Invalid parameter not satisfying: %@", @"[SGPseudoContactKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGPseudoContactKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGPseudoContactKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)contactDetailKey
{
  if (!+[SGContactDetailKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 350, @"Invalid parameter not satisfying: %@", @"[SGContactDetailKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGContactDetailKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGContactDetailKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)curatedEventKey
{
  if (!+[SGCuratedEventKey isSupportedEntityType:self->_entityType])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 343, @"Invalid parameter not satisfying: %@", @"[SGCuratedEventKey isSupportedEntityType:_entityType]" object file lineNumber description];
  }
  v4 = [SGCuratedEventKey alloc];
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  v6 = [(SGCuratedEventKey *)v4 initWithSerialized:v5];

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = SGEntityTypeDescription();
  id v5 = (void *)[v3 initWithFormat:@"<SGDuplicateKey entityType:%@ entityKey:%@ parentKey:%@>", v4, self->_entityKey, self->_parentKey];

  return v5;
}

- (unint64_t)hash
{
  int64_t entityType = self->_entityType;
  uint64_t v4 = [(SGEntityKey *)self->_entityKey hash] - entityType + 32 * entityType;
  return [(SGDuplicateKey *)self->_parentKey hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToDuplicateKey:(id)a3
{
  uint64_t v4 = (SGDuplicateKey *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    entityKey = self->_entityKey;
    v7 = v4->_entityKey;
    if (entityKey == v7)
    {
    }
    else
    {
      v8 = v7;
      v9 = entityKey;
      char v10 = [(SGEntityKey *)v9 isEqual:v8];

      if ((v10 & 1) == 0) {
        goto LABEL_10;
      }
    }
    int64_t entityType = self->_entityType;
    if (entityType != [(SGDuplicateKey *)v5 entityType])
    {
LABEL_10:
      char v11 = 0;
      goto LABEL_13;
    }
    v13 = self->_parentKey;
    v14 = v13;
    if (v13 == v5->_parentKey) {
      char v11 = 1;
    }
    else {
      char v11 = -[SGDuplicateKey isEqual:](v13, "isEqual:");
    }
  }
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGDuplicateKey *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGDuplicateKey *)self isEqualToDuplicateKey:v5];

  return v6;
}

- (id)serialize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)__str = 0u;
  long long v10 = 0u;
  snprintf(__str, 0x20uLL, "%llu", self->_entityType);
  id v3 = (void *)[[NSString alloc] initWithBytesNoCopy:__str length:strlen(__str) encoding:1 freeWhenDone:0];
  parentKey = self->_parentKey;
  id v5 = [(SGEntityKey *)self->_entityKey serialize];
  if (parentKey)
  {
    v8 = [(SGDuplicateKey *)self->_parentKey serialize];
    BOOL v6 = SGDelimitedStringsSerialize();
  }
  else
  {
    BOOL v6 = SGDelimitedStringsSerialize();
  }

  return v6;
}

- (SGDuplicateKey)initWithSearchableItem:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F93790];
  id v5 = a3;
  BOOL v6 = [v4 mailItemMessageIdHeaderValues:v5];
  v7 = [v5 attributeSet];

  v8 = [v7 accountIdentifier];

  if ([v6 count]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    long long v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Email Searchable Item is malformed - missing message id or account identifier", v13, 2u);
    }

    uint64_t v11 = 0;
  }
  else
  {
    self = [(SGDuplicateKey *)self initWithMessageIdHeaderValues:v6 accountIdentifier:v8];
    uint64_t v11 = self;
  }

  return v11;
}

- (SGDuplicateKey)initWithMessageIdHeaderValues:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    BOOL v9 = [SGEmailKey alloc];
    long long v10 = [v6 objectAtIndexedSubscript:0];
    uint64_t v11 = [(SGEmailKey *)v9 initWithSource:v7 messageId:v10];

    self = [(SGDuplicateKey *)self initWithEntityKey:v11 entityType:5 parentKey:0];
    v12 = self;
  }
  else
  {
    if ([v6 count])
    {
      v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "Email Searchable Item is malformed - no account identifier", v15, 2u);
      }
    }
    v12 = 0;
  }

  return v12;
}

- (SGDuplicateKey)initWithSerializedEntityKey:(id)a3 entityType:(int64_t)a4 serializedParentKey:(id)a5
{
  id v8 = a3;
  if (a5)
  {
    id v9 = a5;
    a5 = [[SGDuplicateKey alloc] initWithSerialized:v9];
  }
  long long v10 = [[SGRawKey alloc] initWithSerialized:v8];
  uint64_t v11 = [(SGDuplicateKey *)self initWithEntityKey:v10 entityType:a4 parentKey:a5];

  return v11;
}

- (SGDuplicateKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 247, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  id v6 = SGDelimitedStringsDeserialize();
  if ([v6 count] == 3)
  {
    id v7 = [v6 objectAtIndexedSubscript:1];
    id v8 = [v6 objectAtIndexedSubscript:0];
    uint64_t v9 = [(SGRawKey *)v8 integerValue];
    long long v10 = [v6 objectAtIndexedSubscript:2];
    self = [(SGDuplicateKey *)self initWithSerializedEntityKey:v7 entityType:v9 serializedParentKey:v10];

LABEL_7:
    v13 = self;
    goto LABEL_11;
  }
  if ([v6 count] == 2)
  {
    uint64_t v11 = [SGRawKey alloc];
    id v7 = [v6 objectAtIndexedSubscript:1];
    id v8 = [(SGRawKey *)v11 initWithSerialized:v7];
    v12 = [v6 objectAtIndexedSubscript:0];
    self = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](self, "initWithEntityKey:entityType:parentKey:", v8, [v12 integerValue], 0);

    goto LABEL_7;
  }
  if (+[SGDuplicateKey serializationPassesBasicScrutiny:v5])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 257, @"Invalid parameter not satisfying: %@", @"![SGDuplicateKey serializationPassesBasicScrutiny:serialized]" object file lineNumber description];
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"SGDuplicateKey.m" lineNumber:259 description:@"Invalid serialization"];
  v13 = 0;
LABEL_11:

  return v13;
}

- (SGDuplicateKey)initWithEntityKey:(id)a3 entityType:(int64_t)a4 parentKey:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 210, @"Invalid parameter not satisfying: %@", @"entityKey" object file lineNumber description];
  }
  if (([(id)objc_opt_class() isSupportedEntityType:a4] & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = SGEntityTypeDescription();
    [v16 handleFailureInMethod:a2, self, @"SGDuplicateKey.m", 213, @"%@ not supported by %@", v17, objc_opt_class() object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SGDuplicateKey;
  v12 = [(SGDuplicateKey *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityKey, a3);
    v13->_int64_t entityType = a4;
    objc_storeStrong((id *)&v13->_parentKey, a5);
  }

  return v13;
}

+ (BOOL)serializationPassesBasicScrutiny:(id)a3
{
  if (a3)
  {
    uint64_t v4 = SGDelimitedStringsDeserialize();
    uint64_t v5 = [v4 count];
    if (v5 == 2) {
      goto LABEL_5;
    }
    if (v5 != 3)
    {
      LOBYTE(v7) = 0;
      goto LABEL_8;
    }
    id v6 = [v4 objectAtIndexedSubscript:2];
    int v7 = [a1 serializationPassesBasicScrutiny:v6];

    if (v7) {
LABEL_5:
    }
      LOBYTE(v7) = 1;
LABEL_8:

    return v7;
  }
  LOBYTE(v7) = 0;
  return v7;
}

+ (id)duplicateKeyForWebPageFromSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [SGWebPageKey alloc];
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  int v7 = [(SGMessageKey *)v4 initWithSource:v3 uniqueIdentifier:v6];

  id v8 = [[SGDuplicateKey alloc] initWithEntityKey:v7 entityType:18 parentKey:0];
  return v8;
}

+ (id)duplicateKeyForSchemaOrg
{
  v2 = [SGDuplicateKey alloc];
  id v3 = objc_opt_new();
  uint64_t v4 = [(SGDuplicateKey *)v2 initWithEntityKey:v3 entityType:17 parentKey:0];

  return v4;
}

+ (id)duplicateKeyForSearchableItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SGDuplicateKey alloc] initWithSearchableItem:v3];

  return v4;
}

+ (id)duplicateKeyForWalletOrderIdentifier:(id)a3 parentKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [SGDuplicateKey alloc];
  id v8 = [[SGWalletOrderKey alloc] initWithIdentifier:v6];

  uint64_t v9 = [(SGDuplicateKey *)v7 initWithEntityKey:v8 entityType:25 parentKey:v5];
  return v9;
}

+ (id)duplicateKeyForNaturalLanguageEventWithStartDate:(id)a3 endDate:(id)a4 title:(id)a5 participants:(id)a6 parentKey:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v32 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1CB79B230]();
  [v11 timeIntervalSinceReferenceDate];
  double v17 = v16;
  objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
  v33[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v20 = [v13 sortedArrayUsingDescriptors:v19];
  v21 = &stru_1F24EEF20;
  v22 = objc_msgSend(v20, "_pas_componentsJoinedByString:", &stru_1F24EEF20);

  if (v12)
  {
    v21 = +[SGSimpleMailMessage subjectByCleaningPrefixesInSubject:v12];
  }
  v23 = [(__CFString *)v21 stringByAppendingString:v22];
  v24 = SGSha256BytesForString(v23, 0);
  v25 = [v24 base64EncodedStringWithOptions:0];
  v26 = [v25 substringToIndex:10];

  v27 = (void *)[[NSString alloc] initWithFormat:@"%li/%@", (uint64_t)(round(v17 / 1209600.0) * 1209600.0), v26];
  v28 = [SGDuplicateKey alloc];
  v29 = [[SGPseudoEventKey alloc] initWithGloballyUniqueId:v27];
  v30 = [(SGDuplicateKey *)v28 initWithEntityKey:v29 entityType:2 parentKey:v14];

  return v30;
}

+ (id)duplicateKeyForWalletPassIdentifier:(id)a3 parentKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [SGDuplicateKey alloc];
  id v8 = [[SGWalletPassKey alloc] initWithIdentifier:v6];

  uint64_t v9 = [(SGDuplicateKey *)v7 initWithEntityKey:v8 entityType:26 parentKey:v5];
  return v9;
}

+ (id)duplicateKeyForDeliveryWithProviderString:(id)a3 trackingNumber:(id)a4 parentKey:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [SGDuplicateKey alloc];
  id v11 = [SGDeliveryKey alloc];
  uint64_t v12 = [(id)objc_opt_class() providerForString:v9];

  id v13 = [(SGDeliveryKey *)v11 initWithProvider:v12 trackingNumber:v8];
  id v14 = [(SGDuplicateKey *)v10 initWithEntityKey:v13 entityType:24 parentKey:v7];

  return v14;
}

+ (id)duplicateKeyForPseudoReminderWithGroupId:(id)a3 withCreationTime:(SGUnixTimestamp_)a4 parentKey:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[[v7 alloc] initWithTimeIntervalSince1970:a4.secondsFromUnixEpoch];
  id v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C328]];
  uint64_t v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v11 setLocale:v12];

  id v13 = [v11 components:8196 fromDate:v10];
  id v14 = (void *)[[NSString alloc] initWithFormat:@"%@_%ld_%ld", v9, objc_msgSend(v13, "weekOfYear"), objc_msgSend(v13, "year")];

  v15 = [SGDuplicateKey alloc];
  double v16 = [[SGPseudoReminderKey alloc] initWithGroupId:v14];
  double v17 = [(SGDuplicateKey *)v15 initWithEntityKey:v16 entityType:22 parentKey:v8];

  return v17;
}

+ (id)duplicateKeyForPseudoEventWithGroupId:(id)a3 parentKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SGDuplicateKey alloc];
  id v8 = [[SGPseudoEventKey alloc] initWithGloballyUniqueId:v6];

  id v9 = [(SGDuplicateKey *)v7 initWithEntityKey:v8 entityType:2 parentKey:v5];
  return v9;
}

+ (id)duplicateKeyForCuratedEventWithExternalID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [SGDuplicateKey alloc];
  id v5 = [[SGCuratedEventKey alloc] initWithExternalId:v3];

  id v6 = [(SGDuplicateKey *)v4 initWithEntityKey:v5 entityType:1 parentKey:0];
  return v6;
}

+ (id)duplicateKeyForPseudoContactWithIdentity:(id)a3 parentKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGPseudoContactKey alloc] initWithIdentityKey:v6];

  id v8 = [[SGDuplicateKey alloc] initWithEntityKey:v7 entityType:4 parentKey:v5];
  return v8;
}

+ (id)duplicateKeyForInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SGDuplicateKey.m", 84, @"Invalid parameter not satisfying: %@", @"interactionIdentifier" object file lineNumber description];
  }
  if (![v8 length])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGDuplicateKey.m", 85, @"Invalid parameter not satisfying: %@", @"bundleIdentifier.length > 0" object file lineNumber description];
  }
  id v9 = [[SGInteractionKey alloc] initWithSource:v8 uniqueIdentifier:v7];
  id v10 = [[SGDuplicateKey alloc] initWithEntityKey:v9 entityType:16 parentKey:0];

  return v10;
}

+ (id)duplicateKeyForInteraction:(id)a3 fromBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SGDuplicateKey.m", 77, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];
  }
  if (![v8 length])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SGDuplicateKey.m", 78, @"Invalid parameter not satisfying: %@", @"bundleIdentifier.length > 0" object file lineNumber description];
  }
  id v9 = [v7 identifier];
  id v10 = +[SGDuplicateKey duplicateKeyForInteractionIdentifier:v9 fromBundleIdentifier:v8];

  return v10;
}

+ (id)duplicateKeyForInteractionWithBundleId:(id)a3 personHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGInteractionKey alloc] initWithBundleId:v6 personHandle:v5];

  id v8 = [[SGDuplicateKey alloc] initWithEntityKey:v7 entityType:16 parentKey:0];
  return v8;
}

+ (id)duplicateKeyForTextMessageWithSource:(id)a3 uniqueIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(SGMessageKey *)[SGTextMessageKey alloc] initWithSource:v6 uniqueIdentifier:v5];

  id v8 = [[SGDuplicateKey alloc] initWithEntityKey:v7 entityType:13 parentKey:0];
  return v8;
}

+ (id)duplicateKeyForEmailWithSource:(id)a3 messageId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGEmailKey alloc] initWithSource:v6 messageId:v5];

  id v8 = [[SGDuplicateKey alloc] initWithEntityKey:v7 entityType:5 parentKey:0];
  return v8;
}

+ (id)duplicateKeyForMessage:(id)a3 fromSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = [v7 uniqueIdentifier];

  if (isKindOfClass) {
    [a1 duplicateKeyForTextMessageWithSource:v6 uniqueIdentifier:v9];
  }
  else {
  id v10 = [a1 duplicateKeyForEmailWithSource:v6 messageId:v9];
  }

  return v10;
}

@end