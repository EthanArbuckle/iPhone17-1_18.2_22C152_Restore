@interface CBAPTicket
+ (id)sharedInstance;
- (BOOL)_hasEntitlementBoolForTag:(unint64_t)a3;
- (BOOL)_verifyAPTicketDigest:(id)a3;
- (BOOL)isEntitledForTag:(unint64_t)a3;
- (BOOL)isValid;
- (CBAPTicket)init;
- (NSData)apTicket;
- (id)_loadAPTicket;
- (void)setApTicket:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation CBAPTicket

+ (id)sharedInstance
{
  if (qword_10008FE40 != -1) {
    dispatch_once(&qword_10008FE40, &stru_100079EB8);
  }
  v2 = (void *)qword_10008FE38;

  return v2;
}

- (CBAPTicket)init
{
  v11.receiver = self;
  v11.super_class = (Class)CBAPTicket;
  v2 = [(CBAPTicket *)&v11 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading APTicket...", buf, 2u);
    }

    uint64_t v4 = [(CBAPTicket *)v2 _loadAPTicket];
    apTicket = v2->_apTicket;
    v2->_apTicket = (NSData *)v4;

    if (v2->_apTicket) {
      unsigned __int8 v6 = -[CBAPTicket _verifyAPTicketDigest:](v2, "_verifyAPTicketDigest:");
    }
    else {
      unsigned __int8 v6 = 0;
    }
    v2->_BOOL isValid = v6;
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v2->_apTicket != 0;
      BOOL isValid = v2->_isValid;
      *(_DWORD *)buf = 67109376;
      BOOL v13 = v8;
      __int16 v14 = 1024;
      BOOL v15 = isValid;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "APTicket is loaded: (%d) and valid: (%d)", buf, 0xEu);
    }
  }
  return v2;
}

- (BOOL)isEntitledForTag:(unint64_t)a3
{
  if ([(CBAPTicket *)self isValid])
  {
    return [(CBAPTicket *)self _hasEntitlementBoolForTag:a3];
  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004904C(v5);
    }

    return 0;
  }
}

- (id)_loadAPTicket
{
  v2 = +[MSUDataAccessor sharedDataAccessor];
  id v11 = 0;
  id v3 = [v2 copyPathForPersonalizedData:2 error:&v11];
  id v4 = v11;

  if (!v3)
  {
    BOOL v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100049090((uint64_t)v4, v8);
    }
    unsigned __int8 v6 = 0;
    goto LABEL_11;
  }
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "APTicket path is %@", buf, 0xCu);
  }

  id v10 = v4;
  unsigned __int8 v6 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    BOOL v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100049108((uint64_t)v3, (uint64_t)v7, v8);
    }
    id v4 = v7;
LABEL_11:

    id v7 = v4;
  }

  return v6;
}

- (BOOL)_verifyAPTicketDigest:(id)a3
{
  id v3 = a3;
  CFDataRef v4 = (const __CFData *)MGCopyAnswer();
  if (!v4)
  {
    id v10 = CheckerBoardLogHandleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v23 = @"BootManifestHash";
    id v11 = "Failed to query MobileGestalt for %@";
    v12 = v10;
    uint32_t v13 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_12;
  }
  CFStringRef v5 = (const __CFString *)MGCopyAnswer();
  if (!v5)
  {
    id v10 = CheckerBoardLogHandleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v11 = "MobileGestalt returned NULL for Image4CryptoHashMethod";
    v12 = v10;
    uint32_t v13 = 2;
    goto LABEL_11;
  }
  CFComparisonResult v6 = CFStringCompare(v5, @"sha2-384", 1uLL);
  id v7 = v3;
  [v7 bytes];
  [v7 length];
  if (v6)
  {
    int v8 = AMSupportDigestSha1();
    size_t v9 = 20;
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    int v8 = AMSupportDigestSha384();
    size_t v9 = 48;
    if (v8)
    {
LABEL_5:
      id v10 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100049190(v8, v9, v10);
      }
      goto LABEL_12;
    }
  }
  if (CFDataGetLength(v4) != v9)
  {
    id v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v19 = "Digest length differs from the boot manifest hash";
      goto LABEL_25;
    }
LABEL_12:

    BOOL v14 = 0;
    goto LABEL_13;
  }
  BytePtr = CFDataGetBytePtr(v4);
  if (memcmp(buf, BytePtr, v9))
  {
    id v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v19 = "Digest of provided ticket does not match boot manifest hash";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v20, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  BOOL v14 = 1;
LABEL_13:
  BOOL v15 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "un";
    if (v14) {
      v16 = "";
    }
    int v20 = 136315138;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Digest verified %ssuccessfully", (uint8_t *)&v20, 0xCu);
  }

  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v14;
}

- (BOOL)_hasEntitlementBoolForTag:(unint64_t)a3
{
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  CFDataRef v4 = [(CBAPTicket *)self apTicket];

  if (!v4)
  {
    int v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      size_t v9 = "AP Ticket is not loaded";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  id v5 = [(CBAPTicket *)self apTicket];
  [v5 bytes];
  CFComparisonResult v6 = [(CBAPTicket *)self apTicket];
  [v6 length];
  int inited = Img4DecodeInitManifest();

  if (inited)
  {
    int v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      size_t v9 = "failed to parse AP ticket as Img4 manifest\n";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int BooleanFromSection = Img4DecodeGetBooleanFromSection();
  if (BooleanFromSection)
  {
    int v12 = BooleanFromSection;
    uint32_t v13 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "the result is %i", buf, 8u);
    }
  }
  return 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_BOOL isValid = a3;
}

- (NSData)apTicket
{
  return self->_apTicket;
}

- (void)setApTicket:(id)a3
{
}

- (void).cxx_destruct
{
}

@end