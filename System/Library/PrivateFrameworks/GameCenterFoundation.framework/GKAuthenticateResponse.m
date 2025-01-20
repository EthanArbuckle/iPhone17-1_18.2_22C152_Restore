@interface GKAuthenticateResponse
+ (id)secureCodedPropertyKeys;
- (BOOL)accessPointIsOnAutomatically;
- (BOOL)accessPointShowHighlights;
- (BOOL)loginBannerDisabled;
- (BOOL)loginDisabled;
- (BOOL)passwordChangeRequired;
- (BOOL)shouldShowLinkAccountsUI;
- (BOOL)suppressLoginSheet;
- (GKAuthenticateResponse)init;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)lastContactsIntegrationConsentVersionDisplayed;
- (NSString)lastFriendSuggestionsVersionDisplayed;
- (NSString)lastPersonalizationVersionDisplayed;
- (NSString)lastProfilePrivacyVersionDisplayed;
- (NSString)playerID;
- (NSURL)passwordChangeURL;
- (int64_t)accessPointLocation;
- (unint64_t)lastPrivacyNoticeVersionDisplayed;
- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed;
- (void)setAccessPointIsOnAutomatically:(BOOL)a3;
- (void)setAccessPointLocation:(int64_t)a3;
- (void)setAccessPointShowHighlights:(BOOL)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertTitle:(id)a3;
- (void)setLastContactsIntegrationConsentVersionDisplayed:(id)a3;
- (void)setLastFriendSuggestionsVersionDisplayed:(id)a3;
- (void)setLastPersonalizationVersionDisplayed:(id)a3;
- (void)setLastPrivacyNoticeVersionDisplayed:(unint64_t)a3;
- (void)setLastProfilePrivacyVersionDisplayed:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3;
- (void)setLoginBannerDisabled:(BOOL)a3;
- (void)setLoginDisabled:(BOOL)a3;
- (void)setPasswordChangeRequired:(BOOL)a3;
- (void)setPasswordChangeURL:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setShouldShowLinkAccountsUI:(BOOL)a3;
- (void)setSuppressLoginSheet:(BOOL)a3;
@end

@implementation GKAuthenticateResponse

- (GKAuthenticateResponse)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKAuthenticateResponse;
  v2 = [(GKAuthenticateResponse *)&v7 init];
  if (v2)
  {
    v3 = +[GKPreferences shared];
    -[GKAuthenticateResponse setAccessPointIsOnAutomatically:](v2, "setAccessPointIsOnAutomatically:", [v3 accessPointIsOnAutomatically]);

    v4 = +[GKPreferences shared];
    -[GKAuthenticateResponse setAccessPointShowHighlights:](v2, "setAccessPointShowHighlights:", [v4 accessPointShowHighlights]);

    v5 = +[GKPreferences shared];
    -[GKAuthenticateResponse setAccessPointLocation:](v2, "setAccessPointLocation:", [v5 accessPointLocation]);
  }
  return v2;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_7 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_7, &__block_literal_global_35);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_7;

  return v2;
}

void __49__GKAuthenticateResponse_secureCodedPropertyKeys__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v0 setObject:objc_opt_class() forKey:@"playerID"];
  [v0 setObject:objc_opt_class() forKey:@"loginDisabled"];
  [v0 setObject:objc_opt_class() forKey:@"suppressLoginSheet"];
  [v0 setObject:objc_opt_class() forKey:@"loginBannerDisabled"];
  [v0 setObject:objc_opt_class() forKey:@"passwordChangeRequired"];
  [v0 setObject:objc_opt_class() forKey:@"passwordChangeURL"];
  [v0 setObject:objc_opt_class() forKey:@"alertTitle"];
  [v0 setObject:objc_opt_class() forKey:@"alertMessage"];
  [v0 setObject:objc_opt_class() forKey:@"lastPersonalizationVersionDisplayed"];
  [v0 setObject:objc_opt_class() forKey:@"lastPrivacyNoticeVersionDisplayed"];
  [v0 setObject:objc_opt_class() forKey:@"accessPointIsOnAutomatically"];
  [v0 setObject:objc_opt_class() forKey:@"accessPointShowHighlights"];
  [v0 setObject:objc_opt_class() forKey:@"accessPointLocation"];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_7;
  secureCodedPropertyKeys_sSecureCodedKeys_7 = (uint64_t)v0;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (BOOL)loginDisabled
{
  return self->_loginDisabled;
}

- (void)setLoginDisabled:(BOOL)a3
{
  self->_loginDisabled = a3;
}

- (BOOL)suppressLoginSheet
{
  return self->_suppressLoginSheet;
}

- (void)setSuppressLoginSheet:(BOOL)a3
{
  self->_suppressLoginSheet = a3;
}

- (BOOL)loginBannerDisabled
{
  return self->_loginBannerDisabled;
}

- (void)setLoginBannerDisabled:(BOOL)a3
{
  self->_loginBannerDisabled = a3;
}

- (BOOL)passwordChangeRequired
{
  return self->_passwordChangeRequired;
}

- (void)setPasswordChangeRequired:(BOOL)a3
{
  self->_passwordChangeRequired = a3;
}

- (NSURL)passwordChangeURL
{
  return self->_passwordChangeURL;
}

- (void)setPasswordChangeURL:(id)a3
{
}

- (BOOL)shouldShowLinkAccountsUI
{
  return self->_shouldShowLinkAccountsUI;
}

- (void)setShouldShowLinkAccountsUI:(BOOL)a3
{
  self->_shouldShowLinkAccountsUI = a3;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
}

- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed
{
  return self->_lastWelcomeWhatsNewCopyVersionDisplayed;
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3
{
  self->_lastWelcomeWhatsNewCopyVersionDisplayed = a3;
}

- (unint64_t)lastPrivacyNoticeVersionDisplayed
{
  return self->_lastPrivacyNoticeVersionDisplayed;
}

- (void)setLastPrivacyNoticeVersionDisplayed:(unint64_t)a3
{
  self->_lastPrivacyNoticeVersionDisplayed = a3;
}

- (NSString)lastPersonalizationVersionDisplayed
{
  return self->_lastPersonalizationVersionDisplayed;
}

- (void)setLastPersonalizationVersionDisplayed:(id)a3
{
}

- (NSString)lastProfilePrivacyVersionDisplayed
{
  return self->_lastProfilePrivacyVersionDisplayed;
}

- (void)setLastProfilePrivacyVersionDisplayed:(id)a3
{
}

- (NSString)lastContactsIntegrationConsentVersionDisplayed
{
  return self->_lastContactsIntegrationConsentVersionDisplayed;
}

- (void)setLastContactsIntegrationConsentVersionDisplayed:(id)a3
{
}

- (NSString)lastFriendSuggestionsVersionDisplayed
{
  return self->_lastFriendSuggestionsVersionDisplayed;
}

- (void)setLastFriendSuggestionsVersionDisplayed:(id)a3
{
}

- (BOOL)accessPointIsOnAutomatically
{
  return self->_accessPointIsOnAutomatically;
}

- (void)setAccessPointIsOnAutomatically:(BOOL)a3
{
  self->_accessPointIsOnAutomatically = a3;
}

- (BOOL)accessPointShowHighlights
{
  return self->_accessPointShowHighlights;
}

- (void)setAccessPointShowHighlights:(BOOL)a3
{
  self->_accessPointShowHighlights = a3;
}

- (int64_t)accessPointLocation
{
  return self->_accessPointLocation;
}

- (void)setAccessPointLocation:(int64_t)a3
{
  self->_accessPointLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_passwordChangeURL, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end