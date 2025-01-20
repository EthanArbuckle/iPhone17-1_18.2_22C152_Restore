@interface CRCameraReaderOutputExpirationDate
- (NSNumber)dayValue;
- (NSNumber)monthValue;
- (NSNumber)yearValue;
@end

@implementation CRCameraReaderOutputExpirationDate

- (NSNumber)yearValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 yearValue];

  return (NSNumber *)v3;
}

- (NSNumber)monthValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 monthValue];

  return (NSNumber *)v3;
}

- (NSNumber)dayValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 dayValue];

  return (NSNumber *)v3;
}

@end