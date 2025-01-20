@interface GEOPDMerchantInformation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMerchantAdditionalData;
- (BOOL)hasMerchantAddress;
- (BOOL)hasMerchantCanl;
- (BOOL)hasMerchantCity;
- (BOOL)hasMerchantCleanConfidenceLevel;
- (BOOL)hasMerchantCountryCode;
- (BOOL)hasMerchantDoingBusinessAsName;
- (BOOL)hasMerchantEnhancedName;
- (BOOL)hasMerchantId;
- (BOOL)hasMerchantRawAddress;
- (BOOL)hasMerchantRawCity;
- (BOOL)hasMerchantRawState;
- (BOOL)hasMerchantState;
- (BOOL)hasMerchantType;
- (BOOL)hasMerchantZip;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMerchantInformation)init;
- (GEOPDMerchantInformation)initWithData:(id)a3;
- (GEOPDMerchantInformation)initWithDictionary:(id)a3;
- (GEOPDMerchantInformation)initWithJSON:(id)a3;
- (NSString)merchantAdditionalData;
- (NSString)merchantAddress;
- (NSString)merchantCanl;
- (NSString)merchantCity;
- (NSString)merchantCountryCode;
- (NSString)merchantDoingBusinessAsName;
- (NSString)merchantEnhancedName;
- (NSString)merchantId;
- (NSString)merchantRawAddress;
- (NSString)merchantRawCity;
- (NSString)merchantRawState;
- (NSString)merchantState;
- (NSString)merchantType;
- (NSString)merchantZip;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)merchantCleanConfidenceLevel;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMerchantAdditionalData;
- (void)_readMerchantAddress;
- (void)_readMerchantCanl;
- (void)_readMerchantCity;
- (void)_readMerchantCountryCode;
- (void)_readMerchantDoingBusinessAsName;
- (void)_readMerchantEnhancedName;
- (void)_readMerchantId;
- (void)_readMerchantRawAddress;
- (void)_readMerchantRawCity;
- (void)_readMerchantRawState;
- (void)_readMerchantState;
- (void)_readMerchantType;
- (void)_readMerchantZip;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMerchantCleanConfidenceLevel:(BOOL)a3;
- (void)setMerchantAdditionalData:(id)a3;
- (void)setMerchantAddress:(id)a3;
- (void)setMerchantCanl:(id)a3;
- (void)setMerchantCity:(id)a3;
- (void)setMerchantCleanConfidenceLevel:(int)a3;
- (void)setMerchantCountryCode:(id)a3;
- (void)setMerchantDoingBusinessAsName:(id)a3;
- (void)setMerchantEnhancedName:(id)a3;
- (void)setMerchantId:(id)a3;
- (void)setMerchantRawAddress:(id)a3;
- (void)setMerchantRawCity:(id)a3;
- (void)setMerchantRawState:(id)a3;
- (void)setMerchantState:(id)a3;
- (void)setMerchantType:(id)a3;
- (void)setMerchantZip:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMerchantInformation

- (GEOPDMerchantInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantInformation;
  v2 = [(GEOPDMerchantInformation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantInformation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantInformation;
  v3 = [(GEOPDMerchantInformation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMerchantId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantId
{
  return self->_merchantId != 0;
}

- (NSString)merchantId
{
  -[GEOPDMerchantInformation _readMerchantId]((uint64_t)self);
  merchantId = self->_merchantId;

  return merchantId;
}

- (void)setMerchantId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (void)_readMerchantDoingBusinessAsName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantDoingBusinessAsName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantDoingBusinessAsName
{
  return self->_merchantDoingBusinessAsName != 0;
}

- (NSString)merchantDoingBusinessAsName
{
  -[GEOPDMerchantInformation _readMerchantDoingBusinessAsName]((uint64_t)self);
  merchantDoingBusinessAsName = self->_merchantDoingBusinessAsName;

  return merchantDoingBusinessAsName;
}

- (void)setMerchantDoingBusinessAsName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  objc_storeStrong((id *)&self->_merchantDoingBusinessAsName, a3);
}

- (void)_readMerchantEnhancedName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantEnhancedName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantEnhancedName
{
  return self->_merchantEnhancedName != 0;
}

- (NSString)merchantEnhancedName
{
  -[GEOPDMerchantInformation _readMerchantEnhancedName]((uint64_t)self);
  merchantEnhancedName = self->_merchantEnhancedName;

  return merchantEnhancedName;
}

- (void)setMerchantEnhancedName:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  objc_storeStrong((id *)&self->_merchantEnhancedName, a3);
}

- (void)_readMerchantCity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCity_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCity
{
  return self->_merchantCity != 0;
}

- (NSString)merchantCity
{
  -[GEOPDMerchantInformation _readMerchantCity]((uint64_t)self);
  merchantCity = self->_merchantCity;

  return merchantCity;
}

- (void)setMerchantCity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  objc_storeStrong((id *)&self->_merchantCity, a3);
}

- (void)_readMerchantRawCity
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantRawCity_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawCity
{
  return self->_merchantRawCity != 0;
}

- (NSString)merchantRawCity
{
  -[GEOPDMerchantInformation _readMerchantRawCity]((uint64_t)self);
  merchantRawCity = self->_merchantRawCity;

  return merchantRawCity;
}

- (void)setMerchantRawCity:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_merchantRawCity, a3);
}

- (void)_readMerchantState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantState
{
  return self->_merchantState != 0;
}

- (NSString)merchantState
{
  -[GEOPDMerchantInformation _readMerchantState]((uint64_t)self);
  merchantState = self->_merchantState;

  return merchantState;
}

- (void)setMerchantState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_merchantState, a3);
}

- (void)_readMerchantRawState
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantRawState_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawState
{
  return self->_merchantRawState != 0;
}

- (NSString)merchantRawState
{
  -[GEOPDMerchantInformation _readMerchantRawState]((uint64_t)self);
  merchantRawState = self->_merchantRawState;

  return merchantRawState;
}

- (void)setMerchantRawState:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_merchantRawState, a3);
}

- (void)_readMerchantZip
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantZip_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantZip
{
  return self->_merchantZip != 0;
}

- (NSString)merchantZip
{
  -[GEOPDMerchantInformation _readMerchantZip]((uint64_t)self);
  merchantZip = self->_merchantZip;

  return merchantZip;
}

- (void)setMerchantZip:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_merchantZip, a3);
}

- (void)_readMerchantAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantAddress
{
  return self->_merchantAddress != 0;
}

- (NSString)merchantAddress
{
  -[GEOPDMerchantInformation _readMerchantAddress]((uint64_t)self);
  merchantAddress = self->_merchantAddress;

  return merchantAddress;
}

- (void)setMerchantAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  objc_storeStrong((id *)&self->_merchantAddress, a3);
}

- (void)_readMerchantRawAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantRawAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantRawAddress
{
  return self->_merchantRawAddress != 0;
}

- (NSString)merchantRawAddress
{
  -[GEOPDMerchantInformation _readMerchantRawAddress]((uint64_t)self);
  merchantRawAddress = self->_merchantRawAddress;

  return merchantRawAddress;
}

- (void)setMerchantRawAddress:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_merchantRawAddress, a3);
}

- (void)_readMerchantCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCountryCode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCountryCode
{
  return self->_merchantCountryCode != 0;
}

- (NSString)merchantCountryCode
{
  -[GEOPDMerchantInformation _readMerchantCountryCode]((uint64_t)self);
  merchantCountryCode = self->_merchantCountryCode;

  return merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  objc_storeStrong((id *)&self->_merchantCountryCode, a3);
}

- (void)_readMerchantType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 153) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantType
{
  return self->_merchantType != 0;
}

- (NSString)merchantType
{
  -[GEOPDMerchantInformation _readMerchantType]((uint64_t)self);
  merchantType = self->_merchantType;

  return merchantType;
}

- (void)setMerchantType:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_merchantType, a3);
}

- (int)merchantCleanConfidenceLevel
{
  return self->_merchantCleanConfidenceLevel;
}

- (void)setMerchantCleanConfidenceLevel:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_merchantCleanConfidenceLevel = a3;
}

- (void)setHasMerchantCleanConfidenceLevel:(BOOL)a3
{
  self->_flags = ($E8DA446A015AA6BFFC5AC7F180BF14D6)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasMerchantCleanConfidenceLevel
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readMerchantAdditionalData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantAdditionalData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantAdditionalData
{
  return self->_merchantAdditionalData != 0;
}

- (NSString)merchantAdditionalData
{
  -[GEOPDMerchantInformation _readMerchantAdditionalData]((uint64_t)self);
  merchantAdditionalData = self->_merchantAdditionalData;

  return merchantAdditionalData;
}

- (void)setMerchantAdditionalData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  objc_storeStrong((id *)&self->_merchantAdditionalData, a3);
}

- (void)_readMerchantCanl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(unsigned char *)(a1 + 152) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMerchantInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCanl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMerchantCanl
{
  return self->_merchantCanl != 0;
}

- (NSString)merchantCanl
{
  -[GEOPDMerchantInformation _readMerchantCanl]((uint64_t)self);
  merchantCanl = self->_merchantCanl;

  return merchantCanl;
}

- (void)setMerchantCanl:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  objc_storeStrong((id *)&self->_merchantCanl, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMerchantInformation;
  v4 = [(GEOPDMerchantInformation *)&v8 description];
  v5 = [(GEOPDMerchantInformation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 merchantId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"merchantId";
      }
      else {
        objc_super v6 = @"merchant_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 merchantDoingBusinessAsName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"merchantDoingBusinessAsName";
      }
      else {
        objc_super v8 = @"merchant_doing_business_as_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 merchantEnhancedName];
    if (v9)
    {
      if (a2) {
        v10 = @"merchantEnhancedName";
      }
      else {
        v10 = @"merchant_enhanced_name";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [(id)a1 merchantCity];
    if (v11)
    {
      if (a2) {
        v12 = @"merchantCity";
      }
      else {
        v12 = @"merchant_city";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [(id)a1 merchantRawCity];
    if (v13)
    {
      if (a2) {
        v14 = @"merchantRawCity";
      }
      else {
        v14 = @"merchant_raw_city";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [(id)a1 merchantState];
    if (v15)
    {
      if (a2) {
        v16 = @"merchantState";
      }
      else {
        v16 = @"merchant_state";
      }
      [v4 setObject:v15 forKey:v16];
    }

    v17 = [(id)a1 merchantRawState];
    if (v17)
    {
      if (a2) {
        v18 = @"merchantRawState";
      }
      else {
        v18 = @"merchant_raw_state";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = [(id)a1 merchantZip];
    if (v19)
    {
      if (a2) {
        v20 = @"merchantZip";
      }
      else {
        v20 = @"merchant_zip";
      }
      [v4 setObject:v19 forKey:v20];
    }

    v21 = [(id)a1 merchantAddress];
    if (v21)
    {
      if (a2) {
        v22 = @"merchantAddress";
      }
      else {
        v22 = @"merchant_address";
      }
      [v4 setObject:v21 forKey:v22];
    }

    v23 = [(id)a1 merchantRawAddress];
    if (v23)
    {
      if (a2) {
        v24 = @"merchantRawAddress";
      }
      else {
        v24 = @"merchant_raw_address";
      }
      [v4 setObject:v23 forKey:v24];
    }

    v25 = [(id)a1 merchantCountryCode];
    if (v25)
    {
      if (a2) {
        v26 = @"merchantCountryCode";
      }
      else {
        v26 = @"merchant_country_code";
      }
      [v4 setObject:v25 forKey:v26];
    }

    v27 = [(id)a1 merchantType];
    if (v27)
    {
      if (a2) {
        v28 = @"merchantType";
      }
      else {
        v28 = @"merchant_type";
      }
      [v4 setObject:v27 forKey:v28];
    }

    if (*(unsigned char *)(a1 + 152))
    {
      v29 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 148)];
      if (a2) {
        v30 = @"merchantCleanConfidenceLevel";
      }
      else {
        v30 = @"merchant_clean_confidence_level";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [(id)a1 merchantAdditionalData];
    if (v31)
    {
      if (a2) {
        v32 = @"merchantAdditionalData";
      }
      else {
        v32 = @"merchant_additional_data";
      }
      [v4 setObject:v31 forKey:v32];
    }

    v33 = [(id)a1 merchantCanl];
    if (v33)
    {
      if (a2) {
        v34 = @"merchantCanl";
      }
      else {
        v34 = @"merchant_canl";
      }
      [v4 setObject:v33 forKey:v34];
    }

    v35 = *(void **)(a1 + 16);
    if (v35)
    {
      v36 = [v35 dictionaryRepresentation];
      v37 = v36;
      if (a2)
      {
        v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __54__GEOPDMerchantInformation__dictionaryRepresentation___block_invoke;
        v42[3] = &unk_1E53D8860;
        id v39 = v38;
        id v43 = v39;
        [v37 enumerateKeysAndObjectsUsingBlock:v42];
        id v40 = v39;

        v37 = v40;
      }
      [v4 setObject:v37 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDMerchantInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPDMerchantInformation)initWithDictionary:(id)a3
{
  return (GEOPDMerchantInformation *)-[GEOPDMerchantInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"merchantId";
      }
      else {
        objc_super v6 = @"merchant_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setMerchantId:v8];
      }
      if (a3) {
        v9 = @"merchantDoingBusinessAsName";
      }
      else {
        v9 = @"merchant_doing_business_as_name";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setMerchantDoingBusinessAsName:v11];
      }
      if (a3) {
        v12 = @"merchantEnhancedName";
      }
      else {
        v12 = @"merchant_enhanced_name";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setMerchantEnhancedName:v14];
      }
      if (a3) {
        v15 = @"merchantCity";
      }
      else {
        v15 = @"merchant_city";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setMerchantCity:v17];
      }
      if (a3) {
        v18 = @"merchantRawCity";
      }
      else {
        v18 = @"merchant_raw_city";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = (void *)[v19 copy];
        [a1 setMerchantRawCity:v20];
      }
      if (a3) {
        v21 = @"merchantState";
      }
      else {
        v21 = @"merchant_state";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (void *)[v22 copy];
        [a1 setMerchantState:v23];
      }
      if (a3) {
        v24 = @"merchantRawState";
      }
      else {
        v24 = @"merchant_raw_state";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = (void *)[v25 copy];
        [a1 setMerchantRawState:v26];
      }
      if (a3) {
        v27 = @"merchantZip";
      }
      else {
        v27 = @"merchant_zip";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = (void *)[v28 copy];
        [a1 setMerchantZip:v29];
      }
      if (a3) {
        v30 = @"merchantAddress";
      }
      else {
        v30 = @"merchant_address";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = (void *)[v31 copy];
        [a1 setMerchantAddress:v32];
      }
      if (a3) {
        v33 = @"merchantRawAddress";
      }
      else {
        v33 = @"merchant_raw_address";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = (void *)[v34 copy];
        [a1 setMerchantRawAddress:v35];
      }
      if (a3) {
        v36 = @"merchantCountryCode";
      }
      else {
        v36 = @"merchant_country_code";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = (void *)[v37 copy];
        [a1 setMerchantCountryCode:v38];
      }
      if (a3) {
        id v39 = @"merchantType";
      }
      else {
        id v39 = @"merchant_type";
      }
      id v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = (void *)[v40 copy];
        [a1 setMerchantType:v41];
      }
      if (a3) {
        v42 = @"merchantCleanConfidenceLevel";
      }
      else {
        v42 = @"merchant_clean_confidence_level";
      }
      id v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMerchantCleanConfidenceLevel:", objc_msgSend(v43, "intValue"));
      }

      if (a3) {
        v44 = @"merchantAdditionalData";
      }
      else {
        v44 = @"merchant_additional_data";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = (void *)[v45 copy];
        [a1 setMerchantAdditionalData:v46];
      }
      if (a3) {
        v47 = @"merchantCanl";
      }
      else {
        v47 = @"merchant_canl";
      }
      v48 = [v5 objectForKeyedSubscript:v47];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v49 = (void *)[v48 copy];
        [a1 setMerchantCanl:v49];
      }
    }
  }

  return a1;
}

- (GEOPDMerchantInformation)initWithJSON:(id)a3
{
  return (GEOPDMerchantInformation *)-[GEOPDMerchantInformation _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4057;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4058;
    }
    GEOPDMerchantInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMerchantInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x1FFFC) == 0))
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
    [(GEOPDMerchantInformation *)self readAll:0];
    if (self->_merchantId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_merchantDoingBusinessAsName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantEnhancedName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantCity)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantRawCity)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantState)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantRawState)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantZip)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantAddress)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantRawAddress)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantCountryCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantType)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_merchantAdditionalData)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_merchantCanl)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDMerchantInformation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 34) = self->_readerMarkPos;
  *((_DWORD *)v5 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_merchantId) {
    objc_msgSend(v5, "setMerchantId:");
  }
  if (self->_merchantDoingBusinessAsName) {
    objc_msgSend(v5, "setMerchantDoingBusinessAsName:");
  }
  v4 = v5;
  if (self->_merchantEnhancedName)
  {
    objc_msgSend(v5, "setMerchantEnhancedName:");
    v4 = v5;
  }
  if (self->_merchantCity)
  {
    objc_msgSend(v5, "setMerchantCity:");
    v4 = v5;
  }
  if (self->_merchantRawCity)
  {
    objc_msgSend(v5, "setMerchantRawCity:");
    v4 = v5;
  }
  if (self->_merchantState)
  {
    objc_msgSend(v5, "setMerchantState:");
    v4 = v5;
  }
  if (self->_merchantRawState)
  {
    objc_msgSend(v5, "setMerchantRawState:");
    v4 = v5;
  }
  if (self->_merchantZip)
  {
    objc_msgSend(v5, "setMerchantZip:");
    v4 = v5;
  }
  if (self->_merchantAddress)
  {
    objc_msgSend(v5, "setMerchantAddress:");
    v4 = v5;
  }
  if (self->_merchantRawAddress)
  {
    objc_msgSend(v5, "setMerchantRawAddress:");
    v4 = v5;
  }
  if (self->_merchantCountryCode)
  {
    objc_msgSend(v5, "setMerchantCountryCode:");
    v4 = v5;
  }
  if (self->_merchantType)
  {
    objc_msgSend(v5, "setMerchantType:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 37) = self->_merchantCleanConfidenceLevel;
    *((_DWORD *)v4 + 38) |= 1u;
  }
  if (self->_merchantAdditionalData)
  {
    objc_msgSend(v5, "setMerchantAdditionalData:");
    v4 = v5;
  }
  if (self->_merchantCanl)
  {
    objc_msgSend(v5, "setMerchantCanl:");
    v4 = v5;
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
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMerchantInformationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDMerchantInformation *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_merchantId copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  uint64_t v11 = [(NSString *)self->_merchantDoingBusinessAsName copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_merchantEnhancedName copyWithZone:a3];
  v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_merchantCity copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  uint64_t v17 = [(NSString *)self->_merchantRawCity copyWithZone:a3];
  v18 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v17;

  uint64_t v19 = [(NSString *)self->_merchantState copyWithZone:a3];
  v20 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v19;

  uint64_t v21 = [(NSString *)self->_merchantRawState copyWithZone:a3];
  v22 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v21;

  uint64_t v23 = [(NSString *)self->_merchantZip copyWithZone:a3];
  v24 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v23;

  uint64_t v25 = [(NSString *)self->_merchantAddress copyWithZone:a3];
  v26 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v25;

  uint64_t v27 = [(NSString *)self->_merchantRawAddress copyWithZone:a3];
  v28 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v27;

  uint64_t v29 = [(NSString *)self->_merchantCountryCode copyWithZone:a3];
  v30 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v29;

  uint64_t v31 = [(NSString *)self->_merchantType copyWithZone:a3];
  v32 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v31;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 148) = self->_merchantCleanConfidenceLevel;
    *(_DWORD *)(v5 + 152) |= 1u;
  }
  uint64_t v33 = [(NSString *)self->_merchantAdditionalData copyWithZone:a3];
  v34 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v33;

  uint64_t v35 = [(NSString *)self->_merchantCanl copyWithZone:a3];
  v36 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v35;

  v37 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v37;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  [(GEOPDMerchantInformation *)self readAll:1];
  [v4 readAll:1];
  merchantId = self->_merchantId;
  if ((unint64_t)merchantId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](merchantId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantDoingBusinessAsName = self->_merchantDoingBusinessAsName;
  if ((unint64_t)merchantDoingBusinessAsName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](merchantDoingBusinessAsName, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantEnhancedName = self->_merchantEnhancedName;
  if ((unint64_t)merchantEnhancedName | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](merchantEnhancedName, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantCity = self->_merchantCity;
  if ((unint64_t)merchantCity | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](merchantCity, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantRawCity = self->_merchantRawCity;
  if ((unint64_t)merchantRawCity | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](merchantRawCity, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantState = self->_merchantState;
  if ((unint64_t)merchantState | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](merchantState, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantRawState = self->_merchantRawState;
  if ((unint64_t)merchantRawState | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](merchantRawState, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantZip = self->_merchantZip;
  if ((unint64_t)merchantZip | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](merchantZip, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantAddress = self->_merchantAddress;
  if ((unint64_t)merchantAddress | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](merchantAddress, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantRawAddress = self->_merchantRawAddress;
  if ((unint64_t)merchantRawAddress | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](merchantRawAddress, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantCountryCode = self->_merchantCountryCode;
  if ((unint64_t)merchantCountryCode | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](merchantCountryCode, "isEqual:")) {
      goto LABEL_35;
    }
  }
  merchantType = self->_merchantType;
  if ((unint64_t)merchantType | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](merchantType, "isEqual:")) {
      goto LABEL_35;
    }
  }
  int v17 = *((_DWORD *)v4 + 38);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v17 & 1) == 0 || self->_merchantCleanConfidenceLevel != *((_DWORD *)v4 + 37)) {
      goto LABEL_35;
    }
  }
  else if (v17)
  {
LABEL_35:
    char v20 = 0;
    goto LABEL_36;
  }
  merchantAdditionalData = self->_merchantAdditionalData;
  if ((unint64_t)merchantAdditionalData | *((void *)v4 + 3)
    && !-[NSString isEqual:](merchantAdditionalData, "isEqual:"))
  {
    goto LABEL_35;
  }
  merchantCanl = self->_merchantCanl;
  if ((unint64_t)merchantCanl | *((void *)v4 + 5)) {
    char v20 = -[NSString isEqual:](merchantCanl, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_36:

  return v20;
}

- (unint64_t)hash
{
  [(GEOPDMerchantInformation *)self readAll:1];
  NSUInteger v18 = [(NSString *)self->_merchantId hash];
  NSUInteger v17 = [(NSString *)self->_merchantDoingBusinessAsName hash];
  NSUInteger v16 = [(NSString *)self->_merchantEnhancedName hash];
  NSUInteger v3 = [(NSString *)self->_merchantCity hash];
  NSUInteger v4 = [(NSString *)self->_merchantRawCity hash];
  NSUInteger v5 = [(NSString *)self->_merchantState hash];
  NSUInteger v6 = [(NSString *)self->_merchantRawState hash];
  NSUInteger v7 = [(NSString *)self->_merchantZip hash];
  NSUInteger v8 = [(NSString *)self->_merchantAddress hash];
  NSUInteger v9 = [(NSString *)self->_merchantRawAddress hash];
  NSUInteger v10 = [(NSString *)self->_merchantCountryCode hash];
  NSUInteger v11 = [(NSString *)self->_merchantType hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_merchantCleanConfidenceLevel;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v17 ^ v18 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v14 = v11 ^ v12 ^ [(NSString *)self->_merchantAdditionalData hash];
  return v13 ^ v14 ^ [(NSString *)self->_merchantCanl hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[10])
  {
    -[GEOPDMerchantInformation setMerchantId:](self, "setMerchantId:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    -[GEOPDMerchantInformation setMerchantDoingBusinessAsName:](self, "setMerchantDoingBusinessAsName:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    -[GEOPDMerchantInformation setMerchantEnhancedName:](self, "setMerchantEnhancedName:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    -[GEOPDMerchantInformation setMerchantCity:](self, "setMerchantCity:");
    NSUInteger v4 = v5;
  }
  if (v4[12])
  {
    -[GEOPDMerchantInformation setMerchantRawCity:](self, "setMerchantRawCity:");
    NSUInteger v4 = v5;
  }
  if (v4[14])
  {
    -[GEOPDMerchantInformation setMerchantState:](self, "setMerchantState:");
    NSUInteger v4 = v5;
  }
  if (v4[13])
  {
    -[GEOPDMerchantInformation setMerchantRawState:](self, "setMerchantRawState:");
    NSUInteger v4 = v5;
  }
  if (v4[16])
  {
    -[GEOPDMerchantInformation setMerchantZip:](self, "setMerchantZip:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[GEOPDMerchantInformation setMerchantAddress:](self, "setMerchantAddress:");
    NSUInteger v4 = v5;
  }
  if (v4[11])
  {
    -[GEOPDMerchantInformation setMerchantRawAddress:](self, "setMerchantRawAddress:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    -[GEOPDMerchantInformation setMerchantCountryCode:](self, "setMerchantCountryCode:");
    NSUInteger v4 = v5;
  }
  if (v4[15])
  {
    -[GEOPDMerchantInformation setMerchantType:](self, "setMerchantType:");
    NSUInteger v4 = v5;
  }
  if (v4[19])
  {
    self->_merchantCleanConfidenceLevel = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 1u;
  }
  if (v4[3])
  {
    -[GEOPDMerchantInformation setMerchantAdditionalData:](self, "setMerchantAdditionalData:");
    NSUInteger v4 = v5;
  }
  if (v4[5])
  {
    -[GEOPDMerchantInformation setMerchantCanl:](self, "setMerchantCanl:");
    NSUInteger v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOPDMerchantInformationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4062);
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
  *(_DWORD *)&self->_flags |= 0x10002u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDMerchantInformation *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantZip, 0);
  objc_storeStrong((id *)&self->_merchantType, 0);
  objc_storeStrong((id *)&self->_merchantState, 0);
  objc_storeStrong((id *)&self->_merchantRawState, 0);
  objc_storeStrong((id *)&self->_merchantRawCity, 0);
  objc_storeStrong((id *)&self->_merchantRawAddress, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantEnhancedName, 0);
  objc_storeStrong((id *)&self->_merchantDoingBusinessAsName, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantCity, 0);
  objc_storeStrong((id *)&self->_merchantCanl, 0);
  objc_storeStrong((id *)&self->_merchantAddress, 0);
  objc_storeStrong((id *)&self->_merchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end