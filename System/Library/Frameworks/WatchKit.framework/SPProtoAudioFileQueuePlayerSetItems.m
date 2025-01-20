@interface SPProtoAudioFileQueuePlayerSetItems
+ (Class)playerItemIdentifiersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)playerItemIdentifiers;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)playerItemIdentifiersAtIndex:(unint64_t)a3;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (unint64_t)playerItemIdentifiersCount;
- (void)addPlayerItemIdentifiers:(id)a3;
- (void)clearPlayerItemIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlayerItemIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFileQueuePlayerSetItems

- (void)clearPlayerItemIdentifiers
{
}

- (void)addPlayerItemIdentifiers:(id)a3
{
  id v4 = a3;
  playerItemIdentifiers = self->_playerItemIdentifiers;
  id v8 = v4;
  if (!playerItemIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_playerItemIdentifiers;
    self->_playerItemIdentifiers = v6;

    id v4 = v8;
    playerItemIdentifiers = self->_playerItemIdentifiers;
  }
  [(NSMutableArray *)playerItemIdentifiers addObject:v4];
}

- (unint64_t)playerItemIdentifiersCount
{
  return [(NSMutableArray *)self->_playerItemIdentifiers count];
}

- (id)playerItemIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_playerItemIdentifiers objectAtIndex:a3];
}

+ (Class)playerItemIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFileQueuePlayerSetItems;
  id v4 = [(SPProtoAudioFileQueuePlayerSetItems *)&v8 description];
  v5 = [(SPProtoAudioFileQueuePlayerSetItems *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  playerItemIdentifiers = self->_playerItemIdentifiers;
  if (playerItemIdentifiers) {
    [v4 setObject:playerItemIdentifiers forKey:@"playerItemIdentifiers"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFileQueuePlayerSetItemsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteStringField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_playerItemIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setIdentifier:self->_identifier];
  if ([(SPProtoAudioFileQueuePlayerSetItems *)self playerItemIdentifiersCount])
  {
    [v8 clearPlayerItemIdentifiers];
    unint64_t v4 = [(SPProtoAudioFileQueuePlayerSetItems *)self playerItemIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SPProtoAudioFileQueuePlayerSetItems *)self playerItemIdentifiersAtIndex:i];
        [v8 addPlayerItemIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_playerItemIdentifiers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addPlayerItemIdentifiers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    playerItemIdentifiers = self->_playerItemIdentifiers;
    if ((unint64_t)playerItemIdentifiers | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](playerItemIdentifiers, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSMutableArray *)self->_playerItemIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[SPProtoAudioFileQueuePlayerSetItems setIdentifier:](self, "setIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[SPProtoAudioFileQueuePlayerSetItems addPlayerItemIdentifiers:](self, "addPlayerItemIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)playerItemIdentifiers
{
  return self->_playerItemIdentifiers;
}

- (void)setPlayerItemIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)sockPuppetMessage
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setUpsertWithItems:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

@end