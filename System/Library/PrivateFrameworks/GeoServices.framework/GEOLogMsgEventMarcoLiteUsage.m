@interface GEOLogMsgEventMarcoLiteUsage
+ (BOOL)isValid:(id)a3;
+ (Class)usageStatesType;
- (BOOL)hasTotalNavTime;
- (BOOL)hasVioTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMarcoLiteUsage)initWithDictionary:(id)a3;
- (GEOLogMsgEventMarcoLiteUsage)initWithJSON:(id)a3;
- (NSMutableArray)usageStates;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)usageStatesAtIndex:(unint64_t)a3;
- (id)vioTriggerAsString:(int)a3;
- (int)StringAsVioTrigger:(id)a3;
- (int)vioTrigger;
- (unint64_t)hash;
- (unint64_t)usageStatesCount;
- (unsigned)totalNavTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addUsageStates:(id)a3;
- (void)clearUsageStates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTotalNavTime:(BOOL)a3;
- (void)setHasVioTrigger:(BOOL)a3;
- (void)setTotalNavTime:(unsigned int)a3;
- (void)setUsageStates:(id)a3;
- (void)setVioTrigger:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMarcoLiteUsage

- (unsigned)totalNavTime
{
  return self->_totalNavTime;
}

- (void)setTotalNavTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_totalNavTime = a3;
}

- (void)setHasTotalNavTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTotalNavTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)usageStates
{
  return self->_usageStates;
}

- (void)setUsageStates:(id)a3
{
}

- (void)clearUsageStates
{
}

- (void)addUsageStates:(id)a3
{
  id v4 = a3;
  usageStates = self->_usageStates;
  id v8 = v4;
  if (!usageStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_usageStates;
    self->_usageStates = v6;

    id v4 = v8;
    usageStates = self->_usageStates;
  }
  [(NSMutableArray *)usageStates addObject:v4];
}

- (unint64_t)usageStatesCount
{
  return [(NSMutableArray *)self->_usageStates count];
}

- (id)usageStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_usageStates objectAtIndex:a3];
}

+ (Class)usageStatesType
{
  return (Class)objc_opt_class();
}

- (int)vioTrigger
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_vioTrigger;
  }
  else {
    return 0;
  }
}

- (void)setVioTrigger:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_vioTrigger = a3;
}

- (void)setHasVioTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVioTrigger
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)vioTriggerAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"TREADSTONE_TRIGGERED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"MARCO_LITE_TRIGGERED";
  }
  return v4;
}

- (int)StringAsVioTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MARCO_LITE_TRIGGERED"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TREADSTONE_TRIGGERED"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMarcoLiteUsage;
  int v4 = [(GEOLogMsgEventMarcoLiteUsage *)&v8 description];
  v5 = [(GEOLogMsgEventMarcoLiteUsage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMarcoLiteUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 24))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v6 = @"totalNavTime";
      }
      else {
        v6 = @"total_nav_time";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = *(id *)(a1 + 8);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"usageStates";
      }
      else {
        v15 = @"usage_states";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v16 = *(_DWORD *)(a1 + 20);
      if (v16)
      {
        if (v16 == 1)
        {
          v17 = @"TREADSTONE_TRIGGERED";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v17 = @"MARCO_LITE_TRIGGERED";
      }
      if (a2) {
        v18 = @"vioTrigger";
      }
      else {
        v18 = @"vio_trigger";
      }
      [v4 setObject:v17 forKey:v18];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventMarcoLiteUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventMarcoLiteUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMarcoLiteUsage *)-[GEOLogMsgEventMarcoLiteUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"totalNavTime";
      }
      else {
        v6 = @"total_nav_time";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTotalNavTime:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        id v8 = @"usageStates";
      }
      else {
        id v8 = @"usage_states";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v5;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v16 = [GEOMarcoLiteUsageState alloc];
                if (a3) {
                  uint64_t v17 = [(GEOMarcoLiteUsageState *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOMarcoLiteUsageState *)v16 initWithDictionary:v15];
                }
                v18 = (void *)v17;
                [a1 addUsageStates:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v12);
        }

        id v5 = v24;
      }

      if (a3) {
        v19 = @"vioTrigger";
      }
      else {
        v19 = @"vio_trigger";
      }
      long long v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        if ([v21 isEqualToString:@"MARCO_LITE_TRIGGERED"]) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = [v21 isEqualToString:@"TREADSTONE_TRIGGERED"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v22 = [v20 intValue];
      }
      [a1 setVioTrigger:v22];
      goto LABEL_36;
    }
  }
LABEL_37:

  return a1;
}

- (GEOLogMsgEventMarcoLiteUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMarcoLiteUsage *)-[GEOLogMsgEventMarcoLiteUsage _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMarcoLiteUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMarcoLiteUsageReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_usageStates;
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

  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [(GEOLogMsgEventMarcoLiteUsage *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_totalNavTime;
    *((unsigned char *)v8 + 24) |= 1u;
  }
  if ([(GEOLogMsgEventMarcoLiteUsage *)self usageStatesCount])
  {
    [v8 clearUsageStates];
    unint64_t v4 = [(GEOLogMsgEventMarcoLiteUsage *)self usageStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventMarcoLiteUsage *)self usageStatesAtIndex:i];
        [v8 addUsageStates:v7];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v8[5] = self->_vioTrigger;
    *((unsigned char *)v8 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_totalNavTime;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_usageStates;
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
        [(id)v6 addUsageStates:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_vioTrigger;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOLogMsgEventMarcoLiteUsage *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 24);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_totalNavTime != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  usageStates = self->_usageStates;
  if ((unint64_t)usageStates | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](usageStates, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_vioTrigger != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventMarcoLiteUsage *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_totalNavTime;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_usageStates hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_vioTrigger;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 24))
  {
    self->_totalNavTime = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[GEOLogMsgEventMarcoLiteUsage addUsageStates:](self, "addUsageStates:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_vioTrigger = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end