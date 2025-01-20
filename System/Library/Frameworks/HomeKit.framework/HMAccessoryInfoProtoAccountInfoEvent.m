@interface HMAccessoryInfoProtoAccountInfoEvent
- (BOOL)hasAaAltDSID;
- (BOOL)hasAmsAltDSID;
- (BOOL)hasSignedIn;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)signedIn;
- (NSString)aaAltDSID;
- (NSString)amsAltDSID;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAaAltDSID:(id)a3;
- (void)setAmsAltDSID:(id)a3;
- (void)setHasSignedIn:(BOOL)a3;
- (void)setSignedIn:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoAccountInfoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_amsAltDSID, 0);

  objc_storeStrong((id *)&self->_aaAltDSID, 0);
}

- (BOOL)signedIn
{
  return self->_signedIn;
}

- (void)setAmsAltDSID:(id)a3
{
}

- (NSString)amsAltDSID
{
  return self->_amsAltDSID;
}

- (void)setAaAltDSID:(id)a3
{
}

- (NSString)aaAltDSID
{
  return self->_aaAltDSID;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setUsername:](self, "setUsername:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setAaAltDSID:](self, "setAaAltDSID:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setAmsAltDSID:](self, "setAmsAltDSID:");
    v4 = v5;
  }
  if (v4[36])
  {
    self->_signedIn = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_username hash];
  NSUInteger v4 = [(NSString *)self->_aaAltDSID hash];
  NSUInteger v5 = [(NSString *)self->_amsAltDSID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_signedIn;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  username = self->_username;
  if ((unint64_t)username | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](username, "isEqual:")) {
      goto LABEL_10;
    }
  }
  aaAltDSID = self->_aaAltDSID;
  if ((unint64_t)aaAltDSID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](aaAltDSID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  amsAltDSID = self->_amsAltDSID;
  if ((unint64_t)amsAltDSID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](amsAltDSID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_signedIn)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_username copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_aaAltDSID copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_amsAltDSID copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_signedIn;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    id v4 = v5;
  }
  if (self->_aaAltDSID)
  {
    objc_msgSend(v5, "setAaAltDSID:");
    id v4 = v5;
  }
  if (self->_amsAltDSID)
  {
    objc_msgSend(v5, "setAmsAltDSID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_signedIn;
    v4[36] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_aaAltDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_amsAltDSID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoAccountInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  username = self->_username;
  if (username) {
    [v3 setObject:username forKey:@"username"];
  }
  aaAltDSID = self->_aaAltDSID;
  if (aaAltDSID) {
    [v4 setObject:aaAltDSID forKey:@"aa_altDSID"];
  }
  amsAltDSID = self->_amsAltDSID;
  if (amsAltDSID) {
    [v4 setObject:amsAltDSID forKey:@"ams_altDSID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_signedIn];
    [v4 setObject:v8 forKey:@"signedIn"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoAccountInfoEvent;
  id v4 = [(HMAccessoryInfoProtoAccountInfoEvent *)&v8 description];
  id v5 = [(HMAccessoryInfoProtoAccountInfoEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSignedIn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSignedIn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSignedIn:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_signedIn = a3;
}

- (BOOL)hasAmsAltDSID
{
  return self->_amsAltDSID != 0;
}

- (BOOL)hasAaAltDSID
{
  return self->_aaAltDSID != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

@end