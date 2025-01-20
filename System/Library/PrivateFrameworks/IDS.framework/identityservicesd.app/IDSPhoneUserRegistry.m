@interface IDSPhoneUserRegistry
- (IDSPhoneNumberValidationStateMachine)phoneNumberValidator;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 deviceSupport:(id)a5;
- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 server:(id)a5 phoneNumberValidator:(id)a6 deviceSupport:(id)a7;
- (IDSPhoneUserRegistryDeviceSupport)deviceSupport;
- (IDSServer)server;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (__SecKey)phoneAuthenticationCertificatePrivateKey;
- (__SecKey)phoneAuthenticationCertificatePublicKey;
- (id)authenticatePhoneUser;
- (id)localPhoneAuthenticationCertificates;
- (id)phoneAuthenticationCertificateSigningRequestForUser:(id)a3;
- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4;
@end

@implementation IDSPhoneUserRegistry

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[IDSServer alloc] initWithQueue:v7];
  v9 = +[IDSCTAdapter sharedInstance];
  v10 = [(IDSPhoneUserRegistry *)self initWithQueue:v7 userStore:v6 server:v8 phoneNumberValidator:0 deviceSupport:v9];

  return v10;
}

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 deviceSupport:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[IDSServer alloc] initWithQueue:v10];
  v12 = [(IDSPhoneUserRegistry *)self initWithQueue:v10 userStore:v9 server:v11 phoneNumberValidator:0 deviceSupport:v8];

  return v12;
}

- (IDSPhoneUserRegistry)initWithQueue:(id)a3 userStore:(id)a4 server:(id)a5 phoneNumberValidator:(id)a6 deviceSupport:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IDSPhoneUserRegistry;
  v17 = [(IDSPhoneUserRegistry *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v18->_userStore, a4);
    objc_storeStrong((id *)&v18->_server, a5);
    objc_storeStrong((id *)&v18->_phoneNumberValidator, a6);
    objc_storeStrong((id *)&v18->_deviceSupport, a7);
  }

  return v18;
}

- (__SecKey)phoneAuthenticationCertificatePublicKey
{
  v2 = [(IDSPhoneUserRegistry *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = +[IDSRegistrationKeyManager sharedInstance];
  v4 = (__SecKey *)[v3 identityPublicKey];

  return v4;
}

- (__SecKey)phoneAuthenticationCertificatePrivateKey
{
  v2 = [(IDSPhoneUserRegistry *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = +[IDSRegistrationKeyManager sharedInstance];
  v4 = (__SecKey *)[v3 identityPrivateKey];

  return v4;
}

- (id)phoneAuthenticationCertificateSigningRequestForUser:(id)a3
{
  id v4 = a3;
  v5 = [(IDSPhoneUserRegistry *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[IDSRegistrationKeyManager sharedInstance];
  id v7 = [v4 phoneNumber];

  id v8 = [v6 generateCSRForUserID:v7];

  return v8;
}

- (id)localPhoneAuthenticationCertificates
{
  v3 = [(IDSPhoneUserRegistry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IDSPhoneUserRegistry *)self deviceSupport];
  unsigned int v5 = [v4 supportsIdentification];

  if (v5)
  {
    id v6 = [(IDSPhoneUserRegistry *)self userStore];
    id v7 = [v6 usersWithRealm:0];

    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          id v15 = [(IDSPhoneUserRegistry *)self userStore];
          id v16 = [v15 authenticationCertificateForUser:v14];

          if (v16)
          {
            v17 = [[IDSPhoneUserAuthenticationCertificate alloc] initWithPhoneUser:v14 authenticationCertificate:v16];
            [v8 addObject:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v11);
    }

    v18 = +[IMRGLog sms];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetched phone auth certificate from phone user registry {userAuthCerts: %@}", buf, 0xCu);
    }

    if ([v8 count])
    {
      id v19 = [v8 copy];
      id v20 = +[CUTPromise fulfilledPromiseWithValue:v19];
    }
    else
    {
      v25 = +[IDSPACStateTracker sharedInstance];
      id v19 = [v25 fetchCurrentPACState];

      v26 = +[IDSPACStateTracker sharedInstance];
      v27 = [v26 underlyingErrorForPACState:v19];

      NSErrorUserInfoKey v38 = NSDebugDescriptionErrorKey;
      CFStringRef v39 = @"This device is not currently authenticated for a phone user";
      v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      v29 = +[NSMutableDictionary dictionaryWithDictionary:v28];

      if (v27) {
        [v29 setObject:v27 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      id v30 = [objc_alloc((Class)NSError) initWithDomain:@"IDSPhoneUserRegistryErrorDomain" code:-5000 userInfo:v29];
      id v20 = +[CUTPromise failedPromiseWithError:v30];
    }
  }
  else
  {
    objc_super v21 = +[IDSPACStateTracker sharedInstance];
    id v9 = [v21 fetchCurrentPACState];

    v22 = +[IDSPACStateTracker sharedInstance];
    id v8 = [v22 underlyingErrorForPACState:v9];

    NSErrorUserInfoKey v36 = NSDebugDescriptionErrorKey;
    CFStringRef v37 = @"This device does not support phone number authentication";
    v23 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v19 = +[NSMutableDictionary dictionaryWithDictionary:v23];

    if (v8) {
      [v19 setObject:v8 forKeyedSubscript:NSUnderlyingErrorKey];
    }
    id v24 = [objc_alloc((Class)NSError) initWithDomain:@"IDSPhoneUserRegistryErrorDomain" code:-1000 userInfo:v19];
    id v20 = +[CUTPromise failedPromiseWithError:v24];
  }

  return v20;
}

- (id)authenticatePhoneUser
{
  return 0;
}

- (void)requestUserConsentToValidatePhoneNumberForCTPNR:(id)a3 completion:(id)a4
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (IDSServer)server
{
  return self->_server;
}

- (IDSPhoneNumberValidationStateMachine)phoneNumberValidator
{
  return self->_phoneNumberValidator;
}

- (IDSPhoneUserRegistryDeviceSupport)deviceSupport
{
  return self->_deviceSupport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_phoneNumberValidator, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_userStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end