@interface HDClinicalAccount
+ (NSNumber)numFailedAttemptsToReachMaxBlockTime;
- (BOOL)_lastFetchAttemptFailed;
- (BOOL)_scopesAreOutdated:(id)a3;
- (BOOL)canDetectUnmergeFromPatientResource;
- (BOOL)credentialHasOutdatedScopes:(id)a3;
- (BOOL)currentCredentialHasOutdatedScopes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserEnabled;
- (BOOL)needsRelogin;
- (BOOL)needsScopeUpgrade;
- (BOOL)shouldPerformBackgroundFetchWithNowDate:(id)a3;
- (BOOL)shouldPerformFetchWithNowDate:(id)a3;
- (BOOL)shouldPerformFullFetchWithNowDate:(id)a3;
- (HDClinicalAccount)init;
- (HDClinicalAccount)initWithIdentifier:(id)a3 userEnabled:(BOOL)a4 credentialState:(int64_t)a5 creationDate:(id)a6 lastFetchDate:(id)a7 lastFullFetchDate:(id)a8 lastFailedFetchDate:(id)a9 failedFetchAttemptsCount:(id)a10 lastExtractedRowID:(id)a11 lastSubmittedRowID:(id)a12 lastExtractedRulesVersion:(id)a13 clinicalSharingStatus:(id)a14 credential:(id)a15 patientHash:(id)a16 gateway:(id)a17 signedClinicalDataIssuer:(id)a18;
- (HDClinicalGateway)gateway;
- (HDFHIRCredential)credential;
- (HKClinicalAccount)hkAccount;
- (HKClinicalAccountProvenance)hkClinicalAccountProvenance;
- (HKClinicalSharingStatus)clinicalSharingStatus;
- (HKSignedClinicalDataIssuer)signedClinicalDataIssuer;
- (NSDate)creationDate;
- (NSDate)lastFailedFetchDate;
- (NSDate)lastFetchDate;
- (NSDate)lastFullFetchDate;
- (NSNumber)failedFetchAttemptsCount;
- (NSNumber)lastExtractedRowID;
- (NSNumber)lastExtractedRulesVersion;
- (NSNumber)lastSubmittedRowID;
- (NSString)patientHash;
- (NSUUID)identifier;
- (double)_secondsBlockedIfLastAttemptFailed;
- (double)_secondsFetchIsBlocked;
- (double)_secondsFullFetchIsBlocked;
- (id)_minuteOverrideForUserDefaultsKey:(id)a3;
- (id)connectionInformationWithCredential:(id)a3 error:(id *)a4;
- (id)currentCredentialScopeSet;
- (id)description;
- (int64_t)credentialState;
- (int64_t)hkState;
- (void)setPatientHash:(id)a3;
@end

@implementation HDClinicalAccount

- (HDClinicalAccount)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalAccount)initWithIdentifier:(id)a3 userEnabled:(BOOL)a4 credentialState:(int64_t)a5 creationDate:(id)a6 lastFetchDate:(id)a7 lastFullFetchDate:(id)a8 lastFailedFetchDate:(id)a9 failedFetchAttemptsCount:(id)a10 lastExtractedRowID:(id)a11 lastSubmittedRowID:(id)a12 lastExtractedRulesVersion:(id)a13 clinicalSharingStatus:(id)a14 credential:(id)a15 patientHash:(id)a16 gateway:(id)a17 signedClinicalDataIssuer:(id)a18
{
  id v73 = a3;
  id v75 = a6;
  id v74 = a7;
  id v21 = a8;
  id v71 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v72 = a17;
  id v29 = a18;
  v76.receiver = self;
  v76.super_class = (Class)HDClinicalAccount;
  v30 = [(HDClinicalAccount *)&v76 init];
  if (v30)
  {
    v70 = v28;
    v31 = (NSUUID *)[v73 copy];
    identifier = v30->_identifier;
    v30->_identifier = v31;

    v30->_userEnabled = a4;
    v30->_credentialState = a5;
    v33 = [v27 patientID];
    v68 = v27;
    if (v33)
    {
      v34 = [v27 patientID];
      uint64_t v35 = +[HDFHIRCredential patientHashForPatientID:v34];
      patientHash = v30->_patientHash;
      v30->_patientHash = (NSString *)v35;
    }
    else
    {
      v37 = v70;
      v34 = v30->_patientHash;
      v30->_patientHash = v37;
    }

    v38 = (NSDate *)[v75 copy];
    creationDate = v30->_creationDate;
    v30->_creationDate = v38;

    v40 = HKDateMax();
    v41 = (NSDate *)[v40 copy];
    lastFetchDate = v30->_lastFetchDate;
    v30->_lastFetchDate = v41;

    v43 = (NSDate *)[v21 copy];
    lastFullFetchDate = v30->_lastFullFetchDate;
    v30->_lastFullFetchDate = v43;

    v45 = (NSDate *)[v71 copy];
    lastFailedFetchDate = v30->_lastFailedFetchDate;
    v30->_lastFailedFetchDate = v45;

    v47 = (NSNumber *)[v22 copy];
    failedFetchAttemptsCount = v30->_failedFetchAttemptsCount;
    v30->_failedFetchAttemptsCount = v47;

    v49 = (NSNumber *)[v23 copy];
    lastExtractedRowID = v30->_lastExtractedRowID;
    v30->_lastExtractedRowID = v49;

    v51 = (NSNumber *)[v25 copy];
    lastExtractedRulesVersion = v30->_lastExtractedRulesVersion;
    v30->_lastExtractedRulesVersion = v51;

    v53 = (NSNumber *)[v24 copy];
    lastSubmittedRowID = v30->_lastSubmittedRowID;
    v30->_lastSubmittedRowID = v53;

    id v27 = v68;
    v55 = (HDFHIRCredential *)[v68 copy];
    credential = v30->_credential;
    v30->_credential = v55;

    v57 = (HDClinicalGateway *)[v72 copy];
    gateway = v30->_gateway;
    v30->_gateway = v57;

    if ((v72 == 0) != (v29 != 0))
    {
      v64 = +[NSAssertionHandler currentHandler];
      [v64 handleFailureInMethod:a2, v30, @"HDClinicalAccount.m", 76, @"Invalid parameter not satisfying: %@", @"(gateway != nil) ^ (signedClinicalDataIssuer != nil)" object file lineNumber description];
    }
    v59 = (HKSignedClinicalDataIssuer *)[v29 copy];
    signedClinicalDataIssuer = v30->_signedClinicalDataIssuer;
    v30->_signedClinicalDataIssuer = v59;

    v61 = (HKClinicalSharingStatus *)[v26 copy];
    clinicalSharingStatus = v30->_clinicalSharingStatus;
    v30->_clinicalSharingStatus = v61;

    id v28 = v70;
  }

  return v30;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(HDClinicalAccount *)self identifier];
  v6 = [v5 UUIDString];
  id v7 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p; identifier:%@; credentialState: %ld>",
         v4,
         self,
         v6,
         [(HDClinicalAccount *)self credentialState]);

  return v7;
}

+ (NSNumber)numFailedAttemptsToReachMaxBlockTime
{
  return (NSNumber *)&off_11D320;
}

- (BOOL)shouldPerformBackgroundFetchWithNowDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDClinicalAccount.m", 95, @"Invalid parameter not satisfying: %@", @"now" object file lineNumber description];
  }
  v6 = [v5 dateByAddingTimeInterval:-302400.0];
  lastFetchDate = self->_lastFetchDate;
  if (lastFetchDate)
  {
    v8 = lastFetchDate;
  }
  else
  {
    v8 = +[NSDate distantPast];
  }
  v9 = v8;
  id v10 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v6 endDate:v5];
  char v11 = [v10 containsDate:v9] ^ 1;

  return v11;
}

- (BOOL)shouldPerformFetchWithNowDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HDClinicalAccount.m", 103, @"Invalid parameter not satisfying: %@", @"now" object file lineNumber description];
  }
  if ([(HDClinicalAccount *)self _lastFetchAttemptFailed])
  {
    [(NSDate *)self->_lastFailedFetchDate timeIntervalSinceDate:v5];
    double v7 = v6;
    [(HDClinicalAccount *)self _secondsFetchIsBlocked];
    BOOL v9 = v7 < -v8;
  }
  else
  {
    lastFetchDate = self->_lastFetchDate;
    if (lastFetchDate)
    {
      char v11 = lastFetchDate;
    }
    else
    {
      char v11 = +[NSDate distantPast];
    }
    v12 = v11;
    lastFullFetchDate = self->_lastFullFetchDate;
    if (lastFullFetchDate)
    {
      v14 = lastFullFetchDate;
    }
    else
    {
      v14 = +[NSDate distantPast];
    }
    v15 = v14;
    v16 = HKDateMax();
    [v16 timeIntervalSinceDate:v5];
    double v18 = v17;
    [(HDClinicalAccount *)self _secondsFetchIsBlocked];
    BOOL v9 = v18 < -v19;
  }
  return v9;
}

- (BOOL)shouldPerformFullFetchWithNowDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDClinicalAccount.m", 115, @"Invalid parameter not satisfying: %@", @"now" object file lineNumber description];
  }
  lastFullFetchDate = self->_lastFullFetchDate;
  if (lastFullFetchDate)
  {
    [(NSDate *)lastFullFetchDate timeIntervalSinceDate:v5];
    double v8 = v7;
    [(HDClinicalAccount *)self _secondsFullFetchIsBlocked];
    if (v8 >= -v9)
    {
      unsigned __int8 v15 = 0;
    }
    else if ([(HDClinicalAccount *)self _lastFetchAttemptFailed])
    {
      [(NSDate *)self->_lastFailedFetchDate timeIntervalSinceDate:v5];
      double v11 = v10;
      [(HDClinicalAccount *)self _secondsBlockedIfLastAttemptFailed];
      double v13 = v12;
      [(HDClinicalAccount *)self _secondsFullFetchIsBlocked];
      if (v13 < v14) {
        double v14 = v13;
      }
      unsigned __int8 v15 = v11 < -v14;
    }
    else
    {
      unsigned __int8 v15 = 1;
    }
  }
  else
  {
    unsigned __int8 v15 = [(HDClinicalAccount *)self shouldPerformFetchWithNowDate:v5];
  }

  return v15;
}

- (double)_secondsFetchIsBlocked
{
  if ([(HDClinicalAccount *)self _lastFetchAttemptFailed])
  {
    [(HDClinicalAccount *)self _secondsBlockedIfLastAttemptFailed];
    double v4 = v3;
  }
  else
  {
    double v4 = 14400.0;
  }
  if (+[_HKBehavior isAppleInternalInstall])
  {
    id v5 = [(HDClinicalAccount *)self _minuteOverrideForUserDefaultsKey:@"HDClinicalAccountFetchBlockInMinutes"];
    if (v5)
    {
      _HKInitializeLogging();
      double v6 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        double v7 = v6;
        *(_DWORD *)double v11 = 138543618;
        *(void *)&v11[4] = objc_opt_class();
        *(_WORD *)&v11[12] = 2112;
        *(void *)&v11[14] = v5;
        id v8 = *(id *)&v11[4];
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@ the fetch block time has been overriden. Current override %@ minutes", v11, 0x16u);
      }
      id v9 = objc_msgSend(v5, "unsignedIntegerValue", *(_OWORD *)v11, *(void *)&v11[16]);
      if (v4 >= (double)(unint64_t)(60 * (void)v9)) {
        double v4 = (double)(unint64_t)(60 * (void)v9);
      }
    }
  }
  return v4;
}

- (BOOL)_lastFetchAttemptFailed
{
  return self->_lastFailedFetchDate != 0;
}

- (double)_secondsBlockedIfLastAttemptFailed
{
  if (!self->_lastFailedFetchDate)
  {
    double v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HDClinicalAccount.m" lineNumber:152 description:@"You must only use this if last failed fetch date is not nil"];
  }
  if ([(NSNumber *)self->_failedFetchAttemptsCount unsignedIntegerValue] > 4) {
    return 86400.0;
  }
  NSUInteger v3 = [(NSNumber *)self->_failedFetchAttemptsCount unsignedIntegerValue];
  if (v3 <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = v3;
  }
  return pow((double)v4, 3.0) * 600.0;
}

- (double)_secondsFullFetchIsBlocked
{
  if (!+[_HKBehavior isAppleInternalInstall]) {
    return 2592000.0;
  }
  NSUInteger v3 = [(HDClinicalAccount *)self _minuteOverrideForUserDefaultsKey:@"HDClinicalAccountFullFetchBlockInMinutes"];
  if (v3)
  {
    _HKInitializeLogging();
    unint64_t v4 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      id v5 = v4;
      *(_DWORD *)double v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2112;
      *(void *)&v10[14] = v3;
      id v6 = *(id *)&v10[4];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}@ the full fetch block time has been overriden. Current override %@ minutes", v10, 0x16u);
    }
    id v7 = objc_msgSend(v3, "unsignedIntegerValue", *(_OWORD *)v10, *(void *)&v10[16]);
    if ((double)(unint64_t)(60 * (void)v7) <= 2592000.0) {
      double v8 = (double)(unint64_t)(60 * (void)v7);
    }
    else {
      double v8 = 2592000.0;
    }
  }
  else
  {
    double v8 = 2592000.0;
  }

  return v8;
}

- (id)_minuteOverrideForUserDefaultsKey:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:v3];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)needsRelogin
{
  return (char *)[(HDClinicalAccount *)self credentialState] == (char *)&dword_0 + 1;
}

- (BOOL)needsScopeUpgrade
{
  return (char *)[(HDClinicalAccount *)self credentialState] == (char *)&dword_0 + 2;
}

- (BOOL)canDetectUnmergeFromPatientResource
{
  v2 = [(HDClinicalAccount *)self gateway];
  id v3 = [v2 FHIRVersion];
  BOOL v4 = (uint64_t)[v3 majorVersion] > 3;

  return v4;
}

- (BOOL)_scopesAreOutdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HDClinicalAccount *)self gateway];
  id v12 = 0;
  id v6 = [v5 authScopeWithError:&v12];
  id v7 = v12;

  if (v6)
  {
    double v8 = +[HKOAuth2ScopeSet scopesFromScopeString:v6];
    unsigned __int8 v9 = [v4 isMissingScopesFrom:v8];
  }
  else
  {
    _HKInitializeLogging();
    double v10 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B3C5C(v10, (uint64_t)self, (uint64_t)v7);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)credentialHasOutdatedScopes:(id)a3
{
  id v4 = [a3 requestedScopeString];
  id v5 = +[HKOAuth2ScopeSet scopeSetWithScopeString:v4];
  LOBYTE(self) = [(HDClinicalAccount *)self _scopesAreOutdated:v5];

  return (char)self;
}

- (BOOL)currentCredentialHasOutdatedScopes
{
  id v3 = [(HDClinicalAccount *)self credential];
  if (v3)
  {
    BOOL v4 = [(HDClinicalAccount *)self credentialHasOutdatedScopes:v3];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B3D1C(v5);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (id)currentCredentialScopeSet
{
  v2 = [(HDClinicalAccount *)self credential];
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 scopes];
    if (v4)
    {
      id v5 = +[HKOAuth2ScopeSet scopeSetWithScopes:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)connectionInformationWithCredential:(id)a3 error:(id *)a4
{
  return [(HDClinicalGateway *)self->_gateway connectionInformationWithAccountIdentifier:self->_identifier credential:a3 error:a4];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (HDClinicalAccount *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned __int8 v17 = 0;
LABEL_98:

      goto LABEL_99;
    }
    identifier = self->_identifier;
    double v8 = [(HDClinicalAccount *)v6 identifier];
    v125 = identifier;
    if (identifier != v8)
    {
      uint64_t v9 = [(HDClinicalAccount *)v6 identifier];
      if (!v9)
      {
        v119 = 0;
        long long v127 = 0uLL;
        int v11 = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, sizeof(v124));
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        goto LABEL_17;
      }
      v119 = (void *)v9;
      double v10 = self->_identifier;
      v117 = [(HDClinicalAccount *)v6 identifier];
      if (!-[NSUUID isEqual:](v10, "isEqual:"))
      {
        long long v127 = 0uLL;
        int v11 = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 48);
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[48] = 1;
        goto LABEL_17;
      }
    }
    BOOL userEnabled = self->_userEnabled;
    *(_DWORD *)&v124[48] = identifier != v8;
    if (userEnabled != [(HDClinicalAccount *)v6 isUserEnabled]
      || (id credentialState = self->_credentialState,
          credentialState != (id)[(HDClinicalAccount *)v6 credentialState]))
    {
      long long v127 = 0uLL;
      int v11 = 0;
      memset(v122, 0, sizeof(v122));
      uint64_t v123 = 0;
      memset(v120, 0, sizeof(v120));
      int v121 = 0;
      memset(v124, 0, 48);
      int v12 = 0;
      memset(v126, 0, sizeof(v126));
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      unsigned __int8 v17 = 0;
      goto LABEL_17;
    }
    creationDate = self->_creationDate;
    uint64_t v21 = [(HDClinicalAccount *)v6 creationDate];
    BOOL v22 = creationDate != (NSDate *)v21;
    v116 = (void *)v21;
    if (creationDate != (NSDate *)v21)
    {
      uint64_t v23 = [(HDClinicalAccount *)v6 creationDate];
      if (!v23)
      {
        v115 = 0;
        int v11 = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 44);
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[44] = 1;
        long long v127 = 1uLL;
        goto LABEL_17;
      }
      v115 = (void *)v23;
      id v24 = self->_creationDate;
      v113 = [(HDClinicalAccount *)v6 creationDate];
      if (!-[NSDate isEqual:](v24, "isEqual:"))
      {
        *(void *)&v124[40] = 0x100000000;
        int v11 = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 36);
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        long long v127 = 1uLL;
        *(_DWORD *)&v124[36] = 1;
        goto LABEL_17;
      }
    }
    lastFetchDate = self->_lastFetchDate;
    uint64_t v32 = [(HDClinicalAccount *)v6 lastFetchDate];
    HIDWORD(v127) = lastFetchDate != (NSDate *)v32;
    LODWORD(v127) = v22;
    v114 = (void *)v32;
    if (lastFetchDate != (NSDate *)v32)
    {
      uint64_t v33 = [(HDClinicalAccount *)v6 lastFetchDate];
      if (!v33)
      {
        v118 = 0;
        int v11 = 0;
        *(void *)((char *)&v127 + 4) = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 36);
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[36] = v22;
        HIDWORD(v127) = 1;
        goto LABEL_17;
      }
      v118 = (void *)v33;
      v34 = self->_lastFetchDate;
      v111 = [(HDClinicalAccount *)v6 lastFetchDate];
      if (!-[NSDate isEqual:](v34, "isEqual:"))
      {
        *(_DWORD *)&v124[32] = 0;
        int v11 = 0;
        *(void *)((char *)&v127 + 4) = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 28);
        int v12 = 0;
        memset(v126, 0, sizeof(v126));
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[36] = v22;
        HIDWORD(v127) = 1;
        *(_DWORD *)&v124[28] = 1;
        goto LABEL_17;
      }
    }
    lastFullFetchDate = self->_lastFullFetchDate;
    v112 = [(HDClinicalAccount *)v6 lastFullFetchDate];
    BOOL v36 = lastFullFetchDate != v112;
    if (lastFullFetchDate != v112)
    {
      uint64_t v37 = [(HDClinicalAccount *)v6 lastFullFetchDate];
      if (!v37)
      {
        v110 = 0;
        int v11 = 0;
        *(void *)((char *)&v127 + 4) = 0;
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        v126[1] = 0uLL;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 28);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        *((void *)&v126[0] + 1) = 1;
        goto LABEL_17;
      }
      v110 = (void *)v37;
      v38 = self->_lastFullFetchDate;
      v108 = [(HDClinicalAccount *)v6 lastFullFetchDate];
      if (!-[NSDate isEqual:](v38, "isEqual:"))
      {
        *(void *)((char *)&v127 + 4) = 0;
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        *((void *)&v126[1] + 1) = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 28);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        *(_OWORD *)((char *)v126 + 8) = 1uLL;
        int v11 = 1;
        goto LABEL_17;
      }
    }
    lastFailedFetchDate = self->_lastFailedFetchDate;
    v109 = [(HDClinicalAccount *)v6 lastFailedFetchDate];
    DWORD2(v127) = lastFailedFetchDate != v109;
    DWORD2(v126[0]) = v36;
    if (lastFailedFetchDate != v109)
    {
      uint64_t v40 = [(HDClinicalAccount *)v6 lastFailedFetchDate];
      if (!v40)
      {
        v107 = 0;
        *(void *)((char *)&v127 + 4) = 0x100000000;
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        BOOL v47 = v36;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        memset(v124, 0, 24);
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v47;
        *(void *)&v124[24] = __PAIR64__(HIDWORD(v127), 1);
        goto LABEL_17;
      }
      v107 = (void *)v40;
      v41 = self->_lastFailedFetchDate;
      v105 = [(HDClinicalAccount *)v6 lastFailedFetchDate];
      if (!-[NSDate isEqual:](v41, "isEqual:"))
      {
        *(void *)((char *)&v127 + 4) = 0x100000000;
        *(void *)&v124[8] = 0;
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        BOOL v42 = v36;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        *(void *)v124 = 0;
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v42;
        *(void *)&v124[24] = __PAIR64__(HIDWORD(v127), 1);
        *(void *)&v124[16] = 1;
        goto LABEL_17;
      }
    }
    failedFetchAttemptsCount = self->_failedFetchAttemptsCount;
    v106 = [(HDClinicalAccount *)v6 failedFetchAttemptsCount];
    DWORD1(v127) = failedFetchAttemptsCount != v106;
    if (failedFetchAttemptsCount != v106)
    {
      uint64_t v44 = [(HDClinicalAccount *)v6 failedFetchAttemptsCount];
      if (!v44)
      {
        v104 = 0;
        *(void *)&v124[8] = 0;
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        BOOL v52 = v36;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        *(void *)v124 = 0;
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v52;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        DWORD1(v127) = 1;
        goto LABEL_17;
      }
      v104 = (void *)v44;
      v45 = self->_failedFetchAttemptsCount;
      v102 = [(HDClinicalAccount *)v6 failedFetchAttemptsCount];
      if (!-[NSNumber isEqual:](v45, "isEqual:"))
      {
        *(void *)&v126[0] = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        BOOL v46 = v36;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        *(void *)v124 = 0;
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v46;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        DWORD1(v127) = 1;
        *(void *)&v124[8] = 1;
        goto LABEL_17;
      }
    }
    lastExtractedRowID = self->_lastExtractedRowID;
    v103 = [(HDClinicalAccount *)v6 lastExtractedRowID];
    BOOL v49 = lastExtractedRowID != v103;
    if (lastExtractedRowID != v103)
    {
      uint64_t v50 = [(HDClinicalAccount *)v6 lastExtractedRowID];
      if (!v50)
      {
        v101 = 0;
        memset(v122, 0, sizeof(v122));
        uint64_t v123 = 0;
        BOOL v56 = v36;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        *(void *)v124 = 0;
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        *(void *)&v126[0] = 0x100000000;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v56;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        goto LABEL_17;
      }
      v101 = (void *)v50;
      v51 = self->_lastExtractedRowID;
      v99 = [(HDClinicalAccount *)v6 lastExtractedRowID];
      if (!-[NSNumber isEqual:](v51, "isEqual:"))
      {
        uint64_t v123 = 0;
        BOOL v60 = v36;
        *(void *)&v122[4] = 0;
        memset(v120, 0, sizeof(v120));
        int v121 = 0;
        *(void *)v124 = 0;
        memset((char *)v126 + 12, 0, 20);
        int v12 = 0;
        *(void *)&v126[0] = 0x100000000;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v60;
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)v122 = 1;
        goto LABEL_17;
      }
      BOOL v22 = v127;
    }
    lastSubmittedRowID = self->_lastSubmittedRowID;
    v100 = [(HDClinicalAccount *)v6 lastSubmittedRowID];
    HIDWORD(v126[1]) = lastSubmittedRowID != v100;
    DWORD1(v126[0]) = v49;
    if (lastSubmittedRowID != v100)
    {
      uint64_t v54 = [(HDClinicalAccount *)v6 lastSubmittedRowID];
      if (!v54)
      {
        v98 = 0;
        BOOL v61 = v36;
        *(void *)&v122[4] = 0;
        memset(v120, 0, sizeof(v120));
        BOOL v62 = v49;
        uint64_t v123 = 0x100000000;
        *(_OWORD *)((char *)v126 + 12) = 0uLL;
        int v121 = 0;
        *(void *)v124 = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v61;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v62;
        HIDWORD(v126[1]) = 1;
        goto LABEL_17;
      }
      v98 = (void *)v54;
      v55 = self->_lastSubmittedRowID;
      v96 = [(HDClinicalAccount *)v6 lastSubmittedRowID];
      if (!-[NSNumber isEqual:](v55, "isEqual:"))
      {
        *(void *)&v122[4] = 0;
        *(void *)((char *)&v126[1] + 4) = 0;
        *(void *)v120 = 0;
        BOOL v66 = v49;
        uint64_t v123 = 0x100000000;
        *(void *)((char *)v126 + 12) = 0;
        int v121 = 0;
        *(void *)v124 = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v66;
        HIDWORD(v126[1]) = 1;
        *(_DWORD *)&v120[8] = 1;
        goto LABEL_17;
      }
      BOOL v22 = v127;
    }
    lastExtractedRulesVersion = self->_lastExtractedRulesVersion;
    v97 = [(HDClinicalAccount *)v6 lastExtractedRulesVersion];
    DWORD2(v126[1]) = lastExtractedRulesVersion != v97;
    if (lastExtractedRulesVersion != v97)
    {
      uint64_t v58 = [(HDClinicalAccount *)v6 lastExtractedRulesVersion];
      if (!v58)
      {
        v95 = 0;
        *(void *)v120 = 0;
        *(void *)&v126[1] = 0;
        BOOL v67 = v49;
        uint64_t v123 = 0x100000000;
        int v121 = 0;
        *(void *)v124 = 0;
        HIDWORD(v126[0]) = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(void *)v122 = v67;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        DWORD2(v126[1]) = 1;
        goto LABEL_17;
      }
      v95 = (void *)v58;
      v59 = self->_lastExtractedRulesVersion;
      v92 = [(HDClinicalAccount *)v6 lastExtractedRulesVersion];
      if (![(NSNumber *)v59 isEqual:v92])
      {
        *(void *)&v126[1] = 0;
        BOOL v71 = v49;
        uint64_t v123 = 0x100000000;
        int v121 = 0;
        *(void *)v124 = 0;
        HIDWORD(v126[0]) = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(void *)v122 = v71;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        DWORD2(v126[1]) = 1;
        *(void *)v120 = 1;
        goto LABEL_17;
      }
      BOOL v22 = v127;
    }
    credential = self->_credential;
    uint64_t v64 = [(HDClinicalAccount *)v6 credential];
    DWORD1(v126[1]) = credential != (HDFHIRCredential *)v64;
    v94 = (void *)v64;
    if (credential != (HDFHIRCredential *)v64)
    {
      v93 = [(HDClinicalAccount *)v6 credential];
      if (!v93)
      {
        v93 = 0;
        BOOL v72 = v49;
        uint64_t v123 = 0x100000000;
        *(void *)((char *)v126 + 12) = 0;
        int v121 = 0;
        *(void *)v124 = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v72;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(void *)v120 = DWORD2(v126[1]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v122[8] = 1;
        DWORD1(v126[1]) = 1;
        goto LABEL_17;
      }
      v65 = self->_credential;
      v90 = [(HDClinicalAccount *)v6 credential];
      if (!-[HDFHIRCredential isEqual:](v65, "isEqual:"))
      {
        uint64_t v123 = 0x100000000;
        *(void *)((char *)v126 + 12) = 0;
        int v121 = 0;
        *(void *)v124 = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v49;
        int v13 = 0;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)&v122[4] = 1;
        DWORD1(v126[1]) = 1;
        *(_DWORD *)&v120[4] = 1;
        goto LABEL_17;
      }
      BOOL v22 = v127;
    }
    patientHash = self->_patientHash;
    v91 = [(HDClinicalAccount *)v6 patientHash];
    LODWORD(v126[1]) = patientHash != v91;
    if (patientHash != v91)
    {
      uint64_t v69 = [(HDClinicalAccount *)v6 patientHash];
      if (!v69)
      {
        v89 = 0;
        int v121 = 0;
        *(void *)v124 = 0;
        HIDWORD(v126[0]) = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v22;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v49;
        int v13 = 0;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        LODWORD(v126[1]) = 1;
        goto LABEL_17;
      }
      v89 = (void *)v69;
      v70 = self->_patientHash;
      v86 = [(HDClinicalAccount *)v6 patientHash];
      if (!-[NSString isEqualToString:](v70, "isEqualToString:"))
      {
        *(void *)v124 = 0;
        HIDWORD(v126[0]) = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v49;
        int v13 = 0;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        LODWORD(v126[1]) = 1;
        int v121 = 1;
        goto LABEL_17;
      }
    }
    gateway = self->_gateway;
    uint64_t v74 = [(HDClinicalAccount *)v6 gateway];
    HIDWORD(v126[0]) = gateway != (HDClinicalGateway *)v74;
    v88 = (void *)v74;
    if (gateway != (HDClinicalGateway *)v74)
    {
      v87 = [(HDClinicalAccount *)v6 gateway];
      if (!v87)
      {
        v87 = 0;
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(_DWORD *)&v124[36] = v127;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[32] = 1;
        int v11 = v36;
        int v14 = 0;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        *(_DWORD *)v122 = v49;
        int v13 = 0;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(void *)v124 = 1;
        HIDWORD(v126[0]) = 1;
        goto LABEL_17;
      }
      id v75 = self->_gateway;
      v82 = [(HDClinicalAccount *)v6 gateway];
      if (!-[HDClinicalProviderServiceModel isEqual:](v75, "isEqual:"))
      {
        int v12 = 0;
        LODWORD(v126[0]) = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v127;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        int v11 = DWORD2(v126[0]);
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)v122 = DWORD1(v126[0]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(void *)v124 = 0x100000001;
        HIDWORD(v126[0]) = 1;
        goto LABEL_17;
      }
    }
    signedClinicalDataIssuer = self->_signedClinicalDataIssuer;
    v85 = [(HDClinicalAccount *)v6 signedClinicalDataIssuer];
    LODWORD(v126[0]) = signedClinicalDataIssuer != v85;
    if (signedClinicalDataIssuer != v85)
    {
      v84 = [(HDClinicalAccount *)v6 signedClinicalDataIssuer];
      if (!v84)
      {
        v84 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v127;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        int v11 = DWORD2(v126[0]);
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)v122 = DWORD1(v126[0]);
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(_DWORD *)v124 = 1;
        *(_DWORD *)&v124[4] = HIDWORD(v126[0]);
        int v12 = 1;
        LODWORD(v126[0]) = 1;
        goto LABEL_17;
      }
      v77 = self->_signedClinicalDataIssuer;
      v80 = [(HDClinicalAccount *)v6 signedClinicalDataIssuer];
      if (!-[HKSignedClinicalDataIssuer isEqual:](v77, "isEqual:"))
      {
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v127;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        int v11 = DWORD2(v126[0]);
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)v122 = v49;
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(_DWORD *)v124 = 1;
        *(_DWORD *)&v124[4] = HIDWORD(v126[0]);
        int v12 = 1;
        LODWORD(v126[0]) = 1;
        int v13 = 1;
        goto LABEL_17;
      }
    }
    clinicalSharingStatus = self->_clinicalSharingStatus;
    v83 = [(HDClinicalAccount *)v6 clinicalSharingStatus];
    if (clinicalSharingStatus == v83)
    {
      int v15 = 0;
      int v16 = 0;
      *(void *)&v124[40] = 0x100000001;
      *(_DWORD *)&v124[32] = 1;
      *(_DWORD *)&v124[36] = v127;
      *(_DWORD *)&v124[24] = 1;
      *(_DWORD *)&v124[28] = HIDWORD(v127);
      *(_DWORD *)&v124[16] = DWORD2(v127);
      *(_DWORD *)&v124[20] = 1;
      *(_DWORD *)&v124[8] = DWORD1(v127);
      *(_DWORD *)&v124[12] = 1;
      int v11 = v36;
      *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
      *(_DWORD *)&v122[8] = 1;
      *(_DWORD *)v120 = DWORD2(v126[1]);
      *(_DWORD *)v122 = v49;
      *(_DWORD *)&v122[4] = 1;
      *(_DWORD *)&v120[4] = DWORD1(v126[1]);
      uint64_t v123 = 0x100000001;
      int v121 = v126[1];
      *(_DWORD *)v124 = 1;
      *(_DWORD *)&v124[4] = HIDWORD(v126[0]);
      int v12 = 1;
      int v13 = v126[0];
      v83 = clinicalSharingStatus;
      int v14 = 1;
      unsigned __int8 v17 = 1;
    }
    else
    {
      v81 = [(HDClinicalAccount *)v6 clinicalSharingStatus];
      if (v81)
      {
        v79 = self->_clinicalSharingStatus;
        identifier = [(HDClinicalAccount *)v6 clinicalSharingStatus];
        unsigned __int8 v17 = [(HKClinicalSharingStatus *)v79 isEqual:identifier];
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v127;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        int v11 = v36;
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)v122 = v49;
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(_DWORD *)v124 = 1;
        *(_DWORD *)&v124[4] = HIDWORD(v126[0]);
        int v12 = 1;
        int v13 = v126[0];
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
      }
      else
      {
        v81 = 0;
        int v16 = 0;
        unsigned __int8 v17 = 0;
        *(void *)&v124[40] = 0x100000001;
        *(_DWORD *)&v124[32] = 1;
        *(_DWORD *)&v124[36] = v127;
        *(_DWORD *)&v124[24] = 1;
        *(_DWORD *)&v124[28] = HIDWORD(v127);
        *(_DWORD *)&v124[16] = DWORD2(v127);
        *(_DWORD *)&v124[20] = 1;
        *(_DWORD *)&v124[8] = DWORD1(v127);
        *(_DWORD *)&v124[12] = 1;
        int v11 = v36;
        *(_DWORD *)&v120[8] = HIDWORD(v126[1]);
        *(_DWORD *)&v122[8] = 1;
        *(_DWORD *)v120 = DWORD2(v126[1]);
        *(_DWORD *)v122 = v49;
        *(_DWORD *)&v122[4] = 1;
        *(_DWORD *)&v120[4] = DWORD1(v126[1]);
        uint64_t v123 = 0x100000001;
        int v121 = v126[1];
        *(_DWORD *)v124 = 1;
        *(_DWORD *)&v124[4] = HIDWORD(v126[0]);
        int v12 = 1;
        int v13 = v126[0];
        int v14 = 1;
        int v15 = 1;
      }
    }
LABEL_17:
    if (v16)
    {
      int v25 = v12;
      int v26 = v13;
      int v27 = v14;
      int v28 = v11;
      int v29 = v15;

      int v15 = v29;
      int v11 = v28;
      int v14 = v27;
      int v13 = v26;
      int v12 = v25;
    }
    if (v15) {

    }
    if (v14) {
    if (v13)
    }

    if (LODWORD(v126[0])) {
    if (v12)
    }

    if (*(_DWORD *)&v124[4]) {
    if (HIDWORD(v126[0]))
    }

    if (*(_DWORD *)v124) {
    if (v121)
    }

    if (LODWORD(v126[1])) {
    if (v123)
    }

    if (*(_DWORD *)&v120[4]) {
    if (DWORD1(v126[1]))
    }

    if (*(_DWORD *)&v122[4]) {
    if (*(_DWORD *)v120)
    }

    if (DWORD2(v126[1])) {
    if (*(_DWORD *)&v122[8])
    }

    if (*(_DWORD *)&v120[8]) {
    if (HIDWORD(v126[1]))
    }

    if (HIDWORD(v123)) {
    if (*(_DWORD *)v122)
    }

    if (DWORD1(v126[0])) {
    if (*(_DWORD *)&v124[12])
    }

    if (*(_DWORD *)&v124[8]) {
    if (DWORD1(v127))
    }

    if (*(_DWORD *)&v124[20]) {
    if (*(_DWORD *)&v124[16])
    }

    if (DWORD2(v127)) {
    if (*(_DWORD *)&v124[24])
    }
    {

      if (!v11) {
        goto LABEL_77;
      }
    }
    else if (!v11)
    {
LABEL_77:
      if (!DWORD2(v126[0]))
      {
LABEL_79:
        if (*(_DWORD *)&v124[32]) {

        }
        if (*(_DWORD *)&v124[28]) {
        if (HIDWORD(v127))
        }

        if (*(_DWORD *)&v124[40]) {
        if (*(_DWORD *)&v124[36])
        }

        if (v127) {
        if (*(_DWORD *)&v124[44])
        }

        if (*(_DWORD *)&v124[48]) {
        if (v125 != v8)
        }

        goto LABEL_98;
      }
LABEL_78:

      goto LABEL_79;
    }

    if (!DWORD2(v126[0])) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  unsigned __int8 v17 = 1;
LABEL_99:

  return v17;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

- (int64_t)credentialState
{
  return self->_credentialState;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (NSDate)lastFullFetchDate
{
  return self->_lastFullFetchDate;
}

- (NSDate)lastFailedFetchDate
{
  return self->_lastFailedFetchDate;
}

- (NSNumber)failedFetchAttemptsCount
{
  return self->_failedFetchAttemptsCount;
}

- (NSNumber)lastExtractedRowID
{
  return self->_lastExtractedRowID;
}

- (NSNumber)lastSubmittedRowID
{
  return self->_lastSubmittedRowID;
}

- (NSNumber)lastExtractedRulesVersion
{
  return self->_lastExtractedRulesVersion;
}

- (HDFHIRCredential)credential
{
  return self->_credential;
}

- (HDClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKSignedClinicalDataIssuer)signedClinicalDataIssuer
{
  return self->_signedClinicalDataIssuer;
}

- (NSString)patientHash
{
  return self->_patientHash;
}

- (void)setPatientHash:(id)a3
{
}

- (HKClinicalSharingStatus)clinicalSharingStatus
{
  return self->_clinicalSharingStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalSharingStatus, 0);
  objc_storeStrong((id *)&self->_patientHash, 0);
  objc_storeStrong((id *)&self->_signedClinicalDataIssuer, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_lastExtractedRulesVersion, 0);
  objc_storeStrong((id *)&self->_lastSubmittedRowID, 0);
  objc_storeStrong((id *)&self->_lastExtractedRowID, 0);
  objc_storeStrong((id *)&self->_failedFetchAttemptsCount, 0);
  objc_storeStrong((id *)&self->_lastFailedFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFullFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HKClinicalAccount)hkAccount
{
  id v2 = [objc_alloc((Class)HKClinicalAccount) initWithDaemonClinicalAccount:self];

  return (HKClinicalAccount *)v2;
}

- (HKClinicalAccountProvenance)hkClinicalAccountProvenance
{
  id v3 = [(HDClinicalAccount *)self gateway];

  if (v3)
  {
    id v4 = objc_alloc((Class)HKClinicalGateway);
    id v5 = [(HDClinicalAccount *)self gateway];
    id v6 = [v4 initWithDaemonClinicalGateway:v5];

    id v7 = [objc_alloc((Class)HKClinicalAccountProvenance) initWithGateway:v6];
LABEL_3:
    id v8 = v7;

    goto LABEL_6;
  }
  uint64_t v9 = [(HDClinicalAccount *)self signedClinicalDataIssuer];

  if (!v9)
  {
    _HKInitializeLogging();
    int v13 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B3DC4(v13);
    }
    id v6 = [objc_alloc((Class)HKSignedClinicalDataIssuer) initWithIdentifier:@"www.example.com" title:@"Missing Endpoint" subtitle:0 wellKnownURL:0];
    id v7 = [objc_alloc((Class)HKClinicalAccountProvenance) initWithSignedClinicalDataIssuer:v6];
    goto LABEL_3;
  }
  id v10 = objc_alloc((Class)HKClinicalAccountProvenance);
  int v11 = [(HDClinicalAccount *)self signedClinicalDataIssuer];
  id v8 = [v10 initWithSignedClinicalDataIssuer:v11];

LABEL_6:

  return (HKClinicalAccountProvenance *)v8;
}

- (int64_t)hkState
{
  id v3 = [(HDClinicalAccount *)self gateway];
  id v4 = (char *)[v3 lastReportedStatus];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    return 4;
  }
  if (v4 == (unsigned char *)&dword_0 + 3) {
    return 5;
  }
  if (![(HDClinicalAccount *)self isUserEnabled]) {
    return 2;
  }
  if ([(HDClinicalAccount *)self needsRelogin]) {
    return 3;
  }
  id v6 = [(HDClinicalAccount *)self credential];

  if (!v6) {
    return 0;
  }
  if ([(HDClinicalAccount *)self needsScopeUpgrade]) {
    return 6;
  }
  return 1;
}

@end