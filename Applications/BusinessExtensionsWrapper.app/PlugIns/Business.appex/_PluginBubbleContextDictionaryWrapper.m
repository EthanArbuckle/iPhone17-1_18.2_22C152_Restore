@interface _PluginBubbleContextDictionaryWrapper
- (NSDictionary)dictionaryValue;
- (_TtC8Business37_PluginBubbleContextDictionaryWrapper)init;
- (void)setDictionaryValue:(id)a3;
@end

@implementation _PluginBubbleContextDictionaryWrapper

- (NSDictionary)dictionaryValue
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setDictionaryValue:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business37_PluginBubbleContextDictionaryWrapper_dictionaryValue) = (Class)sub_1000BBA28();

  swift_bridgeObjectRelease();
}

- (_TtC8Business37_PluginBubbleContextDictionaryWrapper)init
{
  result = (_TtC8Business37_PluginBubbleContextDictionaryWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end