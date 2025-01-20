@interface GEORPFeedbackComponent
+ (BOOL)isValid:(id)a3;
+ (Class)valueType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatus;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackComponent)initWithDictionary:(id)a3;
- (GEORPFeedbackComponent)initWithJSON:(id)a3;
- (NSMutableArray)values;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsType:(id)a3;
- (int)status;
- (int)type;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addValue:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setType:(int)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackComponent

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F6828[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_NOTIFICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_OVERVIEW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_CONVERSATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_RAP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)status
{
  if (*(unsigned char *)&self->_flags) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    int v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        int v4 = @"STATUS_FAILED";
        break;
      case 2:
        int v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        int v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        int v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      int v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      int v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        int v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    int v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void)clearValues
{
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSMutableArray *)values addObject:v4];
}

- (unint64_t)valuesCount
{
  return [(NSMutableArray *)self->_values count];
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_values objectAtIndex:a3];
}

+ (Class)valueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackComponent;
  id v4 = [(GEORPFeedbackComponent *)&v8 description];
  v5 = [(GEORPFeedbackComponent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackComponent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_42;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 28);
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53F6828[v6];
    }
    [v4 setObject:v7 forKey:@"type"];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if (v5)
  {
    int v8 = *(_DWORD *)(a1 + 24);
    if (v8 <= 29)
    {
      v9 = @"STATUS_SUCCESS";
      switch(v8)
      {
        case 0:
          goto LABEL_25;
        case 1:
          v9 = @"STATUS_FAILED";
          break;
        case 2:
          v9 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_20;
        case 5:
          v9 = @"INVALID_REQUEST";
          break;
        default:
          if (v8 != 20) {
            goto LABEL_20;
          }
          v9 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_25;
    }
    if (v8 > 49)
    {
      if (v8 == 50)
      {
        v9 = @"STATUS_DEDUPED";
        goto LABEL_25;
      }
      if (v8 == 60)
      {
        v9 = @"VERSION_MISMATCH";
        goto LABEL_25;
      }
    }
    else
    {
      if (v8 == 30)
      {
        v9 = @"NEEDS_REFINEMENT";
        goto LABEL_25;
      }
      if (v8 == 40)
      {
        v9 = @"FAILED_NOT_AUTHORIZED";
LABEL_25:
        [v4 setObject:v9 forKey:@"status"];

        goto LABEL_26;
      }
    }
LABEL_20:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  if ([*(id *)(a1 + 16) count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = *(id *)(a1 + 16);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (a2) {
            [v16 jsonRepresentation];
          }
          else {
          v17 = [v16 dictionaryRepresentation];
          }
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"value"];
  }
  v18 = *(void **)(a1 + 8);
  if (v18)
  {
    v19 = [v18 dictionaryRepresentation];
    v20 = v19;
    if (a2)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52__GEORPFeedbackComponent__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v22 = v21;
      id v26 = v22;
      [v20 enumerateKeysAndObjectsUsingBlock:v25];
      id v23 = v22;

      v20 = v23;
    }
    [v4 setObject:v20 forKey:@"Unknown Fields"];
  }
LABEL_42:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackComponent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORPFeedbackComponent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackComponent)initWithDictionary:(id)a3
{
  return (GEORPFeedbackComponent *)-[GEORPFeedbackComponent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_64;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_64;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_NOTIFICATION"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_OVERVIEW"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_CONVERSATION"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_POI_ENRICHMENT"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_RAP"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_THIRD_PARTY_PHOTO_SHARING_PREFERENCE"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"FEEDBACK_COMPONENT_TYPE_PHOTO_ATTRIBUTION_PREFERENCES"])
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setType:v8];
LABEL_25:

  v9 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([v10 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v11 = 20;
    }
    else if ([v10 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v11 = 30;
    }
    else if ([v10 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v11 = 40;
    }
    else if ([v10 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v11 = 50;
    }
    else if ([v10 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v11 = 60;
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 intValue];
LABEL_48:
    [a1 setStatus:v11];
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEORPFeedbackComponentValue alloc];
            if (a3) {
              uint64_t v20 = [(GEORPFeedbackComponentValue *)v19 initWithJSON:v18];
            }
            else {
              uint64_t v20 = [(GEORPFeedbackComponentValue *)v19 initWithDictionary:v18];
            }
            v21 = (void *)v20;
            [a1 addValue:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    id v5 = v23;
  }

LABEL_64:
  return a1;
}

- (GEORPFeedbackComponent)initWithJSON:(id)a3
{
  return (GEORPFeedbackComponent *)-[GEORPFeedbackComponent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackComponentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackComponentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_values;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_values;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  BOOL v9 = a3;
  [(GEORPFeedbackComponent *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[7] = self->_type;
    *((unsigned char *)v9 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v9[6] = self->_status;
    *((unsigned char *)v9 + 32) |= 1u;
  }
  if ([(GEORPFeedbackComponent *)self valuesCount])
  {
    [v9 clearValues];
    unint64_t v5 = [(GEORPFeedbackComponent *)self valuesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEORPFeedbackComponent *)self valueAtIndex:i];
        [v9 addValue:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (id *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_type;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_status;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_values;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addValue:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEORPFeedbackComponent *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_type != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_status != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  values = self->_values;
  if ((unint64_t)values | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](values, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPFeedbackComponent *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSMutableArray *)self->_values hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_status;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_values hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_status = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEORPFeedbackComponent addValue:](self, "addValue:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackComponent *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_values;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end