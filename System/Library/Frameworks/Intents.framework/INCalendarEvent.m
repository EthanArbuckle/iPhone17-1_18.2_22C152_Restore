@interface INCalendarEvent
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)location;
- (INCalendarEvent)initWithCoder:(id)a3;
- (INCalendarEvent)initWithEventIdentifier:(id)a3 title:(id)a4 dateTimeRange:(id)a5 participants:(id)a6 location:(id)a7 isContactBirthday:(id)a8 calendarPunchoutURI:(id)a9;
- (INDateComponentsRange)dateTimeRange;
- (NSArray)participants;
- (NSNumber)isContactBirthday;
- (NSString)calendarPunchoutURI;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)title;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCalendarEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarPunchoutURI, 0);
  objc_storeStrong((id *)&self->_isContactBirthday, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_dateTimeRange, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (NSString)calendarPunchoutURI
{
  return self->_calendarPunchoutURI;
}

- (NSNumber)isContactBirthday
{
  return self->_isContactBirthday;
}

- (CLPlacemark)location
{
  return self->_location;
}

- (NSArray)participants
{
  return self->_participants;
}

- (INDateComponentsRange)dateTimeRange
{
  return self->_dateTimeRange;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (id)_dictionaryRepresentation
{
  v24[7] = *MEMORY[0x1E4F143B8];
  uint64_t eventIdentifier = (uint64_t)self->_eventIdentifier;
  uint64_t v22 = eventIdentifier;
  v23[0] = @"eventIdentifier";
  if (!eventIdentifier)
  {
    uint64_t eventIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)eventIdentifier;
  v24[0] = eventIdentifier;
  v23[1] = @"title";
  title = self->_title;
  uint64_t v5 = (uint64_t)title;
  if (!title)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = @"dateTimeRange";
  dateTimeRange = self->_dateTimeRange;
  uint64_t v7 = (uint64_t)dateTimeRange;
  if (!dateTimeRange)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = @"participants";
  participants = self->_participants;
  uint64_t v9 = (uint64_t)participants;
  if (!participants)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = @"location";
  location = self->_location;
  v11 = location;
  if (!location)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v11;
  v23[5] = @"isContactBirthday";
  isContactBirthday = self->_isContactBirthday;
  v13 = isContactBirthday;
  if (!isContactBirthday)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v13;
  v23[6] = @"calendarPunchoutURI";
  calendarPunchoutURI = self->_calendarPunchoutURI;
  v15 = calendarPunchoutURI;
  if (!calendarPunchoutURI)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[6] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  if (calendarPunchoutURI)
  {
    if (isContactBirthday) {
      goto LABEL_17;
    }
  }
  else
  {

    if (isContactBirthday)
    {
LABEL_17:
      if (location) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }
  }

  if (location)
  {
LABEL_18:
    if (participants) {
      goto LABEL_19;
    }
    goto LABEL_29;
  }
LABEL_28:

  if (participants)
  {
LABEL_19:
    if (dateTimeRange) {
      goto LABEL_20;
    }
LABEL_30:

    if (title) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_29:

  if (!dateTimeRange) {
    goto LABEL_30;
  }
LABEL_20:
  if (title) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v22) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCalendarEvent;
  v6 = [(INCalendarEvent *)&v11 description];
  uint64_t v7 = [(INCalendarEvent *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCalendarEvent *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_eventIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"eventIdentifier");

  uint64_t v9 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"title");

  v10 = [v6 encodeObject:self->_dateTimeRange];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"dateTimeRange");

  objc_super v11 = [v6 encodeObject:self->_participants];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"participants");

  v12 = [v6 encodeObject:self->_location];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"location");

  v13 = [v6 encodeObject:self->_isContactBirthday];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"isContactBirthday");

  v14 = [v6 encodeObject:self->_calendarPunchoutURI];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"calendarPunchoutURI");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t eventIdentifier = self->_eventIdentifier;
  id v5 = a3;
  [v5 encodeObject:eventIdentifier forKey:@"eventIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_dateTimeRange forKey:@"dateTimeRange"];
  [v5 encodeObject:self->_participants forKey:@"participants"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_isContactBirthday forKey:@"isContactBirthday"];
  [v5 encodeObject:self->_calendarPunchoutURI forKey:@"calendarPunchoutURI"];
}

- (INCalendarEvent)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"eventIdentifier"];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  objc_super v11 = [v4 decodeObjectOfClasses:v10 forKey:@"title"];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateTimeRange"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v15 = [v13 setWithArray:v14];
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"participants"];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isContactBirthday"];
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"calendarPunchoutURI"];

  v23 = [(INCalendarEvent *)self initWithEventIdentifier:v7 title:v11 dateTimeRange:v12 participants:v16 location:v17 isContactBirthday:v18 calendarPunchoutURI:v22];
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCalendarEvent *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t eventIdentifier = self->_eventIdentifier;
      BOOL v13 = 0;
      if (eventIdentifier == v5->_eventIdentifier || -[NSString isEqual:](eventIdentifier, "isEqual:"))
      {
        title = self->_title;
        if (title == v5->_title || -[NSString isEqual:](title, "isEqual:"))
        {
          dateTimeRange = self->_dateTimeRange;
          if (dateTimeRange == v5->_dateTimeRange || -[INDateComponentsRange isEqual:](dateTimeRange, "isEqual:"))
          {
            participants = self->_participants;
            if (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
            {
              location = self->_location;
              if (location == v5->_location || -[CLPlacemark isEqual:](location, "isEqual:"))
              {
                isContactBirthday = self->_isContactBirthday;
                if (isContactBirthday == v5->_isContactBirthday
                  || -[NSNumber isEqual:](isContactBirthday, "isEqual:"))
                {
                  calendarPunchoutURI = self->_calendarPunchoutURI;
                  if (calendarPunchoutURI == v5->_calendarPunchoutURI
                    || -[NSString isEqual:](calendarPunchoutURI, "isEqual:"))
                  {
                    BOOL v13 = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_eventIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  unint64_t v5 = [(INDateComponentsRange *)self->_dateTimeRange hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_participants hash];
  uint64_t v7 = [(CLPlacemark *)self->_location hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_isContactBirthday hash];
  return v6 ^ v8 ^ [(NSString *)self->_calendarPunchoutURI hash];
}

- (INCalendarEvent)initWithEventIdentifier:(id)a3 title:(id)a4 dateTimeRange:(id)a5 participants:(id)a6 location:(id)a7 isContactBirthday:(id)a8 calendarPunchoutURI:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INCalendarEvent;
  uint64_t v22 = [(INCalendarEvent *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    uint64_t eventIdentifier = v22->_eventIdentifier;
    v22->_uint64_t eventIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    title = v22->_title;
    v22->_title = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    dateTimeRange = v22->_dateTimeRange;
    v22->_dateTimeRange = (INDateComponentsRange *)v27;

    uint64_t v29 = [v18 copy];
    participants = v22->_participants;
    v22->_participants = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    location = v22->_location;
    v22->_location = (CLPlacemark *)v31;

    uint64_t v33 = [v20 copy];
    isContactBirthday = v22->_isContactBirthday;
    v22->_isContactBirthday = (NSNumber *)v33;

    uint64_t v35 = [v21 copy];
    calendarPunchoutURI = v22->_calendarPunchoutURI;
    v22->_calendarPunchoutURI = (NSString *)v35;
  }
  return v22;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"eventIdentifier"];
    v10 = [v8 objectForKeyedSubscript:@"title"];
    uint64_t v11 = objc_opt_class();
    v12 = [v8 objectForKeyedSubscript:@"dateTimeRange"];
    BOOL v13 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v14 = objc_opt_class();
    id v15 = [v8 objectForKeyedSubscript:@"participants"];
    id v16 = [v7 decodeObjectsOfClass:v14 from:v15];

    uint64_t v17 = objc_opt_class();
    id v18 = [v8 objectForKeyedSubscript:@"location"];
    id v19 = [v7 decodeObjectOfClass:v17 from:v18];

    id v20 = [v8 objectForKeyedSubscript:@"isContactBirthday"];
    id v21 = [v8 objectForKeyedSubscript:@"calendarPunchoutURI"];
    uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithEventIdentifier:v9 title:v10 dateTimeRange:v13 participants:v16 location:v19 isContactBirthday:v20 calendarPunchoutURI:v21];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = [(INCalendarEvent *)self participants];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(INCalendarEvent *)self participants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    long long v10 = v3;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end