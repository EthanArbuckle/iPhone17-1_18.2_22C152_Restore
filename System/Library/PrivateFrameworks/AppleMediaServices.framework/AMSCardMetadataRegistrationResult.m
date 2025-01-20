@interface AMSCardMetadataRegistrationResult
- (AMSCardMetadataRegistrationResult)init;
- (AMSCardMetadataRegistrationResult)initWithCardArtwork:(id)a3 cardType:(int64_t)a4 descriptionLong:(id)a5 descriptionShort:(id)a6 paymentNetwork:(int64_t)a7 serialNumber:(id)a8 suffix:(id)a9;
- (NSData)cardArtworkData;
- (NSDictionary)dictionary;
- (NSString)cardArtwork;
- (NSString)descriptionLong;
- (NSString)descriptionShort;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (NSString)suffix;
- (int64_t)cardType;
- (int64_t)paymentNetwork;
- (void)setCardArtwork:(id)a3;
- (void)setCardArtworkData:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setDescriptionLong:(id)a3;
- (void)setDescriptionShort:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPaymentNetwork:(int64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSuffix:(id)a3;
@end

@implementation AMSCardMetadataRegistrationResult

- (AMSCardMetadataRegistrationResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSCardMetadataRegistrationResult;
  return [(AMSCardMetadataRegistrationResult *)&v3 init];
}

- (AMSCardMetadataRegistrationResult)initWithCardArtwork:(id)a3 cardType:(int64_t)a4 descriptionLong:(id)a5 descriptionShort:(id)a6 paymentNetwork:(int64_t)a7 serialNumber:(id)a8 suffix:(id)a9
{
  id v23 = a3;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)AMSCardMetadataRegistrationResult;
  v18 = [(AMSCardMetadataRegistrationResult *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cardArtwork, a3);
    v19->_cardType = a4;
    objc_storeStrong((id *)&v19->_descriptionLong, a5);
    objc_storeStrong((id *)&v19->_descriptionShort, a6);
    v19->_paymentNetwork = a7;
    objc_storeStrong((id *)&v19->_serialNumber, a8);
    objc_storeStrong((id *)&v19->_suffix, a9);
  }

  return v19;
}

- (NSDictionary)dictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(AMSCardMetadataRegistrationResult *)self cardArtwork];

  if (v4)
  {
    v5 = [(AMSCardMetadataRegistrationResult *)self cardArtwork];
    [v3 setObject:v5 forKeyedSubscript:@"cardArtwork"];
  }
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSCardMetadataRegistrationResult cardType](self, "cardType"));
  [v3 setObject:v6 forKeyedSubscript:@"cardType"];

  v7 = [(AMSCardMetadataRegistrationResult *)self descriptionLong];

  if (v7)
  {
    v8 = [(AMSCardMetadataRegistrationResult *)self descriptionLong];
    [v3 setObject:v8 forKeyedSubscript:@"descriptionLong"];
  }
  v9 = [(AMSCardMetadataRegistrationResult *)self descriptionShort];

  if (v9)
  {
    v10 = [(AMSCardMetadataRegistrationResult *)self descriptionShort];
    [v3 setObject:v10 forKeyedSubscript:@"descriptionShort"];
  }
  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSCardMetadataRegistrationResult paymentNetwork](self, "paymentNetwork"));
  [v3 setObject:v11 forKeyedSubscript:@"paymentNetwork"];

  v12 = [(AMSCardMetadataRegistrationResult *)self serialNumber];

  if (v12)
  {
    v13 = [(AMSCardMetadataRegistrationResult *)self serialNumber];
    [v3 setObject:v13 forKeyedSubscript:@"serialNumber"];
  }
  v14 = [(AMSCardMetadataRegistrationResult *)self suffix];

  if (v14)
  {
    id v15 = [(AMSCardMetadataRegistrationResult *)self suffix];
    [v3 setObject:v15 forKeyedSubscript:@"suffix"];
  }
  id v16 = (void *)[v3 copy];

  return (NSDictionary *)v16;
}

- (NSString)cardArtwork
{
  return self->_cardArtwork;
}

- (void)setCardArtwork:(id)a3
{
}

- (NSData)cardArtworkData
{
  return self->_cardArtworkData;
}

- (void)setCardArtworkData:(id)a3
{
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)descriptionLong
{
  return self->_descriptionLong;
}

- (void)setDescriptionLong:(id)a3
{
}

- (NSString)descriptionShort
{
  return self->_descriptionShort;
}

- (void)setDescriptionShort:(id)a3
{
}

- (int64_t)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(int64_t)a3
{
  self->_paymentNetwork = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_descriptionShort, 0);
  objc_storeStrong((id *)&self->_descriptionLong, 0);
  objc_storeStrong((id *)&self->_cardArtworkData, 0);
  objc_storeStrong((id *)&self->_cardArtwork, 0);
}

@end