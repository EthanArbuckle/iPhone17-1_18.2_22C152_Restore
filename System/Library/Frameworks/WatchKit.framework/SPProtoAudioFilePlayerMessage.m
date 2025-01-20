@interface SPProtoAudioFilePlayerMessage
- (BOOL)hasAsset;
- (BOOL)hasPlayerItem;
- (BOOL)hasQueuePlayer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SPProtoAudioFilePlayerAsset)asset;
- (SPProtoAudioFilePlayerItem)playerItem;
- (SPProtoAudioFileQueuePlayer)queuePlayer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsset:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setQueuePlayer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerMessage

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasPlayerItem
{
  return self->_playerItem != 0;
}

- (BOOL)hasQueuePlayer
{
  return self->_queuePlayer != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerMessage;
  v4 = [(SPProtoAudioFilePlayerMessage *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  asset = self->_asset;
  if (asset)
  {
    v5 = [(SPProtoAudioFilePlayerAsset *)asset dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"asset"];
  }
  playerItem = self->_playerItem;
  if (playerItem)
  {
    v7 = [(SPProtoAudioFilePlayerItem *)playerItem dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"playerItem"];
  }
  queuePlayer = self->_queuePlayer;
  if (queuePlayer)
  {
    v9 = [(SPProtoAudioFileQueuePlayer *)queuePlayer dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"queuePlayer"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_asset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queuePlayer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_asset)
  {
    objc_msgSend(v4, "setAsset:");
    id v4 = v5;
  }
  if (self->_playerItem)
  {
    objc_msgSend(v5, "setPlayerItem:");
    id v4 = v5;
  }
  if (self->_queuePlayer)
  {
    objc_msgSend(v5, "setQueuePlayer:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SPProtoAudioFilePlayerAsset *)self->_asset copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SPProtoAudioFilePlayerItem *)self->_playerItem copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SPProtoAudioFileQueuePlayer *)self->_queuePlayer copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((asset = self->_asset, !((unint64_t)asset | v4[1]))
     || -[SPProtoAudioFilePlayerAsset isEqual:](asset, "isEqual:"))
    && ((playerItem = self->_playerItem, !((unint64_t)playerItem | v4[2]))
     || -[SPProtoAudioFilePlayerItem isEqual:](playerItem, "isEqual:")))
  {
    queuePlayer = self->_queuePlayer;
    if ((unint64_t)queuePlayer | v4[3]) {
      char v8 = -[SPProtoAudioFileQueuePlayer isEqual:](queuePlayer, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SPProtoAudioFilePlayerAsset *)self->_asset hash];
  unint64_t v4 = [(SPProtoAudioFilePlayerItem *)self->_playerItem hash] ^ v3;
  return v4 ^ [(SPProtoAudioFileQueuePlayer *)self->_queuePlayer hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  asset = self->_asset;
  uint64_t v6 = v4[1];
  v11 = v4;
  if (asset)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoAudioFilePlayerAsset mergeFrom:](asset, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoAudioFilePlayerMessage setAsset:](self, "setAsset:");
  }
  unint64_t v4 = v11;
LABEL_7:
  playerItem = self->_playerItem;
  uint64_t v8 = v4[2];
  if (playerItem)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SPProtoAudioFilePlayerItem mergeFrom:](playerItem, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SPProtoAudioFilePlayerMessage setPlayerItem:](self, "setPlayerItem:");
  }
  unint64_t v4 = v11;
LABEL_13:
  queuePlayer = self->_queuePlayer;
  uint64_t v10 = v4[3];
  if (queuePlayer)
  {
    if (v10) {
      -[SPProtoAudioFileQueuePlayer mergeFrom:](queuePlayer, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SPProtoAudioFilePlayerMessage setQueuePlayer:](self, "setQueuePlayer:");
  }

  MEMORY[0x270F9A758]();
}

- (SPProtoAudioFilePlayerAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (SPProtoAudioFilePlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (SPProtoAudioFileQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void)setQueuePlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end