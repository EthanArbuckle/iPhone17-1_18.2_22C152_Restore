@interface NMReply
+ (Class)argumentType;
+ (Class)compressedArgumentType;
- (BOOL)decompressArguments;
- (BOOL)hasEnqueuedTimeInterval;
- (BOOL)hasRequestReceivedTimestamp;
- (BOOL)hasResponseTime;
- (BOOL)hasSenderUUID;
- (BOOL)hasSentTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)arguments;
- (NSMutableArray)compressedArguments;
- (NSString)senderUUID;
- (double)enqueuedTimeInterval;
- (double)requestReceivedTimestamp;
- (double)responseTime;
- (double)sentTimestamp;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)argumentForTag:(int)a3;
- (id)compressedArgumentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)argumentsCount;
- (unint64_t)compressedArgumentsCount;
- (unint64_t)hash;
- (void)addArgument:(id)a3;
- (void)addArgument:(id)a3 withCompressionType:(int)a4;
- (void)addCompressedArgument:(id)a3;
- (void)clearArguments;
- (void)clearCompressedArguments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArguments:(id)a3;
- (void)setCompressedArguments:(id)a3;
- (void)setEnqueuedTimeInterval:(double)a3;
- (void)setHasEnqueuedTimeInterval:(BOOL)a3;
- (void)setHasRequestReceivedTimestamp:(BOOL)a3;
- (void)setHasResponseTime:(BOOL)a3;
- (void)setHasSentTimestamp:(BOOL)a3;
- (void)setRequestReceivedTimestamp:(double)a3;
- (void)setResponseTime:(double)a3;
- (void)setSenderUUID:(id)a3;
- (void)setSentTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMReply

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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_arguments;
    self->_arguments = v6;

    id v4 = v8;
    arguments = self->_arguments;
  }
  [(NSMutableArray *)arguments addObject:v4];
}

- (unint64_t)argumentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_arguments count];
}

- (id)argumentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_arguments objectAtIndex:a3];
}

+ (Class)argumentType
{
  return (Class)objc_opt_class();
}

- (void)clearCompressedArguments
{
}

- (void)addCompressedArgument:(id)a3
{
  id v4 = a3;
  compressedArguments = self->_compressedArguments;
  id v8 = v4;
  if (!compressedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_compressedArguments;
    self->_compressedArguments = v6;

    id v4 = v8;
    compressedArguments = self->_compressedArguments;
  }
  [(NSMutableArray *)compressedArguments addObject:v4];
}

- (unint64_t)compressedArgumentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_compressedArguments count];
}

- (id)compressedArgumentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_compressedArguments objectAtIndex:a3];
}

+ (Class)compressedArgumentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSenderUUID
{
  return self->_senderUUID != 0;
}

- (void)setResponseTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnqueuedTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enqueuedTimeInterval = a3;
}

- (void)setHasEnqueuedTimeInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnqueuedTimeInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestReceivedTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestReceivedTimestamp = a3;
}

- (void)setHasRequestReceivedTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestReceivedTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSentTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sentTimestamp = a3;
}

- (void)setHasSentTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSentTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMReply;
  char v3 = [(NMReply *)&v7 description];
  id v4 = [(NMReply *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_arguments count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_arguments, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = self->_arguments;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"argument"];
  }
  if ([(NSMutableArray *)self->_compressedArguments count])
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_compressedArguments, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v12 = self->_compressedArguments;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)j), "dictionaryRepresentation", (void)v25);
          [v11 addObject:v17];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"compressedArgument"];
  }
  senderUUID = self->_senderUUID;
  if (senderUUID) {
    [v3 setObject:senderUUID forKey:@"senderUUID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v22 = +[NSNumber numberWithDouble:self->_responseTime];
    [v3 setObject:v22 forKey:@"responseTime"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_23:
      if ((has & 2) == 0) {
        goto LABEL_24;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_23;
  }
  v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_enqueuedTimeInterval, (void)v25);
  [v3 setObject:v23 forKey:@"enqueuedTimeInterval"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_24:
    if ((has & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_31:
  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_requestReceivedTimestamp, (void)v25);
  [v3 setObject:v24 forKey:@"requestReceivedTimestamp"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_25:
    v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_sentTimestamp, (void)v25);
    [v3 setObject:v20 forKey:@"sentTimestamp"];
  }
LABEL_26:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v9 = v8 + 1;
      if (v8 == -1 || v9 > *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v10 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v9;
      v7 |= (unint64_t)(v10 & 0x7F) << v5;
      if ((v10 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0;
        int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v12 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v12 || (v7 & 7) == 4) {
      break;
    }
    unint64_t v14 = v7 >> 3;
    if ((int)(v7 >> 3) <= 1023)
    {
      if (v14 == 1)
      {
        v22 = objc_alloc_init(NMArgument);
        [(NMReply *)self addArgument:v22];
        if (!PBReaderPlaceMark() || (NMArgumentReadFrom((uint64_t)v22, (uint64_t)a3) & 1) == 0)
        {
LABEL_54:

          LOBYTE(v23) = 0;
          return v23;
        }
      }
      else
      {
        if (v14 != 2)
        {
          if (v14 == 3)
          {
            PBReaderReadString();
            v17 = (NSString *)objc_claimAutoreleasedReturnValue();
            senderUUID = self->_senderUUID;
            self->_senderUUID = v17;
          }
          else
          {
LABEL_41:
            int v23 = PBReaderSkipValueWithTag();
            if (!v23) {
              return v23;
            }
          }
          continue;
        }
        v22 = objc_alloc_init(NMCompressedArgument);
        [(NMReply *)self addCompressedArgument:v22];
        if (!PBReaderPlaceMark() || (NMCompressedArgumentReadFrom((uint64_t)v22, (uint64_t)a3) & 1) == 0) {
          goto LABEL_54;
        }
      }
      PBReaderRecallMark();
    }
    else
    {
      switch((int)v14)
      {
        case 1024:
          *(unsigned char *)&self->_has |= 4u;
          unint64_t v15 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v15 <= 0xFFFFFFFFFFFFFFF7 && v15 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v16 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v15);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v15 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v16 = 0;
          }
          uint64_t v24 = 24;
          break;
        case 1025:
          *(unsigned char *)&self->_has |= 1u;
          unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v16 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v16 = 0;
          }
          uint64_t v24 = 8;
          break;
        case 1026:
          *(unsigned char *)&self->_has |= 2u;
          unint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v16 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v20 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v16 = 0;
          }
          uint64_t v24 = 16;
          break;
        case 1027:
          *(unsigned char *)&self->_has |= 8u;
          unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            uint64_t v16 = *(void *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 8;
          }
          else
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            uint64_t v16 = 0;
          }
          uint64_t v24 = 32;
          break;
        default:
          goto LABEL_41;
      }
      *(void *)&self->PBCodable_opaque[v24] = v16;
    }
  }
  LOBYTE(v23) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v23;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v5 = self->_arguments;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v10 = self->_compressedArguments;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      int v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (self->_senderUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_19:
      if ((has & 2) == 0) {
        goto LABEL_20;
      }
LABEL_25:
      PBDataWriterWriteDoubleField();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_20:
  if ((has & 8) != 0) {
LABEL_21:
  }
    PBDataWriterWriteDoubleField();
LABEL_22:
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if ([(NMReply *)self argumentsCount])
  {
    [v13 clearArguments];
    unint64_t v4 = [(NMReply *)self argumentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(NMReply *)self argumentAtIndex:i];
        [v13 addArgument:v7];
      }
    }
  }
  if ([(NMReply *)self compressedArgumentsCount])
  {
    [v13 clearCompressedArguments];
    unint64_t v8 = [(NMReply *)self compressedArgumentsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(NMReply *)self compressedArgumentAtIndex:j];
        [v13 addCompressedArgument:v11];
      }
    }
  }
  if (self->_senderUUID) {
    objc_msgSend(v13, "setSenderUUID:");
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v13 + 3) = *(void *)&self->_responseTime;
    *((unsigned char *)v13 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v13 + 1) = *(void *)&self->_enqueuedTimeInterval;
  *((unsigned char *)v13 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  *((void *)v13 + 2) = *(void *)&self->_requestReceivedTimestamp;
  *((unsigned char *)v13 + 64) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    *((void *)v13 + 4) = *(void *)&self->_sentTimestamp;
    *((unsigned char *)v13 + 64) |= 8u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned int v6 = self->_arguments;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [v5 addArgument:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v12 = self->_compressedArguments;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v22);
        [v5 addCompressedArgument:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  id v18 = [(NSString *)self->_senderUUID copyWithZone:a3];
  long long v19 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v18;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v5 + 3) = *(void *)&self->_responseTime;
    *((unsigned char *)v5 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_17:
      if ((has & 2) == 0) {
        goto LABEL_18;
      }
LABEL_23:
      *((void *)v5 + 2) = *(void *)&self->_requestReceivedTimestamp;
      *((unsigned char *)v5 + 64) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v5;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_17;
  }
  *((void *)v5 + 1) = *(void *)&self->_enqueuedTimeInterval;
  *((unsigned char *)v5 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_23;
  }
LABEL_18:
  if ((has & 8) != 0)
  {
LABEL_19:
    *((void *)v5 + 4) = *(void *)&self->_sentTimestamp;
    *((unsigned char *)v5 + 64) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  arguments = self->_arguments;
  if ((unint64_t)arguments | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](arguments, "isEqual:")) {
      goto LABEL_27;
    }
  }
  compressedArguments = self->_compressedArguments;
  if ((unint64_t)compressedArguments | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](compressedArguments, "isEqual:")) {
      goto LABEL_27;
    }
  }
  senderUUID = self->_senderUUID;
  if ((unint64_t)senderUUID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](senderUUID, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_responseTime != *((double *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_enqueuedTimeInterval != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_requestReceivedTimestamp != *((double *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_27;
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_sentTimestamp != *((double *)v4 + 4)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_arguments hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_compressedArguments hash];
  NSUInteger v5 = [(NSString *)self->_senderUUID hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double responseTime = self->_responseTime;
    double v9 = -responseTime;
    if (responseTime >= 0.0) {
      double v9 = self->_responseTime;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (has)
  {
    double enqueuedTimeInterval = self->_enqueuedTimeInterval;
    double v14 = -enqueuedTimeInterval;
    if (enqueuedTimeInterval >= 0.0) {
      double v14 = self->_enqueuedTimeInterval;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((has & 2) != 0)
  {
    double requestReceivedTimestamp = self->_requestReceivedTimestamp;
    double v19 = -requestReceivedTimestamp;
    if (requestReceivedTimestamp >= 0.0) {
      double v19 = self->_requestReceivedTimestamp;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((has & 8) != 0)
  {
    double sentTimestamp = self->_sentTimestamp;
    double v24 = -sentTimestamp;
    if (sentTimestamp >= 0.0) {
      double v24 = self->_sentTimestamp;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v17 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NMReply *)self addArgument:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 6);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NMReply addCompressedArgument:](self, "addCompressedArgument:", *(void *)(*((void *)&v16 + 1) + 8 * (void)j), (void)v16);
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 7)) {
    -[NMReply setSenderUUID:](self, "setSenderUUID:");
  }
  char v15 = *((unsigned char *)v4 + 64);
  if ((v15 & 4) != 0)
  {
    self->_double responseTime = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v15 = *((unsigned char *)v4 + 64);
    if ((v15 & 1) == 0)
    {
LABEL_19:
      if ((v15 & 2) == 0) {
        goto LABEL_20;
      }
LABEL_25:
      self->_double requestReceivedTimestamp = *((double *)v4 + 2);
      *(unsigned char *)&self->_has |= 2u;
      if ((*((unsigned char *)v4 + 64) & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 1) == 0)
  {
    goto LABEL_19;
  }
  self->_double enqueuedTimeInterval = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v15 = *((unsigned char *)v4 + 64);
  if ((v15 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_20:
  if ((v15 & 8) != 0)
  {
LABEL_21:
    self->_double sentTimestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_22:
}

- (NSMutableArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSMutableArray)compressedArguments
{
  return self->_compressedArguments;
}

- (void)setCompressedArguments:(id)a3
{
}

- (NSString)senderUUID
{
  return self->_senderUUID;
}

- (void)setSenderUUID:(id)a3
{
}

- (double)responseTime
{
  return self->_responseTime;
}

- (double)enqueuedTimeInterval
{
  return self->_enqueuedTimeInterval;
}

- (double)requestReceivedTimestamp
{
  return self->_requestReceivedTimestamp;
}

- (double)sentTimestamp
{
  return self->_sentTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderUUID, 0);
  objc_storeStrong((id *)&self->_compressedArguments, 0);

  objc_storeStrong((id *)&self->_arguments, 0);
}

- (id)argumentForTag:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NMReply *)self arguments];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 tag] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)addArgument:(id)a3 withCompressionType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    uint64_t v7 = objc_msgSend(v6, "_nm_compressedArgument:", v4);
    if (v7) {
      [(NMReply *)self addCompressedArgument:v7];
    }
    else {
      [(NMReply *)self addArgument:v8];
    }

    id v6 = v8;
  }
}

- (BOOL)decompressArguments
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = [(NMReply *)self compressedArguments];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v7), "_nm_uncompressedArgument");
        if (!v8)
        {

          return 0;
        }
        double v9 = (void *)v8;
        [(NMReply *)self addArgument:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [(NMReply *)self clearCompressedArguments];
  return 1;
}

@end