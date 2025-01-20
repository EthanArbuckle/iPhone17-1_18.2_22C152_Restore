@interface MPCModelRadioStationBuilder
- (MPCModelRadioStationBuilder)initWithRequestedProperties:(id)a3;
- (MPPropertySet)requestedProperties;
- (id)modelRadioStationForMetadata:(id)a3 userIdentity:(id)a4;
@end

@implementation MPCModelRadioStationBuilder

- (void).cxx_destruct
{
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (id)modelRadioStationForMetadata:(id)a3 userIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned char *)&self->_requestedRadioStationProperties & 1) == 0)
  {
    v8 = [(MPCModelRadioStationBuilder *)self requestedProperties];
    v9 = [v8 properties];
    if ([v9 containsObject:*MEMORY[0x263F11728]]) {
      char v10 = 2;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_requestedRadioStationProperties = *(unsigned char *)&self->_requestedRadioStationProperties & 0xFD | v10;
    if ([v9 containsObject:*MEMORY[0x263F11770]]) {
      char v11 = 4;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_requestedRadioStationProperties = *(unsigned char *)&self->_requestedRadioStationProperties & 0xFB | v11;
    if ([v9 containsObject:*MEMORY[0x263F11730]]) {
      char v12 = 8;
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)&self->_requestedRadioStationProperties = *(unsigned char *)&self->_requestedRadioStationProperties & 0xF7 | v12;
    if ([v9 containsObject:*MEMORY[0x263F11788]]) {
      char v13 = 16;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&self->_requestedRadioStationProperties = *(unsigned char *)&self->_requestedRadioStationProperties & 0xEF | v13;
    self->_requestedRadioStationProperties.explicit = [v9 containsObject:*MEMORY[0x263F11768]];
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xFE | [v9 containsObject:*MEMORY[0x263F11718]];
    if ([v9 containsObject:*MEMORY[0x263F11710]]) {
      char v14 = 2;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xFD | v14;
    if ([v9 containsObject:*MEMORY[0x263F11720]]) {
      char v15 = 4;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xFB | v15;
    if ([v9 containsObject:*MEMORY[0x263F117A0]]) {
      char v16 = 8;
    }
    else {
      char v16 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xF7 | v16;
    if ([v9 containsObject:*MEMORY[0x263F11798]]) {
      char v17 = 16;
    }
    else {
      char v17 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xEF | v17;
    if ([v9 containsObject:*MEMORY[0x263F11790]]) {
      char v18 = 32;
    }
    else {
      char v18 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xDF | v18;
    if ([v9 containsObject:*MEMORY[0x263F11780]]) {
      char v19 = 64;
    }
    else {
      char v19 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = *((unsigned char *)&self->_requestedRadioStationProperties + 8) & 0xBF | v19;
    if ([v9 containsObject:*MEMORY[0x263F11778]]) {
      char v20 = 0x80;
    }
    else {
      char v20 = 0;
    }
    *((unsigned char *)&self->_requestedRadioStationProperties + 8) = v20 & 0x80 | *((unsigned char *)&self->_requestedRadioStationProperties
                                                                           + 8) & 0x7F;
    *(unsigned char *)&self->_requestedRadioStationProperties |= 1u;
  }
  v21 = [v6 stationStringID];
  v22 = [v6 stationHash];
  uint64_t v23 = [v6 stationID];
  if ([v21 length] || objc_msgSend(v22, "length") | v23)
  {
    id v24 = objc_alloc(MEMORY[0x263F11FD8]);
    id v25 = objc_alloc(MEMORY[0x263F11DB0]);
    v26 = [MEMORY[0x263F11FE0] identityKind];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke;
    v32[3] = &unk_2643C0480;
    id v33 = v7;
    id v34 = v21;
    id v35 = v22;
    uint64_t v36 = v23;
    v27 = (void *)[v25 initWithSource:@"StorePlatform" modelKind:v26 block:v32];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_4;
    v30[3] = &unk_2643C04D0;
    v30[4] = self;
    id v31 = v6;
    v28 = (void *)[v24 initWithIdentifiers:v27 block:v30];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 accountDSID];
  [v4 setPersonalStoreIdentifiersWithPersonID:v5 block:&__block_literal_global_6141];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_3;
  v8[3] = &unk_2643C0458;
  id v9 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v10 = v6;
  uint64_t v11 = v7;
  [v4 setRadioIdentifiersWithBlock:v8];
}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(v5 + 8);
  if ((v6 & 2) != 0)
  {
    [v3 setBeats1:0];
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(unsigned char *)(v5 + 8);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)(v5 + 8) & 4) == 0)
  {
    goto LABEL_3;
  }
  id v9 = [*(id *)(a1 + 40) name];
  [v4 setName:v9];

  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(v5 + 8);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  id v10 = [*(id *)(a1 + 40) descriptionText];
  [v4 setEditorNotes:v10];

  uint64_t v5 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v5 + 8) & 0x10) != 0)
  {
LABEL_5:
    uint64_t v7 = [*(id *)(a1 + 40) descriptionText];
    [v4 setShortEditorNotes:v7];

    uint64_t v5 = *(void *)(a1 + 32);
  }
LABEL_6:
  if (*(_DWORD *)(v5 + 12))
  {
    [v4 setHasExplicitContent:0];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  char v8 = *(unsigned char *)(v5 + 16);
  if (v8)
  {
    uint64_t v11 = [*(id *)(a1 + 40) artworkInfo];
    char v12 = [v11 responseDictionary];
    char v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      char v15 = [v11 responseArray];
      char v16 = v15;
      if (v15)
      {
        id v14 = v15;
      }
      else
      {
        char v17 = [v11 artworkURL];
        id v14 = [v17 absoluteString];
      }
    }

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_5;
    v28[3] = &unk_2643C04A8;
    id v29 = v14;
    id v18 = v14;
    [v4 setArtworkCatalogBlock:v28];

    uint64_t v5 = *(void *)(a1 + 32);
    char v8 = *(unsigned char *)(v5 + 16);
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(v5 + 16) & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "setAllowsItemLiking:", objc_msgSend(*(id *)(a1 + 40), "allowsItemLiking"));
  uint64_t v5 = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(v5 + 16);
  if ((v8 & 4) == 0)
  {
LABEL_11:
    if ((v8 & 8) == 0) {
      goto LABEL_30;
    }
LABEL_26:
    unint64_t v20 = [*(id *)(a1 + 40) type] - 1;
    if (v20 > 9) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = qword_21BEF1828[v20];
    }
    [v4 setType:v21];
    uint64_t v5 = *(void *)(a1 + 32);
    goto LABEL_30;
  }
LABEL_25:
  char v19 = [*(id *)(a1 + 40) attributionLabel];
  [v4 setAttributionLabel:v19];

  uint64_t v5 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v5 + 16) & 8) != 0) {
    goto LABEL_26;
  }
LABEL_30:
  if ((*(unsigned char *)(v5 + 16) & 0x10) != 0)
  {
    unint64_t v22 = [*(id *)(a1 + 40) subtype];
    if (v22 <= 2) {
      [v4 setSubtype:v22];
    }
  }
  char v23 = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  if ((v23 & 0x20) == 0)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 16) & 0x40) == 0) {
      goto LABEL_35;
    }
LABEL_38:
    id v24 = [*(id *)(a1 + 40) providerResource];
    id v25 = [v24 url];
    [v4 setProviderUniversalLink:v25];

    if ((*(unsigned char *)(*(void *)(a1 + 32) + 16) & 0x80) == 0) {
      goto LABEL_36;
    }
LABEL_39:
    v26 = [*(id *)(a1 + 40) providerResource];
    v27 = [v26 bundleIdentifier];
    [v4 setProviderBundleIdentifier:v27];

    goto LABEL_36;
  }
  objc_msgSend(v4, "setSubscriptionRequired:", objc_msgSend(*(id *)(a1 + 40), "isSubscriptionRequired"));
  char v23 = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  if ((v23 & 0x40) != 0) {
    goto LABEL_38;
  }
LABEL_35:
  if (v23 < 0) {
    goto LABEL_39;
  }
LABEL_36:
  objc_msgSend(v4, "setContainsVideo:", objc_msgSend(*(id *)(a1 + 40), "containsVideo"));
}

id __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_5(uint64_t a1)
{
  v1 = [MEMORY[0x263F12290] artworkRequestTokenForStorePlatformArtworkValue:*(void *)(a1 + 32)];
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x263F11D30]);
    id v3 = [MEMORY[0x263F12250] sharedStoreArtworkDataSource];
    id v4 = (void *)[v2 initWithToken:v1 dataSource:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setStationStringID:v3];
  [v4 setStationHash:a1[5]];
  [v4 setStationID:a1[6]];
}

- (MPCModelRadioStationBuilder)initWithRequestedProperties:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioStationBuilder;
  uint64_t v5 = [(MPCModelRadioStationBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;
  }
  return v5;
}

@end