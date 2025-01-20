@interface _EXExtensionProcessHandle
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)valid;
- (NSString)description;
- (RBSAssertion)assertion;
- (RBSAssertion)launchAssertion;
- (RBSProcessIdentity)processIdentity;
- (_EXExtensionConfigurationProviding)configuration;
- (_EXExtensionIdentity)extensionIdentity;
- (_EXExtensionProcessHandle)init;
- (_EXExtensionProcessHandle)initWithCoder:(id)a3;
- (_EXLaunchConfiguration)launchConfiguration;
- (id)makeLibXPCConnectionAndReturnError:(id *)a3;
- (id)makeSessionXPCConnection;
- (id)makeXPCConnectionRetainProcess:(BOOL)a3 error:(id *)a4;
- (int)pid;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setLaunchAssertion:(id)a3;
@end

@implementation _EXExtensionProcessHandle

- (NSString)description
{
  v2 = self;
  sub_191F2B230();

  v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion), sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for _EXExtensionProcessHandle();
  [(_EXExtensionProcessHandle *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F2FF1C(v4);
}

- (_EXExtensionProcessHandle)initWithCoder:(id)a3
{
  return (_EXExtensionProcessHandle *)_EXExtensionProcessHandle.init(coder:)((char **)a3);
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92FDAA0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92FDAA0 = a3;
}

- (_EXExtensionIdentity)extensionIdentity
{
  return (_EXExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration)
                                                                         + OBJC_IVAR____EXLaunchConfiguration__extensionIdentity));
}

- (_EXLaunchConfiguration)launchConfiguration
{
  return (_EXLaunchConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration));
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_auditToken);
  long long v5 = v7;
  *(_OWORD *)retstr->var0 = v6;
  *(_OWORD *)&retstr->var0[4] = v5;
  return result;
}

- (int)pid
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle) pid];
}

- (RBSAssertion)launchAssertion
{
  return (RBSAssertion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion));
}

- (void)setLaunchAssertion:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchAssertion) = (Class)a3;
  id v3 = a3;
}

- (RBSAssertion)assertion
{
  return (RBSAssertion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____EXExtensionProcessHandle_assertion));
}

- (void)setAssertion:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion) = (Class)a3;
  id v3 = a3;
}

- (RBSProcessIdentity)processIdentity
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_innerProcessHandle), sel_identity);

  return (RBSProcessIdentity *)v2;
}

- (void)invalidate
{
  id v2 = self;
  sub_191F9D1B0();
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)makeXPCConnectionRetainProcess:(BOOL)a3 error:(id *)a4
{
  long long v5 = self;
  long long v6 = sub_191F2C048(a3);

  return v6;
}

- (id)makeLibXPCConnectionAndReturnError:(id *)a3
{
  id v3 = self;
  xpc_connection_t v4 = sub_191F2BBB0();

  return v4;
}

- (id)makeSessionXPCConnection
{
  id v2 = self;
  id v3 = sub_191F9D454();

  return v3;
}

- (BOOL)valid
{
  id v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_invalidationLock)
                          + 16);
  id v3 = self;
  os_unfair_lock_lock(v2);
  xpc_connection_t v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____EXExtensionProcessHandle_assertion);
  if (v4) {
    unsigned __int8 v5 = objc_msgSend(v4, sel_isValid);
  }
  else {
    unsigned __int8 v5 = 0;
  }
  os_unfair_lock_unlock(v2);

  return v5;
}

- (_EXExtensionConfigurationProviding)configuration
{
  id v2 = objc_msgSend(*(id *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____EXExtensionProcessHandle_launchConfiguration)+ OBJC_IVAR____EXLaunchConfiguration__extensionIdentity), sel_configuration);

  return (_EXExtensionConfigurationProviding *)v2;
}

- (_EXExtensionProcessHandle)init
{
  result = (_EXExtensionProcessHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end