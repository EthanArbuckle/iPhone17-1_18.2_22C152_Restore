@interface DCCryptoProxyImpl
- (void)_fetchPublicKey:(id)a3;
- (void)baaSignatureForData:(id)a3 completion:(id)a4;
- (void)baaSignaturesForData:(id)a3 completion:(id)a4;
- (void)fetchOpaqueBlobWithContext:(id)a3 completion:(id)a4;
@end

@implementation DCCryptoProxyImpl

- (void)fetchOpaqueBlobWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _DCLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2330E6000, v8, OS_LOG_TYPE_DEFAULT, "Generating certificate...", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__DCCryptoProxyImpl_fetchOpaqueBlobWithContext_completion___block_invoke;
  v11[3] = &unk_264BDC2C0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(DCCryptoProxyImpl *)self _fetchPublicKey:v11];
}

void __59__DCCryptoProxyImpl_fetchOpaqueBlobWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[DCCertificateGenerator alloc] initWithContext:*(void *)(a1 + 32) publicKey:v3];

  [(DCCertificateGenerator *)v4 generateEncryptedCertificateChainWithCompletion:*(void *)(a1 + 40)];
}

- (void)_fetchPublicKey:(id)a3
{
  id v3 = a3;
  v4 = +[DCAssetFetcher sharedFetcher];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__DCCryptoProxyImpl__fetchPublicKey___block_invoke;
  v6[3] = &unk_264BDC2E8;
  id v7 = v3;
  id v5 = v3;
  [v4 fetchPublicKeyAssetWithCompletion:v6];
}

void __37__DCCryptoProxyImpl__fetchPublicKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 publicKey];

  v8 = _DCLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_2330E6000, v8, OS_LOG_TYPE_DEFAULT, "Fetched remote public key...", (uint8_t *)&v13, 2u);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v5 publicKey];
  }
  else
  {
    if (v9)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_2330E6000, v8, OS_LOG_TYPE_DEFAULT, "Falling back to locally cached key... Asset fetch failed: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:&fallback_server_pubkey length:65];
  }
  id v12 = (void *)v11;
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);
}

- (void)baaSignatureForData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _DCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl(&dword_2330E6000, v7, OS_LOG_TYPE_DEFAULT, "Signing with baa certs for data...", v9, 2u);
  }

  v8 = +[DCBAASigner sharedSigner];
  [v8 signatureForData:v6 completion:v5];
}

- (void)baaSignaturesForData:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = _DCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DCCryptoProxyImpl baaSignaturesForData:completion:](v7);
  }

  v8 = +[DCBAASigner sharedSigner];
  [v8 signaturesForData:v6 completion:v5];
}

- (void)baaSignaturesForData:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2330E6000, log, OS_LOG_TYPE_DEBUG, "Signing with baa certs for dictionary", v1, 2u);
}

@end