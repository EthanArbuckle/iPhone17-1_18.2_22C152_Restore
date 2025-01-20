@interface _BlastDoorLPiTunesMediaSongMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSArray)offers;
- (NSString)album;
- (NSString)artist;
- (NSString)lyrics;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSURL)previewURL;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPLyricExcerptMetadata)lyricExcerpt;
- (_BlastDoorLPiTunesMediaSongMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setLyricExcerpt:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaSongMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaSongMetadata)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_BlastDoorLPiTunesMediaSongMetadata;
  v5 = [(_BlastDoorLPiTunesMediaSongMetadata *)&v30 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"artist");
    artist = v5->_artist;
    v5->_artist = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"album");
    album = v5->_album;
    v5->_album = (NSString *)v14;

    uint64_t v16 = decodeStringForKey(v4, @"lyrics");
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v18;

    uint64_t v20 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v20;

    uint64_t v22 = decodeURLForKey(v4, @"previewURL");
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v22;

    uint64_t v24 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v24;

    uint64_t v26 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"lyricExcerpt");
    lyricExcerpt = v5->_lyricExcerpt;
    v5->_lyricExcerpt = (_BlastDoorLPLyricExcerptMetadata *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  storeFrontIdentifier = self->_storeFrontIdentifier;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_album, @"album");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_lyrics, @"lyrics");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, @"previewURL");
  objc_msgSend(v5, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_lyricExcerpt, @"lyricExcerpt");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiTunesMediaSongMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaSongMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaSongMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaSongMetadata *)self name];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaSongMetadata *)self artist];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setArtist:v8];

    v9 = [(_BlastDoorLPiTunesMediaSongMetadata *)self album];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setAlbum:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaSongMetadata *)self lyrics];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setLyrics:v10];

    v11 = [(_BlastDoorLPiTunesMediaSongMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(_BlastDoorLPiTunesMediaSongMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setArtworkMetadata:v12];

    v13 = [(_BlastDoorLPiTunesMediaSongMetadata *)self previewURL];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setPreviewURL:v13];

    uint64_t v14 = [(_BlastDoorLPiTunesMediaSongMetadata *)self offers];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setOffers:v14];

    v15 = [(_BlastDoorLPiTunesMediaSongMetadata *)self lyricExcerpt];
    [(_BlastDoorLPiTunesMediaSongMetadata *)v4 setLyricExcerpt:v15];

    uint64_t v16 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BlastDoorLPiTunesMediaSongMetadata;
  if ([(_BlastDoorLPiTunesMediaSongMetadata *)&v19 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:")) {
        goto LABEL_27;
      }
      unint64_t v8 = v6[3];
      if (v8 | (unint64_t)self->_storeIdentifier)
      {
        if (!objc_msgSend((id)v8, "isEqual:")) {
          goto LABEL_27;
        }
      }
      unint64_t v9 = v6[4];
      if (v9 | (unint64_t)self->_name)
      {
        if (!objc_msgSend((id)v9, "isEqual:")) {
          goto LABEL_27;
        }
      }
      if ((unint64_t v10 = v6[5], v10 | (unint64_t)self->_artist) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_album) && !objc_msgSend((id)v11, "isEqual:")
        || (unint64_t v12 = v6[7], v12 | (unint64_t)self->_lyrics) && !objc_msgSend((id)v12, "isEqual:")
        || (unint64_t v13 = v6[8], v13 | (unint64_t)self->_artwork) && !objc_msgSend((id)v13, "isEqual:")
        || (unint64_t v14 = v6[9], v14 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v14, "isEqual:")
        || (unint64_t v15 = v6[10], v15 | (unint64_t)self->_previewURL) && !objc_msgSend((id)v15, "isEqual:")
        || (unint64_t v16 = v6[11], v16 | (unint64_t)self->_offers) && !objc_msgSend((id)v16, "isEqual:"))
      {
LABEL_27:
        char v5 = 0;
      }
      else
      {
        unint64_t v17 = v6[12];
        if (v17 | (unint64_t)self->_lyricExcerpt) {
          char v5 = objc_msgSend((id)v17, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"artist", @"album", @"lyrics", @"artwork", @"artworkMetadata", @"previewURL", @"offers", @"lyricExcerpt", 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
}

- (_BlastDoorLPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (_BlastDoorLPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (void)setLyricExcerpt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end