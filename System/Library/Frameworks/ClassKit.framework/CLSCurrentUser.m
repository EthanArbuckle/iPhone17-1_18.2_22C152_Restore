@interface CLSCurrentUser
+ (BOOL)supportsSecureCoding;
+ (NSString)magicValue;
+ (unint64_t)userRolesFromUserLocationIDsByAXMRoleType:(id)a3;
- (BOOL)_hasRole:(unint64_t)a3;
- (BOOL)allowSharingOutsideOrg;
- (BOOL)classroomClassicAdHocModeEnabled;
- (BOOL)hasDataSeparatedAccount;
- (BOOL)hasEDUAccount;
- (BOOL)hasManagedAccount;
- (BOOL)hasMatchingPersona;
- (BOOL)hasRole:(unint64_t)a3;
- (BOOL)hasUbiquityEnabled;
- (BOOL)isAdministrator;
- (BOOL)isInstructor;
- (BOOL)isStudent;
- (BOOL)organizationMaidAnalyticsEnabled;
- (BOOL)organizationProgressTrackingAllowed;
- (BOOL)personMaidAnalyticsEnabled;
- (BOOL)requiresPersonaMatch;
- (CKRecordID)orgAdminUserRecordID;
- (CKRecordID)userRecordID;
- (CLSCurrentUser)initWithCoder:(id)a3;
- (CLSPerson)person;
- (NSData)multimediaCacheDirectoryURLSandboxExtension;
- (NSData)schoolworkUbiquitousContainerURLSandboxExtension;
- (NSDictionary)locationIDsByAXMRoleType;
- (NSError)multimediaCacheDirectoryURLError;
- (NSError)orgAdminUserFetchError;
- (NSError)schoolworkUbiquitousContainerError;
- (NSError)userFetchError;
- (NSString)accountIdentifier;
- (NSString)accountPersonaUniqueIdentifier;
- (NSString)clientPersonaUniqueIdentifier;
- (NSString)organizationName;
- (NSURL)multimediaCacheDirectoryURL;
- (NSURL)schoolworkUbiquitousContainerURL;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)devMode;
- (int)handoutServiceAuthenticationState;
- (int)iCloudDriveAuthenticationState;
- (int)rosterServiceAuthenticationState;
- (int64_t)catalogEnvironment;
- (unint64_t)_useRoles;
- (unint64_t)roles;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountPersonaUniqueIdentifier:(id)a3;
- (void)setAllowSharingOutsideOrg:(BOOL)a3;
- (void)setCatalogEnvironment:(int64_t)a3;
- (void)setClassroomClassicAdHocModeEnabled:(BOOL)a3;
- (void)setClientPersonaUniqueIdentifier:(id)a3;
- (void)setDevMode:(int)a3;
- (void)setHandoutServiceAuthenticationState:(int)a3;
- (void)setHasDataSeparatedAccount:(BOOL)a3;
- (void)setHasEDUAccount:(BOOL)a3;
- (void)setHasManagedAccount:(BOOL)a3;
- (void)setHasMatchingPersona:(BOOL)a3;
- (void)setHasUbiquityEnabled:(BOOL)a3;
- (void)setICloudDriveAuthenticationState:(int)a3;
- (void)setLocationIDsByAXMRoleType:(id)a3;
- (void)setMultimediaCacheDirectoryURL:(id)a3;
- (void)setMultimediaCacheDirectoryURLError:(id)a3;
- (void)setMultimediaCacheDirectoryURLSandboxExtension:(id)a3;
- (void)setOrgAdminUserFetchError:(id)a3;
- (void)setOrgAdminUserRecordID:(id)a3;
- (void)setOrganizationMaidAnalyticsEnabled:(BOOL)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationProgressTrackingAllowed:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)setPersonMaidAnalyticsEnabled:(BOOL)a3;
- (void)setRequiresPersonaMatch:(BOOL)a3;
- (void)setRoles:(unint64_t)a3;
- (void)setRosterServiceAuthenticationState:(int)a3;
- (void)setSchoolworkUbiquitousContainerError:(id)a3;
- (void)setSchoolworkUbiquitousContainerURL:(id)a3;
- (void)setSchoolworkUbiquitousContainerURLSandboxExtension:(id)a3;
- (void)setUserFetchError:(id)a3;
- (void)setUserRecordID:(id)a3;
@end

@implementation CLSCurrentUser

+ (NSString)magicValue
{
  return (NSString *)@"🚫🇬🇭🎁∪🆙";
}

+ (unint64_t)userRolesFromUserLocationIDsByAXMRoleType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend_allKeys(a3, a2, (uint64_t)a3, 0);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, v18, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = objc_msgSend_integerValue(*(void **)(*((void *)&v14 + 1) + 8 * i), v6, v7);
        switch(v12)
        {
          case 6:
            v9 |= 1uLL;
            break;
          case 4:
            v9 |= 2uLL;
            break;
          case 1:
            v9 |= 8uLL;
            break;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSCurrentUser;
  return [(CLSCurrentUser *)&v3 init];
}

- (unint64_t)_useRoles
{
  locationIDsByAXMRoleType = self->_locationIDsByAXMRoleType;
  if (locationIDsByAXMRoleType) {
    return MEMORY[0x1F4181798](CLSCurrentUser, sel_userRolesFromUserLocationIDsByAXMRoleType_, locationIDsByAXMRoleType);
  }
  else {
    return self->_roles;
  }
}

- (BOOL)_hasRole:(unint64_t)a3
{
  return (objc_msgSend__useRoles(self, a2, a3) & a3) != 0;
}

- (BOOL)hasRole:(unint64_t)a3
{
  return MEMORY[0x1F4181798](self, sel__hasRole_, a3);
}

- (BOOL)isAdministrator
{
  return MEMORY[0x1F4181798](self, sel__hasRole_, 8);
}

- (BOOL)isInstructor
{
  return MEMORY[0x1F4181798](self, sel__hasRole_, 2);
}

- (BOOL)isStudent
{
  return MEMORY[0x1F4181798](self, sel__hasRole_, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v13 = objc_msgSend_person(self, v11, v12);
  long long v16 = objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_setPerson_(v10, v17, (uint64_t)v16);

  uint64_t v20 = objc_msgSend_roles(self, v18, v19);
  objc_msgSend_setRoles_(v10, v21, v20);
  v24 = objc_msgSend_accountIdentifier(self, v22, v23);
  objc_msgSend_setAccountIdentifier_(v10, v25, (uint64_t)v24);

  v28 = objc_msgSend_accountPersonaUniqueIdentifier(self, v26, v27);
  objc_msgSend_setAccountPersonaUniqueIdentifier_(v10, v29, (uint64_t)v28);

  v32 = objc_msgSend_clientPersonaUniqueIdentifier(self, v30, v31);
  objc_msgSend_setClientPersonaUniqueIdentifier_(v10, v33, (uint64_t)v32);

  uint64_t v36 = objc_msgSend_requiresPersonaMatch(self, v34, v35);
  objc_msgSend_setRequiresPersonaMatch_(v10, v37, v36);
  uint64_t hasMatchingPersona = objc_msgSend_hasMatchingPersona(self, v38, v39);
  objc_msgSend_setHasMatchingPersona_(v10, v41, hasMatchingPersona);
  uint64_t hasDataSeparatedAccount = objc_msgSend_hasDataSeparatedAccount(self, v42, v43);
  objc_msgSend_setHasDataSeparatedAccount_(v10, v45, hasDataSeparatedAccount);
  uint64_t hasManagedAccount = objc_msgSend_hasManagedAccount(self, v46, v47);
  objc_msgSend_setHasManagedAccount_(v10, v49, hasManagedAccount);
  uint64_t hasEDUAccount = objc_msgSend_hasEDUAccount(self, v50, v51);
  objc_msgSend_setHasEDUAccount_(v10, v53, hasEDUAccount);
  uint64_t hasUbiquityEnabled = objc_msgSend_hasUbiquityEnabled(self, v54, v55);
  objc_msgSend_setHasUbiquityEnabled_(v10, v57, hasUbiquityEnabled);
  v60 = objc_msgSend_organizationName(self, v58, v59);
  objc_msgSend_setOrganizationName_(v10, v61, (uint64_t)v60);

  uint64_t v64 = objc_msgSend_organizationProgressTrackingAllowed(self, v62, v63);
  objc_msgSend_setOrganizationProgressTrackingAllowed_(v10, v65, v64);
  uint64_t v68 = objc_msgSend_organizationMaidAnalyticsEnabled(self, v66, v67);
  objc_msgSend_setOrganizationMaidAnalyticsEnabled_(v10, v69, v68);
  uint64_t v72 = objc_msgSend_personMaidAnalyticsEnabled(self, v70, v71);
  objc_msgSend_setPersonMaidAnalyticsEnabled_(v10, v73, v72);
  uint64_t v76 = objc_msgSend_catalogEnvironment(self, v74, v75);
  objc_msgSend_setCatalogEnvironment_(v10, v77, v76);
  uint64_t v80 = objc_msgSend_rosterServiceAuthenticationState(self, v78, v79);
  objc_msgSend_setRosterServiceAuthenticationState_(v10, v81, v80);
  uint64_t v84 = objc_msgSend_handoutServiceAuthenticationState(self, v82, v83);
  objc_msgSend_setHandoutServiceAuthenticationState_(v10, v85, v84);
  uint64_t v88 = objc_msgSend_iCloudDriveAuthenticationState(self, v86, v87);
  objc_msgSend_setICloudDriveAuthenticationState_(v10, v89, v88);
  v92 = objc_msgSend_schoolworkUbiquitousContainerURL(self, v90, v91);
  objc_msgSend_setSchoolworkUbiquitousContainerURL_(v10, v93, (uint64_t)v92);

  v96 = objc_msgSend_schoolworkUbiquitousContainerError(self, v94, v95);
  objc_msgSend_setSchoolworkUbiquitousContainerError_(v10, v97, (uint64_t)v96);

  v100 = objc_msgSend_schoolworkUbiquitousContainerURLSandboxExtension(self, v98, v99);
  objc_msgSend_setSchoolworkUbiquitousContainerURLSandboxExtension_(v10, v101, (uint64_t)v100);

  v104 = objc_msgSend_orgAdminUserRecordID(self, v102, v103);
  objc_msgSend_setOrgAdminUserRecordID_(v10, v105, (uint64_t)v104);

  v108 = objc_msgSend_orgAdminUserFetchError(self, v106, v107);
  objc_msgSend_setOrgAdminUserFetchError_(v10, v109, (uint64_t)v108);

  v112 = objc_msgSend_userRecordID(self, v110, v111);
  objc_msgSend_setUserRecordID_(v10, v113, (uint64_t)v112);

  v116 = objc_msgSend_userFetchError(self, v114, v115);
  objc_msgSend_setUserFetchError_(v10, v117, (uint64_t)v116);

  v120 = objc_msgSend_multimediaCacheDirectoryURL(self, v118, v119);
  objc_msgSend_setMultimediaCacheDirectoryURL_(v10, v121, (uint64_t)v120);

  v124 = objc_msgSend_multimediaCacheDirectoryURLError(self, v122, v123);
  objc_msgSend_setMultimediaCacheDirectoryURLError_(v10, v125, (uint64_t)v124);

  v128 = objc_msgSend_multimediaCacheDirectoryURLSandboxExtension(self, v126, v127);
  objc_msgSend_setMultimediaCacheDirectoryURLSandboxExtension_(v10, v129, (uint64_t)v128);

  uint64_t v132 = objc_msgSend_allowSharingOutsideOrg(self, v130, v131);
  objc_msgSend_setAllowSharingOutsideOrg_(v10, v133, v132);
  uint64_t v136 = objc_msgSend_classroomClassicAdHocModeEnabled(self, v134, v135);
  objc_msgSend_setClassroomClassicAdHocModeEnabled_(v10, v137, v136);
  return v10;
}

- (CLSCurrentUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)CLSCurrentUser;
  uint64_t v5 = [(CLSCurrentUser *)&v111 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"person");
    person = v5->_person;
    v5->_person = (CLSPerson *)v8;

    v5->_roles = objc_msgSend_decodeIntegerForKey_(v4, v10, @"roles");
    uint64_t v12 = objc_msgSend_decodeIntegerForKey_(v4, v11, @"devMode");
    if (v12 == 2) {
      int v14 = 2;
    }
    else {
      int v14 = v12 == 1;
    }
    v5->_devMode = v14;
    v5->_catalogEnvironment = objc_msgSend_decodeIntegerForKey_(v4, v13, @"catalogEnvironment") == 1;
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v15, v20, v16, v17, v18, v19, 0);
    uint64_t v23 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"locationIDsByAXMRoleType");
    locationIDsByAXMRoleType = v5->_locationIDsByAXMRoleType;
    v5->_locationIDsByAXMRoleType = (NSDictionary *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"accountIdentifier");
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v27;

    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"accountPersonaUniqueIdentifier");
    accountPersonaUniqueIdentifier = v5->_accountPersonaUniqueIdentifier;
    v5->_accountPersonaUniqueIdentifier = (NSString *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"clientPersonaUniqueIdentifier");
    clientPersonaUniqueIdentifier = v5->_clientPersonaUniqueIdentifier;
    v5->_clientPersonaUniqueIdentifier = (NSString *)v35;

    v5->_requiresPersonaMatch = objc_msgSend_decodeBoolForKey_(v4, v37, @"requiresPersonaMatch");
    v5->_uint64_t hasMatchingPersona = objc_msgSend_decodeBoolForKey_(v4, v38, @"hasMatchingPersona");
    v5->_uint64_t hasDataSeparatedAccount = objc_msgSend_decodeBoolForKey_(v4, v39, @"hasDataSeparatedAccount");
    v5->_uint64_t hasManagedAccount = objc_msgSend_decodeBoolForKey_(v4, v40, @"hasManagedAccount");
    v5->_uint64_t hasEDUAccount = objc_msgSend_decodeBoolForKey_(v4, v41, @"hasEDUAccount");
    v5->_uint64_t hasUbiquityEnabled = objc_msgSend_decodeBoolForKey_(v4, v42, @"hasUbiquityEnabled");
    uint64_t v43 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"organizationName");
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v45;

    v5->_organizationProgressTrackingAllowed = objc_msgSend_decodeBoolForKey_(v4, v47, @"organizationProgressTrackingAllowed");
    v5->_organizationMaidAnalyticsEnabled = objc_msgSend_decodeBoolForKey_(v4, v48, @"organizationMaidAnalyticsEnabled");
    v5->_personMaidAnalyticsEnabled = objc_msgSend_decodeBoolForKey_(v4, v49, @"personMaidAnalyticsEnabled");
    uint64_t v51 = objc_msgSend_decodeIntegerForKey_(v4, v50, @"rosterServiceAuthenticationState");
    if (v51 == 2) {
      int v53 = 2;
    }
    else {
      int v53 = v51 == 1;
    }
    v5->_rosterServiceAuthenticationState = v53;
    uint64_t v54 = objc_msgSend_decodeIntegerForKey_(v4, v52, @"handoutServiceAuthenticationState");
    if (v54 == 2) {
      int v56 = 2;
    }
    else {
      int v56 = v54 == 1;
    }
    v5->_handoutServiceAuthenticationState = v56;
    uint64_t v57 = objc_msgSend_decodeIntegerForKey_(v4, v55, @"iCloudDriveAuthenticationState");
    int v58 = v57 == 1;
    if (v57 == 2) {
      int v58 = 2;
    }
    v5->_iCloudDriveAuthenticationState = v58;
    uint64_t v59 = objc_opt_class();
    uint64_t v61 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, @"schoolworkUbiquitousContainerURL");
    schoolworkUbiquitousContainerURL = v5->_schoolworkUbiquitousContainerURL;
    v5->_schoolworkUbiquitousContainerURL = (NSURL *)v61;

    uint64_t v63 = objc_opt_class();
    uint64_t v65 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v64, v63, @"schoolworkUbiquitousContainerError");
    schoolworkUbiquitousContainerError = v5->_schoolworkUbiquitousContainerError;
    v5->_schoolworkUbiquitousContainerError = (NSError *)v65;

    uint64_t v67 = objc_opt_class();
    uint64_t v69 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, @"schoolworkUbiquitousContainerURLSandboxExtension");
    schoolworkUbiquitousContainerURLSandboxExtension = v5->_schoolworkUbiquitousContainerURLSandboxExtension;
    v5->_schoolworkUbiquitousContainerURLSandboxExtension = (NSData *)v69;

    uint64_t v71 = objc_opt_class();
    uint64_t v73 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, @"orgAdminUserRecordID");
    orgAdminUserRecordID = v5->_orgAdminUserRecordID;
    v5->_orgAdminUserRecordID = (CKRecordID *)v73;

    uint64_t v75 = objc_opt_class();
    uint64_t v77 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v75, @"orgAdminUserFetchError");
    orgAdminUserFetchError = v5->_orgAdminUserFetchError;
    v5->_orgAdminUserFetchError = (NSError *)v77;

    uint64_t v79 = objc_opt_class();
    uint64_t v81 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v80, v79, @"userRecordID");
    userRecordID = v5->_userRecordID;
    v5->_userRecordID = (CKRecordID *)v81;

    uint64_t v83 = objc_opt_class();
    uint64_t v85 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, @"userFetchError");
    userFetchError = v5->_userFetchError;
    v5->_userFetchError = (NSError *)v85;

    uint64_t v88 = v5->_schoolworkUbiquitousContainerURL;
    if (v88)
    {
      uint64_t v89 = (uint64_t)v5->_schoolworkUbiquitousContainerURLSandboxExtension;
      if (v89)
      {
        objc_msgSend_attachSandboxExtensionToken_(v88, v87, v89);
        v5->_hasSecurityScopedSchoolworkUbiquitousContainerURL = objc_msgSend_startAccessingSecurityScopedResource(v5->_schoolworkUbiquitousContainerURL, v90, v91);
      }
    }
    uint64_t v92 = objc_opt_class();
    uint64_t v94 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v92, @"multimediaCacheDirectoryURL");
    multimediaCacheDirectoryURL = v5->_multimediaCacheDirectoryURL;
    v5->_multimediaCacheDirectoryURL = (NSURL *)v94;

    uint64_t v96 = objc_opt_class();
    uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v96, @"multimediaCacheDirectoryURLError");
    multimediaCacheDirectoryURLError = v5->_multimediaCacheDirectoryURLError;
    v5->_multimediaCacheDirectoryURLError = (NSError *)v98;

    uint64_t v100 = objc_opt_class();
    uint64_t v102 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v101, v100, @"multimediaCacheDirectoryURLSandboxExtension");
    multimediaCacheDirectoryURLSandboxExtension = v5->_multimediaCacheDirectoryURLSandboxExtension;
    v5->_multimediaCacheDirectoryURLSandboxExtension = (NSData *)v102;

    v105 = v5->_multimediaCacheDirectoryURL;
    if (v105)
    {
      uint64_t v106 = (uint64_t)v5->_multimediaCacheDirectoryURLSandboxExtension;
      if (v106)
      {
        objc_msgSend_attachSandboxExtensionToken_(v105, v104, v106);
        v5->_hasSecurityScopedMultimediaCacheDirectoryURL = objc_msgSend_startAccessingSecurityScopedResource(v5->_multimediaCacheDirectoryURL, v107, v108);
      }
    }
    v5->_allowSharingOutsideOrg = objc_msgSend_decodeBoolForKey_(v4, v104, @"allowSharingOutsideOrg");
    v5->_classroomClassicAdHocModeEnabled = objc_msgSend_decodeBoolForKey_(v4, v109, @"classroomClassicAdHocModeEnabled");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  person = self->_person;
  id v38 = a3;
  objc_msgSend_encodeObject_forKey_(v38, v5, (uint64_t)person, @"person");
  objc_msgSend_encodeInteger_forKey_(v38, v6, self->_roles, @"roles");
  objc_msgSend_encodeInteger_forKey_(v38, v7, self->_devMode, @"devMode");
  objc_msgSend_encodeInteger_forKey_(v38, v8, self->_catalogEnvironment, @"catalogEnvironment");
  objc_msgSend_encodeObject_forKey_(v38, v9, (uint64_t)self->_locationIDsByAXMRoleType, @"locationIDsByAXMRoleType");
  objc_msgSend_encodeObject_forKey_(v38, v10, (uint64_t)self->_accountIdentifier, @"accountIdentifier");
  objc_msgSend_encodeObject_forKey_(v38, v11, (uint64_t)self->_accountPersonaUniqueIdentifier, @"accountPersonaUniqueIdentifier");
  objc_msgSend_encodeObject_forKey_(v38, v12, (uint64_t)self->_clientPersonaUniqueIdentifier, @"clientPersonaUniqueIdentifier");
  objc_msgSend_encodeBool_forKey_(v38, v13, self->_hasManagedAccount, @"hasManagedAccount");
  objc_msgSend_encodeBool_forKey_(v38, v14, self->_hasEDUAccount, @"hasEDUAccount");
  objc_msgSend_encodeBool_forKey_(v38, v15, self->_hasUbiquityEnabled, @"hasUbiquityEnabled");
  objc_msgSend_encodeBool_forKey_(v38, v16, self->_requiresPersonaMatch, @"requiresPersonaMatch");
  objc_msgSend_encodeBool_forKey_(v38, v17, self->_hasMatchingPersona, @"hasMatchingPersona");
  objc_msgSend_encodeBool_forKey_(v38, v18, self->_hasDataSeparatedAccount, @"hasDataSeparatedAccount");
  objc_msgSend_encodeObject_forKey_(v38, v19, (uint64_t)self->_organizationName, @"organizationName");
  objc_msgSend_encodeBool_forKey_(v38, v20, self->_organizationProgressTrackingAllowed, @"organizationProgressTrackingAllowed");
  objc_msgSend_encodeBool_forKey_(v38, v21, self->_organizationMaidAnalyticsEnabled, @"organizationMaidAnalyticsEnabled");
  objc_msgSend_encodeBool_forKey_(v38, v22, self->_personMaidAnalyticsEnabled, @"personMaidAnalyticsEnabled");
  objc_msgSend_encodeInteger_forKey_(v38, v23, self->_rosterServiceAuthenticationState, @"rosterServiceAuthenticationState");
  objc_msgSend_encodeInteger_forKey_(v38, v24, self->_handoutServiceAuthenticationState, @"handoutServiceAuthenticationState");
  objc_msgSend_encodeInteger_forKey_(v38, v25, self->_iCloudDriveAuthenticationState, @"iCloudDriveAuthenticationState");
  objc_msgSend_encodeObject_forKey_(v38, v26, (uint64_t)self->_schoolworkUbiquitousContainerURL, @"schoolworkUbiquitousContainerURL");
  objc_msgSend_encodeObject_forKey_(v38, v27, (uint64_t)self->_schoolworkUbiquitousContainerError, @"schoolworkUbiquitousContainerError");
  objc_msgSend_encodeObject_forKey_(v38, v28, (uint64_t)self->_schoolworkUbiquitousContainerURLSandboxExtension, @"schoolworkUbiquitousContainerURLSandboxExtension");
  objc_msgSend_encodeObject_forKey_(v38, v29, (uint64_t)self->_orgAdminUserRecordID, @"orgAdminUserRecordID");
  objc_msgSend_encodeObject_forKey_(v38, v30, (uint64_t)self->_orgAdminUserFetchError, @"orgAdminUserFetchError");
  objc_msgSend_encodeObject_forKey_(v38, v31, (uint64_t)self->_userRecordID, @"userRecordID");
  objc_msgSend_encodeObject_forKey_(v38, v32, (uint64_t)self->_userFetchError, @"userFetchError");
  objc_msgSend_encodeObject_forKey_(v38, v33, (uint64_t)self->_multimediaCacheDirectoryURL, @"multimediaCacheDirectoryURL");
  objc_msgSend_encodeObject_forKey_(v38, v34, (uint64_t)self->_multimediaCacheDirectoryURLError, @"multimediaCacheDirectoryURLError");
  objc_msgSend_encodeObject_forKey_(v38, v35, (uint64_t)self->_multimediaCacheDirectoryURLSandboxExtension, @"multimediaCacheDirectoryURLSandboxExtension");
  objc_msgSend_encodeBool_forKey_(v38, v36, self->_allowSharingOutsideOrg, @"allowSharingOutsideOrg");
  objc_msgSend_encodeBool_forKey_(v38, v37, self->_classroomClassicAdHocModeEnabled, @"classroomClassicAdHocModeEnabled");
}

- (void)dealloc
{
  if (self->_hasSecurityScopedSchoolworkUbiquitousContainerURL) {
    objc_msgSend_stopAccessingSecurityScopedResource(self->_schoolworkUbiquitousContainerURL, a2, v2);
  }
  if (self->_hasSecurityScopedMultimediaCacheDirectoryURL) {
    objc_msgSend_stopAccessingSecurityScopedResource(self->_multimediaCacheDirectoryURL, a2, v2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLSCurrentUser;
  [(CLSCurrentUser *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v141.receiver = self;
  v141.super_class = (Class)CLSCurrentUser;
  objc_super v4 = [(CLSCurrentUser *)&v141 description];
  uint64_t v6 = objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  uint64_t v9 = objc_msgSend_organizationName(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v10, @"\n  organizationName:                    %@", v9);

  v13 = objc_msgSend_givenName(self->_person, v11, v12);
  uint64_t v16 = objc_msgSend_middleName(self->_person, v14, v15);
  uint64_t v19 = objc_msgSend_familyName(self->_person, v17, v18);
  v22 = objc_msgSend_appleID(self->_person, v20, v21);
  objc_msgSend_appendFormat_(v6, v23, @"\n  person:                              %@ %@ %@ [%@]", v13, v16, v19, v22);

  v26 = objc_msgSend_accountIdentifier(self, v24, v25);
  objc_msgSend_appendFormat_(v6, v27, @"\n  accountIdentifier:                   %@", v26);

  v30 = objc_msgSend_accountPersonaUniqueIdentifier(self, v28, v29);
  objc_msgSend_appendFormat_(v6, v31, @"\n  accountPersonaUniqueIdentifier:      %@", v30);

  v34 = objc_msgSend_clientPersonaUniqueIdentifier(self, v32, v33);
  objc_msgSend_appendFormat_(v6, v35, @"\n  clientPersonaUniqueIdentifier:       %@", v34);

  if (objc_msgSend_hasDataSeparatedAccount(self, v36, v37)) {
    objc_msgSend_appendFormat_(v6, v38, @"\n  hasDataSeparatedAccount:             %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v38, @"\n  hasDataSeparatedAccount:             %s", "NO");
  }
  if (objc_msgSend_requiresPersonaMatch(self, v39, v40)) {
    objc_msgSend_appendFormat_(v6, v41, @"\n  requiresPersonaMatch:                %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v41, @"\n  requiresPersonaMatch:                %s", "NO");
  }
  if (objc_msgSend_hasMatchingPersona(self, v42, v43)) {
    objc_msgSend_appendFormat_(v6, v44, @"\n  hasMatchingPersona:                  %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v44, @"\n  hasMatchingPersona:                  %s", "NO");
  }
  if (objc_msgSend_isAdministrator(self, v45, v46)) {
    objc_msgSend_appendFormat_(v6, v47, @"\n  isAdministrator:                     %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v47, @"\n  isAdministrator:                     %s", "NO");
  }
  if (objc_msgSend_isInstructor(self, v48, v49)) {
    objc_msgSend_appendFormat_(v6, v50, @"\n  isInstructor:                        %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v50, @"\n  isInstructor:                        %s", "NO");
  }
  if (objc_msgSend_isStudent(self, v51, v52)) {
    objc_msgSend_appendFormat_(v6, v53, @"\n  isStudent:                           %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v53, @"\n  isStudent:                           %s", "NO");
  }
  if (objc_msgSend_hasManagedAccount(self, v54, v55)) {
    objc_msgSend_appendFormat_(v6, v56, @"\n  hasManagedAccount:                   %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v56, @"\n  hasManagedAccount:                   %s", "NO");
  }
  if (objc_msgSend_hasEDUAccount(self, v57, v58)) {
    objc_msgSend_appendFormat_(v6, v59, @"\n  hasEDUAccount:                       %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v59, @"\n  hasEDUAccount:                       %s", "NO");
  }
  if (objc_msgSend_hasUbiquityEnabled(self, v60, v61)) {
    objc_msgSend_appendFormat_(v6, v62, @"\n  hasUbiquityEnabled:                  %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v62, @"\n  hasUbiquityEnabled:                  %s", "NO");
  }
  if (objc_msgSend_organizationProgressTrackingAllowed(self, v63, v64)) {
    objc_msgSend_appendFormat_(v6, v65, @"\n  organizationProgressTrackingAllowed: %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v65, @"\n  organizationProgressTrackingAllowed: %s", "NO");
  }
  if (objc_msgSend_organizationMaidAnalyticsEnabled(self, v66, v67)) {
    objc_msgSend_appendFormat_(v6, v68, @"\n  organizationMaidAnalyticsEnabled:    %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v68, @"\n  organizationMaidAnalyticsEnabled:    %s", "NO");
  }
  if (objc_msgSend_personMaidAnalyticsEnabled(self, v69, v70)) {
    objc_msgSend_appendFormat_(v6, v71, @"\n  personMaidAnalyticsEnabled:          %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v71, @"\n  personMaidAnalyticsEnabled:          %s", "NO");
  }
  uint64_t v74 = objc_msgSend_catalogEnvironment(self, v72, v73);
  uint64_t v76 = NSStringFromClassKitCatalogEnvironment(v74, v75);
  objc_msgSend_appendFormat_(v6, v77, @"\n  catalogEnvironment:                  %@", v76);

  unsigned int v80 = objc_msgSend_rosterServiceAuthenticationState(self, v78, v79);
  v82 = NSStringFromCLSAuthenticationState(v80, v81);
  objc_msgSend_appendFormat_(v6, v83, @"\n  rosterServiceAuthenticationState:    %@", v82);

  unsigned int v86 = objc_msgSend_handoutServiceAuthenticationState(self, v84, v85);
  uint64_t v88 = NSStringFromCLSAuthenticationState(v86, v87);
  objc_msgSend_appendFormat_(v6, v89, @"\n  handoutServiceAuthenticationState:   %@", v88);

  unsigned int v92 = objc_msgSend_iCloudDriveAuthenticationState(self, v90, v91);
  uint64_t v94 = NSStringFromCLSAuthenticationState(v92, v93);
  objc_msgSend_appendFormat_(v6, v95, @"\n  iCloudDriveAuthenticationState:      %@", v94);

  uint64_t v98 = objc_msgSend_schoolworkUbiquitousContainerURL(self, v96, v97);
  v101 = objc_msgSend_path(v98, v99, v100);
  objc_msgSend_appendFormat_(v6, v102, @"\n  schoolworkUbiquitousContainerURL:    %@", v101);

  v105 = objc_msgSend_schoolworkUbiquitousContainerError(self, v103, v104);
  objc_msgSend_appendFormat_(v6, v106, @"\n  schoolworkUbiquitousContainerError:  %@", v105);

  v109 = objc_msgSend_orgAdminUserRecordID(self, v107, v108);
  objc_msgSend_appendFormat_(v6, v110, @"\n  orgAdminUserRecordID:                %@", v109);

  v113 = objc_msgSend_orgAdminUserFetchError(self, v111, v112);
  objc_msgSend_appendFormat_(v6, v114, @"\n  orgAdminUserFetchError:              %@", v113);

  v117 = objc_msgSend_userRecordID(self, v115, v116);
  objc_msgSend_appendFormat_(v6, v118, @"\n  userRecordID:                        %@", v117);

  v121 = objc_msgSend_userFetchError(self, v119, v120);
  objc_msgSend_appendFormat_(v6, v122, @"\n  userFetchError:                      %@", v121);

  v125 = objc_msgSend_multimediaCacheDirectoryURL(self, v123, v124);
  v128 = objc_msgSend_path(v125, v126, v127);
  objc_msgSend_appendFormat_(v6, v129, @"\n  multimediaCacheDirectoryURL:         %@", v128);

  uint64_t v132 = objc_msgSend_multimediaCacheDirectoryURLError(self, v130, v131);
  objc_msgSend_appendFormat_(v6, v133, @"\n  multimediaCacheDirectoryURLError:    %@", v132);

  if (objc_msgSend_allowSharingOutsideOrg(self, v134, v135)) {
    objc_msgSend_appendFormat_(v6, v136, @"\n  allowSharingOutsideOrg:              %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v136, @"\n  allowSharingOutsideOrg:              %s", "NO");
  }
  if (objc_msgSend_classroomClassicAdHocModeEnabled(self, v137, v138)) {
    objc_msgSend_appendFormat_(v6, v139, @"\n  classroomClassicAdHocModeEnabled:    %s", "YES");
  }
  else {
    objc_msgSend_appendFormat_(v6, v139, @"\n  classroomClassicAdHocModeEnabled:    %s", "NO");
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = objc_msgSend_organizationName(self, v4, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"organizationName");

  uint64_t v10 = objc_msgSend_person(self, v8, v9);
  v13 = objc_msgSend_dictionaryRepresentation(v10, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"person");

  uint64_t v17 = objc_msgSend_accountIdentifier(self, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"accountIdentifier");

  uint64_t v21 = objc_msgSend_accountPersonaUniqueIdentifier(self, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, @"accountPersonaUniqueIdentifier");

  uint64_t v25 = objc_msgSend_clientPersonaUniqueIdentifier(self, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, @"clientPersonaUniqueIdentifier");

  if (objc_msgSend_hasDataSeparatedAccount(self, v27, v28)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, @"YES", @"hasDataSeparatedAccount");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, @"NO", @"hasDataSeparatedAccount");
  }
  if (objc_msgSend_requiresPersonaMatch(self, v30, v31)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v32, @"YES", @"requiresPersonaMatch");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v32, @"NO", @"requiresPersonaMatch");
  }
  if (objc_msgSend_hasMatchingPersona(self, v33, v34)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, @"YES", @"hasMatchingPersona");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, @"NO", @"hasMatchingPersona");
  }
  if (objc_msgSend_isAdministrator(self, v36, v37)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, @"YES", @"isAdministrator");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, @"NO", @"isAdministrator");
  }
  if (objc_msgSend_isInstructor(self, v39, v40)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v41, @"YES", @"isTeacher");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v41, @"NO", @"isTeacher");
  }
  if (objc_msgSend_isStudent(self, v42, v43)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, @"YES", @"isStudent");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, @"NO", @"isStudent");
  }
  if (objc_msgSend_hasManagedAccount(self, v45, v46)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v47, @"YES", @"hasManagedAccount");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v47, @"NO", @"hasManagedAccount");
  }
  if (objc_msgSend_hasEDUAccount(self, v48, v49)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v50, @"YES", @"hasEDUAccount");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v50, @"NO", @"hasEDUAccount");
  }
  if (objc_msgSend_hasUbiquityEnabled(self, v51, v52)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v53, @"YES", @"hasUbiquityEnabled");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v53, @"NO", @"hasUbiquityEnabled");
  }
  if (objc_msgSend_organizationProgressTrackingAllowed(self, v54, v55)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v56, @"YES", @"organizationProgressTrackingAllowed");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v56, @"NO", @"organizationProgressTrackingAllowed");
  }
  if (objc_msgSend_organizationMaidAnalyticsEnabled(self, v57, v58)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, @"YES", @"organizationMaidAnalyticsEnabled");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v59, @"NO", @"organizationMaidAnalyticsEnabled");
  }
  if (objc_msgSend_personMaidAnalyticsEnabled(self, v60, v61)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v62, @"YES", @"personMaidAnalyticsEnabled");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v62, @"NO", @"personMaidAnalyticsEnabled");
  }
  uint64_t v65 = objc_msgSend_catalogEnvironment(self, v63, v64);
  uint64_t v67 = NSStringFromClassKitCatalogEnvironment(v65, v66);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, @"catalogEnvironment");

  unsigned int v71 = objc_msgSend_rosterServiceAuthenticationState(self, v69, v70);
  uint64_t v73 = NSStringFromCLSAuthenticationState(v71, v72);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, @"rosterServiceAuthenticationState");

  unsigned int v77 = objc_msgSend_handoutServiceAuthenticationState(self, v75, v76);
  uint64_t v79 = NSStringFromCLSAuthenticationState(v77, v78);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, @"handoutServiceAuthenticationState");

  unsigned int v83 = objc_msgSend_iCloudDriveAuthenticationState(self, v81, v82);
  uint64_t v85 = NSStringFromCLSAuthenticationState(v83, v84);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, @"iCloudDriveAuthenticationState");

  uint64_t v89 = objc_msgSend_schoolworkUbiquitousContainerURL(self, v87, v88);
  unsigned int v92 = objc_msgSend_path(v89, v90, v91);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, @"schoolworkUbiquitousContainerURL");

  uint64_t v96 = objc_msgSend_schoolworkUbiquitousContainerError(self, v94, v95);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v97, (uint64_t)v96, @"schoolworkUbiquitousContainerError");

  uint64_t v100 = objc_msgSend_orgAdminUserRecordID(self, v98, v99);
  uint64_t v103 = objc_msgSend_description(v100, v101, v102);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v104, (uint64_t)v103, @"orgAdminUserRecordID");

  uint64_t v107 = objc_msgSend_orgAdminUserFetchError(self, v105, v106);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v108, (uint64_t)v107, @"orgAdminUserFetchError");

  objc_super v111 = objc_msgSend_userRecordID(self, v109, v110);
  v114 = objc_msgSend_description(v111, v112, v113);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v115, (uint64_t)v114, @"userRecordID");

  v118 = objc_msgSend_userFetchError(self, v116, v117);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v119, (uint64_t)v118, @"userFetchError");

  v122 = objc_msgSend_multimediaCacheDirectoryURL(self, v120, v121);
  v125 = objc_msgSend_path(v122, v123, v124);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v126, (uint64_t)v125, @"multimediaCacheDirectoryURL");

  v129 = objc_msgSend_multimediaCacheDirectoryURLError(self, v127, v128);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v130, (uint64_t)v129, @"multimediaCacheDirectoryURLError");

  if (objc_msgSend_allowSharingOutsideOrg(self, v131, v132)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, @"YES", @"allowSharingOutsideOrg");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, @"NO", @"allowSharingOutsideOrg");
  }
  if (objc_msgSend_classroomClassicAdHocModeEnabled(self, v134, v135)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v136, @"YES", @"classroomClassicAdHocModeEnabled");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v136, @"NO", @"classroomClassicAdHocModeEnabled");
  }

  return v3;
}

- (int)devMode
{
  return self->_devMode;
}

- (void)setDevMode:(int)a3
{
  self->_devMode = a3;
}

- (CLSPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountPersonaUniqueIdentifier
{
  return self->_accountPersonaUniqueIdentifier;
}

- (void)setAccountPersonaUniqueIdentifier:(id)a3
{
}

- (NSString)clientPersonaUniqueIdentifier
{
  return self->_clientPersonaUniqueIdentifier;
}

- (void)setClientPersonaUniqueIdentifier:(id)a3
{
}

- (BOOL)hasDataSeparatedAccount
{
  return self->_hasDataSeparatedAccount;
}

- (void)setHasDataSeparatedAccount:(BOOL)a3
{
  self->_uint64_t hasDataSeparatedAccount = a3;
}

- (BOOL)requiresPersonaMatch
{
  return self->_requiresPersonaMatch;
}

- (void)setRequiresPersonaMatch:(BOOL)a3
{
  self->_requiresPersonaMatch = a3;
}

- (BOOL)hasMatchingPersona
{
  return self->_hasMatchingPersona;
}

- (void)setHasMatchingPersona:(BOOL)a3
{
  self->_uint64_t hasMatchingPersona = a3;
}

- (BOOL)hasManagedAccount
{
  return self->_hasManagedAccount;
}

- (void)setHasManagedAccount:(BOOL)a3
{
  self->_uint64_t hasManagedAccount = a3;
}

- (BOOL)hasEDUAccount
{
  return self->_hasEDUAccount;
}

- (void)setHasEDUAccount:(BOOL)a3
{
  self->_uint64_t hasEDUAccount = a3;
}

- (BOOL)hasUbiquityEnabled
{
  return self->_hasUbiquityEnabled;
}

- (void)setHasUbiquityEnabled:(BOOL)a3
{
  self->_uint64_t hasUbiquityEnabled = a3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (BOOL)organizationProgressTrackingAllowed
{
  return self->_organizationProgressTrackingAllowed;
}

- (void)setOrganizationProgressTrackingAllowed:(BOOL)a3
{
  self->_organizationProgressTrackingAllowed = a3;
}

- (BOOL)organizationMaidAnalyticsEnabled
{
  return self->_organizationMaidAnalyticsEnabled;
}

- (void)setOrganizationMaidAnalyticsEnabled:(BOOL)a3
{
  self->_organizationMaidAnalyticsEnabled = a3;
}

- (BOOL)personMaidAnalyticsEnabled
{
  return self->_personMaidAnalyticsEnabled;
}

- (void)setPersonMaidAnalyticsEnabled:(BOOL)a3
{
  self->_personMaidAnalyticsEnabled = a3;
}

- (BOOL)allowSharingOutsideOrg
{
  return self->_allowSharingOutsideOrg;
}

- (void)setAllowSharingOutsideOrg:(BOOL)a3
{
  self->_allowSharingOutsideOrg = a3;
}

- (BOOL)classroomClassicAdHocModeEnabled
{
  return self->_classroomClassicAdHocModeEnabled;
}

- (void)setClassroomClassicAdHocModeEnabled:(BOOL)a3
{
  self->_classroomClassicAdHocModeEnabled = a3;
}

- (int64_t)catalogEnvironment
{
  return self->_catalogEnvironment;
}

- (void)setCatalogEnvironment:(int64_t)a3
{
  self->_catalogEnvironment = a3;
}

- (int)rosterServiceAuthenticationState
{
  return self->_rosterServiceAuthenticationState;
}

- (void)setRosterServiceAuthenticationState:(int)a3
{
  self->_rosterServiceAuthenticationState = a3;
}

- (int)handoutServiceAuthenticationState
{
  return self->_handoutServiceAuthenticationState;
}

- (void)setHandoutServiceAuthenticationState:(int)a3
{
  self->_handoutServiceAuthenticationState = a3;
}

- (int)iCloudDriveAuthenticationState
{
  return self->_iCloudDriveAuthenticationState;
}

- (void)setICloudDriveAuthenticationState:(int)a3
{
  self->_iCloudDriveAuthenticationState = a3;
}

- (NSURL)schoolworkUbiquitousContainerURL
{
  return self->_schoolworkUbiquitousContainerURL;
}

- (void)setSchoolworkUbiquitousContainerURL:(id)a3
{
}

- (NSError)schoolworkUbiquitousContainerError
{
  return self->_schoolworkUbiquitousContainerError;
}

- (void)setSchoolworkUbiquitousContainerError:(id)a3
{
}

- (CKRecordID)orgAdminUserRecordID
{
  return self->_orgAdminUserRecordID;
}

- (void)setOrgAdminUserRecordID:(id)a3
{
}

- (NSError)orgAdminUserFetchError
{
  return self->_orgAdminUserFetchError;
}

- (void)setOrgAdminUserFetchError:(id)a3
{
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (void)setUserRecordID:(id)a3
{
}

- (NSError)userFetchError
{
  return self->_userFetchError;
}

- (void)setUserFetchError:(id)a3
{
}

- (NSURL)multimediaCacheDirectoryURL
{
  return self->_multimediaCacheDirectoryURL;
}

- (void)setMultimediaCacheDirectoryURL:(id)a3
{
}

- (NSError)multimediaCacheDirectoryURLError
{
  return self->_multimediaCacheDirectoryURLError;
}

- (void)setMultimediaCacheDirectoryURLError:(id)a3
{
}

- (unint64_t)roles
{
  return self->_roles;
}

- (void)setRoles:(unint64_t)a3
{
  self->_roles = a3;
}

- (NSDictionary)locationIDsByAXMRoleType
{
  return self->_locationIDsByAXMRoleType;
}

- (void)setLocationIDsByAXMRoleType:(id)a3
{
}

- (NSData)schoolworkUbiquitousContainerURLSandboxExtension
{
  return self->_schoolworkUbiquitousContainerURLSandboxExtension;
}

- (void)setSchoolworkUbiquitousContainerURLSandboxExtension:(id)a3
{
}

- (NSData)multimediaCacheDirectoryURLSandboxExtension
{
  return self->_multimediaCacheDirectoryURLSandboxExtension;
}

- (void)setMultimediaCacheDirectoryURLSandboxExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerURLSandboxExtension, 0);
  objc_storeStrong((id *)&self->_locationIDsByAXMRoleType, 0);
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURLError, 0);
  objc_storeStrong((id *)&self->_multimediaCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_userFetchError, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_orgAdminUserFetchError, 0);
  objc_storeStrong((id *)&self->_orgAdminUserRecordID, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerError, 0);
  objc_storeStrong((id *)&self->_schoolworkUbiquitousContainerURL, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_clientPersonaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accountPersonaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_person, 0);
}

@end