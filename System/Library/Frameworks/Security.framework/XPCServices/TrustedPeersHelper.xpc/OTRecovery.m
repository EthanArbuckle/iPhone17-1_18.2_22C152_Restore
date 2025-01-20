@interface OTRecovery
- (BOOL)hasEncryptionSPKI;
- (BOOL)hasPeerID;
- (BOOL)hasSigningSPKI;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionSPKI;
- (NSData)signingSPKI;
- (NSString)peerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSigningSPKI:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTRecovery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSPKI, 0);
  objc_storeStrong((id *)&self->_peerID, 0);

  objc_storeStrong((id *)&self->_encryptionSPKI, 0);
}

- (void)setEncryptionSPKI:(id)a3
{
}

- (NSData)encryptionSPKI
{
  return self->_encryptionSPKI;
}

- (void)setSigningSPKI:(id)a3
{
}

- (NSData)signingSPKI
{
  return self->_signingSPKI;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[OTRecovery setPeerID:](self, "setPeerID:");
  }
  if (v4[3]) {
    -[OTRecovery setSigningSPKI:](self, "setSigningSPKI:");
  }
  if (v4[1]) {
    -[OTRecovery setEncryptionSPKI:](self, "setEncryptionSPKI:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_peerID hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_signingSPKI hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_encryptionSPKI hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:"))
    && ((signingSPKI = self->_signingSPKI, !((unint64_t)signingSPKI | v4[3]))
     || -[NSData isEqual:](signingSPKI, "isEqual:")))
  {
    encryptionSPKI = self->_encryptionSPKI;
    if ((unint64_t)encryptionSPKI | v4[1]) {
      unsigned __int8 v8 = -[NSData isEqual:](encryptionSPKI, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_peerID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_signingSPKI copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSData *)self->_encryptionSPKI copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    id v4 = v5;
  }
  if (self->_signingSPKI)
  {
    objc_msgSend(v5, "setSigningSPKI:");
    id v4 = v5;
  }
  if (self->_encryptionSPKI)
  {
    objc_msgSend(v5, "setEncryptionSPKI:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_signingSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptionSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        if (v6++ >= 9)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        uint64_t v14 = PBReaderReadData();
        uint64_t v15 = 24;
        goto LABEL_23;
      }
      if (v13 == 1)
      {
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 16;
LABEL_23:
        v16 = *(void **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    uint64_t v14 = PBReaderReadData();
    uint64_t v15 = 8;
    goto LABEL_23;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  signingSPKI = self->_signingSPKI;
  if (signingSPKI) {
    [v4 setObject:signingSPKI forKey:@"signingSPKI"];
  }
  encryptionSPKI = self->_encryptionSPKI;
  if (encryptionSPKI) {
    [v4 setObject:encryptionSPKI forKey:@"encryptionSPKI"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTRecovery;
  NSUInteger v3 = [(OTRecovery *)&v7 description];
  id v4 = [(OTRecovery *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasEncryptionSPKI
{
  return self->_encryptionSPKI != 0;
}

- (BOOL)hasSigningSPKI
{
  return self->_signingSPKI != 0;
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

@end