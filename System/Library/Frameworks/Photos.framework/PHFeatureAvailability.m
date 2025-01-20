@interface PHFeatureAvailability
- (BOOL)hasConsistentMediaAnalysisImageVersion;
- (BOOL)isAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)libraryHasEnoughCuratedAssets;
- (BOOL)libraryHasEnoughCuratedAssetsIndexedInVUClustering;
- (BOOL)libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex;
- (BOOL)photosKnowledgeGraphIsReady;
- (BOOL)vuIndexIsFullClustered;
- (BOOL)wasComputed;
- (NSDate)dateComputed;
- (NSDate)lastFullVUIndexClusterDate;
- (double)fractionOfAllAssetsAnalyzedForScenes;
- (double)fractionOfAllAssetsWithCaptions;
- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
- (double)fractionOfCuratedAssetsIndexedInVUClustering;
- (double)fractionOfCuratedAssetsWithCaptions;
- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
- (double)fractionOfHighlightsEnriched;
- (id)debugDescription;
- (id)initForFeature:(unint64_t)a3;
- (id)initForFeature:(unint64_t)a3 withPLFeatureAvailability:(id)a4;
- (unint64_t)feature;
- (unint64_t)mediaAnalysisImageVersion;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfCuratedAssets;
- (void)setDateComputed:(id)a3;
- (void)setFeature:(unint64_t)a3;
- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3;
- (void)setFractionOfAllAssetsWithCaptions:(double)a3;
- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3;
- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3;
- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3;
- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3;
- (void)setFractionOfHighlightsEnriched:(double)a3;
- (void)setHasConsistentMediaAnalysisImageVersion:(BOOL)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setLastFullVUIndexClusterDate:(id)a3;
- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3;
- (void)setLibraryHasEnoughCuratedAssetsIndexedInVUClustering:(BOOL)a3;
- (void)setLibraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex:(BOOL)a3;
- (void)setMediaAnalysisImageVersion:(unint64_t)a3;
- (void)setNumberOfAssets:(unint64_t)a3;
- (void)setNumberOfCuratedAssets:(unint64_t)a3;
- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3;
- (void)setVuIndexIsFullClustered:(BOOL)a3;
@end

@implementation PHFeatureAvailability

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComputed, 0);

  objc_storeStrong((id *)&self->_lastFullVUIndexClusterDate, 0);
}

- (void)setDateComputed:(id)a3
{
}

- (NSDate)dateComputed
{
  return self->_dateComputed;
}

- (BOOL)wasComputed
{
  return self->_wasComputed;
}

- (void)setHasConsistentMediaAnalysisImageVersion:(BOOL)a3
{
  self->_hasConsistentMediaAnalysisImageVersion = a3;
}

- (BOOL)hasConsistentMediaAnalysisImageVersion
{
  return self->_hasConsistentMediaAnalysisImageVersion;
}

- (void)setMediaAnalysisImageVersion:(unint64_t)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (unint64_t)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->_numberOfAssets = a3;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (void)setLibraryHasEnoughCuratedAssetsIndexedInVUClustering:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssetsIndexedInVUClustering = a3;
}

- (BOOL)libraryHasEnoughCuratedAssetsIndexedInVUClustering
{
  return self->_libraryHasEnoughCuratedAssetsIndexedInVUClustering;
}

- (void)setLibraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (BOOL)libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssets = a3;
}

- (BOOL)libraryHasEnoughCuratedAssets
{
  return self->_libraryHasEnoughCuratedAssets;
}

- (void)setLastFullVUIndexClusterDate:(id)a3
{
}

- (NSDate)lastFullVUIndexClusterDate
{
  return self->_lastFullVUIndexClusterDate;
}

- (void)setVuIndexIsFullClustered:(BOOL)a3
{
  self->_vuIndexIsFullClustered = a3;
}

- (BOOL)vuIndexIsFullClustered
{
  return self->_vuIndexIsFullClustered;
}

- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3
{
  self->_photosKnowledgeGraphIsReady = a3;
}

- (BOOL)photosKnowledgeGraphIsReady
{
  return self->_photosKnowledgeGraphIsReady;
}

- (void)setFractionOfHighlightsEnriched:(double)a3
{
  self->_fractionOfHighlightsEnriched = a3;
}

- (double)fractionOfHighlightsEnriched
{
  return self->_fractionOfHighlightsEnriched;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3
{
  self->_fractionOfCuratedAssetsIndexedInVUClustering = a3;
}

- (double)fractionOfCuratedAssetsIndexedInVUClustering
{
  return self->_fractionOfCuratedAssetsIndexedInVUClustering;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithCaptions:(double)a3
{
  self->_fractionOfAllAssetsWithCaptions = a3;
}

- (double)fractionOfAllAssetsWithCaptions
{
  return self->_fractionOfAllAssetsWithCaptions;
}

- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3
{
  self->_fractionOfAllAssetsAnalyzedForScenes = a3;
}

- (double)fractionOfAllAssetsAnalyzedForScenes
{
  return self->_fractionOfAllAssetsAnalyzedForScenes;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = PHStringFromAnalysisCoordinatorFeature([(PHFeatureAvailability *)self feature]);
  [v3 appendFormat:@"-- General Processing Availability For %@ --\n", v4];

  [(PHFeatureAvailability *)self fractionOfAllAssetsAnalyzedForScenes];
  objc_msgSend(v3, "appendFormat:", @"Scene analysis progress (all assets): %f\n", v5);
  [(PHFeatureAvailability *)self fractionOfAllAssetsWithCaptions];
  objc_msgSend(v3, "appendFormat:", @"Captioning progress (all assets): %f\n", v6);
  [(PHFeatureAvailability *)self fractionOfAllAssetsWithSceneAnalysisInSearchIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (scenes): %f\n", v7);
  [(PHFeatureAvailability *)self fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (embeddings): %f\n", v8);
  [(PHFeatureAvailability *)self fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (curated assets scenes): %f\n", v9);
  [(PHFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (curated asset embeddings): %f\n", v10);
  [(PHFeatureAvailability *)self fractionOfCuratedAssetsIndexedInVUClustering];
  objc_msgSend(v3, "appendFormat:", @"Clustering indexing progress (curated asset embeddings): %f\n", v11);
  [(PHFeatureAvailability *)self fractionOfCuratedAssetsWithCaptions];
  objc_msgSend(v3, "appendFormat:", @"Captioning progress (curated assets): %f\n", v12);
  [(PHFeatureAvailability *)self fractionOfHighlightsEnriched];
  objc_msgSend(v3, "appendFormat:", @"Highlights progress: %f\n", v13);
  if ([(PHFeatureAvailability *)self photosKnowledgeGraphIsReady]) {
    v14 = @"true";
  }
  else {
    v14 = @"false";
  }
  [v3 appendFormat:@"Photos Knowledge Graph is Ready: %@\n", v14];
  if ([(PHFeatureAvailability *)self vuIndexIsFullClustered]) {
    v15 = @"true";
  }
  else {
    v15 = @"false";
  }
  [v3 appendFormat:@"VU index is full clustered: %@\n", v15];
  objc_msgSend(v3, "appendFormat:", @"Count of curated assets: %lu\n", -[PHFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if ([(PHFeatureAvailability *)self libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex])
  {
    v16 = @"true";
  }
  else
  {
    v16 = @"false";
  }
  [v3 appendFormat:@"Enough curated assets are in the embedding search index: %@\n", v16];
  if ([(PHFeatureAvailability *)self libraryHasEnoughCuratedAssetsIndexedInVUClustering])
  {
    v17 = @"true";
  }
  else
  {
    v17 = @"false";
  }
  [v3 appendFormat:@"Enough curated assets are in the clustering index: %@\n", v17];
  if ([(PHFeatureAvailability *)self libraryHasEnoughCuratedAssets]) {
    v18 = @"true";
  }
  else {
    v18 = @"false";
  }
  [v3 appendFormat:@"Library has enough curated assets: %@\n", v18];
  objc_msgSend(v3, "appendFormat:", @"Total number of assets available for analysis in library: %lu\n", -[PHFeatureAvailability numberOfAssets](self, "numberOfAssets"));
  objc_msgSend(v3, "appendFormat:", @"Total number of curated assets in library: %lu\n", -[PHFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if ([(PHFeatureAvailability *)self wasComputed]) {
    v19 = @"true";
  }
  else {
    v19 = @"false";
  }
  [v3 appendFormat:@"Availability was computed: %@\n", v19];
  v20 = [(PHFeatureAvailability *)self dateComputed];
  [v3 appendFormat:@"Availability was computed on date: %@\n", v20];

  if ([(PHFeatureAvailability *)self isAvailable]) {
    v21 = @"true";
  }
  else {
    v21 = @"false";
  }
  [v3 appendFormat:@"Feature is available: %@\n", v21];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHFeatureAvailability *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(PHFeatureAvailability *)self dateComputed];
      uint64_t v7 = [(PHFeatureAvailability *)v5 dateComputed];
      int IsEqual = PLObjectIsEqual();

      uint64_t v9 = [(PHFeatureAvailability *)self lastFullVUIndexClusterDate];
      uint64_t v10 = [(PHFeatureAvailability *)v5 lastFullVUIndexClusterDate];
      int v11 = PLObjectIsEqual();

      BOOL v12 = 0;
      if (IsEqual && v11)
      {
        unint64_t v13 = [(PHFeatureAvailability *)self feature];
        if (v13 != [(PHFeatureAvailability *)v5 feature]) {
          goto LABEL_26;
        }
        BOOL v14 = [(PHFeatureAvailability *)self wasComputed];
        if (v14 != [(PHFeatureAvailability *)v5 wasComputed]) {
          goto LABEL_26;
        }
        BOOL v15 = [(PHFeatureAvailability *)self photosKnowledgeGraphIsReady];
        if (v15 != [(PHFeatureAvailability *)v5 photosKnowledgeGraphIsReady]) {
          goto LABEL_26;
        }
        BOOL v16 = [(PHFeatureAvailability *)self vuIndexIsFullClustered];
        if (v16 != [(PHFeatureAvailability *)v5 vuIndexIsFullClustered]) {
          goto LABEL_26;
        }
        BOOL v17 = [(PHFeatureAvailability *)self isAvailable];
        if (v17 != [(PHFeatureAvailability *)v5 isAvailable]) {
          goto LABEL_26;
        }
        unint64_t v18 = [(PHFeatureAvailability *)self numberOfCuratedAssets];
        if (v18 != [(PHFeatureAvailability *)v5 numberOfCuratedAssets]) {
          goto LABEL_26;
        }
        unint64_t v19 = [(PHFeatureAvailability *)self numberOfAssets];
        if (v19 != [(PHFeatureAvailability *)v5 numberOfAssets]) {
          goto LABEL_26;
        }
        BOOL v20 = [(PHFeatureAvailability *)self libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex];
        if (v20 != [(PHFeatureAvailability *)v5 libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex])goto LABEL_26; {
        BOOL v21 = [(PHFeatureAvailability *)self libraryHasEnoughCuratedAssetsIndexedInVUClustering];
        }
        if (v21 != [(PHFeatureAvailability *)v5 libraryHasEnoughCuratedAssetsIndexedInVUClustering])goto LABEL_26; {
        BOOL v22 = [(PHFeatureAvailability *)self libraryHasEnoughCuratedAssets];
        }
        if (v22 != [(PHFeatureAvailability *)v5 libraryHasEnoughCuratedAssets]) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfAllAssetsAnalyzedForScenes];
        double v24 = v23;
        [(PHFeatureAvailability *)v5 fractionOfAllAssetsAnalyzedForScenes];
        if (vabdd_f64(v24, v25) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfAllAssetsWithCaptions];
        double v27 = v26;
        [(PHFeatureAvailability *)v5 fractionOfAllAssetsWithCaptions];
        if (vabdd_f64(v27, v28) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfAllAssetsWithSceneAnalysisInSearchIndex];
        double v30 = v29;
        [(PHFeatureAvailability *)v5 fractionOfAllAssetsWithSceneAnalysisInSearchIndex];
        if (vabdd_f64(v30, v31) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
        double v33 = v32;
        [(PHFeatureAvailability *)v5 fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
        if (vabdd_f64(v33, v34) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
        double v36 = v35;
        [(PHFeatureAvailability *)v5 fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
        if (vabdd_f64(v36, v37) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
        double v39 = v38;
        [(PHFeatureAvailability *)v5 fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
        if (vabdd_f64(v39, v40) >= 2.22044605e-16) {
          goto LABEL_26;
        }
        [(PHFeatureAvailability *)self fractionOfCuratedAssetsIndexedInVUClustering];
        double v42 = v41;
        [(PHFeatureAvailability *)v5 fractionOfCuratedAssetsIndexedInVUClustering];
        if (vabdd_f64(v42, v43) < 2.22044605e-16
          && ([(PHFeatureAvailability *)self fractionOfCuratedAssetsWithCaptions],
              double v45 = v44,
              [(PHFeatureAvailability *)v5 fractionOfCuratedAssetsWithCaptions],
              vabdd_f64(v45, v46) < 2.22044605e-16))
        {
          [(PHFeatureAvailability *)self fractionOfHighlightsEnriched];
          double v48 = v47;
          [(PHFeatureAvailability *)v5 fractionOfHighlightsEnriched];
          BOOL v12 = vabdd_f64(v48, v49) < 2.22044605e-16;
        }
        else
        {
LABEL_26:
          BOOL v12 = 0;
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)initForFeature:(unint64_t)a3 withPLFeatureAvailability:(id)a4
{
  id v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PHFeatureAvailability;
  uint64_t v7 = [(PHFeatureAvailability *)&v36 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_feature = a3;
    if (v6)
    {
      uint64_t v9 = [v6 availabilityByFeature];
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
      int v11 = [v9 objectForKeyedSubscript:v10];

      if (v11)
      {
        BOOL v12 = [v6 processingSnapshot];
        v8->_wasComputed = 1;
        v8->_isAvailable = [v11 BOOLValue];
        [v12 fractionOfAllAssetsAnalyzedForScenes];
        v8->_fractionOfAllAssetsAnalyzedForScenes = v13;
        [v12 fractionOfAllAssetsWithSceneAnalysisInSearchIndex];
        v8->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = v14;
        [v12 fractionOfAllAssetsWithMediaAnalysisInSearchIndex];
        v8->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = v15;
        [v12 fractionOfAllAssetsWithCaptions];
        v8->_fractionOfAllAssetsWithCaptions = v16;
        [v12 fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex];
        v8->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = v17;
        [v12 fractionOfCuratedAssetsWithEmbeddingsInVectorIndex];
        v8->_double fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v18;
        [v12 fractionOfCuratedAssetsIndexedInVUClustering];
        v8->_double fractionOfCuratedAssetsIndexedInVUClustering = v19;
        [v12 fractionOfCuratedAssetsWithCaptions];
        v8->_fractionOfCuratedAssetsWithCaptions = v20;
        [v12 fractionOfHighlightsEnriched];
        v8->_fractionOfHighlightsEnriched = v21;
        v8->_photosKnowledgeGraphIsReady = [v12 photosKnowledgeGraphIsReady];
        v8->_vuIndexIsFullClustered = [v12 vuIndexIsFullClustered];
        uint64_t v22 = [v12 lastFullVUIndexClusterDate];
        lastFullVUIndexClusterDate = v8->_lastFullVUIndexClusterDate;
        v8->_lastFullVUIndexClusterDate = (NSDate *)v22;

        v8->_numberOfAssets = [v12 totalAssetCount];
        v8->_unint64_t numberOfCuratedAssets = [v12 totalCuratedAssetCount];
        v8->_mediaAnalysisImageVersion = [v12 mediaAnalysisImageVersion];
        v8->_hasConsistentMediaAnalysisImageVersion = [v12 hasConsistentMediaAnalysisImageVersion];
        uint64_t v24 = [v12 dateComputed];
        dateComputed = v8->_dateComputed;
        v8->_dateComputed = (NSDate *)v24;

        double v26 = (void *)[objc_alloc(MEMORY[0x1E4F8A808]) initWithFeature:a3];
        unint64_t numberOfCuratedAssets = v8->_numberOfCuratedAssets;
        v8->_libraryHasEnoughCuratedAssets = numberOfCuratedAssets >= [v26 minimumNumberOfCuratedAssets];
        double fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v8->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
        [v26 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
        v8->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex = fractionOfCuratedAssetsWithEmbeddingsInVectorIndex >= v29;
        double fractionOfCuratedAssetsIndexedInVUClustering = v8->_fractionOfCuratedAssetsIndexedInVUClustering;
        [v26 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
        v8->_libraryHasEnoughCuratedAssetsIndexedInVUClustering = fractionOfCuratedAssetsIndexedInVUClustering >= v31;
        double v32 = v8;
      }
      else
      {
        double v34 = v8;
      }
    }
    else
    {
      v7->_isAvailable = 0;
      v7->_wasComputed = 0;
      double v33 = v7;
    }
  }

  return v8;
}

- (id)initForFeature:(unint64_t)a3
{
  return [(PHFeatureAvailability *)self initForFeature:a3 withPLFeatureAvailability:0];
}

@end