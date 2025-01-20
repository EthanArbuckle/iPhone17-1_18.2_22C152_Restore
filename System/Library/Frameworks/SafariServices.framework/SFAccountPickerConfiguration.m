@interface SFAccountPickerConfiguration
- ($115C4C562B26FF47E01F9F4EA65B5887)connectedAppAuditToken;
- (BOOL)forUserNamesOnly;
- (BOOL)hasAuditToken;
- (BOOL)isConnectedAppAWebBrowser;
- (BOOL)isForFillingIndividualAccountFields;
- (BOOL)shouldAllowAddingNewPasswords;
- (BOOL)shouldEnableAddingNewPasswordsIfPossible;
- (BOOL)shouldHideCreatePasswordsInSettingsHint;
- (BOOL)shouldShowAutoFillPasskeys;
- (BOOL)shouldShowGeneratedPasswordsForDomain;
- (BOOL)shouldShowPasskeysInAccountPicker;
- (BOOL)shouldShowReceivedVerificationCodes;
- (NSArray)domainHintStrings;
- (NSArray)serviceNameHintStrings;
- (NSString)addPasswordSuggestedDomain;
- (NSString)addPasswordSuggestedLabel;
- (NSString)appID;
- (NSString)bundleIDForFallbackIcon;
- (NSString)initialSearchQuery;
- (NSString)prompt;
- (NSString)promptWhenPasskeysAreAvailable;
- (NSString)title;
- (NSURL)websiteURLForReceivedVerificationCodes;
- (SFAccountPickerConfiguration)init;
- (WBSGlobalFrameIdentifier)currentWebFrameIdentifierForAutoFillPasskeys;
- (WBSSavedAccount)savedAccountToInitiallyShowDetailsFor;
- (WBSSavedAccountContext)savedAccountContext;
- (unint64_t)minimumNumberOfCredentialsToShowLikelyMatchesSection;
- (void)setAddPasswordSuggestedDomain:(id)a3;
- (void)setAddPasswordSuggestedLabel:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBundleIDForFallbackIcon:(id)a3;
- (void)setConnectedAppAuditToken:(id *)a3;
- (void)setCurrentWebFrameIdentifierForAutoFillPasskeys:(id)a3;
- (void)setDomainHintStrings:(id)a3;
- (void)setForUserNamesOnly:(BOOL)a3;
- (void)setInitialSearchQuery:(id)a3;
- (void)setIsConnectedAppAWebBrowser:(BOOL)a3;
- (void)setIsForFillingIndividualAccountFields:(BOOL)a3;
- (void)setMinimumNumberOfCredentialsToShowLikelyMatchesSection:(unint64_t)a3;
- (void)setPrompt:(id)a3;
- (void)setPromptWhenPasskeysAreAvailable:(id)a3;
- (void)setSavedAccountContext:(id)a3;
- (void)setSavedAccountToInitiallyShowDetailsFor:(id)a3;
- (void)setServiceNameHintStrings:(id)a3;
- (void)setShouldEnableAddingNewPasswordsIfPossible:(BOOL)a3;
- (void)setShouldHideCreatePasswordsInSettingsHint:(BOOL)a3;
- (void)setShouldShowAutoFillPasskeys:(BOOL)a3;
- (void)setShouldShowGeneratedPasswordsForDomain:(BOOL)a3;
- (void)setShouldShowPasskeysInAccountPicker:(BOOL)a3;
- (void)setShouldShowReceivedVerificationCodes:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setWebsiteURLForReceivedVerificationCodes:(id)a3;
@end

@implementation SFAccountPickerConfiguration

- (SFAccountPickerConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAccountPickerConfiguration;
  v2 = [(SFAccountPickerConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldShowGeneratedPasswordsForDomain = 1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)shouldAllowAddingNewPasswords
{
  int v2 = [(SFAccountPickerConfiguration *)self shouldEnableAddingNewPasswordsIfPossible];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F78290];
    LOBYTE(v2) = [v3 shouldAllowAddingNewPasswords];
  }
  return v2;
}

- (void)setConnectedAppAuditToken:(id *)a3
{
  self->_hasAuditToken = 1;
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_connectedAppAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_connectedAppAuditToken.val[4] = v3;
}

- (void)setCurrentWebFrameIdentifierForAutoFillPasskeys:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)promptWhenPasskeysAreAvailable
{
  return self->_promptWhenPasskeysAreAvailable;
}

- (void)setPromptWhenPasskeysAreAvailable:(id)a3
{
}

- (NSArray)serviceNameHintStrings
{
  return self->_serviceNameHintStrings;
}

- (void)setServiceNameHintStrings:(id)a3
{
}

- (NSArray)domainHintStrings
{
  return self->_domainHintStrings;
}

- (void)setDomainHintStrings:(id)a3
{
}

- (unint64_t)minimumNumberOfCredentialsToShowLikelyMatchesSection
{
  return self->_minimumNumberOfCredentialsToShowLikelyMatchesSection;
}

- (void)setMinimumNumberOfCredentialsToShowLikelyMatchesSection:(unint64_t)a3
{
  self->_minimumNumberOfCredentialsToShowLikelyMatchesSection = a3;
}

- (BOOL)forUserNamesOnly
{
  return self->_forUserNamesOnly;
}

- (void)setForUserNamesOnly:(BOOL)a3
{
  self->_forUserNamesOnly = a3;
}

- (BOOL)shouldShowPasskeysInAccountPicker
{
  return self->_shouldShowPasskeysInAccountPicker;
}

- (void)setShouldShowPasskeysInAccountPicker:(BOOL)a3
{
  self->_shouldShowPasskeysInAccountPicker = a3;
}

- (BOOL)shouldShowAutoFillPasskeys
{
  return self->_shouldShowAutoFillPasskeys;
}

- (void)setShouldShowAutoFillPasskeys:(BOOL)a3
{
  self->_shouldShowAutoFillPasskeys = a3;
}

- (WBSGlobalFrameIdentifier)currentWebFrameIdentifierForAutoFillPasskeys
{
  return self->_currentWebFrameIdentifierForAutoFillPasskeys;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)connectedAppAuditToken
{
  long long v3 = *(_OWORD *)self[5].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[4].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)hasAuditToken
{
  return self->_hasAuditToken;
}

- (BOOL)shouldEnableAddingNewPasswordsIfPossible
{
  return self->_shouldEnableAddingNewPasswordsIfPossible;
}

- (void)setShouldEnableAddingNewPasswordsIfPossible:(BOOL)a3
{
  self->_shouldEnableAddingNewPasswordsIfPossible = a3;
}

- (BOOL)shouldShowGeneratedPasswordsForDomain
{
  return self->_shouldShowGeneratedPasswordsForDomain;
}

- (void)setShouldShowGeneratedPasswordsForDomain:(BOOL)a3
{
  self->_shouldShowGeneratedPasswordsForDomain = a3;
}

- (NSString)addPasswordSuggestedDomain
{
  return self->_addPasswordSuggestedDomain;
}

- (void)setAddPasswordSuggestedDomain:(id)a3
{
}

- (NSString)addPasswordSuggestedLabel
{
  return self->_addPasswordSuggestedLabel;
}

- (void)setAddPasswordSuggestedLabel:(id)a3
{
}

- (NSString)bundleIDForFallbackIcon
{
  return self->_bundleIDForFallbackIcon;
}

- (void)setBundleIDForFallbackIcon:(id)a3
{
}

- (BOOL)isForFillingIndividualAccountFields
{
  return self->_isForFillingIndividualAccountFields;
}

- (void)setIsForFillingIndividualAccountFields:(BOOL)a3
{
  self->_isForFillingIndividualAccountFields = a3;
}

- (BOOL)shouldShowReceivedVerificationCodes
{
  return self->_shouldShowReceivedVerificationCodes;
}

- (void)setShouldShowReceivedVerificationCodes:(BOOL)a3
{
  self->_shouldShowReceivedVerificationCodes = a3;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (BOOL)isConnectedAppAWebBrowser
{
  return self->_isConnectedAppAWebBrowser;
}

- (void)setIsConnectedAppAWebBrowser:(BOOL)a3
{
  self->_isConnectedAppAWebBrowser = a3;
}

- (NSURL)websiteURLForReceivedVerificationCodes
{
  return self->_websiteURLForReceivedVerificationCodes;
}

- (void)setWebsiteURLForReceivedVerificationCodes:(id)a3
{
}

- (NSString)initialSearchQuery
{
  return self->_initialSearchQuery;
}

- (void)setInitialSearchQuery:(id)a3
{
}

- (WBSSavedAccount)savedAccountToInitiallyShowDetailsFor
{
  return self->_savedAccountToInitiallyShowDetailsFor;
}

- (void)setSavedAccountToInitiallyShowDetailsFor:(id)a3
{
}

- (BOOL)shouldHideCreatePasswordsInSettingsHint
{
  return self->_shouldHideCreatePasswordsInSettingsHint;
}

- (void)setShouldHideCreatePasswordsInSettingsHint:(BOOL)a3
{
  self->_shouldHideCreatePasswordsInSettingsHint = a3;
}

- (WBSSavedAccountContext)savedAccountContext
{
  return self->_savedAccountContext;
}

- (void)setSavedAccountContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccountContext, 0);
  objc_storeStrong((id *)&self->_savedAccountToInitiallyShowDetailsFor, 0);
  objc_storeStrong((id *)&self->_initialSearchQuery, 0);
  objc_storeStrong((id *)&self->_websiteURLForReceivedVerificationCodes, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_bundleIDForFallbackIcon, 0);
  objc_storeStrong((id *)&self->_addPasswordSuggestedLabel, 0);
  objc_storeStrong((id *)&self->_addPasswordSuggestedDomain, 0);
  objc_storeStrong((id *)&self->_currentWebFrameIdentifierForAutoFillPasskeys, 0);
  objc_storeStrong((id *)&self->_domainHintStrings, 0);
  objc_storeStrong((id *)&self->_serviceNameHintStrings, 0);
  objc_storeStrong((id *)&self->_promptWhenPasskeysAreAvailable, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end