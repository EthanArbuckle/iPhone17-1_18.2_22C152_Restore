@interface CustomErrorWithLocalizedDescription
- (NSString)localizedDescription;
- (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription)initWithCoder:(id)a3;
- (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation CustomErrorWithLocalizedDescription

- (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription)initWithCoder:(id)a3
{
  return (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription *)CustomErrorWithLocalizedDescription.init(coder:)(a3);
}

- (NSString)localizedDescription
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24FA757F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  result = (_TtC25GenerativeAssistantCommon35CustomErrorWithLocalizedDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end