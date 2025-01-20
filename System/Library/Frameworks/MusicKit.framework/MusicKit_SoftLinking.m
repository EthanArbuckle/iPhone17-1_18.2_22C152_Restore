@interface MusicKit_SoftLinking
+ (BOOL)_isEntitledToUserDSID;
+ (double)luminanceForColor:(CGColor *)a3;
+ (id)_identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 possibleDeviceLocalID:(id)a11 occurrenceID:(id)a12 containedDeviceLocalID:(id)a13 syncID:(id)a14 playbackID:(id)a15 formerIDs:(id)a16 modelObjectType:(int64_t)a17 source:(int64_t)a18;
+ (id)artworkCatalogWithCoverArtworkToken:(id)a3;
+ (id)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5;
+ (id)artworkCatalogWithStoreArtworkToken:(id)a3;
+ (id)emptyIdentifierSet;
+ (id)identifierSetFromLegacyModelObject:(id)a3;
+ (id)identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 occurrenceID:(id)a11 containedDeviceLocalID:(id)a12 syncID:(id)a13 playbackID:(id)a14 formerIDs:(id)a15 modelObjectType:(int64_t)a16 source:(int64_t)a17;
+ (id)identifierSetWithIdentifier:(id)a3 modelObjectType:(int64_t)a4 specificLibraryDatabaseID:(id)a5 isPossibleLibraryPersistentID:(BOOL)a6 source:(int64_t)a7;
+ (id)rawSourceFromSource:(int64_t)a3;
+ (id)recentlySearchedArchivedDataForUnderlyingIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 error:(id *)a5;
+ (id)recentlySearchedUnarchiveUnderlyingIdentifierSetWithData:(id)a3 error:(id *)a4;
+ (id)storeArtworkTokenWithImageArtworkInfo:(id)a3 cropStyle:(id)a4;
+ (int64_t)_libraryPersistentIDForStringValue:(id)a3;
+ (int64_t)audioTraitsForRawValue:(int64_t)a3;
+ (int64_t)rawValueForAudioTraits:(int64_t)a3;
@end

@implementation MusicKit_SoftLinking

+ (id)identifierSetFromLegacyModelObject:(id)a3
{
  return (id)[a3 identifiers];
}

+ (id)emptyIdentifierSet
{
  id MPIdentifierSetClass = getMPIdentifierSetClass();

  return (id)[MPIdentifierSetClass emptyIdentifierSet];
}

+ (id)storeArtworkTokenWithImageArtworkInfo:(id)a3 cropStyle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v7 = (void *)getMPStoreArtworkRequestTokenClass_softClass;
  uint64_t v16 = getMPStoreArtworkRequestTokenClass_softClass;
  if (!getMPStoreArtworkRequestTokenClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getMPStoreArtworkRequestTokenClass_block_invoke;
    v12[3] = &unk_26443F950;
    v12[4] = &v13;
    __getMPStoreArtworkRequestTokenClass_block_invoke((uint64_t)v12);
    v7 = (void *)v14[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);
  v9 = [v8 tokenWithImageArtworkInfo:v5];
  v10 = v9;
  if (v6) {
    [v9 setCropStyle:v6];
  }

  return v10;
}

+ (id)artworkCatalogWithStoreArtworkToken:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)getMPArtworkCatalogClass_0());
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getMPStoreArtworkDataSourceClass_softClass;
  uint64_t v14 = getMPStoreArtworkDataSourceClass_softClass;
  if (!getMPStoreArtworkDataSourceClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getMPStoreArtworkDataSourceClass_block_invoke;
    v10[3] = &unk_26443F950;
    v10[4] = &v11;
    __getMPStoreArtworkDataSourceClass_block_invoke((uint64_t)v10);
    id v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = [v6 sharedStoreArtworkDataSource];
  id v8 = (void *)[v4 initWithToken:v3 dataSource:v7];

  return v8;
}

+ (int64_t)rawValueForAudioTraits:(int64_t)a3
{
  return a3 & 0x31 | ((unint64_t)a3 >> 1) & 2 | (4 * (((unint64_t)a3 >> 1) & 1));
}

+ (id)identifierSetWithIdentifier:(id)a3 modelObjectType:(int64_t)a4 specificLibraryDatabaseID:(id)a5 isPossibleLibraryPersistentID:(BOOL)a6 source:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v15 = [v14 numberFromString:v12];

  if (!v15)
  {
    if (a4 > 18)
    {
      id v20 = 0;
      if ((unint64_t)(a4 - 19) > 1)
      {
LABEL_23:
        v34 = v20;
        id v32 = v12;
        id v33 = 0;
        id v16 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      if (!a4)
      {
        id v33 = v12;
        v34 = 0;
        id v16 = 0;
        id v32 = 0;
        uint64_t v15 = 0;
        goto LABEL_27;
      }
      if (a4 != 15)
      {
        id v20 = 0;
        if (a4 != 17) {
          goto LABEL_23;
        }
        if ([v12 containsString:@"_"])
        {
          id v20 = v12;
          uint64_t v15 = 0;
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    if ([v12 hasPrefix:@"pl."])
    {
      uint64_t v15 = [[MusicKit_SoftLinking_CatalogID alloc] initWithValue:v12 kind:2];
LABEL_22:
      id v20 = 0;
      goto LABEL_23;
    }
LABEL_21:
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  id v16 = v12;
  if (a4 == 25)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    id v18 = v16;
    uint64_t v19 = 5;
  }
  else if (a4 == 27)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    id v18 = v16;
    uint64_t v19 = 3;
  }
  else if (v8)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    id v18 = v16;
    uint64_t v19 = 8;
  }
  else
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    id v18 = v16;
    if (a4) {
      uint64_t v19 = 6;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  uint64_t v15 = [(MusicKit_SoftLinking_CatalogID *)v17 initWithValue:v18 kind:v19];
  id v33 = 0;
  v34 = 0;
  id v32 = 0;
LABEL_27:
  v21 = (MusicKit_SoftLinking_DeviceLocalID *)[v16 longLongValue];
  v35 = v13;
  v36 = v12;
  if (v21)
  {
    v31 = v15;
    id v22 = v13;
    if (![v22 length])
    {
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2050000000;
      v23 = (void *)getMPMediaLibraryClass_softClass_0;
      uint64_t v41 = getMPMediaLibraryClass_softClass_0;
      if (!getMPMediaLibraryClass_softClass_0)
      {
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __getMPMediaLibraryClass_block_invoke_0;
        v37[3] = &unk_26443F950;
        v37[4] = &v38;
        __getMPMediaLibraryClass_block_invoke_0((uint64_t)v37);
        v23 = (void *)v39[3];
      }
      id v24 = v23;
      _Block_object_dispose(&v38, 8);
      v25 = [v24 deviceMediaLibrary];
      uint64_t v26 = [v25 uniqueIdentifier];

      id v22 = (id)v26;
    }
    v27 = [[MusicKit_SoftLinking_DeviceLocalID alloc] initWithValue:v21 databaseID:v22];
    if (v8) {
      v28 = 0;
    }
    else {
      v28 = v27;
    }
    if (v8) {
      v21 = v27;
    }
    else {
      v21 = 0;
    }

    uint64_t v15 = v31;
  }
  else
  {
    v28 = 0;
  }
  v29 = [a1 _identifierSetWithCatalogID:v15 libraryID:v32 cloudAlbumLibraryID:v33 cloudID:v16 reportingAdamID:0 purchasedAdamID:0 assetAdamID:0 deviceLocalID:v28 possibleDeviceLocalID:v21 occurrenceID:v34 containedDeviceLocalID:0 syncID:0 playbackID:0 formerIDs:0 modelObjectType:a4 source:a7];

  return v29;
}

+ (id)identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 occurrenceID:(id)a11 containedDeviceLocalID:(id)a12 syncID:(id)a13 playbackID:(id)a14 formerIDs:(id)a15 modelObjectType:(int64_t)a16 source:(int64_t)a17
{
  id v39 = a15;
  id v36 = a14;
  id v33 = a13;
  id v29 = a12;
  id v31 = a11;
  id v41 = a10;
  id v19 = a9;
  id v30 = a8;
  id v20 = a7;
  id v21 = a6;
  id v35 = a5;
  id v38 = a4;
  id v22 = a3;
  v23 = objc_opt_class();
  id v24 = v21;
  v25 = v21;
  uint64_t v26 = v20;
  v27 = [v23 _identifierSetWithCatalogID:v22 libraryID:v38 cloudAlbumLibraryID:v35 cloudID:v24 reportingAdamID:v20 purchasedAdamID:v30 assetAdamID:v19 deviceLocalID:v41 possibleDeviceLocalID:0 occurrenceID:v31 containedDeviceLocalID:v29 syncID:v33 playbackID:v36 formerIDs:v39 modelObjectType:a16 source:a17];

  return v27;
}

+ (id)_identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 possibleDeviceLocalID:(id)a11 occurrenceID:(id)a12 containedDeviceLocalID:(id)a13 syncID:(id)a14 playbackID:(id)a15 formerIDs:(id)a16 modelObjectType:(int64_t)a17 source:(int64_t)a18
{
  id v49 = a3;
  id v23 = a4;
  id v47 = a5;
  id v46 = a6;
  id v51 = a7;
  id v50 = a8;
  id v24 = a9;
  id v25 = a10;
  id v43 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:a17];
  id v41 = v29;
  v42 = v24;
  v48 = v25;
  if (v31)
  {
    id v32 = [a1 rawSourceFromSource:a18];
    id v40 = objc_alloc((Class)getMPIdentifierSetClass());
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __295__MusicKit_SoftLinking_MusicKit_SoftLinking_MPIdentifierSet___identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_possibleDeviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source___block_invoke;
    v52[3] = &unk_26443FE60;
    id v53 = v49;
    id v54 = v23;
    id v55 = v51;
    id v56 = v50;
    id v57 = v24;
    id v58 = v30;
    id v59 = v26;
    id v39 = v28;
    id v60 = v25;
    id v61 = v27;
    id v62 = v28;
    id v67 = a1;
    id v33 = v43;
    id v63 = v43;
    id v64 = v29;
    id v65 = v47;
    v34 = v46;
    id v66 = v46;
    id v45 = (id)[v40 initWithSource:v32 modelKind:v31 musicKitBlock:v52];

    id v35 = v49;
    id v36 = v47;
    v37 = v39;
  }
  else
  {
    [a1 emptyIdentifierSet];
    id v33 = v43;
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v49;
    v37 = v28;
    v34 = v46;
    id v36 = v47;
  }

  return v45;
}

+ (id)rawSourceFromSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return @"MusicKit_Unknown";
  }
  else {
    return *(&off_26443FED8 + a3 - 1);
  }
}

+ (int64_t)_libraryPersistentIDForStringValue:(id)a3
{
  return objc_msgSend(a3, "msv_unsignedLongLongValue");
}

+ (BOOL)_isEntitledToUserDSID
{
  if (_isEntitledToUserDSID_sOnceToken != -1) {
    dispatch_once(&_isEntitledToUserDSID_sOnceToken, &__block_literal_global_114);
  }
  return _isEntitledToUserDSID_sIsEntitledToUserDSID;
}

+ (id)recentlySearchedArchivedDataForUnderlyingIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:a4];
  id v9 = v7;
  getMPIdentifierSetClass();
  v10 = v9;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 personalizedStore];

    v10 = v9;
    if (!v11)
    {
      v10 = v9;
      if (v8)
      {
        id v12 = +[MusicKit_SoftLinking rawSourceFromSource:2];
        id v13 = (void *)[objc_alloc((Class)getMPIdentifierSetClass()) initWithSource:v12 modelKind:v8 block:&__block_literal_global_170];
        v10 = [v9 unionSet:v13];
      }
    }
  }
  id v14 = [v10 archivedDataWithError:a5];

  return v14;
}

+ (id)recentlySearchedUnarchiveUnderlyingIdentifierSetWithData:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x263F08928];
  id v6 = a3;
  id v7 = [v5 unarchivedObjectOfClass:getMPIdentifierSetClass() fromData:v6 error:a4];

  return v7;
}

+ (int64_t)audioTraitsForRawValue:(int64_t)a3
{
  return a3 & 0x31 | (4 * (((unint64_t)a3 >> 1) & 1)) | ((unint64_t)a3 >> 1) & 2;
}

+ (id)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [getMPArtworkCatalogClass_0() artworkCatalogWithDataSourceShortDescription:v9 dataSourceIdentifier:v8 tokenParameters:v7];

  return v10;
}

+ (id)artworkCatalogWithCoverArtworkToken:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)getMPArtworkCatalogClass_0());
  id v5 = +[MusicKit_SoftLinking_CoverArtworkDataSource sharedDataSource];
  id v6 = (void *)[v4 initWithToken:v3 dataSource:v5];

  return v6;
}

+ (double)luminanceForColor:(CGColor *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void (*)(CGColor *))getUISColorLuminanceSymbolLoc_ptr;
  uint64_t v11 = getUISColorLuminanceSymbolLoc_ptr;
  if (!getUISColorLuminanceSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getUISColorLuminanceSymbolLoc_block_invoke;
    v7[3] = &unk_26443F950;
    v7[4] = &v8;
    __getUISColorLuminanceSymbolLoc_block_invoke((uint64_t)v7);
    id v4 = (void (*)(CGColor *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    id v6 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v4(a3);
  return result;
}

@end