@interface IDSRegistrationAccountStatusMetric
- (BOOL)areAllAliasesSelected;
- (BOOL)areAllSelectedAliasesRegistered;
- (BOOL)doesExist;
- (BOOL)doesMatchiCloudAccount;
- (BOOL)hasEverRegistered;
- (BOOL)isEnabled;
- (BOOL)isProdEnvironment;
- (BOOL)isUserDisabled;
- (BOOL)isiCloudSignedIn;
- (BOOL)isiTunesSignedIn;
- (IDSRegistrationAccountStatusMetric)initWithAccountType:(int)a3 serviceIdentifier:(id)a4 doesExist:(BOOL)a5 isEnabled:(BOOL)a6 isUserDisabled:(BOOL)a7 isiCloudSignedIn:(BOOL)a8 doesMatchiCloudAccount:(BOOL)a9 isiTunesSignedIn:(BOOL)a10 registrationError:(int64_t)a11 registrationErrorReason:(int)a12 registrationStatus:(int64_t)a13 accountRegistrationStatus:(int)a14 hasEverRegistered:(BOOL)a15 lastRegistrationFailureError:(int64_t)a16 timeIntervalSinceLastRegistrationFailure:(double)a17 timeIntervalSinceLastRegistrationSuccess:(double)a18 accountSecurityLevel:(int64_t)a19 areAllAliasesSelected:(BOOL)a20 areAllSelectedAliasesRegistered:(BOOL)a21 numberOfSelected:(int64_t)a22 numberOfVetted:(int64_t)a23 numberOfUnselectReasonUnknown:(int64_t)a24 numberOfUnselectReasonAlertDenial:(int64_t)a25 numberOfUnselectReasonClientCall:(int64_t)a26 numberOfUnselectReasonBadAlias:(int64_t)a27 numberOfUnselectReasonUpdateInfo:(int64_t)a28 isProdEnvironment:(BOOL)a29;
- (NSCopying)awdRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)name;
- (NSString)serviceIdentifier;
- (double)timeIntervalSinceLastRegistrationFailure;
- (double)timeIntervalSinceLastRegistrationSuccess;
- (int)accountRegistrationStatus;
- (int)accountType;
- (int)registrationErrorReason;
- (int64_t)accountSecurityLevel;
- (int64_t)lastRegistrationFailureError;
- (int64_t)numberOfSelected;
- (int64_t)numberOfUnselectReasonAlertDenial;
- (int64_t)numberOfUnselectReasonBadAlias;
- (int64_t)numberOfUnselectReasonClientCall;
- (int64_t)numberOfUnselectReasonUnknown;
- (int64_t)numberOfUnselectReasonUpdateInfo;
- (int64_t)numberOfVetted;
- (int64_t)registrationError;
- (int64_t)registrationStatus;
- (unsigned)awdIdentifier;
- (unsigned)rtcType;
@end

@implementation IDSRegistrationAccountStatusMetric

- (IDSRegistrationAccountStatusMetric)initWithAccountType:(int)a3 serviceIdentifier:(id)a4 doesExist:(BOOL)a5 isEnabled:(BOOL)a6 isUserDisabled:(BOOL)a7 isiCloudSignedIn:(BOOL)a8 doesMatchiCloudAccount:(BOOL)a9 isiTunesSignedIn:(BOOL)a10 registrationError:(int64_t)a11 registrationErrorReason:(int)a12 registrationStatus:(int64_t)a13 accountRegistrationStatus:(int)a14 hasEverRegistered:(BOOL)a15 lastRegistrationFailureError:(int64_t)a16 timeIntervalSinceLastRegistrationFailure:(double)a17 timeIntervalSinceLastRegistrationSuccess:(double)a18 accountSecurityLevel:(int64_t)a19 areAllAliasesSelected:(BOOL)a20 areAllSelectedAliasesRegistered:(BOOL)a21 numberOfSelected:(int64_t)a22 numberOfVetted:(int64_t)a23 numberOfUnselectReasonUnknown:(int64_t)a24 numberOfUnselectReasonAlertDenial:(int64_t)a25 numberOfUnselectReasonClientCall:(int64_t)a26 numberOfUnselectReasonBadAlias:(int64_t)a27 numberOfUnselectReasonUpdateInfo:(int64_t)a28 isProdEnvironment:(BOOL)a29
{
  id v37 = a4;
  v46.receiver = self;
  v46.super_class = (Class)IDSRegistrationAccountStatusMetric;
  v38 = [(IDSRegistrationAccountStatusMetric *)&v46 init];
  v42 = v38;
  if (v38)
  {
    v38->_accountType = a3;
    uint64_t v43 = objc_msgSend_copy(v37, v39, v40, v41);
    serviceIdentifier = v42->_serviceIdentifier;
    v42->_serviceIdentifier = (NSString *)v43;

    v42->_doesExist = a5;
    v42->_isEnabled = a6;
    v42->_isUserDisabled = a7;
    v42->_isiCloudSignedIn = a8;
    v42->_doesMatchiCloudAccount = a9;
    v42->_isiTunesSignedIn = a10;
    v42->_registrationError = a11;
    v42->_registrationStatus = a13;
    v42->_registrationErrorReason = a12;
    v42->_accountRegistrationStatus = a14;
    v42->_hasEverRegistered = a15;
    v42->_lastRegistrationFailureError = a16;
    v42->_timeIntervalSinceLastRegistrationFailure = a17;
    v42->_timeIntervalSinceLastRegistrationSuccess = a18;
    v42->_areAllAliasesSelected = a20;
    v42->_areAllSelectedAliasesRegistered = a21;
    v42->_accountSecurityLevel = a19;
    v42->_numberOfSelected = a22;
    v42->_numberOfVetted = a23;
    v42->_numberOfUnselectReasonUnknown = a24;
    v42->_numberOfUnselectReasonAlertDenial = a25;
    v42->_numberOfUnselectReasonClientCall = a26;
    v42->_numberOfUnselectReasonBadAlias = a27;
    v42->_numberOfUnselectReasonUpdateInfo = a28;
    v42->_isProdEnvironment = a29;
  }

  return v42;
}

- (NSString)description
{
  v114 = NSString;
  v113 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v112 = objc_msgSend_accountType(self, v5, v6, v7);
  v111 = objc_msgSend_serviceIdentifier(self, v8, v9, v10);
  uint64_t doesExist = objc_msgSend_doesExist(self, v11, v12, v13);
  uint64_t isEnabled = objc_msgSend_isEnabled(self, v14, v15, v16);
  uint64_t isUserDisabled = objc_msgSend_isUserDisabled(self, v17, v18, v19);
  uint64_t v107 = objc_msgSend_isiCloudSignedIn(self, v20, v21, v22);
  uint64_t doesMatchiCloudAccount = objc_msgSend_doesMatchiCloudAccount(self, v23, v24, v25);
  uint64_t v105 = objc_msgSend_isiTunesSignedIn(self, v26, v27, v28);
  uint64_t v104 = objc_msgSend_registrationError(self, v29, v30, v31);
  uint64_t v103 = objc_msgSend_registrationErrorReason(self, v32, v33, v34);
  uint64_t v102 = objc_msgSend_registrationStatus(self, v35, v36, v37);
  uint64_t v101 = objc_msgSend_accountRegistrationStatus(self, v38, v39, v40);
  uint64_t hasEverRegistered = objc_msgSend_hasEverRegistered(self, v41, v42, v43);
  uint64_t RegistrationFailureError = objc_msgSend_lastRegistrationFailureError(self, v44, v45, v46);
  objc_msgSend_timeIntervalSinceLastRegistrationFailure(self, v47, v48, v49);
  double v51 = v50;
  objc_msgSend_timeIntervalSinceLastRegistrationSuccess(self, v52, v53, v50);
  double v55 = v54;
  uint64_t v58 = objc_msgSend_accountSecurityLevel(self, v56, v57, v54);
  uint64_t v62 = objc_msgSend_areAllAliasesSelected(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_areAllSelectedAliasesRegistered(self, v63, v64, v65);
  uint64_t v70 = objc_msgSend_numberOfVetted(self, v67, v68, v69);
  uint64_t v74 = objc_msgSend_numberOfUnselectReasonUnknown(self, v71, v72, v73);
  uint64_t v78 = objc_msgSend_numberOfUnselectReasonAlertDenial(self, v75, v76, v77);
  uint64_t v82 = objc_msgSend_numberOfUnselectReasonClientCall(self, v79, v80, v81);
  uint64_t v86 = objc_msgSend_numberOfUnselectReasonBadAlias(self, v83, v84, v85);
  uint64_t updated = objc_msgSend_numberOfUnselectReasonUpdateInfo(self, v87, v88, v89);
  unsigned int isProdEnvironment = objc_msgSend_isProdEnvironment(self, v91, v92, v93);
  objc_msgSend_stringWithFormat_(v114, v95, @"%@: <type: %d, service: %@, exist: %ld, enabled: %ld, userDisabled: %ld, iCloudSignedIn: %ld, doesMatchiCloud: %ld, iTunesSignedIn: %ld, error: %ld, errorReason: %d, status: %ld, accountStatus: %d, hasEverRegistered: %ld, lastFailError: %ld, timeSinceFail: %f, timeSinceSuccess: %f, securityLevel: %ld, allAliasesSelected: %ld, allSelectedAliasesRegistered: %ld, numVetted: %ld, numUnselectUnknown: %ld, numUnselectAlertDenial: %ld, numUnselectClientCall: %ld, numUnselectBadAlias: %ld, numUnselecUpdateInfo: %ld, isProd: %ld>", v96, v113, v112, v111, doesExist, isEnabled, isUserDisabled, v107, doesMatchiCloudAccount, v105, v104, v103, v102, v101, hasEverRegistered, RegistrationFailureError,
    *(void *)&v51,
    *(void *)&v55,
    v58,
    v62,
    v66,
    v70,
    v74,
    v78,
    v82,
    v86,
    updated,
  v97 = isProdEnvironment);

  return (NSString *)v97;
}

- (NSString)name
{
  return (NSString *)@"RegistrationAccountStatus";
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_accountType(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInt_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"AccountType", v11);
  }

  uint64_t v15 = objc_msgSend_serviceIdentifier(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"ServiceIdentifier", v15);
  }

  double v16 = NSNumber;
  uint64_t doesExist = objc_msgSend_doesExist(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithBool_(v16, v21, doesExist, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"DoesExist", v23);
  }

  uint64_t v24 = NSNumber;
  uint64_t isEnabled = objc_msgSend_isEnabled(self, v25, v26, v27);
  double v31 = objc_msgSend_numberWithBool_(v24, v29, isEnabled, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"IsEnabled", v31);
  }

  v32 = NSNumber;
  uint64_t isUserDisabled = objc_msgSend_isUserDisabled(self, v33, v34, v35);
  uint64_t v39 = objc_msgSend_numberWithBool_(v32, v37, isUserDisabled, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"IsUserDisabled", v39);
  }

  double v40 = NSNumber;
  uint64_t v44 = objc_msgSend_isiCloudSignedIn(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithBool_(v40, v45, v44, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"IsiCloudSignedIn", v47);
  }

  uint64_t v48 = NSNumber;
  uint64_t doesMatchiCloudAccount = objc_msgSend_doesMatchiCloudAccount(self, v49, v50, v51);
  double v55 = objc_msgSend_numberWithBool_(v48, v53, doesMatchiCloudAccount, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"DoesMatchiCloudAccount", v55);
  }

  v56 = NSNumber;
  uint64_t v60 = objc_msgSend_isiTunesSignedIn(self, v57, v58, v59);
  v63 = objc_msgSend_numberWithBool_(v56, v61, v60, v62);
  if (v63) {
    CFDictionarySetValue(v3, @"IsiTunesSignedIn", v63);
  }

  uint64_t v64 = NSNumber;
  uint64_t v68 = objc_msgSend_registrationError(self, v65, v66, v67);
  v71 = objc_msgSend_numberWithInteger_(v64, v69, v68, v70);
  if (v71) {
    CFDictionarySetValue(v3, @"RegistrationError", v71);
  }

  uint64_t v72 = NSNumber;
  uint64_t v76 = objc_msgSend_registrationErrorReason(self, v73, v74, v75);
  v79 = objc_msgSend_numberWithInt_(v72, v77, v76, v78);
  if (v79) {
    CFDictionarySetValue(v3, @"RegistrationErrorReason", v79);
  }

  uint64_t v80 = NSNumber;
  uint64_t v84 = objc_msgSend_registrationStatus(self, v81, v82, v83);
  v87 = objc_msgSend_numberWithInteger_(v80, v85, v84, v86);
  if (v87) {
    CFDictionarySetValue(v3, @"RegistrationStatus", v87);
  }

  uint64_t v88 = NSNumber;
  uint64_t v92 = objc_msgSend_accountRegistrationStatus(self, v89, v90, v91);
  v95 = objc_msgSend_numberWithInt_(v88, v93, v92, v94);
  if (v95) {
    CFDictionarySetValue(v3, @"AccountRegistrationStatus", v95);
  }

  double v96 = NSNumber;
  uint64_t hasEverRegistered = objc_msgSend_hasEverRegistered(self, v97, v98, v99);
  uint64_t v103 = objc_msgSend_numberWithBool_(v96, v101, hasEverRegistered, v102);
  if (v103) {
    CFDictionarySetValue(v3, @"HasEverRegistered", v103);
  }

  uint64_t v104 = NSNumber;
  uint64_t RegistrationFailureError = objc_msgSend_lastRegistrationFailureError(self, v105, v106, v107);
  v111 = objc_msgSend_numberWithInteger_(v104, v109, RegistrationFailureError, v110);
  if (v111) {
    CFDictionarySetValue(v3, @"LastFailureError", v111);
  }

  uint64_t v112 = NSNumber;
  objc_msgSend_timeIntervalSinceLastRegistrationFailure(self, v113, v114, v115);
  v119 = objc_msgSend_numberWithDouble_(v112, v116, v117, v118);
  if (v119) {
    CFDictionarySetValue(v3, @"TimeIntervalSinceLastFailure", v119);
  }

  v120 = NSNumber;
  objc_msgSend_timeIntervalSinceLastRegistrationSuccess(self, v121, v122, v123);
  v127 = objc_msgSend_numberWithDouble_(v120, v124, v125, v126);
  if (v127) {
    CFDictionarySetValue(v3, @"TimeIntervalSinceLastSuccess", v127);
  }

  v128 = NSNumber;
  uint64_t v132 = objc_msgSend_accountSecurityLevel(self, v129, v130, v131);
  v135 = objc_msgSend_numberWithInteger_(v128, v133, v132, v134);
  if (v135) {
    CFDictionarySetValue(v3, @"AccountSecurityLevel", v135);
  }

  v136 = NSNumber;
  uint64_t v140 = objc_msgSend_areAllAliasesSelected(self, v137, v138, v139);
  v143 = objc_msgSend_numberWithBool_(v136, v141, v140, v142);
  if (v143) {
    CFDictionarySetValue(v3, @"AreAllAliasesSelected", v143);
  }

  v144 = NSNumber;
  uint64_t v148 = objc_msgSend_areAllSelectedAliasesRegistered(self, v145, v146, v147);
  v151 = objc_msgSend_numberWithBool_(v144, v149, v148, v150);
  if (v151) {
    CFDictionarySetValue(v3, @"AreAllSelectedAliasesRegistered", v151);
  }

  v152 = NSNumber;
  uint64_t v156 = objc_msgSend_numberOfSelected(self, v153, v154, v155);
  v159 = objc_msgSend_numberWithInteger_(v152, v157, v156, v158);
  if (v159) {
    CFDictionarySetValue(v3, @"NumberOfSelected", v159);
  }

  v160 = NSNumber;
  uint64_t v164 = objc_msgSend_numberOfVetted(self, v161, v162, v163);
  v167 = objc_msgSend_numberWithInteger_(v160, v165, v164, v166);
  if (v167) {
    CFDictionarySetValue(v3, @"NumberOfVetted", v167);
  }

  v168 = NSNumber;
  uint64_t v172 = objc_msgSend_numberOfUnselectReasonUnknown(self, v169, v170, v171);
  v175 = objc_msgSend_numberWithInteger_(v168, v173, v172, v174);
  if (v175) {
    CFDictionarySetValue(v3, @"NumberOfUnselectReasonUnknown", v175);
  }

  v176 = NSNumber;
  uint64_t v180 = objc_msgSend_numberOfUnselectReasonAlertDenial(self, v177, v178, v179);
  v183 = objc_msgSend_numberWithInteger_(v176, v181, v180, v182);
  if (v183) {
    CFDictionarySetValue(v3, @"NumberOfUnselectReasonAlertDenial", v183);
  }

  v184 = NSNumber;
  uint64_t v188 = objc_msgSend_numberOfUnselectReasonClientCall(self, v185, v186, v187);
  v191 = objc_msgSend_numberWithInteger_(v184, v189, v188, v190);
  if (v191) {
    CFDictionarySetValue(v3, @"NumberOfUnselectReasonClientCall", v191);
  }

  v192 = NSNumber;
  uint64_t v196 = objc_msgSend_numberOfUnselectReasonBadAlias(self, v193, v194, v195);
  v199 = objc_msgSend_numberWithInteger_(v192, v197, v196, v198);
  if (v199) {
    CFDictionarySetValue(v3, @"NumberOfUnselectReasonBadAlias", v199);
  }

  v200 = NSNumber;
  uint64_t updated = objc_msgSend_numberOfUnselectReasonUpdateInfo(self, v201, v202, v203);
  v207 = objc_msgSend_numberWithInteger_(v200, v205, updated, v206);
  if (v207) {
    CFDictionarySetValue(v3, @"NumberOfUnselectReasonUpdateInfo", v207);
  }

  v208 = NSNumber;
  uint64_t isProdEnvironment = objc_msgSend_isProdEnvironment(self, v209, v210, v211);
  v215 = objc_msgSend_numberWithBool_(v208, v213, isProdEnvironment, v214);
  if (v215) {
    CFDictionarySetValue(v3, @"IsProdEnvironment", v215);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationAccountStatus;
}

- (unsigned)awdIdentifier
{
  return 0;
}

- (NSCopying)awdRepresentation
{
  return 0;
}

- (int)accountType
{
  return self->_accountType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)doesExist
{
  return self->_doesExist;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isUserDisabled
{
  return self->_isUserDisabled;
}

- (BOOL)doesMatchiCloudAccount
{
  return self->_doesMatchiCloudAccount;
}

- (BOOL)isiCloudSignedIn
{
  return self->_isiCloudSignedIn;
}

- (BOOL)isiTunesSignedIn
{
  return self->_isiTunesSignedIn;
}

- (int64_t)registrationError
{
  return self->_registrationError;
}

- (int)registrationErrorReason
{
  return self->_registrationErrorReason;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (int)accountRegistrationStatus
{
  return self->_accountRegistrationStatus;
}

- (int64_t)lastRegistrationFailureError
{
  return self->_lastRegistrationFailureError;
}

- (BOOL)hasEverRegistered
{
  return self->_hasEverRegistered;
}

- (double)timeIntervalSinceLastRegistrationFailure
{
  return self->_timeIntervalSinceLastRegistrationFailure;
}

- (double)timeIntervalSinceLastRegistrationSuccess
{
  return self->_timeIntervalSinceLastRegistrationSuccess;
}

- (int64_t)accountSecurityLevel
{
  return self->_accountSecurityLevel;
}

- (BOOL)areAllAliasesSelected
{
  return self->_areAllAliasesSelected;
}

- (BOOL)areAllSelectedAliasesRegistered
{
  return self->_areAllSelectedAliasesRegistered;
}

- (BOOL)isProdEnvironment
{
  return self->_isProdEnvironment;
}

- (int64_t)numberOfSelected
{
  return self->_numberOfSelected;
}

- (int64_t)numberOfVetted
{
  return self->_numberOfVetted;
}

- (int64_t)numberOfUnselectReasonUnknown
{
  return self->_numberOfUnselectReasonUnknown;
}

- (int64_t)numberOfUnselectReasonAlertDenial
{
  return self->_numberOfUnselectReasonAlertDenial;
}

- (int64_t)numberOfUnselectReasonClientCall
{
  return self->_numberOfUnselectReasonClientCall;
}

- (int64_t)numberOfUnselectReasonBadAlias
{
  return self->_numberOfUnselectReasonBadAlias;
}

- (int64_t)numberOfUnselectReasonUpdateInfo
{
  return self->_numberOfUnselectReasonUpdateInfo;
}

- (void).cxx_destruct
{
}

@end