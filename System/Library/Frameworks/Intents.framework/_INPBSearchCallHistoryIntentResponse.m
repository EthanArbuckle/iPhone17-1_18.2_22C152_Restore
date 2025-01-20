@interface _INPBSearchCallHistoryIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)callRecordsType;
- (BOOL)hasDateCreated;
- (BOOL)hasStatus;
- (BOOL)hasTargetContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)callRecords;
- (NSString)dateCreated;
- (NSString)status;
- (NSString)targetContact;
- (_INPBSearchCallHistoryIntentResponse)initWithCoder:(id)a3;
- (id)callRecordsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)callRecordsCount;
- (unint64_t)hash;
- (void)addCallRecords:(id)a3;
- (void)clearCallRecords;
- (void)encodeWithCoder:(id)a3;
- (void)setCallRecords:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTargetContact:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchCallHistoryIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContact, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_callRecords, 0);
}

- (NSString)targetContact
{
  return self->_targetContact;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)dateCreated
{
  return self->_dateCreated;
}

- (NSArray)callRecords
{
  return self->_callRecords;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_callRecords count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = self->_callRecords;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"callRecords"];
  }
  if (self->_dateCreated)
  {
    v11 = [(_INPBSearchCallHistoryIntentResponse *)self dateCreated];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"dateCreated"];
  }
  if (self->_status)
  {
    v13 = [(_INPBSearchCallHistoryIntentResponse *)self status];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"status"];
  }
  if (self->_targetContact)
  {
    v15 = [(_INPBSearchCallHistoryIntentResponse *)self targetContact];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"targetContact"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_callRecords hash];
  NSUInteger v4 = [(NSString *)self->_dateCreated hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_status hash];
  return v4 ^ v5 ^ [(NSString *)self->_targetContact hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBSearchCallHistoryIntentResponse *)self callRecords];
  uint64_t v6 = [v4 callRecords];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSearchCallHistoryIntentResponse *)self callRecords];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchCallHistoryIntentResponse *)self callRecords];
    v10 = [v4 callRecords];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSearchCallHistoryIntentResponse *)self dateCreated];
  uint64_t v6 = [v4 dateCreated];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSearchCallHistoryIntentResponse *)self dateCreated];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSearchCallHistoryIntentResponse *)self dateCreated];
    v15 = [v4 dateCreated];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSearchCallHistoryIntentResponse *)self status];
  uint64_t v6 = [v4 status];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSearchCallHistoryIntentResponse *)self status];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBSearchCallHistoryIntentResponse *)self status];
    long long v20 = [v4 status];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBSearchCallHistoryIntentResponse *)self targetContact];
  uint64_t v6 = [v4 targetContact];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBSearchCallHistoryIntentResponse *)self targetContact];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBSearchCallHistoryIntentResponse *)self targetContact];
    v25 = [v4 targetContact];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBSearchCallHistoryIntentResponse allocWithZone:](_INPBSearchCallHistoryIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_callRecords copyWithZone:a3];
  [(_INPBSearchCallHistoryIntentResponse *)v5 setCallRecords:v6];

  uint64_t v7 = (void *)[(NSString *)self->_dateCreated copyWithZone:a3];
  [(_INPBSearchCallHistoryIntentResponse *)v5 setDateCreated:v7];

  uint64_t v8 = (void *)[(NSString *)self->_status copyWithZone:a3];
  [(_INPBSearchCallHistoryIntentResponse *)v5 setStatus:v8];

  v9 = (void *)[(NSString *)self->_targetContact copyWithZone:a3];
  [(_INPBSearchCallHistoryIntentResponse *)v5 setTargetContact:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchCallHistoryIntentResponse *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchCallHistoryIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchCallHistoryIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v5 = self->_callRecords;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBSearchCallHistoryIntentResponse *)self dateCreated];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBSearchCallHistoryIntentResponse *)self status];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(_INPBSearchCallHistoryIntentResponse *)self targetContact];

  if (v12) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchCallHistoryIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetContact
{
  return self->_targetContact != 0;
}

- (void)setTargetContact:(id)a3
{
  self->_targetContact = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)setStatus:(id)a3
{
  self->_status = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setDateCreated:(id)a3
{
  self->_dateCreated = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
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
  self->_callRecords = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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