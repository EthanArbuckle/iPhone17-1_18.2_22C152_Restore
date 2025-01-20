@interface OTPairingMessage
- (BOOL)hasEpoch;
- (BOOL)hasPrepare;
- (BOOL)hasSupportsOctagon;
- (BOOL)hasSupportsSOS;
- (BOOL)hasVoucher;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTApplicantToSponsorRound2M1)prepare;
- (OTSponsorToApplicantRound1M2)epoch;
- (OTSponsorToApplicantRound2M2)voucher;
- (OTSupportOctagonMessage)supportsOctagon;
- (OTSupportSOSMessage)supportsSOS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(id)a3;
- (void)setPrepare:(id)a3;
- (void)setSupportsOctagon:(id)a3;
- (void)setSupportsSOS:(id)a3;
- (void)setVoucher:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTPairingMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_supportsSOS, 0);
  objc_storeStrong((id *)&self->_supportsOctagon, 0);
  objc_storeStrong((id *)&self->_prepare, 0);
  objc_storeStrong((id *)&self->_epoch, 0);
}

- (void)setSupportsSOS:(id)a3
{
}

- (OTSupportSOSMessage)supportsSOS
{
  return self->_supportsSOS;
}

- (void)setSupportsOctagon:(id)a3
{
}

- (OTSupportOctagonMessage)supportsOctagon
{
  return self->_supportsOctagon;
}

- (void)setVoucher:(id)a3
{
}

- (OTSponsorToApplicantRound2M2)voucher
{
  return self->_voucher;
}

- (void)setPrepare:(id)a3
{
}

- (OTApplicantToSponsorRound2M1)prepare
{
  return self->_prepare;
}

- (void)setEpoch:(id)a3
{
}

- (OTSponsorToApplicantRound1M2)epoch
{
  return self->_epoch;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  epoch = self->_epoch;
  v15 = v4;
  uint64_t v6 = v4[1];
  if (epoch)
  {
    if (v6) {
      -[OTSponsorToApplicantRound1M2 mergeFrom:](epoch, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[OTPairingMessage setEpoch:](self, "setEpoch:");
  }
  prepare = self->_prepare;
  uint64_t v8 = v15[2];
  if (prepare)
  {
    if (v8) {
      -[OTApplicantToSponsorRound2M1 mergeFrom:](prepare, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[OTPairingMessage setPrepare:](self, "setPrepare:");
  }
  voucher = self->_voucher;
  uint64_t v10 = v15[5];
  if (voucher)
  {
    if (v10) {
      -[OTSponsorToApplicantRound2M2 mergeFrom:](voucher, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[OTPairingMessage setVoucher:](self, "setVoucher:");
  }
  supportsOctagon = self->_supportsOctagon;
  uint64_t v12 = v15[3];
  if (supportsOctagon)
  {
    if (v12) {
      -[OTSupportOctagonMessage mergeFrom:](supportsOctagon, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[OTPairingMessage setSupportsOctagon:](self, "setSupportsOctagon:");
  }
  supportsSOS = self->_supportsSOS;
  uint64_t v14 = v15[4];
  if (supportsSOS)
  {
    if (v14) {
      -[OTSupportSOSMessage mergeFrom:](supportsSOS, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[OTPairingMessage setSupportsSOS:](self, "setSupportsSOS:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(OTSponsorToApplicantRound1M2 *)self->_epoch hash];
  unint64_t v4 = [(OTApplicantToSponsorRound2M1 *)self->_prepare hash] ^ v3;
  unint64_t v5 = [(OTSponsorToApplicantRound2M2 *)self->_voucher hash];
  unint64_t v6 = v4 ^ v5 ^ [(OTSupportOctagonMessage *)self->_supportsOctagon hash];
  return v6 ^ [(OTSupportSOSMessage *)self->_supportsSOS hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((epoch = self->_epoch, !((unint64_t)epoch | v4[1]))
     || -[OTSponsorToApplicantRound1M2 isEqual:](epoch, "isEqual:"))
    && ((prepare = self->_prepare, !((unint64_t)prepare | v4[2]))
     || -[OTApplicantToSponsorRound2M1 isEqual:](prepare, "isEqual:"))
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[5]))
     || -[OTSponsorToApplicantRound2M2 isEqual:](voucher, "isEqual:"))
    && ((supportsOctagon = self->_supportsOctagon, !((unint64_t)supportsOctagon | v4[3]))
     || -[OTSupportOctagonMessage isEqual:](supportsOctagon, "isEqual:")))
  {
    supportsSOS = self->_supportsSOS;
    if ((unint64_t)supportsSOS | v4[4]) {
      char v10 = -[OTSupportSOSMessage isEqual:](supportsSOS, "isEqual:");
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
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OTSponsorToApplicantRound1M2 *)self->_epoch copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(OTApplicantToSponsorRound2M1 *)self->_prepare copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(OTSponsorToApplicantRound2M2 *)self->_voucher copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(OTSupportOctagonMessage *)self->_supportsOctagon copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(OTSupportSOSMessage *)self->_supportsSOS copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_epoch)
  {
    objc_msgSend(v4, "setEpoch:");
    id v4 = v5;
  }
  if (self->_prepare)
  {
    objc_msgSend(v5, "setPrepare:");
    id v4 = v5;
  }
  if (self->_voucher)
  {
    objc_msgSend(v5, "setVoucher:");
    id v4 = v5;
  }
  if (self->_supportsOctagon)
  {
    objc_msgSend(v5, "setSupportsOctagon:");
    id v4 = v5;
  }
  if (self->_supportsSOS)
  {
    objc_msgSend(v5, "setSupportsSOS:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_epoch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_prepare)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_voucher)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_supportsOctagon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_supportsSOS)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  id v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) >= *(void *)((char *)a3 + (int)*MEMORY[0x263F62288])) {
    return *((unsigned char *)a3 + *v6) == 0;
  }
  id v8 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*((unsigned char *)a3 + *v6)) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v4;
      unint64_t v13 = *(void *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
      *(void *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        unint64_t v11 = 0;
        int v16 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
    int v16 = *((unsigned __int8 *)a3 + *v6);
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v16 || (v11 & 7) == 4) {
      return *((unsigned char *)a3 + *v6) == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(OTSponsorToApplicantRound1M2);
        objc_storeStrong((id *)&self->_epoch, v18);
        if (PBReaderPlaceMark()
          && (OTSponsorToApplicantRound1M2ReadFrom((uint64_t)v18, (uint64_t)a3) & 1) != 0)
        {
          goto LABEL_35;
        }
        goto LABEL_39;
      case 2u:
        v18 = objc_alloc_init(OTApplicantToSponsorRound2M1);
        objc_storeStrong((id *)&self->_prepare, v18);
        if (!PBReaderPlaceMark() || !OTApplicantToSponsorRound2M1ReadFrom((uint64_t)v18, (uint64_t)a3)) {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 3u:
        v18 = objc_alloc_init(OTSponsorToApplicantRound2M2);
        objc_storeStrong((id *)&self->_voucher, v18);
        if (!PBReaderPlaceMark() || !OTSponsorToApplicantRound2M2ReadFrom((uint64_t)v18, (uint64_t)a3)) {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 5u:
        v18 = objc_alloc_init(OTSupportOctagonMessage);
        objc_storeStrong((id *)&self->_supportsOctagon, v18);
        if (!PBReaderPlaceMark() || (OTSupportOctagonMessageReadFrom((uint64_t)v18, (uint64_t)a3) & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 6u:
        v18 = objc_alloc_init(OTSupportSOSMessage);
        objc_storeStrong((id *)&self->_supportsSOS, v18);
        if PBReaderPlaceMark() && (OTSupportSOSMessageReadFrom((uint64_t)v18, (uint64_t)a3))
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            return *((unsigned char *)a3 + *v6) == 0;
          }
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_36;
    }
  }
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  epoch = self->_epoch;
  if (epoch)
  {
    id v5 = [(OTSponsorToApplicantRound1M2 *)epoch dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"epoch"];
  }
  prepare = self->_prepare;
  if (prepare)
  {
    v7 = [(OTApplicantToSponsorRound2M1 *)prepare dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"prepare"];
  }
  voucher = self->_voucher;
  if (voucher)
  {
    char v9 = [(OTSponsorToApplicantRound2M2 *)voucher dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"voucher"];
  }
  supportsOctagon = self->_supportsOctagon;
  if (supportsOctagon)
  {
    unint64_t v11 = [(OTSupportOctagonMessage *)supportsOctagon dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"supportsOctagon"];
  }
  supportsSOS = self->_supportsSOS;
  if (supportsSOS)
  {
    unint64_t v13 = [(OTSupportSOSMessage *)supportsSOS dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"supportsSOS"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTPairingMessage;
  id v4 = [(OTPairingMessage *)&v8 description];
  id v5 = [(OTPairingMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSupportsSOS
{
  return self->_supportsSOS != 0;
}

- (BOOL)hasSupportsOctagon
{
  return self->_supportsOctagon != 0;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

- (BOOL)hasPrepare
{
  return self->_prepare != 0;
}

- (BOOL)hasEpoch
{
  return self->_epoch != 0;
}

@end