@interface DCDDeviceMetadata
- (DCDDeviceMetadata)initWithContext:(id)a3 cryptoProxy:(id)a4;
- (void)baaSignatureForData:(id)a3 completion:(id)a4;
- (void)baaSignaturesForData:(id)a3 completion:(id)a4;
- (void)generateEncryptedBlobWithCompletion:(id)a3;
@end

@implementation DCDDeviceMetadata

- (DCDDeviceMetadata)initWithContext:(id)a3 cryptoProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(DCDDeviceMetadata *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cryptoProxy, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)generateEncryptedBlobWithCompletion:(id)a3
{
  id v4 = a3;
  cryptoProxy = self->_cryptoProxy;
  context = self->_context;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__DCDDeviceMetadata_generateEncryptedBlobWithCompletion___block_invoke;
  v8[3] = &unk_264BDC228;
  id v9 = v4;
  id v7 = v4;
  [(DCCryptoProxy *)cryptoProxy fetchOpaqueBlobWithContext:context completion:v8];
}

void __57__DCDDeviceMetadata_generateEncryptedBlobWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "dc_errorWithCode:", 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_cryptoProxy, 0);
}

@end