@interface EscrowSRPResponse
- (NSData)srpData;
- (NSNumber)iterations;
- (NSString)bypassToken;
- (NSString)proto;
- (int64_t)clubTypeID;
@end

@implementation EscrowSRPResponse

- (NSData)srpData
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"respBlob"];

  if (v3) {
    id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
  }
  else {
    id v4 = 0;
  }

  return (NSData *)v4;
}

- (NSString)bypassToken
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"phoneNumberToken"];

  return (NSString *)v3;
}

- (int64_t)clubTypeID
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"clubTypeID"];

  if (v3) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (NSString)proto
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"proto"];

  return (NSString *)v3;
}

- (NSNumber)iterations
{
  v2 = [(LakituResponse *)self responseDictionary];
  v3 = [v2 objectForKeyedSubscript:@"iterations"];

  return (NSNumber *)v3;
}

@end