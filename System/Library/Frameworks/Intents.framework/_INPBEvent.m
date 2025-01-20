@interface _INPBEvent
+ (BOOL)supportsSecureCoding;
+ (Class)eventDescriptorsType;
- (BOOL)hasEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)eventDescriptors;
- (_INPBEvent)initWithCoder:(id)a3;
- (_INPBString)eventType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)eventDescriptorsAtIndex:(unint64_t)a3;
- (unint64_t)eventDescriptorsCount;
- (unint64_t)hash;
- (void)addEventDescriptors:(id)a3;
- (void)clearEventDescriptors;
- (void)encodeWithCoder:(id)a3;
- (void)setEventDescriptors:(id)a3;
- (void)setEventType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);

  objc_storeStrong((id *)&self->_eventDescriptors, 0);
}

- (_INPBString)eventType
{
  return self->_eventType;
}

- (NSArray)eventDescriptors
{
  return self->_eventDescriptors;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_eventDescriptors count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_eventDescriptors;
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
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"eventDescriptors"];
  }
  v11 = [(_INPBEvent *)self eventType];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"eventType"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_eventDescriptors hash];
  return [(_INPBString *)self->_eventType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBEvent *)self eventDescriptors];
  uint64_t v6 = [v4 eventDescriptors];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBEvent *)self eventDescriptors];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBEvent *)self eventDescriptors];
    v10 = [v4 eventDescriptors];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBEvent *)self eventType];
  uint64_t v6 = [v4 eventType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBEvent *)self eventType];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBEvent *)self eventType];
    long long v15 = [v4 eventType];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBEvent allocWithZone:](_INPBEvent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_eventDescriptors copyWithZone:a3];
  [(_INPBEvent *)v5 setEventDescriptors:v6];

  id v7 = [(_INPBString *)self->_eventType copyWithZone:a3];
  [(_INPBEvent *)v5 setEventType:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBEvent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBEvent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBEvent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBEvent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_eventDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBEvent *)self eventType];

  if (v10)
  {
    int v11 = [(_INPBEvent *)self eventType];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBEventReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (void)setEventType:(id)a3
{
}

- (id)eventDescriptorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_eventDescriptors objectAtIndexedSubscript:a3];
}

- (unint64_t)eventDescriptorsCount
{
  return [(NSArray *)self->_eventDescriptors count];
}

- (void)addEventDescriptors:(id)a3
{
  id v4 = a3;
  eventDescriptors = self->_eventDescriptors;
  id v8 = v4;
  if (!eventDescriptors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_eventDescriptors;
    self->_eventDescriptors = v6;

    id v4 = v8;
    eventDescriptors = self->_eventDescriptors;
  }
  [(NSArray *)eventDescriptors addObject:v4];
}

- (void)clearEventDescriptors
{
}

- (void)setEventDescriptors:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  eventDescriptors = self->_eventDescriptors;
  self->_eventDescriptors = v4;

  MEMORY[0x1F41817F8](v4, eventDescriptors);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)eventDescriptorsType
{
  return (Class)objc_opt_class();
}

@end