@interface CHSControlHost
- (BOOL)isActive;
- (CHSControlConfiguration)configuration;
- (CHSControlHost)init;
- (CHSControlHost)initWithIdentifier:(id)a3;
- (CHSControlHost)initWithIdentifier:(id)a3 configuration:(id)a4;
- (NSString)description;
- (NSString)identifier;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
@end

@implementation CHSControlHost

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CHSControlConfiguration)configuration
{
  return (CHSControlConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CHSControlHost_configuration));
}

- (void)setConfiguration:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlHost_configuration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSControlHost_configuration) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_190CC9030(v4);
}

- (BOOL)isActive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlHost__activationState);
}

- (CHSControlHost)initWithIdentifier:(id)a3
{
  sub_190D41978();
  v4 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  v5 = [(CHSControlHost *)self initWithIdentifier:v4 configuration:0];

  return v5;
}

- (CHSControlHost)initWithIdentifier:(id)a3 configuration:(id)a4
{
  uint64_t v5 = sub_190D41978();
  uint64_t v7 = v6;
  id v8 = a4;
  return (CHSControlHost *)CHSControlHost.init(identifier:configuration:)(v5, v7, a4);
}

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___CHSControlHost__invalid) == 1)
  {
    v3.receiver = self;
    v3.super_class = (Class)CHSControlHost;
    v2 = self;
    [(CHSControlHost *)&v3 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CHSControlHost__serverConnection);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)activate
{
  v2 = self;
  CHSControlHost.activate()();
}

- (void)deactivate
{
  v2 = self;
  CHSControlHost.deactivate()();
}

- (void)invalidate
{
  v2 = self;
  CHSControlHost.invalidate()();
}

- (NSString)description
{
  v2 = self;
  CHSControlHost.description.getter();

  objc_super v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHSControlHost)init
{
  result = (CHSControlHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end