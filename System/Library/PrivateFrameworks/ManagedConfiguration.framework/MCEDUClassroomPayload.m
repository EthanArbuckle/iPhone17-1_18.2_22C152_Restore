@interface MCEDUClassroomPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (CRKEDUPayload)crk_payload;
- (MCEDUClassroomPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)leaderPayloadCertificateAnchorPersistentID;
- (NSArray)leaderPayloadCertificateAnchorUUID;
- (NSArray)memberPayloadCertificateAnchorPersistentID;
- (NSArray)memberPayloadCertificateAnchorUUID;
- (NSData)payloadCertificatePersistentID;
- (NSData)resourcePayloadCertificatePersistentID;
- (NSDictionary)configuration;
- (NSString)payloadCertificateUUID;
- (NSString)resourcePayloadCertificateUUID;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)title;
- (id)translatedCRKError:(id)a3;
- (id)verboseDescription;
- (void)payloadDescriptionKeyValueSections;
- (void)setCrk_payload:(id)a3;
- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3;
- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3;
- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3;
- (void)setMemberPayloadCertificateAnchorUUID:(id)a3;
- (void)setPayloadCertificatePersistentID:(id)a3;
- (void)setPayloadCertificateUUID:(id)a3;
- (void)setResourcePayloadCertificatePersistentID:(id)a3;
- (void)setResourcePayloadCertificateUUID:(id)a3;
@end

@implementation MCEDUClassroomPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.education";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"EDU_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"EDU_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEDUClassroomPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCEDUClassroomPayload;
  v10 = [(MCPayload *)&v39 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    v11 = (void *)getCRKEDUPayloadClass_softClass;
    uint64_t v43 = getCRKEDUPayloadClass_softClass;
    if (!getCRKEDUPayloadClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCRKEDUPayloadClass_block_invoke;
      v45 = &unk_1E5A67EE8;
      v46 = &v40;
      __getCRKEDUPayloadClass_block_invoke((uint64_t)buf);
      v11 = (void *)v41[3];
    }
    v12 = v11;
    _Block_object_dispose(&v40, 8);
    if (v12)
    {
      id v20 = [v12 alloc];
      v21 = [(MCPayload *)v10 profile];
      id v38 = 0;
      v22 = objc_msgSend(v20, "initWithDictionary:isStub:error:", v8, objc_msgSend(v21, "isStub"), &v38);
      v23 = (MCEDUClassroomPayload *)v38;

      objc_storeStrong((id *)&v10->_crk_payload, v22);
      if (v23)
      {
        v24 = [(MCEDUClassroomPayload *)v10 translatedCRKError:v23];
        v25 = [(MCPayload *)v10 malformedPayloadErrorWithError:v24];
        v26 = v25;
        if (a5 && v24) {
          *a5 = v25;
        }
        v27 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v28 = v27;
          v29 = objc_opt_class();
          id v37 = v29;
          v30 = [v26 MCVerboseDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse the payload: %{public}@", buf, 0x16u);
        }
        v31 = 0;
      }
      else
      {
        v31 = v10;
      }
      if ([v8 count])
      {
        v33 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v34 = v33;
          v35 = [(MCPayload *)v31 friendlyName];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
        }
      }
      v10 = v23;
    }
    else
    {
      if (!a5)
      {
        v31 = 0;
        goto LABEL_21;
      }
      v32 = (void *)MEMORY[0x1E4F28C58];
      v22 = MCErrorArray(@"EDU_COULD_NOT_INSTALL", v13, v14, v15, v16, v17, v18, v19, 0);
      [v32 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2005 descriptionArray:v22 errorType:@"MCFatalError"];
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    goto LABEL_22;
  }
  v31 = 0;
LABEL_22:

  return v31;
}

- (NSDictionary)configuration
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v3 = [v2 configuration];

  return (NSDictionary *)v3;
}

- (id)verboseDescription
{
  v50.receiver = self;
  v50.super_class = (Class)MCEDUClassroomPayload;
  uint64_t v3 = [(MCPayload *)&v50 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v6 = [v5 organizationUUID];

  if (v6)
  {
    uint64_t v7 = [(MCEDUClassroomPayload *)self crk_payload];
    id v8 = [v7 organizationUUID];
    [v4 appendFormat:@"OrganizationUUID : %@\n", v8];
  }
  id v9 = [(MCEDUClassroomPayload *)self crk_payload];
  v10 = [v9 organizationName];

  if (v10)
  {
    v11 = [(MCEDUClassroomPayload *)self crk_payload];
    v12 = [v11 organizationName];
    [v4 appendFormat:@"OrganizationName : %@\n", v12];
  }
  uint64_t v13 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v14 = [v13 userIdentifier];

  if (v14)
  {
    uint64_t v15 = [(MCEDUClassroomPayload *)self crk_payload];
    uint64_t v16 = [v15 userIdentifier];
    [v4 appendFormat:@"UserIdentifier   : %@\n", v16];
  }
  uint64_t v17 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v18 = [v17 departments];

  if (v18)
  {
    uint64_t v19 = [(MCEDUClassroomPayload *)self crk_payload];
    id v20 = [v19 departments];
    [v4 appendFormat:@"Departments      : %@\n", v20];
  }
  v21 = [(MCEDUClassroomPayload *)self crk_payload];
  v22 = [v21 groups];

  if (v22)
  {
    v23 = [(MCEDUClassroomPayload *)self crk_payload];
    v24 = [v23 groups];
    [v4 appendFormat:@"Groups           : %@\n", v24];
  }
  v25 = [(MCEDUClassroomPayload *)self crk_payload];
  v26 = [v25 users];

  if (v26)
  {
    v27 = [(MCEDUClassroomPayload *)self crk_payload];
    v28 = [v27 users];
    [v4 appendFormat:@"Users            : %@\n", v28];
  }
  v29 = [(MCEDUClassroomPayload *)self crk_payload];
  v30 = [v29 deviceGroups];

  if (v30)
  {
    v31 = [(MCEDUClassroomPayload *)self crk_payload];
    v32 = [v31 deviceGroups];
    [v4 appendFormat:@"Device Groups    : %@\n", v32];
  }
  v33 = [(MCEDUClassroomPayload *)self crk_payload];
  v34 = [v33 payloadCertificateUUID];

  if (v34)
  {
    v35 = [(MCEDUClassroomPayload *)self crk_payload];
    v36 = [v35 payloadCertificateUUID];
    [v4 appendFormat:@"Identity          : %@\n", v36];
  }
  id v37 = [(MCEDUClassroomPayload *)self crk_payload];
  id v38 = [v37 leaderPayloadCertificateAnchorUUID];

  if (v38)
  {
    objc_super v39 = [(MCEDUClassroomPayload *)self crk_payload];
    uint64_t v40 = [v39 leaderPayloadCertificateAnchorUUID];
    [v4 appendFormat:@"Leader Anchors    : %@\n", v40];
  }
  v41 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v42 = [v41 memberPayloadCertificateAnchorUUID];

  if (v42)
  {
    uint64_t v43 = [(MCEDUClassroomPayload *)self crk_payload];
    v44 = [v43 memberPayloadCertificateAnchorUUID];
    [v4 appendFormat:@"Member Anchors    : %@\n", v44];
  }
  v45 = [(MCEDUClassroomPayload *)self crk_payload];
  v46 = [v45 resourcePayloadCertificateUUID];

  if (v46)
  {
    uint64_t v47 = [(MCEDUClassroomPayload *)self crk_payload];
    v48 = [v47 resourcePayloadCertificateUUID];
    [v4 appendFormat:@"Resource Identity : %@\n", v48];
  }
  return v4;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCEDUClassroomPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCEDUClassroomPayload *)self configuration];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)title
{
  uint64_t v3 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v4 = [v3 organizationName];
  if (v4)
  {
    uint64_t v5 = [(MCEDUClassroomPayload *)self crk_payload];
    objc_super v6 = [v5 organizationName];
  }
  else
  {
    objc_super v6 = MCLocalizedString(@"EDU_UNKNOWN_ORGANIZATION");
  }

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v69 = (id)objc_opt_new();
  v72 = self;
  uint64_t v3 = [(MCEDUClassroomPayload *)self crk_payload];
  uint64_t v4 = [v3 departments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_super v6 = objc_opt_new();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v7 = [(MCEDUClassroomPayload *)v72 crk_payload];
    id v8 = [v7 departments];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v85 objects:v101 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v86 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          uint64_t v94 = 0;
          v95 = &v94;
          uint64_t v96 = 0x2020000000;
          uint64_t v13 = (void *)getkCRKEDUDepartmentNameKeySymbolLoc_ptr;
          uint64_t v97 = getkCRKEDUDepartmentNameKeySymbolLoc_ptr;
          if (!getkCRKEDUDepartmentNameKeySymbolLoc_ptr)
          {
            uint64_t v89 = MEMORY[0x1E4F143A8];
            uint64_t v90 = 3221225472;
            v91 = __getkCRKEDUDepartmentNameKeySymbolLoc_block_invoke;
            v92 = &unk_1E5A67EE8;
            v93 = &v94;
            uint64_t v14 = (void *)ClassroomKitLibrary();
            uint64_t v15 = dlsym(v14, "kCRKEDUDepartmentNameKey");
            *(void *)(v93[1] + 24) = v15;
            getkCRKEDUDepartmentNameKeySymbolLoc_ptr = *(void *)(v93[1] + 24);
            uint64_t v13 = (void *)v95[3];
          }
          _Block_object_dispose(&v94, 8);
          if (!v13) {
            -[MCEDUClassroomPayload payloadDescriptionKeyValueSections]();
          }
          uint64_t v16 = [v12 objectForKeyedSubscript:*v13];
          [v6 addObject:v16];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v85 objects:v101 count:16];
      }
      while (v9);
    }

    uint64_t v17 = MCLocalizedString(@"EDU_DEPARTMENTS");
    uint64_t v18 = +[MCKeyValueSection sectionWithLocalizedArray:v6 title:v17 footer:0];
    [v69 addObject:v18];
  }
  uint64_t v19 = [(MCEDUClassroomPayload *)v72 crk_payload];
  id v20 = [v19 groups];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = objc_opt_new();
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v23 = [(MCEDUClassroomPayload *)v72 crk_payload];
    v24 = [v23 groups];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v81 objects:v100 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v82 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          v29 = getkCRKEDUDeviceGroupNameKey();
          v30 = [v28 objectForKeyedSubscript:v29];
          [v22 addObject:v30];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v81 objects:v100 count:16];
      }
      while (v25);
    }

    v31 = MCLocalizedString(@"EDU_GROUPS");
    v32 = +[MCKeyValueSection sectionWithLocalizedArray:v22 title:v31 footer:0];
    [v69 addObject:v32];
  }
  v33 = [(MCEDUClassroomPayload *)v72 crk_payload];
  v34 = [v33 users];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    v71 = objc_opt_new();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v36 = [(MCEDUClassroomPayload *)v72 crk_payload];
    obuint64_t j = [v36 users];

    uint64_t v37 = [obj countByEnumeratingWithState:&v77 objects:v99 count:16];
    if (!v37) {
      goto LABEL_38;
    }
    uint64_t v38 = *(void *)v78;
    while (1)
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v78 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void **)(*((void *)&v77 + 1) + 8 * k);
        v41 = getkCRKEDUUserIdentifierKey();
        uint64_t v42 = [v40 objectForKeyedSubscript:v41];

        uint64_t v43 = [(MCEDUClassroomPayload *)v72 crk_payload];
        v44 = [v43 userIdentifier];
        if (v44)
        {
          v45 = [(MCEDUClassroomPayload *)v72 crk_payload];
          v46 = [v45 userIdentifier];
          int v47 = [v46 isEqualToString:v42];

          if (!v47) {
            goto LABEL_36;
          }
        }
        else
        {
        }
        uint64_t v94 = 0;
        v95 = &v94;
        uint64_t v96 = 0x2020000000;
        v48 = (void *)getkCRKEDUUserNameKeySymbolLoc_ptr;
        uint64_t v97 = getkCRKEDUUserNameKeySymbolLoc_ptr;
        if (!getkCRKEDUUserNameKeySymbolLoc_ptr)
        {
          uint64_t v89 = MEMORY[0x1E4F143A8];
          uint64_t v90 = 3221225472;
          v91 = __getkCRKEDUUserNameKeySymbolLoc_block_invoke;
          v92 = &unk_1E5A67EE8;
          v93 = &v94;
          v49 = (void *)ClassroomKitLibrary();
          objc_super v50 = dlsym(v49, "kCRKEDUUserNameKey");
          *(void *)(v93[1] + 24) = v50;
          getkCRKEDUUserNameKeySymbolLoc_ptr = *(void *)(v93[1] + 24);
          v48 = (void *)v95[3];
        }
        _Block_object_dispose(&v94, 8);
        if (!v48) {
          -[MCEDUClassroomPayload payloadDescriptionKeyValueSections]();
        }
        v51 = [v40 objectForKeyedSubscript:*v48];
        [v71 addObject:v51];

LABEL_36:
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v77 objects:v99 count:16];
      if (!v37)
      {
LABEL_38:

        v52 = MCLocalizedString(@"EDU_USERS");
        v53 = +[MCKeyValueSection sectionWithLocalizedArray:v71 title:v52 footer:0];
        [v69 addObject:v53];

        break;
      }
    }
  }
  v54 = [(MCEDUClassroomPayload *)v72 crk_payload];
  v55 = [v54 deviceGroups];
  uint64_t v56 = [v55 count];

  if (v56)
  {
    v57 = objc_opt_new();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v58 = [(MCEDUClassroomPayload *)v72 crk_payload];
    v59 = [v58 deviceGroups];

    uint64_t v60 = [v59 countByEnumeratingWithState:&v73 objects:v98 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v74 != v61) {
            objc_enumerationMutation(v59);
          }
          v63 = *(void **)(*((void *)&v73 + 1) + 8 * m);
          v64 = getkCRKEDUDeviceGroupNameKey();
          v65 = [v63 objectForKeyedSubscript:v64];
          [v57 addObject:v65];
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v73 objects:v98 count:16];
      }
      while (v60);
    }

    v66 = MCLocalizedString(@"EDU_DEVICE_GROUPS");
    v67 = +[MCKeyValueSection sectionWithLocalizedArray:v57 title:v66 footer:0];
    [v69 addObject:v67];
  }
  if (![v69 count])
  {

    id v69 = 0;
  }
  return v69;
}

- (id)translatedCRKError:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    objc_super v6 = getCRKEDUProfileErrorDomain();
    char v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      uint64_t v8 = [v4 code];
      uint64_t v9 = [v4 userInfo];
      uint64_t v10 = @"MCProfileErrorDomain";
      switch(v8)
      {
        case 0:
          if (!v9) {
            goto LABEL_49;
          }
          v11 = getCRKEDUProfileErrorFieldKey();
          v12 = [v9 objectForKeyedSubscript:v11];

          uint64_t v13 = getCRKEDUProfileErrorValueKey();
          uint64_t v14 = [v9 objectForKeyedSubscript:v13];

          if (!v12) {
            goto LABEL_71;
          }
          uint64_t v15 = getkCRKEDUSingleUserIdentifierKey();
          int v16 = [v12 isEqualToString:v15];

          v24 = 0;
          if (!v16 || !v14) {
            goto LABEL_72;
          }
          uint64_t v25 = MCErrorArray(@"EDU_USER_IDENTIFIER_NOT_FOUND_P_IDENTIFIER", v17, v18, v19, v20, v21, v22, v23, v14);
          goto LABEL_70;
        case 1:
          v44 = @"MCPayloadErrorDomain";

          if (v9)
          {
            long long v80 = getCRKEDUProfileErrorFieldKey();
            long long v81 = [v9 objectForKeyedSubscript:v80];

            if (v81)
            {
              v24 = MCErrorArray(@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD", v82, v83, v84, v85, v86, v87, v88, v81);
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
          }
          uint64_t v115 = 2002;
          goto LABEL_62;
        case 2:
          v44 = @"MCPayloadErrorDomain";

          if (v9)
          {
            v45 = getCRKEDUProfileErrorFieldKey();
            v46 = [v9 objectForKeyedSubscript:v45];

            if (v46)
            {
              v24 = MCErrorArray(@"ERROR_PROFILE_FIELD_INVALID_P_FIELD", v47, v48, v49, v50, v51, v52, v53, v46);
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
          }
          uint64_t v115 = 2003;
          goto LABEL_62;
        case 3:
          if (!v9)
          {
            v24 = 0;
            goto LABEL_78;
          }
          v54 = getCRKEDUProfileErrorFieldKey();
          v55 = [v9 objectForKeyedSubscript:v54];

          uint64_t v56 = getCRKEDUProfileErrorValueKey();
          v57 = [v9 objectForKeyedSubscript:v56];

          v58 = [v57 description];
          v59 = [v58 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

          v24 = 0;
          if (!v55 || !v57) {
            goto LABEL_77;
          }
          uint64_t v60 = getkCRKEDUGroupBeaconIDKey();
          char v61 = [v55 isEqualToString:v60];

          if (v61)
          {
            id v69 = @"EDU_GROUP_BEACON_INVALID_P_BEACONID";
LABEL_76:
            v24 = MCErrorArray(v69, v62, v63, v64, v65, v66, v67, v68, v59);
            goto LABEL_77;
          }
          v118 = getkCRKEDUPayloadLeaderCertificateAnchorUUIDKey();
          char v119 = [v55 isEqualToString:v118];

          if (v119)
          {
            id v69 = @"EDU_LEADER_CERTIFICATE_ANCHOR_UUID_INVALID_P_UUID";
            goto LABEL_76;
          }
          v122 = getkCRKEDUPayloadMemberCertificateAnchorUUIDKey();
          int v123 = [v55 isEqualToString:v122];

          if (v123)
          {
            id v69 = @"EDU_MEMBER_CERTIFICATE_ANCHOR_UUID_INVALID_P_UUID";
            goto LABEL_76;
          }
          v24 = 0;
LABEL_77:

LABEL_78:
          uint64_t v115 = 1010;
LABEL_79:
          id v26 = [MEMORY[0x1E4F28C58] MCErrorWithDomain:v10 code:v115 descriptionArray:v24 errorType:@"MCFatalError"];

          break;
        case 4:
          if (!v9)
          {
LABEL_49:
            v24 = 0;
            goto LABEL_73;
          }
          v32 = getCRKEDUProfileErrorFieldKey();
          v12 = [v9 objectForKeyedSubscript:v32];

          v33 = getCRKEDUProfileErrorValueKey();
          uint64_t v14 = [v9 objectForKeyedSubscript:v33];

          v24 = 0;
          if (!v12 || !v14) {
            goto LABEL_72;
          }
          v34 = getkCRKEDUGroupBeaconIDKey();
          char v35 = [v12 isEqualToString:v34];

          if (v35)
          {
            uint64_t v43 = @"EDU_GROUP_BEACON_NOT_UNIQUE_P_BEACONID";
          }
          else
          {
            v116 = getkCRKEDUUserIdentifierKey();
            char v117 = [v12 isEqualToString:v116];

            if (v117)
            {
              uint64_t v43 = @"EDU_USER_IDENTIFIER_NOT_UNIQUE_P_IDENTIFIER";
            }
            else
            {
              v120 = getkCRKEDUDeviceGroupNameKey();
              int v121 = [v12 isEqualToString:v120];

              if (!v121)
              {
LABEL_71:
                v24 = 0;
                goto LABEL_72;
              }
              uint64_t v43 = @"EDU_DEVICE_GROUP_NAME_NOT_UNIQUE_P_NAME";
            }
          }
          uint64_t v25 = MCErrorArray(v43, v36, v37, v38, v39, v40, v41, v42, v14);
LABEL_70:
          v24 = (void *)v25;
LABEL_72:

LABEL_73:
          uint64_t v115 = 1000;
          goto LABEL_79;
        case 5:
          v44 = @"MCPayloadErrorDomain";

          if (!v9) {
            goto LABEL_47;
          }
          uint64_t v126 = 0;
          v127 = &v126;
          uint64_t v128 = 0x2020000000;
          uint64_t v89 = (void *)getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr;
          uint64_t v129 = getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr;
          if (!getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_block_invoke;
            v131 = &unk_1E5A67EE8;
            v132 = &v126;
            uint64_t v90 = (void *)ClassroomKitLibrary();
            v91 = dlsym(v90, "CRKEDUProfileErrorProvidedKeysKey");
            *(void *)(v132[1] + 24) = v91;
            getCRKEDUProfileErrorProvidedKeysKeySymbolLoc_ptr = *(void *)(v132[1] + 24);
            uint64_t v89 = (void *)v127[3];
          }
          _Block_object_dispose(&v126, 8);
          if (!v89) {
            -[MCEDUClassroomPayload translatedCRKError:]();
          }
          v92 = [v9 objectForKeyedSubscript:*v89];
          uint64_t v126 = 0;
          v127 = &v126;
          uint64_t v128 = 0x2020000000;
          v93 = (void *)getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr;
          uint64_t v129 = getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr;
          if (!getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_block_invoke;
            v131 = &unk_1E5A67EE8;
            v132 = &v126;
            uint64_t v94 = (void *)ClassroomKitLibrary();
            v95 = dlsym(v94, "CRKEDUProfileErrorAllOrNoneKeysKey");
            *(void *)(v132[1] + 24) = v95;
            getCRKEDUProfileErrorAllOrNoneKeysKeySymbolLoc_ptr = *(void *)(v132[1] + 24);
            v93 = (void *)v127[3];
          }
          _Block_object_dispose(&v126, 8);
          if (!v93) {
            -[MCEDUClassroomPayload translatedCRKError:]();
          }
          uint64_t v96 = [v9 objectForKeyedSubscript:*v93];
          uint64_t v97 = (void *)v96;
          v24 = 0;
          if (v92 && v96)
          {
            v98 = MCLocalizedString(@"WEB_FILTER_SEPARATOR");
            v99 = [v92 componentsJoinedByString:v98];
            v125 = [v97 componentsJoinedByString:v98];
            v24 = MCErrorArray(@"EDU_INVALID_COMBINATION_OF_KEYS_P_PROVIDED_KEYS_P_EXPECTED_KEYS", v100, v101, v102, v103, v104, v105, v106, v99);
          }
          goto LABEL_52;
        case 6:
          v44 = @"MCPayloadErrorDomain";

          if (!v9) {
            goto LABEL_47;
          }
          v107 = getCRKEDUProfileErrorTopLevelUserIdentifierKey();
          v71 = [v9 objectForKeyedSubscript:v107];

          if (!v71) {
            goto LABEL_50;
          }
          uint64_t v79 = MCErrorArray(@"EDU_TOP_USER_NOT_LEADER_OR_MEMBER_P_IDENTIFIER", v108, v109, v110, v111, v112, v113, v114, v71);
          goto LABEL_46;
        case 7:
          v44 = @"MCPayloadErrorDomain";

          if (v9)
          {
            v70 = getCRKEDUProfileErrorTopLevelUserIdentifierKey();
            v71 = [v9 objectForKeyedSubscript:v70];

            if (v71)
            {
              uint64_t v79 = MCErrorArray(@"EDU_TOP_USER_IS_LEADER_AND_MEMBER_P_IDENTIFIER", v72, v73, v74, v75, v76, v77, v78, v71);
LABEL_46:
              v24 = (void *)v79;
            }
            else
            {
LABEL_50:
              v24 = 0;
            }
          }
          else
          {
LABEL_47:
            v24 = 0;
          }
LABEL_52:
          uint64_t v115 = 2000;
LABEL_62:
          uint64_t v10 = v44;
          goto LABEL_79;
        default:
          v24 = 0;
          uint64_t v115 = 0;
          goto LABEL_79;
      }
    }
    else
    {
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        v28 = v27;
        uint64_t v29 = objc_opt_class();
        v30 = [v4 domain];
        v31 = getCRKEDUProfileErrorDomain();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2114;
        v131 = v31;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@ was given error domain to translate: %{public}@, expected: %{public}@, not translating error.", buf, 0x20u);
      }
      id v26 = v4;
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (NSString)payloadCertificateUUID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 payloadCertificateUUID];
  uint64_t v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setPayloadCertificateUUID:(id)a3
{
  id v5 = (id)[a3 copy];
  uint64_t v4 = [(MCEDUClassroomPayload *)self crk_payload];
  [v4 setPayloadCertificateUUID:v5];
}

- (NSData)payloadCertificatePersistentID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 payloadCertificatePersistentID];

  return (NSData *)v3;
}

- (void)setPayloadCertificatePersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setPayloadCertificatePersistentID:v4];
}

- (NSArray)leaderPayloadCertificateAnchorUUID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 leaderPayloadCertificateAnchorUUID];

  return (NSArray *)v3;
}

- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setLeaderPayloadCertificateAnchorUUID:v4];
}

- (NSArray)leaderPayloadCertificateAnchorPersistentID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 leaderPayloadCertificateAnchorPersistentID];

  return (NSArray *)v3;
}

- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setLeaderPayloadCertificateAnchorPersistentID:v4];
}

- (NSArray)memberPayloadCertificateAnchorUUID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 memberPayloadCertificateAnchorUUID];

  return (NSArray *)v3;
}

- (void)setMemberPayloadCertificateAnchorUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setMemberPayloadCertificateAnchorUUID:v4];
}

- (NSArray)memberPayloadCertificateAnchorPersistentID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 memberPayloadCertificateAnchorPersistentID];

  return (NSArray *)v3;
}

- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setMemberPayloadCertificateAnchorPersistentID:v4];
}

- (NSString)resourcePayloadCertificateUUID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 resourcePayloadCertificateUUID];

  return (NSString *)v3;
}

- (void)setResourcePayloadCertificateUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setResourcePayloadCertificateUUID:v4];
}

- (NSData)resourcePayloadCertificatePersistentID
{
  uint64_t v2 = [(MCEDUClassroomPayload *)self crk_payload];
  id v3 = [v2 resourcePayloadCertificatePersistentID];

  return (NSData *)v3;
}

- (void)setResourcePayloadCertificatePersistentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MCEDUClassroomPayload *)self crk_payload];
  [v5 setResourcePayloadCertificatePersistentID:v4];
}

- (CRKEDUPayload)crk_payload
{
  return self->_crk_payload;
}

- (void)setCrk_payload:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)payloadDescriptionKeyValueSections
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkCRKEDUDepartmentNameKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)translatedCRKError:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorProvidedKeysKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 33, @"%s", dlerror());

  __break(1u);
}

- (void)translatedCRKError:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getCRKEDUProfileErrorAllOrNoneKeysKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MCEDUClassroomPayload.m", 34, @"%s", dlerror());

  __break(1u);
}

@end