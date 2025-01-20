@interface IMBJITAppKitData
- (NSDictionary)dictionaryValue;
- (void)setDictionaryValue:(id)a3;
@end

@implementation IMBJITAppKitData

- (NSDictionary)dictionaryValue
{
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1000BBA18().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setDictionaryValue:(id)a3
{
  *(void *)self->dictionaryValue = sub_1000BBA28();
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

@end