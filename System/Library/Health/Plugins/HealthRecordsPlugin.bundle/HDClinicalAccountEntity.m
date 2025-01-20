@interface HDClinicalAccountEntity
+ (BOOL)_bindPropertiesForSync:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 mutationHandler:(id)a7;
+ (BOOL)_deleteLastFetchDatesForAccountWithdentifier:(id)a3 profile:(id)a4 healthDatabase:(id)a5 error:(id *)a6;
+ (BOOL)_insertCodableAccounts:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertOrUpdateAccountWithCodableAccount:(id)a3 gatewayID:(id)a4 signedClinicalDataIssuerID:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 transaction:(id)a8 profile:(id)a9 error:(id *)a10;
+ (BOOL)_propertiesShouldTriggerSyncOnUpdate:(id)a3;
+ (BOOL)_updateAccountCredentialState:(int64_t)a3 identifier:(id)a4 profile:(id)a5 transaction:(id)a6 event:(id)a7 alwaysRecordEvent:(BOOL)a8 error:(id *)a9;
+ (BOOL)_updateCountOfGatewayBackedAccountsWithProfile:(id)a3 error:(id *)a4;
+ (BOOL)_validateCodableAccount:(id)a3 error:(id *)a4;
+ (BOOL)accountsNeedExtractionForProfile:(id)a3;
+ (BOOL)createAccountCredentialFromAuthResponse:(id)a3 accountIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 healthDatabase:(id)a7 event:(id)a8 createdCredential:(id *)a9 error:(id *)a10;
+ (BOOL)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 deleteGateway:(BOOL)a5 deleteIssuer:(BOOL)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)resetAccountRowIDsForRulesVersion:(id)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (BOOL)updateAccountCredentialFromAuthResponse:(id)a3 accountIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 healthDatabase:(id)a7 event:(id)a8 updatedCredential:(id *)a9 error:(id *)a10;
+ (BOOL)updateAccountCredentialState:(int64_t)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 event:(id)a7 error:(id *)a8;
+ (BOOL)updateAccountLastExtractedRowID:(id)a3 rulesVersion:(id)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8;
+ (BOOL)updateAccountLastFailedFetchDate:(id)a3 overrideFailedAttemptsCount:(id)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8;
+ (BOOL)updateAccountLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8;
+ (BOOL)updateAccountLastFetchDateNoValidation:(id)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (BOOL)updateAccountLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 identifier:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (BOOL)updateAccountUserEnabled:(BOOL)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7;
+ (BOOL)updateSourcesForAccountWithIdentifier:(id)a3 wasAccountInsert:(BOOL)a4 clinicalExternalID:(id)a5 externalTitle:(id)a6 profile:(id)a7 error:(id *)a8;
+ (HDClinicalAccountEntity)accountEntityWithCredentialID:(id)a3 database:(id)a4 error:(id *)a5;
+ (HDClinicalAccountEntity)accountEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (HDClinicalAccountEntity)accountEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)_codableWithClinicalAccount:(id)a3 syncIdentifier:(id)a4 modificationDate:(id)a5;
+ (id)_codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4;
+ (id)_currentCodableMessageVersion;
+ (id)_hkAccountRepresentingDeletedAccountWithIdentifier:(id)a3 gatewayExternalID:(id)a4 signedClinicalDataIssuerID:(id)a5;
+ (id)_insertAccountInProfile:(id)a3 identifier:(id)a4 syncIdentifier:(id)a5 userEnabled:(BOOL)a6 credentialState:(int64_t)a7 creationDate:(id)a8 modificationDate:(id)a9 lastFetchDate:(id)a10 lastFullFetchDate:(id)a11 lastFailedFetchDate:(id)a12 failedFetchAttemptsCount:(id)a13 lastExtractedRowID:(id)a14 lastSubmittedRowID:(id)a15 lastExtractedRulesVersion:(id)a16 credentialID:(id)a17 patientHash:(id)a18 gatewayID:(id)a19 signedClinicalDataIssuerID:(id)a20 clinicalSharingStatus:(id)a21 syncProvenance:(int64_t)a22 syncIdentity:(int64_t)a23 error:(id *)a24;
+ (id)_keyValueDomainWithProfile:(id)a3;
+ (id)_populateAccountWithRow:(HDSQLiteRow *)a3 credential:(id)a4 gateway:(id)a5 signedClinicalDataIssuer:(id)a6;
+ (id)_predicateForAccountForGatewayWithExternalID:(id)a3;
+ (id)_predicateForAccountForSignedClinicalDataIssuerWithIdentifier:(id)a3;
+ (id)_predicateForAccountWithCredentialID:(id)a3;
+ (id)_predicateForAccountWithGatewayID:(id)a3;
+ (id)_predicateForAccountWithIdentifier:(id)a3;
+ (id)_predicateForAccountWithPersistentID:(int64_t)a3 expectedLastExtractedRulesVersion:(id)a4;
+ (id)_predicateForAccountWithSignedClinicalDataIssuerID:(id)a3;
+ (id)_predicateForAccountWithSyncIdentifier:(id)a3;
+ (id)_predicateForAccountsForGatewaysWithExternalIDs:(id)a3;
+ (id)_predicateForAccountsWithGateways;
+ (id)_predicateForAccountsWithIdentifiers:(id)a3;
+ (id)_predicateForAccountsWithIssuers;
+ (id)_predicateForActiveDefaultCredentialState;
+ (id)_predicateForActiveDefaultCredentialStateMissingCredential;
+ (id)_predicateForActiveNeedsRelogin;
+ (id)_predicateForDefaultCredentialState;
+ (id)_predicateForFetchable;
+ (id)_predicateForFetchableAccountsWithIdentifiers:(id)a3;
+ (id)_predicateForMissingCredential;
+ (id)_predicateForNeedsRelogin;
+ (id)_predicateForRemoteFetchEligible;
+ (id)_predicateForUserFetchEligible;
+ (id)_predicateForUserFetchEligibleAccountsWithIdentifiers:(id)a3;
+ (id)_propertiesByAddingSyncPropertiesToProperties:(id)a3;
+ (id)_propertiesForCodable;
+ (id)_propertiesForEntity;
+ (id)_propertiesForModel;
+ (id)_propertiesForUpdatingFromReceivedEntity;
+ (id)_syncProperties;
+ (id)_syncableProperties;
+ (id)accountEntityForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)accountEntityForSignedClinicalDataIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)accountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)accountWithIdentifier:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)accountsForGatewayExternalIDs:(id)a3 healthDatabase:(id)a4 error:(id *)a5;
+ (id)accountsInDatabase:(id)a3 predicate:(id)a4 errorOut:(id *)a5;
+ (id)accountsInHealthDatabase:(id)a3 predicate:(id)a4 error:(id *)a5;
+ (id)accountsNeedExtractionSQL;
+ (id)accountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)allAccountsInHealthDatabase:(id)a3 error:(id *)a4;
+ (id)countOfGatewayBackedAccountsWithProfile:(id)a3 error:(id *)a4;
+ (id)countOfIssuerBackedAccountsWithProfile:(id)a3 error:(id *)a4;
+ (id)existingAccountEntityForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)existingAccountEntityForSignedClinicalDataIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)existingAccountEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)existingAccountEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)fetchableAccountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)hasActiveAccountNeedingReloginInHealthDatabase:(id)a3 error:(id *)a4;
+ (id)insertAccountWithIdentifier:(id)a3 syncIdentifier:(id)a4 userEnabled:(BOOL)a5 credentialState:(int64_t)a6 credentialID:(id)a7 patientHash:(id)a8 gatewayID:(id)a9 signedClinicalDataIssuerID:(id)a10 clinicalSharingStatus:(id)a11 profile:(id)a12 error:(id *)a13;
+ (id)predicateForAccountsForLegacySync;
+ (id)userFetchEligibleAccountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5;
+ (int64_t)hasGatewayBackedAccountsInHealthDatabase:(id)a3 error:(id *)a4;
+ (int64_t)hasIssuerBackedAccountsInHealthDatabase:(id)a3 error:(id *)a4;
+ (void)_journalAccountEvent:(id)a3 database:(id)a4;
+ (void)_postAccountChangeNotificationForAccount:(id)a3 changeType:(int64_t)a4;
- (BOOL)_resetAccountCredentialIfDownloadIsOverdueWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)_updateAccountFromSyncWithCodable:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)_updateBooleanForProperty:(id)a3 value:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateCredentialID:(id)a3 patientID:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateLastExtractedRowID:(id)a3 rulesVersion:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateLastFailedFetchDate:(id)a3 overrideFailedAttemptsCount:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateLastFetchDate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)_updateLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateLastFullFetchDate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)_updateLastFullFetchDateWithLastFetchDate:(id)a3 lastFullFetchDate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)_updateStringForProperty:(id)a3 value:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (BOOL)assignCredentialWithPersistentID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)deleteCredentialWithProfile:(id)a3 transaction:(id)a4 deleteTokens:(BOOL)a5 credentialIdentifier:(id *)a6 error:(id *)a7;
- (BOOL)resetFetchFailureInformationWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)updateClinicalSharingStatusWithProfile:(id)a3 transaction:(id)a4 firstSharedDate:(id)a5 lastSharedDate:(id)a6 userStatus:(id)a7 multiDeviceStatus:(id)a8 primaryDeviceName:(id)a9 error:(id *)a10;
- (BOOL)updateCredentialState:(int64_t)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)updateLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 database:(id)a5 error:(id *)a6;
- (BOOL)updatePatientHash:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (BOOL)updateProperties:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
- (BOOL)updateUserEnabled:(BOOL)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
- (id)_codableInDatabase:(id)a3 error:(id *)a4;
- (id)_createCredentialFromAuthResponse:(id)a3 credentialIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
- (id)_credentialInDatabase:(id)a3 error:(id *)a4;
- (id)_issuerInDatabase:(id)a3 error:(id *)a4;
- (id)_updateCredentialFromAuthResponse:(id)a3 requestedScope:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
- (id)accountInDatabase:(id)a3 error:(id *)a4;
- (id)codableInHealthDatabase:(id)a3 error:(id *)a4;
- (id)credentialIDInDatabase:(id)a3;
- (id)gatewayInDatabase:(id)a3 error:(id *)a4;
- (id)identifierInDatabase:(id)a3;
- (id)syncIdentifierInDatabase:(id)a3;
- (int64_t)credentialStateInDatabase:(id)a3;
@end

@implementation HDClinicalAccountEntity

+ (id)_propertiesForEntity
{
  v4[0] = HDClinicalAccountEntityPropertyIdentifier;
  v4[1] = HDClinicalAccountEntityPropertySyncIdentifier;
  v4[2] = HDClinicalAccountEntityPropertyUserEnabled;
  v4[3] = HDClinicalAccountEntityPropertyCredentialState;
  v4[4] = HDClinicalAccountEntityPropertyCreationDate;
  v4[5] = HDClinicalAccountEntityPropertyLastFetchDate;
  v4[6] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v4[7] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v4[8] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  v4[9] = HDClinicalAccountEntityPropertyLastExtractedRowID;
  v4[10] = HDClinicalAccountEntityPropertyLastSubmittedRowID;
  v4[11] = HDClinicalAccountEntityPropertyLastExtractedRulesVersion;
  v4[12] = HDClinicalAccountEntityPropertyCredentialID;
  v4[13] = HDClinicalAccountEntityPropertyPatientHash;
  v4[14] = HDClinicalAccountEntityPropertyGatewayID;
  v4[15] = HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID;
  v4[16] = HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate;
  v4[17] = HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate;
  v4[18] = HDClinicalAccountEntityPropertyClinicalSharingUserStatus;
  v4[19] = HDClinicalAccountEntityPropertyClinicalSharingMultiDeviceStatus;
  v4[20] = HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName;
  v4[21] = HDClinicalAccountEntityPropertySyncProvenance;
  v4[22] = HDClinicalAccountEntityPropertyModificationDate;
  v4[23] = HDClinicalAccountEntityPropertySyncIdentity;
  v2 = +[NSArray arrayWithObjects:v4 count:24];

  return v2;
}

+ (id)_propertiesForUpdatingFromReceivedEntity
{
  v4[0] = HDClinicalAccountEntityPropertySyncIdentifier;
  v4[1] = HDClinicalAccountEntityPropertyCreationDate;
  v4[2] = HDClinicalAccountEntityPropertyUserEnabled;
  v4[3] = HDClinicalAccountEntityPropertyLastFetchDate;
  v4[4] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v4[5] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v4[6] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  v4[7] = HDClinicalAccountEntityPropertyModificationDate;
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

+ (id)_propertiesForModel
{
  v4[0] = HDClinicalAccountEntityPropertyIdentifier;
  v4[1] = HDClinicalAccountEntityPropertyUserEnabled;
  v4[2] = HDClinicalAccountEntityPropertyCredentialState;
  v4[3] = HDClinicalAccountEntityPropertyCreationDate;
  v4[4] = HDClinicalAccountEntityPropertyLastFetchDate;
  v4[5] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v4[6] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v4[7] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  void v4[8] = HDClinicalAccountEntityPropertyLastExtractedRowID;
  v4[9] = HDClinicalAccountEntityPropertyLastSubmittedRowID;
  v4[10] = HDClinicalAccountEntityPropertyLastExtractedRulesVersion;
  v4[11] = HDClinicalAccountEntityPropertyCredentialID;
  v4[12] = HDClinicalAccountEntityPropertyPatientHash;
  v4[13] = HDClinicalAccountEntityPropertyGatewayID;
  v4[14] = HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID;
  v4[15] = HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate;
  v4[16] = HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate;
  v4[17] = HDClinicalAccountEntityPropertyClinicalSharingUserStatus;
  v4[18] = HDClinicalAccountEntityPropertyClinicalSharingMultiDeviceStatus;
  v4[19] = HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName;
  v2 = +[NSArray arrayWithObjects:v4 count:20];

  return v2;
}

+ (id)_propertiesForCodable
{
  v4[0] = HDClinicalAccountEntityPropertyGatewayExternalID;
  v4[1] = HDClinicalAccountEntityPropertySignedClinicalDataIssuerIdentifier;
  v4[2] = HDClinicalAccountEntityPropertyCreationDate;
  v4[3] = HDClinicalAccountEntityPropertyModificationDate;
  v4[4] = HDClinicalAccountEntityPropertyLastFetchDate;
  v4[5] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v4[6] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v4[7] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  void v4[8] = HDClinicalAccountEntityPropertySyncIdentifier;
  v4[9] = HDClinicalAccountEntityPropertyUserEnabled;
  v4[10] = HDClinicalAccountEntityPropertyIdentifier;
  v4[11] = HDClinicalAccountEntityPropertyPatientHash;
  v4[12] = HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate;
  v4[13] = HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate;
  v4[14] = HDClinicalAccountEntityPropertyClinicalSharingUserStatus;
  v4[15] = HDClinicalAccountEntityPropertyClinicalSharingMultiDeviceStatus;
  v4[16] = HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName;
  v2 = +[NSArray arrayWithObjects:v4 count:17];

  return v2;
}

+ (id)_syncProperties
{
  v4[0] = HDClinicalAccountEntityPropertyModificationDate;
  v4[1] = HDClinicalAccountEntityPropertySyncAnchor;
  v4[2] = HDClinicalAccountEntityPropertySyncProvenance;
  v4[3] = HDClinicalAccountEntityPropertySyncIdentity;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)_syncableProperties
{
  v4[0] = HDClinicalAccountEntityPropertyIdentifier;
  v4[1] = HDClinicalAccountEntityPropertySyncIdentifier;
  v4[2] = HDClinicalAccountEntityPropertyUserEnabled;
  v4[3] = HDClinicalAccountEntityPropertyCreationDate;
  void v4[4] = HDClinicalAccountEntityPropertyLastFetchDate;
  v4[5] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v4[6] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v4[7] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  void v4[8] = HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate;
  v4[9] = HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate;
  v4[10] = HDClinicalAccountEntityPropertyClinicalSharingUserStatus;
  v4[11] = HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName;
  v2 = +[NSArray arrayWithObjects:v4 count:12];

  return v2;
}

+ (id)_predicateForAccountWithIdentifier:(id)a3
{
  uint64_t v3 = HDClinicalAccountEntityPropertyIdentifier;
  v4 = _HDSQLiteValueForUUID();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForAccountWithSyncIdentifier:(id)a3
{
  uint64_t v3 = HDClinicalAccountEntityPropertySyncIdentifier;
  v4 = _HDSQLiteValueForUUID();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForUserFetchEligible
{
  uint64_t v3 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyUserEnabled equalToValue:&__kCFBooleanTrue];
  v4 = +[HDSQLiteNullPredicate isNotNullPredicateWithProperty:HDClinicalAccountEntityPropertyCredentialID];
  v5 = [a1 _predicateForNeedsRelogin];
  v6 = +[HDSQLiteCompoundPredicate negatedPredicate:v5];

  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v6;
  v7 = +[NSArray arrayWithObjects:v10 count:3];
  v8 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  return v8;
}

+ (id)_predicateForAccountsWithGateways
{
  return +[HDSQLiteNullPredicate isNotNullPredicateWithProperty:HDClinicalAccountEntityPropertyGatewayID];
}

+ (id)_predicateForAccountsWithIssuers
{
  return +[HDSQLiteNullPredicate isNotNullPredicateWithProperty:HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID];
}

+ (id)_predicateForRemoteFetchEligible
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyGatewayLastReportedStatus equalToValue:&off_11D188];
}

+ (id)_predicateForFetchable
{
  uint64_t v3 = [a1 _predicateForUserFetchEligible];
  v4 = [a1 _predicateForRemoteFetchEligible];
  v5 = +[HDSQLitePredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForNeedsRelogin
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyCredentialState equalToValue:&off_11D188];
}

+ (id)_predicateForDefaultCredentialState
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyCredentialState equalToValue:&off_11D1A0];
}

+ (id)_predicateForMissingCredential
{
  return +[HDSQLiteNullPredicate isNullPredicateWithProperty:HDClinicalAccountEntityPropertyCredentialID];
}

+ (id)_predicateForAccountWithCredentialID:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyCredentialID equalToValue:a3];
}

+ (id)_predicateForActiveNeedsRelogin
{
  uint64_t v3 = [a1 _predicateForRemoteFetchEligible];
  v4 = [a1 _predicateForNeedsRelogin];
  v5 = +[HDSQLitePredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForActiveDefaultCredentialState
{
  uint64_t v3 = [a1 _predicateForRemoteFetchEligible];
  v4 = [a1 _predicateForDefaultCredentialState];
  v5 = +[HDSQLitePredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForActiveDefaultCredentialStateMissingCredential
{
  uint64_t v3 = [a1 _predicateForActiveDefaultCredentialState];
  v4 = [a1 _predicateForMissingCredential];
  v5 = +[HDSQLitePredicate compoundPredicateWithPredicate:v3 otherPredicate:v4];

  return v5;
}

+ (id)_predicateForAccountWithGatewayID:(id)a3
{
  uint64_t v3 = HDClinicalAccountEntityPropertyGatewayID;
  v4 = _HDSQLiteValueForNumber();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForAccountForGatewayWithExternalID:(id)a3
{
  uint64_t v3 = HDClinicalAccountEntityPropertyGatewayExternalID;
  v4 = _HDSQLiteValueForString();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForAccountWithSignedClinicalDataIssuerID:(id)a3
{
  uint64_t v3 = HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID;
  v4 = _HDSQLiteValueForNumber();
  v5 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];

  return v5;
}

+ (id)_predicateForAccountForSignedClinicalDataIssuerWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  v5 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v4 toTargetEntity:objc_opt_class() as:0 localReference:HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID targetKey:HDSQLEntityPropertyPersistentID];

  v6 = +[NSSet setWithObject:v5];
  v7 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v6];

  v8 = +[HDSignedClinicalDataIssuerEntity predicateForIssuerWithIdentifier:v3];
  v9 = [v8 SQLForEntityClass:objc_opt_class()];
  id v16 = v3;
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  v11 = +[HDSQLiteRawPredicate predicateWithSQL:v9 overProperties:&__NSArray0__struct values:v10];

  v15[0] = v7;
  v15[1] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:2];
  v13 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  return v13;
}

+ (id)_predicateForAccountsWithIdentifiers:(id)a3
{
  if (a3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_42A44;
    v6[3] = &unk_113338;
    v6[4] = a1;
    id v3 = objc_msgSend(a3, "hk_map:", v6);
    v4 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v3];
  }
  else
  {
    v4 = +[HDSQLitePredicate truePredicate];
  }

  return v4;
}

+ (id)_predicateForUserFetchEligibleAccountsWithIdentifiers:(id)a3
{
  v4 = [a1 _predicateForAccountsWithIdentifiers:a3];
  v5 = [a1 _predicateForUserFetchEligible];
  v6 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v4 otherPredicate:v5];

  return v6;
}

+ (id)_predicateForFetchableAccountsWithIdentifiers:(id)a3
{
  v4 = [a1 _predicateForAccountsWithIdentifiers:a3];
  v5 = [a1 _predicateForFetchable];
  v6 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v4 otherPredicate:v5];

  return v6;
}

+ (id)_predicateForAccountsForGatewaysWithExternalIDs:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_42C04;
  v6[3] = &unk_113358;
  v6[4] = a1;
  id v3 = objc_msgSend(a3, "hk_map:", v6);
  v4 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v3];

  return v4;
}

+ (id)_predicateForAccountWithPersistentID:(int64_t)a3 expectedLastExtractedRulesVersion:(id)a4
{
  uint64_t v5 = HDSQLEntityPropertyPersistentID;
  id v6 = a4;
  v7 = +[NSNumber numberWithLongLong:a3];
  v8 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 equalToValue:v7];

  uint64_t v9 = HDClinicalAccountEntityPropertyLastExtractedRulesVersion;
  v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalAccountEntityPropertyLastExtractedRulesVersion equalToValue:v6];

  v11 = +[HDSQLiteNullPredicate isNullPredicateWithProperty:v9];
  v16[0] = v10;
  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];
  v13 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v12];

  v14 = +[HDSQLitePredicate compoundPredicateWithPredicate:v8 otherPredicate:v13];

  return v14;
}

+ (id)predicateForAccountsForLegacySync
{
  v2 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  id v3 = +[HDSQLiteJoinClause innerJoinClauseFromTable:v2 toTargetEntity:objc_opt_class() as:0 localReference:HDClinicalAccountEntityPropertyGatewayID targetKey:HDSQLEntityPropertyPersistentID];

  v4 = +[NSSet setWithObject:v3];
  uint64_t v5 = +[HDSQLiteJoinPredicate predicateWithJoinClauses:v4];

  id v6 = +[HDClinicalGatewayEntity predicateForGatewaysForLegacySync];
  v7 = [v6 SQLForEntityClass:objc_opt_class()];

  v14[0] = @"US";
  v14[1] = @"US";
  v14[2] = @"1.0.2";
  v14[3] = @"1.0.2";
  v8 = +[NSArray arrayWithObjects:v14 count:4];
  uint64_t v9 = +[HDSQLiteRawPredicate predicateWithSQL:v7 overProperties:&__NSArray0__struct values:v8];

  v13[0] = v5;
  v13[1] = v9;
  v10 = +[NSArray arrayWithObjects:v13 count:2];
  v11 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (HDClinicalAccountEntity)accountEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 _predicateForAccountWithIdentifier:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return (HDClinicalAccountEntity *)v10;
}

+ (HDClinicalAccountEntity)accountEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 _predicateForAccountWithSyncIdentifier:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return (HDClinicalAccountEntity *)v10;
}

+ (id)existingAccountEntityWithSyncIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 _predicateForAccountWithSyncIdentifier:v8];
  id v15 = 0;
  v11 = [a1 anyInDatabase:v9 predicate:v10 error:&v15];

  id v12 = v15;
  v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      if (a5) {
        *a5 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      +[NSError hk_assignError:a5, 118, @"Account with sync identifier \"%@\" not found", v8 code format];
    }
  }

  return v11;
}

+ (HDClinicalAccountEntity)accountEntityWithCredentialID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForAccountWithCredentialID:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return (HDClinicalAccountEntity *)v10;
}

+ (id)accountEntityForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForAccountForGatewayWithExternalID:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)existingAccountEntityWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v13 = 0;
  id v9 = [a1 accountEntityWithIdentifier:v8 database:a4 error:&v13];
  id v10 = v13;
  v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      if (a5) {
        *a5 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      +[NSError hk_assignError:a5, 118, @"Account with identifier \"%@\" not found", v8 code format];
    }
  }

  return v9;
}

+ (id)existingAccountEntityForGatewayWithExternalID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v10 = 0;
  id v6 = [a1 accountEntityForGatewayWithExternalID:a3 database:a4 error:&v10];
  id v7 = v10;
  id v8 = v7;
  if (!v6)
  {
    if (v7)
    {
      if (a5) {
        *a5 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      +[NSError hk_assignError:a5 code:118 description:@"Account not found"];
    }
  }

  return v6;
}

+ (id)existingAccountEntityForSignedClinicalDataIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v13 = 0;
  id v9 = [a1 accountEntityForSignedClinicalDataIssuerWithIdentifier:v8 database:a4 error:&v13];
  id v10 = v13;
  v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      if (a5) {
        *a5 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
    else
    {
      +[NSError hk_assignError:a5, 118, @"Account issuer \"%@\" not found", v8 code format];
    }
  }

  return v9;
}

+ (id)accountEntityForSignedClinicalDataIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForAccountForSignedClinicalDataIssuerWithIdentifier:a3];
  id v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

- (id)gatewayInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyGatewayID database:v6];
  if (v7)
  {
    id v8 = +[HDClinicalGatewayEntity entityWithPersistentID:v7];
    uint64_t v13 = 0;
    id v9 = [v8 gatewayInDatabase:v6 error:&v13];
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      +[NSError hk_assignError:a4 code:100 description:@"Unable to populate gateway model for account" underlyingError:v13];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_populateAccountWithRow:(HDSQLiteRow *)a3 credential:(id)a4 gateway:(id)a5 signedClinicalDataIssuer:(id)a6
{
  id v8 = a6;
  id v27 = a5;
  id v26 = a4;
  v30 = HDSQLiteColumnWithNameAsDate();
  v29 = HDSQLiteColumnWithNameAsDate();
  uint64_t v9 = HDSQLiteColumnWithNameAsInteger();
  uint64_t v10 = HDSQLiteColumnWithNameAsInteger();
  v28 = HDSQLiteColumnWithNameAsString();
  id v31 = [objc_alloc((Class)HKClinicalSharingStatus) initWithFirstSharedDate:v30 lastSharedDate:v29 featureStatus:0 userStatus:v9 multiDeviceStatus:v10 primaryDeviceName:v28];
  v23 = [HDClinicalAccount alloc];
  v20 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v11 = HDSQLiteColumnWithNameAsBoolean();
  uint64_t v24 = HDSQLiteColumnWithNameAsInteger();
  v22 = HDSQLiteColumnWithNameAsDate();
  v21 = HDSQLiteColumnWithNameAsDate();
  v19 = HDSQLiteColumnWithNameAsDate();
  v18 = HDSQLiteColumnWithNameAsDate();
  v17 = HDSQLiteColumnWithNameAsNumber();
  id v16 = HDSQLiteColumnWithNameAsNumber();
  id v12 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v13 = HDSQLiteColumnWithNameAsNumber();
  v14 = HDSQLiteColumnWithNameAsString();
  v25 = -[HDClinicalAccount initWithIdentifier:userEnabled:credentialState:creationDate:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:lastExtractedRowID:lastSubmittedRowID:lastExtractedRulesVersion:clinicalSharingStatus:credential:patientHash:gateway:signedClinicalDataIssuer:](v23, "initWithIdentifier:userEnabled:credentialState:creationDate:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:lastExtractedRowID:lastSubmittedRowID:lastExtractedRulesVersion:clinicalSharingStatus:credential:patientHash:gateway:signedClinicalDataIssuer:", v20, v11, v24, v22, v21, v19, v18, v17, v16, v12, v13, v31, v26, v14, v27,
          v8);

  return v25;
}

- (id)accountInDatabase:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HDClinicalAccountEntity+HealthRecordsPlugin.m", 573, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }
  v38[0] = 0;
  id v8 = [(HDClinicalAccountEntity *)self _credentialInDatabase:v7 error:v38];
  id v9 = v38[0];
  uint64_t v10 = v9;
  if (!v8 && v9)
  {
    +[NSError hk_assignError:a4 code:100 description:@"Unable to fetch credential for account" underlyingError:v9];
    id v11 = 0;
    goto LABEL_21;
  }
  id v37 = 0;
  id v12 = [(HDClinicalAccountEntity *)self gatewayInDatabase:v7 error:&v37];
  id v13 = v37;
  v14 = v13;
  if (v12 || !v13)
  {
    if (v12)
    {
      id v15 = 0;
    }
    else
    {
      id v36 = 0;
      id v15 = [(HDClinicalAccountEntity *)self _issuerInDatabase:v7 error:&v36];
      id v16 = v36;
      v17 = v16;
      if (!v15 && v16)
      {
        +[NSError hk_assignError:a4 code:100 description:@"Unable to fetch issuer for account" underlyingError:v16];

        goto LABEL_9;
      }
    }
    v18 = [(id)objc_opt_class() _propertiesForModel];
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_43CEC;
    v34 = sub_43CFC;
    id v35 = 0;
    v28 = &v30;
    id v29 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_43D04;
    v24[3] = &unk_113380;
    v24[4] = self;
    id v25 = v8;
    id v26 = v12;
    id v19 = v15;
    id v27 = v19;
    unsigned __int8 v20 = [(HDClinicalAccountEntity *)self getValuesForProperties:v18 database:v7 error:&v29 handler:v24];
    id v21 = v29;
    if (v20)
    {
      id v11 = (id)v31[5];
    }
    else
    {
      +[NSError hk_assignError:a4 code:100 description:@"Unable to create account model from row." underlyingError:v21];
      id v11 = 0;
    }

    _Block_object_dispose(&v30, 8);
    goto LABEL_20;
  }
  +[NSError hk_assignError:a4 code:100 description:@"Unable to fetch gateway for account" underlyingError:v13];
LABEL_9:
  id v11 = 0;
LABEL_20:

LABEL_21:

  return v11;
}

- (int64_t)credentialStateInDatabase:(id)a3
{
  id v3 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyCredentialState database:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)identifierInDatabase:(id)a3
{
  return [(HDClinicalAccountEntity *)self UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:a3];
}

- (id)syncIdentifierInDatabase:(id)a3
{
  return [(HDClinicalAccountEntity *)self UUIDForProperty:HDClinicalAccountEntityPropertySyncIdentifier database:a3];
}

+ (id)_currentCodableMessageVersion
{
  id v2 = objc_alloc_init((Class)HDCodableMessageVersion);
  [v2 setEntityVersion:2];
  [v2 setCompatibilityVersion:0];

  return v2;
}

- (id)codableInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_43CEC;
  id v15 = sub_43CFC;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_43F60;
  void v10[3] = &unk_1133A8;
  v10[4] = self;
  v10[5] = &v11;
  if ([(id)objc_opt_class() performReadTransactionWithHealthDatabase:v6 error:a4 block:v10])id v7 = (void *)v12[5]; {
  else
  }
    id v7 = 0;
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_codableInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_43CEC;
  id v25 = sub_43CFC;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_43CEC;
  id v19 = sub_43CFC;
  id v20 = 0;
  id v7 = [(id)objc_opt_class() _propertiesForCodable];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_44220;
  v14[3] = &unk_1133D0;
  void v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v21;
  unsigned __int8 v8 = [(HDClinicalAccountEntity *)self getValuesForProperties:v7 database:v6 handler:v14];

  id v9 = (void *)v16[5];
  if (v9)
  {
    if (v8)
    {
      id v10 = v9;
      goto LABEL_10;
    }
    id v12 = +[NSString stringWithFormat:@"Failed to create codable for entity %lld", [(HDClinicalAccountEntity *)self persistentID]];
    +[NSError hk_assignError:a4 code:100 description:v12];
  }
  else
  {
    id v11 = (id)v22[5];
    id v12 = v11;
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }

  id v10 = 0;
LABEL_10:
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v10;
}

+ (id)_codableWithRow:(HDSQLiteRow *)a3 error:(id *)a4
{
  id v5 = objc_alloc_init((Class)HDCodableClinicalAccount);
  id v33 = a1;
  id v6 = [a1 _currentCodableMessageVersion];
  [v5 setMessageVersion:v6];

  id v7 = HDSQLiteColumnWithNameAsString();
  [v5 setGatewayExternalID:v7];

  uint64_t v8 = HDSQLiteColumnWithNameAsString();
  if (v8)
  {
    [v5 setSignedClinicalDataIssuerIdentifier:v8];
    id v9 = [v5 messageVersion];
    [v9 setCompatibilityVersion:1];
  }
  [v5 setUserEnabled:HDSQLiteColumnWithNameAsBoolean()];
  uint64_t v32 = HDSQLiteColumnWithNameAsDate();
  [v32 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setCreationDate:");
  id v31 = HDSQLiteColumnWithNameAsDate();
  [v31 timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "setModificationDate:");
  id v10 = HDSQLiteColumnWithNameAsDate();
  id v11 = v10;
  if (v10)
  {
    [v10 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setLastFetchDate:");
  }
  id v12 = HDSQLiteColumnWithNameAsDate();
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setLastFullFetchDate:");
  }
  id v35 = (void *)v8;
  v14 = HDSQLiteColumnWithNameAsDate();
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setLastFailedFetchDate:");
  }
  uint64_t v30 = v11;
  id v16 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v17 = v16;
  if (v16) {
    objc_msgSend(v5, "setFailedFetchAttemptsCount:", objc_msgSend(v16, "integerValue", v11));
  }
  v18 = HDSQLiteColumnWithNameAsUUID();
  id v19 = objc_msgSend(v18, "hk_dataForUUIDBytes");
  [v5 setSyncIdentifier:v19];

  id v20 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v21 = [v20 UUIDString];
  [v5 setAccountIdentifier:v21];

  v22 = HDSQLiteColumnWithNameAsString();
  [v5 setPatientHash:v22];
  uint64_t v23 = HDSQLiteColumnWithNameAsDate();
  uint64_t v24 = v23;
  if (v23)
  {
    [v23 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setClinicalSharingFirstSharedDate:");
  }
  id v25 = HDSQLiteColumnWithNameAsDate();
  id v26 = v25;
  if (v25)
  {
    [v25 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setClinicalSharingLastSharedDate:");
  }
  [v5 setClinicalSharingUserStatus:HDSQLiteColumnWithNameAsInteger()];
  [v5 setClinicalSharingMultiDeviceStatus:HDSQLiteColumnWithNameAsInteger()];
  id v27 = HDSQLiteColumnWithNameAsString();
  [v5 setClinicalSharingPrimaryDeviceName:v27];

  if ([v33 _validateCodableAccount:v5 error:a4]) {
    id v28 = v5;
  }
  else {
    id v28 = 0;
  }

  return v28;
}

+ (id)_codableWithClinicalAccount:(id)a3 syncIdentifier:(id)a4 modificationDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)HDCodableClinicalAccount);
  uint64_t v13 = [a1 _currentCodableMessageVersion];
  [v12 setMessageVersion:v13];

  v14 = [v9 gateway];
  uint64_t v15 = [v14 externalID];
  [v12 setGatewayExternalID:v15];

  id v16 = [v9 signedClinicalDataIssuer];

  if (v16)
  {
    uint64_t v17 = [v9 signedClinicalDataIssuer];
    v18 = [v17 identifier];
    [v12 setSignedClinicalDataIssuerIdentifier:v18];

    id v19 = [v12 messageVersion];
    [v19 setCompatibilityVersion:1];
  }
  objc_msgSend(v12, "setUserEnabled:", objc_msgSend(v9, "isUserEnabled"));
  id v20 = [v9 creationDate];
  [v20 timeIntervalSinceReferenceDate];
  objc_msgSend(v12, "setCreationDate:");

  [v10 timeIntervalSinceReferenceDate];
  double v22 = v21;

  [v12 setModificationDate:v22];
  uint64_t v23 = objc_msgSend(v11, "hk_dataForUUIDBytes");

  [v12 setSyncIdentifier:v23];
  uint64_t v24 = [v9 identifier];
  id v25 = [v24 UUIDString];
  [v12 setAccountIdentifier:v25];

  id v26 = [v9 patientHash];
  [v12 setPatientHash:v26];

  id v27 = [v9 lastFetchDate];
  id v28 = v27;
  if (v27)
  {
    [v27 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setLastFetchDate:");
  }
  id v29 = [v9 lastFullFetchDate];
  uint64_t v30 = v29;
  if (v29)
  {
    [v29 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setLastFullFetchDate:");
  }
  id v31 = [v9 lastFailedFetchDate];
  uint64_t v32 = v31;
  if (v31)
  {
    [v31 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setLastFailedFetchDate:");
  }
  id v33 = [v9 failedFetchAttemptsCount];
  v34 = v33;
  if (v33) {
    objc_msgSend(v12, "setFailedFetchAttemptsCount:", objc_msgSend(v33, "integerValue"));
  }
  id v35 = [v9 clinicalSharingStatus];
  id v36 = [v35 firstSharedDate];

  if (v36)
  {
    id v37 = [v9 clinicalSharingStatus];
    v38 = [v37 firstSharedDate];
    [v38 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setClinicalSharingFirstSharedDate:");
  }
  v39 = [v9 clinicalSharingStatus];
  v40 = [v39 lastSharedDate];

  if (v40)
  {
    v41 = [v9 clinicalSharingStatus];
    v42 = [v41 lastSharedDate];
    [v42 timeIntervalSinceReferenceDate];
    objc_msgSend(v12, "setClinicalSharingLastSharedDate:");
  }
  v43 = [v9 clinicalSharingStatus];
  objc_msgSend(v12, "setClinicalSharingUserStatus:", objc_msgSend(v43, "userStatus"));

  v44 = [v9 clinicalSharingStatus];
  objc_msgSend(v12, "setClinicalSharingMultiDeviceStatus:", objc_msgSend(v44, "multiDeviceStatus"));

  id v49 = 0;
  unsigned __int8 v45 = +[HDClinicalAccountEntity _validateCodableAccount:v12 error:&v49];
  id v46 = v49;
  if ((v45 & 1) == 0)
  {
    v48 = +[NSAssertionHandler currentHandler];
    [v48 handleFailureInMethod:a2, a1, @"HDClinicalAccountEntity+HealthRecordsPlugin.m", 799, @"Invalid codable created from clinical account: %@", v46 object file lineNumber description];
  }

  return v12;
}

+ (id)accountWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0;
  id v10 = [a1 accountEntityWithIdentifier:v8 database:v9 error:&v15];
  id v11 = v15;
  id v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v10 accountInDatabase:v9 error:a5];
    goto LABEL_9;
  }
  if (v11)
  {
    if (a5)
    {
      uint64_t v13 = 0;
      *a5 = v11;
      goto LABEL_9;
    }
    _HKLogDroppedError();
  }
  else
  {
    +[NSError hk_assignError:a5, 118, @"Account with identifier \"%@\" not found", v8 code format];
  }
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

+ (id)accountWithIdentifier:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = sub_43CEC;
  double v22 = sub_43CFC;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_44D34;
  v14[3] = &unk_1128B0;
  id v16 = &v18;
  id v17 = a1;
  id v10 = v8;
  id v15 = v10;
  if ([a1 performReadTransactionWithHealthDatabase:v9 error:a5 block:v14]) {
    id v11 = (void *)v19[5];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

+ (id)accountsInDatabase:(id)a3 predicate:(id)a4 errorOut:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_43CEC;
  id v36 = sub_43CFC;
  id v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  id v26 = a1;
  id v27 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4500C;
  v20[3] = &unk_1133F8;
  SEL v25 = a2;
  id v12 = v9;
  id v21 = v12;
  id v23 = &v32;
  uint64_t v24 = &v28;
  id v13 = v11;
  id v22 = v13;
  unsigned __int8 v14 = [a1 enumerateEntitiesInDatabase:v12 predicate:v10 error:&v27 enumerationHandler:v20];
  id v15 = v27;
  id v16 = v15;
  if (*((unsigned char *)v29 + 24))
  {
    if (v14)
    {
      id v17 = v13;
      goto LABEL_12;
    }
    id v18 = v15;
    if (v18)
    {
      if (a5) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v18 = (id)v33[5];
    if (v18)
    {
      if (a5)
      {
LABEL_9:
        *a5 = v18;
        goto LABEL_11;
      }
LABEL_10:
      _HKLogDroppedError();
    }
  }
LABEL_11:

  id v17 = 0;
LABEL_12:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

+ (id)accountsInHealthDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_43CEC;
  id v21 = sub_43CFC;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_45274;
  v13[3] = &unk_1128B0;
  id v15 = &v17;
  id v16 = a1;
  id v9 = a4;
  id v14 = v9;
  if ([a1 performReadTransactionWithHealthDatabase:v8 error:a5 block:v13]) {
    id v10 = (void *)v18[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (id)allAccountsInHealthDatabase:(id)a3 error:(id *)a4
{
  return [a1 accountsInHealthDatabase:a3 predicate:0 error:a4];
}

+ (int64_t)hasGatewayBackedAccountsInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = [a3 profile];
  id v7 = [a1 countOfGatewayBackedAccountsWithProfile:v6 error:a4];

  if (v7)
  {
    if ((uint64_t)[v7 integerValue] >= 1) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (int64_t)hasIssuerBackedAccountsInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = [a3 profile];
  id v7 = [a1 countOfIssuerBackedAccountsWithProfile:v6 error:a4];

  if (v7)
  {
    if ((uint64_t)[v7 integerValue] >= 1) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)_keyValueDomainWithProfile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)HDKeyValueDomain);
  id v5 = [v4 initWithCategory:0 domainName:HKHealthRecordsPluginIdentifier profile:v3];

  return v5;
}

+ (id)countOfGatewayBackedAccountsWithProfile:(id)a3 error:(id *)a4
{
  id v5 = [a1 _keyValueDomainWithProfile:a3];
  id v11 = 0;
  id v6 = [v5 numberForKey:@"HDClinicalAccountEntityAccountCountKey" error:&v11];
  id v7 = v11;
  int64_t v8 = v7;
  if (v6)
  {
    id v9 = v6;
  }
  else if (v7)
  {
    if (a4)
    {
      id v9 = 0;
      *a4 = v7;
    }
    else
    {
      _HKLogDroppedError();
      id v9 = 0;
    }
  }
  else
  {
    id v9 = &off_11D1B8;
  }

  return v9;
}

+ (id)countOfIssuerBackedAccountsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_43CEC;
  id v15 = sub_43CFC;
  id v16 = 0;
  id v7 = [v6 database];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4568C;
  void v10[3] = &unk_113420;
  v10[4] = &v11;
  v10[5] = a1;
  LOBYTE(a4) = [a1 performReadTransactionWithHealthDatabase:v7 error:a4 block:v10];

  if (a4) {
    id v8 = (id)v12[5];
  }
  else {
    id v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

+ (BOOL)_updateCountOfGatewayBackedAccountsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_43CEC;
  uint64_t v17 = sub_43CFC;
  id v18 = 0;
  id v7 = [v6 database];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_458C4;
  v12[3] = &unk_113420;
  v12[4] = &v13;
  v12[5] = a1;
  unsigned __int8 v8 = [a1 performWriteTransactionWithHealthDatabase:v7 error:a4 block:v12];

  if (v8)
  {
    id v9 = [a1 _keyValueDomainWithProfile:v6];
    unsigned __int8 v10 = [v9 setNumber:v14[5] forKey:@"HDClinicalAccountEntityAccountCountKey" error:a4];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

+ (id)accountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  unsigned __int8 v10 = [a1 _predicateForAccountsWithIdentifiers:v8];

  uint64_t v11 = [a1 accountsInHealthDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (id)userFetchEligibleAccountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  unsigned __int8 v10 = [a1 _predicateForUserFetchEligibleAccountsWithIdentifiers:v8];

  uint64_t v11 = [a1 accountsInHealthDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (id)fetchableAccountsWithIdentifiers:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [a4 database];
  unsigned __int8 v10 = [a1 _predicateForFetchableAccountsWithIdentifiers:v8];

  uint64_t v11 = [a1 accountsInHealthDatabase:v9 predicate:v10 error:a5];

  return v11;
}

+ (id)accountsForGatewayExternalIDs:(id)a3 healthDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForAccountsForGatewaysWithExternalIDs:a3];
  unsigned __int8 v10 = [a1 accountsInHealthDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)accountsNeedExtractionSQL
{
  uint64_t v2 = HDSQLEntityPropertyPersistentID;
  uint64_t v3 = HDClinicalAccountEntityPropertyLastExtractedRowID;
  id v4 = +[HDOriginalFHIRResourceEntity disambiguatedDatabaseTable];
  id v5 = +[HDClinicalAccountEntity disambiguatedDatabaseTable];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT 1 FROM (SELECT MAX(A.%@) > COALESCE(B.%@, 0) as result FROM %@ A INNER JOIN %@ B WHERE A.%@ = B.%@ GROUP BY B.%@) WHERE result != 0 LIMIT 1;",
    v2,
    v3,
    v4,
    v5,
    HDOriginalFHIRResourceEntityPropertyAccountID,
    v2,
  id v6 = HDClinicalAccountEntityPropertyIdentifier);

  return v6;
}

+ (BOOL)accountsNeedExtractionForProfile:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [v4 database];
  v10[5] = a1;
  id v11 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_45E18;
  void v10[3] = &unk_113420;
  v10[4] = &v12;
  unsigned __int8 v6 = [a1 performReadTransactionWithHealthDatabase:v5 error:&v11 block:v10];
  id v7 = v11;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AEBF8();
    }
  }
  char v8 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v8;
}

+ (id)hasActiveAccountNeedingReloginInHealthDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_43CEC;
  char v15 = sub_43CFC;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_46074;
  void v10[3] = &unk_113420;
  v10[4] = &v11;
  v10[5] = a1;
  if ([a1 performReadTransactionWithHealthDatabase:v6 error:a4 block:v10]) {
    id v7 = (void *)v12[5];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

+ (BOOL)updateAccountCredentialFromAuthResponse:(id)a3 accountIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 healthDatabase:(id)a7 event:(id)a8 updatedCredential:(id *)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = [v16 refreshToken];
  BOOL v23 = v22 == 0;

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_43CEC;
  v64 = sub_43CFC;
  id v65 = [v21 eventWithUpdatedCredentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
  uint64_t v24 = (void *)v61[5];
  SEL v25 = [v16 descriptionForAccountEvent];
  uint64_t v26 = [v24 eventWithAppendedEventDescription:v25];
  id v27 = (void *)v61[5];
  v61[5] = v26;

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_43CEC;
  v58 = sub_43CFC;
  id v59 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_464E0;
  v45[3] = &unk_113488;
  id v52 = a1;
  id v46 = v17;
  v50 = &v54;
  id v47 = v16;
  id v48 = v18;
  id v28 = v19;
  BOOL v53 = v23;
  id v49 = v28;
  v51 = &v60;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_46628;
  v37[3] = &unk_1134B0;
  v43 = &v60;
  id v44 = a1;
  id v29 = v20;
  id v38 = v29;
  id v30 = v47;
  id v39 = v30;
  id v31 = v46;
  id v40 = v31;
  id v32 = v48;
  id v41 = v32;
  id v33 = v21;
  id v42 = v33;
  unsigned int v34 = [a1 performWriteTransactionWithHealthDatabase:v29 error:a10 block:v45 inaccessibilityHandler:v37];
  if (v34)
  {
    if (a9)
    {
      id v35 = (void *)v55[5];
      if (v35) {
        *a9 = v35;
      }
    }
  }

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v34;
}

- (id)_updateCredentialFromAuthResponse:(id)a3 requestedScope:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [v15 protectedDatabase];
  id v17 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyCredentialID database:v16];
  if (v17)
  {
    id v18 = v12;
    BOOL v23 = a7;
    id v24 = 0;
    unsigned int v19 = [(HDClinicalAccountEntity *)self deleteCredentialWithProfile:v14 transaction:v15 deleteTokens:0 credentialIdentifier:&v24 error:a7];
    id v20 = v24;
    id v21 = 0;
    if (v19)
    {
      id v21 = [(HDClinicalAccountEntity *)self _createCredentialFromAuthResponse:v18 credentialIdentifier:v20 requestedScope:v13 profile:v14 transaction:v15 error:v23];
    }

    id v12 = v18;
  }
  else
  {
    +[NSError hk_assignError:a7 code:118 format:@"Account is missing a credential, unable to update with authResponse"];
    id v21 = 0;
  }

  return v21;
}

+ (BOOL)createAccountCredentialFromAuthResponse:(id)a3 accountIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 healthDatabase:(id)a7 event:(id)a8 createdCredential:(id *)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = [v16 refreshToken];
  BOOL v23 = v22 == 0;

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_43CEC;
  v64 = sub_43CFC;
  id v65 = [v21 eventWithUpdatedCredentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
  id v24 = (void *)v61[5];
  SEL v25 = [v16 descriptionForAccountEvent];
  uint64_t v26 = [v24 eventWithAppendedEventDescription:v25];
  id v27 = (void *)v61[5];
  v61[5] = v26;

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_43CEC;
  v58 = sub_43CFC;
  id v59 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_46B94;
  v45[3] = &unk_113488;
  id v52 = a1;
  id v46 = v17;
  v50 = &v54;
  id v47 = v16;
  id v48 = v18;
  id v28 = v19;
  BOOL v53 = v23;
  id v49 = v28;
  v51 = &v60;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_46CE8;
  v37[3] = &unk_1134B0;
  v43 = &v60;
  id v44 = a1;
  id v29 = v20;
  id v38 = v29;
  id v30 = v47;
  id v39 = v30;
  id v31 = v46;
  id v40 = v31;
  id v32 = v48;
  id v41 = v32;
  id v33 = v21;
  id v42 = v33;
  unsigned int v34 = [a1 performWriteTransactionWithHealthDatabase:v29 error:a10 block:v45 inaccessibilityHandler:v37];
  if (v34)
  {
    if (a9)
    {
      id v35 = (void *)v55[5];
      if (v35) {
        *a9 = v35;
      }
    }
  }

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v34;
}

- (id)_createCredentialFromAuthResponse:(id)a3 credentialIdentifier:(id)a4 requestedScope:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v14 = a6;
  id v15 = a7;
  id v27 = 0;
  id v16 = [a3 createCredentialWithIdentifier:a4 requestedScope:a5 error:&v27];
  id v17 = v27;
  if (v16)
  {
    id v26 = v17;
    id v18 = +[HDFHIRCredentialEntity insertCredential:v16 profile:v14 transaction:v15 error:&v26];
    id v19 = v26;

    if (v18)
    {
      id v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 persistentID]);
      id v21 = [v16 patientID];
      unsigned int v22 = [(HDClinicalAccountEntity *)self _updateCredentialID:v20 patientID:v21 profile:v14 transaction:v15 error:a8];

      if (v22) {
        BOOL v23 = v16;
      }
      else {
        BOOL v23 = 0;
      }
      id v24 = v23;
    }
    else
    {
      +[NSError hk_assignError:a8 code:100 description:@"Unable to insert credential for account" underlyingError:v19];
      id v24 = 0;
    }
  }
  else
  {
    +[NSError hk_assignError:a8 code:100 description:@"Unable to store tokens for credential for account" underlyingError:v17];
    id v24 = 0;
    id v19 = v17;
  }

  return v24;
}

- (BOOL)updateCredentialState:(int64_t)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = [v10 protectedDatabase];
  id v13 = [(HDClinicalAccountEntity *)self UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v12];
  id v14 = NSStringFromHKClinicalAccountCredentialState();
  _HKInitializeLogging();
  id v15 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = [(HDClinicalAccountEntity *)self debugDescription];
    *(_DWORD *)buf = 138543874;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ marking account %{public}@ as %{public}@", buf, 0x20u);
  }
  id v18 = HDClinicalAccountEntityPropertyCredentialState;
  id v25 = v18;
  id v19 = +[NSArray arrayWithObjects:&v25 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_47154;
  v22[3] = &unk_1134D8;
  id v23 = v18;
  int64_t v24 = a3;
  BOOL v20 = [(HDClinicalAccountEntity *)self updateProperties:v19 profile:v11 transaction:v10 error:a6 bindingHandler:v22];

  return v20;
}

- (BOOL)assignCredentialWithPersistentID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 protectedDatabase];
  id v14 = +[HDFHIRCredentialEntity credentialWithPersistentID:v10 database:v13 error:a6];

  if (v14)
  {
    id v15 = [v14 patientID];
    BOOL v16 = [(HDClinicalAccountEntity *)self _updateCredentialID:v10 patientID:v15 profile:v11 transaction:v12 error:a6];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)deleteCredentialWithProfile:(id)a3 transaction:(id)a4 deleteTokens:(BOOL)a5 credentialIdentifier:(id *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = [v13 protectedDatabase];
  id v15 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyCredentialID database:v14];
  if (v15)
  {
    if ([(HDClinicalAccountEntity *)self _updateCredentialID:0 patientID:0 profile:v12 transaction:v13 error:a7])
    {
      BOOL v16 = +[HDFHIRCredentialEntity entityWithPersistentID:v15];
      id v17 = [v16 credentialInDatabase:v14 error:a7];
      id v18 = v17;
      if (v17)
      {
        if (v9)
        {
          id v27 = 0;
          unsigned __int8 v19 = [v17 deleteTokensWithError:&v27];
          id v20 = v27;
          id v21 = v20;
          if ((v19 & 1) == 0)
          {
            id v22 = v20;
            _HKInitializeLogging();
            uint64_t v26 = HKLogHealthRecords;
            BOOL v23 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT);
            id v21 = v22;
            if (v23)
            {
              sub_AEC70();
              id v21 = v22;
            }
          }
        }
        if (a6)
        {
          *a6 = [v18 identifier];
        }
        unsigned __int8 v24 = objc_msgSend(v16, "deleteFromDatabase:error:", v14, a7, v26);
      }
      else
      {
        unsigned __int8 v24 = 0;
      }
    }
    else
    {
      unsigned __int8 v24 = 0;
    }
  }
  else
  {
    unsigned __int8 v24 = 1;
  }

  return v24;
}

- (BOOL)_updateCredentialID:(id)a3 patientID:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = HDClinicalAccountEntityPropertyCredentialID;
  id v15 = HDClinicalAccountEntityPropertyPatientHash;
  v27[0] = v14;
  v27[1] = v15;
  id v16 = a6;
  id v17 = a5;
  id v18 = +[NSArray arrayWithObjects:v27 count:2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_475F8;
  v22[3] = &unk_111D50;
  id v23 = v14;
  id v24 = v12;
  id v25 = v15;
  id v26 = v13;
  id v19 = v13;
  id v20 = v12;
  LOBYTE(a7) = [(HDClinicalAccountEntity *)self updateProperties:v18 profile:v17 transaction:v16 error:a7 bindingHandler:v22];

  return (char)a7;
}

- (BOOL)resetFetchFailureInformationWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9 = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  id v10 = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  v18[0] = v9;
  v18[1] = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_47800;
  v15[3] = &unk_1126B8;
  id v16 = v9;
  id v17 = v10;
  LOBYTE(a5) = [(HDClinicalAccountEntity *)self updateProperties:v13 profile:v12 transaction:v11 error:a5 bindingHandler:v15];

  return (char)a5;
}

- (id)credentialIDInDatabase:(id)a3
{
  return [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyCredentialID database:a3];
}

- (id)_credentialInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDClinicalAccountEntity *)self credentialIDInDatabase:v6];
  if (v7)
  {
    id v8 = +[HDFHIRCredentialEntity credentialWithPersistentID:v7 database:v6 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_issuerInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertySignedClinicalDataIssuerROWID database:v6];
  if (v7)
  {
    id v8 = +[HDSignedClinicalDataIssuerEntity entityWithPersistentID:v7];
    id v9 = [v8 issuerInDatabase:v6 error:a4];
    id v10 = v9;
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (BOOL)_propertiesShouldTriggerSyncOnUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _syncableProperties];
  id v6 = +[NSSet setWithArray:v5];

  id v7 = +[NSSet setWithArray:v4];

  LOBYTE(v4) = [v6 intersectsSet:v7];
  return (char)v4;
}

+ (id)_propertiesByAddingSyncPropertiesToProperties:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithArray:v4];
  unsigned int v6 = [a1 _propertiesShouldTriggerSyncOnUpdate:v4];

  if (v6)
  {
    id v7 = [a1 _syncProperties];
    [v5 addObjectsFromArray:v7];
  }
  id v8 = [v5 allObjects];

  return v8;
}

+ (BOOL)_bindPropertiesForSync:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 mutationHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (uint64_t (**)(id, void *, void *, id *))a7;
  if ([a1 _propertiesShouldTriggerSyncOnUpdate:v11])
  {
    id v14 = [a1 _propertiesByAddingSyncPropertiesToProperties:v11];
    id v15 = objc_alloc_init((Class)NSDate);
    id v16 = +[HDClinicalEntitySyncAnchor nextClinicalAccountSyncAnchorWithProfile:v12 error:a6];
    if (v16)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_47CA8;
      v20[3] = &unk_111D50;
      id v21 = v11;
      id v22 = v15;
      id v23 = v16;
      id v24 = v12;
      id v17 = objc_retainBlock(v20);
      char v18 = v13[2](v13, v14, v17, a6);
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = ((uint64_t (**)(id, void *, Block_layout *, id *))v13)[2](v13, v11, &stru_113518, a6);
  }

  return v18;
}

- (BOOL)updateProperties:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v13 protectedDatabase];
  id v17 = objc_opt_class();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_47EE0;
  v21[3] = &unk_113568;
  id v23 = self;
  id v24 = v12;
  id v22 = v16;
  id v18 = v12;
  id v19 = v16;
  LOBYTE(a6) = [v17 _bindPropertiesForSync:v15 profile:v14 transaction:v13 error:a6 mutationHandler:v21];

  return (char)a6;
}

+ (BOOL)_insertCodableAccounts:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v11 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_48190;
  v20[3] = &unk_1128D8;
  id v23 = a1;
  id v21 = v10;
  id v22 = v11;
  int64_t v24 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_48BE4;
  v16[3] = &unk_112900;
  id v18 = v22;
  int64_t v19 = a4;
  id v17 = v21;
  id v13 = v22;
  id v14 = v21;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v20 inaccessibilityHandler:v16];

  return (char)a6;
}

+ (BOOL)_insertOrUpdateAccountWithCodableAccount:(id)a3 gatewayID:(id)a4 signedClinicalDataIssuerID:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 transaction:(id)a8 profile:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v94 = a8;
  id v19 = a9;
  v93 = v18;
  if ((v17 != 0) != (v18 == 0))
  {
    v70 = +[NSAssertionHandler currentHandler];
    [v70 handleFailureInMethod:a2, a1, @"HDClinicalAccountEntity+HealthRecordsPlugin.m", 1629, @"Invalid parameter not satisfying: %@", @"(gatewayID == nil) != (signedClinicalDataIssuerID == nil)" object file lineNumber description];
  }
  id v20 = [v19 healthRecordsExtension];
  id v21 = [v20 accountManager];

  if (v21)
  {
    if (v17) {
      [a1 _predicateForAccountWithGatewayID:v17];
    }
    else {
    id v26 = [a1 _predicateForAccountWithSignedClinicalDataIssuerID:v18];
    }
    uint64_t v27 = [v94 databaseForEntityClass:a1];
    id v95 = 0;
    __int16 v28 = [a1 anyInDatabase:v27 predicate:v26 error:&v95];
    id v29 = v95;
    v92 = (void *)v27;
    if (v29)
    {
      __int16 v30 = v29;
      if (a10)
      {
        unsigned __int8 v25 = 0;
        *a10 = v29;
      }
      else
      {
        _HKLogDroppedError();
        unsigned __int8 v25 = 0;
      }
      goto LABEL_57;
    }
    v85 = v26;
    v86 = [v28 UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v27];
    [v16 syncIdentifier];
    id v31 = v89 = v28;
    v90 = +[NSUUID hk_UUIDWithData:v31];

    __int16 v28 = v89;
    int64_t v84 = a6;
    if (v89)
    {
      uint64_t v32 = [v89 UUIDForProperty:HDClinicalAccountEntityPropertySyncIdentifier database:v27];
      id v33 = [v89 stringForProperty:HDClinicalAccountEntityPropertyPatientHash database:v27];
      v87 = (void *)v32;
      if (v32) {
        LODWORD(v32) = [(id)v32 isEqual:v90] ^ 1;
      }
      unsigned int v34 = [v16 patientHash];
      unsigned int v35 = [v33 isEqualToString:v34] ^ 1;

      if ((v32 & 1) == 0 && !v35)
      {
        id v36 = v33;
        id v37 = [v89 _codableInDatabase:v92 error:a10];
        id v38 = v37;
        if (v37)
        {
          [v37 updateWithPropertiesFromOtherAccount:v16];
          unsigned __int8 v25 = [v89 _updateAccountFromSyncWithCodable:v38 profile:v19 transaction:v94 error:a10];
        }
        else
        {
          unsigned __int8 v25 = 0;
        }
        v63 = v87;

        id v26 = v85;
LABEL_55:

LABEL_56:
        __int16 v30 = 0;
LABEL_57:

        goto LABEL_58;
      }
      unsigned int v72 = v35;
      v82 = v33;
      uint64_t v39 = [v89 dateForProperty:HDClinicalAccountEntityPropertyCreationDate database:v92];
      [v16 creationDate];
      +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v40 = v74 = v32;
      id v41 = [v89 dateForProperty:HDClinicalAccountEntityPropertyModificationDate database:v92];
      [v16 modificationDate];
      id v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      v78 = v40;
      v80 = (void *)v39;
      uint64_t v43 = v39;
      id v44 = v41;
      unsigned int v45 = objc_msgSend(v40, "hk_isBeforeOrEqualToDate:", v43);
      v76 = v42;
      unsigned int v46 = objc_msgSend(v42, "hk_isBeforeOrEqualToDate:", v41);
      int v47 = v74 & v45;
      _HKInitializeLogging();
      id v48 = (void *)HKLogHealthRecords;
      BOOL v49 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
      if ((v47 & 1) != 0 || (v72 & v46) != 0)
      {
        if (v49)
        {
          v64 = v48;
          uint64_t v65 = objc_opt_class();
          uint64_t v66 = [v16 accountIdentifier];
          v67 = (void *)v66;
          CFStringRef v68 = @"it has been modified a longer time ago";
          *(_DWORD *)buf = 138544130;
          uint64_t v97 = v65;
          __int16 v98 = 2114;
          if (v47) {
            CFStringRef v68 = @"it is older";
          }
          uint64_t v99 = v66;
          __int16 v100 = 2114;
          CFStringRef v101 = v68;
          __int16 v102 = 2114;
          v103 = v86;
          _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring received codable clinical account %{public}@ because %{public}@ than existing account %{public}@ for that gateway", buf, 0x2Au);
        }
        unsigned __int8 v25 = 1;
        id v26 = v85;
        __int16 v28 = v89;
        v63 = v87;
        id v36 = v82;
        goto LABEL_55;
      }
      if (v49)
      {
        v50 = v48;
        uint64_t v51 = objc_opt_class();
        id v52 = [v16 accountIdentifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v97 = v51;
        __int16 v98 = 2114;
        uint64_t v99 = (uint64_t)v52;
        __int16 v100 = 2114;
        CFStringRef v101 = v86;
        _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Received newer codable clinical account %{public}@, will delete existing account %{public}@", buf, 0x20u);
      }
      unsigned __int8 v53 = [v21 deleteAccountWithIdentifier:v86 deletionReason:2 error:a10];

      __int16 v28 = v89;
      if ((v53 & 1) == 0)
      {
        unsigned __int8 v25 = 0;
        id v26 = v85;
        goto LABEL_56;
      }
    }
    uint64_t v54 = [v16 accountIdentifier];
    if (v54)
    {
      id v55 = objc_alloc((Class)NSUUID);
      uint64_t v56 = [v16 accountIdentifier];
      id v88 = [v55 initWithUUIDString:v56];
    }
    else
    {
      id v88 = +[NSUUID UUID];
    }

    unsigned int v73 = [v16 userEnabled];
    [v16 creationDate];
    v57 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v16 modificationDate];
    v83 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    unsigned int v75 = [v16 hasLastFetchDate];
    if (v75)
    {
      [v16 lastFetchDate];
      v81 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v81 = 0;
    }
    unsigned int v71 = [v16 hasLastFullFetchDate];
    if (v71)
    {
      [v16 lastFullFetchDate];
      v79 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v79 = 0;
    }
    unsigned int v58 = [v16 hasLastFailedFetchDate];
    if (v58)
    {
      [v16 lastFailedFetchDate];
      v77 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v77 = 0;
    }
    unsigned int v59 = [v16 hasPatientHash];
    if (v59)
    {
      uint64_t v60 = [v16 patientHash];
    }
    else
    {
      uint64_t v60 = 0;
    }
    v61 = [v16 clinicalSharingStatusForNewAccountFromSync];
    objc_msgSend(a1, "_insertAccountInProfile:identifier:syncIdentifier:userEnabled:credentialState:creationDate:modificationDate:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:lastExtractedRowID:lastSubmittedRowID:lastExtractedRulesVersion:credentialID:patientHash:gatewayID:signedClinicalDataIssuerID:clinicalSharingStatus:syncProvenance:syncIdentity:error:", v19, v88, v90, v73, 1, v57, v83, v81, v79, v77, 0, 0, 0, 0,
      0,
      v60,
      v17,
      v93,
      v61,
      v84,
      a7,
    uint64_t v62 = a10);

    if (v59) {
    if (v58)
    }

    id v26 = v85;
    __int16 v28 = v89;
    v63 = v88;
    if (v71) {

    }
    if (v75) {
    id v36 = (void *)v62;
    }
    unsigned __int8 v25 = v62 != 0;
    goto LABEL_55;
  }
  id v22 = (objc_class *)objc_opt_class();
  id v23 = NSStringFromClass(v22);
  int64_t v24 = NSStringFromSelector(a2);
  +[NSError hk_assignError:a10, 100, @"%@.%@ can only be used on profiles with account managers, but %@ doesn't have one", v23, v24, v19 code format];

  unsigned __int8 v25 = 0;
LABEL_58:

  return v25;
}

+ (id)insertAccountWithIdentifier:(id)a3 syncIdentifier:(id)a4 userEnabled:(BOOL)a5 credentialState:(int64_t)a6 credentialID:(id)a7 patientHash:(id)a8 gatewayID:(id)a9 signedClinicalDataIssuerID:(id)a10 clinicalSharingStatus:(id)a11 profile:(id)a12 error:(id *)a13
{
  BOOL v29 = a5;
  id v16 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a4;
  id v23 = a3;
  id v24 = objc_alloc_init((Class)NSDate);
  objc_msgSend(a1, "_insertAccountInProfile:identifier:syncIdentifier:userEnabled:credentialState:creationDate:modificationDate:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:lastExtractedRowID:lastSubmittedRowID:lastExtractedRulesVersion:credentialID:patientHash:gatewayID:signedClinicalDataIssuerID:clinicalSharingStatus:syncProvenance:syncIdentity:error:", v16, v23, v22, v29, a6, v24, v24, 0, 0, 0, 0, 0, 0, 0,
    v21,
    v20,
    v19,
    v18,
    v17,
    0,
    [v16 currentSyncIdentityPersistentID],
  unsigned __int8 v25 = a13);

  return v25;
}

+ (id)_insertAccountInProfile:(id)a3 identifier:(id)a4 syncIdentifier:(id)a5 userEnabled:(BOOL)a6 credentialState:(int64_t)a7 creationDate:(id)a8 modificationDate:(id)a9 lastFetchDate:(id)a10 lastFullFetchDate:(id)a11 lastFailedFetchDate:(id)a12 failedFetchAttemptsCount:(id)a13 lastExtractedRowID:(id)a14 lastSubmittedRowID:(id)a15 lastExtractedRulesVersion:(id)a16 credentialID:(id)a17 patientHash:(id)a18 gatewayID:(id)a19 signedClinicalDataIssuerID:(id)a20 clinicalSharingStatus:(id)a21 syncProvenance:(int64_t)a22 syncIdentity:(int64_t)a23 error:(id *)a24
{
  id v75 = a3;
  id v60 = a4;
  id v61 = a5;
  id v62 = a8;
  id v67 = a9;
  id v27 = a10;
  id v28 = a11;
  id v56 = a12;
  id v57 = a13;
  id v58 = a14;
  id v59 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  if ((v32 != 0) != (v33 == 0))
  {
    unsigned __int8 v53 = +[NSAssertionHandler currentHandler];
    [v53 handleFailureInMethod:a2, a1, @"HDClinicalAccountEntity+HealthRecordsPlugin.m", 1814, @"Invalid parameter not satisfying: %@", @"(gatewayID == nil) != (signedClinicalDataIssuerID == nil)" object file lineNumber description];
  }
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = sub_43CEC;
  v106 = sub_43CFC;
  id v107 = 0;
  unsigned int v35 = [v75 database];
  id v101 = 0;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_49CAC;
  v77[3] = &unk_113608;
  id v73 = v32;
  id v78 = v73;
  id v55 = v75;
  id v79 = v55;
  id v68 = v27;
  id v80 = v68;
  id v95 = &v102;
  id v96 = a1;
  id v69 = v28;
  id v81 = v69;
  id v76 = v60;
  id v82 = v76;
  BOOL v100 = a6;
  id v64 = v61;
  id v83 = v64;
  int64_t v97 = a7;
  id v66 = v62;
  id v84 = v66;
  id v70 = v56;
  id v85 = v70;
  id v71 = v57;
  id v86 = v71;
  id v72 = v58;
  id v87 = v72;
  id v36 = v59;
  id v88 = v36;
  id v37 = v29;
  id v89 = v37;
  id v38 = v30;
  id v90 = v38;
  id v39 = v31;
  id v91 = v39;
  int64_t v98 = a22;
  id v40 = v33;
  id v92 = v40;
  id v41 = v34;
  id v93 = v41;
  int64_t v99 = a23;
  id v42 = v67;
  id v94 = v42;
  unsigned __int8 v43 = [a1 performWriteTransactionWithHealthDatabase:v35 error:&v101 block:v77];
  id v44 = v101;

  if (v43)
  {
    _HKInitializeLogging();
    unsigned int v45 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v109 = a1;
      __int16 v110 = 2114;
      id v111 = v76;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ inserted account with identifier %{public}@", buf, 0x16u);
    }
    id v46 = (id)v103[5];
  }
  else
  {
    _HKInitializeLogging();
    int v47 = HKLogHealthRecords;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      id v109 = a1;
      __int16 v110 = 2114;
      id v111 = v76;
      __int16 v112 = 2114;
      uint64_t v113 = v51;
      id v52 = (void *)v51;
      _os_log_error_impl(&dword_0, v47, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert account with identifier %{public}@: %{public}@", buf, 0x20u);
    }
    id v48 = v44;
    BOOL v49 = v48;
    if (v48)
    {
      if (a24) {
        *a24 = v48;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v46 = 0;
  }

  _Block_object_dispose(&v102, 8);

  return v46;
}

+ (BOOL)updateSourcesForAccountWithIdentifier:(id)a3 wasAccountInsert:(BOOL)a4 clinicalExternalID:(id)a5 externalTitle:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v16 sourceManager];
  id v18 = [v17 privateSourceForClinicalAccountIdentifier:v13 provenance:0 createOrUpdateIfNecessary:1 nameOnCreateOrUpdate:v15 error:a8];

  if (v18)
  {
    id v19 = [v16 sourceManager];
    id v20 = [v19 publicSourceForClinicalExternalIdentifier:v14 provenance:0 createOrUpdateIfNecessary:1 nameOnCreateOrUpdate:v15 error:a8];

    BOOL v21 = v20 != 0;
    if (v20 && !a4)
    {
      id v22 = [v16 healthRecordsExtension];
      [v22 didUpdateSourcesForAccountWithIdentifier:v13];
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)_updateAccountFromSyncWithCodable:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v11 databaseForEntity:self];
  v25[0] = HDClinicalAccountEntityPropertyModificationDate;
  v25[1] = HDClinicalAccountEntityPropertyUserEnabled;
  v25[2] = HDClinicalAccountEntityPropertyLastFetchDate;
  v25[3] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v25[4] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v25[5] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  v25[6] = HDClinicalAccountEntityPropertyPatientHash;
  v25[7] = HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate;
  v25[8] = HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate;
  v25[9] = HDClinicalAccountEntityPropertyClinicalSharingUserStatus;
  v25[10] = HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName;
  id v14 = +[NSArray arrayWithObjects:v25 count:11];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_4AB30;
  v23[3] = &unk_111B40;
  id v15 = v10;
  id v24 = v15;
  unsigned int v16 = [(HDClinicalAccountEntity *)self updateProperties:v14 profile:v12 transaction:v11 error:a6 bindingHandler:v23];

  if (v16)
  {
    id v17 = [(HDClinicalAccountEntity *)self accountInDatabase:v13 error:a6];
    id v18 = v17;
    BOOL v19 = v15 != 0;
    if (v15)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_4AE64;
      v21[3] = &unk_112318;
      void v21[4] = self;
      id v22 = v17;
      [v11 onCommit:v21 orRollback:0];
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)updateClinicalSharingStatusWithProfile:(id)a3 transaction:(id)a4 firstSharedDate:(id)a5 lastSharedDate:(id)a6 userStatus:(id)a7 multiDeviceStatus:(id)a8 primaryDeviceName:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  id v24 = v23;
  if (v18) {
    [v23 addObject:HDClinicalAccountEntityPropertyClinicalSharingFirstSharedDate];
  }
  if (v19) {
    [v24 addObject:HDClinicalAccountEntityPropertyClinicalSharingLastSharedDate];
  }
  if (v20) {
    [v24 addObject:HDClinicalAccountEntityPropertyClinicalSharingUserStatus];
  }
  if (v21) {
    [v24 addObject:HDClinicalAccountEntityPropertyClinicalSharingMultiDeviceStatus];
  }
  if (v22) {
    [v24 addObject:HDClinicalAccountEntityPropertyClinicalSharingPrimaryDeviceName];
  }
  if ([v24 count])
  {
    id v30 = [v17 databaseForEntityClass:objc_opt_class()];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_4B19C;
    v33[3] = &unk_111B18;
    id v29 = v18;
    id v34 = v18;
    id v35 = v19;
    id v36 = v20;
    id v37 = v21;
    id v38 = v22;
    id v25 = v16;
    BOOL v26 = [(HDClinicalAccountEntity *)self updateProperties:v24 profile:v16 transaction:v17 error:a10 bindingHandler:v33];
    if (v26)
    {
      [(HDClinicalAccountEntity *)self accountInDatabase:v30 error:a10];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_4B2F0;
      v31[3] = &unk_112318;
      v31[4] = self;
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = v32;
      [v17 onCommit:v31 orRollback:0];
    }
    id v16 = v25;
    id v18 = v29;
  }
  else
  {
    LOBYTE(v26) = 1;
  }

  return v26;
}

- (BOOL)_updateBooleanForProperty:(id)a3 value:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v21 = v12;
  id v13 = a6;
  id v14 = a5;
  id v15 = +[NSArray arrayWithObjects:&v21 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_4B4A0;
  v18[3] = &unk_113630;
  id v19 = v12;
  BOOL v20 = a4;
  id v16 = v12;
  LOBYTE(a7) = [(HDClinicalAccountEntity *)self updateProperties:v15 profile:v14 transaction:v13 error:a7 bindingHandler:v18];

  return (char)a7;
}

- (BOOL)_updateStringForProperty:(id)a3 value:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v23 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = +[NSArray arrayWithObjects:&v23 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4B614;
  v20[3] = &unk_1126B8;
  id v21 = v12;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  LOBYTE(a7) = [(HDClinicalAccountEntity *)self updateProperties:v16 profile:v15 transaction:v14 error:a7 bindingHandler:v20];

  return (char)a7;
}

- (BOOL)updatePatientHash:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return [(HDClinicalAccountEntity *)self _updateStringForProperty:HDClinicalAccountEntityPropertyPatientHash value:a3 profile:a4 transaction:a5 error:a6];
}

+ (BOOL)updateAccountCredentialState:(int64_t)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 event:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [v17 eventWithUpdatedCredentialStateAfter:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_4B820;
  v32[3] = &unk_113658;
  id v36 = a1;
  int64_t v37 = a3;
  id v33 = v14;
  id v34 = v15;
  id v35 = v18;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4B860;
  v25[3] = &unk_113680;
  id v26 = v35;
  id v27 = v16;
  id v30 = a1;
  int64_t v31 = a3;
  id v28 = v33;
  id v29 = v17;
  id v19 = v17;
  id v20 = v33;
  id v21 = v16;
  id v22 = v35;
  id v23 = v15;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v21 error:a8 block:v32 inaccessibilityHandler:v25];

  return (char)a8;
}

+ (BOOL)_updateAccountCredentialState:(int64_t)a3 identifier:(id)a4 profile:(id)a5 transaction:(id)a6 event:(id)a7 alwaysRecordEvent:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v15 = a5;
  id v16 = a6;
  id v36 = a7;
  id v17 = a4;
  id v18 = [v16 protectedDatabase];
  id v19 = [a1 existingAccountEntityWithIdentifier:v17 database:v18 error:a9];

  if ([v19 credentialStateInDatabase:v18] == (id)a3)
  {
    char v20 = 1;
    if (!v9) {
      goto LABEL_17;
    }
  }
  else
  {
    unsigned int v21 = [v19 updateCredentialState:a3 profile:v15 transaction:v16 error:a9];
    if (v21)
    {
      id v22 = [v19 accountInDatabase:v18 error:a9];
    }
    else
    {
      id v22 = 0;
    }
    _HKInitializeLogging();
    id v23 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
    {
      id v32 = "false";
      if (v21) {
        id v32 = "true";
      }
      id v35 = v32;
      id v33 = v23;
      id v34 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      id v42 = a1;
      __int16 v43 = 2082;
      id v44 = v35;
      __int16 v45 = 2114;
      id v46 = v34;
      _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%{public}@ account updated: %{public}s account: %{public}@", buf, 0x20u);
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    id v38[2] = sub_4BC1C;
    v38[3] = &unk_1135E0;
    id v39 = v22;
    id v40 = a1;
    id v24 = v22;
    [v16 onCommit:v38 orRollback:0];
    char v20 = v24 != 0;
  }
  id v25 = [v36 eventWithUpdatedCredentialStateBefore:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
  id v26 = v25;
  id v27 = v25;
  if ((v20 & 1) == 0)
  {
    id v27 = [v25 eventMarkedAsFailedWithError:*a9];
  }
  id v37 = 0;
  unsigned __int8 v28 = +[HDClinicalAccountEventEntity insertEvent:v27 database:v18 error:&v37];
  id v29 = v37;
  if ((v20 & 1) == 0) {

  }
  if ((v28 & 1) == 0)
  {
    _HKInitializeLogging();
    id v30 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AED6C(v30);
    }
  }

LABEL_17:
  return v20;
}

+ (void)_journalAccountEvent:(id)a3 database:(id)a4
{
  id v5 = a3;
  id v9 = 0;
  unsigned __int8 v6 = +[HDClinicalAccountEventEntity journalEvent:v5 database:a4 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AEE04(v8);
    }
  }
}

- (BOOL)updateUserEnabled:(BOOL)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return [(HDClinicalAccountEntity *)self _updateBooleanForProperty:HDClinicalAccountEntityPropertyUserEnabled value:a3 profile:a4 transaction:a5 error:a6];
}

+ (BOOL)updateAccountUserEnabled:(BOOL)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_4BE9C;
  v23[3] = &unk_1136A8;
  id v26 = a1;
  BOOL v27 = a3;
  id v24 = v12;
  id v25 = v13;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_4C040;
  v19[3] = &unk_1136D0;
  BOOL v22 = a3;
  id v20 = v24;
  id v21 = v14;
  id v15 = v14;
  id v16 = v24;
  id v17 = v13;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v15 error:a7 block:v23 inaccessibilityHandler:v19];

  return (char)a7;
}

- (BOOL)_updateLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  if (a4) {
    return [(HDClinicalAccountEntity *)self _updateLastFullFetchDate:a3 profile:a5 transaction:a6 error:a7];
  }
  else {
    return [(HDClinicalAccountEntity *)self _updateLastFetchDate:a3 profile:a5 transaction:a6 error:a7];
  }
}

- (BOOL)_updateLastFetchDate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 protectedDatabase];
  uint64_t v14 = HDClinicalAccountEntityPropertyLastFetchDate;
  id v15 = [(HDClinicalAccountEntity *)self dateForProperty:HDClinicalAccountEntityPropertyLastFetchDate database:v13];
  if (objc_msgSend(v15, "hk_isAfterOrEqualToDate:", v10))
  {
    BOOL v16 = 1;
  }
  else
  {
    v21[0] = v14;
    v21[1] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
    v21[2] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
    id v17 = +[NSArray arrayWithObjects:v21 count:3];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4C268;
    v19[3] = &unk_111B40;
    id v20 = v10;
    BOOL v16 = [(HDClinicalAccountEntity *)self updateProperties:v17 profile:v11 transaction:v12 error:a6 bindingHandler:v19];
  }
  return v16;
}

- (BOOL)_updateLastFullFetchDate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 protectedDatabase];
  uint64_t v14 = [(HDClinicalAccountEntity *)self dateForProperty:HDClinicalAccountEntityPropertyLastFetchDate database:v13];
  id v15 = [(HDClinicalAccountEntity *)self dateForProperty:HDClinicalAccountEntityPropertyLastFullFetchDate database:v13];
  if (objc_msgSend(v14, "hk_isAfterOrEqualToDate:", v10)
    && (objc_msgSend(v15, "hk_isAfterOrEqualToDate:", v10) & 1) != 0)
  {
    BOOL v16 = 1;
  }
  else
  {
    id v17 = HKDateMax();
    id v18 = HKDateMax();
    BOOL v16 = [(HDClinicalAccountEntity *)self _updateLastFullFetchDateWithLastFetchDate:v17 lastFullFetchDate:v18 profile:v11 transaction:v12 error:a6];
  }
  return v16;
}

- (BOOL)_updateLastFullFetchDateWithLastFetchDate:(id)a3 lastFullFetchDate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v23[0] = HDClinicalAccountEntityPropertyLastFetchDate;
  v23[1] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  v23[2] = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  v23[3] = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  id v14 = a6;
  id v15 = a5;
  BOOL v16 = +[NSArray arrayWithObjects:v23 count:4];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4C5B4;
  v20[3] = &unk_1126B8;
  id v21 = v12;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  LOBYTE(a7) = [(HDClinicalAccountEntity *)self updateProperties:v16 profile:v15 transaction:v14 error:a7 bindingHandler:v20];

  return (char)a7;
}

- (BOOL)_updateLastFailedFetchDate:(id)a3 overrideFailedAttemptsCount:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a3;
  BOOL v16 = [v14 protectedDatabase];
  uint64_t v17 = HDClinicalAccountEntityPropertyLastFailedFetchDate;
  unsigned __int8 v28 = [(HDClinicalAccountEntity *)self dateForProperty:HDClinicalAccountEntityPropertyLastFailedFetchDate database:v16];
  id v29 = HKDateMax();

  id v18 = v12;
  uint64_t v19 = HDClinicalAccountEntityPropertyFailedFetchAttemptsCount;
  id v20 = v18;
  if (!v18)
  {
    [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyFailedFetchAttemptsCount database:v16];
    id v27 = v13;
    v22 = id v21 = a7;
    id v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v22 intValue] + 1);

    a7 = v21;
    id v13 = v27;
  }
  v33[0] = v17;
  v33[1] = v19;
  id v23 = +[NSArray arrayWithObjects:v33 count:2];
  if ([(HDClinicalAccountEntity *)self _resetAccountCredentialIfDownloadIsOverdueWithProfile:v13 transaction:v14 error:a7])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_4C88C;
    v30[3] = &unk_1126B8;
    id v24 = v29;
    id v31 = v29;
    id v32 = v20;
    BOOL v25 = [(HDClinicalAccountEntity *)self updateProperties:v23 profile:v13 transaction:v14 error:a7 bindingHandler:v30];
  }
  else
  {
    BOOL v25 = 0;
    id v24 = v29;
  }

  return v25;
}

- (BOOL)_resetAccountCredentialIfDownloadIsOverdueWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 protectedDatabase];
  id v11 = objc_alloc_init((Class)NSDate);
  id v12 = [(HDClinicalAccountEntity *)self dateForProperty:HDClinicalAccountEntityPropertyLastFetchDate database:v10];
  id v13 = [(HDClinicalAccountEntity *)self numberForProperty:HDClinicalAccountEntityPropertyFailedFetchAttemptsCount database:v10];
  id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 intValue] + 1);
  id v27 = v11;
  if (v12)
  {
    [v11 timeIntervalSinceDate:v12];
    BOOL v16 = v15 > 2419200.0;
  }
  else
  {
    BOOL v16 = 1;
  }
  int v17 = [v14 intValue];
  BOOL v18 = 1;
  if (v16)
  {
    uint64_t v19 = v8;
    if (v17 >= 11)
    {
      if ([(HDClinicalAccountEntity *)self deleteCredentialWithProfile:v8 transaction:v9 deleteTokens:1 credentialIdentifier:0 error:a5]&& [(HDClinicalAccountEntity *)self updateCredentialState:1 profile:v8 transaction:v9 error:a5])
      {
        id v26 = [(HDClinicalAccountEntity *)self UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v10];
        id v25 = objc_alloc((Class)HKClinicalAccountEvent);
        id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d (%s)", "-[HDClinicalAccountEntity(HealthRecordsPlugin) _resetAccountCredentialIfDownloadIsOverdueWithProfile:transaction:error:]", 2413, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthRecords/HealthRecordsPlugin/Database/Entities/HDClinicalAccountEntity+HealthRecordsPlugin.m");
        id v20 = +[NSDate date];
        id v21 = [v25 initWithAccountIdentifier:v26 type:1 caller:v24 timestamp:v20 eventDescription:@"Account credential was removed due to too many failed attempts and the most recent download being too old"];

        [(HDClinicalAccountEntity *)self credentialStateInDatabase:v10];
        id v22 = [v21 eventWithUpdatedCredentialStateBefore:HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState()];
        BOOL v18 = +[HDClinicalAccountEventEntity insertEvent:v22 database:v10 error:a5];
      }
      else
      {
        BOOL v18 = 0;
      }
    }
  }
  else
  {
    uint64_t v19 = v8;
  }

  return v18;
}

+ (BOOL)updateAccountLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_4CD24;
  v28[3] = &unk_1136F8;
  id v32 = a1;
  id v29 = v15;
  BOOL v33 = a4;
  id v30 = v14;
  id v31 = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_4CEC8;
  v23[3] = &unk_113720;
  BOOL v27 = a4;
  id v24 = v30;
  id v25 = v29;
  id v26 = v17;
  id v18 = v17;
  id v19 = v29;
  id v20 = v30;
  id v21 = v16;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v18 error:a8 block:v28 inaccessibilityHandler:v23];

  return (char)a8;
}

+ (BOOL)updateAccountLastFetchDateNoValidation:(id)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v12 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4D034;
  v17[3] = &unk_112FD0;
  id v18 = a4;
  id v19 = v12;
  id v20 = a5;
  id v21 = a1;
  id v13 = v20;
  id v14 = v12;
  id v15 = v18;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:a6 error:a7 block:v17 inaccessibilityHandler:&stru_113740];

  return (char)a7;
}

+ (BOOL)updateAccountLastFailedFetchDate:(id)a3 overrideFailedAttemptsCount:(id)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_4D3B0;
  v30[3] = &unk_113768;
  id v35 = a1;
  id v31 = v16;
  id v32 = v14;
  id v33 = v15;
  id v34 = v17;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4D554;
  v25[3] = &unk_113790;
  id v26 = v32;
  id v27 = v33;
  id v28 = v31;
  id v29 = v18;
  id v19 = v18;
  id v20 = v31;
  id v21 = v33;
  id v22 = v32;
  id v23 = v17;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v19 error:a8 block:v30 inaccessibilityHandler:v25];

  return (char)a8;
}

+ (BOOL)_deleteLastFetchDatesForAccountWithdentifier:(id)a3 profile:(id)a4 healthDatabase:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v22[0] = HDClinicalAccountEntityPropertyLastFetchDate;
  v22[1] = HDClinicalAccountEntityPropertyLastFullFetchDate;
  id v12 = a5;
  +[NSArray arrayWithObjects:v22 count:2];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_4D728;
  v17[3] = &unk_112FD0;
  id v18 = v10;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v11;
  id v21 = a1;
  id v13 = v11;
  id v14 = v19;
  id v15 = v10;
  LOBYTE(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v17 inaccessibilityHandler:0];

  return (char)a6;
}

- (BOOL)_updateLastExtractedRowID:(id)a3 rulesVersion:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v23[0] = HDClinicalAccountEntityPropertyLastExtractedRowID;
  v23[1] = HDClinicalAccountEntityPropertyLastExtractedRulesVersion;
  id v14 = a6;
  id v15 = a5;
  id v16 = +[NSArray arrayWithObjects:v23 count:2];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4D998;
  v20[3] = &unk_1126B8;
  id v21 = v12;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  LOBYTE(a7) = [(HDClinicalAccountEntity *)self updateProperties:v16 profile:v15 transaction:v14 error:a7 bindingHandler:v20];

  return (char)a7;
}

+ (BOOL)updateAccountLastExtractedRowID:(id)a3 rulesVersion:(id)a4 identifier:(id)a5 profile:(id)a6 healthDatabase:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_4DBC8;
  v30[3] = &unk_113768;
  id v35 = a1;
  id v31 = v16;
  id v32 = v14;
  id v33 = v15;
  id v34 = v17;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4DD6C;
  v25[3] = &unk_113790;
  id v26 = v32;
  id v27 = v33;
  id v28 = v31;
  id v29 = v18;
  id v19 = v18;
  id v20 = v31;
  id v21 = v33;
  id v22 = v32;
  id v23 = v17;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v19 error:a8 block:v30 inaccessibilityHandler:v25];

  return (char)a8;
}

- (BOOL)updateLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_msgSend((id)objc_opt_class(), "_predicateForAccountWithPersistentID:expectedLastExtractedRulesVersion:", -[HDClinicalAccountEntity persistentID](self, "persistentID"), v12);

  id v14 = objc_opt_class();
  uint64_t v20 = HDClinicalAccountEntityPropertyLastSubmittedRowID;
  id v15 = +[NSArray arrayWithObjects:&v20 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_4DF4C;
  v18[3] = &unk_111B40;
  id v19 = v10;
  id v16 = v10;
  LOBYTE(a6) = [v14 updateProperties:v15 predicate:v13 database:v11 error:a6 bindingHandler:v18];

  return (char)a6;
}

+ (BOOL)updateAccountLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 identifier:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_4E110;
  v26[3] = &unk_112FD0;
  id v30 = a1;
  id v27 = v14;
  id v28 = v12;
  id v29 = v13;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_4E18C;
  void v21[3] = &unk_113790;
  id v22 = v28;
  id v23 = v29;
  id v24 = v27;
  id v25 = v15;
  id v16 = v15;
  id v17 = v27;
  id v18 = v29;
  id v19 = v28;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v16 error:a7 block:v26 inaccessibilityHandler:v21];

  return (char)a7;
}

+ (BOOL)resetAccountRowIDsForRulesVersion:(id)a3 identifier:(id)a4 profile:(id)a5 healthDatabase:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4E384;
  v25[3] = &unk_112FD0;
  id v29 = a1;
  id v26 = v13;
  id v27 = v12;
  id v28 = v14;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_4E418;
  void v21[3] = &unk_112490;
  id v22 = v27;
  id v23 = v26;
  id v24 = v15;
  id v16 = v15;
  id v17 = v26;
  id v18 = v27;
  id v19 = v14;
  LOBYTE(a7) = [a1 performWriteTransactionWithHealthDatabase:v16 error:a7 block:v25 inaccessibilityHandler:v21];

  return (char)a7;
}

+ (BOOL)deleteAccountWithIdentifier:(id)a3 deletionReason:(int64_t)a4 deleteGateway:(BOOL)a5 deleteIssuer:(BOOL)a6 profile:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = [v14 database];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_4E5C4;
  v19[3] = &unk_113800;
  id v21 = v14;
  id v22 = a1;
  id v20 = v13;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v16 = v14;
  id v17 = v13;
  LOBYTE(a8) = [a1 performWriteTransactionWithHealthDatabase:v15 error:a8 block:v19 inaccessibilityHandler:0];

  return (char)a8;
}

+ (void)_postAccountChangeNotificationForAccount:(id)a3 changeType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = +[NSNumber numberWithInteger:a4, @"changeType"];
    id v12 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"HDClinicalAccountEntityDidChangeEventNotification" object:v6 userInfo:v8];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = a1;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Attempting to post an account change notification without providing an account. Not posting notification.", buf, 0xCu);
    }
  }
}

+ (id)_hkAccountRepresentingDeletedAccountWithIdentifier:(id)a3 gatewayExternalID:(id)a4 signedClinicalDataIssuerID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    if (v8)
    {
      id v11 = +[HKClinicalBrand createFakeBrandForTestAccounts];
      id v12 = objc_alloc((Class)HKClinicalGateway);
      id v13 = HKClinicalGatewayUnknownBaseURL();
      id v14 = +[HKFHIRVersion primaryDSTU2Version];
      id v15 = objc_msgSend(v12, "initWithExternalID:title:subtitle:displayableDescription:phoneNumber:informationURL:passwordResetURL:patientPortalURL:signupURL:status:type:brand:country:baseURL:FHIRVersion:authSchemas:resourceSchemas:features:gatewayVersions:minCompatibleAPIVersion:", v8, 0, 0, 0, 0, 0, v11, &stru_1152E8, v13, v14, 0, 0, 0, 0, 0);

      id v16 = [objc_alloc((Class)HKClinicalAccountProvenance) initWithGateway:v15];
LABEL_6:

      id v17 = objc_alloc((Class)HKClinicalAccount);
      id v18 = +[HKClinicalSharingStatus unknownStatus];
      LOBYTE(v21) = 0;
      id v19 = [v17 initWithIdentifier:v7 state:2 userEnabled:0 lastFetchDate:0 lastFullFetchDate:0 lastFailedFetchDate:0 failedFetchAttemptsCount:0 clinicalSharingStatus:v18 hasClinicalSharingScopes:v21 provenance:v16];

      goto LABEL_8;
    }
    if (v9)
    {
      id v11 = [objc_alloc((Class)HKSignedClinicalDataIssuer) initWithIdentifier:v9 title:&stru_1152E8 subtitle:0 wellKnownURL:0];
      id v16 = [objc_alloc((Class)HKClinicalAccountProvenance) initWithSignedClinicalDataIssuer:v11];
      goto LABEL_6;
    }
  }
  id v19 = 0;
LABEL_8:

  return v19;
}

+ (BOOL)_validateCodableAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 hasMessageVersion])
  {
    id v6 = [v5 messageVersion];
    int v7 = [v6 compatibilityVersion];

    if (v7 > 2)
    {
      CFStringRef v8 = @"Codable account compatibilty version is higher than what we support";
LABEL_18:
      +[NSError hk_assignError:a4 code:3 description:v8];
      BOOL v15 = 0;
      goto LABEL_19;
    }
  }
  id v9 = [v5 gatewayExternalID];
  id v10 = [v9 length];
  id v11 = [v5 signedClinicalDataIssuerIdentifier];
  id v12 = (char *)[v11 length];

  if (!&v12[(void)v10])
  {
    CFStringRef v8 = @"Codable account missing gateway external ID or signed clinical data issuer ID";
    goto LABEL_18;
  }
  if ([v5 hasGatewayExternalID]
    && [v5 hasSignedClinicalDataIssuerIdentifier])
  {
    +[NSError hk_assignError:a4 code:3 description:@"Codable account has both gateway external ID and signed clinical data issuer identifier, which are mutually exclusive"];
  }
  if (![v5 hasUserEnabled])
  {
    goto LABEL_18;
  }
  if (![v5 hasCreationDate])
  {
    CFStringRef v8 = @"Codable account missing creation date";
    goto LABEL_18;
  }
  if (![v5 hasModificationDate])
  {
    CFStringRef v8 = @"Codable account missing modification date";
    goto LABEL_18;
  }
  id v13 = [v5 syncIdentifier];
  id v14 = +[NSUUID hk_UUIDWithData:v13];

  if (!v14)
  {
    CFStringRef v8 = @"Codable account missing sync identifier";
    goto LABEL_18;
  }
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

@end