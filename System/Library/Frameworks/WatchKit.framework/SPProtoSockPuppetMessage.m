@interface SPProtoSockPuppetMessage
+ (id)sockPuppetMessageWithSubMessage:(id)a3 setterSelector:(SEL)a4;
- (BOOL)hasAudioFilePlayerMessage;
- (BOOL)hasPlist;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SPProtoAudioFilePlayerMessage)audioFilePlayerMessage;
- (SPProtoSockPuppetPlist)plist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioFilePlayerMessage:(id)a3;
- (void)setPlist:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SPProtoSockPuppetMessage

+ (id)sockPuppetMessageWithSubMessage:(id)a3 setterSelector:(SEL)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(SPProtoAudioFilePlayerMessage);
  ((void (*)(SPProtoAudioFilePlayerMessage *, SEL, id))[(SPProtoAudioFilePlayerMessage *)v6 methodForSelector:a4])(v6, a4, v5);

  v7 = objc_alloc_init(SPProtoSockPuppetMessage);
  [(SPProtoSockPuppetMessage *)v7 setAudioFilePlayerMessage:v6];

  return v7;
}

- (BOOL)hasPlist
{
  return self->_plist != 0;
}

- (BOOL)hasAudioFilePlayerMessage
{
  return self->_audioFilePlayerMessage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SPProtoSockPuppetMessage;
  v4 = [(SPProtoSockPuppetMessage *)&v8 description];
  id v5 = [(SPProtoSockPuppetMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  plist = self->_plist;
  if (plist)
  {
    id v5 = [(SPProtoSockPuppetPlist *)plist dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"plist"];
  }
  audioFilePlayerMessage = self->_audioFilePlayerMessage;
  if (audioFilePlayerMessage)
  {
    v7 = [(SPProtoAudioFilePlayerMessage *)audioFilePlayerMessage dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"audioFilePlayerMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoSockPuppetMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_plist)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_audioFilePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_plist)
  {
    objc_msgSend(v4, "setPlist:");
    id v4 = v5;
  }
  if (self->_audioFilePlayerMessage)
  {
    objc_msgSend(v5, "setAudioFilePlayerMessage:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SPProtoSockPuppetPlist *)self->_plist copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SPProtoAudioFilePlayerMessage *)self->_audioFilePlayerMessage copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((plist = self->_plist, !((unint64_t)plist | v4[2]))
     || -[SPProtoSockPuppetPlist isEqual:](plist, "isEqual:")))
  {
    audioFilePlayerMessage = self->_audioFilePlayerMessage;
    if ((unint64_t)audioFilePlayerMessage | v4[1]) {
      char v7 = -[SPProtoAudioFilePlayerMessage isEqual:](audioFilePlayerMessage, "isEqual:");
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
  unint64_t v3 = [(SPProtoSockPuppetPlist *)self->_plist hash];
  return [(SPProtoAudioFilePlayerMessage *)self->_audioFilePlayerMessage hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  plist = self->_plist;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (plist)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoSockPuppetPlist mergeFrom:](plist, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SPProtoSockPuppetMessage setPlist:](self, "setPlist:");
  }
  id v4 = v9;
LABEL_7:
  audioFilePlayerMessage = self->_audioFilePlayerMessage;
  uint64_t v8 = v4[1];
  if (audioFilePlayerMessage)
  {
    if (v8) {
      -[SPProtoAudioFilePlayerMessage mergeFrom:](audioFilePlayerMessage, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SPProtoSockPuppetMessage setAudioFilePlayerMessage:](self, "setAudioFilePlayerMessage:");
  }

  MEMORY[0x270F9A758]();
}

- (SPProtoSockPuppetPlist)plist
{
  return self->_plist;
}

- (void)setPlist:(id)a3
{
}

- (SPProtoAudioFilePlayerMessage)audioFilePlayerMessage
{
  return self->_audioFilePlayerMessage;
}

- (void)setAudioFilePlayerMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);

  objc_storeStrong((id *)&self->_audioFilePlayerMessage, 0);
}

@end