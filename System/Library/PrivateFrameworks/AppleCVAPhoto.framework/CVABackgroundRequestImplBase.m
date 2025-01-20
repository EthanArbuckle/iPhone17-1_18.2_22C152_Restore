@interface CVABackgroundRequestImplBase
- (CVAMattingRequest)mattingRequest;
- (void)setMattingRequest:(id)a3;
@end

@implementation CVABackgroundRequestImplBase

- (void).cxx_destruct
{
}

- (void)setMattingRequest:(id)a3
{
}

- (CVAMattingRequest)mattingRequest
{
  return (CVAMattingRequest *)objc_getProperty(self, a2, 8, 1);
}

@end