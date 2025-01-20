@interface HAP2EncodedCharacteristicRequestThread
- (BOOL)isEncrypted;
- (HAP2EncodedCharacteristicRequestThread)initWithBTLERequests:(id)a3 requestType:(unint64_t)a4 enforcePDUBodyLength:(BOOL)a5;
- (NSArray)btleRequests;
- (NSArray)characteristics;
- (id)serialize;
- (unint64_t)type;
@end

@implementation HAP2EncodedCharacteristicRequestThread

- (void).cxx_destruct
{
}

- (id)serialize
{
  v3 = [MEMORY[0x1E4F1CA58] data];
  if (self) {
    internalCharacteristics = self->_internalCharacteristics;
  }
  else {
    internalCharacteristics = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__HAP2EncodedCharacteristicRequestThread_serialize__block_invoke;
  v8[3] = &unk_1E69F0C38;
  char v10 = 0;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)internalCharacteristics enumerateObjectsUsingBlock:v8];
  v6 = (void *)[v5 copy];

  return v6;
}

void __51__HAP2EncodedCharacteristicRequestThread_serialize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 serialize];
  objc_msgSend(v4, "replaceBytesInRange:withBytes:length:", 0, 0, a1 + 48, 1);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (*(unsigned char *)(v5 + 8))
    {
      v6 = [v3 body];

      if (!v6)
      {
        __int16 v7 = 0;
        [v4 appendBytes:&v7 length:2];
      }
    }
  }
  [*(id *)(a1 + 40) appendData:v4];
}

- (NSArray)characteristics
{
  v2 = self;
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  if (self) {
    internalCharacteristics = self->_internalCharacteristics;
  }
  else {
    internalCharacteristics = 0;
  }
  uint64_t v5 = internalCharacteristics;
  v6 = objc_msgSend(v3, "arrayWithCapacity:", -[NSArray count](v5, "count"));

  if (v2) {
    v2 = (HAP2EncodedCharacteristicRequestThread *)v2->_internalCharacteristics;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HAP2EncodedCharacteristicRequestThread_characteristics__block_invoke;
  v10[3] = &unk_1E69F0C10;
  id v11 = v6;
  id v7 = v6;
  [(HAP2EncodedCharacteristicRequestThread *)v2 enumerateObjectsUsingBlock:v10];
  v8 = (void *)[v7 copy];

  return (NSArray *)v8;
}

void __57__HAP2EncodedCharacteristicRequestThread_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = objc_alloc_init(HAPCharacteristicWriteRequestTuple);
  v4 = [v3 characteristic];
  [(HAPCharacteristicWriteRequestTuple *)v6 setCharacteristic:v4];

  uint64_t v5 = [v3 requestedValue];

  [(HAPCharacteristicWriteRequestTuple *)v6 setValue:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (unint64_t)type
{
  if (self) {
    return *(void *)(self + 24);
  }
  return self;
}

- (BOOL)isEncrypted
{
  if (self) {
    self = (HAP2EncodedCharacteristicRequestThread *)self->_internalCharacteristics;
  }
  v2 = [(HAP2EncodedCharacteristicRequestThread *)self firstObject];
  char v3 = [v2 isEncrypted];

  return v3;
}

- (NSArray)btleRequests
{
  if (self) {
    self = (HAP2EncodedCharacteristicRequestThread *)self->_internalCharacteristics;
  }
  return (NSArray *)self;
}

- (HAP2EncodedCharacteristicRequestThread)initWithBTLERequests:(id)a3 requestType:(unint64_t)a4 enforcePDUBodyLength:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HAP2EncodedCharacteristicRequestThread;
  char v10 = [(HAP2EncodedCharacteristicRequestThread *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_internalCharacteristics, a3);
    v11->_requestType = a4;
    v11->_enforcePDUBodyLength = a5;
  }

  return v11;
}

@end