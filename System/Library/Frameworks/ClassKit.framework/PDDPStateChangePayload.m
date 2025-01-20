@interface PDDPStateChangePayload
+ (Class)infoType;
- (BOOL)hasAssetUrl;
- (BOOL)hasDomain;
- (BOOL)hasDomainVersion;
- (BOOL)hasFlags;
- (BOOL)hasMeta;
- (BOOL)hasNote;
- (BOOL)hasObjectId;
- (BOOL)hasParticipants;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)infos;
- (NSString)assetUrl;
- (NSString)note;
- (NSString)objectId;
- (PDDPStateChangeMeta)meta;
- (PDDPStateChangeParticipants)participants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)infoAtIndex:(unint64_t)a3;
- (int)domain;
- (int)domainVersion;
- (int)state;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)infosCount;
- (void)addInfo:(id)a3;
- (void)clearInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetUrl:(id)a3;
- (void)setDomain:(int)a3;
- (void)setDomainVersion:(int)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasDomainVersion:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setInfos:(id)a3;
- (void)setMeta:(id)a3;
- (void)setNote:(id)a3;
- (void)setObjectId:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangePayload

- (BOOL)hasParticipants
{
  return self->_participants != 0;
}

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDomain
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDomainVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_domainVersion = a3;
}

- (void)setHasDomainVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDomainVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasAssetUrl
{
  return self->_assetUrl != 0;
}

- (void)clearInfos
{
}

- (void)addInfo:(id)a3
{
  id v4 = a3;
  infos = self->_infos;
  id v8 = v4;
  if (!infos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_infos;
    self->_infos = v6;

    id v4 = v8;
    infos = self->_infos;
  }
  [(NSMutableArray *)infos addObject:v4];
}

- (unint64_t)infosCount
{
  return (unint64_t)[(NSMutableArray *)self->_infos count];
}

- (id)infoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_infos objectAtIndex:a3];
}

+ (Class)infoType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasObjectId
{
  return self->_objectId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangePayload;
  char v3 = [(PDDPStateChangePayload *)&v7 description];
  id v4 = [(PDDPStateChangePayload *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  participants = self->_participants;
  if (participants)
  {
    v5 = [(PDDPStateChangeParticipants *)participants dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"participants"];
  }
  meta = self->_meta;
  if (meta)
  {
    objc_super v7 = [(PDDPStateChangeMeta *)meta dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"meta"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v21 = +[NSNumber numberWithInt:self->_domain];
    [v3 setObject:v21 forKey:@"domain"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v22 = +[NSNumber numberWithInt:self->_domainVersion];
  [v3 setObject:v22 forKey:@"domain_version"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_30:
  v23 = +[NSNumber numberWithInt:self->_state];
  [v3 setObject:v23 forKey:@"state"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_flags];
    [v3 setObject:v9 forKey:@"flags"];
  }
LABEL_10:
  note = self->_note;
  if (note) {
    [v3 setObject:note forKey:@"note"];
  }
  assetUrl = self->_assetUrl;
  if (assetUrl) {
    [v3 setObject:assetUrl forKey:@"asset_url"];
  }
  if ([(NSMutableArray *)self->_infos count])
  {
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_infos, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v13 = self->_infos;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"info"];
  }
  objectId = self->_objectId;
  if (objectId) {
    [v3 setObject:objectId forKey:@"object_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AAE60((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_participants) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_meta) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_9:
  }
    PBDataWriterWriteUint64Field();
LABEL_10:
  if (self->_note) {
    PBDataWriterWriteStringField();
  }
  if (self->_assetUrl) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_infos;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_objectId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_participants)
  {
    objc_msgSend(v4, "setParticipants:");
    id v4 = v10;
  }
  if (self->_meta)
  {
    objc_msgSend(v10, "setMeta:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_domain;
    *((unsigned char *)v4 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 7) = self->_domainVersion;
  *((unsigned char *)v4 + 76) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  *((_DWORD *)v4 + 18) = self->_state;
  *((unsigned char *)v4 + 76) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    *((void *)v4 + 1) = self->_flags;
    *((unsigned char *)v4 + 76) |= 1u;
  }
LABEL_10:
  if (self->_note) {
    objc_msgSend(v10, "setNote:");
  }
  if (self->_assetUrl) {
    objc_msgSend(v10, "setAssetUrl:");
  }
  if ([(PDDPStateChangePayload *)self infosCount])
  {
    [v10 clearInfos];
    unint64_t v6 = [(PDDPStateChangePayload *)self infosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPStateChangePayload *)self infoAtIndex:i];
        [v10 addInfo:v9];
      }
    }
  }
  if (self->_objectId) {
    objc_msgSend(v10, "setObjectId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPStateChangeParticipants *)self->_participants copyWithZone:a3];
  unint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  id v8 = [(PDDPStateChangeMeta *)self->_meta copyWithZone:a3];
  uint64_t v9 = (void *)v5[5];
  v5[5] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_domain;
    *((unsigned char *)v5 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_domainVersion;
  *((unsigned char *)v5 + 76) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  *((_DWORD *)v5 + 18) = self->_state;
  *((unsigned char *)v5 + 76) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5[1] = self->_flags;
    *((unsigned char *)v5 + 76) |= 1u;
  }
LABEL_6:
  id v11 = [(NSString *)self->_note copyWithZone:a3];
  long long v12 = (void *)v5[6];
  v5[6] = v11;

  id v13 = [(NSString *)self->_assetUrl copyWithZone:a3];
  long long v14 = (void *)v5[2];
  v5[2] = v13;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = self->_infos;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [v5 addInfo:v20];
      }
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  id v21 = [(NSString *)self->_objectId copyWithZone:a3];
  v22 = (void *)v5[7];
  v5[7] = v21;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  participants = self->_participants;
  if ((unint64_t)participants | *((void *)v4 + 8))
  {
    if (!-[PDDPStateChangeParticipants isEqual:](participants, "isEqual:")) {
      goto LABEL_34;
    }
  }
  meta = self->_meta;
  if ((unint64_t)meta | *((void *)v4 + 5))
  {
    if (!-[PDDPStateChangeMeta isEqual:](meta, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_domain != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_34:
    unsigned __int8 v11 = 0;
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_domainVersion != *((_DWORD *)v4 + 7)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_state != *((_DWORD *)v4 + 18)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_flags != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_34;
  }
  note = self->_note;
  if ((unint64_t)note | *((void *)v4 + 6) && !-[NSString isEqual:](note, "isEqual:")) {
    goto LABEL_34;
  }
  assetUrl = self->_assetUrl;
  if ((unint64_t)assetUrl | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](assetUrl, "isEqual:")) {
      goto LABEL_34;
    }
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](infos, "isEqual:")) {
      goto LABEL_34;
    }
  }
  objectId = self->_objectId;
  if ((unint64_t)objectId | *((void *)v4 + 7)) {
    unsigned __int8 v11 = -[NSString isEqual:](objectId, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPStateChangeParticipants *)self->_participants hash];
  unint64_t v4 = [(PDDPStateChangeMeta *)self->_meta hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_domain;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_domainVersion;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v8 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_state;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v8 = 2654435761u * self->_flags;
LABEL_10:
  unint64_t v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_note hash];
  NSUInteger v10 = [(NSString *)self->_assetUrl hash];
  unint64_t v11 = v10 ^ (unint64_t)[(NSMutableArray *)self->_infos hash];
  return v9 ^ v11 ^ [(NSString *)self->_objectId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  uint64_t v6 = *((void *)v4 + 8);
  if (participants)
  {
    if (v6) {
      -[PDDPStateChangeParticipants mergeFrom:](participants, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPStateChangePayload setParticipants:](self, "setParticipants:");
  }
  meta = self->_meta;
  uint64_t v8 = *((void *)v4 + 5);
  if (meta)
  {
    if (v8) {
      -[PDDPStateChangeMeta mergeFrom:](meta, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPStateChangePayload setMeta:](self, "setMeta:");
  }
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 2) != 0)
  {
    self->_domain = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 76);
    if ((v9 & 4) == 0)
    {
LABEL_13:
      if ((v9 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_domainVersion = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 8) == 0)
  {
LABEL_14:
    if ((v9 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_32:
  self->_state = *((_DWORD *)v4 + 18);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 76))
  {
LABEL_15:
    self->_flags = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_16:
  if (*((void *)v4 + 6)) {
    -[PDDPStateChangePayload setNote:](self, "setNote:");
  }
  if (*((void *)v4 + 2)) {
    -[PDDPStateChangePayload setAssetUrl:](self, "setAssetUrl:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[PDDPStateChangePayload addInfo:](self, "addInfo:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 7)) {
    -[PDDPStateChangePayload setObjectId:](self, "setObjectId:");
  }
}

- (PDDPStateChangeParticipants)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (PDDPStateChangeMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
}

- (int)domain
{
  return self->_domain;
}

- (int)domainVersion
{
  return self->_domainVersion;
}

- (int)state
{
  return self->_state;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSString)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
}

- (NSMutableArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
}

- (NSString)objectId
{
  return self->_objectId;
}

- (void)setObjectId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_infos, 0);

  objc_storeStrong((id *)&self->_assetUrl, 0);
}

@end