@interface _EXRunningLibXPCServiceExtension
- (_EXExtensionIdentity)extensionIdentity;
- (_EXRunningLibXPCServiceExtension)init;
- (int)_startWithArguments:(const char *)a3 count:(int)a4;
- (void)resume;
@end

@implementation _EXRunningLibXPCServiceExtension

- (void)resume
{
  v2 = self;
  sub_191F325F0();
}

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = self;
  LODWORD(v4) = sub_191F32D0C((uint64_t)a3, v4);

  return v4;
}

- (_EXRunningLibXPCServiceExtension)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____EXRunningLibXPCServiceExtension____lazy_storage____extensionIdentity) = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____EXRunningLibXPCServiceExtension_connectionHandler);
  uint64_t v4 = (objc_class *)type metadata accessor for _EXRunningLibXPCServiceExtension();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(_EXRunningLibXPCServiceExtension *)&v6 init];
}

- (_EXExtensionIdentity)extensionIdentity
{
  v2 = self;
  id v3 = sub_191FA3AE4();

  return (_EXExtensionIdentity *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____EXRunningLibXPCServiceExtension____lazy_storage____extensionIdentity));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____EXRunningLibXPCServiceExtension_connectionHandler);

  sub_191F45B24(v3);
}

@end