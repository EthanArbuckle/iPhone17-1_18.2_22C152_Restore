@interface FPDDeadEndExtensionSession
- (BOOL)hasFileProviderAttributionMDMAccess;
- (FPDDeadEndExtensionSession)init;
- (FPDDeadEndExtensionSession)initWithError:(id)a3;
- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5;
- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4;
@end

@implementation FPDDeadEndExtensionSession

- (FPDDeadEndExtensionSession)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDDeadEndExtensionSession;
  v5 = [(FPDDeadEndExtensionSession *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (FPDDeadEndExtensionSession)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"shouldn't be called"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDDeadEndExtensionSession init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionSession.m", 1286, (const char *)[v2 UTF8String]);
}

- (id)existingFileProviderProxyWithTimeout:(double)a3 onlyAlreadyLifetimeExtended:(BOOL)a4 pid:(int)a5
{
  id v5 = [(FPDDeadEndExtensionSession *)self newFileProviderProxyWithTimeout:*(void *)&a5 pid:a3];
  return v5;
}

- (id)newFileProviderProxyWithTimeout:(double)a3 pid:(int)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4F25DA8]);
  error = self->_error;
  return (id)[v5 initWithConnection:0 protocol:&unk_1F2EF71F8 orError:error name:@"dead-end" requestPid:0];
}

- (BOOL)hasFileProviderAttributionMDMAccess
{
  return self->hasFileProviderAttributionMDMAccess;
}

- (void).cxx_destruct
{
}

@end