@interface HMFProcessInfo
+ (HMFProcessInfo)processInfo;
+ (id)logCategory;
+ (id)processInfoForXPCConnection:(id)a3;
- (BOOL)getAuditToken:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (HMFBoolean)isCodeSigned;
- (HMFBoolean)isPlatformBinary;
- (HMFProcessInfo)init;
- (HMFProcessInfo)initWithAuditToken:(id *)a3;
- (HMFProcessInfo)initWithIdentifier:(int)a3;
- (NSBundle)mainBundle;
- (NSString)applicationIdentifier;
- (NSString)name;
- (NSString)signingIdentifier;
- (NSURL)executableURL;
- (NSURL)mainBundleURL;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)shortDescription;
- (id)valueForEntitlement:(id)a3;
- (int)identifier;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation HMFProcessInfo

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [HMFAttributeDescription alloc];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[HMFProcessInfo identifier](self, "identifier"));
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Identifier" value:v4];
  v6 = [HMFAttributeDescription alloc];
  v7 = [(HMFProcessInfo *)self name];
  v8 = [(HMFAttributeDescription *)v6 initWithName:@"Name" value:v7];
  v14[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  v10 = [(HMFProcessInfo *)self applicationIdentifier];
  v11 = [(HMFAttributeDescription *)v9 initWithName:@"Application Identifier" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMFProcessInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      int v7 = [(HMFProcessInfo *)self identifier];
      BOOL v8 = v7 == [(HMFProcessInfo *)v6 identifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (int)identifier
{
  return self->_identifier;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)hash
{
  return self->_identifier;
}

uint64_t __29__HMFProcessInfo_processInfo__block_invoke()
{
  qword_1EB4EEB50 = objc_alloc_init(HMFProcessInfo);
  return MEMORY[0x1F41817F8]();
}

- (HMFProcessInfo)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  task_info_outCnt[0] = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&v10, task_info_outCnt))
  {
    v3 = (void *)MEMORY[0x19F3A87A0]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = HMFGetLogIdentifier(v4);
      task_info_outCnt[0] = 138543362;
      *(void *)&task_info_outCnt[1] = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine current audit token", (uint8_t *)task_info_outCnt, 0xCu);
    }
    int v7 = [(HMFProcessInfo *)v4 initWithIdentifier:getpid()];
  }
  else
  {
    *(_OWORD *)task_info_outCnt = v10;
    long long v13 = v11;
    int v7 = [(HMFProcessInfo *)self initWithAuditToken:task_info_outCnt];
  }
  BOOL v8 = v7;

  return v8;
}

+ (id)processInfoForXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  v6 = (void *)[v5 initWithAuditToken:v8];

  return v6;
}

+ (HMFProcessInfo)processInfo
{
  if (_MergedGlobals_3_11 != -1) {
    dispatch_once(&_MergedGlobals_3_11, &__block_literal_global_30);
  }
  v2 = (void *)qword_1EB4EEB50;
  return (HMFProcessInfo *)v2;
}

- (HMFProcessInfo)initWithAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v16.val[4] = v4;
  id v5 = [(HMFProcessInfo *)self initWithIdentifier:audit_token_to_pid(&v16)];
  if (v5)
  {
    v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    v5->_auditToken = v6;
    long long v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v6->var0 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v6->var0[4] = v7;
    uint64_t v8 = [(HMFProcessInfo *)v5 valueForEntitlement:@"application-identifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v8;

    long long v10 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v16.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v16.val[4] = v10;
    long long v11 = SecTaskCreateWithAuditToken(0, &v16);
    if (v11)
    {
      v12 = v11;
      CFStringRef v13 = SecTaskCopySigningIdentifier(v11, 0);
      signingIdentifier = v5->_signingIdentifier;
      v5->_signingIdentifier = &v13->isa;

      CFRelease(v12);
    }
  }
  return v5;
}

- (id)valueForEntitlement:(id)a3
{
  long long v4 = (__CFString *)a3;
  if (!self->_auditToken) {
    goto LABEL_7;
  }
  int identifier = self->_identifier;
  pid_t v6 = getpid();
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (identifier == v6)
  {
    uint64_t v8 = SecTaskCreateFromSelf(v7);
  }
  else
  {
    auditToken = self->_auditToken;
    long long v10 = *(_OWORD *)&auditToken->var0[4];
    *(_OWORD *)v14.val = *(_OWORD *)auditToken->var0;
    *(_OWORD *)&v14.val[4] = v10;
    uint64_t v8 = SecTaskCreateWithAuditToken(v7, &v14);
  }
  long long v11 = v8;
  if (v8)
  {
    v12 = (void *)SecTaskCopyValueForEntitlement(v8, v4, 0);
    CFRelease(v11);
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

- (HMFProcessInfo)initWithIdentifier:(int)a3
{
  v3 = (void *)MEMORY[0x1F4188790](self, a2, *(void *)&a3);
  int v5 = v4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = v3;
  v18.super_class = (Class)HMFProcessInfo;
  pid_t v6 = [(HMFProcessInfo *)&v18 init];
  CFAllocatorRef v7 = v6;
  if (v6)
  {
    v6->_int identifier = v5;
    if (proc_pidpath(v5, buffer, 0x1000u) >= 1
      && (uint64_t v8 = [[NSString alloc] initWithUTF8String:buffer]) != 0)
    {
      v9 = (void *)v8;
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8 isDirectory:0];
    }
    else
    {
      uint64_t v10 = 0;
    }
    executableURL = v7->_executableURL;
    v7->_executableURL = (NSURL *)v10;

    v12 = [(HMFProcessInfo *)v7 executableURL];
    if (v12) {
      uint64_t v13 = _CFBundleCopyBundleURLForExecutableURL();
    }
    else {
      uint64_t v13 = 0;
    }

    mainBundleURL = v7->_mainBundleURL;
    v7->_mainBundleURL = (NSURL *)v13;

    if (proc_name(v7->_identifier, buffer, 0x100u) < 1) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [[NSString alloc] initWithUTF8String:buffer];
    }
    name = v7->_name;
    v7->_name = (NSString *)v15;
  }
  return v7;
}

- (NSURL)executableURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)mainBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)dealloc
{
  auditToken = self->_auditToken;
  if (auditToken)
  {
    free(auditToken);
    self->_auditToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMFProcessInfo;
  [(HMFProcessInfo *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_mainBundleURL, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)shortDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Process %d", -[HMFProcessInfo identifier](self, "identifier"));
}

- (NSBundle)mainBundle
{
  v2 = [(HMFProcessInfo *)self mainBundleURL];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSBundle *)v3;
}

- (BOOL)getAuditToken:(id *)a3
{
  auditToken = self->_auditToken;
  if (a3 && auditToken)
  {
    long long v4 = *(_OWORD *)&auditToken->var0[4];
    *(_OWORD *)a3->var0 = *(_OWORD *)auditToken->var0;
    *(_OWORD *)&a3->var0[4] = v4;
  }
  return auditToken != 0;
}

+ (id)logCategory
{
  if (qword_1EB4EEB58 != -1) {
    dispatch_once(&qword_1EB4EEB58, &__block_literal_global_22);
  }
  v2 = (void *)qword_1EB4EEB60;
  return v2;
}

uint64_t __29__HMFProcessInfo_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"ProcessInfo", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEB60;
  qword_1EB4EEB60 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)logIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[HMFProcessInfo identifier](self, "identifier"));
}

- (HMFBoolean)isCodeSigned
{
  if (self->_auditToken)
  {
    csops_audittoken();
    v2 = +[HMFBoolean BOOLeanWithBool:0];
  }
  else
  {
    v2 = 0;
  }
  return (HMFBoolean *)v2;
}

- (HMFBoolean)isPlatformBinary
{
  if (self->_auditToken)
  {
    csops_audittoken();
    v2 = +[HMFBoolean BOOLeanWithBool:0];
  }
  else
  {
    v2 = 0;
  }
  return (HMFBoolean *)v2;
}

- (NSString)signingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

@end