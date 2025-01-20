@interface ACCMediaLibraryUpdateItem
- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 dict:(id)a4;
- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5;
- (BOOL)local;
- (BOOL)partOfCompilation;
- (NSString)albumArtist;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)composer;
- (NSString)genre;
- (NSString)mediaLibraryUID;
- (NSString)revision;
- (NSString)title;
- (id)copyDict;
- (id)debugDescription;
- (id)description;
- (int)rating;
- (int)type;
- (unint64_t)albumArtistPersistentID;
- (unint64_t)albumPersistentID;
- (unint64_t)artistPersistentID;
- (unint64_t)composerPersistentID;
- (unint64_t)genrePersistentID;
- (unint64_t)persistentID;
- (unint64_t)validMask;
- (unsigned)albumDiscCount;
- (unsigned)albumDiscNumber;
- (unsigned)albumTrackCount;
- (unsigned)albumTrackNumber;
- (unsigned)chapterCount;
- (unsigned)duration;
- (void)copyDict;
- (void)fillStruct:(id *)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumArtistPersistentID:(unint64_t)a3;
- (void)setAlbumDiscCount:(unsigned __int16)a3;
- (void)setAlbumDiscNumber:(unsigned __int16)a3;
- (void)setAlbumPersistentID:(unint64_t)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setAlbumTrackCount:(unsigned __int16)a3;
- (void)setAlbumTrackNumber:(unsigned __int16)a3;
- (void)setArtist:(id)a3;
- (void)setArtistPersistentID:(unint64_t)a3;
- (void)setChapterCount:(unsigned __int16)a3;
- (void)setComposer:(id)a3;
- (void)setComposerPersistentID:(unint64_t)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setGenre:(id)a3;
- (void)setGenrePersistentID:(unint64_t)a3;
- (void)setLocal:(BOOL)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setPartOfCompilation:(BOOL)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setRating:(int)a3;
- (void)setRevision:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ACCMediaLibraryUpdateItem

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ACCMediaLibraryUpdateItem;
  v11 = [(ACCMediaLibraryUpdateItem *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1;
    title = v12->_title;
    v12->_title = 0;

    *(void *)&v12->_type = 0x500000004;
    v12->_duration = 0;
    albumTitle = v12->_albumTitle;
    v12->_albumPersistentID = 0;
    v12->_albumTitle = 0;

    artist = v12->_artist;
    v12->_artistPersistentID = 0;
    v12->_artist = 0;
    *(void *)&v12->_albumTrackNumber = 0;

    albumArtist = v12->_albumArtist;
    v12->_albumArtistPersistentID = 0;
    v12->_albumArtist = 0;

    genre = v12->_genre;
    v12->_genrePersistentID = 0;
    v12->_genre = 0;

    composer = v12->_composer;
    v12->_composerPersistentID = 0;
    v12->_composer = 0;

    *(_WORD *)&v12->_partOfCompilation = 0;
    v12->_chapterCount = 0;
  }

  return v12;
}

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)ACCMediaLibraryUpdateItem;
  id v9 = [(ACCMediaLibraryUpdateItem *)&v72 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_10021CEF8;

    v10->_persistentID = 0;
    title = v10->_title;
    v10->_title = 0;

    *(void *)&v10->_type = 0x500000004;
    v10->_duration = 0;
    albumTitle = v10->_albumTitle;
    v10->_albumPersistentID = 0;
    v10->_albumTitle = 0;

    artist = v10->_artist;
    v10->_artistPersistentID = 0;
    v10->_artist = 0;
    *(void *)&v10->_albumTrackNumber = 0;

    albumArtist = v10->_albumArtist;
    v10->_albumArtistPersistentID = 0;
    v10->_albumArtist = 0;

    genre = v10->_genre;
    v10->_genrePersistentID = 0;
    v10->_genre = 0;

    composer = v10->_composer;
    v10->_composerPersistentID = 0;
    v10->_composer = 0;

    *(_WORD *)&v10->_partOfCompilation = 0;
    v10->_chapterCount = 0;
    v10->_validMask = 0;
    v18 = [v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];

    if (v18)
    {
      uint64_t v19 = [v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];
      objc_super v20 = v10->_revision;
      v10->_revision = (NSString *)v19;
    }
    v21 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemPersistentID"];

    if (v21)
    {
      v22 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemPersistentID"];
      v10->_persistentID = (unint64_t)[v22 unsignedLongLongValue];

      v10->_validMask |= 1uLL;
    }
    v23 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemTitle"];

    if (v23)
    {
      uint64_t v24 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemTitle"];
      v25 = v10->_title;
      v10->_title = (NSString *)v24;

      v10->_validMask |= 2uLL;
    }
    v26 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemType"];

    if (v26)
    {
      v27 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemType"];
      v10->_type = [v27 unsignedCharValue];

      v10->_validMask |= 4uLL;
    }
    v28 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemRating"];

    if (v28)
    {
      v29 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemRating"];
      v10->_rating = [v29 unsignedCharValue];

      v10->_validMask |= 8uLL;
    }
    v30 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"];

    if (v30)
    {
      v31 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"];
      v10->_duration = [v31 unsignedLongValue];

      v10->_validMask |= 0x10uLL;
    }
    v32 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumPersistentID"];

    if (v32)
    {
      v33 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumPersistentID"];
      v10->_albumPersistentID = (unint64_t)[v33 unsignedLongLongValue];

      v10->_validMask |= 0x20uLL;
    }
    v34 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTitle"];

    if (v34)
    {
      uint64_t v35 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTitle"];
      v36 = v10->_albumTitle;
      v10->_albumTitle = (NSString *)v35;

      v10->_validMask |= 0x40uLL;
    }
    v37 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackNumber"];

    if (v37)
    {
      v38 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackNumber"];
      v10->_albumTrackNumber = (unsigned __int16)[v38 unsignedShortValue];

      v10->_validMask |= 0x80uLL;
    }
    v39 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackCount"];

    if (v39)
    {
      v40 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackCount"];
      v10->_albumTrackCount = (unsigned __int16)[v40 unsignedShortValue];

      v10->_validMask |= 0x100uLL;
    }
    v41 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscNumber"];

    if (v41)
    {
      v42 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscNumber"];
      v10->_albumDiscNumber = (unsigned __int16)[v42 unsignedShortValue];

      v10->_validMask |= 0x200uLL;
    }
    v43 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscCount"];

    if (v43)
    {
      v44 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscCount"];
      v10->_albumDiscCount = (unsigned __int16)[v44 unsignedShortValue];

      v10->_validMask |= 0x400uLL;
    }
    v45 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemArtistPersistentID"];

    if (v45)
    {
      v46 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemArtistPersistentID"];
      v10->_artistPersistentID = (unint64_t)[v46 unsignedLongLongValue];

      v10->_validMask |= 0x800uLL;
    }
    v47 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemArtist"];

    if (v47)
    {
      uint64_t v48 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemArtist"];
      v49 = v10->_artist;
      v10->_artist = (NSString *)v48;

      v10->_validMask |= 0x1000uLL;
    }
    v50 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtistPersistentID"];

    if (v50)
    {
      v51 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtistPersistentID"];
      v10->_albumArtistPersistentID = (unint64_t)[v51 unsignedLongLongValue];

      v10->_validMask |= 0x2000uLL;
    }
    v52 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtist"];

    if (v52)
    {
      uint64_t v53 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtist"];
      v54 = v10->_albumArtist;
      v10->_albumArtist = (NSString *)v53;

      v10->_validMask |= 0x4000uLL;
    }
    v55 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemGenrePersistentID"];

    if (v55)
    {
      v56 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemGenrePersistentID"];
      v10->_genrePersistentID = (unint64_t)[v56 unsignedLongLongValue];

      v10->_validMask |= 0x8000uLL;
    }
    v57 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemGenre"];

    if (v57)
    {
      uint64_t v58 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemGenre"];
      v59 = v10->_genre;
      v10->_genre = (NSString *)v58;

      v10->_validMask |= 0x10000uLL;
    }
    v60 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemComposerPersistentID"];

    if (v60)
    {
      v61 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemComposerPersistentID"];
      v10->_composerPersistentID = (unint64_t)[v61 unsignedLongLongValue];

      v10->_validMask |= 0x20000uLL;
    }
    v62 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemComposer"];

    if (v62)
    {
      uint64_t v63 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemComposer"];
      v64 = v10->_composer;
      v10->_composer = (NSString *)v63;

      v10->_validMask |= 0x40000uLL;
    }
    v65 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemIsPartOfCompilation"];

    if (v65)
    {
      v66 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemIsPartOfCompilation"];
      v10->_partOfCompilation = [v66 unsignedCharValue] != 0;

      v10->_validMask |= 0x80000uLL;
    }
    v67 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemIsLocal"];

    if (v67)
    {
      v68 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemIsLocal"];
      v10->_local = [v68 unsignedCharValue] != 0;

      v10->_validMask |= 0x2000000uLL;
    }
    v69 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemChapterCount"];

    if (v69)
    {
      v70 = [v8 objectForKey:@"ACCMediaLibraryUpdateItemChapterCount"];
      v10->_chapterCount = (unsigned __int16)[v70 unsignedShortValue];

      v10->_validMask |= 0x8000000uLL;
    }
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<ACCMediaLibraryUpdateItem>[%@:%llu valid=%llxh '%@' mediaType=%d local=%d]", self->_mediaLibraryUID, self->_persistentID, self->_validMask, self->_title, self->_type, self->_local];
}

- (id)debugDescription
{
  v3 = [(ACCMediaLibraryUpdateItem *)self description];
  id v4 = [(ACCMediaLibraryUpdateItem *)self copyDict];
  v5 = +[NSString stringWithFormat:@"%@\n    %@", v3, v4];

  return v5;
}

- (id)copyDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  p_unint64_t validMask = (uint64_t *)&self->_validMask;
  unint64_t validMask = self->_validMask;
  if (validMask)
  {
    id v10 = +[NSNumber numberWithUnsignedLongLong:self->_persistentID];
    [v3 setObject:v10 forKey:@"ACCMediaLibraryUpdateItemPersistentID"];

    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:self->_title forKey:@"ACCMediaLibraryUpdateItemTitle"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  v11 = +[NSNumber numberWithUnsignedChar:LOBYTE(self->_type)];
  [v3 setObject:v11 forKey:@"ACCMediaLibraryUpdateItemType"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_5:
    if ((validMask & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  v12 = +[NSNumber numberWithUnsignedChar:LOBYTE(self->_rating)];
  [v3 setObject:v12 forKey:@"ACCMediaLibraryUpdateItemRating"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x10) == 0)
  {
LABEL_6:
    if ((validMask & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  v13 = +[NSNumber numberWithUnsignedLong:self->_duration];
  [v3 setObject:v13 forKey:@"ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x20) == 0)
  {
LABEL_7:
    if ((validMask & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  v14 = +[NSNumber numberWithUnsignedLongLong:self->_albumPersistentID];
  [v3 setObject:v14 forKey:@"ACCMediaLibraryUpdateItemAlbumPersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_8:
    if ((validMask & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:self->_albumTitle forKey:@"ACCMediaLibraryUpdateItemAlbumTitle"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x80) == 0)
  {
LABEL_9:
    if ((validMask & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  v15 = +[NSNumber numberWithUnsignedShort:self->_albumTrackNumber];
  [v3 setObject:v15 forKey:@"ACCMediaLibraryUpdateItemAlbumTrackNumber"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x100) == 0)
  {
LABEL_10:
    if ((validMask & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  v16 = +[NSNumber numberWithUnsignedShort:self->_albumTrackCount];
  [v3 setObject:v16 forKey:@"ACCMediaLibraryUpdateItemAlbumTrackCount"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x200) == 0)
  {
LABEL_11:
    if ((validMask & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  v17 = +[NSNumber numberWithUnsignedShort:self->_albumDiscNumber];
  [v3 setObject:v17 forKey:@"ACCMediaLibraryUpdateItemAlbumDiscNumber"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x400) == 0)
  {
LABEL_12:
    if ((validMask & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  v18 = +[NSNumber numberWithUnsignedShort:self->_albumDiscCount];
  [v3 setObject:v18 forKey:@"ACCMediaLibraryUpdateItemAlbumDiscCount"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x800) == 0)
  {
LABEL_13:
    if ((validMask & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:self->_artistPersistentID];
  [v3 setObject:v19 forKey:@"ACCMediaLibraryUpdateItemArtistPersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x1000) == 0)
  {
LABEL_14:
    if ((validMask & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:self->_artist forKey:@"ACCMediaLibraryUpdateItemArtist"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x2000) == 0)
  {
LABEL_15:
    if ((validMask & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  objc_super v20 = +[NSNumber numberWithUnsignedLongLong:self->_albumArtistPersistentID];
  [v3 setObject:v20 forKey:@"ACCMediaLibraryUpdateItemAlbumArtistPersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x4000) == 0)
  {
LABEL_16:
    if ((validMask & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:self->_albumArtist forKey:@"ACCMediaLibraryUpdateItemAlbumArtist"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x8000) == 0)
  {
LABEL_17:
    if ((validMask & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  v21 = +[NSNumber numberWithUnsignedLongLong:self->_genrePersistentID];
  [v3 setObject:v21 forKey:@"ACCMediaLibraryUpdateItemGenrePersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x10000) == 0)
  {
LABEL_18:
    if ((validMask & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:self->_genre forKey:@"ACCMediaLibraryUpdateItemGenre"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x20000) == 0)
  {
LABEL_19:
    if ((validMask & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  v22 = +[NSNumber numberWithUnsignedLongLong:self->_composerPersistentID];
  [v3 setObject:v22 forKey:@"ACCMediaLibraryUpdateItemComposerPersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x40000) == 0)
  {
LABEL_20:
    if ((validMask & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:self->_composer forKey:@"ACCMediaLibraryUpdateItemComposer"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x80000) == 0)
  {
LABEL_21:
    if ((validMask & 0x2000000) == 0) {
      goto LABEL_22;
    }
LABEL_47:
    uint64_t v24 = +[NSNumber numberWithUnsignedChar:self->_local];
    [v3 setObject:v24 forKey:@"ACCMediaLibraryUpdateItemIsLocal"];

    if ((self->_validMask & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_46:
  v23 = +[NSNumber numberWithUnsignedChar:self->_partOfCompilation];
  [v3 setObject:v23 forKey:@"ACCMediaLibraryUpdateItemIsPartOfCompilation"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x2000000) != 0) {
    goto LABEL_47;
  }
LABEL_22:
  if ((validMask & 0x8000000) != 0)
  {
LABEL_23:
    v6 = +[NSNumber numberWithUnsignedLongLong:self->_chapterCount];
    [v3 setObject:v6 forKey:@"ACCMediaLibraryUpdateItemChapterCount"];
  }
LABEL_24:
  uint64_t v7 = gLogObjects;
  int v8 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v9 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      acc_nvmInfo_getPairingStatus_cold_1(v7, v8);
    }
    id v9 = &_os_log_default;
    id v25 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(ACCMediaLibraryUpdateItem *)p_validMask copyDict];
  }

  return v3;
}

- (void)fillStruct:(id *)a3
{
  *(_OWORD *)&a3->var17 = 0u;
  *(_OWORD *)&a3->var19 = 0u;
  *(_OWORD *)&a3->var13 = 0u;
  *(_OWORD *)&a3->var15 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var8 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  unint64_t validMask = self->_validMask;
  if (validMask)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }
  title = self->_title;
  if (title)
  {
    title = [(NSString *)title UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var2 = (char *)title;
  a3->var0 |= 2u;
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  a3->var3 = self->_type;
  a3->var0 |= 4u;
  if ((validMask & 8) == 0)
  {
LABEL_5:
    if ((validMask & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  a3->var4 = self->_rating;
  a3->var0 |= 8u;
  if ((validMask & 0x10) == 0)
  {
LABEL_6:
    if ((validMask & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  a3->var5 = self->_duration;
  a3->var0 |= 0x10u;
  if ((validMask & 0x20) == 0)
  {
LABEL_7:
    if ((validMask & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  a3->var6 = self->_albumPersistentID;
  a3->var0 |= 0x20u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_8:
    if ((validMask & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_33:
  albumTitle = self->_albumTitle;
  if (albumTitle)
  {
    albumTitle = [(NSString *)albumTitle UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var7 = (char *)albumTitle;
  a3->var0 |= 0x40u;
  if ((validMask & 0x80) == 0)
  {
LABEL_9:
    if ((validMask & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  a3->var8 = self->_albumTrackNumber;
  a3->var0 |= 0x80u;
  if ((validMask & 0x100) == 0)
  {
LABEL_10:
    if ((validMask & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  a3->var9 = self->_albumTrackCount;
  a3->var0 |= 0x100u;
  if ((validMask & 0x200) == 0)
  {
LABEL_11:
    if ((validMask & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  a3->var10 = self->_albumDiscNumber;
  a3->var0 |= 0x200u;
  if ((validMask & 0x400) == 0)
  {
LABEL_12:
    if ((validMask & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  a3->var11 = self->_albumDiscCount;
  a3->var0 |= 0x400u;
  if ((validMask & 0x800) == 0)
  {
LABEL_13:
    if ((validMask & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  a3->var12 = self->_artistPersistentID;
  a3->var0 |= 0x800u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x1000) == 0)
  {
LABEL_14:
    if ((validMask & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_41:
  artist = self->_artist;
  if (artist)
  {
    artist = [(NSString *)artist UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var13 = (char *)artist;
  a3->var0 |= 0x1000u;
  if ((validMask & 0x2000) == 0)
  {
LABEL_15:
    if ((validMask & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  a3->var14 = self->_albumArtistPersistentID;
  a3->var0 |= 0x2000u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x4000) == 0)
  {
LABEL_16:
    if ((validMask & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_45:
  albumArtist = self->_albumArtist;
  if (albumArtist)
  {
    albumArtist = [(NSString *)albumArtist UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var15 = (char *)albumArtist;
  a3->var0 |= 0x4000u;
  if ((validMask & 0x8000) == 0)
  {
LABEL_17:
    if ((validMask & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  a3->var16 = self->_genrePersistentID;
  a3->var0 |= 0x8000u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x10000) == 0)
  {
LABEL_18:
    if ((validMask & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_49:
  genre = self->_genre;
  if (genre)
  {
    genre = [(NSString *)genre UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var17 = (char *)genre;
  a3->var0 |= 0x10000u;
  if ((validMask & 0x20000) == 0)
  {
LABEL_19:
    if ((validMask & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  a3->var18 = self->_composerPersistentID;
  a3->var0 |= 0x20000u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 0x40000) == 0)
  {
LABEL_20:
    if ((validMask & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_53:
  composer = self->_composer;
  if (composer)
  {
    composer = [(NSString *)composer UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var19 = (char *)composer;
  a3->var0 |= 0x40000u;
  if ((validMask & 0x80000) == 0)
  {
LABEL_21:
    if ((validMask & 0x2000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  a3->var20 = self->_partOfCompilation;
  a3->var0 |= 0x80000u;
  if ((validMask & 0x2000000) == 0)
  {
LABEL_22:
    if ((validMask & 0x8000000) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_57:
  a3->var21 = self->_local;
  a3->var0 |= 0x2000000u;
  if ((validMask & 0x8000000) == 0) {
    return;
  }
LABEL_23:
  a3->var22 = self->_chapterCount;
  a3->var0 |= 0x8000000u;
}

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setRevision:(id)a3
{
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_unint64_t validMask = v3;
}

- (void)setTitle:(id)a3
{
  self->_validMask |= 2uLL;
}

- (void)setType:(int)a3
{
  self->_type = a3;
  self->_validMask |= 4uLL;
}

- (void)setRating:(int)a3
{
  self->_rating = a3;
  self->_validMask |= 8uLL;
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setAlbumPersistentID:(unint64_t)a3
{
  self->_albumPersistentID = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setAlbumTitle:(id)a3
{
  self->_validMask |= 0x40uLL;
}

- (void)setAlbumTrackNumber:(unsigned __int16)a3
{
  self->_albumTrackNumber = a3;
  self->_validMask |= 0x80uLL;
}

- (void)setAlbumTrackCount:(unsigned __int16)a3
{
  self->_albumTrackCount = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setAlbumDiscNumber:(unsigned __int16)a3
{
  self->_albumDiscNumber = a3;
  self->_validMask |= 0x200uLL;
}

- (void)setAlbumDiscCount:(unsigned __int16)a3
{
  self->_albumDiscCount = a3;
  self->_validMask |= 0x400uLL;
}

- (void)setArtistPersistentID:(unint64_t)a3
{
  self->_artistPersistentID = a3;
  self->_validMask |= 0x800uLL;
}

- (void)setArtist:(id)a3
{
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtistPersistentID:(unint64_t)a3
{
  self->_albumArtistPersistentID = a3;
  self->_validMask |= 0x2000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  self->_validMask |= 0x4000uLL;
}

- (void)setGenrePersistentID:(unint64_t)a3
{
  self->_genrePersistentID = a3;
  self->_validMask |= 0x8000uLL;
}

- (void)setGenre:(id)a3
{
  self->_validMask |= 0x10000uLL;
}

- (void)setComposerPersistentID:(unint64_t)a3
{
  self->_composerPersistentID = a3;
  self->_validMask |= 0x20000uLL;
}

- (void)setComposer:(id)a3
{
  self->_validMask |= 0x40000uLL;
}

- (void)setPartOfCompilation:(BOOL)a3
{
  self->_partOfCompilation = a3;
  self->_validMask |= 0x80000uLL;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
  self->_validMask |= 0x2000000uLL;
}

- (void)setChapterCount:(unsigned __int16)a3
{
  self->_chapterCount = a3;
  self->_validMask |= 0x8000000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)title
{
  return self->_title;
}

- (int)type
{
  return self->_type;
}

- (int)rating
{
  return self->_rating;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unint64_t)albumPersistentID
{
  return self->_albumPersistentID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (unsigned)albumTrackNumber
{
  return self->_albumTrackNumber;
}

- (unsigned)albumTrackCount
{
  return self->_albumTrackCount;
}

- (unsigned)albumDiscNumber
{
  return self->_albumDiscNumber;
}

- (unsigned)albumDiscCount
{
  return self->_albumDiscCount;
}

- (unint64_t)artistPersistentID
{
  return self->_artistPersistentID;
}

- (NSString)artist
{
  return self->_artist;
}

- (unint64_t)albumArtistPersistentID
{
  return self->_albumArtistPersistentID;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (unint64_t)genrePersistentID
{
  return self->_genrePersistentID;
}

- (NSString)genre
{
  return self->_genre;
}

- (unint64_t)composerPersistentID
{
  return self->_composerPersistentID;
}

- (NSString)composer
{
  return self->_composer;
}

- (BOOL)partOfCompilation
{
  return self->_partOfCompilation;
}

- (BOOL)local
{
  return self->_local;
}

- (unsigned)chapterCount
{
  return self->_chapterCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

- (void)copyDict
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "_validMask=%llxh dict=%@", (uint8_t *)&v4, 0x16u);
}

@end