@interface MPMusicPlayerPlayParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLibraryContent;
- (MPIdentifierSet)identifiers;
- (MPMusicPlayerPlayParameters)initWithCoder:(id)a3;
- (MPMusicPlayerPlayParameters)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary)dictionary;
- (NSString)catalogID;
- (NSString)itemID;
- (NSString)itemKind;
- (NSString)libraryID;
- (NSString)persistentID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerPlayParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_catalogID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (NSString)libraryID
{
  return self->_libraryID;
}

- (NSString)catalogID
{
  return self->_catalogID;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (BOOL)isLibraryContent
{
  return self->_libraryContent;
}

- (NSString)itemKind
{
  return self->_itemKind;
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_dictionary];
}

- (void)encodeWithCoder:(id)a3
{
  dictionary = self->_dictionary;
  id v5 = a3;
  [v5 encodeObject:dictionary forKey:@"MPMusicPlayerPlayParametersDictionary"];
  [v5 encodeObject:self->_itemID forKey:@"MPMusicPlayerPlayParametersItemID"];
  [v5 encodeObject:self->_identifiers forKey:@"MPMusicPlayerPlayParametersIdentifiers"];
  [v5 encodeObject:self->_itemKind forKey:@"MPMusicPlayerPlayParametersItemKind"];
  [v5 encodeBool:self->_libraryContent forKey:@"MPMusicPlayerPlayParametersIsLibraryContent"];
  [v5 encodeObject:self->_catalogID forKey:@"MPMusicPlayerPlayParametersCatalogID"];
  [v5 encodeObject:self->_libraryID forKey:@"MPMusicPlayerPlayParametersLibraryID"];
  [v5 encodeObject:self->_persistentID forKey:@"MPMusicPlayerPlayParametersMusicKitPersistentID"];
}

- (MPMusicPlayerPlayParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPMusicPlayerPlayParameters;
  id v5 = [(MPMusicPlayerPlayParameters *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodePropertyListForKey:@"MPMusicPlayerPlayParametersDictionary"];
    if (_NSIsNSDictionary()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    if (v7) {
      v8 = v7;
    }
    else {
      v8 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v5->_dictionary, v8);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersItemID"];
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersIdentifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (MPIdentifierSet *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersItemKind"];
    itemKind = v5->_itemKind;
    v5->_itemKind = (NSString *)v13;

    v5->_libraryContent = [v4 decodeBoolForKey:@"MPMusicPlayerPlayParametersIsLibraryContent"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersCatalogID"];
    catalogID = v5->_catalogID;
    v5->_catalogID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersLibraryID"];
    libraryID = v5->_libraryID;
    v5->_libraryID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersMusicKitPersistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v19;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (NSDictionary *)v5[2];
    id v7 = self->_dictionary;
    v8 = v7;
    if (v7 == v6) {
      LOBYTE(v9) = 0;
    }
    else {
      int v9 = [(NSDictionary *)v7 isEqual:v6] ^ 1;
    }

    uint64_t v11 = (MPIdentifierSet *)v5[3];
    v12 = self->_identifiers;
    uint64_t v13 = v12;
    if (v12 == v11) {
      LOBYTE(v14) = 0;
    }
    else {
      int v14 = ![(MPIdentifierSet *)v12 isEqual:v11];
    }

    uint64_t v15 = (NSString *)v5[4];
    v16 = self->_itemKind;
    uint64_t v17 = v16;
    if (v16 == v15) {
      char v18 = 1;
    }
    else {
      char v18 = [(NSString *)v16 isEqual:v15];
    }

    BOOL v10 = v18 & (!self->_libraryContent ^ (*((unsigned char *)v5 + 8) != 0)) & ~(v9 | v14);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = [(NSDictionary *)self->_dictionary hash];
  uint64_t v10 = v5 ^ 0x7465646279746573 ^ v9;
  uint64_t v11 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v12 = v8 + v10;
  uint64_t v13 = (v8 + v10) ^ __ROR8__(v10, 48);
  uint64_t v14 = v13 + __ROR8__(v6 + v7, 32);
  uint64_t v66 = __ROR8__(v12 + v11, 32);
  uint64_t v69 = v14 ^ __ROR8__(v13, 43);
  uint64_t v15 = v14 ^ v9;
  uint64_t v63 = (v12 + v11) ^ __ROR8__(v11, 47);
  v16 = self->_identifiers;
  uint64_t v17 = [(MPIdentifierSet *)v16 hash];
  uint64_t v18 = (v15 + v63) ^ __ROR8__(v63, 51);
  uint64_t v19 = v66 + (v69 ^ v17);
  uint64_t v20 = __ROR8__(v69 ^ v17, 48);
  uint64_t v21 = (v19 ^ v20) + __ROR8__(v15 + v63, 32);
  uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
  uint64_t v23 = v19 + v18;
  uint64_t v67 = __ROR8__(v23, 32);
  uint64_t v70 = v22;
  uint64_t v61 = v21 ^ v17;
  uint64_t v64 = v23 ^ __ROR8__(v18, 47);

  v24 = self->_itemKind;
  uint64_t data = [(NSString *)v24 hash];
  uint64_t v25 = (v61 + v64) ^ __ROR8__(v64, 51);
  uint64_t v26 = v67 + (v70 ^ data);
  uint64_t v27 = __ROR8__(v70 ^ data, 48);
  uint64_t v28 = (v26 ^ v27) + __ROR8__(v61 + v64, 32);
  uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  uint64_t v30 = v26 + v25;
  uint64_t v68 = __ROR8__(v30, 32);
  uint64_t v71 = v29;
  uint64_t v62 = v28 ^ data;
  uint64_t v65 = v30 ^ __ROR8__(v25, 47);

  uint64_t v31 = self->_libraryContent | 0x1800000000000000;
  uint64_t v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  uint64_t v33 = v68 + (v71 ^ (v31 + 0x400000000000000));
  uint64_t v34 = __ROR8__(v71 ^ (v31 + 0x400000000000000), 48);
  uint64_t v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  uint64_t v37 = v33 + v32;
  uint64_t v38 = v37 ^ __ROR8__(v32, 47);
  uint64_t v39 = (v35 ^ (v31 + 0x400000000000000)) + v38;
  uint64_t v40 = v39 ^ __ROR8__(v38, 51);
  uint64_t v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  uint64_t v42 = __ROR8__(v36, 48);
  uint64_t v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  uint64_t v45 = v40 + v41;
  uint64_t v46 = v45 ^ __ROR8__(v40, 47);
  uint64_t v47 = v46 + v43;
  uint64_t v48 = v47 ^ __ROR8__(v46, 51);
  uint64_t v49 = __ROR8__(v45, 32) + v44;
  uint64_t v50 = __ROR8__(v44, 48);
  uint64_t v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  uint64_t v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  uint64_t v53 = v48 + v49;
  uint64_t v54 = v53 ^ __ROR8__(v48, 47);
  uint64_t v55 = v54 + v51;
  uint64_t v56 = v55 ^ __ROR8__(v54, 51);
  uint64_t v57 = __ROR8__(v53, 32) + v52;
  uint64_t v58 = __ROR8__(v52, 48);
  uint64_t v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

- (MPMusicPlayerPlayParameters)initWithDictionary:(NSDictionary *)dictionary
{
  uint64_t v4 = dictionary;
  v61.receiver = self;
  v61.super_class = (Class)MPMusicPlayerPlayParameters;
  uint64_t v5 = [(MPMusicPlayerPlayParameters *)&v61 init];
  if (v5)
  {
    uint64_t v51 = [(NSDictionary *)v4 objectForKey:@"id"];
    if (_NSIsNSString())
    {
      id v6 = v51;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        uint64_t v7 = 0;
LABEL_8:
        if (![v7 length])
        {

          uint64_t v7 = 0;
        }
        uint64_t v8 = [v7 copy];
        itemID = v5->_itemID;
        v5->_itemID = (NSString *)v8;

        uint64_t v50 = [(NSDictionary *)v4 objectForKey:@"kind"];
        if (_NSIsNSString()) {
          id obj = v50;
        }
        else {
          id obj = 0;
        }
        uint64_t v49 = [(NSDictionary *)v4 objectForKey:@"isLibrary"];
        if (objc_opt_respondsToSelector()) {
          LODWORD(v10) = [v49 BOOLValue];
        }
        else {
          LODWORD(v10) = 0;
        }
        uint64_t v52 = [(NSDictionary *)v4 objectForKey:@"catalogId"];
        if (_NSIsNSString())
        {
          id v11 = v52;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            uint64_t v12 = 0;
LABEL_22:
            if (![v12 length])
            {

              uint64_t v12 = 0;
            }
            uint64_t v13 = [(NSDictionary *)v4 objectForKey:@"musicKit_libraryID"];
            if (_NSIsNSString())
            {
              id v14 = v13;
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) == 0)
              {
                uint64_t v15 = 0;
LABEL_30:
                if (![v15 length])
                {

                  uint64_t v15 = 0;
                }
                v16 = [(NSDictionary *)v4 objectForKey:@"musicKit_persistentID"];
                uint64_t v47 = v16;
                if (_NSIsNSString()) {
                  id v17 = v16;
                }
                else {
                  id v17 = 0;
                }
                if (![v17 length])
                {

                  id v17 = 0;
                }
                uint64_t v46 = v13;
                if (!v7 || !obj)
                {
                  uint64_t v18 = v15;
                  uint64_t v19 = v12;
                  uint64_t v20 = os_log_create("com.apple.amp.mediaplayer", "SDKPlayback");
                  uint64_t v48 = v20;
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "-[MPMusicPlayerPlayParameters initWithDictionary:] id or kind missing from playParams dictionary. Returning nil.", buf, 2u);
                  }
                  uint64_t v21 = v5;
                  uint64_t v5 = 0;
                  goto LABEL_59;
                }
                if ([v7 isEqual:v17])
                {
                  uint64_t v48 = 0;
                }
                else
                {
                  if (v10) {
                    uint64_t v22 = v7;
                  }
                  else {
                    uint64_t v22 = v15;
                  }
                  uint64_t v48 = v22;
                }
                uint64_t v44 = v15;
                uint64_t v45 = v12;
                if (([obj isEqualToString:@"song"] & 1) != 0
                  || ([obj isEqualToString:@"musicVideo"] & 1) != 0
                  || ([obj isEqualToString:@"uploadedAudio"] & 1) != 0
                  || [obj isEqualToString:@"uploadedVideo"])
                {
                  uint64_t v23 = MPModelSongKind;
                }
                else if ([obj isEqualToString:@"tvEpisode"])
                {
                  uint64_t v23 = MPModelTVEpisodeKind;
                }
                else if ([obj isEqualToString:@"movie"])
                {
                  uint64_t v23 = MPModelMovieKind;
                }
                else if ([obj isEqualToString:@"album"])
                {
                  uint64_t v23 = MPModelAlbumKind;
                }
                else
                {
                  if ([obj isEqualToString:@"playlist"])
                  {
                    uint64_t v43 = +[MPModelPlaylistKind identityKind];
                    uint64_t v25 = v12;
                    uint64_t v21 = (void *)v43;
                    id v28 = 0;
                    id v27 = 0;
                    if (!v10) {
                      uint64_t v25 = v7;
                    }
                    id v26 = v25;
                    goto LABEL_56;
                  }
                  if (![obj isEqualToString:@"_playlistEntry"])
                  {
                    if (![obj isEqualToString:@"radioStation"])
                    {
                      id v27 = 0;
                      id v26 = 0;
                      id v28 = 0;
                      uint64_t v21 = 0;
LABEL_58:
                      objc_storeStrong((id *)&v5->_itemKind, obj);
                      v5->_libraryContent = (char)v10;
                      uint64_t v18 = v44;
                      uint64_t v34 = [v44 copy];
                      libraryID = v5->_libraryID;
                      v5->_libraryID = (NSString *)v34;

                      uint64_t v19 = v45;
                      uint64_t v36 = [v45 copy];
                      catalogID = v5->_catalogID;
                      v5->_catalogID = (NSString *)v36;

                      uint64_t v38 = [v17 copy];
                      persistentID = v5->_persistentID;
                      v5->_persistentID = (NSString *)v38;

                      uint64_t v40 = [(NSDictionary *)v4 copy];
                      uint64_t v41 = v5->_dictionary;
                      v5->_dictionary = (NSDictionary *)v40;

LABEL_59:
                      goto LABEL_60;
                    }
                    uint64_t v21 = +[MPModelRadioStationKind identityKind];
                    id v28 = 0;
                    id v26 = 0;
                    uint64_t v25 = v45;
                    if (!v10) {
                      uint64_t v25 = v7;
                    }
                    id v27 = v25;
LABEL_56:
                    id v29 = v25;
                    if (v21)
                    {
                      char v30 = (char)v10;
                      uint64_t v10 = [MPIdentifierSet alloc];
                      v55[0] = MEMORY[0x1E4F143A8];
                      v55[1] = 3221225472;
                      v55[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke;
                      v55[3] = &unk_1E57F12C0;
                      id v28 = v28;
                      id v56 = v28;
                      id v26 = v26;
                      id v57 = v26;
                      uint64_t v58 = v48;
                      id v59 = v17;
                      id v27 = v27;
                      id v60 = v27;
                      uint64_t v31 = v10;
                      LOBYTE(v10) = v30;
                      uint64_t v32 = [(MPIdentifierSet *)v31 initWithSource:@"MusicPlayerPlayParams" modelKind:v21 block:v55];
                      identifiers = v5->_identifiers;
                      v5->_identifiers = (MPIdentifierSet *)v32;
                    }
                    goto LABEL_58;
                  }
                  uint64_t v23 = MPModelPlaylistEntryKind;
                }
                uint64_t v24 = [(__objc2_class *)v23 identityKind];
                uint64_t v25 = v12;
                uint64_t v21 = (void *)v24;
                id v26 = 0;
                id v27 = 0;
                if (!v10) {
                  uint64_t v25 = v7;
                }
                id v28 = v25;
                goto LABEL_56;
              }
              id v14 = [v13 stringValue];
            }
            uint64_t v15 = v14;
            goto LABEL_30;
          }
          id v11 = [v52 stringValue];
        }
        uint64_t v12 = v11;
        goto LABEL_22;
      }
      id v6 = [v51 stringValue];
    }
    uint64_t v7 = v6;
    goto LABEL_8;
  }
LABEL_60:

  return v5;
}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4 || *(void *)(a1 + 40) || *(void *)(a1 + 48))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_2;
    v12[3] = &unk_1E57F1298;
    id v13 = v4;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v3 setUniversalStoreIdentifiersWithBlock:v12];
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v5 = +[MPMediaLibrary deviceMediaLibrary];
    id v6 = [v5 uniqueIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_3;
    v10[3] = &unk_1E57F96A0;
    id v11 = *(id *)(a1 + 56);
    [v3 setLibraryIdentifiersWithDatabaseID:v6 block:v10];
  }
  uint64_t v7 = *(void **)(a1 + 64);
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_4;
    v8[3] = &unk_1E57F96F0;
    id v9 = v7;
    [v3 setRadioIdentifiersWithBlock:v8];
  }
}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_2(void *a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)a1[4];
  if (v3) {
    [v5 setSubscriptionAdamID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v3)];
  }
  if (a1[5]) {
    objc_msgSend(v5, "setGlobalPlaylistID:");
  }
  uint64_t v4 = v5;
  if (a1[6])
  {
    objc_msgSend(v5, "setUniversalCloudLibraryID:");
    uint64_t v4 = v5;
  }
}

void __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 setPersistentID:MPStoreItemMetadataInt64NormalizeStoreIDValue(v2)];
}

uint64_t __50__MPMusicPlayerPlayParameters_initWithDictionary___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setStationStringID:*(void *)(a1 + 32)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end