@interface HAP2AccessoryServerEncodingThreadBTLERequest
+ (id)attributeDatabaseRequest;
+ (id)executeWriteRequestForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 error:(id *)a6;
+ (id)notificationRequestForCharacteristic:(id)a3 threadRequestType:(unsigned __int8)a4 enforcePDUBodyLength:(BOOL)a5;
+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
+ (id)readRequestForCharacteristic:(id)a3;
+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
- (BOOL)expectsResponseBody;
- (id)requestedValue;
- (int64_t)writeOptions;
- (unsigned)threadRequestType;
@end

@implementation HAP2AccessoryServerEncodingThreadBTLERequest

- (void).cxx_destruct
{
}

- (id)requestedValue
{
  return self->_requestedValue;
}

- (unsigned)threadRequestType
{
  return self->_threadRequestType;
}

- (int64_t)writeOptions
{
  return self->_writeOptions;
}

- (BOOL)expectsResponseBody
{
  if (![(HAP2AccessoryServerEncodingThreadBTLERequest *)self threadRequestType]
    || (unsigned int v3 = [(HAP2AccessoryServerEncodingThreadBTLERequest *)self threadRequestType] - 9, v3 >= 6))
  {
    LODWORD(v4) = [(HAPBTLERequest *)self type];
    if (v4 <= 8)
    {
      char v5 = v4;
      LOBYTE(v4) = 1;
      if (((1 << v5) & 0x1CA) != 0) {
        return v4;
      }
      if (((1 << v5) & 0x24) != 0) {
        return ((unint64_t)[(HAP2AccessoryServerEncodingThreadBTLERequest *)self writeOptions] >> 1) & 1;
      }
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  LODWORD(v4) = (0x33u >> v3) & 1;
  return v4;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = +[_HAPAccessoryServerBTLE200 executeWriteRequestForCharacteristic:a3 options:a5 error:a6];
  if (v11)
  {
    v12 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    v13 = [v11 characteristic];
    uint64_t v14 = [v11 type];
    v15 = [v11 body];
    uint64_t v16 = [v11 isEncrypted];
    [v11 timeoutInterval];
    uint64_t v17 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v12, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v13, v14, v15, v16);

    if (v17)
    {
      *(void *)(v17 + 88) = a5;
      objc_storeStrong((id *)(v17 + 96), a4);
      id v18 = (id)v17;
    }
    else if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return (id)v17;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14 = a4;
  v15 = +[_HAPAccessoryServerBTLE200 prepareWriteRequestForCharacteristic:a3 value:v14 authorizationData:a5 contextData:a6 options:a7 error:a8];
  if (v15)
  {
    uint64_t v16 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    uint64_t v17 = [v15 characteristic];
    uint64_t v18 = [v15 type];
    v19 = [v15 body];
    uint64_t v20 = [v15 isEncrypted];
    [v15 timeoutInterval];
    uint64_t v21 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v16, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v17, v18, v19, v20);

    if (v21)
    {
      *(void *)(v21 + 88) = a7;
      objc_storeStrong((id *)(v21 + 96), a4);
      id v22 = (id)v21;
    }
    else if (a8)
    {
      *a8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return (id)v21;
}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14 = a4;
  v15 = +[_HAPAccessoryServerBTLE200 writeRequestForCharacteristic:a3 value:v14 authorizationData:a5 contextData:a6 options:a7 error:a8];
  if (v15)
  {
    uint64_t v16 = [HAP2AccessoryServerEncodingThreadBTLERequest alloc];
    uint64_t v17 = [v15 characteristic];
    uint64_t v18 = [v15 type];
    v19 = [v15 body];
    uint64_t v20 = [v15 isEncrypted];
    [v15 timeoutInterval];
    uint64_t v21 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](v16, "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v17, v18, v19, v20);

    if (v21)
    {
      *(void *)(v21 + 88) = a7;
      objc_storeStrong((id *)(v21 + 96), a4);
      id v22 = (id)v21;
    }
    else if (a8)
    {
      *a8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1];
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return (id)v21;
}

+ (id)attributeDatabaseRequest
{
  v2 = [(HAPBTLERequest *)[HAP2AccessoryServerEncodingThreadBTLERequest alloc] initWithRequestType:9 bodyData:0 shouldEncrypt:1 timeoutInterval:900.0];
  v2->_threadRequestType = 9;

  return v2;
}

+ (id)notificationRequestForCharacteristic:(id)a3 threadRequestType:(unsigned __int8)a4 enforcePDUBodyLength:(BOOL)a5
{
  uint64_t v5 = a4;
  id v6 = a3;
  v7 = [(HAPBTLERequest *)[HAP2AccessoryServerEncodingThreadBTLERequest alloc] initWithCharacteristic:v6 requestType:v5 bodyData:0 shouldEncrypt:1 timeoutInterval:900.0];

  v7->_threadRequestType = v5;

  return v7;
}

+ (id)readRequestForCharacteristic:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(HAPBTLERequest *)[HAP2AccessoryServerEncodingThreadBTLERequest alloc] initWithCharacteristic:v3 requestType:3 bodyData:0 shouldEncrypt:1 timeoutInterval:900.0];

  return v4;
}

@end