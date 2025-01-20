@interface _INPBIdentifyIncomingCallerIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)callRecordsType;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)callRecords;
- (_INPBIdentifyIncomingCallerIntentResponse)initWithCoder:(id)a3;
- (id)callRecordsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)callRecordsCount;
- (unint64_t)hash;
- (void)addCallRecords:(id)a3;
- (void)clearCallRecords;
- (void)encodeWithCoder:(id)a3;
- (void)setCallRecords:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIdentifyIncomingCallerIntentResponse

- (void).cxx_destruct
{
}

- (int)statusCode
{
  return self->_statusCode;
}

- (NSArray)callRecords
{
  return self->_callRecords;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_callRecords count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_callRecords;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"callRecords"];
  }
  if ([(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode])
  {
    uint64_t v11 = [(_INPBIdentifyIncomingCallerIntentResponse *)self statusCode];
    if (v11 == 1)
    {
      v12 = @"NO_INCOMING_CALL";
    }
    else if (v11 == 2)
    {
      v12 = @"INCOMING_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v12 forKeyedSubscript:@"statusCode"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_callRecords hash];
  if ([(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode]) {
    uint64_t v4 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBIdentifyIncomingCallerIntentResponse *)self callRecords];
  uint64_t v6 = [v4 callRecords];
  uint64_t v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBIdentifyIncomingCallerIntentResponse *)self callRecords];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBIdentifyIncomingCallerIntentResponse *)self callRecords];
      uint64_t v11 = [v4 callRecords];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode];
    if (v13 == [v4 hasStatusCode])
    {
      if (![(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode]
        || ![v4 hasStatusCode]
        || (int statusCode = self->_statusCode, statusCode == [v4 statusCode]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBIdentifyIncomingCallerIntentResponse allocWithZone:](_INPBIdentifyIncomingCallerIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_callRecords copyWithZone:a3];
  [(_INPBIdentifyIncomingCallerIntentResponse *)v5 setCallRecords:v6];

  if ([(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode]) {
    [(_INPBIdentifyIncomingCallerIntentResponse *)v5 setStatusCode:[(_INPBIdentifyIncomingCallerIntentResponse *)self statusCode]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIdentifyIncomingCallerIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIdentifyIncomingCallerIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIdentifyIncomingCallerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIdentifyIncomingCallerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIdentifyIncomingCallerIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_callRecords;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ([(_INPBIdentifyIncomingCallerIntentResponse *)self hasStatusCode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIdentifyIncomingCallerIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"NO_INCOMING_CALL"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"INCOMING_CALL"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"NO_INCOMING_CALL";
  }
  else if (a3 == 2)
  {
    int v4 = @"INCOMING_CALL";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatusCode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int statusCode = a3;
  }
}

- (id)callRecordsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_callRecords objectAtIndexedSubscript:a3];
}

- (unint64_t)callRecordsCount
{
  return [(NSArray *)self->_callRecords count];
}

- (void)addCallRecords:(id)a3
{
  id v4 = a3;
  callRecords = self->_callRecords;
  id v8 = v4;
  if (!callRecords)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_callRecords;
    self->_callRecords = v6;

    id v4 = v8;
    callRecords = self->_callRecords;
  }
  [(NSArray *)callRecords addObject:v4];
}

- (void)clearCallRecords
{
}

- (void)setCallRecords:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  callRecords = self->_callRecords;
  self->_callRecords = v4;

  MEMORY[0x1F41817F8](v4, callRecords);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)callRecordsType
{
  return (Class)objc_opt_class();
}

@end