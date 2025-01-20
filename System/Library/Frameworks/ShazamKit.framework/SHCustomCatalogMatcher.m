@interface SHCustomCatalogMatcher
- (MRE)mre;
- (SHCustomCatalog)customCatalog;
- (SHCustomCatalogMatcher)initWithCustomCatalog:(id)a3;
- (SHMatcherDelegate)delegate;
- (id)MRESignaturesFromMatches:(id)a3;
- (id)matchFromMREResults:(id)a3 signature:(id)a4;
- (id)matchSignature:(id)a3;
- (id)matcherResponseFrom:(id)a3 querySignature:(id)a4 error:(id)a5;
- (int64_t)algorithmToMREAlgorithm:(int64_t)a3;
- (int64_t)storeDensityToMREDensity:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
@end

@implementation SHCustomCatalogMatcher

- (SHCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHCustomCatalogMatcher;
  v6 = [(SHCustomCatalogMatcher *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customCatalog, a3);
    v8 = [(SHCustomCatalogMatcher *)v7 customCatalog];
    v9 = [v8 customCatalogContainer];
    v10 = [v9 referenceSignatures];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Custom catalogs must contain at least one signature" userInfo:0];
      objc_exception_throw(v13);
    }
  }

  return v7;
}

- (int64_t)algorithmToMREAlgorithm:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)storeDensityToMREDensity:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 3;
  }
  else {
    return qword_224BC3EE8[a3 - 1];
  }
}

- (MRE)mre
{
  v21[1] = *MEMORY[0x263EF8340];
  mre = self->_mre;
  if (!mre)
  {
    v4 = [(SHCustomCatalogMatcher *)self customCatalog];
    id v5 = [v4 customCatalogContainer];
    v6 = [v5 referenceSignatures];
    v7 = [(SHCustomCatalogMatcher *)self MRESignaturesFromMatches:v6];

    v8 = [MRE alloc];
    v9 = [(SHCustomCatalogMatcher *)self customCatalog];
    v10 = [v9 _configuration];
    int64_t v11 = -[SHCustomCatalogMatcher storeDensityToMREDensity:](self, "storeDensityToMREDensity:", [v10 density]);
    v12 = [(SHCustomCatalogMatcher *)self customCatalog];
    id v13 = [v12 _configuration];
    id v19 = 0;
    objc_super v14 = -[MRE initWithSignatures:density:algorithm:error:](v8, "initWithSignatures:density:algorithm:error:", v7, v11, -[SHCustomCatalogMatcher algorithmToMREAlgorithm:](self, "algorithmToMREAlgorithm:", [v13 algorithm]), &v19);
    id v15 = v19;
    v16 = self->_mre;
    self->_mre = v14;

    if (v15)
    {
      uint64_t v20 = *MEMORY[0x263F08608];
      v21[0] = v15;
      [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Could not initialize custom catalog" userInfo:objc_claimAutoreleasedReturnValue()];
      objc_exception_throw(v18);
    }

    mre = self->_mre;
  }

  return mre;
}

- (id)MRESignaturesFromMatches:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134217984;
    uint64_t v15 = [v3 count];
    _os_log_impl(&dword_224B4B000, v5, OS_LOG_TYPE_DEBUG, "Initialising MRE with %lu tracks", (uint8_t *)&v14, 0xCu);
  }

  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [MRESignature alloc];
      v8 = [v3 objectAtIndexedSubscript:v6];
      v9 = [v8 signature];
      v10 = [v9 dataRepresentation];
      int64_t v11 = [(MRESignature *)v7 initWithSignatureData:v10 trackID:v6];

      [v4 addObject:v11];
      ++v6;
    }
    while ([v3 count] > v6);
  }
  v12 = (void *)[v4 copy];

  return v12;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  id v7 = [(SHCustomCatalogMatcher *)self delegate];
  id v5 = [v4 signature];

  unint64_t v6 = [(SHCustomCatalogMatcher *)self matchSignature:v5];
  [v7 matcher:self didProduceResponse:v6];
}

- (id)matchSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(SHCustomCatalogMatcher *)self mre];
  unint64_t v6 = [v4 dataRepresentation];
  id v11 = 0;
  id v7 = [v5 search:v6 error:&v11];
  id v8 = v11;

  v9 = [(SHCustomCatalogMatcher *)self matcherResponseFrom:v7 querySignature:v4 error:v8];

  return v9;
}

- (id)matcherResponseFrom:(id)a3 querySignature:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [(SHCustomCatalogMatcher *)self matchFromMREResults:v8 signature:v9];
    v12 = +[SHMatcherResponse matchWithRecordingIntermission:v11 recordingSignatureOffset:0.0 retrySeconds:0.0 match:0.0];
  }
  else
  {
    if (v10)
    {
      uint64_t v13 = +[SHMatcherResponse errorResponseForSignature:v9 error:v10];
    }
    else
    {
      [v9 duration];
      double v15 = v14;
      uint64_t v16 = [(SHCustomCatalogMatcher *)self customCatalog];
      [v16 minimumQuerySignatureDuration];
      double v18 = v15 + v17;

      id v19 = [(SHCustomCatalogMatcher *)self customCatalog];
      [v19 maximumQuerySignatureDuration];
      double v21 = v20;

      if (v18 >= v21) {
        double v18 = v21;
      }
      [v9 duration];
      double v23 = v22;
      v24 = [(SHCustomCatalogMatcher *)self customCatalog];
      [v24 maximumQuerySignatureDuration];
      if (v23 >= v25) {
        double v26 = 0.0;
      }
      else {
        double v26 = v18;
      }

      uint64_t v13 = +[SHMatcherResponse noMatchWithRecordingIntermission:v9 recordingSignatureOffset:0.0 retrySeconds:0.0 signature:v26];
    }
    v12 = (void *)v13;
  }

  return v12;
}

- (id)matchFromMREResults:(id)a3 signature:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v30 = a4;
  v29 = [MEMORY[0x263EFF980] array];
  id v7 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = [(SHCustomCatalogMatcher *)self customCatalog];
        double v14 = [v13 customCatalogContainer];
        double v15 = objc_msgSend(v14, "referenceSignatureForTrackID:", objc_msgSend(v12, "trackID"));

        if (v15)
        {
          uint64_t v16 = [v15 ID];
          char v17 = [v7 containsObject:v16];

          if ((v17 & 1) == 0)
          {
            double v18 = [v15 ID];
            [v7 addObject:v18];

            id v19 = [(SHCustomCatalogMatcher *)self customCatalog];
            double v20 = [v19 customCatalogContainer];
            double v21 = [v20 mediaItemsForReferenceSignature:v15];

            double v22 = [SHMREMatch alloc];
            double v23 = [(SHMREMatch *)v22 initWithResult:v12 mediaItems:v21 signatureAlignments:MEMORY[0x263EFFA68] querySignature:v30];
            v24 = [(SHMREMatch *)v23 toMatchedMediaItems];
            [v29 addObjectsFromArray:v24];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  double v25 = [SHMatch alloc];
  double v26 = (void *)[v29 copy];
  v27 = [(SHMatch *)v25 initWithMediaItems:v26 forSignature:v30];

  return v27;
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHCustomCatalog)customCatalog
{
  return self->_customCatalog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCatalog, 0);
  objc_storeStrong((id *)&self->_mre, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end