@interface PDDPReportResponse
+ (Class)reportsType;
- (BOOL)hasNextBatchPointer;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)nextBatchPointer;
- (NSMutableArray)reports;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reportsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)reportsCount;
- (void)addReports:(id)a3;
- (void)clearReports;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNextBatchPointer:(id)a3;
- (void)setReports:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPReportResponse

- (void)clearReports
{
}

- (void)addReports:(id)a3
{
  id v4 = a3;
  reports = self->_reports;
  id v8 = v4;
  if (!reports)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_reports;
    self->_reports = v6;

    id v4 = v8;
    reports = self->_reports;
  }
  [(NSMutableArray *)reports addObject:v4];
}

- (unint64_t)reportsCount
{
  return (unint64_t)[(NSMutableArray *)self->_reports count];
}

- (id)reportsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_reports objectAtIndex:a3];
}

+ (Class)reportsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNextBatchPointer
{
  return self->_nextBatchPointer != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPReportResponse;
  v3 = [(PDDPReportResponse *)&v7 description];
  id v4 = [(PDDPReportResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_reports count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_reports, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = self->_reports;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"reports"];
  }
  nextBatchPointer = self->_nextBatchPointer;
  if (nextBatchPointer) {
    [v3 setObject:nextBatchPointer forKey:@"next_batch_pointer"];
  }
  status = self->_status;
  if (status)
  {
    v13 = [(PDDPStatus *)status dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"status"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        PBReaderReadData();
        long long v15 = (NSData *)objc_claimAutoreleasedReturnValue();
        nextBatchPointer = (PDDPHandoutReportItem *)self->_nextBatchPointer;
        self->_nextBatchPointer = v15;
        goto LABEL_27;
      }
      if (v13 == 1)
      {
        nextBatchPointer = objc_alloc_init(PDDPHandoutReportItem);
        [(PDDPReportResponse *)self addReports:nextBatchPointer];
        if (!PBReaderPlaceMark() || (sub_10015DE70((uint64_t)nextBatchPointer, (uint64_t)a3) & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    nextBatchPointer = objc_alloc_init(PDDPStatus);
    objc_storeStrong((id *)&self->_status, nextBatchPointer);
    if (!PBReaderPlaceMark() || (sub_1000D3710((uint64_t)nextBatchPointer, (uint64_t)a3) & 1) == 0)
    {
LABEL_31:

      return 0;
    }
LABEL_25:
    PBReaderRecallMark();
LABEL_27:

    goto LABEL_29;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = self->_reports;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_nextBatchPointer) {
    PBDataWriterWriteDataField();
  }
  if (self->_status) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(PDDPReportResponse *)self reportsCount])
  {
    [v9 clearReports];
    unint64_t v4 = [(PDDPReportResponse *)self reportsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PDDPReportResponse *)self reportsAtIndex:i];
        [v9 addReports:v7];
      }
    }
  }
  if (self->_nextBatchPointer) {
    objc_msgSend(v9, "setNextBatchPointer:");
  }
  uint64_t v8 = v9;
  if (self->_status)
  {
    objc_msgSend(v9, "setStatus:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned int v6 = self->_reports;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v17);
        [v5 addReports:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [(NSData *)self->_nextBatchPointer copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(PDDPStatus *)self->_status copyWithZone:a3];
  long long v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((reports = self->_reports, !((unint64_t)reports | v4[2]))
     || -[NSMutableArray isEqual:](reports, "isEqual:"))
    && ((nextBatchPointer = self->_nextBatchPointer, !((unint64_t)nextBatchPointer | v4[1]))
     || -[NSData isEqual:](nextBatchPointer, "isEqual:")))
  {
    status = self->_status;
    if ((unint64_t)status | v4[3]) {
      unsigned __int8 v8 = -[PDDPStatus isEqual:](status, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_reports hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_nextBatchPointer hash] ^ v3;
  return v4 ^ [(PDDPStatus *)self->_status hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[2];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PDDPReportResponse addReports:](self, "addReports:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[PDDPReportResponse setNextBatchPointer:](self, "setNextBatchPointer:");
  }
  status = self->_status;
  id v11 = v4[3];
  if (status)
  {
    if (v11) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PDDPReportResponse setStatus:](self, "setStatus:");
  }
}

- (NSMutableArray)reports
{
  return self->_reports;
}

- (void)setReports:(id)a3
{
}

- (NSData)nextBatchPointer
{
  return self->_nextBatchPointer;
}

- (void)setNextBatchPointer:(id)a3
{
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_reports, 0);

  objc_storeStrong((id *)&self->_nextBatchPointer, 0);
}

@end