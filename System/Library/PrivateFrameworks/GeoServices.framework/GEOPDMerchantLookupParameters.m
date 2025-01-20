@interface GEOPDMerchantLookupParameters
+ (BOOL)isValid:(id)a3;
- (BOOL)coarseLocationUsed;
- (BOOL)enableBrandMuidFallback;
- (BOOL)fuzzyMatched;
- (BOOL)hasAppIdentifier;
- (BOOL)hasBankTransactionInformation;
- (BOOL)hasCoarseLocationUsed;
- (BOOL)hasEnableBrandMuidFallback;
- (BOOL)hasFuzzyMatched;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentityMerchantInformation;
- (BOOL)hasIndustryCategory;
- (BOOL)hasIndustryCode;
- (BOOL)hasMerchantCode;
- (BOOL)hasMerchantInformation;
- (BOOL)hasPaymentNetwork;
- (BOOL)hasRawMerchantCode;
- (BOOL)hasTerminalId;
- (BOOL)hasTransactionCurrencyCode;
- (BOOL)hasTransactionId;
- (BOOL)hasTransactionLocation;
- (BOOL)hasTransactionLocationAge;
- (BOOL)hasTransactionStatus;
- (BOOL)hasTransactionTimestamp;
- (BOOL)hasTransactionType;
- (BOOL)hasWarsawMerchantIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)transactionLocation;
- (GEOPDAdamAppIdentifier)appIdentifier;
- (GEOPDBankTransactionInformation)bankTransactionInformation;
- (GEOPDIdentityMerchantInformation)identityMerchantInformation;
- (GEOPDMerchantInformation)merchantInformation;
- (GEOPDMerchantLookupParameters)init;
- (GEOPDMerchantLookupParameters)initWithData:(id)a3;
- (GEOPDMerchantLookupParameters)initWithDictionary:(id)a3;
- (GEOPDMerchantLookupParameters)initWithJSON:(id)a3;
- (GEOPDWarsawMerchantIdentifier)warsawMerchantIdentifier;
- (NSString)industryCategory;
- (NSString)merchantCode;
- (NSString)paymentNetwork;
- (NSString)rawMerchantCode;
- (NSString)terminalId;
- (NSString)transactionCurrencyCode;
- (NSString)transactionId;
- (PBUnknownFields)unknownFields;
- (double)transactionLocationAge;
- (double)transactionTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transactionStatusAsString:(int)a3;
- (id)transactionTypeAsString:(int)a3;
- (int)StringAsTransactionStatus:(id)a3;
- (int)StringAsTransactionType:(id)a3;
- (int)transactionStatus;
- (int)transactionType;
- (int64_t)industryCode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAppIdentifier;
- (void)_readBankTransactionInformation;
- (void)_readIdentityMerchantInformation;
- (void)_readIndustryCategory;
- (void)_readMerchantCode;
- (void)_readMerchantInformation;
- (void)_readPaymentNetwork;
- (void)_readRawMerchantCode;
- (void)_readTerminalId;
- (void)_readTransactionCurrencyCode;
- (void)_readTransactionId;
- (void)_readTransactionLocation;
- (void)_readWarsawMerchantIdentifier;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setBankTransactionInformation:(id)a3;
- (void)setCoarseLocationUsed:(BOOL)a3;
- (void)setEnableBrandMuidFallback:(BOOL)a3;
- (void)setFuzzyMatched:(BOOL)a3;
- (void)setHasCoarseLocationUsed:(BOOL)a3;
- (void)setHasEnableBrandMuidFallback:(BOOL)a3;
- (void)setHasFuzzyMatched:(BOOL)a3;
- (void)setHasIndustryCode:(BOOL)a3;
- (void)setHasTransactionLocationAge:(BOOL)a3;
- (void)setHasTransactionStatus:(BOOL)a3;
- (void)setHasTransactionTimestamp:(BOOL)a3;
- (void)setHasTransactionType:(BOOL)a3;
- (void)setIdentityMerchantInformation:(id)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(int64_t)a3;
- (void)setMerchantCode:(id)a3;
- (void)setMerchantInformation:(id)a3;
- (void)setPaymentNetwork:(id)a3;
- (void)setRawMerchantCode:(id)a3;
- (void)setTerminalId:(id)a3;
- (void)setTransactionCurrencyCode:(id)a3;
- (void)setTransactionId:(id)a3;
- (void)setTransactionLocation:(id)a3;
- (void)setTransactionLocationAge:(double)a3;
- (void)setTransactionStatus:(int)a3;
- (void)setTransactionTimestamp:(double)a3;
- (void)setTransactionType:(int)a3;
- (void)setWarsawMerchantIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMerchantLookupParameters

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_154;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_154;
  }
  if (a3) {
    v6 = @"paymentNetwork";
  }
  else {
    v6 = @"payment_network";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (void *)[v7 copy];
    [a1 setPaymentNetwork:v8];
  }
  if (a3) {
    v9 = @"merchantCode";
  }
  else {
    v9 = @"merchant_code";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setMerchantCode:v11];
  }
  if (a3) {
    v12 = @"transactionTimestamp";
  }
  else {
    v12 = @"transaction_timestamp";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setTransactionTimestamp:");
  }

  if (a3) {
    v14 = @"transactionLocation";
  }
  else {
    v14 = @"transaction_location";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOLocation alloc];
    if (a3) {
      uint64_t v17 = [(GEOLocation *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOLocation *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setTransactionLocation:v17];
  }
  if (a3) {
    v19 = @"transactionLocationAge";
  }
  else {
    v19 = @"transaction_location_age";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v20 doubleValue];
    objc_msgSend(a1, "setTransactionLocationAge:");
  }

  if (a3) {
    v21 = @"rawMerchantCode";
  }
  else {
    v21 = @"raw_merchant_code";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[v22 copy];
    [a1 setRawMerchantCode:v23];
  }
  if (a3) {
    v24 = @"industryCategory";
  }
  else {
    v24 = @"industry_category";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = (void *)[v25 copy];
    [a1 setIndustryCategory:v26];
  }
  if (a3) {
    v27 = @"industryCode";
  }
  else {
    v27 = @"industry_code";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIndustryCode:", objc_msgSend(v28, "longLongValue"));
  }

  if (a3) {
    v29 = @"enableBrandMuidFallback";
  }
  else {
    v29 = @"enable_brand_muid_fallback";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnableBrandMuidFallback:", objc_msgSend(v30, "BOOLValue"));
  }

  if (a3) {
    v31 = @"terminalId";
  }
  else {
    v31 = @"terminal_id";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = (void *)[v32 copy];
    [a1 setTerminalId:v33];
  }
  if (a3) {
    v34 = @"transactionCurrencyCode";
  }
  else {
    v34 = @"transaction_currency_code";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36 = (void *)[v35 copy];
    [a1 setTransactionCurrencyCode:v36];
  }
  if (a3) {
    v37 = @"transactionType";
  }
  else {
    v37 = @"transaction_type";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v38;
    if ([v39 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v40 = 0;
    }
    else if ([v39 isEqualToString:@"CONTACTLESS"])
    {
      uint64_t v40 = 1;
    }
    else if ([v39 isEqualToString:@"INAPP"])
    {
      uint64_t v40 = 2;
    }
    else if ([v39 isEqualToString:@"WEB"])
    {
      uint64_t v40 = 3;
    }
    else if ([v39 isEqualToString:@"PHYSICAL"])
    {
      uint64_t v40 = 4;
    }
    else if ([v39 isEqualToString:@"VIRTUAL"])
    {
      uint64_t v40 = 5;
    }
    else if ([v39 isEqualToString:@"IDENTITY"])
    {
      uint64_t v40 = 6;
    }
    else
    {
      uint64_t v40 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_84;
    }
    uint64_t v40 = [v38 intValue];
  }
  [a1 setTransactionType:v40];
LABEL_84:

  if (a3) {
    v41 = @"warsawMerchantIdentifier";
  }
  else {
    v41 = @"warsaw_merchant_identifier";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v43 = [GEOPDWarsawMerchantIdentifier alloc];
    if (v43) {
      v44 = (void *)-[GEOPDWarsawMerchantIdentifier _initWithDictionary:isJSON:](v43, v42, a3);
    }
    else {
      v44 = 0;
    }
    [a1 setWarsawMerchantIdentifier:v44];
  }
  if (a3) {
    v45 = @"appIdentifier";
  }
  else {
    v45 = @"app_identifier";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v47 = [GEOPDAdamAppIdentifier alloc];
    if (v47) {
      v48 = (void *)-[GEOPDAdamAppIdentifier _initWithDictionary:isJSON:](v47, v46, a3);
    }
    else {
      v48 = 0;
    }
    [a1 setAppIdentifier:v48];
  }
  if (a3) {
    v49 = @"merchantInformation";
  }
  else {
    v49 = @"merchant_information";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [GEOPDMerchantInformation alloc];
    if (a3) {
      uint64_t v52 = [(GEOPDMerchantInformation *)v51 initWithJSON:v50];
    }
    else {
      uint64_t v52 = [(GEOPDMerchantInformation *)v51 initWithDictionary:v50];
    }
    v53 = (void *)v52;
    [a1 setMerchantInformation:v52];
  }
  if (a3) {
    v54 = @"transactionStatus";
  }
  else {
    v54 = @"transaction_status";
  }
  v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v55;
    if ([v56 isEqualToString:@"TRANSACTION_STATUS_UNKNOWN"])
    {
      uint64_t v57 = 0;
    }
    else if ([v56 isEqualToString:@"TRANSACTION_STATUS_AUTHORIZATION"])
    {
      uint64_t v57 = 1;
    }
    else if ([v56 isEqualToString:@"TRANSACTION_STATUS_SETTLEMENT"])
    {
      uint64_t v57 = 2;
    }
    else if ([v56 isEqualToString:@"TRANSACTION_STATUS_REFUND"])
    {
      uint64_t v57 = 3;
    }
    else
    {
      uint64_t v57 = 0;
    }

    goto LABEL_122;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v57 = [v55 intValue];
LABEL_122:
    [a1 setTransactionStatus:v57];
  }

  if (a3) {
    v58 = @"transactionId";
  }
  else {
    v58 = @"transaction_id";
  }
  v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v60 = (void *)[v59 copy];
    [a1 setTransactionId:v60];
  }
  if (a3) {
    v61 = @"fuzzyMatched";
  }
  else {
    v61 = @"fuzzy_matched";
  }
  v62 = [v5 objectForKeyedSubscript:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFuzzyMatched:", objc_msgSend(v62, "BOOLValue"));
  }

  if (a3) {
    v63 = @"coarseLocationUsed";
  }
  else {
    v63 = @"coarse_location_used";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCoarseLocationUsed:", objc_msgSend(v64, "BOOLValue"));
  }

  if (a3) {
    v65 = @"identityMerchantInformation";
  }
  else {
    v65 = @"identity_merchant_information";
  }
  v66 = [v5 objectForKeyedSubscript:v65];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v67 = [GEOPDIdentityMerchantInformation alloc];
    if (v67) {
      v68 = (void *)-[GEOPDIdentityMerchantInformation _initWithDictionary:isJSON:](v67, v66, a3);
    }
    else {
      v68 = 0;
    }
    [a1 setIdentityMerchantInformation:v68];
  }
  if (a3) {
    v69 = @"bankTransactionInformation";
  }
  else {
    v69 = @"bank_transaction_information";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v71 = [GEOPDBankTransactionInformation alloc];
    if (a3) {
      uint64_t v72 = [(GEOPDBankTransactionInformation *)v71 initWithJSON:v70];
    }
    else {
      uint64_t v72 = [(GEOPDBankTransactionInformation *)v71 initWithDictionary:v70];
    }
    v73 = (void *)v72;
    [a1 setBankTransactionInformation:v72];
  }
LABEL_154:

  return a1;
}

void __59__GEOPDMerchantLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDMerchantLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantLookupParameters;
  v2 = [(GEOPDMerchantLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantLookupParameters;
  v3 = [(GEOPDMerchantLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readPaymentNetwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaymentNetwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasPaymentNetwork
{
  return self->_paymentNetwork != 0;
}

- (NSString)paymentNetwork
{
  -[GEOPDMerchantLookupParameters _readPaymentNetwork]((uint64_t)self);
  paymentNetwork = self->_paymentNetwork;

  return paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x408000u;
  objc_storeStrong((id *)&self->_paymentNetwork, a3);
}

- (void)_readMerchantCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCode_tags_4225);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasMerchantCode
{
  return self->_merchantCode != 0;
}

- (NSString)merchantCode
{
  -[GEOPDMerchantLookupParameters _readMerchantCode]((uint64_t)self);
  merchantCode = self->_merchantCode;

  return merchantCode;
}

- (void)setMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x402000u;
  objc_storeStrong((id *)&self->_merchantCode, a3);
}

- (double)transactionTimestamp
{
  return self->_transactionTimestamp;
}

- (void)setTransactionTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400004u;
  self->_transactionTimestamp = a3;
}

- (void)setHasTransactionTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 4194308;
  }
  else {
    int v3 = 0x400000;
  }
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasTransactionTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readTransactionLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionLocation_tags_4226);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionLocation
{
  return self->_transactionLocation != 0;
}

- (GEOLocation)transactionLocation
{
  -[GEOPDMerchantLookupParameters _readTransactionLocation]((uint64_t)self);
  transactionLocation = self->_transactionLocation;

  return transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x500000u;
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (double)transactionLocationAge
{
  return self->_transactionLocationAge;
}

- (void)setTransactionLocationAge:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400002u;
  self->_transactionLocationAge = a3;
}

- (void)setHasTransactionLocationAge:(BOOL)a3
{
  if (a3) {
    int v3 = 4194306;
  }
  else {
    int v3 = 0x400000;
  }
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasTransactionLocationAge
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readRawMerchantCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawMerchantCode_tags_4227);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasRawMerchantCode
{
  return self->_rawMerchantCode != 0;
}

- (NSString)rawMerchantCode
{
  -[GEOPDMerchantLookupParameters _readRawMerchantCode]((uint64_t)self);
  rawMerchantCode = self->_rawMerchantCode;

  return rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x410000u;
  objc_storeStrong((id *)&self->_rawMerchantCode, a3);
}

- (void)_readIndustryCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIndustryCategory_tags_4228);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasIndustryCategory
{
  return self->_industryCategory != 0;
}

- (NSString)industryCategory
{
  -[GEOPDMerchantLookupParameters _readIndustryCategory]((uint64_t)self);
  industryCategory = self->_industryCategory;

  return industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x401000u;
  objc_storeStrong((id *)&self->_industryCategory, a3);
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x400001u;
  self->_industryCode = a3;
}

- (void)setHasIndustryCode:(BOOL)a3
{
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x400000);
}

- (BOOL)hasIndustryCode
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)enableBrandMuidFallback
{
  return self->_enableBrandMuidFallback;
}

- (void)setEnableBrandMuidFallback:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400040u;
  self->_enableBrandMuidFallback = a3;
}

- (void)setHasEnableBrandMuidFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 4194368;
  }
  else {
    int v3 = 0x400000;
  }
  self->_flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFBFFFBF | v3);
}

- (BOOL)hasEnableBrandMuidFallback
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (void)_readTerminalId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTerminalId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTerminalId
{
  return self->_terminalId != 0;
}

- (NSString)terminalId
{
  -[GEOPDMerchantLookupParameters _readTerminalId]((uint64_t)self);
  terminalId = self->_terminalId;

  return terminalId;
}

- (void)setTerminalId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x420000u;
  objc_storeStrong((id *)&self->_terminalId, a3);
}

- (void)_readTransactionCurrencyCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionCurrencyCode_tags_4229);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionCurrencyCode
{
  return self->_transactionCurrencyCode != 0;
}

- (NSString)transactionCurrencyCode
{
  -[GEOPDMerchantLookupParameters _readTransactionCurrencyCode]((uint64_t)self);
  transactionCurrencyCode = self->_transactionCurrencyCode;

  return transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x440000u;
  objc_storeStrong((id *)&self->_transactionCurrencyCode, a3);
}

- (int)transactionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_transactionType;
  }
  else {
    return 0;
  }
}

- (void)setTransactionType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400010u;
  self->_transactionType = a3;
}

- (void)setHasTransactionType:(BOOL)a3
{
  if (a3) {
    int v3 = 4194320;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EE18152C7C1C54C7C47B391F7B08A504 flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTransactionType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)transactionTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DCC10[a3];
  }

  return v3;
}

- (int)StringAsTransactionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACTLESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INAPP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEB"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PHYSICAL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VIRTUAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IDENTITY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readWarsawMerchantIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWarsawMerchantIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasWarsawMerchantIdentifier
{
  return self->_warsawMerchantIdentifier != 0;
}

- (GEOPDWarsawMerchantIdentifier)warsawMerchantIdentifier
{
  -[GEOPDMerchantLookupParameters _readWarsawMerchantIdentifier]((uint64_t)self);
  warsawMerchantIdentifier = self->_warsawMerchantIdentifier;

  return warsawMerchantIdentifier;
}

- (void)setWarsawMerchantIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x600000u;
  objc_storeStrong((id *)&self->_warsawMerchantIdentifier, a3);
}

- (void)_readAppIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags_4230);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (GEOPDAdamAppIdentifier)appIdentifier
{
  -[GEOPDMerchantLookupParameters _readAppIdentifier]((uint64_t)self);
  appIdentifier = self->_appIdentifier;

  return appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400200u;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)_readMerchantInformation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantInformation_tags_4231);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasMerchantInformation
{
  return self->_merchantInformation != 0;
}

- (GEOPDMerchantInformation)merchantInformation
{
  -[GEOPDMerchantLookupParameters _readMerchantInformation]((uint64_t)self);
  merchantInformation = self->_merchantInformation;

  return merchantInformation;
}

- (void)setMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x404000u;
  objc_storeStrong((id *)&self->_merchantInformation, a3);
}

- (int)transactionStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_transactionStatus;
  }
  else {
    return 0;
  }
}

- (void)setTransactionStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x400008u;
  self->_transactionStatus = a3;
}

- (void)setHasTransactionStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 4194312;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EE18152C7C1C54C7C47B391F7B08A504 flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTransactionStatus
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)transactionStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DCC48[a3];
  }

  return v3;
}

- (int)StringAsTransactionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSACTION_STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSACTION_STATUS_AUTHORIZATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSACTION_STATUS_SETTLEMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSACTION_STATUS_REFUND"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTransactionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 178) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTransactionId
{
  return self->_transactionId != 0;
}

- (NSString)transactionId
{
  -[GEOPDMerchantLookupParameters _readTransactionId]((uint64_t)self);
  transactionId = self->_transactionId;

  return transactionId;
}

- (void)setTransactionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x480000u;
  objc_storeStrong((id *)&self->_transactionId, a3);
}

- (BOOL)fuzzyMatched
{
  return self->_fuzzyMatched;
}

- (void)setFuzzyMatched:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400080u;
  self->_fuzzyMatched = a3;
}

- (void)setHasFuzzyMatched:(BOOL)a3
{
  if (a3) {
    int v3 = 4194432;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EE18152C7C1C54C7C47B391F7B08A504 flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasFuzzyMatched
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)coarseLocationUsed
{
  return self->_coarseLocationUsed;
}

- (void)setCoarseLocationUsed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400020u;
  self->_coarseLocationUsed = a3;
}

- (void)setHasCoarseLocationUsed:(BOOL)a3
{
  if (a3) {
    int v3 = 4194336;
  }
  else {
    int v3 = 0x400000;
  }
  self->_$EE18152C7C1C54C7C47B391F7B08A504 flags = ($EE18152C7C1C54C7C47B391F7B08A504)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasCoarseLocationUsed
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readIdentityMerchantInformation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentityMerchantInformation_tags_4232);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasIdentityMerchantInformation
{
  return self->_identityMerchantInformation != 0;
}

- (GEOPDIdentityMerchantInformation)identityMerchantInformation
{
  -[GEOPDMerchantLookupParameters _readIdentityMerchantInformation]((uint64_t)self);
  identityMerchantInformation = self->_identityMerchantInformation;

  return identityMerchantInformation;
}

- (void)setIdentityMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400800u;
  objc_storeStrong((id *)&self->_identityMerchantInformation, a3);
}

- (void)_readBankTransactionInformation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(unsigned char *)(a1 + 177) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBankTransactionInformation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasBankTransactionInformation
{
  return self->_bankTransactionInformation != 0;
}

- (GEOPDBankTransactionInformation)bankTransactionInformation
{
  -[GEOPDMerchantLookupParameters _readBankTransactionInformation]((uint64_t)self);
  bankTransactionInformation = self->_bankTransactionInformation;

  return bankTransactionInformation;
}

- (void)setBankTransactionInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x400400u;
  objc_storeStrong((id *)&self->_bankTransactionInformation, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMerchantLookupParameters;
  int v4 = [(GEOPDMerchantLookupParameters *)&v8 description];
  id v5 = [(GEOPDMerchantLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 paymentNetwork];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"paymentNetwork";
      }
      else {
        objc_super v6 = @"payment_network";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 merchantCode];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"merchantCode";
      }
      else {
        objc_super v8 = @"merchant_code";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ((*(unsigned char *)(a1 + 176) & 4) != 0)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 136)];
      if (a2) {
        id v10 = @"transactionTimestamp";
      }
      else {
        id v10 = @"transaction_timestamp";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 transactionLocation];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"transactionLocation";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"transaction_location";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ((*(unsigned char *)(a1 + 176) & 2) != 0)
    {
      v15 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
      if (a2) {
        v16 = @"transactionLocationAge";
      }
      else {
        v16 = @"transaction_location_age";
      }
      [v4 setObject:v15 forKey:v16];
    }
    uint64_t v17 = [(id)a1 rawMerchantCode];
    if (v17)
    {
      if (a2) {
        v18 = @"rawMerchantCode";
      }
      else {
        v18 = @"raw_merchant_code";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = [(id)a1 industryCategory];
    if (v19)
    {
      if (a2) {
        v20 = @"industryCategory";
      }
      else {
        v20 = @"industry_category";
      }
      [v4 setObject:v19 forKey:v20];
    }

    int v21 = *(_DWORD *)(a1 + 176);
    if (v21)
    {
      v22 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v23 = @"industryCode";
      }
      else {
        v23 = @"industry_code";
      }
      [v4 setObject:v22 forKey:v23];

      int v21 = *(_DWORD *)(a1 + 176);
    }
    if ((v21 & 0x40) != 0)
    {
      v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 173)];
      if (a2) {
        v25 = @"enableBrandMuidFallback";
      }
      else {
        v25 = @"enable_brand_muid_fallback";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [(id)a1 terminalId];
    if (v26)
    {
      if (a2) {
        v27 = @"terminalId";
      }
      else {
        v27 = @"terminal_id";
      }
      [v4 setObject:v26 forKey:v27];
    }

    v28 = [(id)a1 transactionCurrencyCode];
    if (v28)
    {
      if (a2) {
        v29 = @"transactionCurrencyCode";
      }
      else {
        v29 = @"transaction_currency_code";
      }
      [v4 setObject:v28 forKey:v29];
    }

    if ((*(unsigned char *)(a1 + 176) & 0x10) != 0)
    {
      uint64_t v30 = *(int *)(a1 + 168);
      if (v30 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 168));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = off_1E53DCC10[v30];
      }
      if (a2) {
        v32 = @"transactionType";
      }
      else {
        v32 = @"transaction_type";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = [(id)a1 warsawMerchantIdentifier];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"warsawMerchantIdentifier";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"warsaw_merchant_identifier";
      }
      [v4 setObject:v35 forKey:v36];
    }
    v37 = [(id)a1 appIdentifier];
    v38 = v37;
    if (v37)
    {
      if (a2)
      {
        id v39 = [v37 jsonRepresentation];
        uint64_t v40 = @"appIdentifier";
      }
      else
      {
        id v39 = [v37 dictionaryRepresentation];
        uint64_t v40 = @"app_identifier";
      }
      [v4 setObject:v39 forKey:v40];
    }
    v41 = [(id)a1 merchantInformation];
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"merchantInformation";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"merchant_information";
      }
      [v4 setObject:v43 forKey:v44];
    }
    if ((*(unsigned char *)(a1 + 176) & 8) != 0)
    {
      uint64_t v45 = *(int *)(a1 + 164);
      if (v45 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 164));
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = off_1E53DCC48[v45];
      }
      if (a2) {
        v47 = @"transactionStatus";
      }
      else {
        v47 = @"transaction_status";
      }
      [v4 setObject:v46 forKey:v47];
    }
    v48 = [(id)a1 transactionId];
    if (v48)
    {
      if (a2) {
        v49 = @"transactionId";
      }
      else {
        v49 = @"transaction_id";
      }
      [v4 setObject:v48 forKey:v49];
    }

    int v50 = *(_DWORD *)(a1 + 176);
    if ((v50 & 0x80) != 0)
    {
      v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 174)];
      if (a2) {
        uint64_t v52 = @"fuzzyMatched";
      }
      else {
        uint64_t v52 = @"fuzzy_matched";
      }
      [v4 setObject:v51 forKey:v52];

      int v50 = *(_DWORD *)(a1 + 176);
    }
    if ((v50 & 0x20) != 0)
    {
      v53 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 172)];
      if (a2) {
        v54 = @"coarseLocationUsed";
      }
      else {
        v54 = @"coarse_location_used";
      }
      [v4 setObject:v53 forKey:v54];
    }
    v55 = [(id)a1 identityMerchantInformation];
    id v56 = v55;
    if (v55)
    {
      if (a2)
      {
        uint64_t v57 = [v55 jsonRepresentation];
        v58 = @"identityMerchantInformation";
      }
      else
      {
        uint64_t v57 = [v55 dictionaryRepresentation];
        v58 = @"identity_merchant_information";
      }
      [v4 setObject:v57 forKey:v58];
    }
    v59 = [(id)a1 bankTransactionInformation];
    v60 = v59;
    if (v59)
    {
      if (a2)
      {
        v61 = [v59 jsonRepresentation];
        v62 = @"bankTransactionInformation";
      }
      else
      {
        v61 = [v59 dictionaryRepresentation];
        v62 = @"bank_transaction_information";
      }
      [v4 setObject:v61 forKey:v62];
    }
    v63 = *(void **)(a1 + 16);
    if (v63)
    {
      v64 = [v63 dictionaryRepresentation];
      v65 = v64;
      if (a2)
      {
        v66 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v64, "count"));
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __59__GEOPDMerchantLookupParameters__dictionaryRepresentation___block_invoke;
        v70[3] = &unk_1E53D8860;
        id v67 = v66;
        id v71 = v67;
        [v65 enumerateKeysAndObjectsUsingBlock:v70];
        id v68 = v67;

        v65 = v68;
      }
      [v4 setObject:v65 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDMerchantLookupParameters)initWithDictionary:(id)a3
{
  return (GEOPDMerchantLookupParameters *)-[GEOPDMerchantLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDMerchantLookupParameters)initWithJSON:(id)a3
{
  return (GEOPDMerchantLookupParameters *)-[GEOPDMerchantLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_4288;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4289;
    }
    GEOPDMerchantLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDMerchantLookupParametersCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDMerchantLookupParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDMerchantLookupParameters *)self readAll:0];
    if (self->_paymentNetwork) {
      PBDataWriterWriteStringField();
    }
    id v5 = v10;
    if (self->_merchantCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v10;
    }
    if (self->_transactionLocation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v10;
    }
    if (self->_rawMerchantCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_industryCategory)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      PBDataWriterWriteSint64Field();
      id v5 = v10;
      $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
    }
    if (self->_terminalId)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_transactionCurrencyCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
    }
    if (self->_warsawMerchantIdentifier)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_appIdentifier)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_merchantInformation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
    }
    if (self->_transactionId)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    $EE18152C7C1C54C7C47B391F7B08A504 v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
      $EE18152C7C1C54C7C47B391F7B08A504 v7 = self->_flags;
    }
    if ((*(unsigned char *)&v7 & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
    }
    if (self->_identityMerchantInformation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_bankTransactionInformation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDMerchantLookupParameters _readBankTransactionInformation]((uint64_t)self);
  if ([(GEOPDBankTransactionInformation *)self->_bankTransactionInformation hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEOPDMerchantLookupParameters _readTransactionLocation]((uint64_t)self);
  transactionLocation = self->_transactionLocation;

  return [(GEOLocation *)transactionLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  $EE18152C7C1C54C7C47B391F7B08A504 v7 = (id *)a3;
  [(GEOPDMerchantLookupParameters *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 38) = self->_readerMarkPos;
  *((_DWORD *)v7 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_paymentNetwork) {
    objc_msgSend(v7, "setPaymentNetwork:");
  }
  if (self->_merchantCode) {
    objc_msgSend(v7, "setMerchantCode:");
  }
  int v4 = v7;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v7[17] = *(id *)&self->_transactionTimestamp;
    *((_DWORD *)v7 + 44) |= 4u;
  }
  if (self->_transactionLocation)
  {
    objc_msgSend(v7, "setTransactionLocation:");
    int v4 = v7;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[15] = *(id *)&self->_transactionLocationAge;
    *((_DWORD *)v4 + 44) |= 2u;
  }
  if (self->_rawMerchantCode)
  {
    objc_msgSend(v7, "setRawMerchantCode:");
    int v4 = v7;
  }
  if (self->_industryCategory)
  {
    objc_msgSend(v7, "setIndustryCategory:");
    int v4 = v7;
  }
  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    v4[7] = self->_industryCode;
    *((_DWORD *)v4 + 44) |= 1u;
    $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *((unsigned char *)v4 + 173) = self->_enableBrandMuidFallback;
    *((_DWORD *)v4 + 44) |= 0x40u;
  }
  if (self->_terminalId)
  {
    objc_msgSend(v7, "setTerminalId:");
    int v4 = v7;
  }
  if (self->_transactionCurrencyCode)
  {
    objc_msgSend(v7, "setTransactionCurrencyCode:");
    int v4 = v7;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_transactionType;
    *((_DWORD *)v4 + 44) |= 0x10u;
  }
  if (self->_warsawMerchantIdentifier)
  {
    objc_msgSend(v7, "setWarsawMerchantIdentifier:");
    int v4 = v7;
  }
  if (self->_appIdentifier)
  {
    objc_msgSend(v7, "setAppIdentifier:");
    int v4 = v7;
  }
  if (self->_merchantInformation)
  {
    objc_msgSend(v7, "setMerchantInformation:");
    int v4 = v7;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 41) = self->_transactionStatus;
    *((_DWORD *)v4 + 44) |= 8u;
  }
  if (self->_transactionId)
  {
    objc_msgSend(v7, "setTransactionId:");
    int v4 = v7;
  }
  $EE18152C7C1C54C7C47B391F7B08A504 v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    *((unsigned char *)v4 + 174) = self->_fuzzyMatched;
    *((_DWORD *)v4 + 44) |= 0x80u;
    $EE18152C7C1C54C7C47B391F7B08A504 v6 = self->_flags;
  }
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 172) = self->_coarseLocationUsed;
    *((_DWORD *)v4 + 44) |= 0x20u;
  }
  if (self->_identityMerchantInformation)
  {
    objc_msgSend(v7, "setIdentityMerchantInformation:");
    int v4 = v7;
  }
  if (self->_bankTransactionInformation)
  {
    objc_msgSend(v7, "setBankTransactionInformation:");
    int v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $EE18152C7C1C54C7C47B391F7B08A504 v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMerchantLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDMerchantLookupParameters *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_paymentNetwork copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_merchantCode copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(double *)(v5 + 136) = self->_transactionTimestamp;
    *(_DWORD *)(v5 + 176) |= 4u;
  }
  id v13 = [(GEOLocation *)self->_transactionLocation copyWithZone:a3];
  v14 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_transactionLocationAge;
    *(_DWORD *)(v5 + 176) |= 2u;
  }
  uint64_t v15 = [(NSString *)self->_rawMerchantCode copyWithZone:a3];
  v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  uint64_t v17 = [(NSString *)self->_industryCategory copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(void *)(v5 + 56) = self->_industryCode;
    *(_DWORD *)(v5 + 176) |= 1u;
    $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 173) = self->_enableBrandMuidFallback;
    *(_DWORD *)(v5 + 176) |= 0x40u;
  }
  uint64_t v20 = [(NSString *)self->_terminalId copyWithZone:a3];
  int v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  uint64_t v22 = [(NSString *)self->_transactionCurrencyCode copyWithZone:a3];
  v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_transactionType;
    *(_DWORD *)(v5 + 176) |= 0x10u;
  }
  id v24 = [(GEOPDWarsawMerchantIdentifier *)self->_warsawMerchantIdentifier copyWithZone:a3];
  v25 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v24;

  id v26 = [(GEOPDAdamAppIdentifier *)self->_appIdentifier copyWithZone:a3];
  v27 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v26;

  id v28 = [(GEOPDMerchantInformation *)self->_merchantInformation copyWithZone:a3];
  v29 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v28;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_transactionStatus;
    *(_DWORD *)(v5 + 176) |= 8u;
  }
  uint64_t v30 = [(NSString *)self->_transactionId copyWithZone:a3];
  v31 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v30;

  $EE18152C7C1C54C7C47B391F7B08A504 v32 = self->_flags;
  if ((*(unsigned char *)&v32 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 174) = self->_fuzzyMatched;
    *(_DWORD *)(v5 + 176) |= 0x80u;
    $EE18152C7C1C54C7C47B391F7B08A504 v32 = self->_flags;
  }
  if ((*(unsigned char *)&v32 & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 172) = self->_coarseLocationUsed;
    *(_DWORD *)(v5 + 176) |= 0x20u;
  }
  id v33 = [(GEOPDIdentityMerchantInformation *)self->_identityMerchantInformation copyWithZone:a3];
  v34 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v33;

  id v35 = [(GEOPDBankTransactionInformation *)self->_bankTransactionInformation copyWithZone:a3];
  v36 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v35;

  v37 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v37;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  [(GEOPDMerchantLookupParameters *)self readAll:1];
  [v4 readAll:1];
  paymentNetwork = self->_paymentNetwork;
  if ((unint64_t)paymentNetwork | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](paymentNetwork, "isEqual:")) {
      goto LABEL_79;
    }
  }
  merchantCode = self->_merchantCode;
  if ((unint64_t)merchantCode | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantCode, "isEqual:")) {
      goto LABEL_79;
    }
  }
  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  int v8 = *((_DWORD *)v4 + 44);
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_transactionTimestamp != *((double *)v4 + 17)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_79;
  }
  transactionLocation = self->_transactionLocation;
  if ((unint64_t)transactionLocation | *((void *)v4 + 16))
  {
    if (!-[GEOLocation isEqual:](transactionLocation, "isEqual:")) {
      goto LABEL_79;
    }
    $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
    int v8 = *((_DWORD *)v4 + 44);
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_transactionLocationAge != *((double *)v4 + 15)) {
      goto LABEL_79;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_79;
  }
  rawMerchantCode = self->_rawMerchantCode;
  if ((unint64_t)rawMerchantCode | *((void *)v4 + 11)
    && !-[NSString isEqual:](rawMerchantCode, "isEqual:"))
  {
    goto LABEL_79;
  }
  industryCategory = self->_industryCategory;
  if ((unint64_t)industryCategory | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](industryCategory, "isEqual:")) {
      goto LABEL_79;
    }
  }
  $EE18152C7C1C54C7C47B391F7B08A504 v12 = self->_flags;
  int v13 = *((_DWORD *)v4 + 44);
  if (*(unsigned char *)&v12)
  {
    if ((v13 & 1) == 0 || self->_industryCode != *((void *)v4 + 7)) {
      goto LABEL_79;
    }
  }
  else if (v13)
  {
    goto LABEL_79;
  }
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0) {
      goto LABEL_79;
    }
    if (self->_enableBrandMuidFallback)
    {
      if (!*((unsigned char *)v4 + 173)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 173))
    {
      goto LABEL_79;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  terminalId = self->_terminalId;
  if ((unint64_t)terminalId | *((void *)v4 + 12)
    && !-[NSString isEqual:](terminalId, "isEqual:"))
  {
    goto LABEL_79;
  }
  transactionCurrencyCode = self->_transactionCurrencyCode;
  if ((unint64_t)transactionCurrencyCode | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](transactionCurrencyCode, "isEqual:")) {
      goto LABEL_79;
    }
  }
  int v16 = *((_DWORD *)v4 + 44);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_transactionType != *((_DWORD *)v4 + 42)) {
      goto LABEL_79;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  warsawMerchantIdentifier = self->_warsawMerchantIdentifier;
  if ((unint64_t)warsawMerchantIdentifier | *((void *)v4 + 18)
    && !-[GEOPDWarsawMerchantIdentifier isEqual:](warsawMerchantIdentifier, "isEqual:"))
  {
    goto LABEL_79;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((void *)v4 + 3))
  {
    if (!-[GEOPDAdamAppIdentifier isEqual:](appIdentifier, "isEqual:")) {
      goto LABEL_79;
    }
  }
  merchantInformation = self->_merchantInformation;
  if ((unint64_t)merchantInformation | *((void *)v4 + 9))
  {
    if (!-[GEOPDMerchantInformation isEqual:](merchantInformation, "isEqual:")) {
      goto LABEL_79;
    }
  }
  $EE18152C7C1C54C7C47B391F7B08A504 v20 = self->_flags;
  int v21 = *((_DWORD *)v4 + 44);
  if ((*(unsigned char *)&v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_transactionStatus != *((_DWORD *)v4 + 41)) {
      goto LABEL_79;
    }
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_79;
  }
  transactionId = self->_transactionId;
  if ((unint64_t)transactionId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](transactionId, "isEqual:")) {
      goto LABEL_79;
    }
    $EE18152C7C1C54C7C47B391F7B08A504 v20 = self->_flags;
    int v21 = *((_DWORD *)v4 + 44);
  }
  if ((*(unsigned char *)&v20 & 0x80) != 0)
  {
    if ((v21 & 0x80) == 0) {
      goto LABEL_79;
    }
    if (self->_fuzzyMatched)
    {
      if (!*((unsigned char *)v4 + 174)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 174))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(unsigned char *)&v20 & 0x20) != 0)
  {
    if ((v21 & 0x20) != 0)
    {
      if (self->_coarseLocationUsed)
      {
        if (!*((unsigned char *)v4 + 172)) {
          goto LABEL_79;
        }
        goto LABEL_75;
      }
      if (!*((unsigned char *)v4 + 172)) {
        goto LABEL_75;
      }
    }
LABEL_79:
    char v25 = 0;
    goto LABEL_80;
  }
  if ((v21 & 0x20) != 0) {
    goto LABEL_79;
  }
LABEL_75:
  identityMerchantInformation = self->_identityMerchantInformation;
  if ((unint64_t)identityMerchantInformation | *((void *)v4 + 5)
    && !-[GEOPDIdentityMerchantInformation isEqual:](identityMerchantInformation, "isEqual:"))
  {
    goto LABEL_79;
  }
  bankTransactionInformation = self->_bankTransactionInformation;
  if ((unint64_t)bankTransactionInformation | *((void *)v4 + 4)) {
    char v25 = -[GEOPDBankTransactionInformation isEqual:](bankTransactionInformation, "isEqual:");
  }
  else {
    char v25 = 1;
  }
LABEL_80:

  return v25;
}

- (unint64_t)hash
{
  [(GEOPDMerchantLookupParameters *)self readAll:1];
  NSUInteger v39 = [(NSString *)self->_paymentNetwork hash];
  NSUInteger v38 = [(NSString *)self->_merchantCode hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    double transactionTimestamp = self->_transactionTimestamp;
    double v4 = -transactionTimestamp;
    if (transactionTimestamp >= 0.0) {
      double v4 = self->_transactionTimestamp;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v37 = v10;
  }
  else
  {
    unint64_t v37 = 0;
  }
  unint64_t v36 = [(GEOLocation *)self->_transactionLocation hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    double transactionLocationAge = self->_transactionLocationAge;
    double v12 = -transactionLocationAge;
    if (transactionLocationAge >= 0.0) {
      double v12 = self->_transactionLocationAge;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v15 += (unint64_t)v14;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
    unint64_t v35 = v15;
  }
  else
  {
    unint64_t v35 = 0;
  }
  NSUInteger v34 = [(NSString *)self->_rawMerchantCode hash];
  NSUInteger v33 = [(NSString *)self->_industryCategory hash];
  $EE18152C7C1C54C7C47B391F7B08A504 flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v32 = 2654435761 * self->_industryCode;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
LABEL_21:
      uint64_t v31 = 2654435761 * self->_enableBrandMuidFallback;
      goto LABEL_24;
    }
  }
  uint64_t v31 = 0;
LABEL_24:
  NSUInteger v17 = [(NSString *)self->_terminalId hash];
  NSUInteger v18 = [(NSString *)self->_transactionCurrencyCode hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v19 = 2654435761 * self->_transactionType;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = [(GEOPDWarsawMerchantIdentifier *)self->_warsawMerchantIdentifier hash];
  unint64_t v21 = [(GEOPDAdamAppIdentifier *)self->_appIdentifier hash];
  unint64_t v22 = [(GEOPDMerchantInformation *)self->_merchantInformation hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_transactionStatus;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_transactionId hash];
  $EE18152C7C1C54C7C47B391F7B08A504 v25 = self->_flags;
  if ((*(unsigned char *)&v25 & 0x80) != 0)
  {
    uint64_t v26 = 2654435761 * self->_fuzzyMatched;
    if ((*(unsigned char *)&v25 & 0x20) != 0) {
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v27 = 0;
    goto LABEL_35;
  }
  uint64_t v26 = 0;
  if ((*(unsigned char *)&v25 & 0x20) == 0) {
    goto LABEL_34;
  }
LABEL_32:
  uint64_t v27 = 2654435761 * self->_coarseLocationUsed;
LABEL_35:
  NSUInteger v28 = v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  unint64_t v29 = v26 ^ v27 ^ [(GEOPDIdentityMerchantInformation *)self->_identityMerchantInformation hash];
  return v28 ^ v29 ^ [(GEOPDBankTransactionInformation *)self->_bankTransactionInformation hash];
}

- (void)mergeFrom:(id)a3
{
  $EE18152C7C1C54C7C47B391F7B08A504 v25 = a3;
  [v25 readAll:0];
  double v4 = v25;
  if (v25[10])
  {
    -[GEOPDMerchantLookupParameters setPaymentNetwork:](self, "setPaymentNetwork:");
    double v4 = v25;
  }
  if (v4[8])
  {
    -[GEOPDMerchantLookupParameters setMerchantCode:](self, "setMerchantCode:");
    double v4 = v25;
  }
  if ((v4[22] & 4) != 0)
  {
    self->_double transactionTimestamp = (double)v4[17];
    *(_DWORD *)&self->_flags |= 4u;
  }
  transactionLocation = self->_transactionLocation;
  uint64_t v6 = v4[16];
  if (transactionLocation)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[GEOLocation mergeFrom:](transactionLocation, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[GEOPDMerchantLookupParameters setTransactionLocation:](self, "setTransactionLocation:");
  }
  double v4 = v25;
LABEL_13:
  if ((v4[22] & 2) != 0)
  {
    self->_double transactionLocationAge = (double)v4[15];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (v4[11])
  {
    -[GEOPDMerchantLookupParameters setRawMerchantCode:](self, "setRawMerchantCode:");
    double v4 = v25;
  }
  if (v4[6])
  {
    -[GEOPDMerchantLookupParameters setIndustryCategory:](self, "setIndustryCategory:");
    double v4 = v25;
  }
  int v7 = *((_DWORD *)v4 + 44);
  if (v7)
  {
    self->_industryCode = v4[7];
    *(_DWORD *)&self->_flags |= 1u;
    int v7 = *((_DWORD *)v4 + 44);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_enableBrandMuidFallback = *((unsigned char *)v4 + 173);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  if (v4[12])
  {
    -[GEOPDMerchantLookupParameters setTerminalId:](self, "setTerminalId:");
    double v4 = v25;
  }
  if (v4[13])
  {
    -[GEOPDMerchantLookupParameters setTransactionCurrencyCode:](self, "setTransactionCurrencyCode:");
    double v4 = v25;
  }
  if ((v4[22] & 0x10) != 0)
  {
    self->_transactionType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  warsawMerchantIdentifier = self->_warsawMerchantIdentifier;
  unint64_t v9 = (void *)v4[18];
  if (warsawMerchantIdentifier)
  {
    if (!v9) {
      goto LABEL_41;
    }
    unint64_t v10 = v9;
    -[GEOPDWarsawMerchantIdentifier readAll:]((uint64_t)v10, 0);
    uint64_t v11 = (void *)v10[3];
    if (v11) {
      -[GEOPDWarsawMerchantIdentifier setMerchantDomain:]((uint64_t)warsawMerchantIdentifier, v11);
    }
    double v12 = (void *)v10[5];
    if (v12) {
      -[GEOPDWarsawMerchantIdentifier setMerchantName:]((uint64_t)warsawMerchantIdentifier, v12);
    }
    long double v13 = (void *)v10[4];
    if (v13) {
      -[GEOPDWarsawMerchantIdentifier setMerchantId:]((uint64_t)warsawMerchantIdentifier, v13);
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_41;
    }
    -[GEOPDMerchantLookupParameters setWarsawMerchantIdentifier:](self, "setWarsawMerchantIdentifier:");
  }
  double v4 = v25;
LABEL_41:
  appIdentifier = self->_appIdentifier;
  uint64_t v15 = v4[3];
  if (!appIdentifier)
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[GEOPDMerchantLookupParameters setAppIdentifier:](self, "setAppIdentifier:");
    goto LABEL_47;
  }
  if (v15)
  {
    int v16 = *(void **)(v15 + 16);
    if (v16)
    {
      -[GEOPDAdamAppIdentifier setAdamId:]((uint64_t)appIdentifier, v16);
LABEL_47:
      double v4 = v25;
    }
  }
LABEL_48:
  merchantInformation = self->_merchantInformation;
  uint64_t v18 = v4[9];
  if (merchantInformation)
  {
    if (!v18) {
      goto LABEL_54;
    }
    -[GEOPDMerchantInformation mergeFrom:](merchantInformation, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_54;
    }
    -[GEOPDMerchantLookupParameters setMerchantInformation:](self, "setMerchantInformation:");
  }
  double v4 = v25;
LABEL_54:
  if ((v4[22] & 8) != 0)
  {
    self->_transactionStatus = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 8u;
  }
  if (v4[14])
  {
    -[GEOPDMerchantLookupParameters setTransactionId:](self, "setTransactionId:");
    double v4 = v25;
  }
  int v19 = *((_DWORD *)v4 + 44);
  if ((v19 & 0x80) != 0)
  {
    self->_fuzzyMatched = *((unsigned char *)v4 + 174);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v19 = *((_DWORD *)v4 + 44);
  }
  if ((v19 & 0x20) != 0)
  {
    self->_coarseLocationUsed = *((unsigned char *)v4 + 172);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  identityMerchantInformation = self->_identityMerchantInformation;
  uint64_t v21 = v4[5];
  if (!identityMerchantInformation)
  {
    if (!v21) {
      goto LABEL_69;
    }
    -[GEOPDMerchantLookupParameters setIdentityMerchantInformation:](self, "setIdentityMerchantInformation:");
    goto LABEL_68;
  }
  if (v21)
  {
    unint64_t v22 = *(void **)(v21 + 16);
    if (v22)
    {
      -[GEOPDIdentityMerchantInformation setRpIdentifier:]((uint64_t)identityMerchantInformation, v22);
LABEL_68:
      double v4 = v25;
    }
  }
LABEL_69:
  bankTransactionInformation = self->_bankTransactionInformation;
  uint64_t v24 = v4[4];
  if (bankTransactionInformation)
  {
    if (v24) {
      -[GEOPDBankTransactionInformation mergeFrom:](bankTransactionInformation, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOPDMerchantLookupParameters setBankTransactionInformation:](self, "setBankTransactionInformation:");
  }

  MEMORY[0x1F4181870]();
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      long double v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantLookupParametersReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4293);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDMerchantLookupParameters *)self readAll:0];
    [(GEOLocation *)self->_transactionLocation clearUnknownFields:1];
    -[GEOPDWarsawMerchantIdentifier clearUnknownFields:]((uint64_t)self->_warsawMerchantIdentifier);
    appIdentifier = self->_appIdentifier;
    if (appIdentifier)
    {
      unint64_t v8 = appIdentifier->_unknownFields;
      appIdentifier->_unknownFields = 0;
    }
    [(GEOPDMerchantInformation *)self->_merchantInformation clearUnknownFields:1];
    identityMerchantInformation = self->_identityMerchantInformation;
    if (identityMerchantInformation)
    {
      unint64_t v10 = identityMerchantInformation->_unknownFields;
      identityMerchantInformation->_unknownFields = 0;
    }
    bankTransactionInformation = self->_bankTransactionInformation;
    [(GEOPDBankTransactionInformation *)bankTransactionInformation clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warsawMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_terminalId, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_merchantInformation, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_identityMerchantInformation, 0);
  objc_storeStrong((id *)&self->_bankTransactionInformation, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end