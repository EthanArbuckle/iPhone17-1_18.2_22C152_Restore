@interface JEMetricsSecretMigrator
+ (void)migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:(NSString *)a3 topic:(NSString *)a4 secretKey:(AMSMetricsIdentifierKey *)a5 configuration:(NSDictionary *)a6 completionHandler:(id)a7;
- (_TtC9JetEngine23JEMetricsSecretMigrator)init;
@end

@implementation JEMetricsSecretMigrator

+ (void)migrateSecretIfNecessaryAndReturnSecretValueWithNamespace:(NSString *)a3 topic:(NSString *)a4 secretKey:(AMSMetricsIdentifierKey *)a5 configuration:(NSDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB392830);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  uint64_t v18 = sub_19F1DC37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E9474978;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1E9474988;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_19EE9A0F8((uint64_t)v15, (uint64_t)aHN, (uint64_t)v20);
  swift_release();
}

- (_TtC9JetEngine23JEMetricsSecretMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JEMetricsSecretMigrator();
  return [(JEMetricsSecretMigrator *)&v3 init];
}

@end