@interface FigCaptureSessionLoggingPrefix
- (char)initWithClientAuditToken:(uint64_t)a3 captureSession:;
- (id)description;
- (void)_updateLoggingPrefix;
- (void)dealloc;
@end

@implementation FigCaptureSessionLoggingPrefix

- (id)description
{
  p_stringValueLock = &self->_stringValueLock;
  pthread_rwlock_rdlock(&self->_stringValueLock);
  v4 = self->_stringValue;
  pthread_rwlock_unlock(p_stringValueLock);
  return v4;
}

- (char)initWithClientAuditToken:(uint64_t)a3 captureSession:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)FigCaptureSessionLoggingPrefix;
  v5 = (char *)objc_msgSendSuper2(&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    *((void *)v5 + 6) = a3;
    pthread_rwlock_init((pthread_rwlock_t *)(v5 + 56), 0);
    long long v8 = *a2;
    long long v7 = a2[1];
    v11[2] = v8;
    v11[3] = v7;
    *(_OWORD *)(v6 + 8) = v8;
    *(_OWORD *)(v6 + 24) = v7;
    v11[0] = v8;
    v11[1] = v7;
    *((_DWORD *)v6 + 10) = FigCaptureGetPIDFromAuditToken(v11);
    [v6 _updateLoggingPrefix];
    [v6 _updateLoggingPrefix];
  }
  return v6;
}

- (void)_updateLoggingPrefix
{
  if (self->_clientPIDUsedForLoggingPrefix != self->_clientPID)
  {
    long long v3 = *(_OWORD *)&self->_clientAuditToken.val[4];
    v7[0] = *(_OWORD *)self->_clientAuditToken.val;
    v7[1] = v3;
    v4 = (__CFString *)FigCaptureCopyClientCodeSigningIdentifier(v7);
    v5 = (void *)[NSString stringWithFormat:@"<%p[%d][%@]>", self->_captureSession, self->_clientPID, v4];

    pthread_rwlock_wrlock(&self->_stringValueLock);
    stringValue = self->_stringValue;
    self->_stringValue = (NSString *)v5;
    pthread_rwlock_unlock(&self->_stringValueLock);
    self->_clientPIDUsedForLoggingPrefix = self->_clientPID;
  }
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_stringValueLock);

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionLoggingPrefix;
  [(FigCaptureSessionLoggingPrefix *)&v3 dealloc];
}

@end