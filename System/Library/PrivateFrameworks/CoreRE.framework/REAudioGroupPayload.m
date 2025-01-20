@interface REAudioGroupPayload
+ (BOOL)supportsSecureCoding;
- (NSArray)payloads;
- (REAudioGroupPayload)initWithCoder:(id)a3;
- (REAudioGroupPayload)initWithPayloads:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REAudioGroupPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REAudioGroupPayload)initWithPayloads:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAudioGroupPayload;
  v6 = [(RESharedResourcePayload *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_payloads, a3);
  }

  return v7;
}

- (REAudioGroupPayload)initWithCoder:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25.receiver = self;
    v25.super_class = (Class)REAudioGroupPayload;
    id v5 = [(RESharedResourcePayload *)&v25 initWithCoder:v4];
    if (v5)
    {
      v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      id v24 = 0;
      uint64_t v14 = [v4 decodeTopLevelObjectOfClasses:v13 forKey:@"payloads" error:&v24];
      id v15 = v24;
      payloads = v5->_payloads;
      v5->_payloads = (NSArray *)v14;

      if (v15)
      {
        v18 = *re::audioLogObjects(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v15;
          _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "Failed to decode AudioGroupPayload: %@", buf, 0xCu);
        }
      }
    }
    self = v5;
    v19 = self;
  }
  else
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F07F80];
    v29[0] = @"REAudioGroupPayload requires an NSXPCCoder";
    v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v22 = [v20 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v21];
    [v4 failWithError:v22];

    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 encodeObject:self->_payloads forKey:@"payloads"];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F80];
    v9[0] = @"REAudioPayload requires an NSXPCCoder";
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    uint64_t v7 = [v5 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v6];
    [v4 failWithError:v7];
  }
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end