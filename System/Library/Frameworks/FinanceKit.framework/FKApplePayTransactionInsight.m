@interface FKApplePayTransactionInsight
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 merchantName:(id)a4 merchantRawName:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 merchantType:(id)a8 merchantCountryCode:(id)a9 terminalIdentifier:(id)a10 merchantAdditionalData:(id)a11 paymentNetwork:(id)a12 isCoarseLocation:(id)a13 location:(id)a14 merchantIdentifier:(id)a15 merchantRawCANL:(id)a16 merchantRawCity:(id)a17 merchantRawState:(id)a18 merchantRawCountry:(id)a19 merchantCity:(id)a20 merchantZip:(id)a21 merchantState:(id)a22 merchantCleanConfidenceLevel:(id)a23 adamIdentifier:(id)a24 webURL:(id)a25 webMerchantIdentifier:(id)a26 webMerchantName:(id)a27;
- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 transactionDate:(id)a4 merchantName:(id)a5 merchantRawName:(id)a6 industryCategory:(id)a7 industryCode:(id)a8 merchantType:(id)a9 merchantCountryCode:(id)a10 terminalIdentifier:(id)a11 merchantAdditionalData:(id)a12 paymentNetwork:(id)a13 isCoarseLocation:(id)a14 location:(id)a15 merchantIdentifier:(id)a16 merchantRawCANL:(id)a17 merchantRawCity:(id)a18 merchantRawState:(id)a19 merchantRawCountry:(id)a20 merchantCity:(id)a21 merchantZip:(id)a22 merchantState:(id)a23 merchantCleanConfidenceLevel:(id)a24 adamIdentifier:(id)a25 webURL:(id)a26 webMerchantIdentifier:(id)a27 webMerchantName:(id)a28;
- (NSDate)transactionDate;
- (NSNumber)adamIdentifier;
- (NSNumber)industryCode;
- (NSNumber)isCoarseLocation;
- (NSNumber)merchantCleanConfidenceLevel;
- (NSString)industryCategory;
- (NSString)merchantAdditionalData;
- (NSString)merchantCity;
- (NSString)merchantCountryCode;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (NSString)merchantRawCANL;
- (NSString)merchantRawCity;
- (NSString)merchantRawCountry;
- (NSString)merchantRawName;
- (NSString)merchantRawState;
- (NSString)merchantState;
- (NSString)merchantType;
- (NSString)merchantZip;
- (NSString)paymentHash;
- (NSString)paymentNetwork;
- (NSString)terminalIdentifier;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (NSURL)webURL;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAdamIdentifier:(id)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(id)a3;
- (void)setIsCoarseLocation:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMerchantAdditionalData:(id)a3;
- (void)setMerchantCity:(id)a3;
- (void)setMerchantCleanConfidenceLevel:(id)a3;
- (void)setMerchantCountryCode:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setMerchantRawCANL:(id)a3;
- (void)setMerchantRawCity:(id)a3;
- (void)setMerchantRawCountry:(id)a3;
- (void)setMerchantRawName:(id)a3;
- (void)setMerchantRawState:(id)a3;
- (void)setMerchantState:(id)a3;
- (void)setMerchantType:(id)a3;
- (void)setMerchantZip:(id)a3;
- (void)setPaymentHash:(id)a3;
- (void)setPaymentNetwork:(id)a3;
- (void)setTerminalIdentifier:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
- (void)setWebURL:(id)a3;
@end

@implementation FKApplePayTransactionInsight

- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 merchantName:(id)a4 merchantRawName:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 merchantType:(id)a8 merchantCountryCode:(id)a9 terminalIdentifier:(id)a10 merchantAdditionalData:(id)a11 paymentNetwork:(id)a12 isCoarseLocation:(id)a13 location:(id)a14 merchantIdentifier:(id)a15 merchantRawCANL:(id)a16 merchantRawCity:(id)a17 merchantRawState:(id)a18 merchantRawCountry:(id)a19 merchantCity:(id)a20 merchantZip:(id)a21 merchantState:(id)a22 merchantCleanConfidenceLevel:(id)a23 adamIdentifier:(id)a24 webURL:(id)a25 webMerchantIdentifier:(id)a26 webMerchantName:(id)a27
{
  return -[FKApplePayTransactionInsight initWithPaymentHash:transactionDate:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:](self, "initWithPaymentHash:transactionDate:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

- (FKApplePayTransactionInsight)initWithPaymentHash:(id)a3 transactionDate:(id)a4 merchantName:(id)a5 merchantRawName:(id)a6 industryCategory:(id)a7 industryCode:(id)a8 merchantType:(id)a9 merchantCountryCode:(id)a10 terminalIdentifier:(id)a11 merchantAdditionalData:(id)a12 paymentNetwork:(id)a13 isCoarseLocation:(id)a14 location:(id)a15 merchantIdentifier:(id)a16 merchantRawCANL:(id)a17 merchantRawCity:(id)a18 merchantRawState:(id)a19 merchantRawCountry:(id)a20 merchantCity:(id)a21 merchantZip:(id)a22 merchantState:(id)a23 merchantCleanConfidenceLevel:(id)a24 adamIdentifier:(id)a25 webURL:(id)a26 webMerchantIdentifier:(id)a27 webMerchantName:(id)a28
{
  id v33 = a3;
  id v34 = a4;
  id v114 = a5;
  id v113 = a6;
  id v112 = a7;
  id v111 = a8;
  id v110 = a9;
  v35 = v34;
  id v109 = a10;
  id v108 = a11;
  id v107 = a12;
  id v106 = a13;
  id v105 = a14;
  id v104 = a15;
  id v103 = a16;
  id v102 = a17;
  id v101 = a18;
  id v100 = a19;
  id v99 = a20;
  id v98 = a21;
  id v36 = a22;
  id v37 = a23;
  id v38 = a24;
  id v39 = a25;
  id v40 = a26;
  id v41 = a27;
  id v42 = a28;
  v115.receiver = self;
  v115.super_class = (Class)FKApplePayTransactionInsight;
  v43 = [(FKApplePayTransactionInsight *)&v115 init];
  if (v43)
  {
    uint64_t v44 = [v33 copy];
    paymentHash = v43->_paymentHash;
    v43->_paymentHash = (NSString *)v44;

    uint64_t v46 = [v35 copy];
    transactionDate = v43->_transactionDate;
    v43->_transactionDate = (NSDate *)v46;

    uint64_t v48 = [v114 copy];
    merchantName = v43->_merchantName;
    v43->_merchantName = (NSString *)v48;

    uint64_t v50 = [v113 copy];
    merchantRawName = v43->_merchantRawName;
    v43->_merchantRawName = (NSString *)v50;

    uint64_t v52 = [v112 copy];
    industryCategory = v43->_industryCategory;
    v43->_industryCategory = (NSString *)v52;

    uint64_t v54 = [v111 copy];
    industryCode = v43->_industryCode;
    v43->_industryCode = (NSNumber *)v54;

    uint64_t v56 = [v110 copy];
    merchantType = v43->_merchantType;
    v43->_merchantType = (NSString *)v56;

    uint64_t v58 = [v109 copy];
    merchantCountryCode = v43->_merchantCountryCode;
    v43->_merchantCountryCode = (NSString *)v58;

    uint64_t v60 = [v108 copy];
    terminalIdentifier = v43->_terminalIdentifier;
    v43->_terminalIdentifier = (NSString *)v60;

    uint64_t v62 = [v107 copy];
    merchantAdditionalData = v43->_merchantAdditionalData;
    v43->_merchantAdditionalData = (NSString *)v62;

    uint64_t v64 = [v106 copy];
    paymentNetwork = v43->_paymentNetwork;
    v43->_paymentNetwork = (NSString *)v64;

    uint64_t v66 = [v105 copy];
    isCoarseLocation = v43->_isCoarseLocation;
    v43->_isCoarseLocation = (NSNumber *)v66;

    uint64_t v68 = [v104 copy];
    location = v43->_location;
    v43->_location = (CLLocation *)v68;

    uint64_t v70 = [v103 copy];
    merchantIdentifier = v43->_merchantIdentifier;
    v43->_merchantIdentifier = (NSString *)v70;

    uint64_t v72 = [v102 copy];
    merchantRawCANL = v43->_merchantRawCANL;
    v43->_merchantRawCANL = (NSString *)v72;

    uint64_t v74 = [v101 copy];
    merchantRawCity = v43->_merchantRawCity;
    v43->_merchantRawCity = (NSString *)v74;

    uint64_t v76 = [v100 copy];
    merchantRawState = v43->_merchantRawState;
    v43->_merchantRawState = (NSString *)v76;

    uint64_t v78 = [v99 copy];
    merchantRawCountry = v43->_merchantRawCountry;
    v43->_merchantRawCountry = (NSString *)v78;

    uint64_t v80 = [v98 copy];
    merchantCity = v43->_merchantCity;
    v43->_merchantCity = (NSString *)v80;

    uint64_t v82 = [v36 copy];
    merchantZip = v43->_merchantZip;
    v43->_merchantZip = (NSString *)v82;

    uint64_t v84 = [v37 copy];
    merchantState = v43->_merchantState;
    v43->_merchantState = (NSString *)v84;

    uint64_t v86 = [v38 copy];
    merchantCleanConfidenceLevel = v43->_merchantCleanConfidenceLevel;
    v43->_merchantCleanConfidenceLevel = (NSNumber *)v86;

    uint64_t v88 = [v39 copy];
    adamIdentifier = v43->_adamIdentifier;
    v43->_adamIdentifier = (NSNumber *)v88;

    uint64_t v90 = [v40 copy];
    webURL = v43->_webURL;
    v43->_webURL = (NSURL *)v90;

    uint64_t v92 = [v41 copy];
    webMerchantIdentifier = v43->_webMerchantIdentifier;
    v43->_webMerchantIdentifier = (NSString *)v92;

    uint64_t v94 = [v42 copy];
    webMerchantName = v43->_webMerchantName;
    v43->_webMerchantName = (NSString *)v94;
  }
  return v43;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSDate *)self->_transactionDate copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_paymentHash copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_merchantName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_merchantRawName copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_industryCategory copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSNumber *)self->_industryCode copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSString *)self->_merchantType copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  uint64_t v20 = [(NSString *)self->_merchantCountryCode copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  uint64_t v22 = [(NSString *)self->_terminalIdentifier copyWithZone:a3];
  v23 = (void *)v5[9];
  v5[9] = v22;

  uint64_t v24 = [(NSString *)self->_merchantAdditionalData copyWithZone:a3];
  v25 = (void *)v5[10];
  v5[10] = v24;

  uint64_t v26 = [(NSString *)self->_paymentNetwork copyWithZone:a3];
  v27 = (void *)v5[11];
  v5[11] = v26;

  uint64_t v28 = [(NSNumber *)self->_isCoarseLocation copyWithZone:a3];
  v29 = (void *)v5[12];
  v5[12] = v28;

  uint64_t v30 = [(CLLocation *)self->_location copyWithZone:a3];
  v31 = (void *)v5[13];
  v5[13] = v30;

  uint64_t v32 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  id v33 = (void *)v5[14];
  v5[14] = v32;

  uint64_t v34 = [(NSString *)self->_merchantRawCANL copyWithZone:a3];
  v35 = (void *)v5[15];
  v5[15] = v34;

  uint64_t v36 = [(NSString *)self->_merchantRawCity copyWithZone:a3];
  id v37 = (void *)v5[16];
  v5[16] = v36;

  uint64_t v38 = [(NSString *)self->_merchantRawState copyWithZone:a3];
  id v39 = (void *)v5[17];
  v5[17] = v38;

  uint64_t v40 = [(NSString *)self->_merchantRawCountry copyWithZone:a3];
  id v41 = (void *)v5[18];
  v5[18] = v40;

  uint64_t v42 = [(NSString *)self->_merchantCity copyWithZone:a3];
  v43 = (void *)v5[19];
  v5[19] = v42;

  uint64_t v44 = [(NSString *)self->_merchantZip copyWithZone:a3];
  v45 = (void *)v5[20];
  v5[20] = v44;

  uint64_t v46 = [(NSString *)self->_merchantState copyWithZone:a3];
  v47 = (void *)v5[21];
  v5[21] = v46;

  uint64_t v48 = [(NSNumber *)self->_merchantCleanConfidenceLevel copyWithZone:a3];
  v49 = (void *)v5[22];
  v5[22] = v48;

  uint64_t v50 = [(NSNumber *)self->_adamIdentifier copyWithZone:a3];
  v51 = (void *)v5[23];
  v5[23] = v50;

  uint64_t v52 = [(NSURL *)self->_webURL copyWithZone:a3];
  v53 = (void *)v5[24];
  v5[24] = v52;

  uint64_t v54 = [(NSString *)self->_webMerchantIdentifier copyWithZone:a3];
  v55 = (void *)v5[25];
  v5[25] = v54;

  uint64_t v56 = [(NSString *)self->_webMerchantName copyWithZone:a3];
  v57 = (void *)v5[26];
  v5[26] = v56;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_paymentHash];
  [v3 safelyAddObject:self->_transactionDate];
  [v3 safelyAddObject:self->_merchantName];
  [v3 safelyAddObject:self->_merchantRawName];
  [v3 safelyAddObject:self->_industryCategory];
  [v3 safelyAddObject:self->_industryCode];
  [v3 safelyAddObject:self->_merchantType];
  [v3 safelyAddObject:self->_merchantCountryCode];
  [v3 safelyAddObject:self->_terminalIdentifier];
  [v3 safelyAddObject:self->_merchantAdditionalData];
  [v3 safelyAddObject:self->_paymentNetwork];
  [v3 safelyAddObject:self->_isCoarseLocation];
  [v3 safelyAddObject:self->_location];
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_merchantRawCANL];
  [v3 safelyAddObject:self->_merchantRawCity];
  [v3 safelyAddObject:self->_merchantRawState];
  [v3 safelyAddObject:self->_merchantRawCountry];
  [v3 safelyAddObject:self->_merchantCity];
  [v3 safelyAddObject:self->_merchantZip];
  [v3 safelyAddObject:self->_merchantState];
  [v3 safelyAddObject:self->_merchantCleanConfidenceLevel];
  [v3 safelyAddObject:self->_adamIdentifier];
  [v3 safelyAddObject:self->_webURL];
  [v3 safelyAddObject:self->_webMerchantIdentifier];
  [v3 safelyAddObject:self->_webMerchantName];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKApplePayTransactionInsight *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_paymentHash, v6[1])
      && FKEqualObjects(self->_transactionDate, v6[2])
      && FKEqualObjects(self->_merchantName, v6[3])
      && FKEqualObjects(self->_merchantRawName, v6[4])
      && FKEqualObjects(self->_industryCategory, v6[5])
      && FKEqualObjects(self->_industryCode, v6[6])
      && FKEqualObjects(self->_merchantType, v6[7])
      && FKEqualObjects(self->_merchantCountryCode, v6[8])
      && FKEqualObjects(self->_terminalIdentifier, v6[9])
      && FKEqualObjects(self->_merchantAdditionalData, v6[10])
      && FKEqualObjects(self->_paymentNetwork, v6[11])
      && FKEqualObjects(self->_isCoarseLocation, v6[12])
      && ([(CLLocation *)self->_location distanceFromLocation:v6[13]], v7 == 0.0))
    {
      uint64_t v8 = [(CLLocation *)self->_location timestamp];
      v9 = [v6[13] timestamp];
      if (FKEqualObjects(v8, v9)
        && ([(CLLocation *)self->_location verticalAccuracy],
            double v11 = v10,
            [v6[13] verticalAccuracy],
            v11 == v12)
        && ([(CLLocation *)self->_location horizontalAccuracy],
            double v14 = v13,
            [v6[13] horizontalAccuracy],
            v14 == v15)
        && FKEqualObjects(self->_merchantIdentifier, v6[14])
        && FKEqualObjects(self->_merchantRawCANL, v6[15])
        && FKEqualObjects(self->_merchantRawCity, v6[16])
        && FKEqualObjects(self->_merchantRawState, v6[17])
        && FKEqualObjects(self->_merchantRawCountry, v6[18])
        && FKEqualObjects(self->_merchantCity, v6[19])
        && FKEqualObjects(self->_merchantZip, v6[20])
        && FKEqualObjects(self->_merchantState, v6[21])
        && FKEqualObjects(self->_merchantCleanConfidenceLevel, v6[22])
        && FKEqualObjects(self->_adamIdentifier, v6[23])
        && FKEqualObjects(self->_webURL, v6[24])
        && FKEqualObjects(self->_webMerchantIdentifier, v6[25]))
      {
        char v16 = FKEqualObjects(self->_webMerchantName, v6[26]);
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (NSString)merchantRawName
{
  return self->_merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
}

- (NSString)merchantType
{
  return self->_merchantType;
}

- (void)setMerchantType:(id)a3
{
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
}

- (NSString)terminalIdentifier
{
  return self->_terminalIdentifier;
}

- (void)setTerminalIdentifier:(id)a3
{
}

- (NSString)merchantAdditionalData
{
  return self->_merchantAdditionalData;
}

- (void)setMerchantAdditionalData:(id)a3
{
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
}

- (NSNumber)isCoarseLocation
{
  return self->_isCoarseLocation;
}

- (void)setIsCoarseLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)merchantRawCANL
{
  return self->_merchantRawCANL;
}

- (void)setMerchantRawCANL:(id)a3
{
}

- (NSString)merchantRawCity
{
  return self->_merchantRawCity;
}

- (void)setMerchantRawCity:(id)a3
{
}

- (NSString)merchantRawState
{
  return self->_merchantRawState;
}

- (void)setMerchantRawState:(id)a3
{
}

- (NSString)merchantRawCountry
{
  return self->_merchantRawCountry;
}

- (void)setMerchantRawCountry:(id)a3
{
}

- (NSString)merchantCity
{
  return self->_merchantCity;
}

- (void)setMerchantCity:(id)a3
{
}

- (NSString)merchantZip
{
  return self->_merchantZip;
}

- (void)setMerchantZip:(id)a3
{
}

- (NSString)merchantState
{
  return self->_merchantState;
}

- (void)setMerchantState:(id)a3
{
}

- (NSNumber)merchantCleanConfidenceLevel
{
  return self->_merchantCleanConfidenceLevel;
}

- (void)setMerchantCleanConfidenceLevel:(id)a3
{
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
}

- (NSURL)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_webURL, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCleanConfidenceLevel, 0);
  objc_storeStrong((id *)&self->_merchantState, 0);
  objc_storeStrong((id *)&self->_merchantZip, 0);
  objc_storeStrong((id *)&self->_merchantCity, 0);
  objc_storeStrong((id *)&self->_merchantRawCountry, 0);
  objc_storeStrong((id *)&self->_merchantRawState, 0);
  objc_storeStrong((id *)&self->_merchantRawCity, 0);
  objc_storeStrong((id *)&self->_merchantRawCANL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_isCoarseLocation, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_merchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_terminalIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantType, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);

  objc_storeStrong((id *)&self->_paymentHash, 0);
}

@end