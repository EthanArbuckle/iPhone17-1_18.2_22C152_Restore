@interface _INPBPauseTimerIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)pausedTimersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)pausedTimers;
- (_INPBPauseTimerIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)pausedTimersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pausedTimersCount;
- (void)addPausedTimers:(id)a3;
- (void)clearPausedTimers;
- (void)encodeWithCoder:(id)a3;
- (void)setPausedTimers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPauseTimerIntentResponse

- (void)setPausedTimers:(id)a3
{
  self->_pausedTimers = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (Class)pausedTimersType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPauseTimerIntentResponse allocWithZone:](_INPBPauseTimerIntentResponse, "allocWithZone:") init];
  v6 = (void *)[(NSArray *)self->_pausedTimers copyWithZone:a3];
  [(_INPBPauseTimerIntentResponse *)v5 setPausedTimers:v6];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBPauseTimerIntentResponse *)self pausedTimers];
    v6 = [v4 pausedTimers];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBPauseTimerIntentResponse *)self pausedTimers];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBPauseTimerIntentResponse *)self pausedTimers];
      v11 = [v4 pausedTimers];
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

- (void).cxx_destruct
{
}

- (NSArray)pausedTimers
{
  return self->_pausedTimers;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_pausedTimers count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_pausedTimers;
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

    [v3 setObject:v4 forKeyedSubscript:@"pausedTimers"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_pausedTimers hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPauseTimerIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPauseTimerIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPauseTimerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPauseTimerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPauseTimerIntentResponse *)self initWithData:v6];

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
  v5 = self->_pausedTimers;
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
  return _INPBPauseTimerIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)pausedTimersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pausedTimers objectAtIndexedSubscript:a3];
}

- (unint64_t)pausedTimersCount
{
  return [(NSArray *)self->_pausedTimers count];
}

- (void)addPausedTimers:(id)a3
{
  id v4 = a3;
  pausedTimers = self->_pausedTimers;
  id v8 = v4;
  if (!pausedTimers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pausedTimers;
    self->_pausedTimers = v6;

    id v4 = v8;
    pausedTimers = self->_pausedTimers;
  }
  [(NSArray *)pausedTimers addObject:v4];
}

- (void)clearPausedTimers
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end