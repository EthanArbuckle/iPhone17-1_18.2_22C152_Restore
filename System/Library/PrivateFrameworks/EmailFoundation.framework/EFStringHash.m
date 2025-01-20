@interface EFStringHash
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EFStringHash)initWithCoder:(id)a3;
- (EFStringHash)initWithData:(id)a3;
- (EFStringHash)initWithHash:(int64_t)a3;
- (EFStringHash)initWithMD5Digest:(id)a3;
- (EFStringHash)initWithString:(id)a3;
- (NSString)ef_publicDescription;
- (NSString)hexStringValue;
- (NSString)stringValue;
- (id)_hexStringFromHash:(int64_t)a3;
- (id)redactedStringValue;
- (int64_t)primitiveHash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EFStringHash

- (NSString)hexStringValue
{
  v2 = [(EFStringHash *)self _hexStringFromHash:[(EFStringHash *)self primitiveHash]];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1F0EAE5A8;
  }
  v4 = v2;

  return v4;
}

void __35__EFStringHash_redactedStringValue__block_invoke()
{
  v0 = +[EFDevice currentDevice];
  id v1 = [v0 identifier];

  if (v1) {
    [v1 getUUIDBytes:&redactedStringValue_deviceSalt];
  }
}

- (NSString)ef_publicDescription
{
  v3 = +[EFDevice currentDevice];
  int v4 = [v3 isInternal];

  if (v4) {
    [(EFStringHash *)self debugDescription];
  }
  else {
  v5 = [(EFStringHash *)self redactedStringValue];
  }
  return (NSString *)v5;
}

- (EFStringHash)initWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = objc_msgSend(v4, "ef_md5Digest");
    v6 = [(EFStringHash *)self initWithMD5Digest:v5];
  }
  else
  {
    v6 = [(EFStringHash *)self initWithHash:0];
  }

  return v6;
}

- (EFStringHash)initWithMD5Digest:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 8)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __hashForDigest_block_invoke;
    v8[3] = &unk_1E6123740;
    v8[4] = &v10;
    v8[5] = v9;
    [v4 enumerateByteRangesUsingBlock:v8];
    uint64_t v5 = v11[3];
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    uint64_t v5 = 0;
  }

  v6 = [(EFStringHash *)self initWithHash:v5];
  return v6;
}

- (EFStringHash)initWithHash:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EFStringHash;
  result = [(EFStringHash *)&v5 init];
  if (result) {
    result->_primitiveHash = a3;
  }
  return result;
}

- (id)redactedStringValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (redactedStringValue_onceToken != -1) {
    dispatch_once(&redactedStringValue_onceToken, &__block_literal_global_38);
  }
  int64_t data = [(EFStringHash *)self primitiveHash];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v8.wbuf[12] = v3;
  *(_OWORD *)&v8.wbuf[14] = v3;
  *(_OWORD *)&v8.wbuf[8] = v3;
  *(_OWORD *)&v8.wbuf[10] = v3;
  *(_OWORD *)&v8.wbuf[4] = v3;
  *(_OWORD *)&v8.wbuf[6] = v3;
  *(_OWORD *)v8.wbuf = v3;
  *(_OWORD *)&v8.wbuf[2] = v3;
  *(_OWORD *)&v8.hash[4] = v3;
  *(_OWORD *)&v8.hash[6] = v3;
  *(_OWORD *)v8.hash = v3;
  *(_OWORD *)&v8.hash[2] = v3;
  *(_OWORD *)v8.count = v3;
  CC_SHA512_Init(&v8);
  CC_SHA512_Update(&v8, &redactedStringValue_deviceSalt, 0x10u);
  CC_SHA512_Update(&v8, &data, 8u);
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v4;
  long long v13 = v4;
  *(_OWORD *)md = v4;
  long long v11 = v4;
  CC_SHA512_Final(md, &v8);
  objc_super v5 = [(EFStringHash *)self _hexStringFromHash:*(void *)md];
  v6 = objc_msgSend(v5, "substringWithRange:", 2, 4);

  return v6;
}

- (int64_t)primitiveHash
{
  return self->_primitiveHash;
}

- (id)_hexStringFromHash:(int64_t)a3
{
  long long v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", a3);
  return v3;
}

- (EFStringHash)initWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    objc_super v5 = objc_msgSend(v4, "ef_md5Digest");
    v6 = [(EFStringHash *)self initWithMD5Digest:v5];
  }
  else
  {
    v6 = [(EFStringHash *)self initWithHash:0];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[EFStringHash int64Value](self, "int64Value") && [v5 int64Value])
    {
      int64_t v6 = [(EFStringHash *)self int64Value];
      BOOL v7 = v6 == [v5 int64Value];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)stringValue
{
  v2 = [(EFStringHash *)self int64Value];
  if (v2) {
    v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", v2);
  }
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EFStringHash)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[EFStringHash initWithHash:](self, "initWithHash:", [v4 decodeInt64ForKey:@"EFPropertyKey_primitiveHash"]);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[EFStringHash primitiveHash](self, "primitiveHash"), @"EFPropertyKey_primitiveHash");
}

@end