@interface PHPickerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsContinuousSelection;
- (BOOL)_allowsDownscaling;
- (BOOL)_allowsEncodingPolicyModification;
- (BOOL)_alwaysShowLoadingPlaceholder;
- (BOOL)_limitedLibraryHeaderDismissedBefore;
- (BOOL)_onboardingHeaderDismissedBefore;
- (BOOL)_onboardingOverlayDismissedBefore;
- (BOOL)_onlyReturnsIdentifiers;
- (BOOL)_usesMemoriesLayout;
- (BOOL)_usesOpenPanelLayout;
- (BOOL)isEqual:(id)a3;
- (NSArray)_followupPeopleConfigurations;
- (NSArray)preselectedAssetIdentifiers;
- (NSDirectionalRectEdge)edgesWithoutContentMargins;
- (NSInteger)selectionLimit;
- (NSString)_containerIdentifier;
- (NSString)_purposedLimitedLibraryApplicationIdentifier;
- (PHPhotoLibrary)photoLibrary;
- (PHPickerCapabilities)disabledCapabilities;
- (PHPickerConfiguration)init;
- (PHPickerConfiguration)initWithCoder:(id)a3;
- (PHPickerConfiguration)initWithPhotoLibrary:(PHPhotoLibrary *)photoLibrary;
- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyForOpenPanel:(id)a3;
- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyReturnsIdentifiers:(id)a3;
- (PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode;
- (PHPickerConfigurationSelection)selection;
- (PHPickerFilter)filter;
- (PHPickerMode)mode;
- (_PHPickerAspectRatio)_aspectRatio;
- (_PHPickerCollectionConfiguration)_albumsConfiguration;
- (_PHPickerCollectionConfiguration)_peopleConfiguration;
- (_PHPickerSuggestionGroup)_suggestionGroup;
- (id)_initWithPhotoLibrary:(id)a3 onlyReturnsIdentifiers:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_sourceType;
- (int64_t)minimumSelectionLimit;
- (unint64_t)_desiredCollectionSuggestions;
- (unint64_t)_disabledFeatures;
- (unint64_t)_disabledPrivateCapabilities;
- (unint64_t)_edgesWithoutContentMargins;
- (unint64_t)_excludedCollections;
- (unint64_t)hash;
- (void)_setAlbumsConfiguration:(id)a3;
- (void)_setAllowsContinuousSelection:(BOOL)a3;
- (void)_setAllowsDownscaling:(BOOL)a3;
- (void)_setAllowsEncodingPolicyModification:(BOOL)a3;
- (void)_setAlwaysShowLoadingPlaceholder:(BOOL)a3;
- (void)_setDesiredCollectionSuggestions:(unint64_t)a3;
- (void)_setDisabledFeatures:(unint64_t)a3;
- (void)_setDisabledPrivateCapabilities:(unint64_t)a3;
- (void)_setEdgesWithoutContentMargins:(unint64_t)a3;
- (void)_setExcludedCollections:(unint64_t)a3;
- (void)_setFollowupPeopleConfigurations:(id)a3;
- (void)_setPeopleConfiguration:(id)a3;
- (void)_setPurposedLimitedLibraryApplicationIdentifier:(id)a3;
- (void)_setSourceType:(int64_t)a3;
- (void)_setUsesMemoriesLayout:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisabledCapabilities:(PHPickerCapabilities)disabledCapabilities;
- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins;
- (void)setFilter:(PHPickerFilter *)filter;
- (void)setMinimumSelectionLimit:(int64_t)a3;
- (void)setMode:(PHPickerMode)mode;
- (void)setPreferredAssetRepresentationMode:(PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode;
- (void)setPreselectedAssetIdentifiers:(NSArray *)preselectedAssetIdentifiers;
- (void)setSelection:(PHPickerConfigurationSelection)selection;
- (void)setSelectionLimit:(NSInteger)selectionLimit;
- (void)set_aspectRatio:(id)a3;
- (void)set_containerIdentifier:(id)a3;
- (void)set_limitedLibraryHeaderDismissedBefore:(BOOL)a3;
- (void)set_onboardingHeaderDismissedBefore:(BOOL)a3;
- (void)set_onboardingOverlayDismissedBefore:(BOOL)a3;
- (void)set_suggestionGroup:(id)a3;
@end

@implementation PHPickerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__followupPeopleConfigurations, 0);
  objc_storeStrong((id *)&self->__peopleConfiguration, 0);
  objc_storeStrong((id *)&self->__albumsConfiguration, 0);
  objc_storeStrong((id *)&self->__containerIdentifier, 0);
  objc_storeStrong((id *)&self->__aspectRatio, 0);
  objc_storeStrong((id *)&self->__suggestionGroup, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->__purposedLimitedLibraryApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_preselectedAssetIdentifiers, 0);

  objc_storeStrong((id *)&self->_filter, 0);
}

- (void)_setDesiredCollectionSuggestions:(unint64_t)a3
{
  self->__desiredCollectionSuggestions = a3;
}

- (unint64_t)_desiredCollectionSuggestions
{
  return self->__desiredCollectionSuggestions;
}

- (void)_setExcludedCollections:(unint64_t)a3
{
  self->__excludedCollections = a3;
}

- (unint64_t)_excludedCollections
{
  return self->__excludedCollections;
}

- (void)_setFollowupPeopleConfigurations:(id)a3
{
}

- (NSArray)_followupPeopleConfigurations
{
  return self->__followupPeopleConfigurations;
}

- (void)_setPeopleConfiguration:(id)a3
{
}

- (_PHPickerCollectionConfiguration)_peopleConfiguration
{
  return self->__peopleConfiguration;
}

- (void)_setAlbumsConfiguration:(id)a3
{
}

- (_PHPickerCollectionConfiguration)_albumsConfiguration
{
  return self->__albumsConfiguration;
}

- (void)_setAllowsEncodingPolicyModification:(BOOL)a3
{
  self->__allowsEncodingPolicyModification = a3;
}

- (BOOL)_allowsEncodingPolicyModification
{
  return self->__allowsEncodingPolicyModification;
}

- (void)_setAllowsDownscaling:(BOOL)a3
{
  self->__allowsDownscaling = a3;
}

- (BOOL)_allowsDownscaling
{
  return self->__allowsDownscaling;
}

- (void)_setAlwaysShowLoadingPlaceholder:(BOOL)a3
{
  self->__alwaysShowLoadingPlaceholder = a3;
}

- (BOOL)_alwaysShowLoadingPlaceholder
{
  return self->__alwaysShowLoadingPlaceholder;
}

- (void)set_containerIdentifier:(id)a3
{
}

- (NSString)_containerIdentifier
{
  return self->__containerIdentifier;
}

- (void)set_aspectRatio:(id)a3
{
}

- (_PHPickerAspectRatio)_aspectRatio
{
  return self->__aspectRatio;
}

- (void)_setSourceType:(int64_t)a3
{
  self->__sourceType = a3;
}

- (int64_t)_sourceType
{
  return self->__sourceType;
}

- (void)_setDisabledPrivateCapabilities:(unint64_t)a3
{
  self->__disabledPrivateCapabilities = a3;
}

- (unint64_t)_disabledPrivateCapabilities
{
  return self->__disabledPrivateCapabilities;
}

- (void)setMinimumSelectionLimit:(int64_t)a3
{
  self->_minimumSelectionLimit = a3;
}

- (int64_t)minimumSelectionLimit
{
  return self->_minimumSelectionLimit;
}

- (void)set_suggestionGroup:(id)a3
{
}

- (_PHPickerSuggestionGroup)_suggestionGroup
{
  return self->__suggestionGroup;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)_setPurposedLimitedLibraryApplicationIdentifier:(id)a3
{
}

- (NSString)_purposedLimitedLibraryApplicationIdentifier
{
  return self->__purposedLimitedLibraryApplicationIdentifier;
}

- (void)_setUsesMemoriesLayout:(BOOL)a3
{
  self->__usesMemoriesLayout = a3;
}

- (BOOL)_usesMemoriesLayout
{
  return self->__usesMemoriesLayout;
}

- (BOOL)_usesOpenPanelLayout
{
  return self->__usesOpenPanelLayout;
}

- (BOOL)_onlyReturnsIdentifiers
{
  return self->__onlyReturnsIdentifiers;
}

- (void)set_limitedLibraryHeaderDismissedBefore:(BOOL)a3
{
  self->__limitedLibraryHeaderDismissedBefore = a3;
}

- (BOOL)_limitedLibraryHeaderDismissedBefore
{
  return self->__limitedLibraryHeaderDismissedBefore;
}

- (void)set_onboardingHeaderDismissedBefore:(BOOL)a3
{
  self->__onboardingHeaderDismissedBefore = a3;
}

- (BOOL)_onboardingHeaderDismissedBefore
{
  return self->__onboardingHeaderDismissedBefore;
}

- (void)set_onboardingOverlayDismissedBefore:(BOOL)a3
{
  self->__onboardingOverlayDismissedBefore = a3;
}

- (BOOL)_onboardingOverlayDismissedBefore
{
  return self->__onboardingOverlayDismissedBefore;
}

- (void)setDisabledCapabilities:(PHPickerCapabilities)disabledCapabilities
{
  self->_disabledCapabilities = disabledCapabilities;
}

- (PHPickerCapabilities)disabledCapabilities
{
  return self->_disabledCapabilities;
}

- (void)setEdgesWithoutContentMargins:(NSDirectionalRectEdge)edgesWithoutContentMargins
{
  self->_edgesWithoutContentMargins = edgesWithoutContentMargins;
}

- (NSDirectionalRectEdge)edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (void)setMode:(PHPickerMode)mode
{
  self->_mode = mode;
}

- (PHPickerMode)mode
{
  return self->_mode;
}

- (void)setPreselectedAssetIdentifiers:(NSArray *)preselectedAssetIdentifiers
{
}

- (NSArray)preselectedAssetIdentifiers
{
  return self->_preselectedAssetIdentifiers;
}

- (void)setFilter:(PHPickerFilter *)filter
{
}

- (PHPickerFilter)filter
{
  return self->_filter;
}

- (void)setSelectionLimit:(NSInteger)selectionLimit
{
  self->_selectionLimit = selectionLimit;
}

- (NSInteger)selectionLimit
{
  return self->_selectionLimit;
}

- (void)setSelection:(PHPickerConfigurationSelection)selection
{
  self->_selection = selection;
}

- (PHPickerConfigurationSelection)selection
{
  return self->_selection;
}

- (void)setPreferredAssetRepresentationMode:(PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode
{
  self->_preferredAssetRepresentationMode = preferredAssetRepresentationMode;
}

- (PHPickerConfigurationAssetRepresentationMode)preferredAssetRepresentationMode
{
  return self->_preferredAssetRepresentationMode;
}

- (id)_initWithPhotoLibrary:(id)a3 onlyReturnsIdentifiers:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHPickerConfiguration;
  v8 = [(PHPickerConfiguration *)&v17 init];
  if (!v8) {
    goto LABEL_4;
  }
  if ([(PHPickerConfiguration *)v8 isMemberOfClass:objc_opt_class()])
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    v8->_preferredAssetRepresentationMode = 0;
    v8->_selectionLimit = 1;
    v8->_minimumSelectionLimit = 0x7FFFFFFFFFFFFFFFLL;
    preselectedAssetIdentifiers = v8->_preselectedAssetIdentifiers;
    v8->_preselectedAssetIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

    v8->__onlyReturnsIdentifiers = a4;
    v8->__allowsEncodingPolicyModification = 1;
    v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v8->__onboardingOverlayDismissedBefore = [v10 BOOLForKey:@"com.apple.photos.picker.overlay"];

    v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v8->__onboardingHeaderDismissedBefore = [v11 BOOLForKey:@"com.apple.photos.picker.header"];

    v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v8->__limitedLibraryHeaderDismissedBefore = [v12 BOOLForKey:@"com.apple.photos.picker.limitedlibrary.header"];

LABEL_4:
    return v8;
  }
  v14 = (PHPickerConfiguration *)_PFAssertFailHandler();
  [(PHPickerConfiguration *)v14 encodeWithCoder:v16];
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t preferredAssetRepresentationMode = self->_preferredAssetRepresentationMode;
  id v5 = a3;
  [v5 encodeInteger:preferredAssetRepresentationMode forKey:@"PHPickerConfigurationCoderAssetRepresentationModeKey"];
  [v5 encodeInteger:self->_selection forKey:@"PHPickerConfigurationCoderSelectionKey"];
  [v5 encodeInteger:self->_selectionLimit forKey:@"PHPickerConfigurationCoderSelectionLimitKey"];
  [v5 encodeInteger:self->_minimumSelectionLimit forKey:@"PHPickerConfigurationCoderMinimumSelectionLimitKey"];
  v6 = [(PHPickerFilter *)self->_filter _puPickerFilter];
  [v5 encodeObject:v6 forKey:@"PHPickerConfigurationCoderFilterKey"];

  [v5 encodeObject:self->__aspectRatio forKey:@"PHPickerConfigurationCoderAspectRatioKey"];
  [v5 encodeObject:self->_preselectedAssetIdentifiers forKey:@"PHPickerConfigurationCoderPreselectedAssetIdentifiersKey"];
  [v5 encodeInteger:self->_mode forKey:@"PHPickerConfigurationCoderModeKey"];
  id v7 = [NSNumber numberWithUnsignedInteger:self->_edgesWithoutContentMargins];
  [v5 encodeObject:v7 forKey:@"PHPickerConfigurationCoderEdgesWithoutContentMarginsKey"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_disabledCapabilities];
  [v5 encodeObject:v8 forKey:@"PHPickerConfigurationCoderDisabledCapabilitiesKey"];

  v9 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
  [v5 encodeObject:v9 forKey:@"PHPickerConfigurationCoderPhotoLibraryURLKey"];

  [v5 encodeBool:self->__onlyReturnsIdentifiers forKey:@"PHPickerConfigurationCoderOnlyReturnsIdentifiersKey"];
  [v5 encodeBool:self->__allowsDownscaling forKey:@"PHPickerConfigurationCoderAllowsDownscalingKey"];
  [v5 encodeBool:self->__allowsEncodingPolicyModification forKey:@"PHPickerConfigurationAllowsEncodingPolicyModificationKey"];
  [v5 encodeBool:self->__usesOpenPanelLayout forKey:@"PHPickerConfigurationCoderUsesOpenPanelLayoutKey"];
  [v5 encodeBool:self->__usesMemoriesLayout forKey:@"PHPickerConfigurationCoderUsesMemoriesLayoutKey"];
  [v5 encodeObject:self->__suggestionGroup forKey:@"PHPickerConfigurationCoderSuggestionGroupKey"];
  [v5 encodeObject:self->__albumsConfiguration forKey:@"PHPickerConfigurationCoderAlbumsConfigurationKey"];
  [v5 encodeObject:self->__peopleConfiguration forKey:@"PHPickerConfigurationCoderPeopleConfigurationKey"];
  [v5 encodeObject:self->__followupPeopleConfigurations forKey:@"PHPickerConfigurationCoderFollowupPeopleConfigurationsKey"];
  [v5 encodeBool:self->__alwaysShowLoadingPlaceholder forKey:@"PHPickerConfigurationCoderAlwaysShowLoadingPlaceholderKey"];
  v10 = [NSNumber numberWithUnsignedInteger:self->__disabledPrivateCapabilities];
  [v5 encodeObject:v10 forKey:@"PHPickerConfigurationCoderDisabledPrivateCapabilitiesKey"];

  [v5 encodeInteger:self->__sourceType forKey:@"PHPickerConfigurationCoderSourceTypeKey"];
  [v5 encodeObject:self->__containerIdentifier forKey:@"PHPickerConfigurationCoderContainerIdentifierKey"];
  [v5 encodeObject:self->__purposedLimitedLibraryApplicationIdentifier forKey:@"PHPickerConfigurationCoderPurposedLimitedLibraryApplicationIdentifierKey"];
  [v5 encodeBool:self->__onboardingOverlayDismissedBefore forKey:@"PHPickerConfigurationCoderOnboardingOverlayDismissedBeforeKey"];
  [v5 encodeBool:self->__onboardingHeaderDismissedBefore forKey:@"PHPickerConfigurationCoderOnboardingHeaderDismissedBeforeKey"];
  [v5 encodeBool:self->__limitedLibraryHeaderDismissedBefore forKey:@"PHPickerConfigurationCoderLimitedLibraryHeaderDismissedBeforeKey"];
  v11 = [NSNumber numberWithUnsignedInteger:self->__excludedCollections];
  [v5 encodeObject:v11 forKey:@"PHPickerConfigurationCoderExcludedCollectionsKey"];

  id v12 = [NSNumber numberWithUnsignedInteger:self->__desiredCollectionSuggestions];
  [v5 encodeObject:v12 forKey:@"PHPickerConfigurationCoderdesiredCollectionSuggestionsKey"];
}

- (PHPickerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PHPickerConfiguration;
  id v5 = [(PHPickerConfiguration *)&v39 init];
  if (v5)
  {
    v5->_int64_t preferredAssetRepresentationMode = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderAssetRepresentationModeKey"];
    v5->_selection = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderSelectionKey"];
    v5->_selectionLimit = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderSelectionLimitKey"];
    v5->_minimumSelectionLimit = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderMinimumSelectionLimitKey"];
    v6 = PUPickerFilterAvailableClasses();
    id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"PHPickerConfigurationCoderFilterKey"];

    if (v7)
    {
      v8 = [[PHPickerFilter alloc] _initWithPUPickerFilter:v7];
      filter = v5->_filter;
      v5->_filter = v8;
    }
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderPreselectedAssetIdentifiersKey"];
    v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_preselectedAssetIdentifiers, v12);

    v5->_mode = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderModeKey"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderEdgesWithoutContentMarginsKey"];
    v5->_edgesWithoutContentMargins = [v13 unsignedIntegerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderDisabledCapabilitiesKey"];
    v5->_disabledCapabilities = [v14 unsignedIntegerValue];

    SEL v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderPhotoLibraryURLKey"];
    if (v15)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x263F14E98]) initWithPhotoLibraryURL:v15];
      photoLibrary = v5->_photoLibrary;
      v5->_photoLibrary = (PHPhotoLibrary *)v16;
    }
    v5->__onlyReturnsIdentifiers = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderOnlyReturnsIdentifiersKey"];
    v5->__allowsDownscaling = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderAllowsDownscalingKey"];
    v5->__allowsEncodingPolicyModification = [v4 decodeBoolForKey:@"PHPickerConfigurationAllowsEncodingPolicyModificationKey"];
    v5->__usesOpenPanelLayout = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderUsesOpenPanelLayoutKey"];
    v5->__usesMemoriesLayout = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderUsesMemoriesLayoutKey"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderAspectRatioKey"];
    aspectRatio = v5->__aspectRatio;
    v5->__aspectRatio = (_PHPickerAspectRatio *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderSuggestionGroupKey"];
    suggestionGroup = v5->__suggestionGroup;
    v5->__suggestionGroup = (_PHPickerSuggestionGroup *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderAlbumsConfigurationKey"];
    albumsConfiguration = v5->__albumsConfiguration;
    v5->__albumsConfiguration = (_PHPickerCollectionConfiguration *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderPeopleConfigurationKey"];
    peopleConfiguration = v5->__peopleConfiguration;
    v5->__peopleConfiguration = (_PHPickerCollectionConfiguration *)v24;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"PHPickerConfigurationCoderFollowupPeopleConfigurationsKey"];
    followupPeopleConfigurations = v5->__followupPeopleConfigurations;
    v5->__followupPeopleConfigurations = (NSArray *)v29;

    v5->__alwaysShowLoadingPlaceholder = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderAlwaysShowLoadingPlaceholderKey"];
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderDisabledPrivateCapabilitiesKey"];
    v5->__disabledPrivateCapabilities = [v31 unsignedIntegerValue];

    v5->__sourceType = [v4 decodeIntegerForKey:@"PHPickerConfigurationCoderSourceTypeKey"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderContainerIdentifierKey"];
    containerIdentifier = v5->__containerIdentifier;
    v5->__containerIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderPurposedLimitedLibraryApplicationIdentifierKey"];
    purposedLimitedLibraryApplicationIdentifier = v5->__purposedLimitedLibraryApplicationIdentifier;
    v5->__purposedLimitedLibraryApplicationIdentifier = (NSString *)v34;

    v5->__onboardingOverlayDismissedBefore = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderOnboardingOverlayDismissedBeforeKey"];
    v5->__onboardingHeaderDismissedBefore = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderOnboardingHeaderDismissedBeforeKey"];
    v5->__limitedLibraryHeaderDismissedBefore = [v4 decodeBoolForKey:@"PHPickerConfigurationCoderLimitedLibraryHeaderDismissedBeforeKey"];
    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderExcludedCollectionsKey"];
    v5->__excludedCollections = [v36 unsignedIntegerValue];

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHPickerConfigurationCoderdesiredCollectionSuggestionsKey"];
    v5->__desiredCollectionSuggestions = [v37 unsignedIntegerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PHPickerConfiguration alloc] _initWithPhotoLibrary:self->_photoLibrary onlyReturnsIdentifiers:self->__onlyReturnsIdentifiers];
  objc_storeStrong(v4 + 12, self->_photoLibrary);
  v4[3] = self->_preferredAssetRepresentationMode;
  v4[4] = self->_selection;
  v4[5] = self->_selectionLimit;
  v4[14] = self->_minimumSelectionLimit;
  uint64_t v5 = [(PHPickerFilter *)self->_filter copy];
  id v6 = v4[6];
  v4[6] = (id)v5;

  uint64_t v7 = [(NSArray *)self->_preselectedAssetIdentifiers copy];
  id v8 = v4[7];
  v4[7] = (id)v7;

  v4[8] = self->_mode;
  objc_storeStrong(v4 + 17, self->__aspectRatio);
  v4[9] = self->_edgesWithoutContentMargins;
  v4[10] = self->_disabledCapabilities;
  *((unsigned char *)v4 + 15) = self->__allowsDownscaling;
  *((unsigned char *)v4 + 16) = self->__allowsEncodingPolicyModification;
  uint64_t v9 = [(_PHPickerSuggestionGroup *)self->__suggestionGroup copy];
  id v10 = v4[13];
  v4[13] = (id)v9;

  uint64_t v11 = [(_PHPickerCollectionConfiguration *)self->__albumsConfiguration copy];
  id v12 = v4[19];
  v4[19] = (id)v11;

  uint64_t v13 = [(_PHPickerCollectionConfiguration *)self->__peopleConfiguration copy];
  id v14 = v4[20];
  v4[20] = (id)v13;

  uint64_t v15 = [(NSArray *)self->__followupPeopleConfigurations copy];
  id v16 = v4[21];
  v4[21] = (id)v15;

  *((unsigned char *)v4 + 14) = self->__alwaysShowLoadingPlaceholder;
  v4[15] = self->__disabledPrivateCapabilities;
  v4[16] = self->__sourceType;
  uint64_t v17 = [(NSString *)self->__containerIdentifier copy];
  id v18 = v4[18];
  v4[18] = (id)v17;

  uint64_t v19 = [(NSString *)self->__purposedLimitedLibraryApplicationIdentifier copy];
  id v20 = v4[11];
  v4[11] = (id)v19;

  *((unsigned char *)v4 + 8) = self->__onboardingOverlayDismissedBefore;
  *((unsigned char *)v4 + 9) = self->__onboardingHeaderDismissedBefore;
  *((unsigned char *)v4 + 10) = self->__limitedLibraryHeaderDismissedBefore;
  *((unsigned char *)v4 + 11) = self->__onlyReturnsIdentifiers;
  *((unsigned char *)v4 + 12) = self->__usesOpenPanelLayout;
  *((unsigned char *)v4 + 13) = self->__usesMemoriesLayout;
  v4[22] = self->__excludedCollections;
  v4[23] = self->__desiredCollectionSuggestions;
  return v4;
}

- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyForOpenPanel:(id)a3
{
  id v4 = a3;
  if (v4
    || ([MEMORY[0x263F14E98] imagePickerPhotoLibrary],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(PHPickerConfiguration *)self _initWithPhotoLibrary:v4 onlyReturnsIdentifiers:0];
    *((void *)v5 + 4) = 3;
    *(int64x2_t *)(v5 + 72) = vdupq_n_s64(0xFuLL);
    v5[12] = 1;

    return (PHPickerConfiguration *)v5;
  }
  else
  {
    uint64_t v7 = (PHPickerConfiguration *)_PFAssertFailHandler();
    return (PHPickerConfiguration *)[(PHPickerConfiguration *)v7 _allowsContinuousSelection];
  }
}

- (BOOL)_allowsContinuousSelection
{
  return self->_selection > 1uLL;
}

- (void)_setAllowsContinuousSelection:(BOOL)a3
{
  switch(self->_selection)
  {
    case 0:
      if (a3)
      {
        int64_t v3 = 2;
        goto LABEL_10;
      }
      break;
    case 1:
      if (a3)
      {
        int64_t v3 = 3;
        goto LABEL_10;
      }
      break;
    case 2:
      if (!a3)
      {
        int64_t v3 = 0;
        goto LABEL_10;
      }
      break;
    case 3:
      if (!a3)
      {
        int64_t v3 = 1;
LABEL_10:
        self->_selection = v3;
      }
      break;
    default:
      return;
  }
}

- (unint64_t)_disabledFeatures
{
  return self->_disabledCapabilities;
}

- (void)_setDisabledFeatures:(unint64_t)a3
{
  self->_disabledCapabilities = a3;
}

- (unint64_t)_edgesWithoutContentMargins
{
  return self->_edgesWithoutContentMargins;
}

- (void)_setEdgesWithoutContentMargins:(unint64_t)a3
{
  self->_edgesWithoutContentMargins = a3;
}

- (PHPickerConfiguration)initWithPhotoLibraryAndOnlyReturnsIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(PHPickerConfiguration *)self _initWithPhotoLibrary:v4 onlyReturnsIdentifiers:1];

    return v6;
  }
  else
  {
    SEL v8 = (PHPickerConfiguration *)_PFAssertFailHandler();
    return (PHPickerConfiguration *)[(PHPickerConfiguration *)v8 hash];
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(PHPhotoLibrary *)self->_photoLibrary hash];
  int64_t v4 = self->_preferredAssetRepresentationMode - v3 + 32 * v3;
  int64_t v5 = self->_selection - v4 + 32 * v4;
  int64_t v6 = self->_selectionLimit - v5 + 32 * v5;
  int64_t v7 = self->_minimumSelectionLimit - v6 + 32 * v6;
  unint64_t v8 = [(PHPickerFilter *)self->_filter hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSArray *)self->_preselectedAssetIdentifiers hash];
  int64_t v10 = self->_mode - (v9 - v8 + 32 * v8) + 32 * (v9 - v8 + 32 * v8);
  unint64_t v11 = self->_disabledCapabilities
      - (self->_edgesWithoutContentMargins
       - v10
       + 32 * v10)
      + 32 * (self->_edgesWithoutContentMargins - v10 + 32 * v10);
  uint64_t v12 = self->__onlyReturnsIdentifiers - v11 + 32 * v11;
  uint64_t v13 = self->__allowsDownscaling - v12 + 32 * v12;
  uint64_t v14 = self->__allowsEncodingPolicyModification - v13 + 32 * v13;
  uint64_t v15 = self->__usesOpenPanelLayout - v14 + 32 * v14;
  uint64_t v16 = self->__usesMemoriesLayout - v15 + 32 * v15;
  unint64_t v17 = [(_PHPickerSuggestionGroup *)self->__suggestionGroup hash] - v16 + 32 * v16;
  unint64_t v18 = [(_PHPickerCollectionConfiguration *)self->__albumsConfiguration hash] - v17 + 32 * v17;
  unint64_t v19 = [(_PHPickerCollectionConfiguration *)self->__peopleConfiguration hash] - v18 + 32 * v18;
  uint64_t v20 = [(NSArray *)self->__followupPeopleConfigurations hash];
  uint64_t v21 = self->__alwaysShowLoadingPlaceholder - (v20 - v19 + 32 * v19) + 32 * (v20 - v19 + 32 * v19);
  unint64_t v22 = self->__disabledPrivateCapabilities - v21 + 32 * v21;
  int64_t v23 = self->__sourceType - v22 + 32 * v22;
  NSUInteger v24 = [(NSString *)self->__containerIdentifier hash] - v23 + 32 * v23;
  NSUInteger v25 = [(NSString *)self->__purposedLimitedLibraryApplicationIdentifier hash];
  uint64_t v26 = self->__onboardingOverlayDismissedBefore - (v25 - v24 + 32 * v24) + 32 * (v25 - v24 + 32 * v24);
  uint64_t v27 = self->__onboardingHeaderDismissedBefore - v26 + 32 * v26;
  uint64_t v28 = self->__limitedLibraryHeaderDismissedBefore - v27 + 32 * v27;
  unint64_t v29 = self->__excludedCollections - v28 + 32 * v28;
  return self->__desiredCollectionSuggestions - v29 + 32 * v29 + 0x357A291700ACAB9FLL;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5 = (PHPickerConfiguration *)a3;
  if (self == v5)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v6 = v5;
      int64_t v7 = (objc_class *)objc_opt_class();
      if (v6)
      {
        if (objc_opt_isKindOfClass())
        {
          photoLibrary = self->_photoLibrary;
          uint64_t v9 = v6->_photoLibrary;
          if (photoLibrary == v9)
          {
          }
          else
          {
            int64_t v10 = v9;
            unint64_t v11 = photoLibrary;
            int v12 = [(PHPhotoLibrary *)v11 isEqual:v10];

            if (!v12) {
              goto LABEL_66;
            }
          }
          if (self->_preferredAssetRepresentationMode != v6->_preferredAssetRepresentationMode
            || self->_selection != v6->_selection
            || self->_selectionLimit != v6->_selectionLimit
            || self->_minimumSelectionLimit != v6->_minimumSelectionLimit)
          {
            goto LABEL_66;
          }
          filter = self->_filter;
          uint64_t v15 = v6->_filter;
          if (filter == v15)
          {
          }
          else
          {
            uint64_t v16 = v15;
            unint64_t v17 = filter;
            BOOL v18 = [(PHPickerFilter *)v17 isEqual:v16];

            if (!v18) {
              goto LABEL_66;
            }
          }
          preselectedAssetIdentifiers = self->_preselectedAssetIdentifiers;
          uint64_t v20 = v6->_preselectedAssetIdentifiers;
          if (preselectedAssetIdentifiers == v20)
          {
          }
          else
          {
            uint64_t v21 = v20;
            unint64_t v22 = preselectedAssetIdentifiers;
            int v23 = [(NSArray *)v22 isEqual:v21];

            if (!v23) {
              goto LABEL_66;
            }
          }
          if (self->_mode != v6->_mode
            || self->_edgesWithoutContentMargins != v6->_edgesWithoutContentMargins
            || self->_disabledCapabilities != v6->_disabledCapabilities
            || self->__onlyReturnsIdentifiers != v6->__onlyReturnsIdentifiers
            || self->__allowsDownscaling != v6->__allowsDownscaling
            || self->__allowsEncodingPolicyModification != v6->__allowsEncodingPolicyModification
            || self->__usesOpenPanelLayout != v6->__usesOpenPanelLayout
            || self->__usesMemoriesLayout != v6->__usesMemoriesLayout
            || self->__alwaysShowLoadingPlaceholder != v6->__alwaysShowLoadingPlaceholder
            || self->__disabledPrivateCapabilities != v6->__disabledPrivateCapabilities
            || self->__sourceType != v6->__sourceType)
          {
            goto LABEL_66;
          }
          suggestionGroup = self->__suggestionGroup;
          NSUInteger v24 = v6->__suggestionGroup;
          if (suggestionGroup != v24)
          {
            NSUInteger v25 = v24;
            uint64_t v26 = suggestionGroup;
            BOOL v27 = [(_PHPickerSuggestionGroup *)v26 isEqual:v25];

            if (!v27) {
              goto LABEL_66;
            }
            goto LABEL_41;
          }
LABEL_40:

LABEL_41:
          albumsConfiguration = self->__albumsConfiguration;
          v31 = v6->__albumsConfiguration;
          if (albumsConfiguration == v31)
          {
          }
          else
          {
            uint64_t v32 = v31;
            v33 = albumsConfiguration;
            BOOL v34 = [(_PHPickerCollectionConfiguration *)v33 isEqual:v32];

            if (!v34) {
              goto LABEL_66;
            }
          }
          peopleConfiguration = self->__peopleConfiguration;
          v36 = v6->__peopleConfiguration;
          if (peopleConfiguration == v36)
          {
          }
          else
          {
            v37 = v36;
            v38 = peopleConfiguration;
            BOOL v39 = [(_PHPickerCollectionConfiguration *)v38 isEqual:v37];

            if (!v39) {
              goto LABEL_66;
            }
          }
          followupPeopleConfigurations = self->__followupPeopleConfigurations;
          v41 = v6->__followupPeopleConfigurations;
          if (followupPeopleConfigurations == v41)
          {
          }
          else
          {
            v42 = v41;
            v43 = followupPeopleConfigurations;
            int v44 = [(NSArray *)v43 isEqual:v42];

            if (!v44) {
              goto LABEL_66;
            }
          }
          containerIdentifier = self->__containerIdentifier;
          v46 = v6->__containerIdentifier;
          if (containerIdentifier == v46)
          {
          }
          else
          {
            v47 = v46;
            v48 = containerIdentifier;
            int v49 = [(NSString *)v48 isEqual:v47];

            if (!v49) {
              goto LABEL_66;
            }
          }
          purposedLimitedLibraryApplicationIdentifier = self->__purposedLimitedLibraryApplicationIdentifier;
          v51 = v6->__purposedLimitedLibraryApplicationIdentifier;
          if (purposedLimitedLibraryApplicationIdentifier == v51)
          {
          }
          else
          {
            v52 = v51;
            v53 = purposedLimitedLibraryApplicationIdentifier;
            int v54 = [(NSString *)v53 isEqual:v52];

            if (!v54) {
              goto LABEL_66;
            }
          }
          if (self->__onboardingOverlayDismissedBefore == v6->__onboardingOverlayDismissedBefore
            && self->__onboardingHeaderDismissedBefore == v6->__onboardingHeaderDismissedBefore
            && self->__limitedLibraryHeaderDismissedBefore == v6->__limitedLibraryHeaderDismissedBefore
            && self->__excludedCollections == v6->__excludedCollections)
          {
            BOOL v13 = self->__desiredCollectionSuggestions == v6->__desiredCollectionSuggestions;
LABEL_67:

            goto LABEL_68;
          }
LABEL_66:
          BOOL v13 = 0;
          goto LABEL_67;
        }
        uint64_t v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        int64_t v5 = (PHPickerConfiguration *)objc_claimAutoreleasedReturnValue();
        unint64_t v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSStringFromClass(v7);
        objc_claimAutoreleasedReturnValue();
      }
      _PFAssertFailHandler();
      goto LABEL_40;
    }
    BOOL v13 = 0;
  }
LABEL_68:

  return v13;
}

- (PHPickerConfiguration)init
{
  return (PHPickerConfiguration *)[(PHPickerConfiguration *)self _initWithPhotoLibrary:0 onlyReturnsIdentifiers:0];
}

- (PHPickerConfiguration)initWithPhotoLibrary:(PHPhotoLibrary *)photoLibrary
{
  int64_t v4 = photoLibrary;
  if (v4)
  {
    int64_t v5 = v4;
    int64_t v6 = [(PHPickerConfiguration *)self _initWithPhotoLibrary:v4 onlyReturnsIdentifiers:0];

    return v6;
  }
  else
  {
    unint64_t v8 = (void *)_PFAssertFailHandler();
    return (PHPickerConfiguration *)+[PHPickerConfiguration supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end