@interface CSUTokenID
- (NSNumber)tokenID;
- (void)setTokenID:(id)a3;
@end

@implementation CSUTokenID

- (NSNumber)tokenID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTokenID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end