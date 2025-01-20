@interface APActivationPayload
+ (BOOL)supportsSecureCoding;
- (APActivationPayload)initWithCoder:(id)a3;
- (APActivationPayload)initWithURL:(id)a3;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)confirmAcquiredInRegion:(CLRegion *)region completionHandler:(void *)completionHandler;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APActivationPayload

- (APActivationPayload)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APActivationPayload;
  v5 = [(APActivationPayload *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)confirmAcquiredInRegion:(CLRegion *)region completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v7 = (void *)MEMORY[0x263F320D0];
  URL = self->_URL;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__APActivationPayload_confirmAcquiredInRegion_completionHandler___block_invoke;
  v10[3] = &unk_264D00F30;
  id v11 = v6;
  id v9 = v6;
  [v7 confirmLocationWithURL:URL inRegion:region completion:v10];
}

void __65__APActivationPayload_confirmAcquiredInRegion_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v5;
  id v12 = v7;
  if (v7)
  {
    if ([v7 code] == 15)
    {
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v11 = [v12 code];
      v8 = (void *)MEMORY[0x263F087E8];
      if (v11 == 10) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = -1;
      }
    }
    objc_super v10 = [v8 errorWithDomain:@"APActivationPayloadErrorDomain" code:v9 userInfo:0];
  }
  else
  {
    objc_super v10 = 0;
  }

  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (APActivationPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APActivationPayload;
  id v5 = [(APActivationPayload *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSURL *)self->_URL copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end