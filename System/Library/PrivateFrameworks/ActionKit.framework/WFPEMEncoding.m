@interface WFPEMEncoding
+ (id)decodePEM:(id)a3 error:(id *)a4;
- (NSData)data;
- (NSString)type;
- (WFPEMEncoding)initWithType:(id)a3 data:(id)a4;
- (id)encodedPEM;
- (void)setData:(id)a3;
- (void)setType:(id)a3;
@end

@implementation WFPEMEncoding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (id)encodedPEM
{
  v3 = objc_opt_new();
  [v3 appendString:@"-----BEGIN "];
  v4 = [(WFPEMEncoding *)self type];
  [v3 appendString:v4];

  [v3 appendString:@"-----"];
  [v3 appendFormat:@"\n"];
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  v6 = [(WFPEMEncoding *)self data];
  v7 = [v6 base64EncodedStringWithOptions:0];
  v8 = (void *)[v5 initWithString:v7];

  uint64_t v9 = [@"\n" length];
  if ((unint64_t)[v8 length] >= 0x3D)
  {
    uint64_t v10 = v9 + 60;
    unint64_t v11 = 60;
    do
    {
      [v8 insertString:@"\n" atIndex:v11];
      v11 += v10;
    }
    while (v11 < [v8 length]);
  }
  [v3 appendString:v8];
  [v3 appendString:@"\n"];
  [v3 appendString:@"-----END "];
  v12 = [(WFPEMEncoding *)self type];
  [v3 appendString:v12];

  [v3 appendString:@"-----"];
  return v3;
}

- (WFPEMEncoding)initWithType:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPEMEncoding;
  v8 = [(WFPEMEncoding *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    type = v8->_type;
    v8->_type = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

+ (id)decodePEM:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F08B08];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithString:v6];

  v8 = [MEMORY[0x263F08708] newlineCharacterSet];
  [v7 setCharactersToBeSkipped:v8];

  uint64_t v9 = 0;
  if ([v7 scanString:@"-----BEGIN " intoString:0])
  {
    id v23 = 0;
    int v10 = [v7 scanUpToString:@"-----" intoString:&v23];
    id v11 = v23;
    uint64_t v9 = 0;
    if (v10)
    {
      [v7 scanString:@"-----" intoString:0];
      id v22 = 0;
      int v12 = [v7 scanUpToString:@"-----END " intoString:&v22];
      id v13 = v22;
      uint64_t v9 = 0;
      if (v12)
      {
        [v7 scanString:@"-----END " intoString:0];
        id v21 = 0;
        int v14 = [v7 scanUpToString:@"-----" intoString:&v21];
        id v15 = v21;
        uint64_t v9 = 0;
        if (v14)
        {
          [v7 scanString:@"-----" intoString:0];
          uint64_t v9 = 0;
          if ([v7 isAtEnd])
          {
            if ([v11 isEqualToString:v15])
            {
              v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v13 options:1];
              if (v16)
              {
                uint64_t v9 = [[WFPEMEncoding alloc] initWithType:v11 data:v16];
              }
              else
              {
                if (a4)
                {
                  v17 = (void *)MEMORY[0x263F087E8];
                  uint64_t v24 = *MEMORY[0x263F08320];
                  v18 = WFLocalizedString(@"Private key contained PEM header and footer, but was not encoded correctly.");
                  v25[0] = v18;
                  v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
                  *a4 = [v17 errorWithDomain:@"WFPEMEncodingErrorDomain" code:1 userInfo:v19];
                }
                uint64_t v9 = 0;
              }
            }
            else
            {
              uint64_t v9 = 0;
            }
          }
        }
      }
    }
  }
  return v9;
}

@end