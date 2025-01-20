@interface FMDMagSafeRawInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)authPassed;
- (BOOL)enableCAAPI:(id)a3;
- (BOOL)hasEnoughInformation;
- (BOOL)infoAvailable;
- (BOOL)isMF4i;
- (BOOL)isNVMSetup;
- (BOOL)keysAvailable;
- (FMDACCConnectionInfo)connectionInfo;
- (FMDMagSafeRawInfo)initWithCoder:(id)a3;
- (FMDMagSafeRawInfo)initWithConnectionInfo:(id)a3;
- (FMDRemoteUnlockPairingData)pairingData;
- (NSData)certificate;
- (NSNumber)authStatus;
- (NSString)accessoryType;
- (NSString)connectionUUID;
- (NSString)coreAccessoryUID;
- (NSString)description;
- (NSString)email;
- (NSString)endPointUUID;
- (NSString)firmwareVersion;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)serialNumber;
- (NSString)style;
- (int)protocol;
- (int)transportType;
- (void)beginUserKeyEraseWithCompletion:(id)a3;
- (void)cancelUserKeyEraseWithCompletion:(id)a3;
- (void)cancelVendorKeyEraseWithCompletion:(id)a3;
- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7;
- (void)copyUserPrivateKeyWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getAuthNonceWithCompletion:(id)a3;
- (void)getPairingDataWithCompletion:(id)a3;
- (void)getPairingStatus;
- (void)removeKeysWithCompletion:(id)a3;
- (void)setAccessoryType:(id)a3;
- (void)setAuthStatus:(id)a3;
- (void)setCertificate:(id)a3;
- (void)setConnectionInfo:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setCoreAccessoryUID:(id)a3;
- (void)setEmail:(id)a3;
- (void)setEndPointUUID:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setInfoAvailable:(BOOL)a3;
- (void)setIsNVMSetup:(BOOL)a3;
- (void)setKeysAvailable:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setName:(id)a3 withCompletion:(id)a4;
- (void)setPairingData:(id)a3;
- (void)setPairingData:(id)a3 withCompletion:(id)a4;
- (void)setPhoneNumber:(id)a3;
- (void)setProtocol:(int)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setupKeysWithCompletion:(id)a3;
- (void)updateWithAccessoryInfo:(id)a3;
- (void)updateWithProperties:(id)a3;
- (void)vendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7;
@end

@implementation FMDMagSafeRawInfo

- (FMDMagSafeRawInfo)initWithConnectionInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDMagSafeRawInfo;
  v5 = [(FMDMagSafeRawInfo *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FMDMagSafeRawInfo *)v5 setConnectionInfo:v4];
  }

  return v6;
}

- (BOOL)isMF4i
{
  return [(FMDMagSafeRawInfo *)self protocol] == 14;
}

- (BOOL)authPassed
{
  if ([(FMDMagSafeRawInfo *)self protocol] != 14
    || ![(FMDMagSafeRawInfo *)self infoAvailable])
  {
    return 0;
  }
  v3 = [(FMDMagSafeRawInfo *)self authStatus];
  unsigned __int8 v4 = [v3 isEqualToNumber:&off_100039868];

  return v4;
}

- (void)updateWithAccessoryInfo:(id)a3
{
  id v4 = a3;
  v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateWithAccessoryInfo with %@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v6 = kACCInfo_SerialNumber;
  uint64_t v7 = [v4 objectForKeyedSubscript:kACCInfo_SerialNumber];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [v4 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [v4 objectForKeyedSubscript:v6];
      [(FMDMagSafeRawInfo *)self setSerialNumber:v11];
    }
  }
  [(FMDMagSafeRawInfo *)self setFirmwareVersion:@"1.1.1"];
  uint64_t v12 = kACCInfo_AccessoryDeviceUID;
  uint64_t v13 = [v4 objectForKeyedSubscript:kACCInfo_AccessoryDeviceUID];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v4 objectForKeyedSubscript:v12];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if (v16)
    {
      v17 = [v4 objectForKeyedSubscript:v12];
      [(FMDMagSafeRawInfo *)self setCoreAccessoryUID:v17];
    }
  }
}

- (void)updateWithProperties:(id)a3
{
  id v4 = a3;
  v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v50 = 138412290;
    id v51 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateWithProperties with %@", (uint8_t *)&v50, 0xCu);
  }

  uint64_t v6 = kACCProperties_Endpoint_NFC_Type;
  uint64_t v7 = [v4 objectForKeyedSubscript:kACCProperties_Endpoint_NFC_Type];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [v4 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [v4 objectForKeyedSubscript:v6];
      uint64_t v12 = [v11 stringValue];
      [(FMDMagSafeRawInfo *)self setAccessoryType:v12];
    }
  }
  uint64_t v13 = kACCProperties_Endpoint_NFC_WashIndex;
  uint64_t v14 = [v4 objectForKeyedSubscript:kACCProperties_Endpoint_NFC_WashIndex];
  if (v14)
  {
    v15 = (void *)v14;
    char v16 = [v4 objectForKeyedSubscript:v13];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      int v18 = [v4 objectForKeyedSubscript:v13];
      id v19 = [v18 stringValue];
      [(FMDMagSafeRawInfo *)self setStyle:v19];

      v20 = sub_100003338();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(FMDMagSafeRawInfo *)self style];
        int v50 = 138412290;
        id v51 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#colorTesting color of wallet = %@", (uint8_t *)&v50, 0xCu);
      }
    }
  }
  uint64_t v22 = kACCExternalAccessoryAuthStatusKey;
  uint64_t v23 = [v4 objectForKeyedSubscript:kACCExternalAccessoryAuthStatusKey];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [v4 objectForKeyedSubscript:v22];
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    if (v26)
    {
      v27 = [v4 objectForKeyedSubscript:v22];
      [(FMDMagSafeRawInfo *)self setAuthStatus:v27];
    }
  }
  uint64_t v28 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
  if (v28
    && (v29 = (void *)v28,
        [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"],
        v30 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v31 = objc_opt_isKindOfClass(),
        v30,
        v29,
        (v31 & 1) != 0))
  {
    v32 = sub_100003338();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
      v34 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
      v35 = objc_opt_class();
      int v50 = 138412546;
      id v51 = v33;
      __int16 v52 = 2112;
      v53 = v35;
      id v36 = v35;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "FMDMagSafeRawInfo: get NFC_InfoAvailable  = %@ %@", (uint8_t *)&v50, 0x16u);
    }
    CFBooleanRef v37 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
    [(FMDMagSafeRawInfo *)self setInfoAvailable:CFBooleanGetValue(v37) != 0];
  }
  else
  {
    v38 = sub_100003338();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
      v40 = [v4 objectForKeyedSubscript:@"NFC_InfoAvailable"];
      v41 = objc_opt_class();
      int v50 = 138412546;
      id v51 = v39;
      __int16 v52 = 2112;
      v53 = v41;
      id v42 = v41;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "FMDMagSafeRawInfo: get NFC_InfoAvailable unexpected  = %@ %@", (uint8_t *)&v50, 0x16u);
    }
    [(FMDMagSafeRawInfo *)self setInfoAvailable:0];
  }
  uint64_t v43 = [v4 objectForKeyedSubscript:@"ACCMFi4PairingStatus"];
  if (v43
    && (v44 = (void *)v43,
        [v4 objectForKeyedSubscript:@"ACCMFi4PairingStatus"],
        v45 = objc_claimAutoreleasedReturnValue(),
        char v46 = objc_opt_respondsToSelector(),
        v45,
        v44,
        (v46 & 1) != 0))
  {
    v47 = [v4 objectForKeyedSubscript:@"ACCMFi4PairingStatus"];
    unsigned int v48 = [v47 integerValue];

    [(FMDMagSafeRawInfo *)self setIsNVMSetup:(v48 & 0xFFFFFFFE) == 2];
    [(FMDMagSafeRawInfo *)self setKeysAvailable:v48 == 2];
  }
  else
  {
    v49 = sub_100003338();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v50) = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "did not get ACCMFi4PairingStatus", (uint8_t *)&v50, 2u);
    }
  }
}

- (BOOL)hasEnoughInformation
{
  v3 = [(FMDMagSafeRawInfo *)self serialNumber];
  if (v3)
  {
    id v4 = [(FMDMagSafeRawInfo *)self accessoryType];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"FMDMagSafeRawInfo(0x%lx) \name - %@, serialNumber - %@, accessoryType - %@, color - %@, nvm - %d, keysAvailable - %d", self, self->_name, self->_serialNumber, self->_accessoryType, self->_style, self->_isNVMSetup, self->_keysAvailable];
}

- (NSString)name
{
  if (!self->_name && [(FMDMagSafeRawInfo *)self authPassed])
  {
    v3 = dispatch_group_create();
    id v4 = [(FMDMagSafeRawInfo *)self endPointUUID];
    if ([(FMDMagSafeRawInfo *)self enableCAAPI:@"enableGetAccessoryUserName"])
    {
      dispatch_group_enter(v3);
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      uint64_t v22 = sub_100011678;
      uint64_t v23 = sub_100011688;
      id v24 = 0;
      BOOL v5 = sub_100003338();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling getAccessoryUserName", buf, 2u);
      }

      uint64_t v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100011690;
      v16[3] = &unk_100034D80;
      int v18 = &v19;
      uint64_t v7 = v3;
      char v17 = v7;
      [v6 getAccessoryUserName:v4 withReply:v16];

      dispatch_time_t v8 = dispatch_time(0, 5000000000);
      intptr_t v9 = dispatch_group_wait(v7, v8);
      if (v9)
      {
        intptr_t v10 = v9;
        name = sub_100003338();
        if (os_log_type_enabled(name, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = v20[5];
          *(_DWORD *)buf = 134218242;
          intptr_t v26 = v10;
          __int16 v27 = 2112;
          uint64_t v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, name, OS_LOG_TYPE_DEFAULT, "#CA timeout while trying to getAccessoryUserName error %ld result = %@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v13 = (NSString *)(id)v20[5];
        name = self->_name;
        self->_name = v13;
      }

      _Block_object_dispose(&v19, 8);
    }
  }
  uint64_t v14 = self->_name;

  return v14;
}

- (void)getPairingStatus
{
  v3 = dispatch_group_create();
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  BOOL v5 = [(FMDMagSafeRawInfo *)self endPointUUID];
  if ([(FMDMagSafeRawInfo *)self enableCAAPI:@"enableGetPairingStatus"]
    && [(FMDMagSafeRawInfo *)self authPassed])
  {
    dispatch_group_enter(v3);
    uint64_t v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CA calling getPairingStatus", buf, 2u);
    }

    *(void *)buf = 0;
    uint64_t v23 = buf;
    uint64_t v24 = 0x2020000000;
    int v25 = 0;
    uint64_t v7 = [(FMDMagSafeRawInfo *)self connectionInfo];
    char v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    int v18 = sub_100011AB4;
    uint64_t v19 = &unk_100034DA8;
    uint64_t v21 = buf;
    dispatch_time_t v8 = v3;
    v20 = v8;
    [v7 getPairingStatus:v5 withReply:&v16];

    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    intptr_t v10 = dispatch_group_wait(v8, v9);
    uint64_t v11 = *((int *)v23 + 6);
    if (v11 >= 4) {
      CFStringRef v12 = @"no value";
    }
    else {
      CFStringRef v12 = *(&off_100034F08 + v11);
    }
    uint64_t v13 = sub_100003338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((_DWORD *)v23 + 6);
      *(_DWORD *)intptr_t v26 = 67109378;
      *(_DWORD *)__int16 v27 = v14;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#CA pairningstatus = %d %@", v26, 0x12u);
    }

    if (v10)
    {
      v15 = sub_100003338();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)intptr_t v26 = 134218242;
        *(void *)__int16 v27 = v10;
        *(_WORD *)&v27[8] = 2112;
        *(void *)&v27[10] = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#CA timeout while trying to getPairingStatus error %ld result = %@", v26, 0x16u);
      }
    }
    else
    {
      -[FMDMagSafeRawInfo setIsNVMSetup:](self, "setIsNVMSetup:", (*((_DWORD *)v23 + 6) & 0xFFFFFFFE) == 2, v16, v17, v18, v19);
      [(FMDMagSafeRawInfo *)self setKeysAvailable:*((_DWORD *)v23 + 6) == 2];
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)setPairingData:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = sub_100003338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setting pairing Data", buf, 2u);
  }

  dispatch_time_t v9 = [v6 data];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v11 = 0;
  int v12 = 4;
  do
  {
    if ((unint64_t)((unsigned char *)[v9 length] - v11) < 0xF0)
    {
      if ([v9 length] == v11)
      {
        id v14 = objc_alloc_init((Class)NSData);
        [v10 addObject:v14];
      }
      else
      {
        v15 = [v9 subdataWithRange:v11 length:[v9 length] - v11];
        [v10 addObject:v15];

        uint64_t v11 = (char *)[v9 length];
      }
    }
    else
    {
      uint64_t v13 = [v9 subdataWithRange:v11, 240];
      [v10 addObject:v13];

      v11 += 240;
    }
    --v12;
  }
  while (v12);
  v32[0] = &off_100039880;
  char v16 = [v10 objectAtIndexedSubscript:0];
  v33[0] = v16;
  v32[1] = &off_100039898;
  uint64_t v17 = [v10 objectAtIndexedSubscript:1];
  v33[1] = v17;
  v32[2] = &off_1000398B0;
  int v18 = [v10 objectAtIndexedSubscript:2];
  v33[2] = v18;
  v32[3] = &off_1000398C8;
  uint64_t v19 = [v10 objectAtIndexedSubscript:3];
  v33[3] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

  uint64_t v21 = sub_100003338();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#CA calling setPublicNVMKeyValues with %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v22 = [(FMDMagSafeRawInfo *)self connectionInfo];
  uint64_t v23 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100011F84;
  v26[3] = &unk_100034DD0;
  objc_copyWeak(&v29, (id *)buf);
  id v24 = v6;
  id v27 = v24;
  id v25 = v7;
  id v28 = v25;
  [v22 setPublicNVMKeyValues:v20 forEndpoint:v23 withReply:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

- (void)getPairingDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = [(FMDMagSafeRawInfo *)self pairingData];

  if (v5)
  {
    id v6 = [(FMDMagSafeRawInfo *)self pairingData];
    v4[2](v4, v6, 0);
  }
  else
  {
    id v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v8 = [(FMDMagSafeRawInfo *)self endPointUUID];
      *(_DWORD *)buf = 138412546;
      char v16 = v8;
      __int16 v17 = 2112;
      int v18 = &off_100039940;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CA calling getPublicNVMKeyValues %@ %@", buf, 0x16u);
    }
    dispatch_time_t v9 = [(FMDMagSafeRawInfo *)self connectionInfo];
    id v10 = [(FMDMagSafeRawInfo *)self endPointUUID];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100012238;
    v11[3] = &unk_100034DF8;
    int v12 = &off_100039940;
    uint64_t v13 = self;
    id v14 = v4;
    [v9 getPublicNVMKeyValues:&off_100039940 forEndpoint:v10 withReply:v11];
  }
}

- (void)setName:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = sub_100003338();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setting accessory name", (uint8_t *)buf, 2u);
  }

  if ([(FMDMagSafeRawInfo *)self enableCAAPI:@"enableSetAccessoryUserName"])
  {
    dispatch_time_t v9 = sub_100003338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#CA calling setAccessoryUserName", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v10 = dispatch_get_global_queue(2, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000126A0;
    v11[3] = &unk_100034E20;
    void v11[4] = self;
    id v12 = v6;
    objc_copyWeak(&v14, buf);
    id v13 = v7;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  else
  {
    [(FMDMagSafeRawInfo *)self setName:v6];
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)setupKeysWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provisioning keys for accessory", (uint8_t *)buf, 2u);
  }

  if ([(FMDMagSafeRawInfo *)self isNVMSetup])
  {
    id v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001F4E0(v6);
    }

    id v7 = +[NSError fm_genericError];
    v4[2](v4, v7);
  }
  else
  {
    objc_initWeak(buf, self);
    if ([(FMDMagSafeRawInfo *)self enableCAAPI:@"enableProvisionAccessoryForFindMy"])
    {
      dispatch_time_t v8 = sub_100003338();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CA calling provisionAccessoryForFindMy", v13, 2u);
      }

      dispatch_time_t v9 = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012AC8;
      block[3] = &unk_100034E70;
      block[4] = self;
      objc_copyWeak(&v12, buf);
      uint64_t v11 = v4;
      dispatch_async(v9, block);

      objc_destroyWeak(&v12);
    }
    else
    {
      [(FMDMagSafeRawInfo *)self setIsNVMSetup:1];
      [(FMDMagSafeRawInfo *)self setKeysAvailable:1];
      v4[2](v4, 0);
    }
    objc_destroyWeak(buf);
  }
}

- (void)removeKeysWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "### removing keys for accessory", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if ([(FMDMagSafeRawInfo *)self enableCAAPI:@"enableResetPairingInformation"])
  {
    id v6 = sub_100003338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### #CA calling resetPairingInformation", v13, 2u);
    }

    id v7 = [(FMDMagSafeRawInfo *)self connectionInfo];
    dispatch_time_t v8 = [(FMDMagSafeRawInfo *)self endPointUUID];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012EB0;
    v10[3] = &unk_100034E48;
    objc_copyWeak(&v12, buf);
    id v11 = v4;
    [v7 resetPairingInformation:v8 withReply:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    [(FMDMagSafeRawInfo *)self setIsNVMSetup:0];
    [(FMDMagSafeRawInfo *)self setKeysAvailable:0];
    dispatch_time_t v9 = +[NSError fm_genericError];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
  objc_destroyWeak(buf);
}

- (void)getAuthNonceWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling beginVendorKeyErase", buf, 2u);
  }

  id v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
  id v7 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000130B8;
  v9[3] = &unk_100034E98;
  id v10 = v4;
  id v8 = v4;
  [v6 beginVendorKeyErase:v7 withReply:v9];
}

- (void)vendorKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = sub_100003338();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#CA calling continueVendorKeyErase", buf, 2u);
  }

  int v18 = [(FMDMagSafeRawInfo *)self connectionInfo];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000132FC;
  v20[3] = &unk_100034EC0;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  [v18 continueVendorKeyErase:v16 withSignature:v15 andAccessoryNonce:v14 forEndpoint:v13 withReply:v20];
}

- (void)copyUserPrivateKeyWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling copyUserPrivateKey", buf, 2u);
  }

  id v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
  id v7 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000134F4;
  v9[3] = &unk_100034E98;
  id v10 = v4;
  id v8 = v4;
  [v6 copyUserPrivateKey:v7 withReply:v9];
}

- (void)beginUserKeyEraseWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling beginUserKeyErase", buf, 2u);
  }

  id v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
  id v7 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000136F0;
  v9[3] = &unk_100034E98;
  id v10 = v4;
  id v8 = v4;
  [v6 beginUserKeyErase:v7 withReply:v9];
}

- (void)continueUserKeyErase:(id)a3 withSignature:(id)a4 andAccessoryNonce:(id)a5 forEndpoint:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  __int16 v17 = sub_100003338();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#CA calling continueUserKeyErase", buf, 2u);
  }

  int v18 = [(FMDMagSafeRawInfo *)self connectionInfo];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100013934;
  v20[3] = &unk_100034EC0;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  [v18 continueUserKeyErase:v16 withSignature:v15 andAccessoryNonce:v14 forEndpoint:v13 withReply:v20];
}

- (void)cancelUserKeyEraseWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling cancelUserKeyErase", buf, 2u);
  }

  id v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
  id v7 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013B2C;
  v9[3] = &unk_100034EE8;
  id v10 = v4;
  id v8 = v4;
  [v6 cancelUserKeyErase:v7 withReply:v9];
}

- (void)cancelVendorKeyEraseWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CA calling cancelVendorKeyErase", buf, 2u);
  }

  id v6 = [(FMDMagSafeRawInfo *)self connectionInfo];
  id v7 = [(FMDMagSafeRawInfo *)self endPointUUID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013D0C;
  v9[3] = &unk_100034EE8;
  id v10 = v4;
  id v8 = v4;
  [v6 cancelVendorKeyErase:v7 withReply:v9];
}

- (BOOL)enableCAAPI:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDMagSafeRawInfo *)self accessoryType];
  [v4 encodeObject:v5 forKey:@"accessoryType"];
}

- (FMDMagSafeRawInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDMagSafeRawInfo;
  id v5 = [(FMDMagSafeRawInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryType"];
    accessoryType = v5->_accessoryType;
    v5->_accessoryType = (NSString *)v6;
  }
  return v5;
}

- (NSString)coreAccessoryUID
{
  return self->_coreAccessoryUID;
}

- (void)setCoreAccessoryUID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endPointUUID
{
  return self->_endPointUUID;
}

- (void)setEndPointUUID:(id)a3
{
}

- (NSNumber)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(id)a3
{
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (void)setInfoAvailable:(BOOL)a3
{
  self->_infoAvailable = a3;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (BOOL)isNVMSetup
{
  return self->_isNVMSetup;
}

- (void)setIsNVMSetup:(BOOL)a3
{
  self->_isNVMSetup = a3;
}

- (BOOL)keysAvailable
{
  return self->_keysAvailable;
}

- (void)setKeysAvailable:(BOOL)a3
{
  self->_keysAvailable = a3;
}

- (int)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(int)a3
{
  self->_protocol = a3;
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (FMDACCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
}

- (FMDRemoteUnlockPairingData)pairingData
{
  return self->_pairingData;
}

- (void)setPairingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingData, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_authStatus, 0);
  objc_storeStrong((id *)&self->_endPointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_coreAccessoryUID, 0);
}

@end