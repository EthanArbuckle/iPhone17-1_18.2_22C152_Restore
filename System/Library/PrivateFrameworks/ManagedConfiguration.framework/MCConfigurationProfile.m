@interface MCConfigurationProfile
- (BOOL)isCloudLocked;
- (BOOL)isCloudProfile;
- (BOOL)isMDMProfile;
- (BOOL)isManagedByMDM;
- (BOOL)isManagedByProfileService;
- (MCConfigurationProfile)initWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7;
- (MCProfileServiceProfile)OTAProfile;
- (NSNumber)isCloudLockedNum;
- (NSNumber)isCloudProfileNum;
- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3;
- (__SecCertificate)copyCertificateWithPersistentID:(id)a3;
- (id)_localizedPayloadSummaryByType:(id)a3;
- (id)_sortPayloads:(id)a3;
- (id)_subjectSummaryFromCertificate:(__SecCertificate *)a3;
- (id)description;
- (id)earliestCertificateExpiryDate;
- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3;
- (id)localizedManagedPayloadSummaryByType;
- (id)localizedManagedProfileConsentTexts;
- (id)localizedPayloadSummaryByType;
- (id)managedPayloads;
- (id)payloadWithUUID:(id)a3;
- (id)payloads;
- (id)serializedDictionary;
- (id)stubDictionary;
- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3;
- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3;
- (id)verboseDescription;
- (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5;
- (void)_sortPayloads;
- (void)replacePayloadWithUUID:(id)a3 withPayload:(id)a4;
- (void)setIsCloudLocked:(BOOL)a3;
- (void)setIsCloudLockedNum:(id)a3;
- (void)setIsCloudProfile:(BOOL)a3;
- (void)setIsCloudProfileNum:(id)a3;
- (void)setIsMDMProfile:(BOOL)a3;
- (void)setOTAProfile:(id)a3;
@end

@implementation MCConfigurationProfile

- (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v10 count] && objc_msgSend(v10, "count"))
  {
    unint64_t v8 = 0;
    do
    {
      if (v8 >= [v10 count]) {
        break;
      }
      v9 = [v10 objectAtIndex:v8];
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        ++v8;
      }
      else
      {
        [v7 addObject:v9];
        [v10 removeObjectAtIndex:v8];
      }
    }
    while ([v10 count]);
  }
}

- (id)_sortPayloads:(id)a3
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (!_sortPayloads__classSortOrder)
    {
      v23[0] = objc_opt_class();
      v23[1] = objc_opt_class();
      v23[2] = objc_opt_class();
      v23[3] = objc_opt_class();
      v23[4] = objc_opt_class();
      v23[5] = objc_opt_class();
      v23[6] = objc_opt_class();
      v23[7] = objc_opt_class();
      v23[8] = objc_opt_class();
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:9];
      v6 = (void *)_sortPayloads__classSortOrder;
      _sortPayloads__classSortOrder = v5;
    }
    id v7 = (void *)[v4 mutableCopy];
    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = (id)_sortPayloads__classSortOrder;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          -[MCConfigurationProfile _addObjectsOfClass:fromArray:toArray:](self, "_addObjectsOfClass:fromArray:toArray:", *(void *)(*((void *)&v18 + 1) + 8 * i), v7, v8, (void)v18);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    while (objc_msgSend(v7, "count", (void)v18))
    {
      v14 = [v7 objectAtIndex:0];
      uint64_t v15 = objc_opt_class();

      [(MCConfigurationProfile *)self _addObjectsOfClass:v15 fromArray:v7 toArray:v8];
    }
    id v16 = (id)[v8 copy];
  }
  else
  {
    id v16 = v4;
  }

  return v16;
}

- (void)_sortPayloads
{
  self->_payloads = [(MCConfigurationProfile *)self _sortPayloads:self->_payloads];
  MEMORY[0x1F41817F8]();
}

- (id)payloads
{
  return self->_payloads;
}

- (id)managedPayloads
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_payloads];
  id v4 = +[MCDependencyReader sharedReader];
  uint64_t v5 = [(MCProfile *)self identifier];
  v6 = [v4 dependentsOfParent:v5 inDomain:@"ManagingProfileToManagedProfile"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        v13 = [v12 payloads];
        [v3 addObjectsFromArray:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = [(MCConfigurationProfile *)self _sortPayloads:v3];

  return v14;
}

- (id)payloadWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_payloads;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "UUID", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_subjectSummaryFromCertificate:(__SecCertificate *)a3
{
  if (a3)
  {
    id v4 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3
{
  uint64_t v3 = [(MCConfigurationProfile *)self payloadWithUUID:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (__SecCertificate *)[v3 copyCertificate];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3
{
  id v4 = [(MCConfigurationProfile *)self copyCertificateFromPayloadWithUUID:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(MCConfigurationProfile *)self _subjectSummaryFromCertificate:v4];
    CFRelease(v5);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_payloads;
  id v6 = (__SecCertificate *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (__SecCertificate *)((char *)i + 1))
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          char v11 = objc_msgSend(v10, "certificatePersistentID", (void)v14);
          char v12 = [v11 isEqualToData:v4];

          if (v12)
          {
            id v6 = (__SecCertificate *)[v10 copyCertificate];

            goto LABEL_13;
          }
        }
      }
      id v6 = (__SecCertificate *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3
{
  id v4 = [(MCConfigurationProfile *)self copyCertificateWithPersistentID:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(MCConfigurationProfile *)self _subjectSummaryFromCertificate:v4];
    CFRelease(v5);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (MCConfigurationProfile)initWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v289 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v279.receiver = self;
  v279.super_class = (Class)MCConfigurationProfile;
  long long v14 = [(MCProfile *)&v279 initWithDictionary:v12 signerCerts:a5 allowEmptyPayload:v8 outError:a7];
  long long v15 = v14;
  if (!v14)
  {
LABEL_39:
    v81 = v15;
    goto LABEL_40;
  }
  if (v13)
  {
    long long v16 = [(MCProfile *)v14 installOptions];

    if (!v16) {
      [(MCProfile *)v15 setInstallOptions:v13];
    }
  }
  long long v17 = [v12 objectForKey:@"PayloadContent"];
  [v12 removeObjectForKey:@"PayloadContent"];
  BOOL v18 = [(MCProfile *)v15 isStub];
  uint64_t v19 = [v17 count];
  v250 = a7;
  v251 = v15;
  if (v18)
  {
    if (v19)
    {
      uint64_t v27 = +[MCPayload payloadsFromArray:v17 isStub:1 profile:v15 outError:0];
      payloads = v15->_payloads;
      v15->_payloads = (NSArray *)v27;
    }
    id v278 = 0;
    uint64_t v29 = [v12 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IsCloudProfile" isRequired:0 outError:&v278];
    id v30 = v278;
    isCloudProfileNuuint64_t m = v15->_isCloudProfileNum;
    v15->_isCloudProfileNuuint64_t m = (NSNumber *)v29;

    if (!v30)
    {
      v15->_isCloudProfile = [(NSNumber *)v15->_isCloudProfileNum BOOLValue];
      if (!v15->_isCloudProfileNum)
      {
        v32 = [(MCProfile *)v15 installOptions];

        if (v32)
        {
          v33 = [(MCProfile *)v15 installOptions];
          [v33 objectForKeyedSubscript:@"isCloudProfile"];
          v35 = v34 = v17;
          v15->_isCloudProfile = [v35 BOOLValue];

          long long v17 = v34;
        }
      }
      id v277 = 0;
      uint64_t v36 = [v12 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IsCloudLocked" isRequired:0 outError:&v277];
      id v30 = v277;
      isCloudLockedNuuint64_t m = v15->_isCloudLockedNum;
      v15->_isCloudLockedNuuint64_t m = (NSNumber *)v36;

      if (!v30)
      {
        v15->_isCloudLocked = [(NSNumber *)v15->_isCloudLockedNum BOOLValue];
        if (!v15->_isCloudLockedNum)
        {
          v55 = [(MCProfile *)v15 installOptions];

          if (v55)
          {
            v56 = [(MCProfile *)v15 installOptions];
            [v56 objectForKeyedSubscript:@"isCloudLocked"];
            v58 = v57 = v17;
            v251->_isCloudLocked = [v58 BOOLValue];

            long long v17 = v57;
          }
        }
        id v276 = 0;
        v59 = +[MCProfile removeOptionalObjectInDictionary:v12 key:@"OTAProfileStub" type:objc_opt_class() errorDomain:@"MCProfileErrorDomain" invalidDataCode:1003 invalidDataErrorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v276];
        id v60 = v276;
        id v30 = v60;
        if (v59)
        {
          v61 = v17;
          v62 = (void *)[v59 MCMutableDeepCopy];
          id v275 = v30;
          uint64_t v63 = +[MCProfile profileWithDictionary:v62 options:v13 signerCerts:0 fileName:0 allowEmptyPayload:1 outError:&v275];
          id v64 = v275;

          OTAProfile = v251->_OTAProfile;
          v251->_OTAProfile = (MCProfileServiceProfile *)v63;
          long long v17 = v61;

          id v30 = v64;
          if (!v64) {
            goto LABEL_58;
          }
        }
        else if (!v60)
        {
          goto LABEL_58;
        }
      }
    }

    long long v15 = v251;
    goto LABEL_34;
  }
  if (!v19 && !v8)
  {
    v38 = (void *)MEMORY[0x1E4F28C58];
    MCErrorArray(@"EMPTY_PAYLOAD_ERROR_DESCRIPTION", v20, v21, v22, v23, v24, v25, v26, 0);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = [v38 MCErrorWithDomain:@"MCProfileErrorDomain" code:1005 descriptionArray:v39 errorType:@"MCFatalError"];
    goto LABEL_33;
  }
  id v274 = 0;
  uint64_t v40 = +[MCPayload payloadsFromArray:v17 isStub:0 profile:v15 outError:&v274];
  v41 = v15;
  id v39 = v274;
  v42 = v15->_payloads;
  v15->_payloads = (NSArray *)v40;

  v248 = v17;
  if (v39)
  {
    id v43 = v13;
    id v30 = v39;
    v44 = (void *)MEMORY[0x1E4F28C58];
    v45 = [(MCProfile *)v41 profileDescription];
    id v46 = v12;
    if (v45) {
      [(MCProfile *)v41 profileDescription];
    }
    else {
    v66 = [(MCProfile *)v41 identifier];
    }
    v74 = MCErrorArray(@"ERROR_PROFILE_MALFORMED_P_ID", v67, v68, v69, v70, v71, v72, v73, v66);
    id v75 = (id)[v44 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v74 underlyingError:v30 errorType:@"MCFatalError"];

    id v12 = v46;
    id v13 = v43;
    goto LABEL_31;
  }
  if (![(NSArray *)v15->_payloads count] && !v8)
  {
    v54 = (void *)MEMORY[0x1E4F28C58];
    v45 = MCErrorArray(@"EMPTY_PAYLOAD_ERROR_DESCRIPTION", v47, v48, v49, v50, v51, v52, v53, 0);
    id v30 = [v54 MCErrorWithDomain:@"MCProfileErrorDomain" code:1005 descriptionArray:v45 errorType:@"MCFatalError"];
LABEL_31:

    goto LABEL_32;
  }
  id v242 = v12;
  id v245 = v13;
  v83 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v84 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  v85 = v15->_payloads;
  uint64_t v86 = [(NSArray *)v85 countByEnumeratingWithState:&v270 objects:v288 count:16];
  if (!v86)
  {
    id v30 = 0;
    goto LABEL_57;
  }
  uint64_t v87 = v86;
  uint64_t v88 = *(void *)v271;
  while (2)
  {
    for (uint64_t i = 0; i != v87; ++i)
    {
      if (*(void *)v271 != v88) {
        objc_enumerationMutation(v85);
      }
      v90 = *(void **)(*((void *)&v270 + 1) + 8 * i);
      v91 = [v90 UUID];
      if ([v83 containsObject:v91])
      {
        v107 = (void *)MEMORY[0x1E4F28C58];
        v99 = MCErrorArray(@"ERROR_PROFILE_PAYLOAD_NONUNIQUE_UUIDS", v92, v93, v94, v95, v96, v97, v98, 0);
        id v30 = [v107 MCErrorWithDomain:@"MCProfileErrorDomain" code:1007 descriptionArray:v99 errorType:@"MCFatalError"];
LABEL_56:

        long long v17 = v248;
        goto LABEL_57;
      }
      [v83 addObject:v91];
      v99 = [v90 identifier];
      if ([v84 containsObject:v99])
      {
        v108 = (void *)MEMORY[0x1E4F28C58];
        v109 = MCErrorArray(@"ERROR_PROFILE_PAYLOAD_NONUNIQUE_IDENTIFIERS_P_ID", v100, v101, v102, v103, v104, v105, v106, v99);
        id v30 = [v108 MCErrorWithDomain:@"MCProfileErrorDomain" code:1008 descriptionArray:v109 errorType:@"MCFatalError"];

        goto LABEL_56;
      }
      [v84 addObject:v99];
    }
    uint64_t v87 = [(NSArray *)v85 countByEnumeratingWithState:&v270 objects:v288 count:16];
    id v30 = 0;
    long long v17 = v248;
    if (v87) {
      continue;
    }
    break;
  }
LABEL_57:

  id v12 = v242;
  id v13 = v245;
  if (v30) {
    goto LABEL_33;
  }
LABEL_58:
  v110 = v251;
  [(MCConfigurationProfile *)v251 _sortPayloads];
  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  v111 = v251->_payloads;
  uint64_t v112 = [(NSArray *)v111 countByEnumeratingWithState:&v266 objects:v287 count:16];
  id v246 = v13;
  v248 = v17;
  if (!v112)
  {

    [(MCProfile *)v251 isStub];
    goto LABEL_88;
  }
  uint64_t v113 = v112;
  uint64_t v241 = 0;
  id v243 = v12;
  int v114 = 0;
  int v115 = 0;
  int v252 = 0;
  int v116 = 0;
  uint64_t v249 = 0;
  uint64_t v247 = 0;
  uint64_t v117 = *(void *)v267;
  do
  {
    for (uint64_t j = 0; j != v113; ++j)
    {
      if (*(void *)v267 != v117) {
        objc_enumerationMutation(v111);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        ++v114;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ++v115;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            ++v116;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              ++v252;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                ++HIDWORD(v249);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  LODWORD(v249) = v249 + 1;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    ++HIDWORD(v247);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      LODWORD(v247) = v247 + 1;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        ++HIDWORD(v241);
                      }
                      else
                      {
                        objc_opt_class();
                        LODWORD(v241) = v241 + (objc_opt_isKindOfClass() & 1);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v113 = [(NSArray *)v111 countByEnumeratingWithState:&v266 objects:v287 count:16];
  }
  while (v113);

  if (v114 >= 2)
  {
    v119 = (void *)MEMORY[0x1E4F28C58];
    id v39 = [(MCProfile *)v251 friendlyName];
    MCErrorArray(@"ERROR_PROFILE_TOO_MANY_MDM_P_ID", v120, v121, v122, v123, v124, v125, v126, v39);
    goto LABEL_86;
  }
  id v13 = v246;
  if (![(MCProfile *)v251 isStub] && v114 == 1 && [(MCProfile *)v251 isLocked])
  {
    v157 = (void *)MEMORY[0x1E4F28C58];
    MCErrorArray(@"ERROR_PROFILE_MDM_AND_LOCKED", v150, v151, v152, v153, v154, v155, v156, 0);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    v158 = [v157 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v39 errorType:@"MCFatalError"];
    id v30 = (id)[v158 MCCopyAsPrimaryError];

    goto LABEL_135;
  }
  if (v115 < 2)
  {
    if (v116 >= 2)
    {
      v159 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_CHAPERONE_P_ID", v182, v183, v184, v185, v186, v187, v188, v39);
      goto LABEL_134;
    }
    id v12 = v243;
    if (v252 >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_GLOBAL_PROXY_P_ID", v192, v193, v194, v195, v196, v197, v198, v39);
LABEL_152:
      id v134 = (id)objc_claimAutoreleasedReturnValue();
      id v30 = [v191 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v134 errorType:@"MCFatalError"];
      goto LABEL_139;
    }
    if (SHIDWORD(v249) >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_SINGLE_APP_P_ID", v199, v200, v201, v202, v203, v204, v205, v39);
      goto LABEL_152;
    }
    if ((int)v249 >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_HOME_SCREEN_LAYOUT_P_ID", v206, v207, v208, v209, v210, v211, v212, v39);
      goto LABEL_152;
    }
    if (SHIDWORD(v247) >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_NOTIFICATION_SETTINGS_P_ID", v213, v214, v215, v216, v217, v218, v219, v39);
      goto LABEL_152;
    }
    if ((int)v247 >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_SHARED_DEVICE_CONFIGURATIONS_P_ID", v220, v221, v222, v223, v224, v225, v226, v39);
      goto LABEL_152;
    }
    if (SHIDWORD(v241) >= 2)
    {
      v119 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_CONFERENCE_ROOM_DISPLAY_P_ID", v227, v228, v229, v230, v231, v232, v233, v39);
      v127 = LABEL_86:;
      id v30 = [v119 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v127 errorType:@"MCFatalError"];

      id v12 = v243;
      id v13 = v246;
      goto LABEL_32;
    }
    id v12 = v243;
    id v13 = v246;
    v110 = v251;
    if ((int)v241 >= 2)
    {
      v191 = (void *)MEMORY[0x1E4F28C58];
      id v39 = [(MCProfile *)v251 friendlyName];
      MCErrorArray(@"ERROR_PROFILE_TOO_MANY_AIRPLAY_SECURITY_P_ID", v234, v235, v236, v237, v238, v239, v240, v39);
      goto LABEL_152;
    }
LABEL_88:
    if ([v12 count])
    {
      v128 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v129 = v128;
        v130 = [(MCProfile *)v110 friendlyName];
        *(_DWORD *)buf = 138543618;
        v284 = v130;
        __int16 v285 = 2114;
        id v286 = v12;
        _os_log_impl(&dword_1A13F0000, v129, OS_LOG_TYPE_INFO, "Profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);
      }
    }
    id v39 = [MEMORY[0x1E4F1CA48] arrayWithArray:v110->_payloads];
    v131 = +[MCDependencyReader sharedReader];
    v132 = [(MCProfile *)v110 identifier];
    v133 = [v131 dependentsOfParent:v132 inDomain:@"ManagingProfileToManagedProfile"];

    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    id v134 = v133;
    uint64_t v135 = [v134 countByEnumeratingWithState:&v262 objects:v282 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = *(void *)v263;
      do
      {
        for (uint64_t k = 0; k != v136; ++k)
        {
          if (*(void *)v263 != v137) {
            objc_enumerationMutation(v134);
          }
          v139 = +[MCManifest installedProfileWithIdentifier:*(void *)(*((void *)&v262 + 1) + 8 * k)];
          v140 = [v139 payloads];
          [v39 addObjectsFromArray:v140];
        }
        uint64_t v136 = [v134 countByEnumeratingWithState:&v262 objects:v282 count:16];
      }
      while (v136);
    }

    uint64_t v141 = [(MCConfigurationProfile *)v251 _sortPayloads:v39];
    managedPayloads = v251->_managedPayloads;
    v251->_managedPayloads = (NSArray *)v141;

    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    v143 = v251->_payloads;
    uint64_t v144 = [(NSArray *)v143 countByEnumeratingWithState:&v258 objects:v281 count:16];
    if (v144)
    {
      uint64_t v145 = v144;
      uint64_t v146 = *(void *)v259;
LABEL_100:
      uint64_t v147 = 0;
      while (1)
      {
        if (*(void *)v259 != v146) {
          objc_enumerationMutation(v143);
        }
        v148 = *(void **)(*((void *)&v258 + 1) + 8 * v147);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v145 == ++v147)
        {
          uint64_t v145 = [(NSArray *)v143 countByEnumeratingWithState:&v258 objects:v281 count:16];
          if (v145) {
            goto LABEL_100;
          }
          goto LABEL_106;
        }
      }
      p_isa = (id *)&v251->super.super.isa;
      v251->_isMDMProfile = 1;
      char v167 = [v148 isUserEnrollment];

      if (v167) {
        goto LABEL_118;
      }
    }
    else
    {
LABEL_106:

      p_isa = (id *)&v251->super.super.isa;
    }
    v168 = [p_isa installOptions];
    v169 = [v168 objectForKeyedSubscript:@"isRMUserEnrollment"];
    if ([v169 BOOLValue])
    {
    }
    else
    {
      v170 = [p_isa installOptions];
      v171 = [v170 objectForKeyedSubscript:@"isInstalledByMDM"];
      if (![v171 BOOLValue])
      {

        id v30 = 0;
LABEL_138:
        id v13 = v246;

LABEL_139:
        goto LABEL_32;
      }
      int v172 = [MEMORY[0x1E4F73170] isUserEnrollmentDisregardingIdentityPresence];

      p_isa = (id *)&v251->super.super.isa;
      if (!v172)
      {
        id v30 = 0;
        id v13 = v246;
        goto LABEL_139;
      }
    }
LABEL_118:
    v168 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(p_isa[22], "count"));
    long long v254 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    id v173 = p_isa[22];
    uint64_t v174 = [v173 countByEnumeratingWithState:&v254 objects:v280 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      id v244 = v12;
      uint64_t v176 = *(void *)v255;
      while (2)
      {
        for (uint64_t m = 0; m != v175; ++m)
        {
          if (*(void *)v255 != v176) {
            objc_enumerationMutation(v173);
          }
          v178 = *(void **)(*((void *)&v254 + 1) + 8 * m);
          id v253 = 0;
          v179 = [v178 filterForUserEnrollmentOutError:&v253];
          id v180 = v253;
          if (v180)
          {
            id v30 = v180;

            goto LABEL_131;
          }
          if (v179) {
            v181 = v179;
          }
          else {
            v181 = v178;
          }
          [v168 addObject:v181];
        }
        uint64_t v175 = [v173 countByEnumeratingWithState:&v254 objects:v280 count:16];
        if (v175) {
          continue;
        }
        break;
      }
      id v30 = 0;
LABEL_131:
      id v12 = v244;
    }
    else
    {
      id v30 = 0;
    }

    uint64_t v190 = [MEMORY[0x1E4F1C978] arrayWithArray:v168];
    v169 = v251->_payloads;
    v251->_payloads = (NSArray *)v190;
    goto LABEL_138;
  }
  v159 = (void *)MEMORY[0x1E4F28C58];
  id v39 = [(MCProfile *)v251 friendlyName];
  MCErrorArray(@"ERROR_PROFILE_TOO_MANY_APN_P_ID", v160, v161, v162, v163, v164, v165, v166, v39);
  v189 = LABEL_134:;
  id v30 = [v159 MCErrorWithDomain:@"MCProfileErrorDomain" code:1000 descriptionArray:v189 errorType:@"MCFatalError"];

LABEL_135:
  id v12 = v243;
LABEL_32:
  long long v17 = v248;
LABEL_33:

  a7 = v250;
  long long v15 = v251;
  if (!v30) {
    goto LABEL_39;
  }
LABEL_34:
  v76 = (void *)[v30 MCCopyAsPrimaryError];
  v77 = [(MCProfile *)v15 malformedProfileErrorWithError:v76];

  if (a7) {
    *a7 = v77;
  }
  v78 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v79 = v78;
    v80 = [v77 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v284 = v15;
    __int16 v285 = 2114;
    id v286 = v80;
    _os_log_impl(&dword_1A13F0000, v79, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse profile: %{public}@", buf, 0x16u);
  }
  v81 = 0;
LABEL_40:

  return v81;
}

- (BOOL)isManagedByMDM
{
  if (self->_isMDMProfile) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)MCConfigurationProfile;
  return [(MCProfile *)&v3 isManagedByMDM];
}

- (BOOL)isManagedByProfileService
{
  return self->_OTAProfile != 0;
}

- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_payloads;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) installationWarnings];
        if ([v11 count]) {
          [v5 addObjectsFromArray:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v14.receiver = self;
  v14.super_class = (Class)MCConfigurationProfile;
  id v12 = [(MCProfile *)&v14 installationWarningsIncludeUnsignedProfileWarning:v3];
  [v5 addObjectsFromArray:v12];

  return v5;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MCConfigurationProfile;
  BOOL v3 = [(MCProfile *)&v16 description];
  id v4 = (void *)[v3 mutableCopy];

  if ([(NSArray *)self->_payloads count])
  {
    [v4 appendFormat:@"\nPayloads:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_payloads;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
          [v4 appendFormat:@"%@\n", v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  if (self->_isCloudProfile) {
    [v4 appendFormat:@"Is could profile: Yes"];
  }
  if (self->_isCloudLocked) {
    [v4 appendFormat:@"Is cloud locked : Yes"];
  }
  if (self->_OTAProfile) {
    [v4 appendFormat:@"OTA profile: %@\n", self->_OTAProfile];
  }
  return v4;
}

- (id)verboseDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MCConfigurationProfile;
  BOOL v3 = [(MCProfile *)&v16 verboseDescription];
  id v4 = (void *)[v3 mutableCopy];

  if ([(NSArray *)self->_payloads count])
  {
    [v4 appendFormat:@"\nPayloads:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_payloads;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) verboseDescription];
          [v4 appendFormat:@"%@\n", v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  if (self->_isCloudProfile) {
    [v4 appendFormat:@"Is could profile: Yes"];
  }
  if (self->_isCloudLocked) {
    [v4 appendFormat:@"Is cloud locked : Yes"];
  }
  if (self->_OTAProfile) {
    [v4 appendFormat:@"OTA profile: %@\n", self->_OTAProfile];
  }
  return v4;
}

- (id)serializedDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)MCConfigurationProfile;
  BOOL v3 = [(MCProfile *)&v19 serializedDictionary];
  id v4 = (void *)[v3 mutableCopy];

  if ([(NSArray *)self->_payloads count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_payloads, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->_payloads;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "serializedDictionary", (void)v15);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    [v4 setObject:v5 forKeyedSubscript:@"Payloads"];
  }
  if (self->_isCloudProfile) {
    [v4 setObject:&unk_1EF4D07F0 forKeyedSubscript:@"Cloud Profile"];
  }
  if (self->_isCloudLocked) {
    [v4 setObject:&unk_1EF4D07F0 forKeyedSubscript:@"Cloud Locked"];
  }
  OTAProfile = self->_OTAProfile;
  if (OTAProfile)
  {
    long long v13 = [(MCProfileServiceProfile *)OTAProfile serializedDictionary];
    [v4 setObject:v13 forKeyedSubscript:@"OTA Profile"];
  }
  return v4;
}

- (id)stubDictionary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)MCConfigurationProfile;
  BOOL v3 = [(MCProfile *)&v20 stubDictionary];
  [v3 setObject:@"Configuration" forKeyedSubscript:@"PayloadType"];
  id v4 = [(MCConfigurationProfile *)self isCloudProfileNum];
  [v3 setObject:v4 forKeyedSubscript:@"IsCloudProfile"];

  uint64_t v5 = [(MCConfigurationProfile *)self isCloudLockedNum];
  [v3 setObject:v5 forKeyedSubscript:@"IsCloudLocked"];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_payloads, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = self->_payloads;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stubDictionary", (void)v16);
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKey:@"PayloadContent"];
  OTAProfile = self->_OTAProfile;
  if (OTAProfile)
  {
    long long v14 = [(MCProfileServiceProfile *)OTAProfile stubDictionary];
    [v3 setObject:v14 forKey:@"OTAProfileStub"];
  }
  return v3;
}

- (id)_localizedPayloadSummaryByType:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  uint64_t v7 = v5;
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v8 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v5);
      }
      uint64_t v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        if (v10 == (void *)v13)
        {
          ++v9;
        }
        else
        {
          if (v10 && v9)
          {
            long long v14 = objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9, v16);
            [v4 addObject:v14];
          }
          uint64_t v9 = 1;
          uint64_t v10 = (void *)v13;
        }
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);

  if (v10 && v9)
  {
    uint64_t v7 = [v10 localizedDescriptionForPayloadCount:v9];
    [v4 addObject:v7];
LABEL_18:
  }
  return v4;
}

- (id)localizedPayloadSummaryByType
{
  id v3 = [(MCConfigurationProfile *)self payloads];
  id v4 = [(MCConfigurationProfile *)self _localizedPayloadSummaryByType:v3];

  return v4;
}

- (id)localizedManagedPayloadSummaryByType
{
  id v3 = [(MCConfigurationProfile *)self managedPayloads];
  id v4 = [(MCConfigurationProfile *)self _localizedPayloadSummaryByType:v3];

  return v4;
}

- (id)localizedManagedProfileConsentTexts
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)MCConfigurationProfile;
  id v3 = [(MCProfile *)&v24 localizedManagedProfileConsentTexts];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = +[MCDependencyReader sharedReader];
  uint64_t v6 = [(MCProfile *)self identifier];
  uint64_t v7 = [v5 dependentsOfParent:v6 inDomain:@"ManagingProfileToManagedProfile"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = [(MCProfile *)self identifier];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          long long v16 = +[MCManifest installedProfileWithIdentifier:v13];
          long long v17 = [v16 localizedManagedProfileConsentTexts];
          [v4 addEntriesFromDictionary:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v4 copy];
  return v18;
}

- (id)earliestCertificateExpiryDate
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  long long v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  objc_super v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_payloads;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 expiry];
          uint64_t v10 = [v8 SMIMEEmailAddress];
          if (v10)
          {
            uint64_t v11 = [v3 objectForKeyedSubscript:v10];
            if (!v11 || ([v9 timeIntervalSinceDate:v11], v12 > 0.0)) {
              [v3 setObject:v9 forKeyedSubscript:v10];
            }
          }
          else
          {
            [v9 timeIntervalSinceDate:v22[5]];
            if (v13 < 0.0)
            {
              objc_storeStrong(v22 + 5, v9);
              *((unsigned char *)v28 + 24) = 1;
            }
          }
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v5);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__MCConfigurationProfile_earliestCertificateExpiryDate__block_invoke;
  v16[3] = &unk_1E5A67A10;
  v16[4] = &v21;
  v16[5] = &v27;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];
  if (*((unsigned char *)v28 + 24)) {
    id v14 = v22[5];
  }
  else {
    id v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v14;
}

void __55__MCConfigurationProfile_earliestCertificateExpiryDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  if (v5 < 0.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)replacePayloadWithUUID:(id)a3 withPayload:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[(NSArray *)self->_payloads mutableCopy];
  if ([v7 count])
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    while (1)
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:v8];
      uint64_t v11 = [v10 UUID];
      int v12 = [v11 isEqualToString:v16];

      if (v12) {
        break;
      }
      uint64_t v8 = v9;
      if ([v7 count] <= (unint64_t)v9++) {
        goto LABEL_7;
      }
    }
    [v7 setObject:v6 atIndexedSubscript:v8];
  }
LABEL_7:
  id v14 = (NSArray *)[v7 copy];
  payloads = self->_payloads;
  self->_payloads = v14;
}

- (MCProfileServiceProfile)OTAProfile
{
  return self->_OTAProfile;
}

- (void)setOTAProfile:(id)a3
{
}

- (BOOL)isCloudProfile
{
  return self->_isCloudProfile;
}

- (void)setIsCloudProfile:(BOOL)a3
{
  self->_isCloudProfile = a3;
}

- (BOOL)isCloudLocked
{
  return self->_isCloudLocked;
}

- (void)setIsCloudLocked:(BOOL)a3
{
  self->_isCloudLocked = a3;
}

- (BOOL)isMDMProfile
{
  return self->_isMDMProfile;
}

- (void)setIsMDMProfile:(BOOL)a3
{
  self->_isMDMProfile = a3;
}

- (NSNumber)isCloudProfileNum
{
  return self->_isCloudProfileNum;
}

- (void)setIsCloudProfileNum:(id)a3
{
}

- (NSNumber)isCloudLockedNum
{
  return self->_isCloudLockedNum;
}

- (void)setIsCloudLockedNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCloudLockedNum, 0);
  objc_storeStrong((id *)&self->_isCloudProfileNum, 0);
  objc_storeStrong((id *)&self->_OTAProfile, 0);
  objc_storeStrong((id *)&self->_managedPayloads, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
}

@end