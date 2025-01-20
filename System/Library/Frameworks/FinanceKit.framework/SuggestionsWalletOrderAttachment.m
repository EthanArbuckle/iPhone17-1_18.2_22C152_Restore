@interface SuggestionsWalletOrderAttachment
+ (id)readContentsOfOrderAt:(id)a3 error:(id *)a4;
- (NSData)data;
- (NSString)fqoid;
- (NSURL)url;
- (_TtC10FinanceKit32SuggestionsWalletOrderAttachment)init;
- (int64_t)state;
- (void)setData:(id)a3;
- (void)setFqoid:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation SuggestionsWalletOrderAttachment

- (NSURL)url
{
  uint64_t v3 = sub_243957010();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_243956F00();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v8;
}

- (void)setUrl:(id)a3
{
  uint64_t v4 = sub_243957010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243956F90();
  v8 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (NSData)data
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data);
  swift_beginAccess();
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  sub_243403DD0(v4, v3);
  uint64_t v5 = (void *)sub_2439570A0();
  sub_2433807F0(v4, v3);

  return (NSData *)v5;
}

- (void)setData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_2439570C0();
  uint64_t v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data);
  swift_beginAccess();
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  uint64_t *v9 = v6;
  v9[1] = v8;
  sub_2433807F0(v10, v11);
}

- (NSString)fqoid
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setFqoid:(id)a3
{
  uint64_t v4 = sub_2439582D0();
  uint64_t v6 = v5;
  uint64_t v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_fqoid);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)state
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_state);
  swift_beginAccess();
  return *v2;
}

- (void)setState:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_state);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

+ (id)readContentsOfOrderAt:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_243957010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243956F90();
  swift_getObjCClassMetadata();
  uint64_t v8 = static SuggestionsWalletOrderAttachment.readContentsOfOrder(at:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v8;
}

- (_TtC10FinanceKit32SuggestionsWalletOrderAttachment)init
{
  result = (_TtC10FinanceKit32SuggestionsWalletOrderAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  uint64_t v4 = sub_243957010();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2433807F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data), *(void *)&self->_anon_0[OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data]);

  swift_bridgeObjectRelease();
}

@end