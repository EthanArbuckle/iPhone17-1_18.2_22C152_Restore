@interface DUDocumentGlobals
+ (int64_t)defaultMaxLength;
+ (int64_t)htmlStringMaxLength;
+ (int64_t)noMaxLength;
+ (int64_t)warningMaxLength;
- (_TtC21DocumentUnderstanding17DUDocumentGlobals)init;
@end

@implementation DUDocumentGlobals

+ (int64_t)defaultMaxLength
{
  return 5120;
}

+ (int64_t)htmlStringMaxLength
{
  return 100000;
}

+ (int64_t)warningMaxLength
{
  return 100000;
}

+ (int64_t)noMaxLength
{
  return 0;
}

- (_TtC21DocumentUnderstanding17DUDocumentGlobals)init
{
  return (_TtC21DocumentUnderstanding17DUDocumentGlobals *)DUDocumentGlobals.init()();
}

@end