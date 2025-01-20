@interface APLazyRecordApplication
- (APApplication)application;
- (APLazyRecordApplication)init;
- (APLazyRecordApplication)initWithApplication:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (id)loadRecordWithError:(id *)a3;
- (void)detach;
@end

@implementation APLazyRecordApplication

- (APApplication)application
{
  return (APApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___APLazyRecordApplication_application));
}

- (APLazyRecordApplication)initWithApplication:(id)a3
{
  uint64_t v5 = OBJC_IVAR___APLazyRecordApplication_lazyRecord;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CABA0);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 28) = 0;
  *(void *)(v6 + 16) = 0;
  *(unsigned char *)(v6 + 24) = 2;
  *(Class *)((char *)&self->super.isa + v5) = (Class)v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APLazyRecordApplication_application) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)APLazyRecordApplication;
  id v7 = a3;
  return [(APLazyRecordApplication *)&v9 init];
}

- (id)loadRecordWithError:(id *)a3
{
  v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___APLazyRecordApplication_lazyRecord);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 7;
  uint64_t v6 = self;
  os_unfair_lock_lock(v5);
  sub_247D4EA4C(v4, &v9);
  os_unfair_lock_unlock(v5);
  id v7 = v9;

  return v7;
}

- (NSString)localizedName
{
  v2 = self;
  sub_247D4E658();

  v3 = (void *)sub_247DD2BF0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = self;
  v3 = [(APLazyRecordApplication *)v2 application];
  id v4 = [(APApplication *)v3 bundleIdentifier];

  sub_247DD2C20();
  uint64_t v5 = (void *)sub_247DD2BF0();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)detach
{
  v2 = self;
  sub_247D4E818();
}

- (APLazyRecordApplication)init
{
  result = (APLazyRecordApplication *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end