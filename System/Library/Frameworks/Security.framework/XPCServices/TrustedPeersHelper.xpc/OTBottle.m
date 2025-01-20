@interface OTBottle
- (BOOL)hasBottleID;
- (BOOL)hasContents;
- (BOOL)hasEscrowedEncryptionSPKI;
- (BOOL)hasEscrowedSigningSPKI;
- (BOOL)hasPeerEncryptionSPKI;
- (BOOL)hasPeerID;
- (BOOL)hasPeerSigningSPKI;
- (BOOL)hasReserved3;
- (BOOL)hasReserved4;
- (BOOL)hasReserved5;
- (BOOL)hasReserved6;
- (BOOL)hasReserved7;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)escrowedEncryptionSPKI;
- (NSData)escrowedSigningSPKI;
- (NSData)peerEncryptionSPKI;
- (NSData)peerSigningSPKI;
- (NSData)reserved3;
- (NSData)reserved4;
- (NSData)reserved5;
- (NSData)reserved6;
- (NSData)reserved7;
- (NSString)bottleID;
- (NSString)peerID;
- (OTAuthenticatedCiphertext)contents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBottleID:(id)a3;
- (void)setContents:(id)a3;
- (void)setEscrowedEncryptionSPKI:(id)a3;
- (void)setEscrowedSigningSPKI:(id)a3;
- (void)setPeerEncryptionSPKI:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerSigningSPKI:(id)a3;
- (void)setReserved3:(id)a3;
- (void)setReserved4:(id)a3;
- (void)setReserved5:(id)a3;
- (void)setReserved6:(id)a3;
- (void)setReserved7:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTBottle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reserved7, 0);
  objc_storeStrong((id *)&self->_reserved6, 0);
  objc_storeStrong((id *)&self->_reserved5, 0);
  objc_storeStrong((id *)&self->_reserved4, 0);
  objc_storeStrong((id *)&self->_reserved3, 0);
  objc_storeStrong((id *)&self->_peerSigningSPKI, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_peerEncryptionSPKI, 0);
  objc_storeStrong((id *)&self->_escrowedSigningSPKI, 0);
  objc_storeStrong((id *)&self->_escrowedEncryptionSPKI, 0);
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_bottleID, 0);
}

- (void)setContents:(id)a3
{
}

- (OTAuthenticatedCiphertext)contents
{
  return self->_contents;
}

- (void)setReserved7:(id)a3
{
}

- (NSData)reserved7
{
  return self->_reserved7;
}

- (void)setPeerEncryptionSPKI:(id)a3
{
}

- (NSData)peerEncryptionSPKI
{
  return self->_peerEncryptionSPKI;
}

- (void)setPeerSigningSPKI:(id)a3
{
}

- (NSData)peerSigningSPKI
{
  return self->_peerSigningSPKI;
}

- (void)setEscrowedEncryptionSPKI:(id)a3
{
}

- (NSData)escrowedEncryptionSPKI
{
  return self->_escrowedEncryptionSPKI;
}

- (void)setEscrowedSigningSPKI:(id)a3
{
}

- (NSData)escrowedSigningSPKI
{
  return self->_escrowedSigningSPKI;
}

- (void)setReserved6:(id)a3
{
}

- (NSData)reserved6
{
  return self->_reserved6;
}

- (void)setReserved5:(id)a3
{
}

- (NSData)reserved5
{
  return self->_reserved5;
}

- (void)setReserved4:(id)a3
{
}

- (NSData)reserved4
{
  return self->_reserved4;
}

- (void)setReserved3:(id)a3
{
}

- (NSData)reserved3
{
  return self->_reserved3;
}

- (void)setBottleID:(id)a3
{
}

- (NSString)bottleID
{
  return self->_bottleID;
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
  v6 = a3;
  if (v6[6]) {
    -[OTBottle setPeerID:](self, "setPeerID:");
  }
  if (v6[1]) {
    -[OTBottle setBottleID:](self, "setBottleID:");
  }
  if (v6[8]) {
    -[OTBottle setReserved3:](self, "setReserved3:");
  }
  if (v6[9]) {
    -[OTBottle setReserved4:](self, "setReserved4:");
  }
  if (v6[10]) {
    -[OTBottle setReserved5:](self, "setReserved5:");
  }
  if (v6[11]) {
    -[OTBottle setReserved6:](self, "setReserved6:");
  }
  if (v6[12]) {
    -[OTBottle setReserved7:](self, "setReserved7:");
  }
  if (v6[4]) {
    -[OTBottle setEscrowedSigningSPKI:](self, "setEscrowedSigningSPKI:");
  }
  if (v6[3]) {
    -[OTBottle setEscrowedEncryptionSPKI:](self, "setEscrowedEncryptionSPKI:");
  }
  if (v6[7]) {
    -[OTBottle setPeerSigningSPKI:](self, "setPeerSigningSPKI:");
  }
  if (v6[5]) {
    -[OTBottle setPeerEncryptionSPKI:](self, "setPeerEncryptionSPKI:");
  }
  contents = self->_contents;
  uint64_t v5 = v6[2];
  if (contents)
  {
    if (v5) {
      -[OTAuthenticatedCiphertext mergeFrom:](contents, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[OTBottle setContents:](self, "setContents:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_peerID hash];
  unint64_t v4 = [(NSString *)self->_bottleID hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSData *)self->_reserved3 hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSData *)self->_reserved4 hash];
  unint64_t v7 = (unint64_t)[(NSData *)self->_reserved5 hash];
  unint64_t v8 = v7 ^ (unint64_t)[(NSData *)self->_reserved6 hash];
  unint64_t v9 = v6 ^ v8 ^ (unint64_t)[(NSData *)self->_reserved7 hash];
  unint64_t v10 = (unint64_t)[(NSData *)self->_escrowedSigningSPKI hash];
  unint64_t v11 = v10 ^ (unint64_t)[(NSData *)self->_escrowedEncryptionSPKI hash];
  unint64_t v12 = v11 ^ (unint64_t)[(NSData *)self->_peerSigningSPKI hash];
  unint64_t v13 = v9 ^ v12 ^ (unint64_t)[(NSData *)self->_peerEncryptionSPKI hash];
  return v13 ^ [(OTAuthenticatedCiphertext *)self->_contents hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  peerID = self->_peerID;
  if ((unint64_t)peerID | v4[6])
  {
    if (!-[NSString isEqual:](peerID, "isEqual:")) {
      goto LABEL_26;
    }
  }
  bottleID = self->_bottleID;
  if ((unint64_t)bottleID | v4[1] && !-[NSString isEqual:](bottleID, "isEqual:")) {
    goto LABEL_26;
  }
  reserved3 = self->_reserved3;
  if ((unint64_t)reserved3 | v4[8] && !-[NSData isEqual:](reserved3, "isEqual:")) {
    goto LABEL_26;
  }
  reserved4 = self->_reserved4;
  if ((unint64_t)reserved4 | v4[9] && !-[NSData isEqual:](reserved4, "isEqual:")) {
    goto LABEL_26;
  }
  if (((reserved5 = self->_reserved5, !((unint64_t)reserved5 | v4[10]))
     || -[NSData isEqual:](reserved5, "isEqual:"))
    && ((reserved6 = self->_reserved6, !((unint64_t)reserved6 | v4[11]))
     || -[NSData isEqual:](reserved6, "isEqual:"))
    && ((reserved7 = self->_reserved7, !((unint64_t)reserved7 | v4[12]))
     || -[NSData isEqual:](reserved7, "isEqual:"))
    && ((escrowedSigningSPKI = self->_escrowedSigningSPKI, !((unint64_t)escrowedSigningSPKI | v4[4]))
     || -[NSData isEqual:](escrowedSigningSPKI, "isEqual:"))
    && ((escrowedEncryptionSPKI = self->_escrowedEncryptionSPKI, !((unint64_t)escrowedEncryptionSPKI | v4[3]))
     || -[NSData isEqual:](escrowedEncryptionSPKI, "isEqual:"))
    && ((peerSigningSPKI = self->_peerSigningSPKI, !((unint64_t)peerSigningSPKI | v4[7]))
     || -[NSData isEqual:](peerSigningSPKI, "isEqual:"))
    && ((peerEncryptionSPKI = self->_peerEncryptionSPKI, !((unint64_t)peerEncryptionSPKI | v4[5]))
     || -[NSData isEqual:](peerEncryptionSPKI, "isEqual:")))
  {
    contents = self->_contents;
    if ((unint64_t)contents | v4[2]) {
      unsigned __int8 v17 = -[OTAuthenticatedCiphertext isEqual:](contents, "isEqual:");
    }
    else {
      unsigned __int8 v17 = 1;
    }
  }
  else
  {
LABEL_26:
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_peerID copyWithZone:a3];
  unint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(NSString *)self->_bottleID copyWithZone:a3];
  unint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSData *)self->_reserved3 copyWithZone:a3];
  unint64_t v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(NSData *)self->_reserved4 copyWithZone:a3];
  unint64_t v13 = (void *)v5[9];
  v5[9] = v12;

  id v14 = [(NSData *)self->_reserved5 copyWithZone:a3];
  v15 = (void *)v5[10];
  v5[10] = v14;

  id v16 = [(NSData *)self->_reserved6 copyWithZone:a3];
  unsigned __int8 v17 = (void *)v5[11];
  v5[11] = v16;

  id v18 = [(NSData *)self->_reserved7 copyWithZone:a3];
  v19 = (void *)v5[12];
  v5[12] = v18;

  id v20 = [(NSData *)self->_escrowedSigningSPKI copyWithZone:a3];
  v21 = (void *)v5[4];
  v5[4] = v20;

  id v22 = [(NSData *)self->_escrowedEncryptionSPKI copyWithZone:a3];
  v23 = (void *)v5[3];
  v5[3] = v22;

  id v24 = [(NSData *)self->_peerSigningSPKI copyWithZone:a3];
  v25 = (void *)v5[7];
  v5[7] = v24;

  id v26 = [(NSData *)self->_peerEncryptionSPKI copyWithZone:a3];
  v27 = (void *)v5[5];
  v5[5] = v26;

  id v28 = [(OTAuthenticatedCiphertext *)self->_contents copyWithZone:a3];
  v29 = (void *)v5[2];
  v5[2] = v28;

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
  if (self->_bottleID)
  {
    objc_msgSend(v5, "setBottleID:");
    id v4 = v5;
  }
  if (self->_reserved3)
  {
    objc_msgSend(v5, "setReserved3:");
    id v4 = v5;
  }
  if (self->_reserved4)
  {
    objc_msgSend(v5, "setReserved4:");
    id v4 = v5;
  }
  if (self->_reserved5)
  {
    objc_msgSend(v5, "setReserved5:");
    id v4 = v5;
  }
  if (self->_reserved6)
  {
    objc_msgSend(v5, "setReserved6:");
    id v4 = v5;
  }
  if (self->_reserved7)
  {
    objc_msgSend(v5, "setReserved7:");
    id v4 = v5;
  }
  if (self->_escrowedSigningSPKI)
  {
    objc_msgSend(v5, "setEscrowedSigningSPKI:");
    id v4 = v5;
  }
  if (self->_escrowedEncryptionSPKI)
  {
    objc_msgSend(v5, "setEscrowedEncryptionSPKI:");
    id v4 = v5;
  }
  if (self->_peerSigningSPKI)
  {
    objc_msgSend(v5, "setPeerSigningSPKI:");
    id v4 = v5;
  }
  if (self->_peerEncryptionSPKI)
  {
    objc_msgSend(v5, "setPeerEncryptionSPKI:");
    id v4 = v5;
  }
  if (self->_contents)
  {
    objc_msgSend(v5, "setContents:");
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
  if (self->_bottleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_reserved3)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_reserved4)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_reserved5)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_reserved6)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_reserved7)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_escrowedSigningSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_escrowedEncryptionSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_peerSigningSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_peerEncryptionSPKI)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_contents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
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
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 48;
        goto LABEL_31;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 8;
        goto LABEL_31;
      case 3u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 64;
        goto LABEL_31;
      case 4u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 72;
        goto LABEL_31;
      case 5u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 80;
        goto LABEL_31;
      case 6u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 88;
        goto LABEL_31;
      case 7u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 96;
        goto LABEL_31;
      case 8u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 32;
        goto LABEL_31;
      case 9u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 24;
        goto LABEL_31;
      case 0xAu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 56;
        goto LABEL_31;
      case 0xBu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 40;
LABEL_31:
        v15 = *(OTAuthenticatedCiphertext **)&self->PBCodable_opaque[v14];
        *(void *)&self->PBCodable_opaque[v14] = v13;
        goto LABEL_32;
      case 0xCu:
        v15 = objc_alloc_init(OTAuthenticatedCiphertext);
        objc_storeStrong((id *)&self->_contents, v15);
        if (PBReaderPlaceMark() && sub_100210044((uint64_t)v15, (uint64_t)a3))
        {
          PBReaderRecallMark();
LABEL_32:

LABEL_33:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_33;
    }
  }
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  bottleID = self->_bottleID;
  if (bottleID) {
    [v4 setObject:bottleID forKey:@"bottleID"];
  }
  reserved3 = self->_reserved3;
  if (reserved3) {
    [v4 setObject:reserved3 forKey:@"reserved3"];
  }
  reserved4 = self->_reserved4;
  if (reserved4) {
    [v4 setObject:reserved4 forKey:@"reserved4"];
  }
  reserved5 = self->_reserved5;
  if (reserved5) {
    [v4 setObject:reserved5 forKey:@"reserved5"];
  }
  reserved6 = self->_reserved6;
  if (reserved6) {
    [v4 setObject:reserved6 forKey:@"reserved6"];
  }
  escrowedSigningSPKI = self->_escrowedSigningSPKI;
  if (escrowedSigningSPKI) {
    [v4 setObject:escrowedSigningSPKI forKey:@"escrowedSigningSPKI"];
  }
  escrowedEncryptionSPKI = self->_escrowedEncryptionSPKI;
  if (escrowedEncryptionSPKI) {
    [v4 setObject:escrowedEncryptionSPKI forKey:@"escrowedEncryptionSPKI"];
  }
  peerSigningSPKI = self->_peerSigningSPKI;
  if (peerSigningSPKI) {
    [v4 setObject:peerSigningSPKI forKey:@"peerSigningSPKI"];
  }
  peerEncryptionSPKI = self->_peerEncryptionSPKI;
  if (peerEncryptionSPKI) {
    [v4 setObject:peerEncryptionSPKI forKey:@"peerEncryptionSPKI"];
  }
  reserved7 = self->_reserved7;
  if (reserved7) {
    [v4 setObject:reserved7 forKey:@"reserved7"];
  }
  contents = self->_contents;
  if (contents)
  {
    unsigned __int8 v17 = [(OTAuthenticatedCiphertext *)contents dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"contents"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTBottle;
  NSUInteger v3 = [(OTBottle *)&v7 description];
  id v4 = [(OTBottle *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

- (BOOL)hasReserved7
{
  return self->_reserved7 != 0;
}

- (BOOL)hasPeerEncryptionSPKI
{
  return self->_peerEncryptionSPKI != 0;
}

- (BOOL)hasPeerSigningSPKI
{
  return self->_peerSigningSPKI != 0;
}

- (BOOL)hasEscrowedEncryptionSPKI
{
  return self->_escrowedEncryptionSPKI != 0;
}

- (BOOL)hasEscrowedSigningSPKI
{
  return self->_escrowedSigningSPKI != 0;
}

- (BOOL)hasReserved6
{
  return self->_reserved6 != 0;
}

- (BOOL)hasReserved5
{
  return self->_reserved5 != 0;
}

- (BOOL)hasReserved4
{
  return self->_reserved4 != 0;
}

- (BOOL)hasReserved3
{
  return self->_reserved3 != 0;
}

- (BOOL)hasBottleID
{
  return self->_bottleID != 0;
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

@end