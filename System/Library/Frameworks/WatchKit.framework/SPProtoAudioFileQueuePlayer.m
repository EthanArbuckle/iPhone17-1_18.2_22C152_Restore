@interface SPProtoAudioFileQueuePlayer
- (BOOL)hasAdvanceToNextItem;
- (BOOL)hasAppendItem;
- (BOOL)hasDestroy;
- (BOOL)hasRemoveAllItems;
- (BOOL)hasRemoveItem;
- (BOOL)hasReplaceCurrentItem;
- (BOOL)hasSetCurrentItem;
- (BOOL)hasSetRate;
- (BOOL)hasSetStatus;
- (BOOL)hasUpsertWithItems;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SPProtoAudioFilePlayerStatus)setStatus;
- (SPProtoAudioFilePlayerUpdateContainedIdentifier)appendItem;
- (SPProtoAudioFilePlayerUpdateContainedIdentifier)removeItem;
- (SPProtoAudioFilePlayerUpdateContainedIdentifier)replaceCurrentItem;
- (SPProtoAudioFilePlayerUpdateContainedIdentifier)setCurrentItem;
- (SPProtoAudioFileQueuePlayerSetItems)upsertWithItems;
- (SPProtoAudioFileQueuePlayerSetRate)setRate;
- (SPProtoObjectMessage)advanceToNextItem;
- (SPProtoObjectMessage)destroy;
- (SPProtoObjectMessage)removeAllItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdvanceToNextItem:(id)a3;
- (void)setAppendItem:(id)a3;
- (void)setDestroy:(id)a3;
- (void)setRemoveAllItems:(id)a3;
- (void)setRemoveItem:(id)a3;
- (void)setReplaceCurrentItem:(id)a3;
- (void)setSetCurrentItem:(id)a3;
- (void)setSetRate:(id)a3;
- (void)setSetStatus:(id)a3;
- (void)setUpsertWithItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFileQueuePlayer

- (BOOL)hasUpsertWithItems
{
  return self->_upsertWithItems != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
}

- (BOOL)hasSetRate
{
  return self->_setRate != 0;
}

- (BOOL)hasReplaceCurrentItem
{
  return self->_replaceCurrentItem != 0;
}

- (BOOL)hasSetStatus
{
  return self->_setStatus != 0;
}

- (BOOL)hasAdvanceToNextItem
{
  return self->_advanceToNextItem != 0;
}

- (BOOL)hasAppendItem
{
  return self->_appendItem != 0;
}

- (BOOL)hasRemoveItem
{
  return self->_removeItem != 0;
}

- (BOOL)hasRemoveAllItems
{
  return self->_removeAllItems != 0;
}

- (BOOL)hasSetCurrentItem
{
  return self->_setCurrentItem != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFileQueuePlayer;
  v4 = [(SPProtoAudioFileQueuePlayer *)&v8 description];
  v5 = [(SPProtoAudioFileQueuePlayer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  upsertWithItems = self->_upsertWithItems;
  if (upsertWithItems)
  {
    v5 = [(SPProtoAudioFileQueuePlayerSetItems *)upsertWithItems dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"upsertWithItems"];
  }
  destroy = self->_destroy;
  if (destroy)
  {
    v7 = [(SPProtoObjectMessage *)destroy dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"destroy"];
  }
  setRate = self->_setRate;
  if (setRate)
  {
    v9 = [(SPProtoAudioFileQueuePlayerSetRate *)setRate dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"setRate"];
  }
  replaceCurrentItem = self->_replaceCurrentItem;
  if (replaceCurrentItem)
  {
    v11 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)replaceCurrentItem dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"replaceCurrentItem"];
  }
  setStatus = self->_setStatus;
  if (setStatus)
  {
    v13 = [(SPProtoAudioFilePlayerStatus *)setStatus dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"setStatus"];
  }
  advanceToNextItem = self->_advanceToNextItem;
  if (advanceToNextItem)
  {
    v15 = [(SPProtoObjectMessage *)advanceToNextItem dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"advanceToNextItem"];
  }
  appendItem = self->_appendItem;
  if (appendItem)
  {
    v17 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)appendItem dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"appendItem"];
  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    v19 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)removeItem dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"removeItem"];
  }
  removeAllItems = self->_removeAllItems;
  if (removeAllItems)
  {
    v21 = [(SPProtoObjectMessage *)removeAllItems dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"removeAllItems"];
  }
  setCurrentItem = self->_setCurrentItem;
  if (setCurrentItem)
  {
    v23 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)setCurrentItem dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"setCurrentItem"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFileQueuePlayerReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithItems)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_destroy)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setRate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_replaceCurrentItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_advanceToNextItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appendItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_removeItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_removeAllItems)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setCurrentItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithItems)
  {
    objc_msgSend(v4, "setUpsertWithItems:");
    id v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    id v4 = v5;
  }
  if (self->_setRate)
  {
    objc_msgSend(v5, "setSetRate:");
    id v4 = v5;
  }
  if (self->_replaceCurrentItem)
  {
    objc_msgSend(v5, "setReplaceCurrentItem:");
    id v4 = v5;
  }
  if (self->_setStatus)
  {
    objc_msgSend(v5, "setSetStatus:");
    id v4 = v5;
  }
  if (self->_advanceToNextItem)
  {
    objc_msgSend(v5, "setAdvanceToNextItem:");
    id v4 = v5;
  }
  if (self->_appendItem)
  {
    objc_msgSend(v5, "setAppendItem:");
    id v4 = v5;
  }
  if (self->_removeItem)
  {
    objc_msgSend(v5, "setRemoveItem:");
    id v4 = v5;
  }
  if (self->_removeAllItems)
  {
    objc_msgSend(v5, "setRemoveAllItems:");
    id v4 = v5;
  }
  if (self->_setCurrentItem)
  {
    objc_msgSend(v5, "setSetCurrentItem:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SPProtoAudioFileQueuePlayerSetItems *)self->_upsertWithItems copyWithZone:a3];
  v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(SPProtoObjectMessage *)self->_destroy copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(SPProtoAudioFileQueuePlayerSetRate *)self->_setRate copyWithZone:a3];
  v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_replaceCurrentItem copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(SPProtoAudioFilePlayerStatus *)self->_setStatus copyWithZone:a3];
  v15 = (void *)v5[9];
  v5[9] = v14;

  id v16 = [(SPProtoObjectMessage *)self->_advanceToNextItem copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  id v18 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_appendItem copyWithZone:a3];
  v19 = (void *)v5[2];
  v5[2] = v18;

  id v20 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_removeItem copyWithZone:a3];
  v21 = (void *)v5[5];
  v5[5] = v20;

  id v22 = [(SPProtoObjectMessage *)self->_removeAllItems copyWithZone:a3];
  v23 = (void *)v5[4];
  v5[4] = v22;

  id v24 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_setCurrentItem copyWithZone:a3];
  v25 = (void *)v5[7];
  v5[7] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  upsertWithItems = self->_upsertWithItems;
  if ((unint64_t)upsertWithItems | v4[10])
  {
    if (!-[SPProtoAudioFileQueuePlayerSetItems isEqual:](upsertWithItems, "isEqual:")) {
      goto LABEL_22;
    }
  }
  destroy = self->_destroy;
  if ((unint64_t)destroy | v4[3] && !-[SPProtoObjectMessage isEqual:](destroy, "isEqual:")) {
    goto LABEL_22;
  }
  if (((setRate = self->_setRate, !((unint64_t)setRate | v4[8]))
     || -[SPProtoAudioFileQueuePlayerSetRate isEqual:](setRate, "isEqual:"))
    && ((replaceCurrentItem = self->_replaceCurrentItem, !((unint64_t)replaceCurrentItem | v4[6]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](replaceCurrentItem, "isEqual:"))
    && ((setStatus = self->_setStatus, !((unint64_t)setStatus | v4[9]))
     || -[SPProtoAudioFilePlayerStatus isEqual:](setStatus, "isEqual:"))
    && ((advanceToNextItem = self->_advanceToNextItem, !((unint64_t)advanceToNextItem | v4[1]))
     || -[SPProtoObjectMessage isEqual:](advanceToNextItem, "isEqual:"))
    && ((appendItem = self->_appendItem, !((unint64_t)appendItem | v4[2]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](appendItem, "isEqual:"))
    && ((removeItem = self->_removeItem, !((unint64_t)removeItem | v4[5]))
     || -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](removeItem, "isEqual:"))
    && ((removeAllItems = self->_removeAllItems, !((unint64_t)removeAllItems | v4[4]))
     || -[SPProtoObjectMessage isEqual:](removeAllItems, "isEqual:")))
  {
    setCurrentItem = self->_setCurrentItem;
    if ((unint64_t)setCurrentItem | v4[7]) {
      char v15 = -[SPProtoAudioFilePlayerUpdateContainedIdentifier isEqual:](setCurrentItem, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SPProtoAudioFileQueuePlayerSetItems *)self->_upsertWithItems hash];
  unint64_t v4 = [(SPProtoObjectMessage *)self->_destroy hash] ^ v3;
  unint64_t v5 = [(SPProtoAudioFileQueuePlayerSetRate *)self->_setRate hash];
  unint64_t v6 = v4 ^ v5 ^ [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_replaceCurrentItem hash];
  unint64_t v7 = [(SPProtoAudioFilePlayerStatus *)self->_setStatus hash];
  unint64_t v8 = v7 ^ [(SPProtoObjectMessage *)self->_advanceToNextItem hash];
  unint64_t v9 = v6 ^ v8 ^ [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_appendItem hash];
  unint64_t v10 = [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_removeItem hash];
  unint64_t v11 = v10 ^ [(SPProtoObjectMessage *)self->_removeAllItems hash];
  return v9 ^ v11 ^ [(SPProtoAudioFilePlayerUpdateContainedIdentifier *)self->_setCurrentItem hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  upsertWithItems = self->_upsertWithItems;
  v25 = v4;
  uint64_t v6 = v4[10];
  if (upsertWithItems)
  {
    if (v6) {
      -[SPProtoAudioFileQueuePlayerSetItems mergeFrom:](upsertWithItems, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SPProtoAudioFileQueuePlayer setUpsertWithItems:](self, "setUpsertWithItems:");
  }
  destroy = self->_destroy;
  uint64_t v8 = v25[3];
  if (destroy)
  {
    if (v8) {
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SPProtoAudioFileQueuePlayer setDestroy:](self, "setDestroy:");
  }
  setRate = self->_setRate;
  uint64_t v10 = v25[8];
  if (setRate)
  {
    if (v10) {
      -[SPProtoAudioFileQueuePlayerSetRate mergeFrom:](setRate, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SPProtoAudioFileQueuePlayer setSetRate:](self, "setSetRate:");
  }
  replaceCurrentItem = self->_replaceCurrentItem;
  uint64_t v12 = v25[6];
  if (replaceCurrentItem)
  {
    if (v12) {
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](replaceCurrentItem, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SPProtoAudioFileQueuePlayer setReplaceCurrentItem:](self, "setReplaceCurrentItem:");
  }
  setStatus = self->_setStatus;
  uint64_t v14 = v25[9];
  if (setStatus)
  {
    if (v14) {
      -[SPProtoAudioFilePlayerStatus mergeFrom:](setStatus, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SPProtoAudioFileQueuePlayer setSetStatus:](self, "setSetStatus:");
  }
  advanceToNextItem = self->_advanceToNextItem;
  uint64_t v16 = v25[1];
  if (advanceToNextItem)
  {
    if (v16) {
      -[SPProtoObjectMessage mergeFrom:](advanceToNextItem, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SPProtoAudioFileQueuePlayer setAdvanceToNextItem:](self, "setAdvanceToNextItem:");
  }
  appendItem = self->_appendItem;
  uint64_t v18 = v25[2];
  if (appendItem)
  {
    if (v18) {
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](appendItem, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SPProtoAudioFileQueuePlayer setAppendItem:](self, "setAppendItem:");
  }
  removeItem = self->_removeItem;
  uint64_t v20 = v25[5];
  if (removeItem)
  {
    if (v20) {
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](removeItem, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SPProtoAudioFileQueuePlayer setRemoveItem:](self, "setRemoveItem:");
  }
  removeAllItems = self->_removeAllItems;
  uint64_t v22 = v25[4];
  if (removeAllItems)
  {
    if (v22) {
      -[SPProtoObjectMessage mergeFrom:](removeAllItems, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[SPProtoAudioFileQueuePlayer setRemoveAllItems:](self, "setRemoveAllItems:");
  }
  setCurrentItem = self->_setCurrentItem;
  uint64_t v24 = v25[7];
  if (setCurrentItem)
  {
    if (v24) {
      -[SPProtoAudioFilePlayerUpdateContainedIdentifier mergeFrom:](setCurrentItem, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[SPProtoAudioFileQueuePlayer setSetCurrentItem:](self, "setSetCurrentItem:");
  }
}

- (SPProtoAudioFileQueuePlayerSetItems)upsertWithItems
{
  return self->_upsertWithItems;
}

- (void)setUpsertWithItems:(id)a3
{
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
}

- (SPProtoAudioFileQueuePlayerSetRate)setRate
{
  return self->_setRate;
}

- (void)setSetRate:(id)a3
{
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)replaceCurrentItem
{
  return self->_replaceCurrentItem;
}

- (void)setReplaceCurrentItem:(id)a3
{
}

- (SPProtoAudioFilePlayerStatus)setStatus
{
  return self->_setStatus;
}

- (void)setSetStatus:(id)a3
{
}

- (SPProtoObjectMessage)advanceToNextItem
{
  return self->_advanceToNextItem;
}

- (void)setAdvanceToNextItem:(id)a3
{
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)appendItem
{
  return self->_appendItem;
}

- (void)setAppendItem:(id)a3
{
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (SPProtoObjectMessage)removeAllItems
{
  return self->_removeAllItems;
}

- (void)setRemoveAllItems:(id)a3
{
}

- (SPProtoAudioFilePlayerUpdateContainedIdentifier)setCurrentItem
{
  return self->_setCurrentItem;
}

- (void)setSetCurrentItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithItems, 0);
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_setRate, 0);
  objc_storeStrong((id *)&self->_setCurrentItem, 0);
  objc_storeStrong((id *)&self->_replaceCurrentItem, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_removeAllItems, 0);
  objc_storeStrong((id *)&self->_destroy, 0);
  objc_storeStrong((id *)&self->_appendItem, 0);

  objc_storeStrong((id *)&self->_advanceToNextItem, 0);
}

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:self setterSelector:sel_setQueuePlayer_];
}

@end