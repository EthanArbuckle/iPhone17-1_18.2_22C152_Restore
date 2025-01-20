@interface HDHRExtractionRulesKeyPathComponent
- (HDHRExtractionRulesKeyPathComponent)init;
- (NSString)name;
- (NSString)parenthesisContent;
@end

@implementation HDHRExtractionRulesKeyPathComponent

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)parenthesisContent
{
  if (*(void *)&self->name[OBJC_IVAR___HDHRExtractionRulesKeyPathComponent_parenthesisContent])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (HDHRExtractionRulesKeyPathComponent)init
{
  result = (HDHRExtractionRulesKeyPathComponent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end