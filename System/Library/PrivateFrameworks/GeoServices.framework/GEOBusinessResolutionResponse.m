@interface GEOBusinessResolutionResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBusinessName;
- (BOOL)hasBusinessUID;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOBusinessResolutionResponse)initWithDictionary:(id)a3;
- (GEOBusinessResolutionResponse)initWithJSON:(id)a3;
- (NSString)businessName;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)businessUID;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessName:(id)a3;
- (void)setBusinessUID:(unint64_t)a3;
- (void)setHasBusinessUID:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBusinessResolutionResponse

- (int)status
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
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

- (BOOL)hasBusinessName
{
  return self->_businessName != 0;
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
}

- (unint64_t)businessUID
{
  return self->_businessUID;
}

- (void)setBusinessUID:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_businessUID = a3;
}

- (void)setHasBusinessUID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessUID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBusinessResolutionResponse;
  int v4 = [(GEOBusinessResolutionResponse *)&v8 description];
  v5 = [(GEOBusinessResolutionResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
    int v3 = *(_DWORD *)(a1 + 24);
    if (v3 <= 29)
    {
      int v4 = @"STATUS_SUCCESS";
      switch(v3)
      {
        case 0:
          goto LABEL_20;
        case 1:
          int v4 = @"STATUS_FAILED";
          break;
        case 2:
          int v4 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          int v4 = @"INVALID_REQUEST";
          break;
        default:
          if (v3 != 20) {
            goto LABEL_15;
          }
          int v4 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v3 > 49)
    {
      if (v3 == 50)
      {
        int v4 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v3 == 60)
      {
        int v4 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v3 == 30)
      {
        int v4 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v3 == 40)
      {
        int v4 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v2 setObject:v4 forKey:@"status"];

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  v5 = [(id)a1 businessName];
  if (v5) {
    [v2 setObject:v5 forKey:@"businessName"];
  }

  if (*(unsigned char *)(a1 + 28))
  {
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    [v2 setObject:v6 forKey:@"businessUID"];
  }
LABEL_25:

  return v2;
}

- (GEOBusinessResolutionResponse)initWithDictionary:(id)a3
{
  return (GEOBusinessResolutionResponse *)-[GEOBusinessResolutionResponse _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_32;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_32;
  }
  int v4 = [v3 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v6 = 30;
    }
    else if ([v5 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v6 = 40;
    }
    else if ([v5 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v6 = 50;
    }
    else if ([v5 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v6 = 60;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_26:
    [a1 setStatus:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"businessName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setBusinessName:v8];
  }
  v9 = [v3 objectForKeyedSubscript:@"businessUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBusinessUID:", objc_msgSend(v9, "unsignedLongLongValue"));
  }

LABEL_32:
  return a1;
}

- (GEOBusinessResolutionResponse)initWithJSON:(id)a3
{
  return (GEOBusinessResolutionResponse *)-[GEOBusinessResolutionResponse _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  int v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_41;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        goto LABEL_41;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        if (v16 != 2) {
          goto LABEL_43;
        }
      }
      else if (v18 == 1)
      {
        if ((v10 & 7) != 0) {
          goto LABEL_43;
        }
        unsigned int v19 = 0;
        while (1)
        {
          uint64_t v20 = *v4;
          unint64_t v21 = *(void *)((char *)a3 + v20);
          if (v21 == -1 || v21 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          unint64_t v22 = v21 + 1;
          int v23 = *(char *)(*(void *)((char *)a3 + *v7) + v21);
          *(void *)((char *)a3 + v20) = v22;
          if (v23 < 0)
          {
            BOOL v24 = v19++ > 8;
            if (!v24) {
              continue;
            }
          }
          goto LABEL_40;
        }
LABEL_37:
        *((unsigned char *)a3 + *v6) = 1;
        goto LABEL_40;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_43:
        BOOL v30 = 0;
        goto LABEL_42;
      }
LABEL_40:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_41;
      }
    }
    if ((v10 & 7) != 0) {
      goto LABEL_43;
    }
    unsigned int v25 = 0;
    while (1)
    {
      uint64_t v26 = *v4;
      unint64_t v27 = *(void *)((char *)a3 + v26);
      if (v27 == -1 || v27 >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_37;
      }
      unint64_t v28 = v27 + 1;
      int v29 = *(char *)(*(void *)((char *)a3 + *v7) + v27);
      *(void *)((char *)a3 + v26) = v28;
      if (v29 < 0)
      {
        BOOL v24 = v25++ > 8;
        if (!v24) {
          continue;
        }
      }
      goto LABEL_40;
    }
  }
LABEL_41:
  BOOL v30 = *((unsigned char *)a3 + *v6) == 0;
LABEL_42:
  PBReaderRecallMark();
  return v30;
}

- (BOOL)readFrom:(id)a3
{
  int v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    uint64_t v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          unint64_t v13 = *(void *)&v4[v12];
          if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          BOOL v15 = v10++ >= 9;
          if (v15)
          {
            unint64_t v11 = 0;
            int v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v16 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        unint64_t v18 = v11 >> 3;
        if ((v11 >> 3) == 3)
        {
          char v25 = 0;
          unsigned int v26 = 0;
          unint64_t v27 = 0;
          *(unsigned char *)&self->_flags |= 1u;
          while (1)
          {
            uint64_t v28 = *v5;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v6]) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)&v4[*v8] + v29);
            *(void *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0) {
              goto LABEL_44;
            }
            v25 += 7;
            BOOL v15 = v26++ >= 9;
            if (v15)
            {
              unint64_t v27 = 0;
              goto LABEL_46;
            }
          }
          v4[*v7] = 1;
LABEL_44:
          if (v4[*v7]) {
            unint64_t v27 = 0;
          }
LABEL_46:
          self->_businessUID = v27;
        }
        else if (v18 == 2)
        {
          PBReaderReadString();
          v31 = (NSString *)objc_claimAutoreleasedReturnValue();
          businessName = self->_businessName;
          self->_businessName = v31;
        }
        else if (v18 == 1)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)&self->_flags |= 2u;
          while (1)
          {
            uint64_t v22 = *v5;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v6]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_40;
            }
            v19 += 7;
            BOOL v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          v4[*v7] = 1;
LABEL_40:
          if (v4[*v7]) {
            LODWORD(v21) = 0;
          }
LABEL_42:
          self->_status = v21;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_49;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v33 = v4[*v7] == 0;
  }
  else
  {
LABEL_49:
    BOOL v33 = 0;
  }
  objc_sync_exit(v4);

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_businessName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOBusinessResolutionResponse *)self readAll:0];
  id v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v5[6] = self->_status;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  if (self->_businessName)
  {
    objc_msgSend(v5, "setBusinessName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_businessUID;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_status;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_businessName copyWithZone:a3];
  char v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v6 + 16) = self->_businessUID;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOBusinessResolutionResponse *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 28);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  businessName = self->_businessName;
  if ((unint64_t)businessName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](businessName, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 28);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_businessUID != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOBusinessResolutionResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_businessName hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_businessUID;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if ((v5[7] & 2) != 0)
  {
    self->_status = v5[6];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEOBusinessResolutionResponse setBusinessName:](self, "setBusinessName:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    self->_businessUID = *((void *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end