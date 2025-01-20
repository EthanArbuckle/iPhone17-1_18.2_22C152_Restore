@interface NSScalarObjectID48
+ (char)generatedNameSuffix;
- (unint64_t)retainCount;
@end

@implementation NSScalarObjectID48

+ (char)generatedNameSuffix
{
  return "48";
}

- (unint64_t)retainCount
{
  return LOWORD(self->_referenceData48_cd_rc16) + 1;
}

@end