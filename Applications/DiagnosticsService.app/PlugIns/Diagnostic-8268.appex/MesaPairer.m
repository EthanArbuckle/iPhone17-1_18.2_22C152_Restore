@interface MesaPairer
- (BOOL)loadMSRkWithData:(id)a3 error:(id *)a4;
- (BOOL)mesaPhysicalPresenceAsserted;
- (MesaPairerInputs)inputs;
- (id)createFDROptions;
- (int)mesaProtocolVersion;
- (int64_t)verifyMSRkWithError:(id *)a3;
- (void)cancel;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation MesaPairer

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[MesaPairer setupWithInputs:responder:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v11, 0x20u);
  }

  [(MesaPairer *)self setInputs:v6];
  v9 = [(MesaPairer *)self inputs];

  if (!v9)
  {
    v10 = [(MesaPairer *)self result];
    [v10 setStatusCode:&off_100015598];

    [(MesaPairer *)self setFinished:1];
  }
}

- (void)start
{
  uint64_t v68 = 128;
  uint64_t v69 = 0;
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v77 = "-[MesaPairer start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  AMSupportLogSetHandler();
  v4 = [(MesaPairer *)self result];
  [v4 setStatusCode:&off_1000155B0];

  v67 = self;
  if (sub_10000D97C((int *)&v69 + 1))
  {
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100010214();
    }

    id v6 = [(MesaPairer *)self result];
    id v7 = v6;
    v8 = &off_1000155C8;
LABEL_7:
    [v6 setStatusCode:v8];

    uint64_t v9 = 0;
    id v10 = 0;
    int v11 = 0;
    CFStringRef v12 = 0;
    HIDWORD(v69) = 0;
    goto LABEL_8;
  }
  if (sub_10000E030((char *)buf, &v68))
  {
    if (HIDWORD(v69) != 7)
    {
      v44 = handleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_1000101E0();
      }

      id v6 = [(MesaPairer *)self result];
      id v7 = v6;
      v8 = &off_1000155E0;
      goto LABEL_7;
    }
    int v11 = 0;
  }
  else
  {
    int v11 = +[NSData dataWithBytes:buf length:v68];
    v42 = handleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v11 description];
      *(_DWORD *)v74 = 138412290;
      id v75 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Mesa sensor serial number: %@", v74, 0xCu);
    }
  }
  if ([(MesaPairer *)self mesaProtocolVersion] >= 2
    && [(MesaPairer *)self mesaPhysicalPresenceAsserted])
  {
    LODWORD(v9) = 1;
  }
  else
  {
    uint64_t v9 = 0;
    if ([(MesaPairer *)self mesaProtocolVersion] > 1 || (HIDWORD(v69) & 0xFFFFFFFE) == 4)
    {
      [(MesaPairer *)self mesaProtocolVersion];
      uint64_t v68 = 128;
      if (sub_10000DCA0((char *)buf, &v68))
      {
        id v10 = 0;
      }
      else
      {
        id v45 = objc_alloc((Class)NSString);
        id v10 = [v45 initWithBytes:buf length:v68 encoding:4];
        v46 = handleForCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 138412290;
          id v75 = v10;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Mesa Module serial number: %@", v74, 0xCu);
        }
      }
      v47 = [(MesaPairer *)self result];
      [v47 setStatusCode:&off_100015658];

      CFStringRef v12 = @"No Error";
      goto LABEL_80;
    }
  }
  HSCGetMesaNonce();
  v49 = [(MesaPairer *)self result];
  [v49 setStatusCode:&off_1000155F8];

  v50 = handleForCategory();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    sub_10000FF4C(0, v50, v51, v52, v53, v54, v55, v56);
  }

  CFStringRef v12 = 0;
  uint64_t v9 = v9;

  id v10 = 0;
LABEL_80:
  if (sub_10000D97C((int *)&v69))
  {
    v48 = handleForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_10000FF18();
    }

    LODWORD(v69) = 0;
  }
LABEL_8:
  v66 = v11;
  if ([(MesaPairer *)self mesaProtocolVersion] < 2)
  {
    v70[0] = @"mesaPairingErrorCode";
    v65 = +[NSNull null];
    v71[0] = v65;
    v70[1] = @"mesaPairingErrorDescription";
    uint64_t v31 = (uint64_t)v12;
    if (!v12)
    {
      uint64_t v31 = +[NSNull null];
    }
    v64 = (void *)v31;
    v71[1] = v31;
    v70[2] = @"mesaSensorPreviousState";
    uint64_t v32 = +[NSNumber numberWithUnsignedInt:HIDWORD(v69)];
    v33 = (void *)v32;
    if (!v32)
    {
      uint64_t v32 = +[NSNull null];
    }
    v62 = (void *)v32;
    v71[2] = v32;
    v70[3] = @"mesaSensorProvisioningState";
    v34 = +[NSNumber numberWithUnsignedInt:v69];
    v35 = v34;
    if (!v34)
    {
      v35 = +[NSNull null];
    }
    CFStringRef v36 = v12;
    v71[3] = v35;
    v70[4] = @"mesaSensorSerialNumber";
    v37 = [v11 description];
    v38 = v37;
    if (!v37)
    {
      v38 = +[NSNull null];
    }
    v71[4] = v38;
    v70[5] = @"mesaModuleSerialNumber";
    id v39 = v10;
    if (!v10)
    {
      id v10 = +[NSNull null];
    }
    v71[5] = v10;
    v40 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:6];
    v41 = [(MesaPairer *)self result];
    [v41 setData:v40];

    v27 = v39;
    if (!v39) {

    }
    v29 = (__CFString *)v36;
    if (!v37) {

    }
    v28 = v67;
    if (!v34) {

    }
    if (!v33) {
    if (!v36)
    }
    {
      v30 = v64;
      goto LABEL_57;
    }
  }
  else
  {
    v72[0] = @"mesaPairingErrorCode";
    +[NSNull null];
    v65 = CFStringRef v63 = v12;
    v73[0] = v65;
    v72[1] = @"mesaPairingErrorDescription";
    uint64_t v13 = (uint64_t)v12;
    if (!v12)
    {
      uint64_t v13 = +[NSNull null];
    }
    v60 = (void *)v13;
    v73[1] = v13;
    v72[2] = @"mesaSensorPreviousState";
    uint64_t v14 = +[NSNumber numberWithUnsignedInt:HIDWORD(v69)];
    __int16 v15 = (void *)v14;
    if (!v14)
    {
      uint64_t v14 = +[NSNull null];
    }
    v61 = v15;
    v59 = (void *)v14;
    v73[2] = v14;
    v72[3] = @"mesaSensorProvisioningState";
    uint64_t v16 = +[NSNumber numberWithUnsignedInt:v69];
    v17 = (void *)v16;
    if (!v16)
    {
      uint64_t v16 = +[NSNull null];
    }
    v58 = (void *)v16;
    v73[3] = v16;
    v72[4] = @"mesaSensorPreviousPhysicalPresenceState";
    uint64_t v18 = +[NSNumber numberWithBool:v9];
    v19 = (void *)v18;
    if (!v18)
    {
      uint64_t v18 = +[NSNull null];
    }
    v57 = (void *)v18;
    v73[4] = v18;
    v72[5] = @"mesaSensorPhysicalPresenceState";
    v20 = +[NSNumber numberWithBool:[(MesaPairer *)self mesaPhysicalPresenceAsserted]];
    v21 = v20;
    if (!v20)
    {
      v21 = +[NSNull null];
    }
    v73[5] = v21;
    v72[6] = @"mesaSensorSerialNumber";
    v22 = [v11 description];
    v23 = v22;
    if (!v22)
    {
      v23 = +[NSNull null];
    }
    v73[6] = v23;
    v72[7] = @"mesaModuleSerialNumber";
    id v24 = v10;
    if (!v10)
    {
      id v10 = +[NSNull null];
    }
    v73[7] = v10;
    v25 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:8];
    v26 = [(MesaPairer *)v67 result];
    [v26 setData:v25];

    v27 = v24;
    if (!v24) {

    }
    if (!v22) {
    v28 = v67;
    }
    if (!v20) {

    }
    if (!v19) {
    v29 = (__CFString *)v63;
    }
    if (!v17) {

    }
    if (!v61) {
    if (!v63)
    }
    {
      v30 = v60;
LABEL_57:
    }
  }

  [(MesaPairer *)v28 setFinished:1];
}

- (int64_t)verifyMSRkWithError:(id *)a3
{
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[MesaPairer verifyMSRkWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v28 = 0;
  if (!AMFDRSealingMapCopyInstanceForClass())
  {
    v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100010248((uint64_t)&v28, v20, v21, v22, v23, v24, v25, v26);
    }

    id v6 = 0;
    goto LABEL_25;
  }
  id v6 = [(MesaPairer *)self createFDROptions];
  if (!AMFDRCreateTypeWithOptions())
  {
    v27 = handleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000102B8();
    }

LABEL_25:
    CFStringRef v12 = 0;
    goto LABEL_37;
  }
  AMFDRCreateTypeWithOptions();
  AMFDRDataCopyTrustObject();
  AMFDRSetOption();
  uint64_t PermissionsString = AMFDRDataCreatePermissionsString();
  v8 = handleForCategory();
  uint64_t v9 = v8;
  if (PermissionsString)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (const char *)PermissionsString;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request FDR permissionStr: %@", buf, 0xCu);
    }

    AMFDRSetOption();
    id v10 = v28;
    if (AMFDRPermissionsRequest())
    {
      int v11 = handleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Get remote data", buf, 2u);
      }

      CFStringRef v12 = (void *)AMFDRDataCopy();
      id v10 = v28;
      if (v12)
      {
        uint64_t v13 = handleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Load remote data", buf, 2u);
        }

        unsigned __int8 v14 = [(MesaPairer *)self loadMSRkWithData:v12 error:a3];
        __int16 v15 = handleForCategory();
        uint64_t v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Verify successfully", buf, 2u);
          }

          int64_t v17 = 0;
          id v18 = 0;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100010320();
        }

LABEL_37:
        id v18 = 0;
        int64_t v17 = -8;
        goto LABEL_18;
      }
      int64_t v17 = -11;
      createCRError((void *)0xFFFFFFFFFFFFFFF5, @"Failed to get remote data class", v28);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v17 = -83;
      createCRError((void *)0xFFFFFFFFFFFFFFADLL, @"Failed to request FDR Permissions", v28);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      CFStringRef v12 = 0;
    }

    if (a3 && v18)
    {
      id v18 = v18;
      *a3 = v18;
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000102EC();
    }

    CFStringRef v12 = 0;
    id v18 = 0;
    int64_t v17 = -84;
  }
LABEL_18:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v17;
}

- (BOOL)loadMSRkWithData:(id)a3 error:(id *)a4
{
  unsigned int v23 = 0;
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = [v5 length];

  uint64_t v8 = sub_10000F60C(1, v6, (size_t)v7);
  if (v8)
  {
    uint64_t v22 = v8;
    CFStringRef v12 = @"Failed to load data: 0x%x";
  }
  else
  {
    uint64_t v9 = sub_10000D97C((int *)&v23);
    if (v9)
    {
      uint64_t v22 = v9;
      CFStringRef v12 = @"Failed to get Mesa state: 0x%x";
    }
    else
    {
      if ((v23 & 0xFFFFFFFE) == 4)
      {
        id v10 = 0;
        LOBYTE(a4) = 1;
        goto LABEL_5;
      }
      uint64_t v22 = v23;
      CFStringRef v12 = @"Unexpected Mesa state: %d";
    }
  }
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v22);
  if (!v10)
  {
LABEL_14:
    LOBYTE(a4) = 0;
    goto LABEL_5;
  }
  uint64_t v13 = handleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100010354((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);
  }

  if (a4)
  {
    uint64_t v20 = CRErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    uint64_t v25 = v10;
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a4 = +[NSError errorWithDomain:v20 code:-8 userInfo:v21];

    goto LABEL_14;
  }
LABEL_5:

  return (char)a4;
}

- (id)createFDROptions
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[MesaPairer createFDROptions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"VerifyData"];
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"StripImg4"];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"GetCombined"];
  id v5 = [(MesaPairer *)self inputs];
  id v6 = [v5 FDRCAURL];

  if (v6)
  {
    id v7 = [(MesaPairer *)self inputs];
    uint64_t v8 = [v7 FDRCAURL];
    [v4 setObject:v8 forKeyedSubscript:@"CAURL"];
  }
  uint64_t v9 = [(MesaPairer *)self inputs];
  id v10 = [v9 FDRDSURL];

  if (v10)
  {
    int v11 = [(MesaPairer *)self inputs];
    CFStringRef v12 = [v11 FDRDSURL];
    [v4 setObject:v12 forKeyedSubscript:@"DSURL"];
  }
  uint64_t v13 = [(MesaPairer *)self inputs];
  uint64_t v14 = [v13 trustObjectURL];

  if (v14)
  {
    uint64_t v15 = [(MesaPairer *)self inputs];
    uint64_t v16 = [v15 trustObjectURL];
    [v4 setObject:v16 forKeyedSubscript:@"TrustObjectURL"];
  }
  uint64_t v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AMFDR options: %@", (uint8_t *)&v19, 0xCu);
  }

  return v4;
}

- (int)mesaProtocolVersion
{
  if (qword_100018AA0 != -1) {
    dispatch_once(&qword_100018AA0, &stru_100014560);
  }
  if (byte_100018A98) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)mesaPhysicalPresenceAsserted
{
  unsigned __int8 v6 = 0;
  int v2 = sub_10000F0C0(2u, &v6);
  v3 = handleForCategory();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100010428();
    }

    return 0;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Physical Presence -> %d\n", buf, 8u);
    }

    return v6 == 1;
  }
}

- (void)cancel
{
  int v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[MesaPairer cancel]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)teardown
{
  int v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[MesaPairer teardown]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (MesaPairerInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end