@interface IDSKeyTransparencyRegistrationDataSource
- (BOOL)iCloudAccountDoesMatchAccountForIdentifier:(id)a3;
- (BOOL)isiCloudSignedIn;
- (id)_dependentRegistrationPropertyForKey:(id)a3 serviceIdentifier:(id)a4 pushToken:(id)a5;
- (id)currentLocalKeyTransparencyEligibleServiceIdentifiers;
- (id)currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:(id)a3;
- (id)trustedRemoteKeyTransparencySignatureForServiceIdentifier:(id)a3 pushToken:(id)a4;
- (int64_t)expectedRemoteKeyTransparencyEligibilityForServiceIdentifier:(id)a3 pushToken:(id)a4;
@end

@implementation IDSKeyTransparencyRegistrationDataSource

- (id)_dependentRegistrationPropertyForKey:(id)a3 serviceIdentifier:(id)a4 pushToken:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    v12 = +[IDSDServiceController sharedInstance];
    v13 = [v12 serviceWithIdentifier:v8];

    v14 = +[IDSDAccountController sharedInstance];
    v15 = [v14 appleIDAccountOnService:v13];

    [v15 dependentRegistrationsIncludingCurrentDevice];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v17)
    {
      v27 = v15;
      v28 = v13;
      uint64_t v18 = *(void *)v30;
      uint64_t v19 = IDSDevicePropertyPushToken;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "objectForKey:", v19, v27, v28, (void)v29);
          if ([v10 isEqualToData:v22])
          {
            id v17 = v21;

            goto LABEL_14;
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v17) {
          continue;
        }
        break;
      }
LABEL_14:
      v15 = v27;
      v13 = v28;
    }

    v23 = [v17 objectForKey:IDSDevicePropertyPrivateDeviceData];
    v11 = [v23 objectForKey:v7];

    v24 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v26 = @"YES";
      *(_DWORD *)buf = 138413314;
      id v34 = v8;
      if (!v17) {
        CFStringRef v26 = @"NO";
      }
      __int16 v35 = 2112;
      v36 = v10;
      __int16 v37 = 2112;
      CFStringRef v38 = v26;
      __int16 v39 = 2112;
      id v40 = v7;
      __int16 v41 = 2112;
      v42 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Returning dependent registration property for key { serviceIdentifier: %@, pushToken: %@, foundCandidate: %@, key: %@, value: %@ }", buf, 0x34u);
    }
  }

  return v11;
}

- (id)trustedRemoteKeyTransparencySignatureForServiceIdentifier:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_base_queue();
  dispatch_assert_queue_V2(v8);

  id v9 = [(IDSKeyTransparencyRegistrationDataSource *)self _dependentRegistrationPropertyForKey:IDSPrivateDeviceDataServiceSignatures serviceIdentifier:v6 pushToken:v7];
  v10 = &IDSRegistrationPropertySupportsAVLess_ptr;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v12 = 0;
LABEL_19:
    v22 = 0;
    goto LABEL_20;
  }
  v11 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1007245D4();
  }

  id v12 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v9 options:0];
  if (!v12) {
    goto LABEL_19;
  }
  v13 = [[IDSProtoKeyTransparencyTrustedServiceSignatures alloc] initWithData:v12];
  v14 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10072456C();
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v15 = [(IDSProtoKeyTransparencyTrustedServiceSignatures *)v13 serviceSignatures];
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    CFStringRef v26 = v13;
    uint64_t v18 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v21 = [v20 serviceIdentifier];
        v22 = [v20 signature];
        if (v21 && [v6 isEqualToString:v21])
        {

          goto LABEL_28;
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    v22 = 0;
LABEL_28:
    v10 = &IDSRegistrationPropertySupportsAVLess_ptr;
    v13 = v26;
  }
  else
  {
    v22 = 0;
  }

LABEL_20:
  v23 = [v10[288] KeyTransparency];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v24 = @"YES";
    *(_DWORD *)buf = 138413058;
    id v32 = v6;
    if (!v9) {
      CFStringRef v24 = @"NO";
    }
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    CFStringRef v36 = v24;
    __int16 v37 = 2112;
    CFStringRef v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Returning KT signature for device { serviceIdentifier: %@, pushToken: %@, KTLoggableDataSignaturesString: %@, KTLoggableDataSignature: %@ }", buf, 0x2Au);
  }

  return v22;
}

- (int64_t)expectedRemoteKeyTransparencyEligibilityForServiceIdentifier:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_base_queue();
  dispatch_assert_queue_V2(v8);

  if (([v6 isEqualToString:IDSiMessageKeyTransparencyService] & 1) != 0
    || ([v6 isEqualToString:IDSFaceTimeMultiKeyTransparencyService] & 1) != 0
    || [v6 isEqualToString:IDSMultiplex1KeyTransparencyService])
  {
    id v9 = [(IDSKeyTransparencyRegistrationDataSource *)self _dependentRegistrationPropertyForKey:IDSPrivateDeviceDataKeyTransparencyFlags serviceIdentifier:v6 pushToken:v7];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412802;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Key transparency flags { serviceIdentifier: %@, pushToken: %@, keyTransparencyFlagsString: %@ }", (uint8_t *)&v14, 0x20u);
      }

      unint64_t v11 = (unint64_t)[v9 integerValue] & 1;
    }
    else
    {
      unint64_t v11 = -1;
    }
    id v12 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138413058;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2048;
      unint64_t v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning KT eligibility value { serviceIdentifier: %@, pushToken: %@, keyTransparencyFlagsString: %@, eligibility: %ld }", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    unint64_t v11 = -1;
  }

  return v11;
}

- (BOOL)iCloudAccountDoesMatchAccountForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[IDSDServiceController sharedInstance];
  long long v29 = v3;
  int v14 = [v4 serviceWithIdentifier:v3];

  v5 = +[IDSDAccountController sharedInstance];
  long long v28 = v14;
  id v6 = [v5 appleIDAccountOnService:v14];

  id v7 = [IDSSystemAccountAdapter alloc];
  id v8 = im_primary_queue();
  id v9 = [(IDSSystemAccountAdapter *)v7 initWithQueue:v8];

  id v30 = 0;
  v10 = [(IDSSystemAccountAdapter *)v9 iCloudSystemAccountWithError:&v30];
  id v11 = v30;
  uint64_t v12 = [v10 DSID];
  v13 = (void *)v12;
  LODWORD(v14) = 0;
  if (v6 && v12)
  {
    id v15 = [v6 registration];
    if ((uint64_t)[v15 registrationStatus] <= 4 && (int)objc_msgSend(v6, "registrationStatus") < 2)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      __int16 v16 = [v6 dsID];
      id v17 = [v10 DSID];
      LODWORD(v14) = [v16 isEqualToString:v17];
    }
  }
  __int16 v18 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v27 = v13;
    id v19 = v11;
    if (v14) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    unint64_t v21 = [v6 loginID];
    v22 = [v6 dsID];
    [v6 registrationStatus];
    _IDSStringFromIDSRegistrationStatus();
    v23 = char v26 = (char)v14;
    int v14 = [v6 registration];
    id v24 = [v14 registrationStatus];
    *(_DWORD *)buf = 138414082;
    id v32 = v29;
    __int16 v33 = 2112;
    CFStringRef v34 = v20;
    id v11 = v19;
    v13 = v27;
    __int16 v35 = 2112;
    CFStringRef v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v21;
    __int16 v41 = 2112;
    v42 = v22;
    __int16 v43 = 2112;
    v44 = v23;
    __int16 v45 = 2048;
    id v46 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Checked for iCloud account mismatch { serviceIdentifier: %@, iCloudAccountDoesMatchServiceAccount: %@, iCloudAccount: %@, iCloudAccountError: %@, serviceLoginID: %@, serviceDSID: %@, serviceAccountRegistrationStatus: %@, serviceRegistrationStatus: %ld }", buf, 0x52u);

    LOBYTE(v14) = v26;
  }

  return (char)v14;
}

- (id)currentLocalKeyTransparencyEligibleServiceIdentifiers
{
  id v3 = im_primary_base_queue();
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = IDSiMessageKeyTransparencyService;
  if ([(IDSKeyTransparencyRegistrationDataSource *)self iCloudAccountDoesMatchAccountForIdentifier:IDSiMessageKeyTransparencyService])
  {
    [v4 addObject:v5];
  }
  uint64_t v6 = IDSMultiplex1KeyTransparencyService;
  if ([(IDSKeyTransparencyRegistrationDataSource *)self iCloudAccountDoesMatchAccountForIdentifier:IDSMultiplex1KeyTransparencyService])
  {
    [v4 addObject:v6];
  }
  uint64_t v7 = IDSFaceTimeMultiKeyTransparencyService;
  if ([(IDSKeyTransparencyRegistrationDataSource *)self iCloudAccountDoesMatchAccountForIdentifier:IDSFaceTimeMultiKeyTransparencyService])
  {
    [v4 addObject:v7];
  }

  return v4;
}

- (id)currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSDServiceController sharedInstance];
  uint64_t v5 = [v4 serviceWithIdentifier:v3];

  uint64_t v6 = +[IDSDAccountController sharedInstance];
  uint64_t v7 = [v6 accountsOnService:v5];

  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "registration", (void)v19);
        id v15 = [v14 keyTransparencyEnrolledURIs];
        [v8 addObjectsFromArray:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }

  __int16 v16 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v3;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Returning key transparency enrolled URIs { serviceIdentifier: %@, enrolledURIs: %@ }", buf, 0x16u);
  }

  id v17 = [v8 allObjects];

  return v17;
}

- (BOOL)isiCloudSignedIn
{
  v2 = [IDSSystemAccountAdapter alloc];
  id v3 = im_primary_queue();
  id v4 = [(IDSSystemAccountAdapter *)v2 initWithQueue:v3];

  id v9 = 0;
  uint64_t v5 = [(IDSSystemAccountAdapter *)v4 iCloudSystemAccountWithError:&v9];
  id v6 = v9;
  uint64_t v7 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning iCloud sign-in status for key transparency { iCloudAccount: %@, iCloudAccountError: %@ }", buf, 0x16u);
  }

  return v5 != 0;
}

@end