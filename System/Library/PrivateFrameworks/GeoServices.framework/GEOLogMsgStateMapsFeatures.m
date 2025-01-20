@interface GEOLogMsgStateMapsFeatures
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFavoritesCount;
- (BOOL)hasFollowedPublisherCount;
- (BOOL)hasHomeFavoriteSet;
- (BOOL)hasLibraryFavoritesGuideSavedPlacesCount;
- (BOOL)hasLibraryGuidesSavedPlacesCount;
- (BOOL)hasLibraryPlacesWithNoteCount;
- (BOOL)hasLibrarySavedPlacesCount;
- (BOOL)hasPersonalCollectionsCount;
- (BOOL)hasSavedCollectionsCount;
- (BOOL)hasSchoolFavoriteSet;
- (BOOL)hasSubmittedPhotosCount;
- (BOOL)hasSubmittedRatingsCount;
- (BOOL)hasTransitFavoriteSet;
- (BOOL)hasWorkFavoriteSet;
- (BOOL)homeFavoriteSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)schoolFavoriteSet;
- (BOOL)transitFavoriteSet;
- (BOOL)workFavoriteSet;
- (GEOLogMsgStateMapsFeatures)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapsFeatures)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)favoritesCount;
- (int)followedPublisherCount;
- (int)libraryFavoritesGuideSavedPlacesCount;
- (int)libraryGuidesSavedPlacesCount;
- (int)libraryPlacesWithNoteCount;
- (int)librarySavedPlacesCount;
- (int)personalCollectionsCount;
- (int)savedCollectionsCount;
- (int)submittedPhotosCount;
- (int)submittedRatingsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFavoritesCount:(int)a3;
- (void)setFollowedPublisherCount:(int)a3;
- (void)setHasFavoritesCount:(BOOL)a3;
- (void)setHasFollowedPublisherCount:(BOOL)a3;
- (void)setHasHomeFavoriteSet:(BOOL)a3;
- (void)setHasLibraryFavoritesGuideSavedPlacesCount:(BOOL)a3;
- (void)setHasLibraryGuidesSavedPlacesCount:(BOOL)a3;
- (void)setHasLibraryPlacesWithNoteCount:(BOOL)a3;
- (void)setHasLibrarySavedPlacesCount:(BOOL)a3;
- (void)setHasPersonalCollectionsCount:(BOOL)a3;
- (void)setHasSavedCollectionsCount:(BOOL)a3;
- (void)setHasSchoolFavoriteSet:(BOOL)a3;
- (void)setHasSubmittedPhotosCount:(BOOL)a3;
- (void)setHasSubmittedRatingsCount:(BOOL)a3;
- (void)setHasTransitFavoriteSet:(BOOL)a3;
- (void)setHasWorkFavoriteSet:(BOOL)a3;
- (void)setHomeFavoriteSet:(BOOL)a3;
- (void)setLibraryFavoritesGuideSavedPlacesCount:(int)a3;
- (void)setLibraryGuidesSavedPlacesCount:(int)a3;
- (void)setLibraryPlacesWithNoteCount:(int)a3;
- (void)setLibrarySavedPlacesCount:(int)a3;
- (void)setPersonalCollectionsCount:(int)a3;
- (void)setSavedCollectionsCount:(int)a3;
- (void)setSchoolFavoriteSet:(BOOL)a3;
- (void)setSubmittedPhotosCount:(int)a3;
- (void)setSubmittedRatingsCount:(int)a3;
- (void)setTransitFavoriteSet:(BOOL)a3;
- (void)setWorkFavoriteSet:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapsFeatures

- (BOOL)homeFavoriteSet
{
  return self->_homeFavoriteSet;
}

- (void)setHomeFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_homeFavoriteSet = a3;
}

- (void)setHasHomeFavoriteSet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasHomeFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (BOOL)workFavoriteSet
{
  return self->_workFavoriteSet;
}

- (void)setWorkFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_workFavoriteSet = a3;
}

- (void)setHasWorkFavoriteSet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasWorkFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (BOOL)schoolFavoriteSet
{
  return self->_schoolFavoriteSet;
}

- (void)setSchoolFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_schoolFavoriteSet = a3;
}

- (void)setHasSchoolFavoriteSet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasSchoolFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (int)favoritesCount
{
  return self->_favoritesCount;
}

- (void)setFavoritesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_favoritesCount = a3;
}

- (void)setHasFavoritesCount:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasFavoritesCount
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)personalCollectionsCount
{
  return self->_personalCollectionsCount;
}

- (void)setPersonalCollectionsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_personalCollectionsCount = a3;
}

- (void)setHasPersonalCollectionsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPersonalCollectionsCount
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)savedCollectionsCount
{
  return self->_savedCollectionsCount;
}

- (void)setSavedCollectionsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_savedCollectionsCount = a3;
}

- (void)setHasSavedCollectionsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasSavedCollectionsCount
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)followedPublisherCount
{
  return self->_followedPublisherCount;
}

- (void)setFollowedPublisherCount:(int)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_followedPublisherCount = a3;
}

- (void)setHasFollowedPublisherCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFollowedPublisherCount
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)submittedRatingsCount
{
  return self->_submittedRatingsCount;
}

- (void)setSubmittedRatingsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_submittedRatingsCount = a3;
}

- (void)setHasSubmittedRatingsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSubmittedRatingsCount
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (int)submittedPhotosCount
{
  return self->_submittedPhotosCount;
}

- (void)setSubmittedPhotosCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_submittedPhotosCount = a3;
}

- (void)setHasSubmittedPhotosCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasSubmittedPhotosCount
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)transitFavoriteSet
{
  return self->_transitFavoriteSet;
}

- (void)setTransitFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_transitFavoriteSet = a3;
}

- (void)setHasTransitFavoriteSet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasTransitFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (int)librarySavedPlacesCount
{
  return self->_librarySavedPlacesCount;
}

- (void)setLibrarySavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_librarySavedPlacesCount = a3;
}

- (void)setHasLibrarySavedPlacesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLibrarySavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)libraryPlacesWithNoteCount
{
  return self->_libraryPlacesWithNoteCount;
}

- (void)setLibraryPlacesWithNoteCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_libraryPlacesWithNoteCount = a3;
}

- (void)setHasLibraryPlacesWithNoteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLibraryPlacesWithNoteCount
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)libraryGuidesSavedPlacesCount
{
  return self->_libraryGuidesSavedPlacesCount;
}

- (void)setLibraryGuidesSavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_libraryGuidesSavedPlacesCount = a3;
}

- (void)setHasLibraryGuidesSavedPlacesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLibraryGuidesSavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)libraryFavoritesGuideSavedPlacesCount
{
  return self->_libraryFavoritesGuideSavedPlacesCount;
}

- (void)setLibraryFavoritesGuideSavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_libraryFavoritesGuideSavedPlacesCount = a3;
}

- (void)setHasLibraryFavoritesGuideSavedPlacesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLibraryFavoritesGuideSavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapsFeatures;
  v4 = [(GEOLogMsgStateMapsFeatures *)&v8 description];
  v5 = [(GEOLogMsgStateMapsFeatures *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsFeatures _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_73;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x400) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    if (a2) {
      v7 = @"homeFavoriteSet";
    }
    else {
      v7 = @"home_favorite_set";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 52);
  }
  if ((v5 & 0x2000) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 51)];
    if (a2) {
      v9 = @"workFavoriteSet";
    }
    else {
      v9 = @"work_favorite_set";
    }
    [v4 setObject:v8 forKey:v9];

    __int16 v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  if (a2) {
    v11 = @"schoolFavoriteSet";
  }
  else {
    v11 = @"school_favorite_set";
  }
  [v4 setObject:v10 forKey:v11];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_29:
  v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
  if (a2) {
    v13 = @"favoritesCount";
  }
  else {
    v13 = @"favorites_count";
  }
  [v4 setObject:v12 forKey:v13];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_33:
  v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  if (a2) {
    v15 = @"personalCollectionsCount";
  }
  else {
    v15 = @"personal_collections_count";
  }
  [v4 setObject:v14 forKey:v15];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_37:
  v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  if (a2) {
    v17 = @"savedCollectionsCount";
  }
  else {
    v17 = @"saved_collections_count";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_41:
  v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
  if (a2) {
    v19 = @"followedPublisherCount";
  }
  else {
    v19 = @"followed_publisher_count";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_45:
  v20 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  if (a2) {
    v21 = @"submittedRatingsCount";
  }
  else {
    v21 = @"submitted_ratings_count";
  }
  [v4 setObject:v20 forKey:v21];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_49:
  v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  if (a2) {
    v23 = @"submittedPhotosCount";
  }
  else {
    v23 = @"submitted_photos_count";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_57;
  }
LABEL_53:
  v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
  if (a2) {
    v25 = @"transitFavoriteSet";
  }
  else {
    v25 = @"transit_favorite_set";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_57:
  v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v27 = @"librarySavedPlacesCount";
  }
  else {
    v27 = @"library_saved_places_count";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0) {
      goto LABEL_19;
    }
LABEL_65:
    v30 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
    if (a2) {
      v31 = @"libraryGuidesSavedPlacesCount";
    }
    else {
      v31 = @"library_guides_saved_places_count";
    }
    [v4 setObject:v30 forKey:v31];

    if ((*(_WORD *)(a1 + 52) & 4) == 0) {
      goto LABEL_73;
    }
    goto LABEL_69;
  }
LABEL_61:
  v28 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v29 = @"libraryPlacesWithNoteCount";
  }
  else {
    v29 = @"library_places_with_note_count";
  }
  [v4 setObject:v28 forKey:v29];

  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 8) != 0) {
    goto LABEL_65;
  }
LABEL_19:
  if ((v5 & 4) != 0)
  {
LABEL_69:
    v32 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v33 = @"libraryFavoritesGuideSavedPlacesCount";
    }
    else {
      v33 = @"library_favorites_guide_saved_places_count";
    }
    [v4 setObject:v32 forKey:v33];
  }
LABEL_73:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapsFeatures _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapsFeatures)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsFeatures *)-[GEOLogMsgStateMapsFeatures _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"homeFavoriteSet";
      }
      else {
        v6 = @"home_favorite_set";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHomeFavoriteSet:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"workFavoriteSet";
      }
      else {
        objc_super v8 = @"work_favorite_set";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWorkFavoriteSet:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"schoolFavoriteSet";
      }
      else {
        v10 = @"school_favorite_set";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSchoolFavoriteSet:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"favoritesCount";
      }
      else {
        v12 = @"favorites_count";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFavoritesCount:", objc_msgSend(v13, "intValue"));
      }

      if (a3) {
        v14 = @"personalCollectionsCount";
      }
      else {
        v14 = @"personal_collections_count";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPersonalCollectionsCount:", objc_msgSend(v15, "intValue"));
      }

      if (a3) {
        v16 = @"savedCollectionsCount";
      }
      else {
        v16 = @"saved_collections_count";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSavedCollectionsCount:", objc_msgSend(v17, "intValue"));
      }

      if (a3) {
        v18 = @"followedPublisherCount";
      }
      else {
        v18 = @"followed_publisher_count";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setFollowedPublisherCount:", objc_msgSend(v19, "intValue"));
      }

      if (a3) {
        v20 = @"submittedRatingsCount";
      }
      else {
        v20 = @"submitted_ratings_count";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSubmittedRatingsCount:", objc_msgSend(v21, "intValue"));
      }

      if (a3) {
        v22 = @"submittedPhotosCount";
      }
      else {
        v22 = @"submitted_photos_count";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSubmittedPhotosCount:", objc_msgSend(v23, "intValue"));
      }

      if (a3) {
        v24 = @"transitFavoriteSet";
      }
      else {
        v24 = @"transit_favorite_set";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitFavoriteSet:", objc_msgSend(v25, "BOOLValue"));
      }

      if (a3) {
        v26 = @"librarySavedPlacesCount";
      }
      else {
        v26 = @"library_saved_places_count";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLibrarySavedPlacesCount:", objc_msgSend(v27, "intValue"));
      }

      if (a3) {
        v28 = @"libraryPlacesWithNoteCount";
      }
      else {
        v28 = @"library_places_with_note_count";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLibraryPlacesWithNoteCount:", objc_msgSend(v29, "intValue"));
      }

      if (a3) {
        v30 = @"libraryGuidesSavedPlacesCount";
      }
      else {
        v30 = @"library_guides_saved_places_count";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLibraryGuidesSavedPlacesCount:", objc_msgSend(v31, "intValue"));
      }

      if (a3) {
        v32 = @"libraryFavoritesGuideSavedPlacesCount";
      }
      else {
        v32 = @"library_favorites_guide_saved_places_count";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLibraryFavoritesGuideSavedPlacesCount:", objc_msgSend(v33, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateMapsFeatures)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsFeatures *)-[GEOLogMsgStateMapsFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsFeaturesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_14:
    if ((flags & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 4) != 0) {
LABEL_15:
  }
    PBDataWriterWriteInt32Field();
LABEL_16:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateMapsFeatures *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v5[48] = self->_homeFavoriteSet;
    *((_WORD *)v5 + 26) |= 0x400u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v5[51] = self->_workFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v5[49] = self->_schoolFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 2) = self->_favoritesCount;
  *((_WORD *)v5 + 26) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 8) = self->_personalCollectionsCount;
  *((_WORD *)v5 + 26) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 9) = self->_savedCollectionsCount;
  *((_WORD *)v5 + 26) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 3) = self->_followedPublisherCount;
  *((_WORD *)v5 + 26) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 11) = self->_submittedRatingsCount;
  *((_WORD *)v5 + 26) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 10) = self->_submittedPhotosCount;
  *((_WORD *)v5 + 26) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v5[50] = self->_transitFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x1000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 7) = self->_librarySavedPlacesCount;
  *((_WORD *)v5 + 26) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 6) = self->_libraryPlacesWithNoteCount;
  *((_WORD *)v5 + 26) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_14:
    if ((flags & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  *((_DWORD *)v5 + 5) = self->_libraryGuidesSavedPlacesCount;
  *((_WORD *)v5 + 26) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_15:
    *((_DWORD *)v5 + 4) = self->_libraryFavoritesGuideSavedPlacesCount;
    *((_WORD *)v5 + 26) |= 4u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    *((unsigned char *)result + 48) = self->_homeFavoriteSet;
    *((_WORD *)result + 26) |= 0x400u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 51) = self->_workFavoriteSet;
  *((_WORD *)result + 26) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)result + 49) = self->_schoolFavoriteSet;
  *((_WORD *)result + 26) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 2) = self->_favoritesCount;
  *((_WORD *)result + 26) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 8) = self->_personalCollectionsCount;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 9) = self->_savedCollectionsCount;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 3) = self->_followedPublisherCount;
  *((_WORD *)result + 26) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_submittedRatingsCount;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 10) = self->_submittedPhotosCount;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)result + 50) = self->_transitFavoriteSet;
  *((_WORD *)result + 26) |= 0x1000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_librarySavedPlacesCount;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 6) = self->_libraryPlacesWithNoteCount;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_14:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 5) = self->_libraryGuidesSavedPlacesCount;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_libraryFavoritesGuideSavedPlacesCount;
  *((_WORD *)result + 26) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_84;
  }
  [(GEOLogMsgStateMapsFeatures *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0) {
      goto LABEL_84;
    }
    if (self->_homeFavoriteSet)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x2000) == 0) {
      goto LABEL_84;
    }
    if (self->_workFavoriteSet)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x2000) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0) {
      goto LABEL_84;
    }
    if (self->_schoolFavoriteSet)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_84;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_favoritesCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_84;
    }
  }
  else if (v6)
  {
    goto LABEL_84;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_personalCollectionsCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_savedCollectionsCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_followedPublisherCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_submittedRatingsCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_submittedPhotosCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x1000) != 0)
    {
      if (self->_transitFavoriteSet)
      {
        if (!*((unsigned char *)v4 + 50)) {
          goto LABEL_84;
        }
        goto LABEL_64;
      }
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_64;
      }
    }
LABEL_84:
    BOOL v7 = 0;
    goto LABEL_85;
  }
  if ((*((_WORD *)v4 + 26) & 0x1000) != 0) {
    goto LABEL_84;
  }
LABEL_64:
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_librarySavedPlacesCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_libraryPlacesWithNoteCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_libraryGuidesSavedPlacesCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_libraryFavoritesGuideSavedPlacesCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_84;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 4) == 0;
  }
LABEL_85:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapsFeatures *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    uint64_t v4 = 2654435761 * self->_homeFavoriteSet;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_workFavoriteSet;
      if ((*(_WORD *)&self->_flags & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_schoolFavoriteSet;
    if (flags) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if (flags)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_favoritesCount;
    if ((flags & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_personalCollectionsCount;
    if ((flags & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_savedCollectionsCount;
    if ((flags & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((flags & 2) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_followedPublisherCount;
    if ((*(_WORD *)&self->_flags & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_submittedRatingsCount;
    if ((*(_WORD *)&self->_flags & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_submittedPhotosCount;
    if ((*(_WORD *)&self->_flags & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_transitFavoriteSet;
    if ((flags & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_librarySavedPlacesCount;
    if ((flags & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v14 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_libraryPlacesWithNoteCount;
    if ((flags & 8) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v16 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v17 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_27:
  uint64_t v15 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v16 = 2654435761 * self->_libraryGuidesSavedPlacesCount;
  if ((flags & 4) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v17 = 2654435761 * self->_libraryFavoritesGuideSavedPlacesCount;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x400) != 0)
  {
    self->_homeFavoriteSet = *((unsigned char *)v5 + 48);
    *(_WORD *)&self->_flags |= 0x400u;
    __int16 v4 = *((_WORD *)v5 + 26);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v5 + 26) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_workFavoriteSet = *((unsigned char *)v5 + 51);
  *(_WORD *)&self->_flags |= 0x2000u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x800) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_schoolFavoriteSet = *((unsigned char *)v5 + 49);
  *(_WORD *)&self->_flags |= 0x800u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_favoritesCount = *((_DWORD *)v5 + 2);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x40) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_personalCollectionsCount = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_savedCollectionsCount = *((_DWORD *)v5 + 9);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 2) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_followedPublisherCount = *((_DWORD *)v5 + 3);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_submittedRatingsCount = *((_DWORD *)v5 + 11);
  *(_WORD *)&self->_flags |= 0x200u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_submittedPhotosCount = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x1000) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_transitFavoriteSet = *((unsigned char *)v5 + 50);
  *(_WORD *)&self->_flags |= 0x1000u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x20) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_librarySavedPlacesCount = *((_DWORD *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_libraryPlacesWithNoteCount = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x10u;
  __int16 v4 = *((_WORD *)v5 + 26);
  if ((v4 & 8) == 0)
  {
LABEL_14:
    if ((v4 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_libraryGuidesSavedPlacesCount = *((_DWORD *)v5 + 5);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v5 + 26) & 4) != 0)
  {
LABEL_15:
    self->_libraryFavoritesGuideSavedPlacesCount = *((_DWORD *)v5 + 4);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_16:
}

@end