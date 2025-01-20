@interface _INPBMediaItemValue
+ (BOOL)supportsSecureCoding;
+ (Class)namedEntitiesType;
+ (Class)topicsType;
- (BOOL)hasArtist;
- (BOOL)hasArtwork;
- (BOOL)hasAssetInfo;
- (BOOL)hasIdentifier;
- (BOOL)hasPrivateMediaItemValueData;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)namedEntities;
- (NSArray)topics;
- (NSString)artist;
- (NSString)assetInfo;
- (NSString)identifier;
- (NSString)title;
- (_INPBImageValue)artwork;
- (_INPBMediaItemValue)initWithCoder:(id)a3;
- (_INPBPrivateMediaItemValueData)privateMediaItemValueData;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (unint64_t)topicsCount;
- (void)addNamedEntities:(id)a3;
- (void)addTopics:(id)a3;
- (void)clearNamedEntities;
- (void)clearTopics;
- (void)encodeWithCoder:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setAssetInfo:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setNamedEntities:(id)a3;
- (void)setPrivateMediaItemValueData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopics:(id)a3;
- (void)setType:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBMediaItemValue

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  v5 = [(_INPBMediaItemValue *)self artist];
  v6 = [v4 artist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v7 = [(_INPBMediaItemValue *)self artist];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBMediaItemValue *)self artist];
    v10 = [v4 artist];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self artwork];
  v6 = [v4 artwork];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v12 = [(_INPBMediaItemValue *)self artwork];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBMediaItemValue *)self artwork];
    v15 = [v4 artwork];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self assetInfo];
  v6 = [v4 assetInfo];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v17 = [(_INPBMediaItemValue *)self assetInfo];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBMediaItemValue *)self assetInfo];
    v20 = [v4 assetInfo];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self identifier];
  v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v22 = [(_INPBMediaItemValue *)self identifier];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBMediaItemValue *)self identifier];
    v25 = [v4 identifier];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self namedEntities];
  v6 = [v4 namedEntities];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v27 = [(_INPBMediaItemValue *)self namedEntities];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBMediaItemValue *)self namedEntities];
    v30 = [v4 namedEntities];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self privateMediaItemValueData];
  v6 = [v4 privateMediaItemValueData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v32 = [(_INPBMediaItemValue *)self privateMediaItemValueData];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBMediaItemValue *)self privateMediaItemValueData];
    v35 = [v4 privateMediaItemValueData];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v37 = [(_INPBMediaItemValue *)self title];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBMediaItemValue *)self title];
    v40 = [v4 title];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  v5 = [(_INPBMediaItemValue *)self topics];
  v6 = [v4 topics];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v42 = [(_INPBMediaItemValue *)self topics];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBMediaItemValue *)self topics];
    v45 = [v4 topics];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int v47 = [(_INPBMediaItemValue *)self hasType];
  if (v47 != [v4 hasType]) {
    goto LABEL_51;
  }
  if ([(_INPBMediaItemValue *)self hasType])
  {
    if ([v4 hasType])
    {
      int type = self->_type;
      if (type != [v4 type]) {
        goto LABEL_51;
      }
    }
  }
  v5 = [(_INPBMediaItemValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v49 = [(_INPBMediaItemValue *)self valueMetadata];
    if (!v49)
    {

LABEL_54:
      BOOL v54 = 1;
      goto LABEL_52;
    }
    v50 = (void *)v49;
    v51 = [(_INPBMediaItemValue *)self valueMetadata];
    v52 = [v4 valueMetadata];
    char v53 = [v51 isEqual:v52];

    if (v53) {
      goto LABEL_54;
    }
  }
  else
  {
LABEL_50:
  }
LABEL_51:
  BOOL v54 = 0;
LABEL_52:

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_privateMediaItemValueData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)type
{
  return self->_type;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSString)title
{
  return self->_title;
}

- (_INPBPrivateMediaItemValueData)privateMediaItemValueData
{
  return self->_privateMediaItemValueData;
}

- (NSArray)namedEntities
{
  return self->_namedEntities;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (_INPBImageValue)artwork
{
  return self->_artwork;
}

- (NSString)artist
{
  return self->_artist;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_artist)
  {
    id v4 = [(_INPBMediaItemValue *)self artist];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"artist"];
  }
  v6 = [(_INPBMediaItemValue *)self artwork];
  uint64_t v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"artwork"];

  if (self->_assetInfo)
  {
    v8 = [(_INPBMediaItemValue *)self assetInfo];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"assetInfo"];
  }
  if (self->_identifier)
  {
    v10 = [(_INPBMediaItemValue *)self identifier];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"identifier"];
  }
  if ([(NSArray *)self->_namedEntities count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v13 = self->_namedEntities;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"namedEntities"];
  }
  v19 = [(_INPBMediaItemValue *)self privateMediaItemValueData];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"privateMediaItemValueData"];

  if (self->_title)
  {
    int v21 = [(_INPBMediaItemValue *)self title];
    uint64_t v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"title"];
  }
  if ([(NSArray *)self->_topics count])
  {
    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v24 = self->_topics;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"topics"];
  }
  if ([(_INPBMediaItemValue *)self hasType])
  {
    uint64_t v30 = [(_INPBMediaItemValue *)self type];
    if (v30 >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      int v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v31 = off_1E551E2F0[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"type"];
  }
  uint64_t v32 = [(_INPBMediaItemValue *)self valueMetadata];
  v33 = [v32 dictionaryRepresentation];
  [v3 setObject:v33 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_artist hash];
  unint64_t v4 = [(_INPBImageValue *)self->_artwork hash];
  NSUInteger v5 = [(NSString *)self->_assetInfo hash];
  NSUInteger v6 = [(NSString *)self->_identifier hash];
  uint64_t v7 = [(NSArray *)self->_namedEntities hash];
  unint64_t v8 = [(_INPBPrivateMediaItemValueData *)self->_privateMediaItemValueData hash];
  NSUInteger v9 = [(NSString *)self->_title hash];
  uint64_t v10 = [(NSArray *)self->_topics hash];
  if ([(_INPBMediaItemValue *)self hasType]) {
    uint64_t v11 = 2654435761 * self->_type;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBMediaItemValue allocWithZone:](_INPBMediaItemValue, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSString *)self->_artist copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setArtist:v6];

  id v7 = [(_INPBImageValue *)self->_artwork copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setArtwork:v7];

  unint64_t v8 = (void *)[(NSString *)self->_assetInfo copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setAssetInfo:v8];

  NSUInteger v9 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setIdentifier:v9];

  uint64_t v10 = (void *)[(NSArray *)self->_namedEntities copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setNamedEntities:v10];

  id v11 = [(_INPBPrivateMediaItemValueData *)self->_privateMediaItemValueData copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setPrivateMediaItemValueData:v11];

  uint64_t v12 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setTitle:v12];

  v13 = (void *)[(NSArray *)self->_topics copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setTopics:v13];

  if ([(_INPBMediaItemValue *)self hasType]) {
    [(_INPBMediaItemValue *)v5 setType:[(_INPBMediaItemValue *)self type]];
  }
  id v14 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBMediaItemValue *)v5 setValueMetadata:v14];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBMediaItemValue *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBMediaItemValue)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBMediaItemValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBMediaItemValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBMediaItemValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBMediaItemValue *)self artist];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBMediaItemValue *)self artwork];

  if (v6)
  {
    uint64_t v7 = [(_INPBMediaItemValue *)self artwork];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(_INPBMediaItemValue *)self assetInfo];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v9 = [(_INPBMediaItemValue *)self identifier];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = self->_namedEntities;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [(_INPBMediaItemValue *)self privateMediaItemValueData];

  if (v15)
  {
    uint64_t v16 = [(_INPBMediaItemValue *)self privateMediaItemValueData];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(_INPBMediaItemValue *)self title];

  if (v17) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->_topics;
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

  if ([(_INPBMediaItemValue *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  v23 = [(_INPBMediaItemValue *)self valueMetadata];

  if (v23)
  {
    v24 = [(_INPBMediaItemValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaItemValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (int)StringAsType:(id)a3
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

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551E2F0[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_topics objectAtIndexedSubscript:a3];
}

- (unint64_t)topicsCount
{
  return [(NSArray *)self->_topics count];
}

- (void)addTopics:(id)a3
{
  id v4 = a3;
  topics = self->_topics;
  id v8 = v4;
  if (!topics)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_topics;
    self->_topics = v6;

    id v4 = v8;
    topics = self->_topics;
  }
  [(NSArray *)topics addObject:v4];
}

- (void)clearTopics
{
}

- (void)setTopics:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  topics = self->_topics;
  self->_topics = v4;

  MEMORY[0x1F41817F8](v4, topics);
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

- (BOOL)hasPrivateMediaItemValueData
{
  return self->_privateMediaItemValueData != 0;
}

- (void)setPrivateMediaItemValueData:(id)a3
{
}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_namedEntities objectAtIndexedSubscript:a3];
}

- (unint64_t)namedEntitiesCount
{
  return [(NSArray *)self->_namedEntities count];
}

- (void)addNamedEntities:(id)a3
{
  id v4 = a3;
  namedEntities = self->_namedEntities;
  id v8 = v4;
  if (!namedEntities)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_namedEntities;
    self->_namedEntities = v6;

    id v4 = v8;
    namedEntities = self->_namedEntities;
  }
  [(NSArray *)namedEntities addObject:v4];
}

- (void)clearNamedEntities
{
}

- (void)setNamedEntities:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  namedEntities = self->_namedEntities;
  self->_namedEntities = v4;

  MEMORY[0x1F41817F8](v4, namedEntities);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (void)setAssetInfo:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

  MEMORY[0x1F41817F8](v4, assetInfo);
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (void)setArtwork:(id)a3
{
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setArtist:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  artist = self->_artist;
  self->_artist = v4;

  MEMORY[0x1F41817F8](v4, artist);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

+ (Class)namedEntitiesType
{
  return (Class)objc_opt_class();
}

@end