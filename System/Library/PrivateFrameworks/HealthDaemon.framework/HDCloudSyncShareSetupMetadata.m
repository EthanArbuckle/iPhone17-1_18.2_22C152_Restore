@interface HDCloudSyncShareSetupMetadata
+ (BOOL)supportsSecureCoding;
+ (HDCloudSyncShareSetupMetadata)cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CKShareParticipant)shareParticipant;
- (HDCloudSyncShareSetupMetadata)init;
- (HDCloudSyncShareSetupMetadata)initWithCoder:(id)a3;
- (HDCloudSyncShareSetupMetadata)initWithSyncCircleIdentifier:(id)a3 profileIdentifier:(id)a4 shareURLs:(id)a5 ownerCloudKitEmailAddress:(id)a6 shareParticipant:(id)a7 invitationTokensByShareURL:(id)a8;
- (HKProfileIdentifier)profileIdentifier;
- (NSArray)shareURLs;
- (NSDictionary)invitationTokensByShareURL;
- (NSString)ownerCloudKitEmailAddress;
- (NSString)syncCircleIdentifier;
- (id)codableSharingSetupMetadataWithError:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDCloudSyncShareSetupMetadata

- (HDCloudSyncShareSetupMetadata)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncShareSetupMetadata)initWithSyncCircleIdentifier:(id)a3 profileIdentifier:(id)a4 shareURLs:(id)a5 ownerCloudKitEmailAddress:(id)a6 shareParticipant:(id)a7 invitationTokensByShareURL:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"HDCloudSyncShareSetupMetadata.m", 34, @"Invalid parameter not satisfying: %@", @"ownerCloudKitEmailAddress" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"HDCloudSyncShareSetupMetadata.m", 35, @"Invalid parameter not satisfying: %@", @"shareParticipant" object file lineNumber description];

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)HDCloudSyncShareSetupMetadata;
  v21 = [(HDCloudSyncShareSetupMetadata *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    syncCircleIdentifier = v21->_syncCircleIdentifier;
    v21->_syncCircleIdentifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    profileIdentifier = v21->_profileIdentifier;
    v21->_profileIdentifier = (HKProfileIdentifier *)v24;

    uint64_t v26 = [v17 copy];
    shareURLs = v21->_shareURLs;
    v21->_shareURLs = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    ownerCloudKitEmailAddress = v21->_ownerCloudKitEmailAddress;
    v21->_ownerCloudKitEmailAddress = (NSString *)v28;

    objc_storeStrong((id *)&v21->_shareParticipant, a7);
    uint64_t v30 = [v20 copy];
    invitationTokensByShareURL = v21->_invitationTokensByShareURL;
    v21->_invitationTokensByShareURL = (NSDictionary *)v30;
  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  syncCircleIdentifier = self->_syncCircleIdentifier;
  v6 = (NSString *)v4[1];
  if (syncCircleIdentifier != v6 && (!v6 || !-[NSString isEqualToString:](syncCircleIdentifier, "isEqualToString:"))) {
    goto LABEL_18;
  }
  profileIdentifier = self->_profileIdentifier;
  v8 = (HKProfileIdentifier *)v4[2];
  if (profileIdentifier != v8 && (!v8 || !-[HKProfileIdentifier isEqual:](profileIdentifier, "isEqual:"))) {
    goto LABEL_18;
  }
  if (((shareURLs = self->_shareURLs, v10 = (NSArray *)v4[3], shareURLs == v10)
     || v10 && -[NSArray isEqualToArray:](shareURLs, "isEqualToArray:"))
    && ((ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress,
         v12 = (NSString *)v4[5],
         ownerCloudKitEmailAddress == v12)
     || v12 && -[NSString isEqualToString:](ownerCloudKitEmailAddress, "isEqualToString:"))
    && ((shareParticipant = self->_shareParticipant, v14 = (CKShareParticipant *)v4[6], shareParticipant == v14)
     || v14 && -[CKShareParticipant isEqual:](shareParticipant, "isEqual:")))
  {
    BOOL v15 = [(NSDictionary *)self->_invitationTokensByShareURL isEqualToDictionary:v4[4]];
  }
  else
  {
LABEL_18:
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_syncCircleIdentifier hash];
  uint64_t v4 = [(HKProfileIdentifier *)self->_profileIdentifier hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_shareURLs hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_ownerCloudKitEmailAddress hash];
  uint64_t v7 = [(CKShareParticipant *)self->_shareParticipant hash];
  return v6 ^ v7 ^ [(NSDictionary *)self->_invitationTokensByShareURL hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  syncCircleIdentifier = self->_syncCircleIdentifier;
  id v5 = a3;
  [v5 encodeObject:syncCircleIdentifier forKey:@"sync_circle"];
  [v5 encodeObject:self->_profileIdentifier forKey:@"profile_id"];
  [v5 encodeObject:self->_ownerCloudKitEmailAddress forKey:@"email"];
  [v5 encodeObject:self->_shareParticipant forKey:@"share_participant"];
  [v5 encodeObject:self->_shareURLs forKey:@"share_urls"];
  [v5 encodeObject:self->_invitationTokensByShareURL forKey:@"tokens"];
}

- (HDCloudSyncShareSetupMetadata)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sync_circle"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"profile_id"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
  NSUInteger v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"share_participant"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v3 decodeObjectOfClasses:v9 forKey:@"share_urls"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v12 = (void *)v4;
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v14 = [v11 setWithArray:v13];

  BOOL v15 = [v3 decodeObjectOfClasses:v14 forKey:@"tokens"];

  id v16 = 0;
  if (v4)
  {
    id v18 = (void *)v20;
    id v17 = self;
    if (v20 && v5 && v6 && v10 && v15)
    {
      id v17 = [(HDCloudSyncShareSetupMetadata *)self initWithSyncCircleIdentifier:v12 profileIdentifier:v20 shareURLs:v10 ownerCloudKitEmailAddress:v5 shareParticipant:v6 invitationTokensByShareURL:v15];
      id v16 = v17;
    }
  }
  else
  {
    id v18 = (void *)v20;
    id v17 = self;
  }

  return v16;
}

+ (HDCloudSyncShareSetupMetadata)cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSUInteger v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = objc_opt_class();
  v8 = [v5 sourceProfileIdentifier];
  v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:a4];

  if (!v9)
  {
    uint64_t v30 = 0;
    goto LABEL_25;
  }
  v38 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = v5;
  id obj = [v5 invitationTokens];
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        BOOL v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x1E4F1CB10]);
        id v17 = [v15 shareURL];
        id v18 = (void *)[v16 initWithString:v17];

        [v10 addObject:v18];
        id v19 = [v15 token];

        if (v19)
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F28DC0];
          v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
          uint64_t v22 = [v15 token];
          v23 = [v20 _strictlyUnarchivedObjectOfClasses:v21 fromData:v22 error:v38];

          if (!v23)
          {
            uint64_t v30 = 0;
            id v5 = v36;
            goto LABEL_24;
          }
          [v39 setObject:v23 forKeyedSubscript:v18];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v24 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v25 = objc_opt_class();
  id v5 = v36;
  uint64_t v26 = [v36 shareParticipant];
  id v40 = 0;
  id v18 = [v24 unarchivedObjectOfClass:v25 fromData:v26 error:&v40];
  id obj = v40;

  if (v18)
  {
    v27 = [HDCloudSyncShareSetupMetadata alloc];
    id v28 = [v36 syncCircleIdentifier];
    v29 = [v36 ownerCloudKitEmailAddress];
    uint64_t v30 = [(HDCloudSyncShareSetupMetadata *)v27 initWithSyncCircleIdentifier:v28 profileIdentifier:v9 shareURLs:v10 ownerCloudKitEmailAddress:v29 shareParticipant:v18 invitationTokensByShareURL:v39];

    goto LABEL_23;
  }
  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v34 = v31;
    objc_super v35 = [v36 shareParticipant];
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    __int16 v47 = 2114;
    id v48 = obj;
    _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Failed to unarchive share participant %{public}@: %{public}@", buf, 0x16u);
  }
  id v32 = obj;
  id v28 = v32;
  if (v32)
  {
    if (v38)
    {
      id v28 = v32;
      uint64_t v30 = 0;
      id *v38 = v28;
      goto LABEL_23;
    }
    _HKLogDroppedError();
  }
  uint64_t v30 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

  return v30;
}

- (id)codableSharingSetupMetadataWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_alloc_init(HDCodableSharingSetupMetadata);
  id v5 = [(HDCloudSyncShareSetupMetadata *)self syncCircleIdentifier];
  uint64_t v24 = v4;
  [(HDCodableSharingSetupMetadata *)v4 setSyncCircleIdentifier:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [(HDCloudSyncShareSetupMetadata *)self shareURLs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = objc_alloc_init(HDCodableSharingSetupInvitationToken);
        v14 = [v12 absoluteString];
        [(HDCodableSharingSetupInvitationToken *)v13 setShareURL:v14];

        BOOL v15 = [(NSDictionary *)self->_invitationTokensByShareURL objectForKeyedSubscript:v12];
        if (v15)
        {
          id v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:a3];
          [(HDCodableSharingSetupInvitationToken *)v13 setToken:v16];

          id v17 = [(HDCodableSharingSetupInvitationToken *)v13 token];

          if (!v17)
          {

            uint64_t v22 = 0;
            id v18 = v24;
            goto LABEL_15;
          }
        }
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v18 = v24;
  [(HDCodableSharingSetupMetadata *)v24 setInvitationTokens:v6];
  [(HDCodableSharingSetupMetadata *)v24 setOwnerCloudKitEmailAddress:self->_ownerCloudKitEmailAddress];
  id v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_shareParticipant requiringSecureCoding:1 error:a3];
  [(HDCodableSharingSetupMetadata *)v24 setShareParticipant:v19];

  uint64_t v20 = [(HDCodableSharingSetupMetadata *)v24 shareParticipant];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_profileIdentifier requiringSecureCoding:1 error:a3];
    [(HDCodableSharingSetupMetadata *)v24 setSourceProfileIdentifier:v21];

    uint64_t v22 = [(HDCodableSharingSetupMetadata *)v24 sourceProfileIdentifier];

    if (v22) {
      uint64_t v22 = v24;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HDCloudSyncShareSetupMetadata *)self syncCircleIdentifier];
  uint64_t v7 = [(HDCloudSyncShareSetupMetadata *)self profileIdentifier];
  uint64_t v8 = [(HDCloudSyncShareSetupMetadata *)self shareURLs];
  uint64_t v9 = [(HDCloudSyncShareSetupMetadata *)self ownerCloudKitEmailAddress];
  uint64_t v10 = [(HDCloudSyncShareSetupMetadata *)self shareParticipant];
  uint64_t v11 = [(HDCloudSyncShareSetupMetadata *)self invitationTokensByShareURL];
  uint64_t v12 = [v3 stringWithFormat:@"<%@ %p: \n%@, \n%@, \n%@, \n%@, \n%@, \n%@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURL
{
  return self->_invitationTokensByShareURL;
}

- (NSString)ownerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress;
}

- (CKShareParticipant)shareParticipant
{
  return self->_shareParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipant, 0);
  objc_storeStrong((id *)&self->_ownerCloudKitEmailAddress, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);

  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
}

@end