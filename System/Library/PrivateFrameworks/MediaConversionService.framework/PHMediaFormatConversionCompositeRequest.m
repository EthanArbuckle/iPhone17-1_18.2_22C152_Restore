@interface PHMediaFormatConversionCompositeRequest
- (BOOL)areAllSubrequestsPreflighted;
- (BOOL)isCompositeRequest;
- (BOOL)requiresAccessibilityDescriptionMetadataChange;
- (BOOL)requiresCaptionMetadataChange;
- (BOOL)requiresCreationDateMetadataChange;
- (BOOL)requiresFormatConversion;
- (BOOL)requiresLocationMetadataChange;
- (id)compositeRequestCommonInitWithError:(id *)a3;
- (void)didFinishProcessing;
- (void)enqueueSubrequestsOnConversionManager:(id)a3;
- (void)enumerateSubrequests:(id)a3;
- (void)preflightWithConversionManager:(id)a3;
- (void)propagateRequestOptionsToSubrequests;
- (void)setupProgress;
@end

@implementation PHMediaFormatConversionCompositeRequest

- (void)setupProgress
{
  v3 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PHMediaFormatConversionCompositeRequest_setupProgress__block_invoke;
  v5[3] = &unk_1E6CFEA28;
  id v6 = v3;
  id v4 = v3;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v5];
  [(PHMediaFormatConversionRequest *)self setProgress:v4];
}

void __56__PHMediaFormatConversionCompositeRequest_setupProgress__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount") + 1);
  v5 = *(void **)(a1 + 32);
  id v6 = [v4 progress];

  [v5 addChild:v6 withPendingUnitCount:1];
}

- (void)didFinishProcessing
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PHMediaFormatConversionCompositeRequest_didFinishProcessing__block_invoke;
  v4[3] = &unk_1E6CFEA28;
  v4[4] = self;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  if ([(PHMediaFormatConversionRequest *)self status] == 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v3 = [(PHMediaFormatConversionRequest *)self error];
      *(_DWORD *)buf = 138412546;
      id v6 = self;
      __int16 v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Composite conversion request %@ failed: %@", buf, 0x16u);
    }
  }
  else
  {
    [(PHMediaFormatConversionCompositeRequest *)self postProcessSuccessfulCompositeRequest];
  }
}

void __62__PHMediaFormatConversionCompositeRequest_didFinishProcessing__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if ([*(id *)(a1 + 32) status] != 5)
  {
    uint64_t v5 = [v4 status];
    id v6 = *(void **)(a1 + 32);
    if (v5 == 4)
    {
      [v6 setStatus:4];
    }
    else
    {
      [v6 setStatus:5];
      __int16 v7 = (void *)MEMORY[0x1E4F28C58];
      v8 = [v4 error];
      if (v8)
      {
        uint64_t v11 = *MEMORY[0x1E4F28A50];
        v2 = [v4 error];
        v12[0] = v2;
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      }
      else
      {
        uint64_t v9 = 0;
      }
      v10 = [v7 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:6 userInfo:v9];
      [*(id *)(a1 + 32) setError:v10];

      if (v8)
      {
      }
    }
  }
}

- (void)propagateRequestOptionsToSubrequests
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __79__PHMediaFormatConversionCompositeRequest_propagateRequestOptionsToSubrequests__block_invoke;
  v2[3] = &unk_1E6CFEA28;
  v2[4] = self;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v2];
}

void __79__PHMediaFormatConversionCompositeRequest_propagateRequestOptionsToSubrequests__block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  objc_msgSend(v14, "setLivePhotoPairingIdentifierBehavior:", objc_msgSend(*(id *)(a1 + 32), "livePhotoPairingIdentifierBehavior"));
  v3 = [*(id *)(a1 + 32) livePhotoPairingIdentifier];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) livePhotoPairingIdentifier];
    [v14 setLivePhotoPairingIdentifier:v4];
  }
  if ([*(id *)(a1 + 32) shouldPadOutputFileToEstimatedLength]) {
    [v14 setShouldPadOutputFileToEstimatedLength:1];
  }
  if ([*(id *)(a1 + 32) forceFormatConversion]) {
    [v14 setForceFormatConversion:1];
  }
  uint64_t v5 = [*(id *)(a1 + 32) locationMetadataBehavior];
  id v6 = [*(id *)(a1 + 32) location];
  [v14 setLocationMetadataBehavior:v5 withLocation:v6];

  uint64_t v7 = [*(id *)(a1 + 32) creationDateMetadataBehavior];
  v8 = [*(id *)(a1 + 32) creationDate];
  uint64_t v9 = [*(id *)(a1 + 32) creationDateTimeZone];
  [v14 setCreationDateMetadataBehavior:v7 withCreationDate:v8 inTimeZone:v9];

  uint64_t v10 = [*(id *)(a1 + 32) captionMetadataBehavior];
  uint64_t v11 = [*(id *)(a1 + 32) caption];
  [v14 setCaptionMetadataBehavior:v10 withCaption:v11];

  uint64_t v12 = [*(id *)(a1 + 32) accessibilityDescriptionMetadataBehavior];
  v13 = [*(id *)(a1 + 32) accessibilityDescription];
  [v14 setAccessibilityDescriptionMetadataBehavior:v12 withAccessibilityDescription:v13];
}

- (void)enumerateSubrequests:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Subclasses must override %@", v5 format];
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Subclasses must override %@", v5 format];
}

- (id)compositeRequestCommonInitWithError:(id *)a3
{
  if ([(PHMediaFormatConversionRequest *)self prepareWithError:a3])
  {
    [(PHMediaFormatConversionCompositeRequest *)self setupProgress];
    uint64_t v4 = self;
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (BOOL)requiresAccessibilityDescriptionMetadataChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__PHMediaFormatConversionCompositeRequest_requiresAccessibilityDescriptionMetadataChange__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __89__PHMediaFormatConversionCompositeRequest_requiresAccessibilityDescriptionMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 requiresAccessibilityDescriptionMetadataChange];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)requiresCaptionMetadataChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PHMediaFormatConversionCompositeRequest_requiresCaptionMetadataChange__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __72__PHMediaFormatConversionCompositeRequest_requiresCaptionMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 requiresCaptionMetadataChange];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)requiresCreationDateMetadataChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PHMediaFormatConversionCompositeRequest_requiresCreationDateMetadataChange__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __77__PHMediaFormatConversionCompositeRequest_requiresCreationDateMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 requiresCreationDateMetadataChange];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)requiresLocationMetadataChange
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__PHMediaFormatConversionCompositeRequest_requiresLocationMetadataChange__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __73__PHMediaFormatConversionCompositeRequest_requiresLocationMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 requiresLocationMetadataChange];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)requiresFormatConversion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__PHMediaFormatConversionCompositeRequest_requiresFormatConversion__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __67__PHMediaFormatConversionCompositeRequest_requiresFormatConversion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [a2 requiresFormatConversion];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)areAllSubrequestsPreflighted
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PHMediaFormatConversionCompositeRequest_areAllSubrequestsPreflighted__block_invoke;
  v4[3] = &unk_1E6CFEA50;
  v4[4] = &v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __71__PHMediaFormatConversionCompositeRequest_areAllSubrequestsPreflighted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = [a2 preflighted];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (void)preflightWithConversionManager:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(PHMediaFormatConversionRequest *)self status];
  if (v6 <= 5 && ((1 << v6) & 0x31) != 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    char v8 = [(PHMediaFormatConversionRequest *)self statusString];
    [v7 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 1479, @"Preflight of request in invalid state %@", v8 object file lineNumber description];
  }
  if ([(PHMediaFormatConversionRequest *)self preflighted])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1482 description:@"Preflight of already preflighted request"];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PHMediaFormatConversionCompositeRequest_preflightWithConversionManager___block_invoke;
  v11[3] = &unk_1E6CFEA28;
  id v12 = v5;
  id v9 = v5;
  [(PHMediaFormatConversionCompositeRequest *)self enumerateSubrequests:v11];
  [(PHMediaFormatConversionRequest *)self setPreflighted:1];
}

void __74__PHMediaFormatConversionCompositeRequest_preflightWithConversionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 preflighted] & 1) == 0) {
    [*(id *)(a1 + 32) preflightConversionRequest:v3];
  }
}

- (BOOL)isCompositeRequest
{
  return 1;
}

@end