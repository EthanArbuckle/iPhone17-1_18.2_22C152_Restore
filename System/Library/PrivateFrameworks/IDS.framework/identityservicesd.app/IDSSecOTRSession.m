@interface IDSSecOTRSession
- (IDSSecOTRSession)initWithSecOTRSessionRef:(_SecOTRSession *)a3;
- (_SecOTRSession)backingOTRSessionRef;
- (id)signAndProtectMessage:(id)a3 withError:(id *)a4;
- (id)verifyAndExposeMessage:(id)a3 withError:(id *)a4;
- (void)dealloc;
- (void)setBackingOTRSessionRef:(_SecOTRSession *)a3;
@end

@implementation IDSSecOTRSession

- (IDSSecOTRSession)initWithSecOTRSessionRef:(_SecOTRSession *)a3
{
  v3 = (IDSSecOTRSession *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)IDSSecOTRSession;
    v4 = [(IDSSecOTRSession *)&v6 init];
    if (v4) {
      v4->_backingOTRSessionRef = (_SecOTRSession *)CFRetain(v3);
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (backingOTRSessionRef)
  {
    CFRelease(backingOTRSessionRef);
    self->_backingOTRSessionRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSSecOTRSession;
  [(IDSSecOTRSession *)&v4 dealloc];
}

- (id)signAndProtectMessage:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableData);
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (qword_100A4A550 != -1) {
    dispatch_once(&qword_100A4A550, &stru_100980678);
  }
  if (off_100A4A548)
  {
    int v9 = off_100A4A548(backingOTRSessionRef, v6, v7);
    if (!v9)
    {
      id v10 = v7;
      goto LABEL_15;
    }
  }
  else
  {
    int v9 = -26276;
  }
  v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "   OTR encryption failed with error: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (a4)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)verifyAndExposeMessage:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableData);
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (qword_100A4A560 != -1) {
    dispatch_once(&qword_100A4A560, &stru_100980698);
  }
  if (off_100A4A558)
  {
    int v9 = off_100A4A558(backingOTRSessionRef, v6, v7);
    if (!v9)
    {
      id v10 = v7;
      goto LABEL_15;
    }
  }
  else
  {
    int v9 = -26276;
  }
  v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "   OTR decryption failed with error: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (a4)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:

  return v10;
}

- (_SecOTRSession)backingOTRSessionRef
{
  return self->_backingOTRSessionRef;
}

- (void)setBackingOTRSessionRef:(_SecOTRSession *)a3
{
  self->_backingOTRSessionRef = a3;
}

@end