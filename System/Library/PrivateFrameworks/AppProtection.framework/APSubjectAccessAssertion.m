@interface APSubjectAccessAssertion
+ (void)acquireForSubject:(id)a3 completion:(id)a4;
+ (void)acquireForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6;
- (APSubjectAccessAssertion)init;
- (APSubjectAccessAssertion)initWithSubject:(id)a3 uuid:(id)a4;
- (NSString)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation APSubjectAccessAssertion

- (APSubjectAccessAssertion)initWithSubject:(id)a3 uuid:(id)a4
{
  uint64_t v7 = OBJC_IVAR___APSubjectAccessAssertion_invalidated;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CAE18);
  v8 = (objc_class *)swift_allocObject();
  *((unsigned char *)v8 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v7) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSubjectAccessAssertion_subject) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSubjectAccessAssertion_uuid) = (Class)a4;
  v12.receiver = self;
  v12.super_class = (Class)APSubjectAccessAssertion;
  id v9 = a3;
  id v10 = a4;
  return [(APSubjectAccessAssertion *)&v12 init];
}

+ (void)acquireForSubject:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = APGetAuditTokenForSelf();
  if (v9)
  {
    long long v13 = *(_OWORD *)v9;
    id v10 = *(void (**)(uint64_t, void *, void *))(v9 + 16);
    v11 = *(void **)(v9 + 24);
    v17 = sub_247D7D88C;
    uint64_t v18 = v7;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    v15 = sub_247D775C8;
    v16 = &block_descriptor_50_0;
    objc_super v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    long long aBlock = v13;
    v15 = v10;
    v16 = v11;
    objc_msgSend(a1, sel_acquireForSubject_onBehalfOfProcessWithAuditToken_accessGrantReason_completion_, v8, &aBlock, 0x7FFFFFFFFFFFFFFFLL, v12);
    _Block_release(v12);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

+ (void)acquireForSubject:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantReason:(int64_t)a5 completion:(id)a6
{
  unint64_t v8 = *(void *)a4->var0;
  unint64_t v9 = *(void *)&a4->var0[2];
  unint64_t v10 = *(void *)&a4->var0[4];
  unint64_t v11 = *(void *)&a4->var0[6];
  objc_super v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  sub_247D7CF78(v14, v8, v9, v10, v11, a5, (uint64_t)sub_247D6E4DC, v13);

  swift_release();
}

- (void)dealloc
{
  v2 = self;
  sub_247D79840();
}

- (void).cxx_destruct
{
  swift_release();
}

- (NSString)description
{
  v2 = self;
  APSubjectAccessAssertion.description.getter();

  v3 = (void *)sub_247DD2BF0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)invalidate
{
  v2 = self;
  sub_247D79F34();
}

- (APSubjectAccessAssertion)init
{
  result = (APSubjectAccessAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end