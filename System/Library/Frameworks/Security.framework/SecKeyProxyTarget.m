@interface SecKeyProxyTarget
- (SecKeyProxyTarget)initWithKey:(id)a3 certificate:(id)a4;
- (__SecKey)key;
- (void)getAlgorithmIDWithReply:(id)a3;
- (void)getAttributesWithReply:(id)a3;
- (void)getBlockSizeWithReply:(id)a3;
- (void)getDescriptionWithReply:(id)a3;
- (void)getExternalRepresentationWithReply:(id)a3;
- (void)getPublicKey:(id)a3;
- (void)initializeWithReply:(id)a3;
- (void)performOperation:(int64_t)a3 mode:(int64_t)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
@end

@implementation SecKeyProxyTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyProxy, 0);
  objc_storeStrong((id *)&self->_certificate, 0);

  objc_storeStrong(&self->_key, 0);
}

- (void)performOperation:(int64_t)a3 mode:(int64_t)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, void *, __CFString *))a7;
  v25[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v16 = (void *)[v15 mutableCopy];

  if ([v13 count])
  {
    v17 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    v17 = 0;
  }
  if ((unint64_t)[v13 count] < 2)
  {
    v18 = 0;
  }
  else
  {
    v18 = [v13 objectAtIndexedSubscript:1];
  }
  v23 = 0;
  v22[0] = (uint64_t)[(SecKeyProxyTarget *)self key];
  v22[1] = a3;
  v22[2] = (uint64_t)v16;
  v22[3] = a4;
  v19 = SecKeyRunAlgorithmAndCopyResult(v22, (const __CFData *)v17, (const __CFData *)v18, &v23);
  v20 = v19;
  if (v19)
  {
    v24 = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v14[2](v14, v21, v23);
  }
  else
  {
    v14[2](v14, (void *)MEMORY[0x1E4F1CBF0], v23);
  }
}

- (void)getPublicKey:(id)a3
{
  v10 = (void (**)(id, void *))a3;
  publicKeyProxy = self->_publicKeyProxy;
  if (publicKeyProxy) {
    goto LABEL_4;
  }
  SecKeyRef v5 = SecKeyCopyPublicKey([(SecKeyProxyTarget *)self key]);
  if (v5)
  {
    SecKeyRef v6 = v5;
    v7 = [[SecKeyProxy alloc] initWithKey:v5];
    v8 = self->_publicKeyProxy;
    self->_publicKeyProxy = v7;

    publicKeyProxy = self->_publicKeyProxy;
LABEL_4:
    v9 = [(SecKeyProxy *)publicKeyProxy endpoint];
    v10[2](v10, v9);

    goto LABEL_5;
  }
  v10[2](v10, 0);
LABEL_5:
}

- (void)getAlgorithmIDWithReply:(id)a3
{
  id v6 = a3;
  uint64_t AlgorithmId = SecKeyGetAlgorithmId((uint64_t)[(SecKeyProxyTarget *)self key]);
  (*((void (**)(id, uint64_t))a3 + 2))(v6, AlgorithmId);
}

- (void)getDescriptionWithReply:(id)a3
{
  v8 = (void (**)(id, __CFString *))a3;
  v4 = (__CFString *)CFCopyDescription([(SecKeyProxyTarget *)self key]);
  if ([(__CFString *)v4 hasPrefix:@"<SecKeyRef "]
    && ([(__CFString *)v4 hasSuffix:@">"] & 1) != 0)
  {
    uint64_t v5 = -12;
    uint64_t v6 = 11;
LABEL_7:
    uint64_t v7 = -[__CFString substringWithRange:](v4, "substringWithRange:", v6, [(__CFString *)v4 length] + v5);

    v4 = (__CFString *)v7;
    goto LABEL_8;
  }
  if ([(__CFString *)v4 hasPrefix:@"<SecKeyRef: "]
    && [(__CFString *)v4 hasSuffix:@">"])
  {
    uint64_t v5 = -13;
    uint64_t v6 = 12;
    goto LABEL_7;
  }
LABEL_8:
  v8[2](v8, v4);
}

- (void)getExternalRepresentationWithReply:(id)a3
{
  CFErrorRef error = 0;
  v4 = (void (**)(id, CFDataRef, CFErrorRef))a3;
  CFDataRef v5 = SecKeyCopyExternalRepresentation([(SecKeyProxyTarget *)self key], &error);
  v4[2](v4, v5, error);
}

- (void)getAttributesWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  CFDictionaryRef v5 = SecKeyCopyAttributes([(SecKeyProxyTarget *)self key]);
  id v16 = (id)[(__CFDictionary *)v5 mutableCopy];

  uint64_t v6 = [v16 objectForKeyedSubscript:@"accc"];

  if (v6)
  {
    v14 = SecAccessControlCopyData((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    [v16 setObject:v14 forKeyedSubscript:@"accc"];
  }
  v15 = (void *)[v16 copy];
  v4[2](v4, v15);
}

- (void)getBlockSizeWithReply:(id)a3
{
  uint64_t v7 = (void (**)(id, uint64_t))a3;
  v4 = [(SecKeyProxyTarget *)self key];
  _SecKeyCheck((uint64_t)v4, (uint64_t)"SecKeyGetBlockSize");
  CFDictionaryRef v5 = *(uint64_t (**)(__SecKey *))(*((void *)v4 + 2) + 80);
  if (v5) {
    uint64_t v6 = v5(v4);
  }
  else {
    uint64_t v6 = 0;
  }
  v7[2](v7, v6);
}

- (void)initializeWithReply:(id)a3
{
}

- (__SecKey)key
{
  return (__SecKey *)self->_key;
}

- (SecKeyProxyTarget)initWithKey:(id)a3 certificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecKeyProxyTarget;
  uint64_t v9 = [(SecKeyProxyTarget *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_key, a3);
    objc_storeStrong((id *)&v10->_certificate, a4);
  }

  return v10;
}

@end