@interface MessageComposeViewController
- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithCoder:(id)a3;
- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)messageComposeViewController:(MFMessageComposeViewController *)a3 shouldSendMessage:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation MessageComposeViewController

- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithCoder:(id)a3
{
  v3 = (objc_class *)type metadata accessor for MessageComposeViewController();
  v4 = (char *)objc_allocWithZone(v3);
  *(void *)&v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_finalRecipients] = MEMORY[0x263F8EE78];
  v5 = &v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_onDoneSharing];
  *(void *)v5 = nullsub_1;
  *((void *)v5 + 1) = 0;
  v6 = &v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_onCancel];
  *(void *)v6 = nullsub_1;
  *((void *)v6 + 1) = 0;
  v9.receiver = v4;
  v9.super_class = v3;
  v7 = [(MessageComposeViewController *)&v9 initWithNibName:0 bundle:0];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)a3 shouldSendMessage:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267BEF8D8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267BEF290;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_218C50914((uint64_t)v13, (uint64_t)&unk_267BE8C80, (uint64_t)v18);
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_218C30B74(a4);
}

- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14FamilyCircleUI28MessageComposeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end