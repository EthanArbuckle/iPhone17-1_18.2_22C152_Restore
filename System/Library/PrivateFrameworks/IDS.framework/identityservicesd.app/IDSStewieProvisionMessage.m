@interface IDSStewieProvisionMessage
- (BOOL)allowDualDelivery;
- (BOOL)ignorePushSigHeaders;
- (BOOL)needsDeviceInfo;
- (BOOL)needsPhoneSigs;
- (BOOL)needsPushIdentity;
- (BOOL)phoneNumberInfosAdded;
- (BOOL)wantsBodySignature;
- (BOOL)wantsBodySigningOnly;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsIDSServer;
- (BOOL)wantsManagedRetries;
- (BOOL)wantsPhoneInfo;
- (BOOL)wantsStatusCodeBasedRetries;
- (IDSStewieClearInfo)clearInfo;
- (IDSStewieDeviceInfo)deviceInfo;
- (IDSStewieProvisionMessage)init;
- (IDSStewieSMSConfig)smsConfig;
- (NSArray)phoneNumberInfos;
- (NSData)pushCerts;
- (NSData)pushNonce;
- (NSData)pushSig;
- (NSData)validationData;
- (NSMutableDictionary)failures;
- (NSMutableDictionary)phoneSigs;
- (NSMutableDictionary)successes;
- (NSMutableSet)retiredSessionKeys;
- (NSMutableSet)sessionKeyInfos;
- (NSString)loggingGUID;
- (id)URLOverride;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)failuresOfType:(unint64_t)a3;
- (id)failuresOfType:(unint64_t)a3 withDifferingResponseCode:(int64_t)a4;
- (id)messageBody;
- (id)requiredKeys;
- (id)successfulResponsesOfType:(unint64_t)a3;
- (void)addClearInfo:(id)a3;
- (void)addMessage:(id)a3;
- (void)addPhoneNumberInfos:(id)a3;
- (void)addPhoneSigsForPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4;
- (void)addSMSConfig:(id)a3;
- (void)addSessionKeyInfos:(id)a3;
- (void)addToCorrectResponseDictionaryForRequest:(id)a3 overallResponseCode:(int64_t)a4 overallFailureMessage:(id)a5 requestSpecificError:(id)a6;
- (void)addToCorrectResponseDictionaryForRequest:(id)a3 overallResponseCode:(int64_t)a4 overallFailureMessage:(id)a5 requestSpecificError:(id)a6 forceIntoFailures:(BOOL)a7;
- (void)handleResponseDictionary:(id)a3;
- (void)removePhoneNumberInfos:(id)a3;
- (void)removeSessionKeyInfos:(id)a3;
- (void)setClearInfo:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setFailures:(id)a3;
- (void)setLoggingGUID:(id)a3;
- (void)setPhoneNumberInfos:(id)a3;
- (void)setPhoneNumberInfosAdded:(BOOL)a3;
- (void)setPhoneSigs:(id)a3;
- (void)setPushCerts:(id)a3;
- (void)setPushNonce:(id)a3;
- (void)setPushSig:(id)a3;
- (void)setRetiredSessionKeys:(id)a3;
- (void)setSessionKeyInfos:(id)a3;
- (void)setSmsConfig:(id)a3;
- (void)setSuccesses:(id)a3;
- (void)setValidationData:(id)a3;
@end

@implementation IDSStewieProvisionMessage

- (IDSStewieProvisionMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSStewieProvisionMessage;
  v2 = [(IDSStewieProvisionMessage *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IDSStewieProvisionMessage *)v2 setTimeout:180.0];
    [(IDSStewieProvisionMessage *)v3 setPhoneNumberInfosAdded:0];
    [(IDSStewieProvisionMessage *)v3 setUnderlyingService:@"com.apple.private.alloy.sps.webtunnel"];
    [(IDSStewieProvisionMessage *)v3 setImportanceLevel:2];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)IDSStewieProvisionMessage;
  id v4 = [(IDSStewieProvisionMessage *)&v15 copyWithZone:a3];
  objc_super v5 = [(IDSStewieProvisionMessage *)self loggingGUID];
  [v4 setLoggingGUID:v5];

  v6 = [(IDSStewieProvisionMessage *)self deviceInfo];
  [v4 setDeviceInfo:v6];

  objc_msgSend(v4, "setPhoneNumberInfosAdded:", -[IDSStewieProvisionMessage phoneNumberInfosAdded](self, "phoneNumberInfosAdded"));
  v7 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  [v4 setPhoneNumberInfos:v7];

  v8 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];
  [v4 setSessionKeyInfos:v8];

  v9 = [(IDSStewieProvisionMessage *)self retiredSessionKeys];
  [v4 setRetiredSessionKeys:v9];

  v10 = [(IDSStewieProvisionMessage *)self clearInfo];
  [v4 setClearInfo:v10];

  v11 = [(IDSStewieProvisionMessage *)self successes];
  [v4 setSuccesses:v11];

  v12 = [(IDSStewieProvisionMessage *)self failures];
  [v4 setFailures:v12];

  v13 = [(IDSStewieProvisionMessage *)self smsConfig];
  [v4 setSmsConfig:v13];

  return v4;
}

- (BOOL)needsPushIdentity
{
  v2 = [(IDSStewieProvisionMessage *)self deviceInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)needsPhoneSigs
{
  v2 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)needsDeviceInfo
{
  BOOL v3 = [(IDSStewieProvisionMessage *)self deviceInfo];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [(IDSStewieProvisionMessage *)self clearInfo];
    if (v5)
    {
      v6 = [(IDSStewieProvisionMessage *)self clearInfo];
      BOOL v4 = [v6 clearType] != 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)wantsPhoneInfo
{
  if ([(IDSStewieProvisionMessage *)self phoneNumberInfosAdded]) {
    return 0;
  }
  BOOL v4 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  if ([v4 count])
  {
    BOOL v3 = 0;
  }
  else
  {
    objc_super v5 = [(IDSStewieProvisionMessage *)self clearInfo];
    if (v5)
    {
      v6 = [(IDSStewieProvisionMessage *)self clearInfo];
      BOOL v3 = [v6 clearType] != 0;
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  return v3;
}

- (void)addPhoneSigsForPublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4
{
  id obj = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  id v6 = [obj count];
  if (a3 && v6)
  {

    if (a4)
    {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      [(IDSStewieProvisionMessage *)self setPhoneSigs:v7];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obja = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
      id v8 = [obja countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v8)
      {
        id v10 = v8;
        uint64_t v11 = *(void *)v29;
        *(void *)&long long v9 = 138412546;
        long long v24 = v9;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(obja);
            }
            v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v14 = [(IDSStewieProvisionMessage *)self serverTimestamp];
            _FTGenerateNonceAndSignatureFromPayload();
            id v15 = 0;
            id v16 = 0;

            id v17 = objc_alloc((Class)IDSAuthenticationCertificateSignature);
            v18 = [v13 authenticationCertificate];
            id v19 = [v17 initWithSubscriptionIdentifier:&stru_10099BE78 authenticationCertificate:v18 signature:v16 nonce:v15];

            v20 = [v19 serverVerifiableEncoding];
            v21 = +[IDSFoundationLog stewieProvisioning];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              v33 = v13;
              __int16 v34 = 2112;
              v35 = v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Created sig for info { info: %@, certSig: %@ }", buf, 0x16u);
            }

            if (v20)
            {
              v22 = [(IDSStewieProvisionMessage *)self phoneSigs];
              v23 = [v13 index];
              [v22 setObject:v20 forKeyedSubscript:v23];
            }
          }
          id v10 = [obja countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
  }
}

- (void)addMessage:(id)a3
{
  id v14 = a3;
  if (v14)
  {
    BOOL v4 = [v14 clearInfo];

    if (v4)
    {
      objc_super v5 = [v14 clearInfo];
      [(IDSStewieProvisionMessage *)self addClearInfo:v5];
    }
    id v6 = [v14 deviceInfo];

    if (v6)
    {
      id v7 = [v14 deviceInfo];
      [(IDSStewieProvisionMessage *)self addDeviceInfo:v7];
    }
    if (([v14 wantsPhoneInfo] & 1) == 0)
    {
      id v8 = [v14 phoneNumberInfos];
      [(IDSStewieProvisionMessage *)self addPhoneNumberInfos:v8];
    }
    long long v9 = [v14 sessionKeyInfos];

    if (v9)
    {
      id v10 = [v14 sessionKeyInfos];
      uint64_t v11 = [v10 allObjects];
      [(IDSStewieProvisionMessage *)self addSessionKeyInfos:v11];
    }
    v12 = [v14 loggingGUID];
    [(IDSStewieProvisionMessage *)self addLoggingGUID:v12];

    v13 = [v14 smsConfig];
    [(IDSStewieProvisionMessage *)self addSMSConfig:v13];
  }
}

- (void)addPhoneNumberInfos:(id)a3
{
  id v4 = a3;
  [(IDSStewieProvisionMessage *)self setPhoneNumberInfosAdded:1];
  [(IDSStewieProvisionMessage *)self setPhoneNumberInfos:v4];
  objc_super v5 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  id v6 = [v5 sortedArrayUsingComparator:&stru_1009835E8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        id v14 = +[NSString stringWithFormat:@"%i", (char *)v12 + v10];
        [v13 setIndex:v14];

        v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = (v10 + v12);
    }
    while (v9);
  }
}

- (void)addSessionKeyInfos:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableSet setWithArray:v4];
  if ([v5 count] == (id)30)
  {
    id v6 = [[IDSStewieClearInfo alloc] initWithClearType:1];
    [(IDSStewieProvisionMessage *)self addClearInfo:v6];
  }
  [(IDSStewieProvisionMessage *)self setSessionKeyInfos:v5];
  id v7 = [(IDSStewieProvisionMessage *)self retiredSessionKeys];

  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableSet);
    [(IDSStewieProvisionMessage *)self setRetiredSessionKeys:v8];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "retiredEPKI", (void)v20);

        if (v15)
        {
          long long v16 = [v14 retiredEPKI];
          long long v17 = objc_msgSend(v16, "__imHexString");
          long long v18 = [v17 lowercaseString];

          id v19 = [(IDSStewieProvisionMessage *)self retiredSessionKeys];
          [v19 addObject:v18];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)addClearInfo:(id)a3
{
  id v8 = a3;
  id v4 = [(IDSStewieProvisionMessage *)self clearInfo];

  if (v4)
  {
    objc_super v5 = [(IDSStewieProvisionMessage *)self clearInfo];
    [v5 unionWithClearInfo:v8];
  }
  else
  {
    [(IDSStewieProvisionMessage *)self setClearInfo:v8];
  }
  id v6 = [(IDSStewieProvisionMessage *)self clearInfo];
  id v7 = [v6 clearType];

  if (v7 != (id)1)
  {
    if (v7) {
      goto LABEL_8;
    }
    [(IDSStewieProvisionMessage *)self setDeviceInfo:0];
    [(IDSStewieProvisionMessage *)self setPhoneNumberInfos:0];
  }
  [(IDSStewieProvisionMessage *)self setSessionKeyInfos:0];
LABEL_8:
}

- (void)addSMSConfig:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 config];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [v8 configID];

      if (v7) {
        [(IDSStewieProvisionMessage *)self setSmsConfig:v8];
      }
    }
  }

  _objc_release_x1();
}

- (void)removePhoneNumberInfos:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  id v5 = [v4 mutableCopy];

  if ([v6 count]) {
    [v5 removeObjectsInArray:v6];
  }
  [(IDSStewieProvisionMessage *)self setPhoneNumberInfos:v5];
}

- (void)removeSessionKeyInfos:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];
  id v5 = [v4 mutableCopy];

  if ([v7 count])
  {
    id v6 = +[NSSet setWithArray:v7];
    [v5 minusSet:v6];
  }
  [(IDSStewieProvisionMessage *)self setSessionKeyInfos:v5];
}

- (id)URLOverride
{
  if (!CUTIsInternalInstall())
  {
    BOOL v3 = 0;
    goto LABEL_13;
  }
  if (+[IMUserDefaults forceStewieQA2])
  {
    CFStringRef v2 = @"https://provision-qa2.ess.apple.com/provision";
LABEL_7:
    BOOL v3 = +[NSURL URLWithString:v2];
    goto LABEL_13;
  }
  if (+[IMUserDefaults forceStewieQA1])
  {
    CFStringRef v2 = @"https://provision-qa1.ess.apple.com/provision";
    goto LABEL_7;
  }
  id v4 = +[IMUserDefaults stewieProvisionURLOverride];

  if (v4)
  {
    uint64_t v5 = +[IMUserDefaults stewieProvisionURLOverride];
  }
  else
  {
    BOOL v3 = IMGetSPSCustomURL();

    if (!v3) {
      goto LABEL_13;
    }
    uint64_t v5 = IMGetSPSCustomURL();
  }
  id v6 = (void *)v5;
  BOOL v3 = +[NSURL URLWithString:v5];

LABEL_13:

  return v3;
}

- (BOOL)wantsIDSServer
{
  if (+[IMUserDefaults forceStewieQA2]) {
    return 0;
  }
  else {
    return !+[IMUserDefaults forceStewieQA1];
  }
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsStatusCodeBasedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return !+[IMUserDefaults forceStewieHTTP];
}

- (BOOL)wantsBodySigningOnly
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (id)bagKey
{
  return @"sps-provision";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(IDSStewieProvisionMessage *)self deviceInfo];

  if (!v4) {
    goto LABEL_29;
  }
  uint64_t v5 = [(IDSStewieProvisionMessage *)self pushCertificate];
  if (v5)
  {
  }
  else
  {
    id v6 = [(IDSStewieProvisionMessage *)self pushCerts];

    if (!v6) {
      goto LABEL_13;
    }
  }
  uint64_t v7 = [(IDSStewieProvisionMessage *)self pushNonce];
  if (!v7
    || (id v8 = (void *)v7,
        [(IDSStewieProvisionMessage *)self pushSig],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
LABEL_13:
    id v10 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1007126F8(self, v10);
    }
    goto LABEL_27;
  }
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = [(IDSStewieProvisionMessage *)self deviceInfo];
  uint64_t v12 = [v11 locale];

  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"deviceLocale", v12);
  }

  v13 = [(IDSStewieProvisionMessage *)self deviceInfo];
  id v14 = [v13 pushToken];
  long long v15 = objc_msgSend(v14, "__imHexString");

  if (v15) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"pushToken", v15);
  }

  long long v16 = [(IDSStewieProvisionMessage *)self pushCerts];

  if (v16) {
    [(IDSStewieProvisionMessage *)self pushCerts];
  }
  else {
  long long v17 = [(IDSStewieProvisionMessage *)self pushCertificate];
  }
  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"pushCert", v17);
  }

  long long v18 = [(IDSStewieProvisionMessage *)self pushNonce];
  if (v18) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"pushNonce", v18);
  }

  id v19 = [(IDSStewieProvisionMessage *)self pushSig];
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"pushSignature", v19);
  }

  long long v20 = [(IDSStewieProvisionMessage *)self deviceInfo];
  long long v21 = [v20 dsid];

  if (v21) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"dsid", v21);
  }

  long long v22 = [(IDSStewieProvisionMessage *)self loggingGUID];
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, @"sdid", v22);
  }

  [v3 setObject:v10 forKeyedSubscript:@"deviceInfo"];
LABEL_27:

  long long v23 = [(IDSStewieProvisionMessage *)self deviceInfo];
  long long v24 = [v23 accessTokens];
  id v25 = [v24 count];

  if (v25)
  {
    v26 = [(IDSStewieProvisionMessage *)self deviceInfo];
    v27 = [v26 accessTokens];
    [v3 setObject:v27 forKeyedSubscript:@"featureAccessTokens"];
  }
LABEL_29:
  long long v28 = [(IDSStewieProvisionMessage *)self phoneSigs];
  id v29 = [v28 count];

  if (v29)
  {
    long long v30 = [(IDSStewieProvisionMessage *)self phoneSigs];
    id v31 = [v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"phoneNumbers"];
  }
  v32 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];

  if (v32)
  {
    v56 = v3;
    id v33 = objc_alloc_init((Class)NSMutableArray);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    __int16 v34 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];
    id v35 = [v34 countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v58;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v58 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v40 = [v39 sessionKey];

          if (v40)
          {
            v61[0] = @"key";
            v41 = [v39 sessionKey];
            v61[1] = @"lastResort";
            v62[0] = v41;
            v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v39 lastResort]);
            v62[1] = v42;
            v43 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
            [v33 addObject:v43];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v36);
    }

    id v3 = v56;
    [v56 setObject:v33 forKeyedSubscript:@"addSessionKeys"];
    v44 = [(IDSStewieProvisionMessage *)self retiredSessionKeys];
    id v45 = [v44 count];

    if (v45)
    {
      v46 = [(IDSStewieProvisionMessage *)self retiredSessionKeys];
      v47 = [v46 allObjects];
      [v56 setObject:v47 forKeyedSubscript:@"removeSessionKeys"];
    }
  }
  v48 = [(IDSStewieProvisionMessage *)self clearInfo];

  if (v48)
  {
    v49 = [(IDSStewieProvisionMessage *)self clearInfo];
    id v50 = [v49 clearType];

    if (v50)
    {
      if (v50 != (id)1) {
        goto LABEL_50;
      }
      v51 = &off_1009D2BC0;
    }
    else
    {
      v51 = &off_1009D2BA8;
    }
    [v3 setObject:v51 forKeyedSubscript:@"clear"];
  }
LABEL_50:
  v52 = [(IDSStewieProvisionMessage *)self smsConfig];

  if (v52)
  {
    v53 = [(IDSStewieProvisionMessage *)self smsConfig];
    v54 = [v53 config];
    [v3 setObject:v54 forKeyedSubscript:@"smsConfigBlob"];
  }

  return v3;
}

- (BOOL)ignorePushSigHeaders
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stewie provision response %@", buf, 0xCu);
  }

  id v6 = [v4 objectForKeyedSubscript:@"status"];
  id v44 = [v6 integerValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"message"];
  id v8 = [(IDSStewieProvisionMessage *)self successes];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(IDSStewieProvisionMessage *)self setSuccesses:v9];
  }
  id v10 = [(IDSStewieProvisionMessage *)self failures];

  if (!v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [(IDSStewieProvisionMessage *)self setFailures:v11];
  }
  uint64_t v12 = [(IDSStewieProvisionMessage *)self deviceInfo];

  if (v12)
  {
    v13 = [(IDSStewieProvisionMessage *)self deviceInfo];
    [(IDSStewieProvisionMessage *)self addToCorrectResponseDictionaryForRequest:v13 overallResponseCode:v44 overallFailureMessage:v7 requestSpecificError:0];
  }
  id v14 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];

  v43 = self;
  id v40 = v4;
  if (v14)
  {
    long long v15 = v7;
    long long v16 = [v4 objectForKeyedSubscript:@"phoneNumbers"];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v17 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
    id v18 = [v17 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v23 = [v22 index];
          long long v24 = [v16 objectForKeyedSubscript:v23];

          [(IDSStewieProvisionMessage *)v43 addToCorrectResponseDictionaryForRequest:v22 overallResponseCode:v44 overallFailureMessage:v15 requestSpecificError:v24 forceIntoFailures:v16 != 0];
        }
        id v19 = [v17 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v19);
    }

    id v4 = v40;
    self = v43;
    uint64_t v7 = v15;
  }
  id v25 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];

  if (v25)
  {
    v42 = [v4 objectForKeyedSubscript:@"addSessionKeys"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = [(IDSStewieProvisionMessage *)self sessionKeyInfos];
    id v26 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(obj);
          }
          long long v30 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          id v31 = [v30 keyEPKI];
          if (v31)
          {
            v32 = [v30 keyEPKI];
            id v33 = objc_msgSend(v32, "__imHexString");
            __int16 v34 = [v42 objectForKeyedSubscript:v33];

            self = v43;
          }
          else
          {
            __int16 v34 = 0;
          }

          id v35 = v30;
          id v36 = [v34 objectForKeyedSubscript:@"serverPublicKey"];
          if (v36)
          {
            id v37 = [v35 copyWithServerPublicKey:v36];

            id v35 = v37;
          }
          [(IDSStewieProvisionMessage *)self addToCorrectResponseDictionaryForRequest:v35 overallResponseCode:v44 overallFailureMessage:v7 requestSpecificError:v34 forceIntoFailures:v36 == 0];
        }
        id v27 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v27);
    }

    id v4 = v40;
  }
  v38 = [(IDSStewieProvisionMessage *)self clearInfo];

  if (v38)
  {
    v39 = [(IDSStewieProvisionMessage *)self clearInfo];
    [(IDSStewieProvisionMessage *)self addToCorrectResponseDictionaryForRequest:v39 overallResponseCode:v44 overallFailureMessage:v7 requestSpecificError:0];
  }
}

- (id)successfulResponsesOfType:(unint64_t)a3
{
  id v4 = [(IDSStewieProvisionMessage *)self successes];
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)failuresOfType:(unint64_t)a3
{
  id v4 = [(IDSStewieProvisionMessage *)self failures];
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)failuresOfType:(unint64_t)a3 withDifferingResponseCode:(int64_t)a4
{
  id v6 = [(IDSStewieProvisionMessage *)self failures];
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100137E60;
  v11[3] = &unk_100983608;
  v11[4] = a4;
  id v9 = objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v11);

  return v9;
}

- (void)addToCorrectResponseDictionaryForRequest:(id)a3 overallResponseCode:(int64_t)a4 overallFailureMessage:(id)a5 requestSpecificError:(id)a6
{
}

- (void)addToCorrectResponseDictionaryForRequest:(id)a3 overallResponseCode:(int64_t)a4 overallFailureMessage:(id)a5 requestSpecificError:(id)a6 forceIntoFailures:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = v13;
  long long v16 = [v14 objectForKeyedSubscript:@"status"];

  long long v17 = v15;
  if (v16)
  {
    id v18 = [v14 objectForKeyedSubscript:@"status"];
    a4 = (int64_t)[v18 integerValue];

    long long v17 = [v14 objectForKeyedSubscript:@"message"];

    if (v17)
    {
      id v19 = +[IDSFoundationLog stewieProvisioning];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138543874;
        long long v30 = v17;
        __int16 v31 = 2048;
        int64_t v32 = a4;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Provisioning sub error found { serverErrorDetail: %{public}@, code: %ld, request: %@ }", (uint8_t *)&v29, 0x20u);
      }
    }
  }
  if (a4 || v7)
  {
    uint64_t v20 = [(IDSStewieProvisionMessage *)self failures];
  }
  else
  {
    uint64_t v20 = [(IDSStewieProvisionMessage *)self successes];
  }
  long long v21 = (void *)v20;
  long long v22 = [[IDSStewieProvisionInfoResponse alloc] initWithRequest:v12 responseCode:a4 failureMessage:v17 additionalInfo:v14];
  long long v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 type]);
  long long v24 = [v21 objectForKeyedSubscript:v23];

  if (!v24)
  {
    id v25 = objc_alloc_init((Class)NSMutableArray);
    id v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 type]);
    [v21 setObject:v25 forKeyedSubscript:v26];
  }
  id v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 type]);
  uint64_t v28 = [v21 objectForKeyedSubscript:v27];
  [v28 addObject:v22];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSStewieProvisionMessage *)self loggingGUID];
  uint64_t v5 = [(IDSStewieProvisionMessage *)self deviceInfo];
  id v6 = [(IDSStewieProvisionMessage *)self phoneNumberInfos];
  BOOL v7 = [(IDSStewieProvisionMessage *)self sessionKeyInfos];
  id v8 = [v7 count];
  id v9 = [(IDSStewieProvisionMessage *)self smsConfig];
  id v10 = [(IDSStewieProvisionMessage *)self clearInfo];
  id v11 = +[NSString stringWithFormat:@"<%@: %p { GUID: %@, deviceInfo: %@, phoneInfos: %@, sessionKeyCount: %ld, smsConfig %@, clear: %@ }>", v3, self, v4, v5, v6, v8, v9, v10];

  return v11;
}

- (NSData)pushNonce
{
  return (NSData *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPushNonce:(id)a3
{
}

- (NSData)pushSig
{
  return (NSData *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPushSig:(id)a3
{
}

- (NSData)pushCerts
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPushCerts:(id)a3
{
}

- (IDSStewieSMSConfig)smsConfig
{
  return self->_smsConfig;
}

- (void)setSmsConfig:(id)a3
{
}

- (NSData)validationData
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setValidationData:(id)a3
{
}

- (NSString)loggingGUID
{
  return self->_loggingGUID;
}

- (void)setLoggingGUID:(id)a3
{
}

- (IDSStewieDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (BOOL)phoneNumberInfosAdded
{
  return self->_phoneNumberInfosAdded;
}

- (void)setPhoneNumberInfosAdded:(BOOL)a3
{
  self->_phoneNumberInfosAdded = a3;
}

- (NSArray)phoneNumberInfos
{
  return self->_phoneNumberInfos;
}

- (void)setPhoneNumberInfos:(id)a3
{
}

- (NSMutableSet)sessionKeyInfos
{
  return self->_sessionKeyInfos;
}

- (void)setSessionKeyInfos:(id)a3
{
}

- (NSMutableSet)retiredSessionKeys
{
  return self->_retiredSessionKeys;
}

- (void)setRetiredSessionKeys:(id)a3
{
}

- (IDSStewieClearInfo)clearInfo
{
  return self->_clearInfo;
}

- (void)setClearInfo:(id)a3
{
}

- (NSMutableDictionary)successes
{
  return self->_successes;
}

- (void)setSuccesses:(id)a3
{
}

- (NSMutableDictionary)failures
{
  return self->_failures;
}

- (void)setFailures:(id)a3
{
}

- (NSMutableDictionary)phoneSigs
{
  return self->_phoneSigs;
}

- (void)setPhoneSigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneSigs, 0);
  objc_storeStrong((id *)&self->_failures, 0);
  objc_storeStrong((id *)&self->_successes, 0);
  objc_storeStrong((id *)&self->_clearInfo, 0);
  objc_storeStrong((id *)&self->_retiredSessionKeys, 0);
  objc_storeStrong((id *)&self->_sessionKeyInfos, 0);
  objc_storeStrong((id *)&self->_phoneNumberInfos, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_loggingGUID, 0);
  objc_storeStrong((id *)&self->_validationData, 0);
  objc_storeStrong((id *)&self->_smsConfig, 0);
  objc_storeStrong((id *)&self->_pushCerts, 0);
  objc_storeStrong((id *)&self->_pushSig, 0);

  objc_storeStrong((id *)&self->_pushNonce, 0);
}

@end