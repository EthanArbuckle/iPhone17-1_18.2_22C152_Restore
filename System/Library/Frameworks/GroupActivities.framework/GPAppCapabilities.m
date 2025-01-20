@interface GPAppCapabilities
- (BOOL)supportsSharePlay;
- (BOOL)supportsStartFromApp;
- (GPAppCapabilities)init;
- (GPAppCapabilities)initWithAuditToken:(id *)a3;
- (void)setSupportsSharePlay:(BOOL)a3;
- (void)setSupportsStartFromApp:(BOOL)a3;
@end

@implementation GPAppCapabilities

- (BOOL)supportsSharePlay
{
  v2 = self;
  char v3 = AppCapabilities.supportsSharePlay.getter();

  return v3 & 1;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay) = a3;
}

- (BOOL)supportsStartFromApp
{
  v2 = self;
  char v3 = AppCapabilities.supportsStartFromApp.getter();

  return v3 & 1;
}

- (void)setSupportsStartFromApp:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp) = a3;
}

- (GPAppCapabilities)initWithAuditToken:(id *)a3
{
  return (GPAppCapabilities *)AppCapabilities.init(auditToken:)(*(void *)a3->var0, *(void *)&a3->var0[2], *(void *)&a3->var0[4], *(void *)&a3->var0[6]);
}

- (GPAppCapabilities)init
{
  result = (GPAppCapabilities *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver);
}

@end