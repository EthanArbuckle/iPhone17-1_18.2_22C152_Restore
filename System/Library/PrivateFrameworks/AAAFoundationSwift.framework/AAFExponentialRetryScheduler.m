@interface AAFExponentialRetryScheduler
- (AAFExponentialRetryScheduler)init;
- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3;
- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3 power:(double)a4;
- (void)scheduleTask:(AAFExponentialRetryScheduler *)self shouldRetry:(SEL)a2 completionHandler:(id)a3;
@end

@implementation AAFExponentialRetryScheduler

- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3
{
  return [(AAFExponentialRetryScheduler *)self initWithMaxRetries:a3 power:2.0];
}

- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3 power:(double)a4
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  id v6 = objc_allocWithZone((Class)swift_getObjectType());
  v7 = (AAFExponentialRetryScheduler *)ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a3, (uint64_t)v9, a4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)scheduleTask:(AAFExponentialRetryScheduler *)self shouldRetry:(SEL)a2 completionHandler:(id)a3
{
  v5 = v4;
  id v6 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a3);
  v14 = _Block_copy(v6);
  v15 = _Block_copy(v5);
  v16 = (void *)swift_allocObject();
  v16[2] = v13;
  v16[3] = v14;
  v16[4] = v15;
  v16[5] = self;
  uint64_t v17 = sub_1B8F57740();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9EF4F98;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E9EF4FA8;
  v19[5] = v18;
  v20 = self;
  sub_1B8F43EE8((uint64_t)v12, (uint64_t)&unk_1E9EF4FB8, (uint64_t)v19);
  swift_release();
}

- (AAFExponentialRetryScheduler)init
{
  result = (AAFExponentialRetryScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end