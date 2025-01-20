@interface GDIdentifierConstants
+ (int64_t)entityClassOffset;
+ (int64_t)entityClassSize;
- (_TtC20IntelligencePlatform21GDIdentifierConstants)init;
@end

@implementation GDIdentifierConstants

+ (int64_t)entityClassSize
{
  return 8;
}

+ (int64_t)entityClassOffset
{
  return 56;
}

- (_TtC20IntelligencePlatform21GDIdentifierConstants)init
{
  return (_TtC20IntelligencePlatform21GDIdentifierConstants *)GDIdentifierConstants.init()();
}

@end