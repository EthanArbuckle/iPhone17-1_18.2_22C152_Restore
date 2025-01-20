@interface FKInstitution
- (BOOL)balanceWidgetEnabled;
- (BOOL)consentSyncingEnabled;
- (BOOL)financialLabEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)multipleConsentsEnabled;
- (BOOL)problemReportingEnabled;
- (BOOL)timestampSuitableForUserDisplay;
- (FKBankConnectTermsAndConditions)termsAndConditions;
- (FKInstitution)initWithInstitutionIdentifier:(id)a3 name:(id)a4 reconsentType:(unint64_t)a5 supportedAuthTypes:(signed __int16)a6 firstTransactionsRequestWindow:(id)a7 maxAgeTransactionsFirstRequest:(double)a8 maxAgeTransactionsRefreshRequest:(double)a9 extensionsBundleIdentifiers:(id)a10 maximumNumberOfBackgroundRefreshes:(int64_t)a11 numberOfRemainingBackgroundRefreshes:(int64_t)a12 backgroundRefreshRetryAfterDate:(id)a13 lastBackgroundRefreshDate:(id)a14 backgroundRefreshConfirmationWindow:(id)a15 backgroundRefreshConfirmationExpiryWindow:(id)a16 multipleConsentsEnabled:(BOOL)a17 termsAndConditions:(id)a18 problemReportingEnabled:(BOOL)a19 financialLabEnabled:(BOOL)a20 consentSyncingEnabled:(BOOL)a21 balanceWidgetEnabled:(BOOL)a22 consentSyncingOutdatedTokenWaitTimeout:(id)a23 timestampSuitableForUserDisplay:(BOOL)a24 piiRedactionConfigurationCountryCodes:(id)a25 privacyLabels:(signed __int16)a26;
- (NSArray)extensionsBundleIdentifiers;
- (NSDate)backgroundRefreshRetryAfterDate;
- (NSDate)lastBackgroundRefreshDate;
- (NSNumber)backgroundRefreshConfirmationExpiryWindow;
- (NSNumber)backgroundRefreshConfirmationWindow;
- (NSNumber)consentSyncingOutdatedTokenWaitTimeout;
- (NSNumber)firstTransactionsRequestWindow;
- (NSSet)piiRedactionConfigurationCountryCodes;
- (NSString)institutionIdentifier;
- (NSString)name;
- (double)maxAgeTransactionsFirstRequest;
- (double)maxAgeTransactionsRefreshRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maximumNumberOfBackgroundRefreshes;
- (int64_t)numberOfRemainingBackgroundRefreshes;
- (signed)privacyLabels;
- (signed)supportedAuthTypes;
- (unint64_t)hash;
- (unint64_t)reconsentType;
@end

@implementation FKInstitution

- (FKInstitution)initWithInstitutionIdentifier:(id)a3 name:(id)a4 reconsentType:(unint64_t)a5 supportedAuthTypes:(signed __int16)a6 firstTransactionsRequestWindow:(id)a7 maxAgeTransactionsFirstRequest:(double)a8 maxAgeTransactionsRefreshRequest:(double)a9 extensionsBundleIdentifiers:(id)a10 maximumNumberOfBackgroundRefreshes:(int64_t)a11 numberOfRemainingBackgroundRefreshes:(int64_t)a12 backgroundRefreshRetryAfterDate:(id)a13 lastBackgroundRefreshDate:(id)a14 backgroundRefreshConfirmationWindow:(id)a15 backgroundRefreshConfirmationExpiryWindow:(id)a16 multipleConsentsEnabled:(BOOL)a17 termsAndConditions:(id)a18 problemReportingEnabled:(BOOL)a19 financialLabEnabled:(BOOL)a20 consentSyncingEnabled:(BOOL)a21 balanceWidgetEnabled:(BOOL)a22 consentSyncingOutdatedTokenWaitTimeout:(id)a23 timestampSuitableForUserDisplay:(BOOL)a24 piiRedactionConfigurationCountryCodes:(id)a25 privacyLabels:(signed __int16)a26
{
  id v68 = a3;
  id v67 = a4;
  id v66 = a7;
  id v65 = a10;
  id v64 = a13;
  id v31 = a14;
  id v32 = a15;
  id v33 = a16;
  id v34 = a18;
  id v35 = a23;
  id v36 = a25;
  v69.receiver = self;
  v69.super_class = (Class)FKInstitution;
  v37 = [(FKInstitution *)&v69 init];
  if (v37)
  {
    uint64_t v38 = [v68 copy];
    institutionIdentifier = v37->_institutionIdentifier;
    v37->_institutionIdentifier = (NSString *)v38;

    uint64_t v40 = [v67 copy];
    name = v37->_name;
    v37->_name = (NSString *)v40;

    v37->_reconsentType = a5;
    v37->_supportedAuthTypes = a6;
    uint64_t v42 = [v66 copy];
    firstTransactionsRequestWindow = v37->_firstTransactionsRequestWindow;
    v37->_firstTransactionsRequestWindow = (NSNumber *)v42;

    v37->_maxAgeTransactionsFirstRequest = a8;
    v37->_maxAgeTransactionsRefreshRequest = a9;
    uint64_t v44 = [v65 copy];
    extensionsBundleIdentifiers = v37->_extensionsBundleIdentifiers;
    v37->_extensionsBundleIdentifiers = (NSArray *)v44;

    v37->_maximumNumberOfBackgroundRefreshes = a11;
    v37->_numberOfRemainingBackgroundRefreshes = a12;
    uint64_t v46 = [v64 copy];
    backgroundRefreshRetryAfterDate = v37->_backgroundRefreshRetryAfterDate;
    v37->_backgroundRefreshRetryAfterDate = (NSDate *)v46;

    uint64_t v48 = [v31 copy];
    lastBackgroundRefreshDate = v37->_lastBackgroundRefreshDate;
    v37->_lastBackgroundRefreshDate = (NSDate *)v48;

    uint64_t v50 = [v32 copy];
    backgroundRefreshConfirmationWindow = v37->_backgroundRefreshConfirmationWindow;
    v37->_backgroundRefreshConfirmationWindow = (NSNumber *)v50;

    uint64_t v52 = [v33 copy];
    backgroundRefreshConfirmationExpiryWindow = v37->_backgroundRefreshConfirmationExpiryWindow;
    v37->_backgroundRefreshConfirmationExpiryWindow = (NSNumber *)v52;

    v37->_multipleConsentsEnabled = a17;
    uint64_t v54 = [v34 copy];
    termsAndConditions = v37->_termsAndConditions;
    v37->_termsAndConditions = (FKBankConnectTermsAndConditions *)v54;

    v37->_problemReportingEnabled = a19;
    v37->_financialLabEnabled = a20;
    v37->_consentSyncingEnabled = a21;
    v37->_balanceWidgetEnabled = a22;
    uint64_t v56 = [v35 copy];
    consentSyncingOutdatedTokenWaitTimeout = v37->_consentSyncingOutdatedTokenWaitTimeout;
    v37->_consentSyncingOutdatedTokenWaitTimeout = (NSNumber *)v56;

    v37->_timestampSuitableForUserDisplay = a24;
    uint64_t v58 = [v36 copy];
    piiRedactionConfigurationCountryCodes = v37->_piiRedactionConfigurationCountryCodes;
    v37->_piiRedactionConfigurationCountryCodes = (NSSet *)v58;

    v37->_privacyLabels = a26;
  }

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKInstitution);
  uint64_t v6 = [(NSString *)self->_institutionIdentifier copyWithZone:a3];
  institutionIdentifier = v5->_institutionIdentifier;
  v5->_institutionIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v8;

  v5->_reconsentType = self->_reconsentType;
  v5->_supportedAuthTypes = self->_supportedAuthTypes;
  uint64_t v10 = [(NSNumber *)self->_firstTransactionsRequestWindow copyWithZone:a3];
  firstTransactionsRequestWindow = v5->_firstTransactionsRequestWindow;
  v5->_firstTransactionsRequestWindow = (NSNumber *)v10;

  v5->_maxAgeTransactionsFirstRequest = self->_maxAgeTransactionsFirstRequest;
  v5->_maxAgeTransactionsRefreshRequest = self->_maxAgeTransactionsRefreshRequest;
  uint64_t v12 = [(NSArray *)self->_extensionsBundleIdentifiers copyWithZone:a3];
  extensionsBundleIdentifiers = v5->_extensionsBundleIdentifiers;
  v5->_extensionsBundleIdentifiers = (NSArray *)v12;

  v5->_maximumNumberOfBackgroundRefreshes = self->_maximumNumberOfBackgroundRefreshes;
  v5->_numberOfRemainingBackgroundRefreshes = self->_numberOfRemainingBackgroundRefreshes;
  uint64_t v14 = [(NSDate *)self->_backgroundRefreshRetryAfterDate copyWithZone:a3];
  backgroundRefreshRetryAfterDate = v5->_backgroundRefreshRetryAfterDate;
  v5->_backgroundRefreshRetryAfterDate = (NSDate *)v14;

  uint64_t v16 = [(NSDate *)self->_lastBackgroundRefreshDate copyWithZone:a3];
  lastBackgroundRefreshDate = v5->_lastBackgroundRefreshDate;
  v5->_lastBackgroundRefreshDate = (NSDate *)v16;

  uint64_t v18 = [(NSNumber *)self->_backgroundRefreshConfirmationWindow copyWithZone:a3];
  backgroundRefreshConfirmationWindow = v5->_backgroundRefreshConfirmationWindow;
  v5->_backgroundRefreshConfirmationWindow = (NSNumber *)v18;

  uint64_t v20 = [(NSNumber *)self->_backgroundRefreshConfirmationExpiryWindow copyWithZone:a3];
  backgroundRefreshConfirmationExpiryWindow = v5->_backgroundRefreshConfirmationExpiryWindow;
  v5->_backgroundRefreshConfirmationExpiryWindow = (NSNumber *)v20;

  v5->_multipleConsentsEnabled = self->_multipleConsentsEnabled;
  v22 = [(FKBankConnectTermsAndConditions *)self->_termsAndConditions copyWithZone:a3];
  termsAndConditions = v5->_termsAndConditions;
  v5->_termsAndConditions = v22;

  v5->_problemReportingEnabled = self->_problemReportingEnabled;
  v5->_financialLabEnabled = self->_financialLabEnabled;
  v5->_consentSyncingEnabled = self->_consentSyncingEnabled;
  v5->_balanceWidgetEnabled = self->_balanceWidgetEnabled;
  uint64_t v24 = [(NSNumber *)self->_consentSyncingOutdatedTokenWaitTimeout copyWithZone:a3];
  consentSyncingOutdatedTokenWaitTimeout = v5->_consentSyncingOutdatedTokenWaitTimeout;
  v5->_consentSyncingOutdatedTokenWaitTimeout = (NSNumber *)v24;

  v5->_timestampSuitableForUserDisplay = self->_timestampSuitableForUserDisplay;
  uint64_t v26 = [(NSSet *)self->_piiRedactionConfigurationCountryCodes copyWithZone:a3];
  piiRedactionConfigurationCountryCodes = v5->_piiRedactionConfigurationCountryCodes;
  v5->_piiRedactionConfigurationCountryCodes = (NSSet *)v26;

  v5->_privacyLabels = self->_privacyLabels;
  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_institutionIdentifier];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_extensionsBundleIdentifiers];
  [v3 safelyAddObject:self->_firstTransactionsRequestWindow];
  [v3 safelyAddObject:self->_backgroundRefreshConfirmationWindow];
  [v3 safelyAddObject:self->_backgroundRefreshConfirmationExpiryWindow];
  [v3 safelyAddObject:self->_termsAndConditions];
  [v3 safelyAddObject:self->_piiRedactionConfigurationCountryCodes];
  [v3 safelyAddObject:self->_backgroundRefreshRetryAfterDate];
  [v3 safelyAddObject:self->_lastBackgroundRefreshDate];
  [v3 safelyAddObject:self->_consentSyncingOutdatedTokenWaitTimeout];
  uint64_t v4 = FKCombinedHash(17, v3);
  uint64_t v5 = FKIntegerHash(v4, self->_reconsentType);
  uint64_t v6 = FKIntegerHash(v5, self->_supportedAuthTypes);
  uint64_t v7 = FKIntegerHash(v6, (unint64_t)self->_maxAgeTransactionsFirstRequest);
  uint64_t v8 = FKIntegerHash(v7, (unint64_t)self->_maxAgeTransactionsRefreshRequest);
  uint64_t v9 = FKIntegerHash(v8, self->_multipleConsentsEnabled);
  uint64_t v10 = FKIntegerHash(v9, self->_problemReportingEnabled);
  uint64_t v11 = FKIntegerHash(v10, self->_financialLabEnabled);
  uint64_t v12 = FKIntegerHash(v11, self->_consentSyncingEnabled);
  uint64_t v13 = FKIntegerHash(v12, self->_balanceWidgetEnabled);
  uint64_t v14 = FKIntegerHash(v13, self->_timestampSuitableForUserDisplay);
  uint64_t v15 = FKIntegerHash(v14, self->_privacyLabels);
  uint64_t v16 = FKIntegerHash(v15, self->_maximumNumberOfBackgroundRefreshes);
  unint64_t v17 = FKIntegerHash(v16, self->_numberOfRemainingBackgroundRefreshes);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKInstitution *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v7 = FKEqualObjects(self->_institutionIdentifier, v6[3])
      && FKEqualObjects(self->_name, v6[4])
      && FKEqualObjects(self->_extensionsBundleIdentifiers, v6[9])
      && FKEqualObjects(self->_firstTransactionsRequestWindow, v6[6])
      && FKEqualObjects(self->_backgroundRefreshConfirmationWindow, v6[14])
      && FKEqualObjects(self->_backgroundRefreshConfirmationExpiryWindow, v6[15])
      && FKEqualObjects(self->_termsAndConditions, v6[16])
      && FKEqualObjects(self->_piiRedactionConfigurationCountryCodes, v6[18])
      && FKEqualObjects(self->_backgroundRefreshRetryAfterDate, v6[12])
      && FKEqualObjects(self->_lastBackgroundRefreshDate, v6[13])
      && FKEqualObjects(self->_consentSyncingOutdatedTokenWaitTimeout, v6[17])
      && (void *)self->_reconsentType == v6[5]
      && (unsigned __int16)self->_supportedAuthTypes == *((unsigned __int16 *)v6 + 7)
      && self->_maxAgeTransactionsFirstRequest == *((double *)v6 + 7)
      && self->_maxAgeTransactionsRefreshRequest == *((double *)v6 + 8)
      && self->_multipleConsentsEnabled == *((unsigned __int8 *)v6 + 8)
      && self->_problemReportingEnabled == *((unsigned __int8 *)v6 + 9)
      && self->_financialLabEnabled == *((unsigned __int8 *)v6 + 10)
      && self->_consentSyncingEnabled == *((unsigned __int8 *)v6 + 11)
      && self->_balanceWidgetEnabled == *((unsigned __int8 *)v6 + 12)
      && self->_timestampSuitableForUserDisplay == *((unsigned __int8 *)v6 + 13)
      && (unsigned __int16)self->_privacyLabels == *((unsigned __int16 *)v6 + 8)
      && (void *)self->_maximumNumberOfBackgroundRefreshes == v6[10]
      && self->_numberOfRemainingBackgroundRefreshes == (void)v6[11];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)institutionIdentifier
{
  return self->_institutionIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)reconsentType
{
  return self->_reconsentType;
}

- (signed)supportedAuthTypes
{
  return self->_supportedAuthTypes;
}

- (NSNumber)firstTransactionsRequestWindow
{
  return self->_firstTransactionsRequestWindow;
}

- (double)maxAgeTransactionsFirstRequest
{
  return self->_maxAgeTransactionsFirstRequest;
}

- (double)maxAgeTransactionsRefreshRequest
{
  return self->_maxAgeTransactionsRefreshRequest;
}

- (NSArray)extensionsBundleIdentifiers
{
  return self->_extensionsBundleIdentifiers;
}

- (int64_t)maximumNumberOfBackgroundRefreshes
{
  return self->_maximumNumberOfBackgroundRefreshes;
}

- (int64_t)numberOfRemainingBackgroundRefreshes
{
  return self->_numberOfRemainingBackgroundRefreshes;
}

- (NSDate)backgroundRefreshRetryAfterDate
{
  return self->_backgroundRefreshRetryAfterDate;
}

- (NSDate)lastBackgroundRefreshDate
{
  return self->_lastBackgroundRefreshDate;
}

- (NSNumber)backgroundRefreshConfirmationWindow
{
  return self->_backgroundRefreshConfirmationWindow;
}

- (NSNumber)backgroundRefreshConfirmationExpiryWindow
{
  return self->_backgroundRefreshConfirmationExpiryWindow;
}

- (BOOL)multipleConsentsEnabled
{
  return self->_multipleConsentsEnabled;
}

- (FKBankConnectTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (BOOL)problemReportingEnabled
{
  return self->_problemReportingEnabled;
}

- (BOOL)financialLabEnabled
{
  return self->_financialLabEnabled;
}

- (BOOL)consentSyncingEnabled
{
  return self->_consentSyncingEnabled;
}

- (BOOL)balanceWidgetEnabled
{
  return self->_balanceWidgetEnabled;
}

- (NSNumber)consentSyncingOutdatedTokenWaitTimeout
{
  return self->_consentSyncingOutdatedTokenWaitTimeout;
}

- (BOOL)timestampSuitableForUserDisplay
{
  return self->_timestampSuitableForUserDisplay;
}

- (NSSet)piiRedactionConfigurationCountryCodes
{
  return self->_piiRedactionConfigurationCountryCodes;
}

- (signed)privacyLabels
{
  return self->_privacyLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_piiRedactionConfigurationCountryCodes, 0);
  objc_storeStrong((id *)&self->_consentSyncingOutdatedTokenWaitTimeout, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationExpiryWindow, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationWindow, 0);
  objc_storeStrong((id *)&self->_lastBackgroundRefreshDate, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshRetryAfterDate, 0);
  objc_storeStrong((id *)&self->_extensionsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_firstTransactionsRequestWindow, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_institutionIdentifier, 0);
}

@end