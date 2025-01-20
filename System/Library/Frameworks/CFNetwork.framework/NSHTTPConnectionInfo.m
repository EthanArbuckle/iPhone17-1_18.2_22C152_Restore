@interface NSHTTPConnectionInfo
@end

@implementation NSHTTPConnectionInfo

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2;
    v8[3] = &unk_1E5254FE8;
    v8[4] = v2;
    id v9 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *))(*(void *)v3 + 16))(v3, v8);
    v4 = v9;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_4;
    v6[3] = &unk_1E5257FD8;
    id v7 = *(id *)(a1 + 40);
    -[NSURLSession runDelegateBlock:]((uint64_t)WeakRetained, v6);

    v4 = v7;
  }
}

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3;
  v10[3] = &unk_1E5257DA8;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  double v13 = a3;
  id v9 = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)WeakRetained, v10);
}

void __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v3 = (id)[v2 initWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:0];
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48));
}

@end