@interface GEORPGroundViewCorrections
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressToCensor;
- (BOOL)hasCorrectionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackAddressFields)addressToCensor;
- (GEORPGroundViewCorrections)initWithDictionary:(id)a3;
- (GEORPGroundViewCorrections)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctionTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCorrectionType:(id)a3;
- (int)correctionType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressToCensor:(id)a3;
- (void)setCorrectionType:(int)a3;
- (void)setHasCorrectionType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPGroundViewCorrections

- (int)correctionType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_correctionType;
  }
  else {
    return 0;
  }
}

- (void)setCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCorrectionType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DBC50[a3];
  }

  return v3;
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GROUND_VIEW_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_BASIC_CENSOR_REQUEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_IMAGE_QUALITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_STORE_LABEL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_CENSOR_ADDRESS_REQUEST"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_OTHER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GROUND_VIEW_STREET_LABEL"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddressToCensor
{
  return self->_addressToCensor != 0;
}

- (GEORPFeedbackAddressFields)addressToCensor
{
  return self->_addressToCensor;
}

- (void)setAddressToCensor:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPGroundViewCorrections;
  int v4 = [(GEORPGroundViewCorrections *)&v8 description];
  v5 = [(GEORPGroundViewCorrections *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DBC50[v5];
      }
      if (a2) {
        v7 = @"correctionType";
      }
      else {
        v7 = @"correction_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 addressToCensor];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"addressToCensor";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"address_to_censor";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __56__GEORPGroundViewCorrections__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEORPGroundViewCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPGroundViewCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEORPGroundViewCorrections)initWithDictionary:(id)a3
{
  return (GEORPGroundViewCorrections *)-[GEORPGroundViewCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_35;
  }
  if (a3) {
    v6 = @"correctionType";
  }
  else {
    v6 = @"correction_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"GROUND_VIEW_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_BASIC_CENSOR_REQUEST"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_IMAGE_QUALITY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_STORE_LABEL"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_CENSOR_ADDRESS_REQUEST"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_OTHER"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"GROUND_VIEW_STREET_LABEL"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_25:
    [a1 setCorrectionType:v9];
  }

  if (a3) {
    id v10 = @"addressToCensor";
  }
  else {
    id v10 = @"address_to_censor";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEORPFeedbackAddressFields alloc];
    if (a3) {
      uint64_t v13 = [(GEORPFeedbackAddressFields *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEORPFeedbackAddressFields *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setAddressToCensor:v13];
  }
LABEL_35:

  return a1;
}

- (GEORPGroundViewCorrections)initWithJSON:(id)a3
{
  return (GEORPGroundViewCorrections *)-[GEORPGroundViewCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_addressToCensor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPGroundViewCorrections *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_correctionType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_addressToCensor)
  {
    objc_msgSend(v5, "setAddressToCensor:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_correctionType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEORPFeedbackAddressFields *)self->_addressToCensor copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEORPGroundViewCorrections *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  addressToCensor = self->_addressToCensor;
  if ((unint64_t)addressToCensor | *((void *)v4 + 2)) {
    char v6 = -[GEORPFeedbackAddressFields isEqual:](addressToCensor, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPGroundViewCorrections *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_correctionType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEORPFeedbackAddressFields *)self->_addressToCensor hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[7])
  {
    self->_correctionType = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  addressToCensor = self->_addressToCensor;
  uint64_t v6 = *((void *)v7 + 2);
  if (addressToCensor)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPFeedbackAddressFields mergeFrom:](addressToCensor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPGroundViewCorrections setAddressToCensor:](self, "setAddressToCensor:");
  }
  id v4 = v7;
LABEL_9:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPGroundViewCorrections *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressToCensor, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end