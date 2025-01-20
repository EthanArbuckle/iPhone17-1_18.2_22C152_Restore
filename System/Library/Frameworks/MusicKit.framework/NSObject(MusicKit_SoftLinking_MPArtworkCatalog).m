@interface NSObject(MusicKit_SoftLinking_MPArtworkCatalog)
- (double)musicKit_fittingSize;
- (id)_musicKit_self_artworkCatalog;
- (id)musicKit_artworkCatalogWithFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog;
- (id)musicKit_artworkDataSourceIdentifier;
- (id)musicKit_artworkDataSourceShortDescription;
- (id)musicKit_artworkDictionary;
- (id)musicKit_artworkTokenParameters;
- (id)musicKit_existingColorAnalysis;
- (id)musicKit_visualIdenticalityIdentifier;
- (void)musicKit_requestColorAnalysisWithCompletionHandler:()MusicKit_SoftLinking_MPArtworkCatalog;
- (void)musicKit_requestImageDataWithCompletion:()MusicKit_SoftLinking_MPArtworkCatalog;
- (void)musicKit_setFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog;
@end

@implementation NSObject(MusicKit_SoftLinking_MPArtworkCatalog)

- (id)musicKit_visualIdenticalityIdentifier
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v2 = [v1 visualIdenticalityIdentifier];

  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 stringRepresentation];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_artworkDictionary
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v2 = [v1 token];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v3 = (void *)getMPStoreArtworkRequestTokenClass_softClass_0;
  uint64_t v13 = getMPStoreArtworkRequestTokenClass_softClass_0;
  if (!getMPStoreArtworkRequestTokenClass_softClass_0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getMPStoreArtworkRequestTokenClass_block_invoke_0;
    v9[3] = &unk_26443F950;
    v9[4] = &v10;
    __getMPStoreArtworkRequestTokenClass_block_invoke_0((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v2 imageArtworkInfo];
    v6 = [v5 responseDictionary];
    if (!v6)
    {
      v7 = [v5 responseArray];
      v6 = [v7 firstObject];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)musicKit_artworkTokenParameters
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v2 = [v1 token];

  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 artworkTokenParameters];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_musicKit_self_artworkCatalog
{
  getMPArtworkCatalogClass_0();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)musicKit_artworkDataSourceShortDescription
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  id v2 = [v1 dataSource];

  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    v3 = [(id)objc_opt_class() artworkDataSourceShortDescription];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_artworkDataSourceIdentifier
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  id v2 = [v1 dataSource];

  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 artworkDataSourceIdentifier];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)musicKit_existingColorAnalysis
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  id v2 = [v1 existingColorAnalysisWithAlgorithm:1];

  return v2;
}

- (id)musicKit_artworkCatalogWithFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog
{
  v6 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v7 = [v6 dataSource];
  if (v7)
  {
    id v8 = objc_alloc((Class)getMPArtworkCatalogClass_0());
    v9 = [v6 token];
    id v10 = (id)[v8 initWithToken:v9 dataSource:v7];
  }
  else
  {
    v11 = MusicKit_Logging_Artwork();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NSObject(MusicKit_SoftLinking_MPArtworkCatalog) musicKit_artworkCatalogWithFittingSize:]((uint64_t)v6, v11);
    }

    id v10 = a1;
  }
  objc_msgSend(v10, "musicKit_setFittingSize:", a2, a3);

  return v10;
}

- (double)musicKit_fittingSize
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  [v1 fittingSize];
  double v3 = v2;

  return v3;
}

- (void)musicKit_setFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog
{
  objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFittingSize:", a2, a3);
}

- (void)musicKit_requestImageDataWithCompletion:()MusicKit_SoftLinking_MPArtworkCatalog
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestImageDataWithCompletion___block_invoke;
  v7[3] = &unk_2644403A8;
  id v8 = v4;
  id v6 = v4;
  [v5 requestImageWithCompletion:v7];
}

- (void)musicKit_requestColorAnalysisWithCompletionHandler:()MusicKit_SoftLinking_MPArtworkCatalog
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_musicKit_self_artworkCatalog");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __102__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestColorAnalysisWithCompletionHandler___block_invoke;
  v7[3] = &unk_2644403D0;
  id v8 = v4;
  id v6 = v4;
  [v5 requestColorAnalysisWithAlgorithm:1 completion:v7];
}

- (void)musicKit_artworkCatalogWithFittingSize:()MusicKit_SoftLinking_MPArtworkCatalog .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21CC71000, a2, OS_LOG_TYPE_FAULT, "Data source for artwork catalog %{public}@ was deallocated prematurely. Unable to make a proper fresh instance.", (uint8_t *)&v2, 0xCu);
}

@end