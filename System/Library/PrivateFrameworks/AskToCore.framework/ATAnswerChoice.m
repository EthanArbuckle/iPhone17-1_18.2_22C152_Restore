@interface ATAnswerChoice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)completedRequestTitle;
- (NSString)description;
- (NSString)id;
- (NSString)title;
- (_TtC5AskTo14ATAnswerChoice)init;
- (_TtC5AskTo14ATAnswerChoice)initWithCoder:(id)a3;
- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4;
- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4 completedRequestTitle:(id)a5;
- (int64_t)hash;
- (signed)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedRequestTitle:(id)a3;
- (void)setKind:(signed __int16)a3;
- (void)setTitle:(id)a3;
@end

@implementation ATAnswerChoice

- (NSString)id
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)title
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_248766018();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)completedRequestTitle
{
  v2 = (char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_248766008();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setCompletedRequestTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_248766018();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (signed)kind
{
  v2 = (signed __int16 *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  return *v2;
}

- (void)setKind:(signed __int16)a3
{
  uint64_t v4 = (signed __int16 *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_248766018();
  uint64_t v8 = v7;
  uint64_t v9 = sub_248766018();
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  void *v10 = 0;
  v10[1] = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind) = 0;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  uint64_t *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  uint64_t *v12 = v9;
  v12[1] = v13;
  v15.receiver = self;
  v15.super_class = ObjectType;
  return [(ATAnswerChoice *)&v15 init];
}

- (_TtC5AskTo14ATAnswerChoice)initWithId:(id)a3 title:(id)a4 completedRequestTitle:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_248766018();
  uint64_t v10 = v9;
  uint64_t v11 = sub_248766018();
  uint64_t v13 = v12;
  if (a5)
  {
    a5 = (id)sub_248766018();
    objc_super v15 = v14;
  }
  else
  {
    objc_super v15 = 0;
  }
  v16 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  id *v16 = 0;
  v16[1] = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind) = 0;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  uint64_t *v17 = v8;
  v17[1] = v10;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  uint64_t *v18 = v11;
  v18[1] = v13;
  swift_beginAccess();
  id *v16 = a5;
  v16[1] = v15;
  swift_bridgeObjectRelease();
  v20.receiver = self;
  v20.super_class = ObjectType;
  return [(ATAnswerChoice *)&v20 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_248766278();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = ATAnswerChoice.isEqual(_:)((uint64_t)v8);

  sub_248752308((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = ATAnswerChoice.hash.getter();

  return v3;
}

- (NSString)description
{
  v2 = self;
  ATAnswerChoice.description.getter();

  int64_t v3 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC5AskTo14ATAnswerChoice)init
{
  result = (_TtC5AskTo14ATAnswerChoice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC5AskTo14ATAnswerChoice)initWithCoder:(id)a3
{
  return (_TtC5AskTo14ATAnswerChoice *)ATAnswerChoice.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ATAnswerChoice.encode(with:)((NSCoder)v4);
}

@end