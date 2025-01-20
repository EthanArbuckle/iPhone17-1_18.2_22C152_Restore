@interface MPIdentifierSetWithMPCProtoContainer
@end

@implementation MPIdentifierSetWithMPCProtoContainer

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke(uint64_t a1, void *a2)
{
  v44[0] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[2];
  }
  v5 = v4;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_2;
  v37[3] = &unk_2643C4988;
  v6 = v5;
  id v38 = v6;
  [v3 setUniversalStoreIdentifiersWithBlock:v37];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_3;
  v35[3] = &unk_2643C49B0;
  v7 = v6;
  id v36 = v7;
  [v3 setRadioIdentifiersWithBlock:v35];
  if (v7) {
    uint64_t v8 = v7[2];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(id *)(a1 + 40);
  v10 = v9;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  if (v9) {
    v11 = (void *)*((void *)v9 + 1);
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  v13 = (__CFString *)[v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v40;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v15);
        if (v16)
        {
          if (*(void *)(v16 + 40) == v8)
          {
            uint64_t v8 = *(void *)(v16 + 32);
LABEL_21:
            v18 = (char *)v44 + 1;
            uint64_t quot = v8;
            do
            {
              lldiv_t v20 = lldiv(quot, 10);
              uint64_t quot = v20.quot;
              if (v20.rem >= 0) {
                LOBYTE(v21) = v20.rem;
              }
              else {
                uint64_t v21 = -v20.rem;
              }
              *(v18 - 2) = v21 + 48;
              v22 = (const UInt8 *)(v18 - 2);
              --v18;
            }
            while (v20.quot);
            if (v8 < 0)
            {
              *(v18 - 2) = 45;
              v22 = (const UInt8 *)(v18 - 2);
            }
            v13 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)v44 - (char *)v22, 0x8000100u, 0);
            goto LABEL_29;
          }
        }
        else if (!v8)
        {
          goto LABEL_21;
        }
        v15 = (__CFString *)((char *)v15 + 1);
      }
      while (v13 != v15);
      uint64_t v17 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
      v13 = (__CFString *)v17;
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  v23 = (__CFString *)*(id *)(a1 + 48);
  if (v13 == v23)
  {
  }
  else
  {
    v24 = v23;
    int v25 = [(__CFString *)v13 isEqual:v23];

    if (!v25) {
      goto LABEL_42;
    }
  }
  if (v7) {
    v26 = (void *)v7[4];
  }
  else {
    v26 = 0;
  }
  id v27 = v26;
  if ([v27 length])
  {

LABEL_39:
    if (![(__CFString *)v13 length])
    {
      v31 = [MEMORY[0x263F08690] currentHandler];
      v32 = objc_msgSend(NSString, "stringWithUTF8String:", "MPIdentifierSet *__MPIdentifierSetWithMPCProtoContainer(_MPCProtoContainer *__strong, _MPCProtoTracklist *__strong, NSString *__strong)_block_invoke");
      [v31 handleFailureInFunction:v32 file:@"MPRemotePlaybackQueue+MPCAdditions.m" lineNumber:452 description:@"Attempted to decode container identifier set without personID"];
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = ____MPIdentifierSetWithMPCProtoContainer_block_invoke_4;
    v33[3] = &unk_2643C4960;
    v34 = v7;
    [v3 setPersonalStoreIdentifiersWithPersonID:v13 block:v33];

LABEL_42:
    if (v7) {
      goto LABEL_43;
    }
LABEL_49:
    v29 = 0;
    goto LABEL_44;
  }
  if (!v7)
  {

    goto LABEL_49;
  }
  uint64_t v28 = v7[1];

  if (v28) {
    goto LABEL_39;
  }
LABEL_43:
  v29 = (void *)v7[8];
LABEL_44:
  id v30 = v29;
  [v3 setVersionHash:v30];
}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  if (v3) {
    v5 = *(void **)(v3 + 56);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [v4 setGlobalPlaylistID:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 24);
  }
  else {
    uint64_t v8 = 0;
  }
  [v4 setAdamID:v8];
  id v9 = *(void **)(a1 + 32);
  if (v9) {
    id v9 = (void *)v9[5];
  }
  v10 = v9;
  [v4 setUniversalCloudLibraryID:v10];
}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2) {
    id v4 = *(void **)(v2 + 48);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  [v3 setStationStringID:v5];
}

void ____MPIdentifierSetWithMPCProtoContainer_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = a2;
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  [v8 setCloudAlbumID:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  [v8 setCloudID:v7];
}

@end