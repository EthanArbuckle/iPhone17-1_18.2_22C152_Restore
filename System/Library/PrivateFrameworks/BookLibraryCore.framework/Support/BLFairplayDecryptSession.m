@interface BLFairplayDecryptSession
- (BLFairplayDecryptSession)initWithDPInfo:(id)a3;
- (NSData)dpInfo;
- (NSString)identifier;
- (id)decryptBytes:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setDpInfo:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation BLFairplayDecryptSession

- (BLFairplayDecryptSession)initWithDPInfo:(id)a3
{
  id v5 = a3;
  v6 = [(BLFairplayDecryptSession *)self init];
  if (v6)
  {
    if ([v5 length])
    {
      objc_storeStrong((id *)&v6->_dpInfo, a3);
      id v7 = objc_alloc((Class)NSString);
      v8 = +[NSUUID UUID];
      v9 = [v8 UUIDString];
      v10 = (NSString *)[v7 initWithFormat:@"com.apple.itunesstored.fairplay.decryptfile.%@", v9];
      identifier = v6->_identifier;
      v6->_identifier = v10;
    }
    else
    {
      v12 = BLBookInstallLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = (id)objc_opt_class();
        id v13 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%@] No DPInfo provided", buf, 0xCu);
      }
      v6 = 0;
    }
  }

  return v6;
}

- (void)dealloc
{
  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
    sub_10004D450((uint64_t)decryptSession);
    self->_decryptSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BLFairplayDecryptSession;
  [(BLFairplayDecryptSession *)&v4 dealloc];
}

- (id)decryptBytes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  decryptSession = self->_decryptSession;
  if (decryptSession) {
    goto LABEL_8;
  }
  if (!sub_10004D470(self->_dpInfo, &self->_decryptSession))
  {
    v8 = BLBookInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = (id)objc_opt_class();
      id v9 = v19;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: Could not begin decrypt", buf, 0xCu);
    }
    if (a4)
    {
      sub_10004B6AC(15, 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  dpInfo = self->_dpInfo;
  self->_dpInfo = 0;

  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
LABEL_8:
    id v17 = 0;
    char v11 = sub_10004D5E0((uint64_t)decryptSession, v6, &v17);
    id v12 = v17;
    if ((v11 & 1) == 0)
    {
      id v13 = BLBookInstallLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        id v15 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: Decrypt failed", buf, 0xCu);
      }
      if (a4)
      {
        sub_10004B924(@"FairPlayErrorDomain", 15, 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSData)dpInfo
{
  return self->_dpInfo;
}

- (void)setDpInfo:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_dpInfo, 0);
}

@end