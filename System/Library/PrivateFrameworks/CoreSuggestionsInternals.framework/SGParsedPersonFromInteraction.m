@interface SGParsedPersonFromInteraction
+ (id)_peopleFromInteraction:(id)a3;
+ (id)intentClassWhitelist;
+ (id)parseInteraction:(id)a3 bundleId:(id)a4;
- (NSDate)date;
- (NSPersonNameComponents)nameComponents;
- (NSString)bundleId;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)email;
- (NSString)groupId;
- (NSString)interactionIdentifier;
- (NSString)phoneNumber;
- (SGParsedPersonFromInteraction)initWithPerson:(id)a3 bundleId:(id)a4 interactionIdentifier:(id)a5 groupId:(id)a6 date:(id)a7;
- (SGSocialProfileDetails)socialProfile;
- (id)pipelineEntity;
- (void)_harvestEmail:(id)a3;
- (void)_harvestPerson:(id)a3 handle:(id)a4 suggestionType:(int64_t)a5 bundleId:(id)a6;
- (void)_harvestPhoneNumber:(id)a3;
- (void)_harvestSocialProfile:(id)a3 handle:(id)a4 bundleId:(id)a5;
- (void)grabNameIfNeededFromContactStore:(id)a3;
@end

@implementation SGParsedPersonFromInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_socialProfile, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (SGSocialProfileDetails)socialProfile
{
  return self->_socialProfile;
}

- (NSString)email
{
  return self->_email;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (id)pipelineEntity
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  displayName = self->_displayName;
  if (displayName && !heuristicIdentifyHandle(displayName)) {
    v4 = self->_displayName;
  }
  else {
    v4 = (NSString *)&stru_1F24EEF20;
  }
  v5 = v4;
  v6 = SGNormalizePhoneNumber();
  socialProfile = self->_socialProfile;
  if (socialProfile)
  {
    v8 = [(SGSocialProfileDetails *)self->_socialProfile serialize];
    v9 = +[SGIdentityKey keyForSocialProfile:v8];

    v10 = [(SGSocialProfileDetails *)self->_socialProfile userIdentifier];
    uint64_t v11 = [v10 length];
    v12 = self->_socialProfile;
    if (v11) {
      [(SGSocialProfileDetails *)v12 userIdentifier];
    }
    else {
    v13 = [(SGSocialProfileDetails *)v12 username];
    }
    char v14 = 1;
    goto LABEL_12;
  }
  if (self->_phoneNumber)
  {
    v9 = +[SGIdentityKey keyForNormalizedPhone:v6];
    v10 = [(INPersonHandle *)self->_handle value];
    v13 = SGNormalizePhoneNumber();
    char v14 = 0;
LABEL_12:
    char v15 = 1;
    goto LABEL_13;
  }
  if (!self->_email)
  {
    v13 = 0;
    v9 = 0;
    goto LABEL_47;
  }
  v9 = +[SGIdentityKey keyForEmail:](SGIdentityKey, "keyForEmail:");
  v10 = [(INPersonHandle *)self->_handle value];
  v13 = SGNormalizeEmailAddress();
  char v15 = 0;
  char v14 = 1;
LABEL_13:

  if (v9 && [v13 length])
  {
    char v49 = v14;
    char v50 = v15;
    v54 = v6;
    v16 = [[SGPipelineEntity alloc] initWithIntentPersonAtDate:self->_date bundleId:self->_bundleId handle:v13 displayName:v5];
    v55 = v9;
    v17 = [[SGPseudoContactKey alloc] initWithIdentityKey:v9];
    v18 = [SGDuplicateKey alloc];
    v19 = [(SGEntity *)v16 duplicateKey];
    v52 = v17;
    uint64_t v20 = [(SGDuplicateKey *)v18 initWithEntityKey:v17 entityType:4 parentKey:v19];

    v51 = (void *)v20;
    v53 = v5;
    v21 = [[SGPipelineEnrichment alloc] initWithDuplicateKey:v20 title:v5 parent:v16];
    if (socialProfile)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v22 = [(SGSocialProfileDetails *)self->_socialProfile uniqueIdentifiers];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v61 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            v28 = (void *)MEMORY[0x1E4F5D9F0];
            SGNormalizeSocialProfile(v27);
            objc_claimAutoreleasedReturnValue();
            v29 = [v28 contactDetail:v27];
            [(SGEntity *)v21 addTag:v29];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v24);
      }
    }
    [(SGPipelineEntity *)v16 addEnrichment:v21];
    char v30 = v49 ^ 1;
    if (!self->_phoneNumber) {
      char v30 = 1;
    }
    if ((v30 & 1) == 0)
    {
      v31 = [[SGLabeledValue alloc] initWithLabel:0 value:v54];
      v32 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:16 modelVersion:0 confidence:0];
      -[SGPipelineEntity addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:](v16, "addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:", v31, v55, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v32);
    }
    char v33 = v50 ^ 1;
    if (!self->_email) {
      char v33 = 1;
    }
    if ((v33 & 1) == 0)
    {
      v34 = [[SGLabeledValue alloc] initWithLabel:0 value:self->_email];
      v35 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:16 modelVersion:0 confidence:0];
      -[SGPipelineEntity addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](v16, "addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v34, v55, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v35);
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v36 = [(SGPipelineEntity *)v16 enrichments];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          v42 = [MEMORY[0x1E4F5D9F0] fromInteraction];
          [v41 addTag:v42];

          v43 = [MEMORY[0x1E4F5D9F0] interactionId:self->_interactionIdentifier];
          [v41 addTag:v43];

          v44 = [MEMORY[0x1E4F5D9F0] interactionBundleId:self->_bundleId];
          [v41 addTag:v44];

          if (self->_contactIdentifier)
          {
            v45 = objc_msgSend(MEMORY[0x1E4F5D9F0], "interactionContactIdentifier:");
            [v41 addTag:v45];
          }
          if (self->_groupId)
          {
            v46 = objc_msgSend(MEMORY[0x1E4F5D9F0], "interactionGroupId:");
            [v41 addTag:v46];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v38);
    }

    v5 = v53;
    v6 = v54;
    v9 = v55;
    p_super = &v52->super;
    goto LABEL_50;
  }
LABEL_47:
  p_super = sgLogHandle();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v67 = v9;
    __int16 v68 = 2112;
    v69 = v13;
    _os_log_error_impl(&dword_1CA650000, p_super, OS_LOG_TYPE_ERROR, "Interaction Person has no identity/handle: %@ / %@", buf, 0x16u);
  }
  v16 = 0;
LABEL_50:

  return v16;
}

- (void)grabNameIfNeededFromContactStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_displayName && self->_contactIdentifier)
  {
    if (grabNameIfNeededFromContactStore___pasOnceToken3 != -1) {
      dispatch_once(&grabNameIfNeededFromContactStore___pasOnceToken3, &__block_literal_global_436);
    }
    id v5 = (id)grabNameIfNeededFromContactStore___pasExprOnceResult;
    contactIdentifier = self->_contactIdentifier;
    id v13 = 0;
    v7 = +[SGContactsInterface unifiedContactWithIdentifier:contactIdentifier keysToFetch:v5 usingContactStore:v4 error:&v13];
    id v8 = v13;
    v9 = v8;
    if (v7)
    {
      v10 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
      p_super = &self->_displayName->super;
      self->_displayName = v10;
    }
    else
    {
      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
      p_super = sgLogHandle();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_contactIdentifier;
        *(_DWORD *)buf = 138412546;
        char v15 = v12;
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_1CA650000, p_super, OS_LOG_TYPE_ERROR, "Error fetching contact for identifier '%@': %@", buf, 0x16u);
      }
    }

    goto LABEL_11;
  }
LABEL_12:
}

void __66__SGParsedPersonFromInteraction_grabNameIfNeededFromContactStore___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v4[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v3 = (void *)grabNameIfNeededFromContactStore___pasExprOnceResult;
  grabNameIfNeededFromContactStore___pasExprOnceResult = v2;
}

- (void)_harvestSocialProfile:(id)a3 handle:(id)a4 bundleId:(id)a5
{
  if (!self->_socialProfile)
  {
    id v8 = (void *)MEMORY[0x1E4F5DAC8];
    v9 = (__CFString *)a5;
    id v10 = a4;
    id v11 = a3;
    id v32 = [v8 originWithType:5 sourceKey:v9 externalKey:&stru_1F24EEF20 bundleId:v9 fromForwardedMessage:0];
    v31 = [SGSocialProfileDetails alloc];
    v12 = [v10 value];

    if (v12) {
      id v13 = v12;
    }
    else {
      id v13 = &stru_1F24EEF20;
    }
    char v30 = v13;
    uint64_t v14 = [v11 customIdentifier];
    char v15 = (void *)v14;
    if (v14) {
      __int16 v16 = (__CFString *)v14;
    }
    else {
      __int16 v16 = &stru_1F24EEF20;
    }
    if (v9) {
      v17 = v9;
    }
    else {
      v17 = &stru_1F24EEF20;
    }
    v28 = v17;
    v29 = v16;
    uint64_t v18 = [v11 displayName];

    if (v18) {
      v19 = v18;
    }
    else {
      v19 = &stru_1F24EEF20;
    }
    uint64_t v20 = [v32 localizedApplicationName];
    v21 = (void *)v20;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    else {
      v22 = &stru_1F24EEF20;
    }
    uint64_t v23 = [v32 teamId];
    uint64_t v24 = (void *)v23;
    if (v23) {
      uint64_t v25 = (__CFString *)v23;
    }
    else {
      uint64_t v25 = &stru_1F24EEF20;
    }
    v26 = [(SGSocialProfileDetails *)v31 initWithUsername:v30 userIdentifier:v29 bundleIdentifier:v28 displayName:v19 service:v22 teamIdentifier:v25];

    socialProfile = self->_socialProfile;
    self->_socialProfile = v26;
  }
}

- (void)_harvestPhoneNumber:(id)a3
{
  if (!self->_phoneNumber)
  {
    SGDataDetectorsScanForPhone(a3);
    self->_phoneNumber = (NSString *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1F41817F8]();
  }
}

- (void)_harvestEmail:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  id v5 = (__CFString *)v4;
  if (!self->_email
    && (CFStringGetCStringPtr(v4, 0x8000100u) || [(__CFString *)v5 UTF8String]))
  {
    SGParseNamedEmailAddress();
  }
}

void __47__SGParsedPersonFromInteraction__harvestEmail___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (void)_harvestPerson:(id)a3 handle:(id)a4 suggestionType:(int64_t)a5 bundleId:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 value];
  if (![v12 length])
  {

    goto LABEL_15;
  }
  id v13 = [v10 value];
  unint64_t v14 = [v13 length];

  if (v14 > 0x3E8) {
    goto LABEL_15;
  }
  uint64_t v15 = [v10 type];
  if (v15 == 2) {
    goto LABEL_11;
  }
  if (v15 == 1)
  {
LABEL_9:
    uint64_t v18 = [v10 value];
    [(SGParsedPersonFromInteraction *)self _harvestEmail:v18];
LABEL_12:

LABEL_13:
    if ((unint64_t)(a5 - 1) > 1) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v15) {
    goto LABEL_13;
  }
  if ((unint64_t)(a5 - 1) >= 2)
  {
    __int16 v16 = [(INPersonHandle *)self->_handle value];
    int v17 = heuristicIdentifyHandle(v16);

    if (v17 != 2)
    {
      if (v17 != 1) {
        goto LABEL_15;
      }
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v18 = [v10 value];
    [(SGParsedPersonFromInteraction *)self _harvestPhoneNumber:v18];
    goto LABEL_12;
  }
LABEL_14:
  [(SGParsedPersonFromInteraction *)self _harvestSocialProfile:v19 handle:v10 bundleId:v11];
LABEL_15:
}

- (SGParsedPersonFromInteraction)initWithPerson:(id)a3 bundleId:(id)a4 interactionIdentifier:(id)a5 groupId:(id)a6 date:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  obuint64_t j = a6;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_36:
    [MEMORY[0x1E4F28B00] currentHandler];
    v44 = id v50 = a7;
    [v44 handleFailureInMethod:a2, self, @"SGInteractionParser.m", 108, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    a7 = v50;
    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_37;
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v43 = id v49 = a7;
  [v43 handleFailureInMethod:a2, self, @"SGInteractionParser.m", 107, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

  a7 = v49;
  if (!v14) {
    goto LABEL_36;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_37:
  [MEMORY[0x1E4F28B00] currentHandler];
  v45 = id v51 = a7;
  [v45 handleFailureInMethod:a2, self, @"SGInteractionParser.m", 109, @"Invalid parameter not satisfying: %@", @"interactionIdentifier" object file lineNumber description];

  a7 = v51;
LABEL_4:
  v58.receiver = self;
  v58.super_class = (Class)SGParsedPersonFromInteraction;
  uint64_t v18 = [(SGParsedPersonFromInteraction *)&v58 init];
  if (!v18)
  {
LABEL_32:
    uint64_t v24 = v18;
    goto LABEL_33;
  }
  uint64_t v19 = [v13 personHandle];
  handle = v18->_handle;
  v18->_handle = (INPersonHandle *)v19;

  v21 = [(INPersonHandle *)v18->_handle value];
  if (![v21 length])
  {

    goto LABEL_10;
  }
  id v48 = a7;
  id v52 = v17;
  v22 = [(INPersonHandle *)v18->_handle value];
  unint64_t v23 = [v22 length];

  if (v23 <= 0x3E8)
  {
    id v46 = v16;
    id v47 = v15;
    uint64_t v25 = [v13 personHandle];
    -[SGParsedPersonFromInteraction _harvestPerson:handle:suggestionType:bundleId:](v18, "_harvestPerson:handle:suggestionType:bundleId:", v13, v25, [v13 suggestionType], v14);

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v26 = [v13 aliases];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v55;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v26);
          }
          -[SGParsedPersonFromInteraction _harvestPerson:handle:suggestionType:bundleId:](v18, "_harvestPerson:handle:suggestionType:bundleId:", v13, *(void *)(*((void *)&v54 + 1) + 8 * v30++), [v13 suggestionType], v14);
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v28);
    }

    if (!v18->_email && !v18->_phoneNumber && !v18->_socialProfile)
    {
      uint64_t v24 = 0;
      id v16 = v46;
      id v15 = v47;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_interactionIdentifier, a5);
    objc_storeStrong((id *)&v18->_groupId, obj);
    objc_storeStrong((id *)&v18->_date, v48);
    v31 = [v13 displayName];
    id v32 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    uint64_t v33 = [v31 stringByTrimmingCharactersInSet:v32];
    displayName = v18->_displayName;
    v18->_displayName = (NSString *)v33;

    uint64_t v35 = [v13 nameComponents];
    nameComponents = v18->_nameComponents;
    v18->_nameComponents = (NSPersonNameComponents *)v35;

    uint64_t v37 = [v13 contactIdentifier];
    contactIdentifier = v18->_contactIdentifier;
    v18->_contactIdentifier = (NSString *)v37;

    id v16 = v46;
    id v15 = v47;
    if (!v18->_nameComponents && !v18->_socialProfile && (v18->_email || v18->_phoneNumber || v18->_contactIdentifier))
    {
      uint64_t v39 = [(INPersonHandle *)v18->_handle value];
      if ([v39 isEqualToString:v18->_displayName])
      {

LABEL_29:
        v41 = v18->_displayName;
        v18->_displayName = 0;

        goto LABEL_30;
      }
      int v40 = heuristicIdentifyHandle(v18->_displayName);

      if (v40) {
        goto LABEL_29;
      }
    }
LABEL_30:
    id v17 = v52;
    if (v18->_displayName || v18->_contactIdentifier) {
      goto LABEL_32;
    }
LABEL_10:
    uint64_t v24 = 0;
    goto LABEL_33;
  }
  uint64_t v24 = 0;
LABEL_8:
  id v17 = v52;
LABEL_33:

  return v24;
}

+ (id)intentClassWhitelist
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)parseInteraction:(id)a3 bundleId:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"SGInteractionParser.m", 56, @"Invalid parameter not satisfying: %@", @"interaction" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"SGInteractionParser.m", 57, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

LABEL_3:
  id v10 = [v7 dateInterval];
  id v11 = [v10 startDate];

  id v27 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = [a1 _peopleFromInteraction:v7];
  uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        id v16 = v9;
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v18 = [SGParsedPersonFromInteraction alloc];
        uint64_t v19 = [v7 identifier];
        uint64_t v20 = [v7 groupIdentifier];
        v21 = v18;
        v9 = v16;
        v22 = [(SGParsedPersonFromInteraction *)v21 initWithPerson:v17 bundleId:v16 interactionIdentifier:v19 groupId:v20 date:v11];

        if (v22) {
          [v27 addObject:v22];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  return v27;
}

+ (id)_peopleFromInteraction:(id)a3
{
  id v3 = a3;
  if ([v3 direction] == 2)
  {
    CFStringRef v4 = 0;
    goto LABEL_11;
  }
  id v5 = [v3 intent];
  if (!v5) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 recipients];
      goto LABEL_8;
    }
LABEL_9:
    CFStringRef v4 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = [v5 contacts];
LABEL_8:
  CFStringRef v4 = (void *)v6;
LABEL_10:

LABEL_11:
  return v4;
}

@end