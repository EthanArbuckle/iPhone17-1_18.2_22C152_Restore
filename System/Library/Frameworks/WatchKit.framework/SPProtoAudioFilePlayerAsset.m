@interface SPProtoAudioFilePlayerAsset
- (BOOL)hasDestroy;
- (BOOL)hasUpsertWithMetaData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SPProtoAudioFilePlayerAssetUpdateMetaData)upsertWithMetaData;
- (SPProtoObjectMessage)destroy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sockPuppetMessage;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestroy:(id)a3;
- (void)setUpsertWithMetaData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoAudioFilePlayerAsset

- (id)sockPuppetMessage
{
  return +[SPProtoSockPuppetMessage sockPuppetMessageWithSubMessage:self setterSelector:sel_setAsset_];
}

- (BOOL)hasUpsertWithMetaData
{
  return self->_upsertWithMetaData != 0;
}

- (BOOL)hasDestroy
{
  return self->_destroy != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoAudioFilePlayerAsset;
  v4 = [(SPProtoAudioFilePlayerAsset *)&v8 description];
  v5 = [(SPProtoAudioFilePlayerAsset *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  upsertWithMetaData = self->_upsertWithMetaData;
  if (upsertWithMetaData)
  {
    v5 = [(SPProtoAudioFilePlayerAssetUpdateMetaData *)upsertWithMetaData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"upsertWithMetaData"];
  }
  destroy = self->_destroy;
  if (destroy)
  {
    v7 = [(SPProtoObjectMessage *)destroy dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"destroy"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoAudioFilePlayerAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithMetaData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_destroy)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_upsertWithMetaData)
  {
    objc_msgSend(v4, "setUpsertWithMetaData:");
    id v4 = v5;
  }
  if (self->_destroy)
  {
    objc_msgSend(v5, "setDestroy:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SPProtoAudioFilePlayerAssetUpdateMetaData *)self->_upsertWithMetaData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SPProtoObjectMessage *)self->_destroy copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((upsertWithMetaData = self->_upsertWithMetaData, !((unint64_t)upsertWithMetaData | v4[2]))
     || -[SPProtoAudioFilePlayerAssetUpdateMetaData isEqual:](upsertWithMetaData, "isEqual:")))
  {
    destroy = self->_destroy;
    if ((unint64_t)destroy | v4[1]) {
      char v7 = -[SPProtoObjectMessage isEqual:](destroy, "isEqual:");
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
  unint64_t v3 = [(SPProtoAudioFilePlayerAssetUpdateMetaData *)self->_upsertWithMetaData hash];
  return [(SPProtoObjectMessage *)self->_destroy hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  upsertWithMetaData = self->_upsertWithMetaData;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (upsertWithMetaData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoAudioFilePlayerAssetUpdateMetaData mergeFrom:](upsertWithMetaData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoAudioFilePlayerAsset setUpsertWithMetaData:](self, "setUpsertWithMetaData:");
  }
  id v4 = v9;
LABEL_7:
  destroy = self->_destroy;
  uint64_t v8 = v4[1];
  if (destroy)
  {
    if (v8) {
      -[SPProtoObjectMessage mergeFrom:](destroy, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SPProtoAudioFilePlayerAsset setDestroy:](self, "setDestroy:");
  }

  MEMORY[0x270F9A758]();
}

- (SPProtoAudioFilePlayerAssetUpdateMetaData)upsertWithMetaData
{
  return self->_upsertWithMetaData;
}

- (void)setUpsertWithMetaData:(id)a3
{
}

- (SPProtoObjectMessage)destroy
{
  return self->_destroy;
}

- (void)setDestroy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsertWithMetaData, 0);

  objc_storeStrong((id *)&self->_destroy, 0);
}

@end