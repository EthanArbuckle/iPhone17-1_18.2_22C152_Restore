@interface IDSRealTimeEncryptionIdentity
- (BOOL)isExpired;
- (BOOL)isPublicKeyDistributed;
- (BOOL)isTestRunning;
- (IDSPushToken)pushToken;
- (IDSRealTimeEncryptionIdentity)init;
- (NSData)publicIdentityData;
- (NSData)publicKeyData;
- (NSDate)expirationDate;
- (NSString)fromID;
- (NSString)groupID;
- (NSString)participantID;
- (NSString)sessionID;
- (__SecKey)fullIdentity;
- (__SecKey)publicIdentity;
- (id)description;
- (int64_t)wrapMode;
- (void)dealloc;
- (void)setExpirationDate:(id)a3;
- (void)setFromID:(id)a3;
- (void)setFullIdentity:(__SecKey *)a3;
- (void)setGroupID:(id)a3;
- (void)setIsPublicKeyDistributed:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setPublicIdentity:(__SecKey *)a3;
- (void)setPublicIdentityData:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setWrapMode:(int64_t)a3;
@end

@implementation IDSRealTimeEncryptionIdentity

- (IDSRealTimeEncryptionIdentity)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSRealTimeEncryptionIdentity;
  result = [(IDSRealTimeEncryptionIdentity *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  fullIdentity = self->_fullIdentity;
  if (fullIdentity)
  {
    CFRelease(fullIdentity);
    self->_fullIdentity = 0;
  }
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)IDSRealTimeEncryptionIdentity;
  [(IDSRealTimeEncryptionIdentity *)&v5 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<IDSRealTimeEncryptionIdentity\n  publicIdentity=%@\n  fullIdentity=%@\n>", self->_publicIdentity, self->_fullIdentity];
}

- (void)setFullIdentity:(__SecKey *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fullIdentity = self->_fullIdentity;
  if (fullIdentity)
  {
    CFRelease(fullIdentity);
    self->_fullIdentity = 0;
  }
  self->_fullIdentity = (__SecKey *)CFRetain(a3);

  os_unfair_lock_unlock(p_lock);
}

- (void)setPublicIdentity:(__SecKey *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0;
  }
  self->_publicIdentity = (__SecKey *)CFRetain(a3);

  os_unfair_lock_unlock(p_lock);
}

- (NSData)publicKeyData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(IDSRealTimeEncryptionIdentity *)self isTestRunning])
  {
    if (!self->_publicIdentityData)
    {
      v4 = +[NSData __imDataWithRandomBytes:100];
      publicIdentityData = self->_publicIdentityData;
      self->_publicIdentityData = v4;

      v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_publicIdentityData;
        *(_DWORD *)buf = 134218242;
        v17 = self;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p: Returned the random publicKeyData %@ for the simulator", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
LABEL_16:
    v11 = self->_publicIdentityData;
    os_unfair_lock_unlock(p_lock);
    goto LABEL_26;
  }
  CFTypeRef cf = 0;
  if (qword_100A4C990 != -1) {
    dispatch_once(&qword_100A4C990, &stru_10098C570);
  }
  if (off_100A4C988)
  {
    CFDataRef v8 = (const __CFData *)off_100A4C988(self->_publicIdentity, &cf);
    if (v8)
    {
      if (!cf)
      {
        Copy = (NSData *)CFDataCreateCopy(0, v8);
        v10 = self->_publicIdentityData;
        self->_publicIdentityData = Copy;

        CFRelease(v8);
        if (cf) {
          CFRelease(cf);
        }
        goto LABEL_16;
      }
    }
  }
  v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    groupID = self->_groupID;
    *(_DWORD *)buf = 134218499;
    v17 = self;
    __int16 v18 = 2113;
    v19 = (NSData *)groupID;
    __int16 v20 = 2112;
    CFTypeRef v21 = cf;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p: Couldn't the public key data for the group %{private}@ (error: %@)", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v11 = 0;
LABEL_26:

  return v11;
}

- (BOOL)isExpired
{
  objc_super v3 = +[NSDate date];
  v4 = [(IDSRealTimeEncryptionIdentity *)self expirationDate];
  id v5 = [v3 compare:v4];

  if (v5 != (id)-1)
  {
    v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(IDSRealTimeEncryptionIdentity *)self expirationDate];
      *(_DWORD *)buf = 134218498;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v3;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%p: This IDSRealTimeEncryptionIdentity is expired. (now: %@, expirationDate: %@)", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v9 = [(IDSRealTimeEncryptionIdentity *)self expirationDate];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          v10 = [(IDSRealTimeEncryptionIdentity *)self expirationDate];
          _IDSLogV();
        }
      }
    }
  }

  return v5 != (id)-1;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (IDSPushToken)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isPublicKeyDistributed
{
  return self->_isPublicKeyDistributed;
}

- (void)setIsPublicKeyDistributed:(BOOL)a3
{
  self->_isPublicKeyDistributed = a3;
}

- (__SecKey)fullIdentity
{
  return self->_fullIdentity;
}

- (__SecKey)publicIdentity
{
  return self->_publicIdentity;
}

- (NSData)publicIdentityData
{
  return self->_publicIdentityData;
}

- (void)setPublicIdentityData:(id)a3
{
}

- (int64_t)wrapMode
{
  return self->_wrapMode;
}

- (void)setWrapMode:(int64_t)a3
{
  self->_wrapMode = a3;
}

- (BOOL)isTestRunning
{
  return self->_isTestRunning;
}

- (void)setIsTestRunning:(BOOL)a3
{
  self->_isTestRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicIdentityData, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

@end