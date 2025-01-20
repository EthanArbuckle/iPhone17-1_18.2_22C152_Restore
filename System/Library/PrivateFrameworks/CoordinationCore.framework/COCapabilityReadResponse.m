@interface COCapabilityReadResponse
+ (BOOL)supportsSecureCoding;
- (COCapabilityReadResponse)init;
- (COCapabilityReadResponse)initWithCapabilities:(id)a3;
- (COCapabilityReadResponse)initWithCoder:(id)a3;
- (NSSet)capabilities;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COCapabilityReadResponse

- (COCapabilityReadResponse)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(COCapabilityReadResponse *)self initWithCapabilities:v3];

  return v4;
}

- (COCapabilityReadResponse)initWithCapabilities:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COCapabilityReadResponse;
  v5 = [(COMeshCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    capabilities = v5->_capabilities;
    v5->_capabilities = (NSSet *)v6;
  }
  return v5;
}

- (COCapabilityReadResponse)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COCapabilityReadResponse;
  v5 = [(COMeshResponse *)&v23 initWithCoder:v4];
  if (v5)
  {
    p_isa = (id *)&v5->super.super.super.isa;
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"capabilities"];
    id v11 = p_isa[2];
    p_isa[2] = (id)v10;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v12 = (id *)p_isa[2];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        while (2)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
              goto LABEL_15;
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      v17 = (COCapabilityReadResponse *)p_isa;
    }
    else
    {
      v17 = 0;
      v12 = p_isa;
    }
LABEL_15:
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COCapabilityReadResponse;
  id v4 = a3;
  [(COMeshResponse *)&v6 encodeWithCoder:v4];
  v5 = [(COCapabilityReadResponse *)self capabilities];
  [v4 encodeObject:v5 forKey:@"capabilities"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
}

@end