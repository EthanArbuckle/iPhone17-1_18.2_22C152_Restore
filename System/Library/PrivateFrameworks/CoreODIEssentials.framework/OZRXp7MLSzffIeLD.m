@interface OZRXp7MLSzffIeLD
- (void)MypqGKKWznx4xnYa:(id)a3 l8OCYbP9LFIvnTwG:(unint64_t)a4 ygOPXTiKN0J02x0j:(id)a5;
- (void)MypqGKKWznx4xnYa:(id)a3 ygOPXTiKN0J02x0j:(id)a4;
- (void)t5yVezCKaX2Zrwrw:(id)a3 uXxcS3vcKdsH38zZ:(id)a4;
- (void)vffg4lwI2HftPvpO:(id)a3;
@end

@implementation OZRXp7MLSzffIeLD

- (void)MypqGKKWznx4xnYa:(id)a3 ygOPXTiKN0J02x0j:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v23 = +[Lt10zus2DOk3OfFf sharedInstance];
    v7 = [v5 HkbEJeZjAQnItubK];
    v8 = [v5 TbX4HHO0pTPaerrJ];
    v9 = [v5 BGiN5h2SLMRO6B9R];
    v10 = [v5 rU1LRx5aI44CETG8];
    v24 = [v5 yNHDWo3TCV];
    v22 = [v5 zeXRCfLmM5cdkEtz];
    uint64_t v11 = [v5 S08uY31jbmOEDLrH];
    v21 = [v5 hostChallenge];
    [v5 challengeResponse];
    v12 = v25 = v6;
    v13 = [v5 seid];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_ygOPXTiKN0J02x0j___block_invoke;
    v26[3] = &unk_26422B9D8;
    id v27 = v25;
    uint64_t v20 = v11;
    v14 = v23;
    [v23 Z8aAH7stm0EYhyxg:v7 xz5EHXEN4FjlhJbi:v8 uhVTXyAfCFn7u0Ue:v9 EQUjQp7JcQbqcPcD:v10 A5wDLa5TFdFZlz3A:v24 TJKMyOe6zn5PdGIr:v22 eCqgGM0WcnHOslnr:0 eCszfxdv3kUXvhgV:v20 uWp4aZpP2vLhc04Q:v21 QZYtNpvp0hKd248p:v12 oCwPYmtRv8s31KUH:v13 completion:v26];

    id v6 = v25;
  }
  else
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v16 = [MEMORY[0x263F086E0] mainBundle];
    v17 = [v16 localizedStringForKey:@"empty request" value:&stru_26C5B04B0 table:0];
    v29[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v19 = [v15 errorWithDomain:@"com.apple.asd.ca" code:-27100 userInfo:v18];

    v14 = (void *)v19;
    (*((void (**)(id, void, void, uint64_t, uint64_t))v6 + 2))(v6, 0, 0, 0xFFFFFFFFLL, v19);
  }
}

void __54__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_ygOPXTiKN0J02x0j___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = v10;
  if (v10 && v9 && !a6)
  {
    uint64_t v28 = 0;
    v29 = 0;
    id v12 = v10;
    bcgsyabc74vz12([v12 bytes], objc_msgSend(v12, "length"), (uint64_t)&v29);
    if (v13)
    {
      int v14 = v13;
      free(v29);
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = (void *)MEMORY[0x263F087E8];
      v17 = [NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v18 = [v16 errorWithDomain:v17 code:v14 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0xFFFFFFFFLL, v18);
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
      v17 = objc_msgSend(v19, "initWithBytes:length:", v29, objc_msgSend(v12, "length"));
      free(v29);
      id v20 = v9;
      bcgsyabc74vz12([v20 bytes], objc_msgSend(v20, "length"), (uint64_t)&v28);
      if (!v21)
      {
        id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
        id v27 = objc_msgSend(v26, "initWithBytes:length:", v28, objc_msgSend(v20, "length"));
        free(v28);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_10;
      }
      int v22 = v21;
      free(v28);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = (void *)MEMORY[0x263F087E8];
      v18 = [NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v25 = [v24 errorWithDomain:v18 code:v22 userInfo:0];
      (*(void (**)(uint64_t, void, void, uint64_t, void *))(v23 + 16))(v23, 0, 0, 0xFFFFFFFFLL, v25);
    }
LABEL_10:

    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_11:
}

- (void)t5yVezCKaX2Zrwrw:(id)a3 uXxcS3vcKdsH38zZ:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[Lt10zus2DOk3OfFf sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__OZRXp7MLSzffIeLD_t5yVezCKaX2Zrwrw_uXxcS3vcKdsH38zZ___block_invoke;
  v9[3] = &unk_26422BA00;
  id v10 = v5;
  id v8 = v5;
  [v7 ZfE6lVphNUVrZcKx:v6 completion:v9];
}

uint64_t __54__OZRXp7MLSzffIeLD_t5yVezCKaX2Zrwrw_uXxcS3vcKdsH38zZ___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)MypqGKKWznx4xnYa:(id)a3 l8OCYbP9LFIvnTwG:(unint64_t)a4 ygOPXTiKN0J02x0j:(id)a5
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    v25 = +[Lt10zus2DOk3OfFf sharedInstance];
    id v9 = [v7 HkbEJeZjAQnItubK];
    id v10 = [v7 TbX4HHO0pTPaerrJ];
    uint64_t v11 = [v7 BGiN5h2SLMRO6B9R];
    uint64_t v23 = [v7 rU1LRx5aI44CETG8];
    int v22 = [v7 yNHDWo3TCV];
    int v21 = [v7 zeXRCfLmM5cdkEtz];
    uint64_t v12 = [v7 S08uY31jbmOEDLrH];
    int v13 = [v7 hostChallenge];
    [v7 challengeResponse];
    int v14 = v24 = v8;
    uint64_t v15 = [v7 seid];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __71__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_l8OCYbP9LFIvnTwG_ygOPXTiKN0J02x0j___block_invoke;
    v26[3] = &unk_26422B9D8;
    id v27 = v24;
    [v25 Z8aAH7stm0EYhyxg:v9 xz5EHXEN4FjlhJbi:v10 uhVTXyAfCFn7u0Ue:v11 EQUjQp7JcQbqcPcD:v23 A5wDLa5TFdFZlz3A:v22 TJKMyOe6zn5PdGIr:v21 eCqgGM0WcnHOslnr:a4 eCszfxdv3kUXvhgV:v12 uWp4aZpP2vLhc04Q:v13 QZYtNpvp0hKd248p:v14 oCwPYmtRv8s31KUH:v15 completion:v26];

    id v8 = v24;
  }
  else
  {
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v17 = [MEMORY[0x263F086E0] mainBundle];
    v18 = [v17 localizedStringForKey:@"empty request" value:&stru_26C5B04B0 table:0];
    v29[0] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v20 = [v16 errorWithDomain:@"com.apple.asd.ca" code:-27100 userInfo:v19];

    v25 = (void *)v20;
    (*((void (**)(id, void, void, void, uint64_t, uint64_t))v8 + 2))(v8, 0, 0, 0, 0xFFFFFFFFLL, v20);
  }
}

void __71__OZRXp7MLSzffIeLD_MypqGKKWznx4xnYa_l8OCYbP9LFIvnTwG_ygOPXTiKN0J02x0j___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = v10;
  if (!a6)
  {
    uint64_t v28 = 0;
    v29 = 0;
    id v12 = v10;
    bcgsyabc74vz12([v12 bytes], objc_msgSend(v12, "length"), (uint64_t)&v29);
    if (v13)
    {
      int v14 = v13;
      free(v29);
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = (void *)MEMORY[0x263F087E8];
      v17 = [NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v18 = [v16 errorWithDomain:v17 code:v14 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v15 + 16))(v15, 0, 0, 0, 0xFFFFFFFFLL, v18);
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
      v17 = objc_msgSend(v19, "initWithBytes:length:", v29, objc_msgSend(v12, "length"));
      free(v29);
      id v20 = v9;
      bcgsyabc74vz12([v20 bytes], objc_msgSend(v20, "length"), (uint64_t)&v28);
      if (!v21)
      {
        id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
        id v27 = objc_msgSend(v26, "initWithBytes:length:", v28, objc_msgSend(v20, "length"));
        free(v28);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_8;
      }
      int v22 = v21;
      free(v28);
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = (void *)MEMORY[0x263F087E8];
      v18 = [NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
      v25 = [v24 errorWithDomain:v18 code:v22 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, uint64_t, void *))(v23 + 16))(v23, 0, 0, 0, 0xFFFFFFFFLL, v25);
    }
LABEL_8:

    goto LABEL_9;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v3 = a3;
  v4 = +[Lt10zus2DOk3OfFf sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__OZRXp7MLSzffIeLD_vffg4lwI2HftPvpO___block_invoke;
  v6[3] = &unk_26422BA28;
  id v7 = v3;
  id v5 = v3;
  [v4 vffg4lwI2HftPvpO:v6];
}

uint64_t __37__OZRXp7MLSzffIeLD_vffg4lwI2HftPvpO___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end