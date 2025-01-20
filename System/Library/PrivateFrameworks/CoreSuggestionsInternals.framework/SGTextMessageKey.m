@interface SGTextMessageKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (id)description;
@end

@implementation SGTextMessageKey

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 13;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMessageKey *)self source];
  v5 = [(SGMessageKey *)self uniqueIdentifier];
  v6 = (void *)[v3 initWithFormat:@"<SGTextMessageKey source=%@ uniqueIdentifier=%@>", v4, v5];

  return v6;
}

@end