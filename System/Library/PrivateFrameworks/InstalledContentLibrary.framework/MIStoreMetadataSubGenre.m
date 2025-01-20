@interface MIStoreMetadataSubGenre
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MIStoreMetadataSubGenre)initWithCoder:(id)a3;
- (MIStoreMetadataSubGenre)initWithGenre:(id)a3 genreID:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)genreID;
- (NSString)genre;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGenre:(id)a3;
- (void)setGenreID:(id)a3;
@end

@implementation MIStoreMetadataSubGenre

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStoreMetadataSubGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStoreMetadataSubGenre *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genre"];
    genre = v5->_genre;
    v5->_genre = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genreID"];
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v8;
  }
  return v5;
}

- (MIStoreMetadataSubGenre)initWithGenre:(id)a3 genreID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MIStoreMetadataSubGenre *)self init];
  v9 = v8;
  if (v8)
  {
    [(MIStoreMetadataSubGenre *)v8 setGenre:v6];
    [(MIStoreMetadataSubGenre *)v9 setGenreID:v7];
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MIStoreMetadataSubGenre *)self genre];
  id v6 = [(MIStoreMetadataSubGenre *)self genreID];
  id v7 = (void *)[v4 initWithGenre:v5 genreID:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIStoreMetadataSubGenre *)self genre];
  [v4 encodeObject:v5 forKey:@"genre"];

  id v6 = [(MIStoreMetadataSubGenre *)self genreID];
  [v4 encodeObject:v6 forKey:@"genreID"];
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = genre;
  v3 = [(MIStoreMetadataSubGenre *)self genre];
  v7[1] = genreID;
  v8[0] = v3;
  id v4 = [(MIStoreMetadataSubGenre *)self genreID];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIStoreMetadataSubGenre *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MIStoreMetadataSubGenre *)self genre];
      id v7 = [(MIStoreMetadataSubGenre *)v5 genre];
      if (MICompareObjects(v6, v7))
      {
        uint64_t v8 = [(MIStoreMetadataSubGenre *)self genreID];
        v9 = [(MIStoreMetadataSubGenre *)v5 genreID];
        BOOL v10 = MICompareObjects(v8, v9);
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(MIStoreMetadataSubGenre *)self genre];
  uint64_t v4 = [v3 hash];
  v5 = [(MIStoreMetadataSubGenre *)self genreID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

@end