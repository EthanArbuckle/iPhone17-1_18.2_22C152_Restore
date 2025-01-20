@interface HAP2ControllerReadRequest
- (BOOL)isEncrypted;
- (HAP2ControllerReadRequest)initWithCharacteristics:(id)a3;
- (NSArray)characteristics;
- (NSArray)originalCharacteristics;
- (id)serialize;
- (unint64_t)type;
@end

@implementation HAP2ControllerReadRequest

- (void).cxx_destruct
{
}

- (NSArray)originalCharacteristics
{
  return self->_originalCharacteristics;
}

- (NSArray)characteristics
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(HAP2ControllerReadRequest *)self originalCharacteristics];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v6 = [(HAP2ControllerReadRequest *)self originalCharacteristics];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__HAP2ControllerReadRequest_characteristics__block_invoke;
  v10[3] = &unk_1E69F3740;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v10];

  v8 = (void *)[v7 copy];

  return (NSArray *)v8;
}

void __44__HAP2ControllerReadRequest_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  [(HAPCharacteristicWriteRequestTuple *)v4 setCharacteristic:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (id)serialize
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)isEncrypted
{
  return 1;
}

- (HAP2ControllerReadRequest)initWithCharacteristics:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2ControllerReadRequest;
  v6 = [(HAP2ControllerReadRequest *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalCharacteristics, a3);
  }

  return v7;
}

@end