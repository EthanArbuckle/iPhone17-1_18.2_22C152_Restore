@interface INEvent
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INEvent)initWithCoder:(id)a3;
- (INEvent)initWithEventType:(id)a3 eventDescriptors:(id)a4;
- (NSArray)eventDescriptors;
- (NSString)description;
- (NSString)eventType;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INEvent

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"eventType"];
    v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"eventDescriptors"];
    v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithEventType:v11 eventDescriptors:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescriptors, 0);

  objc_storeStrong((id *)&self->_eventType, 0);
}

- (NSArray)eventDescriptors
{
  return self->_eventDescriptors;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"eventType";
  eventType = self->_eventType;
  v4 = eventType;
  if (!eventType)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"eventDescriptors";
  v10[0] = v4;
  eventDescriptors = self->_eventDescriptors;
  v6 = eventDescriptors;
  if (!eventDescriptors)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (eventDescriptors)
  {
    if (eventType) {
      goto LABEL_7;
    }
  }
  else
  {

    if (eventType) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INEvent;
  v6 = [(INEvent *)&v11 description];
  id v7 = [(INEvent *)self _dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INEvent *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = [v5 dictionary];
  id v8 = [v6 encodeObject:self->_eventType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"eventType");

  uint64_t v9 = [v6 encodeObject:self->_eventDescriptors];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"eventDescriptors");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  eventType = self->_eventType;
  id v5 = a3;
  [v5 encodeObject:eventType forKey:@"eventType"];
  [v5 encodeObject:self->_eventDescriptors forKey:@"eventDescriptors"];
}

- (INEvent)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventType"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"eventDescriptors"];

  v10 = [(INEvent *)self initWithEventType:v5 eventDescriptors:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INEvent *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      eventType = self->_eventType;
      BOOL v8 = 0;
      if (eventType == v5->_eventType || -[NSString isEqual:](eventType, "isEqual:"))
      {
        eventDescriptors = self->_eventDescriptors;
        if (eventDescriptors == v5->_eventDescriptors
          || -[NSArray isEqual:](eventDescriptors, "isEqual:"))
        {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventType hash];
  return [(NSArray *)self->_eventDescriptors hash] ^ v3;
}

- (INEvent)initWithEventType:(id)a3 eventDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INEvent;
  BOOL v8 = [(INEvent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    eventType = v8->_eventType;
    v8->_eventType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    eventDescriptors = v8->_eventDescriptors;
    v8->_eventDescriptors = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end