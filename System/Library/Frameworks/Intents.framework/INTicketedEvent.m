@interface INTicketedEvent
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)location;
- (INDateComponentsRange)eventDuration;
- (INTicketedEvent)initWithCategory:(INTicketedEventCategory)category name:(NSString *)name eventDuration:(INDateComponentsRange *)eventDuration location:(CLPlacemark *)location;
- (INTicketedEvent)initWithCoder:(id)a3;
- (INTicketedEventCategory)category;
- (NSString)description;
- (NSString)name;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTicketedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventDuration, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (CLPlacemark)location
{
  return self->_location;
}

- (INDateComponentsRange)eventDuration
{
  return self->_eventDuration;
}

- (NSString)name
{
  return self->_name;
}

- (INTicketedEventCategory)category
{
  return self->_category;
}

- (id)_dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"category";
  v3 = [NSNumber numberWithInteger:self->_category];
  v13[0] = v3;
  v12[1] = @"name";
  name = self->_name;
  v5 = name;
  if (!name)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v5;
  v12[2] = @"eventDuration";
  eventDuration = self->_eventDuration;
  v7 = eventDuration;
  if (!eventDuration)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v7;
  v12[3] = @"location";
  location = self->_location;
  v9 = location;
  if (!location)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (location)
  {
    if (eventDuration) {
      goto LABEL_9;
    }
LABEL_14:

    if (name) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!eventDuration) {
    goto LABEL_14;
  }
LABEL_9:
  if (name) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTicketedEvent;
  v6 = [(INTicketedEvent *)&v11 description];
  v7 = [(INTicketedEvent *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTicketedEvent *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  if (self->_category == 1) {
    v8 = @"movie";
  }
  else {
    v8 = @"unknown";
  }
  v9 = v8;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"category");

  v10 = [v6 encodeObject:self->_name];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"name");

  objc_super v11 = [v6 encodeObject:self->_eventDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"eventDuration");

  v12 = [v6 encodeObject:self->_location];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"location");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t category = self->_category;
  id v5 = a3;
  [v5 encodeInteger:category forKey:@"category"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_eventDuration forKey:@"eventDuration"];
  [v5 encodeObject:self->_location forKey:@"location"];
}

- (INTicketedEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"category"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"name"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDuration"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];

  v12 = [(INTicketedEvent *)self initWithCategory:v5 name:v9 eventDuration:v10 location:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTicketedEvent *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v9 = 0;
      if (self->_category == v5->_category)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
        {
          eventDuration = self->_eventDuration;
          if (eventDuration == v5->_eventDuration || -[INDateComponentsRange isEqual:](eventDuration, "isEqual:"))
          {
            location = self->_location;
            if (location == v5->_location || -[CLPlacemark isEqual:](location, "isEqual:")) {
              BOOL v9 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_category];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  unint64_t v6 = v5 ^ [(INDateComponentsRange *)self->_eventDuration hash];
  unint64_t v7 = v6 ^ [(CLPlacemark *)self->_location hash] ^ v4;

  return v7;
}

- (INTicketedEvent)initWithCategory:(INTicketedEventCategory)category name:(NSString *)name eventDuration:(INDateComponentsRange *)eventDuration location:(CLPlacemark *)location
{
  v10 = name;
  objc_super v11 = eventDuration;
  v12 = location;
  v22.receiver = self;
  v22.super_class = (Class)INTicketedEvent;
  v13 = [(INTicketedEvent *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_int64_t category = category;
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v17 = [(INDateComponentsRange *)v11 copy];
    v18 = v14->_eventDuration;
    v14->_eventDuration = (INDateComponentsRange *)v17;

    uint64_t v19 = [(CLPlacemark *)v12 copy];
    v20 = v14->_location;
    v14->_location = (CLPlacemark *)v19;
  }
  return v14;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [v8 objectForKeyedSubscript:@"category"];
    uint64_t v10 = [v9 isEqualToString:@"movie"];

    objc_super v11 = [v8 objectForKeyedSubscript:@"name"];
    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"eventDuration"];
    v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"location"];
    uint64_t v17 = [v7 decodeObjectOfClass:v15 from:v16];

    v18 = (void *)[objc_alloc((Class)a1) initWithCategory:v10 name:v11 eventDuration:v14 location:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end