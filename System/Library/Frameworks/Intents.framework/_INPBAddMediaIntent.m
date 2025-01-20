@interface _INPBAddMediaIntent
+ (BOOL)supportsSecureCoding;
+ (Class)mediaItemsType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMediaDestination;
- (BOOL)hasMediaSearch;
- (BOOL)hasPrivateAddMediaIntentData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)mediaItems;
- (_INPBAddMediaIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBMediaDestination)mediaDestination;
- (_INPBMediaSearch)mediaSearch;
- (_INPBPrivateAddMediaIntentData)privateAddMediaIntentData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mediaItemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mediaItemsCount;
- (void)addMediaItems:(id)a3;
- (void)clearMediaItems;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMediaDestination:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setPrivateAddMediaIntentData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAddMediaIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateAddMediaIntentData, 0);
  objc_storeStrong((id *)&self->_mediaSearch, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBPrivateAddMediaIntentData)privateAddMediaIntentData
{
  return self->_privateAddMediaIntentData;
}

- (_INPBMediaSearch)mediaSearch
{
  return self->_mediaSearch;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (_INPBMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAddMediaIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  v6 = [(_INPBAddMediaIntent *)self mediaDestination];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"mediaDestination"];

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
          v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"mediaItems"];
  }
  v15 = [(_INPBAddMediaIntent *)self mediaSearch];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"mediaSearch"];

  v17 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"privateAddMediaIntentData"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBMediaDestination *)self->_mediaDestination hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_mediaItems hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBMediaSearch *)self->_mediaSearch hash];
  return v6 ^ [(_INPBPrivateAddMediaIntentData *)self->_privateAddMediaIntentData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(_INPBAddMediaIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBAddMediaIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAddMediaIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAddMediaIntent *)self mediaDestination];
  unint64_t v6 = [v4 mediaDestination];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBAddMediaIntent *)self mediaDestination];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAddMediaIntent *)self mediaDestination];
    v15 = [v4 mediaDestination];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAddMediaIntent *)self mediaItems];
  unint64_t v6 = [v4 mediaItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBAddMediaIntent *)self mediaItems];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBAddMediaIntent *)self mediaItems];
    long long v20 = [v4 mediaItems];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAddMediaIntent *)self mediaSearch];
  unint64_t v6 = [v4 mediaSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBAddMediaIntent *)self mediaSearch];
  if (v22)
  {
    long long v23 = (void *)v22;
    v24 = [(_INPBAddMediaIntent *)self mediaSearch];
    uint64_t v25 = [v4 mediaSearch];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];
  unint64_t v6 = [v4 privateAddMediaIntentData];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];
    v30 = [v4 privateAddMediaIntentData];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBAddMediaIntent allocWithZone:](_INPBAddMediaIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBAddMediaIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBMediaDestination *)self->_mediaDestination copyWithZone:a3];
  [(_INPBAddMediaIntent *)v5 setMediaDestination:v7];

  v8 = (void *)[(NSArray *)self->_mediaItems copyWithZone:a3];
  [(_INPBAddMediaIntent *)v5 setMediaItems:v8];

  id v9 = [(_INPBMediaSearch *)self->_mediaSearch copyWithZone:a3];
  [(_INPBAddMediaIntent *)v5 setMediaSearch:v9];

  id v10 = [(_INPBPrivateAddMediaIntentData *)self->_privateAddMediaIntentData copyWithZone:a3];
  [(_INPBAddMediaIntent *)v5 setPrivateAddMediaIntentData:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAddMediaIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAddMediaIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAddMediaIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAddMediaIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAddMediaIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBAddMediaIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBAddMediaIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBAddMediaIntent *)self mediaDestination];

  if (v7)
  {
    v8 = [(_INPBAddMediaIntent *)self mediaDestination];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = self->_mediaItems;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v14 = [(_INPBAddMediaIntent *)self mediaSearch];

  if (v14)
  {
    v15 = [(_INPBAddMediaIntent *)self mediaSearch];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];

  if (v16)
  {
    uint64_t v17 = [(_INPBAddMediaIntent *)self privateAddMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAddMediaIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPrivateAddMediaIntentData
{
  return self->_privateAddMediaIntentData != 0;
}

- (void)setPrivateAddMediaIntentData:(id)a3
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

- (BOOL)hasMediaDestination
{
  return self->_mediaDestination != 0;
}

- (void)setMediaDestination:(id)a3
{
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