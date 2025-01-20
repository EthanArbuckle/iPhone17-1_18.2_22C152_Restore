@interface BCSEmailMetadataParquetMessage
+ (Class)displayNameType;
+ (Class)nameType;
- (BOOL)hasBusinessId;
- (BOOL)hasCompanyId;
- (BOOL)hasIsVerified;
- (BOOL)hasKey;
- (BOOL)hasKeyHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerified;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)displayNames;
- (NSMutableArray)names;
- (NSString)businessId;
- (NSString)companyId;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayNameAtIndex:(unint64_t)a3;
- (id)nameAtIndex:(unint64_t)a3;
- (int64_t)keyHash;
- (unint64_t)displayNamesCount;
- (unint64_t)hash;
- (unint64_t)namesCount;
- (void)addDisplayName:(id)a3;
- (void)addName:(id)a3;
- (void)clearDisplayNames;
- (void)clearNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(id)a3;
- (void)setCompanyId:(id)a3;
- (void)setDisplayNames:(id)a3;
- (void)setHasIsVerified:(BOOL)a3;
- (void)setHasKeyHash:(BOOL)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyHash:(int64_t)a3;
- (void)setNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSEmailMetadataParquetMessage

- (void)setKeyHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keyHash = a3;
}

- (void)setHasKeyHash:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyHash
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)clearNames
{
}

- (void)addName:(id)a3
{
  id v4 = a3;
  names = self->_names;
  id v8 = v4;
  if (!names)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_names;
    self->_names = v6;

    id v4 = v8;
    names = self->_names;
  }
  [(NSMutableArray *)names addObject:v4];
}

- (unint64_t)namesCount
{
  return [(NSMutableArray *)self->_names count];
}

- (id)nameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_names objectAtIndex:a3];
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (void)clearDisplayNames
{
}

- (void)addDisplayName:(id)a3
{
  id v4 = a3;
  displayNames = self->_displayNames;
  id v8 = v4;
  if (!displayNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_displayNames;
    self->_displayNames = v6;

    id v4 = v8;
    displayNames = self->_displayNames;
  }
  [(NSMutableArray *)displayNames addObject:v4];
}

- (unint64_t)displayNamesCount
{
  return [(NSMutableArray *)self->_displayNames count];
}

- (id)displayNameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_displayNames objectAtIndex:a3];
}

+ (Class)displayNameType
{
  return (Class)objc_opt_class();
}

- (void)setIsVerified:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBusinessId
{
  return self->_businessId != 0;
}

- (BOOL)hasCompanyId
{
  return self->_companyId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSEmailMetadataParquetMessage;
  id v4 = [(BCSEmailMetadataParquetMessage *)&v8 description];
  v5 = [(BCSEmailMetadataParquetMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_keyHash];
    [v3 setObject:v4 forKey:@"key_hash"];
  }
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ([(NSMutableArray *)self->_names count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_names, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = self->_names;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_displayNames count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_displayNames, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = self->_displayNames;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"display_name"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_isVerified];
    [v3 setObject:v20 forKey:@"is_verified"];
  }
  businessId = self->_businessId;
  if (businessId) {
    [v3 setObject:businessId forKey:@"business_id"];
  }
  companyId = self->_companyId;
  if (companyId) {
    [v3 setObject:companyId forKey:@"company_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v8 = (int *)MEMORY[0x263F62268];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          int64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (1)
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              int64_t v20 = 0;
              goto LABEL_47;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_45:
          if (*((unsigned char *)a3 + *v6)) {
            int64_t v20 = 0;
          }
LABEL_47:
          self->_keyHash = v20;
          goto LABEL_52;
        case 2u:
          PBReaderReadString();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 40;
          goto LABEL_43;
        case 3u:
          long long v27 = objc_alloc_init(BCSEmailLocalizedString);
          [(BCSEmailMetadataParquetMessage *)self addName:v27];
          goto LABEL_31;
        case 4u:
          long long v27 = objc_alloc_init(BCSEmailLocalizedString);
          [(BCSEmailMetadataParquetMessage *)self addDisplayName:v27];
LABEL_31:
          if (!PBReaderPlaceMark()
            || (BCSEmailLocalizedStringReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v24) = 0;
            return v24;
          }
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_53;
          }
          break;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v31 = *v4;
            unint64_t v32 = *(void *)((char *)a3 + v31);
            if (v32 == -1 || v32 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v32);
              *(void *)((char *)a3 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  uint64_t v30 = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v30 = 0;
          }
LABEL_51:
          self->_isVerified = v30 != 0;
          goto LABEL_52;
        case 6u:
          PBReaderReadString();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 16;
          goto LABEL_43;
        case 7u:
          PBReaderReadString();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 24;
LABEL_43:
          uint64_t v34 = *(Class *)((char *)&self->super.super.isa + v26);
          *(Class *)((char *)&self->super.super.isa + v26) = v25;

          goto LABEL_52;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_52;
      }
    }
  }
LABEL_53:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_names;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v10 = self->_displayNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_businessId) {
    PBDataWriterWriteStringField();
  }
  if (self->_companyId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_keyHash;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  uint64_t v14 = v4;
  if (self->_key) {
    objc_msgSend(v4, "setKey:");
  }
  if ([(BCSEmailMetadataParquetMessage *)self namesCount])
  {
    [v14 clearNames];
    unint64_t v5 = [(BCSEmailMetadataParquetMessage *)self namesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BCSEmailMetadataParquetMessage *)self nameAtIndex:i];
        [v14 addName:v8];
      }
    }
  }
  if ([(BCSEmailMetadataParquetMessage *)self displayNamesCount])
  {
    [v14 clearDisplayNames];
    unint64_t v9 = [(BCSEmailMetadataParquetMessage *)self displayNamesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BCSEmailMetadataParquetMessage *)self displayNameAtIndex:j];
        [v14 addDisplayName:v12];
      }
    }
  }
  uint64_t v13 = v14;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14[56] = self->_isVerified;
    v14[60] |= 2u;
  }
  if (self->_businessId)
  {
    objc_msgSend(v14, "setBusinessId:");
    uint64_t v13 = v14;
  }
  if (self->_companyId)
  {
    objc_msgSend(v14, "setCompanyId:");
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_keyHash;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v9 = self->_names;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addName:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v15 = self->_displayNames;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (void)v26);
        [(id)v6 addDisplayName:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isVerified;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  uint64_t v21 = -[NSString copyWithZone:](self->_businessId, "copyWithZone:", a3, (void)v26);
  long long v22 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v21;

  uint64_t v23 = [(NSString *)self->_companyId copyWithZone:a3];
  int v24 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_keyHash != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_25;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5) && !-[NSString isEqual:](key, "isEqual:")) {
    goto LABEL_25;
  }
  names = self->_names;
  if ((unint64_t)names | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](names, "isEqual:")) {
      goto LABEL_25;
    }
  }
  displayNames = self->_displayNames;
  if ((unint64_t)displayNames | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](displayNames, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_21;
      }
    }
LABEL_25:
    char v10 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0) {
    goto LABEL_25;
  }
LABEL_21:
  businessId = self->_businessId;
  if ((unint64_t)businessId | *((void *)v4 + 2) && !-[NSString isEqual:](businessId, "isEqual:")) {
    goto LABEL_25;
  }
  companyId = self->_companyId;
  if ((unint64_t)companyId | *((void *)v4 + 3)) {
    char v10 = -[NSString isEqual:](companyId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_keyHash;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_key hash];
  uint64_t v5 = [(NSMutableArray *)self->_names hash];
  uint64_t v6 = [(NSMutableArray *)self->_displayNames hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isVerified;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_businessId hash];
  return v8 ^ v9 ^ [(NSString *)self->_companyId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_keyHash = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[5]) {
    -[BCSEmailMetadataParquetMessage setKey:](self, "setKey:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BCSEmailMetadataParquetMessage *)self addName:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BCSEmailMetadataParquetMessage addDisplayName:](self, "addDisplayName:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if ((*((unsigned char *)v5 + 60) & 2) != 0)
  {
    self->_isVerified = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 2)) {
    -[BCSEmailMetadataParquetMessage setBusinessId:](self, "setBusinessId:");
  }
  if (*((void *)v5 + 3)) {
    -[BCSEmailMetadataParquetMessage setCompanyId:](self, "setCompanyId:");
  }
}

- (int64_t)keyHash
{
  return self->_keyHash;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (NSMutableArray)displayNames
{
  return self->_displayNames;
}

- (void)setDisplayNames:(id)a3
{
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
}

- (NSString)companyId
{
  return self->_companyId;
}

- (void)setCompanyId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_companyId, 0);

  objc_storeStrong((id *)&self->_businessId, 0);
}

@end