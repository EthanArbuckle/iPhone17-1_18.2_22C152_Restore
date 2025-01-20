@interface MPCModelRadioPersonalizationRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
- (BOOL)analyticsSignpostsEnabled;
- (MPCModelRadioPersonalizationRequest)init;
- (MPCModelRadioPersonalizationRequest)initWithRadioStationTracks:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setAnalyticsSignpostsEnabled:(BOOL)a3;
@end

@implementation MPCModelRadioPersonalizationRequest

- (void).cxx_destruct
{
}

- (void)setAnalyticsSignpostsEnabled:(BOOL)a3
{
  self->_analyticsSignpostsEnabled = a3;
}

- (BOOL)analyticsSignpostsEnabled
{
  return self->_analyticsSignpostsEnabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioPersonalizationRequest;
  v5 = -[MPCModelRadioPersonalizationRequest copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(MPSectionedCollection *)self->_radioStationTracks copyWithZone:a3];
    v7 = (void *)v5[8];
    v5[8] = v6;
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if ([(MPCModelRadioPersonalizationRequest *)self analyticsSignpostsEnabled])
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ModelRadioPersonalizationRequest", "", buf, 2u);
    }
  }
  objc_super v9 = (void *)[(MPCModelRadioPersonalizationRequest *)self copy];
  id v10 = objc_alloc(MEMORY[0x263F11D48]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke;
  v14[3] = &unk_2643C6908;
  v14[4] = v9;
  v14[5] = self;
  id v15 = v4;
  os_signpost_id_t v16 = v6;
  id v11 = v4;
  v12 = (void *)[v10 initWithStartHandler:v14];

  return v12;
}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) itemKind];
  v5 = (void *)[v4 modelClass];

  os_signpost_id_t v6 = [*(id *)(a1 + 32) itemProperties];
  if (v5)
  {
    v7 = [v5 requiredStoreLibraryPersonalizationProperties];
    uint64_t v8 = [v6 propertySetByCombiningWithPropertySet:v7];

    os_signpost_id_t v6 = (void *)v8;
  }
  objc_super v9 = [[MPCModelRadioStationTrackGenericObjectBuilder alloc] initWithRequestedProperties:v6];
  id v10 = (void *)MEMORY[0x263F08760];
  id v11 = *(id *)(*(void *)(a1 + 32) + 64);
  v12 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "totalItemCount"));
  id v13 = objc_alloc_init(MEMORY[0x263F120D8]);
  id v14 = objc_alloc_init(MEMORY[0x263F120D8]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_2;
  v26[3] = &unk_2643C19C8;
  v26[4] = v13;
  v26[5] = v14;
  v26[6] = v11;
  id v27 = v12;
  v28 = v9;
  id v15 = v3;
  id v29 = v15;
  id v16 = v12;
  [v11 enumerateSectionsUsingBlock:v26];
  v17 = (void *)[objc_alloc(MEMORY[0x263F122B0]) initWithUnpersonalizedRequest:*(void *)(a1 + 32) unpersonalizedContentDescriptors:v13];
  [v17 setRepresentedObjects:v14];
  [v17 setMatchAlbumArtistsOnNameAndStoreID:0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_6;
  v21[3] = &unk_2643C19F0;
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  id v24 = v18;
  uint64_t v25 = v19;
  int8x16_t v22 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  id v23 = v15;
  id v20 = v15;
  [v17 performWithResponseHandler:v21];
}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) appendSection:v5];
  [*(id *)(a1 + 40) appendSection:v5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_3;
  v11[3] = &unk_2643C19A0;
  os_signpost_id_t v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  objc_super v9 = *(void **)(a1 + 72);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v5;
  id v15 = v9;
  long long v16 = *(_OWORD *)(a1 + 32);
  id v10 = v5;
  [v6 enumerateItemsInSectionAtIndex:a3 usingBlock:v11];
}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[MPCModelRadioPersonalizationResponse alloc] initWithRequest:*(void *)(a1 + 40) personalizationResponse:v5];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if ([*(id *)(a1 + 32) analyticsSignpostsEnabled])
    {
      uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      objc_super v9 = v8;
      os_signpost_id_t v10 = *(void *)(a1 + 64);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        LOWORD(v13) = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ModelRadioPersonalizationRequest", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([*(id *)(a1 + 32) analyticsSignpostsEnabled])
  {
    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    id v7 = (MPCModelRadioPersonalizationResponse *)v11;
    os_signpost_id_t v12 = *(void *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      int v13 = 138543362;
      id v14 = v6;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, &v7->super.super, OS_SIGNPOST_INTERVAL_END, v12, "ModelRadioPersonalizationRequest", "error=%{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_12:
  [*(id *)(a1 + 48) finishWithError:v6];
}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 storeAdamID];
  id v5 = objc_alloc(MEMORY[0x263F11DB0]);
  id v6 = [MEMORY[0x263F12030] identityKind];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_4;
  v15[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
  v15[4] = v4;
  id v7 = (void *)[v5 initWithSource:@"RadioPersonalization" modelKind:v6 block:v15];

  uint64_t v8 = MPContainerUniqueIDPrefix();
  objc_super v9 = MEMORY[0x21D49CC00](v8, [*(id *)(a1 + 32) countForObject:v8]);
  [*(id *)(a1 + 32) addObject:v8];
  os_signpost_id_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 48) containsVideo];
  os_signpost_id_t v12 = [*(id *)(a1 + 56) userIdentity];
  int v13 = [v10 genericObjectForRadioStationTrack:v3 radioStationContainsVideo:v11 containerUniqueID:v9 userIdentity:v12];

  if (v13)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F122A8]) initWithModel:v13 personalizationStyle:1];
    [*(id *)(a1 + 64) appendItem:v14];
    [*(id *)(a1 + 72) appendItem:v3];
  }
}

uint64_t __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_5;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

uint64_t __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setSubscriptionAdamID:*(void *)(a1 + 32)];
}

- (MPCModelRadioPersonalizationRequest)initWithRadioStationTracks:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPCModelRadioPersonalizationRequest;
  id v5 = [(MPCModelRadioPersonalizationRequest *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    radioStationTracks = v5->_radioStationTracks;
    v5->_radioStationTracks = (MPSectionedCollection *)v6;

    uint64_t v8 = [MEMORY[0x263F12028] kindWithVariants:3];
    objc_super v9 = (void *)MEMORY[0x263F11EE0];
    uint64_t v15 = *MEMORY[0x263F11A18];
    v16[0] = v8;
    os_signpost_id_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v11 = [v9 kindWithRelationshipKinds:v10];
    [(MPCModelRadioPersonalizationRequest *)v5 setItemKind:v11];

    os_signpost_id_t v12 = [MEMORY[0x263F11FE0] identityKind];
    [(MPCModelRadioPersonalizationRequest *)v5 setSectionKind:v12];
  }
  return v5;
}

- (MPCModelRadioPersonalizationRequest)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F12200]);
  id v4 = [(MPCModelRadioPersonalizationRequest *)self initWithRadioStationTracks:v3];

  return v4;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end