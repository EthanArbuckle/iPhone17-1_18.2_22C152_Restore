@interface _INPBSearchForPhotosIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlbumName;
- (BOOL)hasLocationCreated;
- (BOOL)hasSearchResultsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)albumName;
- (_INPBLocation)locationCreated;
- (_INPBSearchForPhotosIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)searchResultsCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setHasSearchResultsCount:(BOOL)a3;
- (void)setLocationCreated:(id)a3;
- (void)setSearchResultsCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForPhotosIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCreated, 0);

  objc_storeStrong((id *)&self->_albumName, 0);
}

- (int)searchResultsCount
{
  return self->_searchResultsCount;
}

- (_INPBLocation)locationCreated
{
  return self->_locationCreated;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_albumName)
  {
    v4 = [(_INPBSearchForPhotosIntentResponse *)self albumName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"albumName"];
  }
  v6 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"locationCreated"];

  if ([(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount])
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBSearchForPhotosIntentResponse searchResultsCount](self, "searchResultsCount"));
    [v3 setObject:v8 forKeyedSubscript:@"searchResultsCount"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_albumName hash];
  unint64_t v4 = [(_INPBLocation *)self->_locationCreated hash];
  if ([(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount]) {
    uint64_t v5 = 2654435761 * self->_searchResultsCount;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBSearchForPhotosIntentResponse *)self albumName];
  v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBSearchForPhotosIntentResponse *)self albumName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSearchForPhotosIntentResponse *)self albumName];
    v10 = [v4 albumName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];
  v6 = [v4 locationCreated];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];
    v15 = [v4 locationCreated];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount];
  if (v19 == [v4 hasSearchResultsCount])
  {
    if (![(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount]
      || ![v4 hasSearchResultsCount]
      || (int searchResultsCount = self->_searchResultsCount,
          searchResultsCount == [v4 searchResultsCount]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSearchForPhotosIntentResponse allocWithZone:](_INPBSearchForPhotosIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_albumName copyWithZone:a3];
  [(_INPBSearchForPhotosIntentResponse *)v5 setAlbumName:v6];

  id v7 = [(_INPBLocation *)self->_locationCreated copyWithZone:a3];
  [(_INPBSearchForPhotosIntentResponse *)v5 setLocationCreated:v7];

  if ([(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount]) {
    [(_INPBSearchForPhotosIntentResponse *)v5 setSearchResultsCount:[(_INPBSearchForPhotosIntentResponse *)self searchResultsCount]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForPhotosIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForPhotosIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForPhotosIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForPhotosIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForPhotosIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBSearchForPhotosIntentResponse *)self albumName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];

  if (v5)
  {
    id v6 = [(_INPBSearchForPhotosIntentResponse *)self locationCreated];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForPhotosIntentResponse *)self hasSearchResultsCount]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForPhotosIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSearchResultsCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchResultsCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSearchResultsCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int searchResultsCount = a3;
}

- (BOOL)hasLocationCreated
{
  return self->_locationCreated != 0;
}

- (void)setLocationCreated:(id)a3
{
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setAlbumName:(id)a3
{
  self->_albumName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end