@interface FPDRequest
+ (id)UUIDForSystemExecutablePath:(id)a3;
+ (id)fixupProcessName:(id)a3;
+ (id)requestForPID:(int)a3;
+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5;
+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 kernelFileInfo:(id)a6;
+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4;
+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4 kernelFileInfo:(id)a5;
+ (id)requestForSelf;
+ (id)requestForXPCConnection:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)providedExtent;
- ($0AC6E346AE4835514AAA8AC86D8F4844)requestedExtent;
- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token;
- (BOOL)allowsResurrection;
- (BOOL)isFromPOSIX;
- (BOOL)isPermittedToAttributeRequestingExecutable:(id)a3;
- (BOOL)isProviderInitiated;
- (BOOL)selectedForMaterialization;
- (BOOL)shouldFailCoordinationIfDownloadRequired;
- (FPDRequest)initWithPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 withExtent:(id)a6;
- (NSDate)date;
- (NSString)executablePath;
- (NSString)processName;
- (NSString)shortDescription;
- (NSString)userProcessName;
- (id)description;
- (id)nsfpRequestForSession:(id)a3;
- (id)nsfpRequestForSession:(id)a3 isSpeculative:(BOOL)a4;
- (int)pid;
- (unsigned)qos;
- (void)setAllowsResurrection:(BOOL)a3;
- (void)setAudit_token:(id *)a3;
- (void)setProvidedExtent:(id)a3;
- (void)setProviderInitiated:(BOOL)a3;
- (void)setRequestedExtent:(id)a3;
- (void)setSelectedForMaterialization:(BOOL)a3;
- (void)setShouldFailCoordinationIfDownloadRequired:(BOOL)a3;
@end

@implementation FPDRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_userProcessName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"pid=%d name=%@ path=%@ isPOSIX=%d", self->_pid, self->_processName, self->_executablePath, self->_fromPOSIX];
}

+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4 kernelFileInfo:(id)a5
{
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  v8[0] = v5;
  v8[1] = v5;
  v6 = [a1 requestForPID:*(void *)&a3 auditToken:v8 fromPOSIX:a4 kernelFileInfo:a5];
  return v6;
}

+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 kernelFileInfo:(id)a6
{
  BOOL v6 = a5;
  uint64_t v8 = *(void *)&a3;
  if (a6)
  {
    id v9 = a6;
    uint64_t v10 = [v9 offset];
    uint64_t v11 = [v9 size];
  }
  else
  {
    uint64_t v10 = -1;
    uint64_t v11 = -1;
  }
  id v12 = objc_alloc((Class)objc_opt_class());
  long long v13 = *(_OWORD *)&a4->var0[4];
  v16[0] = *(_OWORD *)a4->var0;
  v16[1] = v13;
  v14 = objc_msgSend(v12, "initWithPID:auditToken:fromPOSIX:withExtent:", v8, v16, v6, v10, v11);
  return v14;
}

- (FPDRequest)initWithPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5 withExtent:(id)a6
{
  BOOL v6 = (void *)MEMORY[0x1F4188790](self, a2, *(void *)&a3, a4, a5, a6.var0, a6.var1);
  int64_t v8 = v7;
  int64_t v10 = v9;
  BOOL v12 = v11;
  v14 = v13;
  uint64_t v16 = v15;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v33.receiver = v6;
  v33.super_class = (Class)FPDRequest;
  v17 = [(FPDRequest *)&v33 init];
  v18 = v17;
  if (v17)
  {
    v17->_fromPOSIX = v12;
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    date = v18->_date;
    v18->_date = (NSDate *)v19;

    v18->_qos = qos_class_self();
    *(_DWORD *)&v18->_selectedForMaterialization = 0;
    v18->_requestedExtent.location = v10;
    v18->_requestedExtent.length = v8;
    v18->_providedExtent.location = -1;
    v18->_providedExtent.length = -1;
    if (!v16) {
      uint64_t v16 = getpid();
    }
    v18->_pid = v16;
    if ((int)v16 > -1001)
    {
      if ((v16 & 0x80000000) == 0)
      {
        memset(buffer, 0, sizeof(buffer));
        if ((proc_name(v16, buffer, 0x20u) & 0x80000000) == 0 && LOBYTE(buffer[0]))
        {
          uint64_t v23 = [NSString stringWithUTF8String:buffer];
          processName = v18->_processName;
          v18->_processName = (NSString *)v23;
        }
        bzero(v34, 0x1000uLL);
        if (proc_pidpath(v18->_pid, v34, 0x1000u) < 0 || !v34[0]) {
          goto LABEL_16;
        }
        uint64_t v25 = [NSString stringWithUTF8String:v34];
LABEL_15:
        executablePath = v18->_executablePath;
        v18->_executablePath = (NSString *)v25;

LABEL_16:
        uint64_t v29 = +[FPDRequest fixupProcessName:v18->_processName];
        userProcessName = v18->_userProcessName;
        v18->_userProcessName = (NSString *)v29;

        long long v31 = *v14;
        *(_OWORD *)&v18->_audit_token.val[4] = v14[1];
        *(_OWORD *)v18->_audit_token.val = v31;
        return v18;
      }
      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"TestProcess%d", v16);
      v27 = v18->_processName;
      v18->_processName = (NSString *)v26;

      objc_msgSend(NSString, "stringWithFormat:", @"/path/to/TestProcess%d.app", v18->_pid);
    }
    else
    {
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"UnresponsiveTestProcess%d", v16);
      v22 = v18->_processName;
      v18->_processName = (NSString *)v21;

      objc_msgSend(NSString, "stringWithFormat:", @"/path/to/UnresponsiveTestProcess%d.app", v18->_pid);
    uint64_t v25 = };
    goto LABEL_15;
  }
  return v18;
}

+ (id)fixupProcessName:(id)a3
{
  id v3 = a3;
  if ([@"com.apple.appkit.xpc.openAndSav" isEqualToString:v3]) {
    v4 = @"Open and Save Panels";
  }
  else {
    v4 = (__CFString *)v3;
  }

  return v4;
}

+ (id)requestForPID:(int)a3
{
  return (id)[a1 requestForPID:*(void *)&a3 fromPOSIX:0 kernelFileInfo:0];
}

- (int)pid
{
  return self->_pid;
}

+ (id)requestForPID:(int)a3 fromPOSIX:(BOOL)a4
{
  return (id)[a1 requestForPID:*(void *)&a3 fromPOSIX:a4 kernelFileInfo:0];
}

+ (id)requestForXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 processIdentifier];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  BOOL v6 = [a1 requestForPID:v5 auditToken:v8 fromPOSIX:0 kernelFileInfo:0];

  return v6;
}

+ (id)requestForSelf
{
  return (id)[a1 requestForPID:0 fromPOSIX:0 kernelFileInfo:0];
}

+ (id)requestForPID:(int)a3 auditToken:(id *)a4 fromPOSIX:(BOOL)a5
{
  long long v5 = *(_OWORD *)&a4->var0[4];
  v8[0] = *(_OWORD *)a4->var0;
  v8[1] = v5;
  BOOL v6 = [a1 requestForPID:*(void *)&a3 auditToken:v8 fromPOSIX:a5 kernelFileInfo:0];
  return v6;
}

- (BOOL)isPermittedToAttributeRequestingExecutable:(id)a3
{
  if ([a3 hasFileProviderAttributionMDMAccess]) {
    return 1;
  }
  long long v5 = [(id)objc_opt_class() UUIDForSystemExecutablePath:self->_executablePath];
  BOOL v4 = v5 != 0;

  return v4;
}

- (id)nsfpRequestForSession:(id)a3
{
  return [(FPDRequest *)self nsfpRequestForSession:a3 isSpeculative:0];
}

- (id)nsfpRequestForSession:(id)a3 isSpeculative:(BOOL)a4
{
  long long v5 = (void *)[(id)objc_opt_new() initWithIsSpeculativeDownload:a4];
  int pid = self->_pid;
  if (!pid || pid == getpid())
  {
    if (self->_executablePath)
    {
      uint64_t v7 = [MEMORY[0x1E4F25DF0] _fpdIdentifier];
LABEL_9:
      int64_t v8 = (void *)v7;
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&UUID_NULL];
    goto LABEL_9;
  }
  if (!self->_executablePath) {
    goto LABEL_8;
  }
  int64_t v8 = +[FPDRequest UUIDForSystemExecutablePath:](FPDRequest, "UUIDForSystemExecutablePath:");
  if (!v8)
  {
    int64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&UUID_NULL];
    [v5 setRequestingApplicationIdentifier:v9];

    goto LABEL_11;
  }
LABEL_10:
  [v5 setRequestingApplicationIdentifier:v8];
LABEL_11:

  return v5;
}

+ (id)UUIDForSystemExecutablePath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (hardcodedUUIDs_onceToken != -1) {
    dispatch_once(&hardcodedUUIDs_onceToken, &__block_literal_global_20);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)hardcodedUUIDs_ret;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasPrefix:", v9, (void)v12))
        {
          int64_t v10 = [v4 objectForKeyedSubscript:v9];

          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if ([v3 hasPrefix:@"/var/containers/Bundle/Application/"]
    && [v3 hasSuffix:@"/Files.app/Files"])
  {
    int64_t v10 = [MEMORY[0x1E4F25DF0] _filesIdentifier];
  }
  else
  {
    int64_t v10 = 0;
  }
LABEL_16:

  return v10;
}

- (NSString)shortDescription
{
  return (NSString *)[NSString stringWithFormat:@"pid=%d name=%@ isPOSIX=%d", self->_pid, self->_processName, self->_fromPOSIX];
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)userProcessName
{
  return self->_userProcessName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BOOL)isFromPOSIX
{
  return self->_fromPOSIX;
}

- (BOOL)selectedForMaterialization
{
  return self->_selectedForMaterialization;
}

- (void)setSelectedForMaterialization:(BOOL)a3
{
  self->_selectedForMaterialization = a3;
}

- (BOOL)shouldFailCoordinationIfDownloadRequired
{
  return self->_shouldFailCoordinationIfDownloadRequired;
}

- (void)setShouldFailCoordinationIfDownloadRequired:(BOOL)a3
{
  self->_shouldFailCoordinationIfDownloadRequired = a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)requestedExtent
{
  int64_t length = self->_requestedExtent.length;
  int64_t location = self->_requestedExtent.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setRequestedExtent:(id)a3
{
  self->_requestedExtent = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)providedExtent
{
  int64_t length = self->_providedExtent.length;
  int64_t location = self->_providedExtent.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setProvidedExtent:(id)a3
{
  self->_providedExtent = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (BOOL)allowsResurrection
{
  return self->_allowsResurrection;
}

- (void)setAllowsResurrection:(BOOL)a3
{
  self->_allowsResurrection = a3;
}

- (BOOL)isProviderInitiated
{
  return self->_providerInitiated;
}

- (void)setProviderInitiated:(BOOL)a3
{
  self->_providerInitiated = a3;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDate)date
{
  return self->_date;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)audit_token
{
  long long v3 = *(_OWORD *)&self[3].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAudit_token:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_audit_token.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_audit_token.val = v3;
}

@end