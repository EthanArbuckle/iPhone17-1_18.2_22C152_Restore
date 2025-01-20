@interface BUBag
+ (BUBag)defaultBag;
+ (BUBagOfflineCacheProviding)offlineCacheProvider;
+ (NSDictionary)_defaultValueDictionary;
+ (NSDictionary)defaultBagKeysDictionary;
+ (NSString)jsAppUrlKey;
+ (void)audiobookStoreIsAvailable:(id)a3;
+ (void)setOfflineCacheProvider:(id)a3;
- (AMSBagProtocol)backingBag;
- (AMSBagValue)accountFlowURLPatterns;
- (AMSBagValue)acquireSlotURL;
- (AMSBagValue)addFundsURL;
- (AMSBagValue)allowCitations;
- (AMSBagValue)allowingCitations;
- (AMSBagValue)amdDomains;
- (AMSBagValue)amdFinishProvisioning;
- (AMSBagValue)amdSyncMachine;
- (AMSBagValue)appAnalyticsURL;
- (AMSBagValue)automaticDownloadQueueURL;
- (AMSBagValue)availableBookUpdates;
- (AMSBagValue)availableBookUpdatesReloadFrequency;
- (AMSBagValue)booksISBNURL;
- (AMSBagValue)booksMediaAPIHost;
- (AMSBagValue)booksMediaAPIPreviewHost;
- (AMSBagValue)booksReadingNowWidgetRolloutRate;
- (AMSBagValue)booksServiceAndSupportURL;
- (AMSBagValue)booksTabs;
- (AMSBagValue)buyProduct;
- (AMSBagValue)commerceUIURLs;
- (AMSBagValue)contentRestoreMaxItemCount;
- (AMSBagValue)contentRestoreURL;
- (AMSBagValue)countryCode;
- (AMSBagValue)currencyCode;
- (AMSBagValue)deleteUserReviewUrl;
- (AMSBagValue)displaySellerLabelForCountry;
- (AMSBagValue)dtPurchasesPages;
- (AMSBagValue)enableBooksUnifiedProductPages;
- (AMSBagValue)enableSellerInfo;
- (AMSBagValue)endOfBookUpsellEnabled;
- (AMSBagValue)endOfPictureBookUpsellEnabled;
- (AMSBagValue)familyInfo;
- (AMSBagValue)forgottenPassword;
- (AMSBagValue)isAudiobooksStoreEnabled;
- (AMSBagValue)isBooksStoreEnabled;
- (AMSBagValue)isPaidStorefront;
- (AMSBagValue)isYIREnabled;
- (AMSBagValue)isYIRNotificationsAllowed;
- (AMSBagValue)ixStoreSheet;
- (AMSBagValue)ixStoreSheetBooks;
- (AMSBagValue)kvsGetAll;
- (AMSBagValue)kvsPutAll;
- (AMSBagValue)language;
- (AMSBagValue)languageTag;
- (AMSBagValue)libraryLink;
- (AMSBagValue)mdFinishProvisioning;
- (AMSBagValue)mdSyncMachine;
- (AMSBagValue)mediaAPITokenProviderURL;
- (AMSBagValue)metrics;
- (AMSBagValue)mobileNetworkConstraints;
- (AMSBagValue)mobileURLHandlers;
- (AMSBagValue)onboardingPersonalizationID;
- (AMSBagValue)p2LaunchAudioBookStorePathPatterns;
- (AMSBagValue)p2LaunchEbookstoreHostPatterns;
- (AMSBagValue)p2LaunchEbookstorePathPatterns;
- (AMSBagValue)p2ServiceTermsURL;
- (AMSBagValue)priceTrackingEnabled;
- (AMSBagValue)priceTrackingMediaAPIHost;
- (AMSBagValue)privacyAcknowledgementURL;
- (AMSBagValue)processRedirectURL;
- (AMSBagValue)purchaseDAAP;
- (AMSBagValue)pushNotificationsEnvironment;
- (AMSBagValue)readingGoalShareURL;
- (AMSBagValue)remoteConfigSupportedStorefronts;
- (AMSBagValue)reportConcernReasons;
- (AMSBagValue)reportConcernURL;
- (AMSBagValue)reportConcerns;
- (AMSBagValue)resetAndRedirectURL;
- (AMSBagValue)saveUserReviewURL;
- (AMSBagValue)searchHints;
- (AMSBagValue)searchTransparencyURL;
- (AMSBagValue)seriesInfoLiveFetchesEnabled;
- (AMSBagValue)seriesInfoRequestBatchSize;
- (AMSBagValue)seriesInfoUpdateIntervalEnabled;
- (AMSBagValue)seriesInfoUpdateIntervalInDays;
- (AMSBagValue)sharedPurchasesEnabled;
- (AMSBagValue)signSAPRequest;
- (AMSBagValue)signSAPSetup;
- (AMSBagValue)signSAPSetupCert;
- (AMSBagValue)songDownloadDone;
- (AMSBagValue)storeFront;
- (AMSBagValue)storePlatformLookupURLUnpersonalized;
- (AMSBagValue)tafEmailBodyUrlBase;
- (AMSBagValue)trendingSearches;
- (AMSBagValue)trustedDomains;
- (AMSBagValue)userRateContentURL;
- (AMSBagValue)userReviewSortOptions;
- (AMSBagValue)viewAudiobook;
- (AMSBagValue)viewBook;
- (AMSBagValue)viewBookUpdateParams;
- (AMSBagValue)writeUserReviewURL;
- (AMSProcessInfo)processInfo;
- (BOOL)isExpired;
- (BUBag)initWithBackingBag:(id)a3;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)bu_voteURL;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)isMangaStoreEnabled:(id)a3;
@end

@implementation BUBag

- (BUBag)initWithBackingBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUBag;
  v6 = [(BUBag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

+ (BUBag)defaultBag
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1C9A38;
  block[3] = &unk_26449D530;
  block[4] = a1;
  if (qword_26AB40568 != -1) {
    dispatch_once(&qword_26AB40568, block);
  }
  v2 = (void *)qword_26AB40570;

  return (BUBag *)v2;
}

+ (NSDictionary)_defaultValueDictionary
{
  v19[7] = *MEMORY[0x263EF8340];
  v19[0] = &stru_26CF11AD8;
  v18[0] = @"manga-grouping-id";
  v18[1] = @"audiobooks-grouping-id";
  v3 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v2);
  v19[1] = v3;
  v18[2] = @"oprah-audiobook-club-grouping-id";
  v6 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v5);
  v19[2] = v6;
  v18[3] = @"oprah-book-club-id";
  objc_super v9 = objc_msgSend_null(MEMORY[0x263EFF9D0], v7, v8);
  v19[3] = v9;
  v18[4] = @"oprah-book-club-grouping-id";
  v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11);
  v19[4] = v12;
  v19[5] = &unk_26CF18970;
  v18[5] = @"books-reading-now-widget-rollout-rate";
  v18[6] = @"books-service-and-support-url";
  v14 = objc_msgSend_URLWithString_(NSURL, v13, @"https://support.apple.com/books");
  v19[6] = v14;
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v19, v18, 7);

  return (NSDictionary *)v16;
}

+ (NSDictionary)defaultBagKeysDictionary
{
  v5[106] = *MEMORY[0x263EF8340];
  v4[0] = @"account-flow-url-patterns";
  v4[1] = @"acquireSlot";
  v5[0] = &unk_26CF18988;
  v5[1] = &unk_26CF189A0;
  v4[2] = @"AddFundsUrl";
  v4[3] = @"allow-citations";
  v5[2] = &unk_26CF189A0;
  v5[3] = &unk_26CF189B8;
  v4[4] = @"allowing-citations";
  v4[5] = @"amd-domains";
  v5[4] = &unk_26CF189D0;
  v5[5] = &unk_26CF189D0;
  v4[6] = @"amd-finish-provisioning";
  v4[7] = @"amd-sync-machine";
  v5[6] = &unk_26CF189A0;
  v5[7] = &unk_26CF189A0;
  v4[8] = @"app-analytics-url";
  v4[9] = @"audiobooks-grouping-id";
  v5[8] = &unk_26CF189A0;
  v5[9] = &unk_26CF18988;
  v4[10] = @"automatic-downloads2/downloads-url";
  v4[11] = @"enabled-media-types-url";
  v5[10] = &unk_26CF189A0;
  v5[11] = &unk_26CF189A0;
  v4[12] = @"register-media-types-url";
  v4[13] = @"available-book-updates";
  v5[12] = &unk_26CF189A0;
  v5[13] = &unk_26CF189A0;
  v4[14] = @"available-book-updates-reload-frequency";
  v4[15] = @"books-isbn-url";
  v5[14] = &unk_26CF189E8;
  v5[15] = &unk_26CF18988;
  v4[16] = @"booksMediaAPIHost";
  v4[17] = @"booksMediaAPIPreviewHost";
  v5[16] = &unk_26CF18988;
  v5[17] = &unk_26CF18988;
  v4[18] = @"books-reading-now-widget-rollout-rate";
  v4[19] = @"books-service-and-support-url";
  v5[18] = &unk_26CF18A00;
  v5[19] = &unk_26CF189A0;
  v4[20] = @"booksTabs";
  v4[21] = @"buyProduct";
  v5[20] = &unk_26CF18A18;
  v5[21] = &unk_26CF189A0;
  v4[22] = @"checkBookQueue";
  v4[23] = @"check-download-queue";
  v5[22] = &unk_26CF189A0;
  v5[23] = &unk_26CF189A0;
  v4[24] = @"commerce-ui-urls";
  v4[25] = @"p2-content-restore/max-item-count";
  v5[24] = &unk_26CF18A18;
  v5[25] = &unk_26CF189E8;
  v4[26] = @"p2-content-restore/url";
  v4[27] = @"countryCode";
  v5[26] = &unk_26CF189A0;
  v5[27] = &unk_26CF18988;
  v4[28] = @"currencyCode";
  v4[29] = @"deleteUserReviewUrl";
  v5[28] = &unk_26CF18988;
  v5[29] = &unk_26CF18988;
  v4[30] = @"display-seller-label-for-country";
  v4[31] = @"dt-purchases-page";
  v5[30] = &unk_26CF189B8;
  v5[31] = &unk_26CF18988;
  v4[32] = @"enable-books-unified-product-pages";
  v4[33] = @"enable-seller-info";
  v5[32] = &unk_26CF189B8;
  v5[33] = &unk_26CF189B8;
  v4[34] = @"end-of-book-upsell-enabled";
  v4[35] = @"end-of-picture-book-upsell-enabled";
  v5[34] = &unk_26CF18988;
  v5[35] = &unk_26CF18988;
  v4[36] = @"family-info";
  v4[37] = @"forgottenPassword";
  v5[36] = &unk_26CF189A0;
  v5[37] = &unk_26CF189A0;
  v4[38] = @"isAudiobooksStoreEnabled";
  v4[39] = @"isBooksStoreEnabled";
  v5[38] = &unk_26CF189B8;
  v5[39] = &unk_26CF189B8;
  v4[40] = @"is-paid-storefront";
  v4[41] = @"isOnDevicePersonalizationEnabled";
  v5[40] = &unk_26CF189B8;
  v5[41] = &unk_26CF189B8;
  v4[42] = @"isYIREnabled";
  v4[43] = @"isYIRNotificationsAllowed";
  v5[42] = &unk_26CF189B8;
  v5[43] = &unk_26CF189B8;
  v4[44] = @"ix-store-sheet";
  v4[45] = @"ix-store-sheet-books";
  v5[44] = &unk_26CF18A18;
  v5[45] = &unk_26CF18A18;
  v4[46] = @"js-app-url";
  v4[47] = @"kvs-getall";
  v5[46] = &unk_26CF18988;
  v5[47] = &unk_26CF189A0;
  v4[48] = @"kvs-putall";
  v4[49] = @"language";
  v5[48] = &unk_26CF189A0;
  v5[49] = &unk_26CF18988;
  v4[50] = @"language-tag";
  v4[51] = @"library-link";
  v5[50] = &unk_26CF18988;
  v5[51] = &unk_26CF18988;
  v4[52] = @"manga-grouping-id";
  v4[53] = @"md-finish-provisioning";
  v5[52] = &unk_26CF18988;
  v5[53] = &unk_26CF189A0;
  v4[54] = @"md-sync-machine";
  v4[55] = @"sf-api-token-service-url";
  v5[54] = &unk_26CF189A0;
  v5[55] = &unk_26CF189A0;
  v4[56] = @"metrics";
  v4[57] = @"mobile-network-constraints";
  v5[56] = &unk_26CF18A18;
  v5[57] = &unk_26CF189D0;
  v4[58] = @"onboarding-personalization-id";
  v4[59] = @"oprah-audiobook-club-grouping-id";
  v5[58] = &unk_26CF18988;
  v5[59] = &unk_26CF18988;
  v4[60] = @"oprah-book-club-grouping-id";
  v4[61] = @"oprah-book-club-id";
  v5[60] = &unk_26CF18988;
  v5[61] = &unk_26CF18988;
  v4[62] = @"p2-launch-ebookstore-host-patterns";
  v4[63] = @"p2-launch-ebookstore-path-patterns";
  v5[62] = &unk_26CF189D0;
  v5[63] = &unk_26CF189D0;
  v4[64] = @"p2-launch-audio-book-store-path-patterns";
  v5[64] = &unk_26CF189D0;
  v4[65] = @"p2-service-terms-url";
  v5[65] = &unk_26CF18988;
  v4[66] = @"pendingBooks";
  v5[66] = &unk_26CF189A0;
  v4[67] = @"pendingSongs";
  v5[67] = &unk_26CF189A0;
  v4[68] = @"books-price-tracking-enabled";
  v5[68] = &unk_26CF189B8;
  v4[69] = @"books-price-tracking-media-api-host";
  v5[69] = &unk_26CF18988;
  v4[70] = @"privacyAcknowledgementUrl";
  v5[70] = &unk_26CF189A0;
  v4[71] = @"processRedirectUrl";
  v5[71] = &unk_26CF18A18;
  v4[72] = @"purchase-daap";
  v5[72] = &unk_26CF18A18;
  v4[73] = @"push-notifications/environment";
  v5[73] = &unk_26CF18988;
  v4[74] = @"reading-goal-share-url";
  v5[74] = &unk_26CF18988;
  v4[75] = @"remoteConfigSupportedStorefronts";
  v5[75] = &unk_26CF189D0;
  v4[76] = @"sg-audiobooks-report-concern";
  v5[76] = &unk_26CF18A18;
  v4[77] = @"reportConcernReasons";
  v5[77] = &unk_26CF189D0;
  v4[78] = @"reportConcernUrl";
  v5[78] = &unk_26CF189A0;
  v4[79] = @"resetAndRedirectUrl";
  v5[79] = &unk_26CF18988;
  v4[80] = @"saveUserReviewUrl";
  v5[80] = &unk_26CF18988;
  v4[81] = @"searchHints";
  v5[81] = &unk_26CF18988;
  v4[82] = @"search-transparency-url";
  v5[82] = &unk_26CF189A0;
  v4[83] = @"enable-series-info-updates-in-book-libraries";
  v5[83] = &unk_26CF189B8;
  v4[84] = @"book-library-series-info-update-interval-in-days";
  v5[84] = &unk_26CF189E8;
  v4[85] = @"book-library-series-info-request-batch-size";
  v5[85] = &unk_26CF189E8;
  v4[86] = @"enable-live-fetches-in-book-library-series-view";
  v5[86] = &unk_26CF189B8;
  v4[87] = @"shared-purchases-enabled";
  v5[87] = &unk_26CF189B8;
  v4[88] = @"sign-sap-request";
  v5[88] = &unk_26CF18A18;
  v4[89] = @"sign-sap-setup";
  v5[89] = &unk_26CF189A0;
  v4[90] = @"sign-sap-setup-cert";
  v5[90] = &unk_26CF189A0;
  v4[91] = @"songDownloadDone";
  v5[91] = &unk_26CF189A0;
  v4[92] = @"storeFront";
  v5[92] = &unk_26CF18988;
  v4[93] = @"storeplatform-lookup-url-unpersonalized";
  v5[93] = &unk_26CF189A0;
  v4[94] = @"supports-books-slp-v2";
  v5[94] = &unk_26CF189B8;
  v4[95] = @"taf-email-body-url-base";
  v5[95] = &unk_26CF189A0;
  v4[96] = @"trending-searches";
  v5[96] = &unk_26CF18988;
  v4[97] = @"trustedDomains";
  v5[97] = &unk_26CF189D0;
  v4[98] = @"userRateContentUrl";
  v5[98] = &unk_26CF18988;
  v4[99] = @"userReviewsSortOptions";
  v5[99] = &unk_26CF189D0;
  v4[100] = @"viewAudiobook";
  v5[100] = &unk_26CF189A0;
  v4[101] = @"viewBook";
  v5[101] = &unk_26CF189A0;
  v4[102] = @"view-book-update-params";
  v5[102] = &unk_26CF189A0;
  v4[103] = @"voteUrl";
  v5[103] = &unk_26CF18988;
  v4[104] = @"writeUserReviewUrl";
  v5[104] = &unk_26CF18988;
  v4[105] = @"mobile-url-handlers";
  v5[105] = &unk_26CF189D0;
  uint64_t v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, v4, 106);

  return (NSDictionary *)v2;
}

+ (NSString)jsAppUrlKey
{
  return (NSString *)@"js-app-url";
}

+ (BUBagOfflineCacheProviding)offlineCacheProvider
{
  return (BUBagOfflineCacheProviding *)(id)qword_267D29858;
}

+ (void)setOfflineCacheProvider:(id)a3
{
}

- (AMSBagProtocol)backingBag
{
  return self->_bag;
}

- (AMSBagValue)accountFlowURLPatterns
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"account-flow-url-patterns");
}

- (AMSBagValue)acquireSlotURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"acquireSlot");
}

- (AMSBagValue)addFundsURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"AddFundsUrl");
}

- (AMSBagValue)allowCitations
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"allow-citations");
}

- (AMSBagValue)allowingCitations
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"allowing-citations");
}

- (AMSBagValue)amdDomains
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"amd-domains");
}

- (AMSBagValue)amdFinishProvisioning
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"amd-finish-provisioning");
}

- (AMSBagValue)amdSyncMachine
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"amd-sync-machine");
}

- (AMSBagValue)appAnalyticsURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"app-analytics-url");
}

- (AMSBagValue)automaticDownloadQueueURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"automatic-downloads2/downloads-url");
}

- (AMSBagValue)availableBookUpdates
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"available-book-updates");
}

- (AMSBagValue)availableBookUpdatesReloadFrequency
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"available-book-updates-reload-frequency");
}

- (AMSBagValue)booksISBNURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"books-isbn-url");
}

- (AMSBagValue)booksMediaAPIHost
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"booksMediaAPIHost");
}

- (AMSBagValue)booksMediaAPIPreviewHost
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"booksMediaAPIPreviewHost");
}

- (AMSBagValue)booksReadingNowWidgetRolloutRate
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_doubleForKey_, @"books-reading-now-widget-rollout-rate");
}

- (AMSBagValue)booksServiceAndSupportURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"books-service-and-support-url");
}

- (AMSBagValue)booksTabs
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"booksTabs");
}

- (AMSBagValue)buyProduct
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"buyProduct");
}

- (AMSBagValue)commerceUIURLs
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"commerce-ui-urls");
}

- (AMSBagValue)contentRestoreMaxItemCount
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"p2-content-restore/max-item-count");
}

- (AMSBagValue)contentRestoreURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"p2-content-restore/url");
}

- (AMSBagValue)countryCode
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"countryCode");
}

- (AMSBagValue)currencyCode
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"currencyCode");
}

- (AMSBagValue)deleteUserReviewUrl
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"deleteUserReviewUrl");
}

- (AMSBagValue)displaySellerLabelForCountry
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"display-seller-label-for-country");
}

- (AMSBagValue)dtPurchasesPages
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"dt-purchases-page");
}

- (AMSBagValue)enableBooksUnifiedProductPages
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"enable-books-unified-product-pages");
}

- (AMSBagValue)enableSellerInfo
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"enable-seller-info");
}

- (AMSBagValue)endOfBookUpsellEnabled
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"end-of-book-upsell-enabled");
}

- (AMSBagValue)endOfPictureBookUpsellEnabled
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"end-of-picture-book-upsell-enabled");
}

- (AMSBagValue)familyInfo
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"family-info");
}

- (AMSBagValue)forgottenPassword
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"forgottenPassword");
}

- (AMSBagValue)isAudiobooksStoreEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"isAudiobooksStoreEnabled");
}

- (AMSBagValue)isBooksStoreEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"isBooksStoreEnabled");
}

- (AMSBagValue)isPaidStorefront
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"is-paid-storefront");
}

- (AMSBagValue)isYIREnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"isYIREnabled");
}

- (AMSBagValue)isYIRNotificationsAllowed
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"isYIRNotificationsAllowed");
}

- (AMSBagValue)ixStoreSheet
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"ix-store-sheet");
}

- (AMSBagValue)ixStoreSheetBooks
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"ix-store-sheet-books");
}

- (AMSBagValue)kvsGetAll
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"kvs-getall");
}

- (AMSBagValue)kvsPutAll
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"kvs-putall");
}

- (AMSBagValue)language
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"language");
}

- (AMSBagValue)languageTag
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"language-tag");
}

- (AMSBagValue)libraryLink
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"library-link");
}

- (AMSBagValue)mdFinishProvisioning
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"md-finish-provisioning");
}

- (AMSBagValue)mdSyncMachine
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"md-sync-machine");
}

- (AMSBagValue)mediaAPITokenProviderURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"sf-api-token-service-url");
}

- (AMSBagValue)metrics
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"metrics");
}

- (AMSBagValue)mobileNetworkConstraints
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"mobile-network-constraints");
}

- (AMSBagValue)mobileURLHandlers
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"mobile-url-handlers");
}

- (AMSBagValue)onboardingPersonalizationID
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"onboarding-personalization-id");
}

- (AMSBagValue)p2LaunchEbookstoreHostPatterns
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"p2-launch-ebookstore-host-patterns");
}

- (AMSBagValue)p2LaunchEbookstorePathPatterns
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"p2-launch-ebookstore-path-patterns");
}

- (AMSBagValue)p2LaunchAudioBookStorePathPatterns
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"p2-launch-audio-book-store-path-patterns");
}

- (AMSBagValue)p2ServiceTermsURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"p2-service-terms-url");
}

- (AMSBagValue)priceTrackingEnabled
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"books-price-tracking-enabled");
}

- (AMSBagValue)priceTrackingMediaAPIHost
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"books-price-tracking-media-api-host");
}

- (AMSBagValue)privacyAcknowledgementURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"privacyAcknowledgementUrl");
}

- (AMSBagValue)processRedirectURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"processRedirectUrl");
}

- (AMSBagValue)purchaseDAAP
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"purchase-daap");
}

- (AMSBagValue)pushNotificationsEnvironment
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"push-notifications/environment");
}

- (AMSBagValue)readingGoalShareURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"reading-goal-share-url");
}

- (AMSBagValue)remoteConfigSupportedStorefronts
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"remoteConfigSupportedStorefronts");
}

- (AMSBagValue)reportConcerns
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"sg-audiobooks-report-concern");
}

- (AMSBagValue)reportConcernReasons
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"reportConcernReasons");
}

- (AMSBagValue)reportConcernURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"reportConcernUrl");
}

- (AMSBagValue)resetAndRedirectURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"resetAndRedirectUrl");
}

- (AMSBagValue)saveUserReviewURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"saveUserReviewUrl");
}

- (AMSBagValue)searchHints
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"searchHints");
}

- (AMSBagValue)searchTransparencyURL
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"search-transparency-url");
}

- (AMSBagValue)seriesInfoUpdateIntervalEnabled
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"enable-series-info-updates-in-book-libraries");
}

- (AMSBagValue)seriesInfoUpdateIntervalInDays
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"book-library-series-info-update-interval-in-days");
}

- (AMSBagValue)seriesInfoRequestBatchSize
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"book-library-series-info-request-batch-size");
}

- (AMSBagValue)seriesInfoLiveFetchesEnabled
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_integerForKey_, @"enable-live-fetches-in-book-library-series-view");
}

- (AMSBagValue)sharedPurchasesEnabled
{
  return (AMSBagValue *)objc_msgSend_BOOLForKey_(self, a2, @"shared-purchases-enabled");
}

- (AMSBagValue)signSAPRequest
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_dictionaryForKey_, @"sign-sap-request");
}

- (AMSBagValue)signSAPSetup
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"sign-sap-setup");
}

- (AMSBagValue)signSAPSetupCert
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"sign-sap-setup-cert");
}

- (AMSBagValue)songDownloadDone
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"songDownloadDone");
}

- (AMSBagValue)storeFront
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"storeFront");
}

- (AMSBagValue)storePlatformLookupURLUnpersonalized
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"storeplatform-lookup-url-unpersonalized");
}

- (AMSBagValue)tafEmailBodyUrlBase
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"taf-email-body-url-base");
}

- (AMSBagValue)trendingSearches
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"trending-searches");
}

- (AMSBagValue)trustedDomains
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"trustedDomains");
}

- (AMSBagValue)userRateContentURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"userRateContentUrl");
}

- (AMSBagValue)userReviewSortOptions
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_arrayForKey_, @"userReviewsSortOptions");
}

- (AMSBagValue)viewAudiobook
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"viewAudiobook");
}

- (AMSBagValue)viewBook
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"viewBook");
}

- (AMSBagValue)viewBookUpdateParams
{
  return (AMSBagValue *)MEMORY[0x270F9A6D0](self, sel_URLForKey_, @"view-book-update-params");
}

- (id)bu_voteURL
{
  return (id)objc_msgSend_stringForKey_(self, a2, @"voteUrl");
}

- (AMSBagValue)writeUserReviewURL
{
  return (AMSBagValue *)objc_msgSend_stringForKey_(self, a2, @"writeUserReviewUrl");
}

+ (void)audiobookStoreIsAvailable:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v6 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v4, v5);
  uint64_t v8 = objc_msgSend_valueForKey_(v6, v7, @"BUSimulateAudiobookStoreAvailability");

  if (v8)
  {
    uint64_t v11 = objc_msgSend_BOOLForKey_(v6, v9, @"BUSimulateAudiobookStoreAvailability");
    v12 = BookUtilityLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v11;
      _os_log_impl(&dword_21E1C7000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: Forcing isAudiobooksStoreEnabled to %d.", buf, 8u);
    }

    uint64_t v13 = MEMORY[0x223C22A70](v3);
    v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v11);
    }
  }
  else
  {
    v14 = objc_msgSend_defaultBag(BUBag, v9, v10);
    v17 = objc_msgSend_isAudiobooksStoreEnabled(v14, v15, v16);
    if (v17)
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_21E1CAE58;
      v22[3] = &unk_26449D558;
      id v23 = v3;
      objc_msgSend_valueWithCompletion_(v17, v18, (uint64_t)v22);
      v19 = v23;
    }
    else
    {
      v20 = BookUtilityLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21E1F0800(v20);
      }

      uint64_t v21 = MEMORY[0x223C22A70](v3);
      v19 = (void *)v21;
      if (v21) {
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, 1);
      }
    }
  }
}

- (void)isMangaStoreEnabled:(id)a3
{
  id v4 = a3;
  v6 = objc_msgSend_stringForKey_(self, v5, @"manga-grouping-id");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1CB08C;
  v9[3] = &unk_26449D580;
  id v10 = v4;
  id v7 = v4;
  objc_msgSend_valueWithCompletion_(v6, v8, (uint64_t)v9);
}

- (BOOL)isExpired
{
  return ((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x270F9A6D0])(self->_bag, sel_isExpired);
}

- (NSDate)expirationDate
{
  return (NSDate *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x270F9A6D0])(self->_bag, sel_expirationDate);
}

- (NSString)profile
{
  return (NSString *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x270F9A6D0])(self->_bag, sel_profile);
}

- (NSString)profileVersion
{
  return (NSString *)((uint64_t (*)(AMSBagProtocol *, char *))MEMORY[0x270F9A6D0])(self->_bag, sel_profileVersion);
}

- (void)createSnapshotWithCompletion:(id)a3
{
}

- (id)arrayForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_arrayForKey_, a3);
}

- (id)BOOLForKey:(id)a3
{
  return (id)objc_msgSend_BOOLForKey_(self->_bag, a2, (uint64_t)a3);
}

- (id)doubleForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_doubleForKey_, a3);
}

- (id)integerForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_integerForKey_, a3);
}

- (id)stringForKey:(id)a3
{
  return (id)objc_msgSend_stringForKey_(self->_bag, a2, (uint64_t)a3);
}

- (id)URLForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_URLForKey_, a3);
}

- (id)dictionaryForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_dictionaryForKey_, a3);
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)objc_msgSend_processInfo(self->_bag, a2, v2);
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self->_bag, sel_URLForKey_account_, a3);
}

- (void).cxx_destruct
{
}

@end