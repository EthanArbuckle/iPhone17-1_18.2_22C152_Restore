@interface SPProtoAudioFilePlayerUpdateContainedIdentifier
- (BOOL)hasContainedIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)containedIdentifier;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessageForPlayerItemUpsertWithAsset;
- (id)sockPuppetMessageForQueuePlayerAppendItem;
- (id)sockPuppetMessageForQueuePlayerRemoveItem;
- (id)sockPuppetMessageForQueuePlayerReplaceCurrentItem;
- (id)sockPuppetMessageForQueuePlayerSetCurrentItem;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainedIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerUpdateContainedIdentifier

- (BOOL)hasContainedIdentifier
{
  return self->_containedIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerUpdateContainedIdentifier;
  v4 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  containedIdentifier = self->_containedIdentifier;
  if (containedIdentifier) {
    [v4 setObject:containedIdentifier forKey:@"containedIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  if (self->_containedIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setIdentifier:self->_identifier];
  if (self->_containedIdentifier) {
    objc_msgSend(v4, "setContainedIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_containedIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    containedIdentifier = self->_containedIdentifier;
    if ((unint64_t)containedIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](containedIdentifier, "isEqual:");
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
  return [(NSString *)self->_containedIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[SPProtoAudioFilePlayerUpdateContainedIdentifier setContainedIdentifier:](self, "setContainedIdentifier:");
    id v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)containedIdentifier
{
  return self->_containedIdentifier;
}

- (void)setContainedIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_containedIdentifier, 0);
}

- (id)sockPuppetMessageForPlayerItemUpsertWithAsset
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setUpsertWithAsset:self];
  id v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerReplaceCurrentItem
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setReplaceCurrentItem:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerAppendItem
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setAppendItem:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerRemoveItem
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setRemoveItem:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerSetCurrentItem
{
  NSUInteger v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setSetCurrentItem:self];
  id v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

@end