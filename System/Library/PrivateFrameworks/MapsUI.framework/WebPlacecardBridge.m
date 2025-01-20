@interface WebPlacecardBridge
+ (Class)argumentType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)arguments;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nameAsString:(int)a3;
- (int)StringAsName:(id)a3;
- (int)name;
- (unint64_t)argumentsCount;
- (unint64_t)hash;
- (void)addArgument:(id)a3;
- (void)clearArguments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArguments:(id)a3;
- (void)setHasName:(BOOL)a3;
- (void)setName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WebPlacecardBridge

- (int)name
{
  if (*(unsigned char *)&self->_has) {
    return self->_name;
  }
  else {
    return 0;
  }
}

- (void)setName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)nameAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5750B90[a3];
  }
  return v3;
}

- (int)StringAsName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONTEXT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER_INTERACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INIT_UI_MENU_BUTTON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GET_ICON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GET_AMP_ARTWORK"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GET_ATTRIBUTION_DATA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PAGE_RESIZED"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearArguments
{
}

- (void)addArgument:(id)a3
{
  id v4 = a3;
  arguments = self->_arguments;
  id v8 = v4;
  if (!arguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_arguments;
    self->_arguments = v6;

    id v4 = v8;
    arguments = self->_arguments;
  }
  [(NSMutableArray *)arguments addObject:v4];
}

- (unint64_t)argumentsCount
{
  return [(NSMutableArray *)self->_arguments count];
}

- (id)argumentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_arguments objectAtIndex:a3];
}

+ (Class)argumentType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WebPlacecardBridge;
  id v4 = [(WebPlacecardBridge *)&v8 description];
  v5 = [(WebPlacecardBridge *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t name = self->_name;
    if (name >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_name);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5750B90[name];
    }
    [v3 setObject:v5 forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_arguments count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_arguments, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_arguments;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"argument"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
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
      if ((v11 >> 3) == 1)
      {
        v24 = objc_alloc_init(MUBridgeMethodArgument);
        [(WebPlacecardBridge *)self addArgument:v24];
        if (!PBReaderPlaceMark() || (MUBridgeMethodArgumentReadFrom((uint64_t)v24, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v25) = 0;
          return v25;
        }
        PBReaderRecallMark();
      }
      else if ((v11 >> 3))
      {
        int v25 = PBReaderSkipValueWithTag();
        if (!v25) {
          return v25;
        }
      }
      else
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
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
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_33:
        if (*((unsigned char *)a3 + *v6)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        self->_uint64_t name = v20;
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v25) = *((unsigned char *)a3 + *v6) == 0;
  return v25;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_arguments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_name;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(WebPlacecardBridge *)self argumentsCount])
  {
    [v9 clearArguments];
    unint64_t v5 = [(WebPlacecardBridge *)self argumentsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(WebPlacecardBridge *)self argumentAtIndex:i];
        [v9 addArgument:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_name;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_arguments;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addArgument:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_name != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  arguments = self->_arguments;
  if ((unint64_t)arguments | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](arguments, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_name;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_arguments hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_uint64_t name = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[WebPlacecardBridge addArgument:](self, "addArgument:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSMutableArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end