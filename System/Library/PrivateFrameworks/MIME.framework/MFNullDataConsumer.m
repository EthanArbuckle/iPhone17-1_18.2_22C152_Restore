@interface MFNullDataConsumer
- (NSString)description;
- (int64_t)appendData:(id)a3;
@end

@implementation MFNullDataConsumer

- (int64_t)appendData:(id)a3
{
  return [a3 length];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<Null data consumer %p>", self);
}

@end