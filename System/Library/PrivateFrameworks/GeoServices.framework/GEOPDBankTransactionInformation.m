@interface GEOPDBankTransactionInformation
+ (BOOL)isValid:(id)a3;
+ (Class)baaCertificateType;
+ (Class)otherTransactionLocationsType;
- (BOOL)enableBrandMuidFallback;
- (BOOL)hasAnonymisedUserId;
- (BOOL)hasBaaSignature;
- (BOOL)hasBankIdentifier;
- (BOOL)hasBankTransactionDescription;
- (BOOL)hasBankTransactionDescriptionClean;
- (BOOL)hasBankTransactionType;
- (BOOL)hasEnableBrandMuidFallback;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIndustryCategory;
- (BOOL)hasIndustryCode;
- (BOOL)hasMerchantInformation;
- (BOOL)hasPiiRedactionApplied;
- (BOOL)hasRawMerchantCode;
- (BOOL)hasRotationPeriodsSinceEpoch;
- (BOOL)hasTransactionCurrencyCode;
- (BOOL)hasTransactionStatus;
- (BOOL)hasTransactionTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)piiRedactionApplied;
- (BOOL)readFrom:(id)a3;
- (GEOPDBankTransactionInformation)init;
- (GEOPDBankTransactionInformation)initWithData:(id)a3;
- (GEOPDBankTransactionInformation)initWithDictionary:(id)a3;
- (GEOPDBankTransactionInformation)initWithJSON:(id)a3;
- (GEOPDMerchantInformation)merchantInformation;
- (NSData)baaSignature;
- (NSMutableArray)baaCertificates;
- (NSMutableArray)otherTransactionLocations;
- (NSString)anonymisedUserId;
- (NSString)bankIdentifier;
- (NSString)bankTransactionDescription;
- (NSString)bankTransactionDescriptionClean;
- (NSString)industryCategory;
- (NSString)rawMerchantCode;
- (NSString)transactionCurrencyCode;
- (PBUnknownFields)unknownFields;
- (double)transactionTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)baaCertificateAtIndex:(unint64_t)a3;
- (id)bankTransactionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)otherTransactionLocationsAtIndex:(unint64_t)a3;
- (id)transactionStatusAsString:(int)a3;
- (int)StringAsBankTransactionType:(id)a3;
- (int)StringAsTransactionStatus:(id)a3;
- (int)bankTransactionType;
- (int)rotationPeriodsSinceEpoch;
- (int)transactionStatus;
- (int64_t)industryCode;
- (unint64_t)baaCertificatesCount;
- (unint64_t)hash;
- (unint64_t)otherTransactionLocationsCount;
- (void)_addNoFlagsBaaCertificate:(uint64_t)a1;
- (void)_addNoFlagsOtherTransactionLocations:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnonymisedUserId;
- (void)_readBaaCertificates;
- (void)_readBaaSignature;
- (void)_readBankIdentifier;
- (void)_readBankTransactionDescription;
- (void)_readBankTransactionDescriptionClean;
- (void)_readIndustryCategory;
- (void)_readMerchantInformation;
- (void)_readOtherTransactionLocations;
- (void)_readRawMerchantCode;
- (void)_readTransactionCurrencyCode;
- (void)addBaaCertificate:(id)a3;
- (void)addOtherTransactionLocations:(id)a3;
- (void)clearBaaCertificates;
- (void)clearOtherTransactionLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonymisedUserId:(id)a3;
- (void)setBaaCertificates:(id)a3;
- (void)setBaaSignature:(id)a3;
- (void)setBankIdentifier:(id)a3;
- (void)setBankTransactionDescription:(id)a3;
- (void)setBankTransactionDescriptionClean:(id)a3;
- (void)setBankTransactionType:(int)a3;
- (void)setEnableBrandMuidFallback:(BOOL)a3;
- (void)setHasBankTransactionType:(BOOL)a3;
- (void)setHasEnableBrandMuidFallback:(BOOL)a3;
- (void)setHasIndustryCode:(BOOL)a3;
- (void)setHasPiiRedactionApplied:(BOOL)a3;
- (void)setHasRotationPeriodsSinceEpoch:(BOOL)a3;
- (void)setHasTransactionStatus:(BOOL)a3;
- (void)setHasTransactionTimestamp:(BOOL)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(int64_t)a3;
- (void)setMerchantInformation:(id)a3;
- (void)setOtherTransactionLocations:(id)a3;
- (void)setPiiRedactionApplied:(BOOL)a3;
- (void)setRawMerchantCode:(id)a3;
- (void)setRotationPeriodsSinceEpoch:(int)a3;
- (void)setTransactionCurrencyCode:(id)a3;
- (void)setTransactionStatus:(int)a3;
- (void)setTransactionTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBankTransactionInformation

- (GEOPDBankTransactionInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBankTransactionInformation;
  v2 = [(GEOPDBankTransactionInformation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBankTransactionInformation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBankTransactionInformation;
  v3 = [(GEOPDBankTransactionInformation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnonymisedUserId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonymisedUserId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasAnonymisedUserId
{
  return self->_anonymisedUserId != 0;
}

- (NSString)anonymisedUserId
{
  -[GEOPDBankTransactionInformation _readAnonymisedUserId]((uint64_t)self);
  anonymisedUserId = self->_anonymisedUserId;

  return anonymisedUserId;
}

- (void)setAnonymisedUserId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80100u;
  objc_storeStrong((id *)&self->_anonymisedUserId, a3);
}

- (int)bankTransactionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 4) != 0) {
    return self->_bankTransactionType;
  }
  else {
    return 0;
  }
}

- (void)setBankTransactionType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80004u;
  self->_bankTransactionType = a3;
}

- (void)setHasBankTransactionType:(BOOL)a3
{
  if (a3) {
    int v3 = 524292;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasBankTransactionType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)bankTransactionTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53DC9E0[a3];
  }

  return v3;
}

- (int)StringAsBankTransactionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_ADJUSTMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_ATM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_BILL_PAYMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_CHECK"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_DEPOSIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_DIRECT_DEBIT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_DIRECT_DEPOSIT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_DIVIDEND"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_FEE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_INTEREST"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_POS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_STANDING_ORDER"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_TRANSFER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_WITHDRAWAL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_LOAN"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"BANK_TRANSACTION_TYPE_REFUND"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readBankTransactionDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBankTransactionDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankTransactionDescription
{
  return self->_bankTransactionDescription != 0;
}

- (NSString)bankTransactionDescription
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescription]((uint64_t)self);
  bankTransactionDescription = self->_bankTransactionDescription;

  return bankTransactionDescription;
}

- (void)setBankTransactionDescription:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000u;
  objc_storeStrong((id *)&self->_bankTransactionDescription, a3);
}

- (void)_readOtherTransactionLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOtherTransactionLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)otherTransactionLocations
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  otherTransactionLocations = self->_otherTransactionLocations;

  return otherTransactionLocations;
}

- (void)setOtherTransactionLocations:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  otherTransactionLocations = self->_otherTransactionLocations;
  self->_otherTransactionLocations = v4;
}

- (void)clearOtherTransactionLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  otherTransactionLocations = self->_otherTransactionLocations;

  [(NSMutableArray *)otherTransactionLocations removeAllObjects];
}

- (void)addOtherTransactionLocations:(id)a3
{
  id v4 = a3;
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  -[GEOPDBankTransactionInformation _addNoFlagsOtherTransactionLocations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsOtherTransactionLocations:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)otherTransactionLocationsCount
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  otherTransactionLocations = self->_otherTransactionLocations;

  return [(NSMutableArray *)otherTransactionLocations count];
}

- (id)otherTransactionLocationsAtIndex:(unint64_t)a3
{
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  otherTransactionLocations = self->_otherTransactionLocations;

  return (id)[(NSMutableArray *)otherTransactionLocations objectAtIndex:a3];
}

+ (Class)otherTransactionLocationsType
{
  return (Class)objc_opt_class();
}

- (double)transactionTimestamp
{
  return self->_transactionTimestamp;
}

- (void)setTransactionTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80002u;
  self->_transactionTimestamp = a3;
}

- (void)setHasTransactionTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 524290;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasTransactionTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readRawMerchantCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 158) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawMerchantCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasRawMerchantCode
{
  return self->_rawMerchantCode != 0;
}

- (NSString)rawMerchantCode
{
  -[GEOPDBankTransactionInformation _readRawMerchantCode]((uint64_t)self);
  rawMerchantCode = self->_rawMerchantCode;

  return rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000u;
  objc_storeStrong((id *)&self->_rawMerchantCode, a3);
}

- (void)_readIndustryCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIndustryCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasIndustryCategory
{
  return self->_industryCategory != 0;
}

- (NSString)industryCategory
{
  -[GEOPDBankTransactionInformation _readIndustryCategory]((uint64_t)self);
  industryCategory = self->_industryCategory;

  return industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000u;
  objc_storeStrong((id *)&self->_industryCategory, a3);
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x80001u;
  self->_industryCode = a3;
}

- (void)setHasIndustryCode:(BOOL)a3
{
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x80000);
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
  *(_DWORD *)&self->_flags |= 0x80020u;
  self->_enableBrandMuidFallback = a3;
}

- (void)setHasEnableBrandMuidFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 524320;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEnableBrandMuidFallback
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readTransactionCurrencyCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 158) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionCurrencyCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasTransactionCurrencyCode
{
  return self->_transactionCurrencyCode != 0;
}

- (NSString)transactionCurrencyCode
{
  -[GEOPDBankTransactionInformation _readTransactionCurrencyCode]((uint64_t)self);
  transactionCurrencyCode = self->_transactionCurrencyCode;

  return transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000u;
  objc_storeStrong((id *)&self->_transactionCurrencyCode, a3);
}

- (int)transactionStatus
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_transactionStatus;
  }
  else {
    return 0;
  }
}

- (void)setTransactionStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80010u;
  self->_transactionStatus = a3;
}

- (void)setHasTransactionStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 524304;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTransactionStatus
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
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

- (void)_readMerchantInformation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantInformation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasMerchantInformation
{
  return self->_merchantInformation != 0;
}

- (GEOPDMerchantInformation)merchantInformation
{
  -[GEOPDBankTransactionInformation _readMerchantInformation]((uint64_t)self);
  merchantInformation = self->_merchantInformation;

  return merchantInformation;
}

- (void)setMerchantInformation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000u;
  objc_storeStrong((id *)&self->_merchantInformation, a3);
}

- (void)_readBaaCertificates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaaCertificates_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)baaCertificates
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return baaCertificates;
}

- (void)setBaaCertificates:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  baaCertificates = self->_baaCertificates;
  self->_baaCertificates = v4;
}

- (void)clearBaaCertificates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
  baaCertificates = self->_baaCertificates;

  [(NSMutableArray *)baaCertificates removeAllObjects];
}

- (void)addBaaCertificate:(id)a3
{
  id v4 = a3;
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  -[GEOPDBankTransactionInformation _addNoFlagsBaaCertificate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000u;
}

- (void)_addNoFlagsBaaCertificate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)baaCertificatesCount
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return [(NSMutableArray *)baaCertificates count];
}

- (id)baaCertificateAtIndex:(unint64_t)a3
{
  -[GEOPDBankTransactionInformation _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return (id)[(NSMutableArray *)baaCertificates objectAtIndex:a3];
}

+ (Class)baaCertificateType
{
  return (Class)objc_opt_class();
}

- (void)_readBaaSignature
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaaSignature_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBaaSignature
{
  return self->_baaSignature != 0;
}

- (NSData)baaSignature
{
  -[GEOPDBankTransactionInformation _readBaaSignature]((uint64_t)self);
  baaSignature = self->_baaSignature;

  return baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80400u;
  objc_storeStrong((id *)&self->_baaSignature, a3);
}

- (void)_readBankTransactionDescriptionClean
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBankTransactionDescriptionClean_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankTransactionDescriptionClean
{
  return self->_bankTransactionDescriptionClean != 0;
}

- (NSString)bankTransactionDescriptionClean
{
  -[GEOPDBankTransactionInformation _readBankTransactionDescriptionClean]((uint64_t)self);
  bankTransactionDescriptionClean = self->_bankTransactionDescriptionClean;

  return bankTransactionDescriptionClean;
}

- (void)setBankTransactionDescriptionClean:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x81000u;
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, a3);
}

- (void)_readBankIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBankTransactionInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBankIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasBankIdentifier
{
  return self->_bankIdentifier != 0;
}

- (NSString)bankIdentifier
{
  -[GEOPDBankTransactionInformation _readBankIdentifier]((uint64_t)self);
  bankIdentifier = self->_bankIdentifier;

  return bankIdentifier;
}

- (void)setBankIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x80800u;
  objc_storeStrong((id *)&self->_bankIdentifier, a3);
}

- (BOOL)piiRedactionApplied
{
  return self->_piiRedactionApplied;
}

- (void)setPiiRedactionApplied:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80040u;
  self->_piiRedactionApplied = a3;
}

- (void)setHasPiiRedactionApplied:(BOOL)a3
{
  if (a3) {
    int v3 = 524352;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasPiiRedactionApplied
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)rotationPeriodsSinceEpoch
{
  return self->_rotationPeriodsSinceEpoch;
}

- (void)setRotationPeriodsSinceEpoch:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80008u;
  self->_rotationPeriodsSinceEpoch = a3;
}

- (void)setHasRotationPeriodsSinceEpoch:(BOOL)a3
{
  if (a3) {
    int v3 = 524296;
  }
  else {
    int v3 = 0x80000;
  }
  self->_$B11C17402F3C51AE16215E686C0D2ADC flags = ($B11C17402F3C51AE16215E686C0D2ADC)(*(_DWORD *)&self->_flags & 0xFFF7FFF7 | v3);
}

- (BOOL)hasRotationPeriodsSinceEpoch
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBankTransactionInformation;
  id v4 = [(GEOPDBankTransactionInformation *)&v8 description];
  id v5 = [(GEOPDBankTransactionInformation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBankTransactionInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 anonymisedUserId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"anonymisedUserId";
      }
      else {
        objc_super v6 = @"anonymised_user_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ((*(unsigned char *)(a1 + 156) & 4) != 0)
    {
      uint64_t v7 = *(int *)(a1 + 140);
      if (v7 >= 0x11)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53DC9E0[v7];
      }
      if (a2) {
        v9 = @"bankTransactionType";
      }
      else {
        v9 = @"bank_transaction_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 bankTransactionDescription];
    if (v10)
    {
      if (a2) {
        v11 = @"bankTransactionDescription";
      }
      else {
        v11 = @"bank_transaction_description";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if ([*(id *)(a1 + 96) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v13 = *(id *)(a1 + 96);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v77 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"otherTransactionLocations";
      }
      else {
        v20 = @"other_transaction_locations";
      }
      [v4 setObject:v12 forKey:v20];
    }
    unint64_t v21 = 0x1E4F28000uLL;
    if ((*(unsigned char *)(a1 + 156) & 2) != 0)
    {
      v22 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
      if (a2) {
        v23 = @"transactionTimestamp";
      }
      else {
        v23 = @"transaction_timestamp";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 rawMerchantCode];
    if (v24)
    {
      if (a2) {
        v25 = @"rawMerchantCode";
      }
      else {
        v25 = @"raw_merchant_code";
      }
      [v4 setObject:v24 forKey:v25];
    }

    v26 = [(id)a1 industryCategory];
    if (v26)
    {
      if (a2) {
        v27 = @"industryCategory";
      }
      else {
        v27 = @"industry_category";
      }
      [v4 setObject:v26 forKey:v27];
    }

    int v28 = *(_DWORD *)(a1 + 156);
    if (v28)
    {
      v29 = [NSNumber numberWithLongLong:*(void *)(a1 + 80)];
      if (a2) {
        v30 = @"industryCode";
      }
      else {
        v30 = @"industry_code";
      }
      [v4 setObject:v29 forKey:v30];

      int v28 = *(_DWORD *)(a1 + 156);
    }
    if ((v28 & 0x20) != 0)
    {
      v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 152)];
      if (a2) {
        v32 = @"enableBrandMuidFallback";
      }
      else {
        v32 = @"enable_brand_muid_fallback";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = [(id)a1 transactionCurrencyCode];
    if (v33)
    {
      if (a2) {
        v34 = @"transactionCurrencyCode";
      }
      else {
        v34 = @"transaction_currency_code";
      }
      [v4 setObject:v33 forKey:v34];
    }

    if ((*(unsigned char *)(a1 + 156) & 0x10) != 0)
    {
      uint64_t v35 = *(int *)(a1 + 148);
      if (v35 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 148));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = off_1E53DCC48[v35];
      }
      if (a2) {
        v37 = @"transactionStatus";
      }
      else {
        v37 = @"transaction_status";
      }
      [v4 setObject:v36 forKey:v37];
    }
    v38 = [(id)a1 merchantInformation];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"merchantInformation";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"merchant_information";
      }
      [v4 setObject:v40 forKey:v41];
    }
    if (*(void *)(a1 + 32))
    {
      if (a2)
      {
        v42 = (void *)MEMORY[0x1E4F1CA48];
        v43 = [(id)a1 baaCertificates];
        v44 = objc_msgSend(v42, "arrayWithCapacity:", objc_msgSend(v43, "count"));

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v45 = [(id)a1 baaCertificates];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v73 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = [*(id *)(*((void *)&v72 + 1) + 8 * j) base64EncodedStringWithOptions:0];
              [v44 addObject:v50];
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v72 objects:v80 count:16];
          }
          while (v47);
        }

        [v4 setObject:v44 forKey:@"baaCertificate"];
        unint64_t v21 = 0x1E4F28000;
      }
      else
      {
        v44 = [(id)a1 baaCertificates];
        [v4 setObject:v44 forKey:@"baa_certificate"];
      }
    }
    v51 = [(id)a1 baaSignature];
    v52 = v51;
    if (v51)
    {
      if (a2)
      {
        v53 = [v51 base64EncodedStringWithOptions:0];
        [v4 setObject:v53 forKey:@"baaSignature"];
      }
      else
      {
        [v4 setObject:v51 forKey:@"baa_signature"];
      }
    }

    v54 = [(id)a1 bankTransactionDescriptionClean];
    if (v54)
    {
      if (a2) {
        v55 = @"bankTransactionDescriptionClean";
      }
      else {
        v55 = @"bank_transaction_description_clean";
      }
      [v4 setObject:v54 forKey:v55];
    }

    v56 = [(id)a1 bankIdentifier];
    if (v56)
    {
      if (a2) {
        v57 = @"bankIdentifier";
      }
      else {
        v57 = @"bank_identifier";
      }
      [v4 setObject:v56 forKey:v57];
    }

    int v58 = *(_DWORD *)(a1 + 156);
    if ((v58 & 0x40) != 0)
    {
      v59 = [*(id *)(v21 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 153)];
      if (a2) {
        v60 = @"piiRedactionApplied";
      }
      else {
        v60 = @"pii_redaction_applied";
      }
      [v4 setObject:v59 forKey:v60];

      int v58 = *(_DWORD *)(a1 + 156);
    }
    if ((v58 & 8) != 0)
    {
      v61 = [*(id *)(v21 + 3792) numberWithInt:*(unsigned int *)(a1 + 144)];
      if (a2) {
        v62 = @"rotationPeriodsSinceEpoch";
      }
      else {
        v62 = @"rotation_periods_since_epoch";
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
        v70[2] = __61__GEOPDBankTransactionInformation__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBankTransactionInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDBankTransactionInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDBankTransactionInformation)initWithDictionary:(id)a3
{
  return (GEOPDBankTransactionInformation *)-[GEOPDBankTransactionInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_168;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_168;
  }
  if (a3) {
    objc_super v6 = @"anonymisedUserId";
  }
  else {
    objc_super v6 = @"anonymised_user_id";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setAnonymisedUserId:v8];
  }
  if (a3) {
    v9 = @"bankTransactionType";
  }
  else {
    v9 = @"bank_transaction_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_UNSPECIFIED"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_ADJUSTMENT"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_ATM"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_BILL_PAYMENT"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_CHECK"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_DEPOSIT"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_DIRECT_DEBIT"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_DIRECT_DEPOSIT"])
    {
      uint64_t v12 = 7;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_DIVIDEND"])
    {
      uint64_t v12 = 8;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_FEE"])
    {
      uint64_t v12 = 9;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_INTEREST"])
    {
      uint64_t v12 = 10;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_POS"])
    {
      uint64_t v12 = 11;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_STANDING_ORDER"])
    {
      uint64_t v12 = 12;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_TRANSFER"])
    {
      uint64_t v12 = 13;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_WITHDRAWAL"])
    {
      uint64_t v12 = 14;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_LOAN"])
    {
      uint64_t v12 = 15;
    }
    else if ([v11 isEqualToString:@"BANK_TRANSACTION_TYPE_REFUND"])
    {
      uint64_t v12 = 16;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    uint64_t v12 = [v10 intValue];
  }
  [a1 setBankTransactionType:v12];
LABEL_51:

  if (a3) {
    id v13 = @"bankTransactionDescription";
  }
  else {
    id v13 = @"bank_transaction_description";
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = (void *)[v14 copy];
    [a1 setBankTransactionDescription:v15];
  }
  if (a3) {
    uint64_t v16 = @"otherTransactionLocations";
  }
  else {
    uint64_t v16 = @"other_transaction_locations";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  id v75 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v74 = v17;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v80 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v81 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = [GEOLocation alloc];
            if (a3) {
              uint64_t v25 = [(GEOLocation *)v24 initWithJSON:v23];
            }
            else {
              uint64_t v25 = [(GEOLocation *)v24 initWithDictionary:v23];
            }
            v26 = (void *)v25;
            objc_msgSend(a1, "addOtherTransactionLocations:", v25, v74);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v80 objects:v85 count:16];
      }
      while (v20);
    }

    v17 = v74;
  }

  if (a3) {
    v27 = @"transactionTimestamp";
  }
  else {
    v27 = @"transaction_timestamp";
  }
  int v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v74);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v28 doubleValue];
    objc_msgSend(a1, "setTransactionTimestamp:");
  }

  if (a3) {
    v29 = @"rawMerchantCode";
  }
  else {
    v29 = @"raw_merchant_code";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = (void *)[v30 copy];
    [a1 setRawMerchantCode:v31];
  }
  if (a3) {
    v32 = @"industryCategory";
  }
  else {
    v32 = @"industry_category";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = (void *)[v33 copy];
    [a1 setIndustryCategory:v34];
  }
  if (a3) {
    uint64_t v35 = @"industryCode";
  }
  else {
    uint64_t v35 = @"industry_code";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIndustryCode:", objc_msgSend(v36, "longLongValue"));
  }

  if (a3) {
    v37 = @"enableBrandMuidFallback";
  }
  else {
    v37 = @"enable_brand_muid_fallback";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnableBrandMuidFallback:", objc_msgSend(v38, "BOOLValue"));
  }

  if (a3) {
    v39 = @"transactionCurrencyCode";
  }
  else {
    v39 = @"transaction_currency_code";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = (void *)[v40 copy];
    [a1 setTransactionCurrencyCode:v41];
  }
  if (a3) {
    v42 = @"transactionStatus";
  }
  else {
    v42 = @"transaction_status";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v43;
    if ([v44 isEqualToString:@"TRANSACTION_STATUS_UNKNOWN"])
    {
      uint64_t v45 = 0;
    }
    else if ([v44 isEqualToString:@"TRANSACTION_STATUS_AUTHORIZATION"])
    {
      uint64_t v45 = 1;
    }
    else if ([v44 isEqualToString:@"TRANSACTION_STATUS_SETTLEMENT"])
    {
      uint64_t v45 = 2;
    }
    else if ([v44 isEqualToString:@"TRANSACTION_STATUS_REFUND"])
    {
      uint64_t v45 = 3;
    }
    else
    {
      uint64_t v45 = 0;
    }

    goto LABEL_119;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v45 = [v43 intValue];
LABEL_119:
    [a1 setTransactionStatus:v45];
  }

  if (a3) {
    uint64_t v46 = @"merchantInformation";
  }
  else {
    uint64_t v46 = @"merchant_information";
  }
  uint64_t v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v48 = [GEOPDMerchantInformation alloc];
    if (a3) {
      uint64_t v49 = [(GEOPDMerchantInformation *)v48 initWithJSON:v47];
    }
    else {
      uint64_t v49 = [(GEOPDMerchantInformation *)v48 initWithDictionary:v47];
    }
    v50 = (void *)v49;
    [a1 setMerchantInformation:v49];
  }
  if (a3) {
    v51 = @"baaCertificate";
  }
  else {
    v51 = @"baa_certificate";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v53 = v52;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v77 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v76 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v59 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v58 options:0];
            [a1 addBaaCertificate:v59];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }
      while (v55);
    }

    id v5 = v75;
  }

  if (a3) {
    v60 = @"baaSignature";
  }
  else {
    v60 = @"baa_signature";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v61 options:0];
    [a1 setBaaSignature:v62];
  }
  if (a3) {
    v63 = @"bankTransactionDescriptionClean";
  }
  else {
    v63 = @"bank_transaction_description_clean";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v65 = (void *)[v64 copy];
    [a1 setBankTransactionDescriptionClean:v65];
  }
  if (a3) {
    v66 = @"bankIdentifier";
  }
  else {
    v66 = @"bank_identifier";
  }
  id v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v68 = (void *)[v67 copy];
    [a1 setBankIdentifier:v68];
  }
  if (a3) {
    v69 = @"piiRedactionApplied";
  }
  else {
    v69 = @"pii_redaction_applied";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPiiRedactionApplied:", objc_msgSend(v70, "BOOLValue"));
  }

  if (a3) {
    id v71 = @"rotationPeriodsSinceEpoch";
  }
  else {
    id v71 = @"rotation_periods_since_epoch";
  }
  long long v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRotationPeriodsSinceEpoch:", objc_msgSend(v72, "intValue"));
  }

LABEL_168:
  return a1;
}

- (GEOPDBankTransactionInformation)initWithJSON:(id)a3
{
  return (GEOPDBankTransactionInformation *)-[GEOPDBankTransactionInformation _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1889;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1890;
    }
    GEOPDBankTransactionInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDBankTransactionInformationCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDBankTransactionInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBankTransactionInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBankTransactionInformationIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDBankTransactionInformation *)self readAll:0];
    if (self->_anonymisedUserId) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_bankTransactionDescription) {
      PBDataWriterWriteStringField();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v6 = self->_otherTransactionLocations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_rawMerchantCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_industryCategory) {
      PBDataWriterWriteStringField();
    }
    $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
    if (*(unsigned char *)&flags)
    {
      PBDataWriterWriteSint64Field();
      $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_transactionCurrencyCode) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_merchantInformation) {
      PBDataWriterWriteSubmessage();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = self->_baaCertificates;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteDataField();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    if (self->_baaSignature) {
      PBDataWriterWriteDataField();
    }
    if (self->_bankTransactionDescriptionClean) {
      PBDataWriterWriteStringField();
    }
    if (self->_bankIdentifier) {
      PBDataWriterWriteStringField();
    }
    $B11C17402F3C51AE16215E686C0D2ADC v15 = self->_flags;
    if ((*(unsigned char *)&v15 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $B11C17402F3C51AE16215E686C0D2ADC v15 = self->_flags;
    }
    if ((*(unsigned char *)&v15 & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDBankTransactionInformation _readOtherTransactionLocations]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_otherTransactionLocations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOPDBankTransactionInformation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 32) = self->_readerMarkPos;
  *((_DWORD *)v16 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymisedUserId) {
    objc_msgSend(v16, "setAnonymisedUserId:");
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v16 + 35) = self->_bankTransactionType;
    *((_DWORD *)v16 + 39) |= 4u;
  }
  if (self->_bankTransactionDescription) {
    objc_msgSend(v16, "setBankTransactionDescription:");
  }
  if ([(GEOPDBankTransactionInformation *)self otherTransactionLocationsCount])
  {
    [v16 clearOtherTransactionLocations];
    unint64_t v4 = [(GEOPDBankTransactionInformation *)self otherTransactionLocationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDBankTransactionInformation *)self otherTransactionLocationsAtIndex:i];
        [v16 addOtherTransactionLocations:v7];
      }
    }
  }
  uint64_t v8 = v16;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v16[15] = *(id *)&self->_transactionTimestamp;
    *((_DWORD *)v16 + 39) |= 2u;
  }
  if (self->_rawMerchantCode)
  {
    objc_msgSend(v16, "setRawMerchantCode:");
    uint64_t v8 = v16;
  }
  if (self->_industryCategory)
  {
    objc_msgSend(v16, "setIndustryCategory:");
    uint64_t v8 = v16;
  }
  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    v8[10] = self->_industryCode;
    *((_DWORD *)v8 + 39) |= 1u;
    $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((unsigned char *)v8 + 152) = self->_enableBrandMuidFallback;
    *((_DWORD *)v8 + 39) |= 0x20u;
  }
  if (self->_transactionCurrencyCode)
  {
    objc_msgSend(v16, "setTransactionCurrencyCode:");
    uint64_t v8 = v16;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v8 + 37) = self->_transactionStatus;
    *((_DWORD *)v8 + 39) |= 0x10u;
  }
  if (self->_merchantInformation) {
    objc_msgSend(v16, "setMerchantInformation:");
  }
  if ([(GEOPDBankTransactionInformation *)self baaCertificatesCount])
  {
    [v16 clearBaaCertificates];
    unint64_t v10 = [(GEOPDBankTransactionInformation *)self baaCertificatesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        long long v13 = [(GEOPDBankTransactionInformation *)self baaCertificateAtIndex:j];
        [v16 addBaaCertificate:v13];
      }
    }
  }
  if (self->_baaSignature) {
    objc_msgSend(v16, "setBaaSignature:");
  }
  long long v14 = v16;
  if (self->_bankTransactionDescriptionClean)
  {
    objc_msgSend(v16, "setBankTransactionDescriptionClean:");
    long long v14 = v16;
  }
  if (self->_bankIdentifier)
  {
    objc_msgSend(v16, "setBankIdentifier:");
    long long v14 = v16;
  }
  $B11C17402F3C51AE16215E686C0D2ADC v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 0x40) != 0)
  {
    *((unsigned char *)v14 + 153) = self->_piiRedactionApplied;
    *((_DWORD *)v14 + 39) |= 0x40u;
    $B11C17402F3C51AE16215E686C0D2ADC v15 = self->_flags;
  }
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
    *((_DWORD *)v14 + 36) = self->_rotationPeriodsSinceEpoch;
    *((_DWORD *)v14 + 39) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDBankTransactionInformationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_34;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDBankTransactionInformation *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_anonymisedUserId copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_bankTransactionType;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  uint64_t v11 = [(NSString *)self->_bankTransactionDescription copyWithZone:a3];
  long long v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v13 = self->_otherTransactionLocations;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addOtherTransactionLocations:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v14);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_transactionTimestamp;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  uint64_t v18 = [(NSString *)self->_rawMerchantCode copyWithZone:a3];
  long long v19 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v18;

  uint64_t v20 = [(NSString *)self->_industryCategory copyWithZone:a3];
  long long v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(void *)(v5 + 80) = self->_industryCode;
    *(_DWORD *)(v5 + 156) |= 1u;
    $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_enableBrandMuidFallback;
    *(_DWORD *)(v5 + 156) |= 0x20u;
  }
  uint64_t v23 = [(NSString *)self->_transactionCurrencyCode copyWithZone:a3];
  long long v24 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v23;

  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_transactionStatus;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  id v25 = [(GEOPDMerchantInformation *)self->_merchantInformation copyWithZone:a3];
  v26 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v25;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v27 = self->_baaCertificates;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "copyWithZone:", a3, (void)v41);
        [(id)v5 addBaaCertificate:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSData *)self->_baaSignature copyWithZone:a3];
  v33 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v32;

  uint64_t v34 = [(NSString *)self->_bankTransactionDescriptionClean copyWithZone:a3];
  uint64_t v35 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v34;

  uint64_t v36 = [(NSString *)self->_bankIdentifier copyWithZone:a3];
  v37 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v36;

  $B11C17402F3C51AE16215E686C0D2ADC v38 = self->_flags;
  if ((*(unsigned char *)&v38 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 153) = self->_piiRedactionApplied;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    $B11C17402F3C51AE16215E686C0D2ADC v38 = self->_flags;
  }
  if ((*(unsigned char *)&v38 & 8) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_rotationPeriodsSinceEpoch;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  v39 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v39;
LABEL_34:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_66;
  }
  [(GEOPDBankTransactionInformation *)self readAll:1];
  [v4 readAll:1];
  anonymisedUserId = self->_anonymisedUserId;
  if ((unint64_t)anonymisedUserId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](anonymisedUserId, "isEqual:")) {
      goto LABEL_66;
    }
  }
  int v6 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bankTransactionType != *((_DWORD *)v4 + 35)) {
      goto LABEL_66;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_66;
  }
  bankTransactionDescription = self->_bankTransactionDescription;
  if ((unint64_t)bankTransactionDescription | *((void *)v4 + 8)
    && !-[NSString isEqual:](bankTransactionDescription, "isEqual:"))
  {
    goto LABEL_66;
  }
  otherTransactionLocations = self->_otherTransactionLocations;
  if ((unint64_t)otherTransactionLocations | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](otherTransactionLocations, "isEqual:")) {
      goto LABEL_66;
    }
  }
  int v9 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_transactionTimestamp != *((double *)v4 + 15)) {
      goto LABEL_66;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_66;
  }
  rawMerchantCode = self->_rawMerchantCode;
  if ((unint64_t)rawMerchantCode | *((void *)v4 + 13)
    && !-[NSString isEqual:](rawMerchantCode, "isEqual:"))
  {
    goto LABEL_66;
  }
  industryCategory = self->_industryCategory;
  if ((unint64_t)industryCategory | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](industryCategory, "isEqual:")) {
      goto LABEL_66;
    }
  }
  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  int v13 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&flags)
  {
    if ((v13 & 1) == 0 || self->_industryCode != *((void *)v4 + 10)) {
      goto LABEL_66;
    }
  }
  else if (v13)
  {
    goto LABEL_66;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0) {
      goto LABEL_66;
    }
    if (self->_enableBrandMuidFallback)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_66;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_66;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_66;
  }
  transactionCurrencyCode = self->_transactionCurrencyCode;
  if ((unint64_t)transactionCurrencyCode | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](transactionCurrencyCode, "isEqual:")) {
      goto LABEL_66;
    }
    $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
    int v13 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_transactionStatus != *((_DWORD *)v4 + 37)) {
      goto LABEL_66;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  merchantInformation = self->_merchantInformation;
  if ((unint64_t)merchantInformation | *((void *)v4 + 11)
    && !-[GEOPDMerchantInformation isEqual:](merchantInformation, "isEqual:"))
  {
    goto LABEL_66;
  }
  baaCertificates = self->_baaCertificates;
  if ((unint64_t)baaCertificates | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](baaCertificates, "isEqual:")) {
      goto LABEL_66;
    }
  }
  baaSignature = self->_baaSignature;
  if ((unint64_t)baaSignature | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](baaSignature, "isEqual:")) {
      goto LABEL_66;
    }
  }
  bankTransactionDescriptionClean = self->_bankTransactionDescriptionClean;
  if ((unint64_t)bankTransactionDescriptionClean | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](bankTransactionDescriptionClean, "isEqual:")) {
      goto LABEL_66;
    }
  }
  bankIdentifier = self->_bankIdentifier;
  if ((unint64_t)bankIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](bankIdentifier, "isEqual:")) {
      goto LABEL_66;
    }
  }
  $B11C17402F3C51AE16215E686C0D2ADC v20 = self->_flags;
  int v21 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) != 0)
    {
      if (self->_piiRedactionApplied)
      {
        if (!*((unsigned char *)v4 + 153)) {
          goto LABEL_66;
        }
        goto LABEL_61;
      }
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_61;
      }
    }
LABEL_66:
    BOOL v22 = 0;
    goto LABEL_67;
  }
  if ((v21 & 0x40) != 0) {
    goto LABEL_66;
  }
LABEL_61:
  if ((*(unsigned char *)&v20 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_rotationPeriodsSinceEpoch != *((_DWORD *)v4 + 36)) {
      goto LABEL_66;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = (*((_DWORD *)v4 + 39) & 8) == 0;
  }
LABEL_67:

  return v22;
}

- (unint64_t)hash
{
  [(GEOPDBankTransactionInformation *)self readAll:1];
  NSUInteger v29 = [(NSString *)self->_anonymisedUserId hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v28 = 2654435761 * self->_bankTransactionType;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_bankTransactionDescription hash];
  uint64_t v26 = [(NSMutableArray *)self->_otherTransactionLocations hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    double transactionTimestamp = self->_transactionTimestamp;
    double v5 = -transactionTimestamp;
    if (transactionTimestamp >= 0.0) {
      double v5 = self->_transactionTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  unint64_t v25 = v3;
  NSUInteger v24 = [(NSString *)self->_rawMerchantCode hash];
  NSUInteger v23 = [(NSString *)self->_industryCategory hash];
  $B11C17402F3C51AE16215E686C0D2ADC flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    uint64_t v21 = 2654435761 * self->_industryCode;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
LABEL_14:
      uint64_t v9 = 2654435761 * self->_enableBrandMuidFallback;
      goto LABEL_17;
    }
  }
  uint64_t v9 = 0;
LABEL_17:
  NSUInteger v10 = [(NSString *)self->_transactionCurrencyCode hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_transactionStatus;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(GEOPDMerchantInformation *)self->_merchantInformation hash];
  uint64_t v13 = [(NSMutableArray *)self->_baaCertificates hash];
  uint64_t v14 = [(NSData *)self->_baaSignature hash];
  NSUInteger v15 = [(NSString *)self->_bankTransactionDescriptionClean hash];
  NSUInteger v16 = [(NSString *)self->_bankIdentifier hash];
  $B11C17402F3C51AE16215E686C0D2ADC v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x40) != 0)
  {
    uint64_t v18 = 2654435761 * self->_piiRedactionApplied;
    if ((*(unsigned char *)&v17 & 8) != 0) {
      goto LABEL_22;
    }
LABEL_24:
    uint64_t v19 = 0;
    return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19;
  }
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v17 & 8) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v19 = 2654435761 * self->_rotationPeriodsSinceEpoch;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOPDBankTransactionInformation setAnonymisedUserId:](self, "setAnonymisedUserId:");
  }
  if ((*((unsigned char *)v4 + 156) & 4) != 0)
  {
    self->_bankTransactionType = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 8)) {
    -[GEOPDBankTransactionInformation setBankTransactionDescription:](self, "setBankTransactionDescription:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *((id *)v4 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDBankTransactionInformation *)self addOtherTransactionLocations:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    self->_double transactionTimestamp = *((double *)v4 + 15);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 13)) {
    -[GEOPDBankTransactionInformation setRawMerchantCode:](self, "setRawMerchantCode:");
  }
  if (*((void *)v4 + 9)) {
    -[GEOPDBankTransactionInformation setIndustryCategory:](self, "setIndustryCategory:");
  }
  int v10 = *((_DWORD *)v4 + 39);
  if (v10)
  {
    self->_industryCode = *((void *)v4 + 10);
    *(_DWORD *)&self->_flags |= 1u;
    int v10 = *((_DWORD *)v4 + 39);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_enableBrandMuidFallback = *((unsigned char *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  if (*((void *)v4 + 14)) {
    -[GEOPDBankTransactionInformation setTransactionCurrencyCode:](self, "setTransactionCurrencyCode:");
  }
  if ((*((unsigned char *)v4 + 156) & 0x10) != 0)
  {
    self->_transactionStatus = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  merchantInformation = self->_merchantInformation;
  uint64_t v12 = *((void *)v4 + 11);
  if (merchantInformation)
  {
    if (v12) {
      -[GEOPDMerchantInformation mergeFrom:](merchantInformation, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOPDBankTransactionInformation setMerchantInformation:](self, "setMerchantInformation:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *((id *)v4 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOPDBankTransactionInformation addBaaCertificate:](self, "addBaaCertificate:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 5)) {
    -[GEOPDBankTransactionInformation setBaaSignature:](self, "setBaaSignature:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOPDBankTransactionInformation setBankTransactionDescriptionClean:](self, "setBankTransactionDescriptionClean:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOPDBankTransactionInformation setBankIdentifier:](self, "setBankIdentifier:");
  }
  int v18 = *((_DWORD *)v4 + 39);
  if ((v18 & 0x40) != 0)
  {
    self->_piiRedactionApplied = *((unsigned char *)v4 + 153);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v18 = *((_DWORD *)v4 + 39);
  }
  if ((v18 & 8) != 0)
  {
    self->_rotationPeriodsSinceEpoch = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 8u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPDBankTransactionInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1894);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDBankTransactionInformation *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_otherTransactionLocations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOPDMerchantInformation *)self->_merchantInformation clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_otherTransactionLocations, 0);
  objc_storeStrong((id *)&self->_merchantInformation, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescription, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, 0);
  objc_storeStrong((id *)&self->_bankIdentifier, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaCertificates, 0);
  objc_storeStrong((id *)&self->_anonymisedUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end