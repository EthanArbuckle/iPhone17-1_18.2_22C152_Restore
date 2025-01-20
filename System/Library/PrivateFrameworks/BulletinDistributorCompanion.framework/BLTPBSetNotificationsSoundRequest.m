@interface BLTPBSetNotificationsSoundRequest
- (BOOL)hasSectionID;
- (BOOL)hasSound;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)soundAsString:(int)a3;
- (int)StringAsSound:(id)a3;
- (int)sound;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSound:(BOOL)a3;
- (void)setSectionID:(id)a3;
- (void)setSound:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetNotificationsSoundRequest

- (int)sound
{
  if (*(unsigned char *)&self->_has) {
    return self->_sound;
  }
  else {
    return 0;
  }
}

- (void)setSound:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sound = a3;
}

- (void)setHasSound:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSound
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)soundAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"On";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Off";
  }
  return v4;
}

- (int)StringAsSound:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"On"];
  }

  return v4;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetNotificationsSoundRequest;
  int v4 = [(BLTPBSetNotificationsSoundRequest *)&v8 description];
  v5 = [(BLTPBSetNotificationsSoundRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int sound = self->_sound;
    if (sound)
    {
      if (sound == 1)
      {
        v5 = @"On";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sound);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"Off";
    }
    [v3 setObject:v5 forKey:@"sound"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetNotificationsSoundRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_sound;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_sectionID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSectionID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sound;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sectionID copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sound != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](sectionID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sound;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_sectionID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_int sound = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[BLTPBSetNotificationsSoundRequest setSectionID:](self, "setSectionID:");
    id v4 = v5;
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end