@interface IDSCTPNRInfo
- (IDSCTPNRInfo)initWithIMSI:(id)a3 PLMN:(id)a4 PNRPhoneNumber:(id)a5 phoneBookNumber:(id)a6;
- (NSString)IMSI;
- (NSString)PLMN;
- (NSString)PNRPhoneNumber;
- (NSString)phoneBookNumber;
- (void)setIMSI:(id)a3;
- (void)setPLMN:(id)a3;
- (void)setPNRPhoneNumber:(id)a3;
- (void)setPhoneBookNumber:(id)a3;
@end

@implementation IDSCTPNRInfo

- (IDSCTPNRInfo)initWithIMSI:(id)a3 PLMN:(id)a4 PNRPhoneNumber:(id)a5 phoneBookNumber:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSCTPNRInfo;
  v15 = [(IDSCTPNRInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_IMSI, a3);
    objc_storeStrong((id *)&v16->_PLMN, a4);
    objc_storeStrong((id *)&v16->_PNRPhoneNumber, a5);
    objc_storeStrong((id *)&v16->_phoneBookNumber, a6);
  }

  return v16;
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (void)setPLMN:(id)a3
{
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
}

- (NSString)PNRPhoneNumber
{
  return self->_PNRPhoneNumber;
}

- (void)setPNRPhoneNumber:(id)a3
{
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneBookNumber, 0);
  objc_storeStrong((id *)&self->_PNRPhoneNumber, 0);
  objc_storeStrong((id *)&self->_IMSI, 0);
  objc_storeStrong((id *)&self->_PLMN, 0);
}

@end