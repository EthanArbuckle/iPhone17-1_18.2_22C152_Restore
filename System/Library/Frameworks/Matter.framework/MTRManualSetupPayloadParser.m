@interface MTRManualSetupPayloadParser
- (MTRManualSetupPayloadParser)initWithDecimalStringRepresentation:(NSString *)decimalStringRepresentation;
- (MTRSetupPayload)populatePayload:(NSError *)error;
@end

@implementation MTRManualSetupPayloadParser

- (MTRManualSetupPayloadParser)initWithDecimalStringRepresentation:(NSString *)decimalStringRepresentation
{
  v4 = decimalStringRepresentation;
  v8.receiver = self;
  v8.super_class = (Class)MTRManualSetupPayloadParser;
  v5 = [(MTRManualSetupPayloadParser *)&v8 init];
  v6 = v5->_decimalStringRepresentation;
  v5->_decimalStringRepresentation = v4;

  return v5;
}

- (MTRSetupPayload)populatePayload:(NSError *)error
{
  v4 = sub_244BDBA20([MTRSetupPayload alloc], self->_decimalStringRepresentation);
  v5 = v4;
  if (error && !v4)
  {
    sub_244B268BC((uint64_t)MTRError, 4);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (MTRSetupPayload *)v5;
}

- (void).cxx_destruct
{
}

@end