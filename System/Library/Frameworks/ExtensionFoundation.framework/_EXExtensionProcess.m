@interface _EXExtensionProcess
+ (id)extensionProcessWithConfiguration:(id)a3 error:(id *)a4;
+ (void)extensionProcessWithConfiguration:(id)a3 completionHandler:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isValid;
- (BOOL)matchesProcess:(id)a3;
- (_EXExtensionProcess)init;
- (_EXExtensionProcess)initWithInternalExtensionProcess:(id)a3;
- (_EXExtensionProcessHandle)internalExtensionProcess;
- (_EXHostConfiguration)configuration;
- (id)makeLibXPCConnectionWithError:(id *)a3;
- (id)makeXPCConnectionWithError:(id *)a3;
- (id)newXPCConnectionWithError:(id *)a3;
- (id)processPredicate;
- (int)pid;
- (int)rbs_pid;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateLaunchAssertion;
- (void)setConfiguration:(id)a3;
@end

@implementation _EXExtensionProcess

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_auditToken);
  long long v5 = v7;
  *(_OWORD *)retstr->var0 = v6;
  *(_OWORD *)&retstr->var0[4] = v5;
  return result;
}

- (int)rbs_pid
{
  return [*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle) pid];
}

- (id)makeLibXPCConnectionWithError:(id *)a3
{
  v3 = self;
  xpc_connection_t v4 = sub_191F2BBB0();

  return v4;
}

- (id)newXPCConnectionWithError:(id *)a3
{
  v3 = self;
  xpc_connection_t v4 = sub_191F2C048(1);

  return v4;
}

+ (id)extensionProcessWithConfiguration:(id)a3 error:(id *)a4
{
  id v4 = a3;
  sub_191F44648(v4);
  long long v6 = v5;

  return v6;
}

+ (void)extensionProcessWithConfiguration:(id)a3 completionHandler:(id)a4
{
  long long v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  _s19ExtensionFoundation19_EXExtensionProcessC09extensionD013configuration17completionHandleryAA20_EXHostConfigurationC_yACSg_So7NSErrorCSgtctFZ_0(v7, (uint64_t)sub_191F357F8, v6);

  swift_release();
}

- (_EXExtensionProcess)initWithInternalExtensionProcess:(id)a3
{
  id v3 = a3;
  id v4 = sub_191F9356C();
  id v5 = objc_allocWithZone((Class)type metadata accessor for _EXExtensionProcess());
  uint64_t v6 = (_EXExtensionProcess *)sub_191F45904(v3, v4);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void)dealloc
{
  v2 = self;
  _EXExtensionProcess.__deallocating_deinit();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess_configuration);
}

- (id)makeXPCConnectionWithError:(id *)a3
{
  id v3 = self;
  id v4 = sub_191F2C048(0);

  return v4;
}

- (void)invalidate
{
  v2 = self;
  sub_191F99588();
}

- (BOOL)isValid
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle);
  id v3 = (os_unfair_lock_s *)(*(void *)(v2 + OBJC_IVAR____EXExtensionProcessHandle_invalidationLock) + 16);
  id v4 = self;
  os_unfair_lock_lock(v3);
  id v5 = *(void **)(v2 + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  if (v5) {
    unsigned __int8 v6 = objc_msgSend(v5, sel_isValid);
  }
  else {
    unsigned __int8 v6 = 0;
  }
  os_unfair_lock_unlock(v3);

  return v6;
}

- (void)invalidateLaunchAssertion
{
}

- (int)pid
{
  return [*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle) pid];
}

- (_EXHostConfiguration)configuration
{
  uint64_t v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess_configuration);
  swift_beginAccess();
  return (_EXHostConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess_configuration);
  swift_beginAccess();
  id v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (_EXExtensionProcessHandle)internalExtensionProcess
{
  return (_EXExtensionProcessHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____EXExtensionProcess__processHandle));
}

- (BOOL)matchesProcess:(id)a3
{
  id v3 = self;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)
                + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle);
  id v5 = a3;
  id v6 = v3;
  objc_msgSend(v4, sel_auditToken);
  objc_msgSend(v5, sel_auditToken);
  LOBYTE(v3) = _EXAuditTokenEqual(&v9, &v8);

  return (char)v3;
}

- (id)processPredicate
{
  uint64_t v2 = *(void **)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcess__processHandle)
                + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle);
  id v3 = self;
  [v2 pid];
  id v4 = (void *)sub_191FBA628();
  id v5 = objc_msgSend(self, sel_predicateMatchingIdentifier_, v4);

  return v5;
}

- (_EXExtensionProcess)init
{
  result = (_EXExtensionProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end