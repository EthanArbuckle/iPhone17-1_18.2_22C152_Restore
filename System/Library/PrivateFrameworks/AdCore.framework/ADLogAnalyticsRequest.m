@interface ADLogAnalyticsRequest
+ (Class)eventsType;
+ (id)options;
- (BOOL)hasBundleID;
- (BOOL)hasContentiAdID;
- (BOOL)hasDPID;
- (BOOL)hasIAdID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contentiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSMutableArray)events;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (void)addEvents:(id)a3;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContentiAdID:(id)a3;
- (void)setDPID:(id)a3;
- (void)setEvents:(id)a3;
- (void)setIAdID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADLogAnalyticsRequest

+ (id)options
{
  if (options_once_0 != -1) {
    dispatch_once(&options_once_0, &__block_literal_global_1);
  }
  v2 = (void *)options_sOptions_0;
  return v2;
}

void __32__ADLogAnalyticsRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_0;
  options_sOptions_0 = (uint64_t)&unk_1F2715438;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADLogAnalyticsRequest;
  id v4 = [(ADLogAnalyticsRequest *)&v8 description];
  v5 = [(ADLogAnalyticsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v4 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v4 setObject:dPID forKey:@"DPID"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_events;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"events"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADLogAnalyticsRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_dPID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_events;
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
  id v8 = a3;
  if (self->_iAdID) {
    objc_msgSend(v8, "setIAdID:");
  }
  if (self->_bundleID) {
    objc_msgSend(v8, "setBundleID:");
  }
  if (self->_contentiAdID) {
    objc_msgSend(v8, "setContentiAdID:");
  }
  if (self->_dPID) {
    objc_msgSend(v8, "setDPID:");
  }
  if ([(ADLogAnalyticsRequest *)self eventsCount])
  {
    [v8 clearEvents];
    unint64_t v4 = [(ADLogAnalyticsRequest *)self eventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ADLogAnalyticsRequest *)self eventsAtIndex:i];
        [v8 addEvents:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSData *)self->_dPID copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_events;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addEvents:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((iAdID = self->_iAdID, !((unint64_t)iAdID | v4[5])) || -[NSData isEqual:](iAdID, "isEqual:"))&& ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[1]))|| -[NSString isEqual:](bundleID, "isEqual:"))&& ((contentiAdID = self->_contentiAdID, !((unint64_t)contentiAdID | v4[2]))|| -[NSData isEqual:](contentiAdID, "isEqual:"))&& ((dPID = self->_dPID, !((unint64_t)dPID | v4[3])) || -[NSData isEqual:](dPID, "isEqual:")))
  {
    events = self->_events;
    if ((unint64_t)events | v4[4]) {
      char v10 = -[NSMutableArray isEqual:](events, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_iAdID hash];
  NSUInteger v4 = [(NSString *)self->_bundleID hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_contentiAdID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_dPID hash];
  return v6 ^ [(NSMutableArray *)self->_events hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[ADLogAnalyticsRequest setIAdID:](self, "setIAdID:");
  }
  if (*((void *)v4 + 1)) {
    -[ADLogAnalyticsRequest setBundleID:](self, "setBundleID:");
  }
  if (*((void *)v4 + 2)) {
    -[ADLogAnalyticsRequest setContentiAdID:](self, "setContentiAdID:");
  }
  if (*((void *)v4 + 3)) {
    -[ADLogAnalyticsRequest setDPID:](self, "setDPID:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ADLogAnalyticsRequest addEvents:](self, "addEvents:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end