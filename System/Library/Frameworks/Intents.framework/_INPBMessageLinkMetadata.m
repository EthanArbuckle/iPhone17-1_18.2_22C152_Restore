@interface _INPBMessageLinkMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlbumArtist;
- (BOOL)hasAlbumName;
- (BOOL)hasAppleTvSubtitle;
- (BOOL)hasAppleTvTitle;
- (BOOL)hasArtistGenre;
- (BOOL)hasArtistName;
- (BOOL)hasAudioBookAuthor;
- (BOOL)hasAudioBookName;
- (BOOL)hasAudioBookNarrator;
- (BOOL)hasBookAuthor;
- (BOOL)hasBookName;
- (BOOL)hasCreator;
- (BOOL)hasITunesStoreFrontIdentifier;
- (BOOL)hasITunesStoreIdentifier;
- (BOOL)hasItemType;
- (BOOL)hasLinkMediaType;
- (BOOL)hasLinkURL;
- (BOOL)hasMovieBundleGenre;
- (BOOL)hasMovieBundleName;
- (BOOL)hasMovieGenre;
- (BOOL)hasMovieName;
- (BOOL)hasMusicVideoArtist;
- (BOOL)hasMusicVideoName;
- (BOOL)hasOpenGraphType;
- (BOOL)hasOriginalURL;
- (BOOL)hasPlaylistCurator;
- (BOOL)hasPlaylistName;
- (BOOL)hasPodcastArtist;
- (BOOL)hasPodcastEpisodeArtist;
- (BOOL)hasPodcastEpisodeName;
- (BOOL)hasPodcastEpisodePodcastName;
- (BOOL)hasPodcastEpisodeReleaseDate;
- (BOOL)hasPodcastName;
- (BOOL)hasRadioCurator;
- (BOOL)hasRadioName;
- (BOOL)hasSiteName;
- (BOOL)hasSoftwareGenre;
- (BOOL)hasSoftwareName;
- (BOOL)hasSoftwarePlatform;
- (BOOL)hasSongAlbum;
- (BOOL)hasSongArtist;
- (BOOL)hasSongTitle;
- (BOOL)hasSummary;
- (BOOL)hasTitle;
- (BOOL)hasTvEpisodeEpisodeName;
- (BOOL)hasTvEpisodeGenre;
- (BOOL)hasTvEpisodeSeasonName;
- (BOOL)hasTvSeasonGenre;
- (BOOL)hasTvSeasonName;
- (BOOL)hasTvShowName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)iconURLs;
- (NSArray)imageURLs;
- (NSString)albumArtist;
- (NSString)albumName;
- (NSString)appleTvSubtitle;
- (NSString)appleTvTitle;
- (NSString)artistGenre;
- (NSString)artistName;
- (NSString)audioBookAuthor;
- (NSString)audioBookName;
- (NSString)audioBookNarrator;
- (NSString)bookAuthor;
- (NSString)bookName;
- (NSString)creator;
- (NSString)iTunesStoreFrontIdentifier;
- (NSString)iTunesStoreIdentifier;
- (NSString)itemType;
- (NSString)movieBundleGenre;
- (NSString)movieBundleName;
- (NSString)movieGenre;
- (NSString)movieName;
- (NSString)musicVideoArtist;
- (NSString)musicVideoName;
- (NSString)openGraphType;
- (NSString)originalURL;
- (NSString)playlistCurator;
- (NSString)playlistName;
- (NSString)podcastArtist;
- (NSString)podcastEpisodeArtist;
- (NSString)podcastEpisodeName;
- (NSString)podcastEpisodePodcastName;
- (NSString)podcastName;
- (NSString)radioCurator;
- (NSString)radioName;
- (NSString)siteName;
- (NSString)softwareGenre;
- (NSString)softwareName;
- (NSString)softwarePlatform;
- (NSString)songAlbum;
- (NSString)songArtist;
- (NSString)songTitle;
- (NSString)summary;
- (NSString)title;
- (NSString)tvEpisodeEpisodeName;
- (NSString)tvEpisodeGenre;
- (NSString)tvEpisodeSeasonName;
- (NSString)tvSeasonGenre;
- (NSString)tvSeasonName;
- (NSString)tvShowName;
- (_INPBDateTime)podcastEpisodeReleaseDate;
- (_INPBMessageLinkMetadata)initWithCoder:(id)a3;
- (_INPBURLValue)linkURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)iconURLAtIndex:(unint64_t)a3;
- (id)imageURLAtIndex:(unint64_t)a3;
- (id)linkMediaTypeAsString:(int)a3;
- (int)StringAsLinkMediaType:(id)a3;
- (int)linkMediaType;
- (unint64_t)hash;
- (unint64_t)iconURLsCount;
- (unint64_t)imageURLsCount;
- (void)addIconURL:(id)a3;
- (void)addImageURL:(id)a3;
- (void)clearIconURLs;
- (void)clearImageURLs;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAppleTvSubtitle:(id)a3;
- (void)setAppleTvTitle:(id)a3;
- (void)setArtistGenre:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAudioBookAuthor:(id)a3;
- (void)setAudioBookName:(id)a3;
- (void)setAudioBookNarrator:(id)a3;
- (void)setBookAuthor:(id)a3;
- (void)setBookName:(id)a3;
- (void)setCreator:(id)a3;
- (void)setHasLinkMediaType:(BOOL)a3;
- (void)setITunesStoreFrontIdentifier:(id)a3;
- (void)setITunesStoreIdentifier:(id)a3;
- (void)setIconURLs:(id)a3;
- (void)setImageURLs:(id)a3;
- (void)setItemType:(id)a3;
- (void)setLinkMediaType:(int)a3;
- (void)setLinkURL:(id)a3;
- (void)setMovieBundleGenre:(id)a3;
- (void)setMovieBundleName:(id)a3;
- (void)setMovieGenre:(id)a3;
- (void)setMovieName:(id)a3;
- (void)setMusicVideoArtist:(id)a3;
- (void)setMusicVideoName:(id)a3;
- (void)setOpenGraphType:(id)a3;
- (void)setOriginalURL:(id)a3;
- (void)setPlaylistCurator:(id)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPodcastArtist:(id)a3;
- (void)setPodcastEpisodeArtist:(id)a3;
- (void)setPodcastEpisodeName:(id)a3;
- (void)setPodcastEpisodePodcastName:(id)a3;
- (void)setPodcastEpisodeReleaseDate:(id)a3;
- (void)setPodcastName:(id)a3;
- (void)setRadioCurator:(id)a3;
- (void)setRadioName:(id)a3;
- (void)setSiteName:(id)a3;
- (void)setSoftwareGenre:(id)a3;
- (void)setSoftwareName:(id)a3;
- (void)setSoftwarePlatform:(id)a3;
- (void)setSongAlbum:(id)a3;
- (void)setSongArtist:(id)a3;
- (void)setSongTitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTvEpisodeEpisodeName:(id)a3;
- (void)setTvEpisodeGenre:(id)a3;
- (void)setTvEpisodeSeasonName:(id)a3;
- (void)setTvSeasonGenre:(id)a3;
- (void)setTvSeasonName:(id)a3;
- (void)setTvShowName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMessageLinkMetadata

- (id)linkMediaTypeAsString:(int)a3
{
  if (a3 > 99)
  {
    if (a3 <= 139)
    {
      if (a3 > 119)
      {
        if (a3 == 120)
        {
          v4 = @"PODCAST_EPISODE";
          return v4;
        }
        if (a3 == 130)
        {
          v4 = @"TV_EPISODE";
          return v4;
        }
      }
      else
      {
        if (a3 == 100)
        {
          v4 = @"AUDIO_BOOK";
          return v4;
        }
        if (a3 == 110)
        {
          v4 = @"PODCAST";
          return v4;
        }
      }
    }
    else if (a3 <= 159)
    {
      if (a3 == 140)
      {
        v4 = @"TV_SEASON";
        return v4;
      }
      if (a3 == 150)
      {
        v4 = @"MOVIE";
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 160:
          v4 = @"TV_SHOW";
          return v4;
        case 170:
          v4 = @"MOVIE_BUNDLE";
          return v4;
        case 180:
          v4 = @"APPLE_TV";
          return v4;
      }
    }
LABEL_80:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 <= 49)
  {
    if (a3 > 29)
    {
      if (a3 == 30)
      {
        v4 = @"ALBUM";
        return v4;
      }
      if (a3 == 40)
      {
        v4 = @"MUSIC_VIDEO";
        return v4;
      }
    }
    else
    {
      if (a3 == 10)
      {
        v4 = @"UNKNOWN_LINK_TYPE";
        return v4;
      }
      if (a3 == 20)
      {
        v4 = @"SONG";
        return v4;
      }
    }
    goto LABEL_80;
  }
  if (a3 <= 69)
  {
    if (a3 == 50)
    {
      v4 = @"ARTIST";
      return v4;
    }
    if (a3 == 60)
    {
      v4 = @"PLAYLIST";
      return v4;
    }
    goto LABEL_80;
  }
  switch(a3)
  {
    case 'F':
      v4 = @"RADIO";
      break;
    case 'P':
      v4 = @"SOFTWARE";
      break;
    case 'Z':
      v4 = @"BOOK";
      return v4;
    default:
      goto LABEL_80;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvShowName, 0);
  objc_storeStrong((id *)&self->_tvSeasonName, 0);
  objc_storeStrong((id *)&self->_tvSeasonGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeEpisodeName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_songTitle, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_songAlbum, 0);
  objc_storeStrong((id *)&self->_softwarePlatform, 0);
  objc_storeStrong((id *)&self->_softwareName, 0);
  objc_storeStrong((id *)&self->_softwareGenre, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_radioName, 0);
  objc_storeStrong((id *)&self->_radioCurator, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeReleaseDate, 0);
  objc_storeStrong((id *)&self->_podcastEpisodePodcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeArtist, 0);
  objc_storeStrong((id *)&self->_podcastArtist, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_playlistCurator, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_openGraphType, 0);
  objc_storeStrong((id *)&self->_musicVideoName, 0);
  objc_storeStrong((id *)&self->_musicVideoArtist, 0);
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_movieGenre, 0);
  objc_storeStrong((id *)&self->_movieBundleName, 0);
  objc_storeStrong((id *)&self->_movieBundleGenre, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_imageURLs, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_bookName, 0);
  objc_storeStrong((id *)&self->_bookAuthor, 0);
  objc_storeStrong((id *)&self->_audioBookNarrator, 0);
  objc_storeStrong((id *)&self->_audioBookName, 0);
  objc_storeStrong((id *)&self->_audioBookAuthor, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistGenre, 0);
  objc_storeStrong((id *)&self->_appleTvTitle, 0);
  objc_storeStrong((id *)&self->_appleTvSubtitle, 0);
  objc_storeStrong((id *)&self->_albumName, 0);

  objc_storeStrong((id *)&self->_albumArtist, 0);
}

- (NSString)tvShowName
{
  return self->_tvShowName;
}

- (NSString)tvSeasonName
{
  return self->_tvSeasonName;
}

- (NSString)tvSeasonGenre
{
  return self->_tvSeasonGenre;
}

- (NSString)tvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName;
}

- (NSString)tvEpisodeGenre
{
  return self->_tvEpisodeGenre;
}

- (NSString)tvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)songTitle
{
  return self->_songTitle;
}

- (NSString)songArtist
{
  return self->_songArtist;
}

- (NSString)songAlbum
{
  return self->_songAlbum;
}

- (NSString)softwarePlatform
{
  return self->_softwarePlatform;
}

- (NSString)softwareName
{
  return self->_softwareName;
}

- (NSString)softwareGenre
{
  return self->_softwareGenre;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (NSString)radioName
{
  return self->_radioName;
}

- (NSString)radioCurator
{
  return self->_radioCurator;
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (_INPBDateTime)podcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate;
}

- (NSString)podcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName;
}

- (NSString)podcastEpisodeName
{
  return self->_podcastEpisodeName;
}

- (NSString)podcastEpisodeArtist
{
  return self->_podcastEpisodeArtist;
}

- (NSString)podcastArtist
{
  return self->_podcastArtist;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (NSString)playlistCurator
{
  return self->_playlistCurator;
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (NSString)openGraphType
{
  return self->_openGraphType;
}

- (NSString)musicVideoName
{
  return self->_musicVideoName;
}

- (NSString)musicVideoArtist
{
  return self->_musicVideoArtist;
}

- (NSString)movieName
{
  return self->_movieName;
}

- (NSString)movieGenre
{
  return self->_movieGenre;
}

- (NSString)movieBundleName
{
  return self->_movieBundleName;
}

- (NSString)movieBundleGenre
{
  return self->_movieBundleGenre;
}

- (_INPBURLValue)linkURL
{
  return self->_linkURL;
}

- (int)linkMediaType
{
  return self->_linkMediaType;
}

- (NSString)itemType
{
  return self->_itemType;
}

- (NSArray)imageURLs
{
  return self->_imageURLs;
}

- (NSArray)iconURLs
{
  return self->_iconURLs;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSString)iTunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier;
}

- (NSString)creator
{
  return self->_creator;
}

- (NSString)bookName
{
  return self->_bookName;
}

- (NSString)bookAuthor
{
  return self->_bookAuthor;
}

- (NSString)audioBookNarrator
{
  return self->_audioBookNarrator;
}

- (NSString)audioBookName
{
  return self->_audioBookName;
}

- (NSString)audioBookAuthor
{
  return self->_audioBookAuthor;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)artistGenre
{
  return self->_artistGenre;
}

- (NSString)appleTvTitle
{
  return self->_appleTvTitle;
}

- (NSString)appleTvSubtitle
{
  return self->_appleTvSubtitle;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_albumArtist)
  {
    v4 = [(_INPBMessageLinkMetadata *)self albumArtist];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"albumArtist"];
  }
  if (self->_albumName)
  {
    v6 = [(_INPBMessageLinkMetadata *)self albumName];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"albumName"];
  }
  if (self->_appleTvSubtitle)
  {
    v8 = [(_INPBMessageLinkMetadata *)self appleTvSubtitle];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"appleTvSubtitle"];
  }
  if (self->_appleTvTitle)
  {
    v10 = [(_INPBMessageLinkMetadata *)self appleTvTitle];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"appleTvTitle"];
  }
  if (self->_artistGenre)
  {
    v12 = [(_INPBMessageLinkMetadata *)self artistGenre];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"artistGenre"];
  }
  if (self->_artistName)
  {
    v14 = [(_INPBMessageLinkMetadata *)self artistName];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"artistName"];
  }
  if (self->_audioBookAuthor)
  {
    v16 = [(_INPBMessageLinkMetadata *)self audioBookAuthor];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"audioBookAuthor"];
  }
  if (self->_audioBookName)
  {
    v18 = [(_INPBMessageLinkMetadata *)self audioBookName];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"audioBookName"];
  }
  if (self->_audioBookNarrator)
  {
    v20 = [(_INPBMessageLinkMetadata *)self audioBookNarrator];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"audioBookNarrator"];
  }
  if (self->_bookAuthor)
  {
    v22 = [(_INPBMessageLinkMetadata *)self bookAuthor];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"bookAuthor"];
  }
  if (self->_bookName)
  {
    v24 = [(_INPBMessageLinkMetadata *)self bookName];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"bookName"];
  }
  if (self->_creator)
  {
    v26 = [(_INPBMessageLinkMetadata *)self creator];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"creator"];
  }
  if (self->_iTunesStoreFrontIdentifier)
  {
    v28 = [(_INPBMessageLinkMetadata *)self iTunesStoreFrontIdentifier];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"iTunesStoreFrontIdentifier"];
  }
  if (self->_iTunesStoreIdentifier)
  {
    v30 = [(_INPBMessageLinkMetadata *)self iTunesStoreIdentifier];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"iTunesStoreIdentifier"];
  }
  if (self->_iconURLs)
  {
    v32 = [(_INPBMessageLinkMetadata *)self iconURLs];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"iconURL"];
  }
  if (self->_imageURLs)
  {
    v34 = [(_INPBMessageLinkMetadata *)self imageURLs];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"imageURL"];
  }
  if (self->_itemType)
  {
    v36 = [(_INPBMessageLinkMetadata *)self itemType];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"itemType"];
  }
  if ([(_INPBMessageLinkMetadata *)self hasLinkMediaType])
  {
    uint64_t v38 = [(_INPBMessageLinkMetadata *)self linkMediaType];
    if ((int)v38 > 99)
    {
      if ((int)v38 <= 139)
      {
        if ((int)v38 > 119)
        {
          if (v38 == 120)
          {
            v39 = @"PODCAST_EPISODE";
            goto LABEL_80;
          }
          if (v38 == 130)
          {
            v39 = @"TV_EPISODE";
            goto LABEL_80;
          }
        }
        else
        {
          if (v38 == 100)
          {
            v39 = @"AUDIO_BOOK";
            goto LABEL_80;
          }
          if (v38 == 110)
          {
            v39 = @"PODCAST";
            goto LABEL_80;
          }
        }
      }
      else if ((int)v38 <= 159)
      {
        if (v38 == 140)
        {
          v39 = @"TV_SEASON";
          goto LABEL_80;
        }
        if (v38 == 150)
        {
          v39 = @"MOVIE";
          goto LABEL_80;
        }
      }
      else
      {
        switch(v38)
        {
          case 0xA0:
            v39 = @"TV_SHOW";
            goto LABEL_80;
          case 0xAA:
            v39 = @"MOVIE_BUNDLE";
            goto LABEL_80;
          case 0xB4:
            v39 = @"APPLE_TV";
            goto LABEL_80;
        }
      }
    }
    else if ((int)v38 <= 49)
    {
      if ((int)v38 > 29)
      {
        if (v38 == 30)
        {
          v39 = @"ALBUM";
          goto LABEL_80;
        }
        if (v38 == 40)
        {
          v39 = @"MUSIC_VIDEO";
          goto LABEL_80;
        }
      }
      else
      {
        if (v38 == 10)
        {
          v39 = @"UNKNOWN_LINK_TYPE";
          goto LABEL_80;
        }
        if (v38 == 20)
        {
          v39 = @"SONG";
          goto LABEL_80;
        }
      }
    }
    else if ((int)v38 <= 69)
    {
      if (v38 == 50)
      {
        v39 = @"ARTIST";
        goto LABEL_80;
      }
      if (v38 == 60)
      {
        v39 = @"PLAYLIST";
        goto LABEL_80;
      }
    }
    else
    {
      switch(v38)
      {
        case 'F':
          v39 = @"RADIO";
          goto LABEL_80;
        case 'P':
          v39 = @"SOFTWARE";
          goto LABEL_80;
        case 'Z':
          v39 = @"BOOK";
LABEL_80:
          [v3 setObject:v39 forKeyedSubscript:@"linkMediaType"];

          goto LABEL_81;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v38);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
LABEL_81:
  v40 = [(_INPBMessageLinkMetadata *)self linkURL];
  v41 = [v40 dictionaryRepresentation];
  [v3 setObject:v41 forKeyedSubscript:@"linkURL"];

  if (self->_movieBundleGenre)
  {
    v42 = [(_INPBMessageLinkMetadata *)self movieBundleGenre];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"movieBundleGenre"];
  }
  if (self->_movieBundleName)
  {
    v44 = [(_INPBMessageLinkMetadata *)self movieBundleName];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"movieBundleName"];
  }
  if (self->_movieGenre)
  {
    v46 = [(_INPBMessageLinkMetadata *)self movieGenre];
    v47 = (void *)[v46 copy];
    [v3 setObject:v47 forKeyedSubscript:@"movieGenre"];
  }
  if (self->_movieName)
  {
    v48 = [(_INPBMessageLinkMetadata *)self movieName];
    v49 = (void *)[v48 copy];
    [v3 setObject:v49 forKeyedSubscript:@"movieName"];
  }
  if (self->_musicVideoArtist)
  {
    v50 = [(_INPBMessageLinkMetadata *)self musicVideoArtist];
    v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"musicVideoArtist"];
  }
  if (self->_musicVideoName)
  {
    v52 = [(_INPBMessageLinkMetadata *)self musicVideoName];
    v53 = (void *)[v52 copy];
    [v3 setObject:v53 forKeyedSubscript:@"musicVideoName"];
  }
  if (self->_openGraphType)
  {
    v54 = [(_INPBMessageLinkMetadata *)self openGraphType];
    v55 = (void *)[v54 copy];
    [v3 setObject:v55 forKeyedSubscript:@"openGraphType"];
  }
  if (self->_originalURL)
  {
    v56 = [(_INPBMessageLinkMetadata *)self originalURL];
    v57 = (void *)[v56 copy];
    [v3 setObject:v57 forKeyedSubscript:@"originalURL"];
  }
  if (self->_playlistCurator)
  {
    v58 = [(_INPBMessageLinkMetadata *)self playlistCurator];
    v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"playlistCurator"];
  }
  if (self->_playlistName)
  {
    v60 = [(_INPBMessageLinkMetadata *)self playlistName];
    v61 = (void *)[v60 copy];
    [v3 setObject:v61 forKeyedSubscript:@"playlistName"];
  }
  if (self->_podcastArtist)
  {
    v62 = [(_INPBMessageLinkMetadata *)self podcastArtist];
    v63 = (void *)[v62 copy];
    [v3 setObject:v63 forKeyedSubscript:@"podcastArtist"];
  }
  if (self->_podcastEpisodeArtist)
  {
    v64 = [(_INPBMessageLinkMetadata *)self podcastEpisodeArtist];
    v65 = (void *)[v64 copy];
    [v3 setObject:v65 forKeyedSubscript:@"podcastEpisodeArtist"];
  }
  if (self->_podcastEpisodeName)
  {
    v66 = [(_INPBMessageLinkMetadata *)self podcastEpisodeName];
    v67 = (void *)[v66 copy];
    [v3 setObject:v67 forKeyedSubscript:@"podcastEpisodeName"];
  }
  if (self->_podcastEpisodePodcastName)
  {
    v68 = [(_INPBMessageLinkMetadata *)self podcastEpisodePodcastName];
    v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"podcastEpisodePodcastName"];
  }
  v70 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];
  v71 = [v70 dictionaryRepresentation];
  [v3 setObject:v71 forKeyedSubscript:@"podcastEpisodeReleaseDate"];

  if (self->_podcastName)
  {
    v72 = [(_INPBMessageLinkMetadata *)self podcastName];
    v73 = (void *)[v72 copy];
    [v3 setObject:v73 forKeyedSubscript:@"podcastName"];
  }
  if (self->_radioCurator)
  {
    v74 = [(_INPBMessageLinkMetadata *)self radioCurator];
    v75 = (void *)[v74 copy];
    [v3 setObject:v75 forKeyedSubscript:@"radioCurator"];
  }
  if (self->_radioName)
  {
    v76 = [(_INPBMessageLinkMetadata *)self radioName];
    v77 = (void *)[v76 copy];
    [v3 setObject:v77 forKeyedSubscript:@"radioName"];
  }
  if (self->_siteName)
  {
    v78 = [(_INPBMessageLinkMetadata *)self siteName];
    v79 = (void *)[v78 copy];
    [v3 setObject:v79 forKeyedSubscript:@"siteName"];
  }
  if (self->_softwareGenre)
  {
    v80 = [(_INPBMessageLinkMetadata *)self softwareGenre];
    v81 = (void *)[v80 copy];
    [v3 setObject:v81 forKeyedSubscript:@"softwareGenre"];
  }
  if (self->_softwareName)
  {
    v82 = [(_INPBMessageLinkMetadata *)self softwareName];
    v83 = (void *)[v82 copy];
    [v3 setObject:v83 forKeyedSubscript:@"softwareName"];
  }
  if (self->_softwarePlatform)
  {
    v84 = [(_INPBMessageLinkMetadata *)self softwarePlatform];
    v85 = (void *)[v84 copy];
    [v3 setObject:v85 forKeyedSubscript:@"softwarePlatform"];
  }
  if (self->_songAlbum)
  {
    v86 = [(_INPBMessageLinkMetadata *)self songAlbum];
    v87 = (void *)[v86 copy];
    [v3 setObject:v87 forKeyedSubscript:@"songAlbum"];
  }
  if (self->_songArtist)
  {
    v88 = [(_INPBMessageLinkMetadata *)self songArtist];
    v89 = (void *)[v88 copy];
    [v3 setObject:v89 forKeyedSubscript:@"songArtist"];
  }
  if (self->_songTitle)
  {
    v90 = [(_INPBMessageLinkMetadata *)self songTitle];
    v91 = (void *)[v90 copy];
    [v3 setObject:v91 forKeyedSubscript:@"songTitle"];
  }
  if (self->_summary)
  {
    v92 = [(_INPBMessageLinkMetadata *)self summary];
    v93 = (void *)[v92 copy];
    [v3 setObject:v93 forKeyedSubscript:@"summary"];
  }
  if (self->_title)
  {
    v94 = [(_INPBMessageLinkMetadata *)self title];
    v95 = (void *)[v94 copy];
    [v3 setObject:v95 forKeyedSubscript:@"title"];
  }
  if (self->_tvEpisodeEpisodeName)
  {
    v96 = [(_INPBMessageLinkMetadata *)self tvEpisodeEpisodeName];
    v97 = (void *)[v96 copy];
    [v3 setObject:v97 forKeyedSubscript:@"tvEpisodeEpisodeName"];
  }
  if (self->_tvEpisodeGenre)
  {
    v98 = [(_INPBMessageLinkMetadata *)self tvEpisodeGenre];
    v99 = (void *)[v98 copy];
    [v3 setObject:v99 forKeyedSubscript:@"tvEpisodeGenre"];
  }
  if (self->_tvEpisodeSeasonName)
  {
    v100 = [(_INPBMessageLinkMetadata *)self tvEpisodeSeasonName];
    v101 = (void *)[v100 copy];
    [v3 setObject:v101 forKeyedSubscript:@"tvEpisodeSeasonName"];
  }
  if (self->_tvSeasonGenre)
  {
    v102 = [(_INPBMessageLinkMetadata *)self tvSeasonGenre];
    v103 = (void *)[v102 copy];
    [v3 setObject:v103 forKeyedSubscript:@"tvSeasonGenre"];
  }
  if (self->_tvSeasonName)
  {
    v104 = [(_INPBMessageLinkMetadata *)self tvSeasonName];
    v105 = (void *)[v104 copy];
    [v3 setObject:v105 forKeyedSubscript:@"tvSeasonName"];
  }
  if (self->_tvShowName)
  {
    v106 = [(_INPBMessageLinkMetadata *)self tvShowName];
    v107 = (void *)[v106 copy];
    [v3 setObject:v107 forKeyedSubscript:@"tvShowName"];
  }
  id v108 = v3;

  return v108;
}

- (unint64_t)hash
{
  NSUInteger v55 = [(NSString *)self->_albumArtist hash];
  NSUInteger v54 = [(NSString *)self->_albumName hash];
  NSUInteger v53 = [(NSString *)self->_appleTvSubtitle hash];
  NSUInteger v52 = [(NSString *)self->_appleTvTitle hash];
  NSUInteger v51 = [(NSString *)self->_artistGenre hash];
  NSUInteger v50 = [(NSString *)self->_artistName hash];
  NSUInteger v49 = [(NSString *)self->_audioBookAuthor hash];
  NSUInteger v48 = [(NSString *)self->_audioBookName hash];
  NSUInteger v3 = [(NSString *)self->_audioBookNarrator hash];
  NSUInteger v4 = [(NSString *)self->_bookAuthor hash];
  NSUInteger v5 = [(NSString *)self->_bookName hash];
  NSUInteger v6 = [(NSString *)self->_creator hash];
  NSUInteger v7 = [(NSString *)self->_iTunesStoreFrontIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_iTunesStoreIdentifier hash];
  uint64_t v9 = [(NSArray *)self->_iconURLs hash];
  uint64_t v10 = [(NSArray *)self->_imageURLs hash];
  NSUInteger v11 = [(NSString *)self->_itemType hash];
  if ([(_INPBMessageLinkMetadata *)self hasLinkMediaType]) {
    uint64_t v12 = 2654435761 * self->_linkMediaType;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  unint64_t v14 = v11 ^ v12 ^ [(_INPBURLValue *)self->_linkURL hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_movieBundleGenre hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_movieBundleName hash];
  NSUInteger v17 = v13 ^ v16 ^ [(NSString *)self->_movieGenre hash];
  NSUInteger v18 = [(NSString *)self->_movieName hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_musicVideoArtist hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_musicVideoName hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_openGraphType hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_originalURL hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_playlistCurator hash];
  NSUInteger v24 = v17 ^ v23 ^ [(NSString *)self->_playlistName hash];
  NSUInteger v25 = [(NSString *)self->_podcastArtist hash];
  NSUInteger v26 = v25 ^ [(NSString *)self->_podcastEpisodeArtist hash];
  NSUInteger v27 = v26 ^ [(NSString *)self->_podcastEpisodeName hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_podcastEpisodePodcastName hash];
  unint64_t v29 = v28 ^ [(_INPBDateTime *)self->_podcastEpisodeReleaseDate hash];
  NSUInteger v30 = v29 ^ [(NSString *)self->_podcastName hash];
  NSUInteger v31 = v30 ^ [(NSString *)self->_radioCurator hash];
  NSUInteger v32 = v24 ^ v31 ^ [(NSString *)self->_radioName hash];
  NSUInteger v33 = [(NSString *)self->_siteName hash];
  NSUInteger v34 = v33 ^ [(NSString *)self->_softwareGenre hash];
  NSUInteger v35 = v34 ^ [(NSString *)self->_softwareName hash];
  NSUInteger v36 = v35 ^ [(NSString *)self->_softwarePlatform hash];
  NSUInteger v37 = v36 ^ [(NSString *)self->_songAlbum hash];
  NSUInteger v38 = v37 ^ [(NSString *)self->_songArtist hash];
  NSUInteger v39 = v38 ^ [(NSString *)self->_songTitle hash];
  NSUInteger v40 = v39 ^ [(NSString *)self->_summary hash];
  NSUInteger v41 = v32 ^ v40 ^ [(NSString *)self->_title hash];
  NSUInteger v42 = [(NSString *)self->_tvEpisodeEpisodeName hash];
  NSUInteger v43 = v42 ^ [(NSString *)self->_tvEpisodeGenre hash];
  NSUInteger v44 = v43 ^ [(NSString *)self->_tvEpisodeSeasonName hash];
  NSUInteger v45 = v44 ^ [(NSString *)self->_tvSeasonGenre hash];
  NSUInteger v46 = v45 ^ [(NSString *)self->_tvSeasonName hash];
  return v41 ^ v46 ^ [(NSString *)self->_tvShowName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_261;
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self albumArtist];
  NSUInteger v6 = [v4 albumArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v7 = [(_INPBMessageLinkMetadata *)self albumArtist];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_INPBMessageLinkMetadata *)self albumArtist];
    uint64_t v10 = [v4 albumArtist];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self albumName];
  NSUInteger v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v12 = [(_INPBMessageLinkMetadata *)self albumName];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(_INPBMessageLinkMetadata *)self albumName];
    NSUInteger v15 = [v4 albumName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self appleTvSubtitle];
  NSUInteger v6 = [v4 appleTvSubtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v17 = [(_INPBMessageLinkMetadata *)self appleTvSubtitle];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    NSUInteger v19 = [(_INPBMessageLinkMetadata *)self appleTvSubtitle];
    NSUInteger v20 = [v4 appleTvSubtitle];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self appleTvTitle];
  NSUInteger v6 = [v4 appleTvTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v22 = [(_INPBMessageLinkMetadata *)self appleTvTitle];
  if (v22)
  {
    NSUInteger v23 = (void *)v22;
    NSUInteger v24 = [(_INPBMessageLinkMetadata *)self appleTvTitle];
    NSUInteger v25 = [v4 appleTvTitle];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self artistGenre];
  NSUInteger v6 = [v4 artistGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v27 = [(_INPBMessageLinkMetadata *)self artistGenre];
  if (v27)
  {
    NSUInteger v28 = (void *)v27;
    unint64_t v29 = [(_INPBMessageLinkMetadata *)self artistGenre];
    NSUInteger v30 = [v4 artistGenre];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self artistName];
  NSUInteger v6 = [v4 artistName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v32 = [(_INPBMessageLinkMetadata *)self artistName];
  if (v32)
  {
    NSUInteger v33 = (void *)v32;
    NSUInteger v34 = [(_INPBMessageLinkMetadata *)self artistName];
    NSUInteger v35 = [v4 artistName];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self audioBookAuthor];
  NSUInteger v6 = [v4 audioBookAuthor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v37 = [(_INPBMessageLinkMetadata *)self audioBookAuthor];
  if (v37)
  {
    NSUInteger v38 = (void *)v37;
    NSUInteger v39 = [(_INPBMessageLinkMetadata *)self audioBookAuthor];
    NSUInteger v40 = [v4 audioBookAuthor];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self audioBookName];
  NSUInteger v6 = [v4 audioBookName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v42 = [(_INPBMessageLinkMetadata *)self audioBookName];
  if (v42)
  {
    NSUInteger v43 = (void *)v42;
    NSUInteger v44 = [(_INPBMessageLinkMetadata *)self audioBookName];
    NSUInteger v45 = [v4 audioBookName];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self audioBookNarrator];
  NSUInteger v6 = [v4 audioBookNarrator];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v47 = [(_INPBMessageLinkMetadata *)self audioBookNarrator];
  if (v47)
  {
    NSUInteger v48 = (void *)v47;
    NSUInteger v49 = [(_INPBMessageLinkMetadata *)self audioBookNarrator];
    NSUInteger v50 = [v4 audioBookNarrator];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self bookAuthor];
  NSUInteger v6 = [v4 bookAuthor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v52 = [(_INPBMessageLinkMetadata *)self bookAuthor];
  if (v52)
  {
    NSUInteger v53 = (void *)v52;
    NSUInteger v54 = [(_INPBMessageLinkMetadata *)self bookAuthor];
    NSUInteger v55 = [v4 bookAuthor];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self bookName];
  NSUInteger v6 = [v4 bookName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v57 = [(_INPBMessageLinkMetadata *)self bookName];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(_INPBMessageLinkMetadata *)self bookName];
    v60 = [v4 bookName];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self creator];
  NSUInteger v6 = [v4 creator];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v62 = [(_INPBMessageLinkMetadata *)self creator];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(_INPBMessageLinkMetadata *)self creator];
    v65 = [v4 creator];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self iTunesStoreFrontIdentifier];
  NSUInteger v6 = [v4 iTunesStoreFrontIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v67 = [(_INPBMessageLinkMetadata *)self iTunesStoreFrontIdentifier];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(_INPBMessageLinkMetadata *)self iTunesStoreFrontIdentifier];
    v70 = [v4 iTunesStoreFrontIdentifier];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self iTunesStoreIdentifier];
  NSUInteger v6 = [v4 iTunesStoreIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v72 = [(_INPBMessageLinkMetadata *)self iTunesStoreIdentifier];
  if (v72)
  {
    v73 = (void *)v72;
    v74 = [(_INPBMessageLinkMetadata *)self iTunesStoreIdentifier];
    v75 = [v4 iTunesStoreIdentifier];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self iconURLs];
  NSUInteger v6 = [v4 iconURLs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v77 = [(_INPBMessageLinkMetadata *)self iconURLs];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [(_INPBMessageLinkMetadata *)self iconURLs];
    v80 = [v4 iconURLs];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self imageURLs];
  NSUInteger v6 = [v4 imageURLs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v82 = [(_INPBMessageLinkMetadata *)self imageURLs];
  if (v82)
  {
    v83 = (void *)v82;
    v84 = [(_INPBMessageLinkMetadata *)self imageURLs];
    v85 = [v4 imageURLs];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self itemType];
  NSUInteger v6 = [v4 itemType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v87 = [(_INPBMessageLinkMetadata *)self itemType];
  if (v87)
  {
    v88 = (void *)v87;
    v89 = [(_INPBMessageLinkMetadata *)self itemType];
    v90 = [v4 itemType];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  int v92 = [(_INPBMessageLinkMetadata *)self hasLinkMediaType];
  if (v92 != [v4 hasLinkMediaType]) {
    goto LABEL_261;
  }
  if ([(_INPBMessageLinkMetadata *)self hasLinkMediaType])
  {
    if ([v4 hasLinkMediaType])
    {
      int linkMediaType = self->_linkMediaType;
      if (linkMediaType != [v4 linkMediaType]) {
        goto LABEL_261;
      }
    }
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self linkURL];
  NSUInteger v6 = [v4 linkURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v94 = [(_INPBMessageLinkMetadata *)self linkURL];
  if (v94)
  {
    v95 = (void *)v94;
    v96 = [(_INPBMessageLinkMetadata *)self linkURL];
    v97 = [v4 linkURL];
    int v98 = [v96 isEqual:v97];

    if (!v98) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self movieBundleGenre];
  NSUInteger v6 = [v4 movieBundleGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v99 = [(_INPBMessageLinkMetadata *)self movieBundleGenre];
  if (v99)
  {
    v100 = (void *)v99;
    v101 = [(_INPBMessageLinkMetadata *)self movieBundleGenre];
    v102 = [v4 movieBundleGenre];
    int v103 = [v101 isEqual:v102];

    if (!v103) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self movieBundleName];
  NSUInteger v6 = [v4 movieBundleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v104 = [(_INPBMessageLinkMetadata *)self movieBundleName];
  if (v104)
  {
    v105 = (void *)v104;
    v106 = [(_INPBMessageLinkMetadata *)self movieBundleName];
    v107 = [v4 movieBundleName];
    int v108 = [v106 isEqual:v107];

    if (!v108) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self movieGenre];
  NSUInteger v6 = [v4 movieGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v109 = [(_INPBMessageLinkMetadata *)self movieGenre];
  if (v109)
  {
    v110 = (void *)v109;
    v111 = [(_INPBMessageLinkMetadata *)self movieGenre];
    v112 = [v4 movieGenre];
    int v113 = [v111 isEqual:v112];

    if (!v113) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self movieName];
  NSUInteger v6 = [v4 movieName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v114 = [(_INPBMessageLinkMetadata *)self movieName];
  if (v114)
  {
    v115 = (void *)v114;
    v116 = [(_INPBMessageLinkMetadata *)self movieName];
    v117 = [v4 movieName];
    int v118 = [v116 isEqual:v117];

    if (!v118) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self musicVideoArtist];
  NSUInteger v6 = [v4 musicVideoArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v119 = [(_INPBMessageLinkMetadata *)self musicVideoArtist];
  if (v119)
  {
    v120 = (void *)v119;
    v121 = [(_INPBMessageLinkMetadata *)self musicVideoArtist];
    v122 = [v4 musicVideoArtist];
    int v123 = [v121 isEqual:v122];

    if (!v123) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self musicVideoName];
  NSUInteger v6 = [v4 musicVideoName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v124 = [(_INPBMessageLinkMetadata *)self musicVideoName];
  if (v124)
  {
    v125 = (void *)v124;
    v126 = [(_INPBMessageLinkMetadata *)self musicVideoName];
    v127 = [v4 musicVideoName];
    int v128 = [v126 isEqual:v127];

    if (!v128) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self openGraphType];
  NSUInteger v6 = [v4 openGraphType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v129 = [(_INPBMessageLinkMetadata *)self openGraphType];
  if (v129)
  {
    v130 = (void *)v129;
    v131 = [(_INPBMessageLinkMetadata *)self openGraphType];
    v132 = [v4 openGraphType];
    int v133 = [v131 isEqual:v132];

    if (!v133) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self originalURL];
  NSUInteger v6 = [v4 originalURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v134 = [(_INPBMessageLinkMetadata *)self originalURL];
  if (v134)
  {
    v135 = (void *)v134;
    v136 = [(_INPBMessageLinkMetadata *)self originalURL];
    v137 = [v4 originalURL];
    int v138 = [v136 isEqual:v137];

    if (!v138) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self playlistCurator];
  NSUInteger v6 = [v4 playlistCurator];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v139 = [(_INPBMessageLinkMetadata *)self playlistCurator];
  if (v139)
  {
    v140 = (void *)v139;
    v141 = [(_INPBMessageLinkMetadata *)self playlistCurator];
    v142 = [v4 playlistCurator];
    int v143 = [v141 isEqual:v142];

    if (!v143) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self playlistName];
  NSUInteger v6 = [v4 playlistName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v144 = [(_INPBMessageLinkMetadata *)self playlistName];
  if (v144)
  {
    v145 = (void *)v144;
    v146 = [(_INPBMessageLinkMetadata *)self playlistName];
    v147 = [v4 playlistName];
    int v148 = [v146 isEqual:v147];

    if (!v148) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastArtist];
  NSUInteger v6 = [v4 podcastArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v149 = [(_INPBMessageLinkMetadata *)self podcastArtist];
  if (v149)
  {
    v150 = (void *)v149;
    v151 = [(_INPBMessageLinkMetadata *)self podcastArtist];
    v152 = [v4 podcastArtist];
    int v153 = [v151 isEqual:v152];

    if (!v153) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastEpisodeArtist];
  NSUInteger v6 = [v4 podcastEpisodeArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v154 = [(_INPBMessageLinkMetadata *)self podcastEpisodeArtist];
  if (v154)
  {
    v155 = (void *)v154;
    v156 = [(_INPBMessageLinkMetadata *)self podcastEpisodeArtist];
    v157 = [v4 podcastEpisodeArtist];
    int v158 = [v156 isEqual:v157];

    if (!v158) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastEpisodeName];
  NSUInteger v6 = [v4 podcastEpisodeName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v159 = [(_INPBMessageLinkMetadata *)self podcastEpisodeName];
  if (v159)
  {
    v160 = (void *)v159;
    v161 = [(_INPBMessageLinkMetadata *)self podcastEpisodeName];
    v162 = [v4 podcastEpisodeName];
    int v163 = [v161 isEqual:v162];

    if (!v163) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastEpisodePodcastName];
  NSUInteger v6 = [v4 podcastEpisodePodcastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v164 = [(_INPBMessageLinkMetadata *)self podcastEpisodePodcastName];
  if (v164)
  {
    v165 = (void *)v164;
    v166 = [(_INPBMessageLinkMetadata *)self podcastEpisodePodcastName];
    v167 = [v4 podcastEpisodePodcastName];
    int v168 = [v166 isEqual:v167];

    if (!v168) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];
  NSUInteger v6 = [v4 podcastEpisodeReleaseDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v169 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];
  if (v169)
  {
    v170 = (void *)v169;
    v171 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];
    v172 = [v4 podcastEpisodeReleaseDate];
    int v173 = [v171 isEqual:v172];

    if (!v173) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self podcastName];
  NSUInteger v6 = [v4 podcastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v174 = [(_INPBMessageLinkMetadata *)self podcastName];
  if (v174)
  {
    v175 = (void *)v174;
    v176 = [(_INPBMessageLinkMetadata *)self podcastName];
    v177 = [v4 podcastName];
    int v178 = [v176 isEqual:v177];

    if (!v178) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self radioCurator];
  NSUInteger v6 = [v4 radioCurator];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v179 = [(_INPBMessageLinkMetadata *)self radioCurator];
  if (v179)
  {
    v180 = (void *)v179;
    v181 = [(_INPBMessageLinkMetadata *)self radioCurator];
    v182 = [v4 radioCurator];
    int v183 = [v181 isEqual:v182];

    if (!v183) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self radioName];
  NSUInteger v6 = [v4 radioName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v184 = [(_INPBMessageLinkMetadata *)self radioName];
  if (v184)
  {
    v185 = (void *)v184;
    v186 = [(_INPBMessageLinkMetadata *)self radioName];
    v187 = [v4 radioName];
    int v188 = [v186 isEqual:v187];

    if (!v188) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self siteName];
  NSUInteger v6 = [v4 siteName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v189 = [(_INPBMessageLinkMetadata *)self siteName];
  if (v189)
  {
    v190 = (void *)v189;
    v191 = [(_INPBMessageLinkMetadata *)self siteName];
    v192 = [v4 siteName];
    int v193 = [v191 isEqual:v192];

    if (!v193) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self softwareGenre];
  NSUInteger v6 = [v4 softwareGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v194 = [(_INPBMessageLinkMetadata *)self softwareGenre];
  if (v194)
  {
    v195 = (void *)v194;
    v196 = [(_INPBMessageLinkMetadata *)self softwareGenre];
    v197 = [v4 softwareGenre];
    int v198 = [v196 isEqual:v197];

    if (!v198) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self softwareName];
  NSUInteger v6 = [v4 softwareName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v199 = [(_INPBMessageLinkMetadata *)self softwareName];
  if (v199)
  {
    v200 = (void *)v199;
    v201 = [(_INPBMessageLinkMetadata *)self softwareName];
    v202 = [v4 softwareName];
    int v203 = [v201 isEqual:v202];

    if (!v203) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self softwarePlatform];
  NSUInteger v6 = [v4 softwarePlatform];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v204 = [(_INPBMessageLinkMetadata *)self softwarePlatform];
  if (v204)
  {
    v205 = (void *)v204;
    v206 = [(_INPBMessageLinkMetadata *)self softwarePlatform];
    v207 = [v4 softwarePlatform];
    int v208 = [v206 isEqual:v207];

    if (!v208) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self songAlbum];
  NSUInteger v6 = [v4 songAlbum];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v209 = [(_INPBMessageLinkMetadata *)self songAlbum];
  if (v209)
  {
    v210 = (void *)v209;
    v211 = [(_INPBMessageLinkMetadata *)self songAlbum];
    v212 = [v4 songAlbum];
    int v213 = [v211 isEqual:v212];

    if (!v213) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self songArtist];
  NSUInteger v6 = [v4 songArtist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v214 = [(_INPBMessageLinkMetadata *)self songArtist];
  if (v214)
  {
    v215 = (void *)v214;
    v216 = [(_INPBMessageLinkMetadata *)self songArtist];
    v217 = [v4 songArtist];
    int v218 = [v216 isEqual:v217];

    if (!v218) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self songTitle];
  NSUInteger v6 = [v4 songTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v219 = [(_INPBMessageLinkMetadata *)self songTitle];
  if (v219)
  {
    v220 = (void *)v219;
    v221 = [(_INPBMessageLinkMetadata *)self songTitle];
    v222 = [v4 songTitle];
    int v223 = [v221 isEqual:v222];

    if (!v223) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self summary];
  NSUInteger v6 = [v4 summary];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v224 = [(_INPBMessageLinkMetadata *)self summary];
  if (v224)
  {
    v225 = (void *)v224;
    v226 = [(_INPBMessageLinkMetadata *)self summary];
    v227 = [v4 summary];
    int v228 = [v226 isEqual:v227];

    if (!v228) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self title];
  NSUInteger v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v229 = [(_INPBMessageLinkMetadata *)self title];
  if (v229)
  {
    v230 = (void *)v229;
    v231 = [(_INPBMessageLinkMetadata *)self title];
    v232 = [v4 title];
    int v233 = [v231 isEqual:v232];

    if (!v233) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvEpisodeEpisodeName];
  NSUInteger v6 = [v4 tvEpisodeEpisodeName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v234 = [(_INPBMessageLinkMetadata *)self tvEpisodeEpisodeName];
  if (v234)
  {
    v235 = (void *)v234;
    v236 = [(_INPBMessageLinkMetadata *)self tvEpisodeEpisodeName];
    v237 = [v4 tvEpisodeEpisodeName];
    int v238 = [v236 isEqual:v237];

    if (!v238) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvEpisodeGenre];
  NSUInteger v6 = [v4 tvEpisodeGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v239 = [(_INPBMessageLinkMetadata *)self tvEpisodeGenre];
  if (v239)
  {
    v240 = (void *)v239;
    v241 = [(_INPBMessageLinkMetadata *)self tvEpisodeGenre];
    v242 = [v4 tvEpisodeGenre];
    int v243 = [v241 isEqual:v242];

    if (!v243) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvEpisodeSeasonName];
  NSUInteger v6 = [v4 tvEpisodeSeasonName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v244 = [(_INPBMessageLinkMetadata *)self tvEpisodeSeasonName];
  if (v244)
  {
    v245 = (void *)v244;
    v246 = [(_INPBMessageLinkMetadata *)self tvEpisodeSeasonName];
    v247 = [v4 tvEpisodeSeasonName];
    int v248 = [v246 isEqual:v247];

    if (!v248) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvSeasonGenre];
  NSUInteger v6 = [v4 tvSeasonGenre];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v249 = [(_INPBMessageLinkMetadata *)self tvSeasonGenre];
  if (v249)
  {
    v250 = (void *)v249;
    v251 = [(_INPBMessageLinkMetadata *)self tvSeasonGenre];
    v252 = [v4 tvSeasonGenre];
    int v253 = [v251 isEqual:v252];

    if (!v253) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvSeasonName];
  NSUInteger v6 = [v4 tvSeasonName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_260;
  }
  uint64_t v254 = [(_INPBMessageLinkMetadata *)self tvSeasonName];
  if (v254)
  {
    v255 = (void *)v254;
    v256 = [(_INPBMessageLinkMetadata *)self tvSeasonName];
    v257 = [v4 tvSeasonName];
    int v258 = [v256 isEqual:v257];

    if (!v258) {
      goto LABEL_261;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self tvShowName];
  NSUInteger v6 = [v4 tvShowName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v259 = [(_INPBMessageLinkMetadata *)self tvShowName];
    if (!v259)
    {

LABEL_264:
      BOOL v264 = 1;
      goto LABEL_262;
    }
    v260 = (void *)v259;
    v261 = [(_INPBMessageLinkMetadata *)self tvShowName];
    v262 = [v4 tvShowName];
    char v263 = [v261 isEqual:v262];

    if (v263) {
      goto LABEL_264;
    }
  }
  else
  {
LABEL_260:
  }
LABEL_261:
  BOOL v264 = 0;
LABEL_262:

  return v264;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBMessageLinkMetadata allocWithZone:](_INPBMessageLinkMetadata, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_albumArtist copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAlbumArtist:v6];

  uint64_t v7 = (void *)[(NSString *)self->_albumName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAlbumName:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_appleTvSubtitle copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAppleTvSubtitle:v8];

  uint64_t v9 = (void *)[(NSString *)self->_appleTvTitle copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAppleTvTitle:v9];

  uint64_t v10 = (void *)[(NSString *)self->_artistGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setArtistGenre:v10];

  int v11 = (void *)[(NSString *)self->_artistName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setArtistName:v11];

  uint64_t v12 = (void *)[(NSString *)self->_audioBookAuthor copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAudioBookAuthor:v12];

  NSUInteger v13 = (void *)[(NSString *)self->_audioBookName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAudioBookName:v13];

  unint64_t v14 = (void *)[(NSString *)self->_audioBookNarrator copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setAudioBookNarrator:v14];

  NSUInteger v15 = (void *)[(NSString *)self->_bookAuthor copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setBookAuthor:v15];

  int v16 = (void *)[(NSString *)self->_bookName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setBookName:v16];

  uint64_t v17 = (void *)[(NSString *)self->_creator copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setCreator:v17];

  NSUInteger v18 = (void *)[(NSString *)self->_iTunesStoreFrontIdentifier copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setITunesStoreFrontIdentifier:v18];

  NSUInteger v19 = (void *)[(NSString *)self->_iTunesStoreIdentifier copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setITunesStoreIdentifier:v19];

  NSUInteger v20 = (void *)[(NSArray *)self->_iconURLs copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setIconURLs:v20];

  int v21 = (void *)[(NSArray *)self->_imageURLs copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setImageURLs:v21];

  uint64_t v22 = (void *)[(NSString *)self->_itemType copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setItemType:v22];

  if ([(_INPBMessageLinkMetadata *)self hasLinkMediaType]) {
    [(_INPBMessageLinkMetadata *)v5 setLinkMediaType:[(_INPBMessageLinkMetadata *)self linkMediaType]];
  }
  id v23 = [(_INPBURLValue *)self->_linkURL copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setLinkURL:v23];

  NSUInteger v24 = (void *)[(NSString *)self->_movieBundleGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMovieBundleGenre:v24];

  NSUInteger v25 = (void *)[(NSString *)self->_movieBundleName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMovieBundleName:v25];

  int v26 = (void *)[(NSString *)self->_movieGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMovieGenre:v26];

  uint64_t v27 = (void *)[(NSString *)self->_movieName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMovieName:v27];

  NSUInteger v28 = (void *)[(NSString *)self->_musicVideoArtist copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMusicVideoArtist:v28];

  unint64_t v29 = (void *)[(NSString *)self->_musicVideoName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setMusicVideoName:v29];

  NSUInteger v30 = (void *)[(NSString *)self->_openGraphType copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setOpenGraphType:v30];

  int v31 = (void *)[(NSString *)self->_originalURL copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setOriginalURL:v31];

  uint64_t v32 = (void *)[(NSString *)self->_playlistCurator copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPlaylistCurator:v32];

  NSUInteger v33 = (void *)[(NSString *)self->_playlistName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPlaylistName:v33];

  NSUInteger v34 = (void *)[(NSString *)self->_podcastArtist copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastArtist:v34];

  NSUInteger v35 = (void *)[(NSString *)self->_podcastEpisodeArtist copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastEpisodeArtist:v35];

  int v36 = (void *)[(NSString *)self->_podcastEpisodeName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastEpisodeName:v36];

  uint64_t v37 = (void *)[(NSString *)self->_podcastEpisodePodcastName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastEpisodePodcastName:v37];

  id v38 = [(_INPBDateTime *)self->_podcastEpisodeReleaseDate copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastEpisodeReleaseDate:v38];

  NSUInteger v39 = (void *)[(NSString *)self->_podcastName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setPodcastName:v39];

  NSUInteger v40 = (void *)[(NSString *)self->_radioCurator copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setRadioCurator:v40];

  int v41 = (void *)[(NSString *)self->_radioName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setRadioName:v41];

  uint64_t v42 = (void *)[(NSString *)self->_siteName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSiteName:v42];

  NSUInteger v43 = (void *)[(NSString *)self->_softwareGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSoftwareGenre:v43];

  NSUInteger v44 = (void *)[(NSString *)self->_softwareName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSoftwareName:v44];

  NSUInteger v45 = (void *)[(NSString *)self->_softwarePlatform copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSoftwarePlatform:v45];

  int v46 = (void *)[(NSString *)self->_songAlbum copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSongAlbum:v46];

  uint64_t v47 = (void *)[(NSString *)self->_songArtist copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSongArtist:v47];

  NSUInteger v48 = (void *)[(NSString *)self->_songTitle copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSongTitle:v48];

  NSUInteger v49 = (void *)[(NSString *)self->_summary copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setSummary:v49];

  NSUInteger v50 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTitle:v50];

  int v51 = (void *)[(NSString *)self->_tvEpisodeEpisodeName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvEpisodeEpisodeName:v51];

  uint64_t v52 = (void *)[(NSString *)self->_tvEpisodeGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvEpisodeGenre:v52];

  NSUInteger v53 = (void *)[(NSString *)self->_tvEpisodeSeasonName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvEpisodeSeasonName:v53];

  NSUInteger v54 = (void *)[(NSString *)self->_tvSeasonGenre copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvSeasonGenre:v54];

  NSUInteger v55 = (void *)[(NSString *)self->_tvSeasonName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvSeasonName:v55];

  int v56 = (void *)[(NSString *)self->_tvShowName copyWithZone:a3];
  [(_INPBMessageLinkMetadata *)v5 setTvShowName:v56];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMessageLinkMetadata *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMessageLinkMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMessageLinkMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMessageLinkMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMessageLinkMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBMessageLinkMetadata *)self albumArtist];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBMessageLinkMetadata *)self albumName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBMessageLinkMetadata *)self appleTvSubtitle];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(_INPBMessageLinkMetadata *)self appleTvTitle];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(_INPBMessageLinkMetadata *)self artistGenre];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  uint64_t v10 = [(_INPBMessageLinkMetadata *)self artistName];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBMessageLinkMetadata *)self audioBookAuthor];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(_INPBMessageLinkMetadata *)self audioBookName];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v13 = [(_INPBMessageLinkMetadata *)self audioBookNarrator];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  unint64_t v14 = [(_INPBMessageLinkMetadata *)self bookAuthor];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v15 = [(_INPBMessageLinkMetadata *)self bookName];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(_INPBMessageLinkMetadata *)self creator];

  if (v16) {
    PBDataWriterWriteStringField();
  }
  uint64_t v17 = [(_INPBMessageLinkMetadata *)self iTunesStoreFrontIdentifier];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v18 = [(_INPBMessageLinkMetadata *)self iTunesStoreIdentifier];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  NSUInteger v19 = self->_iconURLs;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v71;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v71 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v21);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  NSUInteger v24 = self->_imageURLs;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v67;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v67 != v27) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteStringField();
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v26);
  }

  unint64_t v29 = [(_INPBMessageLinkMetadata *)self itemType];

  if (v29) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBMessageLinkMetadata *)self hasLinkMediaType]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v30 = [(_INPBMessageLinkMetadata *)self linkURL];

  if (v30)
  {
    int v31 = [(_INPBMessageLinkMetadata *)self linkURL];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v32 = [(_INPBMessageLinkMetadata *)self movieBundleGenre];

  if (v32) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v33 = [(_INPBMessageLinkMetadata *)self movieBundleName];

  if (v33) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v34 = [(_INPBMessageLinkMetadata *)self movieGenre];

  if (v34) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v35 = [(_INPBMessageLinkMetadata *)self movieName];

  if (v35) {
    PBDataWriterWriteStringField();
  }
  int v36 = [(_INPBMessageLinkMetadata *)self musicVideoArtist];

  if (v36) {
    PBDataWriterWriteStringField();
  }
  uint64_t v37 = [(_INPBMessageLinkMetadata *)self musicVideoName];

  if (v37) {
    PBDataWriterWriteStringField();
  }
  id v38 = [(_INPBMessageLinkMetadata *)self openGraphType];

  if (v38) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v39 = [(_INPBMessageLinkMetadata *)self originalURL];

  if (v39) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v40 = [(_INPBMessageLinkMetadata *)self playlistCurator];

  if (v40) {
    PBDataWriterWriteStringField();
  }
  int v41 = [(_INPBMessageLinkMetadata *)self playlistName];

  if (v41) {
    PBDataWriterWriteStringField();
  }
  uint64_t v42 = [(_INPBMessageLinkMetadata *)self podcastArtist];

  if (v42) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v43 = [(_INPBMessageLinkMetadata *)self podcastEpisodeArtist];

  if (v43) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v44 = [(_INPBMessageLinkMetadata *)self podcastEpisodeName];

  if (v44) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v45 = [(_INPBMessageLinkMetadata *)self podcastEpisodePodcastName];

  if (v45) {
    PBDataWriterWriteStringField();
  }
  int v46 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];

  if (v46)
  {
    uint64_t v47 = [(_INPBMessageLinkMetadata *)self podcastEpisodeReleaseDate];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v48 = [(_INPBMessageLinkMetadata *)self podcastName];

  if (v48) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v49 = [(_INPBMessageLinkMetadata *)self radioCurator];

  if (v49) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v50 = [(_INPBMessageLinkMetadata *)self radioName];

  if (v50) {
    PBDataWriterWriteStringField();
  }
  int v51 = [(_INPBMessageLinkMetadata *)self siteName];

  if (v51) {
    PBDataWriterWriteStringField();
  }
  uint64_t v52 = [(_INPBMessageLinkMetadata *)self softwareGenre];

  if (v52) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v53 = [(_INPBMessageLinkMetadata *)self softwareName];

  if (v53) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v54 = [(_INPBMessageLinkMetadata *)self softwarePlatform];

  if (v54) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v55 = [(_INPBMessageLinkMetadata *)self songAlbum];

  if (v55) {
    PBDataWriterWriteStringField();
  }
  int v56 = [(_INPBMessageLinkMetadata *)self songArtist];

  if (v56) {
    PBDataWriterWriteStringField();
  }
  uint64_t v57 = [(_INPBMessageLinkMetadata *)self songTitle];

  if (v57) {
    PBDataWriterWriteStringField();
  }
  v58 = [(_INPBMessageLinkMetadata *)self summary];

  if (v58) {
    PBDataWriterWriteStringField();
  }
  v59 = [(_INPBMessageLinkMetadata *)self title];

  if (v59) {
    PBDataWriterWriteStringField();
  }
  v60 = [(_INPBMessageLinkMetadata *)self tvEpisodeEpisodeName];

  if (v60) {
    PBDataWriterWriteStringField();
  }
  int v61 = [(_INPBMessageLinkMetadata *)self tvEpisodeGenre];

  if (v61) {
    PBDataWriterWriteStringField();
  }
  uint64_t v62 = [(_INPBMessageLinkMetadata *)self tvEpisodeSeasonName];

  if (v62) {
    PBDataWriterWriteStringField();
  }
  v63 = [(_INPBMessageLinkMetadata *)self tvSeasonGenre];

  if (v63) {
    PBDataWriterWriteStringField();
  }
  v64 = [(_INPBMessageLinkMetadata *)self tvSeasonName];

  if (v64) {
    PBDataWriterWriteStringField();
  }
  v65 = [(_INPBMessageLinkMetadata *)self tvShowName];

  if (v65) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMessageLinkMetadataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTvShowName
{
  return self->_tvShowName != 0;
}

- (void)setTvShowName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvShowName = self->_tvShowName;
  self->_tvShowName = v4;

  MEMORY[0x1F41817F8](v4, tvShowName);
}

- (BOOL)hasTvSeasonName
{
  return self->_tvSeasonName != 0;
}

- (void)setTvSeasonName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvSeasonName = self->_tvSeasonName;
  self->_tvSeasonName = v4;

  MEMORY[0x1F41817F8](v4, tvSeasonName);
}

- (BOOL)hasTvSeasonGenre
{
  return self->_tvSeasonGenre != 0;
}

- (void)setTvSeasonGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvSeasonGenre = self->_tvSeasonGenre;
  self->_tvSeasonGenre = v4;

  MEMORY[0x1F41817F8](v4, tvSeasonGenre);
}

- (BOOL)hasTvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName != 0;
}

- (void)setTvEpisodeSeasonName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvEpisodeSeasonName = self->_tvEpisodeSeasonName;
  self->_tvEpisodeSeasonName = v4;

  MEMORY[0x1F41817F8](v4, tvEpisodeSeasonName);
}

- (BOOL)hasTvEpisodeGenre
{
  return self->_tvEpisodeGenre != 0;
}

- (void)setTvEpisodeGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvEpisodeGenre = self->_tvEpisodeGenre;
  self->_tvEpisodeGenre = v4;

  MEMORY[0x1F41817F8](v4, tvEpisodeGenre);
}

- (BOOL)hasTvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName != 0;
}

- (void)setTvEpisodeEpisodeName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tvEpisodeEpisodeName = self->_tvEpisodeEpisodeName;
  self->_tvEpisodeEpisodeName = v4;

  MEMORY[0x1F41817F8](v4, tvEpisodeEpisodeName);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  MEMORY[0x1F41817F8](v4, title);
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (void)setSummary:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  summary = self->_summary;
  self->_summary = v4;

  MEMORY[0x1F41817F8](v4, summary);
}

- (BOOL)hasSongTitle
{
  return self->_songTitle != 0;
}

- (void)setSongTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  songTitle = self->_songTitle;
  self->_songTitle = v4;

  MEMORY[0x1F41817F8](v4, songTitle);
}

- (BOOL)hasSongArtist
{
  return self->_songArtist != 0;
}

- (void)setSongArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  songArtist = self->_songArtist;
  self->_songArtist = v4;

  MEMORY[0x1F41817F8](v4, songArtist);
}

- (BOOL)hasSongAlbum
{
  return self->_songAlbum != 0;
}

- (void)setSongAlbum:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  songAlbum = self->_songAlbum;
  self->_songAlbum = v4;

  MEMORY[0x1F41817F8](v4, songAlbum);
}

- (BOOL)hasSoftwarePlatform
{
  return self->_softwarePlatform != 0;
}

- (void)setSoftwarePlatform:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  softwarePlatform = self->_softwarePlatform;
  self->_softwarePlatform = v4;

  MEMORY[0x1F41817F8](v4, softwarePlatform);
}

- (BOOL)hasSoftwareName
{
  return self->_softwareName != 0;
}

- (void)setSoftwareName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  softwareName = self->_softwareName;
  self->_softwareName = v4;

  MEMORY[0x1F41817F8](v4, softwareName);
}

- (BOOL)hasSoftwareGenre
{
  return self->_softwareGenre != 0;
}

- (void)setSoftwareGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  softwareGenre = self->_softwareGenre;
  self->_softwareGenre = v4;

  MEMORY[0x1F41817F8](v4, softwareGenre);
}

- (BOOL)hasSiteName
{
  return self->_siteName != 0;
}

- (void)setSiteName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  siteName = self->_siteName;
  self->_siteName = v4;

  MEMORY[0x1F41817F8](v4, siteName);
}

- (BOOL)hasRadioName
{
  return self->_radioName != 0;
}

- (void)setRadioName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  radioName = self->_radioName;
  self->_radioName = v4;

  MEMORY[0x1F41817F8](v4, radioName);
}

- (BOOL)hasRadioCurator
{
  return self->_radioCurator != 0;
}

- (void)setRadioCurator:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  radioCurator = self->_radioCurator;
  self->_radioCurator = v4;

  MEMORY[0x1F41817F8](v4, radioCurator);
}

- (BOOL)hasPodcastName
{
  return self->_podcastName != 0;
}

- (void)setPodcastName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  podcastName = self->_podcastName;
  self->_podcastName = v4;

  MEMORY[0x1F41817F8](v4, podcastName);
}

- (BOOL)hasPodcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate != 0;
}

- (void)setPodcastEpisodeReleaseDate:(id)a3
{
}

- (BOOL)hasPodcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName != 0;
}

- (void)setPodcastEpisodePodcastName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  podcastEpisodePodcastName = self->_podcastEpisodePodcastName;
  self->_podcastEpisodePodcastName = v4;

  MEMORY[0x1F41817F8](v4, podcastEpisodePodcastName);
}

- (BOOL)hasPodcastEpisodeName
{
  return self->_podcastEpisodeName != 0;
}

- (void)setPodcastEpisodeName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  podcastEpisodeName = self->_podcastEpisodeName;
  self->_podcastEpisodeName = v4;

  MEMORY[0x1F41817F8](v4, podcastEpisodeName);
}

- (BOOL)hasPodcastEpisodeArtist
{
  return self->_podcastEpisodeArtist != 0;
}

- (void)setPodcastEpisodeArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  podcastEpisodeArtist = self->_podcastEpisodeArtist;
  self->_podcastEpisodeArtist = v4;

  MEMORY[0x1F41817F8](v4, podcastEpisodeArtist);
}

- (BOOL)hasPodcastArtist
{
  return self->_podcastArtist != 0;
}

- (void)setPodcastArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  podcastArtist = self->_podcastArtist;
  self->_podcastArtist = v4;

  MEMORY[0x1F41817F8](v4, podcastArtist);
}

- (BOOL)hasPlaylistName
{
  return self->_playlistName != 0;
}

- (void)setPlaylistName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  playlistName = self->_playlistName;
  self->_playlistName = v4;

  MEMORY[0x1F41817F8](v4, playlistName);
}

- (BOOL)hasPlaylistCurator
{
  return self->_playlistCurator != 0;
}

- (void)setPlaylistCurator:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  playlistCurator = self->_playlistCurator;
  self->_playlistCurator = v4;

  MEMORY[0x1F41817F8](v4, playlistCurator);
}

- (BOOL)hasOriginalURL
{
  return self->_originalURL != 0;
}

- (void)setOriginalURL:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  originalURL = self->_originalURL;
  self->_originalURL = v4;

  MEMORY[0x1F41817F8](v4, originalURL);
}

- (BOOL)hasOpenGraphType
{
  return self->_openGraphType != 0;
}

- (void)setOpenGraphType:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  openGraphType = self->_openGraphType;
  self->_openGraphType = v4;

  MEMORY[0x1F41817F8](v4, openGraphType);
}

- (BOOL)hasMusicVideoName
{
  return self->_musicVideoName != 0;
}

- (void)setMusicVideoName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  musicVideoName = self->_musicVideoName;
  self->_musicVideoName = v4;

  MEMORY[0x1F41817F8](v4, musicVideoName);
}

- (BOOL)hasMusicVideoArtist
{
  return self->_musicVideoArtist != 0;
}

- (void)setMusicVideoArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  musicVideoArtist = self->_musicVideoArtist;
  self->_musicVideoArtist = v4;

  MEMORY[0x1F41817F8](v4, musicVideoArtist);
}

- (BOOL)hasMovieName
{
  return self->_movieName != 0;
}

- (void)setMovieName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  movieName = self->_movieName;
  self->_movieName = v4;

  MEMORY[0x1F41817F8](v4, movieName);
}

- (BOOL)hasMovieGenre
{
  return self->_movieGenre != 0;
}

- (void)setMovieGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  movieGenre = self->_movieGenre;
  self->_movieGenre = v4;

  MEMORY[0x1F41817F8](v4, movieGenre);
}

- (BOOL)hasMovieBundleName
{
  return self->_movieBundleName != 0;
}

- (void)setMovieBundleName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  movieBundleName = self->_movieBundleName;
  self->_movieBundleName = v4;

  MEMORY[0x1F41817F8](v4, movieBundleName);
}

- (BOOL)hasMovieBundleGenre
{
  return self->_movieBundleGenre != 0;
}

- (void)setMovieBundleGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  movieBundleGenre = self->_movieBundleGenre;
  self->_movieBundleGenre = v4;

  MEMORY[0x1F41817F8](v4, movieBundleGenre);
}

- (BOOL)hasLinkURL
{
  return self->_linkURL != 0;
}

- (void)setLinkURL:(id)a3
{
}

- (int)StringAsLinkMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LINK_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SONG"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ALBUM"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MUSIC_VIDEO"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"ARTIST"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"PLAYLIST"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"RADIO"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"SOFTWARE"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"BOOK"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"AUDIO_BOOK"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"PODCAST"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"PODCAST_EPISODE"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"TV_EPISODE"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"TV_SEASON"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"TV_SHOW"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"MOVIE_BUNDLE"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 180;
  }
  else
  {
    int v4 = 10;
  }

  return v4;
}

- (void)setHasLinkMediaType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkMediaType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLinkMediaType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int linkMediaType = a3;
  }
}

- (BOOL)hasItemType
{
  return self->_itemType != 0;
}

- (void)setItemType:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  itemType = self->_itemType;
  self->_itemType = v4;

  MEMORY[0x1F41817F8](v4, itemType);
}

- (id)imageURLAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_imageURLs objectAtIndexedSubscript:a3];
}

- (unint64_t)imageURLsCount
{
  return [(NSArray *)self->_imageURLs count];
}

- (void)addImageURL:(id)a3
{
  id v4 = a3;
  imageURLs = self->_imageURLs;
  id v8 = v4;
  if (!imageURLs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_imageURLs;
    self->_imageURLs = v6;

    id v4 = v8;
    imageURLs = self->_imageURLs;
  }
  [(NSArray *)imageURLs addObject:v4];
}

- (void)clearImageURLs
{
}

- (void)setImageURLs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  imageURLs = self->_imageURLs;
  self->_imageURLs = v4;

  MEMORY[0x1F41817F8](v4, imageURLs);
}

- (id)iconURLAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_iconURLs objectAtIndexedSubscript:a3];
}

- (unint64_t)iconURLsCount
{
  return [(NSArray *)self->_iconURLs count];
}

- (void)addIconURL:(id)a3
{
  id v4 = a3;
  iconURLs = self->_iconURLs;
  id v8 = v4;
  if (!iconURLs)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_iconURLs;
    self->_iconURLs = v6;

    id v4 = v8;
    iconURLs = self->_iconURLs;
  }
  [(NSArray *)iconURLs addObject:v4];
}

- (void)clearIconURLs
{
}

- (void)setIconURLs:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  iconURLs = self->_iconURLs;
  self->_iconURLs = v4;

  MEMORY[0x1F41817F8](v4, iconURLs);
}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier != 0;
}

- (void)setITunesStoreIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  self->_iTunesStoreIdentifier = v4;

  MEMORY[0x1F41817F8](v4, iTunesStoreIdentifier);
}

- (BOOL)hasITunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier != 0;
}

- (void)setITunesStoreFrontIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  iTunesStoreFrontIdentifier = self->_iTunesStoreFrontIdentifier;
  self->_iTunesStoreFrontIdentifier = v4;

  MEMORY[0x1F41817F8](v4, iTunesStoreFrontIdentifier);
}

- (BOOL)hasCreator
{
  return self->_creator != 0;
}

- (void)setCreator:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  creator = self->_creator;
  self->_creator = v4;

  MEMORY[0x1F41817F8](v4, creator);
}

- (BOOL)hasBookName
{
  return self->_bookName != 0;
}

- (void)setBookName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bookName = self->_bookName;
  self->_bookName = v4;

  MEMORY[0x1F41817F8](v4, bookName);
}

- (BOOL)hasBookAuthor
{
  return self->_bookAuthor != 0;
}

- (void)setBookAuthor:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bookAuthor = self->_bookAuthor;
  self->_bookAuthor = v4;

  MEMORY[0x1F41817F8](v4, bookAuthor);
}

- (BOOL)hasAudioBookNarrator
{
  return self->_audioBookNarrator != 0;
}

- (void)setAudioBookNarrator:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  audioBookNarrator = self->_audioBookNarrator;
  self->_audioBookNarrator = v4;

  MEMORY[0x1F41817F8](v4, audioBookNarrator);
}

- (BOOL)hasAudioBookName
{
  return self->_audioBookName != 0;
}

- (void)setAudioBookName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  audioBookName = self->_audioBookName;
  self->_audioBookName = v4;

  MEMORY[0x1F41817F8](v4, audioBookName);
}

- (BOOL)hasAudioBookAuthor
{
  return self->_audioBookAuthor != 0;
}

- (void)setAudioBookAuthor:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  audioBookAuthor = self->_audioBookAuthor;
  self->_audioBookAuthor = v4;

  MEMORY[0x1F41817F8](v4, audioBookAuthor);
}

- (BOOL)hasArtistName
{
  return self->_artistName != 0;
}

- (void)setArtistName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  artistName = self->_artistName;
  self->_artistName = v4;

  MEMORY[0x1F41817F8](v4, artistName);
}

- (BOOL)hasArtistGenre
{
  return self->_artistGenre != 0;
}

- (void)setArtistGenre:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  artistGenre = self->_artistGenre;
  self->_artistGenre = v4;

  MEMORY[0x1F41817F8](v4, artistGenre);
}

- (BOOL)hasAppleTvTitle
{
  return self->_appleTvTitle != 0;
}

- (void)setAppleTvTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  appleTvTitle = self->_appleTvTitle;
  self->_appleTvTitle = v4;

  MEMORY[0x1F41817F8](v4, appleTvTitle);
}

- (BOOL)hasAppleTvSubtitle
{
  return self->_appleTvSubtitle != 0;
}

- (void)setAppleTvSubtitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  appleTvSubtitle = self->_appleTvSubtitle;
  self->_appleTvSubtitle = v4;

  MEMORY[0x1F41817F8](v4, appleTvSubtitle);
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setAlbumName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  albumName = self->_albumName;
  self->_albumName = v4;

  MEMORY[0x1F41817F8](v4, albumName);
}

- (BOOL)hasAlbumArtist
{
  return self->_albumArtist != 0;
}

- (void)setAlbumArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  albumArtist = self->_albumArtist;
  self->_albumArtist = v4;

  MEMORY[0x1F41817F8](v4, albumArtist);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end