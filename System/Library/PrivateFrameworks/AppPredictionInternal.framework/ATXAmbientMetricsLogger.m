@interface ATXAmbientMetricsLogger
- (ATXAmbientMetricsLogger)init;
- (void)collectWithActivity:(id)a3;
@end

@implementation ATXAmbientMetricsLogger

- (void)collectWithActivity:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v17 = self;
  if (objc_msgSend(v10, sel_setContinue))
  {
    uint64_t v11 = sub_1D13F27D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
    v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = v10;
    v12[5] = v17;
    v12[6] = ObjectType;
    id v13 = v10;
    v14 = v17;
    sub_1D1388CB4((uint64_t)v9, (uint64_t)&unk_1EA64D8F0, (uint64_t)v12);

    swift_release();
  }
  else
  {

    v15 = v17;
  }
}

- (ATXAmbientMetricsLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientMetricsLogger();
  return [(ATXAmbientMetricsLogger *)&v3 init];
}

@end