@interface _INPBResumeTimerIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)resumedTimersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)resumedTimers;
- (_INPBResumeTimerIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)resumedTimersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resumedTimersCount;
- (void)addResumedTimers:(id)a3;
- (void)clearResumedTimers;
- (void)encodeWithCoder:(id)a3;
- (void)setResumedTimers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBResumeTimerIntentResponse

- (void).cxx_destruct
{
}

- (NSArray)resumedTimers
{
  return self->_resumedTimers;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_resumedTimers count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_resumedTimers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"resumedTimers"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_resumedTimers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBResumeTimerIntentResponse *)self resumedTimers];
    uint64_t v6 = [v4 resumedTimers];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBResumeTimerIntentResponse *)self resumedTimers];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBResumeTimerIntentResponse *)self resumedTimers];
      v11 = [v4 resumedTimers];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBResumeTimerIntentResponse allocWithZone:](_INPBResumeTimerIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_resumedTimers copyWithZone:a3];
  [(_INPBResumeTimerIntentResponse *)v5 setResumedTimers:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBResumeTimerIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBResumeTimerIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBResumeTimerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBResumeTimerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBResumeTimerIntentResponse *)self initWithData:v6];

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
  v5 = self->_resumedTimers;
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
}

- (BOOL)readFrom:(id)a3
{
  return _INPBResumeTimerIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)resumedTimersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_resumedTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)resumedTimersCount
{
  return [(NSArray *)self->_resumedTimers count];
}

- (void)addResumedTimers:(id)a3
{
  id v4 = a3;
  resumedTimers = self->_resumedTimers;
  id v8 = v4;
  if (!resumedTimers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_resumedTimers;
    self->_resumedTimers = v6;

    id v4 = v8;
    resumedTimers = self->_resumedTimers;
  }
  [(NSArray *)resumedTimers addObject:v4];
}

- (void)clearResumedTimers
{
}

- (void)setResumedTimers:(id)a3
{
  self->_resumedTimers = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)resumedTimersType
{
  return (Class)objc_opt_class();
}

@end