@interface MPMediaPlaylist
+ (BOOL)_isValidPlaylistProperty:(id)a3;
+ (BOOL)canFilterByProperty:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (void)_createFilterableDictionary;
- (BOOL)existsInLibrary;
- (BOOL)isCloudMix;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavoriteSongsPlaylist;
- (MPMediaEntityPersistentID)persistentID;
- (MPMediaPlaylist)initWithCoder:(id)a3;
- (MPMediaPlaylist)initWithMultiverseIdentifier:(id)a3 library:(id)a4;
- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3;
- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3 mediaLibrary:(id)a4;
- (MPMediaPlaylistAttribute)playlistAttributes;
- (NSArray)seedItems;
- (NSString)authorDisplayName;
- (NSString)cloudGlobalID;
- (NSString)descriptionText;
- (NSString)name;
- (id)artworkCatalog;
- (id)artworkCatalogsWithMaximumCount:(unint64_t)a3;
- (id)items;
- (id)multiverseIdentifier;
- (id)representativeArtists;
- (id)representativeItem;
- (id)seedTracksQuery;
- (id)tiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4;
- (id)valueForProperty:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)mediaTypes;
- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler;
- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)removeArtworkWithSourceType:(int64_t)a3;
- (void)removeFirstItem;
- (void)setUserSelectedArtworkImage:(id)a3;
@end

@implementation MPMediaPlaylist

+ (BOOL)canFilterByProperty:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary;
  if (!__filterableDictionary)
  {
    [a1 _createFilterableDictionary];
    CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary;
  }
  if (CFDictionaryGetValue(v5, (const void *)[v4 hash]))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MPMediaPlaylist;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel_canFilterByProperty_, v4);
  }

  return v6;
}

+ (void)_createFilterableDictionary
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!__filterableDictionary)
  {
    long long v8 = 0u;
    long long v7 = 0u;
    long long v6 = 0u;
    long long v5 = 0u;
    long long v4 = 0u;
    keys[0] = (void *)[@"playlistPersistentID" hash];
    keys[1] = (void *)[@"name" hash];
    keys[2] = (void *)[@"playlistAttributes" hash];
    keys[3] = (void *)[@"seedItems" hash];
    keys[4] = (void *)[@"dateCreated" hash];
    keys[5] = (void *)[@"dateModified" hash];
    keys[6] = (void *)[@"datePlayed" hash];
    keys[7] = (void *)[@"datePlayedLocal" hash];
    keys[8] = (void *)[@"isWorkoutMix" hash];
    keys[9] = (void *)[@"isGeniusMix" hash];
    keys[10] = (void *)[@"isGeniusPlaylist" hash];
    keys[11] = (void *)[@"geniusMixRepresentativeArtists" hash];
    keys[12] = (void *)[@"isVoiceMemos" hash];
    keys[13] = (void *)[@"isActivePlaylist" hash];
    keys[14] = (void *)[@"isActiveGeniusPlaylist" hash];
    keys[15] = (void *)[@"isActiveOnTheGoPlaylist" hash];
    keys[16] = (void *)[@"isDeletable" hash];
    keys[17] = (void *)[@"isUserEditable" hash];
    keys[18] = (void *)[@"isHidden" hash];
    keys[19] = (void *)[@"descriptionInfo" hash];
    keys[20] = (void *)[@"iO" hash];
    keys[21] = (void *)[@"isEditable" hash];
    keys[22] = (void *)[@"playCount" hash];
    keys[23] = (void *)[@"playCountSinceSync" hash];
    keys[24] = (void *)[@"likedState" hash];
    keys[25] = (void *)[@"parentPersistentID" hash];
    keys[26] = (void *)[@"isFolder" hash];
    keys[27] = (void *)[@"isPurchasesPlaylist" hash];
    keys[28] = (void *)[@"isCurrentDevicePurchasesPlaylist" hash];
    keys[29] = (void *)[@"isPlaybackHistoryPlaylist" hash];
    keys[30] = (void *)[@"isIgnoredSyncing" hash];
    keys[31] = (void *)[@"hasItems" hash];
    keys[32] = (void *)[@"storeCloudID" hash];
    keys[33] = (void *)[@"isLimitedDynamicSmartPlaylist" hash];
    keys[34] = (void *)[@"mediaType" hash];
    keys[35] = (void *)[@"entityRevision" hash];
    keys[36] = (void *)[@"cloudGlobalID" hash];
    keys[37] = (void *)[@"cloudVersionHash" hash];
    keys[38] = (void *)[@"cloudShareURL" hash];
    keys[39] = (void *)[@"cloudIsPublic" hash];
    keys[40] = (void *)[@"cloudIsVisible" hash];
    keys[41] = (void *)[@"cloudIsSubscribed" hash];
    keys[42] = (void *)[@"cloudIsCuratorPlaylist" hash];
    keys[43] = (void *)[@"cloudAuthorStoreID" hash];
    *(void *)&long long v4 = [@"cloudAuthorDisplayName" hash];
    *((void *)&v4 + 1) = [@"cloudAuthorStoreURL" hash];
    *(void *)&long long v5 = [@"cloudUserCount" hash];
    *((void *)&v5 + 1) = [@"cloudGlobalPlayCount" hash];
    *(void *)&long long v6 = [@"cloudGlobalLikeCount" hash];
    *((void *)&v6 + 1) = [@"distinguishedKind" hash];
    *(void *)&long long v7 = [@"isITunesSynced" hash];
    *((void *)&v7 + 1) = [@"externalVendorContainerTag" hash];
    *(void *)&long long v8 = [@"isExternalVendorPlaylist" hash];
    *((void *)&v8 + 1) = [@"cloudPlaylistUniversalLibraryID" hash];
    memcpy(__dst, &unk_19568A148, sizeof(__dst));
    __filterableDictionary = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, __dst, 54, 0, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedTracksQuery, 0);

  objc_storeStrong((id *)&self->_representativeArtists, 0);
}

- (void)removeArtworkWithSourceType:(int64_t)a3
{
  id v5 = [(MPMediaEntity *)self mediaLibrary];
  objc_msgSend(v5, "removeArtworkForEntityPersistentID:entityType:artworkType:sourceType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 1, 5, a3);
}

- (void)setUserSelectedArtworkImage:(id)a3
{
  v83[0] = *MEMORY[0x1E4F143B8];
  long long v4 = (UIImage *)a3;
  if (!v4) {
    goto LABEL_63;
  }
  id v5 = [(MPMediaEntity *)self mediaLibrary];
  char v6 = [v5 isHomeSharingLibrary];

  if (v6) {
    goto LABEL_63;
  }
  long long v7 = [(MPMediaEntity *)self mediaLibrary];
  UIImageJPEGRepresentation(v4, *MEMORY[0x1E4F778F0]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  memset(v74, 0, sizeof(v74));
  CC_SHA256_Init(v74);
  id v9 = v8;
  CC_SHA256_Update(v74, (const void *)[v9 bytes], objc_msgSend(v9, "length"));

  memset(&v79[8], 0, 64);
  *(void *)v79 = 4256;
  CC_SHA256_Final(&v79[8], v74);
  v80[0] = *(_OWORD *)v79;
  v80[1] = *(_OWORD *)&v79[16];
  v80[2] = *(_OWORD *)&v79[32];
  v80[3] = *(_OWORD *)&v79[48];
  uint64_t v81 = *(void *)&v79[64];
  if (*(uint64_t *)v79 > 3999)
  {
    if (*(uint64_t *)v79 > 4255)
    {
      if (*(void *)v79 == 4256)
      {
        v51 = (unsigned __int8 *)v80 + 8;
        v52 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v53 = v52;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v55 = *v51++;
          v56 = &v52[i];
          char *v56 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v55 >> 4];
          v56[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v55 & 0xF];
        }
        id v22 = [NSString alloc];
        v23 = v53;
        uint64_t v24 = 64;
      }
      else
      {
        if (*(void *)v79 != 4512) {
          goto LABEL_58;
        }
        v29 = (unsigned __int8 *)v80 + 8;
        v30 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v31 = v30;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v33 = *v29++;
          v34 = &v30[j];
          char *v34 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v33 >> 4];
          v34[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v33 & 0xF];
        }
        id v22 = [NSString alloc];
        v23 = v31;
        uint64_t v24 = 128;
      }
    }
    else if (*(void *)v79 == 4000)
    {
      v41 = (unsigned __int8 *)v80 + 8;
      v42 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v43 = v42;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v45 = *v41++;
        v46 = &v42[k];
        char *v46 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v45 >> 4];
        v46[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v45 & 0xF];
      }
      id v22 = [NSString alloc];
      v23 = v43;
      uint64_t v24 = 32;
    }
    else
    {
      if (*(void *)v79 != 4001) {
        goto LABEL_58;
      }
      v16 = (unsigned __int8 *)v80 + 8;
      v17 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v18 = v17;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v20 = *v16++;
        v21 = &v17[m];
        char *v21 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v20 >> 4];
        v21[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v20 & 0xF];
      }
      id v22 = [NSString alloc];
      v23 = v18;
      uint64_t v24 = 40;
    }
LABEL_47:
    CFStringRef v40 = (CFStringRef)[v22 initWithBytesNoCopy:v23 length:v24 encoding:4 freeWhenDone:1];
    goto LABEL_48;
  }
  if (*(uint64_t *)v79 > 2999)
  {
    if (*(void *)v79 == 3000)
    {
      LODWORD(v82[0]) = bswap32(DWORD2(v80[0]));
      v47 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v48 = 0;
      v49 = v47 + 1;
      do
      {
        unint64_t v50 = *((unsigned __int8 *)v82 + v48);
        *(v49 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v50 >> 4];
        unsigned char *v49 = MSVFastHexStringFromBytes_hexCharacters_53728[v50 & 0xF];
        v49 += 2;
        ++v48;
      }
      while (v48 != 4);
      id v22 = [NSString alloc];
      v23 = v47;
      uint64_t v24 = 8;
    }
    else
    {
      if (*(void *)v79 != 3001) {
        goto LABEL_58;
      }
      v82[0] = bswap64(*((unint64_t *)&v80[0] + 1));
      v25 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v26 = 0;
      v27 = v25 + 1;
      do
      {
        unint64_t v28 = *((unsigned __int8 *)v82 + v26);
        *(v27 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v28 >> 4];
        unsigned char *v27 = MSVFastHexStringFromBytes_hexCharacters_53728[v28 & 0xF];
        v27 += 2;
        ++v26;
      }
      while (v26 != 8);
      id v22 = [NSString alloc];
      v23 = v25;
      uint64_t v24 = 16;
    }
    goto LABEL_47;
  }
  if (*(void *)v79 == 1000)
  {
    uint64_t v35 = *((void *)&v80[0] + 1);
    v36 = (char *)v83 + 1;
    uint64_t quot = *((void *)&v80[0] + 1);
    do
    {
      lldiv_t v38 = lldiv(quot, 10);
      uint64_t quot = v38.quot;
      if (v38.rem >= 0) {
        LOBYTE(v39) = v38.rem;
      }
      else {
        uint64_t v39 = -v38.rem;
      }
      *(v36 - 2) = v39 + 48;
      v15 = (const UInt8 *)(v36 - 2);
      --v36;
    }
    while (v38.quot);
    if (v35 < 0)
    {
      *(v36 - 2) = 45;
      v15 = (const UInt8 *)(v36 - 2);
    }
    v14 = (char *)((char *)v83 - (char *)v15);
    goto LABEL_37;
  }
  if (*(void *)v79 != 2000)
  {
LABEL_58:
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    v71 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
    [v70 handleFailureInFunction:v71 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

    v57 = &stru_1EE680640;
    goto LABEL_49;
  }
  uint64_t v10 = DWORD2(v80[0]);
  v11 = v83;
  do
  {
    ldiv_t v12 = ldiv(v10, 10);
    uint64_t v10 = v12.quot;
    if (v12.rem >= 0) {
      LOBYTE(v13) = v12.rem;
    }
    else {
      uint64_t v13 = -v12.rem;
    }
    *((unsigned char *)v11 - 1) = v13 + 48;
    v11 = (void *)((char *)v11 - 1);
  }
  while (v12.quot);
  v14 = (char *)((char *)v83 - (char *)v11);
  v15 = (const UInt8 *)v11;
LABEL_37:
  CFStringRef v40 = CFStringCreateWithBytes(0, v15, (CFIndex)v14, 0x8000100u, 0);
LABEL_48:
  v57 = (__CFString *)v40;
LABEL_49:

  objc_msgSend(v7, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 1, v57, 5, 100);
  v58 = [(MPMediaEntity *)self mediaLibrary];
  v59 = [(MPMediaPlaylist *)self representativeItem];
  int v60 = objc_msgSend(v58, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v9, v57, 5, 100, objc_msgSend(v59, "mediaType"));

  if (v60)
  {
    v73 = v4;
    v61 = [v7 libraryDataProvider];
    objc_opt_class();
    id v62 = v9;
    if (objc_opt_isKindOfClass())
    {
      v63 = [v61 library];
    }
    else
    {
      v63 = 0;
    }
    [v63 notifyDisplayValuesPropertyDidChange];
    v64 = [v7 userIdentity];
    v65 = +[MPCloudController controllerWithUserIdentity:v64];

    if ([v65 isCloudEnabled]) {
      [v65 uploadArtworkForPlaylist:self completionHandler:0];
    }
    v66 = [(MPMediaPlaylist *)self valueForProperty:@"coverArtworkRecipe"];
    if (([@"{\"version\":\"0.0\"}" isEqualToString:v66] & 1) == 0)
    {
      v72 = v7;
      [(MPMediaItemCollection *)self setValue:@"{\"version\":\"0.0\"}" forProperty:@"coverArtworkRecipe"];
      v67 = [(MPMediaPlaylist *)self valueForProperty:@"isCollaborative"];

      if (v67)
      {
        MPMediaEntityPersistentID v68 = [(MPMediaPlaylist *)self persistentID];
        v77 = @"coverArtworkRecipe";
        v78 = @"{\"version\":\"0.0\"}";
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [v65 editCollaborationWithPersistentID:v68 properties:v69 trackEdits:MEMORY[0x1E4F1CBF0] completion:&__block_literal_global_11430];
      }
      else
      {
        v75 = @"coverArtworkRecipe";
        v76 = @"{\"version\":\"0.0\"}";
        v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        objc_msgSend(v65, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v69, 0, -[MPMediaPlaylist persistentID](self, "persistentID"), &__block_literal_global_208);
      }

      long long v7 = v72;
    }

    id v9 = v62;
    long long v4 = v73;
  }

LABEL_63:
}

- (NSString)cloudGlobalID
{
  return (NSString *)[(MPMediaPlaylist *)self valueForProperty:@"cloudGlobalID"];
}

- (BOOL)isCloudMix
{
  v2 = [(MPMediaPlaylist *)self valueForProperty:@"storeCloudID"];
  BOOL v3 = [v2 longLongValue] != 0;

  return v3;
}

- (id)seedTracksQuery
{
  seedTracksQuery = self->_seedTracksQuery;
  if (!seedTracksQuery)
  {
    long long v4 = objc_alloc_init(MPMediaQuery);
    id v5 = self->_seedTracksQuery;
    self->_seedTracksQuery = v4;

    char v6 = [(MPMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    long long v7 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:@"playlistPersistentID"];
    [(MPMediaQuery *)self->_seedTracksQuery addFilterPredicate:v7];

    seedTracksQuery = self->_seedTracksQuery;
  }

  return seedTracksQuery;
}

- (id)representativeArtists
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  representativeArtists = self->_representativeArtists;
  if (!representativeArtists)
  {
    long long v4 = [(MPMediaPlaylist *)self valueForProperty:@"descriptionInfo"];
    id v5 = [v4 componentsSeparatedByString:@",,,"];

    if (!v5)
    {
      char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:3];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v7 = [(MPMediaPlaylist *)self seedTracksQuery];
      id v8 = [v7 items];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) valueForProperty:@"albumArtist"];
            if ([v13 length])
            {
              [v6 addObject:v13];
              if ((unint64_t)[v6 count] >= 3)
              {

                goto LABEL_14;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      if ([v6 count])
      {
        v14 = [v6 allObjects];
        v15 = [v14 componentsJoinedByString:@",,,"];
        [(MPMediaItemCollection *)self setValue:v15 forProperty:@"descriptionInfo" withCompletionBlock:0];

        id v5 = [v6 allObjects];
      }
      else
      {
        id v5 = 0;
      }
    }
    if ((unint64_t)[v5 count] < 4)
    {
      v16 = v5;
    }
    else
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, 3);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v17 = self->_representativeArtists;
    self->_representativeArtists = v16;

    representativeArtists = self->_representativeArtists;
  }

  return representativeArtists;
}

- (id)multiverseIdentifier
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:451 description:@"subclass must implement"];

  return 0;
}

- (id)representativeItem
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:446 description:@"subclass must implement"];

  return 0;
}

- (unint64_t)mediaTypes
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:441 description:@"subclass must implement"];

  return -1;
}

- (unint64_t)count
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:436 description:@"subclass must implement"];

  return 0;
}

- (id)items
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:431 description:@"subclass must implement"];

  return 0;
}

- (void)removeFirstItem
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:296 description:@"subclass must implement"];
}

- (BOOL)isFavoriteSongsPlaylist
{
  v2 = [(MPMediaPlaylist *)self valueForProperty:@"distinguishedKind"];
  BOOL v3 = [v2 intValue] == 71;

  return v3;
}

- (NSString)authorDisplayName
{
  return (NSString *)[(MPMediaPlaylist *)self valueForProperty:@"externalVendorDisplayName"];
}

- (NSString)descriptionText
{
  return (NSString *)[(MPMediaPlaylist *)self valueForProperty:@"descriptionInfo"];
}

- (NSArray)seedItems
{
  return (NSArray *)[(MPMediaPlaylist *)self valueForProperty:@"seedItems"];
}

- (MPMediaPlaylistAttribute)playlistAttributes
{
  v2 = [(MPMediaPlaylist *)self valueForProperty:@"playlistAttributes"];
  MPMediaPlaylistAttribute v3 = [v2 integerValue];

  return v3;
}

- (NSString)name
{
  return (NSString *)[(MPMediaPlaylist *)self valueForProperty:@"name"];
}

- (MPMediaEntityPersistentID)persistentID
{
  v2 = [(MPMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
  MPMediaEntityPersistentID v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (BOOL)existsInLibrary
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:259 description:@"subclass must implement"];

  return 1;
}

- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", mediaItems, completionHandler);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:253 description:@"subclass must implement"];
}

- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", productID, completionHandler);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:250 description:@"subclass must implement"];
}

- (id)valueForProperty:(id)a3
{
  id v5 = a3;
  int v6 = [(id)objc_opt_class() _isValidPlaylistProperty:v5];

  if (v6)
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:245 description:@"subclass must implement"];
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:221 description:@"subclass must implement"];
}

- (MPMediaPlaylist)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"MPMediaPlaylist.m" lineNumber:216 description:@"subclass must implement"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    MPMediaEntityPersistentID v5 = [(MPMediaPlaylist *)self persistentID];
    unsigned __int8 v6 = v5 == [v4 persistentID];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaPlaylist;
    unsigned __int8 v6 = [(MPMediaItemCollection *)&v8 isEqual:v4];
  }

  return v6;
}

- (unint64_t)hash
{
  MPMediaEntityPersistentID v2 = [(MPMediaPlaylist *)self persistentID];
  return v2 ^ HIDWORD(v2);
}

- (MPMediaPlaylist)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 mediaObjectType];
  if (v9 != 7)
  {
    uint64_t v33 = v9;
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPMediaPlaylist.m", 129, @"Playlist was initialized with a multiverse identifier containing the wrong object type (%d)", v33);
  }
  uint64_t v10 = [v7 libraryIdentifiers];
  uint64_t v11 = malloc_type_malloc(8 * [v7 libraryIdentifiersCount], 0x100004000313F17uLL);
  id v38 = v8;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v13)
  {

    uint64_t v15 = 0;
    uint64_t v39 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  id v35 = v7;
  v36 = self;
  LODWORD(v15) = 0;
  uint64_t v16 = *(void *)v41;
  char v17 = 1;
  obuint64_t j = v12;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v41 != v16) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      v11[(v15 + i)] = [v19 libraryId];
      long long v20 = [v19 libraryName];
      if ([v20 length])
      {
        long long v21 = [v19 libraryName];
        long long v22 = [v38 uniqueIdentifier];
        char v23 = [v21 isEqualToString:v22];
      }
      else
      {
        char v23 = 0;
      }

      v17 &= v23;
    }
    uint64_t v15 = (v15 + i);
    id v12 = obj;
    uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v14);

  uint64_t v39 = 0;
  id v7 = v35;
  self = v36;
  if (v17)
  {
LABEL_16:
    char v24 = [v38 collectionExistsContainedWithinPersistentIDs:v11 count:v15 groupingType:6 existentPID:&v39];
    free(v11);
    if (v24) {
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  free(v11);
LABEL_17:
  if (![v7 hasSagaId]
    || ![v7 sagaId]
    || (objc_msgSend(v38, "collectionExistsWithSagaID:groupingType:existentPID:", objc_msgSend(v7, "sagaId"), 6, &v39) & 1) == 0)
  {
    if (![v7 hasCloudUniversalLibraryId]) {
      goto LABEL_32;
    }
    v25 = [v7 cloudUniversalLibraryId];
    uint64_t v26 = [v25 length];

    if (!v26
      || ([v7 cloudUniversalLibraryId],
          v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = [v38 collectionExistsWithCloudUniversalLibraryID:v27 groupingType:6 existentPID:&v39], v27, (v28 & 1) == 0))
    {
LABEL_32:
      if (![v7 hasStoreId]
        || ![v7 storeId]
        || (objc_msgSend(v38, "collectionExistsWithStoreID:groupingType:existentPID:", objc_msgSend(v7, "storeId"), 6, &v39) & 1) == 0)
      {
        v29 = [v7 name];
        int v30 = [v38 collectionExistsWithName:v29 groupingType:6 existentPID:&v39];

        if (!v30)
        {
          v31 = 0;
          goto LABEL_28;
        }
      }
    }
  }
LABEL_27:
  self = [(MPMediaPlaylist *)self initWithPersistentID:v39];
  v31 = self;
LABEL_28:

  return v31;
}

- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3 mediaLibrary:(id)a4
{
  MPMediaEntityPersistentID v5 = [a4 playlistWithPersistentID:a3];

  return v5;
}

- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3
{
  MPMediaEntityPersistentID v5 = +[MPMediaLibrary defaultMediaLibrary];
  unsigned __int8 v6 = [(MPMediaPlaylist *)self initWithPersistentID:a3 mediaLibrary:v5];

  return v6;
}

+ (BOOL)_isValidPlaylistProperty:(id)a3
{
  id v4 = a3;
  CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary;
  if (!__filterableDictionary)
  {
    [a1 _createFilterableDictionary];
    CFDictionaryRef v5 = (const __CFDictionary *)__filterableDictionary;
  }
  BOOL v6 = CFDictionaryContainsKey(v5, (const void *)[v4 hash]) != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)artworkCatalogsWithMaximumCount:(unint64_t)a3
{
  if (a3)
  {
    CFDictionaryRef v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    BOOL v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:a3];
    id v7 = [(MPMediaItemCollection *)self itemsQuery];
    id v8 = (void *)[v7 copy];

    uint64_t v9 = +[MPMediaItem artworkCatalogCacheProperties];
    [v8 setItemPropertiesToFetch:v9];

    [v8 setShouldIncludeNonLibraryEntities:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__MPMediaPlaylist_MPArtworkCatalog__artworkCatalogsWithMaximumCount___block_invoke;
    v15[3] = &unk_1E57F6450;
    id v16 = v6;
    id v10 = v5;
    id v17 = v10;
    unint64_t v18 = a3;
    id v11 = v6;
    [v8 _enumerateItemsUsingBlock:v15];
    id v12 = v17;
    id v13 = v10;
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __69__MPMediaPlaylist_MPArtworkCatalog__artworkCatalogsWithMaximumCount___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  CFDictionaryRef v5 = [v7 artworkCatalog];
  if (v5)
  {
    BOOL v6 = [v7 valueForProperty:@"albumPID"];
    if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v5];
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  if ([*(id *)(a1 + 40) count] == *(void *)(a1 + 48)) {
    *a3 = 1;
  }
}

- (id)tiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  id v7 = objc_alloc_init(MPTiledArtworkRequest);
  [(MPTiledArtworkRequest *)v7 setNumberOfColumns:a3];
  [(MPTiledArtworkRequest *)v7 setNumberOfRows:a4];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__MPMediaPlaylist_MPArtworkCatalog__tiledArtworkCatalogWithRows_columns___block_invoke;
  v16[3] = &unk_1E57F6428;
  v16[4] = self;
  [(MPTiledArtworkRequest *)v7 setArtworkCatalogsBlock:v16];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPMediaPlaylist persistentID](self, "persistentID"));
  [(MPTiledArtworkRequest *)v7 setEntityIdentifier:v8];

  [(MPTiledArtworkRequest *)v7 setNamespaceIdentifier:@"MPMediaPlaylist"];
  uint64_t v9 = NSNumber;
  id v10 = [(MPMediaEntity *)self mediaLibrary];
  id v11 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "currentEntityRevision"));
  [(MPTiledArtworkRequest *)v7 setRevisionIdentifier:v11];

  id v12 = [MPArtworkCatalog alloc];
  id v13 = +[MPTiledArtworkDataSource sharedDataSource];
  uint64_t v14 = [(MPArtworkCatalog *)v12 initWithToken:v7 dataSource:v13];

  return v14;
}

uint64_t __73__MPMediaPlaylist_MPArtworkCatalog__tiledArtworkCatalogWithRows_columns___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) artworkCatalogsWithMaximumCount:a2];
}

- (id)artworkCatalog
{
  MPMediaEntityPersistentID v3 = [MPMediaLibraryArtworkRequest alloc];
  id v4 = [(MPMediaEntity *)self mediaLibrary];
  CFDictionaryRef v5 = [(MPMediaLibraryArtworkRequest *)v3 initWithLibrary:v4 identifier:[(MPMediaPlaylist *)self persistentID] entityType:1 artworkType:5];

  BOOL v6 = [MPArtworkCatalog alloc];
  id v7 = [(MPMediaEntity *)self mediaLibrary];
  id v8 = [v7 artworkDataSource];
  uint64_t v9 = [(MPArtworkCatalog *)v6 initWithToken:v5 dataSource:v8];

  id v10 = [(MPMediaEntity *)self mediaLibrary];
  id v11 = [v10 artworkDataSource];
  LODWORD(v8) = [v11 areRepresentationsAvailableForCatalog:v9];

  if (v8) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

@end