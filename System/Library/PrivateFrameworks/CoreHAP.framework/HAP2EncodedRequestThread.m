@interface HAP2EncodedRequestThread
+ (unint64_t)hap2RequestTypeFromBTLERequestType:(unsigned __int8)a3;
+ (unsigned)btleRequestTypeFromHAP2RequestType:(unint64_t)a3;
- (BOOL)isEncrypted;
- (HAP2AccessoryServerEncodingThreadBTLERequest)btleRequest;
- (HAP2EncodedRequestThread)initWithBTLERequest:(id)a3 enforcePDUBodyLength:(BOOL)a4;
- (id)serialize;
- (unint64_t)type;
@end

@implementation HAP2EncodedRequestThread

- (void).cxx_destruct
{
}

- (HAP2AccessoryServerEncodingThreadBTLERequest)btleRequest
{
  return self->_btleRequest;
}

- (id)serialize
{
  v3 = [(HAP2EncodedRequestThread *)self btleRequest];
  v4 = [v3 serialize];

  char v10 = 0;
  objc_msgSend(v4, "replaceBytesInRange:withBytes:length:", 0, 0, &v10, 1);
  if (self)
  {
    if (self->_enforcePDUBodyLength)
    {
      v5 = [(HAP2EncodedRequestThread *)self btleRequest];
      v6 = [v5 body];

      if (!v6)
      {
        __int16 v9 = 0;
        [v4 appendBytes:&v9 length:2];
      }
    }
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (unint64_t)type
{
  v3 = objc_opt_class();
  v4 = [(HAP2EncodedRequestThread *)self btleRequest];
  unint64_t v5 = objc_msgSend(v3, "hap2RequestTypeFromBTLERequestType:", objc_msgSend(v4, "type"));

  return v5;
}

- (BOOL)isEncrypted
{
  v2 = [(HAP2EncodedRequestThread *)self btleRequest];
  char v3 = [v2 isEncrypted];

  return v3;
}

- (HAP2EncodedRequestThread)initWithBTLERequest:(id)a3 enforcePDUBodyLength:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HAP2EncodedRequestThread;
  v8 = [(HAP2EncodedRequestThread *)&v11 init];
  __int16 v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_btleRequest, a3);
    v9->_enforcePDUBodyLength = a4;
  }

  return v9;
}

+ (unint64_t)hap2RequestTypeFromBTLERequestType:(unsigned __int8)a3
{
  if ((a3 + 1) > 0xFu) {
    return 0;
  }
  else {
    return qword_1D4912CB8[(a3 + 1)];
  }
}

+ (unsigned)btleRequestTypeFromHAP2RequestType:(unint64_t)a3
{
  if (a3 > 0xF) {
    return 0;
  }
  else {
    return byte_1D4912F10[a3];
  }
}

@end