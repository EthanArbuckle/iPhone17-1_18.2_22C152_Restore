@interface CHKWidgetPersonality
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (CHKWidgetPersonality)init;
- (CHKWidgetPersonality)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHKWidgetPersonality

- (NSString)extensionBundleIdentifier
{
  return (NSString *)sub_191C07E58();
}

- (NSString)kind
{
  return (NSString *)sub_191C07E58();
}

- (BOOL)matchesPersonality:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  char v6 = sub_191C08070(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)hash
{
  sub_191CF64D8();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_191CF5388();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_191CF5388();
  swift_bridgeObjectRelease();
  int64_t v4 = sub_191CF64B8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_191CF5C58();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = sub_191C08388((uint64_t)v8);

  sub_191B88CAC((uint64_t)v8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHKWidgetPersonality)initWithCoder:(id)a3
{
  return (CHKWidgetPersonality *)WidgetPersonality.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191C08640(v4);
}

- (NSString)description
{
  v2 = self;
  swift_bridgeObjectRetain();
  sub_191CF53B8();
  swift_bridgeObjectRelease();
  sub_191CF53B8();
  swift_bridgeObjectRetain();
  sub_191CF53B8();
  swift_bridgeObjectRelease();
  sub_191CF53B8();

  v3 = (void *)sub_191CF5318();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CHKWidgetPersonality)init
{
  result = (CHKWidgetPersonality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end