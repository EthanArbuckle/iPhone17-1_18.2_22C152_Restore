@interface NEIKEv2ResponderTrafficSelectorPayload
+ (id)copyTypeDescription;
- (unint64_t)type;
@end

@implementation NEIKEv2ResponderTrafficSelectorPayload

- (unint64_t)type
{
  return 45;
}

+ (id)copyTypeDescription
{
  return @"TSr";
}

@end