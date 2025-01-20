@interface ACCMediaLibraryUpdatePlaylistContentItem
- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 playlistPersistentID:(unint64_t)a5;
- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 playlistPersistentID:(unint64_t)a4 dict:(id)a5;
- (NSString)albumArtist;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)composer;
- (NSString)genre;
- (NSString)mediaLibraryUID;
- (NSString)title;
- (id)copyNSRepresentation:(int)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)persistentID;
- (unint64_t)playlistPersistentID;
- (unint64_t)validMask;
- (void)fillStruct:(id *)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setArtist:(id)a3;
- (void)setComposer:(id)a3;
- (void)setGenre:(id)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setPlaylistPersistentID:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ACCMediaLibraryUpdatePlaylistContentItem

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 playlistPersistentID:(unint64_t)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACCMediaLibraryUpdatePlaylistContentItem;
  v10 = [(ACCMediaLibraryUpdatePlaylistContentItem *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaLibraryUID, a3);
    v11->_playlistPersistentID = a5;
    v11->_validMask = 1;
    title = v11->_title;
    v11->_persistentID = a4;
    v11->_title = 0;

    albumTitle = v11->_albumTitle;
    v11->_albumTitle = 0;

    artist = v11->_artist;
    v11->_artist = 0;

    albumArtist = v11->_albumArtist;
    v11->_albumArtist = 0;

    genre = v11->_genre;
    v11->_genre = 0;

    composer = v11->_composer;
    v11->_composer = 0;
  }
  return v11;
}

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 playlistPersistentID:(unint64_t)a4 dict:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)ACCMediaLibraryUpdatePlaylistContentItem;
  v11 = [(ACCMediaLibraryUpdatePlaylistContentItem *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    v12->_playlistPersistentID = a4;
    title = v12->_title;
    v12->_persistentID = 0;
    v12->_title = 0;

    albumTitle = v12->_albumTitle;
    v12->_albumTitle = 0;

    artist = v12->_artist;
    v12->_artist = 0;

    albumArtist = v12->_albumArtist;
    v12->_albumArtist = 0;

    genre = v12->_genre;
    v12->_genre = 0;

    composer = v12->_composer;
    v12->_composer = 0;

    v12->_validMask = 0;
    objc_super v19 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemPersistentID"];

    if (v19)
    {
      v20 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemPersistentID"];
      v12->_persistentID = [v20 unsignedLongLongValue];

      v12->_validMask |= 1uLL;
    }
    v21 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemTitle"];

    if (v21)
    {
      uint64_t v22 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemTitle"];
      v23 = v12->_title;
      v12->_title = (NSString *)v22;

      v12->_validMask |= 2uLL;
    }
    v24 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumTitle"];

    if (v24)
    {
      uint64_t v25 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumTitle"];
      v26 = v12->_albumTitle;
      v12->_albumTitle = (NSString *)v25;

      v12->_validMask |= 0x40uLL;
    }
    v27 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemArtist"];

    if (v27)
    {
      uint64_t v28 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemArtist"];
      v29 = v12->_artist;
      v12->_artist = (NSString *)v28;

      v12->_validMask |= 0x1000uLL;
    }
    v30 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumArtist"];

    if (v30)
    {
      uint64_t v31 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumArtist"];
      v32 = v12->_albumArtist;
      v12->_albumArtist = (NSString *)v31;

      v12->_validMask |= 0x4000uLL;
    }
    v33 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemGenre"];

    if (v33)
    {
      uint64_t v34 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemGenre"];
      v35 = v12->_genre;
      v12->_genre = (NSString *)v34;

      v12->_validMask |= 0x10000uLL;
    }
    v36 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemComposer"];

    if (v36)
    {
      uint64_t v37 = [v10 objectForKey:@"ACCMediaLibraryPlaylistItemComposer"];
      v38 = v12->_composer;
      v12->_composer = (NSString *)v37;

      v12->_validMask |= 0x40000uLL;
    }
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryUpdatePlaylistContentItem>[%@:%llu itemPersistentID=%llu '%@' validMask=%llxh]", self->_mediaLibraryUID, self->_playlistPersistentID, self->_persistentID, self->_title, self->_validMask];
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(ACCMediaLibraryUpdatePlaylistContentItem *)self description];
  id v5 = [(ACCMediaLibraryUpdatePlaylistContentItem *)self copyNSRepresentation:3];
  v6 = [v3 stringWithFormat:@"%@\n    %@", v4, v5];

  return v6;
}

- (id)copyNSRepresentation:(int)a3
{
  if (a3 != 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t validMask = self->_validMask;
    if (validMask)
    {
      v7 = [NSNumber numberWithUnsignedLongLong:self->_persistentID];
      [v4 setObject:v7 forKey:@"ACCMediaLibraryPlaylistItemPersistentID"];

      unint64_t validMask = self->_validMask;
      if ((validMask & 2) == 0)
      {
LABEL_5:
        if ((validMask & 0x40) == 0) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
    else if ((validMask & 2) == 0)
    {
      goto LABEL_5;
    }
    [v4 setObject:self->_title forKey:@"ACCMediaLibraryPlaylistItemTitle"];
    unint64_t validMask = self->_validMask;
    if ((validMask & 0x40) == 0)
    {
LABEL_6:
      if ((validMask & 0x1000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
LABEL_14:
    [v4 setObject:self->_albumTitle forKey:@"ACCMediaLibraryPlaylistItemAlbumTitle"];
    unint64_t validMask = self->_validMask;
    if ((validMask & 0x1000) == 0)
    {
LABEL_7:
      if ((validMask & 0x4000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
LABEL_15:
    [v4 setObject:self->_artist forKey:@"ACCMediaLibraryPlaylistItemArtist"];
    unint64_t validMask = self->_validMask;
    if ((validMask & 0x4000) == 0)
    {
LABEL_8:
      if ((validMask & 0x10000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
LABEL_16:
    [v4 setObject:self->_albumArtist forKey:@"ACCMediaLibraryPlaylistItemAlbumArtist"];
    unint64_t validMask = self->_validMask;
    if ((validMask & 0x10000) == 0)
    {
LABEL_9:
      if ((validMask & 0x40000) == 0) {
        return v4;
      }
LABEL_10:
      [v4 setObject:self->_composer forKey:@"ACCMediaLibraryPlaylistItemComposer"];
      return v4;
    }
LABEL_17:
    [v4 setObject:self->_genre forKey:@"ACCMediaLibraryPlaylistItemGenre"];
    if ((self->_validMask & 0x40000) == 0) {
      return v4;
    }
    goto LABEL_10;
  }
  [NSNumber numberWithUnsignedLongLong:self->_persistentID];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fillStruct:(id *)a3
{
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
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
      if ((validMask & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
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
  if ((validMask & 0x40) == 0)
  {
LABEL_4:
    if ((validMask & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_13:
  albumTitle = self->_albumTitle;
  if (albumTitle)
  {
    albumTitle = [(NSString *)albumTitle UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var3 = (char *)albumTitle;
  a3->var0 |= 0x40u;
  if ((validMask & 0x1000) == 0)
  {
LABEL_5:
    if ((validMask & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_16:
  artist = self->_artist;
  if (artist)
  {
    artist = [(NSString *)artist UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var4 = (char *)artist;
  a3->var0 |= 0x1000u;
  if ((validMask & 0x4000) == 0)
  {
LABEL_6:
    if ((validMask & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_19:
  albumArtist = self->_albumArtist;
  if (albumArtist)
  {
    albumArtist = [(NSString *)albumArtist UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var5 = (char *)albumArtist;
  a3->var0 |= 0x4000u;
  if ((validMask & 0x10000) == 0)
  {
LABEL_7:
    if ((validMask & 0x40000) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_22:
  genre = self->_genre;
  if (genre)
  {
    genre = [(NSString *)genre UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var6 = (char *)genre;
  a3->var0 |= 0x10000u;
  if ((validMask & 0x40000) != 0)
  {
LABEL_25:
    composer = self->_composer;
    if (composer) {
      composer = [(NSString *)composer UTF8String];
    }
    a3->var7 = (char *)composer;
    a3->var0 |= 0x40000u;
  }
}

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setPlaylistPersistentID:(unint64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (void)setPersistentID:(unint64_t)a3
{
  self->_validMask |= 1uLL;
  self->_persistentID = a3;
}

- (void)setTitle:(id)a3
{
  self->_validMask |= 1uLL;
}

- (void)setAlbumTitle:(id)a3
{
  self->_validMask |= 0x40uLL;
}

- (void)setArtist:(id)a3
{
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  self->_validMask |= 0x4000uLL;
}

- (void)setGenre:(id)a3
{
  self->_validMask |= 0x10000uLL;
}

- (void)setComposer:(id)a3
{
  self->_validMask |= 0x40000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (unint64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)composer
{
  return self->_composer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end