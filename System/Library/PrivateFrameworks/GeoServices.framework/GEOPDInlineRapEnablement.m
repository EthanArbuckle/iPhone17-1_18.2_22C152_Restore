@interface GEOPDInlineRapEnablement
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsAddressEditable;
- (BOOL)hasIsHoursEditable;
- (BOOL)hasIsPhoneEditable;
- (BOOL)hasIsWebsiteEditable;
- (BOOL)isAddressEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHoursEditable;
- (BOOL)isPhoneEditable;
- (BOOL)isWebsiteEditable;
- (BOOL)readFrom:(id)a3;
- (GEOPDInlineRapEnablement)initWithDictionary:(id)a3;
- (GEOPDInlineRapEnablement)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAddressEditable:(BOOL)a3;
- (void)setHasIsHoursEditable:(BOOL)a3;
- (void)setHasIsPhoneEditable:(BOOL)a3;
- (void)setHasIsWebsiteEditable:(BOOL)a3;
- (void)setIsAddressEditable:(BOOL)a3;
- (void)setIsHoursEditable:(BOOL)a3;
- (void)setIsPhoneEditable:(BOOL)a3;
- (void)setIsWebsiteEditable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDInlineRapEnablement

- (BOOL)isHoursEditable
{
  return self->_isHoursEditable;
}

- (void)setIsHoursEditable:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isHoursEditable = a3;
}

- (void)setHasIsHoursEditable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsHoursEditable
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isPhoneEditable
{
  return self->_isPhoneEditable;
}

- (void)setIsPhoneEditable:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isPhoneEditable = a3;
}

- (void)setHasIsPhoneEditable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsPhoneEditable
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isWebsiteEditable
{
  return self->_isWebsiteEditable;
}

- (void)setIsWebsiteEditable:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isWebsiteEditable = a3;
}

- (void)setHasIsWebsiteEditable:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsWebsiteEditable
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)isAddressEditable
{
  return self->_isAddressEditable;
}

- (void)setIsAddressEditable:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isAddressEditable = a3;
}

- (void)setHasIsAddressEditable:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsAddressEditable
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDInlineRapEnablement;
  v4 = [(GEOPDInlineRapEnablement *)&v8 description];
  v5 = [(GEOPDInlineRapEnablement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDInlineRapEnablement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_14;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0)
  {
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
    if (a2) {
      v16 = @"isHoursEditable";
    }
    else {
      v16 = @"is_hours_editable";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 20) & 4) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
  if (a2) {
    v18 = @"isPhoneEditable";
  }
  else {
    v18 = @"is_phone_editable";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 19)];
  if (a2) {
    v20 = @"isWebsiteEditable";
  }
  else {
    v20 = @"is_website_editable";
  }
  [v4 setObject:v19 forKey:v20];

  if (*(unsigned char *)(a1 + 20))
  {
LABEL_6:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
    if (a2) {
      v7 = @"isAddressEditable";
    }
    else {
      v7 = @"is_address_editable";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__GEOPDInlineRapEnablement__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v12 = v11;
      id v22 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v21];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDInlineRapEnablement _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDInlineRapEnablement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDInlineRapEnablement)initWithDictionary:(id)a3
{
  return (GEOPDInlineRapEnablement *)-[GEOPDInlineRapEnablement _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"isHoursEditable";
      }
      else {
        v6 = @"is_hours_editable";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsHoursEditable:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"isPhoneEditable";
      }
      else {
        objc_super v8 = @"is_phone_editable";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsPhoneEditable:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"isWebsiteEditable";
      }
      else {
        id v10 = @"is_website_editable";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsWebsiteEditable:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        id v12 = @"isAddressEditable";
      }
      else {
        id v12 = @"is_address_editable";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsAddressEditable:", objc_msgSend(v13, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPDInlineRapEnablement)initWithJSON:(id)a3
{
  return (GEOPDInlineRapEnablement *)-[GEOPDInlineRapEnablement _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDInlineRapEnablementIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDInlineRapEnablementReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDInlineRapEnablement *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_isHoursEditable;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[18] = self->_isPhoneEditable;
  v5[20] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[19] = self->_isWebsiteEditable;
  v5[20] |= 8u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    v5[16] = self->_isAddressEditable;
    v5[20] |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v4 + 17) = self->_isHoursEditable;
    *(unsigned char *)(v4 + 20) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v4 + 19) = self->_isWebsiteEditable;
      *(unsigned char *)(v4 + 20) |= 8u;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 18) = self->_isPhoneEditable;
  *(unsigned char *)(v4 + 20) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (flags)
  {
LABEL_5:
    *(unsigned char *)(v4 + 16) = self->_isAddressEditable;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOPDInlineRapEnablement *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_isHoursEditable)
    {
      if (!v4[17]) {
        goto LABEL_28;
      }
    }
    else if (v4[17])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v4[20] & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_isPhoneEditable)
    {
      if (!v4[18]) {
        goto LABEL_28;
      }
    }
    else if (v4[18])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((v4[20] & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_isWebsiteEditable)
    {
      if (!v4[19]) {
        goto LABEL_28;
      }
    }
    else if (v4[19])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[20] & 8) != 0)
  {
    goto LABEL_28;
  }
  BOOL v5 = (v4[20] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[20])
    {
      if (self->_isAddressEditable)
      {
        if (!v4[16]) {
          goto LABEL_28;
        }
      }
      else if (v4[16])
      {
        goto LABEL_28;
      }
      BOOL v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDInlineRapEnablement *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isHoursEditable;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isPhoneEditable;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_isWebsiteEditable;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_isAddressEditable;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_isHoursEditable = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[20];
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v5[20] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_isPhoneEditable = v5[18];
  *(unsigned char *)&self->_flags |= 4u;
  BOOL v4 = v5[20];
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_isWebsiteEditable = v5[19];
  *(unsigned char *)&self->_flags |= 8u;
  if (v5[20])
  {
LABEL_5:
    self->_isAddressEditable = v5[16];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
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
    [(GEOPDInlineRapEnablement *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end