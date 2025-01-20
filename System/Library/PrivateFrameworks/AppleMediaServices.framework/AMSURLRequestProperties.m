@interface AMSURLRequestProperties
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSKeychainOptions)keychainOptions;
- (AMSProcessInfo)clientInfo;
- (AMSPurchaseInfo)purchaseInfo;
- (AMSResponseDecoding)responseDecoder;
- (AMSURLRequestProperties)init;
- (BOOL)disableBiometricsResponseHandling;
- (BOOL)disableLoadURLMetrics;
- (BOOL)disableResponseDecoding;
- (BOOL)excludeIdentifierHeadersForAccount;
- (BOOL)knownToBeTrusted;
- (BOOL)remoteSecuritySigningEnabled;
- (BOOL)shouldSetCookiesFromResponse;
- (BOOL)shouldSetStorefrontFromResponse;
- (Class)paymentSheetTaskClass;
- (NSDictionary)additionalMetrics;
- (NSMutableDictionary)userInfo;
- (NSString)gsTokenIdentifier;
- (NSString)logUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)anisetteType;
- (int64_t)dialogOptions;
- (int64_t)maxRetryCount;
- (int64_t)mescalType;
- (int64_t)reversePushType;
- (void)setAccount:(id)a3;
- (void)setAdditionalMetrics:(id)a3;
- (void)setAnisetteType:(int64_t)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDialogOptions:(int64_t)a3;
- (void)setDisableBiometricsResponseHandling:(BOOL)a3;
- (void)setDisableLoadURLMetrics:(BOOL)a3;
- (void)setDisableResponseDecoding:(BOOL)a3;
- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3;
- (void)setGsTokenIdentifier:(id)a3;
- (void)setKeychainOptions:(id)a3;
- (void)setKnownToBeTrusted:(BOOL)a3;
- (void)setLogUUID:(id)a3;
- (void)setMaxRetryCount:(int64_t)a3;
- (void)setMescalType:(int64_t)a3;
- (void)setPaymentSheetTaskClass:(Class)a3;
- (void)setPurchaseInfo:(id)a3;
- (void)setRemoteSecuritySigningEnabled:(BOOL)a3;
- (void)setResponseDecoder:(id)a3;
- (void)setReversePushType:(int64_t)a3;
- (void)setShouldSetCookiesFromResponse:(BOOL)a3;
- (void)setShouldSetStorefrontFromResponse:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSURLRequestProperties

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(ACAccount *)self->_account copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSDictionary *)self->_additionalMetrics copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(void *)(v5 + 32) = self->_anisetteType;
  objc_storeStrong((id *)(v5 + 40), self->_bag);
  id v10 = [(AMSProcessInfo *)self->_clientInfo copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  *(void *)(v5 + 56) = self->_dialogOptions;
  *(unsigned char *)(v5 + 8) = self->_disableBiometricsResponseHandling;
  *(unsigned char *)(v5 + 9) = self->_disableLoadURLMetrics;
  *(unsigned char *)(v5 + 10) = self->_disableResponseDecoding;
  *(unsigned char *)(v5 + 11) = self->_excludeIdentifierHeadersForAccount;
  objc_storeStrong((id *)(v5 + 64), self->_gsTokenIdentifier);
  id v12 = [(AMSKeychainOptions *)self->_keychainOptions copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  *(unsigned char *)(v5 + 12) = self->_knownToBeTrusted;
  uint64_t v14 = [(NSString *)self->_logUUID copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  *(void *)(v5 + 88) = self->_maxRetryCount;
  *(void *)(v5 + 96) = self->_mescalType;
  objc_storeStrong((id *)(v5 + 104), self->_purchaseInfo);
  *(unsigned char *)(v5 + 13) = self->_remoteSecuritySigningEnabled;
  objc_storeStrong((id *)(v5 + 112), self->_responseDecoder);
  *(void *)(v5 + 120) = self->_reversePushType;
  *(unsigned char *)(v5 + 14) = self->_shouldSetCookiesFromResponse;
  *(unsigned char *)(v5 + 15) = self->_shouldSetStorefrontFromResponse;
  uint64_t v16 = [(NSMutableDictionary *)self->_userInfo mutableCopyWithZone:a3];
  v17 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v16;

  objc_storeStrong((id *)(v5 + 136), self->_paymentSheetTaskClass);
  return (id)v5;
}

- (AMSURLRequestProperties)init
{
  v10.receiver = self;
  v10.super_class = (Class)AMSURLRequestProperties;
  v2 = [(AMSURLRequestProperties *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_excludeIdentifierHeadersForAccount = 0;
    v4 = AMSSetLogKey(0);
    uint64_t v5 = [v4 copy];
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v5;

    v3->_maxRetryCount = 3;
    *(_WORD *)&v3->_remoteSecuritySigningEnabled = 256;
    v3->_shouldSetStorefrontFromResponse = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v3->_userInfo;
    v3->_userInfo = v7;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSheetTaskClass, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (int64_t)mescalType
{
  return self->_mescalType;
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setShouldSetStorefrontFromResponse:(BOOL)a3
{
  self->_shouldSetStorefrontFromResponse = a3;
}

- (void)setShouldSetCookiesFromResponse:(BOOL)a3
{
  self->_shouldSetCookiesFromResponse = a3;
}

- (void)setResponseDecoder:(id)a3
{
}

- (void)setRemoteSecuritySigningEnabled:(BOOL)a3
{
  self->_remoteSecuritySigningEnabled = a3;
}

- (void)setMescalType:(int64_t)a3
{
  self->_mescalType = a3;
}

- (void)setKnownToBeTrusted:(BOOL)a3
{
  self->_knownToBeTrusted = a3;
}

- (void)setKeychainOptions:(id)a3
{
}

- (void)setGsTokenIdentifier:(id)a3
{
}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  self->_excludeIdentifierHeadersForAccount = a3;
}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  self->_disableResponseDecoding = a3;
}

- (void)setDialogOptions:(int64_t)a3
{
  self->_dialogOptions = a3;
}

- (void)setClientInfo:(id)a3
{
}

- (void)setBag:(id)a3
{
}

- (void)setAnisetteType:(int64_t)a3
{
  self->_anisetteType = a3;
}

- (void)setAdditionalMetrics:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setLogUUID:(id)a3
{
}

- (BOOL)shouldSetCookiesFromResponse
{
  return self->_shouldSetCookiesFromResponse;
}

- (int64_t)reversePushType
{
  return self->_reversePushType;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (ACAccount)account
{
  return self->_account;
}

- (BOOL)remoteSecuritySigningEnabled
{
  return self->_remoteSecuritySigningEnabled;
}

- (int64_t)anisetteType
{
  return self->_anisetteType;
}

- (BOOL)knownToBeTrusted
{
  return self->_knownToBeTrusted;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (BOOL)disableResponseDecoding
{
  return self->_disableResponseDecoding;
}

- (BOOL)disableBiometricsResponseHandling
{
  return self->_disableBiometricsResponseHandling;
}

- (AMSResponseDecoding)responseDecoder
{
  return self->_responseDecoder;
}

- (BOOL)disableLoadURLMetrics
{
  return self->_disableLoadURLMetrics;
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (int64_t)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDisableBiometricsResponseHandling:(BOOL)a3
{
  self->_disableBiometricsResponseHandling = a3;
}

- (void)setDisableLoadURLMetrics:(BOOL)a3
{
  self->_disableLoadURLMetrics = a3;
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  return self->_excludeIdentifierHeadersForAccount;
}

- (AMSKeychainOptions)keychainOptions
{
  return self->_keychainOptions;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setPurchaseInfo:(id)a3
{
}

- (void)setReversePushType:(int64_t)a3
{
  self->_reversePushType = a3;
}

- (BOOL)shouldSetStorefrontFromResponse
{
  return self->_shouldSetStorefrontFromResponse;
}

- (void)setUserInfo:(id)a3
{
}

- (Class)paymentSheetTaskClass
{
  return self->_paymentSheetTaskClass;
}

- (void)setPaymentSheetTaskClass:(Class)a3
{
}

@end