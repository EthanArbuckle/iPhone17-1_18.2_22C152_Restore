@interface NEIKEv2AddressIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2AddressIdentifier)initWithAddress:(id)a3;
- (NWAddressEndpoint)address;
- (id)identifierData;
- (id)stringValue;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2AddressIdentifier

- (void).cxx_destruct
{
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (id)stringValue
{
  v2 = [(NEIKEv2AddressIdentifier *)self address];
  v3 = [v2 hostname];

  return v3;
}

- (id)identifierData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(NEIKEv2AddressIdentifier *)self address];
  uint64_t v4 = [v3 addressFamily];

  v5 = [(NEIKEv2AddressIdentifier *)self address];
  v6 = v5;
  if (v4 == 2)
  {
    uint64_t v7 = [v5 address];

    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v9 = v7 + 4;
    uint64_t v10 = 4;
LABEL_5:
    v14 = (void *)[v8 initWithBytes:v9 length:v10];
    goto LABEL_9;
  }
  uint64_t v11 = [v5 addressFamily];

  if (v11 == 30)
  {
    v12 = [(NEIKEv2AddressIdentifier *)self address];
    uint64_t v13 = [v12 address];

    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v9 = v13 + 8;
    uint64_t v10 = 16;
    goto LABEL_5;
  }
  v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = [(NEIKEv2AddressIdentifier *)self address];
    v18[0] = 67109120;
    v18[1] = [v17 addressFamily];
    _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v18, 8u);
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)identifierType
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(NEIKEv2AddressIdentifier *)self address];
  uint64_t v4 = [v3 addressFamily];

  if (v4 == 2) {
    return 1;
  }
  v6 = [(NEIKEv2AddressIdentifier *)self address];
  uint64_t v7 = [v6 addressFamily];

  if (v7 == 30) {
    return 5;
  }
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [(NEIKEv2AddressIdentifier *)self address];
    v10[0] = 67109120;
    v10[1] = [v9 addressFamily];
    _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v10, 8u);
  }
  return 0;
}

- (NEIKEv2AddressIdentifier)initWithAddress:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[NEIKEv2AddressIdentifier initWithAddress:]";
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "%s called with null address", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v11.receiver = self;
  v11.super_class = (Class)NEIKEv2AddressIdentifier;
  v5 = [(NEIKEv2AddressIdentifier *)&v11 init];
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, &self->super.super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  uint64_t v7 = v5;
  objc_setProperty_atomic(v5, v6, v4, 16);
  self = [v4 hostname];
  id v8 = [(NEIKEv2AddressIdentifier *)self dataUsingEncoding:4];
  [(NEIKEv2Identifier *)v7 setIdentifierData:v8];

LABEL_4:
  return v7;
}

+ (id)copyTypeDescription
{
  return @"Address";
}

@end