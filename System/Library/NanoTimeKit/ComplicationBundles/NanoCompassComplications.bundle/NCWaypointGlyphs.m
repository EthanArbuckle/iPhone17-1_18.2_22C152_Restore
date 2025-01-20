@interface NCWaypointGlyphs
+ (id)convertedSymbolFrom:(id)a3;
- (_TtC24NanoCompassComplications16NCWaypointGlyphs)init;
@end

@implementation NCWaypointGlyphs

+ (id)convertedSymbolFrom:(id)a3
{
  uint64_t v3 = sub_2375D9E90();
  _s24NanoCompassComplications16NCWaypointGlyphsC15convertedSymbol4fromS2S_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_2375D9E80();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC24NanoCompassComplications16NCWaypointGlyphs)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NCWaypointGlyphs();
  return [(NCWaypointGlyphs *)&v3 init];
}

@end