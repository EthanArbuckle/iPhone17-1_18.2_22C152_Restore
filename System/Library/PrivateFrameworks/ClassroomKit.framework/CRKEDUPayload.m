@interface CRKEDUPayload
- (BOOL)areCredentialsValidForStub:(BOOL)a3 error:(id *)a4;
- (BOOL)isEphemeralMultiUserDevice;
- (BOOL)parseDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5;
- (BOOL)screenObservationPermissionModificationAllowed;
- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 error:(id *)a5;
- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5 error:(id *)a6;
- (NSArray)departments;
- (NSArray)deviceGroups;
- (NSArray)groups;
- (NSArray)leaderPayloadCertificateAnchorPersistentID;
- (NSArray)leaderPayloadCertificateAnchorUUID;
- (NSArray)memberPayloadCertificateAnchorPersistentID;
- (NSArray)memberPayloadCertificateAnchorUUID;
- (NSArray)users;
- (NSData)payloadCertificatePersistentID;
- (NSData)resourcePayloadCertificatePersistentID;
- (NSDictionary)configuration;
- (NSString)organizationName;
- (NSString)organizationUUID;
- (NSString)payloadCertificateUUID;
- (NSString)payloadDescriptionName;
- (NSString)payloadDisplayName;
- (NSString)resourcePayloadCertificateUUID;
- (NSString)userIdentifier;
- (id)description;
- (id)parseDepartmentFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5;
- (id)parseDeviceGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5;
- (id)parseGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5;
- (id)parseUserFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5;
- (void)setDepartments:(id)a3;
- (void)setDeviceGroups:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3;
- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3;
- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3;
- (void)setMemberPayloadCertificateAnchorUUID:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationUUID:(id)a3;
- (void)setPayloadCertificatePersistentID:(id)a3;
- (void)setPayloadCertificateUUID:(id)a3;
- (void)setPayloadDescriptionName:(id)a3;
- (void)setPayloadDisplayName:(id)a3;
- (void)setResourcePayloadCertificatePersistentID:(id)a3;
- (void)setResourcePayloadCertificateUUID:(id)a3;
- (void)setScreenObservationPermissionModificationAllowed:(BOOL)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation CRKEDUPayload

- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[CRKSystemInfo sharedSystemInfo];
  uint64_t v10 = [v9 cloudConfigEnablesEphemeralMultiUser];

  v11 = [(CRKEDUPayload *)self initWithDictionary:v8 isStub:v6 isEphemeralMultiUserDevice:v10 error:a5];
  return v11;
}

- (CRKEDUPayload)initWithDictionary:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKEDUPayload;
  v11 = [(CRKEDUPayload *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_isEphemeralMultiUserDevice = a5;
    id v17 = 0;
    BOOL v13 = [(CRKEDUPayload *)v11 parseDictionary:v10 isStub:v8 outError:&v17];
    id v14 = v17;
    v15 = v14;
    if (!v13)
    {
      if (a6) {
        *a6 = v14;
      }

      v12 = 0;
    }
  }
  return v12;
}

- (BOOL)parseDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (_CRKLogGeneral_onceToken_6 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_6, &__block_literal_global_27);
  }
  v9 = _CRKLogGeneral_logObj_6;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_6, OS_LOG_TYPE_DEBUG)) {
    -[CRKEDUPayload parseDictionary:isStub:outError:](v9);
  }
  id v132 = 0;
  objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PayloadDisplayName", 0, &v132);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v11 = v132;
  payloadDisplayName = self->_payloadDisplayName;
  self->_payloadDisplayName = v10;

  if (!v11)
  {
    id v131 = 0;
    objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PayloadDescription", 0, &v131);
    BOOL v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v11 = v131;
    payloadDescriptionName = self->_payloadDescriptionName;
    self->_payloadDescriptionName = v13;

    if (!v11)
    {
      id v130 = 0;
      objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"OrganizationUUID", v6 ^ 1, &v130);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v11 = v130;
      organizationUUID = self->_organizationUUID;
      self->_organizationUUID = v15;

      if (!v11)
      {
        id v17 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:self->_organizationUUID];
        if (!v17 && !v6)
        {
          objc_msgSend(MEMORY[0x263F087E8], "crk_badFieldTypeErrorWithField:", @"OrganizationUUID");
          id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

          goto LABEL_36;
        }
        id v129 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"OrganizationName", v6 ^ 1, &v129);
        objc_super v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v11 = v129;
        organizationName = self->_organizationName;
        self->_organizationName = v18;

        if (v11) {
          goto LABEL_35;
        }
        id v128 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PayloadCertificateUUID", 0, &v128);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v11 = v128;
        payloadCertificateUUID = self->_payloadCertificateUUID;
        self->_payloadCertificateUUID = v20;

        if (v11) {
          goto LABEL_35;
        }
        id v127 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"PayloadCertificatePersistentID", 0, &v127);
        v22 = (NSData *)objc_claimAutoreleasedReturnValue();
        id v11 = v127;
        payloadCertificatePersistentID = self->_payloadCertificatePersistentID;
        self->_payloadCertificatePersistentID = v22;

        if (v11) {
          goto LABEL_35;
        }
        id v126 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"LeaderPayloadCertificateAnchorUUID", 0, &v126);
        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
        id v11 = v126;
        leaderPayloadCertificateAnchorUUID = self->_leaderPayloadCertificateAnchorUUID;
        self->_leaderPayloadCertificateAnchorUUID = v24;

        if (v11) {
          goto LABEL_35;
        }
        id v125 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"LeaderPayloadCertificateAnchorPersistentID", 0, &v125);
        v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
        id v11 = v125;
        leaderPayloadCertificateAnchorPersistentID = self->_leaderPayloadCertificateAnchorPersistentID;
        self->_leaderPayloadCertificateAnchorPersistentID = v26;

        if (v11) {
          goto LABEL_35;
        }
        id v124 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"MemberPayloadCertificateAnchorUUID", 0, &v124);
        v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
        id v11 = v124;
        memberPayloadCertificateAnchorUUID = self->_memberPayloadCertificateAnchorUUID;
        self->_memberPayloadCertificateAnchorUUID = v28;

        if (v11) {
          goto LABEL_35;
        }
        id v123 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"MemberPayloadCertificateAnchorPersistentID", 0, &v123);
        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
        id v11 = v123;
        memberPayloadCertificateAnchorPersistentID = self->_memberPayloadCertificateAnchorPersistentID;
        self->_memberPayloadCertificateAnchorPersistentID = v30;

        if (v11) {
          goto LABEL_35;
        }
        id v122 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"ResourcePayloadCertificateUUID", 0, &v122);
        v32 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v11 = v122;
        resourcePayloadCertificateUUID = self->_resourcePayloadCertificateUUID;
        self->_resourcePayloadCertificateUUID = v32;

        if (v11) {
          goto LABEL_35;
        }
        id v121 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"ResourcePayloadCertificatePersistentID", 0, &v121);
        v34 = (NSData *)objc_claimAutoreleasedReturnValue();
        id v11 = v121;
        resourcePayloadCertificatePersistentID = self->_resourcePayloadCertificatePersistentID;
        self->_resourcePayloadCertificatePersistentID = v34;

        if (v11) {
          goto LABEL_35;
        }
        id v120 = 0;
        v36 = objc_msgSend(v8, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"ScreenObservationPermissionModificationAllowed", 0, &v120);
        id v11 = v120;
        self->_screenObservationPermissionModificationAllowed = [v36 BOOLValue];

        if (v11) {
          goto LABEL_35;
        }
        id v119 = 0;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"Departments", 0, &v119);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        id v38 = v119;
        if (v38) {
          goto LABEL_22;
        }
        v90 = objc_opt_new();
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        obuint64_t j = v37;
        uint64_t v86 = [obj countByEnumeratingWithState:&v115 objects:v136 count:16];
        if (v86)
        {
          id v82 = *(id *)v116;
          while (2)
          {
            for (uint64_t i = 0; i != v86; ++i)
            {
              if (*(id *)v116 != v82) {
                objc_enumerationMutation(obj);
              }
              v40 = (void *)[*(id *)(*((void *)&v115 + 1) + 8 * i) mutableCopy];
              id v114 = 0;
              v41 = [(CRKEDUPayload *)self parseDepartmentFromDictionary:v40 isStub:v6 outError:&v114];
              id v42 = v114;

              if (v42)
              {

                goto LABEL_33;
              }
              [v90 addObject:v41];
            }
            uint64_t v86 = [obj countByEnumeratingWithState:&v115 objects:v136 count:16];
            if (v86) {
              continue;
            }
            break;
          }
        }
        id v42 = 0;
LABEL_33:

        v43 = (NSArray *)[v90 copy];
        departments = self->_departments;
        self->_departments = v43;

        id v113 = v42;
        objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"Groups", v6 ^ 1, &v113);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v113;

        if (v11) {
          goto LABEL_34;
        }
        v91 = objc_opt_new();
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id obja = v37;
        uint64_t v87 = [obja countByEnumeratingWithState:&v109 objects:v135 count:16];
        if (v87)
        {
          id v83 = *(id *)v110;
          while (2)
          {
            for (uint64_t j = 0; j != v87; ++j)
            {
              if (*(id *)v110 != v83) {
                objc_enumerationMutation(obja);
              }
              v47 = (void *)[*(id *)(*((void *)&v109 + 1) + 8 * j) mutableCopy];
              id v108 = 0;
              v48 = [(CRKEDUPayload *)self parseGroupFromDictionary:v47 isStub:v6 outError:&v108];
              id v49 = v108;

              if (v49) {
                goto LABEL_52;
              }
              v50 = [v48 objectForKeyedSubscript:@"BeaconID"];
              v51 = [v91 objectForKeyedSubscript:v50];

              if (v51)
              {
                objc_msgSend(MEMORY[0x263F087E8], "crk_valueNotUniqueErrorWithField:value:", @"BeaconID", v50);
                id v49 = (id)objc_claimAutoreleasedReturnValue();

LABEL_52:
                goto LABEL_53;
              }
              [v91 setObject:v48 forKeyedSubscript:v50];
            }
            id v49 = 0;
            uint64_t v87 = [obja countByEnumeratingWithState:&v109 objects:v135 count:16];
            if (v87) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v49 = 0;
        }
LABEL_53:

        v52 = [v91 allValues];
        groups = self->_groups;
        self->_groups = v52;

        id v107 = v49;
        v54 = objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"Users", v6 ^ 1, &v107);
        id v55 = v107;

        if (v55) {
          goto LABEL_54;
        }
        v92 = objc_opt_new();
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v84 = v54;
        uint64_t v56 = [v84 countByEnumeratingWithState:&v103 objects:v134 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v88 = *(void *)v104;
          while (2)
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v104 != v88) {
                objc_enumerationMutation(v84);
              }
              v59 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * k) mutableCopy];
              id v102 = 0;
              v60 = [(CRKEDUPayload *)self parseUserFromDictionary:v59 isStub:v6 outError:&v102];
              id v61 = v102;

              if (v61) {
                goto LABEL_67;
              }
              v62 = [v60 objectForKeyedSubscript:@"Identifier"];
              v63 = [v92 objectForKeyedSubscript:v62];

              if (v63)
              {
                objc_msgSend(MEMORY[0x263F087E8], "crk_valueNotUniqueErrorWithField:value:", @"Identifier", v62);
                id v61 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
                goto LABEL_68;
              }
              [v92 setObject:v60 forKeyedSubscript:v62];
            }
            uint64_t v57 = [v84 countByEnumeratingWithState:&v103 objects:v134 count:16];
            id v61 = 0;
            if (v57) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v61 = 0;
        }
LABEL_68:

        v64 = [v92 allValues];
        users = self->_users;
        self->_users = v64;

        id v101 = v61;
        objc_msgSend(v8, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"UserIdentifier", 0, &v101);
        v66 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v67 = v101;

        userIdentifier = self->_userIdentifier;
        self->_userIdentifier = v66;

        id v11 = v67;
        if (!v67)
        {
          if (self->_userIdentifier
            && (objc_msgSend(v92, "objectForKeyedSubscript:"),
                v69 = objc_claimAutoreleasedReturnValue(),
                v69,
                !v69))
          {
            uint64_t v71 = objc_msgSend(MEMORY[0x263F087E8], "crk_malformedProfileErrorWithField:value:", @"UserIdentifier", self->_userIdentifier);
          }
          else
          {
            if ([(CRKEDUPayload *)self isEphemeralMultiUserDevice]
              || self->_userIdentifier)
            {

              id v100 = 0;
              v54 = objc_msgSend(v8, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"DeviceGroups", 0, &v100);
              id v70 = v100;
              if (!v70)
              {
                v72 = objc_opt_new();
                long long v96 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                id v85 = v54;
                uint64_t v93 = [v85 countByEnumeratingWithState:&v96 objects:v133 count:16];
                if (v93)
                {
                  uint64_t v89 = *(void *)v97;
                  while (2)
                  {
                    for (uint64_t m = 0; m != v93; ++m)
                    {
                      if (*(void *)v97 != v89) {
                        objc_enumerationMutation(v85);
                      }
                      v74 = (void *)[*(id *)(*((void *)&v96 + 1) + 8 * m) mutableCopy];
                      id v95 = 0;
                      v75 = [(CRKEDUPayload *)self parseDeviceGroupFromDictionary:v74 isStub:v6 outError:&v95];
                      id v37 = v95;

                      if (v37) {
                        goto LABEL_91;
                      }
                      v76 = [v75 objectForKeyedSubscript:@"Name"];
                      v77 = [v72 objectForKeyedSubscript:v76];

                      if (v77)
                      {
                        objc_msgSend(MEMORY[0x263F087E8], "crk_valueNotUniqueErrorWithField:value:", @"Name", v76);
                        id v37 = (id)objc_claimAutoreleasedReturnValue();

LABEL_91:
                        goto LABEL_92;
                      }
                      [v72 setObject:v75 forKeyedSubscript:v76];
                    }
                    id v37 = 0;
                    uint64_t v93 = [v85 countByEnumeratingWithState:&v96 objects:v133 count:16];
                    if (v93) {
                      continue;
                    }
                    break;
                  }
                }
                else
                {
                  id v37 = 0;
                }
LABEL_92:

                v78 = [v72 allValues];
                deviceGroups = self->_deviceGroups;
                self->_deviceGroups = v78;

                id v94 = v37;
                [(CRKEDUPayload *)self areCredentialsValidForStub:v6 error:&v94];
                id v38 = v94;
LABEL_22:
                id v11 = v38;
LABEL_34:

                goto LABEL_35;
              }
              id v55 = v70;
LABEL_54:

              id v11 = v55;
              goto LABEL_35;
            }
            uint64_t v71 = objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", @"UserIdentifier");
          }
          id v11 = (id)v71;
        }

        goto LABEL_35;
      }
    }
  }
LABEL_36:
  if (a5 && v11) {
    *a5 = v11;
  }

  return v11 == 0;
}

- (BOOL)areCredentialsValidForStub:(BOOL)a3 error:(id *)a4
{
  v5 = [[CRKEDUPayloadCredentialValidator alloc] initWithPayload:self isStub:a3 isEphemeralMultiUserDevice:[(CRKEDUPayload *)self isEphemeralMultiUserDevice]];
  LOBYTE(a4) = [(CRKEDUPayloadCredentialValidator *)v5 areCredentialsValidWithError:a4];

  return (char)a4;
}

- (id)parseDepartmentFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = !v6;
  id v16 = 0;
  v9 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Name", v8, &v16);
  id v10 = v16;
  if (v10)
  {
    id v11 = 0;
    goto LABEL_4;
  }
  id v15 = 0;
  id v11 = objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"GroupBeaconIDs", v8, &v15);
  id v10 = v15;
  if (v10)
  {
LABEL_4:
    if (a5)
    {
      id v10 = v10;
      v12 = 0;
      *a5 = v10;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_12;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v12 = v13;
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"Name"];
  }
  if (v11) {
    [v12 setObject:v11 forKeyedSubscript:@"GroupBeaconIDs"];
  }
  id v10 = 0;
LABEL_12:

  return v12;
}

- (id)parseGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = !v6;
  id v29 = 0;
  v9 = objc_msgSend(v7, "crk_validateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), @"BeaconID", v8, &v29);
  id v10 = v29;
  if (v10
    || (unint64_t)[v9 unsignedIntegerValue] >= 0x10000
    && (objc_msgSend(MEMORY[0x263F087E8], "crk_unsupportedValueErrorWithField:value:", @"BeaconID", v9),
        (id v10 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    v21 = 0;
    goto LABEL_3;
  }
  id v28 = 0;
  v21 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Name", v8, &v28);
  id v10 = v28;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    goto LABEL_3;
  }
  id v27 = 0;
  id v16 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Description", 0, &v27);
  id v10 = v27;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_3;
  }
  id v26 = 0;
  id v15 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"ConfigurationSource", 0, &v26);
  id v10 = v26;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_3;
  }
  id v25 = 0;
  id v14 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"ImageURL", 0, &v25);
  id v10 = v25;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    goto LABEL_3;
  }
  id v24 = 0;
  id v13 = objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"LeaderIdentifiers", 0, &v24);
  id v10 = v24;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    goto LABEL_3;
  }
  id v23 = 0;
  v12 = objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"MemberIdentifiers", v8, &v23);
  id v10 = v23;
  if (v10)
  {
    id v11 = 0;
    goto LABEL_3;
  }
  id v22 = 0;
  id v11 = objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"DeviceGroupIdentifiers", 0, &v22);
  id v10 = v22;
  if (v10)
  {
LABEL_3:
    if (a5)
    {
      id v10 = v10;
      id v17 = 0;
      *a5 = v10;
    }
    else
    {
      id v17 = 0;
    }
    goto LABEL_10;
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v20 = v19;
  if (v9) {
    [v19 setObject:v9 forKeyedSubscript:@"BeaconID"];
  }
  if (v21) {
    [v20 setObject:v21 forKeyedSubscript:@"Name"];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:@"Description"];
  }
  if (v15) {
    [v20 setObject:v15 forKeyedSubscript:@"ConfigurationSource"];
  }
  if (v14) {
    [v20 setObject:v14 forKeyedSubscript:@"ImageURL"];
  }
  if (v13) {
    [v20 setObject:v13 forKeyedSubscript:@"LeaderIdentifiers"];
  }
  if (v12) {
    [v20 setObject:v12 forKeyedSubscript:@"MemberIdentifiers"];
  }
  if (v11) {
    [v20 setObject:v11 forKeyedSubscript:@"DeviceGroupIdentifiers"];
  }
  id v17 = (void *)[v20 copy];

  id v10 = 0;
LABEL_10:

  return v17;
}

- (id)parseUserFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = !v6;
  id v34 = 0;
  uint64_t v9 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Identifier", v8, &v34);
  id v10 = v34;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    id v22 = 0;
    id v23 = 0;
    id v24 = 0;
    goto LABEL_20;
  }
  id v33 = 0;
  id v24 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Name", v8, &v33);
  id v10 = v33;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    id v22 = 0;
    id v23 = 0;
    goto LABEL_20;
  }
  id v32 = 0;
  id v23 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"GivenName", 0, &v32);
  id v10 = v32;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    id v22 = 0;
    goto LABEL_20;
  }
  id v31 = 0;
  id v22 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"FamilyName", 0, &v31);
  id v10 = v31;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    goto LABEL_20;
  }
  id v30 = 0;
  id v16 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PhoneticGivenName", 0, &v30);
  id v10 = v30;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_20;
  }
  id v29 = 0;
  id v15 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PhoneticFamilyName", 0, &v29);
  id v10 = v29;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_20;
  }
  id v28 = 0;
  id v14 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"AppleID", 0, &v28);
  id v10 = v28;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    id v13 = 0;
    goto LABEL_20;
  }
  id v27 = 0;
  id v13 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"ImageURL", 0, &v27);
  id v10 = v27;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    goto LABEL_20;
  }
  id v26 = 0;
  v12 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"FullScreenImageURL", 0, &v26);
  id v10 = v26;
  if (v10)
  {
    id v11 = 0;
    goto LABEL_20;
  }
  id v25 = 0;
  id v11 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"PasscodeType", 0, &v25);
  id v10 = v25;
  if (v10)
  {
LABEL_20:
    id v17 = (void *)v9;
    if (a5)
    {
      id v10 = v10;
      objc_super v18 = 0;
      *a5 = v10;
    }
    else
    {
      objc_super v18 = 0;
    }
    goto LABEL_23;
  }
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v21 = v20;
  id v17 = (void *)v9;
  if (v9) {
    [v20 setObject:v9 forKeyedSubscript:@"Identifier"];
  }
  if (v24) {
    [v21 setObject:v24 forKeyedSubscript:@"Name"];
  }
  if (v23) {
    [v21 setObject:v23 forKeyedSubscript:@"GivenName"];
  }
  if (v22) {
    [v21 setObject:v22 forKeyedSubscript:@"FamilyName"];
  }
  if (v16) {
    [v21 setObject:v16 forKeyedSubscript:@"PhoneticGivenName"];
  }
  if (v15) {
    [v21 setObject:v15 forKeyedSubscript:@"PhoneticFamilyName"];
  }
  if (v14) {
    [v21 setObject:v14 forKeyedSubscript:@"AppleID"];
  }
  if (v13) {
    [v21 setObject:v13 forKeyedSubscript:@"ImageURL"];
  }
  if (v12) {
    [v21 setObject:v12 forKeyedSubscript:@"FullScreenImageURL"];
  }
  if (v11) {
    [v21 setObject:v11 forKeyedSubscript:@"PasscodeType"];
  }
  objc_super v18 = (void *)[v21 copy];

  id v10 = 0;
LABEL_23:

  return v18;
}

- (id)parseDeviceGroupFromDictionary:(id)a3 isStub:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  BOOL v8 = !v6;
  id v19 = 0;
  uint64_t v9 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Identifier", v8, &v19);
  id v10 = v19;
  if (v10)
  {
    id v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  id v18 = 0;
  v12 = objc_msgSend(v7, "crk_validateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", @"Name", v8, &v18);
  id v10 = v18;
  if (v10)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  id v17 = 0;
  id v11 = objc_msgSend(v7, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), @"SerialNumbers", 0, &v17);
  id v10 = v17;
  if (v10)
  {
LABEL_6:
    if (a5)
    {
      id v10 = v10;
      id v13 = 0;
      *a5 = v10;
    }
    else
    {
      id v13 = 0;
    }
    goto LABEL_9;
  }
  id v15 = objc_opt_new();
  id v16 = v15;
  if (v9) {
    [v15 setObject:v9 forKeyedSubscript:@"Identifier"];
  }
  if (v12) {
    [v16 setObject:v12 forKeyedSubscript:@"Name"];
  }
  if (v11) {
    [v16 setObject:v11 forKeyedSubscript:@"SerialNumbers"];
  }
  id v13 = (void *)[v16 copy];

  id v10 = 0;
LABEL_9:

  return v13;
}

- (NSDictionary)configuration
{
  v3 = objc_opt_new();
  v4 = [(CRKEDUPayload *)self organizationUUID];

  if (v4)
  {
    v5 = [(CRKEDUPayload *)self organizationUUID];
    [v3 setObject:v5 forKeyedSubscript:@"OrganizationUUID"];
  }
  BOOL v6 = [(CRKEDUPayload *)self organizationName];

  if (v6)
  {
    id v7 = [(CRKEDUPayload *)self organizationName];
    [v3 setObject:v7 forKeyedSubscript:@"OrganizationName"];
  }
  BOOL v8 = [(CRKEDUPayload *)self payloadCertificateUUID];

  if (v8)
  {
    uint64_t v9 = [(CRKEDUPayload *)self payloadCertificateUUID];
    [v3 setObject:v9 forKeyedSubscript:@"PayloadCertificateUUID"];
  }
  id v10 = [(CRKEDUPayload *)self payloadCertificatePersistentID];

  if (v10)
  {
    id v11 = [(CRKEDUPayload *)self payloadCertificatePersistentID];
    [v3 setObject:v11 forKeyedSubscript:@"PayloadCertificatePersistentID"];
  }
  v12 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorUUID];

  if (v12)
  {
    id v13 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorUUID];
    [v3 setObject:v13 forKeyedSubscript:@"LeaderPayloadCertificateAnchorUUID"];
  }
  id v14 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorPersistentID];

  if (v14)
  {
    id v15 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorPersistentID];
    [v3 setObject:v15 forKeyedSubscript:@"LeaderPayloadCertificateAnchorPersistentID"];
  }
  id v16 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorUUID];

  if (v16)
  {
    id v17 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorUUID];
    [v3 setObject:v17 forKeyedSubscript:@"MemberPayloadCertificateAnchorUUID"];
  }
  id v18 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorPersistentID];

  if (v18)
  {
    id v19 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorPersistentID];
    [v3 setObject:v19 forKeyedSubscript:@"MemberPayloadCertificateAnchorPersistentID"];
  }
  id v20 = [(CRKEDUPayload *)self resourcePayloadCertificateUUID];

  if (v20)
  {
    v21 = [(CRKEDUPayload *)self resourcePayloadCertificateUUID];
    [v3 setObject:v21 forKeyedSubscript:@"ResourcePayloadCertificateUUID"];
  }
  id v22 = [(CRKEDUPayload *)self resourcePayloadCertificatePersistentID];

  if (v22)
  {
    id v23 = [(CRKEDUPayload *)self resourcePayloadCertificatePersistentID];
    [v3 setObject:v23 forKeyedSubscript:@"ResourcePayloadCertificatePersistentID"];
  }
  id v24 = [(CRKEDUPayload *)self userIdentifier];

  if (v24)
  {
    id v25 = [(CRKEDUPayload *)self userIdentifier];
    [v3 setObject:v25 forKeyedSubscript:@"UserIdentifier"];
  }
  id v26 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKEDUPayload screenObservationPermissionModificationAllowed](self, "screenObservationPermissionModificationAllowed"));

  if (v26)
  {
    id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKEDUPayload screenObservationPermissionModificationAllowed](self, "screenObservationPermissionModificationAllowed"));
    [v3 setObject:v27 forKeyedSubscript:@"ScreenObservationPermissionModificationAllowed"];
  }
  id v28 = [(CRKEDUPayload *)self departments];

  if (v28)
  {
    id v29 = [(CRKEDUPayload *)self departments];
    [v3 setObject:v29 forKeyedSubscript:@"Departments"];
  }
  id v30 = [(CRKEDUPayload *)self groups];

  if (v30)
  {
    id v31 = [(CRKEDUPayload *)self groups];
    [v3 setObject:v31 forKeyedSubscript:@"Groups"];
  }
  id v32 = [(CRKEDUPayload *)self users];

  if (v32)
  {
    id v33 = [(CRKEDUPayload *)self users];
    [v3 setObject:v33 forKeyedSubscript:@"Users"];
  }
  id v34 = [(CRKEDUPayload *)self deviceGroups];

  if (v34)
  {
    v35 = [(CRKEDUPayload *)self deviceGroups];
    [v3 setObject:v35 forKeyedSubscript:@"DeviceGroups"];
  }
  v36 = (void *)[v3 copy];

  return (NSDictionary *)v36;
}

- (id)description
{
  id v18 = NSString;
  id v17 = [(CRKEDUPayload *)self organizationUUID];
  id v16 = [(CRKEDUPayload *)self organizationName];
  id v15 = [(CRKEDUPayload *)self payloadCertificateUUID];
  v21 = [(CRKEDUPayload *)self payloadCertificatePersistentID];
  id v14 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorUUID];
  id v20 = [(CRKEDUPayload *)self leaderPayloadCertificateAnchorPersistentID];
  id v13 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorUUID];
  v3 = [(CRKEDUPayload *)self memberPayloadCertificateAnchorPersistentID];
  v4 = [(CRKEDUPayload *)self resourcePayloadCertificateUUID];
  v5 = [(CRKEDUPayload *)self resourcePayloadCertificatePersistentID];
  BOOL v6 = [(CRKEDUPayload *)self userIdentifier];
  if ([(CRKEDUPayload *)self screenObservationPermissionModificationAllowed])
  {
    id v7 = @"YES";
  }
  else
  {
    id v7 = @"NO";
  }
  BOOL v8 = [(CRKEDUPayload *)self departments];
  uint64_t v9 = [(CRKEDUPayload *)self groups];
  id v10 = [(CRKEDUPayload *)self users];
  id v11 = [(CRKEDUPayload *)self deviceGroups];
  id v19 = [v18 stringWithFormat:@"organizationUUID: %@             organizationName: %@             payloadCertificateUUID: %@             payloadCertificatePersistentID: %@             leaderPayloadCertificateAnchorUUID: %@             leaderPayloadCertificateAnchorPersistentID: %@             memberPayloadCertificateAnchorUUID: %@             memberPayloadCertificateAnchorPersistentID: %@             resourcePayloadCertificateUUID: %@             resourcePayloadCertificatePersistentID: %@             userIdentifier: %@             screenObservationPermissionModificationAllowed: %@             departments: %@             groups: %@             users: %@             deviceGroups: %@", v17, v16, v15, v21, v14, v20, v13, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v19;
}

- (NSString)payloadDisplayName
{
  return self->_payloadDisplayName;
}

- (void)setPayloadDisplayName:(id)a3
{
}

- (NSString)payloadDescriptionName
{
  return self->_payloadDescriptionName;
}

- (void)setPayloadDescriptionName:(id)a3
{
}

- (NSString)organizationUUID
{
  return self->_organizationUUID;
}

- (void)setOrganizationUUID:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)payloadCertificateUUID
{
  return self->_payloadCertificateUUID;
}

- (void)setPayloadCertificateUUID:(id)a3
{
}

- (NSData)payloadCertificatePersistentID
{
  return self->_payloadCertificatePersistentID;
}

- (void)setPayloadCertificatePersistentID:(id)a3
{
}

- (NSArray)leaderPayloadCertificateAnchorUUID
{
  return self->_leaderPayloadCertificateAnchorUUID;
}

- (void)setLeaderPayloadCertificateAnchorUUID:(id)a3
{
}

- (NSArray)leaderPayloadCertificateAnchorPersistentID
{
  return self->_leaderPayloadCertificateAnchorPersistentID;
}

- (void)setLeaderPayloadCertificateAnchorPersistentID:(id)a3
{
}

- (NSArray)memberPayloadCertificateAnchorUUID
{
  return self->_memberPayloadCertificateAnchorUUID;
}

- (void)setMemberPayloadCertificateAnchorUUID:(id)a3
{
}

- (NSArray)memberPayloadCertificateAnchorPersistentID
{
  return self->_memberPayloadCertificateAnchorPersistentID;
}

- (void)setMemberPayloadCertificateAnchorPersistentID:(id)a3
{
}

- (NSString)resourcePayloadCertificateUUID
{
  return self->_resourcePayloadCertificateUUID;
}

- (void)setResourcePayloadCertificateUUID:(id)a3
{
}

- (NSData)resourcePayloadCertificatePersistentID
{
  return self->_resourcePayloadCertificatePersistentID;
}

- (void)setResourcePayloadCertificatePersistentID:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (BOOL)screenObservationPermissionModificationAllowed
{
  return self->_screenObservationPermissionModificationAllowed;
}

- (void)setScreenObservationPermissionModificationAllowed:(BOOL)a3
{
  self->_screenObservationPermissionModificationAllowed = a3;
}

- (NSArray)departments
{
  return self->_departments;
}

- (void)setDepartments:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
}

- (BOOL)isEphemeralMultiUserDevice
{
  return self->_isEphemeralMultiUserDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_departments, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_resourcePayloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_resourcePayloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorPersistentID, 0);
  objc_storeStrong((id *)&self->_memberPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorPersistentID, 0);
  objc_storeStrong((id *)&self->_leaderPayloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_payloadCertificatePersistentID, 0);
  objc_storeStrong((id *)&self->_payloadCertificateUUID, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_organizationUUID, 0);
  objc_storeStrong((id *)&self->_payloadDescriptionName, 0);

  objc_storeStrong((id *)&self->_payloadDisplayName, 0);
}

- (void)parseDictionary:(os_log_t)log isStub:outError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224C00000, log, OS_LOG_TYPE_DEBUG, "Start CRKEDUPayload parsing", v1, 2u);
}

@end