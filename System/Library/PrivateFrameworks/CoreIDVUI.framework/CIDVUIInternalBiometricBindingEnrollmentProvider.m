@interface CIDVUIInternalBiometricBindingEnrollmentProvider
- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)init;
- (void)enrollWithCompletion:(id)a3;
- (void)fetchAttestationsWithCompletion:(id)a3;
@end

@implementation CIDVUIInternalBiometricBindingEnrollmentProvider

- (void)enrollWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_21F47EF74;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_21F47D908((uint64_t)v7, (uint64_t)&unk_267EDE838, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)fetchAttestationsWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_21F47EE68;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_21F47D908((uint64_t)v7, (uint64_t)&unk_267EDE830, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)init
{
  return (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *)CIDVUIInternalBiometricBindingEnrollmentProvider.init()();
}

- (void).cxx_destruct
{
}

@end