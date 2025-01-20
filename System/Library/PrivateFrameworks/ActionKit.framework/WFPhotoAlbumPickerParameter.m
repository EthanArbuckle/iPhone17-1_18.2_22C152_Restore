@interface WFPhotoAlbumPickerParameter
+ (BOOL)hasPhotosAccess;
+ (id)referencedActionResourceClasses;
- (BOOL)includesSmartAlbum;
- (Class)singleStateClass;
- (WFPhotoAccessResource)photoAccessResource;
- (WFPhotoAlbumPickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (id)sharedLibrary;
- (void)photoLibraryDidChange:(id)a3;
- (void)possibleStatesDidChange;
- (void)resourceAvailabilityChanged;
- (void)setActionResources:(id)a3;
- (void)setPhotoAccessResource:(id)a3;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFPhotoAlbumPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoAccessResource, 0);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (BOOL)includesSmartAlbum
{
  return self->_includesSmartAlbum;
}

- (WFPhotoAccessResource)photoAccessResource
{
  return self->_photoAccessResource;
}

- (void)photoLibraryDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WFPhotoAlbumPickerParameter_photoLibraryDidChange___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__WFPhotoAlbumPickerParameter_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

- (id)defaultSerializedRepresentation
{
  if (!self->_defaultSerializedRepresentation && [(id)objc_opt_class() hasPhotosAccess])
  {
    v3 = [MEMORY[0x263F33988] sharedLibrary];
    id v17 = 0;
    v4 = [v3 fetchOptionsWithError:&v17];
    id v5 = v17;

    if (!v4)
    {

      v10 = 0;
      goto LABEL_12;
    }
    BOOL v6 = [(WFPhotoAlbumPickerParameter *)self includesSmartAlbum];
    id PHAssetCollectionClass = getPHAssetCollectionClass();
    if (v6)
    {
      uint64_t v8 = 2;
      uint64_t v9 = 209;
    }
    else
    {
      uint64_t v8 = 1;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v11 = [PHAssetCollectionClass fetchAssetCollectionsWithType:v8 subtype:v9 options:v4];
    v12 = [v11 firstObject];

    v13 = [v12 localizedTitle];
    v14 = v13;
    if (v13)
    {
      v13 = [MEMORY[0x263F86F00] serializedRepresentationFromValue:v13];
    }
    defaultSerializedRepresentation = self->_defaultSerializedRepresentation;
    self->_defaultSerializedRepresentation = v13;
  }
  v10 = self->_defaultSerializedRepresentation;
LABEL_12:
  return v10;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = [v3 localizedTitle];

  return v4;
}

- (id)possibleStates
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_possibleStates || ![(id)objc_opt_class() hasPhotosAccess])
  {
LABEL_18:
    v19 = self->_possibleStates;
    goto LABEL_19;
  }
  v3 = objc_opt_new();
  v4 = [MEMORY[0x263F33988] sharedLibrary];
  id v26 = 0;
  id v5 = [v4 fetchOptionsWithError:&v26];
  id v6 = v26;

  [v5 setWantsIncrementalChangeDetails:0];
  if (v5)
  {
    v21 = v6;
    if ([(WFPhotoAlbumPickerParameter *)self includesSmartAlbum])
    {
      v7 = [getPHAssetCollectionClass() fetchAssetCollectionsWithType:2 subtype:209 options:v5];
      uint64_t v8 = [v7 firstObject];
      if (v8)
      {
        uint64_t v9 = [[WFPHAssetCollectionState alloc] initWithCollection:v8];
        [v3 addObject:v9];
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = [getPHAssetCollectionClass() fetchAssetCollectionsWithType:1 subtype:0x7FFFFFFFFFFFFFFFLL options:v5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v15 canPerformEditOperation:3])
          {
            v16 = [[WFPHAssetCollectionState alloc] initWithCollection:v15];
            [v3 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    id v17 = (NSArray *)[v3 copy];
    possibleStates = self->_possibleStates;
    self->_possibleStates = v17;

    goto LABEL_18;
  }

  v19 = 0;
LABEL_19:
  return v19;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  [(WFPhotoAlbumPickerParameter *)&v4 possibleStatesDidChange];
}

- (void)resourceAvailabilityChanged
{
  v3 = [(WFPhotoAlbumPickerParameter *)self photoAccessResource];
  int v4 = [v3 isAvailable];

  if (v4)
  {
    id v5 = [(WFPhotoAlbumPickerParameter *)self sharedLibrary];
    [v5 registerChangeObserver:self];

    [(WFPhotoAlbumPickerParameter *)self possibleStatesDidChange];
  }
}

- (void)wasRemovedFromWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  [(WFPhotoAlbumPickerParameter *)&v4 wasRemovedFromWorkflow];
  v3 = [(WFPhotoAlbumPickerParameter *)self sharedLibrary];
  [v3 unregisterChangeObserver:self];
}

- (void)wasAddedToWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFPhotoAlbumPickerParameter;
  [(WFPhotoAlbumPickerParameter *)&v4 wasAddedToWorkflow];
  if ([(id)objc_opt_class() hasPhotosAccess])
  {
    v3 = [(WFPhotoAlbumPickerParameter *)self sharedLibrary];
    [v3 registerChangeObserver:self];
  }
}

- (id)sharedLibrary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33988] sharedLibrary];
  id v8 = 0;
  v3 = [v2 systemPhotoLibraryWithError:&v8];
  id v4 = v8;

  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFPhotoAlbumPickerParameter sharedLibrary]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_23C364000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get library: %@", buf, 0x16u);
    }
  }
  return v3;
}

- (void)setPhotoAccessResource:(id)a3
{
  id v9 = a3;
  p_photoAccessResource = &self->_photoAccessResource;
  id v6 = (void *)MEMORY[0x263F873F0];
  if (self->_photoAccessResource)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*v6 object:*p_photoAccessResource];
  }
  objc_storeStrong((id *)&self->_photoAccessResource, a3);
  if (*p_photoAccessResource)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_resourceAvailabilityChanged name:*v6 object:*p_photoAccessResource];
  }
}

- (void)setActionResources:(id)a3
{
  id v6 = [a3 anyObject];
  uint64_t v4 = objc_opt_class();
  id v5 = WFEnforceClass(v6, v4);
  [(WFPhotoAlbumPickerParameter *)self setPhotoAccessResource:v5];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFPhotoAlbumPickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPhotoAlbumPickerParameter;
  id v5 = [(WFPhotoAlbumPickerParameter *)&v12 initWithDefinition:v4];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"IncludeSmartAlbum"];
    uint64_t v7 = objc_opt_class();
    id v8 = WFEnforceClass(v6, v7);

    if (v8) {
      char v9 = [v8 BOOLValue];
    }
    else {
      char v9 = 1;
    }
    v5->_includesSmartAlbum = v9;
    v10 = v5;
  }
  return v5;
}

+ (id)referencedActionResourceClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

+ (BOOL)hasPhotosAccess
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v9 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getPHPhotoLibraryClass_block_invoke;
    v5[3] = &unk_264E5EC88;
    v5[4] = &v6;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 authorizationStatus] == 3;
}

@end