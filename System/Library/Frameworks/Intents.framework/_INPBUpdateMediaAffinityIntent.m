@interface _INPBUpdateMediaAffinityIntent
+ (BOOL)supportsSecureCoding;
+ (Class)mediaItemsType;
- (BOOL)hasAffinityType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMediaSearch;
- (BOOL)hasPrivateUpdateMediaAffinityIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)mediaItems;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBMediaSearch)mediaSearch;
- (_INPBPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData;
- (_INPBUpdateMediaAffinityIntent)initWithCoder:(id)a3;
- (id)affinityTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mediaItemsAtIndex:(unint64_t)a3;
- (int)StringAsAffinityType:(id)a3;
- (int)affinityType;
- (unint64_t)hash;
- (unint64_t)mediaItemsCount;
- (void)addMediaItems:(id)a3;
- (void)clearMediaItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAffinityType:(int)a3;
- (void)setHasAffinityType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUpdateMediaAffinityIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateUpdateMediaAffinityIntentData, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData
{
  return self->_privateUpdateMediaAffinityIntentData;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)affinityType
{
  return self->_affinityType;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBUpdateMediaAffinityIntent *)self hasAffinityType])
  {
    uint64_t v4 = [(_INPBUpdateMediaAffinityIntent *)self affinityType];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551EDE8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"affinityType"];
  }
  v6 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_mediaItems count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = self->_mediaItems;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"mediaItems"];
  }
  v15 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"mediaSearch"];

  v17 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"privateUpdateMediaAffinityIntentData"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBUpdateMediaAffinityIntent *)self hasAffinityType]) {
    uint64_t v3 = 2654435761 * self->_affinityType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_mediaItems hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBMediaSearch *)self->_mediaSearch hash];
  return v6 ^ [(_INPBPrivateUpdateMediaAffinityIntentData *)self->_privateUpdateMediaAffinityIntentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  int v5 = [(_INPBUpdateMediaAffinityIntent *)self hasAffinityType];
  if (v5 != [v4 hasAffinityType]) {
    goto LABEL_26;
  }
  if ([(_INPBUpdateMediaAffinityIntent *)self hasAffinityType])
  {
    if ([v4 hasAffinityType])
    {
      int affinityType = self->_affinityType;
      if (affinityType != [v4 affinityType]) {
        goto LABEL_26;
      }
    }
  }
  v7 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v9 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];
    uint64_t v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBUpdateMediaAffinityIntent *)self mediaItems];
  v8 = [v4 mediaItems];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBUpdateMediaAffinityIntent *)self mediaItems];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBUpdateMediaAffinityIntent *)self mediaItems];
    v17 = [v4 mediaItems];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];
  v8 = [v4 mediaSearch];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];
  if (v19)
  {
    long long v20 = (void *)v19;
    long long v21 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];
    long long v22 = [v4 mediaSearch];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];
  v8 = [v4 privateUpdateMediaAffinityIntentData];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v24 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    uint64_t v25 = (void *)v24;
    v26 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];
    v27 = [v4 privateUpdateMediaAffinityIntentData];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBUpdateMediaAffinityIntent allocWithZone:](_INPBUpdateMediaAffinityIntent, "allocWithZone:") init];
  if ([(_INPBUpdateMediaAffinityIntent *)self hasAffinityType]) {
    [(_INPBUpdateMediaAffinityIntent *)v5 setAffinityType:[(_INPBUpdateMediaAffinityIntent *)self affinityType]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBUpdateMediaAffinityIntent *)v5 setIntentMetadata:v6];

  v7 = (void *)[(NSArray *)self->_mediaItems copyWithZone:a3];
  [(_INPBUpdateMediaAffinityIntent *)v5 setMediaItems:v7];

  id v8 = [(_INPBMediaSearch *)self->_mediaSearch copyWithZone:a3];
  [(_INPBUpdateMediaAffinityIntent *)v5 setMediaSearch:v8];

  id v9 = [(_INPBPrivateUpdateMediaAffinityIntentData *)self->_privateUpdateMediaAffinityIntentData copyWithZone:a3];
  [(_INPBUpdateMediaAffinityIntent *)v5 setPrivateUpdateMediaAffinityIntentData:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUpdateMediaAffinityIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUpdateMediaAffinityIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUpdateMediaAffinityIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUpdateMediaAffinityIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUpdateMediaAffinityIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBUpdateMediaAffinityIntent *)self hasAffinityType]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBUpdateMediaAffinityIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_mediaItems;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];

  if (v12)
  {
    int v13 = [(_INPBUpdateMediaAffinityIntent *)self mediaSearch];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];

  if (v14)
  {
    v15 = [(_INPBUpdateMediaAffinityIntent *)self privateUpdateMediaAffinityIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateMediaAffinityIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPrivateUpdateMediaAffinityIntentData
{
  return self->_privateUpdateMediaAffinityIntentData != 0;
}

- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3
{
}

- (BOOL)hasMediaSearch
{
  return self->_mediaSearch != 0;
}

- (void)setMediaSearch:(id)a3
{
}

- (id)mediaItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mediaItems objectAtIndexedSubscript:a3];
}

- (unint64_t)mediaItemsCount
{
  return [(NSArray *)self->_mediaItems count];
}

- (void)addMediaItems:(id)a3
{
  id v4 = a3;
  mediaItems = self->_mediaItems;
  id v8 = v4;
  if (!mediaItems)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mediaItems;
    self->_mediaItems = v6;

    id v4 = v8;
    mediaItems = self->_mediaItems;
  }
  [(NSArray *)mediaItems addObject:v4];
}

- (void)clearMediaItems
{
}

- (void)setMediaItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  mediaItems = self->_mediaItems;
  self->_mediaItems = v4;

  MEMORY[0x1F41817F8](v4, mediaItems);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsAffinityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AFFINITY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIKE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISLIKE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)affinityTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551EDE8[a3];
  }

  return v3;
}

- (void)setHasAffinityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAffinityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAffinityType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int affinityType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)mediaItemsType
{
  return (Class)objc_opt_class();
}

@end