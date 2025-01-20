@interface TapViewModel
- (void)closeUI;
- (void)closeUIImmediate;
- (void)requiresCardPIN:(id)a3;
- (void)updateWithTransactionEvent:(int64_t)a3;
- (void)vasReadSuccessWithMerchantNames:(id)a3;
@end

@implementation TapViewModel

- (void)updateWithTransactionEvent:(int64_t)a3
{
  swift_retain();
  sub_23EEDA84C(a3);
  swift_release();
}

- (void)vasReadSuccessWithMerchantNames:(id)a3
{
  uint64_t v3 = sub_23EF05628();
  swift_retain();
  sub_23EEDACEC(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)requiresCardPIN:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_23EEDB244(v3);

  swift_release();
}

- (void)closeUI
{
  swift_retain();
  sub_23EEDC090();
  swift_release();
}

- (void)closeUIImmediate
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268C20320 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v3 = (char *)off_268C22168;
  uint64_t v4 = qword_268C202A8;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_268C26630);
  sub_23EDB8CB8(v5, (uint64_t)v2, (uint64_t *)&unk_268C21A00);
  uint64_t v6 = sub_23EF03AA8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) == 1)
  {
    sub_23EDB8D1C((uint64_t)v2, (uint64_t *)&unk_268C21A00);
  }
  else
  {
    sub_23ED9D368((uint64_t)v3, 0x736F4865736F6C63, 0xEB00000000292874, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v6);
  }
  v8 = (void *)MEMORY[0x2455BFAE0](v3 + 56);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

@end