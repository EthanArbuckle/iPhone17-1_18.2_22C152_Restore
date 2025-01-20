@interface Transformer
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation Transformer

- (NSSet)featureNames
{
  swift_retain();
  Transformer.featureNames.getter();
  swift_release();
  v2 = (void *)sub_22330C198();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_22330C088();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  v7 = (void *)Transformer.featureValue(for:)(v6);
  swift_release();
  swift_bridgeObjectRelease();

  return v7;
}

@end