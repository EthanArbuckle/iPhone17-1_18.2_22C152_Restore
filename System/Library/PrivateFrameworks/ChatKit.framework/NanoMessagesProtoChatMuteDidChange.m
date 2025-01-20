@interface NanoMessagesProtoChatMuteDidChange
- (BOOL)hasChatGUID;
- (BOOL)hasUnmuteTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)chatGUID;
- (double)unmuteTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChatGUID:(id)a3;
- (void)setHasUnmuteTime:(BOOL)a3;
- (void)setUnmuteTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NanoMessagesProtoChatMuteDidChange

- (BOOL)hasChatGUID
{
  return self->_chatGUID != 0;
}

- (void)setUnmuteTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unmuteTime = a3;
}

- (void)setHasUnmuteTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnmuteTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NanoMessagesProtoChatMuteDidChange;
  v3 = [(NanoMessagesProtoChatMuteDidChange *)&v7 description];
  v4 = [(NanoMessagesProtoChatMuteDidChange *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  chatGUID = self->_chatGUID;
  if (chatGUID) {
    [v3 setObject:chatGUID forKey:@"chatGUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithDouble:self->_unmuteTime];
    [v4 setObject:v6 forKey:@"unmuteTime"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NanoMessagesProtoChatMuteDidChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_chatGUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_chatGUID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setChatGUID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_unmuteTime;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_chatGUID copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_unmuteTime;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  chatGUID = self->_chatGUID;
  if ((unint64_t)chatGUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](chatGUID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_unmuteTime == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_chatGUID hash];
  if (*(unsigned char *)&self->_has)
  {
    double unmuteTime = self->_unmuteTime;
    double v6 = -unmuteTime;
    if (unmuteTime >= 0.0) {
      double v6 = self->_unmuteTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[NanoMessagesProtoChatMuteDidChange setChatGUID:](self, "setChatGUID:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[3])
  {
    self->_double unmuteTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (double)unmuteTime
{
  return self->_unmuteTime;
}

- (void).cxx_destruct
{
}

@end