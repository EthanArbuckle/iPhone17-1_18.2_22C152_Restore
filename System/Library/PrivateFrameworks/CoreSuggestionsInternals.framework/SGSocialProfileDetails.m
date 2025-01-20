@interface SGSocialProfileDetails
- (NSArray)uniqueIdentifiers;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)preferredUniqueIdentifier;
- (NSString)service;
- (NSString)teamIdentifier;
- (NSString)userIdentifier;
- (NSString)username;
- (SGSocialProfileDetails)initWithCNSocialProfile:(id)a3;
- (SGSocialProfileDetails)initWithSerialized:(id)a3;
- (SGSocialProfileDetails)initWithSocialProfile:(id)a3;
- (SGSocialProfileDetails)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8;
- (id)serialize;
@end

@implementation SGSocialProfileDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (NSString)preferredUniqueIdentifier
{
  return self->_preferredUniqueIdentifier;
}

- (NSArray)uniqueIdentifiers
{
  return self->_uniqueIdentifiers;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)username
{
  return self->_username;
}

- (id)serialize
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&self->_username;
  bundleIdentifier = self->_bundleIdentifier;
  long long v7 = *(_OWORD *)&self->_displayName;
  teamIdentifier = self->_teamIdentifier;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:6];
  v3 = SGDelimitedStringsSerializeArray();

  return v3;
}

- (SGSocialProfileDetails)initWithSerialized:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = SGDelimitedStringsDeserialize();
  if ([v5 count] == 6)
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    long long v7 = [v5 objectAtIndexedSubscript:1];
    v8 = [v5 objectAtIndexedSubscript:2];
    uint64_t v9 = [v5 objectAtIndexedSubscript:3];
    v10 = [v5 objectAtIndexedSubscript:4];
    v11 = [v5 objectAtIndexedSubscript:5];
    self = [(SGSocialProfileDetails *)self initWithUsername:v6 userIdentifier:v7 bundleIdentifier:v8 displayName:v9 service:v10 teamIdentifier:v11];

    v12 = self;
  }
  else
  {
    v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "Failed to decode socialProfileData: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (SGSocialProfileDetails)initWithCNSocialProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 username];
  v26 = (void *)v4;
  if (v4) {
    long long v5 = (__CFString *)v4;
  }
  else {
    long long v5 = &stru_1F24EEF20;
  }
  v23 = v5;
  uint64_t v6 = [v3 userIdentifier];
  long long v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F24EEF20;
  }
  v22 = v8;
  v25 = [v3 bundleIdentifiers];
  uint64_t v9 = [v25 firstObject];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1F24EEF20;
  }
  uint64_t v12 = [v3 displayname];
  v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_1F24EEF20;
  }
  uint64_t v15 = [v3 service];
  id v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  else {
    uint64_t v17 = &stru_1F24EEF20;
  }
  v18 = [v3 teamIdentifier];

  if (v18) {
    v19 = v18;
  }
  else {
    v19 = &stru_1F24EEF20;
  }
  v20 = [(SGSocialProfileDetails *)self initWithUsername:v23 userIdentifier:v22 bundleIdentifier:v11 displayName:v14 service:v17 teamIdentifier:v19];

  return v20;
}

- (SGSocialProfileDetails)initWithSocialProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 username];
  long long v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F24EEF20;
  }
  v22 = v6;
  uint64_t v7 = [v3 userIdentifier];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_1F24EEF20;
  }
  v21 = v9;
  v10 = [v3 bundleIdentifier];
  uint64_t v11 = [v3 displayName];
  uint64_t v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F24EEF20;
  }
  uint64_t v14 = [v3 service];
  uint64_t v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = &stru_1F24EEF20;
  }
  uint64_t v17 = [v3 teamIdentifier];

  if (v17) {
    v18 = v17;
  }
  else {
    v18 = &stru_1F24EEF20;
  }
  v19 = [(SGSocialProfileDetails *)self initWithUsername:v22 userIdentifier:v21 bundleIdentifier:v10 displayName:v13 service:v16 teamIdentifier:v18];

  return v19;
}

- (SGSocialProfileDetails)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v47.receiver = self;
  v47.super_class = (Class)SGSocialProfileDetails;
  v20 = [(SGSocialProfileDetails *)&v47 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    username = v20->_username;
    v20->_username = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    userIdentifier = v20->_userIdentifier;
    v20->_userIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    service = v20->_service;
    v20->_service = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    teamIdentifier = v20->_teamIdentifier;
    v20->_teamIdentifier = (NSString *)v31;

    unint64_t v33 = 0x1E4F1C000uLL;
    if ([v16 length] && objc_msgSend(v15, "length"))
    {
      v34 = v20->_bundleIdentifier;
      v51[0] = v20->_userIdentifier;
      v51[1] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
      v36 = SGDelimitedStringsSerializeArray();
    }
    else
    {
      v36 = 0;
    }
    if ([v16 length] && objc_msgSend(v14, "length"))
    {
      v37 = v20->_bundleIdentifier;
      v50[0] = v20->_username;
      v50[1] = v37;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      v39 = SGDelimitedStringsSerializeArray();

      unint64_t v33 = 0x1E4F1C000;
    }
    else
    {
      v39 = [(SGSocialProfileDetails *)v20 serialize];
    }
    if (v36) {
      v40 = v36;
    }
    else {
      v40 = v39;
    }
    objc_storeStrong((id *)&v20->_preferredUniqueIdentifier, v40);
    if (v36)
    {
      v49[0] = v36;
      v49[1] = v39;
      v41 = *(void **)(v33 + 2424);
      v42 = (void **)v49;
      uint64_t v43 = 2;
    }
    else
    {
      v48 = v39;
      v41 = *(void **)(v33 + 2424);
      v42 = &v48;
      uint64_t v43 = 1;
    }
    uint64_t v44 = [v41 arrayWithObjects:v42 count:v43];
    uniqueIdentifiers = v20->_uniqueIdentifiers;
    v20->_uniqueIdentifiers = (NSArray *)v44;
  }
  return v20;
}

@end