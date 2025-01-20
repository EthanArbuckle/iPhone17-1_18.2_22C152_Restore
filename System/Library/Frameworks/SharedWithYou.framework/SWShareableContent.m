@interface SWShareableContent
+ (BOOL)supportsSecureCoding;
- (BOOL)canLoadObjectOfClass:(Class)a3;
- (BOOL)hasPossibleCollaborationRepresentation;
- (BOOL)hasRepresentationConformingToTypeIdentifier:(id)a3;
- (LPLinkMetadata)metadata;
- (NSArray)itemProviders;
- (NSArray)representations;
- (NSItemProvider)itemProvider;
- (NSPersonNameComponents)initiatorNameComponents;
- (NSString)initiatorHandle;
- (NSString)sourceBundleIdentifier;
- (NSString)sourceSceneIdentifier;
- (NSURL)highlightURL;
- (SWShareableContent)initWithCoder:(id)a3;
- (SWShareableContent)initWithSourceSceneIdentifier:(id)a3 sourceBundleIdentifier:(id)a4 metadata:(id)a5 representations:(id)a6 highlightURL:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9;
- (SWShareableContentRepresentationProvider)representationProvider;
- (id)description;
- (id)registeredOpenInPlaceTypeIdentifiers;
- (id)registeredTypeIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)loadRepresentationForTypeIdentifier:(id)a3 itemProviderIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)setRepresentationProvider:(id)a3;
@end

@implementation SWShareableContent

- (SWShareableContent)initWithSourceSceneIdentifier:(id)a3 sourceBundleIdentifier:(id)a4 metadata:(id)a5 representations:(id)a6 highlightURL:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)SWShareableContent;
  v22 = [(SWShareableContent *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    sourceSceneIdentifier = v22->_sourceSceneIdentifier;
    v22->_sourceSceneIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    sourceBundleIdentifier = v22->_sourceBundleIdentifier;
    v22->_sourceBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    metadata = v22->_metadata;
    v22->_metadata = (LPLinkMetadata *)v27;

    uint64_t v29 = [v18 copy];
    representations = v22->_representations;
    v22->_representations = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    highlightURL = v22->_highlightURL;
    v22->_highlightURL = (NSURL *)v31;

    uint64_t v33 = [v20 copy];
    initiatorHandle = v22->_initiatorHandle;
    v22->_initiatorHandle = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    initiatorNameComponents = v22->_initiatorNameComponents;
    v22->_initiatorNameComponents = (NSPersonNameComponents *)v35;
  }
  return v22;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SWShareableContent *)self sourceSceneIdentifier];
  [v3 appendFormat:@" sourceSceneIdentifier=%@", v4];

  v5 = [(SWShareableContent *)self sourceBundleIdentifier];
  [v3 appendFormat:@" sourceBundleIdentifier=%@", v5];

  v6 = [(SWShareableContent *)self metadata];
  [v3 appendFormat:@" metadata=%@", v6];

  v7 = [(SWShareableContent *)self representations];
  [v3 appendFormat:@" representations=%@", v7];

  v8 = [(SWShareableContent *)self highlightURL];
  [v3 appendFormat:@" highlightURL=%@", v8];

  v9 = [(SWShareableContent *)self initiatorHandle];
  [v3 appendFormat:@" initiatorHandle=%@", v9];

  v10 = [(SWShareableContent *)self initiatorNameComponents];
  [v3 appendFormat:@" initiatorNameComponents=%@", v10];

  [v3 appendString:@">"];
  v11 = (void *)[v3 copy];

  return v11;
}

- (id)registeredTypeIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(SWShareableContent *)self representations];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(SWShareableContent *)self representations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) typeIdentifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

- (id)registeredOpenInPlaceTypeIdentifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(SWShareableContent *)self representations];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(SWShareableContent *)self representations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 preferredRepresentation] == 2)
        {
          v12 = [v11 typeIdentifier];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];

  return v13;
}

- (BOOL)hasRepresentationConformingToTypeIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SWShareableContent *)self itemProviders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasRepresentationConformingToTypeIdentifier:v4 fileOptions:0])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)canLoadObjectOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SWShareableContent *)self itemProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) canLoadObjectOfClass:a3])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)hasPossibleCollaborationRepresentation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SWShareableContent *)self itemProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "sl_hasPossibleCollaborationRepresentation"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)loadRepresentationForTypeIdentifier:(id)a3 itemProviderIndex:(int64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  long long v9 = [(SWShareableContent *)self representationProvider];

  if (v9)
  {
    long long v10 = [(SWShareableContent *)self representationProvider];
    [v10 loadRepresentationForContent:self typeIdentifier:v11 itemProviderIndex:a4 completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (NSItemProvider)itemProvider
{
  v2 = [(SWShareableContent *)self itemProviders];
  uint64_t v3 = [v2 firstObject];

  return (NSItemProvider *)v3;
}

- (NSArray)itemProviders
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(SWShareableContent *)self representations];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __35__SWShareableContent_itemProviders__block_invoke;
  id v11 = &unk_1E5665DD0;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v8];

  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __35__SWShareableContent_itemProviders__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  long long v7 = [v5 suggestedFileName];
  [v6 setSuggestedName:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v15 = v5;
  id obj = [v5 representations];
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __35__SWShareableContent_itemProviders__block_invoke_2;
        aBlock[3] = &unk_1E5665DA8;
        aBlock[4] = *(void *)(a1 + 32);
        aBlock[5] = v12;
        aBlock[6] = a3;
        id v13 = _Block_copy(aBlock);
        long long v14 = [v12 typeIdentifier];
        objc_msgSend(v6, "_addRepresentationType_v2:preferredRepresentation:loader:", v14, objc_msgSend(v12, "preferredRepresentation"), v13);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __35__SWShareableContent_itemProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) typeIdentifier];
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__SWShareableContent_itemProviders__block_invoke_3;
  v10[3] = &unk_1E5665D80;
  id v11 = v4;
  id v8 = v4;
  [v5 loadRepresentationForTypeIdentifier:v6 itemProviderIndex:v7 completionHandler:v10];

  return 0;
}

void __35__SWShareableContent_itemProviders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v17 = v5;
  if (v5)
  {
    id v6 = [v5 urlWrapper];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28FF8]);
      id v8 = [v17 urlWrapper];
      uint64_t v9 = [v8 URL];
      uint64_t v10 = [v17 urlWrapper];
      id v11 = objc_msgSend(v7, "initWithURL:readonly:", v9, objc_msgSend(v10, "isReadonly"));
    }
    else
    {
      id v11 = 0;
    }

    id v13 = (void *)MEMORY[0x1E4F28D80];
    long long v14 = [v17 data];
    uint64_t v15 = [v17 error];
    uint64_t v16 = [v13 resultWithData:v14 urlWrapper:v11 cleanupHandler:0 error:v15];

    objc_msgSend(v16, "setArchivedObjectClass:", objc_msgSend(v17, "archivedObjectClass"));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v11 = [MEMORY[0x1E4F28D80] resultWithError:a3];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWShareableContent)initWithCoder:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_class();
    id v6 = NSStringFromSelector(sel_sourceSceneIdentifier);
    id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = NSStringFromSelector(sel_sourceBundleIdentifier);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_metadata);
    id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    id v17 = NSStringFromSelector(sel_registeredTypeIdentifiers);
    long long v18 = [v4 decodeObjectOfClasses:v16 forKey:v17];

    uint64_t v19 = objc_opt_class();
    long long v20 = NSStringFromSelector(sel_highlightURL);
    long long v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = NSStringFromSelector(sel_initiatorHandle);
    v24 = [v4 decodeObjectOfClass:v22 forKey:v23];

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_initiatorNameComponents);
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];

    self = [(SWShareableContent *)self initWithSourceSceneIdentifier:v7 sourceBundleIdentifier:v10 metadata:v13 representations:v18 highlightURL:v21 initiatorHandle:v24 initiatorNameComponents:v27];
    v28 = self;
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F281F8];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    v35[0] = @"This type only supports encoding and decoding via NSXPCCoder.";
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v32 = [v29 errorWithDomain:v30 code:4866 userInfo:v31];
    [v4 failWithError:v32];

    v28 = 0;
  }

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SWShareableContent *)self sourceSceneIdentifier];
    id v6 = NSStringFromSelector(sel_sourceSceneIdentifier);
    [v4 encodeObject:v5 forKey:v6];

    id v7 = [(SWShareableContent *)self sourceBundleIdentifier];
    uint64_t v8 = NSStringFromSelector(sel_sourceBundleIdentifier);
    [v4 encodeObject:v7 forKey:v8];

    uint64_t v9 = [(SWShareableContent *)self metadata];
    uint64_t v10 = NSStringFromSelector(sel_metadata);
    [v4 encodeObject:v9 forKey:v10];

    uint64_t v11 = [(SWShareableContent *)self representations];
    uint64_t v12 = NSStringFromSelector(sel_representations);
    [v4 encodeObject:v11 forKey:v12];

    id v13 = [(SWShareableContent *)self highlightURL];
    long long v14 = NSStringFromSelector(sel_highlightURL);
    [v4 encodeObject:v13 forKey:v14];

    uint64_t v15 = [(SWShareableContent *)self initiatorHandle];
    uint64_t v16 = NSStringFromSelector(sel_initiatorHandle);
    [v4 encodeObject:v15 forKey:v16];

    id v17 = [(SWShareableContent *)self initiatorNameComponents];
    long long v18 = NSStringFromSelector(sel_initiatorNameComponents);
    [v4 encodeObject:v17 forKey:v18];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F281F8];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = @"This type only supports encoding and decoding via NSXPCCoder.";
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v22 = [v19 errorWithDomain:v20 code:4866 userInfo:v21];
    [v4 failWithError:v22];
  }
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (NSString)sourceSceneIdentifier
{
  return self->_sourceSceneIdentifier;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (SWShareableContentRepresentationProvider)representationProvider
{
  return self->_representationProvider;
}

- (void)setRepresentationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representationProvider, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_highlightURL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end