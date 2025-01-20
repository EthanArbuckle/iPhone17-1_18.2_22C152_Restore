@interface _INPBMediaSearch
+ (BOOL)supportsSecureCoding;
+ (Class)genreNamesType;
+ (Class)moodNamesType;
- (BOOL)hasAlbumName;
- (BOOL)hasArtistName;
- (BOOL)hasMediaIdentifier;
- (BOOL)hasMediaName;
- (BOOL)hasMediaType;
- (BOOL)hasReference;
- (BOOL)hasReleaseDate;
- (BOOL)hasSortOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)genreNames;
- (NSArray)moodNames;
- (_INPBDateTimeRange)releaseDate;
- (_INPBMediaSearch)initWithCoder:(id)a3;
- (_INPBString)albumName;
- (_INPBString)artistName;
- (_INPBString)mediaIdentifier;
- (_INPBString)mediaName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)genreNamesAtIndex:(unint64_t)a3;
- (id)mediaTypeAsString:(int)a3;
- (id)moodNamesAtIndex:(unint64_t)a3;
- (id)referenceAsString:(int)a3;
- (id)sortOrderAsString:(int)a3;
- (int)StringAsMediaType:(id)a3;
- (int)StringAsReference:(id)a3;
- (int)StringAsSortOrder:(id)a3;
- (int)mediaType;
- (int)reference;
- (int)sortOrder;
- (unint64_t)genreNamesCount;
- (unint64_t)hash;
- (unint64_t)moodNamesCount;
- (void)addGenreNames:(id)a3;
- (void)addMoodNames:(id)a3;
- (void)clearGenreNames;
- (void)clearMoodNames;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setGenreNames:(id)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasReference:(BOOL)a3;
- (void)setHasSortOrder:(BOOL)a3;
- (void)setMediaIdentifier:(id)a3;
- (void)setMediaName:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setMoodNames:(id)a3;
- (void)setReference:(int)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSortOrder:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMediaSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_moodNames, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_genreNames, 0);
  objc_storeStrong((id *)&self->_artistName, 0);

  objc_storeStrong((id *)&self->_albumName, 0);
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (_INPBDateTimeRange)releaseDate
{
  return self->_releaseDate;
}

- (int)reference
{
  return self->_reference;
}

- (NSArray)moodNames
{
  return self->_moodNames;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (_INPBString)mediaName
{
  return self->_mediaName;
}

- (_INPBString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSArray)genreNames
{
  return self->_genreNames;
}

- (_INPBString)artistName
{
  return self->_artistName;
}

- (_INPBString)albumName
{
  return self->_albumName;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBMediaSearch *)self albumName];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"albumName"];

  v6 = [(_INPBMediaSearch *)self artistName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"artistName"];

  if ([(NSArray *)self->_genreNames count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v9 = self->_genreNames;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"genreNames"];
  }
  v15 = [(_INPBMediaSearch *)self mediaIdentifier];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"mediaIdentifier"];

  v17 = [(_INPBMediaSearch *)self mediaName];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"mediaName"];

  if ([(_INPBMediaSearch *)self hasMediaType])
  {
    uint64_t v19 = [(_INPBMediaSearch *)self mediaType];
    if (v19 >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E551EC70[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"mediaType"];
  }
  if ([(NSArray *)self->_moodNames count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v22 = self->_moodNames;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"moodNames"];
  }
  if ([(_INPBMediaSearch *)self hasReference])
  {
    uint64_t v28 = [(_INPBMediaSearch *)self reference];
    if (v28 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E551ED18[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"reference"];
  }
  v30 = [(_INPBMediaSearch *)self releaseDate];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"releaseDate"];

  if ([(_INPBMediaSearch *)self hasSortOrder])
  {
    uint64_t v32 = [(_INPBMediaSearch *)self sortOrder];
    if (v32 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E551ED30[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"sortOrder"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v13 = [(_INPBString *)self->_albumName hash];
  unint64_t v3 = [(_INPBString *)self->_artistName hash];
  uint64_t v4 = [(NSArray *)self->_genreNames hash];
  unint64_t v5 = [(_INPBString *)self->_mediaIdentifier hash];
  unint64_t v6 = [(_INPBString *)self->_mediaName hash];
  if ([(_INPBMediaSearch *)self hasMediaType]) {
    uint64_t v7 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSArray *)self->_moodNames hash];
  if ([(_INPBMediaSearch *)self hasReference]) {
    uint64_t v9 = 2654435761 * self->_reference;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(_INPBDateTimeRange *)self->_releaseDate hash];
  if ([(_INPBMediaSearch *)self hasSortOrder]) {
    uint64_t v11 = 2654435761 * self->_sortOrder;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  unint64_t v5 = [(_INPBMediaSearch *)self albumName];
  unint64_t v6 = [v4 albumName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v7 = [(_INPBMediaSearch *)self albumName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBMediaSearch *)self albumName];
    unint64_t v10 = [v4 albumName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMediaSearch *)self artistName];
  unint64_t v6 = [v4 artistName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v12 = [(_INPBMediaSearch *)self artistName];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    v14 = [(_INPBMediaSearch *)self artistName];
    v15 = [v4 artistName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMediaSearch *)self genreNames];
  unint64_t v6 = [v4 genreNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v17 = [(_INPBMediaSearch *)self genreNames];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_INPBMediaSearch *)self genreNames];
    v20 = [v4 genreNames];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMediaSearch *)self mediaIdentifier];
  unint64_t v6 = [v4 mediaIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v22 = [(_INPBMediaSearch *)self mediaIdentifier];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_INPBMediaSearch *)self mediaIdentifier];
    uint64_t v25 = [v4 mediaIdentifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBMediaSearch *)self mediaName];
  unint64_t v6 = [v4 mediaName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v27 = [(_INPBMediaSearch *)self mediaName];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    v29 = [(_INPBMediaSearch *)self mediaName];
    v30 = [v4 mediaName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  int v32 = [(_INPBMediaSearch *)self hasMediaType];
  if (v32 != [v4 hasMediaType]) {
    goto LABEL_45;
  }
  if ([(_INPBMediaSearch *)self hasMediaType])
  {
    if ([v4 hasMediaType])
    {
      int mediaType = self->_mediaType;
      if (mediaType != [v4 mediaType]) {
        goto LABEL_45;
      }
    }
  }
  unint64_t v5 = [(_INPBMediaSearch *)self moodNames];
  unint64_t v6 = [v4 moodNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v34 = [(_INPBMediaSearch *)self moodNames];
  if (v34)
  {
    long long v35 = (void *)v34;
    long long v36 = [(_INPBMediaSearch *)self moodNames];
    long long v37 = [v4 moodNames];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  int v39 = [(_INPBMediaSearch *)self hasReference];
  if (v39 != [v4 hasReference]) {
    goto LABEL_45;
  }
  if ([(_INPBMediaSearch *)self hasReference])
  {
    if ([v4 hasReference])
    {
      int reference = self->_reference;
      if (reference != [v4 reference]) {
        goto LABEL_45;
      }
    }
  }
  unint64_t v5 = [(_INPBMediaSearch *)self releaseDate];
  unint64_t v6 = [v4 releaseDate];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v41 = [(_INPBMediaSearch *)self releaseDate];
  if (v41)
  {
    long long v42 = (void *)v41;
    v43 = [(_INPBMediaSearch *)self releaseDate];
    v44 = [v4 releaseDate];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  int v48 = [(_INPBMediaSearch *)self hasSortOrder];
  if (v48 == [v4 hasSortOrder])
  {
    if (![(_INPBMediaSearch *)self hasSortOrder]
      || ![v4 hasSortOrder]
      || (int sortOrder = self->_sortOrder, sortOrder == [v4 sortOrder]))
    {
      BOOL v46 = 1;
      goto LABEL_46;
    }
  }
LABEL_45:
  BOOL v46 = 0;
LABEL_46:

  return v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBMediaSearch allocWithZone:](_INPBMediaSearch, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_albumName copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setAlbumName:v6];

  id v7 = [(_INPBString *)self->_artistName copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setArtistName:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_genreNames copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setGenreNames:v8];

  id v9 = [(_INPBString *)self->_mediaIdentifier copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setMediaIdentifier:v9];

  id v10 = [(_INPBString *)self->_mediaName copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setMediaName:v10];

  if ([(_INPBMediaSearch *)self hasMediaType]) {
    [(_INPBMediaSearch *)v5 setMediaType:[(_INPBMediaSearch *)self mediaType]];
  }
  int v11 = (void *)[(NSArray *)self->_moodNames copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setMoodNames:v11];

  if ([(_INPBMediaSearch *)self hasReference]) {
    [(_INPBMediaSearch *)v5 setReference:[(_INPBMediaSearch *)self reference]];
  }
  id v12 = [(_INPBDateTimeRange *)self->_releaseDate copyWithZone:a3];
  [(_INPBMediaSearch *)v5 setReleaseDate:v12];

  if ([(_INPBMediaSearch *)self hasSortOrder]) {
    [(_INPBMediaSearch *)v5 setSortOrder:[(_INPBMediaSearch *)self sortOrder]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMediaSearch *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMediaSearch)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMediaSearch *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMediaSearch *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMediaSearch *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBMediaSearch *)self albumName];

  if (v5)
  {
    id v6 = [(_INPBMediaSearch *)self albumName];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBMediaSearch *)self artistName];

  if (v7)
  {
    uint64_t v8 = [(_INPBMediaSearch *)self artistName];
    PBDataWriterWriteSubmessage();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = self->_genreNames;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  v14 = [(_INPBMediaSearch *)self mediaIdentifier];

  if (v14)
  {
    v15 = [(_INPBMediaSearch *)self mediaIdentifier];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBMediaSearch *)self mediaName];

  if (v16)
  {
    uint64_t v17 = [(_INPBMediaSearch *)self mediaName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMediaSearch *)self hasMediaType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->_moodNames;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  if ([(_INPBMediaSearch *)self hasReference]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v23 = [(_INPBMediaSearch *)self releaseDate];

  if (v23)
  {
    uint64_t v24 = [(_INPBMediaSearch *)self releaseDate];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBMediaSearch *)self hasSortOrder]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaSearchReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSortOrder:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SORT_ORDER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEWEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OLDEST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BEST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WORST"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"POPULAR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UNPOPULAR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRENDING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sortOrderAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551ED30[a3];
  }

  return v3;
}

- (void)setHasSortOrder:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSortOrder
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSortOrder:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int sortOrder = a3;
  }
}

- (BOOL)hasReleaseDate
{
  return self->_releaseDate != 0;
}

- (void)setReleaseDate:(id)a3
{
}

- (int)StringAsReference:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REFERENCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CURRENTLY_PLAYING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)referenceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551ED18[a3];
  }

  return v3;
}

- (void)setHasReference:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReference
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReference:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int reference = a3;
  }
}

- (id)moodNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_moodNames objectAtIndexedSubscript:a3];
}

- (unint64_t)moodNamesCount
{
  return [(NSArray *)self->_moodNames count];
}

- (void)addMoodNames:(id)a3
{
  id v4 = a3;
  moodNames = self->_moodNames;
  id v8 = v4;
  if (!moodNames)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_moodNames;
    self->_moodNames = v6;

    id v4 = v8;
    moodNames = self->_moodNames;
  }
  [(NSArray *)moodNames addObject:v4];
}

- (void)clearMoodNames
{
}

- (void)setMoodNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  moodNames = self->_moodNames;
  self->_moodNames = v4;

  MEMORY[0x1F41817F8](v4, moodNames);
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MEDIA_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SONG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALBUM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARTIST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GENRE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLAYLIST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PODCAST_SHOW"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PODCAST_EPISODE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PODCAST_PLAYLIST"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MUSIC_STATION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AUDIO_BOOK"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MOVIE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TV_SHOW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TV_SHOW_EPISODE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MUSIC_VIDEO"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PODCAST_STATION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RADIO_STATION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"STATION"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MUSIC"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ALGORITHMIC_RADIO_STATION"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"NEWS"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551EC70[a3];
  }

  return v3;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMediaType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int mediaType = a3;
  }
}

- (BOOL)hasMediaName
{
  return self->_mediaName != 0;
}

- (void)setMediaName:(id)a3
{
}

- (BOOL)hasMediaIdentifier
{
  return self->_mediaIdentifier != 0;
}

- (void)setMediaIdentifier:(id)a3
{
}

- (id)genreNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_genreNames objectAtIndexedSubscript:a3];
}

- (unint64_t)genreNamesCount
{
  return [(NSArray *)self->_genreNames count];
}

- (void)addGenreNames:(id)a3
{
  id v4 = a3;
  genreNames = self->_genreNames;
  id v8 = v4;
  if (!genreNames)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_genreNames;
    self->_genreNames = v6;

    id v4 = v8;
    genreNames = self->_genreNames;
  }
  [(NSArray *)genreNames addObject:v4];
}

- (void)clearGenreNames
{
}

- (void)setGenreNames:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  genreNames = self->_genreNames;
  self->_genreNames = v4;

  MEMORY[0x1F41817F8](v4, genreNames);
}

- (BOOL)hasArtistName
{
  return self->_artistName != 0;
}

- (void)setArtistName:(id)a3
{
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (void)setAlbumName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)moodNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)genreNamesType
{
  return (Class)objc_opt_class();
}

@end