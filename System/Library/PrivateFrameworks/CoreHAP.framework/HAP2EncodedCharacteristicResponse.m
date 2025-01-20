@interface HAP2EncodedCharacteristicResponse
- (BOOL)isEncrypted;
- (HAP2EncodedCharacteristicResponse)initWithCharacteristics:(id)a3;
- (NSArray)characteristics;
@end

@implementation HAP2EncodedCharacteristicResponse

- (void).cxx_destruct
{
}

- (NSArray)characteristics
{
  if (self) {
    self = (HAP2EncodedCharacteristicResponse *)self->_responses;
  }
  return (NSArray *)self;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (HAP2EncodedCharacteristicResponse)initWithCharacteristics:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2EncodedCharacteristicResponse;
  v6 = [(HAP2EncodedCharacteristicResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responses, a3);
  }

  return v7;
}

@end