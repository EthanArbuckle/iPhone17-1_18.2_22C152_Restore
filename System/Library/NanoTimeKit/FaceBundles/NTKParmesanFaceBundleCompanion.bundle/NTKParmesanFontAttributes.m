@interface NTKParmesanFontAttributes
- (NTKParmesanFontAttributes)init;
- (NTKParmesanFontAttributes)initWithWeight:(double)a3 width:(double)a4 soft:(double)a5 grad:(double)a6;
- (id)activeDictionary;
@end

@implementation NTKParmesanFontAttributes

- (NTKParmesanFontAttributes)init
{
  result = (NTKParmesanFontAttributes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NTKParmesanFontAttributes)initWithWeight:(double)a3 width:(double)a4 soft:(double)a5 grad:(double)a6
{
  return (NTKParmesanFontAttributes *)sub_246BB0A64(a3, a4, a5, a6);
}

- (id)activeDictionary
{
  v2 = self;
  sub_246BB080C();

  sub_246BAC618();
  v3 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();

  return v3;
}

@end