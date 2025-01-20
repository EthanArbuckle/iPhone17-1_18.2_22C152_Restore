@interface SuggestionsOrderBanner
+ (id)walletLogo;
- (NSAttributedString)bannerAttributedSubtitle;
- (NSString)merchantName;
- (NSURL)orderDeepLink;
- (UIImage)merchantLogo;
- (_TtC12FinanceKitUI22SuggestionsOrderBanner)init;
- (id)init:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation SuggestionsOrderBanner

- (id)init:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_243DFBC50();
  unint64_t v7 = v6;

  return SuggestionsOrderBanner.init(_:)(v5, v7);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  swift_retain();
  sub_243DF8C00();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(SuggestionsOrderBanner *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI22SuggestionsOrderBanner_order;
  uint64_t v4 = sub_243DFA4D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC12FinanceKitUI22SuggestionsOrderBanner_configuration;
  uint64_t v6 = sub_243DFA010();
  unint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (NSString)merchantName
{
  uint64_t v3 = sub_243DF8CD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = self;
  sub_243DFA4A0();
  sub_243DF8C70();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v8 = (void *)sub_243DF8BE0();
  swift_bridgeObjectRelease();
  sub_243DF9310();

  v9 = (void *)sub_243DFE8E0();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (UIImage)merchantLogo
{
  v2 = self;
  id v3 = SuggestionsOrderBanner.merchantLogo.getter();

  return (UIImage *)v3;
}

- (NSURL)orderDeepLink
{
  uint64_t v3 = sub_243DFACC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243DF8AA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19D10);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = self;
  sub_243DF8A30();
  LOBYTE(self) = sub_243DF8A90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (self)
  {
    sub_243DFA3B0();
    sub_243DF8870();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v15 = sub_243DFBC00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 0, 1, v15);
  }
  else
  {
    uint64_t v15 = sub_243DFBC00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }

  sub_243DFBC00();
  uint64_t v16 = *(void *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    v17 = (void *)sub_243DFBB30();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }

  return (NSURL *)v17;
}

- (NSAttributedString)bannerAttributedSubtitle
{
  v2 = self;
  id v3 = SuggestionsOrderBanner.bannerAttributedSubtitle.getter();

  return (NSAttributedString *)v3;
}

+ (id)walletLogo
{
  if (qword_268E18058 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268E198F8;

  return v2;
}

- (_TtC12FinanceKitUI22SuggestionsOrderBanner)init
{
  result = (_TtC12FinanceKitUI22SuggestionsOrderBanner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end