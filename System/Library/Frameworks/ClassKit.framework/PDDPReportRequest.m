@interface PDDPReportRequest
+ (Class)requestItemsType;
- (BOOL)hasBatchPointer;
- (BOOL)hasMaxPayloadSize;
- (BOOL)hasMaxReportItemsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSData)batchPointer;
- (NSMutableArray)requestItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestItemsAtIndex:(unint64_t)a3;
- (int)maxPayloadSize;
- (int)maxReportItemsCount;
- (unint64_t)hash;
- (unint64_t)requestItemsCount;
- (unsigned)requestTypeCode;
- (void)addRequestItems:(id)a3;
- (void)clearRequestItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBatchPointer:(id)a3;
- (void)setHasMaxPayloadSize:(BOOL)a3;
- (void)setHasMaxReportItemsCount:(BOOL)a3;
- (void)setMaxPayloadSize:(int)a3;
- (void)setMaxReportItemsCount:(int)a3;
- (void)setRequestItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPReportRequest

- (void)clearRequestItems
{
}

- (void)addRequestItems:(id)a3
{
  id v4 = a3;
  requestItems = self->_requestItems;
  id v8 = v4;
  if (!requestItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requestItems;
    self->_requestItems = v6;

    id v4 = v8;
    requestItems = self->_requestItems;
  }
  [(NSMutableArray *)requestItems addObject:v4];
}

- (unint64_t)requestItemsCount
{
  return (unint64_t)[(NSMutableArray *)self->_requestItems count];
}

- (id)requestItemsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_requestItems objectAtIndex:a3];
}

+ (Class)requestItemsType
{
  return (Class)objc_opt_class();
}

- (void)setMaxReportItemsCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxReportItemsCount = a3;
}

- (void)setHasMaxReportItemsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxReportItemsCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxPayloadSize:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxPayloadSize = a3;
}

- (void)setHasMaxPayloadSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxPayloadSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBatchPointer
{
  return self->_batchPointer != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPReportRequest;
  char v3 = [(PDDPReportRequest *)&v7 description];
  id v4 = [(PDDPReportRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_requestItems count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_requestItems, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_requestItems;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"request_items"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithInt:self->_maxReportItemsCount];
    [v3 setObject:v12 forKey:@"max_report_items_count"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = +[NSNumber numberWithInt:self->_maxPayloadSize];
    [v3 setObject:v13 forKey:@"max_payload_size"];
  }
  batchPointer = self->_batchPointer;
  if (batchPointer) {
    [v3 setObject:batchPointer forKey:@"batch_pointer"];
  }

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
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        v13 = objc_alloc_init(PDDPReportRequestItem);
        [(PDDPReportRequest *)self addRequestItems:v13];
        if PBReaderPlaceMark() && (sub_1000D7568((uint64_t)v13, (uint64_t)a3))
        {
          PBReaderRecallMark();

          continue;
        }

        LOBYTE(v14) = 0;
        return v14;
      case 2u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
          v17 |= (unint64_t)(v19 & 0x7F) << v15;
          if ((v19 & 0x80) == 0) {
            goto LABEL_39;
          }
          v15 += 7;
          BOOL v10 = v16++ >= 9;
          if (v10)
          {
            LODWORD(v17) = 0;
            goto LABEL_41;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_41:
        uint64_t v26 = 20;
        goto LABEL_46;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      case 4u:
        PBReaderReadData();
        v24 = (NSData *)objc_claimAutoreleasedReturnValue();
        batchPointer = self->_batchPointer;
        self->_batchPointer = v24;

        continue;
      default:
        int v14 = PBReaderSkipValueWithTag();
        if (!v14) {
          return v14;
        }
        continue;
    }
    while (1)
    {
      unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v17 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0) {
        goto LABEL_43;
      }
      v20 += 7;
      BOOL v10 = v21++ >= 9;
      if (v10)
      {
        LODWORD(v17) = 0;
        goto LABEL_45;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v17) = 0;
    }
LABEL_45:
    uint64_t v26 = 16;
LABEL_46:
    *(_DWORD *)&self->PBRequest_opaque[v26] = v17;
  }
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = self->_requestItems;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_batchPointer) {
    PBDataWriterWriteDataField();
  }
}

- (unsigned)requestTypeCode
{
  return 7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if ([(PDDPReportRequest *)self requestItemsCount])
  {
    [v10 clearRequestItems];
    unint64_t v4 = [(PDDPReportRequest *)self requestItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PDDPReportRequest *)self requestItemsAtIndex:i];
        [v10 addRequestItems:v7];
      }
    }
  }
  char has = (char)self->_has;
  char v9 = v10;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 5) = self->_maxReportItemsCount;
    *((unsigned char *)v10 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v10 + 4) = self->_maxPayloadSize;
    *((unsigned char *)v10 + 32) |= 1u;
  }
  if (self->_batchPointer)
  {
    objc_msgSend(v10, "setBatchPointer:");
    char v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v6 = self->_requestItems;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addRequestItems:v11];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_maxReportItemsCount;
    *((unsigned char *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_maxPayloadSize;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v13 = -[NSData copyWithZone:](self->_batchPointer, "copyWithZone:", a3, (void)v16);
  long long v14 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  requestItems = self->_requestItems;
  if ((unint64_t)requestItems | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](requestItems, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_maxReportItemsCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_maxPayloadSize != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  batchPointer = self->_batchPointer;
  if ((unint64_t)batchPointer | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[NSData isEqual:](batchPointer, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_requestItems hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_maxReportItemsCount;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSData *)self->_batchPointer hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maxPayloadSize;
  return v4 ^ v3 ^ v5 ^ (unint64_t)[(NSData *)self->_batchPointer hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PDDPReportRequest addRequestItems:](self, "addRequestItems:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 32);
  if ((v10 & 2) != 0)
  {
    self->_maxReportItemsCount = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v4 + 32);
  }
  if (v10)
  {
    self->_maxPayloadSize = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[PDDPReportRequest setBatchPointer:](self, "setBatchPointer:");
  }
}

- (NSMutableArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (int)maxReportItemsCount
{
  return self->_maxReportItemsCount;
}

- (int)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (NSData)batchPointer
{
  return self->_batchPointer;
}

- (void)setBatchPointer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestItems, 0);

  objc_storeStrong((id *)&self->_batchPointer, 0);
}

@end