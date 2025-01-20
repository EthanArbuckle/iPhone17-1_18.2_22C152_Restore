@interface CEMNetworkContentCachingDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowPersonalCaching:(id)a4 withAllowSharedCaching:(id)a5 withAutoActivation:(id)a6 withCacheLimit:(id)a7 withDataPath:(id)a8 withDenyActivation:(id)a9 withDenyTetheredCaching:(id)a10 withListenRanges:(id)a11 withListenRangesOnly:(id)a12 withListenWithPeersAndParents:(id)a13 withLocalSubnetsOnly:(id)a14 withLogClientIdentity:(id)a15 withParents:(id)a16 withParentSelectionPolicy:(id)a17 withPeerFilterRanges:(id)a18 withPeerListenRanges:(id)a19 withPeerLocalSubnetsOnly:(id)a20 withPort:(id)a21 withPublicRanges:(id)a22;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadListenRanges;
- (NSArray)payloadParents;
- (NSArray)payloadPeerFilterRanges;
- (NSArray)payloadPeerListenRanges;
- (NSArray)payloadPublicRanges;
- (NSNumber)payloadAllowPersonalCaching;
- (NSNumber)payloadAllowSharedCaching;
- (NSNumber)payloadAutoActivation;
- (NSNumber)payloadCacheLimit;
- (NSNumber)payloadDenyActivation;
- (NSNumber)payloadDenyTetheredCaching;
- (NSNumber)payloadListenRangesOnly;
- (NSNumber)payloadListenWithPeersAndParents;
- (NSNumber)payloadLocalSubnetsOnly;
- (NSNumber)payloadLogClientIdentity;
- (NSNumber)payloadPeerLocalSubnetsOnly;
- (NSNumber)payloadPort;
- (NSString)payloadDataPath;
- (NSString)payloadParentSelectionPolicy;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowPersonalCaching:(id)a3;
- (void)setPayloadAllowSharedCaching:(id)a3;
- (void)setPayloadAutoActivation:(id)a3;
- (void)setPayloadCacheLimit:(id)a3;
- (void)setPayloadDataPath:(id)a3;
- (void)setPayloadDenyActivation:(id)a3;
- (void)setPayloadDenyTetheredCaching:(id)a3;
- (void)setPayloadListenRanges:(id)a3;
- (void)setPayloadListenRangesOnly:(id)a3;
- (void)setPayloadListenWithPeersAndParents:(id)a3;
- (void)setPayloadLocalSubnetsOnly:(id)a3;
- (void)setPayloadLogClientIdentity:(id)a3;
- (void)setPayloadParentSelectionPolicy:(id)a3;
- (void)setPayloadParents:(id)a3;
- (void)setPayloadPeerFilterRanges:(id)a3;
- (void)setPayloadPeerListenRanges:(id)a3;
- (void)setPayloadPeerLocalSubnetsOnly:(id)a3;
- (void)setPayloadPort:(id)a3;
- (void)setPayloadPublicRanges:(id)a3;
@end

@implementation CEMNetworkContentCachingDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.contentcaching";
}

+ (id)profileType
{
  return @"com.apple.AssetCache.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[19] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"AllowPersonalCaching";
  v6[1] = @"AllowSharedCaching";
  v6[2] = @"AutoActivation";
  v6[3] = @"CacheLimit";
  v6[4] = @"DataPath";
  v6[5] = @"DenyActivation";
  v6[6] = @"DenyTetheredCaching";
  v6[7] = @"ListenRanges";
  v6[8] = @"ListenRangesOnly";
  v6[9] = @"ListenWithPeersAndParents";
  v6[10] = @"LocalSubnetsOnly";
  v6[11] = @"LogClientIdentity";
  v6[12] = @"Parents";
  v6[13] = @"ParentSelectionPolicy";
  v6[14] = @"PeerFilterRanges";
  v6[15] = @"PeerListenRanges";
  v6[16] = @"PeerLocalSubnetsOnly";
  v6[17] = @"Port";
  v6[18] = @"PublicRanges";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:19];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowPersonalCaching:(id)a4 withAllowSharedCaching:(id)a5 withAutoActivation:(id)a6 withCacheLimit:(id)a7 withDataPath:(id)a8 withDenyActivation:(id)a9 withDenyTetheredCaching:(id)a10 withListenRanges:(id)a11 withListenRangesOnly:(id)a12 withListenWithPeersAndParents:(id)a13 withLocalSubnetsOnly:(id)a14 withLogClientIdentity:(id)a15 withParents:(id)a16 withParentSelectionPolicy:(id)a17 withPeerFilterRanges:(id)a18 withPeerListenRanges:(id)a19 withPeerLocalSubnetsOnly:(id)a20 withPort:(id)a21 withPublicRanges:(id)a22
{
  id v66 = a3;
  id v65 = a22;
  id v64 = a21;
  id v63 = a20;
  id v62 = a19;
  id v61 = a18;
  v60 = (__CFString *)a17;
  id v59 = a16;
  id v58 = a15;
  id v57 = a14;
  id v56 = a13;
  id v55 = a12;
  id v54 = a11;
  id v22 = a10;
  id v23 = a9;
  v24 = (__CFString *)a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  id v28 = a4;
  v29 = objc_opt_new();
  [v29 setDeclarationType:@"com.apple.configuration.network.contentcaching"];
  if (v66)
  {
    [v29 setDeclarationIdentifier:v66];
  }
  else
  {
    v30 = [MEMORY[0x263F08C38] UUID];
    v31 = [v30 UUIDString];
    [v29 setDeclarationIdentifier:v31];
  }
  v32 = (void *)MEMORY[0x263EFFA88];
  if (v28) {
    id v33 = v28;
  }
  else {
    id v33 = (id)MEMORY[0x263EFFA88];
  }
  objc_msgSend(v29, "setPayloadAllowPersonalCaching:", v33, a10);

  if (v27) {
    id v34 = v27;
  }
  else {
    id v34 = v32;
  }
  [v29 setPayloadAllowSharedCaching:v34];

  v35 = (void *)MEMORY[0x263EFFA80];
  if (v26) {
    id v36 = v26;
  }
  else {
    id v36 = (id)MEMORY[0x263EFFA80];
  }
  [v29 setPayloadAutoActivation:v36];

  if (v25) {
    v37 = v25;
  }
  else {
    v37 = &unk_26C894838;
  }
  [v29 setPayloadCacheLimit:v37];

  if (v24) {
    v38 = v24;
  }
  else {
    v38 = @"/Library/Application Support/Apple/AssetCache/Data";
  }
  [v29 setPayloadDataPath:v38];

  if (v23) {
    id v39 = v23;
  }
  else {
    id v39 = v35;
  }
  [v29 setPayloadDenyActivation:v39];

  if (v22) {
    id v40 = v22;
  }
  else {
    id v40 = v35;
  }
  [v29 setPayloadDenyTetheredCaching:v40];

  [v29 setPayloadListenRanges:v54];
  if (v55) {
    id v41 = v55;
  }
  else {
    id v41 = v35;
  }
  [v29 setPayloadListenRangesOnly:v41];

  if (v56) {
    id v42 = v56;
  }
  else {
    id v42 = v32;
  }
  [v29 setPayloadListenWithPeersAndParents:v42];

  if (v57) {
    id v43 = v57;
  }
  else {
    id v43 = v32;
  }
  [v29 setPayloadLocalSubnetsOnly:v43];

  if (v58) {
    id v44 = v58;
  }
  else {
    id v44 = v35;
  }
  [v29 setPayloadLogClientIdentity:v44];

  [v29 setPayloadParents:v59];
  if (v60) {
    v45 = v60;
  }
  else {
    v45 = @"round-robin";
  }
  [v29 setPayloadParentSelectionPolicy:v45];

  [v29 setPayloadPeerFilterRanges:v61];
  [v29 setPayloadPeerListenRanges:v62];

  if (v63) {
    id v46 = v63;
  }
  else {
    id v46 = v32;
  }
  [v29 setPayloadPeerLocalSubnetsOnly:v46];

  if (v64) {
    v47 = v64;
  }
  else {
    v47 = &unk_26C894838;
  }
  [v29 setPayloadPort:v47];

  [v29 setPayloadPublicRanges:v65];
  [v29 updateServerHash];

  return v29;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.contentcaching"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkContentCachingDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v71 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowPersonalCaching" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v71];
  id v14 = v71;
  payloadAllowPersonalCaching = self->_payloadAllowPersonalCaching;
  self->_payloadAllowPersonalCaching = v13;

  if (!v14)
  {
    id v70 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowSharedCaching" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v70];
    id v14 = v70;
    payloadAllowSharedCaching = self->_payloadAllowSharedCaching;
    self->_payloadAllowSharedCaching = v16;

    if (!v14)
    {
      id v69 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutoActivation" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v69];
      id v14 = v69;
      payloadAutoActivation = self->_payloadAutoActivation;
      self->_payloadAutoActivation = v18;

      if (!v14)
      {
        id v68 = 0;
        v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CacheLimit" isRequired:0 defaultValue:&unk_26C894838 error:&v68];
        id v14 = v68;
        payloadCacheLimit = self->_payloadCacheLimit;
        self->_payloadCacheLimit = v20;

        if (!v14)
        {
          id v67 = 0;
          id v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DataPath" isRequired:0 defaultValue:@"/Library/Application Support/Apple/AssetCache/Data" error:&v67];
          id v14 = v67;
          payloadDataPath = self->_payloadDataPath;
          self->_payloadDataPath = v22;

          if (!v14)
          {
            id v66 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DenyActivation" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v66];
            id v14 = v66;
            payloadDenyActivation = self->_payloadDenyActivation;
            self->_payloadDenyActivation = v24;

            if (!v14)
            {
              id v65 = 0;
              id v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DenyTetheredCaching" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v65];
              id v14 = v65;
              payloadDenyTetheredCaching = self->_payloadDenyTetheredCaching;
              self->_payloadDenyTetheredCaching = v26;

              if (!v14)
              {
                id v64 = 0;
                id v28 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ListenRanges" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v64];
                id v14 = v64;
                payloadListenRanges = self->_payloadListenRanges;
                self->_payloadListenRanges = v28;

                if (!v14)
                {
                  id v63 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ListenRangesOnly" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v63];
                  id v14 = v63;
                  payloadListenRangesOnly = self->_payloadListenRangesOnly;
                  self->_payloadListenRangesOnly = v30;

                  if (!v14)
                  {
                    id v62 = 0;
                    v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ListenWithPeersAndParents" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v62];
                    id v14 = v62;
                    payloadListenWithPeersAndParents = self->_payloadListenWithPeersAndParents;
                    self->_payloadListenWithPeersAndParents = v32;

                    if (!v14)
                    {
                      id v61 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"LocalSubnetsOnly" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v61];
                      id v14 = v61;
                      payloadLocalSubnetsOnly = self->_payloadLocalSubnetsOnly;
                      self->_payloadLocalSubnetsOnly = v34;

                      if (!v14)
                      {
                        id v60 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"LogClientIdentity" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v60];
                        id v14 = v60;
                        payloadLogClientIdentity = self->_payloadLogClientIdentity;
                        self->_payloadLogClientIdentity = v36;

                        if (!v14)
                        {
                          id v59 = 0;
                          v38 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Parents" validator:&__block_literal_global_18 isRequired:0 defaultValue:0 error:&v59];
                          id v14 = v59;
                          payloadParents = self->_payloadParents;
                          self->_payloadParents = v38;

                          if (!v14)
                          {
                            id v58 = 0;
                            id v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ParentSelectionPolicy" isRequired:0 defaultValue:@"round-robin" error:&v58];
                            id v14 = v58;
                            payloadParentSelectionPolicy = self->_payloadParentSelectionPolicy;
                            self->_payloadParentSelectionPolicy = v40;

                            if (!v14)
                            {
                              id v57 = 0;
                              id v42 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"PeerFilterRanges" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v57];
                              id v14 = v57;
                              payloadPeerFilterRanges = self->_payloadPeerFilterRanges;
                              self->_payloadPeerFilterRanges = v42;

                              if (!v14)
                              {
                                id v56 = 0;
                                id v44 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"PeerListenRanges" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v56];
                                id v14 = v56;
                                payloadPeerListenRanges = self->_payloadPeerListenRanges;
                                self->_payloadPeerListenRanges = v44;

                                if (!v14)
                                {
                                  id v55 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PeerLocalSubnetsOnly" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v55];
                                  id v14 = v55;
                                  payloadPeerLocalSubnetsOnly = self->_payloadPeerLocalSubnetsOnly;
                                  self->_payloadPeerLocalSubnetsOnly = v46;

                                  if (!v14)
                                  {
                                    id v54 = 0;
                                    v48 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Port" isRequired:0 defaultValue:&unk_26C894838 error:&v54];
                                    id v14 = v54;
                                    payloadPort = self->_payloadPort;
                                    self->_payloadPort = v48;

                                    if (!v14)
                                    {
                                      id v53 = 0;
                                      v50 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"PublicRanges" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v53];
                                      id v14 = v53;
                                      payloadPublicRanges = self->_payloadPublicRanges;
                                      self->_payloadPublicRanges = v50;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __57__CEMNetworkContentCachingDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AllowPersonalCaching" withValue:self->_payloadAllowPersonalCaching isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AllowSharedCaching" withValue:self->_payloadAllowSharedCaching isRequired:0 defaultValue:v6];
  uint64_t v7 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AutoActivation" withValue:self->_payloadAutoActivation isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"CacheLimit" withValue:self->_payloadCacheLimit isRequired:0 defaultValue:&unk_26C894838];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DataPath" withValue:self->_payloadDataPath isRequired:0 defaultValue:@"/Library/Application Support/Apple/AssetCache/Data"];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"DenyActivation" withValue:self->_payloadDenyActivation isRequired:0 defaultValue:v7];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"DenyTetheredCaching" withValue:self->_payloadDenyTetheredCaching isRequired:0 defaultValue:v7];
  payloadListenRanges = self->_payloadListenRanges;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v27[3] = &unk_2642C8F90;
  id v9 = v4;
  id v28 = v9;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"ListenRanges" withValue:payloadListenRanges itemSerializer:v27 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"ListenRangesOnly" withValue:self->_payloadListenRangesOnly isRequired:0 defaultValue:v7];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"ListenWithPeersAndParents" withValue:self->_payloadListenWithPeersAndParents isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"LocalSubnetsOnly" withValue:self->_payloadLocalSubnetsOnly isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"LogClientIdentity" withValue:self->_payloadLogClientIdentity isRequired:0 defaultValue:v7];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Parents" withValue:self->_payloadParents itemSerializer:&__block_literal_global_94 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"ParentSelectionPolicy" withValue:self->_payloadParentSelectionPolicy isRequired:0 defaultValue:@"round-robin"];
  payloadPeerFilterRanges = self->_payloadPeerFilterRanges;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v25[3] = &unk_2642C8F90;
  id v11 = v9;
  id v26 = v11;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"PeerFilterRanges" withValue:payloadPeerFilterRanges itemSerializer:v25 isRequired:0 defaultValue:0];
  payloadPeerListenRanges = self->_payloadPeerListenRanges;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_4;
  v23[3] = &unk_2642C8F90;
  id v13 = v11;
  id v24 = v13;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"PeerListenRanges" withValue:payloadPeerListenRanges itemSerializer:v23 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"PeerLocalSubnetsOnly" withValue:self->_payloadPeerLocalSubnetsOnly isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"Port" withValue:self->_payloadPort isRequired:0 defaultValue:&unk_26C894838];
  payloadPublicRanges = self->_payloadPublicRanges;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_5;
  v21 = &unk_2642C8F90;
  id v22 = v13;
  id v15 = v13;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"PublicRanges" withValue:payloadPublicRanges itemSerializer:&v18 isRequired:0 defaultValue:0];
  v16 = objc_msgSend(v5, "copy", v18, v19, v20, v21);

  return v16;
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __74__CEMNetworkContentCachingDeclaration_serializePayloadWithAssetProviders___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v44.receiver = self;
  v44.super_class = (Class)CEMNetworkContentCachingDeclaration;
  id v4 = [(CEMDeclarationBase *)&v44 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowPersonalCaching copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowSharedCaching copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAutoActivation copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadCacheLimit copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadDataPath copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadDenyActivation copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadDenyTetheredCaching copy];
  uint64_t v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSArray *)self->_payloadListenRanges copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadListenRangesOnly copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadListenWithPeersAndParents copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadLocalSubnetsOnly copy];
  id v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadLogClientIdentity copy];
  id v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSArray *)self->_payloadParents copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSString *)self->_payloadParentSelectionPolicy copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSArray *)self->_payloadPeerFilterRanges copy];
  id v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSArray *)self->_payloadPeerListenRanges copy];
  id v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadPeerLocalSubnetsOnly copy];
  v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(NSNumber *)self->_payloadPort copy];
  id v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSArray *)self->_payloadPublicRanges copy];
  id v42 = (void *)v4[27];
  v4[27] = v41;

  return v4;
}

- (NSNumber)payloadAllowPersonalCaching
{
  return self->_payloadAllowPersonalCaching;
}

- (void)setPayloadAllowPersonalCaching:(id)a3
{
}

- (NSNumber)payloadAllowSharedCaching
{
  return self->_payloadAllowSharedCaching;
}

- (void)setPayloadAllowSharedCaching:(id)a3
{
}

- (NSNumber)payloadAutoActivation
{
  return self->_payloadAutoActivation;
}

- (void)setPayloadAutoActivation:(id)a3
{
}

- (NSNumber)payloadCacheLimit
{
  return self->_payloadCacheLimit;
}

- (void)setPayloadCacheLimit:(id)a3
{
}

- (NSString)payloadDataPath
{
  return self->_payloadDataPath;
}

- (void)setPayloadDataPath:(id)a3
{
}

- (NSNumber)payloadDenyActivation
{
  return self->_payloadDenyActivation;
}

- (void)setPayloadDenyActivation:(id)a3
{
}

- (NSNumber)payloadDenyTetheredCaching
{
  return self->_payloadDenyTetheredCaching;
}

- (void)setPayloadDenyTetheredCaching:(id)a3
{
}

- (NSArray)payloadListenRanges
{
  return self->_payloadListenRanges;
}

- (void)setPayloadListenRanges:(id)a3
{
}

- (NSNumber)payloadListenRangesOnly
{
  return self->_payloadListenRangesOnly;
}

- (void)setPayloadListenRangesOnly:(id)a3
{
}

- (NSNumber)payloadListenWithPeersAndParents
{
  return self->_payloadListenWithPeersAndParents;
}

- (void)setPayloadListenWithPeersAndParents:(id)a3
{
}

- (NSNumber)payloadLocalSubnetsOnly
{
  return self->_payloadLocalSubnetsOnly;
}

- (void)setPayloadLocalSubnetsOnly:(id)a3
{
}

- (NSNumber)payloadLogClientIdentity
{
  return self->_payloadLogClientIdentity;
}

- (void)setPayloadLogClientIdentity:(id)a3
{
}

- (NSArray)payloadParents
{
  return self->_payloadParents;
}

- (void)setPayloadParents:(id)a3
{
}

- (NSString)payloadParentSelectionPolicy
{
  return self->_payloadParentSelectionPolicy;
}

- (void)setPayloadParentSelectionPolicy:(id)a3
{
}

- (NSArray)payloadPeerFilterRanges
{
  return self->_payloadPeerFilterRanges;
}

- (void)setPayloadPeerFilterRanges:(id)a3
{
}

- (NSArray)payloadPeerListenRanges
{
  return self->_payloadPeerListenRanges;
}

- (void)setPayloadPeerListenRanges:(id)a3
{
}

- (NSNumber)payloadPeerLocalSubnetsOnly
{
  return self->_payloadPeerLocalSubnetsOnly;
}

- (void)setPayloadPeerLocalSubnetsOnly:(id)a3
{
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
}

- (NSArray)payloadPublicRanges
{
  return self->_payloadPublicRanges;
}

- (void)setPayloadPublicRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPublicRanges, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadPeerLocalSubnetsOnly, 0);
  objc_storeStrong((id *)&self->_payloadPeerListenRanges, 0);
  objc_storeStrong((id *)&self->_payloadPeerFilterRanges, 0);
  objc_storeStrong((id *)&self->_payloadParentSelectionPolicy, 0);
  objc_storeStrong((id *)&self->_payloadParents, 0);
  objc_storeStrong((id *)&self->_payloadLogClientIdentity, 0);
  objc_storeStrong((id *)&self->_payloadLocalSubnetsOnly, 0);
  objc_storeStrong((id *)&self->_payloadListenWithPeersAndParents, 0);
  objc_storeStrong((id *)&self->_payloadListenRangesOnly, 0);
  objc_storeStrong((id *)&self->_payloadListenRanges, 0);
  objc_storeStrong((id *)&self->_payloadDenyTetheredCaching, 0);
  objc_storeStrong((id *)&self->_payloadDenyActivation, 0);
  objc_storeStrong((id *)&self->_payloadDataPath, 0);
  objc_storeStrong((id *)&self->_payloadCacheLimit, 0);
  objc_storeStrong((id *)&self->_payloadAutoActivation, 0);
  objc_storeStrong((id *)&self->_payloadAllowSharedCaching, 0);

  objc_storeStrong((id *)&self->_payloadAllowPersonalCaching, 0);
}

@end