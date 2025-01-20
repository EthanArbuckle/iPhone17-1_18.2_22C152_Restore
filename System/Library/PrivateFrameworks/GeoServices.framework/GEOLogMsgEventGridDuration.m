@interface GEOLogMsgEventGridDuration
+ (BOOL)isValid:(id)a3;
+ (Class)endStateErrorReasonType;
- (BOOL)hasDisplayType;
- (BOOL)hasDurationMs;
- (BOOL)hasEndState;
- (BOOL)hasPreviousState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventGridDuration)initWithDictionary:(id)a3;
- (GEOLogMsgEventGridDuration)initWithJSON:(id)a3;
- (NSMutableArray)endStateErrorReasons;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayTypeAsString:(int)a3;
- (id)endStateAsString:(int)a3;
- (id)endStateErrorReasonAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)previousStateAsString:(int)a3;
- (int)StringAsDisplayType:(id)a3;
- (int)StringAsEndState:(id)a3;
- (int)StringAsPreviousState:(id)a3;
- (int)displayType;
- (int)endState;
- (int)previousState;
- (unint64_t)endStateErrorReasonsCount;
- (unint64_t)hash;
- (unsigned)durationMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addEndStateErrorReason:(id)a3;
- (void)clearEndStateErrorReasons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayType:(int)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setEndState:(int)a3;
- (void)setEndStateErrorReasons:(id)a3;
- (void)setHasDisplayType:(BOOL)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasEndState:(BOOL)a3;
- (void)setHasPreviousState:(BOOL)a3;
- (void)setPreviousState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventGridDuration

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)endState
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_endState;
  }
  else {
    return 0;
  }
}

- (void)setEndState:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEndState
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F78E8[a3];
  }

  return v3;
}

- (int)StringAsEndState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GRID_END_STATE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GRID_END_STATE_COMPLETE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GRID_END_STATE_ERROR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GRID_END_STATE_CANCELED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)endStateErrorReasons
{
  return self->_endStateErrorReasons;
}

- (void)setEndStateErrorReasons:(id)a3
{
}

- (void)clearEndStateErrorReasons
{
}

- (void)addEndStateErrorReason:(id)a3
{
  id v4 = a3;
  endStateErrorReasons = self->_endStateErrorReasons;
  id v8 = v4;
  if (!endStateErrorReasons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_endStateErrorReasons;
    self->_endStateErrorReasons = v6;

    id v4 = v8;
    endStateErrorReasons = self->_endStateErrorReasons;
  }
  [(NSMutableArray *)endStateErrorReasons addObject:v4];
}

- (unint64_t)endStateErrorReasonsCount
{
  return [(NSMutableArray *)self->_endStateErrorReasons count];
}

- (id)endStateErrorReasonAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_endStateErrorReasons objectAtIndex:a3];
}

+ (Class)endStateErrorReasonType
{
  return (Class)objc_opt_class();
}

- (int)previousState
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_previousState;
  }
  else {
    return 1;
  }
}

- (void)setPreviousState:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_previousState = a3;
}

- (void)setHasPreviousState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPreviousState
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)previousStateAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7908[a3 - 1];
  }

  return v3;
}

- (int)StringAsPreviousState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PREVIOUS_STATE_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PREVIOUS_STATE_GRID"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PREVIOUS_STATE_MAP"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)displayType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_displayType;
  }
  else {
    return 1;
  }
}

- (void)setDisplayType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_displayType = a3;
}

- (void)setHasDisplayType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDisplayType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)displayTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"DISPLAY_TYPE_MAP";
  }
  else if (a3 == 2)
  {
    int v4 = @"DISPLAY_TYPE_NAVIGATION";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDisplayType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"DISPLAY_TYPE_MAP"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"DISPLAY_TYPE_NAVIGATION"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventGridDuration;
  int v4 = [(GEOLogMsgEventGridDuration *)&v8 description];
  v5 = [(GEOLogMsgEventGridDuration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventGridDuration _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v7 = @"durationMs";
      }
      else {
        v7 = @"duration_ms";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if ((v5 & 4) != 0)
    {
      uint64_t v8 = *(int *)(a1 + 24);
      if (v8 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E53F78E8[v8];
      }
      if (a2) {
        v10 = @"endState";
      }
      else {
        v10 = @"end_state";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = *(id *)(a1 + 8);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"endStateErrorReason";
      }
      else {
        v19 = @"end_state_error_reason";
      }
      [v4 setObject:v11 forKey:v19];
    }
    char v20 = *(unsigned char *)(a1 + 32);
    if ((v20 & 8) != 0)
    {
      unsigned int v21 = *(_DWORD *)(a1 + 28) - 1;
      if (v21 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_1E53F7908[v21];
      }
      if (a2) {
        v23 = @"previousState";
      }
      else {
        v23 = @"previous_state";
      }
      [v4 setObject:v22 forKey:v23];

      char v20 = *(unsigned char *)(a1 + 32);
    }
    if (v20)
    {
      int v24 = *(_DWORD *)(a1 + 16);
      if (v24 == 1)
      {
        v25 = @"DISPLAY_TYPE_MAP";
      }
      else if (v24 == 2)
      {
        v25 = @"DISPLAY_TYPE_NAVIGATION";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v26 = @"displayType";
      }
      else {
        v26 = @"display_type";
      }
      [v4 setObject:v25 forKey:v26];
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
  return -[GEOLogMsgEventGridDuration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventGridDuration)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventGridDuration *)-[GEOLogMsgEventGridDuration _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"durationMs";
      }
      else {
        v6 = @"duration_ms";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDurationMs:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v8 = @"endState";
      }
      else {
        uint64_t v8 = @"end_state";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isEqualToString:@"GRID_END_STATE_UNKNOWN"])
        {
          uint64_t v11 = 0;
        }
        else if ([v10 isEqualToString:@"GRID_END_STATE_COMPLETE"])
        {
          uint64_t v11 = 1;
        }
        else if ([v10 isEqualToString:@"GRID_END_STATE_ERROR"])
        {
          uint64_t v11 = 2;
        }
        else if ([v10 isEqualToString:@"GRID_END_STATE_CANCELED"])
        {
          uint64_t v11 = 3;
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        uint64_t v11 = [v9 intValue];
      }
      [a1 setEndState:v11];
LABEL_25:

      if (a3) {
        id v12 = @"endStateErrorReason";
      }
      else {
        id v12 = @"end_state_error_reason";
      }
      uint64_t v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = v5;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v20 = [GEOLogMsgEventGridDurationEndStateErrorInfo alloc];
                if (a3) {
                  uint64_t v21 = [(GEOLogMsgEventGridDurationEndStateErrorInfo *)v20 initWithJSON:v19];
                }
                else {
                  uint64_t v21 = [(GEOLogMsgEventGridDurationEndStateErrorInfo *)v20 initWithDictionary:v19];
                }
                v22 = (void *)v21;
                [a1 addEndStateErrorReason:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v16);
        }

        id v5 = v32;
      }

      if (a3) {
        v23 = @"previousState";
      }
      else {
        v23 = @"previous_state";
      }
      int v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
        if ([v25 isEqualToString:@"PREVIOUS_STATE_NONE"])
        {
          uint64_t v26 = 1;
        }
        else if ([v25 isEqualToString:@"PREVIOUS_STATE_GRID"])
        {
          uint64_t v26 = 2;
        }
        else if ([v25 isEqualToString:@"PREVIOUS_STATE_MAP"])
        {
          uint64_t v26 = 3;
        }
        else
        {
          uint64_t v26 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_57;
        }
        uint64_t v26 = [v24 intValue];
      }
      [a1 setPreviousState:v26];
LABEL_57:

      if (a3) {
        v27 = @"displayType";
      }
      else {
        v27 = @"display_type";
      }
      long long v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v28;
        uint64_t v30 = 1;
        if (([v29 isEqualToString:@"DISPLAY_TYPE_MAP"] & 1) == 0)
        {
          if ([v29 isEqualToString:@"DISPLAY_TYPE_NAVIGATION"]) {
            uint64_t v30 = 2;
          }
          else {
            uint64_t v30 = 1;
          }
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:

          goto LABEL_70;
        }
        uint64_t v30 = [v28 intValue];
      }
      [a1 setDisplayType:v30];
      goto LABEL_69;
    }
  }
LABEL_70:

  return a1;
}

- (GEOLogMsgEventGridDuration)initWithJSON:(id)a3
{
  return (GEOLogMsgEventGridDuration *)-[GEOLogMsgEventGridDuration _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventGridDurationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventGridDurationReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_endStateErrorReasons;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_flags;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v11 = (char)self->_flags;
  }
  if (v11) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  [(GEOLogMsgEventGridDuration *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v10[5] = self->_durationMs;
    *((unsigned char *)v10 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v10[6] = self->_endState;
    *((unsigned char *)v10 + 32) |= 4u;
  }
  if ([(GEOLogMsgEventGridDuration *)self endStateErrorReasonsCount])
  {
    [v10 clearEndStateErrorReasons];
    unint64_t v5 = [(GEOLogMsgEventGridDuration *)self endStateErrorReasonsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLogMsgEventGridDuration *)self endStateErrorReasonAtIndex:i];
        [v10 addEndStateErrorReason:v8];
      }
    }
  }
  char v9 = (char)self->_flags;
  if ((v9 & 8) != 0)
  {
    v10[7] = self->_previousState;
    *((unsigned char *)v10 + 32) |= 8u;
    char v9 = (char)self->_flags;
  }
  if (v9)
  {
    v10[4] = self->_displayType;
    *((unsigned char *)v10 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_durationMs;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_endState;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_endStateErrorReasons;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v6 addEndStateErrorReason:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_previousState;
    *(unsigned char *)(v6 + 32) |= 8u;
    char v14 = (char)self->_flags;
  }
  if (v14)
  {
    *(_DWORD *)(v6 + 16) = self->_displayType;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOLogMsgEventGridDuration *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_endState != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  endStateErrorReasons = self->_endStateErrorReasons;
  if ((unint64_t)endStateErrorReasons | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](endStateErrorReasons, "isEqual:"))
    {
LABEL_24:
      BOOL v8 = 0;
      goto LABEL_25;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_previousState != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_24;
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_displayType != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
    BOOL v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventGridDuration *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_durationMs;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_endState;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_endStateErrorReasons hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_previousState;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_displayType;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_durationMs = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 4) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLogMsgEventGridDuration addEndStateErrorReason:](self, "addEndStateErrorReason:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v4 + 32);
  if ((v11 & 8) != 0)
  {
    self->_previousState = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 8u;
    char v11 = *((unsigned char *)v4 + 32);
  }
  if (v11)
  {
    self->_displayType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end