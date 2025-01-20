@interface NSString(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)
- (id)MPC_storeFrontIdentifierKey;
@end

@implementation NSString(MPCStoreFrontLocalEquivalencyMiddlewareAdditions)

- (id)MPC_storeFrontIdentifierKey
{
  uint64_t v2 = [a1 rangeOfString:@","];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = a1;
  }
  else
  {
    id v3 = [a1 substringToIndex:v2];
  }

  return v3;
}

@end