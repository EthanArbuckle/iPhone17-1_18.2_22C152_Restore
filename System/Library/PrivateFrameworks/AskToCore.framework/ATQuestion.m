@interface ATQuestion
+ (BOOL)supportsSecureCoding;
- (ATQuestionTopic)topic;
- (BOOL)isEqual:(id)a3;
- (NSArray)answerChoices;
- (NSDate)expirationDate;
- (NSString)associatedContentAdamIdentifier;
- (NSString)associatedContentBundleIdentifier;
- (NSString)associatedContentDisplayName;
- (NSString)associatedContentIdentifier;
- (NSString)description;
- (NSString)id;
- (NSString)notificationText;
- (NSString)summary;
- (NSString)title;
- (_TtC5AskTo10ATQuestion)init;
- (_TtC5AskTo10ATQuestion)initWithCoder:(id)a3;
- (_TtC5AskTo10ATQuestion)initWithId:(id)a3 topic:(id)a4 title:(id)a5 summary:(id)a6;
- (_TtC5AskTo10ATQuestion)initWithSystemId:(id)a3 version:(double)a4 id:(id)a5 topic:(id)a6 title:(id)a7 summary:(id)a8 notificationText:(id)a9 answerChoices:(id)a10;
- (_TtC5AskTo10ATQuestion)initWithTopic:(id)a3 title:(id)a4 summary:(id)a5;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnswerChoices:(id)a3;
- (void)setAssociatedContentAdamIdentifier:(id)a3;
- (void)setAssociatedContentBundleIdentifier:(id)a3;
- (void)setAssociatedContentDisplayName:(id)a3;
- (void)setAssociatedContentIdentifier:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setNotificationText:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation ATQuestion

- (NSString)id
{
  return (NSString *)sub_2487594AC();
}

- (ATQuestionTopic)topic
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  return (ATQuestionTopic *)*v2;
}

- (void)setTopic:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)title
{
  return (NSString *)sub_248759790();
}

- (void)setTitle:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)sub_248759790();
}

- (void)setSummary:(id)a3
{
}

- (NSString)notificationText
{
  return (NSString *)sub_248759DD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

- (void)setNotificationText:(id)a3
{
}

- (NSArray)answerChoices
{
  swift_beginAccess();
  type metadata accessor for ATAnswerChoice();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248766108();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setAnswerChoices:(id)a3
{
  type metadata accessor for ATAnswerChoice();
  uint64_t v4 = sub_248766118();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)associatedContentDisplayName
{
  return (NSString *)sub_248759DD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

- (void)setAssociatedContentDisplayName:(id)a3
{
}

- (NSString)associatedContentIdentifier
{
  return (NSString *)sub_248759DD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

- (void)setAssociatedContentIdentifier:(id)a3
{
}

- (NSString)associatedContentBundleIdentifier
{
  return (NSString *)sub_248759DD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

- (void)setAssociatedContentBundleIdentifier:(id)a3
{
}

- (NSString)associatedContentAdamIdentifier
{
  return (NSString *)sub_248759DD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

- (void)setAssociatedContentAdamIdentifier:(id)a3
{
}

- (NSDate)expirationDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_248749E0C((uint64_t)v6, (uint64_t)v5, &qword_2693245C0);
  uint64_t v7 = sub_248765EF8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_248765ED8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)v9;
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_248765EE8();
    uint64_t v8 = sub_248765EF8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_248765EF8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_24875A294((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (_TtC5AskTo10ATQuestion)initWithTopic:(id)a3 title:(id)a4 summary:(id)a5
{
  uint64_t v17 = sub_248765F58();
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248766018();
  sub_248766018();
  id v10 = a3;
  sub_248765F48();
  sub_248765F08();
  uint64_t v11 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  v14 = [(ATQuestion *)self initWithId:v11 topic:v10 title:v12 summary:v13];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  return v14;
}

- (_TtC5AskTo10ATQuestion)initWithId:(id)a3 topic:(id)a4 title:(id)a5 summary:(id)a6
{
  uint64_t v7 = sub_248766018();
  uint64_t v9 = v8;
  sub_248766018();
  sub_248766018();
  id v10 = a4;
  uint64_t v11 = (_TtC5AskTo10ATQuestion *)sub_24875E44C(v7, v9, (uint64_t)v10);

  return v11;
}

- (_TtC5AskTo10ATQuestion)initWithSystemId:(id)a3 version:(double)a4 id:(id)a5 topic:(id)a6 title:(id)a7 summary:(id)a8 notificationText:(id)a9 answerChoices:(id)a10
{
  id v31 = a6;
  v32 = self;
  uint64_t v12 = sub_248765F58();
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248765F38();
  uint64_t v30 = sub_248766018();
  uint64_t v16 = v15;
  uint64_t v17 = sub_248766018();
  uint64_t v19 = v18;
  uint64_t v20 = sub_248766018();
  uint64_t v22 = v21;
  if (a9)
  {
    a9 = (id)sub_248766018();
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v24 = 0;
  }
  type metadata accessor for ATAnswerChoice();
  uint64_t v25 = sub_248766118();
  id v26 = v31;
  v27 = (_TtC5AskTo10ATQuestion *)sub_24875E604((uint64_t)v14, v30, v16, v26, v17, v19, v20, v22, a4, (uint64_t)a9, v24, v25);

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24875CA0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))ATQuestion.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = ATQuestion.hash.getter();

  return v3;
}

- (NSString)description
{
  v2 = self;
  ATQuestion.description.getter();

  int64_t v3 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC5AskTo10ATQuestion)init
{
  result = (_TtC5AskTo10ATQuestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  uint64_t v4 = sub_248765F58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2487495A4((uint64_t)self + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate, &qword_2693245C0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC5AskTo10ATQuestion)initWithCoder:(id)a3
{
  return (_TtC5AskTo10ATQuestion *)ATQuestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ATQuestion.encode(with:)((NSCoder)v4);
}

@end