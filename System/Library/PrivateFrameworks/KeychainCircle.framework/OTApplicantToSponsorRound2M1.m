@interface OTApplicantToSponsorRound2M1
- (BOOL)hasPeerID;
- (BOOL)hasPermanentInfo;
- (BOOL)hasPermanentInfoSig;
- (BOOL)hasStableInfo;
- (BOOL)hasStableInfoSig;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)permanentInfo;
- (NSData)permanentInfoSig;
- (NSData)stableInfo;
- (NSData)stableInfoSig;
- (NSString)peerID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPermanentInfo:(id)a3;
- (void)setPermanentInfoSig:(id)a3;
- (void)setStableInfo:(id)a3;
- (void)setStableInfoSig:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTApplicantToSponsorRound2M1

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableInfoSig, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfoSig, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
}

- (void)setStableInfoSig:(id)a3
{
}

- (NSData)stableInfoSig
{
  return self->_stableInfoSig;
}

- (void)setStableInfo:(id)a3
{
}

- (NSData)stableInfo
{
  return self->_stableInfo;
}

- (void)setPermanentInfoSig:(id)a3
{
}

- (NSData)permanentInfoSig
{
  return self->_permanentInfoSig;
}

- (void)setPermanentInfo:(id)a3
{
}

- (NSData)permanentInfo
{
  return self->_permanentInfo;
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
  if (v4[1]) {
    -[OTApplicantToSponsorRound2M1 setPeerID:](self, "setPeerID:");
  }
  if (v4[2]) {
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](self, "setPermanentInfo:");
  }
  if (v4[3]) {
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](self, "setPermanentInfoSig:");
  }
  if (v4[4]) {
    -[OTApplicantToSponsorRound2M1 setStableInfo:](self, "setStableInfo:");
  }
  if (v4[5]) {
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](self, "setStableInfoSig:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_peerID hash];
  uint64_t v4 = [(NSData *)self->_permanentInfo hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_permanentInfoSig hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_stableInfo hash];
  return v6 ^ [(NSData *)self->_stableInfoSig hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[1]))
     || -[NSString isEqual:](peerID, "isEqual:"))
    && ((permanentInfo = self->_permanentInfo, !((unint64_t)permanentInfo | v4[2]))
     || -[NSData isEqual:](permanentInfo, "isEqual:"))
    && ((permanentInfoSig = self->_permanentInfoSig, !((unint64_t)permanentInfoSig | v4[3]))
     || -[NSData isEqual:](permanentInfoSig, "isEqual:"))
    && ((stableInfo = self->_stableInfo, !((unint64_t)stableInfo | v4[4]))
     || -[NSData isEqual:](stableInfo, "isEqual:")))
  {
    stableInfoSig = self->_stableInfoSig;
    if ((unint64_t)stableInfoSig | v4[5]) {
      char v10 = -[NSData isEqual:](stableInfoSig, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_peerID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_permanentInfo copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_permanentInfoSig copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSData *)self->_stableInfo copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSData *)self->_stableInfoSig copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

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
  if (self->_permanentInfo)
  {
    objc_msgSend(v5, "setPermanentInfo:");
    id v4 = v5;
  }
  if (self->_permanentInfoSig)
  {
    objc_msgSend(v5, "setPermanentInfoSig:");
    id v4 = v5;
  }
  if (self->_stableInfo)
  {
    objc_msgSend(v5, "setStableInfo:");
    id v4 = v5;
  }
  if (self->_stableInfoSig)
  {
    objc_msgSend(v5, "setStableInfoSig:");
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
  if (self->_permanentInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_permanentInfoSig)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_stableInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_stableInfoSig)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTApplicantToSponsorRound2M1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  permanentInfo = self->_permanentInfo;
  if (permanentInfo) {
    [v4 setObject:permanentInfo forKey:@"permanentInfo"];
  }
  permanentInfoSig = self->_permanentInfoSig;
  if (permanentInfoSig) {
    [v4 setObject:permanentInfoSig forKey:@"permanentInfoSig"];
  }
  stableInfo = self->_stableInfo;
  if (stableInfo) {
    [v4 setObject:stableInfo forKey:@"stableInfo"];
  }
  stableInfoSig = self->_stableInfoSig;
  if (stableInfoSig) {
    [v4 setObject:stableInfoSig forKey:@"StableInfoSig"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTApplicantToSponsorRound2M1;
  id v4 = [(OTApplicantToSponsorRound2M1 *)&v8 description];
  id v5 = [(OTApplicantToSponsorRound2M1 *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStableInfoSig
{
  return self->_stableInfoSig != 0;
}

- (BOOL)hasStableInfo
{
  return self->_stableInfo != 0;
}

- (BOOL)hasPermanentInfoSig
{
  return self->_permanentInfoSig != 0;
}

- (BOOL)hasPermanentInfo
{
  return self->_permanentInfo != 0;
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

@end