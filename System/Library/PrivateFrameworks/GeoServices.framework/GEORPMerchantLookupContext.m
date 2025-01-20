@interface GEORPMerchantLookupContext
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrelationId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsAppleCard;
- (BOOL)hasMerchantAdamId;
- (BOOL)hasMerchantBankTransactionInfo;
- (BOOL)hasMerchantFormattedAddress;
- (BOOL)hasMerchantId;
- (BOOL)hasMerchantIndustryCategory;
- (BOOL)hasMerchantIndustryCode;
- (BOOL)hasMerchantName;
- (BOOL)hasMerchantRawName;
- (BOOL)hasMerchantUrl;
- (BOOL)hasRequestTransactionType;
- (BOOL)hasTransactionLocation;
- (BOOL)hasTransactionTime;
- (BOOL)hasTransactionType;
- (BOOL)isAppleCard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)transactionLocation;
- (GEOPDBankTransactionInformation)merchantBankTransactionInfo;
- (GEOPDMapsIdentifier)merchantId;
- (GEORPMerchantLookupContext)init;
- (GEORPMerchantLookupContext)initWithData:(id)a3;
- (GEORPMerchantLookupContext)initWithDictionary:(id)a3;
- (GEORPMerchantLookupContext)initWithJSON:(id)a3;
- (NSString)correlationId;
- (NSString)merchantAdamId;
- (NSString)merchantFormattedAddress;
- (NSString)merchantIndustryCategory;
- (NSString)merchantName;
- (NSString)merchantRawName;
- (NSString)merchantUrl;
- (NSString)transactionType;
- (double)transactionTime;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestTransactionTypeAsString:(int)a3;
- (int)StringAsRequestTransactionType:(id)a3;
- (int)requestTransactionType;
- (int64_t)merchantIndustryCode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrelationId;
- (void)_readMerchantAdamId;
- (void)_readMerchantBankTransactionInfo;
- (void)_readMerchantFormattedAddress;
- (void)_readMerchantId;
- (void)_readMerchantIndustryCategory;
- (void)_readMerchantName;
- (void)_readMerchantRawName;
- (void)_readMerchantUrl;
- (void)_readTransactionLocation;
- (void)_readTransactionType;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrelationId:(id)a3;
- (void)setHasIsAppleCard:(BOOL)a3;
- (void)setHasMerchantIndustryCode:(BOOL)a3;
- (void)setHasRequestTransactionType:(BOOL)a3;
- (void)setHasTransactionTime:(BOOL)a3;
- (void)setIsAppleCard:(BOOL)a3;
- (void)setMerchantAdamId:(id)a3;
- (void)setMerchantBankTransactionInfo:(id)a3;
- (void)setMerchantFormattedAddress:(id)a3;
- (void)setMerchantId:(id)a3;
- (void)setMerchantIndustryCategory:(id)a3;
- (void)setMerchantIndustryCode:(int64_t)a3;
- (void)setMerchantName:(id)a3;
- (void)setMerchantRawName:(id)a3;
- (void)setMerchantUrl:(id)a3;
- (void)setRequestTransactionType:(int)a3;
- (void)setTransactionLocation:(id)a3;
- (void)setTransactionTime:(double)a3;
- (void)setTransactionType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPMerchantLookupContext

- (GEORPMerchantLookupContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPMerchantLookupContext;
  v2 = [(GEORPMerchantLookupContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPMerchantLookupContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPMerchantLookupContext;
  v3 = [(GEORPMerchantLookupContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int64_t)merchantIndustryCode
{
  return self->_merchantIndustryCode;
}

- (void)setMerchantIndustryCode:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_merchantIndustryCode = a3;
}

- (void)setHasMerchantIndustryCode:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasMerchantIndustryCode
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMerchantId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantId
{
  return self->_merchantId != 0;
}

- (GEOPDMapsIdentifier)merchantId
{
  -[GEORPMerchantLookupContext _readMerchantId]((uint64_t)self);
  merchantId = self->_merchantId;

  return merchantId;
}

- (void)setMerchantId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (void)_readMerchantName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantName
{
  return self->_merchantName != 0;
}

- (NSString)merchantName
{
  -[GEORPMerchantLookupContext _readMerchantName]((uint64_t)self);
  merchantName = self->_merchantName;

  return merchantName;
}

- (void)setMerchantName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_merchantName, a3);
}

- (void)_readMerchantRawName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantRawName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantRawName
{
  return self->_merchantRawName != 0;
}

- (NSString)merchantRawName
{
  -[GEORPMerchantLookupContext _readMerchantRawName]((uint64_t)self);
  merchantRawName = self->_merchantRawName;

  return merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_merchantRawName, a3);
}

- (void)_readMerchantIndustryCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantIndustryCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantIndustryCategory
{
  return self->_merchantIndustryCategory != 0;
}

- (NSString)merchantIndustryCategory
{
  -[GEORPMerchantLookupContext _readMerchantIndustryCategory]((uint64_t)self);
  merchantIndustryCategory = self->_merchantIndustryCategory;

  return merchantIndustryCategory;
}

- (void)setMerchantIndustryCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_merchantIndustryCategory, a3);
}

- (void)_readMerchantUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantUrl
{
  return self->_merchantUrl != 0;
}

- (NSString)merchantUrl
{
  -[GEORPMerchantLookupContext _readMerchantUrl]((uint64_t)self);
  merchantUrl = self->_merchantUrl;

  return merchantUrl;
}

- (void)setMerchantUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_merchantUrl, a3);
}

- (void)_readMerchantFormattedAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantFormattedAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantFormattedAddress
{
  return self->_merchantFormattedAddress != 0;
}

- (NSString)merchantFormattedAddress
{
  -[GEORPMerchantLookupContext _readMerchantFormattedAddress]((uint64_t)self);
  merchantFormattedAddress = self->_merchantFormattedAddress;

  return merchantFormattedAddress;
}

- (void)setMerchantFormattedAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  objc_storeStrong((id *)&self->_merchantFormattedAddress, a3);
}

- (void)_readMerchantAdamId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantAdamId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantAdamId
{
  return self->_merchantAdamId != 0;
}

- (NSString)merchantAdamId
{
  -[GEORPMerchantLookupContext _readMerchantAdamId]((uint64_t)self);
  merchantAdamId = self->_merchantAdamId;

  return merchantAdamId;
}

- (void)setMerchantAdamId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  objc_storeStrong((id *)&self->_merchantAdamId, a3);
}

- (double)transactionTime
{
  return self->_transactionTime;
}

- (void)setTransactionTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_transactionTime = a3;
}

- (void)setHasTransactionTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32766;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasTransactionTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTransactionType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransactionType
{
  return self->_transactionType != 0;
}

- (NSString)transactionType
{
  -[GEORPMerchantLookupContext _readTransactionType]((uint64_t)self);
  transactionType = self->_transactionType;

  return transactionType;
}

- (void)setTransactionType:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_transactionType, a3);
}

- (void)_readTransactionLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransactionLocation_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransactionLocation
{
  return self->_transactionLocation != 0;
}

- (GEOLocation)transactionLocation
{
  -[GEORPMerchantLookupContext _readTransactionLocation]((uint64_t)self);
  transactionLocation = self->_transactionLocation;

  return transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (void)_readCorrelationId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrelationId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasCorrelationId
{
  return self->_correlationId != 0;
}

- (NSString)correlationId
{
  -[GEORPMerchantLookupContext _readCorrelationId]((uint64_t)self);
  correlationId = self->_correlationId;

  return correlationId;
}

- (void)setCorrelationId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_correlationId, a3);
}

- (BOOL)isAppleCard
{
  return self->_isAppleCard;
}

- (void)setIsAppleCard:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_isAppleCard = a3;
}

- (void)setHasIsAppleCard:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32760;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasIsAppleCard
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)requestTransactionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_requestTransactionType;
  }
  else {
    return 0;
  }
}

- (void)setRequestTransactionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_requestTransactionType = a3;
}

- (void)setHasRequestTransactionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = -32764;
  }
  else {
    __int16 v3 = 0x8000;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRequestTransactionType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)requestTransactionTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E6B20[a3];
  }

  return v3;
}

- (int)StringAsRequestTransactionType:(id)a3
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
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMerchantBankTransactionInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMerchantLookupContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantBankTransactionInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasMerchantBankTransactionInfo
{
  return self->_merchantBankTransactionInfo != 0;
}

- (GEOPDBankTransactionInformation)merchantBankTransactionInfo
{
  -[GEORPMerchantLookupContext _readMerchantBankTransactionInfo]((uint64_t)self);
  merchantBankTransactionInfo = self->_merchantBankTransactionInfo;

  return merchantBankTransactionInfo;
}

- (void)setMerchantBankTransactionInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_merchantBankTransactionInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPMerchantLookupContext;
  int v4 = [(GEORPMerchantLookupContext *)&v8 description];
  v5 = [(GEORPMerchantLookupContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMerchantLookupContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(_WORD *)(a1 + 140))
    {
      v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 64)];
      if (a2) {
        objc_super v6 = @"merchantIndustryCode";
      }
      else {
        objc_super v6 = @"merchant_industry_code";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 merchantId];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"merchantId";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"merchant_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 merchantName];
    if (v11)
    {
      if (a2) {
        v12 = @"merchantName";
      }
      else {
        v12 = @"merchant_name";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [(id)a1 merchantRawName];
    if (v13)
    {
      if (a2) {
        v14 = @"merchantRawName";
      }
      else {
        v14 = @"merchant_raw_name";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [(id)a1 merchantIndustryCategory];
    if (v15)
    {
      if (a2) {
        v16 = @"merchantIndustryCategory";
      }
      else {
        v16 = @"merchant_industry_category";
      }
      [v4 setObject:v15 forKey:v16];
    }

    v17 = [(id)a1 merchantUrl];
    if (v17)
    {
      if (a2) {
        v18 = @"merchantUrl";
      }
      else {
        v18 = @"merchant_url";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = [(id)a1 merchantFormattedAddress];
    if (v19)
    {
      if (a2) {
        v20 = @"merchantFormattedAddress";
      }
      else {
        v20 = @"merchant_formatted_address";
      }
      [v4 setObject:v19 forKey:v20];
    }

    v21 = [(id)a1 merchantAdamId];
    if (v21)
    {
      if (a2) {
        v22 = @"merchantAdamId";
      }
      else {
        v22 = @"merchant_adam_id";
      }
      [v4 setObject:v21 forKey:v22];
    }

    if ((*(_WORD *)(a1 + 140) & 2) != 0)
    {
      v23 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
      if (a2) {
        v24 = @"transactionTime";
      }
      else {
        v24 = @"transaction_time";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [(id)a1 transactionType];
    if (v25)
    {
      if (a2) {
        v26 = @"transactionType";
      }
      else {
        v26 = @"transaction_type";
      }
      [v4 setObject:v25 forKey:v26];
    }

    v27 = [(id)a1 transactionLocation];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"transactionLocation";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"transaction_location";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [(id)a1 correlationId];
    if (v31)
    {
      if (a2) {
        v32 = @"correlationId";
      }
      else {
        v32 = @"correlation_id";
      }
      [v4 setObject:v31 forKey:v32];
    }

    __int16 v33 = *(_WORD *)(a1 + 140);
    if ((v33 & 8) != 0)
    {
      v34 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 136)];
      if (a2) {
        v35 = @"isAppleCard";
      }
      else {
        v35 = @"is_apple_card";
      }
      [v4 setObject:v34 forKey:v35];

      __int16 v33 = *(_WORD *)(a1 + 140);
    }
    if ((v33 & 4) != 0)
    {
      uint64_t v36 = *(int *)(a1 + 132);
      if (v36 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = off_1E53E6B20[v36];
      }
      if (a2) {
        v38 = @"requestTransactionType";
      }
      else {
        v38 = @"request_transaction_type";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = [(id)a1 merchantBankTransactionInfo];
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 jsonRepresentation];
        v42 = @"merchantBankTransactionInfo";
      }
      else
      {
        v41 = [v39 dictionaryRepresentation];
        v42 = @"merchant_bank_transaction_info";
      }
      [v4 setObject:v41 forKey:v42];
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
  return -[GEORPMerchantLookupContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPMerchantLookupContext)initWithDictionary:(id)a3
{
  return (GEORPMerchantLookupContext *)-[GEORPMerchantLookupContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_104;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_104;
  }
  if (a3) {
    objc_super v6 = @"merchantIndustryCode";
  }
  else {
    objc_super v6 = @"merchant_industry_code";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMerchantIndustryCode:", objc_msgSend(v7, "longLongValue"));
  }

  if (a3) {
    objc_super v8 = @"merchantId";
  }
  else {
    objc_super v8 = @"merchant_id";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOPDMapsIdentifier alloc];
    if (a3) {
      uint64_t v11 = [(GEOPDMapsIdentifier *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPDMapsIdentifier *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setMerchantId:v11];
  }
  if (a3) {
    v13 = @"merchantName";
  }
  else {
    v13 = @"merchant_name";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v14 copy];
    [a1 setMerchantName:v15];
  }
  if (a3) {
    v16 = @"merchantRawName";
  }
  else {
    v16 = @"merchant_raw_name";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    [a1 setMerchantRawName:v18];
  }
  if (a3) {
    v19 = @"merchantIndustryCategory";
  }
  else {
    v19 = @"merchant_industry_category";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = (void *)[v20 copy];
    [a1 setMerchantIndustryCategory:v21];
  }
  if (a3) {
    v22 = @"merchantUrl";
  }
  else {
    v22 = @"merchant_url";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = (void *)[v23 copy];
    [a1 setMerchantUrl:v24];
  }
  if (a3) {
    v25 = @"merchantFormattedAddress";
  }
  else {
    v25 = @"merchant_formatted_address";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[v26 copy];
    [a1 setMerchantFormattedAddress:v27];
  }
  if (a3) {
    v28 = @"merchantAdamId";
  }
  else {
    v28 = @"merchant_adam_id";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = (void *)[v29 copy];
    [a1 setMerchantAdamId:v30];
  }
  if (a3) {
    v31 = @"transactionTime";
  }
  else {
    v31 = @"transaction_time";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v32 doubleValue];
    objc_msgSend(a1, "setTransactionTime:");
  }

  if (a3) {
    __int16 v33 = @"transactionType";
  }
  else {
    __int16 v33 = @"transaction_type";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = (void *)[v34 copy];
    [a1 setTransactionType:v35];
  }
  if (a3) {
    uint64_t v36 = @"transactionLocation";
  }
  else {
    uint64_t v36 = @"transaction_location";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = [GEOLocation alloc];
    if (a3) {
      uint64_t v39 = [(GEOLocation *)v38 initWithJSON:v37];
    }
    else {
      uint64_t v39 = [(GEOLocation *)v38 initWithDictionary:v37];
    }
    v40 = (void *)v39;
    [a1 setTransactionLocation:v39];
  }
  if (a3) {
    v41 = @"correlationId";
  }
  else {
    v41 = @"correlation_id";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v43 = (void *)[v42 copy];
    [a1 setCorrelationId:v43];
  }
  if (a3) {
    v44 = @"isAppleCard";
  }
  else {
    v44 = @"is_apple_card";
  }
  v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsAppleCard:", objc_msgSend(v45, "BOOLValue"));
  }

  if (a3) {
    v46 = @"requestTransactionType";
  }
  else {
    v46 = @"request_transaction_type";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = v47;
    if ([v48 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v49 = 0;
    }
    else if ([v48 isEqualToString:@"CONTACTLESS"])
    {
      uint64_t v49 = 1;
    }
    else if ([v48 isEqualToString:@"INAPP"])
    {
      uint64_t v49 = 2;
    }
    else if ([v48 isEqualToString:@"WEB"])
    {
      uint64_t v49 = 3;
    }
    else if ([v48 isEqualToString:@"PHYSICAL"])
    {
      uint64_t v49 = 4;
    }
    else if ([v48 isEqualToString:@"VIRTUAL"])
    {
      uint64_t v49 = 5;
    }
    else
    {
      uint64_t v49 = 0;
    }

    goto LABEL_94;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v49 = [v47 intValue];
LABEL_94:
    [a1 setRequestTransactionType:v49];
  }

  if (a3) {
    v50 = @"merchantBankTransactionInfo";
  }
  else {
    v50 = @"merchant_bank_transaction_info";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [GEOPDBankTransactionInformation alloc];
    if (a3) {
      uint64_t v53 = [(GEOPDBankTransactionInformation *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOPDBankTransactionInformation *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [a1 setMerchantBankTransactionInfo:v53];
  }
LABEL_104:

  return a1;
}

- (GEORPMerchantLookupContext)initWithJSON:(id)a3
{
  return (GEORPMerchantLookupContext *)-[GEORPMerchantLookupContext _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1472;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1473;
    }
    GEORPMerchantLookupContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDMapsIdentifier *)self->_merchantId readAll:1];
    [(GEOLocation *)self->_transactionLocation readAll:1];
    [(GEOPDBankTransactionInformation *)self->_merchantBankTransactionInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMerchantLookupContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMerchantLookupContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPMerchantLookupContextIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPMerchantLookupContext *)self readAll:0];
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
    if (self->_merchantId) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_merchantName) {
      PBDataWriterWriteStringField();
    }
    if (self->_merchantRawName) {
      PBDataWriterWriteStringField();
    }
    if (self->_merchantIndustryCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_merchantUrl) {
      PBDataWriterWriteStringField();
    }
    if (self->_merchantFormattedAddress) {
      PBDataWriterWriteStringField();
    }
    if (self->_merchantAdamId) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_transactionType) {
      PBDataWriterWriteStringField();
    }
    if (self->_transactionLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_correlationId) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_merchantBankTransactionInfo) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPMerchantLookupContext _readMerchantBankTransactionInfo]((uint64_t)self);
  if ([(GEOPDBankTransactionInformation *)self->_merchantBankTransactionInfo hasGreenTeaWithValue:v3])
  {
    return 1;
  }
  -[GEORPMerchantLookupContext _readMerchantId]((uint64_t)self);
  if ([(GEOPDMapsIdentifier *)self->_merchantId hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPMerchantLookupContext _readTransactionLocation]((uint64_t)self);
  transactionLocation = self->_transactionLocation;

  return [(GEOLocation *)transactionLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPMerchantLookupContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 30) = self->_readerMarkPos;
  *((_DWORD *)v6 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  if (*(_WORD *)&self->_flags)
  {
    v6[8] = self->_merchantIndustryCode;
    *((_WORD *)v6 + 70) |= 1u;
  }
  if (self->_merchantId)
  {
    objc_msgSend(v6, "setMerchantId:");
    int v4 = v6;
  }
  if (self->_merchantName)
  {
    objc_msgSend(v6, "setMerchantName:");
    int v4 = v6;
  }
  if (self->_merchantRawName)
  {
    objc_msgSend(v6, "setMerchantRawName:");
    int v4 = v6;
  }
  if (self->_merchantIndustryCategory)
  {
    objc_msgSend(v6, "setMerchantIndustryCategory:");
    int v4 = v6;
  }
  if (self->_merchantUrl)
  {
    objc_msgSend(v6, "setMerchantUrl:");
    int v4 = v6;
  }
  if (self->_merchantFormattedAddress)
  {
    objc_msgSend(v6, "setMerchantFormattedAddress:");
    int v4 = v6;
  }
  if (self->_merchantAdamId)
  {
    objc_msgSend(v6, "setMerchantAdamId:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v4[13] = *(id *)&self->_transactionTime;
    *((_WORD *)v4 + 70) |= 2u;
  }
  if (self->_transactionType)
  {
    objc_msgSend(v6, "setTransactionType:");
    int v4 = v6;
  }
  if (self->_transactionLocation)
  {
    objc_msgSend(v6, "setTransactionLocation:");
    int v4 = v6;
  }
  if (self->_correlationId)
  {
    objc_msgSend(v6, "setCorrelationId:");
    int v4 = v6;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)v4 + 136) = self->_isAppleCard;
    *((_WORD *)v4 + 70) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_requestTransactionType;
    *((_WORD *)v4 + 70) |= 4u;
  }
  if (self->_merchantBankTransactionInfo)
  {
    objc_msgSend(v6, "setMerchantBankTransactionInfo:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPMerchantLookupContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPMerchantLookupContext *)self readAll:0];
  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 64) = self->_merchantIndustryCode;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  id v9 = [(GEOPDMapsIdentifier *)self->_merchantId copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_merchantName copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSString *)self->_merchantRawName copyWithZone:a3];
  v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  uint64_t v15 = [(NSString *)self->_merchantIndustryCategory copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  uint64_t v17 = [(NSString *)self->_merchantUrl copyWithZone:a3];
  v18 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v17;

  uint64_t v19 = [(NSString *)self->_merchantFormattedAddress copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  uint64_t v21 = [(NSString *)self->_merchantAdamId copyWithZone:a3];
  v22 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v21;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(double *)(v5 + 104) = self->_transactionTime;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  uint64_t v23 = [(NSString *)self->_transactionType copyWithZone:a3];
  v24 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v23;

  id v25 = [(GEOLocation *)self->_transactionLocation copyWithZone:a3];
  v26 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v25;

  uint64_t v27 = [(NSString *)self->_correlationId copyWithZone:a3];
  v28 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v27;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 136) = self->_isAppleCard;
    *(_WORD *)(v5 + 140) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_requestTransactionType;
    *(_WORD *)(v5 + 140) |= 4u;
  }
  id v30 = [(GEOPDBankTransactionInformation *)self->_merchantBankTransactionInfo copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v30;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEORPMerchantLookupContext *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 70);
  if (*(_WORD *)&self->_flags)
  {
    if ((v5 & 1) == 0 || self->_merchantIndustryCode != *((void *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if (v5)
  {
    goto LABEL_47;
  }
  merchantId = self->_merchantId;
  if ((unint64_t)merchantId | *((void *)v4 + 6) && !-[GEOPDMapsIdentifier isEqual:](merchantId, "isEqual:")) {
    goto LABEL_47;
  }
  merchantName = self->_merchantName;
  if ((unint64_t)merchantName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](merchantName, "isEqual:")) {
      goto LABEL_47;
    }
  }
  merchantRawName = self->_merchantRawName;
  if ((unint64_t)merchantRawName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](merchantRawName, "isEqual:")) {
      goto LABEL_47;
    }
  }
  merchantIndustryCategory = self->_merchantIndustryCategory;
  if ((unint64_t)merchantIndustryCategory | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantIndustryCategory, "isEqual:")) {
      goto LABEL_47;
    }
  }
  merchantUrl = self->_merchantUrl;
  if ((unint64_t)merchantUrl | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](merchantUrl, "isEqual:")) {
      goto LABEL_47;
    }
  }
  merchantFormattedAddress = self->_merchantFormattedAddress;
  if ((unint64_t)merchantFormattedAddress | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](merchantFormattedAddress, "isEqual:")) {
      goto LABEL_47;
    }
  }
  merchantAdamId = self->_merchantAdamId;
  if ((unint64_t)merchantAdamId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](merchantAdamId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 v13 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_transactionTime != *((double *)v4 + 13)) {
      goto LABEL_47;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_47;
  }
  transactionType = self->_transactionType;
  if ((unint64_t)transactionType | *((void *)v4 + 14)
    && !-[NSString isEqual:](transactionType, "isEqual:"))
  {
    goto LABEL_47;
  }
  transactionLocation = self->_transactionLocation;
  if ((unint64_t)transactionLocation | *((void *)v4 + 12))
  {
    if (!-[GEOLocation isEqual:](transactionLocation, "isEqual:")) {
      goto LABEL_47;
    }
  }
  correlationId = self->_correlationId;
  if ((unint64_t)correlationId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](correlationId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v18 = *((_WORD *)v4 + 70);
  if ((flags & 8) != 0)
  {
    if ((v18 & 8) != 0)
    {
      if (self->_isAppleCard)
      {
        if (!*((unsigned char *)v4 + 136)) {
          goto LABEL_47;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_40;
      }
    }
LABEL_47:
    char v20 = 0;
    goto LABEL_48;
  }
  if ((v18 & 8) != 0) {
    goto LABEL_47;
  }
LABEL_40:
  if ((flags & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_requestTransactionType != *((_DWORD *)v4 + 33)) {
      goto LABEL_47;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_47;
  }
  merchantBankTransactionInfo = self->_merchantBankTransactionInfo;
  if ((unint64_t)merchantBankTransactionInfo | *((void *)v4 + 4)) {
    char v20 = -[GEOPDBankTransactionInformation isEqual:](merchantBankTransactionInfo, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_48:

  return v20;
}

- (unint64_t)hash
{
  [(GEORPMerchantLookupContext *)self readAll:1];
  if (*(_WORD *)&self->_flags) {
    uint64_t v22 = 2654435761 * self->_merchantIndustryCode;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v21 = [(GEOPDMapsIdentifier *)self->_merchantId hash];
  NSUInteger v20 = [(NSString *)self->_merchantName hash];
  NSUInteger v19 = [(NSString *)self->_merchantRawName hash];
  NSUInteger v3 = [(NSString *)self->_merchantIndustryCategory hash];
  NSUInteger v4 = [(NSString *)self->_merchantUrl hash];
  NSUInteger v5 = [(NSString *)self->_merchantFormattedAddress hash];
  NSUInteger v6 = [(NSString *)self->_merchantAdamId hash];
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    double transactionTime = self->_transactionTime;
    double v9 = -transactionTime;
    if (transactionTime >= 0.0) {
      double v9 = self->_transactionTime;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_transactionType hash];
  unint64_t v13 = [(GEOLocation *)self->_transactionLocation hash];
  NSUInteger v14 = [(NSString *)self->_correlationId hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v16 = 2654435761 * self->_isAppleCard;
    if ((flags & 4) != 0) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v17 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ [(GEOPDBankTransactionInformation *)self->_merchantBankTransactionInfo hash];
  }
  uint64_t v16 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v17 = 2654435761 * self->_requestTransactionType;
  return v21 ^ v22 ^ v20 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ [(GEOPDBankTransactionInformation *)self->_merchantBankTransactionInfo hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v12 = (int64_t *)a3;
  [v12 readAll:0];
  NSUInteger v4 = v12;
  if (*((_WORD *)v12 + 70))
  {
    self->_merchantIndustryCode = v12[8];
    *(_WORD *)&self->_flags |= 1u;
  }
  merchantId = self->_merchantId;
  int64_t v6 = v12[6];
  if (merchantId)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDMapsIdentifier mergeFrom:](merchantId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPMerchantLookupContext setMerchantId:](self, "setMerchantId:");
  }
  NSUInteger v4 = v12;
LABEL_9:
  if (v4[9])
  {
    -[GEORPMerchantLookupContext setMerchantName:](self, "setMerchantName:");
    NSUInteger v4 = v12;
  }
  if (v4[10])
  {
    -[GEORPMerchantLookupContext setMerchantRawName:](self, "setMerchantRawName:");
    NSUInteger v4 = v12;
  }
  if (v4[7])
  {
    -[GEORPMerchantLookupContext setMerchantIndustryCategory:](self, "setMerchantIndustryCategory:");
    NSUInteger v4 = v12;
  }
  if (v4[11])
  {
    -[GEORPMerchantLookupContext setMerchantUrl:](self, "setMerchantUrl:");
    NSUInteger v4 = v12;
  }
  if (v4[5])
  {
    -[GEORPMerchantLookupContext setMerchantFormattedAddress:](self, "setMerchantFormattedAddress:");
    NSUInteger v4 = v12;
  }
  if (v4[3])
  {
    -[GEORPMerchantLookupContext setMerchantAdamId:](self, "setMerchantAdamId:");
    NSUInteger v4 = v12;
  }
  if ((*((_WORD *)v4 + 70) & 2) != 0)
  {
    *(void *)&self->_double transactionTime = v4[13];
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[14])
  {
    -[GEORPMerchantLookupContext setTransactionType:](self, "setTransactionType:");
    NSUInteger v4 = v12;
  }
  transactionLocation = self->_transactionLocation;
  int64_t v8 = v4[12];
  if (transactionLocation)
  {
    if (!v8) {
      goto LABEL_31;
    }
    -[GEOLocation mergeFrom:](transactionLocation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_31;
    }
    -[GEORPMerchantLookupContext setTransactionLocation:](self, "setTransactionLocation:");
  }
  NSUInteger v4 = v12;
LABEL_31:
  if (v4[2])
  {
    -[GEORPMerchantLookupContext setCorrelationId:](self, "setCorrelationId:");
    NSUInteger v4 = v12;
  }
  __int16 v9 = *((_WORD *)v4 + 70);
  if ((v9 & 8) != 0)
  {
    self->_isAppleCard = *((unsigned char *)v4 + 136);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v9 = *((_WORD *)v4 + 70);
  }
  if ((v9 & 4) != 0)
  {
    self->_requestTransactionType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 4u;
  }
  merchantBankTransactionInfo = self->_merchantBankTransactionInfo;
  int64_t v11 = v4[4];
  if (merchantBankTransactionInfo)
  {
    if (!v11) {
      goto LABEL_43;
    }
    -[GEOPDBankTransactionInformation mergeFrom:](merchantBankTransactionInfo, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_43;
    }
    -[GEORPMerchantLookupContext setMerchantBankTransactionInfo:](self, "setMerchantBankTransactionInfo:");
  }
  NSUInteger v4 = v12;
LABEL_43:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionType, 0);
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_merchantUrl, 0);
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantIndustryCategory, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantFormattedAddress, 0);
  objc_storeStrong((id *)&self->_merchantBankTransactionInfo, 0);
  objc_storeStrong((id *)&self->_merchantAdamId, 0);
  objc_storeStrong((id *)&self->_correlationId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end