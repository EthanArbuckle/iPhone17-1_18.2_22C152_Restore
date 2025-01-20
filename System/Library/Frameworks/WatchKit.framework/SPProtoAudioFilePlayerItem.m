@interface SPProtoAudioFilePlayerItem
- (BOOL)hasDestroy;
- (BOOL)hasGetCurrentTime;
- (BOOL)hasNotifyDidPlayToEndTime;
- (BOOL)hasNotifyFailedToPlayToEndTime;
- (BOOL)hasNotifyTimeJumped;
- (BOOL)hasSetItemCurrentTime;
- (BOOL)hasSetStatus;
- (BOOL)hasUpsertWithAsset;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SPProtoAudioFilePlayerItemSetCurrentTime)setItemCurrentTime;
- (SPProtoAudioFilePlayerStatus)setStatus;
- (SPProtoAudioFilePlayerUpdateContainedIdentifier)upsertWithAsset;
- (SPProtoObjectMessage)destroy;
- (SPProtoObjectMessage)getCurrentTime;
- (SPProtoObjectMessage)notifyDidPlayToEndTime;
- (SPProtoObjectMessage)notifyFailedToPlayToEndTime;
- (SPProtoObjectMessage)notifyTimeJumped;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestroy:(id)a3;
- (void)setGetCurrentTime:(id)a3;
- (void)setNotifyDidPlayToEndTime:(id)a3;
- (void)setNotifyFailedToPlayToEndTime:(id)a3;
- (void)setNotifyTimeJumped:(id)a3;
- (void)setSetItemCurrentTime:(id)a3;
- (void)setSetStatus:(id)a3;
- (void)setUpsertWithAsset:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerItem

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:self setterSelector:sel_setPlayerItem_];
}

- (BOOL)hasUpsertWithAsset
{
  return self->_upsertWithAsset != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
}

- (BOOL)hasSetStatus
{
  return self->_setStatus != 0;
}

- (BOOL)hasGetCurrentTime
{
  return self->_getCurrentTime != 0;
}

- (BOOL)hasNotifyTimeJumped
{
  return self->_notifyTimeJumped != 0;
}

- (BOOL)hasNotifyDidPlayToEndTime
{
  return self->_notifyDidPlayToEndTime != 0;
}

- (BOOL)hasNotifyFailedToPlayToEndTime
{
  return self->_notifyFailedToPlayToEndTime != 0;
}

- (BOOL)hasSetItemCurrentTime
{
  return self->_setItemCurrentTime != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerItem;
  v4 = [(SPProtoAudioFilePlayerItem *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  upsertWithAsset = self->_upsertWithAsset;
  if (upsertWithAsset)
  {
    v5 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)upsertWithAsset dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"upsertWithAsset"];
  }
  destroy = self->_destroy;
  if (destroy)
  {
    v7 = [(SPProtoObjectMessage *)destroy dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"destroy"];
  }
  setStatus = self->_setStatus;
  if (setStatus)
  {
    v9 = [(SPProtoAudioFilePlayerStatus *)setStatus dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"setStatus"];
  }
  getCurrentTime = self->_getCurrentTime;
  if (getCurrentTime)
  {
    v11 = [(SPProtoObjectMessage *)getCurrentTime dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"getCurrentTime"];
  }
  notifyTimeJumped = self->_notifyTimeJumped;
  if (notifyTimeJumped)
  {
    v13 = [(SPProtoObjectMessage *)notifyTimeJumped dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"notifyTimeJumped"];
  }
  notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime;
  if (notifyDidPlayToEndTime)
  {
    v15 = [(SPProtoObjectMessage *)notifyDidPlayToEndTime dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"notifyDidPlayToEndTime"];
  }
  notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime;
  if (notifyFailedToPlayToEndTime)
  {
    v17 = [(SPProtoObjectMessage *)notifyFailedToPlayToEndTime dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"notifyFailedToPlayToEndTime"];
  }
  setItemCurrentTime = self->_setItemCurrentTime;
  if (setItemCurrentTime)
  {
    v19 = [(SPProtoAudioFilePlayerItemSetCurrentTime *)setItemCurrentTime dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"setItemCurrentTime"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithAsset)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_destroy)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_getCurrentTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notifyTimeJumped)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notifyDidPlayToEndTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notifyFailedToPlayToEndTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setItemCurrentTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithAsset)
  {
    objc_msgSend(v4, "setUpsertWithAsset:");
    id v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    id v4 = v5;
  }
  if (self->_setStatus)
  {
    objc_msgSend(v5, "setSetStatus:");
    id v4 = v5;
  }
  if (self->_getCurrentTime)
  {
    objc_msgSend(v5, "setGetCurrentTime:");
    id v4 = v5;
  }
  if (self->_notifyTimeJumped)
  {
    objc_msgSend(v5, "setNotifyTimeJumped:");
    id v4 = v5;
  }
  if (self->_notifyDidPlayToEndTime)
  {
    objc_msgSend(v5, "setNotifyDidPlayToEndTime:");
    id v4 = v5;
  }
  if (self->_notifyFailedToPlayToEndTime)
  {
    objc_msgSend(v5, "setNotifyFailedToPlayToEndTime:");
    id v4 = v5;
  }
  if (self->_setItemCurrentTime)
  {
    objc_msgSend(v5, "setSetItemCurrentTime:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_upsertWithAsset copyWithZone:a3];
  v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(SPProtoObjectMessage *)self->_destroy copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(SPProtoAudioFilePlayerStatus *)self->_setStatus copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(SPProtoObjectMessage *)self->_getCurrentTime copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(SPProtoObjectMessage *)self->_notifyTimeJumped copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(SPProtoObjectMessage *)self->_notifyDidPlayToEndTime copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  id v18 = [(SPProtoObjectMessage *)self->_notifyFailedToPlayToEndTime copyWithZone:a3];
  v19 = (void *)v5[4];
  v5[4] = v18;

  id v20 = [(SPProtoAudioFilePlayerItemSetCurrentTime *)self->_setItemCurrentTime copyWithZone:a3];
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((upsertWithAsset = self->_upsertWithAsset, !((unint64_t)upsertWithAsset | v4[8]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](upsertWithAsset, "isEqual:"))
    && ((destroy = self->_destroy, !((unint64_t)destroy | v4[1]))
     || -[SPProtoObjectMessage isEqual:](destroy, "isEqual:"))
    && ((setStatus = self->_setStatus, !((unint64_t)setStatus | v4[7]))
     || -[SPProtoAudioFilePlayerStatus isEqual:](setStatus, "isEqual:"))
    && ((getCurrentTime = self->_getCurrentTime, !((unint64_t)getCurrentTime | v4[2]))
     || -[SPProtoObjectMessage isEqual:](getCurrentTime, "isEqual:"))
    && ((notifyTimeJumped = self->_notifyTimeJumped, !((unint64_t)notifyTimeJumped | v4[5]))
     || -[SPProtoObjectMessage isEqual:](notifyTimeJumped, "isEqual:"))
    && ((notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime, !((unint64_t)notifyDidPlayToEndTime | v4[3]))
     || -[SPProtoObjectMessage isEqual:](notifyDidPlayToEndTime, "isEqual:"))
    && ((notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime,
         !((unint64_t)notifyFailedToPlayToEndTime | v4[4]))
     || -[SPProtoObjectMessage isEqual:](notifyFailedToPlayToEndTime, "isEqual:")))
  {
    setItemCurrentTime = self->_setItemCurrentTime;
    if ((unint64_t)setItemCurrentTime | v4[6]) {
      char v13 = -[SPProtoAudioFilePlayerItemSetCurrentTime isEqual:](setItemCurrentTime, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_upsertWithAsset hash];
  unint64_t v4 = [(SPProtoObjectMessage *)self->_destroy hash] ^ v3;
  unint64_t v5 = [(SPProtoAudioFilePlayerStatus *)self->_setStatus hash];
  unint64_t v6 = v4 ^ v5 ^ [(SPProtoObjectMessage *)self->_getCurrentTime hash];
  unint64_t v7 = [(SPProtoObjectMessage *)self->_notifyTimeJumped hash];
  unint64_t v8 = v7 ^ [(SPProtoObjectMessage *)self->_notifyDidPlayToEndTime hash];
  unint64_t v9 = v6 ^ v8 ^ [(SPProtoObjectMessage *)self->_notifyFailedToPlayToEndTime hash];
  return v9 ^ [(SPProtoAudioFilePlayerItemSetCurrentTime *)self->_setItemCurrentTime hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  upsertWithAsset = self->_upsertWithAsset;
  v21 = v4;
  uint64_t v6 = v4[8];
  if (upsertWithAsset)
  {
    if (v6) {
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](upsertWithAsset, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SPProtoAudioFilePlayerItem setUpsertWithAsset:](self, "setUpsertWithAsset:");
  }
  destroy = self->_destroy;
  uint64_t v8 = v21[1];
  if (destroy)
  {
    if (v8) {
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SPProtoAudioFilePlayerItem setDestroy:](self, "setDestroy:");
  }
  setStatus = self->_setStatus;
  uint64_t v10 = v21[7];
  if (setStatus)
  {
    if (v10) {
      -[SPProtoAudioFilePlayerStatus mergeFrom:](setStatus, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SPProtoAudioFilePlayerItem setSetStatus:](self, "setSetStatus:");
  }
  getCurrentTime = self->_getCurrentTime;
  uint64_t v12 = v21[2];
  if (getCurrentTime)
  {
    if (v12) {
      -[SPProtoObjectMessage mergeFrom:](getCurrentTime, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SPProtoAudioFilePlayerItem setGetCurrentTime:](self, "setGetCurrentTime:");
  }
  notifyTimeJumped = self->_notifyTimeJumped;
  uint64_t v14 = v21[5];
  if (notifyTimeJumped)
  {
    if (v14) {
      -[SPProtoObjectMessage mergeFrom:](notifyTimeJumped, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SPProtoAudioFilePlayerItem setNotifyTimeJumped:](self, "setNotifyTimeJumped:");
  }
  notifyDidPlayToEndTime = self->_notifyDidPlayToEndTime;
  uint64_t v16 = v21[3];
  if (notifyDidPlayToEndTime)
  {
    if (v16) {
      -[SPProtoObjectMessage mergeFrom:](notifyDidPlayToEndTime, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SPProtoAudioFilePlayerItem setNotifyDidPlayToEndTime:](self, "setNotifyDidPlayToEndTime:");
  }
  notifyFailedToPlayToEndTime = self->_notifyFailedToPlayToEndTime;
  uint64_t v18 = v21[4];
  if (notifyFailedToPlayToEndTime)
  {
    if (v18) {
      -[SPProtoObjectMessage mergeFrom:](notifyFailedToPlayToEndTime, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SPProtoAudioFilePlayerItem setNotifyFailedToPlayToEndTime:](self, "setNotifyFailedToPlayToEndTime:");
  }
  setItemCurrentTime = self->_setItemCurrentTime;
  uint64_t v20 = v21[6];
  if (setItemCurrentTime)
  {
    if (v20) {
      -[SPProtoAudioFilePlayerItemSetCurrentTime mergeFrom:](setItemCurrentTime, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SPProtoAudioFilePlayerItem setSetItemCurrentTime:](self, "setSetItemCurrentTime:");
  }
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)upsertWithAsset
{
  return self->_upsertWithAsset;
}

- (void)setUpsertWithAsset:(id)a3
{
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
}

- (SPProtoAudioFilePlayerStatus)setStatus
{
  return self->_setStatus;
}

- (void)setSetStatus:(id)a3
{
}

- (SPProtoObjectMessage)getCurrentTime
{
  return self->_getCurrentTime;
}

- (void)setGetCurrentTime:(id)a3
{
}

- (SPProtoObjectMessage)notifyTimeJumped
{
  return self->_notifyTimeJumped;
}

- (void)setNotifyTimeJumped:(id)a3
{
}

- (SPProtoObjectMessage)notifyDidPlayToEndTime
{
  return self->_notifyDidPlayToEndTime;
}

- (void)setNotifyDidPlayToEndTime:(id)a3
{
}

- (SPProtoObjectMessage)notifyFailedToPlayToEndTime
{
  return self->_notifyFailedToPlayToEndTime;
}

- (void)setNotifyFailedToPlayToEndTime:(id)a3
{
}

- (SPProtoAudioFilePlayerItemSetCurrentTime)setItemCurrentTime
{
  return self->_setItemCurrentTime;
}

- (void)setSetItemCurrentTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithAsset, 0);
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_setItemCurrentTime, 0);
  objc_storeStrong((id *)&self->_notifyTimeJumped, 0);
  objc_storeStrong((id *)&self->_notifyFailedToPlayToEndTime, 0);
  objc_storeStrong((id *)&self->_notifyDidPlayToEndTime, 0);
  objc_storeStrong((id *)&self->_getCurrentTime, 0);

  objc_storeStrong((id *)&self->_destroy, 0);
}

@end