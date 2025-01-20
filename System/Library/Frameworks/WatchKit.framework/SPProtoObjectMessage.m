@interface SPProtoObjectMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessageForAssetDestroy;
- (id)sockPuppetMessageForPlayerItemDestroy;
- (id)sockPuppetMessageForPlayerItemGetCurrentTime;
- (id)sockPuppetMessageForPlayerItemNotifyDidPlayToEndTime;
- (id)sockPuppetMessageForPlayerItemNotifyFailedToPlayToEndTime;
- (id)sockPuppetMessageForPlayerItemNotifyTimeJumped;
- (id)sockPuppetMessageForQueuePlayerAdvanceToNextItem;
- (id)sockPuppetMessageForQueuePlayerDestroy;
- (id)sockPuppetMessageForQueuePlayerRemoveAllItems;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoObjectMessage

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoObjectMessage;
  v4 = [(SPProtoObjectMessage *)&v8 description];
  v5 = [(SPProtoObjectMessage *)self dictionaryRepresentation];
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

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoObjectMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[1]) {
      char v6 = -[NSString isEqual:](identifier, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SPProtoObjectMessage setIdentifier:](self, "setIdentifier:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)sockPuppetMessageForAssetDestroy
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
  [(SPProtoAudioFilePlayerAsset *)v3 setDestroy:self];
  v4 = [(SPProtoAudioFilePlayerAsset *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForPlayerItemDestroy
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setDestroy:self];
  v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForPlayerItemGetCurrentTime
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setGetCurrentTime:self];
  v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyTimeJumped
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setNotifyTimeJumped:self];
  v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyDidPlayToEndTime
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setNotifyDidPlayToEndTime:self];
  v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForPlayerItemNotifyFailedToPlayToEndTime
{
  v3 = objc_alloc_init(SPProtoAudioFilePlayerItem);
  [(SPProtoAudioFilePlayerItem *)v3 setNotifyFailedToPlayToEndTime:self];
  v4 = [(SPProtoAudioFilePlayerItem *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerDestroy
{
  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setDestroy:self];
  v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerAdvanceToNextItem
{
  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setAdvanceToNextItem:self];
  v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

- (id)sockPuppetMessageForQueuePlayerRemoveAllItems
{
  v3 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
  [(SPProtoAudioFileQueuePlayer *)v3 setRemoveAllItems:self];
  v4 = [(SPProtoAudioFileQueuePlayer *)v3 sockPuppetMessage];

  return v4;
}

@end