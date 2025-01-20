@interface SGStorageContact
+ (id)contactFromContactEntity:(id)a3;
+ (id)contactWithMasterEntityId:(int64_t)a3;
+ (id)mergeAll:(id)a3;
- (BOOL)canMerge:(id)a3;
- (BOOL)hasProfileFromInteraction;
- (BOOL)hasProfileFromTextMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStorageContact:(id)a3;
- (NSString)name;
- (SGContactDetailsHolder)internalDetectedDetails;
- (SGRecordId)recordId;
- (SGStorageContact)init;
- (id)allNames;
- (id)bestProfile;
- (id)convertToContact:(id)a3;
- (id)convertToContact:(id)a3 sourceEntity:(id)a4 enrichments:(id)a5;
- (id)description;
- (id)loadAddressDetailsFrom:(id)a3;
- (id)loadAllDetailsFrom:(id)a3;
- (id)loadBirthdayDetailsFrom:(id)a3;
- (id)loadEmailAddressDetailsFrom:(id)a3;
- (id)loadPhoneDetailsFrom:(id)a3;
- (id)profiles;
- (int64_t)masterEntityId;
- (unint64_t)hash;
- (void)addProfile:(id)a3;
- (void)merge:(id)a3;
- (void)reload;
- (void)setInternalDetectedDetails:(id)a3;
@end

@implementation SGStorageContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDetectedDetails, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

- (void)setInternalDetectedDetails:(id)a3
{
}

- (SGContactDetailsHolder)internalDetectedDetails
{
  return (SGContactDetailsHolder *)objc_getProperty(self, a2, 32, 1);
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (int64_t)masterEntityId
{
  return self->_masterEntityId;
}

- (BOOL)hasProfileFromTextMessage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5D9F0] fromTextMessage];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_profiles;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tags", (void)v11);
        char v9 = [v8 containsObject:v3];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)hasProfileFromInteraction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5D9F0] fromInteraction];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_profiles;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "tags", (void)v11);
        char v9 = [v8 containsObject:v3];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)bestProfile
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(SGStorageContact *)self name];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = self->_profiles;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v20;
    double v9 = -INFINITY;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "title", (void)v19);
        int v13 = [v12 isEqualToString:v3];

        if (v13)
        {
          id v17 = v11;

          v7 = v17;
          goto LABEL_14;
        }
        [v11 creationTimestamp];
        if (v14 > v9)
        {
          double v15 = v14;
          id v16 = v11;

          v7 = v16;
          double v9 = v15;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (id)convertToContact:(id)a3 sourceEntity:(id)a4 enrichments:(id)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = v7;
  id v10 = v8;
  id v11 = a5;
  v81 = [MEMORY[0x1E4F5DAC8] originWithType:0 sourceKey:0 externalKey:0 fromForwardedMessage:0];
  v84 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v90 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v18 = [v17 recordId];

        if (v18)
        {
          long long v19 = (void *)MEMORY[0x1E4F5DAC8];
          long long v20 = [v17 duplicateKey];
          long long v21 = [v19 originForDuplicateKey:v20 entity:v17 parent:v10 store:v9];
          long long v22 = [v17 recordId];
          [v84 setObject:v21 forKeyedSubscript:v22];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v14);
  }

  v23 = [v10 recordId];

  if (v23)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F5DAC8];
    v25 = [v10 duplicateKey];
    v26 = [v24 originForDuplicateKey:v25 entity:v10 parent:0 store:v9];
    v27 = [v10 recordId];
    [v84 setObject:v26 forKeyedSubscript:v27];
  }
  v28 = [(SGStorageContact *)self loadAllDetailsFrom:v9];
  v29 = [v28 phoneNumbers];
  v80 = sgMapAndFilter();

  v30 = [v28 postalAddresses];
  v79 = sgMapAndFilter();

  v31 = [v28 emailAddresses];
  v78 = sgMapAndFilter();

  v32 = [v28 socialProfiles];
  v77 = sgMapAndFilter();

  v33 = [v28 birthday];

  if (v33)
  {
    v75 = (void *)MEMORY[0x1E4F5D9C8];
    v73 = [v28 birthday];
    v71 = [v73 value];
    v34 = SGDateComponentsFromNormalizeBirthday(v71);
    v69 = [v28 birthday];
    v35 = [v69 label];
    v36 = [v28 birthday];
    v37 = [v36 extractionInfo];
    v38 = [v28 birthday];
    v39 = [v38 recordId];
    v76 = [v75 dateComponents:v34 label:v35 extractionInfo:v37 withRecordId:v39];
  }
  else
  {
    v76 = 0;
  }
  v40 = [v28 photoPath];

  if (v40)
  {
    v41 = [v28 photoPath];
    v74 = [v41 value];
  }
  else
  {
    v74 = 0;
  }
  v42 = [(SGStorageContact *)self bestProfile];
  uint64_t v43 = objc_msgSend(MEMORY[0x1E4F5DB20], "recordIdForContactWithRowId:", objc_msgSend(v42, "masterEntityId"));
  v44 = [v42 title];
  uint64_t v45 = [v84 objectForKeyedSubscript:v43];
  v46 = (void *)v45;
  if (v45) {
    v47 = (void *)v45;
  }
  else {
    v47 = v81;
  }
  v70 = v42;
  v48 = [v42 extractionInfo];
  uint64_t v49 = +[SGNames sgNameFromString:v44 origin:v47 recordId:v43 extractionInfo:v48];

  v66 = (void *)v49;
  v67 = (void *)v43;
  v50 = [MEMORY[0x1E4F5D9B0] contactWithId:v43 name:v49 emailAddresses:v78 phones:v80 postalAddresses:v79 socialProfiles:v77 birthday:v76 photoPath:v74];
  if ([(SGStorageContact *)self hasProfileFromInteraction])
  {
    [v50 setSignificance:1];
    [v50 setSignificanceOrigin:1];
  }
  v68 = v50;
  v72 = v28;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obja = v12;
  uint64_t v51 = [obja countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = 0;
    uint64_t v54 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v86 != v54) {
          objc_enumerationMutation(obja);
        }
        v56 = *(void **)(*((void *)&v85 + 1) + 8 * j);
        v57 = [v56 extractionInfo];
        if ([v57 extractionType] == 64)
        {
          v58 = [v56 duplicateKey];
          id v59 = v10;
          v60 = v9;
          BOOL v61 = [v58 entityType] == 4;

          uint64_t v53 = v53 | v61;
          double v9 = v60;
          id v10 = v59;
        }
        else
        {
        }
        v62 = [v56 extractionInfo];
        if ([v62 extractionType] == 64)
        {
          v63 = [v56 duplicateKey];
          uint64_t v64 = [v63 entityType];

          if (v64 == 23) {
            uint64_t v53 = v53 | 2;
          }
          else {
            uint64_t v53 = v53;
          }
        }
        else
        {
        }
      }
      uint64_t v52 = [obja countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v52);
  }
  else
  {
    uint64_t v53 = 0;
  }

  [v68 setUpdatedFields:v53];
  return v68;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [SGSocialProfileDetails alloc];
  v4 = [v2 value];
  uint64_t v5 = [(SGSocialProfileDetails *)v3 initWithSerialized:v4];

  if (v5)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F5DB48]);
    v18 = [(SGSocialProfileDetails *)v5 username];
    id v16 = [(SGSocialProfileDetails *)v5 userIdentifier];
    uint64_t v6 = [(SGSocialProfileDetails *)v5 bundleIdentifier];
    id v7 = [(SGSocialProfileDetails *)v5 displayName];
    uint64_t v8 = [(SGSocialProfileDetails *)v5 service];
    double v9 = [(SGSocialProfileDetails *)v5 teamIdentifier];
    id v10 = [v2 label];
    id v11 = [v2 extractionInfo];
    id v12 = [v2 recordId];
    uint64_t v13 = (void *)v8;
    uint64_t v14 = (void *)[v17 initWithUsername:v18 userIdentifier:v16 bundleIdentifier:v6 displayName:v7 service:v8 teamIdentifier:v9 label:v10 extractionInfo:v11 recordId:v12];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F5D9E0];
  id v3 = a2;
  v4 = [v3 value];
  uint64_t v5 = [v3 label];
  uint64_t v6 = [v3 extractionInfo];
  id v7 = [v3 recordId];

  uint64_t v8 = [v2 emailAddress:v4 label:v5 extractionInfo:v6 withRecordId:v7];

  return v8;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 value];
  v4 = SGPostalAddressParse(v3);

  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_3;
  v19[3] = &unk_1E65B68F0;
  v19[4] = &v20;
  [v4 enumerateKeysAndObjectsUsingBlock:v19];
  if (*((unsigned char *)v21 + 24)) {
    [v4 objectForKeyedSubscript:@"Street"];
  }
  else {
  uint64_t v5 = [v2 value];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F5DAE8];
  id v7 = [v4 objectForKeyedSubscript:@"City"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"State"];
  double v9 = [v4 objectForKeyedSubscript:@"ZIP"];
  id v10 = [v4 objectForKeyedSubscript:@"Country"];
  id v11 = [v6 components:v5 city:v7 state:v8 postalCode:v9 country:v10];

  id v12 = (void *)MEMORY[0x1E4F5DAE0];
  uint64_t v13 = [v2 value];
  uint64_t v14 = [v2 label];
  uint64_t v15 = [v2 extractionInfo];
  id v16 = [v2 recordId];
  id v17 = [v12 postalAddress:v13 components:v11 label:v14 extractionInfo:v15 recordId:v16];

  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  uint64_t result = [a3 length];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a4 = result != 0;
  return result;
}

id __62__SGStorageContact_convertToContact_sourceEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F5DAD8];
  id v3 = a2;
  v4 = [v3 value];
  uint64_t v5 = [v3 label];
  uint64_t v6 = [v3 extractionInfo];
  id v7 = [v3 recordId];

  uint64_t v8 = [v2 phoneNumber:v4 label:v5 extractionInfo:v6 recordId:v7];

  return v8;
}

- (id)convertToContact:(id)a3
{
  return [(SGStorageContact *)self convertToContact:a3 sourceEntity:0 enrichments:0];
}

- (id)loadBirthdayDetailsFrom:(id)a3
{
  id v3 = [(SGStorageContact *)self loadAllDetailsFrom:a3];
  v4 = [v3 birthday];

  return v4;
}

- (id)loadEmailAddressDetailsFrom:(id)a3
{
  id v3 = [(SGStorageContact *)self loadAllDetailsFrom:a3];
  v4 = [v3 emailAddresses];

  return v4;
}

- (id)loadAddressDetailsFrom:(id)a3
{
  id v3 = [(SGStorageContact *)self loadAllDetailsFrom:a3];
  v4 = [v3 postalAddresses];

  return v4;
}

- (id)loadPhoneDetailsFrom:(id)a3
{
  id v3 = [(SGStorageContact *)self loadAllDetailsFrom:a3];
  v4 = [v3 phoneNumbers];

  return v4;
}

- (id)loadAllDetailsFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGStorageContact *)self internalDetectedDetails];
  if (!v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = self->_profiles;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) recordId];
          uint64_t v13 = [v4 loadAllContactDetailsForRecordId:v12];
          [v6 addObjectsFromArray:v13];
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v9);
    }

    uint64_t v14 = +[SGDeduper splitContactDetailsByType:v6];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __39__SGStorageContact_loadAllDetailsFrom___block_invoke;
    v26[3] = &unk_1E65B6888;
    id v27 = v14;
    id v15 = v14;
    id v16 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v26);
    uint64_t v5 = objc_opt_new();
    id v17 = v16[2](v16, 2);
    [v5 setEmailAddresses:v17];

    v18 = v16[2](v16, 1);
    [v5 setPostalAddresses:v18];

    long long v19 = v16[2](v16, 0);
    [v5 setPhoneNumbers:v19];

    uint64_t v20 = v16[2](v16, 4);
    [v5 setSocialProfiles:v20];

    long long v21 = v16[2](v16, 6);
    uint64_t v22 = [v21 firstObject];
    [v5 setBirthday:v22];

    char v23 = v16[2](v16, 5);
    uint64_t v24 = [v23 firstObject];
    [v5 setPhotoPath:v24];
  }
  return v5;
}

id __39__SGStorageContact_loadAllDetailsFrom___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = +[SGDeduper dedupeContactDetails:v4];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)reload
{
}

- (void)merge:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a3;
  if (![(SGStorageContact *)self canMerge:v5])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SGStorageContact.m" lineNumber:149 description:@"Merging with a contact that isn't mergable"];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5[1];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SGStorageContact addProfile:](self, "addProfile:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)canMerge:(id)a3
{
  int64_t masterEntityId = self->_masterEntityId;
  return masterEntityId == [a3 masterEntityId] && self->_masterEntityId >= 0;
}

- (NSString)name
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_profiles;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "title", (void)v15);

        if (v10)
        {
          id v11 = [v9 title];
          long long v12 = normalizeName(v11);
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = +[SGNames bestName:v3];

  return (NSString *)v13;
}

- (id)allNames
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_profiles, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_profiles;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "title", (void)v14);

        if (v10)
        {
          id v11 = [v9 title];
          long long v12 = normalizeName(v11);
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)profiles
{
  return self->_profiles;
}

- (void)addProfile:(id)a3
{
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SGStorageContact *)self name];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<SGStorageContact: %@ - %lu profile(s)>", v4, -[NSMutableSet count](self->_profiles, "count")];

  return v5;
}

- (unint64_t)hash
{
  int64_t masterEntityId = self->_masterEntityId;
  return [(NSMutableSet *)self->_profiles hash] - masterEntityId + 32 * masterEntityId;
}

- (BOOL)isEqualToStorageContact:(id)a3
{
  id v4 = a3;
  int64_t masterEntityId = self->_masterEntityId;
  if (masterEntityId == [v4 masterEntityId])
  {
    uint64_t v6 = self->_profiles;
    uint64_t v7 = v6;
    if (v6 == (NSMutableSet *)v4[1]) {
      char v8 = 1;
    }
    else {
      char v8 = -[NSMutableSet isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGStorageContact *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStorageContact *)self isEqualToStorageContact:v5];

  return v6;
}

- (SGStorageContact)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGStorageContact;
  id v2 = [(SGStorageContact *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    profiles = v2->_profiles;
    v2->_profiles = (NSMutableSet *)v3;
  }
  return v2;
}

+ (id)mergeAll:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = v4;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if ([v15 canMerge:v9])
              {
                [v15 merge:v9];

                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        [v10 addObject:v9];
LABEL_16:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)contactWithMasterEntityId:(int64_t)a3
{
  id v4 = objc_opt_new();
  v4[2] = a3;
  return v4;
}

+ (id)contactFromContactEntity:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v4[2] = [v3 masterEntityId];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F5DB20], "recordIdForContactWithRowId:", objc_msgSend(v3, "masterEntityId"));
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  [v4 addProfile:v3];
  return v4;
}

@end