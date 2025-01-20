@interface AKAccountManager
+ (AKAccountManager)sharedInstance;
+ (BOOL)isAccountsFrameworkAvailable;
+ (id)personaIDIfCurrentPersonaIsDataSeparated;
+ (id)stringRepresentationForService:(int64_t)a3;
+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4;
+ (void)personaIDIfCurrentPersonaIsDataSeparated;
- (ACAccountStore)store;
- (ACAccountType)appleIDAccountType;
- (ACAccountType)authKitAccountType;
- (ACAccountType)iCloudAccountType;
- (ACAccountType)iTunesAccountType;
- (AKAccountManager)init;
- (BOOL)_isAccountEligibleForSecurityUpgrade:(id)a3 ofServiceType:(int64_t)a4;
- (BOOL)_saveAccount:(id)a3 error:(id *)a4;
- (BOOL)_setUsername:(id)a3 forAccount:(id)a4;
- (BOOL)_shouldBlockAuthorizationForPersona:(id)a3;
- (BOOL)accountAccessTelemetryOptInForAccount:(id)a3;
- (BOOL)accountIsSignedIntoServices:(id)a3;
- (BOOL)authorizationUsedForAccount:(id)a3;
- (BOOL)canBeBeneficiaryForAccount:(id)a3;
- (BOOL)canBeCustodianForAccount:(id)a3;
- (BOOL)canHaveBeneficiaryForAccount:(id)a3;
- (BOOL)canHaveCustodianForAccount:(id)a3;
- (BOOL)custodianEnabledForAccount:(id)a3;
- (BOOL)dcrtRenewalAttempted:(id)a3;
- (BOOL)demoAccountForAccount:(id)a3;
- (BOOL)hasMDMForAccount:(id)a3;
- (BOOL)hasPersonaAvailableForAltDSID:(id)a3;
- (BOOL)hasPrimaryiCloudAccountForAltDSID:(id)a3;
- (BOOL)hasPrimaryiCloudAccountForAppleID:(id)a3;
- (BOOL)isAskToBuyForAccount:(id)a3;
- (BOOL)isBeneficiaryForAccount:(id)a3;
- (BOOL)isDataSeparatedAccountForAltDSID:(id)a3;
- (BOOL)isFidoForAccount:(id)a3;
- (BOOL)isFulliCloudAccount:(id)a3;
- (BOOL)isManagedAppleIDForAccount:(id)a3;
- (BOOL)isNotificationEmailAvailableForAccount:(id)a3;
- (BOOL)isPasscodeAuthEnabledForAccount:(id)a3;
- (BOOL)isPasscodeAuthForAccount:(id)a3;
- (BOOL)isPrimaryiCloudAccount:(id)a3;
- (BOOL)isPrimaryiCloudAccountEmailVerified:(id)a3;
- (BOOL)isProximityAuthEligible:(id)a3;
- (BOOL)isSiwaEnabledForChildAccount:(id)a3;
- (BOOL)mdmInformationRequiredForAccount:(id)a3;
- (BOOL)needsRepairForAccount:(id)a3;
- (BOOL)phoneAsAppleIDForAccount:(id)a3;
- (BOOL)piggybackingApprovalEligible:(id)a3;
- (BOOL)privateAttestationEnabledForAccount:(id)a3;
- (BOOL)saveAccount:(id)a3 error:(id *)a4;
- (BOOL)selectedPrivateEmailForAccount:(id)a3;
- (BOOL)setAccountAccessTelemetryOptIn:(BOOL)a3 forAccount:(id)a4 error:(id *)a5;
- (BOOL)shouldPerformSatoriWarmupVerificationForAccount:(id)a3;
- (BOOL)shouldUpdateAuthModeForAccount:(id)a3;
- (BOOL)userIsSeniorForAccount:(id)a3;
- (BOOL)userUnderAgeForAccount:(id)a3;
- (BOOL)verifiedPrimaryEmailForAccount:(id)a3;
- (id)DSIDForAccount:(id)a3;
- (id)_accountTypeForServiceType:(int64_t)a3;
- (id)_aliasesForiCloudAccount:(id)a3;
- (id)_altDSIDForiCloudAccount:(id)a3;
- (id)_creationKeyForTokenWithName:(id)a3;
- (id)_credentialForAccount:(id)a3;
- (id)_defaultSecurityUpgradeServiceNames;
- (id)_fetchAllAccountsWithType:(id)a3 error:(id *)a4;
- (id)_iCloudAccountFromPersonaUniqueIdentifier:(id)a3;
- (id)_iCloudAccountRequestingAuthorization;
- (id)_iCloudAccounts;
- (id)_isSilentBurnCDPRepairEnabledForAccount:(id)a3;
- (id)_isSilentEscrowRecordRepairEnabledForAccount:(id)a3;
- (id)_isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3;
- (id)_matchingServiceAccountForAuthKitAccount:(id)a3 service:(int64_t)a4;
- (id)_serviceTypesForSecurityUpgrade;
- (id)_tokenWithName:(id)a3 forAccount:(id)a4 error:(id *)a5;
- (id)accountAccessTelemetryOptInDateForAccount:(id)a3;
- (id)accountEligibleForUpdate;
- (id)accountTypeForTypeIdentifier:(id)a3;
- (id)accountsUsingService:(int64_t)a3;
- (id)activeServiceNamesForAccount:(id)a3;
- (id)activeiCloudPrivateEmailCount;
- (id)activeiCloudPrivateEmailCountForAccount:(id)a3;
- (id)additionalInfoForAccount:(id)a3;
- (id)adpCohortForAccount:(id)a3;
- (id)ageOfMajorityForAccount:(id)a3;
- (id)aliasesForAccount:(id)a3;
- (id)allAuthKitAccounts;
- (id)allAuthKitAccountsWithError:(id *)a3;
- (id)allTokensForAccount:(id)a3 error:(id *)a4;
- (id)altDSIDForAccount:(id)a3;
- (id)altDSIDForAuthKitAccountRequestingAuthorization;
- (id)altDSIDforPrimaryiCloudAccount;
- (id)appleIDAccountWithAltDSID:(id)a3;
- (id)appleIDAccountWithAppleID:(id)a3;
- (id)appleIDCountryCodeForAccount:(id)a3;
- (id)authKitAccountRequestingAuthorization;
- (id)authKitAccountTypeWithError:(id *)a3;
- (id)authKitAccountWithAltDSID:(id)a3;
- (id)authKitAccountWithAltDSID:(id)a3 error:(id *)a4;
- (id)authKitAccountWithAppleID:(id)a3;
- (id)authKitAccountWithAppleID:(id)a3 error:(id *)a4;
- (id)authKitAccountWithDSID:(id)a3;
- (id)beneficiaryInfoForAccount:(id)a3;
- (id)beneficiaryLastModifiedForAccount:(id)a3;
- (id)beneficiaryListVersionForAccount:(id)a3;
- (id)birthYearForAccount:(id)a3;
- (id)buildCredentialWithTokens:(id)a3;
- (id)canAttestAgeForAccount:(id)a3;
- (id)combinedAliasesAndReachableEmailsForAccount:(id)a3;
- (id)configDataVersionForAccount:(id)a3;
- (id)configValue:(id)a3 forAccount:(id)a4;
- (id)continuationTokenForAccount:(id)a3;
- (id)continuationTokenForAccount:(id)a3 error:(id *)a4;
- (id)custodianInfosForAccount:(id)a3;
- (id)custodianLastModifiedForAccount:(id)a3;
- (id)custodianListVersionForAccount:(id)a3;
- (id)deletedDevicesCacheExpiryOffsetForAccount:(id)a3;
- (id)dependentAuthTokenForAccount:(id)a3;
- (id)deviceListVersionForAccount:(id)a3;
- (id)edpStateForAccount:(id)a3;
- (id)familyNameForAccount:(id)a3;
- (id)formattedUsernameForAccount:(id)a3;
- (id)forwardingEmailForAccount:(id)a3;
- (id)get3PRegulatoryOverride:(id)a3;
- (id)givenNameForAccount:(id)a3;
- (id)groupKitEligibilityForAccount:(id)a3;
- (id)hasModernRecoveryKeyForAccount:(id)a3;
- (id)hasSOSActiveDeviceForAccount:(id)a3;
- (id)hearbeatTokenForAccount:(id)a3;
- (id)hearbeatTokenForAccount:(id)a3 error:(id *)a4;
- (id)iCloudAccountForAltDSID:(id)a3;
- (id)iCloudAccountForAppleID:(id)a3;
- (id)idmsEDPTokenIdForAccount:(id)a3;
- (id)inactiveiCloudPrivateEmailCount;
- (id)inactiveiCloudPrivateEmailCountForAccount:(id)a3;
- (id)isSOSNeededForAccount:(id)a3;
- (id)isSilentBurnCDPRepairEnabledForAccount:(id)a3;
- (id)isSilentEscrowRecordRepairEnabledForAccount:(id)a3;
- (id)isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3;
- (id)loginHandlesForAccount:(id)a3;
- (id)managedOrganizationNameForAccount:(id)a3;
- (id)markedForSignOutForAccount:(id)a3;
- (id)masterTokenForAccount:(id)a3;
- (id)mostRecentlyUsedAuthKitAccount;
- (id)nextLivenessNonce:(id)a3;
- (id)notificationEmailForAccount:(id)a3;
- (id)passkeyEligibleForAccount:(id)a3;
- (id)passkeyPresentForAccount:(id)a3;
- (id)passkeyRegistrationAttemptDateForAccount:(id)a3;
- (id)passkeysDeletionAttemptDateForAccount:(id)a3;
- (id)passkeysInKeychainCountForAccount:(id)a3;
- (id)passwordResetTokenBackupForAccount:(id)a3;
- (id)passwordResetTokenBackupForAccount:(id)a3 error:(id *)a4;
- (id)passwordResetTokenForAccount:(id)a3;
- (id)passwordResetTokenForAccount:(id)a3 error:(id *)a4;
- (id)passwordVersionForAccount:(id)a3;
- (id)personaUniqueStringForAltDSID:(id)a3;
- (id)previousAccountInfoRefreshDateForAccount:(id)a3;
- (id)primaryAuthKitAccount;
- (id)primaryEmailAddressForAccount:(id)a3;
- (id)primaryiCloudAccount;
- (id)reachableEmailAddressesForAccount:(id)a3;
- (id)securityKeysForAccount:(id)a3;
- (id)selectedAuthorizationEmailForAccount:(id)a3;
- (id)serverExperimentalFeaturesForAccount:(id)a3;
- (id)servicesUsingAccount:(id)a3;
- (id)settingsServiceTokenForAccount:(id)a3;
- (id)sharingGroupLastNotificationDateForAccount:(id)a3;
- (id)srpProtocolForAccount:(id)a3;
- (id)telemetryDeviceSessionIDForAccount:(id)a3;
- (id)tokenCreationDateWithIdentifier:(id)a3 forAccount:(id)a4 error:(id *)a5;
- (id)transportableAuthKitAccount:(id)a3;
- (id)trustedPhoneNumbersForAccount:(id)a3;
- (id)webAccessEnabledForAccount:(id)a3;
- (int64_t)_serviceTypeForServiceNameString:(id)a3;
- (int64_t)deviceRemovalReasonForAccount:(id)a3;
- (unint64_t)authenticationModeForAccount:(id)a3;
- (unint64_t)edpStateValueForAccount:(id)a3;
- (unint64_t)managedOrganizationTypeForAccount:(id)a3;
- (unint64_t)numberOfApprovedRecoveryContactsForAltDSID:(id)a3;
- (unint64_t)repairStateForAccount:(id)a3;
- (unint64_t)securityLevelForAccount:(id)a3;
- (unint64_t)signInPartitionForLivenessWithAltDSID:(id)a3;
- (unint64_t)userAgeRangeForAccount:(id)a3;
- (void)_clearRawPasswordForAccount:(id)a3;
- (void)_removeAllRawPasswordCaches;
- (void)_removeTokenForKeys:(id)a3 forAccount:(id)a4;
- (void)_removeTokenKey:(id)a3 forAccount:(id)a4;
- (void)_reportTokenWithName:(id)a3 forAccount:(id)a4 error:(id)a5;
- (void)_reportTokenWithTelemetryID:(id)a3 account:(id)a4 telemetryFlowID:(id)a5 error:(id)a6;
- (void)_setTokenCreationTimeForToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6;
- (void)_triggerSilentTTRFor:(unint64_t)a3;
- (void)clearDeviceRemovalReasonFromAccount:(id)a3;
- (void)removeAllPasswordResetTokens;
- (void)removeContinuationTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5;
- (void)removeMasterTokenForAccount:(id)a3;
- (void)removePasswordResetTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5;
- (void)set3PRegulatoryOverride:(id)a3 forAccount:(id)a4;
- (void)setADPCohort:(id)a3 forAccount:(id)a4;
- (void)setAccount:(id)a3 inUse:(BOOL)a4 byService:(int64_t)a5;
- (void)setActiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4;
- (void)setAdditionalInfo:(id)a3 forAccount:(id)a4;
- (void)setAgeOfMajority:(id)a3 forAccount:(id)a4;
- (void)setAliases:(id)a3 forAccount:(id)a4;
- (void)setAltDSID:(id)a3 forAccount:(id)a4;
- (void)setAppleIDCountryCode:(id)a3 forAccount:(id)a4;
- (void)setAskToBuy:(BOOL)a3 forAccount:(id)a4;
- (void)setAuthenticationMode:(unint64_t)a3 forAccount:(id)a4;
- (void)setAuthorizationUsed:(BOOL)a3 forAccount:(id)a4;
- (void)setBeneficiary:(BOOL)a3 forAccount:(id)a4;
- (void)setBeneficiaryInfo:(id)a3 forAccount:(id)a4;
- (void)setBeneficiaryLastModified:(id)a3 forAccount:(id)a4;
- (void)setBeneficiaryListVersion:(id)a3 forAccount:(id)a4;
- (void)setBirthYear:(id)a3 forAccount:(id)a4;
- (void)setCanAttestAge:(id)a3 forAccount:(id)a4;
- (void)setCanBeBeneficiary:(BOOL)a3 forAccount:(id)a4;
- (void)setCanBeCustodian:(BOOL)a3 forAccount:(id)a4;
- (void)setCanHaveBeneficiary:(BOOL)a3 forAccount:(id)a4;
- (void)setCanHaveCustodian:(BOOL)a3 forAccount:(id)a4;
- (void)setConfigDataVersion:(id)a3 forAccount:(id)a4;
- (void)setConfigValue:(id)a3 forKey:(id)a4 forAccount:(id)a5;
- (void)setCredentialStorageOption:(unint64_t)a3 forAccount:(id)a4;
- (void)setCustodianEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)setCustodianInfos:(id)a3 forAccount:(id)a4;
- (void)setCustodianLastModified:(id)a3 forAccount:(id)a4;
- (void)setCustodianListVersion:(id)a3 forAccount:(id)a4;
- (void)setDCRTRenewalAttempted:(BOOL)a3 forAccount:(id)a4;
- (void)setDSID:(id)a3 forAccount:(id)a4;
- (void)setDeletedDevicesCacheExpiryOffset:(id)a3 forAccount:(id)a4;
- (void)setDemoAccount:(BOOL)a3 forAccount:(id)a4;
- (void)setDeviceListVersion:(id)a3 forAccount:(id)a4;
- (void)setDeviceRemovalReason:(int64_t)a3 onAccount:(id)a4;
- (void)setEDPState:(id)a3 forAccount:(id)a4;
- (void)setFamilyName:(id)a3 forAccount:(id)a4;
- (void)setFido:(BOOL)a3 forAccount:(id)a4;
- (void)setForwardingEmail:(id)a3 forAccount:(id)a4;
- (void)setGivenName:(id)a3 forAccount:(id)a4;
- (void)setGroupKitEligibility:(id)a3 forAccount:(id)a4;
- (void)setHasMDM:(BOOL)a3 forAccount:(id)a4;
- (void)setHasModernRecoveryKey:(BOOL)a3 forAccount:(id)a4;
- (void)setHasSOSActiveDevice:(BOOL)a3 forAccount:(id)a4;
- (void)setIdMSEDPTokenId:(id)a3 forAccount:(id)a4;
- (void)setInactiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4;
- (void)setIsNotificationEmailAvailable:(BOOL)a3 forAccount:(id)a4;
- (void)setIsProximityAuthEligible:(BOOL)a3 forAccount:(id)a4;
- (void)setIsSiwaEnabled:(BOOL)a3 forChildAccount:(id)a4;
- (void)setLoginHandles:(id)a3 forAccount:(id)a4;
- (void)setMDMInformationRequired:(BOOL)a3 forAccount:(id)a4;
- (void)setManagedOrganizationName:(id)a3 forAccount:(id)a4;
- (void)setManagedOrganizationType:(unint64_t)a3 forAccount:(id)a4;
- (void)setMarkedForSignOut:(BOOL)a3 forAccount:(id)a4;
- (void)setNextLivenessNonce:(id)a3 nonce:(id)a4;
- (void)setNotificationEmail:(id)a3 forAccount:(id)a4;
- (void)setPasscodeAuth:(BOOL)a3 forAccount:(id)a4;
- (void)setPasscodeAuthEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)setPasskeyEligible:(BOOL)a3 forAccount:(id)a4;
- (void)setPasskeyPresent:(BOOL)a3 forAccount:(id)a4;
- (void)setPasskeyRegistrationAttemptDateForAccount:(id)a3 forAccount:(id)a4;
- (void)setPasskeysDeletionAttemptDate:(id)a3 forAccount:(id)a4;
- (void)setPasskeysInKeychainCount:(id)a3 forAccount:(id)a4;
- (void)setPasswordVersion:(id)a3 forAccount:(id)a4;
- (void)setPhoneAsAppleID:(BOOL)a3 forAccount:(id)a4;
- (void)setPiggybackingApprovalEligible:(BOOL)a3 forAccount:(id)a4;
- (void)setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4;
- (void)setPrimaryEmailAddress:(id)a3 forAccount:(id)a4;
- (void)setPrivateAttestationEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)setReachableEmailAddresses:(id)a3 forAccount:(id)a4;
- (void)setRepairState:(unint64_t)a3 forAccount:(id)a4;
- (void)setSOSNeeded:(BOOL)a3 forAccount:(id)a4;
- (void)setSRPProtocol:(id)a3 forAccount:(id)a4;
- (void)setSecurityKeys:(id)a3 forAccount:(id)a4;
- (void)setSecurityLevel:(unint64_t)a3 forAccount:(id)a4;
- (void)setSelectedAuthorizationEmail:(id)a3 forAccount:(id)a4;
- (void)setSelectedPrivateEmail:(BOOL)a3 forAccount:(id)a4;
- (void)setServerExperimentalFeatures:(id)a3 forAccount:(id)a4;
- (void)setSharingGroupLastNotificationDate:(id)a3 forAccount:(id)a4;
- (void)setSilentBurnCDPRepairEnabled:(id)a3 forAccount:(id)a4;
- (void)setSilentEscrowRecordRepairEnabled:(id)a3 forAccount:(id)a4;
- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3 forAccount:(id)a4;
- (void)setStore:(id)a3;
- (void)setTelemetryDeviceSessionID:(id)a3 forAccount:(id)a4;
- (void)setToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6;
- (void)setTrustedPhoneNumbers:(id)a3 forAccount:(id)a4;
- (void)setUserAgeRange:(unint64_t)a3 forAccount:(id)a4;
- (void)setUserIsSenior:(BOOL)a3 forAccount:(id)a4;
- (void)setUserUnderage:(BOOL)a3 forAccount:(id)a4;
- (void)setVerifiedPrimaryEmail:(BOOL)a3 forAccount:(id)a4;
- (void)setWebAccessEnabled:(BOOL)a3 forAccount:(id)a4;
- (void)updateAccountAccessTelemetryOptInTimestampForAccount:(id)a3 withOptIn:(BOOL)a4;
- (void)updateAuthModeTimestampForAccount:(id)a3;
- (void)updateSatoriWarmUpTimestampForAccount:(id)a3;
- (void)updateUsername:(id)a3 forAccountsWithAltDSID:(id)a4;
- (void)updateVerifiedEmail:(BOOL)a3 forAccountWithAltDSID:(id)a4;
@end

@implementation AKAccountManager

+ (AKAccountManager)sharedInstance
{
  if (+[AKAccountManager isAccountsFrameworkAvailable])
  {
    if (sharedInstance_onceToken_1 != -1) {
      dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_21);
    }
    id v2 = (id)sharedInstance_sharedInstance_1;
  }
  else
  {
    id v2 = 0;
  }

  return (AKAccountManager *)v2;
}

+ (BOOL)isAccountsFrameworkAvailable
{
  return objc_opt_class() != 0;
}

- (unint64_t)securityLevelForAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountPropertyForKey:@"security-level"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (id)altDSIDForAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountPropertyForKey:@"altDSID"];

  return v4;
}

- (id)allAuthKitAccountsWithError:(id *)a3
{
  id v10 = 0;
  unint64_t v5 = [(AKAccountManager *)self authKitAccountTypeWithError:&v10];
  id v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = [(AKAccountManager *)self _fetchAllAccountsWithType:v5 error:a3];
  }
  else
  {
    v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v8;
}

- (id)primaryAuthKitAccount
{
  id v3 = [(AKAccountManager *)self altDSIDforPrimaryiCloudAccount];
  v4 = [(AKAccountManager *)self authKitAccountWithAltDSID:v3 error:0];

  return v4;
}

- (id)authKitAccountWithAltDSID:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v25 = 0;
    v7 = [(AKAccountManager *)self allAuthKitAccountsWithError:&v25];
    id v8 = v25;
    v9 = v8;
    if (v8)
    {
      id v10 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v20 = v7;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v17 = [v16 accountPropertyForKey:@"altDSID"];
            char v18 = [v17 isEqual:v6];

            if (v18)
            {
              id v10 = v16;

              goto LABEL_18;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v10 = 0;
LABEL_18:
      v7 = v20;
    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7025);
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)authKitAccountWithAltDSID:(id)a3
{
  return [(AKAccountManager *)self authKitAccountWithAltDSID:a3 error:0];
}

- (id)altDSIDforPrimaryiCloudAccount
{
  id v3 = [(AKAccountManager *)self primaryiCloudAccount];
  if (v3)
  {
    v4 = [(AKAccountManager *)self altDSIDForAccount:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)primaryiCloudAccount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(AKAccountManager *)self _iCloudAccounts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (-[AKAccountManager isPrimaryiCloudAccount:](self, "isPrimaryiCloudAccount:", v8, (void)v11))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)_iCloudAccounts
{
  id v3 = [(AKAccountManager *)self iCloudAccountType];
  uint64_t v4 = [(AKAccountManager *)self _fetchAllAccountsWithType:v3 error:0];

  return v4;
}

- (id)_fetchAllAccountsWithType:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  accountStore = self->_accountStore;
  id v16 = 0;
  id v8 = [(AKAccountStore *)accountStore accountsWithAccountType:v6 options:0 error:&v16];
  id v9 = v16;
  if ([(AKAccountStore *)self->_accountStore isAccountDaemonConnectionError:v9])
  {

    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_193494000, v10, OS_LOG_TYPE_DEFAULT, "First attempt fetching accounts of type %@ failed, retrying once...", buf, 0xCu);
    }

    long long v11 = self->_accountStore;
    id v15 = 0;
    uint64_t v12 = [(AKAccountStore *)v11 accountsWithAccountType:v6 options:0 error:&v15];
    id v9 = v15;

    id v8 = (void *)v12;
  }
  if (a4) {
    *a4 = v9;
  }
  if (v9)
  {
    long long v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager _fetchAllAccountsWithType:error:]();
    }
  }

  return v8;
}

- (ACAccountType)iCloudAccountType
{
  iCloudAccountType = self->_iCloudAccountType;
  if (!iCloudAccountType)
  {
    os_unfair_lock_lock(&self->_iCloudAccountTypeLock);
    if (!self->_iCloudAccountType)
    {
      uint64_t v4 = [(AKAccountStore *)self->_accountStore accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17748] error:0];
      uint64_t v5 = self->_iCloudAccountType;
      self->_iCloudAccountType = v4;
    }
    os_unfair_lock_unlock(&self->_iCloudAccountTypeLock);
    iCloudAccountType = self->_iCloudAccountType;
  }

  return iCloudAccountType;
}

- (id)authKitAccountTypeWithError:(id *)a3
{
  authKitAccountType = self->_authKitAccountType;
  if (!authKitAccountType)
  {
    os_unfair_lock_lock(&self->_authKitAccountTypeLock);
    if (!self->_authKitAccountType)
    {
      id v6 = [(AKAccountStore *)self->_accountStore accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177D8] error:a3];
      v7 = self->_authKitAccountType;
      self->_authKitAccountType = v6;
    }
    os_unfair_lock_unlock(&self->_authKitAccountTypeLock);
    authKitAccountType = self->_authKitAccountType;
  }

  return authKitAccountType;
}

uint64_t __34__AKAccountManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(AKAccountManager);

  return MEMORY[0x1F41817F8]();
}

- (AKAccountManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)AKAccountManager;
  id v2 = [(AKAccountManager *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init(AKAccountStore);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AKAccountManagerQueue", v5);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v6;

    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("AKAccountManagerQueue.read.write", v8);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    v2->_authKitAccountTypeLock._os_unfair_lock_opaque = 0;
    v2->_appleIDAccountTypeLock._os_unfair_lock_opaque = 0;
    v2->_iCloudAccountTypeLock._os_unfair_lock_opaque = 0;
    *(void *)&v2->_iTunesAccountTypeLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    accountTypeCache = v2->_accountTypeCache;
    v2->_accountTypeCache = (NSMutableDictionary *)v11;
  }
  return v2;
}

- (id)telemetryDeviceSessionIDForAccount:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    dispatch_queue_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager telemetryDeviceSessionIDForAccount:]();
    }
    goto LABEL_10;
  }
  if (![(AKAccountManager *)self accountAccessTelemetryOptInForAccount:v4])
  {
    dispatch_queue_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager telemetryDeviceSessionIDForAccount:]();
    }
LABEL_10:

    id v8 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = [v4 accountPropertyForKey:@"telemetryDeviceSessionID"];
  dispatch_queue_t v6 = (void *)v5;
  v7 = @"device_session_id_missing";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  id v8 = v7;

LABEL_11:

  return v8;
}

- (BOOL)accountIsSignedIntoServices:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  uint64_t v5 = [v4 servicesUsingAccount:v3];

  LOBYTE(v3) = objc_msgSend(v5, "aaf_hasObjects");
  return (char)v3;
}

- (BOOL)accountAccessTelemetryOptInForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[AKConfiguration sharedConfiguration];
  uint64_t v5 = [v4 shouldEnableTelemetryOptIn];

  if (v5 != 1)
  {
    objc_opt_class();
    id v6 = [v3 accountPropertyForKey:@"com.apple.idms.config.privacy.appleid.data.access"];
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    LOBYTE(v5) = [v7 BOOLValue];
  }

  return v5;
}

- (void)setInactiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"inActiveHMECount"];
}

- (void)setActiveiCloudPrivateEmailCount:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"activeHMECount"];
}

- (void)setTelemetryDeviceSessionID:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"telemetryDeviceSessionID"];
}

- (BOOL)setAccountAccessTelemetryOptIn:(BOOL)a3 forAccount:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = [NSNumber numberWithBool:v6];
  [v8 setAccountProperty:v9 forKey:@"com.apple.idms.config.privacy.appleid.data.access"];

  [(AKAccountManager *)self updateAccountAccessTelemetryOptInTimestampForAccount:v8 withOptIn:v6];
  BOOL v10 = [(AKAccountManager *)self saveAccount:v8 error:a5];
  uint64_t v11 = _AKLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      -[AKAccountManager setAccountAccessTelemetryOptIn:forAccount:error:]();
    }
  }
  else if (v12)
  {
    -[AKAccountManager setAccountAccessTelemetryOptIn:forAccount:error:]();
  }

  return v10;
}

- (void)updateAccountAccessTelemetryOptInTimestampForAccount:(id)a3 withOptIn:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setAccountProperty:v7 forKey:@"DataAccessAnalyticsOptInTimeStamp"];
  }
  else
  {
    [v5 setAccountProperty:0 forKey:@"DataAccessAnalyticsOptInTimeStamp"];
  }
}

- (id)accountAccessTelemetryOptInDateForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"DataAccessAnalyticsOptInTimeStamp"];

  return v4;
}

- (id)configDataVersionForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"configDataVersion"];

  return v4;
}

- (void)setConfigDataVersion:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"configDataVersion"];
}

- (id)configValue:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 accountPropertyForKey:v5];

  return v7;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 forAccount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 setAccountProperty:v8 forKey:v9];
  [(AKAccountManager *)self saveAccount:v10 error:0];
}

- (void)setAltDSID:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    [v6 setAccountProperty:v5 forKey:@"altDSID"];
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager setAltDSID:forAccount:]();
    }
  }
}

- (id)DSIDForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"DSID"];

  return v4;
}

- (void)setDSID:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager setDSID:forAccount:]();
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager setDSID:forAccount:]((uint64_t)v5, v7);
    }
LABEL_8:

    goto LABEL_9;
  }
  [v6 setAccountProperty:v5 forKey:@"DSID"];
LABEL_9:
}

- (id)combinedAliasesAndReachableEmailsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self aliasesForAccount:v4];
  id v6 = [(AKAccountManager *)self reachableEmailAddressesForAccount:v4];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke;
  v17[3] = &unk_1E5760B98;
  id v8 = v7;
  id v18 = v8;
  [v5 enumerateObjectsUsingBlock:v17];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  objc_super v14 = __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke_2;
  id v15 = &unk_1E5760B98;
  id v16 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:&v12];
  id v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15);

  return v10;
}

void __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __64__AKAccountManager_combinedAliasesAndReachableEmailsForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)aliasesForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"aliases"];

  return v4;
}

- (void)setAliases:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"aliases"];
}

- (id)formattedUsernameForAccount:(id)a3
{
  id v3 = [a3 username];
  id v4 = +[AKUsernameFormatter formattedUsernameFromUsername:v3];

  return v4;
}

- (void)updateVerifiedEmail:(BOOL)a3 forAccountWithAltDSID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = [(AKAccountManager *)self authKitAccountWithAltDSID:a4 error:0];
  if ([(AKAccountManager *)self verifiedPrimaryEmailForAccount:v6] == v4)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"NO";
      if (v4) {
        uint64_t v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Account %@ already updated to reflect email verified is %@.", buf, 0x16u);
    }
  }
  else
  {
    [(AKAccountManager *)self setVerifiedPrimaryEmail:v4 forAccount:v6];
    id v13 = 0;
    [(AKAccountManager *)self saveAccount:v6 error:&v13];
    id v7 = v13;
    id v8 = _AKLogSystem();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (v4) {
          id v10 = @"YES";
        }
        id v15 = v10;
        __int16 v16 = 2112;
        v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        _os_log_error_impl(&dword_193494000, v9, OS_LOG_TYPE_ERROR, "Failed to update verified email to %@ with error %@ after observing verified primary email for account %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"NO";
      if (v4) {
        uint64_t v12 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Updated account %@ verified email to %@ after observing verified email followup tear down", buf, 0x16u);
    }
  }
}

- (void)updateUsername:(id)a3 forAccountsWithAltDSID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Requested to update username to %@ for altDSID: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(AKAccountManager *)self authKitAccountWithAltDSID:v7 error:0];
  if (v9 && [(AKAccountManager *)self _setUsername:v6 forAccount:v9]) {
    [(AKAccountManager *)self saveAccount:v9 error:0];
  }
  id v10 = [(AKAccountManager *)self appleIDAccountWithAltDSID:v7];
  if (v10 && [(AKAccountManager *)self _setUsername:v6 forAccount:v10]) {
    [(AKAccountManager *)self saveAccount:v10 error:0];
  }
  uint64_t v11 = [(AKAccountManager *)self iCloudAccountForAltDSID:v7];
  if (v11 && [(AKAccountManager *)self _setUsername:v6 forAccount:v11]) {
    [(AKAccountManager *)self saveAccount:v11 error:0];
  }
}

- (BOOL)_setUsername:(id)a3 forAccount:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5
    && ([v6 username],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v5 isEqualToString:v8],
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = v7;
      _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Updating username for: %@", (uint8_t *)&v13, 0xCu);
    }

    [v7 setUsername:v5];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)primaryEmailAddressForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"primaryEmail"];

  return v4;
}

- (void)setPrimaryEmailAddress:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"primaryEmail"];
}

- (BOOL)verifiedPrimaryEmailForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"vettedPrimaryEmail"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setVerifiedPrimaryEmail:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"vettedPrimaryEmail"];
}

- (BOOL)phoneAsAppleIDForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"phoneAsAppleID"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setPhoneAsAppleID:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"phoneAsAppleID"];
}

- (BOOL)userUnderAgeForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"isUnderage"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setUserUnderage:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isUnderage"];
}

- (BOOL)isSiwaEnabledForChildAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"isSiwaEnabled"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setIsSiwaEnabled:(BOOL)a3 forChildAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isSiwaEnabled"];
}

- (BOOL)userIsSeniorForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"isSenior"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setUserAgeRange:(unint64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setAccountProperty:v6 forKey:@"userAgeRange"];
}

- (unint64_t)userAgeRangeForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"userAgeRange"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setUserIsSenior:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isSenior"];
}

- (BOOL)demoAccountForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"demoAccount"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setDemoAccount:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"demoAccount"];
}

- (id)ageOfMajorityForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"ageOfMajority"];

  return v4;
}

- (void)setAgeOfMajority:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"ageOfMajority"];
}

- (id)appleIDCountryCodeForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"appleIDCountryCode"];

  return v4;
}

- (void)setAppleIDCountryCode:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"appleIDCountryCode"];
}

- (BOOL)authorizationUsedForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"appleIdSignInEnabled"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setAuthorizationUsed:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"appleIdSignInEnabled"];
}

- (BOOL)privateAttestationEnabledForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"privateAttestationEnabled"];
  id v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)setPrivateAttestationEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"privateAttestationEnabled"];
}

- (BOOL)isProximityAuthEligible:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"isProximityAuthEligible"];
  id v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setIsProximityAuthEligible:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isProximityAuthEligible"];
}

- (BOOL)piggybackingApprovalEligible:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"pbae"];
  id v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setPiggybackingApprovalEligible:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"pbae"];
}

- (id)reachableEmailAddressesForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"reachableEmailAddresses"];

  return v4;
}

- (void)setReachableEmailAddresses:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"reachableEmailAddresses"];
}

- (id)givenNameForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"firstName"];

  return v4;
}

- (void)setGivenName:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"firstName"];
}

- (id)familyNameForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"lastName"];

  return v4;
}

- (void)setFamilyName:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"lastName"];
}

- (id)forwardingEmailForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"forwardingEmail"];

  return v4;
}

- (void)setForwardingEmail:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"forwardingEmail"];
}

- (BOOL)selectedPrivateEmailForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"privateEmailSelection"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setSelectedPrivateEmail:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"privateEmailSelection"];
}

- (id)selectedAuthorizationEmailForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"authorizationEmailSelection"];

  return v4;
}

- (void)setSelectedAuthorizationEmail:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"authorizationEmailSelection"];
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  BOOL v7 = [(AKAccountManager *)self _saveAccount:v6 error:&v12];
  id v8 = v12;
  if ([(AKAccountStore *)self->_accountStore isAccountDaemonConnectionError:v8])
  {
    char v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "First attempt saving account %@ failed, retrying once...", buf, 0xCu);
    }

    id v11 = 0;
    BOOL v7 = [(AKAccountManager *)self _saveAccount:v6 error:&v11];
    id v8 = v11;
  }
  if (a4 && v8) {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)_saveAccount:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__6;
  uint64_t v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  BOOL v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Saving account %@...", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__AKAccountManager__saveAccount_error___block_invoke;
  v12[3] = &unk_1E5760BC0;
  id v14 = &v22;
  v12[4] = self;
  id v13 = v6;
  uint64_t v15 = &v16;
  +[AKAccountManager performWithinPersonaForAccount:v13 withBlock:v12];

  if (*((unsigned char *)v23 + 24))
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Saving of account %@ succeeed!", buf, 0xCu);
    }
  }
  else
  {
    char v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager _saveAccount:error:]();
    }

    if (a4) {
      *a4 = (id) v17[5];
    }
  }
  BOOL v10 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __39__AKAccountManager__saveAccount_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 saveVerifiedAccount:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (void)setSecurityLevel:(unint64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setAccountProperty:v6 forKey:@"security-level"];
}

- (void)setCredentialStorageOption:(unint64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setAccountProperty:v6 forKey:@"CredentialStorageLocation"];
}

- (BOOL)mdmInformationRequiredForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"mdm-info-required"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (void)setMDMInformationRequired:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"mdm-info-required"];
}

- (void)setDeviceRemovalReason:(int64_t)a3 onAccount:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 username];
    int v11 = 134218242;
    int64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "AKAccountManager setDeviceRemovalReason:%ld onAccount:%@", (uint8_t *)&v11, 0x16u);
  }
  if ([(AKAccountManager *)self deviceRemovalReasonForAccount:v6] == -1)
  {
    BOOL v10 = [NSNumber numberWithInteger:a3];
    [v6 setAccountProperty:v10 forKey:@"AKRemoteDeviceRemovalReasonKey"];
  }
  else
  {
    char v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager setDeviceRemovalReason:onAccount:]();
    }
  }
}

- (void)clearDeviceRemovalReasonFromAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "AKAccountManager clearDeviceRemovalReasonFromAccount", v5, 2u);
  }

  [v3 setAccountProperty:&unk_1EE43E908 forKey:@"AKRemoteDeviceRemovalReasonKey"];
}

- (int64_t)deviceRemovalReasonForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"AKRemoteDeviceRemovalReasonKey"];
  if (v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    int64_t v7 = [v6 integerValue];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (BOOL)shouldPerformSatoriWarmupVerificationForAccount:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 accountPropertyForKey:@"WarmUpVerificationTimeStamp"];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    int64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [NSNumber numberWithDouble:v6];
      int v11 = 138412290;
      int64_t v12 = v8;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Last Satori warmup occured %@ seconds ago", (uint8_t *)&v11, 0xCu);
    }
    BOOL v9 = v6 >= 3600.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)updateSatoriWarmUpTimestampForAccount:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setAccountProperty:v5 forKey:@"WarmUpVerificationTimeStamp"];

  [(AKAccountManager *)self saveAccount:v4 error:0];
}

- (BOOL)needsRepairForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"repair-state"];
  BOOL v5 = [v4 integerValue] > 1;

  return v5;
}

- (unint64_t)repairStateForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"repair-state"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setRepairState:(unint64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setAccountProperty:v6 forKey:@"repair-state"];
}

- (id)webAccessEnabledForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"webAccessEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setWebAccessEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  double v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"webAccessEnabled"];
}

- (id)serverExperimentalFeaturesForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"serverExperimentalFeatures"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setServerExperimentalFeatures:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"serverExperimentalFeatures"];
}

- (id)markedForSignOutForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"markedForSignOut"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setMarkedForSignOut:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"markedForSignOut"];
}

- (id)hasSOSActiveDeviceForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[AKConfiguration sharedConfiguration];
  uint64_t v5 = [v4 forceHasSOSActiveDevice];

  if (v5)
  {
    id v6 = &unk_1EE43E938;
    if (v5 == -1) {
      id v6 = &unk_1EE43E920;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [v3 accountPropertyForKey:@"SOSCompatibilityOptInNeeded"];
  }
  id v8 = v7;

  return v8;
}

- (void)setHasSOSActiveDevice:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"SOSCompatibilityOptInNeeded"];
}

- (id)isSOSNeededForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[AKConfiguration sharedConfiguration];
  uint64_t v5 = [v4 forceSOSNeeded];

  if (v5)
  {
    id v6 = &unk_1EE43E938;
    if (v5 == -1) {
      id v6 = &unk_1EE43E920;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [v3 accountPropertyForKey:@"SOSNeeded"];
  }
  id v8 = v7;

  return v8;
}

- (void)setSOSNeeded:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"SOSNeeded"];
}

- (id)hasModernRecoveryKeyForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"hasRK"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setHasModernRecoveryKey:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"hasRK"];
}

- (id)get3PRegulatoryOverride:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"3PRegulatoryOverride"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)set3PRegulatoryOverride:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"3PRegulatoryOverride"];
}

- (id)adpCohortForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"adpCh"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)edpStateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"edps"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)edpStateValueForAccount:(id)a3
{
  id v3 = [(AKAccountManager *)self edpStateForAccount:a3];
  id v4 = v3;
  if (!v3)
  {
LABEL_10:
    unint64_t v5 = 0;
    goto LABEL_11;
  }
  if (![v3 unsignedIntegerValue])
  {
    unint64_t v5 = 2;
    goto LABEL_11;
  }
  if ([v4 unsignedIntegerValue] != 1 && objc_msgSend(v4, "unsignedIntegerValue") != 2)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager edpStateValueForAccount:]();
    }

    goto LABEL_10;
  }
  unint64_t v5 = 1;
LABEL_11:

  return v5;
}

- (id)passwordVersionForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"pv"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)srpProtocolForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"sp"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)idmsEDPTokenIdForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"edpTokenId"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)hearbeatTokenForAccount:(id)a3
{
  return [(AKAccountManager *)self hearbeatTokenForAccount:a3 error:0];
}

- (id)continuationTokenForAccount:(id)a3
{
  return [(AKAccountManager *)self continuationTokenForAccount:a3 error:0];
}

- (id)passwordResetTokenForAccount:(id)a3
{
  return [(AKAccountManager *)self passwordResetTokenForAccount:a3 error:0];
}

- (id)passwordResetTokenBackupForAccount:(id)a3
{
  return [(AKAccountManager *)self passwordResetTokenBackupForAccount:a3 error:0];
}

- (id)hearbeatTokenForAccount:(id)a3 error:(id *)a4
{
  return [(AKAccountManager *)self _tokenWithName:*MEMORY[0x1E4F17918] forAccount:a3 error:a4];
}

- (id)continuationTokenForAccount:(id)a3 error:(id *)a4
{
  return [(AKAccountManager *)self _tokenWithName:*MEMORY[0x1E4F178A8] forAccount:a3 error:a4];
}

- (id)passwordResetTokenForAccount:(id)a3 error:(id *)a4
{
  return [(AKAccountManager *)self _tokenWithName:*MEMORY[0x1E4F17940] forAccount:a3 error:a4];
}

- (id)passwordResetTokenBackupForAccount:(id)a3 error:(id *)a4
{
  return [(AKAccountManager *)self _tokenWithName:*MEMORY[0x1E4F17938] forAccount:a3 error:a4];
}

- (id)allTokensForAccount:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v20 = 0;
  id v6 = [v4 credentialWithError:&v20];
  id v7 = v20;
  [v6 keysForCredentialItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v6 credentialItemForKey:v12];
        if ([v13 length]) {
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  id v14 = (void *)[v5 copy];

  return v14;
}

- (id)buildCredentialWithTokens:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v11 = [v3 objectForKeyedSubscript:v10];
        [v4 setCredentialItem:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)masterTokenForAccount:(id)a3
{
  id v3 = [(AKAccountManager *)self _tokenWithName:*MEMORY[0x1E4F17990] forAccount:a3 error:0];
  if (v3)
  {
    id v4 = +[AKMasterToken tokenWithExternalizedVersionString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)settingsServiceTokenForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self store];
  uint64_t v6 = [v5 credentialForAccount:v4 serviceID:@"com.apple.gs.appleid.auth"];

  uint64_t v7 = [v6 token];

  return v7;
}

- (id)dependentAuthTokenForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self store];
  uint64_t v6 = [v5 credentialForAccount:v4 serviceID:@"com.apple.gs.idms.dependent.auth"];

  uint64_t v7 = [v6 token];

  return v7;
}

- (void)removeMasterTokenForAccount:(id)a3
{
}

- (id)tokenCreationDateWithIdentifier:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:]();
  }

  if (v9)
  {
    int v11 = [(AKAccountManager *)self _creationKeyForTokenWithName:v8];
    if (v11)
    {
      uint64_t v12 = [(AKAccountManager *)self _tokenWithName:v11 forAccount:v9 error:a5];
      long long v13 = v12;
      if (v12)
      {
        [v12 doubleValue];
        long long v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v14 / 1000.0];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      long long v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:]();
      }
    }
    long long v15 = 0;
    goto LABEL_14;
  }
  long long v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[AKAccountManager tokenCreationDateWithIdentifier:forAccount:error:]();
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7022);
    long long v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v15 = 0;
  }
LABEL_15:

  return v15;
}

- (void)setToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [v16 stringValue];
  [v12 setCredentialItem:v13 forKey:v10];

  double v14 = +[AKFeatureManager sharedManager];
  int v15 = [v14 isTokenCreationTimeEnabled];

  if (v15)
  {
    [(AKAccountManager *)self _setTokenCreationTimeForToken:v16 tokenID:v10 account:v11 credential:v12];
    [v11 setCredential:v12];
  }
}

- (void)_setTokenCreationTimeForToken:(id)a3 tokenID:(id)a4 account:(id)a5 credential:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = +[AKFeatureManager sharedManager];
  char v15 = [v14 isTokenCreationTimeEnabled];

  if (v15)
  {
    if (v13)
    {
      id v16 = [(AKAccountManager *)self _creationKeyForTokenWithName:v11];
      if (!v16)
      {
        long long v17 = _AKLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:]();
        }
        goto LABEL_20;
      }
      if (v10)
      {
        long long v17 = [(AKAccountManager *)self tokenCreationDateWithIdentifier:v11 forAccount:v12 error:0];
        uint64_t v18 = [v10 creationDate];
        long long v19 = v18;
        if (v18)
        {
          if (v17 && [v18 compare:v17] != 1)
          {
            long long v23 = _AKLogSystem();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:]();
            }
          }
          else
          {
            id v20 = [v10 creationDate];
            [v20 timeIntervalSince1970];
            double v22 = v21;

            long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"%f", v22 * 1000.0);
            [v13 setCredentialItem:v23 forKey:v16];
          }
        }
LABEL_20:

        goto LABEL_21;
      }
      [v13 setCredentialItem:0 forKey:v16];
    }
    else
    {
      id v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:]();
      }
    }
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager _setTokenCreationTimeForToken:tokenID:account:credential:].cold.4();
    }
  }
LABEL_21:
}

- (id)_creationKeyForTokenWithName:(id)a3
{
  id v3 = a3;
  if ((id)*MEMORY[0x1E4F178A8] == v3)
  {
    id v4 = @"continuation-key-creation";
  }
  else if ((id)*MEMORY[0x1E4F17940] == v3)
  {
    id v4 = @"password-reset-token-creation";
  }
  else if ((id)*MEMORY[0x1E4F17918] == v3)
  {
    id v4 = @"heartbeat-token-creation";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_tokenWithName:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__6;
    v46 = __Block_byref_object_dispose__6;
    id v47 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__6;
    v40 = __Block_byref_object_dispose__6;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__6;
    v34 = __Block_byref_object_dispose__6;
    id v35 = 0;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    double v22 = __52__AKAccountManager__tokenWithName_forAccount_error___block_invoke;
    long long v23 = &unk_1E5760BE8;
    id v27 = &v36;
    uint64_t v24 = self;
    id v11 = v9;
    id v25 = v11;
    uint64_t v28 = &v42;
    v29 = &v30;
    id v12 = v8;
    id v26 = v12;
    +[AKAccountManager performWithinPersonaForAccount:v11 withBlock:&v20];
    if (v37[5])
    {
      if (v31[5])
      {
LABEL_14:
        uint64_t v18 = (void *)v43[5];
        if (v18)
        {
          if (a5)
          {
            *a5 = v18;
            uint64_t v18 = (void *)v43[5];
          }
          -[AKAccountManager _reportTokenWithName:forAccount:error:](self, "_reportTokenWithName:forAccount:error:", v12, v11, v18, v20, v21, v22, v23, v24, v25);
        }
        id v17 = (id)v31[5];

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(&v42, 8);
        goto LABEL_19;
      }
      id v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v37[5];
        *(_DWORD *)buf = 138412802;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v11;
        __int16 v52 = 2112;
        uint64_t v53 = v14;
        _os_log_error_impl(&dword_193494000, v13, OS_LOG_TYPE_ERROR, "AuthKit %@ token is missing! Account: %@. Credential: %@.", buf, 0x20u);
      }
    }
    else
    {
      id v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AKAccountManager _tokenWithName:forAccount:error:]();
      }
    }

    goto LABEL_14;
  }
  char v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AKAccountManager _tokenWithName:forAccount:error:]();
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7022);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v16;
    [(AKAccountManager *)self _reportTokenWithName:v8 forAccount:0 error:v16];
  }
  id v17 = 0;
LABEL_19:

  return v17;
}

void __52__AKAccountManager__tokenWithName_forAccount_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 credentialForAccount:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(*(void *)(a1[7] + 8) + 40) credentialItemForKey:a1[6]];
  uint64_t v9 = *(void *)(a1[9] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_reportTokenWithName:(id)a3 forAccount:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((id)*MEMORY[0x1E4F178A8] == v8)
  {
    id v12 = kAKAnalyticsEventContinuationTokenFetch;
LABEL_9:
    id v11 = *v12;
    [(AKAccountManager *)self _reportTokenWithTelemetryID:v11 account:v9 telemetryFlowID:0 error:v10];
    goto LABEL_10;
  }
  if ((id)*MEMORY[0x1E4F17940] == v8)
  {
    id v12 = kAKAnalyticsEventPasswordResetTokenFetch;
    goto LABEL_9;
  }
  if ((id)*MEMORY[0x1E4F17918] == v8)
  {
    id v12 = kAKAnalyticsEventHeartbeatTokenFetch;
    goto LABEL_9;
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountManager _reportTokenWithName:forAccount:error:]();
  }
LABEL_10:
}

- (ACAccountType)authKitAccountType
{
  return (ACAccountType *)[(AKAccountManager *)self authKitAccountTypeWithError:0];
}

- (id)accountEligibleForUpdate
{
  id v3 = [(AKAccountManager *)self _serviceTypesForSecurityUpgrade];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6;
  uint64_t v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AKAccountManager_accountEligibleForUpdate__block_invoke;
  v9[3] = &unk_1E5760C38;
  v9[4] = self;
  v9[5] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "No account is eligible for security upgrade.", v8, 2u);
    }

    uint64_t v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __44__AKAccountManager_accountEligibleForUpdate__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) _serviceTypeForServiceNameString:v6];
  id v8 = [*(id *)(a1 + 32) accountsUsingService:v7];
  id v9 = [v8 allObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__AKAccountManager_accountEligibleForUpdate__block_invoke_2;
  v12[3] = &unk_1E5760C10;
  v12[4] = *(void *)(a1 + 32);
  void v12[5] = v7;
  uint64_t v10 = objc_msgSend(v9, "aaf_firstObjectPassingTest:", v12);

  if (v10)
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Account of service type \"%@\" is eligible for security upgrade.", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    *a4 = 1;
  }
}

uint64_t __44__AKAccountManager_accountEligibleForUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isAccountEligibleForSecurityUpgrade:a2 ofServiceType:*(void *)(a1 + 40)];
}

- (id)_serviceTypesForSecurityUpgrade
{
  id v3 = +[AKURLBag bagForAltDSID:0];
  uint64_t v4 = [v3 securityUpgradeServiceNames];

  if (![v4 count])
  {
    uint64_t v5 = [(AKAccountManager *)self _defaultSecurityUpgradeServiceNames];

    uint64_t v4 = (void *)v5;
  }

  return v4;
}

- (id)_defaultSecurityUpgradeServiceNames
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"itunesstore";
  v4[1] = @"icloud";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (int64_t)_serviceTypeForServiceNameString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"itunesstore"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"icloud"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"imessage"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"facetime"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"gamecenter"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_accountTypeForServiceType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = (void *)MEMORY[0x1E4F17748];
      goto LABEL_9;
    case 2:
      id v3 = (void *)MEMORY[0x1E4F17888];
      goto LABEL_9;
    case 4:
    case 5:
      id v3 = (void *)MEMORY[0x1E4F17800];
      goto LABEL_9;
    case 6:
      id v3 = (void *)MEMORY[0x1E4F177B0];
LABEL_9:
      uint64_t v5 = [(AKAccountManager *)self accountTypeForTypeIdentifier:*v3];
      break;
    default:
      int64_t v4 = _AKLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Servicetype is not supported.", v7, 2u);
      }

      uint64_t v5 = 0;
      break;
  }

  return v5;
}

- (BOOL)_isAccountEligibleForSecurityUpgrade:(id)a3 ofServiceType:(int64_t)a4
{
  id v6 = a3;
  if ([(AKAccountManager *)self securityLevelForAccount:v6] != 2)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager _isAccountEligibleForSecurityUpgrade:ofServiceType:]();
    }
    goto LABEL_8;
  }
  uint64_t v7 = [(AKAccountManager *)self _matchingServiceAccountForAuthKitAccount:v6 service:a4];

  if (!v7)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager _isAccountEligibleForSecurityUpgrade:ofServiceType:]((uint64_t)v6, a4);
    }
LABEL_8:

    BOOL v8 = 0;
    goto LABEL_9;
  }
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)removeAllPasswordResetTokens
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AKAccountManager *)self allAuthKitAccountsWithError:0];
  int64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    double v22 = v5;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Found %@ IDMS accounts for which PRK might need to be cleared.", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x1E4F17940];
    uint64_t v9 = *MEMORY[0x1E4F17938];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        v19[0] = v8;
        v19[1] = v9;
        v19[2] = @"password-reset-token-creation";
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
        [(AKAccountManager *)self _removeTokenForKeys:v12 forAccount:v11];

        id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7080);
        [(AKAccountManager *)self _reportTokenWithTelemetryID:@"com.apple.authkit.token.prk.delete" account:v11 telemetryFlowID:0 error:v13];

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)removeContinuationTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "%@: Attempting to remove continuation key for account (%@)", buf, 0x16u);
  }

  v13[0] = *MEMORY[0x1E4F178A8];
  v13[1] = @"continuation-key-creation";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [(AKAccountManager *)self _removeTokenForKeys:v12 forAccount:v8];

  [(AKAccountManager *)self _triggerSilentTTRFor:1];
  [(AKAccountManager *)self _reportTokenWithTelemetryID:@"com.apple.authkit.token.ck.delete" account:v8 telemetryFlowID:v10 error:v9];
}

- (id)_credentialForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  int64_t v4 = [v3 credentialWithError:&v6];

  return v4;
}

- (void)removePasswordResetTokenForAccount:(id)a3 telemetryFlowID:(id)a4 error:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "%@: Attempting to remove PRK for account (%@)", buf, 0x16u);
  }

  v13[0] = *MEMORY[0x1E4F17940];
  v13[1] = @"password-reset-token-creation";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [(AKAccountManager *)self _removeTokenForKeys:v12 forAccount:v8];

  [(AKAccountManager *)self _reportTokenWithTelemetryID:@"com.apple.authkit.token.prk.delete" account:v8 telemetryFlowID:v10 error:v9];
}

- (void)_removeTokenKey:(id)a3 forAccount:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v9[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(AKAccountManager *)self _removeTokenForKeys:v8 forAccount:v7];
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager _removeTokenKey:forAccount:]();
    }
  }
}

- (void)_removeTokenForKeys:(id)a3 forAccount:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  id v34 = 0;
  id v28 = 0;
  uint64_t v8 = [v7 credentialWithError:&v28];
  id v9 = v28;
  id v10 = (void *)v30[5];
  v30[5] = v8;

  if (v30[5])
  {
    uint64_t v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Clearing %{public}@ for account %@...", buf, 0x16u);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          [(id)v30[5] setCredentialItem:0 forKey:*(void *)(*((void *)&v24 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v35 count:16];
      }
      while (v13);
    }

    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __51__AKAccountManager__removeTokenForKeys_forAccount___block_invoke;
    uint64_t v21 = &unk_1E5760C60;
    __int16 v16 = v7;
    double v22 = v16;
    uint64_t v23 = &v29;
    +[AKAccountManager performWithinPersonaForAccount:v16 withBlock:&v18];
    -[AKAccountManager saveAccount:error:](self, "saveAccount:error:", v16, 0, v18, v19, v20, v21);
    id v17 = v22;
  }
  else
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v7;
      _os_log_impl(&dword_193494000, v17, OS_LOG_TYPE_DEFAULT, "Nil credential for account %@. Odd, but no clearing is necessary.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __51__AKAccountManager__removeTokenForKeys_forAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCredential:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)_triggerSilentTTRFor:(unint64_t)a3
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountManager _triggerSilentTTRFor:]();
  }
}

- (void)_reportTokenWithTelemetryID:(id)a3 account:(id)a4 telemetryFlowID:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:]();
  }

  uint64_t v15 = +[AKURLBag bagForAltDSID:0];
  uint64_t v16 = [v15 IDMSEnvironment];

  if (v16)
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:]();
    }
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F46FC8], "ak_analyticsEventWithEventName:account:error:", v10, v11, v13);
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AKAccountManager securityLevelForAccount:](self, "securityLevelForAccount:", v11));
    [v17 setObject:v18 forKeyedSubscript:@"securityLevel"];

    if (v12) {
      [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F47030]];
    }
    if ([@"com.apple.authkit.token.ck.delete" isEqualToString:v10])
    {
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[AKAccountManager deviceRemovalReasonForAccount:](self, "deviceRemovalReasonForAccount:", v11));
      [v17 setObject:v19 forKeyedSubscript:@"deviceRemovalReason"];
    }
    uint64_t v20 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v20 sendEvent:v17];
    uint64_t v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager _reportTokenWithTelemetryID:account:telemetryFlowID:error:]();
    }
  }
}

- (void)setAccount:(id)a3 inUse:(BOOL)a4 byService:(int64_t)a5
{
  id v8 = a3;
  accountQueue = self->_accountQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AKAccountManager_setAccount_inUse_byService___block_invoke;
  block[3] = &unk_1E5760C88;
  BOOL v14 = a4;
  id v12 = v8;
  int64_t v13 = a5;
  id v10 = v8;
  dispatch_barrier_sync(accountQueue, block);
}

void __47__AKAccountManager_setAccount_inUse_byService___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountPropertyForKey:@"retaining-services"];
  id v5 = (id)[v2 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    int64_t v4 = [NSNumber numberWithInteger:v3];
    [v5 addObject:v4];
  }
  else
  {
    int64_t v4 = [NSNumber numberWithInteger:v3];
    [v5 removeObject:v4];
  }

  [*(id *)(a1 + 32) setAccountProperty:v5 forKey:@"retaining-services"];
}

- (id)servicesUsingAccount:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  accountQueue = self->_accountQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __41__AKAccountManager_servicesUsingAccount___block_invoke;
  v9[3] = &unk_1E5760CB0;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(accountQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __41__AKAccountManager_servicesUsingAccount___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accountPropertyForKey:@"retaining-services"];

  return MEMORY[0x1F41817F8]();
}

- (id)accountsUsingService:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA80] set];
  accountQueue = self->_accountQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AKAccountManager_accountsUsingService___block_invoke;
  block[3] = &unk_1E5760D00;
  id v11 = v5;
  int64_t v12 = a3;
  void block[4] = self;
  id v7 = v5;
  dispatch_sync(accountQueue, block);
  id v8 = (void *)[v7 copy];

  return v8;
}

void __41__AKAccountManager_accountsUsingService___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allAuthKitAccountsWithError:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AKAccountManager_accountsUsingService___block_invoke_2;
  v5[3] = &unk_1E5760CD8;
  id v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  uint64_t v7 = v3;
  id v6 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __41__AKAccountManager_accountsUsingService___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "servicesUsingAccount:");
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  int v5 = [v3 containsObject:v4];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)activeServiceNamesForAccount:(id)a3
{
  uint64_t v3 = [(AKAccountManager *)self servicesUsingAccount:a3];
  id v4 = [v3 allObjects];

  int v5 = objc_msgSend(v4, "aaf_map:", &__block_literal_global_219);

  return v5;
}

id __49__AKAccountManager_activeServiceNamesForAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];

  return +[AKAccountManager stringRepresentationForService:v2];
}

+ (id)stringRepresentationForService:(int64_t)a3
{
  uint64_t v3 = @"piggybacking";
  switch(a3)
  {
    case 1:
      id v4 = AKServiceNameiCloud;
      goto LABEL_8;
    case 2:
      id v4 = AKServiceNameiTunesStore;
      goto LABEL_8;
    case 4:
      id v4 = AKServiceNameiMessage;
      goto LABEL_8;
    case 5:
      id v4 = AKServiceNameFaceTime;
      goto LABEL_8;
    case 6:
      id v4 = AKServiceNameGameCenter;
LABEL_8:
      uint64_t v3 = *v4;
      break;
    case 7:
      break;
    default:
      uint64_t v3 = 0;
      break;
  }

  return v3;
}

- (BOOL)hasPrimaryiCloudAccountForAppleID:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(AKAccountManager *)self iCloudAccountForAppleID:a3];
  LOBYTE(v3) = [(AKAccountManager *)v3 isPrimaryiCloudAccount:v4];

  return (char)v3;
}

- (BOOL)hasPrimaryiCloudAccountForAltDSID:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(AKAccountManager *)self iCloudAccountForAltDSID:a3];
  LOBYTE(v3) = [(AKAccountManager *)v3 isPrimaryiCloudAccount:v4];

  return (char)v3;
}

- (BOOL)isPrimaryiCloudAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"accountClass"];
  if ([v4 isEqualToString:@"primary"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 accountPropertyForKey:@"primaryAccount"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AKAccountManager isPrimaryiCloudAccount:]();
      }

      char v5 = 0;
    }
    else
    {
      char v5 = [v6 BOOLValue];
    }
  }
  return v5;
}

- (BOOL)isPrimaryiCloudAccountEmailVerified:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"primaryEmailVerified"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager isPrimaryiCloudAccountEmailVerified:]();
    }

    char v5 = 0;
  }
  else
  {
    char v5 = [v4 BOOLValue];
  }

  return v5;
}

- (id)transportableAuthKitAccount:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 copy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v4 setAccountProperty:v5 forKey:@"retaining-services"];

  [v4 setAccountProperty:0 forKey:@"telemetryDeviceSessionID"];

  return v4;
}

- (id)_aliasesForiCloudAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"appleIdAliases"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager _aliasesForiCloudAccount:]();
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (BOOL)isFulliCloudAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"accountClass"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 isEqualToString:@"full"];
  return v6;
}

- (id)_altDSIDForiCloudAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"altDSID"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKAccountManager _altDSIDForiCloudAccount:]();
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (ACAccountType)appleIDAccountType
{
  appleIDAccountType = self->_appleIDAccountType;
  if (!appleIDAccountType)
  {
    os_unfair_lock_lock(&self->_appleIDAccountTypeLock);
    if (!self->_appleIDAccountType)
    {
      accountStore = self->_accountStore;
      uint64_t v5 = *MEMORY[0x1E4F17768];
      id v10 = 0;
      char v6 = [(AKAccountStore *)accountStore accountTypeWithAccountTypeIdentifier:v5 error:&v10];
      id v7 = v10;
      id v8 = self->_appleIDAccountType;
      self->_appleIDAccountType = v6;
    }
    os_unfair_lock_unlock(&self->_appleIDAccountTypeLock);
    appleIDAccountType = self->_appleIDAccountType;
  }

  return appleIDAccountType;
}

- (id)accountTypeForTypeIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_accountTypeCache objectForKey:v4];
    if (!v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke;
      v7[3] = &unk_1E5760D70;
      v7[4] = self;
      id v8 = v4;
      os_unfair_lock_lock(&self->_accountTypeCacheLock);
      uint64_t v5 = __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke((uint64_t)v7);
      os_unfair_lock_unlock(&self->_accountTypeCacheLock);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __49__AKAccountManager_accountTypeForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = 0;
  id v4 = [v3 accountTypeWithAccountTypeIdentifier:v2 error:&v7];
  id v5 = v7;
  [*(id *)(*(void *)(a1 + 32) + 96) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  return v4;
}

- (id)additionalInfoForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"additionalInfo"];

  return v4;
}

- (void)setAdditionalInfo:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"additionalInfo"];
}

- (id)trustedPhoneNumbersForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"trustedPhoneNumbers"];

  return v4;
}

- (void)setTrustedPhoneNumbers:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"trustedPhoneNumbers"];
}

- (id)securityKeysForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"securityKeys"];

  return v4;
}

- (void)setSecurityKeys:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"securityKeys"];
}

- (id)loginHandlesForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"loginHandles"];

  return v4;
}

- (void)setLoginHandles:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"loginHandles"];
}

- (void)_removeAllRawPasswordCaches
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(AKAccountManager *)self _iCloudAccounts];
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Found %@ iCloud accounts for which password cache might need to be cleared.", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[AKAccountManager _clearRawPasswordForAccount:](self, "_clearRawPasswordForAccount:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_clearRawPasswordForAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  id v4 = [v3 credentialWithError:&v9];
  id v5 = v9;
  uint64_t v6 = *MEMORY[0x1E4F17968];
  uint64_t v7 = [v4 credentialItemForKey:*MEMORY[0x1E4F17968]];

  if (v7)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Found a cached raw password for %@... removing...", buf, 0xCu);
    }

    [v4 setCredentialItem:0 forKey:v6];
  }
}

- (void)setNextLivenessNonce:(id)a3 nonce:(id)a4
{
}

- (id)nextLivenessNonce:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"nextLivenessNonce"];

  return v4;
}

- (void)setDCRTRenewalAttempted:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithBool:v4];
  [v6 setAccountProperty:v7 forKey:@"dcrtRenewalAttempted"];
}

- (BOOL)dcrtRenewalAttempted:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"dcrtRenewalAttempted"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)authKitAccountWithAppleID:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7022);
      long long v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v10 = 0;
    }
    goto LABEL_23;
  }
  id v27 = 0;
  id v7 = [(AKAccountManager *)self allAuthKitAccountsWithError:&v27];
  id v8 = v27;
  id v9 = v8;
  if (v8)
  {
    if (!a4) {
      goto LABEL_17;
    }
    long long v10 = 0;
    *a4 = v8;
    goto LABEL_22;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v24;
  double v22 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      uint64_t v16 = [v10 username];
      int v17 = [v16 isEqual:v6];

      if (v17)
      {
        id v19 = v10;
LABEL_21:

        id v7 = v22;
        goto LABEL_22;
      }
      uint64_t v18 = [(AKAccountManager *)self aliasesForAccount:v10];
      if ([v18 containsObject:v6])
      {
        id v20 = v10;

        goto LABEL_21;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    id v7 = v22;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_16:

LABEL_17:
  long long v10 = 0;
LABEL_22:

LABEL_23:

  return v10;
}

- (id)allAuthKitAccounts
{
  id v3 = [(AKAccountManager *)self authKitAccountType];
  BOOL v4 = [(AKAccountManager *)self _fetchAllAccountsWithType:v3 error:0];

  return v4;
}

- (id)authKitAccountWithDSID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AKAccountManager *)self allAuthKitAccountsWithError:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "accountPropertyForKey:", @"DSID", (void)v15);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)authKitAccountWithAppleID:(id)a3
{
  return [(AKAccountManager *)self authKitAccountWithAppleID:a3 error:0];
}

- (id)appleIDAccountWithAltDSID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AKAccountManager *)self appleIDAccountType];
  uint64_t v6 = [(AKAccountManager *)self _fetchAllAccountsWithType:v5 error:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "accountPropertyForKey:", @"altDSID", (void)v19);
        char v14 = [v13 isEqual:v4];

        if ((v14 & 1) == 0)
        {
          long long v15 = [v12 accountPropertyForKey:@"adsid"];
          char v16 = [v15 isEqual:v4];

          if ((v16 & 1) == 0) {
            continue;
          }
        }
        id v17 = v12;
        goto LABEL_13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v17 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_13:

  return v17;
}

- (id)appleIDAccountWithAppleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AKAccountManager *)self appleIDAccountType];
  uint64_t v6 = [(AKAccountManager *)self _fetchAllAccountsWithType:v5 error:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "username", (void)v15);
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_matchingServiceAccountForAuthKitAccount:(id)a3 service:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AKAccountManager *)self _accountTypeForServiceType:a4];
  if (v7)
  {
    id v8 = [(AKAccountManager *)self _fetchAllAccountsWithType:v7 error:0];
    if ([v8 count])
    {
      uint64_t v9 = [(AKAccountManager *)self altDSIDForAccount:v6];
      uint64_t v10 = [v6 username];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__AKAccountManager__matchingServiceAccountForAuthKitAccount_service___block_invoke;
      v15[3] = &unk_1E5760D98;
      id v16 = v9;
      long long v17 = self;
      id v18 = v10;
      id v11 = v10;
      id v12 = v9;
      char v13 = objc_msgSend(v8, "aaf_firstObjectPassingTest:", v15);
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

uint64_t __69__AKAccountManager__matchingServiceAccountForAuthKitAccount_service___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) altDSIDForAccount:v3];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    id v8 = [v3 username];
    uint64_t v6 = [v7 isEqualToString:v8];
  }
  return v6;
}

- (id)mostRecentlyUsedAuthKitAccount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AKAccountManager *)self allAuthKitAccountsWithError:0];
  id v3 = [v2 firstObject];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v3, "creationDate", (void)v15);
        id v11 = [v9 creationDate];
        uint64_t v12 = [v10 compare:v11];

        if (v12 == -1)
        {
          id v13 = v9;

          id v3 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)iCloudAccountForAppleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AKAccountManager *)self _iCloudAccounts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "username", (void)v16);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v14 = v10;
          goto LABEL_14;
        }
        id v13 = [(AKAccountManager *)self _aliasesForiCloudAccount:v10];
        if ([v13 containsObject:v4])
        {
          id v14 = v10;

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)iCloudAccountForAltDSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AKAccountManager *)self _iCloudAccounts];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = -[AKAccountManager _altDSIDForiCloudAccount:](self, "_altDSIDForiCloudAccount:", v10, (void)v14);
        if ([v11 isEqual:v4])
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (unint64_t)authenticationModeForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"auth-mode"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setAuthenticationMode:(unint64_t)a3 forAccount:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setAccountProperty:v7 forKey:@"auth-mode"];

  [(AKAccountManager *)self updateAuthModeTimestampForAccount:v6];
}

- (BOOL)shouldUpdateAuthModeForAccount:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 accountPropertyForKey:@"AuthModeTimeStamp"];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [NSNumber numberWithDouble:v6];
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Last Authentication mode fetch occured %@ seconds ago", (uint8_t *)&v11, 0xCu);
    }
    BOOL v9 = v6 >= 86400.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)updateAuthModeTimestampForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setAccountProperty:v4 forKey:@"AuthModeTimeStamp"];
}

- (BOOL)isManagedAppleIDForAccount:(id)a3
{
  return [(AKAccountManager *)self securityLevelForAccount:a3] == 5;
}

- (unint64_t)managedOrganizationTypeForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"managedOrganizationType"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setManagedOrganizationType:(unint64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  double v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setAccountProperty:v6 forKey:@"managedOrganizationType"];
}

- (id)managedOrganizationNameForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"managedOrganizationName"];

  return v4;
}

- (void)setManagedOrganizationName:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"managedOrganizationName"];
}

- (BOOL)isNotificationEmailAvailableForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"isNotificationEmailAvailable"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setIsNotificationEmailAvailable:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isNotificationEmailAvailable"];
}

- (id)notificationEmailForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"notificationEmail"];

  return v4;
}

- (void)setNotificationEmail:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"notificationEmail"];
}

- (BOOL)canBeCustodianForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"canBeCustodian"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCanBeCustodian:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"canBeCustodian"];
}

- (BOOL)canHaveCustodianForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"canHaveCustodian"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCanHaveCustodian:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"canHaveCustodian"];
}

- (BOOL)custodianEnabledForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"custodianEnabled"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCustodianEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"custodianEnabled"];
}

- (id)custodianListVersionForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"custodianListVersion"];

  return v4;
}

- (void)setCustodianListVersion:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"custodianListVersion"];
}

- (id)custodianLastModifiedForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"custodianLastModified"];

  return v4;
}

- (void)setCustodianLastModified:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"custodianLastModified"];
}

- (id)custodianInfosForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"custodianInfos"];

  return v4;
}

- (unint64_t)numberOfApprovedRecoveryContactsForAltDSID:(id)a3
{
  BOOL v4 = [(AKAccountManager *)self authKitAccountWithAltDSID:a3 error:0];
  id v5 = [(AKAccountManager *)self custodianInfosForAccount:v4];
  id v6 = objc_msgSend(v5, "aaf_filter:", &__block_literal_global_242);
  unint64_t v7 = [v6 count];

  return v7;
}

uint64_t __63__AKAccountManager_numberOfApprovedRecoveryContactsForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"status"];
  uint64_t v3 = [v2 isEqualToString:@"APPROVED"];

  return v3;
}

- (void)setCustodianInfos:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"custodianInfos"];
}

- (id)beneficiaryInfoForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"beneficiaryInfo"];

  return v4;
}

- (void)setBeneficiaryInfo:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"beneficiaryInfo"];
}

- (BOOL)isBeneficiaryForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"beneficiaryAccount"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"beneficiaryAccount"];
}

- (BOOL)canBeBeneficiaryForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"canBeBeneficiary"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCanBeBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"canBeBeneficiary"];
}

- (BOOL)canHaveBeneficiaryForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"canHaveBeneficiary"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setCanHaveBeneficiary:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"canHaveBeneficiary"];
}

- (id)beneficiaryListVersionForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"beneficiaryListVersion"];

  return v4;
}

- (void)setBeneficiaryListVersion:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"beneficiaryListVersion"];
}

- (id)beneficiaryLastModifiedForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"beneficiaryLastModified"];

  return v4;
}

- (void)setBeneficiaryLastModified:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"beneficiaryLastModified"];
}

- (BOOL)hasMDMForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountPropertyForKey:@"hasMDM"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setHasMDM:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"hasMDM"];
}

- (id)isSilentEscrowRecordRepairEnabledForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[AKConfiguration sharedConfiguration];
  uint64_t v6 = [v5 forceSilentEscrowRecordRepairEnabled];

  if (v6 == 1)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccount:]();
    }

    self = (AKAccountManager *)MEMORY[0x1E4F1CC38];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      unint64_t v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccount:]();
      }

      self = (AKAccountManager *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    self = [(AKAccountManager *)self _isSilentEscrowRecordRepairEnabledForAccount:v4];
  }

  return self;
}

- (id)_isSilentEscrowRecordRepairEnabledForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self additionalInfoForAccount:v4];
  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"silentEscrowRecordRepairEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)setSilentEscrowRecordRepairEnabled:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKAccountManager *)self additionalInfoForAccount:v7];
  BOOL v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v12 = v11;

  [v12 setObject:v6 forKeyedSubscript:@"silentEscrowRecordRepairEnabled"];
  uint64_t v13 = (void *)[v12 copy];
  [(AKAccountManager *)self setAdditionalInfo:v13 forAccount:v7];
}

- (id)isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3
{
  id v4 = a3;
  id v5 = +[AKConfiguration sharedConfiguration];
  uint64_t v6 = [v5 forceSilentEscrowRecordRepairEnabledV2];

  if (v6 == 1)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccountV2:]();
    }

    self = (AKAccountManager *)MEMORY[0x1E4F1CC38];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountManager isSilentEscrowRecordRepairEnabledForAccountV2:]();
      }

      self = (AKAccountManager *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    self = [(AKAccountManager *)self _isSilentEscrowRecordRepairEnabledForAccountV2:v4];
  }

  return self;
}

- (id)_isSilentEscrowRecordRepairEnabledForAccountV2:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self additionalInfoForAccount:v4];
  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"silentEscrowRecordRepairEnabledV2"];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKAccountManager *)self additionalInfoForAccount:v7];
  BOOL v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v12 = v11;

  [v12 setObject:v6 forKeyedSubscript:@"silentEscrowRecordRepairEnabledV2"];
  uint64_t v13 = (void *)[v12 copy];
  [(AKAccountManager *)self setAdditionalInfo:v13 forAccount:v7];
}

- (id)isSilentBurnCDPRepairEnabledForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[AKConfiguration sharedConfiguration];
  uint64_t v6 = [v5 forceSilentBurnCDPRepairEnabled];

  if (v6 == 1)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager isSilentBurnCDPRepairEnabledForAccount:]();
    }

    self = (AKAccountManager *)MEMORY[0x1E4F1CC38];
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      id v7 = _AKLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountManager isSilentBurnCDPRepairEnabledForAccount:]();
      }

      self = (AKAccountManager *)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    self = [(AKAccountManager *)self _isSilentBurnCDPRepairEnabledForAccount:v4];
  }

  return self;
}

- (id)_isSilentBurnCDPRepairEnabledForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAccountManager *)self additionalInfoForAccount:v4];
  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"silenBurnMiniBuddyEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)setSilentBurnCDPRepairEnabled:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKAccountManager *)self additionalInfoForAccount:v7];
  BOOL v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  id v12 = v11;

  [v12 setObject:v6 forKeyedSubscript:@"silenBurnMiniBuddyEnabled"];
  uint64_t v13 = (void *)[v12 copy];
  [(AKAccountManager *)self setAdditionalInfo:v13 forAccount:v7];
}

- (BOOL)isFidoForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"fidoAccount"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setFido:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"fidoAccount"];
}

- (unint64_t)signInPartitionForLivenessWithAltDSID:(id)a3
{
  BOOL v4 = [(AKAccountManager *)self iCloudAccountForAltDSID:a3];
  if (!v4) {
    goto LABEL_6;
  }
  if (![(AKAccountManager *)self isPrimaryiCloudAccount:v4])
  {
    if ([(AKAccountManager *)self isFulliCloudAccount:v4])
    {
      unint64_t v5 = 2;
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v5 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = 1;
LABEL_7:

  return v5;
}

- (BOOL)isDataSeparatedAccountForAltDSID:(id)a3
{
  id v3 = [(AKAccountManager *)self iCloudAccountForAltDSID:a3];
  BOOL v4 = v3;
  BOOL v5 = v3 && ([v3 isDataSeparatedAccount] & 1) != 0;

  return v5;
}

- (id)personaUniqueStringForAltDSID:(id)a3
{
  id v3 = [(AKAccountManager *)self iCloudAccountForAltDSID:a3];
  uint64_t v4 = *MEMORY[0x1E4F176E0];
  BOOL v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F176E0]];
  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasPersonaAvailableForAltDSID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AKAccountManager *)self iCloudAccountForAltDSID:a3];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F176E0]];
  if (v4)
  {
    BOOL v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Account has a persona id, checking for existence of persona.", buf, 2u);
    }

    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass) {
      UMUserManagerClass = getUMUserManagerClass();
    }
    id v7 = [UMUserManagerClass sharedManager];
    uint64_t v8 = [v7 listAllPersonaWithAttributes];

    BOOL v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountManager hasPersonaAvailableForAltDSID:]();
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "userPersonaUniqueString", (void)v17);
          char v15 = [v14 isEqual:v4];

          if (v15)
          {
            LOBYTE(v11) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (id)altDSIDForAuthKitAccountRequestingAuthorization
{
  id v3 = [(AKAccountManager *)self authKitAccountRequestingAuthorization];
  if (v3)
  {
    uint64_t v4 = [(AKAccountManager *)self altDSIDForAccount:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)authKitAccountRequestingAuthorization
{
  id v3 = [(AKAccountManager *)self _iCloudAccountRequestingAuthorization];
  uint64_t v4 = [(AKAccountManager *)self altDSIDForAccount:v3];

  BOOL v5 = [(AKAccountManager *)self authKitAccountWithAltDSID:v4 error:0];

  return v5;
}

- (id)_iCloudAccountRequestingAuthorization
{
  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass) {
    UMUserManagerClass = getUMUserManagerClass();
  }
  uint64_t v4 = [UMUserManagerClass sharedManager];
  BOOL v5 = [v4 currentPersona];

  int v6 = [v5 isDataSeparatedPersona];
  id v7 = _AKLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "DS:Persona requesting authorization is of Data Separated Type, we will find and give them the \"secondary\" iCloud Account.", buf, 2u);
    }

    BOOL v9 = [v5 userPersonaUniqueString];
    id v10 = [(AKAccountManager *)self _iCloudAccountFromPersonaUniqueIdentifier:v9];

    if ([(AKAccountManager *)self _shouldBlockAuthorizationForPersona:v5]) {
      id v11 = 0;
    }
    else {
      id v11 = v10;
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "DS:Supports Data Separation but persona is not Data Separated - falling back to assuming primary iCloud account is desired.", v13, 2u);
    }

    id v11 = [(AKAccountManager *)self primaryiCloudAccount];
  }

  return v11;
}

- (id)_iCloudAccountFromPersonaUniqueIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AKAccountManager *)self _iCloudAccounts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4F176E0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:", v9, (void)v16);
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_shouldBlockAuthorizationForPersona:(id)a3
{
  int v4 = [a3 isDataSeparatedPersona];
  if (v4)
  {
    id v5 = [(AKAccountManager *)self primaryiCloudAccount];
    if ([(AKAccountManager *)self isManagedAppleIDForAccount:v5])
    {
      uint64_t v6 = _AKLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[AKAccountManager _shouldBlockAuthorizationForPersona:]();
      }

      LOBYTE(v4) = 1;
    }
    else
    {

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)personaIDIfCurrentPersonaIsDataSeparated
{
  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass) {
    UMUserManagerClass = getUMUserManagerClass();
  }
  id v3 = [UMUserManagerClass sharedManager];
  int v4 = [v3 currentPersona];

  if (([v4 isEnterprisePersona] & 1) != 0 || objc_msgSend(v4, "isGuestPersona"))
  {
    id v5 = [v4 userPersonaUniqueString];
    uint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[AKAccountManager personaIDIfCurrentPersonaIsDataSeparated];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F176E0];
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [v5 objectForKeyedSubscript:v6];
  uint64_t v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl(&dword_193494000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to perform block in persona: %@", buf, 0xCu);
  }

  if (v8 && [v8 length])
  {
    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass) {
      UMUserManagerClass = getUMUserManagerClass();
    }
    id v11 = [UMUserManagerClass sharedManager];
    uint64_t v12 = [v11 currentPersona];

    id v33 = 0;
    char v13 = (void *)[v12 copyCurrentPersonaContextWithError:&v33];
    id v14 = v33;
    char v15 = [v5 identifier];
    if (!v13)
    {
      long long v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[AKAccountManager performWithinPersonaForAccount:withBlock:]();
      }
      long long v16 = v14;
      goto LABEL_22;
    }
    long long v16 = [v12 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v8];

    if (!v16) {
      goto LABEL_23;
    }
    long long v17 = [v16 domain];
    if ([v17 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v18 = [v16 code];

      if (v18 != 1) {
        goto LABEL_14;
      }
      long long v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[AKAccountManager performWithinPersonaForAccount:withBlock:]();
      }
    }

LABEL_14:
    long long v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      id v39 = v16;
      _os_log_error_impl(&dword_193494000, v19, OS_LOG_TYPE_ERROR, "Failed to set persona ID (%@) context for account %@ with error %@", buf, 0x20u);
    }
LABEL_22:

    goto LABEL_23;
  }
  char v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "No persona ID on account proceeding without setting context.", buf, 2u);
  }
  char v13 = 0;
  uint64_t v12 = 0;
  long long v16 = 0;
LABEL_23:

  long long v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = (void *)UserManagementLibraryCore();
    if (v21) {
      uint64_t v21 = getUMUserManagerClass();
    }
    long long v22 = [v21 sharedManager];
    uint64_t v23 = [v22 currentPersona];
    uint64_t v24 = [v23 userPersonaNickName];
    *(_DWORD *)buf = 138412290;
    id v35 = v24;
    _os_log_impl(&dword_193494000, v20, OS_LOG_TYPE_DEFAULT, "Performing block within persona %@", buf, 0xCu);
  }
  v7[2](v7);

  if (v12 && v13 && !v16)
  {
    long long v25 = _AKLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v25, OS_LOG_TYPE_DEFAULT, "Restoring persona for current context", buf, 2u);
    }

    id v26 = (id)[v12 restorePersonaWithSavedPersonaContext:v13];
    id v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v27, OS_LOG_TYPE_DEFAULT, "Restored persona for current context", buf, 2u);
    }
  }
  id v28 = _AKLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = (void *)UserManagementLibraryCore();
    if (v29) {
      uint64_t v29 = getUMUserManagerClass();
    }
    uint64_t v30 = [v29 sharedManager];
    uint64_t v31 = [v30 currentPersona];
    uint64_t v32 = [v31 userPersonaNickName];
    *(_DWORD *)buf = 138412290;
    id v35 = v32;
    _os_log_impl(&dword_193494000, v28, OS_LOG_TYPE_DEFAULT, "Performed block within persona %@", buf, 0xCu);
  }
}

- (void)setPasskeyEligible:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"passkeyEligible"];
}

- (id)passkeyEligibleForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passkeyEligible"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setPasskeyPresent:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"passkeyPresent"];
}

- (id)passkeyPresentForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passkeyPresent"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setPasskeysInKeychainCount:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"passkeysCount"];
}

- (id)passkeysInKeychainCountForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passkeysCount"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setPasskeyRegistrationAttemptDateForAccount:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"passkeyRegistrationAttemptDate"];
}

- (id)passkeyRegistrationAttemptDateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passkeyRegistrationAttemptDate"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setPasskeysDeletionAttemptDate:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"passkeysDeletionAttemptDate"];
}

- (id)passkeysDeletionAttemptDateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passkeysDeletionAttemptDate"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)groupKitEligibilityForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"groupkitEligibilityInd"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setGroupKitEligibility:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"groupkitEligibilityInd"];
}

- (void)setPasscodeAuthEnabled:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"passcodeAuthEnabled"];
}

- (BOOL)isPasscodeAuthEnabledForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"passcodeAuthEnabled"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (void)setPasscodeAuth:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"isPasscodeAuth"];
}

- (BOOL)isPasscodeAuthForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"isPasscodeAuth"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (void)setAskToBuy:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"askToBuy"];
}

- (BOOL)isAskToBuyForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"askToBuy"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  char v6 = [v5 BOOLValue];
  return v6;
}

- (id)deviceListVersionForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"deviceListVersion"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setDeviceListVersion:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"deviceListVersion"];
}

- (id)deletedDevicesCacheExpiryOffsetForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"deletedDevicesCacheExpiryOffset"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setDeletedDevicesCacheExpiryOffset:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"deletedDevicesCacheExpiryOffset"];
}

- (id)birthYearForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"yob"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setBirthYear:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"yob"];
}

- (void)setCanAttestAge:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"parentalAgeConsent"];
}

- (id)canAttestAgeForAccount:(id)a3
{
  id v4 = a3;
  if ([(AKAccountManager *)self userUnderAgeForAccount:v4])
  {
    objc_opt_class();
    id v5 = [v4 accountPropertyForKey:@"parentalAgeConsent"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = &unk_1EE43E938;
  }

  return v6;
}

- (void)setADPCohort:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (([v6 intValue] & 0x80000000) != 0 || (int)objc_msgSend(v6, "intValue") >= 11)
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[AKAccountManager setADPCohort:forAccount:]((uint64_t)self, v6, v8);
      }
    }
    else
    {
      [v7 setAccountProperty:v6 forKey:@"adpCh"];
    }
  }
}

- (void)setEDPState:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    [v6 setAccountProperty:v5 forKey:@"edps"];
  }
}

- (void)setPasswordVersion:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    [v6 setAccountProperty:v5 forKey:@"pv"];
  }
}

- (void)setSRPProtocol:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    [v6 setAccountProperty:v5 forKey:@"sp"];
  }
}

- (void)setIdMSEDPTokenId:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    [v6 setAccountProperty:v5 forKey:@"edpTokenId"];
  }
}

- (id)activeiCloudPrivateEmailCountForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"activeHMECount"];

  return v4;
}

- (id)inactiveiCloudPrivateEmailCountForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"inActiveHMECount"];

  return v4;
}

- (id)activeiCloudPrivateEmailCount
{
  id v3 = [(AKAccountManager *)self primaryAuthKitAccount];
  id v4 = [(AKAccountManager *)self activeiCloudPrivateEmailCountForAccount:v3];

  return v4;
}

- (id)inactiveiCloudPrivateEmailCount
{
  id v3 = [(AKAccountManager *)self primaryAuthKitAccount];
  id v4 = [(AKAccountManager *)self inactiveiCloudPrivateEmailCountForAccount:v3];

  return v4;
}

- (void)setSharingGroupLastNotificationDate:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"signInWithAppleSharingGroupLastNotificationDate"];
}

- (id)sharingGroupLastNotificationDateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"signInWithAppleSharingGroupLastNotificationDate"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setPreviousAccountInfoRefreshDate:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 setAccountProperty:v5 forKey:@"previousAccountInfoRefreshDate"];
}

- (id)previousAccountInfoRefreshDateForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 accountPropertyForKey:@"previousAccountInfoRefreshDate"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (ACAccountStore)store
{
  return &self->_accountStore->super;
}

- (void)setStore:(id)a3
{
}

- (ACAccountType)iTunesAccountType
{
  return self->_iTunesAccountType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTypeCache, 0);
  objc_storeStrong((id *)&self->_iTunesAccountType, 0);
  objc_storeStrong((id *)&self->_iCloudAccountType, 0);
  objc_storeStrong((id *)&self->_appleIDAccountType, 0);
  objc_storeStrong((id *)&self->_authKitAccountType, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)altDSIDForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught: %@", v2, v3, v4, v5, v6);
}

- (void)telemetryDeviceSessionIDForAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Attempting to fetch device session ID without an account", v2, v3, v4, v5, v6);
}

- (void)telemetryDeviceSessionIDForAccount:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Client is attempting to access session identifier without opt-in!", v2, v3, v4, v5, v6);
}

- (void)setAccountAccessTelemetryOptIn:forAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Successfully set account telemetry opt-in", v2, v3, v4, v5, v6);
}

- (void)setAccountAccessTelemetryOptIn:forAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Failed to set account telemetry opt-in", v2, v3, v4, v5, v6);
}

- (void)setAltDSID:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Will not allow nil altDSID to be set!", v2, v3, v4, v5, v6);
}

- (void)setDSID:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Will not allow nil DSID to be set!", v2, v3, v4, v5, v6);
}

- (void)setDSID:(uint64_t)a1 forAccount:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "DSID *must* be an NSNumber, but we got: %@", v5, 0xCu);
}

- (void)primaryEmailAddressForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching primary email address: %@", v2, v3, v4, v5, v6);
}

- (void)setPrimaryEmailAddress:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exeption caught when setting primery email address: %@", v2, v3, v4, v5, v6);
}

- (void)verifiedPrimaryEmailForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching primary verified email: %@", v2, v3, v4, v5, v6);
}

- (void)setVerifiedPrimaryEmail:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting primary verified email: %@", v2, v3, v4, v5, v6);
}

- (void)phoneAsAppleIDForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching phone as AppleID: %@", v2, v3, v4, v5, v6);
}

- (void)userUnderAgeForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching underage property: %@", v2, v3, v4, v5, v6);
}

- (void)setUserUnderage:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting underage property: %@", v2, v3, v4, v5, v6);
}

- (void)isSiwaEnabledForChildAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching SiwA enabled property: %@", v2, v3, v4, v5, v6);
}

- (void)setIsSiwaEnabled:forChildAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting SiwA enabled property: %@", v2, v3, v4, v5, v6);
}

- (void)userIsSeniorForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching isSenior property: %@", v2, v3, v4, v5, v6);
}

- (void)setUserAgeRange:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting userAgeRange property: %@", v2, v3, v4, v5, v6);
}

- (void)setUserIsSenior:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting isSenior property: %@", v2, v3, v4, v5, v6);
}

- (void)demoAccountForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching demoAccount property: %@", v2, v3, v4, v5, v6);
}

- (void)setDemoAccount:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting demoAccount property: %@", v2, v3, v4, v5, v6);
}

- (void)ageOfMajorityForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching ageOfMajority property: %@", v2, v3, v4, v5, v6);
}

- (void)setAgeOfMajority:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting ageOfMajority property: %@", v2, v3, v4, v5, v6);
}

- (void)appleIDCountryCodeForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching Apple ID country code property: %@", v2, v3, v4, v5, v6);
}

- (void)setAppleIDCountryCode:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting Apple ID country code property %@", v2, v3, v4, v5, v6);
}

- (void)authorizationUsedForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching authorization used: %@", v2, v3, v4, v5, v6);
}

- (void)setAuthorizationUsed:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting authorization used: %@", v2, v3, v4, v5, v6);
}

- (void)privateAttestationEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching private attestation enabled: %@", v2, v3, v4, v5, v6);
}

- (void)setPrivateAttestationEnabled:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting private attestation enabled: %@", v2, v3, v4, v5, v6);
}

- (void)isProximityAuthEligible:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching proximity auth eligible enabled: %@", v2, v3, v4, v5, v6);
}

- (void)setIsProximityAuthEligible:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting proximity auth eligible enabled: %@", v2, v3, v4, v5, v6);
}

- (void)piggybackingApprovalEligible:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching pbae: %@", v2, v3, v4, v5, v6);
}

- (void)setPiggybackingApprovalEligible:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting pbae: %@", v2, v3, v4, v5, v6);
}

- (void)reachableEmailAddressesForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching reachable emails: %@", v2, v3, v4, v5, v6);
}

- (void)setReachableEmailAddresses:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting reachable emails: %@", v2, v3, v4, v5, v6);
}

- (void)givenNameForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching given name: %@", v2, v3, v4, v5, v6);
}

- (void)setGivenName:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exeption caught when setting given name: %@", v2, v3, v4, v5, v6);
}

- (void)familyNameForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching family name: %@", v2, v3, v4, v5, v6);
}

- (void)setFamilyName:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting last name: %@", v2, v3, v4, v5, v6);
}

- (void)forwardingEmailForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching forwarding email: %@", v2, v3, v4, v5, v6);
}

- (void)setForwardingEmail:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting forwarding email: %@", v2, v3, v4, v5, v6);
}

- (void)selectedPrivateEmailForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching private email selected: %@", v2, v3, v4, v5, v6);
}

- (void)setSelectedPrivateEmail:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting private email selection: %@", v2, v3, v4, v5, v6);
}

- (void)selectedAuthorizationEmailForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching slected email: %@", v2, v3, v4, v5, v6);
}

- (void)setSelectedAuthorizationEmail:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting selected email: %@", v2, v3, v4, v5, v6);
}

- (void)_saveAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Could not save %@ due to %@");
}

- (void)_saveAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught while saving account: %@", v2, v3, v4, v5, v6);
}

- (void)setDeviceRemovalReason:(uint64_t)a1 onAccount:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 134218242;
  *(void *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v2, v3, "Failed to setDeviceRemovalReason to: %ld. Exception:\n%@", (void)v4, DWORD2(v4));
}

- (void)setDeviceRemovalReason:onAccount:.cold.2()
{
  OUTLINED_FUNCTION_1();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "AKAccountManager setDeviceRemovalReason, there is already a removal reason set! Old reason: %ld. New reason: %ld", v2, v3);
}

- (void)clearDeviceRemovalReasonFromAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to clearDeviceRemovalReasonFromAccount. Exception:\n%@", v2, v3, v4, v5, v6);
}

- (void)deviceRemovalReasonForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Failed to get deviceRemovalReasonForAccount. Exception caught: %@", v2, v3, v4, v5, v6);
}

- (void)hasSOSActiveDeviceForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching hasSOSActiveDevice property: %@", v2, v3, v4, v5, v6);
}

- (void)setHasSOSActiveDevice:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting hasSOSActiveDevice property: %@", v2, v3, v4, v5, v6);
}

- (void)isSOSNeededForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching SOSNeeded property: %@", v2, v3, v4, v5, v6);
}

- (void)setSOSNeeded:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting SOSNeeded property: %@", v2, v3, v4, v5, v6);
}

- (void)hasModernRecoveryKeyForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching hasModernRecoveryKey property: %@", v2, v3, v4, v5, v6);
}

- (void)setHasModernRecoveryKey:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting hasModernRecoveryKey property: %@", v2, v3, v4, v5, v6);
}

- (void)get3PRegulatoryOverride:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching AK3PRegulatoryOverride property: %@", v2, v3, v4, v5, v6);
}

- (void)set3PRegulatoryOverride:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting AK3PRegulatoryOverride property: %@", v2, v3, v4, v5, v6);
}

- (void)adpCohortForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching adpCohort property: %@", v2, v3, v4, v5, v6);
}

- (void)edpStateForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching edpState property: %@", v2, v3, v4, v5, v6);
}

- (void)edpStateValueForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Rejecting out-of-range EDP state (%@).", v2, v3, v4, v5, v6);
}

- (void)passwordVersionForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching passwordVersion property: %@", v2, v3, v4, v5, v6);
}

- (void)srpProtocolForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching srpProtocol property: %@", v2, v3, v4, v5, v6);
}

- (void)idmsEDPTokenIdForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching the idMSEDPTokenId property: %@", v2, v3, v4, v5, v6);
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Nil account cannot possibly have a %@ token creation date!", v2, v3, v4, v5, v6);
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Token creation key not found. Skipping fetching token creation date.", v2, v3, v4, v5, v6);
}

- (void)tokenCreationDateWithIdentifier:forAccount:error:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Fetching token creation date: %@ for account %@");
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Credential is nil, skip token creation time update.", v2, v3, v4, v5, v6);
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Token creation key not found. Skipping token creation time update.", v2, v3, v4, v5, v6);
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Valid CK exists - Ignoring server response", v2, v3, v4, v5, v6);
}

- (void)_setTokenCreationTimeForToken:tokenID:account:credential:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Token creation time is not enabled. Skipping token creation time update.", v2, v3, v4, v5, v6);
}

- (void)_tokenWithName:forAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Nil account cannot possibly have a %@ token!", v2, v3, v4, v5, v6);
}

- (void)_tokenWithName:forAccount:error:.cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "AuthKit credential is completely MIA! Account: %@. Fetch error: %@");
}

- (void)_reportTokenWithName:forAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Reporting not supported for token - %@", v2, v3, v4, v5, v6);
}

- (void)_isAccountEligibleForSecurityUpgrade:(uint64_t)a1 ofServiceType:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 134218242;
  *(void *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v2, v3, "There is no matching service account for service type (%li). (%@) may be abandoned authkit account, but still on device.", (void)v4, DWORD2(v4));
}

- (void)_isAccountEligibleForSecurityUpgrade:ofServiceType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "AuthKit account (%@) that is not an SA account is not eligible for security upgrade.", v2, v3, v4, v5, v6);
}

- (void)_removeTokenKey:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Attempted to remove a token for nil key", v2, v3, v4, v5, v6);
}

- (void)_triggerSilentTTRFor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "SilentTTR not triggered - supported only on TvOS", v2, v3, v4, v5, v6);
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Finish reporting %@ for account: %@");
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Reporting  %@ is not supported for non-prod environments", v2, v3, v4, v5, v6);
}

- (void)_reportTokenWithTelemetryID:account:telemetryFlowID:error:.cold.3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "Begin reporting %@ for account: %@");
}

- (void)isPrimaryiCloudAccount:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Invalid type for value of primaryAccount account property: %@. Account: %@");
}

- (void)isPrimaryiCloudAccountEmailVerified:.cold.2()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = @"primaryEmailVerified";
  OUTLINED_FUNCTION_9();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_193494000, v2, OS_LOG_TYPE_ERROR, "Invalid type for value of %@ account property: %@. Account: %@", (uint8_t *)&v3, 0x20u);
}

- (void)_aliasesForiCloudAccount:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Invalid type for value of appleIdAliases %@. Account: %@");
}

- (void)_altDSIDForiCloudAccount:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Invalid type for altDSID %@. Account: %@");
}

- (void)trustedPhoneNumbersForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching trusted phone numbers: %@", v2, v3, v4, v5, v6);
}

- (void)setTrustedPhoneNumbers:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting trusted phone numbers: %@", v2, v3, v4, v5, v6);
}

- (void)securityKeysForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching security keys: %@", v2, v3, v4, v5, v6);
}

- (void)setSecurityKeys:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting security keys: %@", v2, v3, v4, v5, v6);
}

- (void)loginHandlesForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching login handles: %@", v2, v3, v4, v5, v6);
}

- (void)setLoginHandles:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting login handles: %@", v2, v3, v4, v5, v6);
}

- (void)nextLivenessNonce:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching nextLivenessNonce: %@", v2, v3, v4, v5, v6);
}

- (void)dcrtRenewalAttempted:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching dcrtRenewalAttempted: %@", v2, v3, v4, v5, v6);
}

- (void)_fetchAllAccountsWithType:error:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Could not fetch accounts of type %@ due to %@");
}

- (void)isNotificationEmailAvailableForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching isNotificationEmailAvailable property: %@", v2, v3, v4, v5, v6);
}

- (void)setIsNotificationEmailAvailable:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting isNotificationEmailAvailable: %@", v2, v3, v4, v5, v6);
}

- (void)canBeCustodianForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching canBeCustodian property: %@", v2, v3, v4, v5, v6);
}

- (void)setCanBeCustodian:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting canBeCustodian: %@", v2, v3, v4, v5, v6);
}

- (void)canHaveCustodianForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching canHaveCustodian property: %@", v2, v3, v4, v5, v6);
}

- (void)setCanHaveCustodian:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting canHaveCustodian: %@", v2, v3, v4, v5, v6);
}

- (void)custodianEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching custodianEnabled property: %@", v2, v3, v4, v5, v6);
}

- (void)setCustodianEnabled:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting custodianEnabled: %@", v2, v3, v4, v5, v6);
}

- (void)custodianListVersionForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching custodianListVersion property: %@", v2, v3, v4, v5, v6);
}

- (void)setCustodianListVersion:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting custodianListVersion: %@", v2, v3, v4, v5, v6);
}

- (void)custodianLastModifiedForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching custodianLastModified property: %@", v2, v3, v4, v5, v6);
}

- (void)setCustodianLastModified:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting custodianLastModified: %@", v2, v3, v4, v5, v6);
}

- (void)custodianInfosForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching custodianInfos property: %@", v2, v3, v4, v5, v6);
}

- (void)setCustodianInfos:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting custodianInfos: %@", v2, v3, v4, v5, v6);
}

- (void)beneficiaryInfoForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching beneficiaryInfo property: %@", v2, v3, v4, v5, v6);
}

- (void)setBeneficiaryInfo:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting beneficiaryInfo: %@", v2, v3, v4, v5, v6);
}

- (void)isBeneficiaryForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching beneficiary property: %@", v2, v3, v4, v5, v6);
}

- (void)setBeneficiary:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting beneficiary: %@", v2, v3, v4, v5, v6);
}

- (void)canBeBeneficiaryForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching canBeBeneficiary property: %@", v2, v3, v4, v5, v6);
}

- (void)setCanBeBeneficiary:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting canBeBeneficiary: %@", v2, v3, v4, v5, v6);
}

- (void)canHaveBeneficiaryForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching canHaveBeneficiary property: %@", v2, v3, v4, v5, v6);
}

- (void)setCanHaveBeneficiary:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting canHaveBeneficiary: %@", v2, v3, v4, v5, v6);
}

- (void)beneficiaryListVersionForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching beneficiaryListVersion property: %@", v2, v3, v4, v5, v6);
}

- (void)setBeneficiaryListVersion:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting beneficiaryListVersion: %@", v2, v3, v4, v5, v6);
}

- (void)beneficiaryLastModifiedForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching beneficaryLastModified property: %@", v2, v3, v4, v5, v6);
}

- (void)setBeneficiaryLastModified:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting beneficaryLastModified: %@", v2, v3, v4, v5, v6);
}

- (void)hasMDMForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching hasMDMForAccount property: %@", v2, v3, v4, v5, v6);
}

- (void)setHasMDM:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting hasMDMForAccount: %@", v2, v3, v4, v5, v6);
}

- (void)isSilentEscrowRecordRepairEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent escrow record repair is force disabled", v2, v3, v4, v5, v6);
}

- (void)isSilentEscrowRecordRepairEnabledForAccount:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent escrow record repair is force enabled", v2, v3, v4, v5, v6);
}

- (void)_isSilentEscrowRecordRepairEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching silentEscrowRecordRepairEnabled property: %@", v2, v3, v4, v5, v6);
}

- (void)setSilentEscrowRecordRepairEnabled:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting silentEscrowRecordRepairDisabled property: %@", v2, v3, v4, v5, v6);
}

- (void)isSilentEscrowRecordRepairEnabledForAccountV2:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent escrow record repair V2 is force disabled", v2, v3, v4, v5, v6);
}

- (void)isSilentEscrowRecordRepairEnabledForAccountV2:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent escrow record repair V2 is force enabled", v2, v3, v4, v5, v6);
}

- (void)_isSilentEscrowRecordRepairEnabledForAccountV2:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching silentEscrowRecordRepairEnabledV2 property: %@", v2, v3, v4, v5, v6);
}

- (void)setSilentEscrowRecordRepairEnabledV2:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting silentEscrowRecordRepairEnabledV2 property: %@", v2, v3, v4, v5, v6);
}

- (void)isSilentBurnCDPRepairEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent burn in mini-buddy is force disabled", v2, v3, v4, v5, v6);
}

- (void)isSilentBurnCDPRepairEnabledForAccount:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Silent burn in mini-buddy is force enabled", v2, v3, v4, v5, v6);
}

- (void)_isSilentBurnCDPRepairEnabledForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching silenBurnCDPRepairEnabled property: %@", v2, v3, v4, v5, v6);
}

- (void)setSilentBurnCDPRepairEnabled:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting silenBurnCDPRepairEnabled property: %@", v2, v3, v4, v5, v6);
}

- (void)isFidoForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching fido property: %@", v2, v3, v4, v5, v6);
}

- (void)setFido:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting fido property: %@", v2, v3, v4, v5, v6);
}

- (void)hasPersonaAvailableForAltDSID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "personaAttributes: %@", v2, v3, v4, v5, v6);
}

- (void)_shouldBlockAuthorizationForPersona:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "DS: Data Separated account is requesting authorization while primary account is already enteprise! Show Error.", v2, v3, v4, v5, v6);
}

+ (void)personaIDIfCurrentPersonaIsDataSeparated
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a2 userPersonaNickName];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = [a2 userPersonaType];
  _os_log_debug_impl(&dword_193494000, a3, OS_LOG_TYPE_DEBUG, "Running within data separated persona. {uniqueString=%{public}@, nickname=%@, type=%ld}", (uint8_t *)&v7, 0x20u);
}

+ (void)performWithinPersonaForAccount:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_193494000, v0, v1, "Could not get current persona context for account %@, with error %@");
}

+ (void)performWithinPersonaForAccount:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "This process needs entitlement com.apple.usermanagerd.persona.background", v2, v3, v4, v5, v6);
}

- (void)setADPCohort:(NSObject *)a3 forAccount:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 intValue];
  _os_log_fault_impl(&dword_193494000, a3, OS_LOG_TYPE_FAULT, "%@: ADP cohort value %d obtained from IdMS outside the allowed range, rejected.", (uint8_t *)&v4, 0x12u);
}

- (void)activeiCloudPrivateEmailCountForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting activeiCloudPrivateEmailCount: %@", v2, v3, v4, v5, v6);
}

- (void)inactiveiCloudPrivateEmailCountForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting inactiveiCloudPrivateEmailCount: %@", v2, v3, v4, v5, v6);
}

- (void)setSharingGroupLastNotificationDate:forAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when setting sharingGroupLastNotificationDate : %@", v2, v3, v4, v5, v6);
}

- (void)sharingGroupLastNotificationDateForAccount:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Exception caught when fetching sharingGroupLastNotificationDate : %@", v2, v3, v4, v5, v6);
}

@end