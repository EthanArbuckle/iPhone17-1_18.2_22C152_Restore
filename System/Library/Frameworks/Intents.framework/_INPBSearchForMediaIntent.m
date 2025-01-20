@interface _INPBSearchForMediaIntent
+ (BOOL)supportsSecureCoding;
+ (Class)mediaItemsType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMediaSearch;
- (BOOL)hasPrivateSearchForMediaIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)mediaItems;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBMediaSearch)mediaSearch;
- (_INPBPrivateSearchForMediaIntentData)privateSearchForMediaIntentData;
- (_INPBSearchForMediaIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mediaItemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mediaItemsCount;
- (void)addMediaItems:(id)a3;
- (void)clearMediaItems;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setPrivateSearchForMediaIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForMediaIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSearchForMediaIntentData, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBPrivateSearchForMediaIntentData)privateSearchForMediaIntentData
{
  return self->_privateSearchForMediaIntentData;
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

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchForMediaIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_mediaItems count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_mediaItems;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"mediaItems"];
  }
  v13 = [(_INPBSearchForMediaIntent *)self mediaSearch];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"mediaSearch"];

  v15 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"privateSearchForMediaIntentData"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  uint64_t v4 = [(NSArray *)self->_mediaItems hash] ^ v3;
  unint64_t v5 = [(_INPBMediaSearch *)self->_mediaSearch hash];
  return v4 ^ v5 ^ [(_INPBPrivateSearchForMediaIntentData *)self->_privateSearchForMediaIntentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBSearchForMediaIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSearchForMediaIntent *)self intentMetadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBSearchForMediaIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMediaIntent *)self mediaItems];
  v6 = [v4 mediaItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSearchForMediaIntent *)self mediaItems];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSearchForMediaIntent *)self mediaItems];
    v15 = [v4 mediaItems];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMediaIntent *)self mediaSearch];
  v6 = [v4 mediaSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSearchForMediaIntent *)self mediaSearch];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBSearchForMediaIntent *)self mediaSearch];
    long long v20 = [v4 mediaSearch];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];
  v6 = [v4 privateSearchForMediaIntentData];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];
    v25 = [v4 privateSearchForMediaIntentData];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForMediaIntent allocWithZone:](_INPBSearchForMediaIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForMediaIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_mediaItems copyWithZone:a3];
  [(_INPBSearchForMediaIntent *)v5 setMediaItems:v7];

  id v8 = [(_INPBMediaSearch *)self->_mediaSearch copyWithZone:a3];
  [(_INPBSearchForMediaIntent *)v5 setMediaSearch:v8];

  id v9 = [(_INPBPrivateSearchForMediaIntentData *)self->_privateSearchForMediaIntentData copyWithZone:a3];
  [(_INPBSearchForMediaIntent *)v5 setPrivateSearchForMediaIntentData:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForMediaIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForMediaIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForMediaIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBSearchForMediaIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBSearchForMediaIntent *)self intentMetadata];
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

  uint64_t v12 = [(_INPBSearchForMediaIntent *)self mediaSearch];

  if (v12)
  {
    v13 = [(_INPBSearchForMediaIntent *)self mediaSearch];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];

  if (v14)
  {
    v15 = [(_INPBSearchForMediaIntent *)self privateSearchForMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMediaIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPrivateSearchForMediaIntentData
{
  return self->_privateSearchForMediaIntentData != 0;
}

- (void)setPrivateSearchForMediaIntentData:(id)a3
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)mediaItemsType
{
  return (Class)objc_opt_class();
}

@end