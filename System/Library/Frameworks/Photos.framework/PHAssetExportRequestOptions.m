@interface PHAssetExportRequestOptions
- (BOOL)allowMetadataConversionsForPNG;
- (BOOL)disableMetadataCorrections;
- (BOOL)disableUpdatingFileCreationDatesOnExportedFileURLs;
- (BOOL)dontAllowRAW;
- (BOOL)flattenSlomoVideos;
- (BOOL)forceAccessibilityDescriptionMetadataBaking;
- (BOOL)forceCaptionMetadataBaking;
- (BOOL)forceDateTimeMetadataBaking;
- (BOOL)forceLocationMetadataBaking;
- (BOOL)includeAllAssetResources;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssetExportRequestOptions:(id)a3;
- (BOOL)shouldBundleComplexAssetResources;
- (BOOL)shouldExportUnmodifiedOriginalResources;
- (BOOL)shouldStripAccessibilityDescription;
- (BOOL)shouldStripCaption;
- (BOOL)shouldStripLocation;
- (BOOL)treatLivePhotoAsStill;
- (NSString)customFilenameBase;
- (NSString)videoExportFileType;
- (NSString)videoExportPreset;
- (OS_dispatch_queue)resultHandlerQueue;
- (id)description;
- (int64_t)locationComparisonStrategy;
- (int64_t)variant;
- (void)setAllowMetadataConversionsForPNG:(BOOL)a3;
- (void)setCustomFilenameBase:(id)a3;
- (void)setDisableMetadataCorrections:(BOOL)a3;
- (void)setDisableUpdatingFileCreationDatesOnExportedFileURLs:(BOOL)a3;
- (void)setDontAllowRAW:(BOOL)a3;
- (void)setFlattenSlomoVideos:(BOOL)a3;
- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3;
- (void)setForceCaptionMetadataBaking:(BOOL)a3;
- (void)setForceDateTimeMetadataBaking:(BOOL)a3;
- (void)setForceLocationMetadataBaking:(BOOL)a3;
- (void)setIncludeAllAssetResources:(BOOL)a3;
- (void)setLocationComparisonStrategy:(int64_t)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setShouldBundleComplexAssetResources:(BOOL)a3;
- (void)setShouldExportUnmodifiedOriginalResources:(BOOL)a3;
- (void)setShouldStripAccessibilityDescription:(BOOL)a3;
- (void)setShouldStripCaption:(BOOL)a3;
- (void)setShouldStripLocation:(BOOL)a3;
- (void)setTreatLivePhotoAsStill:(BOOL)a3;
- (void)setVariant:(int64_t)a3;
- (void)setVideoExportFileType:(id)a3;
- (void)setVideoExportPreset:(id)a3;
@end

@implementation PHAssetExportRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_customFilenameBase, 0);
  objc_storeStrong((id *)&self->_videoExportFileType, 0);

  objc_storeStrong((id *)&self->_videoExportPreset, 0);
}

- (void)setDisableUpdatingFileCreationDatesOnExportedFileURLs:(BOOL)a3
{
  self->_disableUpdatingFileCreationDatesOnExportedFileURLs = a3;
}

- (BOOL)disableUpdatingFileCreationDatesOnExportedFileURLs
{
  return self->_disableUpdatingFileCreationDatesOnExportedFileURLs;
}

- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3
{
  self->_forceAccessibilityDescriptionMetadataBaking = a3;
}

- (BOOL)forceAccessibilityDescriptionMetadataBaking
{
  return self->_forceAccessibilityDescriptionMetadataBaking;
}

- (void)setForceCaptionMetadataBaking:(BOOL)a3
{
  self->_forceCaptionMetadataBaking = a3;
}

- (BOOL)forceCaptionMetadataBaking
{
  return self->_forceCaptionMetadataBaking;
}

- (void)setForceLocationMetadataBaking:(BOOL)a3
{
  self->_forceLocationMetadataBaking = a3;
}

- (BOOL)forceLocationMetadataBaking
{
  return self->_forceLocationMetadataBaking;
}

- (void)setForceDateTimeMetadataBaking:(BOOL)a3
{
  self->_forceDateTimeMetadataBaking = a3;
}

- (BOOL)forceDateTimeMetadataBaking
{
  return self->_forceDateTimeMetadataBaking;
}

- (void)setLocationComparisonStrategy:(int64_t)a3
{
  self->_locationComparisonStrategy = a3;
}

- (int64_t)locationComparisonStrategy
{
  return self->_locationComparisonStrategy;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (void)setCustomFilenameBase:(id)a3
{
}

- (NSString)customFilenameBase
{
  return self->_customFilenameBase;
}

- (void)setShouldBundleComplexAssetResources:(BOOL)a3
{
  self->_shouldBundleComplexAssetResources = a3;
}

- (BOOL)shouldBundleComplexAssetResources
{
  return self->_shouldBundleComplexAssetResources;
}

- (void)setShouldExportUnmodifiedOriginalResources:(BOOL)a3
{
  self->_shouldExportUnmodifiedOriginalResources = a3;
}

- (BOOL)shouldExportUnmodifiedOriginalResources
{
  return self->_shouldExportUnmodifiedOriginalResources;
}

- (void)setAllowMetadataConversionsForPNG:(BOOL)a3
{
  self->_allowMetadataConversionsForPNG = a3;
}

- (BOOL)allowMetadataConversionsForPNG
{
  return self->_allowMetadataConversionsForPNG;
}

- (void)setDisableMetadataCorrections:(BOOL)a3
{
  self->_disableMetadataCorrections = a3;
}

- (BOOL)disableMetadataCorrections
{
  return self->_disableMetadataCorrections;
}

- (void)setVideoExportFileType:(id)a3
{
}

- (NSString)videoExportFileType
{
  return self->_videoExportFileType;
}

- (void)setVideoExportPreset:(id)a3
{
}

- (NSString)videoExportPreset
{
  return self->_videoExportPreset;
}

- (void)setShouldStripAccessibilityDescription:(BOOL)a3
{
  self->_shouldStripAccessibilityDescription = a3;
}

- (BOOL)shouldStripAccessibilityDescription
{
  return self->_shouldStripAccessibilityDescription;
}

- (void)setShouldStripCaption:(BOOL)a3
{
  self->_shouldStripCaption = a3;
}

- (BOOL)shouldStripCaption
{
  return self->_shouldStripCaption;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setFlattenSlomoVideos:(BOOL)a3
{
  self->_flattenSlomoVideos = a3;
}

- (BOOL)flattenSlomoVideos
{
  return self->_flattenSlomoVideos;
}

- (void)setTreatLivePhotoAsStill:(BOOL)a3
{
  self->_treatLivePhotoAsStill = a3;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setIncludeAllAssetResources:(BOOL)a3
{
  self->_includeAllAssetResources = a3;
}

- (BOOL)includeAllAssetResources
{
  return self->_includeAllAssetResources;
}

- (BOOL)isEqualToAssetExportRequestOptions:(id)a3
{
  id v4 = a3;
  int v5 = [(PHAssetExportRequestOptions *)self includeAllAssetResources];
  if (v5 != [v4 includeAllAssetResources]) {
    goto LABEL_24;
  }
  int64_t v6 = [(PHAssetExportRequestOptions *)self variant];
  if (v6 != [v4 variant]) {
    goto LABEL_24;
  }
  int v7 = [(PHAssetExportRequestOptions *)self treatLivePhotoAsStill];
  if (v7 != [v4 treatLivePhotoAsStill]) {
    goto LABEL_24;
  }
  int v8 = [(PHAssetExportRequestOptions *)self flattenSlomoVideos];
  if (v8 != [v4 flattenSlomoVideos]) {
    goto LABEL_24;
  }
  int v9 = [(PHAssetExportRequestOptions *)self dontAllowRAW];
  if (v9 != [v4 dontAllowRAW]) {
    goto LABEL_24;
  }
  int v10 = [(PHAssetExportRequestOptions *)self shouldStripLocation];
  if (v10 != [v4 shouldStripLocation]) {
    goto LABEL_24;
  }
  int v11 = [(PHAssetExportRequestOptions *)self shouldStripCaption];
  if (v11 != [v4 shouldStripCaption]) {
    goto LABEL_24;
  }
  int v12 = [(PHAssetExportRequestOptions *)self shouldStripAccessibilityDescription];
  if (v12 != [v4 shouldStripAccessibilityDescription]) {
    goto LABEL_24;
  }
  v13 = [(PHAssetExportRequestOptions *)self videoExportPreset];

  if (v13)
  {
    v14 = [(PHAssetExportRequestOptions *)self videoExportPreset];
    v15 = [v4 videoExportPreset];
    int v16 = [v14 isEqualToString:v15];

    if (!v16) {
      goto LABEL_24;
    }
  }
  v17 = [(PHAssetExportRequestOptions *)self videoExportFileType];

  if (v17)
  {
    v18 = [(PHAssetExportRequestOptions *)self videoExportFileType];
    v19 = [v4 videoExportFileType];
    int v20 = [v18 isEqualToString:v19];

    if (!v20) {
      goto LABEL_24;
    }
  }
  int v21 = [(PHAssetExportRequestOptions *)self disableMetadataCorrections];
  if (v21 != [v4 disableMetadataCorrections]) {
    goto LABEL_24;
  }
  int v22 = [(PHAssetExportRequestOptions *)self shouldExportUnmodifiedOriginalResources];
  if (v22 != [v4 shouldExportUnmodifiedOriginalResources]) {
    goto LABEL_24;
  }
  int v23 = [(PHAssetExportRequestOptions *)self shouldBundleComplexAssetResources];
  if (v23 != [v4 shouldBundleComplexAssetResources]) {
    goto LABEL_24;
  }
  v24 = [(PHAssetExportRequestOptions *)self customFilenameBase];

  if (v24)
  {
    v25 = [(PHAssetExportRequestOptions *)self customFilenameBase];
    v26 = [v4 customFilenameBase];
    int v27 = [v25 isEqualToString:v26];

    if (!v27) {
      goto LABEL_24;
    }
  }
  v28 = [(PHAssetExportRequestOptions *)self resultHandlerQueue];
  v29 = [v4 resultHandlerQueue];

  if (v28 != v29) {
    goto LABEL_24;
  }
  int64_t v30 = [(PHAssetExportRequestOptions *)self locationComparisonStrategy];
  if (v30 == [v4 locationComparisonStrategy]
    && (int v31 = [(PHAssetExportRequestOptions *)self forceDateTimeMetadataBaking],
        v31 == [v4 forceDateTimeMetadataBaking])
    && (int v32 = [(PHAssetExportRequestOptions *)self forceLocationMetadataBaking],
        v32 == [v4 forceLocationMetadataBaking])
    && (int v33 = [(PHAssetExportRequestOptions *)self forceCaptionMetadataBaking],
        v33 == [v4 forceCaptionMetadataBaking])
    && (int v34 = -[PHAssetExportRequestOptions forceAccessibilityDescriptionMetadataBaking](self, "forceAccessibilityDescriptionMetadataBaking"), v34 == [v4 forceAccessibilityDescriptionMetadataBaking]))
  {
    BOOL v37 = [(PHAssetExportRequestOptions *)self disableUpdatingFileCreationDatesOnExportedFileURLs];
    int v35 = v37 ^ [v4 disableUpdatingFileCreationDatesOnExportedFileURLs] ^ 1;
  }
  else
  {
LABEL_24:
    LOBYTE(v35) = 0;
  }

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHAssetExportRequestOptions *)a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(PHAssetExportRequestOptions *)self isEqualToAssetExportRequestOptions:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  resultHandlerQueue = self->_resultHandlerQueue;
  if (resultHandlerQueue)
  {
    v3 = resultHandlerQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t variant = self->_variant;
  if (variant > 3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = off_1E58422B0[variant];
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, variant: \"%@\", livePhotoAsStill: %d, allowRaw: %d, flattenSlomo: %d, stripLocation: %d, stripCaption: %d, stripAXDescription: %d, assetBundle: %d, disableMetadataCorrections: %d, unmodifiedOriginals: %d>", v4, self, v6, self->_treatLivePhotoAsStill, !self->_dontAllowRAW, self->_flattenSlomoVideos, self->_shouldStripLocation, self->_shouldStripCaption, self->_shouldStripAccessibilityDescription, self->_includeAllAssetResources, self->_disableMetadataCorrections, self->_shouldExportUnmodifiedOriginalResources];
}

@end