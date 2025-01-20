@interface MCMDMPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)checkOutWhenRemoved;
- (BOOL)isUserEnrollment;
- (BOOL)pinningRevocationCheckRequired;
- (BOOL)signMessage;
- (BOOL)supportUserChannel;
- (BOOL)useDevelopmentAPNS;
- (MCMDMPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)checkInPinningPersistentRefs;
- (NSArray)checkInPinningUUIDs;
- (NSArray)localizedAccessRightDescriptions;
- (NSArray)serverCapabilities;
- (NSArray)serverPinningPersistentRefs;
- (NSArray)serverPinningUUIDs;
- (NSData)identityPersistentID;
- (NSNumber)checkOutWhenRemovedNum;
- (NSNumber)pollingIntervalMinutes;
- (NSNumber)requiredAppIDForMDM;
- (NSNumber)signMessageNum;
- (NSNumber)useDevelopmentAPNSNum;
- (NSString)assignedManagedAppleID;
- (NSString)checkInURLString;
- (NSString)easEnrollmentID;
- (NSString)enrollmentID;
- (NSString)enrollmentMode;
- (NSString)iCloudEnrollmentID;
- (NSString)identityUUID;
- (NSString)managedAppleID;
- (NSString)managedAppleIDName;
- (NSString)personaID;
- (NSString)serverURLString;
- (NSString)topic;
- (id)_invalidRightsError;
- (id)_invalidTopicError;
- (id)_nonHTTPSURLErrorForField:(id)a3;
- (id)installationWarnings;
- (id)kvsForCertUUIDs:(id)a3 persistentRefs:(id)a4 labelKey:(id)a5;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)verboseDescription;
- (unint64_t)accessRights;
- (void)setCheckInPinningPersistentRefs:(id)a3;
- (void)setEasEnrollmentID:(id)a3;
- (void)setEnrollmentID:(id)a3;
- (void)setICloudEnrollmentID:(id)a3;
- (void)setIdentityPersistentID:(id)a3;
- (void)setIsUserEnrollment:(BOOL)a3;
- (void)setPersonaID:(id)a3;
- (void)setRequiredAppIDForMDM:(id)a3;
- (void)setServerPinningPersistentRefs:(id)a3;
@end

@implementation MCMDMPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.mdm"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"MDM_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"MDM_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)_invalidRightsError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = [(MCPayload *)self friendlyName];
  v11 = MCErrorArray(@"MDM_ERROR_INVALID_RIGHTS_P_NAME", v4, v5, v6, v7, v8, v9, v10, v3);
  v12 = [v2 MCErrorWithDomain:@"MCMDMErrorDomain" code:12000 descriptionArray:v11 errorType:@"MCFatalError"];

  return v12;
}

- (id)_invalidTopicError
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = [(MCPayload *)self friendlyName];
  v11 = MCErrorArray(@"MDM_ERROR_INVALID_TOPIC_P_NAME", v4, v5, v6, v7, v8, v9, v10, v3);
  v12 = [v2 MCErrorWithDomain:@"MCMDMErrorDomain" code:12022 descriptionArray:v11 errorType:@"MCFatalError"];

  return v12;
}

- (id)_nonHTTPSURLErrorForField:(id)a3
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = MCErrorArray(@"MDM_ERROR_FIELD_NOT_HTTPS_P_FIELD", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  uint64_t v10 = [v8 MCErrorWithDomain:@"MCMDMErrorDomain" code:12034 descriptionArray:v9 errorType:@"MCFatalError"];

  return v10;
}

- (MCMDMPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v173.receiver = self;
  v173.super_class = (Class)MCMDMPayload;
  uint64_t v10 = [(MCPayload *)&v173 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *MEMORY[0x1E4F732C0];
      id v172 = 0;
      uint64_t v13 = [v8 MCValidateAndRemoveObjectOfClass:v11 withKey:v12 isRequired:0 outError:&v172];
      id v14 = v172;
      identityPersistentID = v10->_identityPersistentID;
      v10->_identityPersistentID = (NSData *)v13;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v16 = *MEMORY[0x1E4F73320];
      id v171 = 0;
      uint64_t v17 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v16 isRequired:0 outError:&v171];
      id v14 = v171;
      serverURLString = v10->_serverURLString;
      v10->_serverURLString = (NSString *)v17;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = *MEMORY[0x1E4F73310];
      id v170 = 0;
      uint64_t v21 = [v8 MCValidateAndRemoveArrayOfClass:v19 withKey:v20 isRequired:0 outError:&v170];
      id v14 = v170;
      serverPinningPersistentRefs = v10->_serverPinningPersistentRefs;
      v10->_serverPinningPersistentRefs = (NSArray *)v21;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = *MEMORY[0x1E4F73260];
      id v169 = 0;
      uint64_t v25 = [v8 MCValidateAndRemoveArrayOfClass:v23 withKey:v24 isRequired:0 outError:&v169];
      id v14 = v169;
      checkInPinningPersistentRefs = v10->_checkInPinningPersistentRefs;
      v10->_checkInPinningPersistentRefs = (NSArray *)v25;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = *MEMORY[0x1E4F732F8];
      id v168 = 0;
      uint64_t v29 = [v8 MCValidateAndRemoveObjectOfClass:v27 withKey:v28 isRequired:0 outError:&v168];
      id v14 = v168;
      pollingIntervalMinutes = v10->_pollingIntervalMinutes;
      v10->_pollingIntervalMinutes = (NSNumber *)v29;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v31 = *MEMORY[0x1E4F73338];
      id v167 = 0;
      uint64_t v32 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v31 isRequired:0 outError:&v167];
      id v14 = v167;
      topic = v10->_topic;
      v10->_topic = (NSString *)v32;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = *MEMORY[0x1E4F73300];
      id v166 = 0;
      uint64_t v36 = [v8 MCValidateAndRemoveObjectOfClass:v34 withKey:v35 isRequired:0 outError:&v166];
      id v14 = v166;
      requiredAppIDForMDM = v10->_requiredAppIDForMDM;
      v10->_requiredAppIDForMDM = (NSNumber *)v36;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = *MEMORY[0x1E4F73358];
      id v165 = 0;
      id v14 = [v8 MCValidateAndRemoveObjectOfClass:v38 withKey:v39 isRequired:0 outError:&v165];
      id v40 = v165;
      v10->_isUserEnrollment = [v14 BOOLValue];
      if (v40) {
        goto LABEL_46;
      }
      uint64_t v41 = *MEMORY[0x1E4F732A0];
      id v164 = 0;
      uint64_t v136 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v41 isRequired:0 outError:&v164];
      id v40 = v164;
      enrollmentMode = v10->_enrollmentMode;
      v10->_enrollmentMode = (NSString *)v136;

      if (v40) {
        goto LABEL_46;
      }
      uint64_t v43 = *MEMORY[0x1E4F732E8];
      id v163 = 0;
      uint64_t v137 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v43 isRequired:0 outError:&v163];
      id v40 = v163;
      personaID = v10->_personaID;
      v10->_personaID = (NSString *)v137;

      if (v40) {
        goto LABEL_46;
      }
      uint64_t v45 = *MEMORY[0x1E4F73288];
      id v162 = 0;
      uint64_t v138 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v45 isRequired:0 outError:&v162];
      id v40 = v162;
      enrollmentID = v10->_enrollmentID;
      v10->_enrollmentID = (NSString *)v138;

      if (v40) {
        goto LABEL_46;
      }
      uint64_t v47 = *MEMORY[0x1E4F73360];
      id v161 = 0;
      uint64_t v139 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v47 isRequired:0 outError:&v161];
      id v40 = v161;
      iCloudEnrollmentID = v10->_iCloudEnrollmentID;
      v10->_iCloudEnrollmentID = (NSString *)v139;

      if (v40) {
        goto LABEL_46;
      }
      uint64_t v49 = *MEMORY[0x1E4F73280];
      id v160 = 0;
      uint64_t v140 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v49 isRequired:0 outError:&v160];
      id v40 = v160;
      easEnrollmentID = v10->_easEnrollmentID;
      v10->_easEnrollmentID = (NSString *)v140;

      if (v40) {
        goto LABEL_46;
      }
      if (!v10->_isUserEnrollment)
      {
        uint64_t v114 = objc_opt_class();
        uint64_t v115 = *MEMORY[0x1E4F73250];
        id v159 = 0;
        v116 = [v8 MCValidateAndRemoveObjectOfClass:v114 withKey:v115 isRequired:0 outError:&v159];
        id v141 = v159;
        if (v141)
        {

          id v40 = v141;
          goto LABEL_46;
        }
        v10->_unint64_t accessRights = [v116 unsignedIntValue];
      }
    }
    else
    {
      uint64_t v51 = *MEMORY[0x1E4F732B8];
      id v158 = 0;
      uint64_t v52 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v51 isRequired:1 outError:&v158];
      id v14 = v158;
      identityUUID = v10->_identityUUID;
      v10->_identityUUID = (NSString *)v52;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v16 = *MEMORY[0x1E4F73320];
      id v157 = 0;
      uint64_t v54 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v16 isRequired:1 outError:&v157];
      id v14 = v157;
      v55 = v10->_serverURLString;
      v10->_serverURLString = (NSString *)v54;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v56 = objc_opt_class();
      uint64_t v57 = *MEMORY[0x1E4F73318];
      id v156 = 0;
      uint64_t v58 = [v8 MCValidateAndRemoveArrayOfClass:v56 withKey:v57 isRequired:0 outError:&v156];
      id v14 = v156;
      serverPinningUUIDs = v10->_serverPinningUUIDs;
      v10->_serverPinningUUIDs = (NSArray *)v58;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v60 = objc_opt_class();
      uint64_t v61 = *MEMORY[0x1E4F73268];
      id v155 = 0;
      uint64_t v62 = [v8 MCValidateAndRemoveArrayOfClass:v60 withKey:v61 isRequired:0 outError:&v155];
      id v63 = v155;
      checkInPinningUUIDs = v10->_checkInPinningUUIDs;
      v10->_checkInPinningUUIDs = (NSArray *)v62;

      uint64_t v65 = objc_opt_class();
      uint64_t v66 = *MEMORY[0x1E4F732F8];
      id v154 = v63;
      uint64_t v67 = [v8 MCValidateAndRemoveObjectOfClass:v65 withKey:v66 isRequired:0 outError:&v154];
      id v14 = v154;

      v68 = v10->_pollingIntervalMinutes;
      v10->_pollingIntervalMinutes = (NSNumber *)v67;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v69 = *MEMORY[0x1E4F73338];
      id v153 = 0;
      uint64_t v70 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v69 isRequired:0 outError:&v153];
      id v14 = v153;
      v71 = v10->_topic;
      v10->_topic = (NSString *)v70;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v72 = *MEMORY[0x1E4F732C8];
      id v152 = 0;
      uint64_t v73 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v72 isRequired:0 outError:&v152];
      id v14 = v152;
      managedAppleID = v10->_managedAppleID;
      v10->_managedAppleID = (NSString *)v73;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v75 = *MEMORY[0x1E4F73258];
      id v151 = 0;
      uint64_t v76 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v75 isRequired:0 outError:&v151];
      id v14 = v151;
      assignedManagedAppleID = v10->_assignedManagedAppleID;
      v10->_assignedManagedAppleID = (NSString *)v76;

      if (v14) {
        goto LABEL_47;
      }
      uint64_t v78 = *MEMORY[0x1E4F732A0];
      id v150 = 0;
      uint64_t v79 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:v78 isRequired:0 outError:&v150];
      id v14 = v150;
      v80 = v10->_enrollmentMode;
      v10->_enrollmentMode = (NSString *)v79;

      if (v14) {
        goto LABEL_47;
      }
      if (v10->_managedAppleID
        || [(NSString *)v10->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73298]])
      {
        v10->_isUserEnrollment = 1;
      }
      if (!v10->_managedAppleID
        && ([(NSString *)v10->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73298]]
         || [(NSString *)v10->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73290]]))
      {
        uint64_t v100 = objc_opt_class();
        uint64_t v101 = *MEMORY[0x1E4F73300];
        id v149 = 0;
        uint64_t v102 = [v8 MCValidateAndRemoveObjectOfClass:v100 withKey:v101 isRequired:0 outError:&v149];
        id v14 = v149;
        v103 = v10->_requiredAppIDForMDM;
        v10->_requiredAppIDForMDM = (NSNumber *)v102;

        if (v14) {
          goto LABEL_47;
        }
      }
      if (v10->_isUserEnrollment)
      {
LABEL_31:
        uint64_t v81 = objc_opt_class();
        uint64_t v82 = *MEMORY[0x1E4F73348];
        id v147 = 0;
        uint64_t v83 = [v8 MCValidateAndRemoveObjectOfClass:v81 withKey:v82 isRequired:0 outError:&v147];
        id v14 = v147;
        useDevelopmentAPNSNum = v10->_useDevelopmentAPNSNum;
        v10->_useDevelopmentAPNSNum = (NSNumber *)v83;

        if (v14)
        {
LABEL_47:
          v106 = (void *)[v14 MCCopyAsPrimaryError];
          v107 = [(MCPayload *)v10 malformedPayloadErrorWithError:v106];

          if (a5) {
            *a5 = v107;
          }
          v108 = (void *)_MCLogObjects;
          if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
            v109 = v108;
            v110 = objc_opt_class();
            id v111 = v110;
            v112 = [v107 MCVerboseDescription];
            *(_DWORD *)buf = 138543618;
            v175 = v110;
            __int16 v176 = 2114;
            id v177 = v112;
            _os_log_impl(&dword_1A13F0000, v109, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
          }
          uint64_t v10 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v10->_useDevelopmentAPNS = [(NSNumber *)v10->_useDevelopmentAPNSNum BOOLValue];
        uint64_t v85 = objc_opt_class();
        uint64_t v86 = *MEMORY[0x1E4F732F0];
        id v146 = 0;
        id v14 = [v8 MCValidateAndRemoveObjectOfClass:v85 withKey:v86 isRequired:0 outError:&v146];
        id v87 = v146;
        if (!v87)
        {
          v10->_pinningRevocationCheckRequired = [v14 BOOLValue];
          uint64_t v88 = objc_opt_class();
          uint64_t v89 = *MEMORY[0x1E4F73330];
          id v145 = 0;
          uint64_t v132 = [v8 MCValidateAndRemoveObjectOfClass:v88 withKey:v89 isRequired:0 outError:&v145];
          id v40 = v145;
          signMessageNum = v10->_signMessageNum;
          v10->_signMessageNum = (NSNumber *)v132;

          if (v40) {
            goto LABEL_46;
          }
          v10->_signMessage = [(NSNumber *)v10->_signMessageNum BOOLValue];
          uint64_t v91 = objc_opt_class();
          uint64_t v92 = *MEMORY[0x1E4F73278];
          id v144 = 0;
          uint64_t v133 = [v8 MCValidateAndRemoveObjectOfClass:v91 withKey:v92 isRequired:0 outError:&v144];
          id v40 = v144;
          checkOutWhenRemovedNum = v10->_checkOutWhenRemovedNum;
          v10->_checkOutWhenRemovedNum = (NSNumber *)v133;

          if (v40) {
            goto LABEL_46;
          }
          v10->_checkOutWhenRemoved = [(NSNumber *)v10->_checkOutWhenRemovedNum BOOLValue];
          uint64_t v94 = *MEMORY[0x1E4F73270];
          v143[1] = 0;
          uint64_t v131 = v94;
          uint64_t v134 = objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:");
          id v40 = 0;
          checkInURLString = v10->_checkInURLString;
          p_checkInURLString = &v10->_checkInURLString;
          v10->_checkInURLString = (NSString *)v134;

          if (v40) {
            goto LABEL_46;
          }
          if (!*p_checkInURLString) {
            objc_storeStrong((id *)&v10->_checkInURLString, v10->_serverURLString);
          }
          uint64_t v97 = objc_opt_class();
          uint64_t v98 = *MEMORY[0x1E4F73308];
          v143[0] = 0;
          uint64_t v135 = [v8 MCValidateAndRemoveArrayOfClass:v97 withKey:v98 isRequired:0 outError:v143];
          id v40 = v143[0];
          serverCapabilities = v10->_serverCapabilities;
          v10->_serverCapabilities = (NSArray *)v135;

          if (v40) {
            goto LABEL_46;
          }
          if ([v9 isStub])
          {
LABEL_62:
            if ([v8 count])
            {
              v117 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
              {
                v118 = v117;
                v119 = [(MCPayload *)v10 friendlyName];
                *(_DWORD *)buf = 138543618;
                v175 = v119;
                __int16 v176 = 2114;
                id v177 = v8;
                _os_log_impl(&dword_1A13F0000, v118, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);
              }
            }
            goto LABEL_52;
          }
          if (![(MCMDMPayload *)v10 isUserEnrollment])
          {
            unint64_t accessRights = v10->_accessRights;
            if (!accessRights
              || (v10->_accessRights & 3) == 2
              || accessRights >> 13
              || (v10->_accessRights & 0xC0) == 0x80)
            {
              goto LABEL_77;
            }
          }
          v120 = v10->_topic;
          if (v120)
          {
            if ([(NSString *)v120 rangeOfString:@"com.apple.mdm.limited." options:8] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ([(NSString *)v10->_topic rangeOfString:@"com.apple.mgmt." options:8] == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v121 = [(MCMDMPayload *)v10 _invalidTopicError];
                goto LABEL_83;
              }
            }
            else if ((v10->_accessRights & 0xC) != 0)
            {
LABEL_77:
              uint64_t v121 = [(MCMDMPayload *)v10 _invalidRightsError];
              goto LABEL_83;
            }
          }
          v123 = [MEMORY[0x1E4F1CB10] URLWithString:v10->_serverURLString];
          v124 = [v123 scheme];
          char v142 = [v124 isEqualToString:@"https"];

          if (v142)
          {
            v125 = [MEMORY[0x1E4F1CB10] URLWithString:*p_checkInURLString];
            v126 = [v125 scheme];
            char v127 = [v126 isEqualToString:@"https"];

            if (v127) {
              goto LABEL_62;
            }
            v128 = v10;
            uint64_t v129 = v131;
          }
          else
          {
            v128 = v10;
            uint64_t v129 = v16;
          }
          uint64_t v121 = [(MCMDMPayload *)v128 _nonHTTPSURLErrorForField:v129];
LABEL_83:
          v130 = (void *)v121;

          id v14 = v130;
          if (!v130) {
            goto LABEL_53;
          }
          goto LABEL_47;
        }
        goto LABEL_45;
      }
      uint64_t v104 = objc_opt_class();
      uint64_t v105 = *MEMORY[0x1E4F73250];
      id v148 = 0;
      id v14 = [v8 MCValidateAndRemoveObjectOfClass:v104 withKey:v105 isRequired:0 outError:&v148];
      id v87 = v148;
      if (v87
        || v14
        && [(NSString *)v10->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73298]]
        && ([(MCMDMPayload *)v10 _invalidRightsError],
            (id v87 = (id)objc_claimAutoreleasedReturnValue()) != 0))
      {
LABEL_45:
        id v40 = v87;
LABEL_46:

        id v14 = v40;
        goto LABEL_47;
      }
      v10->_unint64_t accessRights = [v14 unsignedIntValue];
    }

    goto LABEL_31;
  }
LABEL_53:

  return v10;
}

- (id)stubDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)MCMDMPayload;
  uint64_t v3 = [(MCPayload *)&v11 stubDictionary];
  [v3 MCSetObjectIfNotNil:self->_identityPersistentID forKey:*MEMORY[0x1E4F732C0]];
  [v3 MCSetObjectIfNotNil:self->_serverURLString forKey:*MEMORY[0x1E4F73320]];
  [v3 MCSetObjectIfNotNil:self->_serverPinningPersistentRefs forKey:*MEMORY[0x1E4F73310]];
  [v3 MCSetObjectIfNotNil:self->_checkInURLString forKey:*MEMORY[0x1E4F73270]];
  [v3 MCSetObjectIfNotNil:self->_checkInPinningPersistentRefs forKey:*MEMORY[0x1E4F73260]];
  [v3 MCSetObjectIfNotNil:self->_topic forKey:*MEMORY[0x1E4F73338]];
  [v3 MCSetObjectIfNotNil:self->_pollingIntervalMinutes forKey:*MEMORY[0x1E4F732F8]];
  [v3 MCSetObjectIfNotNil:self->_serverCapabilities forKey:*MEMORY[0x1E4F73308]];
  [v3 MCSetObjectIfNotNil:self->_personaID forKey:*MEMORY[0x1E4F732E8]];
  [v3 MCSetObjectIfNotNil:self->_enrollmentID forKey:*MEMORY[0x1E4F73288]];
  [v3 MCSetObjectIfNotNil:self->_iCloudEnrollmentID forKey:*MEMORY[0x1E4F73360]];
  [v3 MCSetObjectIfNotNil:self->_easEnrollmentID forKey:*MEMORY[0x1E4F73280]];
  [v3 MCSetObjectIfNotNil:self->_requiredAppIDForMDM forKey:*MEMORY[0x1E4F73300]];
  [v3 MCSetObjectIfNotNil:self->_enrollmentMode forKey:*MEMORY[0x1E4F732A0]];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_accessRights];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F73250]];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_useDevelopmentAPNS];
  [v3 setObject:v5 forKey:*MEMORY[0x1E4F73348]];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_checkOutWhenRemoved];
  [v3 setObject:v6 forKey:*MEMORY[0x1E4F73278]];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_signMessage];
  [v3 setObject:v7 forKey:*MEMORY[0x1E4F73330]];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_pinningRevocationCheckRequired];
  [v3 setObject:v8 forKey:*MEMORY[0x1E4F732F0]];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isUserEnrollment];
  [v3 setObject:v9 forKey:*MEMORY[0x1E4F73358]];

  return v3;
}

- (id)verboseDescription
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v67.receiver = self;
  v67.super_class = (Class)MCMDMPayload;
  uint64_t v4 = [(MCPayload *)&v67 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  if (self->_identityUUID) {
    [v5 appendFormat:@"Cert UUID   : %@\n", self->_identityUUID];
  }
  identityPersistentID = self->_identityPersistentID;
  if (identityPersistentID)
  {
    uint64_t v7 = [(NSData *)identityPersistentID MCHexString];
    [v5 appendFormat:@"Persist ID  : %@\n", v7];
  }
  if (self->_topic) {
    [v5 appendFormat:@"Topic           : %@\n", self->_topic];
  }
  [v5 appendFormat:@"Polling Interval: %@\n", self->_pollingIntervalMinutes];
  if (self->_serverURLString) {
    [v5 appendFormat:@"Server URL      : %@\n", self->_serverURLString];
  }
  id v8 = MCStringForBool(self->_useDevelopmentAPNS);
  [v5 appendFormat:@"Dev APNS        : %@\n", v8];

  if (self->_checkInURLString) {
    [v5 appendFormat:@"Check-in URL    : %@\n", self->_checkInURLString];
  }
  [v5 appendFormat:@"Required App ID: %@\n", self->_requiredAppIDForMDM];
  id v9 = MCStringForBool(self->_signMessage);
  [v5 appendFormat:@"Sign message    : %@\n", v9];

  uint64_t v10 = MCStringForBool(self->_checkOutWhenRemoved);
  [v5 appendFormat:@"Check out       : %@\n", v10];

  if (self->_serverCapabilities) {
    [v5 appendFormat:@"Capabilities    : %@\n", self->_serverCapabilities];
  }
  serverPinningUUIDs = self->_serverPinningUUIDs;
  if (serverPinningUUIDs)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v12 = serverPinningUUIDs;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v64;
      char v16 = 1;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v64 != v15) {
            objc_enumerationMutation(v12);
          }
          if (v16) {
            v18 = @"Server Pinning UUIDs : %@\n";
          }
          else {
            v18 = @"                     : %@\n";
          }
          objc_msgSend(v5, "appendFormat:", v18, *(void *)(*((void *)&v63 + 1) + 8 * i));
          char v16 = 0;
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
        char v16 = 0;
      }
      while (v14);
    }
  }
  serverPinningPersistentRefs = self->_serverPinningPersistentRefs;
  if (serverPinningPersistentRefs)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v20 = serverPinningPersistentRefs;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v60;
      char v24 = 1;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = [*(id *)(*((void *)&v59 + 1) + 8 * j) MCHexString];
          uint64_t v27 = (void *)v26;
          if (v24) {
            uint64_t v28 = @"Server Pinning Refs  : %@\n";
          }
          else {
            uint64_t v28 = @"                     : %@\n";
          }
          objc_msgSend(v5, "appendFormat:", v28, v26);

          char v24 = 0;
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v59 objects:v70 count:16];
        char v24 = 0;
      }
      while (v22);
    }
  }
  checkInPinningUUIDs = self->_checkInPinningUUIDs;
  if (checkInPinningUUIDs)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v30 = checkInPinningUUIDs;
    uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v56;
      char v34 = 1;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v56 != v33) {
            objc_enumerationMutation(v30);
          }
          if (v34) {
            uint64_t v36 = @"CheckIn Pinning UUIDs: %@\n";
          }
          else {
            uint64_t v36 = @"                     : %@\n";
          }
          objc_msgSend(v5, "appendFormat:", v36, *(void *)(*((void *)&v55 + 1) + 8 * k));
          char v34 = 0;
        }
        uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v55 objects:v69 count:16];
        char v34 = 0;
      }
      while (v32);
    }
  }
  checkInPinningPersistentRefs = self->_checkInPinningPersistentRefs;
  if (checkInPinningPersistentRefs)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v38 = checkInPinningPersistentRefs;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v52;
      char v42 = 1;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v44 = [*(id *)(*((void *)&v51 + 1) + 8 * m) MCHexString];
          uint64_t v45 = (void *)v44;
          if (v42) {
            v46 = @"CheckIn Pinning Refs : %@\n";
          }
          else {
            v46 = @"                     : %@\n";
          }
          objc_msgSend(v5, "appendFormat:", v46, v44);

          char v42 = 0;
        }
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v51 objects:v68 count:16];
        char v42 = 0;
      }
      while (v40);
    }
  }
  uint64_t v47 = MCStringForBool(self->_pinningRevocationCheckRequired);
  [v5 appendFormat:@"Hard revocation check: %@\n", v47];

  [v5 appendFormat:@"Access Rights:\n"];
  unint64_t accessRights = self->_accessRights;
  if (accessRights)
  {
    [v5 appendFormat:@"  Profile Inspection\n"];
    unint64_t accessRights = self->_accessRights;
    if ((accessRights & 2) == 0)
    {
LABEL_63:
      if ((accessRights & 4) == 0) {
        goto LABEL_64;
      }
      goto LABEL_82;
    }
  }
  else if ((accessRights & 2) == 0)
  {
    goto LABEL_63;
  }
  [v5 appendFormat:@"  Profile Installation and removal\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 4) == 0)
  {
LABEL_64:
    if ((accessRights & 8) == 0) {
      goto LABEL_65;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v5 appendFormat:@"  Passcode change\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 8) == 0)
  {
LABEL_65:
    if ((accessRights & 0x10) == 0) {
      goto LABEL_66;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v5 appendFormat:@"  Device erase\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x10) == 0)
  {
LABEL_66:
    if ((accessRights & 0x20) == 0) {
      goto LABEL_67;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v5 appendFormat:@"  Device information\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x20) == 0)
  {
LABEL_67:
    if ((accessRights & 0x40) == 0) {
      goto LABEL_68;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v5 appendFormat:@"  Network information\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x40) == 0)
  {
LABEL_68:
    if ((accessRights & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v5 appendFormat:@"  Provisioning profile inspection\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x80) == 0)
  {
LABEL_69:
    if ((accessRights & 0x100) == 0) {
      goto LABEL_70;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v5 appendFormat:@"  Provisioning profile installation and removal\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x100) == 0)
  {
LABEL_70:
    if ((accessRights & 0x200) == 0) {
      goto LABEL_71;
    }
    goto LABEL_89;
  }
LABEL_88:
  [v5 appendFormat:@"  List installed applications\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x200) == 0)
  {
LABEL_71:
    if ((accessRights & 0x400) == 0) {
      goto LABEL_72;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v5 appendFormat:@"  Query restriction-related information\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x400) == 0)
  {
LABEL_72:
    if ((accessRights & 0x800) == 0) {
      goto LABEL_73;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v5 appendFormat:@"  Query security-related information\n"];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x800) == 0)
  {
LABEL_73:
    if ((accessRights & 0x1000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_91:
  [v5 appendFormat:@"  Apply settings\n"];
  if ((self->_accessRights & 0x1000) != 0) {
LABEL_74:
  }
    [v5 appendFormat:@"  Install apps\n"];
LABEL_75:
  if ([(MCMDMPayload *)self isUserEnrollment])
  {
    uint64_t v49 = [(MCMDMPayload *)self managedAppleIDName];
    [v5 appendFormat:@"MAID        : %@\n", v49];
  }
  return v5;
}

- (NSArray)localizedAccessRightDescriptions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 8) != 0)
  {
    uint64_t v7 = MCLocalizedString(@"MDM_ERASE");
    [v3 addObject:v7];

    unint64_t accessRights = self->_accessRights;
    if ((accessRights & 4) == 0)
    {
LABEL_3:
      if ((accessRights & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((accessRights & 4) == 0)
  {
    goto LABEL_3;
  }
  id v8 = MCLocalizedString(@"MDM_REMOVE_PASSCODE_LOCK");
  [v3 addObject:v8];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 1) == 0)
  {
LABEL_4:
    if ((accessRights & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  id v9 = MCLocalizedString(@"MDM_INSPECT_PROFILE");
  [v3 addObject:v9];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 2) == 0)
  {
LABEL_5:
    if ((accessRights & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = MCLocalizedString(@"MDM_INSTALL_REMOVE_PROFILE");
  [v3 addObject:v10];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x40) == 0)
  {
LABEL_6:
    if ((accessRights & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_super v11 = MCLocalizedString(@"MDM_LIST_PROV");
  [v3 addObject:v11];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x80) == 0)
  {
LABEL_7:
    if ((accessRights & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v12 = MCLocalizedString(@"MDM_INSTALL_REMOVE_PROV");
  [v3 addObject:v12];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x10) == 0)
  {
LABEL_8:
    if ((accessRights & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v13 = MCLocalizedString(@"MDM_QUERY_INFO");
  [v3 addObject:v13];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x20) == 0)
  {
LABEL_9:
    if ((accessRights & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v14 = MCLocalizedString(@"MDM_QUERY_INFO_NETWORK");
  [v3 addObject:v14];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x100) == 0)
  {
LABEL_10:
    if ((accessRights & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v15 = MCLocalizedString(@"MDM_LIST_APP");
  [v3 addObject:v15];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x200) == 0)
  {
LABEL_11:
    if ((accessRights & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  char v16 = MCLocalizedString(@"MDM_QUERY_RESTRICTIONS");
  [v3 addObject:v16];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x400) == 0)
  {
LABEL_12:
    if ((accessRights & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v17 = MCLocalizedString(@"MDM_QUERY_SECURITY");
  [v3 addObject:v17];

  unint64_t accessRights = self->_accessRights;
  if ((accessRights & 0x800) == 0)
  {
LABEL_13:
    if ((accessRights & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v18 = MCLocalizedString(@"MDM_APPLY_SETTINGS");
  [v3 addObject:v18];

  if ((self->_accessRights & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v5 = MCLocalizedString(@"MDM_APP_INSTALL");
    [v3 addObject:v5];
  }
LABEL_15:
  return (NSArray *)v3;
}

- (id)installationWarnings
{
  if ([(MCMDMPayload *)self isUserEnrollment])
  {
    if (+[MCFeatureOverrides allowVPNInUserEnrollment])
    {
      uint64_t v10 = MCLocalizedAppleInternalString(@"INSTALL_WARNING_APPLE_INTERNAL_VPN_TITLE");
      objc_super v11 = MCLocalizedAppleInternalStringByDevice(@"INSTALL_WARNING_APPLE_INTERNAL_VPN");
      uint64_t v12 = +[MCProfileWarning warningWithLocalizedTitle:v10 localizedBody:v11 isLongForm:0];
    }
    else
    {
      uint64_t v12 = 0;
    }
    char v16 = 0;
  }
  else
  {
    unint64_t accessRights = self->_accessRights;
    BOOL v14 = (accessRights & 0x82) == 0;
    if ((accessRights & 8) == 0) {
      BOOL v14 = 1;
    }
    if ((accessRights & 0x1000) != 0)
    {
      if (v14)
      {
        if ((accessRights & 0x82) != 0)
        {
          uint64_t v15 = @"INSTALL_WARNING_APP_INSPECT_INSTALL";
        }
        else if ((accessRights & 8) != 0)
        {
          uint64_t v15 = @"INSTALL_WARNING_APP_INSPECT_ERASE";
        }
        else
        {
          uint64_t v15 = @"INSTALL_WARNING_APP_INSPECT";
        }
      }
      else
      {
        uint64_t v15 = @"INSTALL_WARNING_APP_INSPECT_INSTALL_ERASE";
      }
    }
    else if (v14)
    {
      if ((accessRights & 0x82) != 0)
      {
        uint64_t v15 = @"INSTALL_WARNING_INSPECT_INSTALL";
      }
      else if ((accessRights & 8) != 0)
      {
        uint64_t v15 = @"INSTALL_WARNING_INSPECT_ERASE";
      }
      else
      {
        uint64_t v15 = @"INSTALL_WARNING_INSPECT";
      }
    }
    else
    {
      uint64_t v15 = @"INSTALL_WARNING_INSPECT_INSTALL_ERASE";
    }
    char v16 = MCLocalizedStringByDevice(v15);
    uint64_t v12 = 0;
  }
  uint64_t v17 = MCLocalizedFormatByDevice(@"INSTALL_WARNING_MDM_P_URL", v3, v4, v5, v6, v7, v8, v9, (uint64_t)self->_serverURLString);
  v18 = v17;
  if (v16)
  {
    id v19 = [NSString stringWithFormat:@"%@\n\n%@", v17, v16];
  }
  else
  {
    id v19 = v17;
  }
  uint64_t v20 = v19;
  uint64_t v21 = MCLocalizedString(@"INSTALL_WARNING_MDM_TITLE");
  uint64_t v22 = +[MCProfileWarning warningWithLocalizedTitle:v21 localizedBody:v20 isLongForm:1];

  uint64_t v23 = [MEMORY[0x1E4F1CA48] arrayWithObject:v22];
  char v24 = v23;
  if (v12) {
    [v23 addObject:v12];
  }

  return v24;
}

- (id)subtitle1Label
{
  if (self->_serverURLString) {
    uint64_t v2 = @"MDM_URL_COLON";
  }
  else {
    uint64_t v2 = @"MDM_URL_MISSING";
  }
  uint64_t v3 = MCLocalizedString(v2);
  return v3;
}

- (id)subtitle1Description
{
  return self->_serverURLString;
}

- (id)payloadDescriptionKeyValueSections
{
  v71[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  if (self->_serverURLString)
  {
    uint64_t v5 = [MCKeyValue alloc];
    serverURLString = self->_serverURLString;
    uint64_t v7 = MCLocalizedString(@"MDM_SERVER_URL");
    uint64_t v8 = [(MCKeyValue *)v5 initWithLocalizedString:serverURLString localizedKey:v7];

    [v4 addObject:v8];
  }
  if (self->_topic)
  {
    uint64_t v9 = [MCKeyValue alloc];
    topic = self->_topic;
    objc_super v11 = MCLocalizedString(@"MDM_TOPIC");
    uint64_t v12 = [(MCKeyValue *)v9 initWithLocalizedString:topic localizedKey:v11];

    [v4 addObject:v12];
  }
  pollingIntervalMinutes = self->_pollingIntervalMinutes;
  if (pollingIntervalMinutes)
  {
    BOOL v14 = MCFormattedStringForTimeInterval((double)(60 * [(NSNumber *)pollingIntervalMinutes intValue]));
    uint64_t v15 = [MCKeyValue alloc];
    char v16 = MCLocalizedString(@"MDM_POLLING_INTERVAL_MINUTES");
    uint64_t v17 = [(MCKeyValue *)v15 initWithLocalizedString:v14 localizedKey:v16];

    [v4 addObject:v17];
  }
  if (self->_useDevelopmentAPNSNum)
  {
    v18 = [MCKeyValue alloc];
    id v19 = MCLocalizedStringForBool([(NSNumber *)self->_useDevelopmentAPNSNum BOOLValue]);
    uint64_t v20 = MCLocalizedString(@"MDM_DEV_APNS");
    uint64_t v21 = [(MCKeyValue *)v18 initWithLocalizedString:v19 localizedKey:v20];

    [v4 addObject:v21];
  }
  if (self->_checkInURLString)
  {
    uint64_t v22 = [MCKeyValue alloc];
    checkInURLString = self->_checkInURLString;
    char v24 = MCLocalizedString(@"MDM_CHECK_IN_URL");
    uint64_t v25 = [(MCKeyValue *)v22 initWithLocalizedString:checkInURLString localizedKey:v24];

    [v4 addObject:v25];
  }
  if (self->_signMessageNum)
  {
    uint64_t v26 = [MCKeyValue alloc];
    uint64_t v27 = MCLocalizedStringForBool([(NSNumber *)self->_signMessageNum BOOLValue]);
    uint64_t v28 = MCLocalizedString(@"MDM_SIGN_MESSAGE");
    uint64_t v29 = [(MCKeyValue *)v26 initWithLocalizedString:v27 localizedKey:v28];

    [v4 addObject:v29];
  }
  if (self->_checkOutWhenRemovedNum)
  {
    v30 = [MCKeyValue alloc];
    uint64_t v31 = MCLocalizedStringForBool([(NSNumber *)self->_checkOutWhenRemovedNum BOOLValue]);
    uint64_t v32 = MCLocalizedString(@"MDM_CHECK_OUT");
    uint64_t v33 = [(MCKeyValue *)v30 initWithLocalizedString:v31 localizedKey:v32];

    [v4 addObject:v33];
  }
  if (self->_requiredAppIDForMDM)
  {
    char v34 = [MCKeyValue alloc];
    uint64_t v35 = [(NSNumber *)self->_requiredAppIDForMDM stringValue];
    uint64_t v36 = MCLocalizedString(@"MDM_REQUIRED_APP_ID");
    v37 = [(MCKeyValue *)v34 initWithLocalizedString:v35 localizedKey:v36];

    [v4 addObject:v37];
  }
  if ([v4 count])
  {
    uint64_t v38 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v38];
  }
  if (self->_personaID)
  {
    uint64_t v39 = MCLocalizedString(@"MDM_MANAGED_APPLE_ACCOUNT");
    uint64_t v40 = [MCKeyValue alloc];
    uint64_t v41 = [(MCMDMPayload *)self managedAppleIDName];
    char v42 = [(MCKeyValue *)v40 initWithLocalizedString:v41 localizedKey:v39];

    [v4 addObject:v42];
    if ([(NSString *)self->_enrollmentID length])
    {
      uint64_t v43 = [MCKeyValue alloc];
      enrollmentID = self->_enrollmentID;
      uint64_t v45 = MCLocalizedString(@"MDM_ENROLLMENT_ID");
      uint64_t v46 = [(MCKeyValue *)v43 initWithLocalizedString:enrollmentID localizedKey:v45];

      [v4 addObject:v46];
      char v42 = (MCKeyValue *)v46;
    }
  }
  if (![(MCMDMPayload *)self isUserEnrollment])
  {
    uint64_t v47 = [(MCMDMPayload *)self localizedAccessRightDescriptions];
    v48 = MCLocalizedString(@"MDM_ACCESS_RIGHTS");
    uint64_t v49 = +[MCKeyValueSection sectionWithLocalizedArray:v47 title:v48 footer:0];

    [v3 addObject:v49];
  }
  identityUUID = self->_identityUUID;
  if (identityUUID)
  {
    v71[0] = self->_identityUUID;
    long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  }
  else
  {
    long long v51 = 0;
  }
  if (self->_identityPersistentID)
  {
    identityPersistentID = self->_identityPersistentID;
    long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&identityPersistentID count:1];
    long long v53 = [(MCMDMPayload *)self kvsForCertUUIDs:v51 persistentRefs:v52 labelKey:@"MDM_CERTIFICATE"];

    if (!identityUUID) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  long long v53 = [(MCMDMPayload *)self kvsForCertUUIDs:v51 persistentRefs:0 labelKey:@"MDM_CERTIFICATE"];
  if (identityUUID) {
LABEL_30:
  }

LABEL_31:
  if ([v53 count])
  {
    long long v54 = [MCKeyValueSection alloc];
    long long v55 = MCLocalizedString(@"MDM_CERTIFICATE");
    long long v56 = [(MCKeyValueSection *)v54 initWithSectionTitle:v55 footer:0 keyValues:v53];

    [v3 addObject:v56];
  }
  long long v57 = [(MCMDMPayload *)self kvsForCertUUIDs:self->_serverPinningUUIDs persistentRefs:self->_serverPinningPersistentRefs labelKey:@"MDM_SERVER_PINNING_CERTS"];
  long long v58 = [(MCMDMPayload *)self kvsForCertUUIDs:self->_checkInPinningUUIDs persistentRefs:self->_checkInPinningPersistentRefs labelKey:@"MDM_CHECKIN_PINNING_CERTS"];
  uint64_t v59 = [v57 count];
  uint64_t v60 = [v58 count] + v59;
  if (v60)
  {
    long long v61 = [MCKeyValue alloc];
    long long v62 = MCLocalizedStringForBool(self->_pinningRevocationCheckRequired);
    long long v63 = MCLocalizedString(@"MDM_PINNING_REVOCATION_CHECK_REQUIRED");
    long long v64 = [(MCKeyValue *)v61 initWithLocalizedString:v62 localizedKey:v63];

    long long v65 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v60 + 1];
    [v65 addObject:v64];
    [v65 addObjectsFromArray:v57];
    [v65 addObjectsFromArray:v58];
    long long v66 = [MCKeyValueSection alloc];
    objc_super v67 = MCLocalizedString(@"MDM_PINNING");
    v68 = [(MCKeyValueSection *)v66 initWithSectionTitle:v67 footer:0 keyValues:v65];

    [v3 addObject:v68];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)kvsForCertUUIDs:(id)a3 persistentRefs:(id)a4 labelKey:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v41 = a5;
  uint64_t v10 = [v8 count];
  uint64_t v11 = [v9 count] + v10;
  if (v11)
  {
    uint64_t v40 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v39 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v47;
      char v17 = 1;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v20 = [(MCPayload *)self profile];
          uint64_t v21 = [v20 subjectSummaryFromCertificatePayloadWithUUID:v19];

          if (v21)
          {
            uint64_t v22 = [MCKeyValue alloc];
            uint64_t v23 = v22;
            if (v17)
            {
              char v24 = MCLocalizedString(v41);
              uint64_t v25 = [(MCKeyValue *)v23 initWithLocalizedString:v21 localizedKey:v24];
            }
            else
            {
              uint64_t v25 = [(MCKeyValue *)v22 initWithLocalizedString:v21 localizedKey:&stru_1EF4AAAF8];
            }
            [v12 addObject:v25];

            char v17 = 0;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v15);
    }
    else
    {
      char v17 = 1;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v26 = v40;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          uint64_t v32 = [(MCPayload *)self profile];
          uint64_t v33 = [v32 subjectSummaryFromCertificateWithPersistentID:v31];

          if (v33)
          {
            char v34 = [MCKeyValue alloc];
            uint64_t v35 = v34;
            if (v17)
            {
              uint64_t v36 = MCLocalizedString(v41);
              v37 = [(MCKeyValue *)v35 initWithLocalizedString:v33 localizedKey:v36];
            }
            else
            {
              v37 = [(MCKeyValue *)v34 initWithLocalizedString:v33 localizedKey:&stru_1EF4AAAF8];
            }
            [v12 addObject:v37];

            char v17 = 0;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v28);
    }

    id v8 = v39;
    id v9 = v40;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)isUserEnrollment
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    BOOL isUserEnrollment = self->_isUserEnrollment;
    managedAppleID = self->_managedAppleID;
    enrollmentMode = self->_enrollmentMode;
    v8[0] = 67109634;
    v8[1] = isUserEnrollment;
    __int16 v9 = 2112;
    uint64_t v10 = managedAppleID;
    __int16 v11 = 2112;
    uint64_t v12 = enrollmentMode;
    _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_DEBUG, "isUserEnrollment iVar: %d, _managedAppleID: %@, _enrollmentMode: %@", (uint8_t *)v8, 0x1Cu);
  }
  return self->_isUserEnrollment
      || self->_managedAppleID
      || [(NSString *)self->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73298]];
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_BOOL isUserEnrollment = a3;
}

- (NSString)managedAppleIDName
{
  uint64_t v3 = &OBJC_IVAR___MCMDMPayload__assignedManagedAppleID;
  if (![(NSString *)self->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73298]]
    && ![(NSString *)self->_enrollmentMode isEqualToString:*MEMORY[0x1E4F73290]])
  {
    uint64_t v3 = &OBJC_IVAR___MCMDMPayload__managedAppleID;
  }
  id v4 = *(id *)((char *)&self->super.super.isa + *v3);
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
LABEL_8:
    uint64_t v7 = v6;
    goto LABEL_9;
  }
  if (self->_personaID)
  {
    objc_msgSend(MEMORY[0x1E4F5E750], "managedAppleIDNameWithPersonaID:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v7 = 0;
LABEL_9:

  return (NSString *)v7;
}

- (BOOL)supportUserChannel
{
  return [(NSArray *)self->_serverCapabilities containsObject:*MEMORY[0x1E4F73350]];
}

- (NSString)identityUUID
{
  return self->_identityUUID;
}

- (NSData)identityPersistentID
{
  return self->_identityPersistentID;
}

- (void)setIdentityPersistentID:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)serverURLString
{
  return self->_serverURLString;
}

- (NSArray)serverPinningUUIDs
{
  return self->_serverPinningUUIDs;
}

- (NSArray)serverPinningPersistentRefs
{
  return self->_serverPinningPersistentRefs;
}

- (void)setServerPinningPersistentRefs:(id)a3
{
}

- (BOOL)useDevelopmentAPNS
{
  return self->_useDevelopmentAPNS;
}

- (NSString)checkInURLString
{
  return self->_checkInURLString;
}

- (NSArray)checkInPinningUUIDs
{
  return self->_checkInPinningUUIDs;
}

- (NSArray)checkInPinningPersistentRefs
{
  return self->_checkInPinningPersistentRefs;
}

- (void)setCheckInPinningPersistentRefs:(id)a3
{
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (unint64_t)accessRights
{
  return self->_accessRights;
}

- (BOOL)signMessage
{
  return self->_signMessage;
}

- (BOOL)checkOutWhenRemoved
{
  return self->_checkOutWhenRemoved;
}

- (NSArray)serverCapabilities
{
  return self->_serverCapabilities;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (NSString)assignedManagedAppleID
{
  return self->_assignedManagedAppleID;
}

- (NSString)enrollmentMode
{
  return self->_enrollmentMode;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSString)enrollmentID
{
  return self->_enrollmentID;
}

- (void)setEnrollmentID:(id)a3
{
}

- (NSString)iCloudEnrollmentID
{
  return self->_iCloudEnrollmentID;
}

- (void)setICloudEnrollmentID:(id)a3
{
}

- (NSString)easEnrollmentID
{
  return self->_easEnrollmentID;
}

- (void)setEasEnrollmentID:(id)a3
{
}

- (NSNumber)pollingIntervalMinutes
{
  return self->_pollingIntervalMinutes;
}

- (NSNumber)requiredAppIDForMDM
{
  return self->_requiredAppIDForMDM;
}

- (void)setRequiredAppIDForMDM:(id)a3
{
}

- (NSNumber)useDevelopmentAPNSNum
{
  return self->_useDevelopmentAPNSNum;
}

- (NSNumber)signMessageNum
{
  return self->_signMessageNum;
}

- (NSNumber)checkOutWhenRemovedNum
{
  return self->_checkOutWhenRemovedNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkOutWhenRemovedNum, 0);
  objc_storeStrong((id *)&self->_signMessageNum, 0);
  objc_storeStrong((id *)&self->_useDevelopmentAPNSNum, 0);
  objc_storeStrong((id *)&self->_requiredAppIDForMDM, 0);
  objc_storeStrong((id *)&self->_pollingIntervalMinutes, 0);
  objc_storeStrong((id *)&self->_easEnrollmentID, 0);
  objc_storeStrong((id *)&self->_iCloudEnrollmentID, 0);
  objc_storeStrong((id *)&self->_enrollmentID, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_enrollmentMode, 0);
  objc_storeStrong((id *)&self->_assignedManagedAppleID, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_serverCapabilities, 0);
  objc_storeStrong((id *)&self->_checkInPinningPersistentRefs, 0);
  objc_storeStrong((id *)&self->_checkInPinningUUIDs, 0);
  objc_storeStrong((id *)&self->_checkInURLString, 0);
  objc_storeStrong((id *)&self->_serverPinningPersistentRefs, 0);
  objc_storeStrong((id *)&self->_serverPinningUUIDs, 0);
  objc_storeStrong((id *)&self->_serverURLString, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_identityPersistentID, 0);
  objc_storeStrong((id *)&self->_identityUUID, 0);
}

@end