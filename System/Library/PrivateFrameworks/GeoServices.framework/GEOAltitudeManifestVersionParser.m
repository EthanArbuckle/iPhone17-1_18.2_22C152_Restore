@interface GEOAltitudeManifestVersionParser
- (GEOAltitudeManifestVersionParser)initWithFileURL:(id)a3;
- (id)parse:(id *)a3;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation GEOAltitudeManifestVersionParser

- (GEOAltitudeManifestVersionParser)initWithFileURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOAltitudeManifestVersionParser;
  v5 = [(GEOAltitudeManifestVersionParser *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_parsed.lock._os_unfair_lock_opaque = 0;
    v5->_parsed.didRun = 0;
    uint64_t v7 = [v4 copy];
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)parse:(id *)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__GEOAltitudeManifestVersionParser_parse___block_invoke;
  v6[3] = &unk_1E53D79D8;
  v6[4] = self;
  GEOOnce((uint64_t)&self->_parsed, v6);
  if (a3) {
    *a3 = self->_parseError;
  }
  return self->_versions;
}

void __42__GEOAltitudeManifestVersionParser_parse___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(GEOFlyoverRegionVersions);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v11 = (id)[objc_alloc(MEMORY[0x1E4F29250]) initWithContentsOfURL:*(void *)(*(void *)(a1 + 32) + 16)];
  [v11 setDelegate:*(void *)(a1 + 32)];
  [v11 parse];
  uint64_t v5 = [v11 parserError];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  v8 = [v11 parserError];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = 0;
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v20 = a7;
  if ([a4 isEqualToString:@"trigger"])
  {
    if ([v20 count])
    {
      uint64_t v9 = [v20 objectForKey:@"region"];

      if (v9)
      {
        v10 = [v20 objectForKey:@"region"];
        uint64_t v11 = [v10 intValue];

        v12 = [v20 objectForKey:@"version"];
        unsigned int v13 = [v12 intValue];

        uint64_t v14 = v13;
        v15 = [v20 objectForKey:@"dataversion"];

        if (v15)
        {
          v16 = [v20 objectForKey:@"dataversion"];
          unsigned int v17 = [v16 intValue];

          uint64_t v18 = v14 | 0x700000000;
          uint64_t v19 = v17;
        }
        else
        {
          uint64_t v19 = 0;
          uint64_t v18 = v13 | 0x600000000;
        }
        [(GEOFlyoverRegionVersions *)(uint64_t)self->_versions addRegion:v18];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_versions, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end