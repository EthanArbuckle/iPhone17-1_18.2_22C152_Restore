@interface GEORPFeedbackLayoutFormConfig
+ (BOOL)isValid:(id)a3;
+ (Class)layoutFieldType;
- (BOOL)enabled;
- (BOOL)hasEnabled;
- (BOOL)hasFormType;
- (BOOL)hasRadius;
- (BOOL)hasTtl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackLayoutFormConfig)initWithDictionary:(id)a3;
- (GEORPFeedbackLayoutFormConfig)initWithJSON:(id)a3;
- (NSMutableArray)layoutFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)layoutFieldAtIndex:(unint64_t)a3;
- (int)StringAsFormType:(id)a3;
- (int)formType;
- (unint64_t)hash;
- (unint64_t)layoutFieldsCount;
- (unsigned)radius;
- (unsigned)ttl;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addLayoutField:(id)a3;
- (void)clearLayoutFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFormType:(int)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasFormType:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setHasTtl:(BOOL)a3;
- (void)setLayoutFields:(id)a3;
- (void)setRadius:(unsigned int)a3;
- (void)setTtl:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackLayoutFormConfig

- (unsigned)ttl
{
  return self->_ttl;
}

- (void)setTtl:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)formType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_formType;
  }
  else {
    return 0;
  }
}

- (void)setFormType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_formType = a3;
}

- (void)setHasFormType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFormType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)formTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB250[a3];
  }

  return v3;
}

- (int)StringAsFormType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_WORKFLOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_ADD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_EDIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_ADD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_GROUNDVIEW"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_NEW_INCIDENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_IMAGE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)layoutFields
{
  return self->_layoutFields;
}

- (void)setLayoutFields:(id)a3
{
}

- (void)clearLayoutFields
{
}

- (void)addLayoutField:(id)a3
{
  id v4 = a3;
  layoutFields = self->_layoutFields;
  id v8 = v4;
  if (!layoutFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_layoutFields;
    self->_layoutFields = v6;

    id v4 = v8;
    layoutFields = self->_layoutFields;
  }
  [(NSMutableArray *)layoutFields addObject:v4];
}

- (unint64_t)layoutFieldsCount
{
  return [(NSMutableArray *)self->_layoutFields count];
}

- (id)layoutFieldAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_layoutFields objectAtIndex:a3];
}

+ (Class)layoutFieldType
{
  return (Class)objc_opt_class();
}

- (BOOL)enabled
{
  return (*(unsigned char *)&self->_flags & 8) == 0 || self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)radius
{
  return self->_radius;
}

- (void)setRadius:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackLayoutFormConfig;
  id v4 = [(GEORPFeedbackLayoutFormConfig *)&v8 description];
  v5 = [(GEORPFeedbackLayoutFormConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutFormConfig _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 4) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v6 forKey:@"ttl"];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      uint64_t v7 = *(int *)(a1 + 16);
      if (v7 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53EB250[v7];
      }
      if (a2) {
        v9 = @"formType";
      }
      else {
        v9 = @"form_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = *(id *)(a1 + 8);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }

      if (a2) {
        v18 = @"layoutField";
      }
      else {
        v18 = @"layout_field";
      }
      [v4 setObject:v10 forKey:v18];
    }
    char v19 = *(unsigned char *)(a1 + 32);
    if ((v19 & 8) != 0)
    {
      v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      [v4 setObject:v20 forKey:@"enabled"];

      char v19 = *(unsigned char *)(a1 + 32);
    }
    if ((v19 & 2) != 0)
    {
      v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v21 forKey:@"radius"];
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
  return -[GEORPFeedbackLayoutFormConfig _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutFormConfig)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutFormConfig *)-[GEORPFeedbackLayoutFormConfig _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_56;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_56;
  }
  v6 = [v5 objectForKeyedSubscript:@"ttl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTtl:", objc_msgSend(v6, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v7 = @"formType";
  }
  else {
    uint64_t v7 = @"form_type";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_UNKNOWN"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_WORKFLOW"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_ADD"])
    {
      uint64_t v10 = 2;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_EDIT"])
    {
      uint64_t v10 = 3;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_ADD"])
    {
      uint64_t v10 = 4;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_ADDRESS_EDIT"])
    {
      uint64_t v10 = 5;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_GROUNDVIEW"])
    {
      uint64_t v10 = 6;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_NEW_INCIDENT"])
    {
      uint64_t v10 = 7;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_POI_IMAGE"])
    {
      uint64_t v10 = 8;
    }
    else if ([v9 isEqualToString:@"FEEDBACK_LAYOUT_FORM_INCIDENT_VOTING"])
    {
      uint64_t v10 = 9;
    }
    else
    {
      uint64_t v10 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 intValue];
LABEL_33:
    [a1 setFormType:v10];
  }

  if (a3) {
    id v11 = @"layoutField";
  }
  else {
    id v11 = @"layout_field";
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v19 = [GEORPLayoutField alloc];
            if (a3) {
              uint64_t v20 = [(GEORPLayoutField *)v19 initWithJSON:v18];
            }
            else {
              uint64_t v20 = [(GEORPLayoutField *)v19 initWithDictionary:v18];
            }
            v21 = (void *)v20;
            [a1 addLayoutField:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    id v5 = v25;
  }

  v22 = [v5 objectForKeyedSubscript:@"enabled"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEnabled:", objc_msgSend(v22, "BOOLValue"));
  }

  long long v23 = [v5 objectForKeyedSubscript:@"radius"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRadius:", objc_msgSend(v23, "unsignedIntValue"));
  }

LABEL_56:
  return a1;
}

- (GEORPFeedbackLayoutFormConfig)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutFormConfig *)-[GEORPFeedbackLayoutFormConfig _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutFormConfigIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutFormConfigReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_layoutFields;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_flags;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v11 = (char)self->_flags;
  }
  if ((v11 & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = a3;
  [(GEORPFeedbackLayoutFormConfig *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v10[6] = self->_ttl;
    *((unsigned char *)v10 + 32) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v10[4] = self->_formType;
    *((unsigned char *)v10 + 32) |= 1u;
  }
  if ([(GEORPFeedbackLayoutFormConfig *)self layoutFieldsCount])
  {
    [v10 clearLayoutFields];
    unint64_t v5 = [(GEORPFeedbackLayoutFormConfig *)self layoutFieldsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEORPFeedbackLayoutFormConfig *)self layoutFieldAtIndex:i];
        [v10 addLayoutField:v8];
      }
    }
  }
  char v9 = (char)self->_flags;
  if ((v9 & 8) != 0)
  {
    *((unsigned char *)v10 + 28) = self->_enabled;
    *((unsigned char *)v10 + 32) |= 8u;
    char v9 = (char)self->_flags;
  }
  if ((v9 & 2) != 0)
  {
    v10[5] = self->_radius;
    *((unsigned char *)v10 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_ttl;
    *(unsigned char *)(v5 + 32) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_formType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_layoutFields;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v6 addLayoutField:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(unsigned char *)(v6 + 28) = self->_enabled;
    *(unsigned char *)(v6 + 32) |= 8u;
    char v14 = (char)self->_flags;
  }
  if ((v14 & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_radius;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEORPFeedbackLayoutFormConfig *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_ttl != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_formType != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_27;
  }
  layoutFields = self->_layoutFields;
  if ((unint64_t)layoutFields | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](layoutFields, "isEqual:")) {
      goto LABEL_27;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) != 0)
    {
      if (self->_enabled)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  if ((v6 & 8) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_radius != *((_DWORD *)v4 + 5)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPFeedbackLayoutFormConfig *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_ttl;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_formType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_layoutFields hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_enabled;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_radius;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_ttl = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_formType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEORPFeedbackLayoutFormConfig addLayoutField:](self, "addLayoutField:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v4 + 32);
  if ((v11 & 8) != 0)
  {
    self->_enabled = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_flags |= 8u;
    char v11 = *((unsigned char *)v4 + 32);
  }
  if ((v11 & 2) != 0)
  {
    self->_radius = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end