@interface BlastDoorMentionAttribute
- (BlastDoorMentionAttribute)init;
- (NSString)description;
- (NSString)uri;
- (_NSRange)range;
@end

@implementation BlastDoorMentionAttribute

- (NSString)description
{
  return (NSString *)sub_1B1776590();
}

- (_NSRange)range
{
  NSUInteger v2 = sub_1B1777844((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMentionAttribute_mentionAttribute);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSString)uri
{
  return (NSString *)sub_1B17A7844();
}

- (BlastDoorMentionAttribute)init
{
  _NSRange result = (BlastDoorMentionAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end