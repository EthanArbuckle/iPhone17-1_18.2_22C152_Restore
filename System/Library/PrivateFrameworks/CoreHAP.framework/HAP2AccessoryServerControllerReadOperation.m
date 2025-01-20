@interface HAP2AccessoryServerControllerReadOperation
- (HAP2AccessoryServerControllerReadOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 readRequest:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11;
- (id)_HAP2AutoUpdateCachedCountdownCharacteristic:(id)a3;
- (void)_cleanUp;
- (void)_sendRequest;
@end

@implementation HAP2AccessoryServerControllerReadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readRequest, 0);

  objc_storeStrong((id *)&self->_cachedCharacteristicIndices, 0);
}

- (void)_cleanUp
{
  if (self)
  {
    v3 = self->super._response;
    if (v3)
    {
      v4 = v3;
      NSUInteger v5 = [(NSIndexSet *)self->_cachedCharacteristicIndices count];

      if (v5)
      {
        v6 = self->super._response;
        if ([(HAP2EncodedResponse *)v6 conformsToProtocol:&unk_1F2C8ADE8]) {
          v7 = self->super._response;
        }
        else {
          v7 = 0;
        }

        v8 = self->_readRequest;
        v9 = [(HAP2ControllerReadRequest *)v8 originalCharacteristics];

        v10 = [(HAP2EncodedResponse *)v7 characteristics];
        v11 = (void *)[v10 mutableCopy];

        cachedCharacteristicIndices = self->_cachedCharacteristicIndices;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __54__HAP2AccessoryServerControllerReadOperation__cleanUp__block_invoke;
        v19[3] = &unk_1E69F1300;
        v19[4] = self;
        id v20 = v9;
        id v21 = v11;
        id v13 = v11;
        id v14 = v9;
        [(NSIndexSet *)cachedCharacteristicIndices enumerateIndexesUsingBlock:v19];
        v15 = [HAP2EncodedCharacteristicResponse alloc];
        v16 = (void *)[v13 copy];
        v17 = [(HAP2EncodedCharacteristicResponse *)v15 initWithCharacteristics:v16];
        -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v17);
      }
    }
    objc_storeStrong((id *)&self->super._request, self->_readRequest);
  }
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
  [(HAP2AccessoryServerControllerOperation *)&v18 _cleanUp];
}

void __54__HAP2AccessoryServerControllerReadOperation__cleanUp__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  NSUInteger v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v6 = [v4 _HAP2AutoUpdateCachedCountdownCharacteristic:v5];
  id v7 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v6 error:0];

  [*(id *)(a1 + 48) insertObject:v7 atIndex:a2];
}

- (id)_HAP2AutoUpdateCachedCountdownCharacteristic:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [v4 type];
  if (([v5 isEqual:@"000000D4-0000-1000-8000-0026BB765291"] & 1) == 0)
  {

    goto LABEL_11;
  }
  v6 = [v4 value];
  int v7 = [v6 unsignedIntValue];

  if (!v7)
  {
LABEL_11:
    id v8 = v4;
    goto LABEL_12;
  }
  id v8 = (id)[v4 copy];
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [v8 valueUpdatedTime];
  [v9 timeIntervalSinceDate:v10];
  unint64_t v12 = (unint64_t)v11;

  if (v12)
  {
    id v13 = [v8 value];
    unint64_t v14 = [v13 unsignedIntegerValue];

    if (v14 > v12)
    {
      v15 = NSNumber;
      v16 = [v8 value];
      v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "unsignedIntegerValue") - v12);
      [v8 setValue:v17];

      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      objc_super v18 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        id v20 = [v8 value];
        int v22 = 138412546;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEFAULT, "%@ Auto updating countdown counter value to: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }

LABEL_12:

  return v8;
}

- (void)_sendRequest
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (![(HAP2AsynchronousOperation *)self isCancelled])
  {
    if (self)
    {
      v3 = self->super._request;
      readRequest = self->_readRequest;

      if (v3 != (HAP2EncodedRequest *)readRequest)
      {
LABEL_26:
        v29.receiver = self;
        v29.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
        [(HAP2AccessoryServerControllerOperation *)&v29 _sendRequest];
        return;
      }
      NSUInteger v5 = self->_readRequest;
    }
    else
    {
      NSUInteger v5 = 0;
    }
    v6 = (void *)MEMORY[0x1E4F1CA48];
    int v7 = v5;
    id v8 = [(HAP2ControllerReadRequest *)v7 originalCharacteristics];
    v9 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    v10 = [MEMORY[0x1E4F28E60] indexSet];
    if (self) {
      double v11 = self->_readRequest;
    }
    else {
      double v11 = 0;
    }
    unint64_t v12 = v11;
    id v13 = [(HAP2ControllerReadRequest *)v12 originalCharacteristics];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__HAP2AccessoryServerControllerReadOperation__sendRequest__block_invoke;
    v31[3] = &unk_1E69F12D0;
    v31[4] = self;
    id v14 = v10;
    id v32 = v14;
    id v15 = v9;

    id v33 = v15;
    [v13 enumerateObjectsUsingBlock:v31];

    v16 = (void *)[v14 copy];
    if (self) {
      objc_storeStrong((id *)&self->_cachedCharacteristicIndices, v16);
    }

    uint64_t v17 = [v15 count];
    if (v17)
    {
      if (self) {
        encoding = self->super._encoding;
      }
      else {
        encoding = 0;
      }
      v19 = encoding;
      id v20 = (void *)[v15 copy];
      id v30 = 0;
      id v21 = [(HAP2AccessoryServerEncoding *)v19 readRequestForCharacteristics:v20 shouldEncrypt:1 error:&v30];
      id v22 = v30;

      if (v21)
      {
        v23 = self;
        __int16 v24 = v21;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1) {
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
        }
        v28 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v35 = self;
          __int16 v36 = 2112;
          id v37 = v22;
          _os_log_error_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%@ Unable to create request for characteristics: %@", buf, 0x16u);
        }
        [(HAP2AccessoryServerControllerOperation *)self finishWithError:v22];
        v23 = self;
        __int16 v24 = 0;
      }
      -[HAP2AccessoryServerControllerOperation setRequest:]((uint64_t)v23, v24);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      v25 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%@ All characteristics were cached, not sending request", buf, 0xCu);
      }
      uint64_t v26 = [HAP2EncodedCharacteristicResponse alloc];
      v27 = [(HAP2EncodedCharacteristicResponse *)v26 initWithCharacteristics:MEMORY[0x1E4F1CBF0]];
      -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v27);

      [(HAP2AccessoryServerControllerOperation *)self finish];
    }

    if (v17) {
      goto LABEL_26;
    }
  }
}

void __58__HAP2AccessoryServerControllerReadOperation__sendRequest__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!objc_msgSend(v5, "hap2_canUseCachedValue")
    || (uint64_t v6 = *(void *)(a1 + 32)) != 0 && (*(unsigned char *)(v6 + 344) & 4) != 0)
  {
    [*(id *)(a1 + 48) addObject:v5];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    int v7 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = v7;
      v10 = [v5 type];
      double v11 = +[HAPCharacteristic hap2_shortTypeFromUUID:v10];
      unint64_t v12 = [v5 instanceID];
      int v13 = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      objc_super v18 = v12;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%@ Characteristic %@ [%@] is cached", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (HAP2AccessoryServerControllerReadOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 readRequest:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11
{
  id v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerControllerReadOperation;
  id v20 = [(HAP2AccessoryServerControllerOperation *)&v23 initWithName:a3 controller:a4 encoding:a5 transport:a6 request:v19 endpoint:a8 mimeType:a10 timeout:a9 options:a11];
  id v21 = v20;
  if (v20) {
    objc_storeStrong((id *)&v20->_readRequest, a7);
  }

  return v21;
}

@end