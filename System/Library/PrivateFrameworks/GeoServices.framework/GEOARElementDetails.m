@interface GEOARElementDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)didSafetyUiTraggier;
- (BOOL)didUserSeeArLabel;
- (BOOL)hasArElementShown;
- (BOOL)hasDidSafetyUiTraggier;
- (BOOL)hasDidUserSeeArLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOARElementDetails)initWithDictionary:(id)a3;
- (GEOARElementDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arElementShownAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsArElementShown:(id)a3;
- (int)arElementShown;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArElementShown:(int)a3;
- (void)setDidSafetyUiTraggier:(BOOL)a3;
- (void)setDidUserSeeArLabel:(BOOL)a3;
- (void)setHasArElementShown:(BOOL)a3;
- (void)setHasDidSafetyUiTraggier:(BOOL)a3;
- (void)setHasDidUserSeeArLabel:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOARElementDetails

- (int)arElementShown
{
  if (*(unsigned char *)&self->_flags) {
    return self->_arElementShown;
  }
  else {
    return 0;
  }
}

- (void)setArElementShown:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arElementShown = a3;
}

- (void)setHasArElementShown:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArElementShown
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)arElementShownAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F7450[a3];
  }

  return v3;
}

- (int)StringAsArElementShown:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AR_ELEMENT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AR_ELEMENT_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AR_ELEMENT_CONTINUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AR_ELEMENT_MANEUVER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AR_ELEMENT_ARRIVAL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)didUserSeeArLabel
{
  return self->_didUserSeeArLabel;
}

- (void)setDidUserSeeArLabel:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_didUserSeeArLabel = a3;
}

- (void)setHasDidUserSeeArLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDidUserSeeArLabel
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)didSafetyUiTraggier
{
  return self->_didSafetyUiTraggier;
}

- (void)setDidSafetyUiTraggier:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_didSafetyUiTraggier = a3;
}

- (void)setHasDidSafetyUiTraggier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDidSafetyUiTraggier
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOARElementDetails;
  int v4 = [(GEOARElementDetails *)&v8 description];
  v5 = [(GEOARElementDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARElementDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 16);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 8);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F7450[v6];
      }
      if (a2) {
        objc_super v8 = @"arElementShown";
      }
      else {
        objc_super v8 = @"ar_element_shown";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 4) != 0)
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 13)];
      if (a2) {
        v10 = @"didUserSeeArLabel";
      }
      else {
        v10 = @"did_user_see_ar_label";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 16);
    }
    if ((v5 & 2) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
      if (a2) {
        v12 = @"didSafetyUiTraggier";
      }
      else {
        v12 = @"did_safety_ui_traggier";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEOARElementDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOARElementDetails)initWithDictionary:(id)a3
{
  return (GEOARElementDetails *)-[GEOARElementDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_33;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_33;
  }
  if (a3) {
    uint64_t v6 = @"arElementShown";
  }
  else {
    uint64_t v6 = @"ar_element_shown";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"AR_ELEMENT_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"AR_ELEMENT_NONE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"AR_ELEMENT_CONTINUE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"AR_ELEMENT_MANEUVER"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"AR_ELEMENT_ARRIVAL"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setArElementShown:v9];
  }

  if (a3) {
    v10 = @"didUserSeeArLabel";
  }
  else {
    v10 = @"did_user_see_ar_label";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDidUserSeeArLabel:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    v12 = @"didSafetyUiTraggier";
  }
  else {
    v12 = @"did_safety_ui_traggier";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDidSafetyUiTraggier:", objc_msgSend(v13, "BOOLValue"));
  }

LABEL_33:
  return a1;
}

- (GEOARElementDetails)initWithJSON:(id)a3
{
  return (GEOARElementDetails *)-[GEOARElementDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARElementDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARElementDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOARElementDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_arElementShown;
    *((unsigned char *)v5 + 16) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 13) = self->_didUserSeeArLabel;
  *((unsigned char *)v5 + 16) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 12) = self->_didSafetyUiTraggier;
    *((unsigned char *)v5 + 16) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_arElementShown;
    *((unsigned char *)result + 16) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 13) = self->_didUserSeeArLabel;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_didSafetyUiTraggier;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOARElementDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_arElementShown != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_didUserSeeArLabel)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_didSafetyUiTraggier)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  [(GEOARElementDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_arElementShown;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_didUserSeeArLabel;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_didSafetyUiTraggier;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if (v4)
  {
    self->_arElementShown = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 16);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_didUserSeeArLabel = *((unsigned char *)v5 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 16) & 2) != 0)
  {
LABEL_4:
    self->_didSafetyUiTraggier = *((unsigned char *)v5 + 12);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
}

@end