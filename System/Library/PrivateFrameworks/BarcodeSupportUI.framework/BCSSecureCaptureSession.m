@interface BCSSecureCaptureSession
+ (BOOL)hasActiveSession;
+ (void)authenticateWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4;
+ (void)beginDelayingAppearance;
+ (void)endDelayingAppearance;
- (BCSSecureCaptureSession)init;
@end

@implementation BCSSecureCaptureSession

+ (BOOL)hasActiveSession
{
  return qword_269339A28 != 0;
}

+ (void)authenticateWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269339A38);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  uint64_t v11 = sub_248AEBF48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269339A48;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269339A58;
  v13[5] = v12;
  v14 = a3;
  sub_248AEAB60((uint64_t)v8, (uint64_t)&unk_269339A68, (uint64_t)v13);
  swift_release();
}

+ (void)beginDelayingAppearance
{
}

+ (void)endDelayingAppearance
{
}

- (BCSSecureCaptureSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BCSSecureCaptureSession();
  return [(BCSSecureCaptureSession *)&v3 init];
}

@end