@interface SHCustomCatalog
- (BOOL)addCustomCatalog:(id)a3 error:(id *)a4;
- (BOOL)addCustomCatalogDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)addCustomCatalogFromURL:(NSURL *)customCatalogURL error:(NSError *)error;
- (BOOL)addReferenceSignature:(SHSignature *)signature representingMediaItems:(NSArray *)mediaItems error:(NSError *)error;
- (BOOL)writeToURL:(NSURL *)destinationURL error:(NSError *)error;
- (NSData)dataRepresentation;
- (SHCustomCatalog)init;
- (SHCustomCatalog)initWithConfiguration:(id)a3 dataRepresentation:(id)a4 error:(id *)a5;
- (SHCustomCatalog)initWithConfiguration:(id)a3 error:(id *)a4;
- (SHCustomCatalog)initWithDataRepresentation:(id)a3 error:(id *)a4;
- (SHCustomCatalogConfiguration)_configuration;
- (SHCustomCatalogContainer)customCatalogContainer;
- (id)_createMatcher;
- (void)enumerateWithBlock:(id)a3;
@end

@implementation SHCustomCatalog

- (SHCustomCatalog)init
{
  v3 = objc_opt_new();
  v4 = [(SHCustomCatalog *)self initWithConfiguration:v3 error:0];

  return v4;
}

- (SHCustomCatalog)initWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [(SHCustomCatalog *)self initWithConfiguration:v7 dataRepresentation:v6 error:a4];

  return v8;
}

- (SHCustomCatalog)initWithConfiguration:(id)a3 dataRepresentation:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(SHCustomCatalog *)self initWithConfiguration:a3 error:a5];
  v10 = v9;
  if (v9
    && ![(SHCustomCatalog *)v9 addCustomCatalogDataRepresentation:v8 error:a5])
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (SHCustomCatalog)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHCustomCatalog;
  id v8 = [(SHCatalog *)&v13 initWithConfiguration:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->__configuration, a3);
    v10 = objc_alloc_init(SHJSONLCustomCatalogContainer);
    customCatalogContainer = v9->_customCatalogContainer;
    v9->_customCatalogContainer = (SHCustomCatalogContainer *)v10;
  }
  return v9;
}

- (BOOL)addCustomCatalogFromURL:(NSURL *)customCatalogURL error:(NSError *)error
{
  id v6 = customCatalogURL;
  id v7 = [(SHCustomCatalog *)self customCatalogContainer];
  char v8 = [v7 loadFromURL:v6 error:error];

  +[SHError remapErrorToClientErrorPointer:error];
  return v8;
}

- (BOOL)addCustomCatalog:(id)a3 error:(id *)a4
{
  id v6 = [a3 dataRepresentation];
  LOBYTE(a4) = [(SHCustomCatalog *)self addCustomCatalogDataRepresentation:v6 error:a4];

  return (char)a4;
}

- (BOOL)addCustomCatalogDataRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SHCustomCatalog *)self customCatalogContainer];
  char v8 = [v7 loadFromData:v6 error:a4];

  if ((v8 & 1) == 0) {
    +[SHError remapErrorToClientErrorPointer:a4];
  }
  return v8;
}

- (BOOL)writeToURL:(NSURL *)destinationURL error:(NSError *)error
{
  id v6 = destinationURL;
  id v7 = [(SHCustomCatalog *)self customCatalogContainer];
  char v8 = [v7 writeToURL:v6 error:error];

  +[SHError remapErrorToClientErrorPointer:error];
  return v8;
}

- (NSData)dataRepresentation
{
  v2 = [(SHCustomCatalog *)self customCatalogContainer];
  v3 = [v2 dataRepresentation];

  return (NSData *)v3;
}

- (BOOL)addReferenceSignature:(SHSignature *)signature representingMediaItems:(NSArray *)mediaItems error:(NSError *)error
{
  v24[1] = *MEMORY[0x263EF8340];
  char v8 = mediaItems;
  v9 = signature;
  [(SHSignature *)v9 duration];
  double v11 = v10;
  [(SHCatalog *)self minimumQuerySignatureDuration];
  double v13 = v12;
  if (v11 < v12)
  {
    v15 = NSString;
    [(SHCatalog *)self minimumQuerySignatureDuration];
    uint64_t v17 = v16;
    [(SHSignature *)v9 duration];
    uint64_t v19 = v18;

    v20 = [v15 stringWithFormat:@"The minimum signature duration allowed is %.2f secs, this signature is only %.2f secs", v17, v19];
    uint64_t v23 = *MEMORY[0x263F08338];
    v24[0] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    +[SHError annotateClientError:error code:201 underlyingError:0 keyOverrides:v21];

    +[SHError remapErrorToClientErrorPointer:error];
  }
  else
  {
    v14 = [(SHCustomCatalog *)self customCatalogContainer];
    [v14 addSignature:v9 representingMediaItems:v8];
  }
  return v11 >= v13;
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(SHCustomCatalog *)self customCatalogContainer];
  id v6 = [v5 referenceSignatures];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      double v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      double v12 = [v11 signature];
      double v13 = [(SHCustomCatalog *)self customCatalogContainer];
      v14 = [v13 mediaItemsForReferenceSignature:v11];
      v4[2](v4, v12, v14, &v19);

      if (v19) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_createMatcher
{
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__SHCustomCatalog__createMatcher__block_invoke;
  v11[3] = &unk_2646EF8F8;
  v11[4] = &v12;
  [(SHCustomCatalog *)self enumerateWithBlock:v11];
  v3 = [(SHCustomCatalog *)self _configuration];
  int v4 = [v3 supportsSignatureTracking];

  if (v4)
  {
    v5 = [SHCustomCatalogTrackerMatcher alloc];
    id v6 = [(SHCustomCatalog *)self _customCatalogConfiguration];
    uint64_t v7 = [(SHCustomCatalog *)self customCatalogContainer];
    uint64_t v8 = [(SHCustomCatalogTrackerMatcher *)v5 initWithCustomCatalogConfiguration:v6 container:v7];
  }
  else
  {
    if (*((unsigned char *)v13 + 24)) {
      uint64_t v9 = off_2646EF368;
    }
    else {
      uint64_t v9 = off_2646EF290;
    }
    uint64_t v8 = (SHCustomCatalogTrackerMatcher *)[objc_alloc(*v9) initWithCustomCatalog:self];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __33__SHCustomCatalog__createMatcher__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 timeRanges];
        if ([v12 count])
        {
        }
        else
        {
          double v13 = [v11 frequencySkewRanges];
          uint64_t v14 = [v13 count];

          if (!v14) {
            continue;
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (SHCustomCatalogConfiguration)_configuration
{
  return self->__configuration;
}

- (SHCustomCatalogContainer)customCatalogContainer
{
  return self->_customCatalogContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCatalogContainer, 0);

  objc_storeStrong((id *)&self->__configuration, 0);
}

@end