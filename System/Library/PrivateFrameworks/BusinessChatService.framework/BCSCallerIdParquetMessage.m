@interface BCSCallerIdParquetMessage
+ (Class)intentType;
+ (Class)nameType;
- (BOOL)hasIsVerified;
- (BOOL)hasLogo;
- (BOOL)hasLogoFormat;
- (BOOL)hasPhoneHash;
- (BOOL)hasPhoneNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerified;
- (BOOL)readFrom:(id)a3;
- (NSData)logo;
- (NSMutableArray)intents;
- (NSMutableArray)names;
- (NSString)logoFormat;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intentAtIndex:(unint64_t)a3;
- (id)nameAtIndex:(unint64_t)a3;
- (int64_t)phoneHash;
- (unint64_t)hash;
- (unint64_t)intentsCount;
- (unint64_t)namesCount;
- (void)addIntent:(id)a3;
- (void)addName:(id)a3;
- (void)clearIntents;
- (void)clearNames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsVerified:(BOOL)a3;
- (void)setHasPhoneHash:(BOOL)a3;
- (void)setIntents:(id)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setLogo:(id)a3;
- (void)setLogoFormat:(id)a3;
- (void)setNames:(id)a3;
- (void)setPhoneHash:(int64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallerIdParquetMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
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

- (BOOL)hasLogo
{
  return self->_logo != 0;
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

- (void)clearIntents
{
}

- (void)addIntent:(id)a3
{
  id v4 = a3;
  intents = self->_intents;
  id v8 = v4;
  if (!intents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_intents;
    self->_intents = v6;

    id v4 = v8;
    intents = self->_intents;
  }
  [(NSMutableArray *)intents addObject:v4];
}

- (unint64_t)intentsCount
{
  return [(NSMutableArray *)self->_intents count];
}

- (id)intentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_intents objectAtIndex:a3];
}

+ (Class)intentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLogoFormat
{
  return self->_logoFormat != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallerIdParquetMessage;
  id v4 = [(BCSCallerIdParquetMessage *)&v8 description];
  v5 = [(BCSCallerIdParquetMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_phoneHash];
    [v3 setObject:v4 forKey:@"phone_hash"];
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v3 setObject:phoneNumber forKey:@"phone_number"];
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
  logo = self->_logo;
  if (logo) {
    [v3 setObject:logo forKey:@"logo"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_isVerified];
    [v3 setObject:v14 forKey:@"is_verified"];
  }
  if ([(NSMutableArray *)self->_intents count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_intents, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v16 = self->_intents;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"intent"];
  }
  logoFormat = self->_logoFormat;
  if (logoFormat) {
    [v3 setObject:logoFormat forKey:@"logo_format"];
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
          self->_phoneHash = v20;
          goto LABEL_52;
        case 2u:
          PBReaderReadString();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 48;
          goto LABEL_43;
        case 3u:
          long long v27 = objc_alloc_init(BCSCallerIdLocalizedString);
          [(BCSCallerIdParquetMessage *)self addName:v27];
          goto LABEL_39;
        case 4u:
          PBReaderReadData();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 24;
          goto LABEL_43;
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
          long long v27 = objc_alloc_init(BCSCallerIdLocalizedString);
          [(BCSCallerIdParquetMessage *)self addIntent:v27];
LABEL_39:
          if (!PBReaderPlaceMark()
            || (BCSCallerIdLocalizedStringReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
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
        case 7u:
          PBReaderReadString();
          long long v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = 32;
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
  if (self->_phoneNumber) {
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

  if (self->_logo) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v10 = self->_intents;
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

  if (self->_logoFormat) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_phoneHash;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  uint64_t v13 = v4;
  if (self->_phoneNumber) {
    objc_msgSend(v4, "setPhoneNumber:");
  }
  if ([(BCSCallerIdParquetMessage *)self namesCount])
  {
    [v13 clearNames];
    unint64_t v5 = [(BCSCallerIdParquetMessage *)self namesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BCSCallerIdParquetMessage *)self nameAtIndex:i];
        [v13 addName:v8];
      }
    }
  }
  if (self->_logo) {
    objc_msgSend(v13, "setLogo:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13[56] = self->_isVerified;
    v13[60] |= 2u;
  }
  if ([(BCSCallerIdParquetMessage *)self intentsCount])
  {
    [v13 clearIntents];
    unint64_t v9 = [(BCSCallerIdParquetMessage *)self intentsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BCSCallerIdParquetMessage *)self intentAtIndex:j];
        [v13 addIntent:v12];
      }
    }
  }
  if (self->_logoFormat) {
    objc_msgSend(v13, "setLogoFormat:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_phoneHash;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_phoneNumber copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

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

  uint64_t v15 = [(NSData *)self->_logo copyWithZone:a3];
  long long v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isVerified;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v17 = self->_intents;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (void)v26);
        [(id)v6 addIntent:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [(NSString *)self->_logoFormat copyWithZone:a3];
  int v24 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v23;

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
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_phoneHash != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_25;
  }
  phoneNumber = self->_phoneNumber;
  if ((unint64_t)phoneNumber | *((void *)v4 + 6)
    && !-[NSString isEqual:](phoneNumber, "isEqual:"))
  {
    goto LABEL_25;
  }
  names = self->_names;
  if ((unint64_t)names | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](names, "isEqual:")) {
      goto LABEL_25;
    }
  }
  logo = self->_logo;
  if ((unint64_t)logo | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](logo, "isEqual:")) {
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
  intents = self->_intents;
  if ((unint64_t)intents | *((void *)v4 + 2) && !-[NSMutableArray isEqual:](intents, "isEqual:")) {
    goto LABEL_25;
  }
  logoFormat = self->_logoFormat;
  if ((unint64_t)logoFormat | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](logoFormat, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_phoneHash;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_phoneNumber hash];
  uint64_t v5 = [(NSMutableArray *)self->_names hash];
  uint64_t v6 = [(NSData *)self->_logo hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isVerified;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSMutableArray *)self->_intents hash];
  return v8 ^ v9 ^ [(NSString *)self->_logoFormat hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_phoneHash = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[6]) {
    -[BCSCallerIdParquetMessage setPhoneNumber:](self, "setPhoneNumber:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 5);
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
        [(BCSCallerIdParquetMessage *)self addName:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 3)) {
    -[BCSCallerIdParquetMessage setLogo:](self, "setLogo:");
  }
  if ((*((unsigned char *)v5 + 60) & 2) != 0)
  {
    self->_isVerified = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 2);
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
        -[BCSCallerIdParquetMessage addIntent:](self, "addIntent:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (*((void *)v5 + 4)) {
    -[BCSCallerIdParquetMessage setLogoFormat:](self, "setLogoFormat:");
  }
}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (NSData)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (NSMutableArray)intents
{
  return self->_intents;
}

- (void)setIntents:(id)a3
{
}

- (NSString)logoFormat
{
  return self->_logoFormat;
}

- (void)setLogoFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_logoFormat, 0);
  objc_storeStrong((id *)&self->_logo, 0);

  objc_storeStrong((id *)&self->_intents, 0);
}

@end