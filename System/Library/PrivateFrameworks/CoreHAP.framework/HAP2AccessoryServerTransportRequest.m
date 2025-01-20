@interface HAP2AccessoryServerTransportRequest
+ (id)new;
- (BOOL)isEncrypted;
- (BOOL)isForReading;
- (BOOL)isForWriting;
- (HAP2AccessoryServerTransportRequest)init;
- (HAP2AccessoryServerTransportRequestEndpoint)endpoint;
- (NSData)data;
- (NSString)mimeType;
- (id)debugDescription;
- (id)description;
- (id)initForReadingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6;
- (id)initForWritingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6;
- (id)initWithEndpoint:(void *)a3 data:(char)a4 encrypted:(void *)a5 mimeType:(char)a6 forReading:;
@end

@implementation HAP2AccessoryServerTransportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (BOOL)isForReading
{
  return self->_forReading;
}

- (HAP2AccessoryServerTransportRequestEndpoint)endpoint
{
  return self->_endpoint;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self) {
    unint64_t identifier = self->_identifier;
  }
  else {
    unint64_t identifier = 0;
  }
  v8 = [v3 stringWithFormat:@"<%@ %p id=%llu>", v5, self, identifier];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self) {
    unint64_t identifier = self->_identifier;
  }
  else {
    unint64_t identifier = 0;
  }
  v8 = [v3 stringWithFormat:@"<%@ id=%llu>", v5, identifier];

  return v8;
}

- (BOOL)isForWriting
{
  return ![(HAP2AccessoryServerTransportRequest *)self isForReading];
}

- (id)initForWritingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6
{
  return -[HAP2AccessoryServerTransportRequest initWithEndpoint:data:encrypted:mimeType:forReading:]((id *)&self->super.super.isa, a3, a4, a5, a6, 0);
}

- (id)initWithEndpoint:(void *)a3 data:(char)a4 encrypted:(void *)a5 mimeType:(char)a6 forReading:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HAP2AccessoryServerTransportRequest;
    v15 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 2, a2);
      *((unsigned char *)a1 + 8) = a6;
      *((unsigned char *)a1 + 9) = a4;
      objc_storeStrong(a1 + 3, a5);
      objc_storeStrong(a1 + 4, a3);
      a1[5] = (id)atomic_fetch_add(&initWithEndpoint_data_encrypted_mimeType_forReading__nextIdentifier, 1uLL);
    }
  }

  return a1;
}

- (id)initForReadingWithEndpoint:(id)a3 data:(id)a4 encrypted:(BOOL)a5 mimeType:(id)a6
{
  return -[HAP2AccessoryServerTransportRequest initWithEndpoint:data:encrypted:mimeType:forReading:]((id *)&self->super.super.isa, a3, a4, a5, a6, 1);
}

- (HAP2AccessoryServerTransportRequest)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end