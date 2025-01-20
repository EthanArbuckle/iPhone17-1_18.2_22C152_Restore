@interface _BlastDoorLPiTunesMediaBookMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)hasSpineOnRight;
- (BOOL)isEqual:(id)a3;
- (NSString)author;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPiTunesMediaBookMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setHasSpineOnRight:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaBookMetadata)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPiTunesMediaBookMetadata;
  v5 = [(_BlastDoorLPiTunesMediaBookMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    v7 = *(void **)&v5->_hasSpineOnRight;
    *(void *)&v5->_hasSpineOnRight = v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"author");
    name = v5->_name;
    v5->_name = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    author = v5->_author;
    v5->_author = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v16;

    *(&v5->super.__dummyPropertyForObservation + 1) = [v4 decodeBoolForKey:@"hasSpineOnRight"];
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_hasSpineOnRight;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"storeFrontIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, @"name");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"author");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_author, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artworkMetadata");
  [v5 encodeBool:*((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1) forKey:@"hasSpineOnRight"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPiTunesMediaBookMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaBookMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaBookMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaBookMetadata *)self name];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaBookMetadata *)self author];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setAuthor:v8];

    v9 = [(_BlastDoorLPiTunesMediaBookMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaBookMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setArtworkMetadata:v10];

    [(_BlastDoorLPiTunesMediaBookMetadata *)v4 setHasSpineOnRight:[(_BlastDoorLPiTunesMediaBookMetadata *)self hasSpineOnRight]];
    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiTunesMediaBookMetadata;
  if ([(_BlastDoorLPiTunesMediaBookMetadata *)&v14 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      BOOL v5 = (!(v7 | *(void *)&self->_hasSpineOnRight) || objc_msgSend((id)v7, "isEqual:"))
        && ((unint64_t v8 = v6[3], !(v8 | (unint64_t)self->_storeFrontIdentifier))
         || objc_msgSend((id)v8, "isEqual:"))
        && ((unint64_t v9 = v6[4], !(v9 | (unint64_t)self->_storeIdentifier))
         || objc_msgSend((id)v9, "isEqual:"))
        && ((unint64_t v10 = v6[5], !(v10 | (unint64_t)self->_name)) || objc_msgSend((id)v10, "isEqual:"))
        && ((unint64_t v11 = v6[6], !(v11 | (unint64_t)self->_author)) || objc_msgSend((id)v11, "isEqual:"))
        && ((unint64_t v12 = v6[7], !(v12 | (unint64_t)self->_artwork)) || objc_msgSend((id)v12, "isEqual:"))
        && *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1);
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeFrontIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"author", @"artwork", @"artworkMetadata", @"hasSpineOnRight", 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_hasSpineOnRight;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_storeIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)author
{
  return self->_name;
}

- (void)setAuthor:(id)a3
{
}

- (_BlastDoorLPImage)artwork
{
  return (_BlastDoorLPImage *)self->_author;
}

- (void)setArtwork:(id)a3
{
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
{
  return (_BlastDoorLPArtworkMetadata *)self->_artwork;
}

- (void)setArtworkMetadata:(id)a3
{
}

- (BOOL)hasSpineOnRight
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setHasSpineOnRight:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_hasSpineOnRight, 0);
}

@end