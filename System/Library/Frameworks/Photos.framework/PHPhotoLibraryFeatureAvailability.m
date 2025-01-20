@interface PHPhotoLibraryFeatureAvailability
- (BOOL)isEqual:(id)a3;
- (BOOL)libraryHasEnoughCuratedAssets;
- (BOOL)photosKnowledgeGraphIsReady;
- (BOOL)stillAssetEmbeddingsAreIndexedEnough;
- (PHPhotoLibraryFeatureAvailability)initWithFeature:(unint64_t)a3;
- (double)fractionOfAssetsWithCaptions;
- (double)fractionOfAssetsWithEmbeddings;
- (double)fractionOfAssetsWithEmbeddingsInIndex;
- (double)fractionOfAssetsWithFaceAnalysis;
- (double)fractionOfAssetsWithFacesInIndex;
- (double)fractionOfAssetsWithSceneAnalysis;
- (double)fractionOfAssetsWithScenesInIndex;
- (double)fractionOfCuratedAssetsWithCaptions;
- (double)fractionOfCuratedAssetsWithEmbeddings;
- (double)fractionOfCuratedAssetsWithEmbeddingsInIndex;
- (double)fractionOfHighlightsEnriched;
- (double)fractionOfStillAssetsWithCaptions;
- (double)fractionOfStillAssetsWithEmbeddings;
- (double)fractionOfStillAssetsWithEmbeddingsInIndex;
- (id)debugDescription;
- (int64_t)featureAvailability;
- (unint64_t)feature;
- (unint64_t)numberOfCuratedAssets;
- (void)setFeatureAvailability:(int64_t)a3;
- (void)setFractionOfAssetsWithCaptions:(double)a3;
- (void)setFractionOfAssetsWithEmbeddings:(double)a3;
- (void)setFractionOfAssetsWithEmbeddingsInIndex:(double)a3;
- (void)setFractionOfAssetsWithFaceAnalysis:(double)a3;
- (void)setFractionOfAssetsWithFacesInIndex:(double)a3;
- (void)setFractionOfAssetsWithSceneAnalysis:(double)a3;
- (void)setFractionOfAssetsWithScenesInIndex:(double)a3;
- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3;
- (void)setFractionOfCuratedAssetsWithEmbeddings:(double)a3;
- (void)setFractionOfCuratedAssetsWithEmbeddingsInIndex:(double)a3;
- (void)setFractionOfHighlightsEnriched:(double)a3;
- (void)setFractionOfStillAssetsWithCaptions:(double)a3;
- (void)setFractionOfStillAssetsWithEmbeddings:(double)a3;
- (void)setFractionOfStillAssetsWithEmbeddingsInIndex:(double)a3;
- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3;
- (void)setNumberOfCuratedAssets:(unint64_t)a3;
- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3;
- (void)setStillAssetEmbeddingsAreIndexedEnough:(BOOL)a3;
@end

@implementation PHPhotoLibraryFeatureAvailability

- (void)setFeatureAvailability:(int64_t)a3
{
  self->_featureAvailability = a3;
}

- (int64_t)featureAvailability
{
  return self->_featureAvailability;
}

- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssets = a3;
}

- (BOOL)libraryHasEnoughCuratedAssets
{
  return self->_libraryHasEnoughCuratedAssets;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
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

- (void)setFractionOfCuratedAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInIndex = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddings = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddings
{
  return self->_fractionOfCuratedAssetsWithEmbeddings;
}

- (void)setStillAssetEmbeddingsAreIndexedEnough:(BOOL)a3
{
  self->_stillAssetEmbeddingsAreIndexedEnough = a3;
}

- (BOOL)stillAssetEmbeddingsAreIndexedEnough
{
  return self->_stillAssetEmbeddingsAreIndexedEnough;
}

- (void)setFractionOfStillAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfStillAssetsWithEmbeddingsInIndex = a3;
}

- (double)fractionOfStillAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfStillAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfStillAssetsWithCaptions:(double)a3
{
  self->_fractionOfStillAssetsWithCaptions = a3;
}

- (double)fractionOfStillAssetsWithCaptions
{
  return self->_fractionOfStillAssetsWithCaptions;
}

- (void)setFractionOfStillAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfStillAssetsWithEmbeddings = a3;
}

- (double)fractionOfStillAssetsWithEmbeddings
{
  return self->_fractionOfStillAssetsWithEmbeddings;
}

- (void)setFractionOfAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfAssetsWithEmbeddingsInIndex = a3;
}

- (double)fractionOfAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfAssetsWithFacesInIndex:(double)a3
{
  self->_fractionOfAssetsWithFacesInIndex = a3;
}

- (double)fractionOfAssetsWithFacesInIndex
{
  return self->_fractionOfAssetsWithFacesInIndex;
}

- (void)setFractionOfAssetsWithScenesInIndex:(double)a3
{
  self->_fractionOfAssetsWithScenesInIndex = a3;
}

- (double)fractionOfAssetsWithScenesInIndex
{
  return self->_fractionOfAssetsWithScenesInIndex;
}

- (void)setFractionOfAssetsWithCaptions:(double)a3
{
  self->_fractionOfAssetsWithCaptions = a3;
}

- (double)fractionOfAssetsWithCaptions
{
  return self->_fractionOfAssetsWithCaptions;
}

- (void)setFractionOfAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfAssetsWithEmbeddings = a3;
}

- (double)fractionOfAssetsWithEmbeddings
{
  return self->_fractionOfAssetsWithEmbeddings;
}

- (void)setFractionOfAssetsWithFaceAnalysis:(double)a3
{
  self->_fractionOfAssetsWithFaceAnalysis = a3;
}

- (double)fractionOfAssetsWithFaceAnalysis
{
  return self->_fractionOfAssetsWithFaceAnalysis;
}

- (void)setFractionOfAssetsWithSceneAnalysis:(double)a3
{
  self->_fractionOfAssetsWithSceneAnalysis = a3;
}

- (double)fractionOfAssetsWithSceneAnalysis
{
  return self->_fractionOfAssetsWithSceneAnalysis;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"-- General Processing Availability --\n"];
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithSceneAnalysis];
  objc_msgSend(v3, "appendFormat:", @"Scene analysis progress (all assets): %f\n", v4);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithFaceAnalysis];
  objc_msgSend(v3, "appendFormat:", @"Face analysis progress (all assets): %f\n", v5);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithEmbeddings];
  objc_msgSend(v3, "appendFormat:", @"Embedding progress (all assets): %f\n", v6);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithCaptions];
  objc_msgSend(v3, "appendFormat:", @"Captioning progress (all assets): %f\n", v7);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithScenesInIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (scenes): %f\n", v8);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithFacesInIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (faces): %f\n", v9);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithEmbeddingsInIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (embeddings): %f\n", v10);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddings];
  objc_msgSend(v3, "appendFormat:", @"Embedding progress (curated assets): %f\n", v11);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithCaptions];
  objc_msgSend(v3, "appendFormat:", @"Captioning progress (curated assets): %f\n", v12);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddingsInIndex];
  objc_msgSend(v3, "appendFormat:", @"Search indexing progress (curated asset embeddings): %f\n", v13);
  [(PHPhotoLibraryFeatureAvailability *)self fractionOfHighlightsEnriched];
  objc_msgSend(v3, "appendFormat:", @"Highlights progress: %f\n", v14);
  if ([(PHPhotoLibraryFeatureAvailability *)self photosKnowledgeGraphIsReady]) {
    v15 = @"true";
  }
  else {
    v15 = @"false";
  }
  [v3 appendFormat:@"Photos Knowledge Graph is Ready: %@\n", v15];
  objc_msgSend(v3, "appendFormat:", @"Count of curated assets: %lu\n", -[PHPhotoLibraryFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if ([(PHPhotoLibraryFeatureAvailability *)self stillAssetEmbeddingsAreIndexedEnough])
  {
    v16 = @"true";
  }
  else
  {
    v16 = @"false";
  }
  [v3 appendFormat:@"Enough still assets are in the index: %@\n", v16];
  if ([(PHPhotoLibraryFeatureAvailability *)self libraryHasEnoughCuratedAssets]) {
    v17 = @"true";
  }
  else {
    v17 = @"false";
  }
  [v3 appendFormat:@"Library has enough curated assets: %@\n", v17];
  if ([(PHPhotoLibraryFeatureAvailability *)self featureAvailability]) {
    v18 = @"true";
  }
  else {
    v18 = @"false";
  }
  [v3 appendFormat:@"Is Processing done: %@\n", v18];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PHPhotoLibraryFeatureAvailability *)a3;
  if (v4 == self)
  {
    BOOL v45 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(PHPhotoLibraryFeatureAvailability *)self feature];
      if (v6 != [(PHPhotoLibraryFeatureAvailability *)v5 feature]) {
        goto LABEL_22;
      }
      BOOL v7 = [(PHPhotoLibraryFeatureAvailability *)self photosKnowledgeGraphIsReady];
      if (v7 != [(PHPhotoLibraryFeatureAvailability *)v5 photosKnowledgeGraphIsReady]) {
        goto LABEL_22;
      }
      int64_t v8 = [(PHPhotoLibraryFeatureAvailability *)self featureAvailability];
      if (v8 != [(PHPhotoLibraryFeatureAvailability *)v5 featureAvailability]) {
        goto LABEL_22;
      }
      unint64_t v9 = [(PHPhotoLibraryFeatureAvailability *)self numberOfCuratedAssets];
      if (v9 != [(PHPhotoLibraryFeatureAvailability *)v5 numberOfCuratedAssets]) {
        goto LABEL_22;
      }
      BOOL v10 = [(PHPhotoLibraryFeatureAvailability *)self stillAssetEmbeddingsAreIndexedEnough];
      if (v10 != [(PHPhotoLibraryFeatureAvailability *)v5 stillAssetEmbeddingsAreIndexedEnough])goto LABEL_22; {
      BOOL v11 = [(PHPhotoLibraryFeatureAvailability *)self libraryHasEnoughCuratedAssets];
      }
      if (v11 != [(PHPhotoLibraryFeatureAvailability *)v5 libraryHasEnoughCuratedAssets])goto LABEL_22; {
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithSceneAnalysis];
      }
      double v13 = v12;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithSceneAnalysis];
      if (vabdd_f64(v13, v14) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithFaceAnalysis];
      double v16 = v15;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithFaceAnalysis];
      if (vabdd_f64(v16, v17) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithEmbeddings];
      double v19 = v18;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithEmbeddings];
      if (vabdd_f64(v19, v20) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithCaptions];
      double v22 = v21;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithCaptions];
      if (vabdd_f64(v22, v23) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithScenesInIndex];
      double v25 = v24;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithScenesInIndex];
      if (vabdd_f64(v25, v26) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithFacesInIndex];
      double v28 = v27;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithFacesInIndex];
      if (vabdd_f64(v28, v29) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfAssetsWithEmbeddingsInIndex];
      double v31 = v30;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfAssetsWithEmbeddingsInIndex];
      if (vabdd_f64(v31, v32) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddings];
      double v34 = v33;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfCuratedAssetsWithEmbeddings];
      if (vabdd_f64(v34, v35) >= 2.22044605e-16) {
        goto LABEL_22;
      }
      [(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithCaptions];
      double v37 = v36;
      [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfCuratedAssetsWithCaptions];
      if (vabdd_f64(v37, v38) < 2.22044605e-16
        && ([(PHPhotoLibraryFeatureAvailability *)self fractionOfCuratedAssetsWithEmbeddingsInIndex], double v40 = v39, [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfCuratedAssetsWithEmbeddingsInIndex], vabdd_f64(v40, v41) < 2.22044605e-16))
      {
        [(PHPhotoLibraryFeatureAvailability *)self fractionOfHighlightsEnriched];
        double v43 = v42;
        [(PHPhotoLibraryFeatureAvailability *)v5 fractionOfHighlightsEnriched];
        BOOL v45 = vabdd_f64(v43, v44) < 2.22044605e-16;
      }
      else
      {
LABEL_22:
        BOOL v45 = 0;
      }
    }
    else
    {
      BOOL v45 = 0;
    }
  }

  return v45;
}

- (PHPhotoLibraryFeatureAvailability)initWithFeature:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHPhotoLibraryFeatureAvailability;
  uint64_t v4 = [(PHPhotoLibraryFeatureAvailability *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_feature = a3;
    unint64_t v6 = v4;
  }

  return v5;
}

@end