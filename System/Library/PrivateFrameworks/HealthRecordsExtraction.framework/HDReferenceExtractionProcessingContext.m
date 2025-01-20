@interface HDReferenceExtractionProcessingContext
- (HDReferenceExtractionProcessingContext)init;
- (NSArray)privateCompleteResources;
- (NSArray)privateIncompleteResources;
- (NSArray)privateUnresolvableReferences;
- (NSMapTable)resourcesWithUnresolvableReferences;
- (NSMapTable)unresolvedReferences;
- (NSMutableSet)containedResourceIdentifiers;
- (NSMutableSet)processedResources;
- (void)_processResources;
- (void)_reset;
- (void)recordContainedResource:(id)a3;
- (void)recordProcessedResource:(id)a3;
- (void)recordUnresolvableReference:(id)a3 forResource:(id)a4 hint:(unint64_t)a5;
- (void)recordUnresolvedReference:(id)a3 forResource:(id)a4;
- (void)setContainedResourceIdentifiers:(id)a3;
- (void)setPrivateCompleteResources:(id)a3;
- (void)setPrivateIncompleteResources:(id)a3;
- (void)setPrivateUnresolvableReferences:(id)a3;
- (void)setProcessedResources:(id)a3;
- (void)setResourcesWithUnresolvableReferences:(id)a3;
- (void)setUnresolvedReferences:(id)a3;
@end

@implementation HDReferenceExtractionProcessingContext

- (HDReferenceExtractionProcessingContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)HDReferenceExtractionProcessingContext;
  v2 = [(HDReferenceExtractionProcessingContext *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    processedResources = v2->_processedResources;
    v2->_processedResources = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    containedResourceIdentifiers = v2->_containedResourceIdentifiers;
    v2->_containedResourceIdentifiers = v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    unresolvedReferences = v2->_unresolvedReferences;
    v2->_unresolvedReferences = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    resourcesWithUnresolvableReferences = v2->_resourcesWithUnresolvableReferences;
    v2->_resourcesWithUnresolvableReferences = (NSMapTable *)v9;
  }
  return v2;
}

- (NSArray)privateCompleteResources
{
  privateCompleteResources = self->_privateCompleteResources;
  if (!privateCompleteResources)
  {
    [(HDReferenceExtractionProcessingContext *)self _processResources];
    privateCompleteResources = self->_privateCompleteResources;
  }
  return privateCompleteResources;
}

- (NSArray)privateIncompleteResources
{
  privateIncompleteResources = self->_privateIncompleteResources;
  if (!privateIncompleteResources)
  {
    [(HDReferenceExtractionProcessingContext *)self _processResources];
    privateIncompleteResources = self->_privateIncompleteResources;
  }
  return privateIncompleteResources;
}

- (NSArray)privateUnresolvableReferences
{
  privateUnresolvableReferences = self->_privateUnresolvableReferences;
  if (!privateUnresolvableReferences)
  {
    [(HDReferenceExtractionProcessingContext *)self _processResources];
    privateUnresolvableReferences = self->_privateUnresolvableReferences;
  }
  return privateUnresolvableReferences;
}

- (void)_processResources
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = self->_processedResources;
  uint64_t v36 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v42;
    v33 = self;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v41 + 1) + 8 * v3);
        resourcesWithUnresolvableReferences = self->_resourcesWithUnresolvableReferences;
        v6 = [v4 identifier];
        uint64_t v7 = [(NSMapTable *)resourcesWithUnresolvableReferences objectForKey:v6];

        if ([v7 count])
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count"));
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v9 = v7;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = 0;
            uint64_t v13 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v38 != v13) {
                  objc_enumerationMutation(v9);
                }
                v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                v12 |= [v15 hint];
                v16 = [v15 reference];
                [v8 addObject:v16];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v11);
          }
          else
          {
            uint64_t v12 = 0;
          }

          v20 = (void *)MEMORY[0x263F45C10];
          v21 = [v4 JSONObject];
          v22 = [v4 sourceURL];
          v23 = [v4 FHIRVersion];
          v24 = [v4 receivedDate];
          v25 = [v20 resourceObjectWithJSONObject:v21 sourceURL:v22 FHIRVersion:v23 receivedDate:v24 extractionHints:v12 error:0];

          v26 = (void *)[objc_alloc(MEMORY[0x263F45C60]) initWithReferences:v8 resource:v25];
          [v34 addObject:v26];

          self = v33;
        }
        else
        {
          unresolvedReferences = self->_unresolvedReferences;
          v18 = [v4 identifier];
          v8 = [(NSMapTable *)unresolvedReferences objectForKey:v18];

          if ([v8 count])
          {
            v19 = (void *)[objc_alloc(MEMORY[0x263F45C60]) initWithReferences:v8 resource:v4];
            [v31 addObject:v19];
          }
          else
          {
            containedResourceIdentifiers = self->_containedResourceIdentifiers;
            v28 = [v4 identifier];
            LOBYTE(containedResourceIdentifiers) = [(NSMutableSet *)containedResourceIdentifiers containsObject:v28];

            if ((containedResourceIdentifiers & 1) == 0) {
              [v30 addObject:v4];
            }
          }
        }

        ++v3;
      }
      while (v3 != v36);
      uint64_t v29 = [(NSMutableSet *)obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      uint64_t v36 = v29;
    }
    while (v29);
  }

  [(HDReferenceExtractionProcessingContext *)self setPrivateCompleteResources:v30];
  [(HDReferenceExtractionProcessingContext *)self setPrivateIncompleteResources:v31];
  [(HDReferenceExtractionProcessingContext *)self setPrivateUnresolvableReferences:v34];
}

- (void)_reset
{
  [(HDReferenceExtractionProcessingContext *)self setPrivateCompleteResources:0];
  [(HDReferenceExtractionProcessingContext *)self setPrivateIncompleteResources:0];
  [(HDReferenceExtractionProcessingContext *)self setPrivateUnresolvableReferences:0];
}

- (void)recordUnresolvedReference:(id)a3 forResource:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  [(HDReferenceExtractionProcessingContext *)self _reset];
  unresolvedReferences = self->_unresolvedReferences;
  v8 = [v16 identifier];
  id v9 = [(NSMapTable *)unresolvedReferences objectForKey:v8];
  uint64_t v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
  }
  uint64_t v13 = v12;

  [v13 addObject:v6];
  v14 = self->_unresolvedReferences;
  v15 = [v16 identifier];
  [(NSMapTable *)v14 setObject:v13 forKey:v15];
}

- (void)recordUnresolvableReference:(id)a3 forResource:(id)a4 hint:(unint64_t)a5
{
  id v19 = a4;
  id v8 = a3;
  [(HDReferenceExtractionProcessingContext *)self _reset];
  resourcesWithUnresolvableReferences = self->_resourcesWithUnresolvableReferences;
  uint64_t v10 = [v19 identifier];
  uint64_t v11 = [(NSMapTable *)resourcesWithUnresolvableReferences objectForKey:v10];
  id v12 = (void *)[v11 mutableCopy];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
  }
  v15 = v14;

  id v16 = [[_HDUnresolvableReferenceHint alloc] initWithReference:v8 hint:a5];
  [v15 addObject:v16];
  v17 = self->_resourcesWithUnresolvableReferences;
  v18 = [v19 identifier];
  [(NSMapTable *)v17 setObject:v15 forKey:v18];
}

- (void)recordProcessedResource:(id)a3
{
  id v4 = a3;
  [(HDReferenceExtractionProcessingContext *)self _reset];
  [(NSMutableSet *)self->_processedResources addObject:v4];
}

- (void)recordContainedResource:(id)a3
{
  id v4 = a3;
  [(HDReferenceExtractionProcessingContext *)self _reset];
  containedResourceIdentifiers = self->_containedResourceIdentifiers;
  id v6 = [v4 identifier];

  [(NSMutableSet *)containedResourceIdentifiers addObject:v6];
}

- (void)setPrivateCompleteResources:(id)a3
{
}

- (void)setPrivateIncompleteResources:(id)a3
{
}

- (void)setPrivateUnresolvableReferences:(id)a3
{
}

- (NSMutableSet)processedResources
{
  return self->_processedResources;
}

- (void)setProcessedResources:(id)a3
{
}

- (NSMutableSet)containedResourceIdentifiers
{
  return self->_containedResourceIdentifiers;
}

- (void)setContainedResourceIdentifiers:(id)a3
{
}

- (NSMapTable)unresolvedReferences
{
  return self->_unresolvedReferences;
}

- (void)setUnresolvedReferences:(id)a3
{
}

- (NSMapTable)resourcesWithUnresolvableReferences
{
  return self->_resourcesWithUnresolvableReferences;
}

- (void)setResourcesWithUnresolvableReferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesWithUnresolvableReferences, 0);
  objc_storeStrong((id *)&self->_unresolvedReferences, 0);
  objc_storeStrong((id *)&self->_containedResourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_processedResources, 0);
  objc_storeStrong((id *)&self->_privateUnresolvableReferences, 0);
  objc_storeStrong((id *)&self->_privateIncompleteResources, 0);
  objc_storeStrong((id *)&self->_privateCompleteResources, 0);
}

@end