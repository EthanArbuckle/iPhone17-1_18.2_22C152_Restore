@interface ATXContactModeEntity
+ (BOOL)supportsSecureCoding;
+ (id)cnContactIdsOfEmergencyContacts;
+ (id)cnContactIdsOfFavoriteContactsWithContactStore:(id)a3;
+ (id)cnContactIdsOfICloudFamilyMembers;
+ (id)vipContactEmailAddresses;
- (ATXContactModeEntity)initWithCoder:(id)a3;
- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5;
- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5 stableContactIdentifier:(id)a6;
- (ATXModeEntityScore)scoreMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVIPContactGivenVIPs:(id)a3 contactStore:(id)a4;
- (NSString)cnContactId;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)rawIdentifier;
- (NSString)stableContactIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)jsonDict;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCnContactId:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setRawIdentifier:(id)a3;
- (void)setScoreMetadata:(id)a3;
- (void)setStableContactIdentifier:(id)a3;
@end

@implementation ATXContactModeEntity

- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5
{
  return [(ATXContactModeEntity *)self initWithDisplayName:a3 rawIdentifier:a4 cnContactId:a5 stableContactIdentifier:0];
}

- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5 stableContactIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v12 && !v13 && !v14)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"ATXContactModeEntity.m", 57, @"Attempted to initialize an ATXContactModeEntity without specifying a contact's rawIdentifier, cnContactId, or stableContactIdentifier. Terminating." object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)ATXContactModeEntity;
  v16 = [(ATXContactModeEntity *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v11 copy];
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    rawIdentifier = v16->_rawIdentifier;
    v16->_rawIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    cnContactId = v16->_cnContactId;
    v16->_cnContactId = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    stableContactIdentifier = v16->_stableContactIdentifier;
    v16->_stableContactIdentifier = (NSString *)v23;
  }
  return v16;
}

- (id)identifier
{
  stableContactIdentifier = self->_stableContactIdentifier;
  if (!stableContactIdentifier)
  {
    stableContactIdentifier = self->_cnContactId;
    if (!stableContactIdentifier) {
      stableContactIdentifier = self->_rawIdentifier;
    }
  }
  v3 = stableContactIdentifier;

  return v3;
}

- (id)jsonDict
{
  v19[5] = *MEMORY[0x1E4F143B8];
  v18[0] = @"displayName";
  uint64_t v3 = [(ATXContactModeEntity *)self displayName];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = (void *)v3;
  v19[0] = v3;
  v18[1] = @"rawIdentifier";
  uint64_t v5 = [(ATXContactModeEntity *)self rawIdentifier];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)v5;
  v19[1] = v5;
  v18[2] = @"cnContactId";
  v7 = [(ATXContactModeEntity *)self cnContactId];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[2] = v8;
  v18[3] = @"stableContactIdentifier";
  v9 = [(ATXContactModeEntity *)self stableContactIdentifier];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[3] = v10;
  v18[4] = @"scoreMetadata";
  id v11 = [(ATXContactModeEntity *)self scoreMetadata];
  id v12 = [v11 jsonDict];
  id v13 = v12;
  if (!v12)
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  if (!v12) {

  }
  if (!v9) {
  if (!v7)
  }

  if (!v6) {
  if (!v4)
  }

  return v14;
}

- (NSString)debugDescription
{
  v2 = [(ATXContactModeEntity *)self jsonDict];
  uint64_t v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(ATXContactModeEntity *)self identifier];
  long long v11 = *(_OWORD *)&self->_displayName;
  cnContactId = self->_cnContactId;
  stableContactIdentifier = self->_stableContactIdentifier;
  v7 = [(ATXContactModeEntity *)self scoreMetadata];
  [v7 score];
  v9 = (void *)[v3 initWithFormat:@"entityIdentifier: %@, displayName: %@, rawIdentifier: %@, cnContactId: %@, stableContactIdentifer: %@, score: %.3f", v4, v11, cnContactId, stableContactIdentifier, v8];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXContactModeEntity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(ATXContactModeEntity *)self identifier];
      v7 = [(ATXContactModeEntity *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ATXContactModeEntity *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)cnContactIdsOfFavoriteContactsWithContactStore:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1B9E8]), "initWithContactStore:", v3, 0);
  v6 = [v5 entries];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1AD0D3C30]();
        id v13 = [v11 contactProperty];
        id v14 = [v13 contact];
        v15 = [v14 identifier];
        [v4 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)vipContactEmailAddresses
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__17;
  v32 = __Block_byref_object_dispose__17;
  id v33 = (id)objc_opt_new();
  id v3 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke;
  v25[3] = &unk_1E5D096D8;
  objc_super v27 = &v28;
  v16 = v2;
  v26 = v16;
  [v3 getAllVIPsWithCompletion:v25];

  [MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:0 onAcquire:&__block_literal_global_74 onTimeout:2.0];
  v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)v29[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1AD0D3C30]();
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v11 = [v9 emailAddresses];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v11);
              }
              [v4 addObject:*(void *)(*((void *)&v17 + 1) + 8 * j)];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v34 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v28, 8);

  return v4;
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      goto LABEL_7;
    }
    uint64_t v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "EMVIPManager getAllVIPsWithCompletion returned nil VIP set", v9, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_356()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_356_cold_1(v0);
  }
}

+ (id)cnContactIdsOfEmergencyContacts
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F2B190]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  v4 = (void *)[v2 initWithHealthStore:v3];

  id v5 = objc_opt_new();
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__17;
  v29 = __Block_byref_object_dispose__17;
  id v30 = (id)objc_opt_new();
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke;
  v22[3] = &unk_1E5D06F68;
  long long v24 = &v25;
  id v7 = v6;
  long long v23 = v7;
  [v4 fetchMedicalIDEmergencyContactsWithCompletion:v22];
  uint64_t v8 = v7;
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = (id)v26[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "nameContactIdentifier", (void)v18);

        if (v15)
        {
          v16 = [v14 nameContactIdentifier];
          [v5 addObject:v16];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);

  return v5;
}

void __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      goto LABEL_7;
    }
    uint64_t v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v9 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion returned nil emergencyContacts array", v9, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)cnContactIdsOfICloudFamilyMembers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  id v3 = [v2 fetchFamilyCircle];
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v3, "members", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v10 isMe] & 1) == 0)
        {
          uint64_t v11 = [v10 contact];
          uint64_t v12 = [v11 identifier];

          if (v12)
          {
            uint64_t v13 = [v10 contact];
            id v14 = [v13 identifier];
            [v4 addObject:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isVIPContactGivenVIPs:(id)a3 contactStore:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  cnContactId = self->_cnContactId;
  if (cnContactId)
  {
    v26[0] = *MEMORY[0x1E4F1ADC8];
    dispatch_time_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v24 = 0;
    id v10 = [v7 unifiedContactWithIdentifier:cnContactId keysToFetch:v9 error:&v24];
    id v11 = v24;

    uint64_t v12 = [v10 emailAddresses];

    if (v12)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v13 = objc_msgSend(v10, "emailAddresses", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) value];
            char v18 = [v6 containsObject:v17];

            if (v18)
            {
              LOBYTE(v14) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXContactModeEntity *)self displayName];
  [v4 encodeObject:v5 forKey:@"codingKeyForDisplayName"];

  id v6 = [(ATXContactModeEntity *)self rawIdentifier];
  [v4 encodeObject:v6 forKey:@"codingKeyForRawIdentifier"];

  id v7 = [(ATXContactModeEntity *)self cnContactId];
  [v4 encodeObject:v7 forKey:@"codingKeyForCnContactId"];

  uint64_t v8 = [(ATXContactModeEntity *)self stableContactIdentifier];
  [v4 encodeObject:v8 forKey:@"codingKeyForStableContactIdentifier"];

  id v9 = [(ATXContactModeEntity *)self scoreMetadata];
  [v4 encodeObject:v9 forKey:@"codingKeyForScoreMetadata"];
}

- (ATXContactModeEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForDisplayName" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.contactModeEntity" errorCode:-1 logHandle:v7];

  id v9 = [v4 error];

  if (!v9)
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = __atxlog_handle_notification_management();
    uint64_t v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForRawIdentifier" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.contactModeEntity" errorCode:-1 logHandle:v13];

    uint64_t v15 = [v4 error];

    if (v15)
    {
      id v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    long long v16 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v17 = objc_opt_class();
    char v18 = __atxlog_handle_notification_management();
    long long v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForCnContactId" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.contactModeEntity" errorCode:-1 logHandle:v18];

    long long v20 = [v4 error];

    if (v20)
    {
      id v10 = 0;
LABEL_19:

      goto LABEL_20;
    }
    long long v21 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v22 = objc_opt_class();
    long long v23 = __atxlog_handle_notification_management();
    id v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForStableContactIdentifier" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.contactModeEntity" errorCode:-1 logHandle:v23];

    uint64_t v25 = [v4 error];

    if (v25)
    {
      id v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v26 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = __atxlog_handle_notification_management();
    v29 = [v26 robustDecodeObjectOfClass:v27 forKey:@"codingKeyForScoreMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.contactModeEntity" errorCode:-1 logHandle:v28];

    id v30 = [v4 error];

    if (!v30)
    {
      if (v14 || v19 || v24)
      {
        self = [(ATXContactModeEntity *)self initWithDisplayName:v8 rawIdentifier:v14 cnContactId:v19 stableContactIdentifier:v24];
        [(ATXContactModeEntity *)self setScoreMetadata:v29];
        id v10 = self;
        goto LABEL_17;
      }
      v31 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ATXContactModeEntity initWithCoder:](v31);
      }
    }
    id v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ATXContactModeEntity alloc];
  id v5 = [(ATXContactModeEntity *)self displayName];
  uint64_t v6 = [(ATXContactModeEntity *)self rawIdentifier];
  id v7 = [(ATXContactModeEntity *)self cnContactId];
  uint64_t v8 = [(ATXContactModeEntity *)self stableContactIdentifier];
  id v9 = [(ATXContactModeEntity *)v4 initWithDisplayName:v5 rawIdentifier:v6 cnContactId:v7 stableContactIdentifier:v8];

  return v9;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)rawIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRawIdentifier:(id)a3
{
}

- (NSString)cnContactId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCnContactId:(id)a3
{
}

- (NSString)stableContactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStableContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactId, 0);
  objc_storeStrong((id *)&self->_rawIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "EMVIPManager getAllVIPsWithCompletion returned error: %@", (uint8_t *)&v2, 0xCu);
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_356_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "EMVIPManager getAllVIPsWithCompletion timed out", v1, 2u);
}

void __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Unarchived ATXContactModeEntity with no rawIdentifier, cnContactId or stableContactIdentifier", v1, 2u);
}

@end