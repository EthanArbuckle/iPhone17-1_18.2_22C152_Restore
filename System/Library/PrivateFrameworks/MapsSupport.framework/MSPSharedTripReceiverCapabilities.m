@interface MSPSharedTripReceiverCapabilities
+ (id)allKnownReceiverCapabilities;
+ (id)legacyReceiverCapabilities;
+ (id)starskyReceiverCapabilities;
+ (id)sydromeReceiverCapabilities;
+ (id)unrestrictedReceiverCapabilities;
+ (void)enumerateKnownReceiverCapabilityConfigurationsForState:(id)a3 withBlock:(id)a4;
+ (void)enumerateReceiverCapabilityConfigurations:(id)a3 forState:(id)a4 withBlock:(id)a5;
+ (void)fetchReceiverCapabilitiesForDestinations:(id)a3 completion:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsRoutingPathLeg;
- (BOOL)supportsWaypointRouteSharing;
- (MSPSharedTripReceiverCapabilities)initWithIDSEndpointCapabilities:(id)a3;
- (MSPSharedTripReceiverCapabilities)initWithRegistrationPropertiesSupported:(id)a3 propertiesUnsupported:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)idsSendMessageOptions;
- (unint64_t)hash;
@end

@implementation MSPSharedTripReceiverCapabilities

- (MSPSharedTripReceiverCapabilities)initWithRegistrationPropertiesSupported:(id)a3 propertiesUnsupported:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MSPSharedTripReceiverCapabilities *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_supportedProperties, a3);
    objc_storeStrong((id *)&v10->_unsupportedProperties, a4);
  }

  return v10;
}

- (MSPSharedTripReceiverCapabilities)initWithIDSEndpointCapabilities:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = *MEMORY[0x1E4F6A948];
  v23[0] = *MEMORY[0x1E4F6A940];
  v23[1] = v7;
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 2, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ([v4 valueForCapability:v13] == 1) {
          v14 = v5;
        }
        else {
          v14 = v6;
        }
        [v14 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v5 copy];
  v16 = (void *)[v6 copy];
  v17 = [(MSPSharedTripReceiverCapabilities *)self initWithRegistrationPropertiesSupported:v15 propertiesUnsupported:v16];

  return v17;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)MSPSharedTripReceiverCapabilities;
  unint64_t v3 = [(MSPSharedTripReceiverCapabilities *)&v6 hash];
  uint64_t v4 = [(NSSet *)self->_supportedProperties hash];
  return v4 ^ [(NSSet *)self->_unsupportedProperties hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    objc_super v6 = (void *)v5[1];
    unint64_t v7 = self->_supportedProperties;
    unint64_t v8 = v6;
    if (v7 | v8
      && (uint64_t v9 = (void *)v8, v10 = [(id)v7 isEqual:v8], v9, (id)v7, !v10))
    {
      unsigned __int8 v15 = 0;
    }
    else
    {
      unsupportedProperties = self->_unsupportedProperties;
      uint64_t v12 = v5[2];
      id v13 = unsupportedProperties;
      v14 = v13;
      if ((unint64_t)v13 | v12) {
        unsigned __int8 v15 = [v13 isEqual:v12];
      }
      else {
        unsigned __int8 v15 = 1;
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MSPSharedTripReceiverCapabilities;
    unsigned __int8 v15 = [(MSPSharedTripReceiverCapabilities *)&v17 isEqual:v4];
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_supportedProperties);
  objc_storeStrong(v4 + 2, self->_unsupportedProperties);
  return v4;
}

+ (id)allKnownReceiverCapabilities
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  id v4 = [a1 sydromeReceiverCapabilities];
  id v5 = objc_msgSend(a1, "starskyReceiverCapabilities", v4);
  v10[1] = v5;
  objc_super v6 = [a1 legacyReceiverCapabilities];
  v10[2] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  unint64_t v8 = (void *)[v3 initWithArray:v7];

  return v8;
}

+ (id)sydromeReceiverCapabilities
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F6A940], *MEMORY[0x1E4F6A948], 0);
  id v4 = (void *)[objc_alloc((Class)a1) initWithRegistrationPropertiesSupported:v3 propertiesUnsupported:0];

  return v4;
}

+ (id)starskyReceiverCapabilities
{
  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6A940]];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6A948]];
  id v5 = (void *)[objc_alloc((Class)a1) initWithRegistrationPropertiesSupported:v3 propertiesUnsupported:v4];

  return v5;
}

+ (id)legacyReceiverCapabilities
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F6A940], *MEMORY[0x1E4F6A948], 0);
  id v4 = (void *)[objc_alloc((Class)a1) initWithRegistrationPropertiesSupported:0 propertiesUnsupported:v3];

  return v4;
}

+ (id)unrestrictedReceiverCapabilities
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRegistrationPropertiesSupported:0 propertiesUnsupported:0];

  return v2;
}

+ (void)enumerateKnownReceiverCapabilityConfigurationsForState:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() allKnownReceiverCapabilities];
  [a1 enumerateReceiverCapabilityConfigurations:v8 forState:v7 withBlock:v6];
}

+ (void)enumerateReceiverCapabilityConfigurations:(id)a3 forState:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v10 = a3;
  uint64_t v11 = (void *)[[v9 alloc] initWithCapacity:3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__MSPSharedTripReceiverCapabilities_enumerateReceiverCapabilityConfigurations_forState_withBlock___block_invoke;
  v15[3] = &unk_1E617E9B8;
  id v16 = v11;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v11;
  [v10 enumerateObjectsUsingBlock:v15];
}

void __98__MSPSharedTripReceiverCapabilities_enumerateReceiverCapabilityConfigurations_forState_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 40) instanceCompatibleWithReceiverCapabilities:v4];
    [*(id *)(a1 + 32) setObject:v3 forKey:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)fetchReceiverCapabilitiesForDestinations:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__8;
    v37 = __Block_byref_object_dispose__8;
    id v38 = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F6AB38]);
    uint64_t v9 = (void *)v34[5];
    v34[5] = (uint64_t)v8;

    id v10 = (void *)v34[5];
    uint64_t v11 = NSStringFromClass((Class)a1);
    [v10 addListenerID:v11 forService:@"com.apple.private.alloy.maps.eta"];

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = (void *)MEMORY[0x1BA9C28D0]();
          id v18 = (void *)IDSCopyAddressDestinationForDestination();
          [v12 addObject:v18];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v14);
    }

    long long v19 = dispatch_get_global_queue(25, 0);
    long long v20 = (void *)v34[5];
    long long v21 = [v12 allObjects];
    long long v22 = [MEMORY[0x1E4F6AB30] refreshIDInfo];
    v23 = NSStringFromClass((Class)a1);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke;
    v24[3] = &unk_1E617EA08;
    id v25 = v13;
    v27 = &v33;
    id v28 = a1;
    id v26 = v7;
    [v20 idInfoForDestinations:v21 service:@"com.apple.private.alloy.maps.eta" infoTypes:1 options:v22 listenerID:v23 queue:v19 completionBlock:v24];

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08]);
  }
}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_2;
  v16[3] = &unk_1E617E9E0;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v17 = v6;
  uint64_t v19 = v7;
  id v8 = v5;
  id v18 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_3;
  block[3] = &unk_1E617D7A0;
  id v11 = *(id *)(a1 + 40);
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v22 = v5;
  if ([*(id *)(a1 + 32) containsObject:v5]) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:3];
  }
  else {
    uint64_t v7 = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  objc_msgSend(v6, "endpoints", v6);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v32;
    id v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v10 = objc_alloc(*(Class *)(a1 + 48));
        id v11 = [v9 capabilities];
        id v12 = (void *)[v10 initWithIDSEndpointCapabilities:v11];

        [v7 addObject:v12];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v13 = [v9 destinationURIs];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * j);
              if ([*(id *)(a1 + 32) containsObject:v18])
              {
                uint64_t v35 = v12;
                uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
                [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v18];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v15);
        }

        uint64_t v7 = v25;
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v26);
  }

  if (*(void *)(a1 + 40))
  {
    long long v20 = [v7 array];
    [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:v22];
  }
}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)idsSendMessageOptions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F6A9F0];
  supportedProperties = self->_supportedProperties;
  id v4 = supportedProperties;
  if (!supportedProperties)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4F6A9F8];
  unsupportedProperties = self->_unsupportedProperties;
  id v6 = unsupportedProperties;
  if (!unsupportedProperties)
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (unsupportedProperties)
  {
    if (supportedProperties) {
      goto LABEL_7;
    }
  }
  else
  {

    if (supportedProperties) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MSPSharedTripReceiverCapabilities;
  id v4 = [(MSPSharedTripReceiverCapabilities *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ (supports: %@, lacks: %@)", v4, self->_supportedProperties, self->_unsupportedProperties];

  return v5;
}

- (BOOL)supportsRoutingPathLeg
{
  return [(NSSet *)self->_supportedProperties containsObject:*MEMORY[0x1E4F6A940]];
}

- (BOOL)supportsWaypointRouteSharing
{
  return [(NSSet *)self->_supportedProperties containsObject:*MEMORY[0x1E4F6A948]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedProperties, 0);

  objc_storeStrong((id *)&self->_supportedProperties, 0);
}

@end