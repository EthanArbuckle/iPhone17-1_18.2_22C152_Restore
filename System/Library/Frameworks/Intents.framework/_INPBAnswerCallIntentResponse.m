@interface _INPBAnswerCallIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)callRecordsType;
- (BOOL)hasAnsweredCall;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)callRecords;
- (_INPBAnswerCallIntentResponse)initWithCoder:(id)a3;
- (_INPBConnectedCall)answeredCall;
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
- (void)setAnsweredCall:(id)a3;
- (void)setCallRecords:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAnswerCallIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callRecords, 0);

  objc_storeStrong((id *)&self->_answeredCall, 0);
}

- (int)statusCode
{
  return self->_statusCode;
}

- (NSArray)callRecords
{
  return self->_callRecords;
}

- (_INPBConnectedCall)answeredCall
{
  return self->_answeredCall;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAnswerCallIntentResponse *)self answeredCall];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"answeredCall"];

  if ([(NSArray *)self->_callRecords count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_callRecords;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"callRecords"];
  }
  if ([(_INPBAnswerCallIntentResponse *)self hasStatusCode])
  {
    uint64_t v13 = [(_INPBAnswerCallIntentResponse *)self statusCode];
    if (v13 == 1)
    {
      v14 = @"NO_INCOMING_CALL";
    }
    else if (v13 == 2)
    {
      v14 = @"INCOMING_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v14 forKeyedSubscript:@"statusCode"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBConnectedCall *)self->_answeredCall hash];
  uint64_t v4 = [(NSArray *)self->_callRecords hash];
  if ([(_INPBAnswerCallIntentResponse *)self hasStatusCode]) {
    uint64_t v5 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBAnswerCallIntentResponse *)self answeredCall];
  v6 = [v4 answeredCall];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBAnswerCallIntentResponse *)self answeredCall];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBAnswerCallIntentResponse *)self answeredCall];
    uint64_t v10 = [v4 answeredCall];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAnswerCallIntentResponse *)self callRecords];
  v6 = [v4 callRecords];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBAnswerCallIntentResponse *)self callRecords];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBAnswerCallIntentResponse *)self callRecords];
    v15 = [v4 callRecords];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBAnswerCallIntentResponse *)self hasStatusCode];
  if (v19 == [v4 hasStatusCode])
  {
    if (![(_INPBAnswerCallIntentResponse *)self hasStatusCode]
      || ![v4 hasStatusCode]
      || (int statusCode = self->_statusCode, statusCode == [v4 statusCode]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBAnswerCallIntentResponse allocWithZone:](_INPBAnswerCallIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBConnectedCall *)self->_answeredCall copyWithZone:a3];
  [(_INPBAnswerCallIntentResponse *)v5 setAnsweredCall:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_callRecords copyWithZone:a3];
  [(_INPBAnswerCallIntentResponse *)v5 setCallRecords:v7];

  if ([(_INPBAnswerCallIntentResponse *)self hasStatusCode]) {
    [(_INPBAnswerCallIntentResponse *)v5 setStatusCode:[(_INPBAnswerCallIntentResponse *)self statusCode]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAnswerCallIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAnswerCallIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAnswerCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAnswerCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAnswerCallIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBAnswerCallIntentResponse *)self answeredCall];

  if (v5)
  {
    id v6 = [(_INPBAnswerCallIntentResponse *)self answeredCall];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_callRecords;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ([(_INPBAnswerCallIntentResponse *)self hasStatusCode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnswerCallIntentResponseReadFrom(self, (uint64_t)a3);
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
    id v6 = [MEMORY[0x1E4F1CA48] array];
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

- (BOOL)hasAnsweredCall
{
  return self->_answeredCall != 0;
}

- (void)setAnsweredCall:(id)a3
{
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