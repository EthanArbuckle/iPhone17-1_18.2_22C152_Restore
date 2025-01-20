@interface MPIdentifierSetWithMPCProtoItem
@end

@implementation MPIdentifierSetWithMPCProtoItem

void ____MPIdentifierSetWithMPCProtoItem_block_invoke(uint64_t a1, void *a2)
{
  v36[0] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[1];
  }
  v5 = v4;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke_2;
  v29[3] = &unk_2643C4988;
  v6 = v5;
  id v30 = v6;
  [v3 setUniversalStoreIdentifiersWithBlock:v29];
  if (v6) {
    uint64_t v7 = v6[2];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = *(id *)(a1 + 40);
  v9 = v8;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (v8) {
    v10 = (void *)*((void *)v8 + 1);
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  v12 = (__CFString *)[v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v32;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v14);
        if (v15)
        {
          if (*(void *)(v15 + 40) == v7)
          {
            uint64_t v7 = *(void *)(v15 + 32);
LABEL_21:
            v17 = (char *)v36 + 1;
            uint64_t quot = v7;
            do
            {
              lldiv_t v19 = lldiv(quot, 10);
              uint64_t quot = v19.quot;
              if (v19.rem >= 0) {
                LOBYTE(v20) = v19.rem;
              }
              else {
                uint64_t v20 = -v19.rem;
              }
              *(v17 - 2) = v20 + 48;
              v21 = (const UInt8 *)(v17 - 2);
              --v17;
            }
            while (v19.quot);
            if (v7 < 0)
            {
              *(v17 - 2) = 45;
              v21 = (const UInt8 *)(v17 - 2);
            }
            v12 = (__CFString *)CFStringCreateWithBytes(0, v21, (char *)v36 - (char *)v21, 0x8000100u, 0);
            goto LABEL_29;
          }
        }
        else if (!v7)
        {
          goto LABEL_21;
        }
        v14 = (__CFString *)((char *)v14 + 1);
      }
      while (v12 != v14);
      uint64_t v16 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      v12 = (__CFString *)v16;
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  v22 = (__CFString *)*(id *)(a1 + 48);
  if (v12 == v22)
  {

    if (!v6) {
      goto LABEL_38;
    }
  }
  else
  {
    v23 = v22;
    int v24 = [(__CFString *)v12 isEqual:v22];

    if (!v6 || !v24) {
      goto LABEL_38;
    }
  }
  if (v6[1])
  {
    if (![(__CFString *)v12 length])
    {
      v25 = [MEMORY[0x263F08690] currentHandler];
      v26 = objc_msgSend(NSString, "stringWithUTF8String:", "MPIdentifierSet *__MPIdentifierSetWithMPCProtoItem(_MPCProtoItem *__strong, _MPCProtoTracklist *__strong, NSString *__strong)_block_invoke");
      [v25 handleFailureInFunction:v26 file:@"MPRemotePlaybackQueue+MPCAdditions.m" lineNumber:485 description:@"Attempted to decode container identifier set without personID"];
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ____MPIdentifierSetWithMPCProtoItem_block_invoke_3;
    v27[3] = &unk_2643C4960;
    v28 = v6;
    [v3 setPersonalStoreIdentifiersWithPersonID:v12 block:v27];
  }
LABEL_38:
}

void ____MPIdentifierSetWithMPCProtoItem_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  v5 = v4;
  if (!v3 || (uint64_t v6 = *(void *)(v3 + 32)) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v6 = *(void *)(v7 + 40);
      if (!v6) {
        uint64_t v6 = *(void *)(v7 + 24);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  [v4 setAdamID:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 24);
  }
  else {
    uint64_t v9 = 0;
  }
  [v5 setPurchasedAdamID:v9];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 40);
  }
  else {
    uint64_t v11 = 0;
  }
  [v5 setSubscriptionAdamID:v11];
  v12 = *(void **)(a1 + 32);
  if (v12) {
    v12 = (void *)v12[6];
  }
  uint64_t v13 = v12;
  [v5 setUniversalCloudLibraryID:v13];
}

void ____MPIdentifierSetWithMPCProtoItem_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2) {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v3;
  [v3 setCloudID:v4];
}

@end