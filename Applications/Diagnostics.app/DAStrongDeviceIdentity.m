@interface DAStrongDeviceIdentity
- (NSData)certData;
- (__SecKey)deviceIdentityKey;
- (id)SHA256ForData:(id)a3;
- (id)SHA256ForFileHandle:(id)a3;
- (id)deviceIdentityCert;
- (id)deviceIdentityPublicKeyDigest;
- (id)requestAttestationBlobWithOptions:(id)a3 error:(id *)a4;
- (id)signDigest:(id)a3 error:(id *)a4;
- (id)signFile:(id)a3 error:(id *)a4;
- (id)signPayload:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)generateAuthInfoWithNonce:(id)a3 completion:(id)a4;
- (void)purgeSecurityKey;
- (void)requestAttestationCertWithOptions:(id)a3 completion:(id)a4;
- (void)setCertData:(id)a3;
- (void)setDeviceIdentityKey:(__SecKey *)a3;
@end

@implementation DAStrongDeviceIdentity

- (void)purgeSecurityKey
{
  if ([(DAStrongDeviceIdentity *)self deviceIdentityKey])
  {
    CFRelease([(DAStrongDeviceIdentity *)self deviceIdentityKey]);
    [(DAStrongDeviceIdentity *)self setDeviceIdentityKey:0];
  }
}

- (void)dealloc
{
  [(DAStrongDeviceIdentity *)self purgeSecurityKey];
  v3.receiver = self;
  v3.super_class = (Class)DAStrongDeviceIdentity;
  [(DAStrongDeviceIdentity *)&v3 dealloc];
}

- (void)generateAuthInfoWithNonce:(id)a3 completion:(id)a4
{
  id v33 = a3;
  v6 = (void (**)(id, void *, NSObject *, uint64_t, uint64_t, void))a4;
  uint64_t v47 = 0;
  v48[0] = &v47;
  v48[1] = 0x3032000000;
  v48[2] = sub_100023ED0;
  v48[3] = sub_100023EE0;
  id v49 = 0;
  v7 = +[NSMutableDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:kMAOptionsBAASCRTAttestation];
  v8 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", kMAOptionsBAAOIDDeviceIdentifiers, kMAOptionsBAAOIDHardwareProperties, kMAOptionsBAAOIDKeyUsageProperties, kMAOptionsBAAOIDDeviceOSInformation, kMAOptionsBAAOIDUCRTDeviceIdentifiers, 0);
  v9 = v8;
  if (v33)
  {
    [v8 addObject:kMAOptionsBAAOIDNonce];
    [v7 setObject:v33 forKeyedSubscript:kMAOptionsBAANonce];
  }
  [v7 setObject:v9 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];
  if (sub_100024F00())
  {
    *(void *)buf = 0;
    v42 = buf;
    uint64_t v43 = 0x3032000000;
    v44 = sub_100023ED0;
    v45 = sub_100023EE0;
    id v46 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100023EE8;
    v37[3] = &unk_10014C0E0;
    v39 = buf;
    v40 = &v47;
    v37[4] = self;
    v10 = dispatch_semaphore_create(0);
    v38 = v10;
    [(DAStrongDeviceIdentity *)self requestAttestationCertWithOptions:v7 completion:v37];
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    intptr_t v12 = dispatch_semaphore_wait(v10, v11);
    v13 = (void *)*((void *)v42 + 5);
    if (v13)
    {
      uint64_t v14 = v48[0];
      id obj = *(id *)(v48[0] + 40);
      v15 = [v13 copyCertificatePEMWithError:&obj];
      objc_storeStrong((id *)(v14 + 40), obj);
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || *(void *)(v48[0] + 40))
      {
        v16 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100102560((uint64_t)v48, v16, v17, v18, v19, v20, v21, v22);
        }

        v15 = 0;
      }
      id v23 = [*((id *)v42 + 5) certifcateType];
      if (!v23)
      {
        uint64_t v25 = 1;
        uint64_t v24 = 2;
        if (v15) {
          goto LABEL_22;
        }
LABEL_28:
        v31 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100102484();
        }

        uint64_t v32 = v48[0];
        id v35 = *(id *)(v48[0] + 40);
        v28 = [(DAStrongDeviceIdentity *)self requestAttestationBlobWithOptions:v7 error:&v35];
        objc_storeStrong((id *)(v32 + 40), v35);
        v15 = 0;
        uint64_t v24 = 3;
        goto LABEL_31;
      }
      if (v23 == (id)1)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 2;
        if (!v15) {
          goto LABEL_28;
        }
LABEL_22:
        v28 = 0;
LABEL_31:

        _Block_object_dispose(buf, 8);
        goto LABEL_32;
      }
      v30 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_1001024EC();
      }
    }
    else
    {
      if (!v12)
      {
LABEL_27:
        uint64_t v25 = 0;
        goto LABEL_28;
      }
      v15 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001024B8();
      }
    }

    goto LABEL_27;
  }
  v26 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CoreRepairCore is unavailable. Falling back to attestation blob", buf, 2u);
  }

  uint64_t v27 = v48[0];
  id v34 = *(id *)(v48[0] + 40);
  v28 = [(DAStrongDeviceIdentity *)self requestAttestationBlobWithOptions:v7 error:&v34];
  id v29 = v34;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v15 = 0;
  v10 = *(NSObject **)(v27 + 40);
  *(void *)(v27 + 40) = v29;
LABEL_32:

  [(DAStrongDeviceIdentity *)self setCertData:v15];
  v6[2](v6, v28, v15, v25, v24, *(void *)(v48[0] + 40));

  _Block_object_dispose(&v47, 8);
}

- (id)signPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(DAStrongDeviceIdentity *)self deviceIdentityKey])
  {
    v7 = [(DAStrongDeviceIdentity *)self SHA256ForData:v6];
    if (v7)
    {
      v8 = [(DAStrongDeviceIdentity *)self signDigest:v7 error:a4];
      v9 = 0;
    }
    else
    {
      dispatch_time_t v11 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100102608();
      }

      v9 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:1 userInfo:0];
      v8 = 0;
    }

    if (v9) {
LABEL_12:
    }
      +[DSAnalytics sendAnalyticsWithEvent:1 error:v9];
  }
  else
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001025D4();
    }

    v9 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:0 userInfo:0];
    v8 = 0;
    if (v9) {
      goto LABEL_12;
    }
  }
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (id)signFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(DAStrongDeviceIdentity *)self deviceIdentityKey])
  {
    v7 = [v6 path];
    v8 = +[NSFileHandle fileHandleForReadingAtPath:v7];

    if (v8)
    {
      v9 = [(DAStrongDeviceIdentity *)self SHA256ForFileHandle:v8];
      if (v9)
      {
        v10 = [(DAStrongDeviceIdentity *)self signDigest:v9 error:a4];
      }
      else
      {
        uint64_t v14 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100102704();
        }

        if (a4)
        {
          +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:3 userInfo:0];
          v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
      }

      intptr_t v12 = 0;
    }
    else
    {
      v13 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100102670(v6, v13);
      }

      intptr_t v12 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:2 userInfo:0];
      v10 = 0;
    }

    if (a4) {
LABEL_19:
    }
      *a4 = v12;
  }
  else
  {
    dispatch_time_t v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10010263C();
    }

    intptr_t v12 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:0 userInfo:0];
    v10 = 0;
    if (a4) {
      goto LABEL_19;
    }
  }

  return v10;
}

- (id)SHA256ForData:(id)a3
{
  id v3 = a3;
  v4 = [v3 length];
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFD)
  {
    v5 = 0;
  }
  else
  {
    CC_SHA256([v3 bytes], (CC_LONG)v4, (unsigned __int8 *)&v7);
    v5 = +[NSData dataWithBytes:&v7 length:32];
  }

  return v5;
}

- (id)SHA256ForFileHandle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 offsetInFile];
  [v3 seekToFileOffset:0];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  do
  {
    v5 = [v3 readDataOfLength:0x10000];
    id v6 = [v5 length];
    id v7 = v5;
    CC_SHA256_Update(&c, [v7 bytes], (CC_LONG)v6);
  }
  while (v6);
  [v3 seekToFileOffset:v4];
  memset(v10, 0, sizeof(v10));
  CC_SHA256_Final((unsigned __int8 *)v10, &c);
  v8 = +[NSData dataWithBytes:v10 length:32];

  return v8;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = SecKeyCreateSignature([(DAStrongDeviceIdentity *)self deviceIdentityKey], kSecKeyAlgorithmECDSASignatureDigestX962SHA256, v6, &error);

  if (!v7)
  {
    CFErrorRef v8 = error;
    v9 = error;
    v10 = DiagnosticLogHandleForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        intptr_t v12 = [(__CFError *)v9 description];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to create signature with underlying CFErrorRef error = (%@).", buf, 0xCu);
      }
      NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
      uint64_t v17 = v9;
      v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      if (!a4) {
        goto LABEL_7;
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to create signature.", buf, 2u);
      }

      v13 = 0;
      if (!a4) {
        goto LABEL_7;
      }
    }
    *a4 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:4 userInfo:v13];
LABEL_7:
  }

  return v7;
}

- (id)requestAttestationBlobWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(DAStrongDeviceIdentity *)self purgeSecurityKey];
  [(DAStrongDeviceIdentity *)self deviceIdentityKey];
  v14[1] = 0;
  CFDataRef v7 = DeviceIdentityCopyAttestationDictionary();

  id v8 = 0;
  if (!v7
    || (v14[0] = 0,
        +[NSPropertyListSerialization dataWithPropertyList:v7 format:100 options:0 error:v14], v9 = objc_claimAutoreleasedReturnValue(), v10 = v14[0], v8, id v8 = v10, !v9))
  {
    if (v8)
    {
      if (a4)
      {
        NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
        id v16 = v8;
        BOOL v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        *a4 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:5 userInfo:v11];
      }
    }
    else if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"com.apple.Diagnostics.StrongDeviceIdentityError" code:5 userInfo:0];
    }
    intptr_t v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100102738();
    }

    +[DSAnalytics sendAnalyticsWithEvent:0 error:v8];
    v9 = 0;
  }

  return v9;
}

- (id)deviceIdentityPublicKeyDigest
{
  CFErrorRef error = 0;
  id v3 = SecKeyCopyPublicKey([(DAStrongDeviceIdentity *)self deviceIdentityKey]);
  CFDataRef v4 = SecKeyCopyExternalRepresentation(v3, &error);
  CFRelease(v3);
  if (error)
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001027AC((uint64_t)&error, v5, v6, v7, v8, v9, v10, v11);
    }

    intptr_t v12 = 0;
  }
  else
  {
    intptr_t v12 = [(DAStrongDeviceIdentity *)self SHA256ForData:v4];
  }

  return v12;
}

- (id)deviceIdentityCert
{
  return [(DAStrongDeviceIdentity *)self certData];
}

- (void)requestAttestationCertWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_100024F00())
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = sub_100023ED0;
    v18[4] = sub_100023EE0;
    id v19 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_100023ED0;
    v16[4] = sub_100023EE0;
    id v17 = 0;
    uint64_t v7 = dispatch_queue_create("com.apple.Diagnostics.requestAttestationCertificate", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024C88;
    block[3] = &unk_10014C130;
    dispatch_group_t v11 = dispatch_group_create();
    id v12 = v5;
    uint64_t v14 = v18;
    NSErrorUserInfoKey v15 = v16;
    id v13 = v6;
    uint64_t v8 = v11;
    dispatch_group_async(v8, v7, block);

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v18, 8);
  }
  else
  {
    uint64_t v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10010281C();
    }
  }
}

- (__SecKey)deviceIdentityKey
{
  return self->_deviceIdentityKey;
}

- (void)setDeviceIdentityKey:(__SecKey *)a3
{
  self->_deviceIdentityKey = a3;
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end