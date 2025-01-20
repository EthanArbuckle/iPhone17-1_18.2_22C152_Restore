@interface SGWebPageKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (id)description;
@end

@implementation SGWebPageKey

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 18;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMessageKey *)self source];
  v5 = [(SGMessageKey *)self uniqueIdentifier];
  v6 = (void *)[v3 initWithFormat:@"<SGWebPageKey source=%@ uniqueIdentifier=%@", v4, v5];

  return v6;
}

@end