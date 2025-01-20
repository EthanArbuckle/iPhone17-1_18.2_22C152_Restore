@interface MTRQRCodeSetupPayloadParser
- (MTRQRCodeSetupPayloadParser)initWithBase38Representation:(NSString *)base38Representation;
- (MTRSetupPayload)populatePayload:(NSError *)error;
@end

@implementation MTRQRCodeSetupPayloadParser

- (MTRQRCodeSetupPayloadParser)initWithBase38Representation:(NSString *)base38Representation
{
  v4 = base38Representation;
  v8.receiver = self;
  v8.super_class = (Class)MTRQRCodeSetupPayloadParser;
  v5 = [(MTRQRCodeSetupPayloadParser *)&v8 init];
  v6 = v5->_base38Representation;
  v5->_base38Representation = v4;

  return v5;
}

- (MTRSetupPayload)populatePayload:(NSError *)error
{
  v4 = sub_244BDB7E4([MTRSetupPayload alloc], self->_base38Representation);
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