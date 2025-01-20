@interface CRKConcretePrivateKey
+ (id)privateKeyWithData:(id)a3;
- (CRKConcretePrivateKey)initWithPrivateKey:(__SecKey *)a3;
- (NSData)dataRepresentation;
- (NSString)description;
- (__SecKey)underlyingPrivateKey;
- (void)dataRepresentation;
- (void)dealloc;
@end

@implementation CRKConcretePrivateKey

- (void)dealloc
{
  CFRelease(self->_underlyingPrivateKey);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcretePrivateKey;
  [(CRKConcretePrivateKey *)&v3 dealloc];
}

- (CRKConcretePrivateKey)initWithPrivateKey:(__SecKey *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKConcretePrivateKey;
  v4 = [(CRKConcretePrivateKey *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingPrivateKey = a3;
  }
  return v4;
}

+ (id)privateKeyWithData:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F16F68];
  v15[0] = *MEMORY[0x263F17108];
  v15[1] = v4;
  uint64_t v5 = *MEMORY[0x263F16F70];
  v16[0] = *MEMORY[0x263F16FE0];
  v16[1] = v5;
  objc_super v6 = NSDictionary;
  CFDataRef v7 = (const __CFData *)a3;
  CFDictionaryRef v8 = [v6 dictionaryWithObjects:v16 forKeys:v15 count:2];
  CFErrorRef v14 = 0;
  SecKeyRef v9 = SecKeyCreateWithData(v7, v8, &v14);

  if (v9)
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithPrivateKey:v9];
    CFRelease(v9);
  }
  else
  {
    CFErrorRef v11 = v14;
    v12 = _CRKLogGeneral_17();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CRKConcretePrivateKey privateKeyWithData:](v11);
    }

    v10 = 0;
  }

  return v10;
}

- (NSData)dataRepresentation
{
  CFErrorRef error = 0;
  CFDataRef v2 = SecKeyCopyExternalRepresentation([(CRKConcretePrivateKey *)self underlyingPrivateKey], &error);
  if (!v2)
  {
    CFErrorRef v3 = error;
    uint64_t v4 = _CRKLogGeneral_17();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CRKConcretePrivateKey dataRepresentation](v3);
    }
  }

  return (NSData *)v2;
}

- (NSString)description
{
  CFErrorRef v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = self;
  return (NSString *)[v3 stringWithFormat:@"<%@: %p { underlyingPrivateKey = %@ }>", v4, v5, -[CRKConcretePrivateKey underlyingPrivateKey](v5, "underlyingPrivateKey")];
}

- (__SecKey)underlyingPrivateKey
{
  return self->_underlyingPrivateKey;
}

+ (void)privateKeyWithData:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Error creating private key from data. Error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)dataRepresentation
{
  v1 = [a1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Error occurred while getting the private key, %{public}@", v4, v5, v6, v7, 2u);
}

@end