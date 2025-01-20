@interface NEIKEv2RekeyIKEContext
- (id)description;
@end

@implementation NEIKEv2RekeyIKEContext

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"rekey IKE"];

  return v2;
}

@end