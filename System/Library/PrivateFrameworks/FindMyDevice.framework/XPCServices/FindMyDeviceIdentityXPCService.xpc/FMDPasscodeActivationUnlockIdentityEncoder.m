@interface FMDPasscodeActivationUnlockIdentityEncoder
- (BOOL)_certificateRequestAndRefKeyWithError:(id *)a3;
- (FMDPasscodeActivationUnlockCertificateDataSource)certificateDataSource;
- (FMDPasscodeActivationUnlockIdentityEncoder)initWithCertificateDataSource:(id)a3 signatureDataSource:(id)a4;
- (FMDPasscodeActivationUnlockSignatureDataSource)signatureDataSource;
- (NSDictionary)certRequest;
- (__SecKey)refKey;
- (id)_payloadWithContext:(id)a3 error:(id *)a4;
- (id)_signatureForPayload:(id)a3 error:(id *)a4;
- (void)_populateDeviceIdentifiersIntoDict:(id)a3;
- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4;
- (void)setCertRequest:(id)a3;
- (void)setCertificateDataSource:(id)a3;
- (void)setRefKey:(__SecKey *)a3;
- (void)setSignatureDataSource:(id)a3;
@end

@implementation FMDPasscodeActivationUnlockIdentityEncoder

- (FMDPasscodeActivationUnlockIdentityEncoder)initWithCertificateDataSource:(id)a3 signatureDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDPasscodeActivationUnlockIdentityEncoder;
  v9 = [(FMDPasscodeActivationUnlockIdentityEncoder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificateDataSource, a3);
    objc_storeStrong((id *)&v10->_signatureDataSource, a4);
  }

  return v10;
}

- (void)identityForPasscodeActivationUnlockWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = +[NSMutableDictionary dictionary];
  v25[0] = 0;
  v9 = [(FMDPasscodeActivationUnlockIdentityEncoder *)self _payloadWithContext:v6 error:v25];
  id v10 = v25[0];
  v11 = [v9 base64EncodedStringWithOptions:0];
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", @"payload", v11);
  if (!v10)
  {
    id v24 = 0;
    [(FMDPasscodeActivationUnlockIdentityEncoder *)self _certificateRequestAndRefKeyWithError:&v24];
    id v10 = v24;
    objc_super v12 = [(FMDPasscodeActivationUnlockIdentityEncoder *)self certRequest];
    objc_msgSend(v8, "fm_safelyMapKey:toObject:", @"certRequest", v12);

    if (!v10)
    {
      id v23 = 0;
      v13 = [(FMDPasscodeActivationUnlockIdentityEncoder *)self _signatureForPayload:v9 error:&v23];
      id v10 = v23;
      v14 = [v13 base64EncodedStringWithOptions:0];
      objc_msgSend(v8, "fm_safelyMapKey:toObject:", @"signature", v14);
    }
  }
  v15 = [v10 description];
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", @"error", v15);

  v16 = sub_100005770();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "resultDict : %@", buf, 0xCu);
  }

  id v22 = 0;
  v17 = +[NSJSONSerialization dataWithJSONObject:v8 options:0 error:&v22];
  id v18 = v22;
  if (v18)
  {
    v19 = sub_100005770();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100007F28();
    }
  }
  v20 = [v17 base64EncodedStringWithOptions:0];
  if (v7)
  {
    if (v18) {
      id v21 = v18;
    }
    else {
      id v21 = v10;
    }
    ((void (**)(id, void *, id))v7)[2](v7, v20, v21);
  }
}

- (id)_payloadWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionaryWithDictionary:v6];
  [(FMDPasscodeActivationUnlockIdentityEncoder *)self _populateDeviceIdentifiersIntoDict:v7];
  id v8 = sub_100005770();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Payload dict : %@", buf, 0xCu);
  }

  id v14 = 0;
  v9 = +[NSJSONSerialization dataWithJSONObject:v7 options:0 error:&v14];
  id v10 = v14;
  if (v10)
  {
    v11 = sub_100005770();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100007F28();
    }

    if (a4)
    {
      NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
      v16[0] = v10;
      objc_super v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.PasscodeActivationUnlock" code:0 userInfo:v12];
    }
  }

  return v9;
}

- (void)_populateDeviceIdentifiersIntoDict:(id)a3
{
  id v3 = a3;
  v4 = +[FMSystemInfo sharedInstance];
  v5 = [v4 deviceUDID];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"udid", v5);

  id v6 = +[FMSystemInfo sharedInstance];
  id v7 = [v6 imei];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"imei", v7);

  id v8 = +[FMSystemInfo sharedInstance];
  v9 = [v8 meid];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"meid", v9);

  id v10 = +[FMSystemInfo sharedInstance];
  v11 = [v10 serialNumber];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"serialNumber", v11);

  objc_super v12 = +[FMSystemInfo sharedInstance];
  v13 = [v12 ecid];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v13 longLongValue]);
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"ecid", v14);

  NSErrorUserInfoKey v15 = +[FMSystemInfo sharedInstance];
  v16 = [v15 chipId];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%llx", [v16 longLongValue]);
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"chipId", v17);

  id v18 = +[FMSystemInfo sharedInstance];
  v19 = [v18 wifiMacAddress];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"wifiMac", v19);

  id v21 = +[FMSystemInfo sharedInstance];
  v20 = [v21 btMacAddress];
  objc_msgSend(v3, "fm_safelyMapKey:toObject:", @"btMac", v20);
}

- (BOOL)_certificateRequestAndRefKeyWithError:(id *)a3
{
  uint64_t v15 = 0;
  v5 = [(FMDPasscodeActivationUnlockIdentityEncoder *)self certificateDataSource];
  id v13 = 0;
  id v14 = 0;
  [v5 passcodeActivationUnlockCertificateRequest:&v14 withValidityInMins:10 refKey:&v15 error:&v13];
  id v6 = v14;
  id v7 = v13;

  if (!v7)
  {
    v9 = [v6 HTTPBody];
    id v8 = [v9 base64EncodedStringWithOptions:0];

    id v10 = +[NSMutableDictionary dictionary];
    v11 = [v6 allHTTPHeaderFields];
    objc_msgSend(v10, "fm_safelyMapKey:toObject:", @"headers", v11);

    objc_msgSend(v10, "fm_safelyMapKey:toObject:", @"body", v8);
    [(FMDPasscodeActivationUnlockIdentityEncoder *)self setCertRequest:v10];
    [(FMDPasscodeActivationUnlockIdentityEncoder *)self setRefKey:v15];

    goto LABEL_5;
  }
  if (a3)
  {
    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    id v17 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.PasscodeActivationUnlock" code:1 userInfo:v8];
LABEL_5:
  }
  return v7 != 0;
}

- (id)_signatureForPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(FMDPasscodeActivationUnlockIdentityEncoder *)self signatureDataSource];
  id v12 = 0;
  id v8 = objc_msgSend(v7, "passcodeActivationUnlockSignatureForPayload:usingKey:error:", v6, -[FMDPasscodeActivationUnlockIdentityEncoder refKey](self, "refKey"), &v12);

  id v9 = v12;
  if (!v8)
  {
    if (v9)
    {
      NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
      id v14 = v9;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      if (!a4)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      id v10 = 0;
      if (!a4) {
        goto LABEL_5;
      }
    }
    *a4 = +[NSError errorWithDomain:@"com.apple.icloud.findmydevice.PasscodeActivationUnlock" code:2 userInfo:v10];
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (NSDictionary)certRequest
{
  return self->_certRequest;
}

- (void)setCertRequest:(id)a3
{
}

- (__SecKey)refKey
{
  return self->_refKey;
}

- (void)setRefKey:(__SecKey *)a3
{
}

- (FMDPasscodeActivationUnlockCertificateDataSource)certificateDataSource
{
  return self->_certificateDataSource;
}

- (void)setCertificateDataSource:(id)a3
{
}

- (FMDPasscodeActivationUnlockSignatureDataSource)signatureDataSource
{
  return self->_signatureDataSource;
}

- (void)setSignatureDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDataSource, 0);
  objc_storeStrong((id *)&self->_certificateDataSource, 0);

  objc_storeStrong((id *)&self->_certRequest, 0);
}

@end