@interface ColorCacheKey:
- (void)NamedColorInfo;
@end

@implementation ColorCacheKey:

- (void)NamedColorInfo
{
  if (!lazy cache variable for type metadata for [ColorCacheKey : NamedColorInfo])
  {
    lazy protocol witness table accessor for type ColorCacheKey and conformance ColorCacheKey();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ColorCacheKey : NamedColorInfo]);
    }
  }
}

@end