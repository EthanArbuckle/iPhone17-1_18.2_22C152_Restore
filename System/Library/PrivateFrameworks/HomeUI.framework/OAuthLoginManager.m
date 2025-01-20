@interface OAuthLoginManager
- (_TtC6HomeUI17OAuthLoginManager)init;
- (_TtC6HomeUI17OAuthLoginManager)initWithAuthURL:(id)a3 presentingContext:(id)a4;
- (id)processRedirectURL:(id)a3;
- (void)startAuthenticationWithPresentationContext:(id)a3 completion:(id)a4;
- (void)startSessionWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation OAuthLoginManager

- (_TtC6HomeUI17OAuthLoginManager)initWithAuthURL:(id)a3 presentingContext:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1142D0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BE9C0FF8();
    uint64_t v10 = sub_1BE9C1018();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1BE9C1018();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  v12 = (_TtC6HomeUI17OAuthLoginManager *)sub_1BE491FEC((uint64_t)v9, (uint64_t)a4, (char *)self);
  swift_unknownObjectRelease();
  return v12;
}

- (void)startSessionWithAuthURL:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_1BE9C1018();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1BE9C0FF8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  swift_unknownObjectRetain();
  uint64_t v14 = self;
  sub_1BE491B14((uint64_t)v11, (uint64_t)a4, (uint64_t)sub_1BE49358C, v13, (uint64_t)v14);
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)startAuthenticationWithPresentationContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_1BE4911A8((uint64_t)a3, (void (*)(void, void, void *))sub_1BE493584, v7, (char *)v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)processRedirectURL:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1142D0);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BE9C0FF8();
    uint64_t v7 = sub_1BE9C1018();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_1BE9C1018();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_1BE492704((uint64_t)v6);
  sub_1BE39DA0C((uint64_t)v6, &qword_1EA1142D0);
  uint64_t v9 = (void *)sub_1BE9C48E8();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC6HomeUI17OAuthLoginManager)init
{
  result = (_TtC6HomeUI17OAuthLoginManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BE39DA0C((uint64_t)self + OBJC_IVAR____TtC6HomeUI17OAuthLoginManager_authURL, &qword_1EA1142D0);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end