@interface _LSValidationToken
+ (BOOL)supportsSecureCoding;
- (_LSValidationToken)initWithCoder:(id)a3;
- (_LSValidationToken)initWithPayload:(id)a3;
- (id)setOwner:(id *)result;
- (uint64_t)isCorrectForPayload:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSValidationToken

- (id)setOwner:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 4, a2);
  }
  return result;
}

- (_LSValidationToken)initWithPayload:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LSValidationToken;
  v5 = [(_LSValidationToken *)&v13 init];
  _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken initWithPayload:]");
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, bytes);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:bytes length:32];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v8;

    uint64_t v10 = _LSValidationTokenComputeHMAC(v5->_payload, v5->_nonce);
    HMAC = v5->_HMAC;
    v5->_HMAC = (NSData *)v10;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_HMAC, 0);
  objc_storeStrong((id *)&self->_nonce, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_payload forKey:@"payload"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeObject:self->_HMAC forKey:@"HMAC"];
}

- (_LSValidationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LSValidationToken;
  v5 = [(_LSValidationToken *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"payload");
    v7 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"nonce");
    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"HMAC");
    v9 = (void *)v8;
    if (v6 && v7 && v8)
    {
      objc_storeStrong((id *)&v5->_payload, v6);
      objc_storeStrong((id *)&v5->_nonce, v7);
      objc_storeStrong((id *)&v5->_HMAC, v9);
      if (![(id)__LSDefaultsGetSharedInstance() isServer]
        || (-[_LSValidationToken isCorrectForPayload:]((uint64_t)v5, v5->_payload) & 1) != 0)
      {
        goto LABEL_10;
      }
      uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[_LSValidationToken initWithCoder:]", 114, 0);
      [v4 failWithError:v10];
    }
    else
    {
      uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4865, (uint64_t)"-[_LSValidationToken initWithCoder:]", 118, 0);
      [v4 failWithError:v10];
    }

    v5 = 0;
LABEL_10:
  }
  return v5;
}

- (uint64_t)isCorrectForPayload:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken isCorrectForPayload:]");
    if (*(void *)(a1 + 8))
    {
      if (*(void *)(a1 + 16))
      {
        id v4 = *(void **)(a1 + 24);
        if (v4)
        {
          id v5 = v4;
          uint64_t v6 = _LSValidationTokenComputeHMAC(v3, *(NSData **)(a1 + 16));
          if (v6 && (size_t v7 = [v5 length], v7 == objc_msgSend(v6, "length")))
          {
            id v8 = v5;
            v9 = (const void *)[v8 bytes];
            id v10 = v6;
            int v11 = timingsafe_bcmp(v9, (const void *)[v10 bytes], v7);

            if (!v11)
            {
              a1 = 1;
              goto LABEL_20;
            }
          }
          else
          {
          }
        }
      }
    }
    if ([(id)__LSDefaultsGetSharedInstance() isAppleInternal])
    {
      objc_super v12 = (id *)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

      if (WeakRetained)
      {
        v14 = _LSDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_LSValidationToken isCorrectForPayload:](v12, v14);
        }
      }
      else
      {
        v14 = _LSDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_LSValidationToken isCorrectForPayload:](v14);
        }
      }
    }
    uint64_t v15 = _LSDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_LSValidationToken isCorrectForPayload:](v15);
    }

    a1 = 0;
  }
LABEL_20:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)isCorrectForPayload:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed HMAC validation; lsd may have crashed. Please file a bug report against Launch Services.",
    v1,
    2u);
}

- (void)isCorrectForPayload:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Token validation failed against unknown object.", v1, 2u);
}

- (void)isCorrectForPayload:(id *)a1 .cold.3(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  int v4 = 138543362;
  id v5 = WeakRetained;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Token validation failed against object %{public}@.", (uint8_t *)&v4, 0xCu);
}

@end