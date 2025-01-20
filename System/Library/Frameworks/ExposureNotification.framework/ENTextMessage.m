@interface ENTextMessage
+ (BOOL)supportsSecureCoding;
+ (id)textMessageWithMessage:(id)a3 embeddedURLs:(id)a4;
- (ENRegion)testVerificationRegion;
- (ENTextMessage)initWithCoder:(id)a3;
- (ENTextMessage)initWithMessage:(id)a3 embeddedURLs:(id)a4;
- (NSArray)embeddedURLs;
- (NSString)message;
- (NSString)signature;
- (NSString)testVerificationCode;
- (NSString)verificationString;
- (NSURL)ensTestVerificationURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEmbeddedURLs:(id)a3;
- (void)setEnsTestVerificationURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTestVerificationCode:(id)a3;
- (void)setTestVerificationRegion:(id)a3;
@end

@implementation ENTextMessage

+ (id)textMessageWithMessage:(id)a3 embeddedURLs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[ENTextMessage alloc] initWithMessage:v6 embeddedURLs:v5];

  return v7;
}

- (ENTextMessage)initWithMessage:(id)a3 embeddedURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ENTextMessage;
  v8 = [(ENTextMessage *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(ENTextMessage *)v8 setMessage:v6];
    [(ENTextMessage *)v9 setEmbeddedURLs:v7];
    id v10 = [(ENTextMessage *)v9 ensTestVerificationURL];
  }

  return v9;
}

- (id)description
{
  NSAppendPrintF_safe();
  id v5 = 0;
  NSAppendPrintF_safe();
  id v2 = v5;

  NSAppendPrintF_safe();
  id v3 = v2;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_message forKey:@"textMessage"];
  embeddedURLs = self->_embeddedURLs;
  if (embeddedURLs) {
    [v5 encodeObject:embeddedURLs forKey:@"textMessageURLs"];
  }
}

- (ENTextMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textMessage"];
  id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"textMessageURLs"];

  id v7 = [(id)objc_opt_class() textMessageWithMessage:v5 embeddedURLs:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  message = self->_message;
  embeddedURLs = self->_embeddedURLs;

  return (id)[v4 initWithMessage:message embeddedURLs:embeddedURLs];
}

- (NSURL)ensTestVerificationURL
{
  ensTestVerificationURL = self->_ensTestVerificationURL;
  if (!ensTestVerificationURL)
  {
    id v4 = [(ENTextMessage *)self embeddedURLs];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__ENTextMessage_ensTestVerificationURL__block_invoke;
    v7[3] = &unk_264244CB8;
    v7[4] = self;
    [v4 enumerateObjectsUsingBlock:v7];

    ensTestVerificationURL = self->_ensTestVerificationURL;
  }
  id v5 = ensTestVerificationURL;

  return v5;
}

void __39__ENTextMessage_ensTestVerificationURL__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [MEMORY[0x263F08BA0] componentsWithURL:v6 resolvingAgainstBaseURL:0];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 queryItems];
    id v10 = v9;
    if (v9)
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__1;
      v38 = __Block_byref_object_dispose__1;
      id v39 = 0;
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      id v33 = 0;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __39__ENTextMessage_ensTestVerificationURL__block_invoke_10;
      v27[3] = &unk_264244C90;
      v27[4] = &v34;
      v27[5] = &v28;
      [v9 enumerateObjectsUsingBlock:v27];
      v11 = (void *)v29[5];
      if (v11)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v11);
        if (!v35[5])
        {
          objc_super v12 = [v8 scheme];
          int v13 = [v12 isEqualToString:@"https"];

          if (v13)
          {
            v14 = [v8 host];
            v15 = [v14 componentsSeparatedByString:@"."];
            v16 = [v15 firstObject];

            uint64_t v17 = +[ENRegion regionWithCode:v16];
            uint64_t v18 = *(void *)(a1 + 32);
            v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;

            uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 40) regionCode];
            v21 = (void *)v35[5];
            v35[5] = v20;
          }
        }
        v22 = [MEMORY[0x263F089D8] stringWithFormat:@"ens://v?c=%@", v29[5]];
        v23 = v22;
        if (v35[5]) {
          [v22 appendFormat:@"&r=%@", v35[5]];
        }
        uint64_t v24 = [NSURL URLWithString:v23];
        uint64_t v25 = *(void *)(a1 + 32);
        v26 = *(void **)(v25 + 24);
        *(void *)(v25 + 24) = v24;

        *a4 = 1;
      }
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
    }
  }
}

void __39__ENTextMessage_ensTestVerificationURL__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 name];
  id v4 = [v3 value];

  if (v6 && v4)
  {
    if ([v6 isEqualToString:@"r"])
    {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    else
    {
      if (![v6 isEqualToString:@"c"]) {
        goto LABEL_8;
      }
      uint64_t v5 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(*(void *)(v5 + 8) + 40), v4);
  }
LABEL_8:
}

- (NSString)verificationString
{
  id v2 = [(ENTextMessage *)self message];
  uint64_t v3 = [v2 rangeOfString:@"Authentication:" options:4];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v2 substringToIndex:v3 + v4];
  }

  return (NSString *)v5;
}

- (NSString)signature
{
  id v2 = [(ENTextMessage *)self message];
  uint64_t v3 = [v2 rangeOfString:@":" options:4];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v2 substringFromIndex:v3 + v4];
  }

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)embeddedURLs
{
  return self->_embeddedURLs;
}

- (void)setEmbeddedURLs:(id)a3
{
}

- (void)setEnsTestVerificationURL:(id)a3
{
}

- (NSString)testVerificationCode
{
  return self->_testVerificationCode;
}

- (void)setTestVerificationCode:(id)a3
{
}

- (ENRegion)testVerificationRegion
{
  return self->_testVerificationRegion;
}

- (void)setTestVerificationRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testVerificationRegion, 0);
  objc_storeStrong((id *)&self->_testVerificationCode, 0);
  objc_storeStrong((id *)&self->_ensTestVerificationURL, 0);
  objc_storeStrong((id *)&self->_embeddedURLs, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end