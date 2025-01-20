@interface AVContentKeyResponseFairPlayStreaming
- (AVContentKeyResponseFairPlayStreaming)initWithKeyData:(id)a3 renewalDate:(id)a4;
- (void)dealloc;
@end

@implementation AVContentKeyResponseFairPlayStreaming

- (AVContentKeyResponseFairPlayStreaming)initWithKeyData:(id)a3 renewalDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVContentKeyResponseFairPlayStreaming;
  v6 = [(AVContentKeyResponse *)&v8 initWithKeySystem:@"FairPlayStreaming"];
  if (v6)
  {
    v6->_keyData = (NSData *)[a3 copy];
    v6->_renewalDate = (NSDate *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyResponseFairPlayStreaming;
  [(AVContentKeyResponse *)&v3 dealloc];
}

@end