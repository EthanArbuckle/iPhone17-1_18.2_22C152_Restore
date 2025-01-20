@interface FBKSForm_FrameworkPrivateName
+ (id)fromJSONWithData:(id)a3;
- (FBKSForm_FrameworkPrivateName)init;
- (FBKSForm_FrameworkPrivateName)initWithIdentifier:(id)a3;
- (NSData)asJSON;
- (NSString)identifier;
- (id)asFBAURLSchemeWithIsSurvey:(BOOL)a3;
- (int64_t)authenticationMethod;
- (void)prefillWithQuestion:(id)a3 answer:(id)a4;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuestionsWithNsMutableDict:(id)a3;
@end

@implementation FBKSForm_FrameworkPrivateName

- (void)setQuestionsWithNsMutableDict:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s15FeedbackService8FBKSFormC12setQuestions13nsMutableDictySo19NSMutableDictionaryC_tF_0();
}

- (NSData)asJSON
{
  v2 = self;
  uint64_t v3 = FBKSForm.asJSON.getter();
  unint64_t v5 = v4;

  v6 = (void *)sub_24E001CC0();
  sub_24DF9311C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_24E001CD0();
  unint64_t v6 = v5;

  v7 = (void *)_s15FeedbackService8FBKSFormC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_24DF9311C(v4, v6);
  return v7;
}

- (id)asFBAURLSchemeWithIsSurvey:(BOOL)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698A0E18);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  FBKSForm.asFBAURLScheme(isSurvey:)(a3, (uint64_t)v7);

  uint64_t v9 = sub_24E001C90();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_24E001C40();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

- (NSString)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24E001E20();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_24E001E30();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)authenticationMethod
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  swift_beginAccess();
  return *v2;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (FBKSForm_FrameworkPrivateName)initWithIdentifier:(id)a3
{
  uint64_t v4 = sub_24E001E30();
  uint64_t v6 = v5;
  v7 = (unint64_t *)((char *)self + OBJC_IVAR___FBKSForm_FrameworkPrivateName_answers);
  v8 = self;
  uint64_t v9 = MEMORY[0x263F8EE78];
  unint64_t *v7 = sub_24DFBF934(MEMORY[0x263F8EE78]);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FBKSForm_FrameworkPrivateName_authenticationMethod) = (Class)3;
  unint64_t v10 = sub_24DFBF934(v9);
  swift_beginAccess();
  unint64_t *v7 = v10;
  swift_bridgeObjectRelease();
  v11 = (uint64_t *)((char *)v8 + OBJC_IVAR___FBKSForm_FrameworkPrivateName_identifier);
  uint64_t *v11 = v4;
  v11[1] = v6;

  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for FBKSForm();
  return [(FBKSForm_FrameworkPrivateName *)&v13 init];
}

- (void)prefillWithQuestion:(id)a3 answer:(id)a4
{
  uint64_t v5 = sub_24E001E30();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24E001E30();
  unint64_t v10 = v9;
  v12[0] = v5;
  v12[1] = v7;
  v11 = self;
  sub_24DFF1938(v12, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (FBKSForm_FrameworkPrivateName)init
{
  result = (FBKSForm_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end