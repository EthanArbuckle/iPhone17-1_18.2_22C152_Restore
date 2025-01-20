@interface NEIKEv2InitiatorIdentifierPayload
+ (id)copyTypeDescription;
- (unint64_t)type;
@end

@implementation NEIKEv2InitiatorIdentifierPayload

- (unint64_t)type
{
  return 35;
}

+ (id)copyTypeDescription
{
  return @"IDi";
}

@end