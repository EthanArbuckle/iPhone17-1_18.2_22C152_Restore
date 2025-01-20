@interface _BlastDoorLPiTunesMediaAudioBookMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)author;
- (NSString)name;
- (NSString)narrator;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSURL)previewURL;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPiTunesMediaAudioBookMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setName:(id)a3;
- (void)setNarrator:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaAudioBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaAudioBookMetadata)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_BlastDoorLPiTunesMediaAudioBookMetadata;
  v5 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)&v24 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"author");
    author = v5->_author;
    v5->_author = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"narrator");
    narrator = v5->_narrator;
    v5->_narrator = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v16;

    uint64_t v18 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v18;

    uint64_t v20 = decodeURLForKey(v4, @"previewURL");
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v20;

    v22 = v5;
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
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_author, @"author");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_narrator, @"narrator");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, @"previewURL");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiTunesMediaAudioBookMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self name];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self author];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setAuthor:v8];

    v9 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self narrator];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setNarrator:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self previewURL];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setPreviewURL:v10];

    v11 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(_BlastDoorLPiTunesMediaAudioBookMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaAudioBookMetadata *)v4 setArtworkMetadata:v12];

    v13 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPiTunesMediaAudioBookMetadata;
  if ([(_BlastDoorLPiTunesMediaAudioBookMetadata *)&v16 isEqual:v4])
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
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[3], v8 | (unint64_t)self->_storeIdentifier)
        && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_name) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_author) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_narrator) && !objc_msgSend((id)v11, "isEqual:")
        || (unint64_t v12 = v6[7], v12 | (unint64_t)self->_artwork) && !objc_msgSend((id)v12, "isEqual:")
        || (unint64_t v13 = v6[8], v13 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v13, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v14 = v6[9];
        if (v14 | (unint64_t)self->_previewURL) {
          char v5 = objc_msgSend((id)v14, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"author", @"narrator", @"artwork", @"artworkMetadata", @"previewURL", 0);
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

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)narrator
{
  return self->_narrator;
}

- (void)setNarrator:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_narrator, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end