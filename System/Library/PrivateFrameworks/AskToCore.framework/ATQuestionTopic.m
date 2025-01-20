@interface ATQuestionTopic
- (ATQuestionTopic)init;
- (ATQuestionTopic)initWithRawValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)rawValue;
- (int64_t)hash;
@end

@implementation ATQuestionTopic

- (NSString)rawValue
{
  return (NSString *)sub_2487594AC();
}

- (ATQuestionTopic)initWithRawValue:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_248766018();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ATQuestionTopic_rawValue);
  uint64_t *v6 = v5;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(ATQuestionTopic *)&v9 init];
}

- (BOOL)isEqual:(id)a3
{
  return sub_24875CA0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))ATQuestion.Topic.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_248766098();

  return v3;
}

- (ATQuestionTopic)init
{
  result = (ATQuestionTopic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end