@interface BankConnectImageProvider
- (_TtC12FinanceKitUI24BankConnectImageProvider)init;
- (void)logoFor:(NSString *)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6;
@end

@implementation BankConnectImageProvider

- (_TtC12FinanceKitUI24BankConnectImageProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_243DF9860();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC12FinanceKitUI24BankConnectImageProvider_bankConnectService) = (Class)sub_243DF9850();

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [(BankConnectImageProvider *)&v6 init];
}

- (void)logoFor:(NSString *)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(CGFloat *)(v16 + 24) = width;
  *(CGFloat *)(v16 + 32) = height;
  *(double *)(v16 + 40) = a5;
  *(void *)(v16 + 48) = v15;
  *(void *)(v16 + 56) = self;
  uint64_t v17 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_268E22380;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_268E20C30;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_243DAA940((uint64_t)v14, (uint64_t)&unk_268E1D400, (uint64_t)v19);
  swift_release();
}

- (void).cxx_destruct
{
}

@end