@interface SHCustomCatalogTrackerMatcher
- (SHCustomCatalogConfiguration)customCatalogConfiguration;
- (SHCustomCatalogContainer)container;
- (SHCustomCatalogTrackerMatcher)initWithCustomCatalogConfiguration:(id)a3 container:(id)a4;
- (SHMatcherDelegate)delegate;
- (id)matchFromMREResults:(id)a3 signature:(id)a4 signatureAlignments:(id)a5;
- (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
@end

@implementation SHCustomCatalogTrackerMatcher

- (SHCustomCatalogTrackerMatcher)initWithCustomCatalogConfiguration:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHCustomCatalogTrackerMatcher;
  v9 = [(SHCustomCatalogTrackerMatcher *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customCatalogConfiguration, a3);
    objc_storeStrong((id *)&v10->_container, a4);
    v11 = [(SHCustomCatalogTrackerMatcher *)v10 container];
    v12 = [v11 referenceSignatures];
    uint64_t v13 = [v12 count];

    if (v13 != 1)
    {
      id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Tracking only supports one reference signature" userInfo:0];
      objc_exception_throw(v15);
    }
  }

  return v10;
}

- (void)startRecognitionForRequest:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 signature];
  [v5 duration];
  double v7 = v6;
  +[SHCustomCatalogConfiguration minimumQuerySignatureDurationForTracking];
  double v9 = v8;

  if (v7 >= v9)
  {
    v21 = [(SHCustomCatalogTrackerMatcher *)self container];
    v22 = [v21 referenceSignatures];
    id v26 = [v22 firstObject];

    v23 = [(SHCustomCatalogTrackerMatcher *)self delegate];
    v24 = [v4 signature];

    v25 = [(SHCustomCatalogTrackerMatcher *)self trackQuerySignature:v24 inReferenceSignature:v26];
    [v23 matcher:self didProduceResponse:v25];
  }
  else
  {
    v10 = [(SHCustomCatalogTrackerMatcher *)self delegate];
    v11 = [v4 signature];
    uint64_t v27 = *MEMORY[0x263F07F80];
    v12 = NSString;
    uint64_t v13 = [v4 signature];

    [v13 duration];
    uint64_t v15 = v14;
    +[SHCustomCatalogConfiguration minimumQuerySignatureDurationForTracking];
    v17 = [v12 stringWithFormat:@"Signature cannot be tracked with duration of %.2f secs it must be at least %.2f secs in duration", v15, v16];
    v28[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v19 = +[SHError errorWithCode:202 underlyingError:0 keyOverrides:v18];
    v20 = +[SHMatcherResponse errorResponseForSignature:v11 error:v19];
    [v10 matcher:self didProduceResponse:v20];
  }
}

- (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 signature];
  double v9 = [(SHCustomCatalogTrackerMatcher *)self customCatalogConfiguration];
  id v17 = 0;
  v10 = +[SHContinuityTracker trackQuerySignature:v6 inReferenceSignature:v8 configuration:v9 error:&v17];
  id v11 = v17;

  if ([v10 count])
  {
    v12 = -[MREResult initWithTrackId:offset:timeSkew:freqSkew:score:]([MREResult alloc], "initWithTrackId:offset:timeSkew:freqSkew:score:", [v7 trackID], &unk_26D7E5458, &unk_26D7E5458, &unk_26D7E5458, 0.0);
    v18[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

    uint64_t v14 = [(SHCustomCatalogTrackerMatcher *)self matchFromMREResults:v13 signature:v6 signatureAlignments:v10];
    uint64_t v15 = +[SHMatcherResponse matchWithRecordingIntermission:v14 recordingSignatureOffset:0.0 retrySeconds:0.0 match:0.0];
  }
  else
  {
    if (v11) {
      +[SHMatcherResponse errorResponseForSignature:v6 error:v11];
    }
    else {
    uint64_t v15 = +[SHMatcherResponse noMatchWithRecordingIntermission:v6 recordingSignatureOffset:0.0 retrySeconds:0.0 signature:0.0];
    }
  }

  return v15;
}

- (id)matchFromMREResults:(id)a3 signature:(id)a4 signatureAlignments:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v26 = a4;
  id v27 = a5;
  double v9 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v16 = [(SHCustomCatalogTrackerMatcher *)self container];
        id v17 = objc_msgSend(v16, "referenceSignatureForTrackID:", objc_msgSend(v15, "trackID"));

        if (v17)
        {
          v18 = [(SHCustomCatalogTrackerMatcher *)self container];
          v19 = [v18 mediaItemsForReferenceSignature:v17];

          v20 = [[SHMREMatch alloc] initWithResult:v15 mediaItems:v19 signatureAlignments:v27 querySignature:v26];
          v21 = [(SHMREMatch *)v20 toMatchedMediaItems];
          [v9 addObjectsFromArray:v21];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  v22 = [SHMatch alloc];
  v23 = (void *)[v9 copy];
  v24 = [(SHMatch *)v22 initWithMediaItems:v23 forSignature:v26];

  return v24;
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHCustomCatalogConfiguration)customCatalogConfiguration
{
  return self->_customCatalogConfiguration;
}

- (SHCustomCatalogContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_customCatalogConfiguration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end