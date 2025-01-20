@interface ClientIdentity
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (ClientIdentity)initWithAuditToken:(id *)a3;
- (ClientIdentity)initWithCoder:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)clientName;
- (NSString)codeSigningIdentity;
- (NSString)localizedName;
- (NSString)teamIdentifier;
- (NSString)untrustedBundleIdentifier;
- (id)description;
- (int)pid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ClientIdentity

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (int)pid
{
  return self->_pid;
}

- (ClientIdentity)initWithAuditToken:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)ClientIdentity;
  v4 = [(ClientIdentity *)&v41 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    pid_t pidp = -1;
    long long v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v7;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    pid_t v8 = pidp;
    v5->_int pid = pidp;
    LOBYTE(atoken.val[0]) = 0;
    proc_name(v8, &atoken, 0x400u);
    uint64_t v9 = [[NSString alloc] initWithCString:&atoken encoding:4];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v9;

    v39[1] = 0;
    long long v11 = *(_OWORD *)&a3->var0[4];
    long long buffer = *(_OWORD *)a3->var0;
    long long v45 = v11;
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    v39[0] = 0;
    long long v12 = *(_OWORD *)&a3->var0[4];
    long long buffer = *(_OWORD *)a3->var0;
    long long v45 = v12;
    v13 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:&buffer error:v39];
    id v14 = v39[0];
    uint64_t v15 = [v13 teamIdentifier];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v15;

    uint64_t v17 = [v13 localizedName];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v17;

    uint64_t v19 = [v13 bundleIdentifier];
    bundleIdentifierShared = v5->_bundleIdentifierShared;
    v5->_bundleIdentifierShared = (NSString *)v19;

    if (!v5->_bundleIdentifierShared)
    {
      bzero(&buffer, 0x400uLL);
      int v21 = proc_pidpath(pidp, &buffer, 0x400u);
      if (v21 <= 0)
      {
        v28 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          pid_t v43 = pidp;
          _os_log_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_ERROR, "Could not find path of process with PID: [%d]", buf, 8u);
        }
      }
      else
      {
        v22 = (void *)[[NSString alloc] initWithBytes:&buffer length:v21 encoding:4];
        if (v22)
        {
          v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
          v24 = (void *)_CFBundleCopyBundleURLForExecutableURL();
          v25 = [MEMORY[0x1E4F28B50] bundleWithURL:v24];
          uint64_t v26 = [v25 bundleIdentifier];
          v27 = v5->_bundleIdentifierShared;
          v5->_bundleIdentifierShared = (NSString *)v26;
        }
        else
        {
          v29 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            pid_t v43 = pidp;
            _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_ERROR, "Could not generate path string for process with pid: [%d]", buf, 8u);
          }
        }
      }
      if (!v5->_bundleIdentifierShared)
      {
        v30 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          int pid = v5->_pid;
          LODWORD(buffer) = 67109120;
          DWORD1(buffer) = pid;
          _os_log_impl(&dword_1BBC88000, v30, OS_LOG_TYPE_DEBUG, "Could not get bundle identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
        }
      }
    }
    if (!v5->_teamIdentifier)
    {
      v32 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v33 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v33;
        _os_log_impl(&dword_1BBC88000, v32, OS_LOG_TYPE_DEBUG, "Could not get team identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }
    if (!v5->_localizedName)
    {
      v34 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v35 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v35;
        _os_log_impl(&dword_1BBC88000, v34, OS_LOG_TYPE_DEBUG, "Could not get localized name for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }
    if (!v5->_applicationIdentifier)
    {
      v36 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v37 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v37;
        _os_log_impl(&dword_1BBC88000, v36, OS_LOG_TYPE_DEBUG, "Could not get application identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifierShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSigningIdentity, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierShared, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ClientIdentity)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v4 = (long long *)[a3 decodeBytesForKey:@"auditToken" returnedLength:&v9];
  if (v9 == 32)
  {
    long long v5 = v4[1];
    long long v10 = *v4;
    long long v11 = v5;
    v8[0] = v10;
    v8[1] = v5;
    self = [(ClientIdentity *)self initWithAuditToken:v8];
    long long v6 = self;
  }
  else
  {
    NSLog(&cfstr_ErrorInvalidAu.isa);
    long long v6 = 0;
  }

  return v6;
}

- (NSString)untrustedBundleIdentifier
{
  return self->_bundleIdentifierShared;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(ClientIdentity *)self auditToken];
    memset(v12, 0, sizeof(v12));
    if (v5) {
      [v5 auditToken];
    }
    if (LODWORD(v12[2]) == LODWORD(v12[0]))
    {
      unint64_t v6 = 0;
      do
      {
        unint64_t v7 = v6;
        if (v6 == 7) {
          break;
        }
        int v8 = *((_DWORD *)&v12[2] + v6 + 1);
        int v9 = *((_DWORD *)v12 + ++v6);
      }
      while (v8 == v9);
      BOOL v10 = v7 > 6;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v11.receiver = self;
  v11.super_class = (Class)ClientIdentity;
  id v4 = [(ClientIdentity *)&v11 description];
  id v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"bundleIdentifier" withString:self->_bundleIdentifierShared];
  unint64_t v6 = [(ClientIdentity *)self applicationIdentifier];
  [v5 setKey:@"applicationIdentifier" withString:v6];

  unint64_t v7 = [(ClientIdentity *)self teamIdentifier];
  [v5 setKey:@"teamIdentifier" withString:v7];

  int v8 = [(ClientIdentity *)self clientName];
  [v5 setKey:@"clientName" withString:v8];

  objc_msgSend(v5, "setKey:withProcessID:", @"pid", -[ClientIdentity pid](self, "pid"));
  int v9 = [v5 build];

  return v9;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)codeSigningIdentity
{
  return self->_codeSigningIdentity;
}

@end