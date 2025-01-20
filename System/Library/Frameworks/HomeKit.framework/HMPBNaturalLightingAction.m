@interface HMPBNaturalLightingAction
- (BOOL)hasLightProfileUUID;
- (BOOL)hasNaturalLightingEnabled;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)naturalLightingEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)lightProfileUUID;
- (NSData)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNaturalLightingEnabled:(BOOL)a3;
- (void)setLightProfileUUID:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBNaturalLightingAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_lightProfileUUID, 0);
}

- (void)setLightProfileUUID:(id)a3
{
}

- (NSData)lightProfileUUID
{
  return self->_lightProfileUUID;
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)setUuid:(id)a3
{
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[HMPBNaturalLightingAction setUuid:](self, "setUuid:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_naturalLightingEnabled = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[HMPBNaturalLightingAction setLightProfileUUID:](self, "setLightProfileUUID:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_naturalLightingEnabled;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSData *)self->_lightProfileUUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_naturalLightingEnabled)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  lightProfileUUID = self->_lightProfileUUID;
  if ((unint64_t)lightProfileUUID | *((void *)v4 + 1)) {
    char v6 = -[NSData isEqual:](lightProfileUUID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_naturalLightingEnabled;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_lightProfileUUID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_naturalLightingEnabled;
    v4[28] |= 1u;
  }
  if (self->_lightProfileUUID)
  {
    objc_msgSend(v5, "setLightProfileUUID:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_lightProfileUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBNaturalLightingActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_naturalLightingEnabled];
    [v4 setObject:v6 forKey:@"naturalLightingEnabled"];
  }
  lightProfileUUID = self->_lightProfileUUID;
  if (lightProfileUUID) {
    [v4 setObject:lightProfileUUID forKey:@"lightProfileUUID"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBNaturalLightingAction;
  id v4 = [(HMPBNaturalLightingAction *)&v8 description];
  id v5 = [(HMPBNaturalLightingAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLightProfileUUID
{
  return self->_lightProfileUUID != 0;
}

- (BOOL)hasNaturalLightingEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNaturalLightingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_naturalLightingEnabled = a3;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

@end