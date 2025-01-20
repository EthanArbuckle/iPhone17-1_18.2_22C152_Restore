@interface MusicKit_SoftLinking_MPModelObject
+ (id)_createUnderlyingModelObjectWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5;
+ (id)archivedDataWithUnderlyingModelObject:(id)a3 error:(id *)a4;
+ (id)unarchiveUnderlyingModelObjectWithData:(id)a3 error:(id *)a4;
+ (int64_t)keepLocalEnabledStateForRawValue:(int64_t)a3;
+ (int64_t)keepLocalManagedStatusForRawValue:(int64_t)a3;
+ (int64_t)rawValueForKeepLocalEnabledState:(int64_t)a3;
+ (int64_t)rawValueForKeepLocalManagedStatus:(int64_t)a3;
+ (int64_t)rawValueForKeepLocalManagedStatusReasons:(unint64_t)a3;
+ (unint64_t)keepLocalManagedStatusReasonsForRawValue:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelObject)_underlyingModelObject;
- (MusicKit_SoftLinking_MPIdentifierSet)legacyIdentifierSet;
- (MusicKit_SoftLinking_MPModelObject)initWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5;
- (MusicKit_SoftLinking_MPModelObject)initWithUnderlyingModelObject:(id)a3;
- (NSDictionary)storageDictionary;
- (id)underlyingObject;
- (int64_t)libraryRemovalSupportedOptions;
- (int64_t)modelObjectType;
- (unint64_t)hash;
@end

@implementation MusicKit_SoftLinking_MPModelObject

- (void).cxx_destruct
{
}

+ (unint64_t)keepLocalManagedStatusReasonsForRawValue:(int64_t)a3
{
  return a3 & 0x7F;
}

+ (int64_t)keepLocalManagedStatusForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 6) {
    return 0;
  }
  else {
    return qword_21D2F2B38[a3 + 1];
  }
}

+ (int64_t)keepLocalEnabledStateForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5) {
    return a3 + 1;
  }
  else {
    return 1;
  }
}

- (MPModelObject)_underlyingModelObject
{
  return self->_underlyingModelObject;
}

- (MusicKit_SoftLinking_MPModelObject)initWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelObject;
  v10 = [(MusicKit_SoftLinking_MPModelObject *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() _createUnderlyingModelObjectWithIdentifierSet:v8 modelObjectType:a4 storageDictionary:v9];
    underlyingModelObject = v10->_underlyingModelObject;
    v10->_underlyingModelObject = (MPModelObject *)v11;

    v10->_modelObjectType = a4;
  }

  return v10;
}

+ (id)_createUnderlyingModelObjectWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 0:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelAlbumClass_softClass;
      uint64_t v26 = getMPModelAlbumClass_softClass;
      if (getMPModelAlbumClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelAlbumClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelAlbumClass_block_invoke((uint64_t)&v18);
      break;
    case 1:
    case 5:
    case 6:
    case 7:
    case 22:
      uint64_t MPModelCuratorClass = (uint64_t)getMPModelCuratorClass();
      goto LABEL_43;
    case 2:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelArtistClass_softClass;
      uint64_t v26 = getMPModelArtistClass_softClass;
      if (getMPModelArtistClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelArtistClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelArtistClass_block_invoke((uint64_t)&v18);
      break;
    case 3:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelComposerClass_softClass;
      uint64_t v26 = getMPModelComposerClass_softClass;
      if (getMPModelComposerClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelComposerClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelComposerClass_block_invoke((uint64_t)&v18);
      break;
    case 4:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelCreditsArtistClass_softClass;
      uint64_t v26 = getMPModelCreditsArtistClass_softClass;
      if (getMPModelCreditsArtistClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelCreditsArtistClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelCreditsArtistClass_block_invoke((uint64_t)&v18);
      break;
    case 8:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelFileAssetClass_softClass;
      uint64_t v26 = getMPModelFileAssetClass_softClass;
      if (getMPModelFileAssetClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelFileAssetClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelFileAssetClass_block_invoke((uint64_t)&v18);
      break;
    case 9:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelGenreClass_softClass;
      uint64_t v26 = getMPModelGenreClass_softClass;
      if (getMPModelGenreClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelGenreClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelGenreClass_block_invoke((uint64_t)&v18);
      break;
    case 10:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelHomeSharingAssetClass_softClass;
      uint64_t v26 = getMPModelHomeSharingAssetClass_softClass;
      if (getMPModelHomeSharingAssetClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelHomeSharingAssetClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelHomeSharingAssetClass_block_invoke((uint64_t)&v18);
      break;
    case 11:
    case 23:
      uint64_t MPModelCuratorClass = (uint64_t)getMPModelGenericObjectClass_0();
      goto LABEL_43;
    case 12:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelLyricsClass_softClass;
      uint64_t v26 = getMPModelLyricsClass_softClass;
      if (getMPModelLyricsClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelLyricsClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelLyricsClass_block_invoke((uint64_t)&v18);
      break;
    case 13:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelMovieClass_softClass;
      uint64_t v26 = getMPModelMovieClass_softClass;
      if (getMPModelMovieClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelMovieClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelMovieClass_block_invoke((uint64_t)&v18);
      break;
    case 14:
    case 26:
    case 30:
    case 34:
    case 35:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelSongClass_softClass;
      uint64_t v26 = getMPModelSongClass_softClass;
      if (getMPModelSongClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelSongClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelSongClass_block_invoke((uint64_t)&v18);
      break;
    case 15:
    case 19:
    case 20:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelPlaylistClass_softClass;
      uint64_t v26 = getMPModelPlaylistClass_softClass;
      if (getMPModelPlaylistClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelPlaylistClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelPlaylistClass_block_invoke((uint64_t)&v18);
      break;
    case 16:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelPlaylistAuthorClass_softClass;
      uint64_t v26 = getMPModelPlaylistAuthorClass_softClass;
      if (getMPModelPlaylistAuthorClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelPlaylistAuthorClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelPlaylistAuthorClass_block_invoke((uint64_t)&v18);
      break;
    case 17:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelPlaylistEntryClass_softClass_0;
      uint64_t v26 = getMPModelPlaylistEntryClass_softClass_0;
      if (getMPModelPlaylistEntryClass_softClass_0) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelPlaylistEntryClass_block_invoke_0;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelPlaylistEntryClass_block_invoke_0((uint64_t)&v18);
      break;
    case 18:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelPlaylistEntryReactionClass_softClass;
      uint64_t v26 = getMPModelPlaylistEntryReactionClass_softClass;
      if (getMPModelPlaylistEntryReactionClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelPlaylistEntryReactionClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelPlaylistEntryReactionClass_block_invoke((uint64_t)&v18);
      break;
    case 21:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelPlaybackPositionClass_softClass;
      uint64_t v26 = getMPModelPlaybackPositionClass_softClass;
      if (getMPModelPlaybackPositionClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelPlaybackPositionClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelPlaybackPositionClass_block_invoke((uint64_t)&v18);
      break;
    case 24:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelRecordLabelClass_softClass;
      uint64_t v26 = getMPModelRecordLabelClass_softClass;
      if (getMPModelRecordLabelClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelRecordLabelClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelRecordLabelClass_block_invoke((uint64_t)&v18);
      break;
    case 25:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelSocialPersonClass_softClass;
      uint64_t v26 = getMPModelSocialPersonClass_softClass;
      if (getMPModelSocialPersonClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelSocialPersonClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelSocialPersonClass_block_invoke((uint64_t)&v18);
      break;
    case 27:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelRadioStationClass_softClass;
      uint64_t v26 = getMPModelRadioStationClass_softClass;
      if (getMPModelRadioStationClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelRadioStationClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelRadioStationClass_block_invoke((uint64_t)&v18);
      break;
    case 28:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelStoreAssetClass_softClass;
      uint64_t v26 = getMPModelStoreAssetClass_softClass;
      if (getMPModelStoreAssetClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelStoreAssetClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelStoreAssetClass_block_invoke((uint64_t)&v18);
      break;
    case 29:
      uint64_t MPModelCuratorClass = objc_opt_class();
LABEL_43:
      uint64_t v11 = (objc_class *)MPModelCuratorClass;
      goto LABEL_52;
    case 31:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelTVEpisodeClass_softClass;
      uint64_t v26 = getMPModelTVEpisodeClass_softClass;
      if (getMPModelTVEpisodeClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelTVEpisodeClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelTVEpisodeClass_block_invoke((uint64_t)&v18);
      break;
    case 32:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelTVSeasonClass_softClass;
      uint64_t v26 = getMPModelTVSeasonClass_softClass;
      if (getMPModelTVSeasonClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelTVSeasonClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelTVSeasonClass_block_invoke((uint64_t)&v18);
      break;
    case 33:
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      v10 = (void *)getMPModelTVShowClass_softClass;
      uint64_t v26 = getMPModelTVShowClass_softClass;
      if (getMPModelTVShowClass_softClass) {
        goto LABEL_51;
      }
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __getMPModelTVShowClass_block_invoke;
      v21 = &unk_26443F950;
      v22 = &v23;
      __getMPModelTVShowClass_block_invoke((uint64_t)&v18);
      break;
    default:
      uint64_t v11 = 0;
      goto LABEL_52;
  }
  v10 = (void *)v24[3];
LABEL_51:
  uint64_t v11 = v10;
  _Block_object_dispose(&v23, 8);
LABEL_52:
  id v12 = [v11 alloc];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __118__MusicKit_SoftLinking_MPModelObject__createUnderlyingModelObjectWithIdentifierSet_modelObjectType_storageDictionary___block_invoke;
  v16[3] = &unk_264440048;
  id v17 = v8;
  id v13 = v8;
  objc_super v14 = (void *)[v12 initWithIdentifiers:v7 block:v16];

  return v14;
}

- (id)underlyingObject
{
  return self->_underlyingModelObject;
}

- (int64_t)modelObjectType
{
  return self->_modelObjectType;
}

- (MusicKit_SoftLinking_MPModelObject)initWithUnderlyingModelObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelObject;
  v6 = [(MusicKit_SoftLinking_MPModelObject *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingModelObject, a3);
  }

  return v7;
}

- (NSDictionary)storageDictionary
{
  return (NSDictionary *)[(MPModelObject *)self->_underlyingModelObject valueForKey:@"_storage"];
}

- (MusicKit_SoftLinking_MPIdentifierSet)legacyIdentifierSet
{
  return (MusicKit_SoftLinking_MPIdentifierSet *)[(MPModelObject *)self->_underlyingModelObject identifiers];
}

- (int64_t)libraryRemovalSupportedOptions
{
  if ([(MPModelObject *)self->_underlyingModelObject libraryRemovalSupportedOptions] == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (int64_t)rawValueForKeepLocalEnabledState:(int64_t)a3
{
  if ((unint64_t)a3 >= 5) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

+ (int64_t)rawValueForKeepLocalManagedStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_21D2F2B70[a3 - 1];
  }
}

+ (int64_t)rawValueForKeepLocalManagedStatusReasons:(unint64_t)a3
{
  return a3 & 0x7F;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MusicKit_SoftLinking_MPModelObject *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(MusicKit_SoftLinking_MPModelObject *)v4 isMemberOfClass:objc_opt_class()])
  {
    underlyingModelObject = self->_underlyingModelObject;
    v6 = [(MusicKit_SoftLinking_MPModelObject *)v4 _underlyingModelObject];
    char v7 = [(MPModelObject *)underlyingModelObject isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(MPModelObject *)self->_underlyingModelObject hash];
}

+ (id)archivedDataWithUnderlyingModelObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)unarchiveUnderlyingModelObjectWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F08928];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  char v7 = (void *)getMPModelObjectClass_softClass_1;
  uint64_t v15 = getMPModelObjectClass_softClass_1;
  if (!getMPModelObjectClass_softClass_1)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getMPModelObjectClass_block_invoke_1;
    v11[3] = &unk_26443F950;
    v11[4] = &v12;
    __getMPModelObjectClass_block_invoke_1((uint64_t)v11);
    char v7 = (void *)v13[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);
  objc_super v9 = [v6 unarchivedObjectOfClass:v8 fromData:v5 error:a4];

  return v9;
}

@end