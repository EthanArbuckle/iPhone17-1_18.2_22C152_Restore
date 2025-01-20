@interface OTSponsorToApplicantRound2M2
- (BOOL)hasVoucher;
- (BOOL)hasVoucherSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)voucher;
- (NSData)voucherSignature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTSponsorToApplicantRound2M2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucherSignature, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
}

- (void)setVoucherSignature:(id)a3
{
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[OTSponsorToApplicantRound2M2 setVoucher:](self, "setVoucher:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[OTSponsorToApplicantRound2M2 setVoucherSignature:](self, "setVoucherSignature:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_voucher hash];
  return [(NSData *)self->_voucherSignature hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((voucher = self->_voucher, !((unint64_t)voucher | v4[1]))
     || -[NSData isEqual:](voucher, "isEqual:")))
  {
    voucherSignature = self->_voucherSignature;
    if ((unint64_t)voucherSignature | v4[2]) {
      char v7 = -[NSData isEqual:](voucherSignature, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_voucher copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_voucherSignature copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_voucher)
  {
    objc_msgSend(v4, "setVoucher:");
    id v4 = v5;
  }
  if (self->_voucherSignature)
  {
    objc_msgSend(v5, "setVoucherSignature:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_voucher)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_voucherSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTSponsorToApplicantRound2M2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  voucher = self->_voucher;
  if (voucher) {
    [v3 setObject:voucher forKey:@"voucher"];
  }
  voucherSignature = self->_voucherSignature;
  if (voucherSignature) {
    [v4 setObject:voucherSignature forKey:@"voucherSignature"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTSponsorToApplicantRound2M2;
  id v4 = [(OTSponsorToApplicantRound2M2 *)&v8 description];
  id v5 = [(OTSponsorToApplicantRound2M2 *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

@end