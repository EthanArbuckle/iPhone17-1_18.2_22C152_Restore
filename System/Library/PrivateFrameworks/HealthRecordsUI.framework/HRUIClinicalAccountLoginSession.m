@interface HRUIClinicalAccountLoginSession
- (BOOL)startLoginWithGateway:(id)a3 loginCancelledHandler:(id)a4 callbackErrorHandler:(id)a5 error:(id *)a6;
- (BOOL)startReloginToAccount:(id)a3 viewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 callbackErrorHandler:(id)a7 error:(id *)a8;
- (HRUIClinicalAccountLoginSession)init;
- (HRUIClinicalAccountLoginSession)initWithAccountStore:(id)a3 presentationAnchor:(id)a4 funnelContext:(int64_t)a5;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
@end

@implementation HRUIClinicalAccountLoginSession

- (HRUIClinicalAccountLoginSession)initWithAccountStore:(id)a3 presentationAnchor:(id)a4 funnelContext:(int64_t)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_authSession) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_accountStore) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_presentationAnchor) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_funnelContext) = (Class)a5;
  v13.receiver = self;
  v13.super_class = ObjectType;
  id v10 = a3;
  id v11 = a4;
  return [(HRUIClinicalAccountLoginSession *)&v13 init];
}

- (BOOL)startLoginWithGateway:(id)a3 loginCancelledHandler:(id)a4 callbackErrorHandler:(id)a5 error:(id *)a6
{
  sub_1C2249070(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v25 - v11;
  objc_super v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  if (v13)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v13;
    objc_super v13 = sub_1C2249C10;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  sub_1C254F820();
  id v18 = a3;
  v19 = self;
  id v20 = v18;
  sub_1C223E0BC((uint64_t)v13);
  swift_retain();
  uint64_t v21 = sub_1C254F810();
  v22 = (void *)swift_allocObject();
  uint64_t v23 = MEMORY[0x1E4FBCFD8];
  v22[2] = v21;
  v22[3] = v23;
  v22[4] = v19;
  v22[5] = v20;
  v22[6] = v13;
  v22[7] = v15;
  v22[8] = sub_1C2249518;
  v22[9] = v16;
  sub_1C223EBB8((uint64_t)v12, (uint64_t)&unk_1EA2DF048, (uint64_t)v22);
  swift_release();

  swift_release();
  sub_1C221794C((uint64_t)v13);
  return 1;
}

- (BOOL)startReloginToAccount:(id)a3 viewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 callbackErrorHandler:(id)a7 error:(id *)a8
{
  v33 = self;
  sub_1C2249070(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v32 - v14;
  uint64_t v16 = _Block_copy(a6);
  uint64_t v17 = _Block_copy(a7);
  if (v16)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v16;
    uint64_t v16 = sub_1C2249590;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v17;
  uint64_t v20 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  sub_1C254F820();
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  v24 = v33;
  id v25 = v21;
  id v26 = v22;
  id v27 = v23;
  sub_1C223E0BC((uint64_t)v16);
  swift_retain();
  uint64_t v28 = sub_1C254F810();
  v29 = (void *)swift_allocObject();
  uint64_t v30 = MEMORY[0x1E4FBCFD8];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v24;
  v29[5] = v25;
  v29[6] = v26;
  v29[7] = v27;
  v29[8] = v16;
  v29[9] = v18;
  v29[10] = sub_1C2249518;
  v29[11] = v19;
  sub_1C223ED60((uint64_t)v15, (uint64_t)&unk_1EA2DF040, (uint64_t)v29);
  swift_release();

  swift_release();
  sub_1C221794C((uint64_t)v16);
  return 1;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HRUIClinicalAccountLoginSession_presentationAnchor));
}

- (HRUIClinicalAccountLoginSession)init
{
  result = (HRUIClinicalAccountLoginSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_authSession);
}

@end