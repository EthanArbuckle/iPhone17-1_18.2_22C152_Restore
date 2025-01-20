@interface APSBAAClientIdentityProvider
- (APSBAAClientIdentityProvider)init;
- (BOOL)hasUnderlyingIdentityChanged;
- (BOOL)isIdentityAvailable;
- (BOOL)refreshIdentityNextFetch;
- (id)_parseDERCertificatesFromChain:(id)a3;
- (id)baaIdentityRefreshedBlock;
- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4;
- (id)identityAvailabilityDidChangeBlock;
- (void)_processPotentialIdentityChanged;
- (void)dealloc;
- (void)deleteClientIdentityRequestingReplacement;
- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4;
- (void)setBaaIdentityRefreshedBlock:(id)a3;
- (void)setIdentityAvailabilityDidChangeBlock:(id)a3;
- (void)setRefreshIdentityNextFetch:(BOOL)a3;
@end

@implementation APSBAAClientIdentityProvider

- (APSBAAClientIdentityProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)APSBAAClientIdentityProvider;
  v2 = [(APSBAAClientIdentityProvider *)&v5 init];
  [(APSBAAClientIdentityProvider *)v2 setRefreshIdentityNextFetch:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10006DBB4, kNotificationActivationStateChanged, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kNotificationActivationStateChanged, 0);
  v4.receiver = self;
  v4.super_class = (Class)APSBAAClientIdentityProvider;
  [(APSBAAClientIdentityProvider *)&v4 dealloc];
}

- (void)_processPotentialIdentityChanged
{
  if (sub_10007F114() && [(APSBAAClientIdentityProvider *)self isIdentityAvailable])
  {
    v3 = +[APSLog courier];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ignoring activation signal on VMs, VMs post an activation signal on every boot since they are hacktivated.", buf, 2u);
    }
  }
  else
  {
    objc_super v4 = [(APSBAAClientIdentityProvider *)self identityAvailabilityDidChangeBlock];

    if (v4)
    {
      objc_super v5 = [(APSBAAClientIdentityProvider *)self identityAvailabilityDidChangeBlock];
      v5[2](v5, [(APSBAAClientIdentityProvider *)self isIdentityAvailable]);
    }
  }
}

- (BOOL)isIdentityAvailable
{
  v2 = (void *)MAEGetActivationStateWithError();
  unsigned __int8 v3 = [v2 isEqualToString:kMAActivationStateUnactivated];
  objc_super v4 = +[APSLog courier];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      v6 = "Device is not activated, can't fetch a BAA identity.";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Device is activated, should be able to obtain an identity";
    v7 = buf;
    goto LABEL_6;
  }

  return v3 ^ 1;
}

- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "APSBAAClientIdentityProvider attempting to fetch BAA certs", buf, 2u);
  }

  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    v12 = +[APSLog courier];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v13 = "Device Identity is not supported, can't fetch a BAA cert";
    v14 = buf;
    goto LABEL_14;
  }
  *(void *)buf = 0;
  SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlways, 0x40000000uLL, (CFErrorRef *)buf);
  if (v8)
  {
    SecAccessControlRef v9 = v8;
    if (a3 || [(APSBAAClientIdentityProvider *)self refreshIdentityNextFetch])
    {
      v10 = +[APSLog courier];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "APSBAAClientIdentityProvider requesting to refresh BAA certs", v31, 2u);
      }

      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
    }
    -[APSBAAClientIdentityProvider setRefreshIdentityNextFetch:](self, "setRefreshIdentityNextFetch:", 0, self);
    if ((sub_10007F114() & 1) != 0 || (DeviceIdentityUCRTAttestationSupported() & 1) == 0)
    {
      v16 = +[APSLog courier];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "UCRT not supported, using SCRT/vSCRT", v31, 2u);
      }

      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v15 = 0;
    }
    double v17 = (double)(1440 * arc4random_uniform(0xFu) + 1555200);
    if (sub_10007F114()) {
      char v18 = 2;
    }
    else {
      char v18 = 1;
    }
    char v30 = v18;
    v35[0] = kMAOptionsBAAKeychainLabel;
    v35[1] = kMAOptionsBAAKeychainAccessGroup;
    v36[0] = @"apsd";
    v36[1] = @"com.apple.apsd";
    v35[2] = kMAOptionsBAAIgnoreExistingKeychainItems;
    v19 = +[NSNumber numberWithBool:v11];
    v36[2] = v19;
    v36[3] = &__kCFBooleanTrue;
    v35[3] = kMAOptionsResuseExistingKey;
    v35[4] = kMAOptionsBAANetworkTimeoutInterval;
    v36[4] = &off_100137A38;
    v35[5] = kMAOptionsBAAValidity;
    v20 = +[NSNumber numberWithDouble:v17];
    v36[5] = v20;
    v35[6] = kMAOptionsBAASCRTAttestation;
    v21 = +[NSNumber numberWithBool:v15];
    v36[6] = v21;
    v36[7] = v9;
    v35[7] = kMAOptionsBAAAccessControls;
    v35[8] = kMAOptionsBAAAppSpecificData;
    v22 = +[NSData dataWithBytes:&v30 length:1];
    v36[8] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:9];
    v24 = +[NSMutableDictionary dictionaryWithDictionary:v23];

    if (sub_10007F114())
    {
      v34[0] = kMAOptionsBAAOIDDeviceIdentifiers;
      v34[1] = kMAOptionsBAAOIDProductType;
      v34[2] = kMAOptionsBAAOIDKeyUsageProperties;
      v34[3] = kMAOptionsBAAOIDNonce;
      v25 = v34;
      uint64_t v26 = 4;
    }
    else
    {
      v33[0] = kMAOptionsBAAOIDProductType;
      v33[1] = kMAOptionsBAAOIDKeyUsageProperties;
      v33[2] = kMAOptionsBAAOIDNonce;
      v25 = v33;
      uint64_t v26 = 3;
    }
    v27 = +[NSArray arrayWithObjects:v25 count:v26];
    [v24 setObject:v27 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];

    v28 = +[APSLog courier];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "APSBAAClientIdentityProvider fetching BAA cert", v31, 2u);
    }

    id v29 = v6;
    DeviceIdentityIssueClientCertificateWithCompletion();

    goto LABEL_33;
  }
  v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    v13 = "Failed to get security access control ref for fetching BAA cert";
    v14 = v31;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
  }
LABEL_15:

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_33:
}

- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((sub_10007F114() & 1) == 0)
  {
    SecAccessControlRef v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "APSBAAClientIdentityProvider not a virtual machine, can't request host VM certs!";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_17:
    v16 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    SecAccessControlRef v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "APSBAAClientIdentityProvider no nonce provided to sign";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  __int16 v19 = 769;
  v7 = DeviceIdentityCreateHostSignature();
  SecAccessControlRef v8 = 0;
  if (a4 && *a4)
  {
    SecAccessControlRef v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *a4;
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      uint64_t v11 = "APSBAAClientIdenittyProvider failed to sign nonce with host VM identity, error: %@";
      v12 = v9;
      uint32_t v13 = 12;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  else
  {
    SecAccessControlRef v9 = +[APSLog courier];
    BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 && v8)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "APSBAAClientIdentityProvider signed nonce data with host VM identity!", buf, 2u);
      }

      v16 = objc_alloc_init(APSDProtoHostCertificateInfo);
      double v17 = [(APSBAAClientIdentityProvider *)self _parseDERCertificatesFromChain:v8];
      [(APSDProtoHostCertificateInfo *)v16 setCertificates:v17];

      [(APSDProtoHostCertificateInfo *)v16 setNonce:v6];
      SecAccessControlRef v9 = +[NSMutableData dataWithBytes:&v19 length:2];
      [v9 appendData:v7];
      [(APSDProtoHostCertificateInfo *)v16 setSignature:v9];
      goto LABEL_22;
    }
    if (v15)
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "APSBAAClientIdentityProvider failed to sign nonce data with host VM identity with no error?";
      v12 = v9;
      uint32_t v13 = 2;
      goto LABEL_20;
    }
  }
  v16 = 0;
LABEL_22:

LABEL_23:
  return v16;
}

- (void)deleteClientIdentityRequestingReplacement
{
  v2 = +[APSLog courier];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "APSBAAClientIdentityProvider requested to delete identity. Doing nothing.", v3, 2u);
  }
}

- (BOOL)hasUnderlyingIdentityChanged
{
  return 0;
}

- (id)_parseDERCertificatesFromChain:(id)a3
{
  memset(v21, 0, sizeof(v21));
  unint64_t v16 = 0;
  id v3 = a3;
  id v4 = [v3 bytes];
  int v5 = CTParseCertificateSet((unint64_t)v4, (unint64_t)[v3 length] + (void)v4, v21, 3, &v16);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v16 == 0;
  }
  if (v6)
  {
    int v7 = v5;
    SecAccessControlRef v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v18 = v7;
      __int16 v19 = 2048;
      unint64_t v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to parse certificate set. rc=%d, numCerts=%zu", buf, 0x12u);
    }
LABEL_17:

    SecAccessControlRef v8 = 0;
    goto LABEL_18;
  }
  id v9 = objc_alloc((Class)NSMutableArray);
  SecAccessControlRef v8 = [v9 initWithCapacity:v16];
  if (v16)
  {
    uint64_t v10 = 0;
    int v11 = 0;
    while (1)
    {
      unint64_t v12 = (unint64_t)&v21[v10];
      if (!*(void *)v12 || !*(void *)(v12 + 8)) {
        break;
      }
      id v13 = [objc_alloc((Class)NSData) initWithBytes:*(void *)v12 length:*(void *)(v12 | 8)];
      [v8 setObject:v13 atIndexedSubscript:v10];

      uint64_t v10 = ++v11;
      if (v16 <= v11) {
        goto LABEL_18;
      }
    }
    v14 = +[APSLog courier];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Invalid certData", buf, 2u);
    }

    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (id)identityAvailabilityDidChangeBlock
{
  return self->identityAvailabilityDidChangeBlock;
}

- (void)setIdentityAvailabilityDidChangeBlock:(id)a3
{
}

- (id)baaIdentityRefreshedBlock
{
  return self->_baaIdentityRefreshedBlock;
}

- (void)setBaaIdentityRefreshedBlock:(id)a3
{
}

- (BOOL)refreshIdentityNextFetch
{
  return self->_refreshIdentityNextFetch;
}

- (void)setRefreshIdentityNextFetch:(BOOL)a3
{
  self->_refreshIdentityNextFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_baaIdentityRefreshedBlock, 0);
  objc_storeStrong(&self->identityAvailabilityDidChangeBlock, 0);
}

@end