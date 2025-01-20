@interface DIPStreamingCryptor
- (DIPStreamingCryptor)initWithKey:(id)a3;
- (id)encryptBuffer:(id)a3;
- (id)finish;
- (void)addAuthParameter:(id)a3;
- (void)addIVParameter:(id)a3;
@end

@implementation DIPStreamingCryptor

- (DIPStreamingCryptor)initWithKey:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DIPStreamingCryptor;
  v5 = [(DIPStreamingCryptor *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)[v6 bytes], objc_msgSend(v6, "length"), 0, 0, 0, 0, &v5->_cryptor);
  }

  return v5;
}

- (void)addIVParameter:(id)a3
{
  cryptor = self->_cryptor;
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  MEMORY[0x1F40C94B0](cryptor, 0, v5, v6);
}

- (void)addAuthParameter:(id)a3
{
  cryptor = self->_cryptor;
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  MEMORY[0x1F40C94B0](cryptor, 1, v5, v6);
}

- (id)encryptBuffer:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA58];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "dataWithLength:", objc_msgSend(v5, "length"));
  cryptor = self->_cryptor;
  id v8 = v5;
  v9 = (const void *)[v8 bytes];
  size_t v10 = [v8 length];

  id v11 = v6;
  CCCryptorUpdate(cryptor, v9, v10, (void *)[v11 mutableBytes], objc_msgSend(v11, "length"), 0);
  return v11;
}

- (id)finish
{
  id v3 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  [v3 mutableBytes];
  [v3 length];
  CCCryptorGCMFinalize();
  CCCryptorRelease(self->_cryptor);
  return v3;
}

@end