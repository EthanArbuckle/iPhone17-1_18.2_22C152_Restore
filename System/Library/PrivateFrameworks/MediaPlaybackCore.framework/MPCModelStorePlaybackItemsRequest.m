@interface MPCModelStorePlaybackItemsRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
+ (void)MPC_consumeSiriAssetInfo:(id)a3 playActivityFeatureName:(id)a4 userIdentity:(id)a5 completion:(id)a6;
- (BOOL)allowLocalEquivalencies;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInGroupSession;
- (BOOL)isValid;
- (BOOL)shouldBatchResultsWithPlaceholderObjects;
- (BOOL)useUniversalAccumulator;
- (MPCModelStorePlaybackItemsRequest)init;
- (MPCModelStorePlaybackItemsRequest)initWithCoder:(id)a3;
- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment;
- (MPIdentifierSet)abc_preferredShuffleStartIdentifiers;
- (MPModelResponse)previousResponse;
- (MPSectionedCollection)identifiers;
- (MPSectionedCollection)sectionedModelObjects;
- (NSArray)playbackPrioritizedIndexPaths;
- (NSArray)storeIDs;
- (NSString)abc_siriAssetInfo;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)rtcReportingPlayQueueSourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAbc_preferredShuffleStartIdentifiers:(id)a3;
- (void)setAbc_siriAssetInfo:(id)a3;
- (void)setAllowLocalEquivalencies:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setInGroupSession:(BOOL)a3;
- (void)setPlaybackPrioritizedIndexPaths:(id)a3;
- (void)setPlaybackRequestEnvironment:(id)a3;
- (void)setPreviousResponse:(id)a3;
- (void)setSectionedModelObjects:(id)a3;
- (void)setShouldBatchResultsWithPlaceholderObjects:(BOOL)a3;
- (void)setStoreIDs:(id)a3;
- (void)setUseUniversalAccumulator:(BOOL)a3;
@end

@implementation MPCModelStorePlaybackItemsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abc_preferredShuffleStartIdentifiers, 0);
  objc_storeStrong((id *)&self->_abc_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playbackPrioritizedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionedModelObjects, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);

  objc_storeStrong((id *)&self->_storeIDsAnonymousGroupUUID, 0);
}

- (void)setAbc_preferredShuffleStartIdentifiers:(id)a3
{
}

- (MPIdentifierSet)abc_preferredShuffleStartIdentifiers
{
  return self->_abc_preferredShuffleStartIdentifiers;
}

- (void)setAbc_siriAssetInfo:(id)a3
{
}

- (NSString)abc_siriAssetInfo
{
  return self->_abc_siriAssetInfo;
}

- (void)setPlaybackPrioritizedIndexPaths:(id)a3
{
}

- (NSArray)playbackPrioritizedIndexPaths
{
  return self->_playbackPrioritizedIndexPaths;
}

- (void)setUseUniversalAccumulator:(BOOL)a3
{
  self->_useUniversalAccumulator = a3;
}

- (BOOL)useUniversalAccumulator
{
  return self->_useUniversalAccumulator;
}

- (void)setInGroupSession:(BOOL)a3
{
  self->_inGroupSession = a3;
}

- (BOOL)isInGroupSession
{
  return self->_inGroupSession;
}

- (void)setSectionedModelObjects:(id)a3
{
}

- (MPSectionedCollection)sectionedModelObjects
{
  return self->_sectionedModelObjects;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setAllowLocalEquivalencies:(BOOL)a3
{
  self->_allowLocalEquivalencies = a3;
}

- (BOOL)allowLocalEquivalencies
{
  return self->_allowLocalEquivalencies;
}

- (void)setShouldBatchResultsWithPlaceholderObjects:(BOOL)a3
{
  self->_shouldBatchResultsWithPlaceholderObjects = a3;
}

- (BOOL)shouldBatchResultsWithPlaceholderObjects
{
  return self->_shouldBatchResultsWithPlaceholderObjects;
}

- (void)setPreviousResponse:(id)a3
{
}

- (MPModelResponse)previousResponse
{
  return self->_previousResponse;
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void)setPlaybackRequestEnvironment:(id)a3
{
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (MPSectionedCollection)identifiers
{
  v34[5] = *MEMORY[0x263EF8340];
  v3 = [(MPCModelStorePlaybackItemsRequest *)self playbackRequestEnvironment];
  v4 = [v3 userIdentity];
  v5 = [v4 accountDSID];

  if (self->_storeIDs)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F120D8]);
    id v7 = objc_alloc(MEMORY[0x263F11DB0]);
    v8 = [MEMORY[0x263F11F00] identityKind];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke;
    v31[3] = &unk_2643C0B38;
    v31[4] = self;
    id v9 = v5;
    id v32 = v9;
    v10 = (void *)[v7 initWithSource:@"StorePlaybackItemsRequest" modelKind:v8 block:v31];
    [v6 appendSection:v10];

    storeIDs = self->_storeIDs;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_3;
    v29[3] = &unk_2643C0B60;
    id v30 = v9;
    v12 = [(NSArray *)storeIDs msv_map:v29];
    [v6 appendItems:v12];

    id v13 = objc_alloc(MEMORY[0x263F12180]);
    v33[0] = *MEMORY[0x263F11998];
    v14 = [MEMORY[0x263F12180] emptyPropertySet];
    v34[0] = v14;
    v33[1] = *MEMORY[0x263F119D8];
    v15 = [MEMORY[0x263F12180] emptyPropertySet];
    v34[1] = v15;
    v33[2] = *MEMORY[0x263F11A18];
    v16 = [MEMORY[0x263F12180] emptyPropertySet];
    v34[2] = v16;
    v33[3] = *MEMORY[0x263F119D0];
    v17 = [MEMORY[0x263F12180] emptyPropertySet];
    v34[3] = v17;
    v33[4] = *MEMORY[0x263F11A20];
    v18 = [MEMORY[0x263F12180] emptyPropertySet];
    v34[4] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];
    v20 = (void *)[v13 initWithProperties:MEMORY[0x263EFFA68] relationships:v19];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_6;
    v27[3] = &unk_2643C0B88;
    id v28 = v20;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_7;
    v25[3] = &unk_2643C0BB0;
    id v26 = v28;
    id v21 = v28;
    v22 = [v6 lazyMapWithSections:v27 items:v25];
  }
  else
  {
    sectionedModelObjects = self->_sectionedModelObjects;
    if (sectionedModelObjects)
    {
      v22 = [(MPSectionedCollection *)sectionedModelObjects lazyMapWithSections:&__block_literal_global_132 items:&__block_literal_global_135];
    }
    else
    {
      v22 = 0;
    }
  }

  return (MPSectionedCollection *)v22;
}

void __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [*(id *)(*(void *)(a1 + 32) + 64) UUIDString];
  [v4 setOpaqueID:v3];

  if ([*(id *)(a1 + 40) length]) {
    [v4 setPersonalStoreIdentifiersWithPersonID:*(void *)(a1 + 40) block:&__block_literal_global_8463];
  }
}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263F11DB0]);
  v5 = [MEMORY[0x263F11F10] unknownKind];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_4;
  v9[3] = &unk_2643C0B38;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v6 = v3;
  id v7 = (void *)[v4 initWithSource:@"StorePlaybackItemsRequest" modelKind:v5 block:v9];

  return v7;
}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F12218];
  id v4 = a2;
  v5 = [v3 sharedServerObjectDatabase];
  id v6 = [v5 identifiersMatchingIdentifierSet:v4 propertySet:*(void *)(a1 + 32) options:0];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

id __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F12218];
  id v4 = a2;
  v5 = [v3 sharedServerObjectDatabase];
  id v6 = [v5 identifiersMatchingIdentifierSet:v4 propertySet:*(void *)(a1 + 32) options:0];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

uint64_t __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 identifiers];
}

uint64_t __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 identifiers];
}

void __48__MPCModelStorePlaybackItemsRequest_identifiers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setOpaqueID:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) length]) {
    [v3 setPersonalStoreIdentifiersWithPersonID:*(void *)(a1 + 40) block:&__block_literal_global_124];
  }
}

- (void)setIdentifiers:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F120D8]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke;
  v12[3] = &unk_2643C0B10;
  SEL v15 = a2;
  v12[4] = self;
  id v7 = v6;
  id v13 = v7;
  id v14 = v5;
  id v8 = v5;
  [v8 enumerateSectionsUsingBlock:v12];
  sectionedModelObjects = self->_sectionedModelObjects;
  self->_sectionedModelObjects = (MPSectionedCollection *)v7;
  id v10 = v7;

  storeIDs = self->_storeIDs;
  self->_storeIDs = 0;
}

void __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 modelKind];
  id v7 = (void *)[v6 modelClass];

  if (!v7)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a1[7], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 304, @"Invalid section identifiers [missing section model class] for identifiers: %@", v5 object file lineNumber description];
  }
  if (([v7 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    SEL v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a1[7], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 305, @"Invalid section identifiers [modelKind.modelClass is not a subclass of MPModelObject] for identifiers: %@", v5 object file lineNumber description];
  }
  if (v7 == objc_opt_class())
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a1[7], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 306, @"Invalid section identifiers [modelKind.modelClass cannot be the abstract type MPModelObject] for identifiers: %@", v5 object file lineNumber description];
  }
  id v8 = (void *)[objc_alloc((Class)v7) initWithIdentifiers:v5];
  id v9 = (void *)a1[5];
  id v10 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v8];
  [v9 appendSection:v10];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke_2;
  v17[3] = &unk_2643C0AE8;
  id v11 = (void *)a1[6];
  uint64_t v12 = a1[4];
  id v13 = (void *)a1[5];
  uint64_t v19 = a1[7];
  v17[4] = v12;
  id v18 = v13;
  [v11 enumerateItemsInSectionAtIndex:a3 usingBlock:v17];
}

void __52__MPCModelStorePlaybackItemsRequest_setIdentifiers___block_invoke_2(void *a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 modelKind];
  id v4 = (void *)[v3 modelClass];

  if (!v4)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a1[6], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 312, @"Invalid item identifiers [missing item model class] for identifiers: %@", v11 object file lineNumber description];
  }
  if (([v4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a1[6], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 313, @"Invalid item identifiers [modelKind.modelClass is not a subclass of MPModelObject] for identifiers: %@", v11 object file lineNumber description];
  }
  if (v4 == objc_opt_class())
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a1[6], a1[4], @"MPCModelStorePlaybackItemsRequest.m", 314, @"Invalid item identifiers [modelKind.modelClass cannot be the abstract type MPModelObject] for identifiers: %@", v11 object file lineNumber description];
  }
  id v5 = (void *)[objc_alloc((Class)v4) initWithIdentifiers:v11];
  id v6 = (void *)a1[5];
  id v7 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v5];
  [v6 appendItem:v7];
}

- (BOOL)isValid
{
  return [(NSArray *)self->_storeIDs count]
      || [(MPSectionedCollection *)self->_sectionedModelObjects numberOfSections]
      || [(MPSectionedCollection *)self->_sectionedModelObjects totalItemCount] != 0;
}

- (void)setStoreIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 UUID];
  storeIDsAnonymousGroupUUID = self->_storeIDsAnonymousGroupUUID;
  self->_storeIDsAnonymousGroupUUID = v6;

  id v8 = (NSArray *)[v5 copy];
  storeIDs = self->_storeIDs;
  self->_storeIDs = v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  int allowLocalEquivalencies = self->_allowLocalEquivalencies;
  if (allowLocalEquivalencies == [v4 allowLocalEquivalencies]) {
    goto LABEL_13;
  }
  sectionedModelObjects = self->_sectionedModelObjects;
  id v7 = [v4 sectionedModelObjects];
  if (sectionedModelObjects == v7)
  {
  }
  else
  {
    id v8 = v7;
    int v9 = [(MPSectionedCollection *)sectionedModelObjects isEqual:v7];

    if (!v9) {
      goto LABEL_13;
    }
  }
  storeIDs = self->_storeIDs;
  id v11 = [v4 storeIDs];
  if (storeIDs == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    int v13 = [(NSArray *)storeIDs isEqual:v11];

    if (!v13) {
      goto LABEL_13;
    }
  }
  id v14 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
  SEL v15 = [v4 playbackRequestEnvironment];
  id v16 = [v15 userIdentity];
  if (v14 == v16)
  {

    goto LABEL_16;
  }
  v17 = v16;
  char v18 = [v14 isEqual:v16];

  if (v18)
  {
LABEL_16:
    int inGroupSession = self->_inGroupSession;
    BOOL v19 = inGroupSession == [v4 isInGroupSession];
    goto LABEL_14;
  }
LABEL_13:
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  id v4 = [(MPCModelStorePlaybackItemsRequest *)&v9 copyWithZone:a3];
  id v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 73) = self->_allowLocalEquivalencies;
    objc_storeStrong(v4 + 13, self->_clientIdentifier);
    objc_storeStrong(v5 + 10, self->_playbackRequestEnvironment);
    objc_storeStrong(v5 + 12, self->_previousResponse);
    objc_storeStrong(v5 + 14, self->_sectionedModelObjects);
    objc_storeStrong(v5 + 11, self->_storeIDs);
    objc_storeStrong(v5 + 8, self->_storeIDsAnonymousGroupUUID);
    uint64_t v6 = [(NSArray *)self->_playbackPrioritizedIndexPaths copy];
    id v7 = v5[15];
    v5[15] = (id)v6;

    *((unsigned char *)v5 + 72) = self->_shouldBatchResultsWithPlaceholderObjects;
    *((unsigned char *)v5 + 75) = self->_useUniversalAccumulator;
    objc_storeStrong(v5 + 16, self->_abc_siriAssetInfo);
    objc_storeStrong(v5 + 17, self->_abc_preferredShuffleStartIdentifiers);
    *((unsigned char *)v5 + 74) = self->_inGroupSession;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  [(MPCModelStorePlaybackItemsRequest *)&v14 encodeWithCoder:v4];
  [v4 encodeBool:self->_allowLocalEquivalencies forKey:@"MPCModelStorePlaybackItemsRequestAllowLocalEquivalencies"];
  [v4 encodeObject:self->_clientIdentifier forKey:@"MPCModelStorePlaybackItemsRequestClientIdentifier"];
  [v4 encodeObject:self->_playbackRequestEnvironment forKey:@"MPCModelStorePlaybackItemsRequestPlaybackRequestEnvironment"];
  [v4 encodeObject:self->_storeIDs forKey:@"MPCModelStorePlaybackItemsRequestStoreIDs"];
  [v4 encodeObject:self->_storeIDsAnonymousGroupUUID forKey:@"_MPCModelStorePlaybackItemsRequestCodingKeyStoreIDsUUID"];
  [v4 encodeBool:self->_shouldBatchResultsWithPlaceholderObjects forKey:@"MPCModelStorePlaybackItemsRequestShouldBatchResultsWithPlaceholderObjects"];
  [v4 encodeBool:self->_inGroupSession forKey:@"_MPCModelStorePlaybackItemsRequestCodingKeyInGroupSession"];
  if (self->_sectionedModelObjects)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", 3 * -[MPSectionedCollection numberOfSections](self->_sectionedModelObjects, "numberOfSections"));
    sectionedModelObjects = self->_sectionedModelObjects;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke;
    id v11 = &unk_2643C0AC0;
    id v12 = v5;
    int v13 = self;
    id v7 = v5;
    [(MPSectionedCollection *)sectionedModelObjects enumerateSectionsUsingBlock:&v8];
    objc_msgSend(v4, "encodeObject:forKey:", v7, @"MPCModelStorePlaybackItemsRequestSectionedModelObjects", v8, v9, v10, v11);
  }
}

void __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v5 addObject:v8];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 identifiers];

  [v9 addObject:v10];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", 2 * objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "numberOfItemsInSection:", a3));
  id v12 = *(void **)(*(void *)(a1 + 40) + 112);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke_2;
  v14[3] = &unk_2643C0A98;
  id v15 = v11;
  id v13 = v11;
  [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v14];
  [*(id *)(a1 + 32) addObject:v13];
}

void __53__MPCModelStorePlaybackItemsRequest_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 addObject:v6];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v4 identifiers];

  [v7 addObject:v8];
}

- (MPCModelStorePlaybackItemsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  id v5 = [(MPCModelStorePlaybackItemsRequest *)&v79 initWithCoder:v4];
  if (v5)
  {
    v5->_int allowLocalEquivalencies = [v4 decodeBoolForKey:@"MPCModelStorePlaybackItemsRequestAllowLocalEquivalencies"];
    unint64_t v6 = 0x263F08000uLL;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelStorePlaybackItemsRequestClientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelStorePlaybackItemsRequestPlaybackRequestEnvironment"];
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"MPCModelStorePlaybackItemsRequestStoreIDs"];
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_MPCModelStorePlaybackItemsRequestCodingKeyStoreIDsUUID"];
    storeIDsAnonymousGroupUUID = v5->_storeIDsAnonymousGroupUUID;
    v5->_storeIDsAnonymousGroupUUID = (NSUUID *)v16;

    if (!v5->_storeIDsAnonymousGroupUUID)
    {
      uint64_t v18 = [MEMORY[0x263F08C38] UUID];
      BOOL v19 = v5->_storeIDsAnonymousGroupUUID;
      v5->_storeIDsAnonymousGroupUUID = (NSUUID *)v18;
    }
    v5->_int inGroupSession = [v4 decodeBoolForKey:@"_MPCModelStorePlaybackItemsRequestCodingKeyInGroupSession"];
    if (!v5->_storeIDs)
    {
      v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      v24 = [v4 decodeObjectOfClasses:v23 forKey:@"MPCModelStorePlaybackItemsRequestSectionedModelObjects"];

      if (v24)
      {
        v71 = v5;
        v72 = v4;
        uint64_t v25 = [v24 count];
        id v78 = objc_alloc_init(MEMORY[0x263F120D8]);
        unint64_t v26 = 0x263F11000uLL;
        if (v25 >= 3)
        {
          uint64_t v27 = 0;
          uint64_t v28 = v25 - 2;
          uint64_t v73 = v28;
          v74 = v24;
          while (1)
          {
            v29 = [v24 objectAtIndex:v27];
            if (_NSIsNSString()) {
              id v30 = NSClassFromString(v29);
            }
            else {
              id v30 = 0;
            }
            if (![v30 isSubclassOfClass:objc_opt_class()]) {
              goto LABEL_55;
            }
            v31 = [v24 objectAtIndex:v27 + 1];
            id v32 = [v24 objectAtIndex:v27 + 2];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (_NSIsNSArray()) {
                break;
              }
            }
LABEL_54:

LABEL_55:
            v27 += 3;
            if (v27 >= v28) {
              goto LABEL_59;
            }
          }
          v76 = v31;
          v77 = v29;
          id v33 = v31;
          if (objc_opt_class() == v30)
          {
            v37 = [v33 modelKind];
            v38 = (objc_class *)[v37 modelClass];

            if (v38 != (objc_class *)objc_opt_class()
              && v38 != (objc_class *)objc_opt_class()
              && [(objc_class *)v38 isSubclassOfClass:objc_opt_class()])
            {
              v39 = (void *)[[v38 alloc] initWithIdentifiers:v33];
              uint64_t v40 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v39];
              if (!v40)
              {
                v41 = [MEMORY[0x263F08690] currentHandler];
                v42 = objc_msgSend(*(id *)(v6 + 2880), "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                [v41 handleFailureInFunction:v42, @"MPCModelStorePlaybackItemsRequest.m", 148, @"Failed to create generic object from identifers.modelKind | potentialModelClass=MPModelGenericObject identifierSet=%@", v33 file lineNumber description];
LABEL_58:

                v46 = 0;
                goto LABEL_27;
              }
              goto LABEL_26;
            }
          }
          id v34 = [*(id *)(v26 + 3504) emptyIdentifierSet];
          if (v33 == v34)
          {
          }
          else
          {
            v35 = v34;
            int v36 = [v33 isEqual:v34];

            if (!v36)
            {
LABEL_25:
              v39 = (void *)[objc_alloc((Class)v30) initWithIdentifiers:v33];
              uint64_t v40 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v39];
              if (!v40)
              {
                v41 = [MEMORY[0x263F08690] currentHandler];
                v42 = objc_msgSend(*(id *)(v6 + 2880), "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                id v70 = v33;
                [v41 handleFailureInFunction:v42, @"MPCModelStorePlaybackItemsRequest.m", 162, @"Failed to create generic object from potentialModelClass | potentialModelClass=%@ identifierSet=%@", v30 file lineNumber description];
                goto LABEL_58;
              }
LABEL_26:
              v46 = (void *)v40;
LABEL_27:

              v75 = v46;
              [v78 appendSection:v46];
              uint64_t v47 = [v32 count];
              if (v47 >= 2)
              {
                uint64_t v48 = 0;
                uint64_t v49 = v47 - 1;
                while (2)
                {
                  v50 = [v32 objectAtIndex:v48];
                  if (_NSIsNSString()) {
                    v51 = NSClassFromString(v50);
                  }
                  else {
                    v51 = 0;
                  }
                  if (![v51 isSubclassOfClass:objc_opt_class()]) {
                    goto LABEL_49;
                  }
                  v52 = [v32 objectAtIndex:v48 + 1];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v53 = v52;
                    if (objc_opt_class() == v51)
                    {
                      v57 = [v53 modelKind];
                      v58 = (objc_class *)[v57 modelClass];

                      unint64_t v26 = 0x263F11000;
                      if (v58 != (objc_class *)objc_opt_class()
                        && v58 != (objc_class *)objc_opt_class()
                        && [(objc_class *)v58 isSubclassOfClass:objc_opt_class()])
                      {
                        v59 = (void *)[[v58 alloc] initWithIdentifiers:v53];
                        uint64_t v60 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v59];
                        if (!v60)
                        {
                          v61 = [MEMORY[0x263F08690] currentHandler];
                          v62 = objc_msgSend(NSString, "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                          [v61 handleFailureInFunction:v62, @"MPCModelStorePlaybackItemsRequest.m", 148, @"Failed to create generic object from identifers.modelKind | potentialModelClass=MPModelGenericObject identifierSet=%@", v53, v70 file lineNumber description];
                          goto LABEL_52;
                        }
LABEL_46:
                        v66 = (void *)v60;
                        goto LABEL_47;
                      }
                    }
                    id v54 = [*(id *)(v26 + 3504) emptyIdentifierSet];
                    if (v53 == v54)
                    {
                    }
                    else
                    {
                      v55 = v54;
                      int v56 = [v53 isEqual:v54];

                      if (!v56) {
                        goto LABEL_45;
                      }
                    }
                    v51 = objc_opt_class();
                    id v63 = objc_alloc(MEMORY[0x263F11DB0]);
                    v64 = [MEMORY[0x263F11F00] identityKind];
                    uint64_t v65 = [v63 initWithSource:@"StorePlaybackItemsRequest-DecodedEmpty" modelKind:v64 block:&__block_literal_global_288];

                    id v53 = (id)v65;
LABEL_45:
                    v59 = (void *)[objc_alloc((Class)v51) initWithIdentifiers:v53];
                    uint64_t v60 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v59];
                    if (v60) {
                      goto LABEL_46;
                    }
                    v61 = [MEMORY[0x263F08690] currentHandler];
                    objc_msgSend(NSString, "stringWithUTF8String:", "MPModelGenericObject *_MPCSPIRDecodeGenericObject(__unsafe_unretained Class, MPIdentifierSet *__strong)");
                    v62 = v69 = v51;
                    [v61 handleFailureInFunction:v62, @"MPCModelStorePlaybackItemsRequest.m", 162, @"Failed to create generic object from potentialModelClass | potentialModelClass=%@ identifierSet=%@", v69, v53 file lineNumber description];
LABEL_52:

                    v66 = 0;
LABEL_47:

                    [v78 appendItem:v66];
                    unint64_t v26 = 0x263F11000;
                  }

LABEL_49:
                  v48 += 2;
                  if (v48 >= v49) {
                    break;
                  }
                  continue;
                }
              }

              unint64_t v6 = 0x263F08000;
              uint64_t v28 = v73;
              v24 = v74;
              v31 = v76;
              v29 = v77;
              goto LABEL_54;
            }
          }
          id v30 = objc_opt_class();
          id v43 = objc_alloc(*(Class *)(v26 + 3504));
          v44 = [MEMORY[0x263F11F00] identityKind];
          uint64_t v45 = [v43 initWithSource:@"StorePlaybackItemsRequest-DecodedEmpty" modelKind:v44 block:&__block_literal_global_288];

          id v33 = (id)v45;
          goto LABEL_25;
        }
LABEL_59:
        id v5 = v71;
        sectionedModelObjects = v71->_sectionedModelObjects;
        v71->_sectionedModelObjects = (MPSectionedCollection *)v78;

        id v4 = v72;
        v71->_shouldBatchResultsWithPlaceholderObjects = [v72 decodeBoolForKey:@"MPCModelStorePlaybackItemsRequestShouldBatchResultsWithPlaceholderObjects"];
      }
    }
  }

  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  if ([(MPCModelStorePlaybackItemsRequest *)self useUniversalAccumulator]
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    id v5 = &off_2643BD660;
  }
  else
  {
    id v5 = off_2643BCCA0;
  }
  unint64_t v6 = (void *)[objc_alloc(*v5) initWithRequest:self responseHandler:v4];

  return v6;
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return (NSString *)@"queue-source.catalog";
}

- (NSString)clientIdentifier
{
  if (self->_clientIdentifier) {
    return self->_clientIdentifier;
  }
  else {
    return (NSString *)&stru_26CBCA930;
  }
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  id v3 = [(MPCModelStorePlaybackItemsRequest *)&v17 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  [v4 appendFormat:@" playbackRequestEnvironment=%@", self->_playbackRequestEnvironment];
  if ([(NSArray *)self->_storeIDs count])
  {
    id v5 = [(NSArray *)self->_storeIDs msv_compactDescription];
    [v4 appendFormat:@" storeIDs=[ %@ ]", v5];
  }
  sectionedModelObjects = self->_sectionedModelObjects;
  if (sectionedModelObjects)
  {
    uint64_t v7 = [(MPSectionedCollection *)sectionedModelObjects numberOfSections];
    objc_msgSend(v4, "appendFormat:", @" sectionedModelObjects=[ <%ld sections>\n", v7);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    id v8 = self->_sectionedModelObjects;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__MPCModelStorePlaybackItemsRequest_description__block_invoke;
    v12[3] = &unk_2643C0A70;
    v12[4] = self;
    id v9 = v4;
    id v13 = v9;
    uint64_t v14 = v16;
    uint64_t v15 = v7;
    [(MPSectionedCollection *)v8 enumerateSectionsUsingBlock:v12];
    [v9 appendString:@"]"];

    _Block_object_dispose(v16, 8);
  }
  if (self->_inGroupSession) {
    [v4 appendString:@" inGroupSession=YES"];
  }
  [v4 appendString:@">"];
  id v10 = (void *)[v4 copy];

  return (NSString *)v10;
}

void __48__MPCModelStorePlaybackItemsRequest_description__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 112);
  id v8 = a2;
  uint64_t v9 = [v7 numberOfItemsInSection:a3];
  id v10 = *(void **)(a1 + 40);
  id v11 = [v8 humanDescription];

  [v10 appendFormat:@"  %2ld <%ld items> %@: [\n", a3, v9, v11];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 112);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__MPCModelStorePlaybackItemsRequest_description__block_invoke_2;
  v16[3] = &unk_2643C0A48;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v17 = v13;
  uint64_t v18 = v14;
  uint64_t v19 = a3;
  uint64_t v20 = v9;
  [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v16];
  [*(id *)(a1 + 40) appendString:@"]\n"];
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 51)
  {
    *a4 = 1;
    uint64_t v15 = *(void *)(a1 + 56);
    if (a3 + 1 != v15) {
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"  ... (%ld remaining sections)\n", v15 - a3);
    }
  }
}

void __48__MPCModelStorePlaybackItemsRequest_description__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = [a2 humanDescription];
  [v7 appendFormat:@"  %2ld,%2ld %@\n", v8, a3, v9];

  if ((uint64_t)++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 51)
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"    ... (%ld remaining items)\n", *(void *)(a1 + 56) - a3);
  }
}

- (MPCModelStorePlaybackItemsRequest)init
{
  v20[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)MPCModelStorePlaybackItemsRequest;
  v2 = [(MPCModelStorePlaybackItemsRequest *)&v17 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F12028] kindWithVariants:3];
    id v4 = [MEMORY[0x263F11E80] kindWithSongKind:v3];
    id v5 = (void *)MEMORY[0x263F11FA0];
    v20[0] = v3;
    unint64_t v6 = [MEMORY[0x263F12078] kindWithVariants:3];
    v20[1] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v8 = [v5 kindWithKinds:v7];

    uint64_t v9 = [MEMORY[0x263F11F98] kindWithVariants:31 playlistEntryKind:v8 options:0];
    id v10 = (void *)MEMORY[0x263F11EE0];
    uint64_t v11 = *MEMORY[0x263F119D8];
    v18[0] = *MEMORY[0x263F11998];
    v18[1] = v11;
    v19[0] = v4;
    v19[1] = v9;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v13 = [v10 kindWithRelationshipKinds:v12];

    [(MPCModelStorePlaybackItemsRequest *)v2 setItemKind:v13];
    [(MPCModelStorePlaybackItemsRequest *)v2 setSectionKind:v13];
    uint64_t v14 = objc_alloc_init(MPCPlaybackRequestEnvironment);
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = v14;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)requiresNetwork
{
  return 1;
}

+ (void)MPC_consumeSiriAssetInfo:(id)a3 playActivityFeatureName:(id)a4 userIdentity:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  if ([v8 length])
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info present, starting URL bag load...", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x263F89360]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke;
    void v20[3] = &unk_2643C3820;
    id v13 = v9;
    id v21 = v13;
    uint64_t v14 = (void *)[v12 initWithBlock:v20];
    uint64_t v15 = [MEMORY[0x263F893A0] sharedBagProvider];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_2;
    v16[3] = &unk_2643C3870;
    id v19 = v10;
    id v17 = v8;
    id v18 = v13;
    [v15 getBagForRequestContext:v14 withCompletionHandler:v16];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  [v3 setAllowsExpiredBags:1];
}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_3;
  block[3] = &unk_2643C3848;
  id v11 = v5;
  id v12 = v6;
  id v15 = a1[6];
  id v13 = a1[4];
  id v14 = a1[5];
  id v7 = v6;
  id v8 = v5;
  id v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  v9[2]();
}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Successfully loaded URL bag for Siri asset info, loading identity properties...", buf, 2u);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_9;
    v11[3] = &unk_2643C3D38;
    id v12 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 32);
    id v5 = (void (**)(dispatch_block_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v11);
    v5[2](v5, v6, v7, v8);
  }
  else
  {
    if (v4)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v9;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Failed to load URL bag for Siri asset info due to error: %{public}@", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
}

void __136__MPCModelStorePlaybackItemsRequest_MPCSiriPlaybackAdditions__MPC_consumeSiriAssetInfo_playActivityFeatureName_userIdentity_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F08900];
  id v3 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  BOOL v4 = [v2 JSONObjectWithData:v3 options:0 error:0];

  if (_NSIsNSDictionary())
  {
    id v5 = [v4 valueForKeyPath:@"meta.api"];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 valueForKeyPath:@"format.resources"];
      if (_NSIsNSString()
        && ([v7 isEqualToString:@"map"] & 1) != 0)
      {
        int v8 = 0;
        int v9 = 1;
        goto LABEL_16;
      }
      id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Found metadata dictionary (%{public}@), but unexpected format", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v14 = *(void *)(a1 + 56);
      if (v14)
      {
        (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
LABEL_83:

        goto LABEL_84;
      }
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Could not find metadata dictionary in the payload. Will default to store platform response", (uint8_t *)&buf, 2u);
      }
    }
    int v9 = 0;
    int v8 = 1;
LABEL_16:

    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v9;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info has payload type=%d.", (uint8_t *)&buf, 8u);
    }

    if (!v8)
    {
      uint64_t v25 = (void *)MEMORY[0x263EFF9A0];
      id v26 = v4;
      uint64_t v7 = [v25 dictionary];
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F12220]) initWithPayload:v26];

      uint64_t v28 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
      id v65 = 0;
      v29 = [v28 importObjectsFromRequest:v27 options:0 error:&v65];
      id v30 = v65;

      if (!v29 || v30)
      {
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v30;
          _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, "Failed to import payload - error=%{public}@.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        v31 = [v29 playableAssetIdentifiers];
        [v7 setObject:v31 forKeyedSubscript:@"MPCSiriPlaybackAdditionsMetadataOrderedPlayableAssetIdentifiersKey"];
      }

      int v36 = [v7 objectForKeyedSubscript:@"MPCSiriPlaybackAdditionsMetadataOrderedPlayableAssetIdentifiersKey"];
      uint64_t v37 = [v36 count];
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v37;
        _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "Siri asset info contains %lu assets.", (uint8_t *)&buf, 0xCu);
      }

      if (v37 < 1)
      {
        uint64_t v40 = 0;
      }
      else
      {
        if (v37 == 2)
        {
          uint64_t v39 = [v36 lastObject];
        }
        else
        {
          if (v37 == 1) {
            [v36 firstObject];
          }
          else {
          uint64_t v39 = [v36 objectAtIndex:arc4random() % (unint64_t)v37];
          }
        }
        uint64_t v40 = (void *)v39;
        if (v39)
        {
          v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v40;
            _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "Siri asset info resulting in preferred shuffled starting with identifier=%{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
      }

      goto LABEL_80;
    }
    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v17 = *(void **)(a1 + 48);
    id v18 = v4;
    id v19 = v16;
    id v20 = v17;
    id v21 = [v18 objectForKey:@"results"];
    if (_NSIsNSDictionary())
    {
      if ([v21 count])
      {
        uint64_t v71 = 0;
        v72 = &v71;
        uint64_t v73 = 0x2020000000;
        uint64_t v74 = 0;
        v66 = &v65;
        uint64_t v67 = 0x3032000000;
        v68 = __Block_byref_object_copy__22874;
        v69 = __Block_byref_object_dispose__22875;
        id v70 = 0;
        uint64_t v22 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", 28800.0, 0);
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        id v78 = ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke;
        objc_super v79 = &unk_2643C38B8;
        id v80 = v19;
        id v81 = v20;
        v83 = &v71;
        id v23 = v22;
        id v82 = v23;
        v84 = &v65;
        [v21 enumerateKeysAndObjectsUsingBlock:&buf];
        if (v66[5])
        {
          v75[0] = @"MPCSiriPlaybackAdditionsMetadataCountFromResponseKey";
          v24 = [NSNumber numberWithInteger:v72[3]];
          v75[1] = @"MPCSiriPlaybackAdditionsMetadataOrderedPlaybackCacheRequestsKey";
          v76[0] = v24;
          v76[1] = v66[5];
          [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
        }
        else
        {
          v75[0] = @"MPCSiriPlaybackAdditionsMetadataCountFromResponseKey";
          v24 = [NSNumber numberWithInteger:v72[3]];
          v76[0] = v24;
          [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:1];
        uint64_t v45 = };

        os_log_t v33 = v45;
        _Block_object_dispose(&v65, 8);

        _Block_object_dispose(&v71, 8);
        os_log_t v46 = v33;
LABEL_56:

        uint64_t v7 = v46;
        uint64_t v47 = [v7 objectForKeyedSubscript:@"MPCSiriPlaybackAdditionsMetadataCountFromResponseKey"];
        uint64_t v48 = [v47 unsignedIntegerValue];

        uint64_t v49 = [v7 objectForKeyedSubscript:@"MPCSiriPlaybackAdditionsMetadataOrderedPlaybackCacheRequestsKey"];

        v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v51 = v50;
        if (v48)
        {
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v48;
            v52 = "[MPCModelStorePlaybackItemsRequest] Siri asset info contains %lu metadata entities.";
            id v53 = v51;
            os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
            uint32_t v55 = 12;
LABEL_61:
            _os_log_impl(&dword_21BB87000, v53, v54, v52, (uint8_t *)&buf, v55);
          }
        }
        else if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          v52 = "[MPCModelStorePlaybackItemsRequest] Siri asset info contained no metadata.";
          id v53 = v51;
          os_log_type_t v54 = OS_LOG_TYPE_ERROR;
          uint32_t v55 = 2;
          goto LABEL_61;
        }

        unint64_t v56 = [v49 count];
        v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v58 = v57;
        if (v56)
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v56;
            _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info contains %lu assets.", (uint8_t *)&buf, 0xCu);
          }

          if (v56 == 2)
          {
            uint64_t v59 = [v49 lastObject];
          }
          else
          {
            if (v56 == 1) {
              [v49 firstObject];
            }
            else {
            uint64_t v59 = [v49 objectAtIndex:arc4random() % v56];
            }
          }
          uint64_t v60 = (void *)v59;
        }
        else
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info contained no assets.", (uint8_t *)&buf, 2u);
          }

          uint64_t v60 = 0;
        }
        uint64_t v40 = (void *)[v60 storeSubscriptionAdamID];
        if (v40)
        {
          v61 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v40;
            _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info resulting in preferred shuffled starting subscription adam ID %llu", (uint8_t *)&buf, 0xCu);
          }

          id v62 = objc_alloc(MEMORY[0x263F11DB0]);
          id v63 = [MEMORY[0x263F12030] identityKind];
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          id v78 = ___MPCPreferredShuffleIdentifierSetFromStorePlatformPayload_block_invoke;
          objc_super v79 = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
          id v80 = v40;
          uint64_t v40 = (void *)[v62 initWithSource:@"MPCAssistant" modelKind:v63 block:&buf];
        }
LABEL_80:
        uint64_t v64 = *(void *)(a1 + 56);
        if (v64) {
          (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v40);
        }

        goto LABEL_83;
      }
      os_log_t v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        v42 = "Siri asset info has results dictionary key, but no objects inside.";
        id v43 = v33;
        uint32_t v44 = 2;
LABEL_54:
        _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&buf, v44);
      }
    }
    else
    {
      os_log_t v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        if (!v21)
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = 0;
          v42 = "Siri asset info expected to have results dictionary, found %{public}@ instead.";
          id v43 = v33;
          uint32_t v44 = 12;
          goto LABEL_54;
        }
        id v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_ERROR, "Siri asset info expected to have results dictionary, found %{public}@ instead.", (uint8_t *)&buf, 0xCu);
      }
    }
    os_log_t v46 = 0;
    goto LABEL_56;
  }
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    if (v4)
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info expected to be dictionary, was another type: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    else
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info expected to be dictionary, was another type: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v32 = *(void *)(a1 + 56);
  if (v32) {
    (*(void (**)(uint64_t, void))(v32 + 16))(v32, 0);
  }
LABEL_84:
}

@end