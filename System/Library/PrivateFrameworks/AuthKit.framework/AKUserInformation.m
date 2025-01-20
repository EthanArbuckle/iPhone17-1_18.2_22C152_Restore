@interface AKUserInformation
+ (BOOL)supportsSecureCoding;
- (AKUserInformation)initWithCoder:(id)a3;
- (AKUserInformation)initWithResponseBody:(id)a3;
- (BOOL)isManagedAppleID;
- (NSArray)accountAliases;
- (NSArray)beneficiaryInfo;
- (NSArray)custodianInfos;
- (NSArray)loginHandles;
- (NSArray)reachableEmails;
- (NSArray)securityKeys;
- (NSArray)trustedPhoneNumbers;
- (NSDictionary)additionalInfo;
- (NSNumber)SOSNeeded;
- (NSNumber)activeHMECount;
- (NSNumber)adpCohort;
- (NSNumber)ageOfMajority;
- (NSNumber)askToBuy;
- (NSNumber)beneficiaryLastModified;
- (NSNumber)birthDay;
- (NSNumber)birthMonth;
- (NSNumber)birthYear;
- (NSNumber)canAttestAge;
- (NSNumber)canBeBeneficiary;
- (NSNumber)canBeCustodian;
- (NSNumber)canHaveBeneficiary;
- (NSNumber)canHaveCustodian;
- (NSNumber)criticalAccountEditsAllowed;
- (NSNumber)custodianEnabled;
- (NSNumber)custodianLastModified;
- (NSNumber)edpState;
- (NSNumber)groupKitEligibility;
- (NSNumber)hasMDM;
- (NSNumber)hasModernRecoveryKey;
- (NSNumber)hasSOSActiveDevice;
- (NSNumber)hasUsedAuthorization;
- (NSNumber)inActiveHMECount;
- (NSNumber)isLegacyStudent;
- (NSNumber)isMdmInfoRequired;
- (NSNumber)isNotificationEmailAvailable;
- (NSNumber)isProximityAuthEligible;
- (NSNumber)isSenior;
- (NSNumber)isSiwaForChildEnabled;
- (NSNumber)isUnderage;
- (NSNumber)managedOrganizationType;
- (NSNumber)passcodeAuthEnabled;
- (NSNumber)passkeyEligible;
- (NSNumber)passkeyPresent;
- (NSNumber)passwordVersion;
- (NSNumber)phoneAsAppleID;
- (NSNumber)piggybackingApprovalEligible;
- (NSNumber)previouslyWantedPrivateEmail;
- (NSNumber)privateAttestationEnabled;
- (NSNumber)serverExperimentalFeatures;
- (NSNumber)silentBurnCDPRepairEnabled;
- (NSNumber)silentEscrowRecordRepairEnabled;
- (NSNumber)silentEscrowRecordRepairEnabledV2;
- (NSNumber)thirdPartyRegulatoryOverride;
- (NSNumber)vettedPrimaryEmail;
- (NSNumber)webAccessEnabled;
- (NSString)accountName;
- (NSString)appleIDCountryCode;
- (NSString)authorizedApplicationsListVersion;
- (NSString)configDataVersion;
- (NSString)deviceListVersion;
- (NSString)familyName;
- (NSString)forwardingEmail;
- (NSString)givenName;
- (NSString)idmsEDPTokenId;
- (NSString)managedOrganizationName;
- (NSString)masterKeyID;
- (NSString)notificationEmail;
- (NSString)previouslySelectedEmail;
- (NSString)primaryEmailAddress;
- (NSString)privateEmailListVersion;
- (NSString)selectedEmail;
- (NSString)srpProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sharedEmailForManagedAppleID;
- (unint64_t)appleIDSecurityLevel;
- (unint64_t)authMode;
- (unint64_t)repairState;
- (unint64_t)userAgeRange;
- (void)_parseBeneficiaryInfo:(id)a3;
- (void)_parseCustodianInfo:(id)a3;
- (void)criticalAccountEditsAllowed;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAliases:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setAdpCohort:(id)a3;
- (void)setAgeOfMajority:(id)a3;
- (void)setAppleIDCountryCode:(id)a3;
- (void)setAppleIDSecurityLevel:(unint64_t)a3;
- (void)setAskToBuy:(id)a3;
- (void)setAuthMode:(unint64_t)a3;
- (void)setAuthorizedApplicationsListVersion:(id)a3;
- (void)setBeneficiaryInfo:(id)a3;
- (void)setBeneficiaryLastModified:(id)a3;
- (void)setBirthDay:(id)a3;
- (void)setBirthMonth:(id)a3;
- (void)setBirthYear:(id)a3;
- (void)setCanAttestAge:(id)a3;
- (void)setCanBeBeneficiary:(id)a3;
- (void)setCanBeCustodian:(id)a3;
- (void)setCanHaveBeneficiary:(id)a3;
- (void)setCanHaveCustodian:(id)a3;
- (void)setConfigDataVersion:(id)a3;
- (void)setCriticalAccountEditsAllowed:(id)a3;
- (void)setCustodianEnabled:(id)a3;
- (void)setCustodianInfos:(id)a3;
- (void)setCustodianLastModified:(id)a3;
- (void)setDeviceListVersion:(id)a3;
- (void)setEdpState:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setForwardingEmail:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGroupKitEligibility:(id)a3;
- (void)setHasMDM:(id)a3;
- (void)setHasModernRecoveryKey:(id)a3;
- (void)setHasSOSActiveDevice:(id)a3;
- (void)setHasUsedAuthorization:(id)a3;
- (void)setIdmsEDPTokenId:(id)a3;
- (void)setIsLegacyStudent:(id)a3;
- (void)setIsMdmInfoRequired:(id)a3;
- (void)setIsNotificationEmailAvailable:(id)a3;
- (void)setIsProximityAuthEligible:(id)a3;
- (void)setIsSenior:(id)a3;
- (void)setIsSiwaForChildEnabled:(id)a3;
- (void)setIsUnderage:(id)a3;
- (void)setLoginHandles:(id)a3;
- (void)setManagedOrganizationName:(id)a3;
- (void)setManagedOrganizationType:(id)a3;
- (void)setMasterKeyID:(id)a3;
- (void)setNotificationEmail:(id)a3;
- (void)setPasscodeAuthEnabled:(id)a3;
- (void)setPasskeyEligible:(id)a3;
- (void)setPasskeyPresent:(id)a3;
- (void)setPasswordVersion:(id)a3;
- (void)setPhoneAsAppleID:(id)a3;
- (void)setPiggybackingApprovalEligible:(id)a3;
- (void)setPreviouslySelectedEmail:(id)a3;
- (void)setPreviouslyWantedPrivateEmail:(id)a3;
- (void)setPrimaryEmailAddress:(id)a3;
- (void)setPrivateAttestationEnabled:(id)a3;
- (void)setPrivateEmailListVersion:(id)a3;
- (void)setReachableEmails:(id)a3;
- (void)setRepairState:(unint64_t)a3;
- (void)setSOSNeeded:(id)a3;
- (void)setSecurityKeys:(id)a3;
- (void)setSelectedEmail:(id)a3;
- (void)setServerExperimentalFeatures:(id)a3;
- (void)setSilentBurnCDPRepairEnabled:(id)a3;
- (void)setSilentEscrowRecordRepairEnabled:(id)a3;
- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3;
- (void)setSrpProtocol:(id)a3;
- (void)setThirdPartyRegulatoryOverride:(id)a3;
- (void)setTrustedPhoneNumbers:(id)a3;
- (void)setUserAgeRange:(unint64_t)a3;
- (void)setVettedPrimaryEmail:(id)a3;
- (void)setWebAccessEnabled:(id)a3;
@end

@implementation AKUserInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKUserInformation)initWithResponseBody:(id)a3
{
  id v4 = a3;
  v277.receiver = self;
  v277.super_class = (Class)AKUserInformation;
  v5 = [(AKUserInformation *)&v277 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ut"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v7 = 0;
    }
    v5->_appleIDSecurityLevel = v7;
    v8 = [v4 objectForKeyedSubscript:@"authmode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v9 = 0;
    }
    v5->_authMode = v9;
    v10 = [v4 objectForKeyedSubscript:@"mdmInfoRequired"];
    objc_opt_class();
    v263 = v10;
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    isMdmInfoRequired = v5->_isMdmInfoRequired;
    v5->_isMdmInfoRequired = v11;

    v13 = [v4 objectForKeyedSubscript:@"underAge"];
    objc_opt_class();
    v262 = v13;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    isUnderage = v5->_isUnderage;
    v5->_isUnderage = v14;

    v16 = [v4 objectForKeyedSubscript:@"isSiwaEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    isSiwaForChildEnabled = v5->_isSiwaForChildEnabled;
    v5->_isSiwaForChildEnabled = v17;

    v19 = [v4 objectForKeyedSubscript:@"userAgeRange"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = [v19 unsignedIntegerValue];
    }
    else {
      uint64_t v20 = 0;
    }
    v5->_userAgeRange = v20;
    v21 = [v4 objectForKeyedSubscript:@"activeHMECount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    activeHMECount = v5->_activeHMECount;
    v5->_activeHMECount = v22;

    v24 = [v4 objectForKeyedSubscript:@"inActiveHMECount"];
    objc_opt_class();
    v258 = v24;
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
    inActiveHMECount = v5->_inActiveHMECount;
    v5->_inActiveHMECount = v25;

    v27 = [v4 objectForKeyedSubscript:@"isSenior"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    isSenior = v5->_isSenior;
    v5->_isSenior = v28;

    v30 = [v4 objectForKeyedSubscript:@"ageOfMajority"];
    objc_opt_class();
    v256 = v30;
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    ageOfMajority = v5->_ageOfMajority;
    v5->_ageOfMajority = v31;

    v33 = [v4 objectForKeyedSubscript:@"studentAccount"];
    objc_opt_class();
    v255 = v33;
    if (objc_opt_isKindOfClass()) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    isLegacyStudent = v5->_isLegacyStudent;
    v5->_isLegacyStudent = v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"mkid"];
    masterKeyID = v5->_masterKeyID;
    v5->_masterKeyID = (NSString *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"accountName"];
    v264 = v8;
    v275 = (void *)v38;
    if (v38)
    {
      v39 = (void *)v38;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = v39;
        accountName = v5->_accountName;
        v5->_accountName = v40;
      }
      else
      {
        accountName = _AKLogSystem();
        if (os_log_type_enabled(accountName, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.45();
        }
      }
    }
    else
    {
      accountName = _AKLogSystem();
      if (os_log_type_enabled(accountName, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:].cold.44();
      }
    }

    uint64_t v42 = [v4 objectForKeyedSubscript:@"primaryEmail"];
    v265 = v6;
    v254 = (void *)v42;
    if (v42)
    {
      v43 = (void *)v42;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v44 = v43;
        primaryEmailAddress = v5->_primaryEmailAddress;
        v5->_primaryEmailAddress = v44;
      }
      else
      {
        primaryEmailAddress = _AKLogSystem();
        if (os_log_type_enabled(primaryEmailAddress, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.43();
        }
      }
    }
    else
    {
      primaryEmailAddress = _AKLogSystem();
      if (os_log_type_enabled(primaryEmailAddress, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:].cold.42();
      }
    }

    v46 = [v4 objectForKeyedSubscript:@"aliases"];
    if (v46)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v47 = [v46 copy];
        p_super = &v5->_accountAliases->super;
        v5->_accountAliases = (NSArray *)v47;
      }
      else
      {
        p_super = _AKLogSystem();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.41();
        }
      }
    }
    else
    {
      p_super = _AKLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:].cold.40();
      }
    }

    v49 = [v4 objectForKeyedSubscript:@"additionalInfo"];
    v252 = v49;
    if (v49)
    {
      uint64_t v50 = [v49 copy];
      v51 = &v5->_additionalInfo->super;
      v5->_additionalInfo = (NSDictionary *)v50;
    }
    else
    {
      v51 = _AKLogSystem();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]9();
      }
    }

    v52 = [v4 objectForKeyedSubscript:@"rep"];
    objc_opt_class();
    v257 = v27;
    if (objc_opt_isKindOfClass()) {
      uint64_t v53 = [v52 unsignedIntegerValue];
    }
    else {
      uint64_t v53 = 0;
    }
    v5->_repairState = v53;
    uint64_t v54 = [v4 objectForKeyedSubscript:@"firstName"];
    v251 = v52;
    v273 = (void *)v54;
    if (v54)
    {
      v55 = (void *)v54;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v56 = v55;
        givenName = v5->_givenName;
        v5->_givenName = v56;
      }
      else
      {
        givenName = _AKLogSystem();
        if (os_log_type_enabled(givenName, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]8();
        }
      }
    }
    else
    {
      givenName = _AKLogSystem();
      if (os_log_type_enabled(givenName, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:]7();
      }
    }

    v58 = [v4 objectForKeyedSubscript:@"lastName"];
    if (v58)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v59 = v58;
        familyName = v5->_familyName;
        v5->_familyName = v59;
      }
      else
      {
        familyName = _AKLogSystem();
        if (os_log_type_enabled(familyName, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]6();
        }
      }
    }
    else
    {
      familyName = _AKLogSystem();
      if (os_log_type_enabled(familyName, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:]5();
      }
    }

    uint64_t v61 = [v4 objectForKeyedSubscript:@"phoneAsAppleId"];
    v272 = (void *)v61;
    if (v61)
    {
      v62 = (void *)v61;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v63 = v62;
        v64 = &v5->_phoneAsAppleID->super.super;
        v5->_phoneAsAppleID = v63;
      }
      else
      {
        phoneAsAppleID = v5->_phoneAsAppleID;
        v5->_phoneAsAppleID = 0;

        v64 = _AKLogSystem();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]4();
        }
      }
    }
    else
    {
      v64 = _AKLogSystem();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]3();
      }
    }

    uint64_t v66 = [v4 objectForKeyedSubscript:@"countryCode"];
    v271 = (void *)v66;
    if (v66)
    {
      v67 = (void *)v66;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v68 = v67;
        appleIDCountryCode = v5->_appleIDCountryCode;
        v5->_appleIDCountryCode = v68;
      }
      else
      {
        appleIDCountryCode = _AKLogSystem();
        if (os_log_type_enabled(appleIDCountryCode, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]2();
        }
      }
    }
    else
    {
      appleIDCountryCode = _AKLogSystem();
      if (os_log_type_enabled(appleIDCountryCode, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:]1();
      }
    }

    v70 = [v4 objectForKeyedSubscript:@"appleIdSignInEnabled"];
    objc_opt_class();
    v261 = v16;
    if (objc_opt_isKindOfClass()) {
      v71 = v70;
    }
    else {
      v71 = 0;
    }
    hasUsedAuthorization = v5->_hasUsedAuthorization;
    v5->_hasUsedAuthorization = v71;

    v73 = [v4 objectForKeyedSubscript:@"privateAttestationEnabled"];
    objc_opt_class();
    v248 = v73;
    if (objc_opt_isKindOfClass()) {
      v74 = v73;
    }
    else {
      v74 = 0;
    }
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = v74;

    v76 = [v4 objectForKeyedSubscript:@"primaryEmailVetted"];
    objc_opt_class();
    v249 = v70;
    if (objc_opt_isKindOfClass())
    {
      v77 = v76;
      vettedPrimaryEmail = v5->_vettedPrimaryEmail;
      v5->_vettedPrimaryEmail = v77;
    }
    else
    {
      v79 = _AKLogSystem();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]0();
      }

      vettedPrimaryEmail = v5->_vettedPrimaryEmail;
      v5->_vettedPrimaryEmail = 0;
    }

    uint64_t v80 = [v4 objectForKeyedSubscript:@"reachableEmails"];
    v270 = (void *)v80;
    if (v80)
    {
      v81 = (void *)v80;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v82 = [v81 copy];
        v83 = &v5->_reachableEmails->super;
        v5->_reachableEmails = (NSArray *)v82;
      }
      else
      {
        v83 = _AKLogSystem();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]9();
        }
      }
    }
    else
    {
      v83 = _AKLogSystem();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]8();
      }
    }

    v84 = [v4 objectForKeyedSubscript:@"hsa2Phones"];
    v246 = v84;
    if ([v84 count])
    {
      uint64_t v85 = [v84 copy];
      v86 = &v5->_trustedPhoneNumbers->super;
      v5->_trustedPhoneNumbers = (NSArray *)v85;
    }
    else
    {
      v86 = _AKLogSystem();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]7();
      }
    }

    v87 = [v4 objectForKeyedSubscript:@"securityKeys"];
    v269 = v87;
    if ([v87 count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v88 = [v87 copy];
        v89 = &v5->_securityKeys->super;
        v5->_securityKeys = (NSArray *)v88;
      }
      else
      {
        v89 = _AKLogSystem();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]6();
        }
      }
    }
    else
    {
      v89 = _AKLogSystem();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]5();
      }
    }

    v90 = [v4 objectForKeyedSubscript:@"loginHandles"];
    v245 = v90;
    if ([v90 count])
    {
      uint64_t v91 = [v90 copy];
      v92 = &v5->_loginHandles->super;
      v5->_loginHandles = (NSArray *)v91;
    }
    else
    {
      v92 = _AKLogSystem();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]4();
      }
    }

    uint64_t v93 = [v4 objectForKeyedSubscript:@"forwardTo"];
    v268 = (void *)v93;
    if (v93)
    {
      v94 = (void *)v93;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v95 = v94;
        forwardingEmail = v5->_forwardingEmail;
        v5->_forwardingEmail = v95;
      }
      else
      {
        forwardingEmail = _AKLogSystem();
        if (os_log_type_enabled(forwardingEmail, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]3();
        }
      }
    }
    else
    {
      forwardingEmail = _AKLogSystem();
      if (os_log_type_enabled(forwardingEmail, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]2();
      }
    }

    v97 = [v4 objectForKeyedSubscript:@"previouslySelectedAsPrivateEmail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v98 = v97;
    }
    else {
      v98 = 0;
    }
    v244 = v97;
    previouslyWantedPrivateEmail = v5->_previouslyWantedPrivateEmail;
    v5->_previouslyWantedPrivateEmail = v98;

    v100 = [v4 objectForKeyedSubscript:@"previouslySelectedEmail"];
    objc_opt_class();
    v274 = v100;
    if (objc_opt_isKindOfClass())
    {
      v101 = v100;
      previouslySelectedEmail = v5->_previouslySelectedEmail;
      v5->_previouslySelectedEmail = v101;
    }
    else
    {
      previouslySelectedEmail = _AKLogSystem();
      if (os_log_type_enabled(previouslySelectedEmail, OS_LOG_TYPE_ERROR)) {
        -[AKUserInformation initWithResponseBody:]1();
      }
    }

    uint64_t v103 = [v4 objectForKeyedSubscript:@"authorizedAppListVersion"];
    v267 = (void *)v103;
    if (v103)
    {
      v104 = (void *)v103;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v105 = v104;
        authorizedApplicationsListVersion = v5->_authorizedApplicationsListVersion;
        v5->_authorizedApplicationsListVersion = v105;
      }
      else
      {
        authorizedApplicationsListVersion = _AKLogSystem();
        if (os_log_type_enabled(authorizedApplicationsListVersion, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]0();
        }
      }
    }
    else
    {
      authorizedApplicationsListVersion = _AKLogSystem();
      if (os_log_type_enabled(authorizedApplicationsListVersion, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]9();
      }
    }

    uint64_t v107 = [v4 objectForKeyedSubscript:@"hmeListVersion"];
    v266 = (void *)v107;
    if (v107)
    {
      v108 = (void *)v107;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v109 = v108;
        privateEmailListVersion = v5->_privateEmailListVersion;
        v5->_privateEmailListVersion = v109;
      }
      else
      {
        privateEmailListVersion = _AKLogSystem();
        if (os_log_type_enabled(privateEmailListVersion, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]8();
        }
      }
    }
    else
    {
      privateEmailListVersion = _AKLogSystem();
      if (os_log_type_enabled(privateEmailListVersion, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193494000, privateEmailListVersion, OS_LOG_TYPE_DEFAULT, "No private email list version set for this account", buf, 2u);
      }
    }

    v111 = [v4 objectForKeyedSubscript:@"canBeCustodian"];
    objc_opt_class();
    v243 = v111;
    if (objc_opt_isKindOfClass())
    {
      v112 = v111;
      v113 = &v5->_canBeCustodian->super.super;
      v5->_canBeCustodian = v112;
    }
    else
    {
      v113 = _AKLogSystem();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]7();
      }
    }

    v114 = [v4 objectForKeyedSubscript:@"canHaveCustodian"];
    objc_opt_class();
    v242 = v114;
    if (objc_opt_isKindOfClass())
    {
      v115 = v114;
      v116 = &v5->_canHaveCustodian->super.super;
      v5->_canHaveCustodian = v115;
    }
    else
    {
      v116 = _AKLogSystem();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]6();
      }
    }

    v117 = [v4 objectForKeyedSubscript:@"custodianEnabled"];
    objc_opt_class();
    v241 = v117;
    if (objc_opt_isKindOfClass())
    {
      v118 = v117;
      v119 = &v5->_custodianEnabled->super.super;
      v5->_custodianEnabled = v118;
    }
    else
    {
      v119 = _AKLogSystem();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]5();
      }
    }

    v120 = [v4 objectForKeyedSubscript:@"custodianLastUpdateDate"];
    objc_opt_class();
    v240 = v120;
    if (objc_opt_isKindOfClass())
    {
      v121 = v120;
      v122 = &v5->_custodianLastModified->super.super;
      v5->_custodianLastModified = v121;
    }
    else
    {
      v122 = _AKLogSystem();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]4();
      }
    }

    v123 = [v4 objectForKeyedSubscript:@"canBeBeneficiary"];
    objc_opt_class();
    v239 = v123;
    if (objc_opt_isKindOfClass())
    {
      v124 = v123;
      v125 = &v5->_canBeBeneficiary->super.super;
      v5->_canBeBeneficiary = v124;
    }
    else
    {
      v125 = _AKLogSystem();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]3();
      }
    }

    v126 = [v4 objectForKeyedSubscript:@"canHaveBeneficiary"];
    objc_opt_class();
    v238 = v126;
    if (objc_opt_isKindOfClass())
    {
      v127 = v126;
      v128 = &v5->_canHaveBeneficiary->super.super;
      v5->_canHaveBeneficiary = v127;
    }
    else
    {
      v128 = _AKLogSystem();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]2();
      }
    }

    v129 = [v4 objectForKeyedSubscript:@"beneficiaryLastUpdateDate"];
    objc_opt_class();
    v237 = v129;
    if (objc_opt_isKindOfClass())
    {
      v130 = v129;
      v131 = &v5->_beneficiaryLastModified->super.super;
      v5->_beneficiaryLastModified = v130;
    }
    else
    {
      v131 = _AKLogSystem();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]1();
      }
    }

    v132 = [v4 objectForKeyedSubscript:@"appleManagedAccount"];
    objc_opt_class();
    v259 = v21;
    v236 = v132;
    if (objc_opt_isKindOfClass())
    {
      v133 = v132;
      v134 = &v5->_hasMDM->super.super;
      v5->_hasMDM = v133;
    }
    else
    {
      v134 = _AKLogSystem();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:]0();
      }
    }

    v135 = [v4 objectForKeyedSubscript:@"orgType"];
    v260 = v19;
    if (v135)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v136 = v76;
        v137 = v58;
        if ([v135 isEqual:@"EDU"])
        {
          v138 = v46;
          v139 = &v5->_managedOrganizationType->super.super;
          v140 = (NSNumber *)&unk_1EE43EA58;
        }
        else
        {
          v138 = v46;
          if ([v135 isEqual:@"ENT"])
          {
            v139 = &v5->_managedOrganizationType->super.super;
            v140 = (NSNumber *)&unk_1EE43EA70;
          }
          else
          {
            v142 = _AKLogSystem();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
              -[AKUserInformation initWithResponseBody:].cold.8();
            }

            v139 = &v5->_managedOrganizationType->super.super;
            v140 = (NSNumber *)&unk_1EE43EA88;
          }
        }
        v5->_managedOrganizationType = v140;
      }
      else
      {
        v139 = _AKLogSystem();
        v136 = v76;
        v137 = v58;
        v138 = v46;
        if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.9();
        }
      }

      v141 = [v4 objectForKeyedSubscript:@"orgName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v5->_managedOrganizationName, v141);
      }
      else
      {
        v143 = _AKLogSystem();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.7();
        }
      }
      v46 = v138;
      v58 = v137;
      v76 = v136;
    }
    else
    {
      v141 = [v4 objectForKeyedSubscript:@"orgName"];
    }
    v235 = v141;
    v144 = [v4 objectForKeyedSubscript:@"notificationEmailAvailable"];
    if (v144)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v145 = v144;
        v146 = &v5->_isNotificationEmailAvailable->super.super;
        v5->_isNotificationEmailAvailable = v145;
      }
      else
      {
        v146 = _AKLogSystem();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.6();
        }
      }
    }
    v247 = v76;
    v147 = [v4 objectForKeyedSubscript:@"notificationEmail"];
    if (v147)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v148 = v147;
        notificationEmail = v5->_notificationEmail;
        v5->_notificationEmail = v148;
      }
      else
      {
        notificationEmail = _AKLogSystem();
        if (os_log_type_enabled(notificationEmail, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:].cold.5();
        }
      }
    }
    v250 = v58;
    v150 = [v4 objectForKeyedSubscript:@"isProximityAuthEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v151 = v150;
      isProximityAuthEligible = v5->_isProximityAuthEligible;
      v5->_isProximityAuthEligible = v151;
    }
    else
    {
      v153 = _AKLogSystem();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG)) {
        -[AKUserInformation initWithResponseBody:].cold.4();
      }

      isProximityAuthEligible = v5->_isProximityAuthEligible;
      v5->_isProximityAuthEligible = 0;
    }

    v154 = _AKLogSystem();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG)) {
      -[AKUserInformation initWithResponseBody:]();
    }

    [(AKUserInformation *)v5 _parseCustodianInfo:v4];
    v155 = _AKLogSystem();
    if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG)) {
      -[AKUserInformation initWithResponseBody:]();
    }

    [(AKUserInformation *)v5 _parseBeneficiaryInfo:v4];
    objc_opt_class();
    id v156 = [v4 objectForKeyedSubscript:@"webAccessEnabled"];
    if (objc_opt_isKindOfClass()) {
      v157 = (NSNumber *)v156;
    }
    else {
      v157 = 0;
    }

    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = v157;

    objc_opt_class();
    id v159 = [v4 objectForKeyedSubscript:@"serverExperimentalFeatures"];
    if (objc_opt_isKindOfClass()) {
      v160 = (NSNumber *)v159;
    }
    else {
      v160 = 0;
    }

    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = v160;

    objc_opt_class();
    id v162 = [v4 objectForKeyedSubscript:@"passkeyEligible"];
    if (objc_opt_isKindOfClass()) {
      v163 = (NSNumber *)v162;
    }
    else {
      v163 = 0;
    }

    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = v163;

    objc_opt_class();
    id v165 = [v4 objectForKeyedSubscript:@"passkeyPresent"];
    if (objc_opt_isKindOfClass()) {
      v166 = (NSNumber *)v165;
    }
    else {
      v166 = 0;
    }

    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = v166;

    objc_opt_class();
    id v168 = [v4 objectForKeyedSubscript:@"groupkitEligibilityInd"];
    if (objc_opt_isKindOfClass()) {
      v169 = (NSNumber *)v168;
    }
    else {
      v169 = 0;
    }

    groupKitEligibility = v5->_groupKitEligibility;
    v5->_groupKitEligibility = v169;

    objc_opt_class();
    id v171 = [v4 objectForKeyedSubscript:@"passcodeAuthEnabled"];
    if (objc_opt_isKindOfClass()) {
      v172 = (NSNumber *)v171;
    }
    else {
      v172 = 0;
    }

    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = v172;

    objc_opt_class();
    id v174 = [v4 objectForKeyedSubscript:@"askToBuy"];
    v253 = v46;
    if (objc_opt_isKindOfClass()) {
      v175 = (NSNumber *)v174;
    }
    else {
      v175 = 0;
    }

    askToBuy = v5->_askToBuy;
    v5->_askToBuy = v175;

    v177 = [v4 objectForKeyedSubscript:@"SOSCompatibilityOptInNeeded"];
    objc_opt_class();
    if (v177)
    {
      v178 = v4;
      v179 = @"SOSCompatibilityOptInNeeded";
    }
    else
    {
      v179 = @"hasSOSActiveDevice";
      v178 = v4;
    }
    id v180 = [v178 objectForKeyedSubscript:v179];
    if (objc_opt_isKindOfClass()) {
      id v181 = v180;
    }
    else {
      id v181 = 0;
    }

    v182 = (NSNumber *)v181;
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = v182;

    objc_opt_class();
    id v184 = [v4 objectForKeyedSubscript:@"SOSNeeded"];
    if (objc_opt_isKindOfClass()) {
      v185 = (NSNumber *)v184;
    }
    else {
      v185 = 0;
    }

    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = v185;

    objc_opt_class();
    id v187 = [v4 objectForKeyedSubscript:@"deviceListVersion"];
    if (objc_opt_isKindOfClass()) {
      v188 = (NSString *)v187;
    }
    else {
      v188 = 0;
    }

    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = v188;

    objc_opt_class();
    id v190 = [v4 objectForKeyedSubscript:@"yob"];
    if (objc_opt_isKindOfClass()) {
      v191 = (NSNumber *)v190;
    }
    else {
      v191 = 0;
    }

    birthYear = v5->_birthYear;
    v5->_birthYear = v191;

    objc_opt_class();
    id v193 = [v4 objectForKeyedSubscript:@"birthMM"];
    if (objc_opt_isKindOfClass()) {
      v194 = (NSNumber *)v193;
    }
    else {
      v194 = 0;
    }

    birthMonth = v5->_birthMonth;
    v5->_birthMonth = v194;

    objc_opt_class();
    id v196 = [v4 objectForKeyedSubscript:@"birthDD"];
    if (objc_opt_isKindOfClass()) {
      v197 = (NSNumber *)v196;
    }
    else {
      v197 = 0;
    }

    birthDay = v5->_birthDay;
    v5->_birthDay = v197;

    objc_opt_class();
    id v199 = [v4 objectForKeyedSubscript:@"parentalAgeConsent"];
    if (objc_opt_isKindOfClass()) {
      v200 = (NSNumber *)v199;
    }
    else {
      v200 = 0;
    }

    canAttestAge = v5->_canAttestAge;
    v5->_canAttestAge = v200;

    v202 = [v4 objectForKeyedSubscript:@"configDataVersion"];
    if (v202)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v203 = v202;
        configDataVersion = v5->_configDataVersion;
        v5->_configDataVersion = v203;
      }
      else
      {
        configDataVersion = _AKLogSystem();
        if (os_log_type_enabled(configDataVersion, OS_LOG_TYPE_ERROR)) {
          -[AKUserInformation initWithResponseBody:]();
        }
      }
    }
    else
    {
      configDataVersion = _AKLogSystem();
      if (os_log_type_enabled(configDataVersion, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193494000, configDataVersion, OS_LOG_TYPE_DEFAULT, "No config data version set for this account", buf, 2u);
      }
    }

    objc_opt_class();
    id v205 = [v4 objectForKeyedSubscript:@"hasRK"];
    if (objc_opt_isKindOfClass()) {
      v206 = (NSNumber *)v205;
    }
    else {
      v206 = 0;
    }

    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = v206;

    objc_opt_class();
    id v208 = [v4 objectForKeyedSubscript:@"3PRegulatoryOverride"];
    if (objc_opt_isKindOfClass()) {
      v209 = (NSNumber *)v208;
    }
    else {
      v209 = 0;
    }

    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = v209;

    objc_opt_class();
    id v211 = [v4 objectForKeyedSubscript:@"isCriticalAccountEditAllowed"];
    if (objc_opt_isKindOfClass()) {
      v212 = (NSNumber *)v211;
    }
    else {
      v212 = 0;
    }

    criticalAccountEditsAllowed = v5->_criticalAccountEditsAllowed;
    v5->_criticalAccountEditsAllowed = v212;

    objc_opt_class();
    id v214 = [v4 objectForKeyedSubscript:@"adpCh"];
    if (objc_opt_isKindOfClass()) {
      v215 = (NSNumber *)v214;
    }
    else {
      v215 = 0;
    }

    adpCohort = v5->_adpCohort;
    v5->_adpCohort = v215;

    v217 = [v4 objectForKeyedSubscript:@"pbae"];

    if (v217)
    {
      objc_opt_class();
      id v218 = [v4 objectForKeyedSubscript:@"pbae"];
      if (objc_opt_isKindOfClass()) {
        v219 = (NSNumber *)v218;
      }
      else {
        v219 = 0;
      }

      piggybackingApprovalEligible = v5->_piggybackingApprovalEligible;
      v5->_piggybackingApprovalEligible = v219;
    }
    objc_opt_class();
    id v221 = [v4 objectForKeyedSubscript:@"edps"];
    if (objc_opt_isKindOfClass()) {
      v222 = (NSNumber *)v221;
    }
    else {
      v222 = 0;
    }

    edpState = v5->_edpState;
    v5->_edpState = v222;

    objc_opt_class();
    id v224 = [v4 objectForKeyedSubscript:@"pv"];
    if (objc_opt_isKindOfClass()) {
      v225 = (NSNumber *)v224;
    }
    else {
      v225 = 0;
    }

    passwordVersion = v5->_passwordVersion;
    v5->_passwordVersion = v225;

    objc_opt_class();
    id v227 = [v4 objectForKeyedSubscript:@"sp"];
    if (objc_opt_isKindOfClass()) {
      v228 = (NSString *)v227;
    }
    else {
      v228 = 0;
    }

    srpProtocol = v5->_srpProtocol;
    v5->_srpProtocol = v228;

    objc_opt_class();
    id v230 = [v4 objectForKeyedSubscript:@"edpTokenId"];
    if (objc_opt_isKindOfClass()) {
      v231 = (NSString *)v230;
    }
    else {
      v231 = 0;
    }

    idmsEDPTokenId = v5->_idmsEDPTokenId;
    v5->_idmsEDPTokenId = v231;
  }
  v233 = v5;

  return v233;
}

- (AKUserInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v171.receiver = self;
  v171.super_class = (Class)AKUserInformation;
  v5 = [(AKUserInformation *)&v171 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_forwardingEmail"];
    forwardingEmail = v5->_forwardingEmail;
    v5->_forwardingEmail = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_primaryEmailAddress"];
    primaryEmailAddress = v5->_primaryEmailAddress;
    v5->_primaryEmailAddress = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountName"];
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_accountAliases"];
    accountAliases = v5->_accountAliases;
    v5->_accountAliases = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_reachableEmails"];
    reachableEmails = v5->_reachableEmails;
    v5->_reachableEmails = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previouslySelectedEmail"];
    previouslySelectedEmail = v5->_previouslySelectedEmail;
    v5->_previouslySelectedEmail = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ageOfMajority"];
    ageOfMajority = v5->_ageOfMajority;
    v5->_ageOfMajority = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authorizedApplicationsListVersion"];
    authorizedApplicationsListVersion = v5->_authorizedApplicationsListVersion;
    v5->_authorizedApplicationsListVersion = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_masterKeyID"];
    masterKeyID = v5->_masterKeyID;
    v5->_masterKeyID = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_vettedPrimaryEmail"];
    vettedPrimaryEmail = v5->_vettedPrimaryEmail;
    v5->_vettedPrimaryEmail = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_phoneAsAppleID"];
    phoneAsAppleID = v5->_phoneAsAppleID;
    v5->_phoneAsAppleID = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isUnderage"];
    isUnderage = v5->_isUnderage;
    v5->_isUnderage = (NSNumber *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isSiwAEnabled"];
    isSiwaForChildEnabled = v5->_isSiwaForChildEnabled;
    v5->_isSiwaForChildEnabled = (NSNumber *)v40;

    v5->_userAgeRange = [v4 decodeIntegerForKey:@"_userAgeRange"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isSenior"];
    isSenior = v5->_isSenior;
    v5->_isSenior = (NSNumber *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isLegacyStudent"];
    isLegacyStudent = v5->_isLegacyStudent;
    v5->_isLegacyStudent = (NSNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasUsedAuthorization"];
    hasUsedAuthorization = v5->_hasUsedAuthorization;
    v5->_hasUsedAuthorization = (NSNumber *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_privateAttestationEnabled"];
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = (NSNumber *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previouslyWantedPrivateEmail"];
    previouslyWantedPrivateEmail = v5->_previouslyWantedPrivateEmail;
    v5->_previouslyWantedPrivateEmail = (NSNumber *)v50;

    v5->_appleIDSecurityLevel = [v4 decodeIntegerForKey:@"_appleIDSecurityLevel"];
    v5->_authMode = [v4 decodeIntegerForKey:@"_authMode"];
    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isMdmInfoRequired"];
    isMdmInfoRequired = v5->_isMdmInfoRequired;
    v5->_isMdmInfoRequired = (NSNumber *)v52;

    v5->_repairState = [v4 decodeIntegerForKey:@"_repairState"];
    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedEmail"];
    selectedEmail = v5->_selectedEmail;
    v5->_selectedEmail = (NSString *)v54;

    v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_msgSend(v56, "setWithObjects:", v57, v58, v59, v60, objc_opt_class(), 0);
    uint64_t v62 = [v4 decodeObjectOfClasses:v61 forKey:@"_additionalInfo"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v62;

    v64 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    uint64_t v67 = [v4 decodeObjectOfClasses:v66 forKey:@"_trustedPhoneNumbers"];
    trustedPhoneNumbers = v5->_trustedPhoneNumbers;
    v5->_trustedPhoneNumbers = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    v72 = objc_msgSend(v69, "setWithObjects:", v70, v71, objc_opt_class(), 0);
    uint64_t v73 = [v4 decodeObjectOfClasses:v72 forKey:@"_securityKeys"];
    securityKeys = v5->_securityKeys;
    v5->_securityKeys = (NSArray *)v73;

    v75 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v76 = objc_opt_class();
    v77 = objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
    uint64_t v78 = [v4 decodeObjectOfClasses:v77 forKey:@"_loginHandles"];
    loginHandles = v5->_loginHandles;
    v5->_loginHandles = (NSArray *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_privateEmailListVersion"];
    privateEmailListVersion = v5->_privateEmailListVersion;
    v5->_privateEmailListVersion = (NSString *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_canBeCustodian"];
    canBeCustodian = v5->_canBeCustodian;
    v5->_canBeCustodian = (NSNumber *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_canHaveCustodian"];
    canHaveCustodian = v5->_canHaveCustodian;
    v5->_canHaveCustodian = (NSNumber *)v84;

    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianEnabled"];
    custodianEnabled = v5->_custodianEnabled;
    v5->_custodianEnabled = (NSNumber *)v86;

    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianLastModified"];
    custodianLastModified = v5->_custodianLastModified;
    v5->_custodianLastModified = (NSNumber *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_canBeBeneficiary"];
    canBeBeneficiary = v5->_canBeBeneficiary;
    v5->_canBeBeneficiary = (NSNumber *)v90;

    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_canHaveBeneficiary"];
    canHaveBeneficiary = v5->_canHaveBeneficiary;
    v5->_canHaveBeneficiary = (NSNumber *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryLastModified"];
    beneficiaryLastModified = v5->_beneficiaryLastModified;
    v5->_beneficiaryLastModified = (NSNumber *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleIDCountryCode"];
    appleIDCountryCode = v5->_appleIDCountryCode;
    v5->_appleIDCountryCode = (NSString *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasMDM"];
    hasMDM = v5->_hasMDM;
    v5->_hasMDM = (NSNumber *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_managedOrganizationType"];
    managedOrganizationType = v5->_managedOrganizationType;
    v5->_managedOrganizationType = (NSNumber *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_managedOrganizationName"];
    managedOrganizationName = v5->_managedOrganizationName;
    v5->_managedOrganizationName = (NSString *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isNotificationEmailAvailable"];
    isNotificationEmailAvailable = v5->_isNotificationEmailAvailable;
    v5->_isNotificationEmailAvailable = (NSNumber *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notificationEmail"];
    notificationEmail = v5->_notificationEmail;
    v5->_notificationEmail = (NSString *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_webAccessEnabled"];
    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = (NSNumber *)v108;

    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverExperimentalFeatures"];
    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = (NSNumber *)v110;

    v112 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v113 = objc_opt_class();
    uint64_t v114 = objc_opt_class();
    v115 = objc_msgSend(v112, "setWithObjects:", v113, v114, objc_opt_class(), 0);
    uint64_t v116 = [v4 decodeObjectOfClasses:v115 forKey:@"_custodianInfos"];
    custodianInfos = v5->_custodianInfos;
    v5->_custodianInfos = (NSArray *)v116;

    v118 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v119 = objc_opt_class();
    uint64_t v120 = objc_opt_class();
    v121 = objc_msgSend(v118, "setWithObjects:", v119, v120, objc_opt_class(), 0);
    uint64_t v122 = [v4 decodeObjectOfClasses:v121 forKey:@"_beneficiaryInfo"];
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (NSArray *)v122;

    uint64_t v124 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passkeyEligible"];
    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = (NSNumber *)v124;

    uint64_t v126 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passkeyPresent"];
    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = (NSNumber *)v126;

    uint64_t v128 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isProximityAuthEligible"];
    isProximityAuthEligible = v5->_isProximityAuthEligible;
    v5->_isProximityAuthEligible = (NSNumber *)v128;

    uint64_t v130 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupKitEligibility"];
    groupKitEligibility = v5->_groupKitEligibility;
    v5->_groupKitEligibility = (NSNumber *)v130;

    uint64_t v132 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passcodeAuthEnabled"];
    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = (NSNumber *)v132;

    uint64_t v134 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_askToBuy"];
    askToBuy = v5->_askToBuy;
    v5->_askToBuy = (NSNumber *)v134;

    uint64_t v136 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasSOSActiveDevice"];
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = (NSNumber *)v136;

    uint64_t v138 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_SOSNeeded"];
    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = (NSNumber *)v138;

    uint64_t v140 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_deviceListVersion"];
    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = (NSString *)v140;

    uint64_t v142 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_configDataVersion"];
    configDataVersion = v5->_configDataVersion;
    v5->_configDataVersion = (NSString *)v142;

    uint64_t v144 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_birthYear"];
    birthYear = v5->_birthYear;
    v5->_birthYear = (NSNumber *)v144;

    uint64_t v146 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_birthDay"];
    birthDay = v5->_birthDay;
    v5->_birthDay = (NSNumber *)v146;

    uint64_t v148 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_birthMonth"];
    birthMonth = v5->_birthMonth;
    v5->_birthMonth = (NSNumber *)v148;

    uint64_t v150 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_canAttestAge"];
    canAttestAge = v5->_canAttestAge;
    v5->_canAttestAge = (NSNumber *)v150;

    uint64_t v152 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasModernRecoveryKey"];
    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = (NSNumber *)v152;

    uint64_t v154 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_thirdPartyRegulatoryOverride"];
    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = (NSNumber *)v154;

    uint64_t v156 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_criticalAccountEditsAllowed"];
    criticalAccountEditsAllowed = v5->_criticalAccountEditsAllowed;
    v5->_criticalAccountEditsAllowed = (NSNumber *)v156;

    uint64_t v158 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_adpCohort"];
    adpCohort = v5->_adpCohort;
    v5->_adpCohort = (NSNumber *)v158;

    uint64_t v160 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_piggybackingApprovalEligible"];
    piggybackingApprovalEligible = v5->_piggybackingApprovalEligible;
    v5->_piggybackingApprovalEligible = (NSNumber *)v160;

    uint64_t v162 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_edpState"];
    edpState = v5->_edpState;
    v5->_edpState = (NSNumber *)v162;

    uint64_t v164 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_passwordVersion"];
    passwordVersion = v5->_passwordVersion;
    v5->_passwordVersion = (NSNumber *)v164;

    uint64_t v166 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_srpProtocol"];
    srpProtocol = v5->_srpProtocol;
    v5->_srpProtocol = (NSString *)v166;

    uint64_t v168 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_idmsEDPTokenId"];
    idmsEDPTokenId = v5->_idmsEDPTokenId;
    v5->_idmsEDPTokenId = (NSString *)v168;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  givenName = self->_givenName;
  id v5 = a3;
  [v5 encodeObject:givenName forKey:@"_givenName"];
  [v5 encodeObject:self->_familyName forKey:@"_familyName"];
  [v5 encodeObject:self->_forwardingEmail forKey:@"_forwardingEmail"];
  [v5 encodeObject:self->_primaryEmailAddress forKey:@"_primaryEmailAddress"];
  [v5 encodeObject:self->_accountName forKey:@"_accountName"];
  [v5 encodeObject:self->_accountAliases forKey:@"_accountAliases"];
  [v5 encodeObject:self->_reachableEmails forKey:@"_reachableEmails"];
  [v5 encodeObject:self->_previouslySelectedEmail forKey:@"_previouslySelectedEmail"];
  [v5 encodeObject:self->_ageOfMajority forKey:@"_ageOfMajority"];
  [v5 encodeObject:self->_authorizedApplicationsListVersion forKey:@"_authorizedApplicationsListVersion"];
  [v5 encodeObject:self->_masterKeyID forKey:@"_masterKeyID"];
  [v5 encodeObject:self->_vettedPrimaryEmail forKey:@"_vettedPrimaryEmail"];
  [v5 encodeObject:self->_phoneAsAppleID forKey:@"_phoneAsAppleID"];
  [v5 encodeObject:self->_isUnderage forKey:@"_isUnderage"];
  [v5 encodeObject:self->_isSiwaForChildEnabled forKey:@"_isSiwAEnabled"];
  [v5 encodeInteger:self->_userAgeRange forKey:@"_userAgeRange"];
  [v5 encodeObject:self->_isSenior forKey:@"_isSenior"];
  [v5 encodeObject:self->_isLegacyStudent forKey:@"_isLegacyStudent"];
  [v5 encodeObject:self->_hasUsedAuthorization forKey:@"_hasUsedAuthorization"];
  [v5 encodeObject:self->_privateAttestationEnabled forKey:@"_privateAttestationEnabled"];
  [v5 encodeObject:self->_previouslyWantedPrivateEmail forKey:@"_previouslyWantedPrivateEmail"];
  [v5 encodeInteger:self->_appleIDSecurityLevel forKey:@"_appleIDSecurityLevel"];
  [v5 encodeInteger:self->_authMode forKey:@"_authMode"];
  [v5 encodeObject:self->_isMdmInfoRequired forKey:@"_isMdmInfoRequired"];
  [v5 encodeInteger:self->_repairState forKey:@"_repairState"];
  [v5 encodeObject:self->_selectedEmail forKey:@"_selectedEmail"];
  [v5 encodeObject:self->_additionalInfo forKey:@"_additionalInfo"];
  [v5 encodeObject:self->_trustedPhoneNumbers forKey:@"_trustedPhoneNumbers"];
  [v5 encodeObject:self->_securityKeys forKey:@"_securityKeys"];
  [v5 encodeObject:self->_loginHandles forKey:@"_loginHandles"];
  [v5 encodeObject:self->_privateEmailListVersion forKey:@"_privateEmailListVersion"];
  [v5 encodeObject:self->_canBeCustodian forKey:@"_canBeCustodian"];
  [v5 encodeObject:self->_canHaveCustodian forKey:@"_canHaveCustodian"];
  [v5 encodeObject:self->_custodianEnabled forKey:@"_custodianEnabled"];
  [v5 encodeObject:self->_custodianLastModified forKey:@"_custodianLastModified"];
  [v5 encodeObject:self->_canBeBeneficiary forKey:@"_canBeBeneficiary"];
  [v5 encodeObject:self->_canHaveBeneficiary forKey:@"_canHaveBeneficiary"];
  [v5 encodeObject:self->_beneficiaryLastModified forKey:@"_beneficiaryLastModified"];
  [v5 encodeObject:self->_appleIDCountryCode forKey:@"_appleIDCountryCode"];
  [v5 encodeObject:self->_hasMDM forKey:@"_hasMDM"];
  [v5 encodeObject:self->_managedOrganizationType forKey:@"_managedOrganizationType"];
  [v5 encodeObject:self->_managedOrganizationName forKey:@"_managedOrganizationName"];
  [v5 encodeObject:self->_isNotificationEmailAvailable forKey:@"_isNotificationEmailAvailable"];
  [v5 encodeObject:self->_notificationEmail forKey:@"_notificationEmail"];
  [v5 encodeObject:self->_webAccessEnabled forKey:@"_webAccessEnabled"];
  [v5 encodeObject:self->_serverExperimentalFeatures forKey:@"_serverExperimentalFeatures"];
  [v5 encodeObject:self->_custodianInfos forKey:@"_custodianInfos"];
  [v5 encodeObject:self->_beneficiaryInfo forKey:@"_beneficiaryInfo"];
  [v5 encodeObject:self->_passkeyEligible forKey:@"_passkeyEligible"];
  [v5 encodeObject:self->_passkeyPresent forKey:@"_passkeyPresent"];
  [v5 encodeObject:self->_isProximityAuthEligible forKey:@"_isProximityAuthEligible"];
  [v5 encodeObject:self->_groupKitEligibility forKey:@"_groupKitEligibility"];
  [v5 encodeObject:self->_passcodeAuthEnabled forKey:@"_passcodeAuthEnabled"];
  [v5 encodeObject:self->_askToBuy forKey:@"_askToBuy"];
  [v5 encodeObject:self->_hasSOSActiveDevice forKey:@"_hasSOSActiveDevice"];
  [v5 encodeObject:self->_SOSNeeded forKey:@"_SOSNeeded"];
  [v5 encodeObject:self->_deviceListVersion forKey:@"_deviceListVersion"];
  [v5 encodeObject:self->_configDataVersion forKey:@"_configDataVersion"];
  [v5 encodeObject:self->_birthYear forKey:@"_birthYear"];
  [v5 encodeObject:self->_birthDay forKey:@"_birthDay"];
  [v5 encodeObject:self->_birthMonth forKey:@"_birthMonth"];
  [v5 encodeObject:self->_canAttestAge forKey:@"_canAttestAge"];
  [v5 encodeObject:self->_hasModernRecoveryKey forKey:@"_hasModernRecoveryKey"];
  [v5 encodeObject:self->_thirdPartyRegulatoryOverride forKey:@"_thirdPartyRegulatoryOverride"];
  [v5 encodeObject:self->_criticalAccountEditsAllowed forKey:@"_criticalAccountEditsAllowed"];
  [v5 encodeObject:self->_adpCohort forKey:@"_adpCohort"];
  [v5 encodeObject:self->_piggybackingApprovalEligible forKey:@"_piggybackingApprovalEligible"];
  [v5 encodeObject:self->_edpState forKey:@"_edpState"];
  [v5 encodeObject:self->_passwordVersion forKey:@"_passwordVersion"];
  [v5 encodeObject:self->_srpProtocol forKey:@"_srpProtocol"];
  [v5 encodeObject:self->_idmsEDPTokenId forKey:@"_idmsEDPTokenId"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKUserInformation);
  id v5 = (void *)[(NSString *)self->_givenName copy];
  [(AKUserInformation *)v4 setGivenName:v5];

  uint64_t v6 = (void *)[(NSString *)self->_familyName copy];
  [(AKUserInformation *)v4 setFamilyName:v6];

  uint64_t v7 = (void *)[(NSString *)self->_forwardingEmail copy];
  [(AKUserInformation *)v4 setForwardingEmail:v7];

  uint64_t v8 = (void *)[(NSString *)self->_primaryEmailAddress copy];
  [(AKUserInformation *)v4 setPrimaryEmailAddress:v8];

  uint64_t v9 = (void *)[(NSString *)self->_accountName copy];
  [(AKUserInformation *)v4 setAccountName:v9];

  uint64_t v10 = (void *)[(NSArray *)self->_accountAliases copy];
  [(AKUserInformation *)v4 setAccountAliases:v10];

  v11 = (void *)[(NSArray *)self->_reachableEmails copy];
  [(AKUserInformation *)v4 setReachableEmails:v11];

  uint64_t v12 = (void *)[(NSString *)self->_authorizedApplicationsListVersion copy];
  [(AKUserInformation *)v4 setAuthorizedApplicationsListVersion:v12];

  v13 = (void *)[(NSString *)self->_masterKeyID copy];
  [(AKUserInformation *)v4 setMasterKeyID:v13];

  uint64_t v14 = (void *)[(NSNumber *)self->_vettedPrimaryEmail copy];
  [(AKUserInformation *)v4 setVettedPrimaryEmail:v14];

  v15 = (void *)[(NSNumber *)self->_phoneAsAppleID copy];
  [(AKUserInformation *)v4 setPhoneAsAppleID:v15];

  v16 = (void *)[(NSNumber *)self->_hasUsedAuthorization copy];
  [(AKUserInformation *)v4 setHasUsedAuthorization:v16];

  uint64_t v17 = (void *)[(NSNumber *)self->_privateAttestationEnabled copy];
  [(AKUserInformation *)v4 setPrivateAttestationEnabled:v17];

  v18 = (void *)[(NSNumber *)self->_isUnderage copy];
  [(AKUserInformation *)v4 setIsUnderage:v18];

  uint64_t v19 = (void *)[(NSNumber *)self->_isSiwaForChildEnabled copy];
  [(AKUserInformation *)v4 setIsSiwaForChildEnabled:v19];

  [(AKUserInformation *)v4 setUserAgeRange:self->_userAgeRange];
  uint64_t v20 = (void *)[(NSNumber *)self->_isSenior copy];
  [(AKUserInformation *)v4 setIsSenior:v20];

  v21 = (void *)[(NSNumber *)self->_ageOfMajority copy];
  [(AKUserInformation *)v4 setAgeOfMajority:v21];

  uint64_t v22 = (void *)[(NSString *)self->_previouslySelectedEmail copy];
  [(AKUserInformation *)v4 setPreviouslySelectedEmail:v22];

  v23 = (void *)[(NSNumber *)self->_previouslyWantedPrivateEmail copy];
  [(AKUserInformation *)v4 setPreviouslyWantedPrivateEmail:v23];

  uint64_t v24 = (void *)[(NSNumber *)self->_isLegacyStudent copy];
  [(AKUserInformation *)v4 setIsLegacyStudent:v24];

  [(AKUserInformation *)v4 setAppleIDSecurityLevel:self->_appleIDSecurityLevel];
  [(AKUserInformation *)v4 setAuthMode:self->_authMode];
  v25 = (void *)[(NSNumber *)self->_isMdmInfoRequired copy];
  [(AKUserInformation *)v4 setIsMdmInfoRequired:v25];

  [(AKUserInformation *)v4 setRepairState:self->_repairState];
  uint64_t v26 = (void *)[(NSString *)self->_selectedEmail copy];
  [(AKUserInformation *)v4 setSelectedEmail:v26];

  v27 = (void *)[(NSDictionary *)self->_additionalInfo copy];
  [(AKUserInformation *)v4 setAdditionalInfo:v27];

  uint64_t v28 = (void *)[(NSArray *)self->_trustedPhoneNumbers copy];
  [(AKUserInformation *)v4 setTrustedPhoneNumbers:v28];

  v29 = (void *)[(NSArray *)self->_securityKeys copy];
  [(AKUserInformation *)v4 setSecurityKeys:v29];

  uint64_t v30 = (void *)[(NSArray *)self->_loginHandles copy];
  [(AKUserInformation *)v4 setLoginHandles:v30];

  v31 = (void *)[(NSNumber *)self->_canBeCustodian copy];
  [(AKUserInformation *)v4 setCanBeCustodian:v31];

  uint64_t v32 = (void *)[(NSNumber *)self->_canHaveCustodian copy];
  [(AKUserInformation *)v4 setCanHaveCustodian:v32];

  v33 = (void *)[(NSNumber *)self->_canBeBeneficiary copy];
  [(AKUserInformation *)v4 setCanBeBeneficiary:v33];

  uint64_t v34 = (void *)[(NSNumber *)self->_canHaveBeneficiary copy];
  [(AKUserInformation *)v4 setCanHaveBeneficiary:v34];

  v35 = (void *)[(NSString *)self->_privateEmailListVersion copy];
  [(AKUserInformation *)v4 setPrivateEmailListVersion:v35];

  uint64_t v36 = (void *)[(NSNumber *)self->_custodianEnabled copy];
  [(AKUserInformation *)v4 setCustodianEnabled:v36];

  v37 = (void *)[(NSNumber *)self->_custodianLastModified copy];
  [(AKUserInformation *)v4 setCustodianLastModified:v37];

  uint64_t v38 = (void *)[(NSNumber *)self->_beneficiaryLastModified copy];
  [(AKUserInformation *)v4 setBeneficiaryLastModified:v38];

  v39 = (void *)[(NSString *)self->_appleIDCountryCode copy];
  [(AKUserInformation *)v4 setAppleIDCountryCode:v39];

  [(AKUserInformation *)v4 setHasMDM:self->_hasMDM];
  uint64_t v40 = (void *)[(NSNumber *)self->_managedOrganizationType copy];
  [(AKUserInformation *)v4 setManagedOrganizationType:v40];

  v41 = (void *)[(NSString *)self->_managedOrganizationName copy];
  [(AKUserInformation *)v4 setManagedOrganizationName:v41];

  uint64_t v42 = (void *)[(NSNumber *)self->_isNotificationEmailAvailable copy];
  [(AKUserInformation *)v4 setIsNotificationEmailAvailable:v42];

  v43 = (void *)[(NSString *)self->_notificationEmail copy];
  [(AKUserInformation *)v4 setNotificationEmail:v43];

  uint64_t v44 = (void *)[(NSNumber *)self->_webAccessEnabled copy];
  [(AKUserInformation *)v4 setWebAccessEnabled:v44];

  v45 = (void *)[(NSNumber *)self->_serverExperimentalFeatures copy];
  [(AKUserInformation *)v4 setServerExperimentalFeatures:v45];

  uint64_t v46 = (void *)[(NSArray *)self->_custodianInfos copy];
  [(AKUserInformation *)v4 setCustodianInfos:v46];

  uint64_t v47 = (void *)[(NSArray *)self->_beneficiaryInfo copy];
  [(AKUserInformation *)v4 setBeneficiaryInfo:v47];

  uint64_t v48 = (void *)[(NSNumber *)self->_passkeyEligible copy];
  [(AKUserInformation *)v4 setPasskeyEligible:v48];

  v49 = (void *)[(NSNumber *)self->_passkeyPresent copy];
  [(AKUserInformation *)v4 setPasskeyPresent:v49];

  uint64_t v50 = (void *)[(NSNumber *)self->_isProximityAuthEligible copy];
  [(AKUserInformation *)v4 setIsProximityAuthEligible:v50];

  v51 = (void *)[(NSNumber *)self->_groupKitEligibility copy];
  [(AKUserInformation *)v4 setGroupKitEligibility:v51];

  uint64_t v52 = (void *)[(NSNumber *)self->_passcodeAuthEnabled copy];
  [(AKUserInformation *)v4 setPasscodeAuthEnabled:v52];

  uint64_t v53 = (void *)[(NSNumber *)self->_askToBuy copy];
  [(AKUserInformation *)v4 setAskToBuy:v53];

  uint64_t v54 = (void *)[(NSNumber *)self->_hasSOSActiveDevice copy];
  [(AKUserInformation *)v4 setHasSOSActiveDevice:v54];

  v55 = (void *)[(NSNumber *)self->_SOSNeeded copy];
  [(AKUserInformation *)v4 setSOSNeeded:v55];

  v56 = (void *)[(NSString *)self->_deviceListVersion copy];
  [(AKUserInformation *)v4 setDeviceListVersion:v56];

  uint64_t v57 = (void *)[(NSString *)self->_configDataVersion copy];
  [(AKUserInformation *)v4 setConfigDataVersion:v57];

  uint64_t v58 = (void *)[(NSNumber *)self->_birthYear copy];
  [(AKUserInformation *)v4 setBirthYear:v58];

  uint64_t v59 = (void *)[(NSNumber *)self->_birthDay copy];
  [(AKUserInformation *)v4 setBirthDay:v59];

  uint64_t v60 = (void *)[(NSNumber *)self->_birthMonth copy];
  [(AKUserInformation *)v4 setBirthMonth:v60];

  uint64_t v61 = (void *)[(NSNumber *)self->_canAttestAge copy];
  [(AKUserInformation *)v4 setCanAttestAge:v61];

  uint64_t v62 = (void *)[(NSNumber *)self->_hasModernRecoveryKey copy];
  [(AKUserInformation *)v4 setHasModernRecoveryKey:v62];

  v63 = (void *)[(NSNumber *)self->_thirdPartyRegulatoryOverride copy];
  [(AKUserInformation *)v4 setThirdPartyRegulatoryOverride:v63];

  v64 = (void *)[(NSNumber *)self->_criticalAccountEditsAllowed copy];
  [(AKUserInformation *)v4 setCriticalAccountEditsAllowed:v64];

  uint64_t v65 = (void *)[(NSNumber *)self->_adpCohort copy];
  [(AKUserInformation *)v4 setAdpCohort:v65];

  uint64_t v66 = (void *)[(NSNumber *)self->_piggybackingApprovalEligible copy];
  [(AKUserInformation *)v4 setPiggybackingApprovalEligible:v66];

  uint64_t v67 = (void *)[(NSNumber *)self->_edpState copy];
  [(AKUserInformation *)v4 setEdpState:v67];

  v68 = (void *)[(NSNumber *)self->_passwordVersion copy];
  [(AKUserInformation *)v4 setPasswordVersion:v68];

  v69 = (void *)[(NSString *)self->_srpProtocol copy];
  [(AKUserInformation *)v4 setSrpProtocol:v69];

  uint64_t v70 = (void *)[(NSString *)self->_idmsEDPTokenId copy];
  [(AKUserInformation *)v4 setIdmsEDPTokenId:v70];

  return v4;
}

- (void)_parseCustodianInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKeyedSubscript:@"custodianInfos"];

  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__AKUserInformation__parseCustodianInfo___block_invoke;
    v15[3] = &unk_1E5761110;
    uint64_t v9 = v8;
    v16 = v9;
    [v7 enumerateObjectsUsingBlock:v15];
    uint64_t v10 = [v9 count];
    v11 = _AKLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[AKUserInformation _parseCustodianInfo:]();
      }
    }
    else if (v12)
    {
      -[AKUserInformation _parseCustodianInfo:]();
    }

    v13 = [v9 copy];
    custodianInfos = self->_custodianInfos;
    self->_custodianInfos = v13;
  }
  else
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKUserInformation _parseCustodianInfo:]();
    }
  }
}

void __41__AKUserInformation__parseCustodianInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v14 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v4 = v14;
    if (!v14) {
      goto LABEL_24;
    }
    objc_opt_class();
    id v5 = [v14 objectForKeyedSubscript:@"custodianUuid"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    objc_opt_class();
    id v7 = [v14 objectForKeyedSubscript:@"status"];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    objc_opt_class();
    id v9 = [v14 objectForKeyedSubscript:@"wrappingKeyHash"];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    objc_opt_class();
    id v11 = [v14 objectForKeyedSubscript:@"prkcHash"];
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v6 && v8)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v13 setValue:v6 forKey:@"custodianUuid"];
      [v13 setValue:v8 forKey:@"status"];
      if (v10) {
        [v13 setValue:v10 forKey:@"wrappingKeyHash"];
      }
      if (v12) {
        [v13 setValue:v12 forKey:@"prkcHash"];
      }
      [*(id *)(a1 + 32) addObject:v13];
    }
  }

  id v4 = v14;
LABEL_24:
}

- (void)_parseBeneficiaryInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKeyedSubscript:@"beneficiaryInfo"];

  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7 && [v7 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__AKUserInformation__parseBeneficiaryInfo___block_invoke;
    v16[3] = &unk_1E5761110;
    id v9 = (NSArray *)v8;
    uint64_t v17 = v9;
    [v7 enumerateObjectsUsingBlock:v16];
    uint64_t v10 = [(NSArray *)v9 count];
    id v11 = _AKLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[AKUserInformation _parseBeneficiaryInfo:]();
      }
    }
    else if (v12)
    {
      -[AKUserInformation _parseBeneficiaryInfo:]();
    }

    id v14 = (NSArray *)[(NSArray *)v9 copy];
    beneficiaryInfo = self->_beneficiaryInfo;
    self->_beneficiaryInfo = v14;
  }
  else
  {
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AKUserInformation _parseBeneficiaryInfo:]();
    }

    id v9 = self->_beneficiaryInfo;
    self->_beneficiaryInfo = 0;
  }
}

void __43__AKUserInformation__parseBeneficiaryInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

    goto LABEL_28;
  }
  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 objectForKeyedSubscript:@"beneficiaryUuid"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    objc_opt_class();
    id v7 = [v4 objectForKeyedSubscript:@"claimCodeHash"];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    objc_opt_class();
    id v9 = [v4 objectForKeyedSubscript:@"wrappedKey"];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    objc_opt_class();
    id v11 = [v4 objectForKeyedSubscript:@"wrappedKeyHash"];
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v6)
    {
      id v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __43__AKUserInformation__parseBeneficiaryInfo___block_invoke_cold_1();
      }

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v14 setValue:v6 forKey:@"beneficiaryUuid"];
      if (v8) {
        [v14 setValue:v8 forKey:@"claimCodeHash"];
      }
      if (v10 && ([v10 isEqual:&stru_1EE40D360] & 1) == 0) {
        [v14 setValue:v10 forKey:@"wrappedKey"];
      }
      if (v12) {
        [v14 setValue:v12 forKey:@"wrappedKeyHash"];
      }
      [*(id *)(a1 + 32) addObject:v14];
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (id)description
{
  id v7 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_msgSend(v7, "stringWithFormat:", @"<%@: %p {\n\tgivenName: %@,\n\tfamilyName: %@,\n\tforwardingEmail: %@,\n\tprimaryEmailAddress: %@,\n\taccountName: %@,\n\taccountAliases: %@,\n\treachableEmails: %@,\n\tauthorizedApplicationsListVersion: %@,\n\tmasterKeyID: %@,\n\tvettedPrimaryEmail: %@,\n\tphoneAsAppleID: %@,\n\tisUnderage: %@,\n\tparentalAgeConsent: %@,\n\tisSiwaForChildEnabled: %@,\n\tuserAgeRange: %lu,\n\tisSenior: %@,\n\tageOfMajority: %@,\n\tisLegacyStudent: %@,\n\tappleIDCountryCode: %@,\n\thasUsedAuthorization: %@, \n\tprivateAttestationEnabled: %@, \n\tappleIDSecurityLevel: %lu,\n\tauthMode: %lu,\n\tisMdmInfoRequired: %@,\n\trepairState: %lu,\n\tselectedEmail: %@,\n\tcanBeCustodian: %@,\n\tcanHaveCustodian: %@,\n\tcustodianEnabled: %@,\n\tcanBeBeneficiary: %@,\n\tcanHaveBeneficiary: %@,\n\thasMDM: %@,\n\tmanagedOrganizationType: %@,\n\tmanagedOrganizationName: %@,\n\tisNotificationEmailAvailable: %@,\n\tnotificationEmail: %@,\n\tadditionalInfo: %@,\n\ttrustedPhoneNumbers: %@,\n\tsecurityKeys: %@,\n\tloginHandles: %@,\n\tprivateEmailListVersion: %@,\n\tisProximityAuthEligible: %@,\n\twebAccessEnabled: %@,\n\tserverExperimentalFeatures: %@,\n\tcustodianInfos: %@,\n\tbeneficiaryInfo: %@,\n\tpasskeyEligible: %@,\n\tpasskeyPresent: %@,\n\tgroupKitEligibility: %@,\n\tpasscodeAuthEnabled: %@,\n\taskToBuy: %@,\n\thasSOSActiveDevice: %@,\n\tSOSNeeded: %@,\n\tdeviceListVersion: %@,\n\tconfigDataVersion: %@,\n\tbirthYear: %@,\n\tcriticalAccountEditsAllowed: %@,\n\thasModernRecoveryKey: %@,\n\tadpCohort: %@,\n\tthirdPartyRegulatoryOverride: %@,\n\tedpState: %@,\n\tpasswordVersion: %@,\n\tsrpProtocol: %@,\n\tidmsEDPTTokenId: %@,\n\tpiggybackingApprovalEligible: %@,\n}>", v4, self, self->_givenName, self->_familyName, self->_forwardingEmail, self->_primaryEmailAddress, self->_accountName, self->_accountAliases, self->_reachableEmails, self->_authorizedApplicationsListVersion, self->_masterKeyID, self->_vettedPrimaryEmail, self->_phoneAsAppleID, self->_isUnderage, self->_canAttestAge, self->_isSiwaForChildEnabled,
    self->_userAgeRange,
    self->_isSenior,
    self->_ageOfMajority,
    self->_isLegacyStudent,
    self->_appleIDCountryCode,
    self->_hasUsedAuthorization,
    self->_privateAttestationEnabled,
    self->_appleIDSecurityLevel,
    self->_authMode,
    self->_isMdmInfoRequired,
    self->_repairState,
    self->_selectedEmail,
    self->_canBeCustodian,
    self->_canHaveCustodian,
    self->_custodianEnabled,
    self->_canBeBeneficiary,
    self->_canHaveBeneficiary,
    self->_hasMDM,
    self->_managedOrganizationType,
    self->_managedOrganizationName,
    self->_isNotificationEmailAvailable,
    self->_notificationEmail,
    self->_additionalInfo,
    self->_trustedPhoneNumbers,
    self->_securityKeys,
    self->_loginHandles,
    self->_privateEmailListVersion,
    self->_isProximityAuthEligible,
    self->_webAccessEnabled,
    self->_serverExperimentalFeatures,
    self->_custodianInfos,
    self->_beneficiaryInfo,
    self->_passkeyEligible,
    self->_passkeyPresent,
    self->_groupKitEligibility,
    self->_passcodeAuthEnabled,
    self->_askToBuy,
    self->_hasSOSActiveDevice,
    self->_SOSNeeded,
    self->_deviceListVersion,
    self->_configDataVersion,
    self->_birthYear,
    self->_criticalAccountEditsAllowed,
  id v5 = self->_hasModernRecoveryKey);

  return v5;
}

- (NSNumber)silentEscrowRecordRepairEnabled
{
  objc_opt_class();
  id v3 = [(NSDictionary *)self->_additionalInfo objectForKeyedSubscript:@"silentEscrowRecordRepairEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSilentEscrowRecordRepairEnabled:(id)a3
{
  additionalInfo = self->_additionalInfo;
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)additionalInfo mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v11 = v8;

  [v11 setObject:v5 forKeyedSubscript:@"silentEscrowRecordRepairEnabled"];
  id v9 = (NSDictionary *)[v11 copy];
  id v10 = self->_additionalInfo;
  self->_additionalInfo = v9;
}

- (NSNumber)silentBurnCDPRepairEnabled
{
  objc_opt_class();
  id v3 = [(NSDictionary *)self->_additionalInfo objectForKeyedSubscript:@"silenBurnMiniBuddyEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSilentBurnCDPRepairEnabled:(id)a3
{
  additionalInfo = self->_additionalInfo;
  id v5 = a3;
  id v6 = (void *)[(NSDictionary *)additionalInfo mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v11 = v8;

  [v11 setObject:v5 forKeyedSubscript:@"silenBurnMiniBuddyEnabled"];
  id v9 = (NSDictionary *)[v11 copy];
  id v10 = self->_additionalInfo;
  self->_additionalInfo = v9;
}

- (BOOL)isManagedAppleID
{
  return self->_appleIDSecurityLevel == 5;
}

- (id)sharedEmailForManagedAppleID
{
  if ([(AKUserInformation *)self isManagedAppleID]
    && [(NSNumber *)self->_isNotificationEmailAvailable BOOLValue])
  {
    id v3 = [(NSString *)self->_notificationEmail length];
    if (v3) {
      id v3 = self->_notificationEmail;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSNumber)criticalAccountEditsAllowed
{
  uint64_t v2 = [(NSNumber *)self->_criticalAccountEditsAllowed BOOLValue];
  id v3 = +[AKConfiguration sharedConfiguration];
  uint64_t v4 = [v3 criticalAccountEditsAllowedOverride];

  uint64_t v5 = AKConfigApplyOverride(v4, v2);
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(AKUserInformation *)v5 criticalAccountEditsAllowed];
  }

  id v7 = [NSNumber numberWithBool:v5];

  return (NSNumber *)v7;
}

- (NSNumber)activeHMECount
{
  return self->_activeHMECount;
}

- (NSNumber)inActiveHMECount
{
  return self->_inActiveHMECount;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)forwardingEmail
{
  return self->_forwardingEmail;
}

- (void)setForwardingEmail:(id)a3
{
}

- (NSString)previouslySelectedEmail
{
  return self->_previouslySelectedEmail;
}

- (void)setPreviouslySelectedEmail:(id)a3
{
}

- (NSString)primaryEmailAddress
{
  return self->_primaryEmailAddress;
}

- (void)setPrimaryEmailAddress:(id)a3
{
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSArray)accountAliases
{
  return self->_accountAliases;
}

- (void)setAccountAliases:(id)a3
{
}

- (NSArray)reachableEmails
{
  return self->_reachableEmails;
}

- (void)setReachableEmails:(id)a3
{
}

- (NSString)authorizedApplicationsListVersion
{
  return self->_authorizedApplicationsListVersion;
}

- (void)setAuthorizedApplicationsListVersion:(id)a3
{
}

- (NSString)masterKeyID
{
  return self->_masterKeyID;
}

- (void)setMasterKeyID:(id)a3
{
}

- (NSNumber)vettedPrimaryEmail
{
  return self->_vettedPrimaryEmail;
}

- (void)setVettedPrimaryEmail:(id)a3
{
}

- (NSNumber)phoneAsAppleID
{
  return self->_phoneAsAppleID;
}

- (void)setPhoneAsAppleID:(id)a3
{
}

- (NSNumber)isUnderage
{
  return self->_isUnderage;
}

- (void)setIsUnderage:(id)a3
{
}

- (NSNumber)isSiwaForChildEnabled
{
  return self->_isSiwaForChildEnabled;
}

- (void)setIsSiwaForChildEnabled:(id)a3
{
}

- (unint64_t)userAgeRange
{
  return self->_userAgeRange;
}

- (void)setUserAgeRange:(unint64_t)a3
{
  self->_userAgeRange = a3;
}

- (NSNumber)isSenior
{
  return self->_isSenior;
}

- (void)setIsSenior:(id)a3
{
}

- (NSNumber)ageOfMajority
{
  return self->_ageOfMajority;
}

- (void)setAgeOfMajority:(id)a3
{
}

- (NSNumber)isLegacyStudent
{
  return self->_isLegacyStudent;
}

- (void)setIsLegacyStudent:(id)a3
{
}

- (NSNumber)hasUsedAuthorization
{
  return self->_hasUsedAuthorization;
}

- (void)setHasUsedAuthorization:(id)a3
{
}

- (NSNumber)privateAttestationEnabled
{
  return self->_privateAttestationEnabled;
}

- (void)setPrivateAttestationEnabled:(id)a3
{
}

- (NSNumber)previouslyWantedPrivateEmail
{
  return self->_previouslyWantedPrivateEmail;
}

- (void)setPreviouslyWantedPrivateEmail:(id)a3
{
}

- (unint64_t)appleIDSecurityLevel
{
  return self->_appleIDSecurityLevel;
}

- (void)setAppleIDSecurityLevel:(unint64_t)a3
{
  self->_appleIDSecurityLevel = a3;
}

- (unint64_t)authMode
{
  return self->_authMode;
}

- (void)setAuthMode:(unint64_t)a3
{
  self->_authMode = a3;
}

- (NSNumber)isMdmInfoRequired
{
  return self->_isMdmInfoRequired;
}

- (void)setIsMdmInfoRequired:(id)a3
{
}

- (unint64_t)repairState
{
  return self->_repairState;
}

- (void)setRepairState:(unint64_t)a3
{
  self->_repairState = a3;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (NSArray)trustedPhoneNumbers
{
  return self->_trustedPhoneNumbers;
}

- (void)setTrustedPhoneNumbers:(id)a3
{
}

- (NSArray)securityKeys
{
  return self->_securityKeys;
}

- (void)setSecurityKeys:(id)a3
{
}

- (NSArray)loginHandles
{
  return self->_loginHandles;
}

- (void)setLoginHandles:(id)a3
{
}

- (NSString)privateEmailListVersion
{
  return self->_privateEmailListVersion;
}

- (void)setPrivateEmailListVersion:(id)a3
{
}

- (NSNumber)webAccessEnabled
{
  return self->_webAccessEnabled;
}

- (void)setWebAccessEnabled:(id)a3
{
}

- (NSNumber)serverExperimentalFeatures
{
  return self->_serverExperimentalFeatures;
}

- (void)setServerExperimentalFeatures:(id)a3
{
}

- (NSNumber)isProximityAuthEligible
{
  return self->_isProximityAuthEligible;
}

- (void)setIsProximityAuthEligible:(id)a3
{
}

- (NSArray)custodianInfos
{
  return self->_custodianInfos;
}

- (void)setCustodianInfos:(id)a3
{
}

- (NSArray)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (void)setBeneficiaryInfo:(id)a3
{
}

- (NSNumber)passkeyEligible
{
  return self->_passkeyEligible;
}

- (void)setPasskeyEligible:(id)a3
{
}

- (NSNumber)passkeyPresent
{
  return self->_passkeyPresent;
}

- (void)setPasskeyPresent:(id)a3
{
}

- (NSNumber)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (void)setPasscodeAuthEnabled:(id)a3
{
}

- (NSNumber)askToBuy
{
  return self->_askToBuy;
}

- (void)setAskToBuy:(id)a3
{
}

- (NSNumber)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (void)setHasSOSActiveDevice:(id)a3
{
}

- (NSNumber)SOSNeeded
{
  return self->_SOSNeeded;
}

- (void)setSOSNeeded:(id)a3
{
}

- (NSString)deviceListVersion
{
  return self->_deviceListVersion;
}

- (void)setDeviceListVersion:(id)a3
{
}

- (NSString)configDataVersion
{
  return self->_configDataVersion;
}

- (void)setConfigDataVersion:(id)a3
{
}

- (NSNumber)hasModernRecoveryKey
{
  return self->_hasModernRecoveryKey;
}

- (void)setHasModernRecoveryKey:(id)a3
{
}

- (NSNumber)thirdPartyRegulatoryOverride
{
  return self->_thirdPartyRegulatoryOverride;
}

- (void)setThirdPartyRegulatoryOverride:(id)a3
{
}

- (NSNumber)adpCohort
{
  return self->_adpCohort;
}

- (void)setAdpCohort:(id)a3
{
}

- (NSNumber)edpState
{
  return self->_edpState;
}

- (void)setEdpState:(id)a3
{
}

- (NSNumber)passwordVersion
{
  return self->_passwordVersion;
}

- (void)setPasswordVersion:(id)a3
{
}

- (NSString)srpProtocol
{
  return self->_srpProtocol;
}

- (void)setSrpProtocol:(id)a3
{
}

- (NSString)idmsEDPTokenId
{
  return self->_idmsEDPTokenId;
}

- (void)setIdmsEDPTokenId:(id)a3
{
}

- (NSString)appleIDCountryCode
{
  return self->_appleIDCountryCode;
}

- (void)setAppleIDCountryCode:(id)a3
{
}

- (NSNumber)custodianEnabled
{
  return self->_custodianEnabled;
}

- (void)setCustodianEnabled:(id)a3
{
}

- (NSNumber)canHaveCustodian
{
  return self->_canHaveCustodian;
}

- (void)setCanHaveCustodian:(id)a3
{
}

- (NSNumber)canBeCustodian
{
  return self->_canBeCustodian;
}

- (void)setCanBeCustodian:(id)a3
{
}

- (NSNumber)canHaveBeneficiary
{
  return self->_canHaveBeneficiary;
}

- (void)setCanHaveBeneficiary:(id)a3
{
}

- (NSNumber)canBeBeneficiary
{
  return self->_canBeBeneficiary;
}

- (void)setCanBeBeneficiary:(id)a3
{
}

- (NSNumber)custodianLastModified
{
  return self->_custodianLastModified;
}

- (void)setCustodianLastModified:(id)a3
{
}

- (NSNumber)beneficiaryLastModified
{
  return self->_beneficiaryLastModified;
}

- (void)setBeneficiaryLastModified:(id)a3
{
}

- (NSNumber)hasMDM
{
  return self->_hasMDM;
}

- (void)setHasMDM:(id)a3
{
}

- (NSNumber)canAttestAge
{
  return self->_canAttestAge;
}

- (void)setCanAttestAge:(id)a3
{
}

- (NSString)selectedEmail
{
  return self->_selectedEmail;
}

- (void)setSelectedEmail:(id)a3
{
}

- (NSNumber)managedOrganizationType
{
  return self->_managedOrganizationType;
}

- (void)setManagedOrganizationType:(id)a3
{
}

- (NSString)managedOrganizationName
{
  return self->_managedOrganizationName;
}

- (void)setManagedOrganizationName:(id)a3
{
}

- (NSNumber)isNotificationEmailAvailable
{
  return self->_isNotificationEmailAvailable;
}

- (void)setIsNotificationEmailAvailable:(id)a3
{
}

- (NSString)notificationEmail
{
  return self->_notificationEmail;
}

- (void)setNotificationEmail:(id)a3
{
}

- (NSNumber)silentEscrowRecordRepairEnabledV2
{
  return self->_silentEscrowRecordRepairEnabledV2;
}

- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3
{
}

- (NSNumber)groupKitEligibility
{
  return self->_groupKitEligibility;
}

- (void)setGroupKitEligibility:(id)a3
{
}

- (NSNumber)birthYear
{
  return self->_birthYear;
}

- (void)setBirthYear:(id)a3
{
}

- (NSNumber)birthDay
{
  return self->_birthDay;
}

- (void)setBirthDay:(id)a3
{
}

- (NSNumber)birthMonth
{
  return self->_birthMonth;
}

- (void)setBirthMonth:(id)a3
{
}

- (void)setCriticalAccountEditsAllowed:(id)a3
{
}

- (NSNumber)piggybackingApprovalEligible
{
  return self->_piggybackingApprovalEligible;
}

- (void)setPiggybackingApprovalEligible:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_piggybackingApprovalEligible, 0);
  objc_storeStrong((id *)&self->_criticalAccountEditsAllowed, 0);
  objc_storeStrong((id *)&self->_birthMonth, 0);
  objc_storeStrong((id *)&self->_birthDay, 0);
  objc_storeStrong((id *)&self->_birthYear, 0);
  objc_storeStrong((id *)&self->_groupKitEligibility, 0);
  objc_storeStrong((id *)&self->_silentEscrowRecordRepairEnabledV2, 0);
  objc_storeStrong((id *)&self->_notificationEmail, 0);
  objc_storeStrong((id *)&self->_isNotificationEmailAvailable, 0);
  objc_storeStrong((id *)&self->_managedOrganizationName, 0);
  objc_storeStrong((id *)&self->_managedOrganizationType, 0);
  objc_storeStrong((id *)&self->_selectedEmail, 0);
  objc_storeStrong((id *)&self->_canAttestAge, 0);
  objc_storeStrong((id *)&self->_hasMDM, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastModified, 0);
  objc_storeStrong((id *)&self->_custodianLastModified, 0);
  objc_storeStrong((id *)&self->_canBeBeneficiary, 0);
  objc_storeStrong((id *)&self->_canHaveBeneficiary, 0);
  objc_storeStrong((id *)&self->_canBeCustodian, 0);
  objc_storeStrong((id *)&self->_canHaveCustodian, 0);
  objc_storeStrong((id *)&self->_custodianEnabled, 0);
  objc_storeStrong((id *)&self->_appleIDCountryCode, 0);
  objc_storeStrong((id *)&self->_idmsEDPTokenId, 0);
  objc_storeStrong((id *)&self->_srpProtocol, 0);
  objc_storeStrong((id *)&self->_passwordVersion, 0);
  objc_storeStrong((id *)&self->_edpState, 0);
  objc_storeStrong((id *)&self->_adpCohort, 0);
  objc_storeStrong((id *)&self->_thirdPartyRegulatoryOverride, 0);
  objc_storeStrong((id *)&self->_hasModernRecoveryKey, 0);
  objc_storeStrong((id *)&self->_configDataVersion, 0);
  objc_storeStrong((id *)&self->_deviceListVersion, 0);
  objc_storeStrong((id *)&self->_SOSNeeded, 0);
  objc_storeStrong((id *)&self->_hasSOSActiveDevice, 0);
  objc_storeStrong((id *)&self->_askToBuy, 0);
  objc_storeStrong((id *)&self->_passcodeAuthEnabled, 0);
  objc_storeStrong((id *)&self->_passkeyPresent, 0);
  objc_storeStrong((id *)&self->_passkeyEligible, 0);
  objc_storeStrong((id *)&self->_beneficiaryInfo, 0);
  objc_storeStrong((id *)&self->_custodianInfos, 0);
  objc_storeStrong((id *)&self->_isProximityAuthEligible, 0);
  objc_storeStrong((id *)&self->_serverExperimentalFeatures, 0);
  objc_storeStrong((id *)&self->_webAccessEnabled, 0);
  objc_storeStrong((id *)&self->_privateEmailListVersion, 0);
  objc_storeStrong((id *)&self->_loginHandles, 0);
  objc_storeStrong((id *)&self->_securityKeys, 0);
  objc_storeStrong((id *)&self->_trustedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_isMdmInfoRequired, 0);
  objc_storeStrong((id *)&self->_previouslyWantedPrivateEmail, 0);
  objc_storeStrong((id *)&self->_privateAttestationEnabled, 0);
  objc_storeStrong((id *)&self->_hasUsedAuthorization, 0);
  objc_storeStrong((id *)&self->_isLegacyStudent, 0);
  objc_storeStrong((id *)&self->_ageOfMajority, 0);
  objc_storeStrong((id *)&self->_isSenior, 0);
  objc_storeStrong((id *)&self->_isSiwaForChildEnabled, 0);
  objc_storeStrong((id *)&self->_isUnderage, 0);
  objc_storeStrong((id *)&self->_phoneAsAppleID, 0);
  objc_storeStrong((id *)&self->_vettedPrimaryEmail, 0);
  objc_storeStrong((id *)&self->_masterKeyID, 0);
  objc_storeStrong((id *)&self->_authorizedApplicationsListVersion, 0);
  objc_storeStrong((id *)&self->_reachableEmails, 0);
  objc_storeStrong((id *)&self->_accountAliases, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_primaryEmailAddress, 0);
  objc_storeStrong((id *)&self->_previouslySelectedEmail, 0);
  objc_storeStrong((id *)&self->_forwardingEmail, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_inActiveHMECount, 0);

  objc_storeStrong((id *)&self->_activeHMECount, 0);
}

- (void)initWithResponseBody:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Config data version value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Parsing beneficiaryInfo.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Parsing custodianInfo.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "isProximityAuthEligible is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.5()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Managed organization notificationEmail value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.6()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Managed organization isNotificationEmailAvailable value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.7()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Managed organization name value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "Managed organization type has an invalid value: %@", v1, 0xCu);
}

- (void)initWithResponseBody:.cold.9()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Managed organization type value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "hasMDM is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "beneficiaryLastModified is missing or has invalid type.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "canHaveBeneficiary is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "canBeBeneficiary is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "CustodianLastModified is missing or has invalid type.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.15()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "custodianEnabled is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "CanHaveCustodian is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.17()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "CanBeCustodian is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.18()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Private email list version value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.19()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No authorized applications list version set for this account", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.20()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Authorized applications list version value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.21()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Previously selected email value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.22()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No Forwarding email set for this account", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.23()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Forwarding email value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.24()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No login handles for account.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.25()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No security keys for account.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.26()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Security Keys value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.27()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No trusted phone numbers for account.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.28()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No reachable emails for account", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.29()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "User reachable emails value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.30()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "User vetted primary email is missing, Possibly unverified or Mako Account.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.31()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "User Apple ID country code is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.32()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "User apple id country code value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.33()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Mako Account Identifier Missing", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.34()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Mako Account Identifier value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.35()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "User family name is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.36()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "User family name value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.37()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "User given name is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.38()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "User given name name value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.39()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No additional Info.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.40()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No aliases.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.41()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Aliases array value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.42()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Primary email address is missing, probably MAKO account.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.43()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Primary email address value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)initWithResponseBody:.cold.44()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Account name is missing.", v2, v3, v4, v5, v6);
}

- (void)initWithResponseBody:.cold.45()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Account name value has an invalid type: %@", v4, v5, v6, v7, v8);
}

- (void)_parseCustodianInfo:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No custodian info in response.", v2, v3, v4, v5, v6);
}

- (void)_parseCustodianInfo:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No valid Custodian Info found in custodianInfos array.", v2, v3, v4, v5, v6);
}

- (void)_parseCustodianInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Valid Custodian Info found in custodianInfos array %@", v2, v3, v4, v5, v6);
}

- (void)_parseBeneficiaryInfo:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No beneficiary info for account.", v2, v3, v4, v5, v6);
}

- (void)_parseBeneficiaryInfo:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "No valid Beneficiary Info found in beneficiaryInfoArray.", v2, v3, v4, v5, v6);
}

- (void)_parseBeneficiaryInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Beneficiary Info found for account %@", v2, v3, v4, v5, v6);
}

void __43__AKUserInformation__parseBeneficiaryInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Adding beneficiaryInfo for UUID: %@", v2, v3, v4, v5, v6);
}

- (void)criticalAccountEditsAllowed
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "criticalAccountEditsAllowed finalValue: %d", (uint8_t *)v2, 8u);
}

@end