@interface ASFAsn1IntegerToken
- (id)description;
@end

@implementation ASFAsn1IntegerToken

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"INT Token. Value:%lld (%llx)", self->mValue, self->mValue);
}

@end