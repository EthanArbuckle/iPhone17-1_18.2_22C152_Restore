@interface GEOPDMerchantLookupBrandParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMerchantLookupBrandParameters)init;
- (GEOPDMerchantLookupBrandParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMerchantLookupBrandParameters

- (GEOPDMerchantLookupBrandParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  v2 = [(GEOPDMerchantLookupBrandParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMerchantLookupBrandParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  v3 = [(GEOPDMerchantLookupBrandParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMerchantLookupBrandParameters;
  v4 = [(GEOPDMerchantLookupBrandParameters *)&v8 description];
  v5 = [(GEOPDMerchantLookupBrandParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMerchantLookupBrandParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMerchantLookupBrandParameters readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCode_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v7 = *(id *)(a1 + 48);
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

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawMerchantCode_tags_4161);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v11 = *(id *)(a1 + 64);
    if (v11)
    {
      if (a2) {
        v12 = @"rawMerchantCode";
      }
      else {
        v12 = @"raw_merchant_code";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWarsawIdentifier_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v15 = *(id *)(a1 + 72);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"warsawIdentifier";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"warsaw_identifier";
      }
      [v4 setObject:v17 forKey:v18];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 2) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppIdentifier_tags);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v21 = *(id *)(a1 + 24);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"appIdentifier";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"app_identifier";
      }
      [v4 setObject:v23 forKey:v24];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v25 = *(void **)(a1 + 8);
      if (v25)
      {
        id v26 = v25;
        objc_sync_enter(v26);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantId_tags_4162);
        objc_sync_exit(v26);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v27 = *(id *)(a1 + 56);
    if (v27)
    {
      if (a2) {
        v28 = @"merchantId";
      }
      else {
        v28 = @"merchant_id";
      }
      [v4 setObject:v27 forKey:v28];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v29 = *(void **)(a1 + 8);
      if (v29)
      {
        id v30 = v29;
        objc_sync_enter(v30);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantCanl_tags_4163);
        objc_sync_exit(v30);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v31 = *(id *)(a1 + 40);
    if (v31)
    {
      if (a2) {
        v32 = @"merchantCanl";
      }
      else {
        v32 = @"merchant_canl";
      }
      [v4 setObject:v31 forKey:v32];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 92) & 4) == 0)
    {
      v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentityMerchantInformation_tags);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v35 = *(id *)(a1 + 32);
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"identityMerchantInformation";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"identity_merchant_information";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = *(void **)(a1 + 16);
    if (v39)
    {
      v40 = [v39 dictionaryRepresentation];
      v41 = v40;
      if (a2)
      {
        v42 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __64__GEOPDMerchantLookupBrandParameters__dictionaryRepresentation___block_invoke;
        v46[3] = &unk_1E53D8860;
        id v43 = v42;
        id v47 = v43;
        [v41 enumerateKeysAndObjectsUsingBlock:v46];
        id v44 = v43;

        v41 = v44;
      }
      [v4 setObject:v41 forKey:@"Unknown Fields"];
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
  return -[GEOPDMerchantLookupBrandParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_4191;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_4192;
      }
      GEOPDMerchantLookupBrandParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDWarsawMerchantIdentifier readAll:](*(void *)(a1 + 72), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __64__GEOPDMerchantLookupBrandParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDMerchantLookupBrandParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x150) != 0) {
    goto LABEL_7;
  }
  if ((flags & 0x80) != 0)
  {
    if (GEOPDWarsawMerchantIdentifierIsDirty((uint64_t)self->_warsawIdentifier)) {
      goto LABEL_7;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x2E) == 0)
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 0);
  if (self->_merchantCode) {
    PBDataWriterWriteStringField();
  }
  id v6 = v9;
  if (self->_rawMerchantCode)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_warsawIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_appIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_merchantId)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_merchantCanl)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_identityMerchantInformation)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_merchantCode copyWithZone:a3];
    id v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_rawMerchantCode copyWithZone:a3];
    id v11 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v10;

    id v12 = [(GEOPDWarsawMerchantIdentifier *)self->_warsawIdentifier copyWithZone:a3];
    v13 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v12;

    id v14 = [(GEOPDAdamAppIdentifier *)self->_appIdentifier copyWithZone:a3];
    id v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    uint64_t v16 = [(NSString *)self->_merchantId copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    uint64_t v18 = [(NSString *)self->_merchantCanl copyWithZone:a3];
    v19 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v18;

    id v20 = [(GEOPDIdentityMerchantInformation *)self->_identityMerchantInformation copyWithZone:a3];
    id v21 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v20;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDMerchantLookupBrandParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 1);
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)v4, 1);
  merchantCode = self->_merchantCode;
  if ((unint64_t)merchantCode | v4[6])
  {
    if (!-[NSString isEqual:](merchantCode, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (((rawMerchantCode = self->_rawMerchantCode, !((unint64_t)rawMerchantCode | v4[8]))
     || -[NSString isEqual:](rawMerchantCode, "isEqual:"))
    && ((warsawIdentifier = self->_warsawIdentifier, !((unint64_t)warsawIdentifier | v4[9]))
     || -[GEOPDWarsawMerchantIdentifier isEqual:](warsawIdentifier, "isEqual:"))
    && ((appIdentifier = self->_appIdentifier, !((unint64_t)appIdentifier | v4[3]))
     || -[GEOPDAdamAppIdentifier isEqual:](appIdentifier, "isEqual:"))
    && ((merchantId = self->_merchantId, !((unint64_t)merchantId | v4[7]))
     || -[NSString isEqual:](merchantId, "isEqual:"))
    && ((merchantCanl = self->_merchantCanl, !((unint64_t)merchantCanl | v4[5]))
     || -[NSString isEqual:](merchantCanl, "isEqual:")))
  {
    identityMerchantInformation = self->_identityMerchantInformation;
    if ((unint64_t)identityMerchantInformation | v4[4]) {
      char v12 = -[GEOPDIdentityMerchantInformation isEqual:](identityMerchantInformation, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
LABEL_16:
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDMerchantLookupBrandParameters readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_merchantCode hash];
  NSUInteger v4 = [(NSString *)self->_rawMerchantCode hash] ^ v3;
  unint64_t v5 = [(GEOPDWarsawMerchantIdentifier *)self->_warsawIdentifier hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDAdamAppIdentifier *)self->_appIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_merchantId hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_merchantCanl hash];
  return v6 ^ v8 ^ [(GEOPDIdentityMerchantInformation *)self->_identityMerchantInformation hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warsawIdentifier, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
  objc_storeStrong((id *)&self->_merchantCanl, 0);
  objc_storeStrong((id *)&self->_identityMerchantInformation, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end